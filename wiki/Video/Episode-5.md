# 第五节 格式转化

<div id="embed-video">
  <iframe src="//player.bilibili.com/player.html?aid=925350795&bvid=BV1GT4y1V78d&cid=181709301&page=6&high_quality=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" ></iframe>
</div>

## 视频相关说明

### 安装

Pandoc 详细的安装说明：[Installing pandoc](https://pandoc.org/installing.html).

- Windows 上你可以直接在 [Pandoc 的 GitHub Release 页面](https://github.com/jgm/pandoc/releases/latest) 下载 Windows MSI 安装文件手动安装。
- 在 macOS 上你可以使用 Homebrew 包管理工具安装 pandoc：

  ```bash
  brew install pandoc
  ```

- 在 Linux 上你可以使用你所用发行版的包管理工具安装 pandoc，比如：

  ```bash
  sudo apt install pandoc
  ```

终端中检测 Pandoc 的安装：

```bash
pandoc --version
```

### 使用

- 朴素格式转化：

  ```bash
  # 命令格式如下：
  pandoc {LaTeX 文档文件} -o {输出 Word 文档}
  # 比如：
  pandoc main.tex -o main.docx
  ```

- 含有目标模板 Word 文档的格式转换：

  ```bash
  # 命令格式如下：
  pandoc {LaTeX 文档文件} --reference-doc={参考模板 Word 文档} -o {输出 Word 文档}
  # 比如：
  pandoc main.tex --reference-doc=template.docx -o main.docx
  ```

- 含有参考文献文档的格式转换：

  ```bash
  pandoc main.tex --bibliography=refs.bib --reference-doc=template.docx -o main.docx
  ```
