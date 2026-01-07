"""根据提交记录更新`bithesis.dtx`中的版本，主要用于分发测试版

## 使用示例

若是正常发布的版本，直接记录版本号。

```shell
$ git switch --detach v3.8.3
$ python scripts/update_version.py
Update to 📗3.8.3 📅2025-04-08.

$ git switch --detach v3.8.0-alpha-2
$ python scripts/update_version.py
Update to 📗3.8.0-alpha-2 📅2024-08-30.
```

若不在任何特定版本，记录到最近发布版的距离，以及提交信息。

```shell
$ git switch feature-branch
$ python scripts/update_version.py
Update to 📗3.8.3-22-g6d70ca1 📅2025-04-17.
# v3.8.3 后第22个提交，hash 开头为 6d70ca1
```

为方便普通人查看，还可再补充后缀。

```shell
$ git switch main
$ python scripts/update_version.py main
Update to 📗3.8.3-21-g3ac2789-main 📅2025-04-15.
```
"""

import re
from datetime import datetime
from pathlib import Path
from subprocess import run
from sys import argv


def get_version() -> str:
    """获取版本号

    示例：`3.8.3`、`3.8.3-21-g3ac2789`。
    """
    tag = run(
        ["git", "describe", "--tags"], check=True, capture_output=True, text=True
    ).stdout.strip()
    assert tag.startswith("v"), f"Failed to parse the tag “{tag}”."
    return tag.removeprefix("v")


def get_date() -> datetime:
    """获取日期"""
    result = run(
        [
            "git",
            "show",
            "--no-patch",
            "--format=%cd",  # 按 committer date 而非 author date
            "--date=iso8601-strict-local",  # 按本地时区
        ],
        check=True,
        capture_output=True,
        text=True,
    ).stdout.strip()
    return datetime.fromisoformat(result)


def update(human_version: str | None = None) -> None:
    """Update versions in `bithesis.dtx` with an optional `human_version` suffix."""
    file = Path(__file__).parent.parent / "src/bithesis.dtx"
    doc = file.read_text(encoding="utf-8")

    version = get_version()
    if human_version is not None:
        version = f"{version}-{human_version}"
    date = get_date()
    print(f"Update to 📗{version} 📅{date.date()}.")

    # `\ProvidesExplClass {⟨class⟩} {⟨date⟩} {⟨version⟩} {⟨description⟩}`
    # https://texdoc.org/serve/interface3/0
    # `main.tex`通过`\documentclass{…}`导入文档类时，会输出到日志。
    doc = re.sub(
        r"(>\\ProvidesExplClass{.+}\n%<cls>).+$",
        rf"\1  {{{date.date().isoformat()}}} {{{version}}} {{BIT Thesis Templates}}",
        doc,
        flags=re.MULTILINE,
        count=1,
    )

    # `\ProvidesFile{⟨file⟩}[YYYY/MM/DD ⟨info-text⟩]`
    # https://texdoc.org/serve/latex2e/0
    # 带「实现细节」编译 bithesis.pdf 时，会输出到日志。
    doc = re.sub(
        r"^\\ProvidesFile{bithesis\.dtx}\[.+\]$",
        rf"\\ProvidesFile{{bithesis.dtx}}[{date.strftime('%Y/%m/%d')} v{version} BIT Thesis Templates]",
        doc,
        flags=re.MULTILINE,
        count=1,
    )

    file.write_text(doc, encoding="utf-8")


if __name__ == "__main__":
    update(argv[1] if len(argv) > 1 else None)
