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
> 运行 Makefile 需要[安装 fd](https://github.com/sharkdp/fd/#installation)，通常下载可执行文件即可。此外 Windows 开发者若遇到问题，请参考[后文](#Windows)。

### 修改 `templates/` 中某个模板

如果改动仅仅涉及某个模板，那么相对简单一些：

1. 初次开发前，运行 `make copy`，这会生成 `*.cls` 等并更新到 `templates/` 下。
2. 编辑模板。
3. 测试，确保你的改动能够正确编译；并且不会影响到其他效果。

### 修改 `bithesis.dtx` 文件

1. 编辑 `bithesis.dtx`。
2. 运行 `make copy`，这会生成新的 `*.cls` 并更新到 `templates/` 下。
3. 更新文档（`bithesis-doc.tex` 以及 `bithesis.dtx` 中的注释），然后运行 `make doc` 编译出手册`bithesis.pdf`。
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

## 参考资料

- 本项目采用 LaTeX3，可以参考 [LaTeX3: Programming in LaTeX with Ease](https://www.alanshawn.com/tech/2020/10/04/latex3-tutorial.html)、[expl3 的文档](https://www.latex-project.org/help/documentation/)等。
- 关于模板，[fduthesis 项目代码](https://github.com/stone-zeng/fduthesis)有很多最佳实践，可以参考。
- 样式部分则应参考[研究生院](https://grd.bit.edu.cn/xwgz/xwgz2/wjxz_xwgz/)和教务部的相关文件和通知。

## Makefile 的进一步介绍

### Windows

Makefile 主要针对 Linux 和 macOS 开发者；Windows 开发者要确保至少有：

- GNU make——可按 [ScoopInstaller/Main: `make.json`](https://github.com/ScoopInstaller/Main/blob/master/bucket/make.json) 中的 `url` 下载。
- GNU coreutils——可使用内置了 coreutils 的 Git Bash 或 Cygwin，或者[安装 uutils-coreutils](https://uutils.github.io/coreutils/docs/installation.html#windows)。

当然，也欢迎你贡献更通用的开发脚本。

### 辅助命令

我们常常需要实时预览代码编译的效果，而 LaTeX 本身没有提供实时编译的功能，导致我们要来回运行 `make copy`、`latexmk`。

为此 Makefile 提供了一些辅助命令，以 `dev-`开头，可以帮助你自动化以上流程。

或者你可以使用类似 `rg --files | entr make copy` 以及 `rg --files | entr latexmk` 来达到
「代码修改后立即重新编译」的效果。

（这些命令未必适用于 Windows，可能要手动用 [watchexec](https://watchexec.github.io/) 等替代。）

### 单元测试和回归测试

运行 `make test` 将对所有的模板进行编译测试（同样被用于 GitHub Actions）。

运行 `make regression-test` 进行回归测试，该命令将比较目前已发布的最新版本和本地版本生成的 PDF 的差异。更多使用方式见 `make regression-test args='--help'`。

使用前请确保已经安装下面这些依赖。

- [uv](https://docs.astral.sh/uv/)（或自己管理 python 环境）
- [GitHub CLI](https://cli.github.com/)（或手动下载文件）
- [vslavik/diff-pdf](https://vslavik.github.io/diff-pdf/) 或 [rubypdf/diffpdf](https://soft.rubypdf.com/software/diffpdf)

### 打包

- `make overleaf version=X.X.X` 可以生成上传 overleaf 所需要的 zip 文件。
- `make pkg` 可以生成上传 CTAN 所需要的 zip 文件。若已有手册而不想重新编译，可 `make pkg-only`。（同样被用于 GitHub Actions）
- `make grad version=X.X.X` 可以生成用作研究生院官网附件的 zip 文件。

### 上传 Overleaf 与更新

> [!NOTE]
> Overleaf 链接已利用 [`overleaf.com/docs` API](https://www.overleaf.com/devs) 自动指向最新发布版，不再需要手动更新。

首先运行 `make overleaf` 打包文件。

1. 打开 Overleaf，点击左上角 `New Projects > Upload Projects` ，然后上传 zip 文件。
2. 点击 `Menu > Compiler` 选择 `XeLaTeX`，然后重新编译。
3. 修改项目名称，以便于区分。（我一般加上 `BIThesis-`）
4. 点击 `Share > Turn on link sharing`，复制 read 权限的链接。
5. 在 [`BIThesis-wiki` 项目的 `wiki/guide/preface.md`](https://github.com/BITNP/BIThesis-wiki/blob/main/wiki/guide/preface.md) 中，更新链接。

## Release 工作流

在一定量改进和新功能添加以后，需要开始着手发布新的版本。

版本号：参考 [Semantic Versioning 2.0.0 | Semantic Versioning](https://semver.org/) 。

![Release Workflow](./assets/release_workflow.png)

上周展示了完整工作流，其中大部分已自动化，只需要手动触发。
