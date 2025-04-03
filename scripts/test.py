"""Compile all projects, used by `make test`."""

from collections.abc import Generator
from dataclasses import dataclass
from os import environ
from pathlib import Path
from subprocess import CalledProcessError, run
from sys import stderr
from time import perf_counter
from typing import Any

ROOT_DIR = Path(__file__).parent.parent
assert ROOT_DIR.exists()
SCAFFOLD_DIR = Path(environ["SCAFFOLDDIR"])
assert SCAFFOLD_DIR.exists()
TEST_DIR = Path(environ["TESTDIR"])
assert TEST_DIR.exists()

# https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#adding-a-job-summary
SUMMARY = Path(environ.get("GITHUB_STEP_SUMMARY", ROOT_DIR / "scripts/test-result.md"))


def log(message: str | Any) -> None:
    """Write markdown `message` to stdout and the SUMMARY file."""
    if not isinstance(message, str):
        message = str(message)

    print(message, end="\n\n")
    with SUMMARY.open("a", encoding="utf-8") as f:
        f.write(message + "\n\n")


def parse_log(file: Path) -> Generator[str]:
    """Collect key errors from a log file."""
    with file.open(encoding="utf-8") as f:
        for line in f:
            if line.startswith("!"):
                yield line.strip()


def collect_errors(directory: Path) -> Generator[tuple[Path, Generator[str]]]:
    """Read all log files in the `directory` and collect key errors."""
    for file in directory.glob("*.log"):
        yield file.relative_to(directory), parse_log(file)


@dataclass
class TestCase:
    """A test case for compiling a LaTeX project."""

    icon: str
    directory: Path
    name: str
    args: list[str]
    env: dict[str, str] | None = None

    def __init__(
        self,
        icon: str,
        directory: Path,
        /,
        *,
        name: str | None = None,
        args: list[str] = ["latexmk", "-g"],
        env: dict[str, str] | None = None,
    ) -> None:
        assert directory.exists()
        self.icon = icon
        self.directory = directory
        self.name = name or directory.name
        self.args = args
        self.env = env

    def execute(self) -> CalledProcessError | None:
        """Execute the test case."""
        print(f"🟡 Compiling `{self}`", file=stderr)
        start = perf_counter()
        try:
            run(
                self.args,
                cwd=self.directory,
                # Append to the original env
                env=None if self.env is None else {**environ, **self.env},
                check=True,
            )
        except CalledProcessError as running_error:
            log(f"💥{self.icon} 无法编译 {self.name}。")
            for file, errors in collect_errors(self.directory):
                log(
                    "\n".join(
                        [
                            f"- `{file}`:",
                            # LaTeX 习惯写 `file.sty'，需避免 markdown 解析
                            *(f"  - ```{e}```" for e in errors),
                        ]
                    )
                )
            return running_error

        duration = perf_counter() - start
        log(f"✅{self.icon} 可正常编译 {self.name}：⌛ {duration:.1f} 秒。")


TESTS = [
    TestCase("📁", SCAFFOLD_DIR / "undergraduate-thesis"),
    TestCase("📁", SCAFFOLD_DIR / "paper-translation"),
    TestCase("📁", SCAFFOLD_DIR / "graduate-thesis"),
    TestCase("📁", SCAFFOLD_DIR / "reading-report"),
    TestCase("📁", SCAFFOLD_DIR / "lab-report"),
    TestCase("📁", SCAFFOLD_DIR / "presentation-slide"),
    TestCase("🧪", TEST_DIR / "doctor-thesis"),
    TestCase("🧪", TEST_DIR / "autorefs"),
    TestCase("📖", ROOT_DIR / "handbook", name="undergraduate-handbook"),
    TestCase(
        "📖", ROOT_DIR / "handbook", name="graduate-handbook", env={"GRADUATE": "true"}
    ),
    TestCase("📖", ROOT_DIR, name="bithesis.pdf", args=["make", "doc"]),
]

# Execute all test cases, and raise the first error.
first_error = None
for t in TESTS:
    result = t.execute()
    if result is not None and first_error is None:
        first_error = result
if first_error is not None:
    raise first_error
