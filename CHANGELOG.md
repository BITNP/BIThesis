# Changelog

Acronyms:
- LB: lab-report (实验报告模板)
- GT: graduate-thesis (研究生学位论文模板)
- PT: paper-translation (本科生毕业设计外文翻译模板)
- PS: presentation-slide (演讲幻灯片模板)
- RR: reading-report (读书报告模板)
- UTE: undergraduate-thesis-en (本科生毕业设计论文模板（全英文专业）)
- UT: undergraduate-thesis (本科生毕业设计论文模板)

**Bolded text highlights its importance.**

## [3.7.9] - 2024-05-30

### <!-- 1 -->🐛 Bug Fixes

- Remove redundant `currentpdfbookmark` for English bachelor thesis ([95ef418](https://github.com/BITNP/BIThesis/commit/95ef418e8d3452d920c6b3aa3a3479c036803e54)) by @CreeperLKF
- Toc entry in bookmarks should not point to the tail of toc in Chinese bachelor thesis ([9e1f0e4](https://github.com/BITNP/BIThesis/commit/9e1f0e4a2a16e4b048fcf814d1c49da73d2a9c09)) by @CreeperLKF in [#522](https://github.com/BITNP/BIThesis/pull/522)

### <!-- 3 -->📚 Documentation

- 更新生僻字使用提示，限制作用范围 ([31abab0](https://github.com/BITNP/BIThesis/commit/31abab00a1ea56620b2931be9edb63125c7f50e4)) by @YDX-2147483647 in [#521](https://github.com/BITNP/BIThesis/pull/521)
- 在更多地方介绍如何添加水印 ([a9a1aa7](https://github.com/BITNP/BIThesis/commit/a9a1aa7c729c43db3c2e291968a3fcf3f1fc1adc)) by @YDX-2147483647 in [#520](https://github.com/BITNP/BIThesis/pull/520)
- Add title property in `BITSetup.info` for undergraduate-thesis-en ([3f92180](https://github.com/BITNP/BIThesis/commit/3f9218014421a3278220073bff7ac39d08f333f2)) by @CreeperLKF

### <!-- 7 -->⚙️ Miscellaneous Tasks

- 编译快速使用手册 ([ef0e51e](https://github.com/BITNP/BIThesis/commit/ef0e51ef06765a459eb8e23d6e4a90a6f6e6d28f)) by @YDX-2147483647 in [#519](https://github.com/BITNP/BIThesis/pull/519)
- Update bithesis.dtx version to 3.7.9 ([6d56033](https://github.com/BITNP/BIThesis/commit/6d56033f5cdcab31c89542959854e8ede368b9c7)) by @fky2015

## New Contributors
* @CreeperLKF made their first contribution in [#522](https://github.com/BITNP/BIThesis/pull/522)
## [3.7.8] - 2024-05-27

### <!-- 0 -->🚀 Features

- `misc/algorithmSeparation`选项调整算法与文字之间的距离（仅针对algorithm2e宏包） ([0bffec6](https://github.com/BITNP/BIThesis/commit/0bffec67a3d774fcd19e14b19d0b32f0c75009b0)) by @YDX-2147483647 in [#510](https://github.com/BITNP/BIThesis/pull/510)
- 支持用`misc/tabularRowSeparation`调节`longtable`宏包 ([ecf5af8](https://github.com/BITNP/BIThesis/commit/ecf5af8506441e57ede5e3e50496079e7a0cf5bc)) by @YDX-2147483647
- 让longtable与文字的间距与其它浮动体相近，并支持用`misc/floatSeparation`统一调整 ([f5f24e5](https://github.com/BITNP/BIThesis/commit/f5f24e5e0b5582acd32e486537f66cc348ec3db4)) by @YDX-2147483647 in [#513](https://github.com/BITNP/BIThesis/pull/513)

### <!-- 1 -->🐛 Bug Fixes

- `misc/tabularRowSeparation`不应影响矩阵，并适配`longtable`宏包 ([2f6cf63](https://github.com/BITNP/BIThesis/commit/2f6cf63d054e67bc7a07948a02d2f03f5521a075)) by @YDX-2147483647 in [#499](https://github.com/BITNP/BIThesis/pull/499)
- 去除longtable表格上框线和caption的多余间距 ([689de6c](https://github.com/BITNP/BIThesis/commit/689de6c057c1caf5a3dc3812a3d623f6772f61cf)) by @YDX-2147483647

### <!-- 2 -->🚜 Refactor

- 让硕博模板书脊上下居中，并适应长标题，避免与姓名粘连 ([9b315ee](https://github.com/BITNP/BIThesis/commit/9b315eebed82f7ff15e4f9277ab4ab501aa66d2e)) by @YDX-2147483647 in [#511](https://github.com/BITNP/BIThesis/pull/511)

### <!-- 3 -->📚 Documentation

- 修正快速使用手册中的`\isGraduateTF` ([2b0d3f3](https://github.com/BITNP/BIThesis/commit/2b0d3f30dce1eab39623173e9d8ec27cf9c9d761)) by @YDX-2147483647
- 给本科英文模板添加盲审模式注释 ([8673d0a](https://github.com/BITNP/BIThesis/commit/8673d0acb91c9717ee0a7e0d326b266e5a702b90)) by @YDX-2147483647 in [#507](https://github.com/BITNP/BIThesis/pull/507)
- Add an example for enumerate in publications ([6a2c1c1](https://github.com/BITNP/BIThesis/commit/6a2c1c177ea82ff0ddba92bd6de386a9114dc9b9)) by @fky2015 in [#515](https://github.com/BITNP/BIThesis/pull/515)

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Create dependabot.yml ([1cc4c09](https://github.com/BITNP/BIThesis/commit/1cc4c09c8aa9d13310527e6727e30c2042ec20fd)) by @YDX-2147483647 in [#488](https://github.com/BITNP/BIThesis/pull/488)
- 发布快速使用手册 ([2f6bf7e](https://github.com/BITNP/BIThesis/commit/2f6bf7eb7cc93cc45572fbd84c31260341e18861)) by @YDX-2147483647 in [#493](https://github.com/BITNP/BIThesis/pull/493)
- Remove redundant code for consistency with official examples ([cf34b13](https://github.com/BITNP/BIThesis/commit/cf34b13442542834a3e24ce36a235a00a39383fa)) by @fky2015 in [#514](https://github.com/BITNP/BIThesis/pull/514)
- 在发行说明中提示快速使用指南等 ([9ac93e5](https://github.com/BITNP/BIThesis/commit/9ac93e52d934d92a47634e3ae8f32e41bb2a5d1d)) by @YDX-2147483647 in [#516](https://github.com/BITNP/BIThesis/pull/516)
- Update version to 3.7.8 ([7a20e31](https://github.com/BITNP/BIThesis/commit/7a20e31d257596ae83f67983e7760da1c57c652e)) by @fky2015

### Build

- *(deps)* Bump actions/upload-artifact from 3 to 4 ([9a446f1](https://github.com/BITNP/BIThesis/commit/9a446f1fe8c509c2b98788ef4c184d3d90e8d767)) by @dependabot[bot] in [#489](https://github.com/BITNP/BIThesis/pull/489)
- *(deps)* Bump actions/download-artifact from 3 to 4 ([4d6c99d](https://github.com/BITNP/BIThesis/commit/4d6c99d2b0ea874ca1eaa4cda0e345151ea0de65)) by @dependabot[bot] in [#490](https://github.com/BITNP/BIThesis/pull/490)
- *(deps)* Bump xu-cheng/texlive-action from 1 to 2 ([648c5b8](https://github.com/BITNP/BIThesis/commit/648c5b86cc793399f5201a21f231a44aab9adb91)) by @dependabot[bot] in [#492](https://github.com/BITNP/BIThesis/pull/492)

## [3.7.7] - 2024-05-04

### <!-- 0 -->🚀 Features

- `misc/tabularRowSeparation`选项调整表格行间距 ([b406d67](https://github.com/BITNP/BIThesis/commit/b406d67dab3aab0507d5c6d3bb4db4a06918243d)) by @YDX-2147483647

### <!-- 1 -->🐛 Bug Fixes

- 调整本科模板表格 caption 和表格本体间的距离 ([ad44533](https://github.com/BITNP/BIThesis/commit/ad4453394e96509a3f2635377e9a9b7e1e3ae478)) by @YDX-2147483647 in [#483](https://github.com/BITNP/BIThesis/pull/483)
- Better bookmark ([bac87b5](https://github.com/BITNP/BIThesis/commit/bac87b5555d902632be7123b8b8e66260abc276a)) by @fky2015 in [#480](https://github.com/BITNP/BIThesis/pull/480)

### <!-- 2 -->🚜 Refactor

- 所有本科模板表格示例统一使用三线表 ([7c137df](https://github.com/BITNP/BIThesis/commit/7c137df200b68bcb357582e8c3fd6a1305fa499a)) by @YDX-2147483647
- 本科模板表格示例`\linespread`换为`misc/tabularRowSeparation` ([17398c5](https://github.com/BITNP/BIThesis/commit/17398c5d2021690b593e1435cb09bc36a3a5cb47)) by @YDX-2147483647

### <!-- 3 -->📚 Documentation

- 强调关键词应在`main.tex`设置 ([7ca7b99](https://github.com/BITNP/BIThesis/commit/7ca7b99ced4b67af6a209d25b6d679119ad048ef)) by @YDX-2147483647 in [#484](https://github.com/BITNP/BIThesis/pull/484)

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Fix changelog ([d634c1b](https://github.com/BITNP/BIThesis/commit/d634c1bfb6655a8ce430555a1f3c4ca02a2d83bc)) by @YDX-2147483647 in [#485](https://github.com/BITNP/BIThesis/pull/485)
- Update to v3.7.7 ([ee6a901](https://github.com/BITNP/BIThesis/commit/ee6a901d00ebcaa30567ab1ee9490b9d1217875f)) by @fky2015

## [3.7.6] - 2024-04-29

### <!-- 1 -->🐛 Bug Fixes

- `\usepackage[chapter]{algorithm}`时开头不应出现“algorithm2ealgochaper”字样 ([c755a92](https://github.com/BITNP/BIThesis/commit/c755a926a191f5f06c90250ab461c61b9cc21bf7)) by @YDX-2147483647 in [#481](https://github.com/BITNP/BIThesis/pull/481)

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update version to 3.7.6 ([c5a624f](https://github.com/BITNP/BIThesis/commit/c5a624f3f8ecf453030c5437dcd1f47806b6129b)) by @fky2015

## [3.7.5] - 2024-04-24

### <!-- 1 -->🐛 Bug Fixes

- Fix bug ([fb4a42e](https://github.com/BITNP/BIThesis/commit/fb4a42e16a5889c8a54c4648f4d8b66f6f53adf4))
- Typo ([e407727](https://github.com/BITNP/BIThesis/commit/e407727dd4094ce302c35b0c10264463b1ec9d13)) by @YDX-2147483647 in [#459](https://github.com/BITNP/BIThesis/pull/459)
- 改正`tabularx`环境中的字号 ([9452d43](https://github.com/BITNP/BIThesis/commit/9452d438c9ecc7764397cdd56e48732a04309a10)) by @YDX-2147483647 in [#462](https://github.com/BITNP/BIThesis/pull/462)

### <!-- 2 -->🚜 Refactor

- 删除表格中无用的`\zihao{5}` ([d2a2943](https://github.com/BITNP/BIThesis/commit/d2a29437e99f964007d89ead11b612ce11a4207e)) by @YDX-2147483647 in [#461](https://github.com/BITNP/BIThesis/pull/461)
- 只在按章编号时适配algorithm宏包 ([0a4fca2](https://github.com/BITNP/BIThesis/commit/0a4fca2df6a99fb7977b336cf6146af3edb58f6f)) by @YDX-2147483647 in [#469](https://github.com/BITNP/BIThesis/pull/469)

### <!-- 3 -->📚 Documentation

- Add comment doc for hyphenation. ([f607b35](https://github.com/BITNP/BIThesis/commit/f607b35e75a78ba073273ebd06aa06653c24c5b3)) by @fky2015
- One doc for both graduate and undergraduate ([55a7cae](https://github.com/BITNP/BIThesis/commit/55a7cae6c007f451b4b3cedd583ae1029b53cf99)) by @fky2015
- 参考同学建议修改 ([ddd3c91](https://github.com/BITNP/BIThesis/commit/ddd3c91710889611e7dc15709ebc00548cbd0d66)) by @YDX-2147483647
- Use `\autoref` ([9e76447](https://github.com/BITNP/BIThesis/commit/9e76447a682e303e5c63aee3f4296d630e5d4ef2)) by @YDX-2147483647
- 改正标点符号 ([1c2e171](https://github.com/BITNP/BIThesis/commit/1c2e1719c68d9a7d99c1ef8039e808a0e0288a87)) by @YDX-2147483647 in [#473](https://github.com/BITNP/BIThesis/pull/473)

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Make the skips for math env bigger. ([39c27df](https://github.com/BITNP/BIThesis/commit/39c27dfe8e79b53bddddb1332e5e6ca48bade200)) by @fky2015 in [#472](https://github.com/BITNP/BIThesis/pull/472)
- Update version to 3.7.5 ([3fd7b22](https://github.com/BITNP/BIThesis/commit/3fd7b2269e8840737d4f82fd1e3a981104b584dc)) by @fky2015

## New Contributors
* @ made their first contribution
## [3.7.4] - 2024-04-16

### <!-- 1 -->🐛 Bug Fixes

- Support the `algorithm2e` package ([0f1b217](https://github.com/BITNP/BIThesis/commit/0f1b2175e47723b01ff092167528d650c59a4d3f)) by @YDX-2147483647 in [#456](https://github.com/BITNP/BIThesis/pull/456)

### <!-- 3 -->📚 Documentation

- Add more comments. ([e4cc9b9](https://github.com/BITNP/BIThesis/commit/e4cc9b9d0012dc92970aa2df87b74f4e0ab711c1)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Add star history in readme ([97195c0](https://github.com/BITNP/BIThesis/commit/97195c0576005a3bb19075256ab84d9a3b75df05)) by @fky2015 in [#458](https://github.com/BITNP/BIThesis/pull/458)
- Update version to 3.7.4 ([8f6f509](https://github.com/BITNP/BIThesis/commit/8f6f5095708170362a14f3017dc7702b2b5dd9f5)) by @fky2015 in [#460](https://github.com/BITNP/BIThesis/pull/460)

## [3.7.3] - 2024-04-11

### <!-- 0 -->🚀 Features

- Feat and fix: separation and blank space ([d08f571](https://github.com/BITNP/BIThesis/commit/d08f57194275221f38ac1d9cf06ccfbcc31e0b90)) by @SinCerely023

### <!-- 1 -->🐛 Bug Fixes

- Standardize algo ref name. ([6d45404](https://github.com/BITNP/BIThesis/commit/6d4540491db5432caf0c1fd319ac5d73c263bb79)) by @fky2015

### <!-- 3 -->📚 Documentation

- 如何将自己电脑上的论文转到 Overleaf ([cf6ddfa](https://github.com/BITNP/BIThesis/commit/cf6ddfa0b86cd48ceb3b9fa04207ccccca76c121)) by @YDX-2147483647
- Add comments for publications sorting. ([f7e9379](https://github.com/BITNP/BIThesis/commit/f7e9379075dc3ba28ef3c4525dd64cc127e44bdb)) by @fky2015
- Sort publications ([fd21e5e](https://github.com/BITNP/BIThesis/commit/fd21e5e7c0705cb6c0ce5630c86eaf00d624f83c)) by @YDX-2147483647
- *(readme)* Docs maintenance. ([28a27cc](https://github.com/BITNP/BIThesis/commit/28a27ccc44a59c5524970890146a173029da989f)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Improve usability for publications. ([938b215](https://github.com/BITNP/BIThesis/commit/938b2157dcc36dd73fb026f43d4c679405a5c5e4)) by @fky2015
- Update version to 3.7.3 ([7760e33](https://github.com/BITNP/BIThesis/commit/7760e33d1726161d03d5a9de468f786a0e69b0b0)) by @fky2015

### Build

- Improve build script. ([1a97889](https://github.com/BITNP/BIThesis/commit/1a978891dbe788cb60d1c9852188112cfb39406d)) by @fky2015

## [3.7.2] - 2024-04-06

### <!-- 0 -->🚀 Features

- Allow to use TeX Gyre Termes as the main fonts. ([139eeec](https://github.com/BITNP/BIThesis/commit/139eeec985fe4054b1441075b05295dcf9562c5b)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Ballot boxes in cover and originality clause in GT ([58f9ee9](https://github.com/BITNP/BIThesis/commit/58f9ee9b5ed5fb1cbaf337adf75752bb3d4a222d)) by @YDX-2147483647

### <!-- 3 -->📚 Documentation

- One notice for paper-translation's title ([a95f0cf](https://github.com/BITNP/BIThesis/commit/a95f0cffc0e0e51734f567bce9cef4f6df003b10)) by @CZLeader
- Font shape warnings ([773c27c](https://github.com/BITNP/BIThesis/commit/773c27c15ad23f0fa2ee2e9d7e7d8392208f48ce)) by @YDX-2147483647

### <!-- 7 -->⚙️ Miscellaneous Tasks

- *(typos)* Update for typos v1.20 ([2d300f1](https://github.com/BITNP/BIThesis/commit/2d300f100ad90b81fbc4a1b2bd291d69d7a84dc2)) by @YDX-2147483647
- Add changelog generation action. ([53e9cee](https://github.com/BITNP/BIThesis/commit/53e9cee04d8d4a977fb0936709868e4e31ec3828)) by @fky2015
- Simplify GitHub issue templates. ([8775738](https://github.com/BITNP/BIThesis/commit/8775738a03e4cc8484a8c1c96995729cb37db1a4)) by @fky2015
- Update to v3.7.2 ([755f674](https://github.com/BITNP/BIThesis/commit/755f674695ba95a51e0a0e2105e14ccf6f5dbbd3)) by @fky2015

## New Contributors
* @CZLeader made their first contribution
## [3.7.1] - 2024-03-26

### <!-- 1 -->🐛 Bug Fixes

- *(GT)* Add a switch to show special type. ([c6cd86e](https://github.com/BITNP/BIThesis/commit/c6cd86eb070df519c538dbcfc2aa51ca5c4488ff)) by @fky2015

### <!-- 3 -->📚 Documentation

- Update info for CTAN ([28b2808](https://github.com/BITNP/BIThesis/commit/28b28080ca4f9235430f4552f40f4658eb14a58a)) by @YDX-2147483647

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Automatically generate changelog. ([c664487](https://github.com/BITNP/BIThesis/commit/c6644876d50707677e16c788410c939499956d09)) by @fky2015
- Fix broken cliff. ([d306cb4](https://github.com/BITNP/BIThesis/commit/d306cb4fd9ac42c1f58cb424495a5ea37df46161)) by @fky2015
- No need to modify CHANGELOG manually anymore. ([598ff77](https://github.com/BITNP/BIThesis/commit/598ff7704112938efc2a1a83c0a1401e8f22d117)) by @fky2015
- Upload to CTAN ([5f52d4f](https://github.com/BITNP/BIThesis/commit/5f52d4f79921a41573f691924bdbd9ea340b2c9f)) by @YDX-2147483647
- Remove redundant “Generate changelog” ([54bbe79](https://github.com/BITNP/BIThesis/commit/54bbe79e3dbcb22d2f94ae2123a4ba255ff2c2e5)) by @YDX-2147483647
- Bump version to 3.7.1 ([96965fd](https://github.com/BITNP/BIThesis/commit/96965fd9ab1cbae85f716ad039869776a69a8407)) by @fky2015

## [3.7.0] - 2024-03-22

### <!-- 0 -->🚀 Features

- Update make grad. ([5562de4](https://github.com/BITNP/BIThesis/commit/5562de434a516d2ff1553df89fb9247cbc2bd0fb)) by @fky2015
- *(GT)* Add support for special type. ([76255d8](https://github.com/BITNP/BIThesis/commit/76255d80467081cd952a99439ad1150f392f3ec8)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Remove `, et al.` etc. for `pub.bib` in `blindPeerReview` mode ([d604b0e](https://github.com/BITNP/BIThesis/commit/d604b0ee7285e673fc2cc711cb5b9874d7f4cbbb)) by @YDX-2147483647
- Try fix github-action-markdown-link-check. ([9b64b96](https://github.com/BITNP/BIThesis/commit/9b64b96d40db2aed0cff6d692e2963c744eb2696)) by @fky2015
- Zip without parent folder. ([94d14b2](https://github.com/BITNP/BIThesis/commit/94d14b2ea78949a14a2b332225ccaa35b67cd260)) by @fky2015
- Update according new 2024 Word template. ([0609af7](https://github.com/BITNP/BIThesis/commit/0609af7820b5cbcd2898cd3a3b1e19e27c616350)) by @Manpopp

### <!-- 2 -->🚜 Refactor

- Colorize hyperlinks ([af43560](https://github.com/BITNP/BIThesis/commit/af4356015ffe396e05397c8169a42b7bb18cd4f9)) by @fky2015

### <!-- 3 -->📚 Documentation

- Hyperref ([7f07e3c](https://github.com/BITNP/BIThesis/commit/7f07e3c7690fe3cf661bc57b470606c7c04df0eb)) by @YDX-2147483647
- Update DEVELOPMENT.md ([08910a6](https://github.com/BITNP/BIThesis/commit/08910a64d20b0c7d987e838f7e23f9acd6b04849)) by @fky2015
- *(dev)* Update `wiki/guide/preface.md` in `BIThesis-wiki` ([c4e9098](https://github.com/BITNP/BIThesis/commit/c4e9098f742cbe599e0edd34f59feef0c750d09d)) by @YDX-2147483647
- Update readme. ([00abcf3](https://github.com/BITNP/BIThesis/commit/00abcf38d5454e5d987eaf58ee020c51258fea0f)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Bump version to v3.6.3 ([24ad394](https://github.com/BITNP/BIThesis/commit/24ad394fc5adeb7b50cd6fa2b736433f6b3920d0)) by @YDX-2147483647
- Remove `make check-cls` ([8a0d5d1](https://github.com/BITNP/BIThesis/commit/8a0d5d19df58bc2c2b2834cbfac1b50bbb2b2cda)) by @YDX-2147483647
- Update GitHub Actions' version ([eca4d67](https://github.com/BITNP/BIThesis/commit/eca4d678b3569d4200d81d36a775503e5699c637)) by @fky2015
- Bump version to 3.7.0 ([9384774](https://github.com/BITNP/BIThesis/commit/93847740d897518dbc0ffa9ca00ba4c3282cfefe)) by @fky2015

## New Contributors
* @Manpopp made their first contribution
## [3.6.2] - 2024-02-26

### <!-- 1 -->🐛 Bug Fixes

- Update styles of PT ([f32503b](https://github.com/BITNP/BIThesis/commit/f32503b053beec02dc73b5cd971ab3f8807c6b10)) by @YDX-2147483647
- Typo ([27d3071](https://github.com/BITNP/BIThesis/commit/27d3071df752afd9f6304562e363d4e7db44ab0e)) by @YDX-2147483647

### <!-- 2 -->🚜 Refactor

- Stretch spaces in the cover of PT ([520e1d1](https://github.com/BITNP/BIThesis/commit/520e1d10df253c26053dcf6390af07d19232b264)) by @YDX-2147483647

### <!-- 3 -->📚 Documentation

- Unify the case of “GitHub” ([38a0e96](https://github.com/BITNP/BIThesis/commit/38a0e9676376ff30e36b18e226d73fc16423056f)) by @YDX-2147483647

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Bump version. ([1d98b96](https://github.com/BITNP/BIThesis/commit/1d98b965eb4e1f24fe184f93863d82d6c6c9ccd0)) by @fky2015

### Hotfix

- Use top for pageVerticalAlign ([4fc807e](https://github.com/BITNP/BIThesis/commit/4fc807e541549725eed628d5b32ccebd9606a0e6)) by @fky2015

## [3.6.1] - 2023-10-26

### <!-- 0 -->🚀 Features

- Add a quick-start handbook for graduates. ([55dcc77](https://github.com/BITNP/BIThesis/commit/55dcc77e02be046d75dd96ca7d62f5801e5138db)) by @fky2015
- Add acknowledgements. ([f8577d1](https://github.com/BITNP/BIThesis/commit/f8577d10fa57f1f51fb9f0d8e7c9e5576bafea31)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Typo ([4581850](https://github.com/BITNP/BIThesis/commit/45818508a00ed98d94de4ca6c33e61839911edea)) by @YDX-2147483647
- Show links. ([470fc4d](https://github.com/BITNP/BIThesis/commit/470fc4df2c9ecd56f68a83d77a505d0853cf9a1e)) by @fky2015
- Use single quotation marks ([45c97b5](https://github.com/BITNP/BIThesis/commit/45c97b55c5b95e0ea0789c87e94c2763c2045f9e)) by @fky2015
- Fix display skip and line stretch. ([e08374f](https://github.com/BITNP/BIThesis/commit/e08374f6ade99150d1b52ce521faa9c33ef95831)) by @fky2015
- Fix a typo. ([4ba5027](https://github.com/BITNP/BIThesis/commit/4ba50278b50c0efb55c25fe52452918394888f1e)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(intro)* Update contributions ([94884a3](https://github.com/BITNP/BIThesis/commit/94884a3859e828d36a4810956430b9754df88d22)) by @YDX-2147483647

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update version. ([d8908bd](https://github.com/BITNP/BIThesis/commit/d8908bdd1f5f09ff9714af8b77b8bb3181854424)) by @fky2015

## New Contributors
* @lsylusiyao made their first contribution in [#391](https://github.com/BITNP/BIThesis/pull/391)
## [3.6.0] - 2023-10-01

### <!-- 0 -->🚀 Features

- Hide only secret info in cover. ([026c529](https://github.com/BITNP/BIThesis/commit/026c529fc9ecafcf31fe89af07df7d1bd22e8192)) by @fky2015
- Provide const/style/substituteSymbol option. ([1f40eef](https://github.com/BITNP/BIThesis/commit/1f40eeff976af485e2cc3c19d0f17243c5c1d7c9)) by @fky2015
- [**breaking**] Add back cover pages in blindPeerReview mode. ([6953c61](https://github.com/BITNP/BIThesis/commit/6953c61b949c92be370b7a620e769f0a674ea29d)) by @fky2015
- Add interface for secret info. ([a39f545](https://github.com/BITNP/BIThesis/commit/a39f54551f790afb465bacd731396917b181ec0c)) by @fky2015
- Suppress twoside in blindPeerReview. ([f1db9e7](https://github.com/BITNP/BIThesis/commit/f1db9e7858ce4c8ccbe5cc80b3effa8d6fd6147f)) by @fky2015
- Also expose paperback and originality claim. ([61483f5](https://github.com/BITNP/BIThesis/commit/61483f5701ea0742f9602d65f7c07239b51ba854)) by @fky2015
- Default fake bold SimSun on Windows. ([554871d](https://github.com/BITNP/BIThesis/commit/554871d6258ce0f85c49eb335718324bef5d104d)) by @fky2015
- Add parencite examples ([82800ec](https://github.com/BITNP/BIThesis/commit/82800ec8bcc77c421f9c592f2302d94499aeed5d)) by @scliubit
- Add type reading_report to change the title ([8d97017](https://github.com/BITNP/BIThesis/commit/8d97017da74b16625102aa5b746c9eddb6a11292)) by @YDX-2147483647
- Customizable headline ([9de5df6](https://github.com/BITNP/BIThesis/commit/9de5df6253bf4cfa965cfdf21cca97f8dff316a2)) by @YDX-2147483647
- Support customize cover label. ([f73359f](https://github.com/BITNP/BIThesis/commit/f73359fb0cf2731fd701613f0c1877c9171b4354)) by @fky2015
- Support hyphenation by default. ([9b849dd](https://github.com/BITNP/BIThesis/commit/9b849dd0132494b92af5d5fca40d89c32186e095)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Graduate-thesis indent is larger than normal. ([c2b1d37](https://github.com/BITNP/BIThesis/commit/c2b1d37be0c127ddcc34e76770ffba2be58053fa)) by @fky2015
- Typo fix. ([6fa12af](https://github.com/BITNP/BIThesis/commit/6fa12af528c124a4c8e51596263d8caf7782f7d0)) by @fky2015
- Add autoref label for figure(fig),table(tab),euqation(equ) ([1a62cc5](https://github.com/BITNP/BIThesis/commit/1a62cc50e77da71fde234424dac5c3e2ba745de3)) by @ZoroGH
- Replace the _bithesis with @@ in .dtx, add updated property ([e02253a](https://github.com/BITNP/BIThesis/commit/e02253a2eff2b78aaa05478c9b929a762eacaa25)) by @ZoroGH
- Apply same rules to bachelor thesis. ([b0b3740](https://github.com/BITNP/BIThesis/commit/b0b3740c5f62bd0d690888b201f5dd517ca85d48)) by @fky2015
- Fix section-level appendix bookmark. ([5c2dbf5](https://github.com/BITNP/BIThesis/commit/5c2dbf5def8c03083aa9ee689f7ab8f2bff91450)) by @fky2015
- Reset section counter at the beginning of appendix. ([21f0661](https://github.com/BITNP/BIThesis/commit/21f0661b9a55c63e7ac0c41780cb5712b987260a)) by @fky2015
- Fix non-effective listings numbering. ([4c2757f](https://github.com/BITNP/BIThesis/commit/4c2757fe94cfeade53691792ba666252819ae824)) by @fky2015
- Restore hyphenation for Eng template. ([f5ece01](https://github.com/BITNP/BIThesis/commit/f5ece01b9cd5734db4de8b9b81a5b1ac5deeca85)) by @fky2015
- Fix alignment. ([c7073e0](https://github.com/BITNP/BIThesis/commit/c7073e0430ac150d5bebacb01bac3a6c7222da44)) by @fky2015
- Update example of references ([8fd6c79](https://github.com/BITNP/BIThesis/commit/8fd6c79a6dbd13cfe26eaf743002b467baa2c4fc)) by @SinCerely023
- Remove covers in peer review mode. ([65cf4e2](https://github.com/BITNP/BIThesis/commit/65cf4e25e05cf53fb3ef402a9304bfeb3cd45477)) by @fky2015
- Add Chinese abstract section. ([55cd7d2](https://github.com/BITNP/BIThesis/commit/55cd7d28413371c6ed10181b5ef24cc0b000d1cc)) by @fky2015
- More of tabular. ([e316c41](https://github.com/BITNP/BIThesis/commit/e316c41267af91948624effbc96ff4d8b042e556)) by @fky2015
- Add more. ([681ed0f](https://github.com/BITNP/BIThesis/commit/681ed0f144ba342ba05162c392e87eb50f164ddb)) by @fky2015
- Hotfix for ref.bib ([bd6221d](https://github.com/BITNP/BIThesis/commit/bd6221d7e8a2e453c76e0d679e2da0b19692a35f)) by @fky2015
- Page numbering bug fix for two-side printing ([e435cc0](https://github.com/BITNP/BIThesis/commit/e435cc009daba6767ac88f769b3ed2e2d02a902e)) by @scliubit
- Typo ([ea08115](https://github.com/BITNP/BIThesis/commit/ea0811589a281281f410329da479116ea804f6cd)) by @YDX-2147483647
- Redundant teacher in cover ([4cbd11c](https://github.com/BITNP/BIThesis/commit/4cbd11cfb44c13d0f25f8f251817ba36b82aad49)) by @YDX-2147483647
- Fix broken images in README.md ([c9779ee](https://github.com/BITNP/BIThesis/commit/c9779eebe0cae2627a147b6d522712071fcc252f)) by @fky2015
- Remove default values to make entry can-be-deleted. ([e8f67b4](https://github.com/BITNP/BIThesis/commit/e8f67b48b3229df966d92fd8a1bea17fdf8f53da)) by @fky2015
- Use meta key. ([4b7b6a1](https://github.com/BITNP/BIThesis/commit/4b7b6a150bb0a248d59bcd73af1aeac7e50e39f0)) by @fky2015
- Update links. ([999eb2e](https://github.com/BITNP/BIThesis/commit/999eb2e93cada08bbe1d6ac3070c8be690fa1c70)) by @fky2015
- Secret info expansion. ([d4decf9](https://github.com/BITNP/BIThesis/commit/d4decf9f2b47e3b14c398eec87c891a45650edfb)) by @fky2015
- Remove \@@_secret_info:x ([6c8a0f6](https://github.com/BITNP/BIThesis/commit/6c8a0f6336599742f84601f1a52442722261ba0a)) by @fky2015
- Note environment does not work as expected ([c703854](https://github.com/BITNP/BIThesis/commit/c7038542c7a2730651feabc745c6f543df505955)) by @YDX-2147483647
- Update gitignore. ([c85fa6b](https://github.com/BITNP/BIThesis/commit/c85fa6b35b440b7ccf3bfa9732881437f35592a7)) by @fky2015
- Typo in release-tracker.md ([1250c53](https://github.com/BITNP/BIThesis/commit/1250c5353e1249c1659529f8c51013d94f00a4f0)) by @YDX-2147483647

### <!-- 2 -->🚜 Refactor

- Remove all source-code docs. ([1be9eb7](https://github.com/BITNP/BIThesis/commit/1be9eb73681da324600196f1bb288fd712e7c9bb)) by @fky2015
- Remove deprecated code. ([80576ab](https://github.com/BITNP/BIThesis/commit/80576abb526c339f0050918571c8bf2efedd49f7)) by @fky2015
- Move docs into separate file. ([8ad8bf8](https://github.com/BITNP/BIThesis/commit/8ad8bf8e261e3b03f138acbbdb39adb4a472d789)) by @fky2015
- Docs. ([e5c5ea7](https://github.com/BITNP/BIThesis/commit/e5c5ea7f70aacf0d8963a32020233ed40ebdc302)) by @fky2015
- Disable bibliographyIndent. ([30b651c](https://github.com/BITNP/BIThesis/commit/30b651cb738ee3e434b7d67bde6c4178c31ec3f2)) by @fky2015
- A bunch of fixes. ([a6c7f33](https://github.com/BITNP/BIThesis/commit/a6c7f3381a48ad9db02a29db6f02043f5b0cb297)) by @fky2015
- Basic setup for reading-report ([1d08feb](https://github.com/BITNP/BIThesis/commit/1d08feb26b57140aa96414b242cd15ce717bdf07)) by @YDX-2147483647
- Remove hard-coded title in reading_report ([a0df6e3](https://github.com/BITNP/BIThesis/commit/a0df6e303110807e1806fd06c80965e8197ff7fd)) by @YDX-2147483647
- Reading_report cover info ([ce1905c](https://github.com/BITNP/BIThesis/commit/ce1905cea6fcfa52f787c7ae8d125f5d46c9bf88)) by @YDX-2147483647
- `style / head`使用`\c_@@_bachelor_thesis_header_clist` ([e420412](https://github.com/BITNP/BIThesis/commit/e420412b9a47738b23f18c43fad58e0d2b4bee8c)) by @YDX-2147483647
- Remove all templates/*/*.cls. ([e457dae](https://github.com/BITNP/BIThesis/commit/e457daea0f6ede972ec2fa03d0bbe03105c21ef9)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add docs for SecretInfo feature. ([6f37ad2](https://github.com/BITNP/BIThesis/commit/6f37ad27d2c426ee81e2bc13a84078e7ec8c70e4)) by @fky2015
- Add the doc for windowsSimSunFakeBold. ([fa1eaca](https://github.com/BITNP/BIThesis/commit/fa1eacab87eb8ac7b5a8fff9aa9b7f962ed2fbae)) by @fky2015
- Update README for reading-report ([2591bd6](https://github.com/BITNP/BIThesis/commit/2591bd6b220bd5e41a9ad1c19ad8a72c57119257)) by @YDX-2147483647
- Add docs for cleardoublepage ([9348300](https://github.com/BITNP/BIThesis/commit/934830077eb6d47b1ee9bd6d44bd3e275d4f2479)) by @fky2015
- Fix the description about passing emtpy values. ([a942e6c](https://github.com/BITNP/BIThesis/commit/a942e6c6795dafa39dd7c7bbb9227b38dc775ab0)) by @fky2015
- A reference to how to add the watermark. ([14cb57c](https://github.com/BITNP/BIThesis/commit/14cb57cb1b54bba92a8cc85cd2eac99fa4b4ae10)) by @fky2015
- Maybe helps. ([3df8e5d](https://github.com/BITNP/BIThesis/commit/3df8e5d9a58c770f8ea9fddec3f6a82e4bd45a33)) by @fky2015
- `style / headline`适用范围 ([58cf8a3](https://github.com/BITNP/BIThesis/commit/58cf8a35f679713c48701a942f547937bf802224)) by @YDX-2147483647
- Add docs on const/info/x. ([77b4582](https://github.com/BITNP/BIThesis/commit/77b4582f3a00c37c796eca1b4feb8c02ae5e4f3f)) by @fky2015
- 更新教务部网站 ([3dc9f64](https://github.com/BITNP/BIThesis/commit/3dc9f644a16e99436fe4fff53ba41a3fc7dbdef2)) by @YDX-2147483647
- Replace code of conduct contact ([ea26d66](https://github.com/BITNP/BIThesis/commit/ea26d660beeac04319ebf36b6575d3aeea238cf1)) by @phy25
- Add a doc entry for hyphen. ([b8eccd2](https://github.com/BITNP/BIThesis/commit/b8eccd2b82cdfb0727f45ff4d6c123d1f2d8d28b)) by @fky2015

### <!-- 5 -->🎨 Styling

- Remove a trailing space ([7f73122](https://github.com/BITNP/BIThesis/commit/7f73122a69a6b05dc07f88d787dce438a61de8df)) by @YDX-2147483647

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Ignore .DS_Store. ([7f78856](https://github.com/BITNP/BIThesis/commit/7f78856d8160bc6a53ddab54ba2846b80e7d36d0)) by @fky2015
- Update docs. ([e4558dc](https://github.com/BITNP/BIThesis/commit/e4558dcc5977b8af72034f9bfcda1038a737e6ab)) by @fky2015
- Add reading-report ([492eecd](https://github.com/BITNP/BIThesis/commit/492eecdc07e50a47479b168dadc1e07aaa255d7d)) by @YDX-2147483647
- Add markdown link check. ([e400fac](https://github.com/BITNP/BIThesis/commit/e400facec5bb3ca978c87fae2c39cabb0ccb434c)) by @fky2015
- Remove templates/*cls. ([ac5463c](https://github.com/BITNP/BIThesis/commit/ac5463ceb2fa734ba27ccc66b82f6ec4839069ad)) by @fky2015
- Remove ensure_updated_cls. ([1cab540](https://github.com/BITNP/BIThesis/commit/1cab540c184ec9fadc69f7de6125a0c2bde75263)) by @fky2015
- Bump version to 3.6.0 ([356d4c7](https://github.com/BITNP/BIThesis/commit/356d4c716d17c42725c64ff9021e86e45ee336d5)) by @fky2015

### <!-- 9 -->◀️ Revert

- Revert it back ([7bc43c1](https://github.com/BITNP/BIThesis/commit/7bc43c12e3b6eed1e05831833301566310c05ceb)) by @Zeqiang-Lai

### Build

- PowerShell version of regression-test ([d8f44bf](https://github.com/BITNP/BIThesis/commit/d8f44bf24c6829d4e75fa25a9827680d78da4bb4)) by @YDX-2147483647

## New Contributors
* @spaceskynet made their first contribution
* @Zeqiang-Lai made their first contribution
## [3.5.4] - 2023-04-30

### <!-- 0 -->🚀 Features

- Provide a switcher for hidelinks. ([c4f648e](https://github.com/BITNP/BIThesis/commit/c4f648ec9d2f3d90a238efdcfd970b4f6fee454c)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Normal text format in subsubsection. ([20f7060](https://github.com/BITNP/BIThesis/commit/20f7060ea78b5ace3d3e04e14c8c17247246dfd8)) by @fky2015
- The date cannot be in the future. ([a79c093](https://github.com/BITNP/BIThesis/commit/a79c0935f7ca2f4fb113c50cc3b4a0ddb27198f5)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Try fix \MakeOriginality in the plagiarism check. ([7891e26](https://github.com/BITNP/BIThesis/commit/7891e26ae9e292bef1369d727e92e54ed423f6b8)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add docs for twoside warning. ([f913aa1](https://github.com/BITNP/BIThesis/commit/f913aa1fa21218b8824af959bf9247954c4b0a2d)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update version to v3.5.4. ([b19599b](https://github.com/BITNP/BIThesis/commit/b19599bcd5b0917120aaf05fc8961f49f54700ef)) by @fky2015

## [3.5.3] - 2023-04-23

### <!-- 1 -->🐛 Bug Fixes

- Set zihao to 5 in tabular by default. ([9e58b8b](https://github.com/BITNP/BIThesis/commit/9e58b8beecba14cc8729f9b71bf99389d2b7035a)) by @fky2015
- Predefine autoref label. ([77bd192](https://github.com/BITNP/BIThesis/commit/77bd1926a302a5db6b17074a605ae19e33a8697d)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Use hbt to hint float position. ([e6788be](https://github.com/BITNP/BIThesis/commit/e6788be1116b6bc67e321fbb5c811dbb4a728b52)) by @fky2015
- Reduce ambiguity by remove multi-bibprint demos. ([5130df5](https://github.com/BITNP/BIThesis/commit/5130df55f4012b136fa4c87f1bae159f3900bf23)) by @fky2015
- Reduce ambiguity by removing multi-bibprint demos. ([42d0b18](https://github.com/BITNP/BIThesis/commit/42d0b183fb1c5ef4707cc323a81e18fa27073b32)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add an explaination about nosep in enumitem. ([ec3760f](https://github.com/BITNP/BIThesis/commit/ec3760f8750beb178b84a1a7cc0811a714ef21ed)) by @fky2015
- Add doc for misc/autoref & const/autoref. ([ccf14ed](https://github.com/BITNP/BIThesis/commit/ccf14ed2d157eac1c262d70bac9226e779edd420)) by @fky2015

### <!-- 6 -->🧪 Testing

- Add tests for autorefs. ([837d3d3](https://github.com/BITNP/BIThesis/commit/837d3d3b4f51f527b7afa862cc22dc1edc5202a7)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update to v3.5.3. ([346f11d](https://github.com/BITNP/BIThesis/commit/346f11da510b4c4d7ef10e4cb502f97aaf5865ea)) by @fky2015

## [3.5.2] - 2023-04-14

### <!-- 1 -->🐛 Bug Fixes

- Fix the skip of subsubsection. ([2e667a5](https://github.com/BITNP/BIThesis/commit/2e667a5d2df4431b397f2cc4f67765405995d3bd)) by @fky2015
- Remove empty space when overwriting english bibname. ([713be99](https://github.com/BITNP/BIThesis/commit/713be99fa3fdc0ed798cb26bc662974ddfa1cb7c)) by @fky2015
- Normalize title and 1.5 linestretch of listofx. ([0188ec1](https://github.com/BITNP/BIThesis/commit/0188ec1bea73daf9502a27912dc7462964c32644)) by @fky2015
- Improve extra space above/below float env. ([b730439](https://github.com/BITNP/BIThesis/commit/b7304396ebd58e213c34dc26a57d23640424da89)) by @fky2015
- Fix : Add filed class to paper-translation cover ([5d85905](https://github.com/BITNP/BIThesis/commit/5d859059e3f1aa8108cf8cc5a97887ba9ded18a5)) by @ZoroGH

### <!-- 3 -->📚 Documentation

- *(intro)* Update readme & introduction. ([3820753](https://github.com/BITNP/BIThesis/commit/3820753783a1d9f1780aa2192179996a10681c55)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Use true tilde. ([5a0b721](https://github.com/BITNP/BIThesis/commit/5a0b7212531aac81a00c47d55e474c8168d05f7a)) by @fky2015
- Update to v3.5.2 ([9345efc](https://github.com/BITNP/BIThesis/commit/9345efcf187c3d740129e97876502b3eba2791df)) by @fky2015

### Bugfix

- 本科毕设封面添加班号信息 ([e3ed05f](https://github.com/BITNP/BIThesis/commit/e3ed05f639cd1c87213e3a88a615f9a75e81842b)) by @ZoroGH

## [3.5.1] - 2023-04-07

### <!-- 1 -->🐛 Bug Fixes

- Clear page at start of `\mainmatter`. ([46bb854](https://github.com/BITNP/BIThesis/commit/46bb854ce2b6ac797b5a7024d6ef88cdd5329a10)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update version to v3.5.1. ([b56efcb](https://github.com/BITNP/BIThesis/commit/b56efcb95b2ded6f5b5b233744b6d1c85f85c3e7)) by @fky2015

## [3.5.0] - 2023-04-04

### <!-- 0 -->🚀 Features

- Align content to top by default. ([1b662f6](https://github.com/BITNP/BIThesis/commit/1b662f6197b8c1f2a25d74b7222fac807359fc4e)) by @fky2015
- Add options for custom mathFont. ([5006fc6](https://github.com/BITNP/BIThesis/commit/5006fc6d8b661802a76c4457af1bbd5e6626f09b)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Make listoffigure & listoftable align with the old template. ([96010ed](https://github.com/BITNP/BIThesis/commit/96010ed17314bdc78c425f868806da68a2b73902)) by @fky2015
- Fix typo. ([73f417a](https://github.com/BITNP/BIThesis/commit/73f417a278d604c6b364ab6be88bbf694d7dabfc)) by @fky2015
- Fix logo rendering problem in pdf bookmarks. ([3f3fda2](https://github.com/BITNP/BIThesis/commit/3f3fda24709ca7c7e706cefd8e770f77e04af0cf)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add explaination for `english`. ([7f5798b](https://github.com/BITNP/BIThesis/commit/7f5798be965cdbe7d366361706eeba4de67b7244)) by @fky2015
- Much more eye-catching doc for min/maxbibnames. ([09a8118](https://github.com/BITNP/BIThesis/commit/09a811861d1e2b9de722ba31cde9fd71e9e4a9fc)) by @fky2015
- Add a note about using CJK Font like MS Word. ([c866616](https://github.com/BITNP/BIThesis/commit/c8666166a60414a4e3bda1a62f95b2bf6b8eb827)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update to v3.5.0 ([08535d4](https://github.com/BITNP/BIThesis/commit/08535d44be9fa5e88eaf64162dfe6256636889c5)) by @fky2015

## [3.4.3] - 2023-03-16

### <!-- 1 -->🐛 Bug Fixes

- Fix invalid date fields in bibs. ([e66a264](https://github.com/BITNP/BIThesis/commit/e66a2643fda2a92286806a2abf8c779f935230a7)) by @fky2015
- Turn on AutoFakeBold and AutoFakeSlant in xeCJK. ([31ea67d](https://github.com/BITNP/BIThesis/commit/31ea67defedc37fa64364a823bcf13fff0995c08)) by @fky2015
- Add options & fine-tune AutoFakeBold. ([479b9b4](https://github.com/BITNP/BIThesis/commit/479b9b46e476aa8bc09a97d8f13f40c02282634f)) by @fky2015
- Set gbpunctin to false. ([2505ea9](https://github.com/BITNP/BIThesis/commit/2505ea9d4a392f6f1b2fa96b236678b17428e57e)) by @fky2015
- Add an english option to enable english mode. ([d8b4a0d](https://github.com/BITNP/BIThesis/commit/d8b4a0d956559175be84d9632d45f308f038dc14)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Sunset template undergraduate-proposal-report. ([ea6e218](https://github.com/BITNP/BIThesis/commit/ea6e218a14bdf490d52dd8210b2f04098e966119)) by @fky2015

### <!-- 3 -->📚 Documentation

- Update progress of authentication. ([b5b7aad](https://github.com/BITNP/BIThesis/commit/b5b7aad2f822df7a67ba5d96ee2def465a62354e)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update to v3.4.3 ([9951571](https://github.com/BITNP/BIThesis/commit/9951571f400d311327638c00e517c2576431a14c)) by @fky2015

## [3.4.2] - 2023-03-05

### <!-- 1 -->🐛 Bug Fixes

- Update the cover of template paper-translation. ([8a688c3](https://github.com/BITNP/BIThesis/commit/8a688c32699e61cb49d3d15e24dfc98d4eae0695)) by @fky2015
- Add info/class field in the cover of UT. ([e2ded7d](https://github.com/BITNP/BIThesis/commit/e2ded7dd8ee09fe5d7b6f6027e4426c582af7841)) by @fky2015
- Rename pre-defined theorem as per collision. ([d70fb9b](https://github.com/BITNP/BIThesis/commit/d70fb9b2d23c4ba37c8bdaf25f53a7b2913d09b9)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update to v3.4.2. ([b5045dd](https://github.com/BITNP/BIThesis/commit/b5045dd8bf50680c8cc13ea08363972c55288d9e)) by @fky2015

## [3.4.1] - 2023-03-02

### <!-- 1 -->🐛 Bug Fixes

- Add magic comments to auto-config editors. ([a4a921e](https://github.com/BITNP/BIThesis/commit/a4a921ea6d7a62221bc70e68a98043b46ad7b0b1)) by @fky2015

## [3.4.0] - 2023-02-20

### <!-- 0 -->🚀 Features

- Allow to set maxbibnames for publications. ([f627bf2](https://github.com/BITNP/BIThesis/commit/f627bf2f90f5cecb802043eb0408d09b8c2dc1f4)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Add minbibnames to both control name truncate behavior. ([e5aa6af](https://github.com/BITNP/BIThesis/commit/e5aa6af39fc02d8a23183ec4b5a40c320e95d893)) by @fky2015
- Suppress fontspec warning. ([0844846](https://github.com/BITNP/BIThesis/commit/08448466a4c989981f3c09e9b5f1188e25ad6f85)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Remove dependency on unicode-math. ([38f52ad](https://github.com/BITNP/BIThesis/commit/38f52adfb5ff1dc77299482ab25312f75023ec4f)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Add a repobeats service. ([ae84183](https://github.com/BITNP/BIThesis/commit/ae8418376142290671d1dd4d7f814e2ed2ba4314)) by @fky2015
- Update version to v3.4.0. ([a1ae48e](https://github.com/BITNP/BIThesis/commit/a1ae48e459636d9cf4448924663b02cea54fd714)) by @fky2015

## [3.3.2] - 2023-02-17

### <!-- 1 -->🐛 Bug Fixes

- *(GT)* Use normal text with the keywords. ([2b5ee4e](https://github.com/BITNP/BIThesis/commit/2b5ee4e80cdcd81c5303278d1e686a372e1b3625)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add extra mark on doc. ([28c48bc](https://github.com/BITNP/BIThesis/commit/28c48bc8e168ac727e4b677dd23298d9c6ecfd99)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Bump version to v3.3.2. ([5714bda](https://github.com/BITNP/BIThesis/commit/5714bda579d24f078e9c742fec8c5545596974e2)) by @fky2015

## [3.3.1] - 2023-02-11

### <!-- 1 -->🐛 Bug Fixes

- *(docs)* Increase Indent. ([25f87cc](https://github.com/BITNP/BIThesis/commit/25f87cc5db42506dae43e66b4abbb99143c074de)) by @note286
- Chapters now `openany` in twoside mode. ([a2047ff](https://github.com/BITNP/BIThesis/commit/a2047ff0124c3695f6e1745357ed584d45d4f2c5)) by @fky2015
- Set font by font file names (in stead of font names). ([21826b0](https://github.com/BITNP/BIThesis/commit/21826b01e72bf36c8823295070666efcd5137e72)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add apecial thanks. ([af0ecca](https://github.com/BITNP/BIThesis/commit/af0ecca7c429b996d7cc06f40b42658495eb9b95)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Bump version to v3.3.1 ([2f4aa62](https://github.com/BITNP/BIThesis/commit/2f4aa62f8efcfe9c46b5b2e78d1cbed3a5fbc11d)) by @fky2015

### Hotfix

- *(bithesis)* \clearpage after remove \cleardoublepage. ([ea1a689](https://github.com/BITNP/BIThesis/commit/ea1a689637a7ff7ae5850965245ed24df0e1854e)) by @fky2015

## New Contributors
* @note286 made their first contribution
## [3.3.0] - 2023-02-03

### <!-- 0 -->🚀 Features

- Add quirks mode. ([d2d1042](https://github.com/BITNP/BIThesis/commit/d2d10428ce6e84f91344ad684f29f4bfef88837e)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- *(docs)* Revise a typo. ([9583710](https://github.com/BITNP/BIThesis/commit/958371012a161e03bce5d48075a10767b8e42233)) by @fky2015

### <!-- 2 -->🚜 Refactor

- *(UT)* Add a patent entry. ([ed5c552](https://github.com/BITNP/BIThesis/commit/ed5c5527fc04b3a8d85a4602d210cab8145e07ff)) by @fky2015

### <!-- 3 -->📚 Documentation

- Typo and other small fixes ([26400cb](https://github.com/BITNP/BIThesis/commit/26400cbf9fd9e8e9822dcee08e1ebd4bc5cec944)) by @YDX-2147483647
- Typo ([95142c4](https://github.com/BITNP/BIThesis/commit/95142c4840b7d44794b013935d645ec4a3ada9fa)) by @YDX-2147483647
- Add subsection for versioning and updating. ([00a3d7c](https://github.com/BITNP/BIThesis/commit/00a3d7c1231f9197a7a4ae0916c206c6f84297af)) by @fky2015
- Add a reminder on how to update. ([5347352](https://github.com/BITNP/BIThesis/commit/534735268d11b3ba7997697eead453acb68a65ad)) by @fky2015
- *(bithesis)* Add docs for quirks mode. ([d90f939](https://github.com/BITNP/BIThesis/commit/d90f939c40e2454af88a0ecc22a93177115e2a31)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Fix typo. ([9508311](https://github.com/BITNP/BIThesis/commit/9508311f432a266273f299b8df2a6460f916bc2a)) by @YDX-2147483647
- *(workflow)* Add missing field in the issue template.  ([d180e6d](https://github.com/BITNP/BIThesis/commit/d180e6d7620934bfe3392dce2c4b6ec58fc8c187)) by @fky2015
- Update copyright. ([a55e45a](https://github.com/BITNP/BIThesis/commit/a55e45a90449fda7dec74750a2164d4471555ada)) by @fky2015
- *(typos)* Make linter happy. ([e5690e6](https://github.com/BITNP/BIThesis/commit/e5690e658cc85e9a546d5480da2cbbd0c7085705)) by @fky2015
- Bump version to v3.3.0. ([9ebe371](https://github.com/BITNP/BIThesis/commit/9ebe3711aab8759c006efa770510c9516c8e73a3)) by @fky2015

### Rechore

- Make sure all templates are updated. ([0f109e9](https://github.com/BITNP/BIThesis/commit/0f109e970c3d6fe82254d44b733e38505116a34b)) by @fky2015

## [3.2.3] - 2022-12-30

### <!-- 1 -->🐛 Bug Fixes

- *(bithesis)* Fix wrong bookmarks in appendix. ([1f524f5](https://github.com/BITNP/BIThesis/commit/1f524f54181233c1c7d8050e00803e45a4578df9)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Lift version number to v3.2.3. ([3d58df5](https://github.com/BITNP/BIThesis/commit/3d58df5f29aa464cf5b3294dd5a5ccaa53dbb6da)) by @fky2015

### Hotfix

- Typo. ([3a1f651](https://github.com/BITNP/BIThesis/commit/3a1f651b2deb6bc05767419361caca2ab6cb96ac)) by @fky2015

## [3.2.2] - 2022-12-22

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update version number. ([7053468](https://github.com/BITNP/BIThesis/commit/7053468d729c7de73a445fa198401840a5903b70)) by @fky2015

### Hotfix

- *(PT)* Remove duplicate titles in references. ([3192d88](https://github.com/BITNP/BIThesis/commit/3192d88ae435b233a59cdfdac761d94aeec12d2c)) by @fky2015

## [3.2.1] - 2022-12-19

## [3.2.0] - 2022-12-04

### <!-- 0 -->🚀 Features

- Add a padding (default 0.25em) to cover/autoWidth. ([8bff98b](https://github.com/BITNP/BIThesis/commit/8bff98b36d4a534a68995025c738e432991b54c6)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Add pdf bookmarks for \chapter* ([f477e2d](https://github.com/BITNP/BIThesis/commit/f477e2db879ca5722c18397bac74d2e146ed2074)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(dev)* Add a dev doc for maintainers. ([eee5d5a](https://github.com/BITNP/BIThesis/commit/eee5d5aafea5d4abd9e303a9235a6c48864f1692)) by @fky2015
- Add footnotes. ([f4337db](https://github.com/BITNP/BIThesis/commit/f4337db39fce4a4bd4283c31e553661b06c4e79e)) by @fky2015
- Add doc for autoWidthPadding. ([39c9d39](https://github.com/BITNP/BIThesis/commit/39c9d39bbad071b7fad28ef476ca6ad00f94fb52)) by @fky2015
- *(readme)* Add all templates. ([d6e4038](https://github.com/BITNP/BIThesis/commit/d6e403871e205aa08c220389e57d7578596f747b)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Fix typo. ([aef5bfe](https://github.com/BITNP/BIThesis/commit/aef5bfec69e55afea8ceed843a855aa33e17d90c)) by @fky2015
- Refactor issue prompt. ([990f823](https://github.com/BITNP/BIThesis/commit/990f823b4e5d03c6129fee2abb657c166f5306b9)) by @fky2015
- Lift version. ([0c5d22f](https://github.com/BITNP/BIThesis/commit/0c5d22f76ec0622fe0e62abf8b711d1a43614b1c)) by @fky2015
- Bump version. ([1ee30ac](https://github.com/BITNP/BIThesis/commit/1ee30ac126cfafc11c97d8674ddf4ebbbdb3df6b)) by @fky2015

### Build

- *(makefile)* Improve Overleaf pack logic. ([420a841](https://github.com/BITNP/BIThesis/commit/420a841c5758450535887c7f47427aaae7cfdc68)) by @fky2015

## [3.1.1] - 2022-10-30

### <!-- 1 -->🐛 Bug Fixes

- *(dtx)* Hide color and border in the hyperref. ([c2c22fa](https://github.com/BITNP/BIThesis/commit/c2c22faf1e073cb51b5c68d205ccbe21604c9300)) by @fky2015
- *(GT)* Use pifont to provide \BigStar. ([7ad372a](https://github.com/BITNP/BIThesis/commit/7ad372a5ced6139f18d50a213a4db3285aa3f8d0)) by @fky2015
- Set Times New Roman as the main font. ([5dd2999](https://github.com/BITNP/BIThesis/commit/5dd2999c85015c0e47b4864b5f28928f4f40c28b)) by @fky2015
- *(GT)* Remove the extra blank around the figure. ([15b2153](https://github.com/BITNP/BIThesis/commit/15b21536b9698ee782043bd284bc0294b94687c3)) by @fky2015
- Fix build error. ([6a50ee6](https://github.com/BITNP/BIThesis/commit/6a50ee699355a23d2502567fa549f3ec54993824)) by @fky2015
- *(ci)* Fix cls update check. ([c470b87](https://github.com/BITNP/BIThesis/commit/c470b87063d11766046d22563e7bf0996940d39c)) by @fky2015

### <!-- 2 -->🚜 Refactor

- *(github)* Update release tracker template. ([72fe3d6](https://github.com/BITNP/BIThesis/commit/72fe3d623721f048e5972ede364260e2b764ca61)) by @fky2015
- Format code. ([237232d](https://github.com/BITNP/BIThesis/commit/237232d7fc7c593c30cd4429021ac4e05c3d44b5)) by @fky2015
- Add examples on publications. ([0ea1942](https://github.com/BITNP/BIThesis/commit/0ea194239afbf6483a854b74f9ee37bd6bba4143)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add an example on customizing text in listoffigure. ([9338dcd](https://github.com/BITNP/BIThesis/commit/9338dcd517d70e9ae026a9d72f71b783122435b8)) by @fky2015
- *(manual)* Add a FAQ entry for adjusting math font. ([a774cfe](https://github.com/BITNP/BIThesis/commit/a774cfe51deeafd6c964654aea45dea2696446bb)) by @fky2015

### <!-- 6 -->🧪 Testing

- *(doctor)* Update doctor-thesis test ([5d4c72b](https://github.com/BITNP/BIThesis/commit/5d4c72b8b596c89f53048e499045bd9a5abddca1)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Add a changelog inside the manual. ([a23c7a6](https://github.com/BITNP/BIThesis/commit/a23c7a69738e6bedb79c86393c2f3657b3eee9bc)) by @fky2015

### Hotfix

- Correct hyperref option. ([250e259](https://github.com/BITNP/BIThesis/commit/250e259298e3f624c9b01f5ef25075cf3a69dde6)) by @fky2015
- Import asmsymb before unicode-math. ([65bd9c8](https://github.com/BITNP/BIThesis/commit/65bd9c8493dd0e2d021fe967fac91815089b9969)) by @fky2015

## [3.1.0] - 2022-10-24

### <!-- 0 -->🚀 Features

- Add sorting option in publications. ([5052c84](https://github.com/BITNP/BIThesis/commit/5052c84e921bca07738fcdc351b7bba420060306)) by @fky2015
- *(GT)* Manage multiple section in pubs. ([0d3a465](https://github.com/BITNP/BIThesis/commit/0d3a4659c2e3aa6eb9b2117632fe317c349d3471)) by @fky2015
- Add overridable option for \Author. ([fac3a86](https://github.com/BITNP/BIThesis/commit/fac3a86e95ce9468c6a43b8210245a88b8a20352)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Apply bold, heiti to pubsection title. ([fcddd78](https://github.com/BITNP/BIThesis/commit/fcddd789deb840e3ef1deb73c4cc1369e872ce4a)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(makefile)* Add doc comment. ([a484e57](https://github.com/BITNP/BIThesis/commit/a484e57941d52a17d14b19be6575e534d814b0bc)) by @fky2015
- Add doc for new feature in the publications. ([edf0b37](https://github.com/BITNP/BIThesis/commit/edf0b375d15472b202e60174c3b9fe0132d64186)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- *(dtx)* Add more docs. ([1e57b6c](https://github.com/BITNP/BIThesis/commit/1e57b6c0752375de41cf19da7ac10cfac03b5b2d)) by @fky2015
- *(cliff)* Fix hyperlinks. ([617dd00](https://github.com/BITNP/BIThesis/commit/617dd00b0ad9cb00e9fa8da9c6f75cafb17d7b0f)) by @fky2015

## [3.0.5] - 2022-10-17

### <!-- 0 -->🚀 Features

- *(overleaf)* Pack manual into overleaf pkg. ([4d8ab18](https://github.com/BITNP/BIThesis/commit/4d8ab183521f748f8c0049e440fd2592d827783c)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Fix typo in newline syntax. ([e016a41](https://github.com/BITNP/BIThesis/commit/e016a419ccc4db70afadbc3f74d31e024d880722)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Add initial value to setup key-value pairs. ([deadc3b](https://github.com/BITNP/BIThesis/commit/deadc3b8b228ec0d41071b91193f67a1552a677e)) by @fky2015

### <!-- 3 -->📚 Documentation

- Refine expression, add more links ([e5786c5](https://github.com/BITNP/BIThesis/commit/e5786c5a722935659389efc0af00808065570be3)) by @fky2015
- Fix readme. ([28c14a2](https://github.com/BITNP/BIThesis/commit/28c14a2991e22a5dbc717bcab9e2d0bfb6f641dd)) by @fky2015

### <!-- 6 -->🧪 Testing

- Add porcelain test. ([244bdcd](https://github.com/BITNP/BIThesis/commit/244bdcd27426b1e1548a6a33113f31a16d3503c3)) by @fky2015
- *(ci)* Fix test on checking diff. ([5929571](https://github.com/BITNP/BIThesis/commit/59295710ad303e3ca4ef4294869ffb1a41b8ea80)) by @fky2015
- *(action)* Fix the test action. ([4d15bd3](https://github.com/BITNP/BIThesis/commit/4d15bd31fbf13c95d06a8233a57d968b4f4d5e9b)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Add examples. ([293e5ee](https://github.com/BITNP/BIThesis/commit/293e5ee677d939926d06887bb9f4b9de0252aeb3)) by @fky2015
- *(examples)* Add build script for examples ([223e99f](https://github.com/BITNP/BIThesis/commit/223e99f0d96780445b3d01bc4126349c699e15d1)) by @fky2015
- Fix links in the changelog. ([1c7580a](https://github.com/BITNP/BIThesis/commit/1c7580a01ea8fbeac3820273328441f45e02f2d7)) by @fky2015
- Fix links of all old changelogs. ([a5e911d](https://github.com/BITNP/BIThesis/commit/a5e911d98a75b3963f32b8e9f2658654f0820d72)) by @fky2015

### Hotfix

- Override cls. ([b08c138](https://github.com/BITNP/BIThesis/commit/b08c138ac920f463b78866e23f8a72dee9dd5867)) by @fky2015

## [3.0.4] - 2022-10-04

### <!-- 1 -->🐛 Bug Fixes

- Typo ([fb69996](https://github.com/BITNP/BIThesis/commit/fb6999601f3745888ac470c85c26bf119528d0a3)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Docs. ([6f39a69](https://github.com/BITNP/BIThesis/commit/6f39a696521a16acd564f408745b954f69abfb48)) by @fky2015
- Update docs. ([502d370](https://github.com/BITNP/BIThesis/commit/502d370f997e980badf1db74f25cbf3bbfc65a7a)) by @fky2015
- Refactor code, add docs. ([1f3647b](https://github.com/BITNP/BIThesis/commit/1f3647bc6da286bb4ec7876b2c3a3e0aaac8ec2a)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(bithesis)* More docs for impl. ([ed07973](https://github.com/BITNP/BIThesis/commit/ed079737f7af53823cc2cc77fa4aed5baea0a160)) by @fky2015
- Update manual. ([ddf66e5](https://github.com/BITNP/BIThesis/commit/ddf66e56e8d42c0fd8b7904cb6182d6e328eca6a)) by @fky2015
- Refactor docs. ([2600677](https://github.com/BITNP/BIThesis/commit/2600677f663345eeb6ccd27ca43cc4727f3b89ee)) by @fky2015
- Finish polishing docs. ([0186b7d](https://github.com/BITNP/BIThesis/commit/0186b7d9d681a21624ab09eb5ada5976c733cbbb)) by @fky2015
- Add more jargons. ([bee591f](https://github.com/BITNP/BIThesis/commit/bee591faee2cd4ce618df56c0932cf6c190eac56)) by @fky2015
- Fix ref type. ([61b2df1](https://github.com/BITNP/BIThesis/commit/61b2df1fcef7502e475cc2b175149079b0a3c0ff)) by @fky2015

### <!-- 9 -->◀️ Revert

- Revert typo fix. ([f3b16c7](https://github.com/BITNP/BIThesis/commit/f3b16c7a14619d95f3a1ec2d5ce5c497648bf14c)) by @fky2015

## [3.0.3] - 2022-09-29

### Hotfix

- Typo on doctor ([a21ce51](https://github.com/BITNP/BIThesis/commit/a21ce5108a19241c1c0b917fe098b4e0498550cc)) by @fky2015

## [3.0.2] - 2022-09-21

### <!-- 1 -->🐛 Bug Fixes

- Update link as per new ctan package location. ([e5c5003](https://github.com/BITNP/BIThesis/commit/e5c5003ef4ab3962541115228de93fe892a65c7f)) by @fky2015
- *(GT)* Use \fangsong in acknowledgements as per specs. ([8b61111](https://github.com/BITNP/BIThesis/commit/8b611119ed5c20e114b912fb38bb7885b91d1372)) by @fky2015
- Fix broken script. ([c1da9a1](https://github.com/BITNP/BIThesis/commit/c1da9a17544ce586d7feee3af0d1c69c5d8e0c79)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Delete useless code. ([35ce1fa](https://github.com/BITNP/BIThesis/commit/35ce1fa5c456dd56999c0053be9aba61e6ab1a7f)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add comment for `twoside`. ([85ee2b9](https://github.com/BITNP/BIThesis/commit/85ee2b99078e598756557ab4bc5368330feb006d)) by @fky2015

### <!-- 6 -->🧪 Testing

- *(actions)* Using git diff to check updated cls. ([d68a5ca](https://github.com/BITNP/BIThesis/commit/d68a5cab40c1a7d7124e18b635b2b2549142c595)) by @fky2015

### Hotfix

- Add git. ([8ba8eda](https://github.com/BITNP/BIThesis/commit/8ba8eda130c072bbc9aeb648226336547ccd0360)) by @fky2015
- Try checkout after make copy. ([ec0000c](https://github.com/BITNP/BIThesis/commit/ec0000c04a84fc6bb681c740a45312fc67417e47)) by @fky2015
- Flip condition. ([0358a58](https://github.com/BITNP/BIThesis/commit/0358a58dd5e3a5d9084e2d6ef4a910f34c358f27)) by @fky2015
- Only use \fangsong in graduate thesis. ([0121d48](https://github.com/BITNP/BIThesis/commit/0121d488838ff55a6079effff9bed7e85853bf18)) by @fky2015

## [3.0.1] - 2022-09-15

### <!-- 0 -->🚀 Features

- Add verticalTitle option in book spine. ([411cedf](https://github.com/BITNP/BIThesis/commit/411cedfce1ac9ea2f97b1d88a43321dfdb122529)) by @fky2015
- Provide a option to custom the indent for bibliography. ([78c9a85](https://github.com/BITNP/BIThesis/commit/78c9a85c99de232e57daf4bd81b9b4a33dd441d9)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Bump cls version in packages. ([930fbd5](https://github.com/BITNP/BIThesis/commit/930fbd580e43b434b0b0d0e7ff57e3bf071a03af)) by @fky2015
- Refine example. ([329d1ae](https://github.com/BITNP/BIThesis/commit/329d1aef2c8c94a28043e6845a7b0eeab2a2fb20)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Uncomment default value for cover/date. ([5ec5c1e](https://github.com/BITNP/BIThesis/commit/5ec5c1ec555e828c92232a4875214d69578eeb1e)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add more precise description on `ctex`. ([e2083f0](https://github.com/BITNP/BIThesis/commit/e2083f0712222a680e56652964506ebccd002fe7)) by @fky2015
- Update manual. ([74a2780](https://github.com/BITNP/BIThesis/commit/74a27802ad2c8c2f2d4144951f699f303f80d167)) by @fky2015
- Docs on bibliographyIndent. ([193fa8f](https://github.com/BITNP/BIThesis/commit/193fa8fdaa5a8c8438f34f08c6c59760dec58b6d)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Bump version. ([5470390](https://github.com/BITNP/BIThesis/commit/5470390075fc6ec7b57e6b4eaabe8274b67a95df)) by @fky2015

## [3.0.0] - 2022-09-04

### <!-- 0 -->🚀 Features

- Finish undergraduate-thesis-en template ([3c42300](https://github.com/BITNP/BIThesis/commit/3c423007613c37f13df9da2f6461f37c653095a5)) by @fky2015
- Add \environent "symbols". ([80bfc2e](https://github.com/BITNP/BIThesis/commit/80bfc2e709fc92932a0b69a71ab121d67f14f161)) by @fky2015
- Option to add toc. ([0c1473f](https://github.com/BITNP/BIThesis/commit/0c1473f4b053fe7b602e6d3331b6a2901092484a)) by @fky2015
- Support auto wrap and auto width cover entry. ([eff8f61](https://github.com/BITNP/BIThesis/commit/eff8f61c77dbfe71a89937eddb869b91a0167efc)) by @fky2015
- Add blindPeerReview mode to all thesis. ([ac10ffa](https://github.com/BITNP/BIThesis/commit/ac10ffa7898de5691e75c6d6b9772b73acdecc37)) by @fky2015
- Support chapter level appendices. ([194ee2c](https://github.com/BITNP/BIThesis/commit/194ee2c11908111d06f7f810869de1e9942a0c50)) by @fky2015
- Add common math environment with example. ([6d29769](https://github.com/BITNP/BIThesis/commit/6d29769a6aaf98182e16c8d247823f8028f147c2)) by @fky2015
- Copy manual into release pack. ([317ab38](https://github.com/BITNP/BIThesis/commit/317ab38cd95f66d272bade227d0f56c0819bef6b)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- 修复本科毕设的附录编号格式 ([4d2a76d](https://github.com/BITNP/BIThesis/commit/4d2a76d1131ddafbbc6edcbab240b5e719a0282f)) by @everything411
- Remove space in demo. ([61f9ebb](https://github.com/BITNP/BIThesis/commit/61f9ebb97bf7b732325cf45146a5a6247d69e9ce)) by @fky2015
- *(docs)* Remove minted. ([40cfc68](https://github.com/BITNP/BIThesis/commit/40cfc687e9b73c73f7a86b5f78f611132e110037)) by @fky2015
- Fix example info. ([6661a53](https://github.com/BITNP/BIThesis/commit/6661a53ec09e47873d695a22c1e8c731095f16c0)) by @fky2015
- Fix conclusion's title. ([d4509f7](https://github.com/BITNP/BIThesis/commit/d4509f7389e59c490fcaf09231b5d0ed79800f10)) by @fky2015
- Fix twoside mod ([a9fb4d3](https://github.com/BITNP/BIThesis/commit/a9fb4d36ca775effc80bc1816bbb682887a3e793)) by @fky2015
- Fix main example. ([ea304a5](https://github.com/BITNP/BIThesis/commit/ea304a51c53d59f48474761c608c31b02fa63048)) by @fky2015
- Fix References english title. ([cb16f0b](https://github.com/BITNP/BIThesis/commit/cb16f0bd6981a9e66420068aeaa11e27214da1e0)) by @fky2015
- Fix PT cover spacing. ([ab5e47c](https://github.com/BITNP/BIThesis/commit/ab5e47c8b1d37907ef79ee232cfe55b9d8b180c8)) by @fky2015
- Remove abstract TOC according to inst. ([e8c4b66](https://github.com/BITNP/BIThesis/commit/e8c4b66ec7aca968d8c0d46e4b469b348ac755f6)) by @fky2015
- Fix github action ([ce0c431](https://github.com/BITNP/BIThesis/commit/ce0c431429a0b1647bb487fbe40f136e2a536bc5)) by @fky2015
- *(UPR)* Move settings to cls file. ([4a927f7](https://github.com/BITNP/BIThesis/commit/4a927f7a5953036065bd53e6ef43aa2354e029e8)) by @fky2015
- Pass options to ctex in a seperate option. ([9d17ba5](https://github.com/BITNP/BIThesis/commit/9d17ba55c042084793f67e33cd4bd9e40d87b8bf)) by @fky2015
- Suppress harmless warning. ([17c5cee](https://github.com/BITNP/BIThesis/commit/17c5cee1ccc01cc4b95d92e02b37516af84024a8)) by @fky2015
- Fix typo. ([3855374](https://github.com/BITNP/BIThesis/commit/385537445fb77d49c9b16c855e7a37b113f70228)) by @fky2015
- Mode issue caused by outdated code. ([62f49bf](https://github.com/BITNP/BIThesis/commit/62f49bf31275d4e8e129cc8a64270e75b633c9d5)) by @fky2015

### <!-- 2 -->🚜 Refactor

- 表格方面改为三线表制(#148) ([2c560ad](https://github.com/BITNP/BIThesis/commit/2c560ade94092b6a5c0a46fb49753c7a431d7320)) by @Hibiscus-2333 in [#148](https://github.com/BITNP/BIThesis/pull/148)
- Refactor UPR using latex3. ([d515600](https://github.com/BITNP/BIThesis/commit/d5156007cdb2fd80fbe21080d9ac5fc73d031074)) by @fky2015
- *(docs)* Use l3doc as documentclass ([aa50edb](https://github.com/BITNP/BIThesis/commit/aa50edb60b0e8c351d094b61f311debdcf4a3726)) by @fky2015
- Merge UT originality claim. ([f9fee20](https://github.com/BITNP/BIThesis/commit/f9fee200382d22f868bc30c2e37ed751f4f99662)) by @fky2015
- [**breaking**] Remove searching for STXihei due to poor performance. ([26d715e](https://github.com/BITNP/BIThesis/commit/26d715e3b819757e79b764bff732901888cc3044)) by @fky2015
- Extract const name. ([30da6e7](https://github.com/BITNP/BIThesis/commit/30da6e724559aa6a2713beeb5ab187de407a9f55)) by @fky2015
- Refactor undergraduate-thesis ([53099d3](https://github.com/BITNP/BIThesis/commit/53099d3a19f4808c0838f7c3649d786160dcabd5)) by @fky2015
- Use option. ([d481a5c](https://github.com/BITNP/BIThesis/commit/d481a5c5e8fabfe6b0fdc8b476e1758e8c8cb9bc)) by @fky2015
- Refactor ([119b6fd](https://github.com/BITNP/BIThesis/commit/119b6fda6270f874cb2c1b920b27247e66d26772)) by @fky2015
- Refactor. ([ce6ef65](https://github.com/BITNP/BIThesis/commit/ce6ef657bd344f54ea5122540916bfcc05124857)) by @fky2015
- Refactor code with more docs. ([e9d0ad1](https://github.com/BITNP/BIThesis/commit/e9d0ad18fc7ea236e26fd2a7eb4fed05bddb8eaf)) by @fky2015
- Refactor variable name. ([2bb2689](https://github.com/BITNP/BIThesis/commit/2bb26891c1af2c77e357c8aaf275370f7d40dfad)) by @fky2015
- Squash to dtx file. ([2621f7b](https://github.com/BITNP/BIThesis/commit/2621f7bc7f90aa6c905342291da8dae9c5ebb85a)) by @fky2015
- Refactor UPR cover ([e8e896c](https://github.com/BITNP/BIThesis/commit/e8e896ca2f94bb08a54b12da01c16d47303cbbb2)) by @fky2015
- Refactor comments. ([3571bda](https://github.com/BITNP/BIThesis/commit/3571bdadd0a13bf7f33f789fc9a707c8f4acdb7d)) by @fky2015
- Refactor in dtx. ([94df814](https://github.com/BITNP/BIThesis/commit/94df81470387db015b04a823d08ea9a91ac787b1)) by @fky2015
- Abstract* to abstractEn ([05011af](https://github.com/BITNP/BIThesis/commit/05011af69ac779208d88edea9236c6c271bd1023)) by @fky2015
- [**breaking**] Merge environment options to setup. ([3b0fbac](https://github.com/BITNP/BIThesis/commit/3b0fbac22146484af050177605fb088882c89289)) by @fky2015
- Use variant x instead of e. ([83a76c6](https://github.com/BITNP/BIThesis/commit/83a76c6a940fb377367e785d5a6763e9cb3bb556)) by @fky2015
- Bump pkg version ([f4f1f2a](https://github.com/BITNP/BIThesis/commit/f4f1f2a41d5c4af72e3686dd7c61cb4635581820)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add docs for predefined theorem. ([b2753df](https://github.com/BITNP/BIThesis/commit/b2753df7eafa043eba6bb7be09a08cbe53478893)) by @fky2015
- Add more docs for optional arguments. ([7421bc3](https://github.com/BITNP/BIThesis/commit/7421bc347f663180f92cf54efa9905edb9739bca)) by @fky2015
- Refine manual. ([2cff7d1](https://github.com/BITNP/BIThesis/commit/2cff7d1d39c58792c9cd960a2b4ef4f6a9196b45)) by @fky2015
- *(readme)* Refine docs, add LaTeX syntax. ([9a9b676](https://github.com/BITNP/BIThesis/commit/9a9b67660f2d97cdaa7e21b2736975209e8eff7a)) by @fky2015
- *(.dtx)* Add more docs. ([29bf235](https://github.com/BITNP/BIThesis/commit/29bf235ec333c6330c1721c3a6e8e78677a0bd6e)) by @fky2015
- *(bitehsis)* More details on bitreport. ([939bc03](https://github.com/BITNP/BIThesis/commit/939bc03815cd9a1294da46623565f7fe22ee8fa8)) by @fky2015
- *(readme)* Add more info in templates' readme. ([286585c](https://github.com/BITNP/BIThesis/commit/286585ce443f10481c33b9f7b7c3205db692fe6c)) by @fky2015
- Update instruction ([670c3fc](https://github.com/BITNP/BIThesis/commit/670c3fc40d6d6dfed329977917d2d77f8ab36598)) by @fky2015
- *(readme)* Refactor home page. ([f15faeb](https://github.com/BITNP/BIThesis/commit/f15faeb3e3505cba9498f17134a2b6e9bc5b8487)) by @fky2015
- Add more instructions for the developers. ([20444a3](https://github.com/BITNP/BIThesis/commit/20444a3e84b99b020b3d9878936ad61244ed75c7)) by @fky2015
- Add link to documentation. ([cd021a1](https://github.com/BITNP/BIThesis/commit/cd021a1102034dc462b4aac8504a851ff28f3d46)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Chore on docs ([911447f](https://github.com/BITNP/BIThesis/commit/911447f237124d42555711830ce5e2598aac3efb)) by @fky2015
- Add typos check. ([a990994](https://github.com/BITNP/BIThesis/commit/a990994f0513b4d951cf0941d9d08411165781b8)) by @fky2015
- Check whole repos. ([6ad541e](https://github.com/BITNP/BIThesis/commit/6ad541efcb4112f61884f150ed3350b0173d4e9e)) by @fky2015
- Rename config file. ([755b52f](https://github.com/BITNP/BIThesis/commit/755b52fec8251bfa8ea8bb816b372882b314f841)) by @fky2015
- Update cover converter script ([a3f4f45](https://github.com/BITNP/BIThesis/commit/a3f4f4511558d8b042544623ec0c03e9c81a107a)) by @fky2015

### WIP

- *(UT)* Pack to latex3 ([d3b61d1](https://github.com/BITNP/BIThesis/commit/d3b61d16077a358c9d1dbb9b934afeb0d788ba57)) by @fky2015
- *(UT)* Use xparse. ([e330458](https://github.com/BITNP/BIThesis/commit/e33045812dff9d6aa1c3b6f198c574ae73db2b6d)) by @fky2015
- *(UT)* Make cover ([f7a20a8](https://github.com/BITNP/BIThesis/commit/f7a20a8a7fa71dc12c2ccf15d694c65944659bd1)) by @fky2015
- *(UT)* Add abstract to package. ([045c120](https://github.com/BITNP/BIThesis/commit/045c12022d0eac902aa6fb1368fc8099b9b1f839)) by @fky2015
- Finish UT migration ([c00f6e4](https://github.com/BITNP/BIThesis/commit/c00f6e41ea1fddfdad8e6e52e5b2f2e7c7aa3630)) by @fky2015
- Update PT to latex3 ([19b7185](https://github.com/BITNP/BIThesis/commit/19b7185b61d216ca5d2d09936dea4b1b26d6ceb1)) by @fky2015

### Hotfix

- *(docs)* Compile conflict. ([7d577c9](https://github.com/BITNP/BIThesis/commit/7d577c93255ffc6124fe2dda529160dd10045a86)) by @fky2015
- Typos in gh action workflow. ([a6029ed](https://github.com/BITNP/BIThesis/commit/a6029ed026abb514c7abbcabea42e6509b0a6412)) by @fky2015
- Typos. ([ce05f02](https://github.com/BITNP/BIThesis/commit/ce05f020636ac7e3f267c616b063c6dca6905997)) by @fky2015

## New Contributors
* @Hibiscus-2333 made their first contribution in [#148](https://github.com/BITNP/BIThesis/pull/148)
* @everything411 made their first contribution
## [2.2.4] - 2022-06-08

### <!-- 0 -->🚀 Features

- *(PS)* Extract a latex3 class file. ([c29bae2](https://github.com/BITNP/BIThesis/commit/c29bae2366c77f996c3a8dc74faf1a7f6bba875c)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Use \RequirePackage in favor of \usepackage. ([6bc9b17](https://github.com/BITNP/BIThesis/commit/6bc9b17a1668ea498561b6df1bb216e775ac504f)) by @fky2015
- *(UT)* Fix bib date format. ([21ea984](https://github.com/BITNP/BIThesis/commit/21ea98408ef7daea963512e5cd5fa4bc26f568d5)) by @fky2015
- Remove unused package. ([a7847ed](https://github.com/BITNP/BIThesis/commit/a7847ed8bc36f0a852aec6a16016dfbce4ead300)) by @fky2015
- *(PT)* Cover fix #144 ([df76cba](https://github.com/BITNP/BIThesis/commit/df76cbaa8cd8c2b725a635d469c6ff38f1e50401)) by @fky2015

### <!-- 2 -->🚜 Refactor

- \upcite -> \cite ([ad36f48](https://github.com/BITNP/BIThesis/commit/ad36f484c0d8d6f9b4af2f911e6b4d1548f85736)) by @fky2015
- Remove test control sequence. ([aeecf84](https://github.com/BITNP/BIThesis/commit/aeecf84b5bb9bd53d1c7a341f1ed42cbc81dd661)) by @fky2015
- *(PS)* Move main color theme definition to cls. ([3ad7d3e](https://github.com/BITNP/BIThesis/commit/3ad7d3e4ab3ee90d1c01ae436859cad2ddafce0b)) by @fky2015
- *(PS)* Move \usetheme to cls. ([d4e2b3d](https://github.com/BITNP/BIThesis/commit/d4e2b3d7304242e6b496d925a344d60c5f715b5a)) by @fky2015
- Copyright header in tex. ([3933684](https://github.com/BITNP/BIThesis/commit/39336847580653d678de903c29864abe36127521)) by @fky2015
- Update copyright file header. ([63fb411](https://github.com/BITNP/BIThesis/commit/63fb411d191cb19e4e33b0f8f1022fc7a92c85a6)) by @fky2015
- *(LR)* [**breaking**] Extract the lab-report into new cls. ([b8993ef](https://github.com/BITNP/BIThesis/commit/b8993ef453f376cea13194c92a0a9248ff8c7fbf)) by @fky2015
- Refactor!(LR): use l3keys. ([bb7d3c9](https://github.com/BITNP/BIThesis/commit/bb7d3c9ae4398481ea2d5947c3d6ae7052f4a3a4)) by @fky2015
- *(UPR)* Use built-in figure. ([f15704b](https://github.com/BITNP/BIThesis/commit/f15704b0a0d43e699bab537e7085e4928f6d1450)) by @fky2015
- *(UPR)* Use \ctexset instead of deprecated \CTEXoptions. ([702ec6b](https://github.com/BITNP/BIThesis/commit/702ec6bf907637170f4657ae078ec3f0c16fe50c)) by @fky2015

### Refactor

- *(PS)* Docs and warning fix. ([61b2a42](https://github.com/BITNP/BIThesis/commit/61b2a42f0757163c1e98d48b8eabea7517dc49db)) by @fky2015

## [2.2.3] - 2022-05-09

### <!-- 0 -->🚀 Features

- *(LR)* Make teacherName optional. ([f8e4379](https://github.com/BITNP/BIThesis/commit/f8e4379b5c568457fb175e8029534b7a12fb47fb)) by @fky2015
- *(LR)* Custom date. ([510e367](https://github.com/BITNP/BIThesis/commit/510e367e20e7e0d56699fe8a495185db923d13c6)) by @fky2015
- *(LR)* Add bibliography. ([8c34533](https://github.com/BITNP/BIThesis/commit/8c345331006d9e1087ba110765b75b552390c940)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Fix issue templates unique id. ([7ec6a4e](https://github.com/BITNP/BIThesis/commit/7ec6a4eb1878a481b53561de24ec4571bd0435fa)) by @fky2015
- Fix unique template ([2325224](https://github.com/BITNP/BIThesis/commit/23252240908f99d5976dda9917dfd0a9b2d37c5c)) by @fky2015
- Remove conflict definition. ([fc6b3f4](https://github.com/BITNP/BIThesis/commit/fc6b3f4291a9a4ccc28795f60c276c523219bc5b)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Remove theorem. ([9805f5d](https://github.com/BITNP/BIThesis/commit/9805f5d7bd21278bfcb49c4946a99852c2696a56)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(readme)* Fix typo. ([8ec3db3](https://github.com/BITNP/BIThesis/commit/8ec3db397e9615590455c18ece20a4cfbf1978aa)) by @fky2015
- Add ISSUE_TEMPLATE config.yaml ([5519740](https://github.com/BITNP/BIThesis/commit/55197409790aaa70bdac2ac232a67bdd975b634a)) by @fky2015
- *(issue)* Add formated issue template. ([7dfc517](https://github.com/BITNP/BIThesis/commit/7dfc517dc195ddfc7bffa28a16f9d226cedb7e0e)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Fix emoji. ([c64620d](https://github.com/BITNP/BIThesis/commit/c64620d9fc3da5f8409b9305cc97988badb11849)) by @fky2015

### Dev

- *(github)* Add release issue tracker template. ([afe4a73](https://github.com/BITNP/BIThesis/commit/afe4a73b0c1cccf14622ac24872a9ed83d821e6b)) by @fky2015

## [2.2.2] - 2022-04-22

### <!-- 0 -->🚀 Features

- Give a workaround to redefine page head. ([2f0e7e4](https://github.com/BITNP/BIThesis/commit/2f0e7e4e7d2bf3470cf878f83e9242c6d817087c)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Add same method hint to PT. ([c6bbbc3](https://github.com/BITNP/BIThesis/commit/c6bbbc3e44af50f889d53f0cdb3ae8a7fa3dd770)) by @fky2015

### <!-- 2 -->🚜 Refactor

- *(ci)* Add name to github action - test. ([52290ca](https://github.com/BITNP/BIThesis/commit/52290ca236b51aaed72d3380d635e5cd2d7b7324)) by @fky2015

### <!-- 3 -->📚 Documentation

- Add disclaimer about master-thesis. ([c156132](https://github.com/BITNP/BIThesis/commit/c156132f57c3fa92aa7bc0712e5a8b61799e5c4e)) by @fky2015
- *(bithesis-readme)* Specify instruction on bithesis. ([1a0dfa7](https://github.com/BITNP/BIThesis/commit/1a0dfa7566db47f07f00087e707e537bdeea7e32)) by @fky2015
- *(readme)* Fix wrong dev guide. ([5bab59a](https://github.com/BITNP/BIThesis/commit/5bab59a3ccc3a5f5162ab6f5a7b17734b8c2e410)) by @fky2015
- *(readme)* Add guide on test. ([f62bbb2](https://github.com/BITNP/BIThesis/commit/f62bbb21158539f7a73c91b5409727c4e4dc8d3a)) by @fky2015
- *(bithesis-readme)* Add maintainer info. ([3e9d68c](https://github.com/BITNP/BIThesis/commit/3e9d68c8925ffd9e5246d9e60660397bc68508cb)) by @fky2015
- *(readme)* Add badge for CTAN and CI. ([319fabb](https://github.com/BITNP/BIThesis/commit/319fabb7005b300f0852a91090ebf73046f01d21)) by @fky2015
- *(assets)* Remove slack icon. ([5f2ed1d](https://github.com/BITNP/BIThesis/commit/5f2ed1d1457a8714bbc85eb000ce6c89d2c08354)) by @fky2015
- *(readme)* Add release workflow for maintainer. ([79d77e1](https://github.com/BITNP/BIThesis/commit/79d77e11bdf4460cef2eeb4d9e286d1ddfda8c77)) by @fky2015
- Fix hierarchy in markdown. ([62e52b7](https://github.com/BITNP/BIThesis/commit/62e52b74dbb97d6e197962e26e687e818320d19a)) by @fky2015
- Add reference documents. ([37dab91](https://github.com/BITNP/BIThesis/commit/37dab91615037310db15745ce3be41df56e06402)) by @fky2015
- Refine workflow. ([5f736ea](https://github.com/BITNP/BIThesis/commit/5f736eabf34b68ae84f5993a8f5c924243c9e0d4)) by @fky2015
- Add commit to changelog settings. ([677eabc](https://github.com/BITNP/BIThesis/commit/677eabcc1446a0f21a68fb0e74d041748f1ecef0)) by @fky2015

### <!-- 7 -->⚙️ Miscellaneous Tasks

- *(assets)* Remove useless file. ([bf3aae5](https://github.com/BITNP/BIThesis/commit/bf3aae5ea905ee62fda3ab9b80a4bf1b997f48d9)) by @fky2015
- Refactor anchor's name. ([c23686b](https://github.com/BITNP/BIThesis/commit/c23686b3df4755fa8da100752b3f79fa1cc804be)) by @fky2015

### Release

- *(ctan)* Release bithesis v2.1.0 ([22fe03c](https://github.com/BITNP/BIThesis/commit/22fe03cd243281ee158bacf6e4f94f2bf12ae89c)) by @fky2015

## New Contributors
* @alanyoungCN made their first contribution
## [2.2.1] - 2022-04-14

### <!-- 0 -->🚀 Features

- *(templates)* Add .gitignore that empower version control. ([8e8872b](https://github.com/BITNP/BIThesis/commit/8e8872b0cea4e18993ac55d22b6599d54b93fcbb)) by @fky2015
- Use biblatex in favor of natbib. ([2c132f6](https://github.com/BITNP/BIThesis/commit/2c132f66a2d836a51c0e2ae122642bc2734dfbe8)) by @fky2015
- *(test)* Add filter to regression-testing. ([a0137a9](https://github.com/BITNP/BIThesis/commit/a0137a926750a35b0bd84007bd8bff3f759b29c1)) by @fky2015
- *(master-thesis)* Improve spine styles. ([b79cec6](https://github.com/BITNP/BIThesis/commit/b79cec6a1d8379fa4af92893340671cc806084a3)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- *(ci)* Change working dir to ./templates. ([c2ed2c9](https://github.com/BITNP/BIThesis/commit/c2ed2c97d5629768c8dbf846e8394631d00f6982)) by @fky2015
- *(bithesis)* Resolve statement issue when uploading CTAN. ([2627834](https://github.com/BITNP/BIThesis/commit/2627834188d97ebdcc99006e79e56fe1495f098b)) by @fky2015
- *(make)* Clean zip before package, defensively. ([bb18cb7](https://github.com/BITNP/BIThesis/commit/bb18cb7d981d6dd90810a11562493867fdcf1a1e)) by @fky2015
- *(test)* Fix regression-testing scripts. ([47e2a6f](https://github.com/BITNP/BIThesis/commit/47e2a6f62f13939a9426fddfad47196b60c8e671)) by @fky2015
- *(master-thesis)* Remove bst file. ([25f2c21](https://github.com/BITNP/BIThesis/commit/25f2c212ec34c7520a9e3a8ce1a988cadd792716)) by @fky2015
- *(MT)* Remove redundancy space. ([d2cd9c2](https://github.com/BITNP/BIThesis/commit/d2cd9c2841e897fceeec6ee0490cc2fd613e486b)) by @fky2015
- Add a note as workaround to modify cls. ([f80a25d](https://github.com/BITNP/BIThesis/commit/f80a25d1ecb794c9b3f11ae6e5a22ce3228eb868)) by @fky2015
- Ignore more build files. ([bb4e1de](https://github.com/BITNP/BIThesis/commit/bb4e1de2aa7996aeb3a7d839e4988ce1568df174)) by @fky2015

### <!-- 2 -->🚜 Refactor

- Rename master branch to main. ([8967957](https://github.com/BITNP/BIThesis/commit/8967957d67609464914f59a3fa1ff1d4b5dd593d)) by @fky2015

### <!-- 3 -->📚 Documentation

- Fix badgen link. ([64180f3](https://github.com/BITNP/BIThesis/commit/64180f39923df41829bafc7d4f85cab685e8bb9c)) by @fky2015

### WIP

- Do not push ([43c45b6](https://github.com/BITNP/BIThesis/commit/43c45b6aa229fa6aadf879afa6ec2169f3dd1258)) by @fky2015

## [2.2.0] - 2022-04-02

### <!-- 0 -->🚀 Features

- Pack up presentation-slide in release hook. ([403c6c2](https://github.com/BITNP/BIThesis/commit/403c6c2753c1c8972b3dba082891bd0242378a0b)) by @fky2015
- Init bitgrad.cls ([6f19ab0](https://github.com/BITNP/BIThesis/commit/6f19ab068ed0d8ecb630277756fe4165a2c6af88)) by @fky2015
- Move project scaffold as templates ([1b2c387](https://github.com/BITNP/BIThesis/commit/1b2c38737b457c92e089a77e930c2d8465a7b3f8)) by @fky2015
- Add overleaf zip generation script. ([9ecf95c](https://github.com/BITNP/BIThesis/commit/9ecf95c6a21ad28474d3482bbd47daa7da54d838)) by @fky2015
- Update readme. ([43ca60d](https://github.com/BITNP/BIThesis/commit/43ca60dcfd07c396e8bc603143a0657c338bb154)) by @fky2015
- *(CI)* Add CI for the test. ([e63df18](https://github.com/BITNP/BIThesis/commit/e63df18b3299c025fedfc9228d207de35cd189d3)) by @fky2015
- Add latexmkrc to templates. ([994b8b9](https://github.com/BITNP/BIThesis/commit/994b8b9946c26376e0e9b50c3c1ce43074de9563)) by @fky2015
- Install core-web-fonts. ([5911093](https://github.com/BITNP/BIThesis/commit/591109300c16d24ddef369f3c19097182c036d55)) by @fky2015
- *(CI)* Add CHANGELOG.md via git-cliff. ([75fbea0](https://github.com/BITNP/BIThesis/commit/75fbea0f3865e50da1dedf1c500a08d9dc6749fc)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Complete bug report template. ([494c699](https://github.com/BITNP/BIThesis/commit/494c699bc92dda6486a52ebdae7cd37fe6abd6f9)) by @fky2015
- *(github)* Add MRE. ([dab6f7b](https://github.com/BITNP/BIThesis/commit/dab6f7bae5650901cdc79acb7ab9562379e8f6dd)) by @fky2015
- Release zip CI. ([1a6e34e](https://github.com/BITNP/BIThesis/commit/1a6e34e710694fcf88b56e482db73c8315fcea19)) by @fky2015
- Link in readme to EN version. ([27d9bc2](https://github.com/BITNP/BIThesis/commit/27d9bc253a3229e0e82abbc1c9326ce76b2c9158)) by @fky2015
- *(CI)* Fix depends ([9ed5321](https://github.com/BITNP/BIThesis/commit/9ed532122ecac913d2cf386e421225872fc88842)) by @fky2015
- CI. ([5693400](https://github.com/BITNP/BIThesis/commit/569340056b17d3655636911a46e17fe546eb29a1)) by @fky2015
- Remove Noto Serif CJK SC dependency. ([d80a3fd](https://github.com/BITNP/BIThesis/commit/d80a3fd97fb97bb55aa9cff24023c6d99b99b6bd)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(CHANGELOG)* Add changelog. ([44f51eb](https://github.com/BITNP/BIThesis/commit/44f51ebde5c4b1e3b49398c8eb5f3a50361e0740)) by @fky2015

## [2.1.2] - 2022-01-01

### <!-- 0 -->🚀 Features

- Migrate to QQ Chat Group. ([ca7495c](https://github.com/BITNP/BIThesis/commit/ca7495c5773584e24c01dbbaff162bf694f7b52a)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- AutoFakeBold option fix in proposal-report. ([356e9b6](https://github.com/BITNP/BIThesis/commit/356e9b60fc3ca1d46b146436bcbcf81872fd8bfb)) by @fky2015
- Proposal-report's bad bold effect. ([0fe3aca](https://github.com/BITNP/BIThesis/commit/0fe3aca91c25eb76f3714b157cdb3a59ba7c0fdf)) by @fky2015
- Format space. ([d39f76c](https://github.com/BITNP/BIThesis/commit/d39f76cc73ba4d44bd60887b447002523cbd3d59)) by @fky2015

## [2.1.1] - 2021-09-10

### <!-- 0 -->🚀 Features

- Add paper-translation-related code. ([f08cc51](https://github.com/BITNP/BIThesis/commit/f08cc51ce3355ac19fbf64ea2b3240fe01e8ec78)) by @fky2015
- Key-value option support for footskip in bitbook. ([98420a5](https://github.com/BITNP/BIThesis/commit/98420a598c3d7e02efbb0f2fdd3b41c205015f43)) by @fky2015
- Add listings caption support. ([f059c30](https://github.com/BITNP/BIThesis/commit/f059c301aba55ccb8ed1e13f5d047316bad81ca7)) by @fky2015
- Add option to toggle title number with Heiti font. ([a975525](https://github.com/BITNP/BIThesis/commit/a975525833bdc303832a78aeb6f9a3091aa7e2d4)) by @fky2015
- Prepare for new package update to upload. ([8c3ee54](https://github.com/BITNP/BIThesis/commit/8c3ee54f5d7948b16eae35e6d34917057e24fe97)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- *(docs)* Badge fix in readme. ([71cda67](https://github.com/BITNP/BIThesis/commit/71cda67a58b8bf90f003fe6f0a1631e713f69307)) by @fky2015

### Improvement

- *(docs)* Add maintainer wanted, add docs link. ([dda3abf](https://github.com/BITNP/BIThesis/commit/dda3abf06d97445d27273742010f66b8e4450c66)) by @fky2015

## [2.0.0] - 2021-01-12

### <!-- 0 -->🚀 Features

- Prepare for CTAN version v1.0.1 ([7b26976](https://github.com/BITNP/BIThesis/commit/7b26976fc38a48eb5a5c38ad7a11d4d7090aba26)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- *(makefile)* Correct `yes` args. ([2d40568](https://github.com/BITNP/BIThesis/commit/2d4056896352ad5db5fc058dc4acf8b2e1dc16af)) by @fky2015

## New Contributors
* @guguguxiao made their first contribution in [#60](https://github.com/BITNP/BIThesis/pull/60)
## [1.2.1] - 2020-12-30

### <!-- 0 -->🚀 Features

- *(LaTeX)* Init a dtx project. ([77b2494](https://github.com/BITNP/BIThesis/commit/77b249495023bcfa46590a2028927d3922760b91)) by @fky2015
- Finish migration ([9deacc2](https://github.com/BITNP/BIThesis/commit/9deacc22b9493918864fb1a92329ffd07419f712)) by @fky2015
- Add more description in doc. ([c3bd6f4](https://github.com/BITNP/BIThesis/commit/c3bd6f4222e4979a0396af180d7eb679ffcaf6c0)) by @fky2015
- Add more history. ([2f561bb](https://github.com/BITNP/BIThesis/commit/2f561bb5aeb553b10256cccfc4612960385bfedb)) by @fky2015
- Update docs and build script. ([5bd40a0](https://github.com/BITNP/BIThesis/commit/5bd40a01adf4f78b9d0b3e6612e6834c01e14542)) by @fky2015

### <!-- 1 -->🐛 Bug Fixes

- Add more content in bithesis.pdf docs. ([fe16fa0](https://github.com/BITNP/BIThesis/commit/fe16fa00b99af123616c1deaefd1d51c5c85c527)) by @fky2015

### <!-- 2 -->🚜 Refactor

- *(doc)* Basic maintanence ([94bf84d](https://github.com/BITNP/BIThesis/commit/94bf84d748fe8d9702be9f2811fadd1f7b083207)) by @fky2015
- *(readme)* Change maintainance info. ([0c972a3](https://github.com/BITNP/BIThesis/commit/0c972a3e7773de89dd4c9c0174624a9d9baf2554)) by @fky2015

### <!-- 3 -->📚 Documentation

- *(readme)* Add period. ([0374e3e](https://github.com/BITNP/BIThesis/commit/0374e3efd952e73d85522a3d29b5ebbe4b2333fb)) by @fky2015
- Add more dev docs. ([27cd897](https://github.com/BITNP/BIThesis/commit/27cd897e66a6cc236e438ebff4257245ad0dbd4c)) by @fky2015
- *(readme, doc)* Repair the invalid links. ([167657c](https://github.com/BITNP/BIThesis/commit/167657ce9dc7b891425319961dfbbd6ff6fe593c)) by @fky2015
- *(readme,doc)* Upadate the links' text ([618c01c](https://github.com/BITNP/BIThesis/commit/618c01c4743adfceff20efdd5f9ceb5f0afa4874)) by @DeltaHao
- *(doc.pdf)* Repair ([300e7b2](https://github.com/BITNP/BIThesis/commit/300e7b2ee6b7b9da4a37a130b0cf682df65be1a9)) by @DeltaHao
- *(doc)* Domain ([a9fe9fc](https://github.com/BITNP/BIThesis/commit/a9fe9fc342ee0c8b0b7d38305dccc5dbff014e6e)) by @DeltaHao

### <!-- 7 -->⚙️ Miscellaneous Tasks

- Update wiki deps ([f13202b](https://github.com/BITNP/BIThesis/commit/f13202b1fa569559a6f92c87ba7bd655efbddf44)) by @spencerwooo
- Update github action to v2.0. ([927d20f](https://github.com/BITNP/BIThesis/commit/927d20f7e268758fb13d6c5797bb3d810e6e174b)) by @fky2015

### Build

- Add pkg build command to makefile. ([e9dcf6d](https://github.com/BITNP/BIThesis/commit/e9dcf6d8395292ec78bb20abda9b4cbf87adf749)) by @fky2015

## New Contributors
* @DeltaHao made their first contribution
## [1.2.0] - 2020-06-01

### <!-- 1 -->🐛 Bug Fixes

- *(docs/contributing)* Fix typo ([a783c9f](https://github.com/BITNP/BIThesis/commit/a783c9f73c035905856647b65e5c8cee5c80c297)) by @fky2015
- Format issues and typos ([f79a353](https://github.com/BITNP/BIThesis/commit/f79a353638992fb1e645db3cdd6f42223dcd2717)) by @spencerwooo

### <!-- 3 -->📚 Documentation

- *(vuepress)* Add header link to slack channel ([1349723](https://github.com/BITNP/BIThesis/commit/1349723860117f25b26aedad23487176bc25416b)) by @fky2015
- *(contributing)* Add chinese version of contributing.md ([be671d7](https://github.com/BITNP/BIThesis/commit/be671d73173ab9c69caf9eeb7748de2f51d9f548)) by @fky2015
- *(wiki&contributing)* Add contributing to wiki. add Bilingual badge ([3f5b970](https://github.com/BITNP/BIThesis/commit/3f5b970689d41940aa178bffb9dc73f8ef9e6b2d)) by @fky2015
- *(contributing)* Add contributing clause to readme ([60c1b28](https://github.com/BITNP/BIThesis/commit/60c1b28bfa124b498df0f3aa3ac1309f15771393)) by @fky2015

## [1.1.0] - 2020-05-19

### <!-- 3 -->📚 Documentation

- *(contributing)* Add contributing.md ([24aee3d](https://github.com/BITNP/BIThesis/commit/24aee3d9c4c3c3c89a0f175649fd6d90e4ee27cd)) by @fky2015

## New Contributors
* @felinae98 made their first contribution
* @shoopshoop made their first contribution
## [1.0.2] - 2020-05-04

## [1.0.1] - 2020-04-26

## New Contributors
* @ZIJIN-Evan made their first contribution
## [1.0.0] - 2020-04-22

## [0.1.1] - 2020-04-10

## [0.1.0] - 2020-04-01

### <!-- 1 -->🐛 Bug Fixes

- Fix the layout ([22a8ed2](https://github.com/BITNP/BIThesis/commit/22a8ed2fffe00c482c9aeabd005c52d9a56fdffd)) by @mwl0811

## New Contributors
* @mwl0811 made their first contribution
## [0.0.3] - 2020-03-15

### <!-- 1 -->🐛 Bug Fixes

- *(lab-report)* Modfiy title and picture position ([2f90368](https://github.com/BITNP/BIThesis/commit/2f9036828b5416c264d7cf38b8a87061f51f255a)) by @Silverster98

### <!-- 3 -->📚 Documentation

- *(latex doc)* Add doc charpter 5, 6, 7 content ([9abd384](https://github.com/BITNP/BIThesis/commit/9abd38442df5fb8ed108c982e49b60280df157ab)) by @Silverster98
- *(README-zh.md lab-report/README.md)* Add content in README-zh.md and lab-report/README.md ([a63078d](https://github.com/BITNP/BIThesis/commit/a63078dce5e8b746a9d9161dddd75e697290f1a2)) by @Silverster98
- *(README-zh.md)* Fix content link ([904f201](https://github.com/BITNP/BIThesis/commit/904f2019dbcbe4ac5c433c7ed70723dfc88d76f7)) by @Silverster98

## [0.0.2] - 2020-03-02

### <!-- 1 -->🐛 Bug Fixes

- *(all)* Modify chapter style ([0e1bf37](https://github.com/BITNP/BIThesis/commit/0e1bf37d521ffc959c2a11bee672085b80183ade)) by @Silverster98

## [0.0.1] - 2020-02-29

### <!-- 0 -->🚀 Features

- *(lab-report)* Add template for experiment report ([6514504](https://github.com/BITNP/BIThesis/commit/6514504b709b823a4181261fa79ea6007b7be4fd)) by @Silverster98
- *(chapter1)* Modify style of caption, figure and table ([870a9e7](https://github.com/BITNP/BIThesis/commit/870a9e7c5f0fb89a99a2eb6f9ee5b8582c219dc7)) by @Silverster98

### <!-- 1 -->🐛 Bug Fixes

- *(toc)* Fix content style ([13fd215](https://github.com/BITNP/BIThesis/commit/13fd2153cee260e9a4be103b7dcb3b8199bb1e8d)) by @Silverster98


