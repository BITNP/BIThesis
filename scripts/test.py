"""Compile all projects, used by `make test`.

Prerequisites:
- [ripgrep (rg)](https://crates.io/crates/ripgrep)

`% tlmgr install …` comments are respected.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from itertools import chain
from os import environ
from pathlib import Path
from shutil import which
from subprocess import CalledProcessError, run
from sys import stderr
from time import perf_counter
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from collections.abc import Callable, Generator
    from typing import Any, Self

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

    pre_hooks: list[Callable[[Self]]] | None = None
    post_hooks: list[Callable[[Self]]] | None = None

    def __init__(
        self,
        icon: str,
        directory: Path,
        /,
        *,
        name: str | None = None,
        args: list[str] = ["latexmk", "-g"],
        env: dict[str, str] | None = None,
        pre: list[Callable[[Self]]] | None = None,
        post: list[Callable[[Self]]] | None = None,
    ) -> None:
        assert directory.exists()
        self.icon = icon
        self.directory = directory
        self.name = name or directory.name
        self.args = args
        self.env = env
        self.pre_hooks = pre
        self.post_hooks = post

    def execute(
        self,
    ) -> CalledProcessError | None:
        """Execute the test case."""
        print(f"🟡 Compiling `{self}`", file=stderr)

        for hook in self.pre_hooks or []:
            try:
                hook(self)
            except CalledProcessError as error:
                log(f"❌{self.icon} failed to run a pre hook: {hook}")
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
        finally:
            duration = perf_counter() - start

            for hook in self.post_hooks or []:
                try:
                    hook(self)
                except CalledProcessError as error:
                    log(f"❌{self.icon} failed to run a post hook: {hook}")
                    return error

        log(f"✅{self.icon} 可正常编译 {self.name}：⌛ {duration:.1f} 秒。")


def install_deps(test: TestCase) -> CalledProcessError | None:
    """Install dependencies with TeX Live package manager."""
    try:
        result = run(
            [
                "rg",
                "% tlmgr install (.+)$",
                test.directory,
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
        log(f"❌{test.icon} 未能检查 {test.name} 是否需补装依赖：{error}")
        return error

    packages = list(
        chain.from_iterable(args.split() for args in result.stdout.strip().splitlines())
    )
    if len(packages) == 0:
        print(f"⚪{test.icon} 无需为 {test.name} 补装依赖。", file=stderr)
    else:
        print(
            f"📥{test.icon} 为 `{test.name}` 而从 TeX Live 安装 {', '.join(packages)}……",
            file=stderr,
        )
        try:
            run([TLMGR, "install", *packages], check=True)
        except CalledProcessError as error:
            log(f"❌{test.icon} 未能安装 {test.name} 的依赖 {packages}：{error}")
            return error


def enable_blind_peer_review(test: TestCase) -> CalledProcessError | None:
    """启用盲审模式"""
    main = test.directory / "main.tex"
    main.write_text(
        re.sub(
            r"^(\\documentclass\[.+)(\]\{bithesis\})$",
            r"\1, blindPeerReview=true\2",
            main.read_text(encoding="utf-8"),
            count=1,
            flags=re.MULTILINE,
        ),
        encoding="utf-8",
    )


def revert_blind_peer_review(test: TestCase) -> CalledProcessError | None:
    """取消设置盲审模式"""
    main = test.directory / "main.tex"
    main.write_text(
        re.sub(
            r"^(\\documentclass\[.+), blindPeerReview=true(\]\{bithesis\})$",
            r"\1\2",
            main.read_text(encoding="utf-8"),
            count=1,
            flags=re.MULTILINE,
        ),
        encoding="utf-8",
    )


TESTS = [
    *(TestCase("📁", d) for d in SCAFFOLD_DIR.iterdir() if d.is_dir()),
    *(
        TestCase(
            "📁🎩", d, pre=[enable_blind_peer_review], post=[revert_blind_peer_review]
        )
        for d in SCAFFOLD_DIR.iterdir()
        if d.is_dir() and "thesis" in d.stem
    ),
    *(TestCase("🧪", d, pre=[install_deps]) for d in TEST_DIR.iterdir() if d.is_dir()),
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
