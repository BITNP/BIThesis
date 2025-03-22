# Graduate Thesis 研究生学位论文

**请尽可能使用最新版本[^1]撰写文章，我们的代码仓库是：https://github.com/BITNP/BIThesis 。**

此文件夹中包含了北京理工大学研究生学位论文的全部内容，有关模板的使用方法更为详细的介绍，请参考：[bithesis 使用手册][manual]。

> [!WARNING]
> 重要提示：建议 macOS 用户更新到 [TeX Live / MacTeX 2023 或更新版本](https://www.tug.org/mactex/mactex-download.html)，否则[参考文献等可能会被错误查重](https://bithesis.bitnp.net/faq/false-duplicate.html)。

## 特性

- 符合学校对毕业论文的要求。
- 内容和样式分离，所有的配置可以集中管理。
- 一键导出盲审格式论文。
- 封面信息的下划线自动调整长度。
- 由社区驱动，在积极地吸纳新功能、修复现有问题。


## 项目结构

```sh
.
├── README.md # 相关信息
├── bithesis.pdf # bithesis 使用手册
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
    ├── main.bib # 参考文献
    └── pub.bib # 个人成果清单
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

- 《北京理工大学研究生学位毕业论文排版规范》

[^1]: 关于如何升级模板的版本，请参考[手册][manual]中「版本号与升级」这一章节内容。

[manual]: ./bithesis.pdf
