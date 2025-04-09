"""回归测试

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
from pathlib import Path
from subprocess import run
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
    epilog="""\b
示例：
regression_test.py
regression_test.py --against v3.8.3
regression_test.py --templates undergraduate-thesis
regression_test.py -- latexmk -gg
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
    """Regression test."""
    cache_dir = Path(__file__).parent / "cache"
    cache_dir.mkdir(exist_ok=True)

    templates_root = Path(__file__).parent.parent / "templates"
    assert templates_root.exists() and templates_root.is_dir()

    filter = templates.split(",") if templates is not None else None

    if len(compile_command) == 0:
        compile_command = ("latexmk", "-g", "-silent")

    tag = against or get_latest_tag()
    click.echo(f"🔎 与 {tag} 比较……")
    template_dirs = download_release(tag, cache_dir)

    for ref_dir in template_dirs:
        if filter is not None and ref_dir.name not in filter:
            click.echo(f"👻 跳过 {ref_dir.name}。")
            continue

        click.echo(f"📁 正在比较 {ref_dir.name}……")
        actual_dir = templates_root / ref_dir.name

        build_template(ref_dir, compile_command)
        build_template(actual_dir, compile_command)

        diff_template(ref_dir, actual_dir, diff)
        click.echo(f"✅ 已比较 {ref_dir.name}。")


if __name__ == "__main__":
    cli()
