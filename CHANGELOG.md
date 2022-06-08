# Changelog

All notable changes to this project will be documented in this file.

Acronyms:
- LB: lab-report
- MT: master-thesis
- PT: paper-translation
- PS: presentation-slide
- UPR: undergraduate-proposal-report
- UT: undergraduate-thesis

**Bolded text highlights its importance.**

## [2.2.4] - 2022-06-08

[25b2625](25b262598f4cf32f147489ab5b72474b1676a77b)...[702ec6b](702ec6bf907637170f4657ae078ec3f0c16fe50c)

### Bug Fixes

- Use \RequirePackage in favor of \usepackage. ([6bc9b17](6bc9b17a1668ea498561b6df1bb216e775ac504f))
- Fix bib date format. ([21ea984](21ea98408ef7daea963512e5cd5fa4bc26f568d5))
- Remove unused package. ([a7847ed](a7847ed8bc36f0a852aec6a16016dfbce4ead300))
- Cover fix #144 ([df76cba](df76cbaa8cd8c2b725a635d469c6ff38f1e50401))

### Features

- Extract a latex3 class file. ([c29bae2](c29bae2366c77f996c3a8dc74faf1a7f6bba875c))

### Refactor

- \upcite -> \cite ([ad36f48](ad36f484c0d8d6f9b4af2f911e6b4d1548f85736))
- Remove test control sequence. ([aeecf84](aeecf84b5bb9bd53d1c7a341f1ed42cbc81dd661))
- Move main color theme definition to cls. ([3ad7d3e](3ad7d3e4ab3ee90d1c01ae436859cad2ddafce0b))
- Move \usetheme to cls. ([d4e2b3d](d4e2b3d7304242e6b496d925a344d60c5f715b5a))
- Docs and warning fix. ([61b2a42](61b2a42f0757163c1e98d48b8eabea7517dc49db))
- Copyright header in tex. ([3933684](39336847580653d678de903c29864abe36127521))
- Update copyright file header. ([63fb411](63fb411d191cb19e4e33b0f8f1022fc7a92c85a6))
- [**breaking**] Extract the lab-report into new cls. ([b8993ef](b8993ef453f376cea13194c92a0a9248ff8c7fbf))
- Use built-in figure. ([f15704b](f15704b0a0d43e699bab537e7085e4928f6d1450))
- Use \ctexset instead of deprecated \CTEXoptions. ([702ec6b](702ec6bf907637170f4657ae078ec3f0c16fe50c))

## [2.2.3] - 2022-05-09

### Bug Fixes

- Remove conflict definition. ([fc6b3f4](fc6b3f4291a9a4ccc28795f60c276c523219bc5b))

### Documentation

- Fix typo. ([8ec3db3](8ec3db397e9615590455c18ece20a4cfbf1978aa))
- Add ISSUE_TEMPLATE config.yaml ([5519740](55197409790aaa70bdac2ac232a67bdd975b634a))
- Add formated issue template. ([7dfc517](7dfc517dc195ddfc7bffa28a16f9d226cedb7e0e))

### Features

- Make teacherName optional. ([f8e4379](f8e4379b5c568457fb175e8029534b7a12fb47fb))
- Custom date. ([510e367](510e367e20e7e0d56699fe8a495185db923d13c6))
- Add bibliography. ([8c34533](8c345331006d9e1087ba110765b75b552390c940))

### Miscellaneous Tasks

- Fix emoji. ([c64620d](c64620d9fc3da5f8409b9305cc97988badb11849))

### Refactor

- Remove theorem. ([9805f5d](9805f5d7bd21278bfcb49c4946a99852c2696a56))

### Dev

- Add release issue tracker template. ([afe4a73](afe4a73b0c1cccf14622ac24872a9ed83d821e6b))

## [2.2.2] - 2022-04-22

[bb4e1de](bb4e1de2aa7996aeb3a7d839e4988ce1568df174)...[2ce7e8c](2ce7e8c51c0dac1b5158d702d400b81423b939ff)

### Bug Fixes

