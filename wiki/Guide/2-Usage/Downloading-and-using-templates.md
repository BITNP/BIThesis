# 📃 下载与使用模板

## 熟悉简单的 LaTeX 语法

如果你之前没有接触过 LaTeX，请前往 Overleaf 的[「30 分钟学习 LaTeX」](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes)文档进行阅读，从而对 LaTeX 有大致的印象。

一些常用的 LaTeX 格式与使用技巧：

- [LaTeX 章节设定：Sections and chapters](https://www.overleaf.com/learn/latex/Sections_and_chapters)
- [LaTeX 段落格式：Paragraphs and new lines](https://www.overleaf.com/learn/latex/Paragraphs_and_new_lines)
- [LaTeX 粗体、斜体与下划线：Bold, italics and underlining](https://www.overleaf.com/learn/latex/Bold,_italics_and_underlining)
- [LaTeX 有序列表、无序列表：Lists](https://www.overleaf.com/learn/latex/Lists)
- [LaTeX 插入图片：Inserting Images](https://www.overleaf.com/learn/latex/Inserting_Images)
- [LaTeX 构建表格：Tables](https://www.overleaf.com/learn/latex/Tables)
- [LaTeX 插入数学公式：Mathematical expressions](https://www.overleaf.com/learn/latex/Mathematical_expressions)
- [LaTeX 插入代码与代码高亮：Code Highlighting with minted](https://www.overleaf.com/learn/latex/Code_Highlighting_with_minted)
- [LaTeX 插入算法伪代码描述：Algorithms](https://www.overleaf.com/learn/latex/algorithms)
- [使用 BibLaTeX 管理参考文献：Bibliography management in LaTeX](https://www.overleaf.com/learn/latex/Bibliography_management_in_LaTeX)

有关 LaTeX 使用的更多技巧，请直接前往 [Overleaf 官方文档](https://www.overleaf.com/learn/latex/Main_Page)进行查看。准备就绪之后，你就可以前往下载 BIThesis 模板啦。

## 到 Release 页面下载你希望使用的模板

为了方便各位同学使用，项目按照 Release 发布的流程，将每个模板进行打包，并在每次发布后用 GitHub Release 进行模板分发。也就是，你可以直接前往本项目的 [GitHub Release 页面](https://github.com/spencerwooo/BIThesis/releases/)，直接下载你所希望使用的模板压缩包，并解压到本地进行使用。

你可以点击这个链接前往最新的 Release 版本进行模板下载 👉 [BIThesis - Latest release](https://github.com/spencerwooo/BIThesis/releases/latest)

在 Release 页面，你会看到：

- `proposal-report.zip`：本科生毕业设计开题报告模板压缩包
- `graduation-thesis.zip`：本科生毕业设计毕业论文模板压缩包
- `lab-report.zip`：本科生实验报告模板压缩包

<img src="https://i.loli.net/2020/03/02/wJghlZkXzsK9GNU.png" alt="Release page" width="660px" height="auto">

根据你的选择，下载其中你所要使用的模板即可。（当然，你也可以直接用 Git 将本项目完整克隆至本地，使用最新版本的模板。）

## 编译模板

与 Word 不同的是，LaTeX 模板需要我们用合适的工具进行编译，才能生成最终 PDF 文件。我们接下来介绍 BIThesis 中的模板在各个编辑器中的编译方法。

BIThesis 中的模板编译方式大同小异，我们都会使用 `xelatex`、`biber` 以及 `latexmk` 等工具来编译它们。编译 BIThesis 有两种方法：

- 直接使用 `latexmk` 进行编译：只需要使用一次 `latexmk` 即可编译整个模板，自动识别中文环境与参考文献编译器，增量编译（推荐使用，编译比较方便快速 🚀）
- 使用 `xelatex` 配合 `biber` 进行编译：需要使用「四步走」`xelatex -> biber -> xelatex -> xelatex` 的编译顺序编译模板，全量编译（编译一次可能花费较长时间 🐌）

这两种编译方式均可以用于编译我们的模板，大家可以综合自己的使用习惯来挑选工具。事实上，后面我们将要介绍的 LaTeX 编辑器，它们背后所使用的编译方法就是运行这里提到的两种编译工具。只是我们需要单独配置编辑器的编译方法，才能让编辑器正确的调用编译方式，编译我们的 LaTeX 文档。

在这里，我挑选了三种常见的 LaTeX 编写环境：

- 直接使用「命令行」徒手编写编译
- 使用 VS Code 配合 LaTeX Workshop 编写与编译
- 使用 TeXstudio 编写与编译

我会依次介绍在这三种环境下 LaTeX 编译器配置方法。

### 徒手编译

> 🙅‍ 不推荐，比较繁琐，下面有配合 LaTeX 编辑器更为方便的编译方法。这里仅供参考。

当然，你完全可以不借助任何编辑器，直接使用「命令行」编译 LaTeX 文档。

#### 使用 `latexmk` 编译

如果你使用 `latexmk` 编译模板，那么你只需要使用如下的命令即可编译主文件为 `main.tex` 的 LaTeX 项目：

```bash
# 只需要调用一次 latexmk 工具即可
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex main.tex
```

#### 使用 `xelatex` 编译

如果你使用 `xelatex` 编译项目，那么你需要按照下面的顺序依次调用 `xelatex` 与 `biber` 命令行工具：

![](https://i.loli.net/2020/03/09/6x7KHDZtnwAamf4.png)

比如，编译主文档为 `main.tex` 的 LaTeX 项目，我们具体的命令为：

```bash
# 第一步 xelatex
xelatex -no-pdf --interaction=nonstopmode main
# 第二步 biber
biber main
# 第三步 xelatex
xelatex -no-pdf --interaction=nonstopmode main
# 第四步 xelatex
xelatex --interaction=nonstopmode main
```

### 使用 VS Code 撰写与编译 LaTeX 模板

VS Code 的设置项目可以通过快捷键 `ctrl/cmd + ,` 打开 UI 设置界面，之后点击右上角 `Open Settings (JSON)` 按钮即可打开相应的 JSON 格式配置文件，我们在这里即可定义 LaTeX 编译工具。其中：

- “编译工具”是在 `"latex-workshop.latex.tools": [ ... ]` 处进行定义，即我们在这里定义每次调用工具 `latexmk` 或 `xelatex` 时所执行的命令
- “编译工具链”是在 `"latex-workshop.latex.recipes": [ ... ]` 处进行定义，即我们在这里定义编译整个文档的工具链。对我们的模板使用 `xelatex` 的编译方式来说，就是定义 `xelatex -> biber -> xelatex -> xelatex`「四步走」的串联过程

#### 使用 `latexmk` 编译

这种方法我们只需要使用 `latexmk` 这一个命令行工具。我们在 VS Code 的设置中添加如下的内容定义这一工具：

```json
"latex-workshop.latex.tools": [
  {
    "name": "latexmk",
    "command": "latexmk",
    "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "-xelatex",
      "-outdir=%OUTDIR%",
      "-cd",
      "%DOC%"
    ],
    "env": {}
  },
]
```

之后我们再填入下面的内容定义整个工具链（只有一个 `latexmk`）：

```json
"latex-workshop.latex.recipes": [
  {
    "name": "latexmk",
    "tools": [
      "latexmk"
    ]
  },
]
```

#### 使用 `xelatex` 编译

这种方法需要调用的工具有：`xelatex` 和 `biber`。我们在 VS Code 的设置中加入如下内容定义这两个工具：

```json
"latex-workshop.latex.tools": [
  {
    "name": "xelatex",
    "command": "xelatex",
    "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "-pdf",
      "-outdir=%OUTDIR%",
      "-cd",
      "%DOC%"
    ],
    "env": {}
  },
  {
    "name": "biber",
    "command": "biber",
    "args": [
        "%DOCFILE%"
    ],
    "env": {}
  }
]
```

用这一方法编译整个文档的工具链串联方法是 `xelatex -> biber -> xelatex -> xelatex` 四步走。我们在 VS Code 的设置中加入如下内容定义这个工具链：

```json
"latex-workshop.latex.recipes": [
  {
    "name": "xelatex -> biber -> xelatex * 2",
    "tools": [
      "xelatex",
      "biber",
      "xelatex",
      "xelatex"
    ]
  }
]
```

#### 调用相应的编译 recipe

最后，我们使用快捷键 `ctrl/cmd + shift + P` 打开命令执行栏，并搜索「LaTeX Workshop: Build with recipe」，并选择你所用的 recipe（即上面配置的工具链），即可编译整个 LaTeX 项目。不论用上面介绍的哪种方法，都可以正确的编译 BIThesis 的模板。

![](https://i.loli.net/2020/03/09/2c1uEYlUFjRxJ9w.png)

### 使用 TeXstudio 撰写与编译 LaTeX 模板

TeXstudio 的编译工具大部分已经为我们配置完毕，我们只需要在 TeXstudio 的设置中定义编译所用的编译器即可。在 TeXstudio 中点击「选项 » 设置 TeXstudio」，在打开的窗口中选择「构建」，并在元命令里面将「默认编译器」设置为 `latexmk` 或 `xelatex`，将默认文献工具设置为 `biber` 即可。

![](https://i.loli.net/2020/03/09/qYbDPjw6moLUIS3.png)

你可以使用快捷键 `F5` 一键编译与预览 LaTeX 项目。

## 继续阅读相应的模板使用指南

接下来，请继续阅读各个模板的详细模块介绍与用模板撰写论文的具体实施方法。

- [本科生毕业设计 - 开题报告：Proposal report](/Guide/3-Templates/Proposal-Report.md)
- [本科生毕业设计 - 毕业论文：Graduation thesis](/Guide/3-Templates/Final-Graduation-Thesis.md)
- [本科生实验报告：Lab report](/Guide/3-Templates/Lab-Report.md)
