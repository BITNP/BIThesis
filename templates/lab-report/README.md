# 北京理工大学课程实验报告 ![](https://raw.githubusercontent.com/BITNP/BIThesis/main/assets/bithesis_badge_solid.svg?sanitize=true)

本目录中包含有北京理工大学课程实验报告模板，有关模板的使用方法更为详细的介绍，请参考：[BIThesis Wiki - 本科生实验报告：Lab report](https://bithesis.bitnp.net/guide/3-templates/lab-report)。

## 项目结构

```
.
├── README.md
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