- Add same method hint to PT. ([c6bbbc3](c6bbbc3e44af50f889d53f0cdb3ae8a7fa3dd770))
- Remove parent path reference when using lab-report. ([3e2b3e51](3e2b3e51ddece5b5e8acca1936e7beb9bb62fcc2))

### Documentation

- Add disclaimer about master-thesis. ([c156132](c156132f57c3fa92aa7bc0712e5a8b61799e5c4e))
- Specify instruction on bithesis. ([1a0dfa7](1a0dfa7566db47f07f00087e707e537bdeea7e32))
- Fix wrong dev guide. ([5bab59a](5bab59a3ccc3a5f5162ab6f5a7b17734b8c2e410))
- Add guide on test. ([f62bbb2](f62bbb21158539f7a73c91b5409727c4e4dc8d3a))
- Add maintainer info. ([3e9d68c](3e9d68c8925ffd9e5246d9e60660397bc68508cb))
- Add badge for CTAN and CI. ([319fabb](319fabb7005b300f0852a91090ebf73046f01d21))
- Remove slack icon. ([5f2ed1d](5f2ed1d1457a8714bbc85eb000ce6c89d2c08354))
- Add release workflow for maintainer. ([79d77e1](79d77e11bdf4460cef2eeb4d9e286d1ddfda8c77))
- Fix hierarchy in markdown. ([62e52b7](62e52b74dbb97d6e197962e26e687e818320d19a))
- Add reference documents. ([37dab91](37dab91615037310db15745ce3be41df56e06402))
- Refine workflow. ([5f736ea](5f736eabf34b68ae84f5993a8f5c924243c9e0d4))

### Features

- Give a workaround to redefine page head. ([2f0e7e4](2f0e7e4e7d2bf3470cf878f83e9242c6d817087c))

### Miscellaneous Tasks

- Remove useless file. ([bf3aae5](bf3aae5ea905ee62fda3ab9b80a4bf1b997f48d9))
- Refactor anchor's name. ([c23686b](c23686b3df4755fa8da100752b3f79fa1cc804be))

### Refactor

- Add name to github action - test. ([52290ca](52290ca236b51aaed72d3380d635e5cd2d7b7324))

### Release

- Release bithesis v2.1.0 ([22fe03c](22fe03cd243281ee158bacf6e4f94f2bf12ae89c))

## [2.2.1] - 2022-04-14

[86341ec](86341ecf89eb6312eb3d1ef263c4db0eb5ca53b9)...[bb4e1de](bb4e1de2aa7996aeb3a7d839e4988ce1568df174)

### Bug Fixes

- Resolve statement issue when uploading CTAN. ([2627834](2627834188d97ebdcc99006e79e56fe1495f098b))
- Clean zip before package, defensively. ([bb18cb7](bb18cb7d981d6dd90810a11562493867fdcf1a1e))
- Fix regression-testing scripts. ([47e2a6f](47e2a6f62f13939a9426fddfad47196b60c8e671))
- Remove bst file. ([25f2c21](25f2c212ec34c7520a9e3a8ce1a988cadd792716))
- Remove redundancy space. ([d2cd9c2](d2cd9c2841e897fceeec6ee0490cc2fd613e486b))
- Add a note as workaround to modify cls. ([f80a25d](f80a25d1ecb794c9b3f11ae6e5a22ce3228eb868))
- Ignore more build files. ([bb4e1de](bb4e1de2aa7996aeb3a7d839e4988ce1568df174))

### Documentation

- Fix badgen link. ([64180f3](64180f39923df41829bafc7d4f85cab685e8bb9c))

### Features

- Add .gitignore that empower version control. ([8e8872b](8e8872b0cea4e18993ac55d22b6599d54b93fcbb))
- Use biblatex in favor of natbib. ([2c132f6](2c132f66a2d836a51c0e2ae122642bc2734dfbe8))
- Add filter to regression-testing. ([a0137a9](a0137a926750a35b0bd84007bd8bff3f759b29c1))
- Improve spine styles. ([b79cec6](b79cec6a1d8379fa4af92893340671cc806084a3))

