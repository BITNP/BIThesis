<!-- This README aims to be packed into bithesis LaTeX package -->

# The `bithesis` Class

$\LaTeX$ thesis template for [Beijing Institute of Technology (BIT)](https://bit.edu.cn).

This project is maintained by [BITNP (Net Pioneer Association of BIT)](https://bitnp.net), the de facto TUG at BIT.
Maintainers are listed on [the BIThesis website](https://bithesis.bitnp.net/guide/acknowledgements.html).

[![BIThesis](./assets/bithesis_badge_solid.svg)](https://bithesis.bitnp.net/)
[![Latexmk](https://badgen.net/badge/compiler/latexmk/blue)](https://mg.readthedocs.io/latexmk.html)
[![License](https://badgen.net/github/license/BITNP/BIThesis?color=008080&labelColor=2b2b2b)](./LICENSE)

BIThesis is an unofficial LaTeX template set for your
**undergraduate, master, or doctoral thesis** as well as other academic writing here at BIT.

This project is supported by the _[Dept. of Undergraduate Academic Affairs, BIT](https://jwb.bit.edu.cn/)_ and the _[School of Computer Science and Technology, BIT](https://cs.bit.edu.cn/)_. See [Acknowledgements - Official Sponsors](https://bithesis.bitnp.net/guide/acknowledgements.html#%E5%AE%98%E6%96%B9%E8%B5%9E%E5%8A%A9-official-sponsors).

At present, `bithesis` only supports XeTeX and LuaTeX engines. `bithesis` only allows `UTF-8` encoding.

## Installation

```shell
tlmgr install bithesis
```

## How to use BIThesis?

**For a comprehensive guide on how to install LaTeX, compile `bithesis`, and use BIThesis' templates, please refer to BIThesis' Wiki. 👇**

[![BIThesis Wiki](https://img.shields.io/badge/BIThesis-Wiki-009944?logo=wikipedia&labelColor=2b2b2b&style=for-the-badge)](https://bithesis.bitnp.net/)

## How to build PDF documentations?

This section describes how to generate the following PDF documentations from `bithesis-doc-src.zip` manually.

- Package documentation: `bithesis.pdf`
- Quick start handbooks: `bithesis-handbook-{undergraduate,graduate}.pdf`

However, it is much easier to generate them by cloning our [repo](https://github.com/BITNP/BIThesis) and run `just doc handbooks`. Details can be found in `DEVELOPMENT.md` there.

### Package documentation

```shell
xetex bithesis.ins

7z x bithesis-doc-src.zip bithesis-pdf
mv bithesis-pdf/* .
rmdir bithesis-pdf

curl https://bithesis.bitnp.net/faq/index.tex -o assets/faq.tex

latexmk -xelatex -shell-escape bithesis.dtx  # `-shell-escape` is for lt3luabridge
```

Now check `bithesis.pdf`.

### Quick start handbooks

1. Generate `bithesis.cls` with `xetex bithesis.ins` or `tlmgr install bithesis`
2. Run the following commands

```shell
7z x bithesis-doc-src.zip handbook
cd handbook

cp path/to/bithesis.cls .

latexmk
mv main.pdf bithesis-handbook-undergraduate.pdf

GRADUATE=true latexmk -gt  # `-gt` forces reprocessing *.tex files
mv main.pdf bithesis-handbook-graduate.pdf
```

## Contributing

For more details, please see the [contributing doc](./contributing.md).

## Contributors

For more information, please see: [GitHub Contributors](https://github.com/BITNP/BIThesis/graphs/contributors) and [Acknowledgements](https://bithesis.bitnp.net/guide/acknowledgements.html).
