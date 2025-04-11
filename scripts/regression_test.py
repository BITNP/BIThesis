"""回归测试，用于`make regression-test`

```shell
$ uv run scripts/regression_test.py --help
Usage: regression_test.py [OPTIONS] [COMPILE_COMMAND]...
  Regression test.
  ……
```

先决条件：

- https://cli.github.com
- https://vslavik.github.io/diff-pdf/ 或 https://soft.rubypdf.com/software/diffpdf
"""

# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "click",
# ]
# ///

import json
from collections.abc import Generator
from concurrent.futures import Future, ThreadPoolExecutor
from pathlib import Path
from subprocess import run
from threading import Event, Lock
from typing import Literal, TypeAlias
from zipfile import ZipFile

import click

DiffChoice: TypeAlias = Literal["rubypdf"] | Literal["vslavik"]


def get_latest_tag() -> str:
    """Get latest release from GitHub.

    不算测试版。
    """
    result = run(
        [
            "gh",
            "release",
            "list",
            *("--limit", "1"),
            *("--json", "tagName"),
            "--exclude-pre-releases",
            "--exclude-drafts",
        ],
        capture_output=True,
        check=True,
    )
    releases = json.loads(result.stdout)
    return releases[0]["tagName"]


def download_release(tag: str, cache_dir: Path) -> Generator[Path]:
    """Download templates of a `release` to `cache_dir`.

    允许预先缓存文件。

    Returns: Directories of downloaded templates.
    """
    if not (cache_dir / tag).exists():
        run(
            [
                "gh",
                "release",
                "download",
                tag,
                *("--dir", cache_dir / tag),
                *("--pattern", "*.zip"),
                "--skip-existing",
            ],
            check=True,
        )
    for zip in (cache_dir / tag).glob("*.zip"):
        template_dir = zip.with_suffix("")

        # Extract ZIP if not exists
        if not template_dir.exists():
            click.echo(f"🗄️ 解压“{zip}”……")
            with ZipFile(zip, "r") as f:
                f.extractall(cache_dir / tag)

        assert template_dir.exists() and template_dir.is_dir()

    # 自行制作缓存时，允许只准备文件夹，不放置 ZIP，故需重新扫描
    for template_dir in (cache_dir / tag).iterdir():
        if template_dir.is_dir():
            yield template_dir


def build_template(template_dir: Path, compile_command: tuple[str, ...]) -> None:
    """编译模板"""
    run(compile_command, cwd=template_dir, check=True)
    assert (template_dir / "main.pdf").exists()


def diff_template(
    ref_dir: Path,
    actual_dir: Path,
    diff_choice: DiffChoice,
) -> None:
    """比较模板"""
    diff_command = {
        "vslavik": ["diff-pdf", "--view"],
        "rubypdf": ["diffpdf"],
    }[diff_choice]

    run(
        [*diff_command, ref_dir / "main.pdf", actual_dir / "main.pdf"],
        check=True,
    )


@click.command(
    epilog="""
【示例】

\b
按默认方式执行回归测试：
regression_test.py

\b
默认与 GitHub 上最新版比较（不算测试版）；
也可用`--against`指定比较版本，例如 v3.8.3-alpha-1：
regression_test.py --against v3.8.3-alpha-1

\b
默认测试所有模板；也可只测试个别模板，例如：
regression_test.py --templates undergraduate-thesis
测试多个模板请用`,`分隔：
regression_test.py --templates undergraduate-thesis,lab-report

\b
默认用 vslavik/diff-pdf 比较PDF；也可用 rubypdf/diffpdf：
regression_test.py --diff vslavik
regression_test.py --diff rubypdf

\b
默认用`latexmk -g -silent`编译，这并不清除缓存，但保证每个文件都至少编译一次；
也可指定编译命令，例如清除缓存从零编译请用`latexmk -gg`：
regression_test.py -- latexmk -gg
而完全继承缓存请用`latexmk`：
regression_test.py latexmk
"""
)
@click.option(
    "--templates",
    help="要比较的模板，如“undergraduate-thesis,lab-report”；默认所有",
)
@click.option("--against", default=None, help="相对的版本，如“v3.8.3”；默认最新版")
@click.option(
    "--diff",
    type=click.Choice(["vslavik", "rubypdf"]),
    default="vslavik",
    help="PDF 比较器，https://vslavik.github.io/diff-pdf/（默认）或 https://soft.rubypdf.com/software/diffpdf",
)
@click.argument("compile_command", nargs=-1)
def cli(
    against: str | None,
    templates: str | None,
    compile_command: tuple[str, ...],
    diff: DiffChoice,
) -> None:
    """Regression test.

    COMPILE_COMMAND 默认`latexmk -g -silent`
    """
    cache_dir = Path(__file__).parent / "cache"
    cache_dir.mkdir(exist_ok=True)

    templates_root = Path(__file__).parent.parent / "templates"
    assert templates_root.exists() and templates_root.is_dir()

    # 1. 检查输入

    filter = templates.split(",") if templates is not None else None

    if len(compile_command) == 0:
        compile_command = ("latexmk", "-g", "-silent")

    # 2. 准备文件

    tag = against or get_latest_tag()
    click.echo(f"🔎 与 {tag} 比较……")
    template_dirs = download_release(tag, cache_dir)

    # 3. 计划任务

    dir_pairs: list[tuple[Path, Path]] = []
    """reference and actual directories"""

    for ref_dir in template_dirs:
        if filter is not None and ref_dir.name not in filter:
            click.echo(f"👻 跳过 {ref_dir.name}。")
            continue

        actual_dir = templates_root / ref_dir.name
        dir_pairs.append((ref_dir, actual_dir))

    # 4. 执行测试

    failed = Event()
    diff_lock = Lock()

    def diff_runner(
        ref_dir: Path, actual_dir: Path, ref_built: Future, actual_built: Future
    ) -> None:
        # 等待 build 结束再 diff
        try:
            # 出错概率大的在前
            actual_built.result()
            ref_built.result()
        except Exception as e:
            failed.set()
            click.echo(f"💥 无法编译 {ref_dir.name}，回归测试失败。")
            raise e

        click.echo(f"👓 完成编译 {ref_dir.name}，准备比较。")

        # diff 涉及图形界面，并行不方便操作，故同时只允许一个运行
        with diff_lock:
            if failed.is_set():
                click.echo(f"💀 回归测试已失败，不再比较 {ref_dir.name}。")
                return

            diff_template(ref_dir, actual_dir, diff)

            answer = input(
                "🔴 输入 x 判定回归测试失败并中止，🟢 输入任意其它内容（或直接回车）继续 >> "
            )
            if answer.lower().strip() == "x":
                failed.set()
                click.echo(f"💥 回归测试 {ref_dir.name} 失败。")
            else:
                click.echo(f"✅ 完成比较 {ref_dir.name}。")

    with ThreadPoolExecutor() as build_executor, ThreadPoolExecutor() as diff_executor:
        for ref_dir, actual_dir in dir_pairs:
            click.echo(f"📁 编译 {ref_dir.name}……")
            # 启动 build
            ref_built = build_executor.submit(build_template, ref_dir, compile_command)
            actual_built = build_executor.submit(
                build_template, actual_dir, compile_command
            )

            diff_executor.submit(
                diff_runner, ref_dir, actual_dir, ref_built, actual_built
            )

    # Exit with 1 if failed
    click.get_current_context().exit(failed.is_set())


if __name__ == "__main__":
    cli()