### Refactor

- Rename master branch to main. ([8967957](8967957d67609464914f59a3fa1ff1d4b5dd593d))

### WIP

- Do not push ([43c45b6](43c45b6aa229fa6aadf879afa6ec2169f3dd1258))

## [2.2.0-4] - 2022-04-07

[cf53f27](cf53f27ba0e7f65721d36c4e17589ee049ab533d)...[86341ec](86341ecf89eb6312eb3d1ef263c4db0eb5ca53b9)

### Bug Fixes

- Change working dir to ./templates. ([c89d3ac](c89d3ac8c6166377c19433479e4590de25c1eb37))

## [2.2.0-3] - 2022-04-07

[ac7e909](ac7e909d066dfc4d9dedcfb74c6bf53e0c5aa529)...[cf53f27](cf53f27ba0e7f65721d36c4e17589ee049ab533d)

### Bug Fixes

- Change working dir to ./templates. ([b1624b3](b1624b389f7961a81f1d40e2f919da8455dfec4a))

## [2.2.0-1] - 2022-04-07

[6c9c447](6c9c447949a0eb253378ab744424eaf90a366d90)...[ac7e909](ac7e909d066dfc4d9dedcfb74c6bf53e0c5aa529)

### Bug Fixes

- Change working dir to ./templates. ([c2ed2c9](c2ed2c97d5629768c8dbf846e8394631d00f6982))

## [2.2.0] - 2022-04-02

[403c6c2](403c6c2753c1c8972b3dba082891bd0242378a0b)...[6c9c447](6c9c447949a0eb253378ab744424eaf90a366d90)

### Bug Fixes

- Complete bug report template. ([494c699](494c699bc92dda6486a52ebdae7cd37fe6abd6f9))
- Add MRE. ([dab6f7b](dab6f7bae5650901cdc79acb7ab9562379e8f6dd))
- Release zip CI. ([1a6e34e](1a6e34e710694fcf88b56e482db73c8315fcea19))
- Link in readme to EN version. ([27d9bc2](27d9bc253a3229e0e82abbc1c9326ce76b2c9158))
- Fix depends ([9ed5321](9ed532122ecac913d2cf386e421225872fc88842))
- CI. ([5693400](569340056b17d3655636911a46e17fe546eb29a1))
- Remove Noto Serif CJK SC dependency. ([d80a3fd](d80a3fd97fb97bb55aa9cff24023c6d99b99b6bd))

### Documentation

- Add changelog. ([44f51eb](44f51ebde5c4b1e3b49398c8eb5f3a50361e0740))

### Features

- Init bitgrad.cls ([6f19ab0](6f19ab068ed0d8ecb630277756fe4165a2c6af88))
- Move project scaffold as templates ([1b2c387](1b2c38737b457c92e089a77e930c2d8465a7b3f8))
- Add overleaf zip generation script. ([9ecf95c](9ecf95c6a21ad28474d3482bbd47daa7da54d838))
- Update readme. ([43ca60d](43ca60dcfd07c396e8bc603143a0657c338bb154))
- Add CI for the test. ([e63df18](e63df18b3299c025fedfc9228d207de35cd189d3))
- Add latexmkrc to templates. ([994b8b9](994b8b9946c26376e0e9b50c3c1ce43074de9563))
- Install core-web-fonts. ([5911093](591109300c16d24ddef369f3c19097182c036d55))
- Add CHANGELOG.md via git-cliff. ([75fbea0](75fbea0f3865e50da1dedf1c500a08d9dc6749fc))

## [2.2.0-alpha] - 2022-01-02

[3a03930](3a03930accdf79831a91c869e65dba74399d72ad)...[403c6c2](403c6c2753c1c8972b3dba082891bd0242378a0b)

### Features

- Pack up presentation-slide in release hook. ([403c6c2](403c6c2753c1c8972b3dba082891bd0242378a0b))

## [2.1.2] - 2022-01-01

