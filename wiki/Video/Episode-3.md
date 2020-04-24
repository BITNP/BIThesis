# 第三节 LaTeX 基本介绍

<div id="embed-video">
  <iframe src="//player.bilibili.com/player.html?aid=925350795&bvid=BV1GT4y1V78d&cid=181709301&page=4&high_quality=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" ></iframe>
</div>

## 视频相关说明

### 编译

- 定义 `latexmk` 这一工具：

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
        "-outdir=% OUTDIR%",
        "-cd",
        "% DOC%"
      ],
      "env": {}
    },
  ]
  ```

- 定义整个工具链：

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

### 初步使用 LaTeX

- LaTeX 初尝试：

  ```latex
  \documentclass{article}

  \begin{document}
  First document. This is a simple example, with no
  extra parameters or packages included.
  \end{document}
  ```

- 标题，作者和日期示例：

  ```latex
  \documentclass{article}

  \title{First document}
  \author{Hubert Farnsworth
  \thanks{funded by the Overleaf team}}
  \date{February 2017}
  \begin{document}
  \maketitle
  We have now added a title, author and date to our first \LaTeX{} document!
  \end{document}
  ```

- 文本格式化命令：

  ```latex
  \documentclass{article}
  \usepackage{graphicx}
  \graphicspath{{images/}}
  \begin{document} The universe is immense and it seems to be homogeneous, in a large scale, everywhere we look at.
  \begin{center}\includegraphics{universe}\end{center}
  There's a picture of a galaxy above.
  \end{document}
  ```

- 添加图片示例：

  ```latex
  \documentclass{article}
  \usepackage{graphicx}
  \graphicspath{{images/}}

  \begin{document}
  The universe is immense and it seems to be homogeneous, in a large scale, everywhere we look at.

  \begin{center}
    \includegraphics{universe}
  \end{center}

  There's a picture of a galaxy above.
  \end{document}
  ```

- 图片添加标题，标签和参考示例：

  ```latex
  \documentclass{article}
  \usepackage{graphicx}
  \graphicspath{{images/}}

  \begin{document}

  \begin{figure}[h]
    \centering
    \includegraphics[width=0.25\textwidth]{universe}
    \caption{a nice plot}
    \label{fig:mesh1}
  \end{figure}

  As you can see in the figure\ref{fig:mesh1}, the function grows near 0. Also, in the page\pageref{fig:mesh1} is the same example.
  \end{document}
  ```

- 表格示例：

  ```latex
  \documentclass{article}

  \begin{document}
  \begin{center}
    \begin{tabular}{c c c}
    cell1 & cell2 & cell3 \\
    cell4 & cell5 & cell6 \\
    cell7 & cell8 & cell9
    \end{tabular}
  \end{center}
  \end{document}
  ```

- 无序列表示例：

  ```latex
  \documentclass{article}

  \begin{document}
  \begin{itemize}
    \item The individual entries are indicated with a black dot, a so-called bullet.
    \item The text in the entries may be of any length.
  \end{itemize}
  \end{document}
  ```

- 有序列表示例：

  ```latex
  \documentclass{article}

  \begin{document}
  \begin{enumerate}
    \item This is the first entry in our list
    \item The list numbers increase with each entry we add
  \end{enumerate}
  \end{document}
  ```

- 添加数学公式示例：

  ```latex
  \documentclass{article}

  \begin{document}
  The mass-energy equivalence is described by the famous equation\[E=mc^2\] discovered in 1905 by Albert Einstein. In natural units ($c=1$), the formula expresses the identity

  \begin{equation}
    E=m
  \end{equation}
  \end{document}
  ```

- 论文摘要示例：

  ```latex
  \documentclass{article}

  \begin{document}
  \begin{abstract}
  This is a simple paragraph at the beginning of the document. A brief introduction about the main subject.
  \end{abstract}
  \end{document}
  ```

- 换行示例：

  ```latex
  \documentclass{article}
  \begin{document}

  Now that we have written our abstract, we can begin writing our first paragraph.

  This line will start a second Paragraph.
  \end{document}
  ```

- 添加章节示例：

  ```latex
  \documentclass{article}
  \begin{document}

  \section{Introduction}
  This is the first section.Lorem ipsum dolor sit amet, consectetuer adipiscing elit.  Etiam lobortisfacilisis sem.

  \section{Second Section}
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam lobortis facilisissem.

  \subsection{First Subsection}
  Praesent imperdietmi nec ante. Donec ullamcorper, felis non sodales...

  \section*{Unnumbered Section}
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam lobortis facilisissem
  \end{document}
  ```

- 添加目录示例：

  ```latex
  \documentclass{article}
  \usepackage[utf8]{inputenc}

  \title{Sections and Chapters}
  \author{Gubert Farnsworth}
  \date{}

  \begin{document}
  \maketitle
  \tableofcontents

  \section{Introduction} This is the first section.
  \addcontentsline{toc}{section}{Unnumbered Section}
  \section*{Unnumbered Section} Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
  \section{Second Section} Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
  \end{document}
  ```

- [Overleaf 官方文档](https://www.overleaf.com/learn/latex/Main_Page)
