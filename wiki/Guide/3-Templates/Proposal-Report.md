# 📕 本科生毕业设计：开题报告

[![](https://img.shields.io/badge/maintainer-@SpencerWoo-F80000?logo=github&labelColor=2b2b2b)](https://github.com/spencerwooo)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/spencerwooo/BIThesis?color=008080&logo=latex&labelColor=2b2b2b)](https://github.com/spencerwooo/BIThesis/releases/latest)

本文档介绍了北京理工大学本科生毕业设计（论文）计算机学院的开题报告模板使用方法。

:::danger ⛔ 格式注意
本科生开题报告的模板是按照北京理工大学计算机学院下发的开题报告 Word 模板格式进行制作的，如果你所在学院开题报告与计算机学院模板不一致，请按照你所在学院的开题报告模板格式进行相应的修改后使用。
:::

本模板已经发布在 Overleaf 上，你可以打开直接使用。点击下图所示中的 Open as Template 即可：

[![open in overleaf](https://img.shields.io/badge/open%20in-Overleaf-46a247?logo=overleaf&logoColor=white&style=for-the-badge&labelColor=2b2b2b)](https://www.overleaf.com/latex/templates/bei-jing-li-gong-da-xue-ben-ke-sheng-bi-ye-lun-wen-kai-ti-bao-gao-mo-ban/dgqdjptfqtrn)

![](https://i.loli.net/2020/03/02/eLVlF3XsZfpoYkd.png)

Overleaf 缺少一些微软版权字体（比如宋体、黑体等），**因此如果你希望格式完全准确，请使用本机进行编辑。**

## 熟悉项目

:::vue
.
├── README.md
├── `misc`
│    ├── cover.tex
│    ├── refs.bib
│    └── reviewTableBlank.pdf
├── main.pdf
├── main.tex
└── merge-sort-recursion-tree.png
:::

本项目由四个主要文件编译而成，请大家重点关注如下几个文件与目录：

- `main.tex`：开题报告的开始文件（主文件），你的报告内容应该从此文件开始撰写。`main.tex` 中有详细的注释，介绍了每一部分内容都有什么作用，请仔细阅读后进行相应的修改
- `./misc` 文件夹：开题报告中所需要的杂项
  - `cover.tex`：开题报告封面，按照教务部提供的封面设计，如无特殊需要请不要修改
  - `reviewTableBlank.pdf`：开题报告 PDF 格式的「评审表」，由于考虑到评审表后期由评委老师填写，因此本部分如无需要也无需改动
  - `refs.bib`：开题报告的参考文献 BibTeX 数据库，你应该向其中加入开题报告中所需要的所有参考文献的 BibTeX 格式引用（详见下文）
- `main.pdf`：开题报告编译得到的 PDF 文件

## 你的内容从哪开始？

开题报告项目结构相对来说比较简单，因此你只需要重点关注 `main.tex` 这一文件 —— 项目的主文件。你的内容应该从 `main.tex` [第 127 行](https://github.com/spencerwooo/BIThesis/blob/master/proposal-report/main.tex#L127) 的 `%内容开始` 开始。你需要重点关注的部分有：

| 文章部分                                                              | 内容主旨                                                                                                             | 对应 LaTeX 模板 section                                                                                                                                                                                                                   |
| :-------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 第一部分                                                              | 选题内容                                                                                                             | `\section{毕业设计（论文）选题的内容}`                                                                                                                                                                                                    |
| 第二部分                                                              | 研究方案                                                                                                             | `\section{研究方案}`                                                                                                                                                                                                                      |
| <ul><li>2-1</li><li>2-2</li><li>2-3</li><li>2-4</li><li>2-5</li></ul> | <ul><li>主要任务</li><li>技术方案</li><li>实施方案所需环境</li><li>存在问题与技术关键</li><li>预期研究目标</li></ul> | <ul><li>`\subsection{本选题的主要任务}`</li><li>`\subsection{技术方案的分析、选择}`</li><li>`\subsection{实施技术方案所需的条件}`</li><li>`\subsection{存在的主要问题和技术关键}`</li><li>`\subsection{预期能够达到的研究目标}`</li></ul> |
| 第三部分                                                              | 课题计划进度表                                                                                                       | `\section{课题计划进度表}`                                                                                                                                                                                                                |

以及最后的「参考文献」。你应该将参考文献的 BibTeX 引用复制进入 `./misc/refs.bib`，并在正文中用 `\cite{}` 的方法进行引用。其中 BibTeX 格式的引用内容可以在谷歌学术中搜索文章直接复制得到，也可以考虑使用 Zotero 等文献管理工具批量生成。

## 其他

有关具体的 LaTeX 语法，请参考前文中 [使用其中一个模板：Using one of the templates - 熟悉简单的 LaTeX 语法](/Guide/2-Usage/Downloading-and-using-templates.md#%E7%86%9F%E6%82%89%E7%AE%80%E5%8D%95%E7%9A%84-latex-%E8%AF%AD%E6%B3%95) 给出的参考链接与学习文档。以下是模板中提供的一些示例性代码。

如果你希望加入图片，可以将图片直接放在根目录（比如此处的 `merge-sort-recursion-tree.png`），或者统一将图片安置在一个文件夹下，在正文里按照**相对路径**进行引用。模板中有一处插入图片的参考样例，位于 `main.tex` 的 [第 138 行](https://github.com/spencerwooo/BIThesis/blob/master/proposal-report/main.tex#L138)，可以进行参考。

如果你希望插入表格，可以统一使用 [LaTeX Tables Generator](https://www.tablesgenerator.com/) 进行生成，再粘贴进入模板之中。模板中有两处表格的参考样例，分别位于 [第 151 行](https://github.com/spencerwooo/BIThesis/blob/master/proposal-report/main.tex#L151) 和 [第 176 行](https://github.com/spencerwooo/BIThesis/blob/master/proposal-report/main.tex#L176)，可以进行参考。

如果你对「开题报告」模板有任何疑问，请在本项目的 issue 区域进行提问。