[12f7e1b](12f7e1bbe02955a23f11de0afdf2b4d5e7452f35)...[3a03930](3a03930accdf79831a91c869e65dba74399d72ad)

### Bug Fixes

- AutoFakeBold option fix in proposal-report. ([356e9b6](356e9b60fc3ca1d46b146436bcbcf81872fd8bfb))
- Proposal-report's bad bold effect. ([0fe3aca](0fe3aca91c25eb76f3714b157cdb3a59ba7c0fdf))
- Format space. ([d39f76c](d39f76cc73ba4d44bd60887b447002523cbd3d59))

### Features

- Migrate to QQ Chat Group. ([ca7495c](ca7495c5773584e24c01dbbaff162bf694f7b52a))

## [2.1.1] - 2021-09-10

[01c3ae7](01c3ae7adfe08d8ac8a8fa0a643ea6efbc7d00fb)...[12f7e1b](12f7e1bbe02955a23f11de0afdf2b4d5e7452f35)

### Bug Fixes

- Badge fix in readme. ([71cda67](71cda67a58b8bf90f003fe6f0a1631e713f69307))

### Features

- Add paper-translation-related code. ([f08cc51](f08cc51ce3355ac19fbf64ea2b3240fe01e8ec78))
- Key-value option support for footskip in bitbook. ([98420a5](98420a598c3d7e02efbb0f2fdd3b41c205015f43))
- Add listings caption support. ([f059c30](f059c301aba55ccb8ed1e13f5d047316bad81ca7))
- Add option to toggle title number with Heiti font. ([a975525](a975525833bdc303832a78aeb6f9a3091aa7e2d4))
- Prepare for new package update to upload. ([8c3ee54](8c3ee54f5d7948b16eae35e6d34917057e24fe97))

### Improvement

- Add maintainer wanted, add docs link. ([dda3abf](dda3abf06d97445d27273742010f66b8e4450c66))

## [2.0.0] - 2021-01-12

[5076622](50766226e77308e37485d214b4b97084f7bcfcb6)...[01c3ae7](01c3ae7adfe08d8ac8a8fa0a643ea6efbc7d00fb)

### Features

- Prepare for CTAN version v1.0.1 ([7b26976](7b26976fc38a48eb5a5c38ad7a11d4d7090aba26))

## [2.0.0-beta-1] - 2021-01-08

[5bd40a0](5bd40a01adf4f78b9d0b3e6612e6834c01e14542)...[5076622](50766226e77308e37485d214b4b97084f7bcfcb6)

### Bug Fixes

- Correct `yes` args. ([2d40568](2d4056896352ad5db5fc058dc4acf8b2e1dc16af))

### Documentation

- Repair the invalid links. ([167657c](167657ce9dc7b891425319961dfbbd6ff6fe593c))
- Upadate the links' text ([618c01c](618c01c4743adfceff20efdd5f9ceb5f0afa4874))

### Ci

- Update github action to v2.0. ([927d20f](927d20f7e268758fb13d6c5797bb3d810e6e174b))

## [2.0.0-alpha] - 2021-01-06

[fb2dddb](fb2dddbe846622f30196a3f8c8357fd719fa3472)...[5bd40a0](5bd40a01adf4f78b9d0b3e6612e6834c01e14542)

### Bug Fixes

- Add more content in bithesis.pdf docs. ([fe16fa0](fe16fa00b99af123616c1deaefd1d51c5c85c527))

### Features

- Update docs and build script. ([5bd40a0](5bd40a01adf4f78b9d0b3e6612e6834c01e14542))

## [1.2.1] - 2020-12-30

[ab9f1aa](ab9f1aaac4973f9963ab7f7e69c8764405c5f739)...[fb2dddb](fb2dddbe846622f30196a3f8c8357fd719fa3472)

### Documentation

