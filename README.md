<div align="center">
  <img src="./assets/bithesis_icon.svg" alt="BIThesis Icon">

📖 [_非官方本科生毕业设计毕业论文 LaTeX 模板（以及更多）_](https://bithesis.bitnp.net)

![GitHub all releases](https://img.shields.io/github/downloads/BITNP/BIThesis/total)
[![English version](./assets/english.svg)](./README-en.md)
[![Latexmk](https://badgen.net/badge/compiler/Latexmk?color=blue&labelColor=2b2b2b)](https://mg.readthedocs.io/latexmk.html)
[![License](https://badgen.net/github/license/BITNP/BIThesis?color=008080&labelColor=2b2b2b)](./LICENSE)
[![Join on QQ Chat Group](https://img.shields.io/badge/QQ%E7%BE%A4-737548118-green)](https://jq.qq.com/?_wv=1027&k=KYDrmS5z)

</div>

<div align="center">

:raised_hand: **BIThesis 正在招募项目维护者！** :raised_hand: 如果你对 LaTeX 有使用经验、有兴趣进一步学习、有 Git 使用经验、并且希望帮助这个项目变得更好的话。欢迎与 [Feng Kaiyu](https://github.com/fky2015) 取得联系，加入我们。

</div>

<h2>欢迎</h2>

BIThesis 是针对北京理工大学本科同学毕业设计、毕业论文制作的一个非官方的 LaTeX 模板，BIThesis 同时也包括其他本科学习中涉及到的文献综述、实验报告等的 LaTeX 模板。

> 本项目获得了 [北京理工大学教务部](http://jwc.bit.edu.cn/)、[北京理工大学计算机学院](http://cs.bit.edu.cn/) 的认可、背书与大力支持。详见：[致谢 - 官方赞助](https://bithesis.bitnp.net/Guide/5-Acknowledgements/Acknowledgements.html#%E5%AE%98%E6%96%B9%E8%B5%9E%E5%8A%A9-official-sponsors)。

<h2>交流社区</h2>

> 订阅更新，询问问题，提出需求……请加入北理 BIThesis 官方社区！

[![Join on QQ Chat Group](https://img.shields.io/badge/QQ%E7%BE%A4-737548118-green)](https://jq.qq.com/?_wv=1027&k=KYDrmS5z)


<h2>内容</h2>

- [开发者指南](#开发者指南)
- [贡献者指南](#%e8%b4%a1%e7%8c%ae%e8%80%85%e6%8c%87%e5%8d%97)
- [贡献者](#%e8%b4%a1%e7%8c%ae%e8%80%85)
- [相关项目](#%e7%9b%b8%e5%85%b3%e9%a1%b9%e7%9b%ae)
- [发布状态](#%e5%8f%91%e5%b8%83%e7%8a%b6%e6%80%81)



## 开发者指南

> 以下内容供宏集的开发者使用，如果你是普通用户的话，请参考我们的[在线文档](https://bithesis.bitnp.net) 。

### 生成 .cls 文件

```Bash
make cls
```

### 生成宏包手册

```Bash
make doc
```

### 与 scaffold 联调开发

将 `BITNP/BIThesis` 与 `BITNP/BIThesis-scaffold` 放在同一级目录下，
然后进入 `BIThesis` 目录。

```Bash
# 请首先确保 entr 正确安装
ls bithesis.dtx | entr -s 'yes -y y | make doc && make copy'
```

## 贡献者指南

详情请查看[贡献者指南](./contributing-zh.md)。

## 贡献者

参见[Github Contributors](https://github.com/BITNP/BIThesis/graphs/contributors) 与 [BIThesis - 致谢](https://bithesis.bitnp.net/Guide/5-Acknowledgements/Acknowledgements.html)。

## 相关项目

- [北京理工大学硕士（博士）学位论文 LaTeX 模板](https://github.com/BIT-thesis/LaTeX-template)
- [fduthesis（复旦大学论文模板）](https://github.com/stone-zeng/fduthesis)
- [上海交通大学 XeLaTeX 学位论文及课程论文模板](https://github.com/sjtug/SJTUThesis)
- ……

## 发布状态

| CI             | Build status                                                                                                                                                                              |
| :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| GitHub Release | [![GitHub release (latest by date)](https://img.shields.io/github/v/release/BITNP/BIThesis?style=flat-square)](https://github.com/BITNP/BIThesis/releases)                                |
| Vercel Deploy | [![Vercel Status](https://img.shields.io/github/deployments/fky2015/BIThesis-wiki/production?label=vercel&style=flat-square)](https://vercel.com/fkynjyq/bithesis-wiki/deployments)               |


---

📖 **BIThesis** ©BITNP/BIThesis. Released under the [LaTeX Project Public License](LICENSE).

Maintained with help from [contributors](https://github.com/BITNP/BIThesis/graphs/contributors).
