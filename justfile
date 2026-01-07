# 以下命令仅保证能在 Linux 或 macOS 环境下执行。
# 如果你是 Windows 用户，可以使用 Git Bash 或者 Cygwin 来执行；
# 或者可以考虑将此脚本移植为 PowerShell。

# Required for brace expansion
set shell := ["bash", "-uc"]

explcheck_args := if env("CI", "false") != "false" { "--warnings-are-errors" } else { "" }

# Execute a command in each thesis template directory
fd_thesis_templates_exec := "fd . --exclude 'templates/(lab-report|presentation-slide)' templates --type=directory --max-depth=1 --exec"

# List available recipes
[default]
list:
    @just --list

# Clean generated files and directories in the current directory
[no-cd]
clean *ARGS:
    git clean -dx --interactive {{ ARGS }}

# Call src/Makefile
[private]
[working-directory('src')]
make *ARGS:
    make --warn-undefined-variables --no-builtin-rules {{ ARGS }}

# Build bithesis.pdf
[group('build')]
doc: (make "bithesis.pdf")
    # 🎉 Successfully built src/bithesis.pdf

# Build *.cls files
[group('build')]
cls: (make "cls")

# Build handbooks
[group('build')]
[working-directory('handbook')]
handbooks: copy
    GRADUATE=true latexmk -gt
    mv main.pdf graduate-handbook.pdf

    latexmk -gt
    mv main.pdf undergraduate-handbook.pdf

# Copy necessary files to templates/*/ and relevant directories
[group('build')]
copy: cls copy-only

# Same as `just copy`, but without building cls files (only for CI)
[private]
@copy-only:
    @# Copying necessary files to target directories…

    {{ fd_thesis_templates_exec }} cp {src/bithesis.cls,assets/latexmkrc}
    fd . tests/ --type=directory --max-depth=1 --exec cp {src/bithesis.cls,assets/latexmkrc}

    {{ fd_thesis_templates_exec }} mkdir -p {}/images/
    {{ fd_thesis_templates_exec }} cp assets/bit_text.pdf {}/images/header.pdf

    cp {src/bithesis.cls,assets/latexmkrc} handbook/

    cp {src/bitreport.cls,assets/latexmkrc} templates/lab-report
    cp assets/bit_logo_with_text.pdf templates/lab-report/assets/

    cp {src/bitbeamer.cls,assets/latexmkrc} templates/presentation-slide
    mkdir -p templates/presentation-slide/images/
    cp assets/bit_logo.pdf templates/presentation-slide/images/

    cp templates/graduate-thesis/misc/icon_{academic,professional}.jpg tests/doctor-thesis/misc/

    @# All copied!

