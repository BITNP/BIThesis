# 第四节 模板的下载与使用

<div id="embed-video">
  <iframe src="//player.bilibili.com/player.html?aid=925350795&bvid=BV1GT4y1V78d&cid=181709301&page=5&high_quality=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" ></iframe>
</div>

## 视频相关说明

### 初步配置

- 本项目的 [GitHub Release 页面](https://github.com/spencerwooo/BIThesis/releases/)
- [BIThesis 项目首页](https://github.com/spencerwooo/BIThesis)
- 个人信息的定义位于 `main.tex` 的 [第 69 行至第 74 行](https://github.com/spencerwooo/BIThesis/blob/master/graduation-thesis/main.tex#L69-L74)
  - `\deptName`：你所在学院
  - `\majorName`：你所就读的专业
  - `\yourName`：你的姓名
  - `\yourStudentID`：你的学号
  - `\mentorName`：你的指导教师
- 章节文件的相对路径引用：

  ```latex
  % 第一章
  \input {chapters/1_chapter1.tex}
  % 在这里添加第二章、第三章……TeX 文件的引用
  \input {chapters/2_chapter2.tex}
  \input {chapters/3_chapter3.tex}
  ```

之后，你可以分别在每个章节独立的 TeX 文件中撰写每一章节的内容。

### 后续模块

在正文之后，我们的论文还剩下：结论、参考文献、附录与致谢这四个模块。它们依次位于：

:::vue
.
├── Conclusion 结论：`misc/3_conclusion.tex`
├── Reference 参考文献：`misc/4_reference.tex`
├── Appendix 附录：`misc/5_appendix.tex`
└── Acknowledgements 致谢：`misc/6_acknowledgements.tex`
:::

复制得到的参考文献 BibTeX 类似：

```
@inproceedings {szegedy2016rethinking,
  title={Rethinking the inception architecture for computer vision},
  author={Szegedy, Christian and Vanhoucke, Vincent and Ioffe, Sergey and Shlens, Jon and Wojna, Zbigniew},
  booktitle={Proceedings of the IEEE conference on computer vision and pattern recognition},
  pages={2818--2826},
  year={2016}
}
```

- 引用这一标签为 `szegedy2016rethinking` 的参考文献：

```latex
正文，正文正文 \cite{szegedy2016rethinking} 正文正文……
```
