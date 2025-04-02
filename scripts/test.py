"""Compile all projects, used by `make test`."""

from dataclasses import dataclass
from os import environ
from pathlib import Path
from subprocess import CalledProcessError, run
from sys import stderr
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
    """Write to stdout and the SUMMARY file."""
    if not isinstance(message, str):
        message = str(message)

    print(message)
    with SUMMARY.open("a", encoding="utf-8") as f:
        f.write(message + "\n")


@dataclass
class TestCase:
    """A test case for compiling a LaTeX project."""

    icon: str
    directory: Path
    name: str
    env: dict[str, str] | None = None

    def __init__(
        self,
        icon: str,
        directory: Path,
        /,
        *,
        name: str | None = None,
        env: dict[str, str] | None = None,
    ) -> None:
        self.icon = icon
        self.directory = directory
        self.name = name or directory.name
        self.env = env

    def execute(self) -> CalledProcessError | None:
        """Execute the test case."""
        print(f"🟡 Compiling `{self}`", file=stderr)
        assert self.directory.exists()
        try:
            run(
                ["latexmk"],
                cwd=self.directory,
                # Append to the original env
                env=None if self.env is None else {**environ, **self.env},
                check=True,
            )
            log(f"✅{self.icon} 可正常编译 {self.name}。")
        except CalledProcessError as error:
            log(f"💥{self.icon} 无法编译 {self.name}。")
            return error


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
]

# Execute all test cases, and raise the first error.
first_error = None
for t in TESTS:
    result = t.execute()
    if result is not None and first_error is None:
        first_error = result
if first_error is not None:
    raise first_error
