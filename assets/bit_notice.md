# 关于`bit_*.{pdf,png}`的说明

## `bit_text.pdf`

校名（中文全称，无英文），用于本科系列模板的封面。

制作过程：

1. 访问[学校视觉形象识别系统 → 标准字规范](https://www.bit.edu.cn/gbxxgk/dqgz_sjb/vixx/bzzgf/)，下载[`A2 学校名称标准字规范-02.ai`](https://ssc.info.bit.edu.cn/fileDeposit/download/171c9f799e3ae1b76f204b5d04e5502a.ai "sha256:11677d8410d9157f9b823c0a5851643b3ab01915a65e4858fb03985a0323df6e")，并转换为 SVG

2. 使用 Inkscape 打开，如下操作

   1. 选择右下黑底白字版本，粘贴到新文档
   2. “文档属性 → 缩放页面到内容”，此时页面尺寸应该是 121.468 mm × 20.000 mm（比例 60.73:10）
   3. 将页面尺寸修改为 123.723 mm × 24.450 mm
   4. 全选，将 XY 坐标从原点修改为 (0.410, 3.227)

3. 导出为 PDF

其它参考来源：

- 本科毕业论文 Word 模板中 1358×269 的位图

  该图四周有不对称的留白，故比例不同于标准的 60.73:10。留白会影响插入到 LaTeX 文档后的视觉效果。为保证与 Word 模板一致，制作这个文件时特别设定了若干数值。

- [学校首页](https://www.bit.edu.cn/)链接的[`logo_02.svg`](https://www.bit.edu.cn/images/gb20190805/logo_02.svg)

  该图还含英文全称，并且字是白色。

## `bit_logo.pdf`

校徽（校标套一圈校名，区别于校标本身），用于演示文档模板（presentation-slide）。

制作过程：

1. 访问[学校视觉形象识别系统 → 标志、校徽规范](https://www.bit.edu.cn/gbxxgk/dqgz_sjb/vixx/bzxhgf/)，下载[`A1 标志、校徽规范-09.ai`](https://ssc.info.bit.edu.cn/fileDeposit/download/cc28c8707bfce6c54bae1103095c134c.ai "sha256:cb79f76442c680aa20b10f1dc3e07f5f0b60a13042d09dd1bc3507a7c1fd080c")，并转换为 SVG

2. 使用 Inkscape 打开，如下操作

   1. 选择右侧校徽，粘贴到新文档
   2. “文档属性 → 缩放页面到内容”，此时页面尺寸应该是 100.002 mm × 100.000 mm

3. 导出为 PDF

其它参考来源：

- [学校首页](https://www.bit.edu.cn/)链接的[`logo_01.svg`](https://www.bit.edu.cn/images/gb20190805/logo_01.svg)

  该图的边界框不是严格的正方形，高度比宽度略小一点点。

此外，`templates/`目录有若干相同内容的`bit_logo.png`。它们用于演示 LaTeX 可以插入 PNG 图片，故未替换为 PDF。

## `bit_logo_with_text.pdf`

校徽和校名（中英全称，横排左徽右字），用于实验报告模板（lab-report）。

制作过程：

1. 访问[学校视觉形象识别系统 → 基本要素组合规范](https://www.bit.edu.cn/gbxxgk/dqgz_sjb/vixx/jbyszhgf/)，下载[`A3 基本要素组合规范-10.ai`](https://ssc.info.bit.edu.cn/fileDeposit/download/499e8ec5a93cbf84e27043e3968e15ba.ai "sha256:4c96567d9207a7551e72763f36e6133947b5777b575a5342978877f62c5aa7cb")，并转换为 SVG

2. 使用 Inkscape 打开，如下操作

   1. 选择右上的横排左徽右字版本，粘贴到新文档
   2. 删除标注的参考线和尺寸
   3. “文档属性 → 缩放页面到内容”，此时页面尺寸应该是 90.995 mm × 20.000 mm

3. 导出为 PDF

学校对校徽、校名的对齐方式有要求，故不适合自行组合。

## 通则

Inkscape 能直接加载`*.ai`，不过这里还是用在线工具转换为`*.svg`更方便。

用 Inkscape 导出的 PDF 冗余较多，可运行 [pdfcpu optimize](https://pdfcpu.io/core/optimize) 压缩。
