<div align="center">
  <img src="./assets/bithesis_icon.svg" alt="BIThesis Icon">

📖 _非官方本科生毕业设计毕业论文 LaTeX 模板（以及更多）_

![BIThesis](./assets/bithesis_badge_solid.svg)
[![English version](assets/english.svg)](./README-en.md)
[![Latexmk](https://badgen.net/badge/compiler/Latexmk?color=blue&labelColor=2b2b2b)](https://mg.readthedocs.io/latexmk.html)
[![License](https://badgen.net/github/license/BITNP/BIThesis?color=008080&labelColor=2b2b2b)](./LICENSE)
[![Join on Slack](https://img.shields.io/badge/Slack%20Community-BIThesis-black?logo=slack&style=social&logoColor=2eb67d)](https://join.slack.com/t/bithesis/shared_invite/zt-epmzkyk0-fJRsUS36AlwMNB2AI_Q~Vw)

</div>

<h2>欢迎</h2>

BIThesis 是针对北京理工大学本科同学毕业设计、毕业论文制作的一个非官方的 LaTeX 模板，BIThesis 同时也包括其他本科学习中涉及到的文献综述、实验报告等的 LaTeX 模板。

**我们正在对项目持续更新！目前，你完全可以使用现有的版本开始你的毕业设计开题报告的写作；不过与此同时，我们也在持续推进代码的升级和更新（主要是不影响使用的底层逻辑）。更多开发计划请访问我们的 [Roadmap](https://github.com/BITNP/BIThesis/projects)。想帮助这个项目持续前进？参见我们的[贡献者指南](./contributing-zh.md)**

> 本项目获得了 [北京理工大学教务部](http://jwc.bit.edu.cn/)、[北京理工大学计算机学院](http://cs.bit.edu.cn/) 的认可、背书与大力支持。详见：[致谢 - 官方赞助](https://bithesis.bitnp.net/Guide/5-Acknowledgements/Acknowledgements.html#%E5%AE%98%E6%96%B9%E8%B5%9E%E5%8A%A9-official-sponsors)。

<h2>Slack 社区</h2>

> 订阅更新，询问问题，提出需求……来参加 Slack 上面的北理 BIThesis 官方社区！

[![Join on Slack](./assets/slack.svg)](https://join.slack.com/t/bithesis/shared_invite/zt-epmzkyk0-fJRsUS36AlwMNB2AI_Q~Vw)

<h2>内容</h2>

- [项目内容](#%e9%a1%b9%e7%9b%ae%e5%86%85%e5%ae%b9)
- [如何使用 BIThesis](#%e5%a6%82%e4%bd%95%e4%bd%bf%e7%94%a8-bithesis)
  - [详细的在线参考文档](#%e8%af%a6%e7%bb%86%e7%9a%84%e5%9c%a8%e7%ba%bf%e5%8f%82%e8%80%83%e6%96%87%e6%a1%a3)
  - [PDF 使用手册](#pdf-%e4%bd%bf%e7%94%a8%e6%89%8b%e5%86%8c)
  - [在线视频教程](#%e5%9c%a8%e7%ba%bf%e8%a7%86%e9%a2%91%e6%95%99%e7%a8%8b)
- [贡献者指南](#%e8%b4%a1%e7%8c%ae%e8%80%85%e6%8c%87%e5%8d%97)
- [贡献者](#%e8%b4%a1%e7%8c%ae%e8%80%85)
- [相关项目](#%e7%9b%b8%e5%85%b3%e9%a1%b9%e7%9b%ae)
- [发布状态](#%e5%8f%91%e5%b8%83%e7%8a%b6%e6%80%81)

## 项目内容

BIThesis 为各位在北京理工大学就读的本科同学提供了基于北京理工大学计算机学院给出的「北京理工大学计算机学院本科生毕业论文：开题报告」与北京理工大学教务部提供的「北京理工大学本科生毕业设计：论文模板」的 LaTeX 模板等。**借助于 BIThesis 的 LaTeX 模板，你可以在保证论文格式整齐、完美、符合要求的前提下，专注于学术研究、项目实现，从而顺利完成你的学术项目。**

| 模板                                        | 预览                                                                                            | 特性                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | 维护人                                                                  |
| :------------------------------------------ | :---------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------                          |
| **[开题报告](./proposal-report)**<br>       | <img src="https://i.loli.net/2020/02/05/HfZUaGqWSjrATbe.png" width="300px" alt="proposal" />    | <ul><li>毕业设计开题报告</li><li>毕设第一部分内容</li><li>包括封面（不可编辑）和评审表</li><li>包括参考文献和相关样式</li><li>[![open in overleaf](https://img.shields.io/badge/open%20in-Overleaf-46a247?logo=overleaf&logoColor=white&labelColor=2b2b2b)](https://www.overleaf.com/latex/templates/bei-jing-li-gong-da-xue-ben-ke-sheng-bi-ye-lun-wen-kai-ti-bao-gao-mo-ban/dgqdjptfqtrn)</li></ul>                                                                                               | [@北京理工大学网络开拓者协会 BIThesis 工作组](https://github.com/BITNP) |
| **[毕业设计论文](./graduation-thesis)**<br> | <img src="https://i.loli.net/2020/03/01/hISQql1W6oFgKsC.png" width="300px" alt="grad_thesis" /> | <ul><li>**毕业设计论文模板**</li><li>包括封面，摘要，参考文献和附录等支持</li><li>包括公式，表格和图片等支持</li><li>按 GBT7714-2015 规范编排的书目</li><li>符合北京理工大学毕业设计论文 2016 级（2020 届）版本的格式要求。</li><li>[![open in overleaf](https://img.shields.io/badge/open%20in-Overleaf-46a247?logo=overleaf&logoColor=white&labelColor=2b2b2b)](https://www.overleaf.com/latex/templates/bei-jing-li-gong-da-xue-ben-ke-sheng-bi-ye-she-ji-lun-wen-mo-ban/mwhjgqsncxxg)</li></ul> | [@北京理工大学网络开拓者协会 BIThesis 工作组](https://github.com/BITNP) |
| **[实验报告](./lab-report)**<br>            | <img src="https://i.loli.net/2020/03/08/txzGcKv9YSel3IX.png" width="300px" alt="lab_report" />  | <ul><li>基本实验报告模板</li><li>包括封面，BIT logo 和资源文件夹</li></ul>                                                                                                                                                                                                                                                                                                                                                                                                                          | [@北京理工大学网络开拓者协会 BIThesis 工作组](https://github.com/BITNP) |

## 如何使用 BIThesis

### 详细的在线参考文档

**有关如何安装 Latex、编译 BIThesis 和使用 BIThesis 模板中的单个模板的全面指南，请参阅 BIThesis 的 Wiki。👇**

[![BIThesis Wiki](https://img.shields.io/badge/BIThesis-Wiki-009944?logo=wikipedia&labelColor=2b2b2b&style=for-the-badge)](https://bithesis.bitnp.net/)

具体的，有关如何使用和编译单个模板的详细指南，请访问：

- [BIThesis Wiki: 开题报告](https://bithesis.bitnp.net/Guide/3-Templates/Proposal-Report.html)
- [BIThesis Wiki: 毕业设计论文](https://bithesis.bitnp.net/Guide/3-Templates/Final-Graduation-Thesis.html)
- [BIThesis Wiki: 实验报告](https://bithesis.bitnp.net/Guide/3-Templates/Lab-Report.html)

### PDF 使用手册

另外，我们也提供一个撰写详细的 PDF 使用手册。你可以在这里下载 BIThesis 手册的 PDF 版本：[`bithesis-documentation.pdf`](https://github.com/BITNP/BIThesis/releases/latest)

### 在线视频教程

你也可以在这里观看在线的视频教程：

- 哔哩哔哩弹幕网：[BIThesis —— 教你优雅地撰写论文 | LaTeX 毕设模板系列教程](https://www.bilibili.com/video/BV1GT4y1V78d/)
- BIThesis 文档视频部分（包含有一些视频中提到的代码）：[BIThesis - Videos](https://bithesis.bitnp.net/Video/)

## 贡献者指南

详情请查看[贡献者指南](./contributing-zh.md)。

## 贡献者

> 本项目的存在离不开以下所有贡献者的辛勤贡献。更多信息请访问：[BIThesis - 致谢](https://bithesis.bitnp.net/Guide/5-Acknowledgements/Acknowledgements.html)。

[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/0)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/0)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/1)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/1)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/2)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/2)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/3)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/3)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/4)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/4)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/5)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/5)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/6)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/6)[![](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/images/7)](https://sourcerer.io/fame/spencerwooo/spencerwooo/BIThesis/links/7)

## 相关项目

- [北京理工大学硕士（博士）学位论文 LaTeX 模板](https://github.com/BIT-thesis/LaTeX-template)
- [fduthesis（复旦大学论文模板）](https://github.com/stone-zeng/fduthesis)
- [上海交通大学 XeLaTeX 学位论文及课程论文模板](https://github.com/sjtug/SJTUThesis)
- ……

## 发布状态

| CI             | Build status                                                                                                                                                                              |
| :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GitHub Release | ![GitHub Release](https://github.com/BITNP/BIThesis/workflows/Release/badge.svg?branch=master)                                                                                            |
| Netlify Deploy | [![Netlify Status](https://api.netlify.com/api/v1/badges/81f7b49b-59a1-46bc-ba52-02f8be71d247/deploy-status)](https://app.netlify.com/sites/vigorous-hoover-a697eb/deploys)               |

<!-- ## 免责声明

本项目尚未经由 _北京理工大学教务部_ 确认（但即将会被官方授权）。使用此模板的风险由你自己承担。笔芯 (´▽`ʃ♡ƪ) -->

---

📖 **BIThesis** ©BITNP/BIThesis. Released under the [LaTeX Project Public License](LICENSE).

Authored by Spencer Woo. Maintained with help from [contributors](https://github.com/BITNP/BIThesis/graphs/contributors).
