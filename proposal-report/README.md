# Proposal Report 开题报告 ![](https://raw.githubusercontent.com/BITNP/BIThesis/master/assets/bithesis_badge_solid.svg?sanitize=true)

本目录中包含有北京理工大学本科生毕业设计（论文）的开题报告模板，有关模板的使用方法更为详细的介绍，请参考：[BIThesis Wiki - 本科生开题报告：Proposal report](https://bithesis.bitnp.net/Guide/3-Templates/Proposal-Report)。

## 项目结构

```
.
├── main.tex：开题报告的开始文件（主文件）
├── ……
├── main.pdf：开题报告编译得到的 PDF 文件
└── misc：开题报告中所需要的杂项目录
    ├── cover.tex：开题报告封面
    ├── refs.bib：开题报告的参考文献 BibTeX 数据库
    └── reviewTableBlank.pdf：开题报告 PDF 格式的「评审表」
```

另外，文章中需要添加图片时，可以将图片直接放在根目录（比如此处的 `merge-sort-recursion-tree.png`），或者统一将图片安置在一个文件夹下，在正文里按照**相对路径**进行引用。

## 编译方式

```
-> xelatex
-> biber
-> xelatex
-> xelatex
```
