"""Compile all projects, used by `make test`.

Prerequisites:
- [ripgrep (rg)](https://crates.io/crates/ripgrep)

`% tlmgr install …` comments are respected.
"""

import re
from collections.abc import Generator
from dataclasses import dataclass
from itertools import chain
from os import environ
from pathlib import Path
from shutil import which
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

SKIP_DOC = environ.get("TEST_SKIP_DOC", default="") not in ["", "0", "false"]

# https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#adding-a-job-summary
SUMMARY = Path(environ.get("GITHUB_STEP_SUMMARY", ROOT_DIR / "scripts/test-result.md"))

TLMGR: str = which("tlmgr")  # type: ignore
assert TLMGR is not None


def log(message: str | Any) -> None:
    """Write markdown `message` to stdout and the SUMMARY file."""
    if not isinstance(message, str):
        message = str(message)

    print(message, end="\n\n")
    with SUMMARY.open("a", encoding="utf-8") as f:
        f.write(message + "\n\n")


# https://github.com/James-Yu/LaTeX-Workshop/blob/6f59af5bcaaf64bca1430fbdc31fda5813d4ce91/src/parse/parser/latexlog.ts#L9
LaTeX_LOG_ERROR_PATTERN = re.compile(r"^(?:(.*):(\d+):|!)(?: (.+) Error:)? (.+?)$")


def parse_log(file: Path) -> Generator[str]:
    """Collect key errors from a log file."""
    with file.open(encoding="utf-8") as f:
        for line in f:
            if file.stem == "missfont" or LaTeX_LOG_ERROR_PATTERN.match(line):
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

    def install_deps(self) -> CalledProcessError | None:
        """Install dependencies with TeX Live package manager."""
        try:
            result = run(
                [
                    "rg",
                    "% tlmgr install (.+)$",
                    self.directory,
                    "--only-matching",
                    "--no-filename",
                    "--replace=$1",
                    "--type=tex",
                ],
                check=False,  # rg exits with 1 if no match
                capture_output=True,
                text=True,
            )
        except CalledProcessError as error:
            log(f"❌{self.icon} 未能检查 {self.name} 是否需补充安装依赖：{error}")
            return error

        packages = list(
            chain.from_iterable(
                args.split() for args in result.stdout.strip().splitlines()
            )
        )
        if len(packages) == 0:
            print(f"⚪{self.icon} 无需为 {self.name} 补充装依赖。", file=stderr)
        else:
            print(
                f"📥{self.icon} 为 `{self.name}` 而从 TeX Live 安装 {', '.join(packages)}……",
                file=stderr,
            )
            try:
                run([TLMGR, "install", *packages], check=True)
            except CalledProcessError as error:
                log(f"❌{self.icon} 未能安装 {self.name} 的依赖 {packages}：{error}")
                return error

    def execute(self) -> CalledProcessError | None:
        """Execute the test case."""
        print(f"🟡 Compiling `{self}`", file=stderr)

        try:
            self.install_deps()
        except CalledProcessError as error:
            log(f"❌{self.icon} 安装依赖失败：{error}")
            return error

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
    *(TestCase("📁", d) for d in SCAFFOLD_DIR.iterdir() if d.is_dir()),
    *(TestCase("🧪", d) for d in TEST_DIR.iterdir() if d.is_dir()),
    *(
        [
            TestCase("📖", ROOT_DIR / "handbook", name="undergraduate-handbook"),
            TestCase(
                "📖",
                ROOT_DIR / "handbook",
                name="graduate-handbook",
                env={"GRADUATE": "true"},
            ),
            TestCase("📖", ROOT_DIR, name="bithesis.pdf", args=["make", "doc"]),
        ]
        if not SKIP_DOC
        else []
    ),
]

if __name__ == "__main__":
    # Execute all test cases, and raise the first error.
    first_error = None
    for t in TESTS:
        result = t.execute()
        if result is not None and first_error is None:
            first_error = result
    if first_error is not None:
        raise first_error