# Check LaTeX files with https://ctan.org/pkg/expltools
[group('dev')]
check: cls
    explcheck {{ explcheck_args }} src/*.cls src/dtx-style.sty $(fd --extension tex --exclude src/bithesis-doc.tex)
    explcheck {{ explcheck_args }} --no-config-file src/bithesis-doc.tex
# Templates are targeting TeX Live from 2021 to 2025, but docs are targeting the latest TeX Live.
# Therefore, we check them separately.
# Example: lt3luabridge introduced `\luabridge_now:n` on 2022-06-25, so it can be used in docs, but not templates.

# Run compilation tests (mainly for CI, takes 3–6 minutes)
[group('dev')]
test: copy
    python scripts/test.py

# Run regression tests (run with `--help` for help)
[group('dev')]
regression-test *ARGS: copy
    uv run scripts/regression_test.py {{ ARGS }}

# Prepare the cache directory
[private]
target-dir:
    @mkdir -p target

# Update the version number for prereleases (mainly for CI)
[group('release')]
update-version SUFFIX="":
    python scripts/update_version.py {{ SUFFIX }}

# Build the ZIP for submission to CTAN (mainly for CI)
[group('release')]
pkg: doc handbooks pkg-only

# Same as `just pkg`, but without building dependencies (only for CI)
[private]
[working-directory('target')]
pkg-only: target-dir
    rm -rf ./bithesis ./bithesis-doc-src ./bithesis.zip
    mkdir bithesis

    cp ../src/bithesis{.ins,.pdf} ../src/bithesis*.dtx ../contributing*.md ./bithesis
    cp ../README-bithesis.md ./bithesis/README.md
    cp ../handbook/graduate-handbook.pdf ./bithesis/bithesis-handbook-graduate.pdf
    cp ../handbook/undergraduate-handbook.pdf ./bithesis/bithesis-handbook-undergraduate.pdf

    # TeX Live needs TeX sources of all PDF files, because otherwise they are not considered as “open source”.
    mkdir -p bithesis-doc-src/bithesis-pdf/assets/
    cp ../src/bithesis-doc.tex ./bithesis-doc-src/bithesis-pdf/
    cp ../src/assets/{faq.lua,icon.png} ./bithesis-doc-src/bithesis-pdf/assets/
    mkdir -p ./bithesis-doc-src/handbook/
    cp -r ../handbook/{main.tex,chapters/,figures/,imgs/,reference/} ./bithesis-doc-src/handbook/
    cp ../assets/latexmkrc ./bithesis-doc-src/handbook/
    cd ./bithesis-doc-src && zip -rm ../bithesis/bithesis-doc-src.zip .
    rmdir ./bithesis-doc-src

    zip -rm bithesis.zip bithesis
    # 🎉 Successfully created target/bithesis.zip

# 生成提供给研究生院的压缩包
[group('release')]
[arg("version", pattern='\d+\.\d+\.\d+', help="The version of the template you want to generate, e.g., 1.0.0")]
[arg("dest", help="The prefix for the destination directory")]
[working-directory('target')]
grad version dest="BIThesis-graduate-thesis-template": doc copy handbooks target-dir
    rm -rf {{dest}}-{{version}} {{dest}}-{{version}}.zip
    mkdir {{dest}}-{{version}}

    cd ../templates/graduate-thesis && latexmk && latexmk -c
    cp -r ../templates/graduate-thesis/ {{dest}}-{{version}}/graduate-thesis/
    cd {{dest}}-{{version}}/graduate-thesis/ && zip -rm ../"1-BIThesis-论文模板-{{version}}".zip .
    rmdir {{dest}}-{{version}}/graduate-thesis

    cp ../src/bithesis.pdf {{dest}}-{{version}}/'3-详细配置手册'.pdf
    cp ../handbook/graduate-handbook.pdf {{dest}}-{{version}}/'2-快速使用手册'.pdf

    zip -rm {{dest}}-{{version}}.zip {{dest}}-{{version}}
    # 🎉 Successfully created target/{{dest}}-{{version}}.zip

# 生成提供给教务部的压缩包
[group('release')]
[arg("version", pattern='\d+\.\d+\.\d+', help="The version of the template you want to generate, e.g., 1.0.0")]
[arg("dest", help="The prefix for the destination directory")]
[working-directory('target')]
undergrad version dest="BIThesis-undergraduate-thesis-templates": doc copy handbooks target-dir
    rm -rf {{dest}}-{{version}} {{dest}}-{{version}}.zip
    mkdir {{dest}}-{{version}}

    cd ../templates/undergraduate-thesis && latexmk && latexmk -c
    cd ../templates/undergraduate-thesis-en && latexmk && latexmk -c
    cd ../templates/paper-translation && latexmk && latexmk -c

    cp -r ../templates/undergraduate-thesis/ {{dest}}-{{version}}/undergraduate-thesis/
    cp -r ../templates/undergraduate-thesis-en/ {{dest}}-{{version}}/undergraduate-thesis-en/
    cp -r ../templates/paper-translation/ {{dest}}-{{version}}/paper-translation/

    cd {{dest}}-{{version}}/undergraduate-thesis/ && zip -rm ../"1-BIThesis-本科毕设论文模板-{{version}}".zip .
    cd {{dest}}-{{version}}/undergraduate-thesis-en/ && zip -rm ../"2-BIThesis-本科毕设论文模板（全英文）-{{version}}".zip .
    cd {{dest}}-{{version}}/paper-translation/ && zip -rm ../"3-BIThesis-本科毕设外文翻译-{{version}}".zip .

    rmdir {{dest}}-{{version}}/undergraduate-thesis
    rmdir {{dest}}-{{version}}/undergraduate-thesis-en
    rmdir {{dest}}-{{version}}/paper-translation

    cp ../src/bithesis.pdf {{dest}}-{{version}}/'4-详细配置手册'.pdf
    cp ../handbook/undergraduate-handbook.pdf {{dest}}-{{version}}/'5-快速使用手册'.pdf

    zip -rm {{dest}}-{{version}}.zip {{dest}}-{{version}}
    # 🎉 Successfully created target/{{dest}}-{{version}}.zip