- Add period. ([0374e3e](0374e3efd952e73d85522a3d29b5ebbe4b2333fb))
- Repair the invalid links. ([3a7cef5](3a7cef56a1def30eaece0064a4b1ceaea1bae13d))
- Repair ([300e7b2](300e7b2ee6b7b9da4a37a130b0cf682df65be1a9))
- Add more dev docs. ([27cd897](27cd897e66a6cc236e438ebff4257245ad0dbd4c))
- Upadate the links' text ([7010b28](7010b285e32f5e46e74c7357e33c234d9e32ca10))
- Domain ([a9fe9fc](a9fe9fc342ee0c8b0b7d38305dccc5dbff014e6e))

### Features

- Init a dtx project. ([77b2494](77b249495023bcfa46590a2028927d3922760b91))
- Finish migration ([9deacc2](9deacc22b9493918864fb1a92329ffd07419f712))
- Add more description in doc. ([c3bd6f4](c3bd6f4222e4979a0396af180d7eb679ffcaf6c0))
- Add more history. ([2f561bb](2f561bb5aeb553b10256cccfc4612960385bfedb))

### Miscellaneous Tasks

- Update wiki deps ([f13202b](f13202b1fa569559a6f92c87ba7bd655efbddf44))

### Refactor

- Basic maintanence ([94bf84d](94bf84d748fe8d9702be9f2811fadd1f7b083207))
- Change maintainance info. ([0c972a3](0c972a3e7773de89dd4c9c0174624a9d9baf2554))

### Build

- Add pkg build command to makefile. ([e9dcf6d](e9dcf6d8395292ec78bb20abda9b4cbf87adf749))

## [1.2.0] - 2020-06-01

[6cdde7b](6cdde7b9b7e7f7d458c53f86f27dbf76c526598a)...[ab9f1aa](ab9f1aaac4973f9963ab7f7e69c8764405c5f739)

### Bug Fixes

- Fix typo ([a783c9f](a783c9f73c035905856647b65e5c8cee5c80c297))
- Format issues and typos ([f79a353](f79a353638992fb1e645db3cdd6f42223dcd2717))

### Documentation

- Add contributing.md ([24aee3d](24aee3d9c4c3c3c89a0f175649fd6d90e4ee27cd))
- Add header link to slack channel ([1349723](1349723860117f25b26aedad23487176bc25416b))
- Add chinese version of contributing.md ([be671d7](be671d73173ab9c69caf9eeb7748de2f51d9f548))
- Add contributing to wiki. add Bilingual badge ([3f5b970](3f5b970689d41940aa178bffb9dc73f8ef9e6b2d))
- Add contributing clause to readme ([60c1b28](60c1b28bfa124b498df0f3aa3ac1309f15771393))

## [0.0.3] - 2020-03-15

[8c2feed](8c2feed14dd1015f2acf8e3b36c71a62def4d20f)...[1101d66](1101d6629d000e74c59dbd23d7e4e18c3cd9fefa)

### Bug Fixes

- Modfiy title and picture position ([2f90368](2f9036828b5416c264d7cf38b8a87061f51f255a))

### Documentation

- Add doc charpter 5, 6, 7 content ([9abd384](9abd38442df5fb8ed108c982e49b60280df157ab))
- Add content in README-zh.md and lab-report/README.md ([a63078d](a63078dce5e8b746a9d9161dddd75e697290f1a2))
- Fix content link ([904f201](904f2019dbcbe4ac5c433c7ed70723dfc88d76f7))

## [0.0.2] - 2020-03-02

[18429c0](18429c0a278941fb651d5120f2640304e87f3fb3)...[8c2feed](8c2feed14dd1015f2acf8e3b36c71a62def4d20f)

### Bug Fixes

- Modify chapter style ([0e1bf37](0e1bf37d521ffc959c2a11bee672085b80183ade))

## [0.0.1] - 2020-02-29

### Bug Fixes

- Fix content style ([13fd215](13fd2153cee260e9a4be103b7dcb3b8199bb1e8d))

### Features

- Add template for experiment report ([6514504](6514504b709b823a4181261fa79ea6007b7be4fd))
- Modify style of caption, figure and table ([870a9e7](870a9e7c5f0fb89a99a2eb6f9ee5b8582c219dc7))

<!-- generated by git-cliff -->
