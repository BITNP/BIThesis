# Graduation Thesis 毕业设计论文（全英文专业）![](https://raw.githubusercontent.com/BITNP/BIThesis/main/assets/bithesis_badge_solid.svg?sanitize=true)

<h6>🚩 注意：目前版本的毕业设计论文已经按照北京理工大学毕业论文模板（全英文 2022）进行了设计与排版的更新。</h6>

有关模板的使用方法更为详细的介绍，请参考：
[BIThesis Wiki - 本科生毕业论文：Graduation thesis](https://bithesis.bitnp.net/guide/3-templates/final-graduation-thesis)。

## 项目结构

```
.
├── README.md
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
