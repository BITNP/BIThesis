# Lab Report 北京理工大学课程实验报告

**请尽可能使用最新版本进行文章撰写，我们的代码仓库是：https://github.com/BITNP/BIThesis 。**

本目录中包含有北京理工大学课程实验报告模板的全部内容，有关模板的使用方法更为详细的介绍，请参考：[bithesis 使用手册](./bithesis.pdf)。


## 特性

- 内容和样式分离，所有的配置可以集中管理。
- 自适应的封面信息下划线长度。
- 由社区驱动，在积极地吸纳新功能、修复现有问题。

## 项目结构

```sh
.
├── README.md # 相关信息
├── bithesis.pdf # bithesis 使用手册
├── main.tex
├── main.pdf
├── misc
│   └── refs.bib
└── assets
    └── ……
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

- 项目地址：https://github.com/BITNP/BIThesis
- Bug report 与 Feature Request：https://github.com/BITNP/BIThesis/issues
- QQ 交流群：737548118

