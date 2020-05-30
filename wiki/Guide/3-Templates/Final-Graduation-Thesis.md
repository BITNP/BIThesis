# 📒 本科生毕业设计：毕业论文

[![](https://img.shields.io/badge/maintainer-@SpencerWoo-F80000?logo=github&labelColor=2b2b2b)](https://github.com/spencerwooo)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/spencerwooo/BIThesis?color=008080&logo=latex&labelColor=2b2b2b)](https://github.com/spencerwooo/BIThesis/releases/latest)

:::tip 🚀 更新提示
目前版本的毕业设计论文已经按照北京理工大学 2016 级（2020 届）毕业论文模板进行了设计与排版的更新。
:::

本文档介绍了北京理工大学本科生毕业设计「毕业论文」模板的使用方法。

本模板已经发布在 Overleaf 上，你可以打开直接使用。点击下图所示中的 Open as Template 即可：

[![open in overleaf](https://img.shields.io/badge/open%20in-Overleaf-46a247?logo=overleaf&logoColor=white&labelColor=2b2b2b&style=for-the-badge)](https://www.overleaf.com/latex/templates/bei-jing-li-gong-da-xue-ben-ke-sheng-bi-ye-she-ji-lun-wen-mo-ban/mwhjgqsncxxg)

![](https://i.loli.net/2020/03/03/cXdPRAlI4BUErZ9.png)

Overleaf 版本的毕业论文模板中由于没有微软版权字体「华文细黑」，导致封面的毕业论文中文大标题无法用 Word 模板中规定的字体渲染，使得最终呈现样式与要求有些出入，如果希望保证 LaTeX 模板输出和学校模板一致，那么还是推荐在本地进行撰写和编译。

## 熟悉项目

:::vue
.
├── README.md
├── `chapters`
│    ├── 0_abstract.tex
│    └── 1_chapter1.tex
├── `images`
│    ├── bit_logo.png
│    └── header.png
└── `misc`
│    ├── 0_cover.tex
│    ├── 1_originality.tex
│    ├── 2_toc.tex
│    ├── 3_conclusion.tex
│    ├── 4_reference.tex
│    ├── 5_appendix.tex
│    ├── 6_acknowledgements.tex
│    └── ref.bib
├── main.tex
└── main.pdf
:::

本项目由一个主文件和与之并存的几个辅助文件夹中的文件构成：

- `main.tex`：毕业论文模板的主文件
- `./chapters` 文件夹：包含有整个毕业论文的「摘要」和正文的全部「章节」
  - `0_abstract.tex`：毕业论文的「摘要」（中文摘要与英文摘要）
  - `1_chapter1.tex`：毕业论文正文「第一章」（示例章节）
  - ……（你可以继续添加第二章 `2_chapter2.tex`、第三章 `3_chapter3.tex`……，并在主文件 `main.tex` 中引用（详见下文）
- `./misc` 文件夹：包含有毕业论文模板中的封面、后置章节与参考文献
  - `0_cover.tex`：毕业论文的「封面」，一般情况无需更改
  - `1_originality.tex`：毕业论文的「原创性声明」，一般情况无需更改（签字和日期后期手动添加）
  - `1_originality.pdf`：毕业论文的「原创性声明」，是由原 Word 模板导出的一页 PDF 文档，插入到毕业论文中的（如果上一行中的 `tex` 版本格式无法满足你的需要，可以用 Word 将这一单页导出为 PDF 插入。详见源 LaTeX 代码）
  - `2_toc.tex`：毕业论文的「目录」，一般情况无需更改（由 LaTeX 自动生成）
  - `3_conclusion.tex`：毕业论文的「结论」，按照一般章节文件对待
  - `4_reference.tex`：毕业论文的「参考文献」，一般情况无需更改（由 LaTeX 根据你文档中的 `\cite{}` 自动生成）
  - `5_appendix.tex`：毕业论文的「附录」，按照一般章节文件对待
  - `6_acknowledgements.tex`：毕业论文的「致谢」，按照一般章节文件对待
  - `ref.bib`：参考文献 BibTeX 数据库

主文件与其余文件之间的引用关系大致如下图所示：

![](https://i.loli.net/2020/03/07/ZtUdOoDiHuQqTCv.png)

## 你的内容从哪里开始？

熟悉项目之后，你应该发现，我们毕业设计论文共分为如下的几个模块：封面、原创性声明、中英文摘要、目录、正文（多个章节）、结论、参考文献、附录与致谢。我们的整个毕业设计论文 LaTeX 项目将每个模块单独提取出来，成为单独的 LaTeX 文件，使用 `main.tex` 主文件统一引用，方便各位进行分模块的修改。你需要重点关注的地方有如下几个。

### 开始

首先，你需要定义毕业设计论文的「中文标题」和「英文标题」，这两个「变量」将影响模板封面的渲染，以及后续摘要中出现的标题的渲染。

中英文标题的定义位于 `main.tex` 的 [第 70 至第 72 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L70-L72)：

- 你可以通过控制 `\thesisTitle` 这一变量来控制整个论文的「中文标题」
- 你可以通过控制 `\thesisTitleEN` 这一变量来控制整个项目的「英文标题」

接下来，你需要定义你的个人信息，这些信息将被渲染在毕业设计论文的封面。个人信息包括你所在学院，你的专业、学号、姓名和指导教师。

个人信息的定义位于 `main.tex` 的 [第 74 行至第 81 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L74-L81)：

- `\deptName`：你所在学院
- `\majorName`：你所就读的专业
- `\yourName`：你的姓名
- `\yourStudentID`：你的学号
- `\mentorName`：你的指导教师

如果你的毕设为校外毕设，你还需要填写位于 [第 80 行至第 81 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L80-L81) 的校外指导教师信息：
- `\externalMentorName`：你的校外指导教师

填写校外指导教师信息时，请先将 [第 81 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L81) 解除注释，即删除行首的百分号字符，然后在第二组花括号中填写你的校外指导教师名称。一旦 `\externalMentorName` 被填写，LaTeX 模板将为你生成校外毕设封面。

如果你的毕设不是校外毕设，请不要修改 [第 81 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L81) 的任何内容。

### 中英摘要

接下来，你需要撰写论文的摘要。模板中英文摘要位于 `chapters/0_abstract.tex`：

- **中文摘要**位于 `0_abstract.tex` 的 [第 39 行至第 46 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/0_abstract.tex#L39-L46)。其中 [第 46 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/0_abstract.tex#L46) 定义**摘要的中文关键词**
- **英文摘要**位于 `0_abstract.tex` 的 [第 67 行至第 72 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/0_abstract.tex#L67-L72)。其中 [第 72 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/0_abstract.tex#L76) 定义**摘要的英文关键词**

### 正文

正文是一篇论文中最为重要的部分，是一篇论文的核心。正文部分可以分为多个章节，模板中仅创建了第一章节的示范性文件：`chapters/1_chapter1.tex`，你可以将它作为正文章节的「模板」，继续在 `./chapters` 目录下自行创建第二章节 `2_chapter2.tex`、第三章节 `3_chapter3.tex` 等等，并需要在 `main.tex` 的 [第 217 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L217) 处添加对应章节文件的相对路径引用：

```tex
% 第一章
\input{chapters/1_chapter1.tex}
% 在这里添加第二章、第三章……TeX 文件的引用
\input{chapters/2_chapter2.tex}
\input{chapters/3_chapter3.tex}
```

之后，你可以分别在每个章节独立的 TeX 文件中撰写每一章节的内容。

### 后续模块

在正文之后，我们的论文还剩下：结论、参考文献、附录与致谢这四个模块。它们依次位于：

- Conclusion 结论：`misc/3_conclusion.tex`
- Reference 参考文献：`misc/4_reference.tex`
- Appendix 附录：`misc/5_appendix.tex`
- Acknowledgements 致谢：`misc/6_acknowledgements.tex`

其中，**你不需要手动编辑「参考文献」这一文件**，只需要撰写「结论」、「附录」和「致谢」即可。这三个模块的撰写逻辑与前面正文章节的撰写逻辑是一致的。

有关具体的 LaTeX 语法，请参考前文中 [使用其中一个模板：Using one of the templates - 熟悉简单的 LaTeX 语法](/Guide/2-Usage/Downloading-and-using-templates.md#%E7%86%9F%E6%82%89%E7%AE%80%E5%8D%95%E7%9A%84-latex-%E8%AF%AD%E6%B3%95)) 给出的参考链接与学习文档。以下是模板中提供的一些示例性代码。

## 参考文献管理

为了保证你的毕业论文的参考文献格式标准，你需要将参考文献的 BibTeX 引用复制进入 `./misc/refs.bib`，并在正文中用 `\cite{xxx}` 的方法进行引用。

BibTeX 是一种表示、存储与引用参考文献的语法，谷歌学术中搜索文章直接复制得到。

![](https://i.loli.net/2020/03/07/D3c5HGhYS9EeXiq.png)

复制得到的参考文献 BibTeX 类似：

```
@inproceedings{szegedy2016rethinking,
  title={Rethinking the inception architecture for computer vision},
  author={Szegedy, Christian and Vanhoucke, Vincent and Ioffe, Sergey and Shlens, Jon and Wojna, Zbigniew},
  booktitle={Proceedings of the IEEE conference on computer vision and pattern recognition},
  pages={2818--2826},
  year={2016}
}
```

将上面的内容复制进入 `misc/ref.bib` 即可，之后你就可以直接在文章中使用这一参考文献的地方用类似下面的方法引用这一标签为 `szegedy2016rethinking` 的参考文献：

```tex
正文，正文正文 \cite{szegedy2016rethinking} 正文正文……
```

另外，你也可以考虑使用 Zotero 等专业文献管理工具批量生成。参考：[文献管理神器 Zotero 学习路径指南](https://sspai.com/post/56724)。

![](https://i.loli.net/2020/03/07/8QsFZjPqfgD9UC7.png)

## 图片素材

整个模板的图片素材都整理在图片文件夹中：`./images`。你可以将论文中使用到的图片统一放在这一目录下进行管理，在论文中使用「相对路径」进行引用。你可以用类似下面的语法引用图片：

```tex
\begin{figure}[htbp]
  \vspace{13pt} % 调整图片与上文的垂直距离
  \centering
  \includegraphics[width=0.8\textwidth]{images/bit_logo.png}
  \caption{标题序号}\label{标题序号} % label 用来在文中索引
\end{figure}
```

可以看到：

- 我们首先将图片放置在了一个 `\begin{figure} ... \end{figure}` 的环境中，其中 `[htbp]` 是用于定位图片。
- 之后，在环境中，我们首先使用 `\centering` 保证图片水平居中
- 之后用 `\includegraphics[图片大小]{图片路径}` 的格式引用了图片本身（图片大小的语法`width=0.8\textwidth` 表示图片宽度是整个页宽的 0.8 倍）
- 最后我们定义了图片的说明文字 `\caption{图片说明}` 和图片的标签编号 `\label{图片编号}`，前者显示在图片下方起到说明注释的作用，后者让我们可以用 `\ref{图片编号}` 的语法来在正文中引用图片

请注意，为了保证图片引用的格式和 Word 模板完全一致，我们手动设置了 `\vspace{13pt}` 的垂直空白，**你引用新图片时，也需要添加这一垂直空白。**

在第一章节 `chapters/1_chapter1.tex` 中的 [第 38 行至第 43 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/1_chapter1.tex#L38-L43) 是一个示范。

上述插入图片的方法无法处理 SVG 格式的矢量图片。如果你希望插入 SVG 格式的矢量图片，请按照如下的步骤进行插入：

第一步，将 `.svg` 格式的图片文件放入 `./images` 文件夹中，假设文件名为 `bit_logo.svg`；

第二步，在 `main.tex` 的 [第 26 行至第 45 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L26-L45) 中的任意位置，插入对 `svg` 宏包以及 `adjustbox` 宏包的引用：`\usepackage{svg}`、`\usepackage{adjustbox}`；

第三步，在需要插入图片的位置，使用类似于下面的语法插入 SVG 图片：
```tex
\begin{figure}[htbp]
  \vspace{13pt} % 调整图片与上文的垂直距离
  \centering
  \adjustbox{width=0.8\textwidth}{\includesvg{images/bit_logo}}
  \caption{标题序号}\label{标题序号} % label 用来在文中索引
\end{figure}
```

需要注意以下几点：

- 在 `\includesvg` 宏内引用 SVG 图片的文件名称时，不需要携带 `.svg` 扩展名，而是直接引用文件名称；
- 请务必使用 `\adjustbox` 宏来对 SVG 图片的大小进行调整，而**不要使用** `\includesvg[width=0.8\textwidth]` 这样的方式对图片大小进行调整，因为后者无法很好地处理 SVG 图片中文字的缩放。

## 表格插入

表格一直是 LaTeX 排版系统非常强大又非常不好实现的一个模块，如果你希望方便的插入表格，可以统一使用 [LaTeX Tables Generator](https://www.tablesgenerator.com/) 进行生成，再粘贴进入模板之中。

在第一章节 `chapters/1_chapter1.tex` 中的 [第 47 行至第 60 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/1_chapter1.tex#L47-L60) 是一个示范。

## 公式插入

LaTeX 的行内数学符号和公式等，使用 `\( ... \)` 的语法进行定义。比如类似如下的正文：

```tex
The well known Pythagorean theorem \(x^2 + y^2 = z^2\) was
proved to be invalid for other exponents.
Meaning the next equation has no integer solutions:

\[ x^n + y^n = z^n \]
```

即可非常简单的渲染如下的公式效果：

![](https://i.loli.net/2020/03/07/2gWX3MvdIqnaGoT.png)

另外，行内数学环境也可以用 `$ ... $` 的语法进行定义：

```tex
In physics, the mass-energy equivalence is stated
by the equation $E=mc^2$, discovered in 1905 by Albert Einstein.
```

![](https://i.loli.net/2020/03/07/g5YwPqSEcVUMGZm.png)

复杂的独立模块数学公式可以用如下的语法进行定义：

```tex
\begin{equation}
    LRI=1\ ∕\ \sqrt{1+{\left(\frac{{\mu }_{R}}{{\mu }_{s}}\right)}^{2}{\left(\frac{{\delta }_{R}}{{\delta }_{s}}\right)}^{2}}
\end{equation}
```

![](https://i.loli.net/2020/03/07/vkPeVtWIjFiNGLY.png)

为了保证与 Word 模板中的数学公式要求一致，我们的 LaTeX 模板中的公式默认会进行相应的编号（比如上面的例子）。在第一章节 `chapters/1_chapter1.tex` 中的 [第 67 行至第 69 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/chapters/1_chapter1.tex#L67-L69) 是一个示范。

## 其他

以下模块的使用可能需要你手动在 `main.tex` 的开头用 `\usepackage{ ... }` 的方法引入其他 LaTeX 宏包。

### 代码高亮

你可以使用 `minted` 宏包来进行代码块的渲染。比如：

- 在文档开题引入宏包：

  ```tex
  \usepackage{minted}
  ```

- 渲染代码块：

  ```tex
  \begin{minted}{python}
  import numpy as np

  def incmatrix(genl1,genl2):
    m = len(genl1)
    n = len(genl2)
    M = None #to become the incidence matrix
    VT = np.zeros((n*m,1), int)  #dummy variable

    #compute the bitwise xor matrix
    M1 = bitxormatrix(genl1)
    M2 = np.triu(bitxormatrix(genl2),1)
  \end{minted}
  ```

你就会得到类似下面的渲染效果：

![](https://i.loli.net/2020/03/07/Eu6VQtPbqXDoWO9.png)

有关 `minted` 的更多使用方法，请阅读：[Code Highlighting with minted](https://www.overleaf.com/learn/latex/Code_Highlighting_with_minted)。

如果你在使用 `minted` 的过程中遇到了任何问题，请阅读：[疑难杂症 Troubleshooting](/Guide/4-Others/Troubleshooting.md)。

### 算法模块

你可以使用 `algorithm2e` 宏包来渲染一个「伪代码算法」模块。比如：

- 在文档开头引入宏包：

  ```tex
  \usepackage[ruled,vlined]{algorithm2e}
  ```

- 渲染伪代码模块：

  ```tex
  \begin{algorithm}[H]
  \SetAlgoLined
  \KwResult{Write here the result }
   initialization\;
   \While{While condition}{
    instructions\;
    \eIf{condition}{
     instructions1\;
     instructions2\;
     }{
     instructions3\;
    }
   }
   \caption{How to write algorithms}
  \end{algorithm}
  ```

这样，你就会得到类似如下的渲染效果：

![](https://i.loli.net/2020/03/07/8mbkRjQ1SViAXCK.png)

有关更多伪代码算法模块的使用，请阅读：[Algorithms](https://www.overleaf.com/learn/latex/algorithms)。

### 定理插入

你可以使用 `\newtheorem` 命令来定义不同的「定理环境」，从而实现渲染定理等模块。例如：

- 在文档开头定义环境：

  ```tex
  \newtheorem{theorem}{\hspace{2em}定理}[chapter]
  \newtheorem{corollary}{\hspace{2em}推论}[theorem]

  % 上述每行命令第一个大括号中为环境名称，
  % 第二个大括号中为该环境渲染的模块标题，
  % 方括号中选项用来设置编号逻辑，如 [chapter] 表示第 n 章节中定理编号依次为 n.1, n.2, …… 。
  ```

- 渲染定理及推论模块：

  ```tex
  \begin{theorem}[均值不等式]
  \label{thm-1}
  设 $A,B$ 是两个实数, 则 $2AB\leq A^2+B^2$。
  \end{theorem}

  由定理 \ref{thm-1} 可得以下推论。

  \begin{corollary}
  设 $A,B$ 是两个实数, 则 $2AB\leq (A+B)^2/2$。
  \end{corollary}
  ```

这样，你就会得到类似如下的渲染效果：

![1.png](https://i.loli.net/2020/05/13/nqLB2J4zPoWVObM.png)

- 类似的，你还可以定义引理、定义、命题等环境：

  ```tex
  \newtheorem{lemma}{\hspace{2em}引理}[chapter]
  \newtheorem{definition}{\hspace{2em}定义}[chapter]
  \newtheorem{proposition}{\hspace{2em}命题}[chapter]
  ```

有关定理环境的更多使用方法，请阅读：[Theorems and proofs](https://www.overleaf.com/learn/latex/Theorems_and_proofs)。

如果你需要更改定理环境中文字字体，可以考虑使用 `ntheorem` 宏包。比如对于上述例子：

- 在文档开头引入宏包，并指定定理环境的字体格式：

  ```tex
  \usepackage{ntheorem}
  \theoremstyle{plain}
  \theoremheaderfont{\heiti} % 改变定理环境中标题字体为黑体
  \theorembodyfont{\songti} % 改变定理环境中正文字体为宋体
  ```

这样，你就会得到类似如下的渲染效果：

![](https://i.loli.net/2020/05/13/QgvLxduSm5czTV1.png)

有关 `ntheorem` 的更多使用方法，请阅读：[ntheorem](https://mirrors.tuna.tsinghua.edu.cn/CTAN/macros/latex/contrib/ntheorem/ntheorem.pdf)。

如果你对「毕业论文」模板有任何疑问，请在本项目的 issue 区域进行提问。
