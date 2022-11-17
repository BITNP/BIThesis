# Undergradueate Proposal Report 本科生毕业设计开题报告

**请尽可能使用最新版本进行文章撰写，我们的代码仓库是：https://github.com/BITNP/BIThesis 。**

本目录中包含有北京理工大学本科生毕业设计的开题报告模板的全部内容，有关模板的使用方法更为详细的介绍，请参考：[bithesis 使用手册](./bithesis.pdf)。

## 项目结构

```sh
.
├── main.tex # 开题报告的开始文件（主文件）
├── bithesis.pdf # bithesis 使用手册
├── ……
├── main.pdf # 开题报告编译得到的 PDF 文件
└── misc # 开题报告中所需要的杂项目录
    ├── refs.bib # 开题报告的参考文献 BibTeX 数据库
    └── reviewTableBlank.pdf # 开题报告 PDF 格式的「评审表」
```

另外，文章中需要添加图片时，可以将图片直接放在根目录（比如此处的 `merge-sort-recursion-tree.png`），或者统一将图片安置在一个文件夹下，在正文里按照**相对路径**进行引用。

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

- 项目地址：https://github.com/BITNP/BIThesis
- Bug Report 与 Feature Request：https://github.com/BITNP/BIThesis/issues
- QQ 交流群：737548118

## 排版参考

- 计算机学院《开题报告》
