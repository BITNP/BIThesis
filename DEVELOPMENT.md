# 开发者指南

> [!TIP]
>
> 本项目采用 [GitHub Projects](https://github.com/BITNP/BIThesis/projects) 进行任务管理。
> 你可以每次选择其中的一个小的 TODO 进行开发；来帮助项目一点一点前进。

## 本地开发

一般开发需求分为三种：

- 修改 `templates/` 中某个模板

  例：改进`ref.bib`中的示例，在 `main.tex` 中补充注释。

- 修改 `bithesis.dtx` 文件

  例：添加新命令，更改 `\BITSetup` 选项。

- 修改其他文件。

> [!TIP]
>
> 运行 justfile（及 Makefile）需要安装 [just](https://just.systems/man/en/pre-built-binaries.html) 和 [fd](https://github.com/sharkdp/fd/#installation)，通常下载可执行文件即可。此外 Windows 开发者若遇到问题，请参考[后文](#Windows)。

### 修改 `templates/` 中某个模板

如果改动仅仅涉及某个模板，那么相对简单一些：

1. 初次开发前，运行 `just copy`，这会生成 `*.cls` 等并更新到 `templates/` 下。
2. 编辑模板。
3. 测试，确保你的改动能够正确编译；并且不会影响到其他效果。

### 修改 `bithesis.dtx` 文件

1. 编辑 `src/bithesis.dtx`。
2. 运行 `just copy`，这会生成新的 `*.cls` 并更新到 `templates/` 下。
3. 更新文档（`src/bithesis-doc.tex` 以及 `src/bithesis.dtx` 中的注释），然后运行 `just doc` 编译出手册`src/bithesis.pdf`。
4. 测试，确保你的改动不会影响到其他功能。

> [!TIP]
>
> 如果要添加新命令，可以先在 `templates/` 中具体实现，再拷贝到 `bithesis.dtx`。

> [!NOTE]
>
> 文档有两部分。
>
> - `bithesis-doc.tex`面向最终使用者，对应手册`bithesis.pdf`大部分内容。
> - `bithesis.dtx`中的注释面向开发者。
>
>   <details>
>   <summary>注释中为何有 LaTeX 代码？</summary>
>
>   `bithesis.dtx`最顶层的注释包含 LaTeX 代码，可输出为手册结尾「实现细节」一节；不过默认不输出，一般也无需单独检查输出结果。
>
>   如需输出，请如下编辑`bithesis.dtx`（`\jobname`的值是`bithesis`，`\filename`的值是`bithesis.dtx`），然后照常编译手册。
>
>   ```diff
>    \begin{document}
>   -  \DocInput{\jobname-doc.tex}
>   +  \DocInput{\jobname-doc.tex,\filename}
>   ```
>
>   相关功能的文档位于 [DocStrip](https://texdoc.org/serve/docstrip/0) 和 [l3doc](https://texdoc.org/serve/l3doc/0)。
>   </details>

## TeX Live 版本

- 模板：需要保证自 2021 起的 TeX Live 都能使用

- 文档：只需保证最新版 TeX Live（当前为 2025）能编译

建议开发时使用最新版 TeX Live，通过 pull request 的 CI 保证支持旧版。

<details><summary>建议开发使用最新版 TeX Live 的原因</summary>

- 目前遇到的兼容性问题主要是不兼容新版，而非不兼容旧版。

  最近 LaTeX 团队为了改进 PDF 可访问性，修改很多宏的定义，导致不兼容。

- 目前文档只能使用最新版 TeX Live 编译。

  - `bithesis-doc.tex`使用了 [lt3luabridge](https://www.ctan.org/pkg/lt3luabridge) 提供的`\luabridge_now:n`，该命令在 2022-06-26 才引入。
  - `handbook/*`使用了 [cleveref](https://www.ctan.org/pkg/cleveref)，该包[在特定版本的 TeX Live 2024 与 ctex 不兼容](https://github.com/CTeX-org/ctex-kit/issues/725)。
  - TeX Live 2023 或更早时，某些包声明的依赖不全，导致单纯安装[`tl_packages`](./.github/tl_packages)列出的包不够，难以测试。

</details>

## 参考资料

- 本项目采用 LaTeX3，可以参考 [LaTeX3: Programming in LaTeX with Ease](https://www.alanshawn.com/tech/2020/10/04/latex3-tutorial.html)、[expl3 的文档](https://www.latex-project.org/help/documentation/)等。
- 关于模板，[fduthesis 项目代码](https://github.com/stone-zeng/fduthesis)有很多最佳实践，可以参考。
- 样式部分则应参考[研究生院](https://grd.bit.edu.cn/xwgz/xwgz2/wjxz_xwgz/)和教务部的相关文件和通知。

## justfile 的进一步介绍

运行`just --list`可查看所有命令。

```shell
$ just --list
Available recipes:
    list                  # List available recipes
    …

    [build]
    copy                  # Copy necessary files to templates/*/ and relevant directories
    doc                   # Build bithesis.pdf
    …

    [dev]
    regression-test *ARGS # Run regression tests (run with `--help` for help)
    …

    [release]
    pkg                   # Build bithesis.zip for submission to CTAN (mainly for CI)
    …
```

### Windows

justfile 主要针对 Linux 和 macOS 开发者；Windows 开发者要确保至少有：

- GNU make——可按 [ScoopInstaller/Main: `make.json`](https://github.com/ScoopInstaller/Main/blob/master/bucket/make.json) 中的 `url` 下载。
- GNU coreutils——可使用内置了 coreutils 的 Git Bash 或 Cygwin，或者[安装 uutils-coreutils](https://uutils.github.io/coreutils/docs/installation.html#windows)。

当然，也欢迎你贡献更通用的开发脚本。

### 辅助命令

我们常常需要实时预览代码编译的效果，而 LaTeX 本身没有提供实时编译的功能，导致我们要来回运行 `just copy`、`latexmk`。

其实可以使用类似 `rg --files | entr just copy` 以及 `rg --files | entr latexmk` 来达到「代码修改后立即重新编译」的效果。

（这些命令未必适用于 Windows，可能要手动用 [watchexec](https://watchexec.github.io/) 等替代。）

### 单元测试和回归测试

运行 `just test` 将对所有的模板进行编译测试（同样被用于 GitHub Actions）。

运行 `just regression-test` 进行回归测试，该命令将比较目前已发布的最新版本和本地版本生成的 PDF 的差异。更多使用方式见 `just regression-test --help`。

使用前请确保已经安装下面这些依赖。

- [uv](https://docs.astral.sh/uv/)（或自己管理 python 环境）
- [GitHub CLI](https://cli.github.com/)（或手动下载文件）
- [vslavik/diff-pdf](https://vslavik.github.io/diff-pdf/) 或 [rubypdf/diffpdf](https://soft.rubypdf.com/software/diffpdf)

### 打包

- `just pkg` 可以生成上传 CTAN 所需要的 zip 文件。若已有手册而不想重新编译，可 `just pkg-only`。（同样被用于 GitHub Actions）
- `just grad X.X.X` 可以生成用作研究生院官网附件的 zip 文件。

## Release 工作流

在一定量改进和新功能添加以后，需要开始着手发布新的版本。

版本号：参考 [Semantic Versioning 2.0.0 | Semantic Versioning](https://semver.org/) 。

![Release Workflow](./assets/release_workflow.png)

上周展示了完整工作流，其中大部分已自动化，只需要手动触发。

- Overleaf 链接已利用 [`overleaf.com/docs` API](https://www.overleaf.com/devs) 自动指向最新发布版，不再需要手动更新。
