<!-- This file should not be packed into bithesis.zip. -->

<div align="center">
  <img src="./assets/bithesis_icon.svg" alt="BIThesis Icon">

📖 [_非官方本科生毕业设计论文/研究生学位论文 LaTeX 模板（以及更多）_](https://bithesis.bitnp.net)

![GitHub all releases](https://img.shields.io/github/downloads/BITNP/BIThesis/total)
[![English version](./assets/english.svg)](./README-bithesis.md)
[![Latexmk](https://badgen.net/badge/compiler/latexmk/blue)](https://mg.readthedocs.io/latexmk.html)
[![License](https://badgen.net/github/license/BITNP/BIThesis?color=008080&labelColor=2b2b2b)](./LICENSE)
[![Join on QQ Chat Group](https://img.shields.io/badge/QQ%E7%BE%A4-737548118-green)](https://jq.qq.com/?_wv=1027&k=KYDrmS5z)
[![Github Checks](https://badgen.net/github/checks/BITNP/BIThesis)](https://github.com/BITNP/BIThesis/actions)
[![CTAN Version](https://badgen.net/ctan/v/bithesis)](https://www.ctan.org/pkg/bithesis)

**有关如何安装 $LaTeX$、编译 BIThesis 模板的全面指南，请参阅 BIThesis 的 Wiki。👇**

[![BIThesis Wiki](https://img.shields.io/badge/BIThesis-Wiki-009944?logo=wikipedia&labelColor=2b2b2b&style=for-the-badge)](https://bithesis.bitnp.net/)

**有关 BIThesis 提供的配置选项和命令，请参阅 BIThesis 的模板使用手册。👇**

[![bithesis Documentation](https://img.shields.io/badge/bithesis-Documentation-008080?logo=LaTeX&labelColor=2b2b2b&style=for-the-badge)](http://mirrors.ctan.org/macros/unicodetex/latex/bithesis/bithesis.pdf)

_（此文档已被包含在 [ Releases ][releases] 的文件中）_

</div>

<div align="center">

:raised_hand: **BIThesis 正在招募项目维护者！** :raised_hand: 如果你对 $LaTeX$ 有使用经验、有兴趣进一步学习、有 Git 使用经验、并且希望帮助这个项目变得更好的话。欢迎与 [Feng Kaiyu](https://github.com/fky2015) 取得联系，加入我们。

</div>

<h2>欢迎</h2>

BIThesis 是针对北京理工大学本科生毕业毕业论文、研究生学位论文的一个非官方的 $LaTeX$ 模板，BIThesis 同时也包括其他本科学习中涉及到的文献综述、实验报告等的 $LaTeX$ 模板。

> 本项目获得了 [北京理工大学教务部](http://jwc.bit.edu.cn/)、[北京理工大学计算机学院](http://cs.bit.edu.cn/) 的认可、背书与大力支持。详见：[致谢 - 官方赞助](https://bithesis.bitnp.net/Guide/5-Acknowledgements/Acknowledgements.html#%E5%AE%98%E6%96%B9%E8%B5%9E%E5%8A%A9-official-sponsors)。

> **研究生模板暂未与官方进行沟通。但是我们的代码从[BIT-thesis](https://github.com/BIT-thesis/LaTeX-template)迁移而来，而它曾得到了研究生院和北京理工大学学生事务中心的支持。**

> __我们将在 2022-2023 学年与官方进行研究生模板的沟通。__

<h2>特性</h2>

- 符合学校对毕业论文的要求。
- 内容和样式分离，所有的配置可以集中管理。
- 一键导出盲审格式论文。
- 自适应的封面信息下划线长度。
- 由社区驱动，在积极地吸纳新功能、修复现有问题。

<h2>交流社区</h2>

_订阅更新，询问问题，提出需求……请加入北理 BIThesis 官方社区！_

- 最新更新：[Release](https://github.com/BITNP/BIThesis/releases)
- 新功能请求与问题报告：[Issues](https://github.com/BITNP/BIThesis/issues)

如果你更习惯聊天群，也可以：

[![Join on QQ Chat Group](https://img.shields.io/badge/QQ%E7%BE%A4-737548118-green)](https://jq.qq.com/?_wv=1027&k=KYDrmS5z)


<h2>内容</h2>

- [项目内容](#项目内容)
- [开发者指南](#开发者指南)
- [贡献者指南](#贡献者指南)
- [贡献者](#贡献者)
- [相关项目](#相关项目)
- [发布状态](#发布状态)

## 项目内容

详见[在线文档 - BIThesis 都包含哪些模板？](https://bithesis.bitnp.net/#q-bithesis-%E9%83%BD%E5%8C%85%E5%90%AB%E5%93%AA%E4%BA%9B%E6%A8%A1%E6%9D%BF)

## 使用方法

1. 安装或升级最新的 LaTeX 套装，详见[wiki](https://bithesis.bitnp.net/Guide/1-Intro/First-things-first.html)。
2. 根据需要，下载[最新的 Releases](https://github.com/BITNP/BIThesis/releases/latest)。
3. 开始撰写。

>  或者使用 [Overleaf 模板](https://bithesis.bitnp.net/#q-bithesis-%E9%83%BD%E5%8C%85%E5%90%AB%E5%93%AA%E4%BA%9B%E6%A8%A1%E6%9D%BF)。

## 开发者指南

**以下内容供开发者使用，如果你是普通用户的话，请参考我们的[在线文档](https://bithesis.bitnp.net) 。**

详见[开发者指南](./DEVELOPMENT.md)

## 参考规范

- 本科生
  - [北京理工大学教务部 - 关于2022届本科生毕业设计（论文）工作安排的通知](https://jwc.bit.edu.cn/sjjx/bysj/e06605ca60ec480d80bd6497560f70f7.htm) 
  - 《本科-全英文 Thesis Format 2022》
  - 《本科-全英文 Thesis Sample 2021 with signature》
- 研究生
  - [北京理工大学研究生院 - 研究生学位论文模版](https://grd.bit.edu.cn/xwgz/xwgz2/wjxz_xwgz/b119746.htm) 
  - 《北京理工大学研究生学位论文撰写规范》

## 贡献者指南

详情请查看[贡献者指南](./contributing-zh.md)。

## 贡献者

参见 [Github Contributors](https://github.com/BITNP/BIThesis/graphs/contributors) 与 [BIThesis - 致谢](https://bithesis.bitnp.net/Guide/5-Acknowledgements/Acknowledgements.html)。

## 特别感谢

- [ biblatex-gb7714-2015 ](https://github.com/hushidong/biblatex-gb7714-2015)：提供了易用的国标引用格式和细心指导。
- [北京理工大学硕士（博士）学位论文 $\LaTeX$ 模板](https://github.com/BIT-thesis/LaTeX-template)：提供了研究生论文样式的代码参考。
- [fduthesis（复旦大学论文模板）](https://github.com/stone-zeng/fduthesis)：提供了包编写的最佳实践。
- [ThuThesis（清华大学论文模板）](https://github.com/tuna/thuthesis)：提供了 dtx 样式的参考。

以及所有参与本项目的开发者、贡献者与使用者。谢谢你们！

## 发布状态

| CI             | Build status                                                                                                                                                                              |
| :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GitHub Release | [![GitHub release (latest by date)](https://img.shields.io/github/v/release/BITNP/BIThesis?style=flat-square)][releases]                                |
| Vercel Deploy | [![Vercel Status](https://img.shields.io/github/deployments/fky2015/BIThesis-wiki/production?label=vercel&style=flat-square)](https://vercel.com/fkynjyq/bithesis-wiki/deployments)               |


---

📖 **BIThesis** ©BITNP/BIThesis. Released under the [LaTeX Project Public License](LICENSE).

Maintained with help from [contributors](https://github.com/BITNP/BIThesis/graphs/contributors).

---

[releases]: https://github.com/BITNP/BIThesis/releases/latest
