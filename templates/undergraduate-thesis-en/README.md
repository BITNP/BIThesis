# Undergraduate Thesis (English) 本科生毕业设计论文（全英文专业）

**请尽可能使用最新版本[^1]撰写文章，我们的代码仓库是：https://github.com/BITNP/BIThesis 。**

此文件夹中包含了北京理工大学本科生毕业设计（论文）外文翻译的全部内容，有关模板的使用方法更为详细的介绍，请参考：[bithesis 使用手册][manual]。

> :warning: 重要提示：建议 macOS 用户使用最新版的 [texlive 2023](https://www.tug.org/mactex/mactex-download.html)，否则可能会遇到参考文献被查重的情况。详见 https://github.com/BITNP/BIThesis/issues/326


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

- 《本科-全英文 Thesis Format 2022》
- 《本科-全英文 Thesis Sample 2021 with signature》

[^1]: 关于如何升级模板的版本，请参考[手册][manual]中「版本号与升级」这一章节内容。

[manual]: ./bithesis.pdf
