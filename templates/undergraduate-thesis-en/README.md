# Undergraduate Thesis (English) 本科生毕业设计论文（全英文专业）

**请尽可能使用最新版本[^1]撰写文章，我们的代码仓库是：https://github.com/BITNP/BIThesis 。**

此文件夹中包含了北京理工大学本科生毕业设计（论文）外文翻译的全部内容，有关模板的使用方法更为详细的介绍，请参考：[bithesis 使用手册][manual]。

> [!WARNING]
> 重要提示：建议 macOS 用户更新到 [TeX Live / MacTeX 2023 或更新版本](https://www.tug.org/mactex/mactex-download.html)，否则[参考文献等可能会被错误查重](https://bithesis.bitnp.net/faq/false-duplicate.html)。

## BITSetup 学院变体

### 英文封面隐藏中文标题

默认封面虽是英文，但也有中文标题。如果您想隐藏封面的中文标题，请编辑`main.tex`，找到`\BITSetup{…}`，设置`cover/addTitleZh = false`：

```latex
\BITSetup{
  cover = {
    …
    % date = {November 5, 1955},
    addTitleZh = false,
  },
  …
}
```

另外注意，即使封面隐藏了中文标题，中文摘要也有，故仍需在`info/title`填写中文标题信息。

### 中文封面

默认封面是英文，有些学院要求采用中文。这时请编辑`main.tex`，找到`\BITSetup{…}`，替换为以下内容。此外注意中文封面比英文封面多班号信息（`info/class`）。

```latex
\BITSetup{
  % 以下三项切换封面为中文。
  cover/prefer-zh = {true},
  const/info/major = {专\qquad 业},
  style/headline = {本科生毕业设计（论文）},
  %
  cover = {
    % 封面需要「北京理工大学」字样图片，如无必要请勿修改该项。
    headerImage = images/header.png,
    % 封面标题需要“华文细黑”，如无必要请勿修改该项。
    xiheiFont = STXIHEI.TTF,
    % 可用以下参数自定义封面日期。
    % date = 1955年11月,
  },
  info = {
    % 想要删除某项封面信息，直接删除该项即可。
    % 想要让某项封面信息留空（但是保留下划线），请传入空白符组成的字符串，如"{~}"。
    % 如需要换行，则用 “\\” 符号分割。
    title = 北京理工大学本科生毕业设计（论文）题目,
    titleEn = {The Subject of Undergraduate Graduation Project (Thesis) of Beijing Institute of Technology},
    school = 计算机学院,
    major = 计算机科学与技术,
    class = 0561xxxx,
    author = 惠计算,
    studentId = 11xxxxxxxx,
    supervisor = 张哈希,
    keywords = {北京理工大学；本科生；毕业设计（论文）——请在“main.tex”开头设置},
    keywordsEn = {BIT; Undergraduate; Graduation Project (Thesis)},
    % 如果你的毕设为校外毕设，请将下面这一行语句解除注释（删除第一个百分号字符）并填写你的校外毕设导师名字
    % externalSupervisor = 左偏树,
  },
  style = {
    % 页眉若要改为中文，请解除下一行的注释。
    % head = {北京理工大学本科生毕业设计（论文）},
    %
    % 开启该选项后，将用 Times New Roman 的开源字体 TeX Gyre Termes 作为正文字体。
    % 这个选项适用于以下情况：
    % 1. 不想在系统中安装 Times New Roman。
    % 2. 在 Linux/macOS 下遇到 `\textsc` 无法正常显示的问题。
    % betterTimesNewRoman = true,
  },
  misc = {
    % 微调表格行间距
    tabularRowSeparation = 1.25,
  },
}
```

### 管理与经济学院

经管学院还有些特殊要求，请：

1. 编辑`main.tex`，按[上文](#中文封面)替换`\BITSetup{…}`。

2. 在`\BITSetup{…}`的中，解除`style/head`的注释。

3. 在`\BITSetup{…}`结尾，继续添加几项设置：

    ```latex
    \BITSetup{
      …
      misc = {…},
      %
      % 经管学院特殊要求：
      %
      % 调换中英文标题顺序
      cover/reverse-titles = {true},
      % 更改标题
      TOC/title = {Contents}, % 删掉“Table of ”
      appendices/title = {Appendix}, % 将“Appendices”改为单数
      appendices/TOCTitle = {Appendix}, % 将“Appendices”改为单数
    }
    ```

4. 编辑`chapters/0_abstract.tex`，调换`abstract`、`abstractEn`环境的顺序。

    ```latex
    % 先英文摘要
    \begin{abstractEn}
      …
    \end{abstractEn}

    % 再中文摘要
    \begin{abstract}
      …
    \end{abstract}
    ```

此外，经管学院要求《原创性声明》《关于使用授权的声明》也是中文（而非双语）。

- 盲审版要求删去声明，故不用考虑。
- 答辩版、最终存档版要求声明有签字，可让 LaTeX 导入 PDF。到时请参考`main.tex`中“原创性声明”相关注释。

## 特性

- 符合学校对毕业论文的要求。
- 内容和样式分离，所有的配置可以集中管理。
- 一键导出盲审格式论文。
- 封面信息的下划线自动调整长度。
- 由社区驱动，在积极地吸纳新功能、修复现有问题。

## 项目结构

```sh
.
├── README.md
├── bithesis.pdf # bithesis 使用手册
├── chapters
│   ├── 0_abstract.tex
│   ├── 1_chapter1.tex
│   ├── 2_chapter2.tex
│   └── 3_chapter3.tex
├── images
│   └── header.png
├── main.pdf
├── main.tex
└── misc
    ├── 1_conclusion.tex
    ├── 2_reference.tex
    ├── 3_appendices.tex
    ├── 4_acknowledgements.tex
    └── ref.bib
```

## 编译方式

方式一（推荐）：
```
latexmk
```

方式二：
```
-> xelatex
-> biber
-> xelatex
-> xelatex
```

- *不推荐使用 pdflatex 进行编译*

## 其他链接

- BIThesis wiki：https://bithesis.bitnp.net
- 项目地址：https://github.com/BITNP/BIThesis
- Bug Report 与 Feature Request：https://github.com/BITNP/BIThesis/issues
- QQ 交流群：737548118

## 排版参考

- 《北京理工大学本科生毕业设计（论文）书写规范及打印装订要求》
- 《北京理工大学本科生毕业设计（论文）模板》
- 《北京理工大学管理与经济学院本科生毕业设计（论文）模板（英文论文）》
- 计算机学院《全英班论文封面》
- 《本科-全英文 Thesis Format 2022》
- 《本科-全英文 Thesis Sample 2021 with signature》

此外还参考了信息与电子、集成电路与电子、机电等学院的通知。

[^1]: 关于如何升级模板的版本，请参考[手册][manual]中「版本号与升级」这一章节内容。

[manual]: ./bithesis.pdf
