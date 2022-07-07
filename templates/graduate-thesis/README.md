# Gruaduate Thesis 研究生学位论文![](https://raw.githubusercontent.com/BITNP/BIThesis/main/assets/bithesis_badge_solid.svg?sanitize=true)

<h6>🚩 注意：目前版本的毕业设计论文已经按照最新《北京理工大学研究生学位毕业论文排版规范》进行了设计与排版的更新。</h6>

 <!-- TODO -->
此文件夹中包含了北京理工大学研究生学位论文的全部内容，有关模板的使用方法更为详细的介绍，请参考：[BIThesis Wiki - 本科生毕业论文：Graduation thesis](https://bithesis.bitnp.net/guide/3-templates/final-graduation-thesis)。

## 项目结构

```
.
├── README.md
├── chapters
│   ├── abstract.tex
│   ├── chapter1.tex
│   └── chapter2.tex
├── figures
│   └── figure1.png
├── main.pdf
├── main.tex
├── misc
│   ├── 0_symbols.tex
│   ├── 1_conclusion.tex
│   ├── 2_reference.tex
│   ├── 3_appendices.tex
│   ├── 4_pub.tex
│   ├── 5_acknowledgements.tex
│   └── 6_resume.tex
└── reference 
    ├── main.bib
    └── pub.bib
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
