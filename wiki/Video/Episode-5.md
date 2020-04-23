# 第五节 格式转化

* Pandoc 详细的安装说明：Installing pandoc](https://pandoc.org/installing.html).

- Windows 上你可以直接在 [Pandoc 的 GitHub Release 页面](https://github.com/jgm/pandoc/releases/latest) 下载 Windows MSI 安装文件手动安装。

- 在 macOS 上你可以使用 Homebrew 包管理工具安装 pandoc：

  ```
  brew install pandoc
  ```

- 在 Linux 上你可以使用你所用发行版的包管理工具安装 pandoc，比如：

  ```
  sudo apt install pandoc
  ```

* 终端中检测Pandoc的安装：

```
pandoc --version
```

* 朴素格式转化

```
pandoc {LaTeX 文档文件} -o {输出 Word 文档}
```

```
pandoc main.tex -o main.docx
```

* 含有目标模板 Word 文档的格式转换

```
pandoc {LaTeX 文档文件} --reference-doc={参考模板 Word 文档} -o {输出 Word 文档}
```

```
pandoc main.tex --reference-doc=template.docx -o main.docx
```

* 含有参考文献文档的格式转换

```
pandoc main.tex --bibliography=refs.bib --reference-doc=template.docx -o main.docx
```
