# 🧪 实验报告 Lab Report 模板

[![](https://img.shields.io/badge/maintainer-@Silvester-6e5773?logo=github&labelColor=2b2b2b)](https://github.com/Silverster98)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/spencerwooo/BIThesis?color=008080&logo=latex&labelColor=2b2b2b)](https://github.com/spencerwooo/BIThesis/releases/latest)

:::tip 🎈 说明
这个实验报告模板是一个通用的报告模板，不适用所有实验报告要求。实验课程未提供实验报告模板时可以使用该模板。**当前本实验报告模板只包含一个封面，欢迎大家 PR 制作更多的封面。**
:::

## 熟悉项目

:::vue
.
├── README.md
├── main.tex
├── main.pdf
├── `misc`
│    └── cover_v1.tex
└── `assets`
      └── ……
:::

- `main.tex`：tex 源文件，本实验报告模板的主体文件，所有需要添加的内容都在该文件里进行修改即可
- `main.pdf`：编译项目生成的 pdf 文件
- `./misc` 文件夹：杂项（包括实验报告封面等）
  - `cover_v1.tex`：这是一个示范性的报告封面，该文件无需修改
- `./assets` 文件夹：一些图片资源存放文件夹

## 编译方式与使用

本部分建立在你已经在本机安装成功 TexLive、MacTeX 等 LaTeX 发行版基础上。由于实验报告模板没有涉及到参考文献的使用，因此我们只需要使用 `XeLaTeX` 即可进行全文编译。

整个项目的编译工具链的顺序为：

```
-> xelatex
-> xelatex
-> xelatex
```

其中，按照 VS Code 的 LaTeX Workshop 设置格式，`xelatex` 的编译命令为：

```json
{
    "name": "xelatex",
    "command": "xelatex",
    "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-pdf",
        "-outdir=%OUTDIR%",
        "-cd",
        "%DOC%"
    ],
    "env": {}
}
```

整个编译的 recipe 为：

```json
{
    "name": "xelatex * 3",
    "tools": [
        "xelatex",
        "xelatex",
        "xelatex"
    ]
}
```
各种内容的插入请参考源文件。
