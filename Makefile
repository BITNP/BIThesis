# 以下命令仅保证能在 Linux 或 macOS 环境下执行。
# 如果你是 Windows 用户，可以使用 Git Bash 或者 Cygwin 来执行；
# 或者可以考虑将此脚本移植为 PowerShell。

# Required for brace expansion
SHELL = /bin/bash

PACKAGE = bithesis

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty bitreport.cls bithesis.cls bitbeamer.cls

LATEXMK = latexmk

SCAFFOLDDIR = ./templates
TESTDIR = ./tests


.PHONY: all FORCE_MAKE

$(PACKAGE).pdf: cls assets/faq.tex FORCE_MAKE
	@$(LATEXMK) -xelatex $(PACKAGE).dtx

$(CLSFILE): $(SOURCES)
	yes y | xetex $(PACKAGE).ins

.PHONY: cls
cls: $(CLSFILE)

.PHONY: doc
doc: $(PACKAGE).pdf

assets/faq.tex:
	curl https://bithesis.bitnp.net/faq/index.tex -o assets/faq.tex

.PHONY: viewdoc
viewdoc: doc
	$(LATEXMK) -pv $(PACKAGE).dtx

.PHONY: clean
clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	-rm -rf *.glo $(CLSFILE)
	-rm assets/faq.tex

.PHONY: clean-dist
clean-dist:
	-rm -rf $(PACKAGE).pdf

.PHONY: clean-all
clean-all: clean clean-dist FORCE_MAKE

.PHONY: check
check: cls FORCE_MAKE
	explcheck $(if $(CI),--warnings-are-errors) ./*.cls ./dtx-style.sty $$(fd --extension tex --exclude bithesis-doc.tex)
	explcheck $(if $(CI),--warnings-are-errors) --no-config-file bithesis-doc.tex
# Templates are targeting TeX Live from 2021 to 2025, but docs are targeting the latest TeX Live.
# Therefore, we check them separately.
# Example: lt3luabridge introduced `\luabridge_now:n` on 2022-06-25, so it can be used in docs, but not templates.

.PHONY: test
test: copy FORCE_MAKE
	SCAFFOLDDIR=$(SCAFFOLDDIR) TESTDIR=$(TESTDIR) \
		python scripts/test.py

.PHONY: regression-test
regression-test: copy
	uv run scripts/regression_test.py $(args)

.PHONY: copy-only
copy-only:
	fd . --exclude '$(SCAFFOLDDIR)/(lab-report|presentation-slide)' $(SCAFFOLDDIR) $(TESTDIR) \
		--type=directory --max-depth=1 --exec cp {bithesis.cls,assets/latexmkrc}
	cp {bithesis.cls,assets/latexmkrc} ./handbook
	cp {bitreport.cls,assets/latexmkrc} $(SCAFFOLDDIR)/lab-report
	cp {bitbeamer.cls,assets/latexmkrc} $(SCAFFOLDDIR)/presentation-slide
	cp $(SCAFFOLDDIR)/graduate-thesis/misc/icon_{academic,professional}.jpg $(TESTDIR)/doctor-thesis/misc/

.PHONY: copy
copy: cls copy-only

# Generate scaffolds for overleaf
.PHONY: overleaf
overleaf: doc FORCE_MAKE
	# if $version is not specified, alert the user.
	@if [ -z "$$version" ]; then \
		echo -e "\e[32mPlease specify the version of the template you want to generate.\e[0m"; \
		echo -e "\e[32mFor example: make overleaf version=1.0.0\e[0m"; \
		exit 1; \
	fi
	git clean -fdx ./templates/
	rm -rf overleaf
	make copy
	mkdir overleaf
	ls templates | \
		xargs -I {} sh -c \
		"cp -r ./templates/{} overleaf && cp $(PACKAGE).pdf ./overleaf/{} && (cd overleaf/{}/ && zip -r ../BIThesis-{}-v$(version).zip .)"

.PHONY: dev
dev:
	ls bithesis.dtx | entr -s 'yes y | make doc && make copy'

.PHONY: dev-doc
dev-doc:
	ls bithesis.dtx | entr -s 'make clean-all && yes y | make doc && open bithesis.pdf'

.PHONY: pkg-only
pkg-only:
	rm -rf ./bithesis ./bithesis.zip
	mkdir bithesis
	cp bithesis.ins bithesis.dtx bithesis-doc.tex bithesis.pdf ./README*.md ./contributing*.md ./bithesis
	mv ./bithesis/README-bithesis.md ./bithesis/README.md
	cp ./handbook/graduate-handbook.pdf ./bithesis/bithesis-handbook-graduate.pdf
	cp ./handbook/undergraduate-handbook.pdf ./bithesis/bithesis-handbook-undergraduate.pdf
	zip -r bithesis.zip bithesis
	rm -r ./bithesis

.PHONY: pkg
pkg: doc handbooks pkg-only

GRAD_DEST_DIR = ./BIThesis-graduate-thesis-template

.PHONY: handbooks
handbooks: copy FORCE_MAKE
	cd handbook \
		&& GRADUATE=true latexmk -g && mv main.pdf graduate-handbook.pdf \
		&& latexmk -g && mv main.pdf undergraduate-handbook.pdf && cd -

# 用于提供给研究生院
.PHONY: grad
grad: doc copy handbooks FORCE_MAKE
	# if $version is not specified, alert the user.
	@if [ -z "$$version" ]; then \
		echo -e "\e[32mPlease specify the version of the template you want to generate.\e[0m"; \
		echo -e "\e[32mFor example: make grad version=1.0.0\e[0m"; \
		exit 1; \
	fi
	rm -rf ${GRAD_DEST_DIR}-${version} ${GRAD_DEST_DIR}-${version}.zip
	cd $(SCAFFOLDDIR)/graduate-thesis && latexmk && latexmk -c && cd -
	mkdir ${GRAD_DEST_DIR}-${version}
	cp -r $(SCAFFOLDDIR)/graduate-thesis/ ${GRAD_DEST_DIR}-${version}/graduate-thesis/
	cp ./bithesis.pdf ${GRAD_DEST_DIR}-${version}/'3-详细配置手册'.pdf
	cp ./handbook/graduate-handbook.pdf ${GRAD_DEST_DIR}-${version}/'2-快速使用手册'.pdf
	(cd ${GRAD_DEST_DIR}-${version}/graduate-thesis/ && zip -rm ../"1-BIThesis-论文模板-${version}".zip . )
	rmdir ${GRAD_DEST_DIR}-${version}/graduate-thesis
	zip -r ${GRAD_DEST_DIR}-${version}.zip ${GRAD_DEST_DIR}-${version}

UNDERGRAD_DEST_DIR = ./BIThesis-undergraduate-thesis-templates

# 用于提供给教务部
.PHONY: undergrad
undergrad: doc copy handbooks FORCE_MAKE
	@if [ -z "$$version" ]; then \
		echo -e "\e[32mPlease specify the version of the template you want to generate.\e[0m"; \
		echo -e "\e[32mFor example: make grad version=1.0.0\e[0m"; \
		exit 1; \
	fi
	rm -rf ${UNDERGRAD_DEST_DIR}-${version} ${UNDERGRAD_DEST_DIR}-${version}.zip
	cd $(SCAFFOLDDIR)/undergraduate-thesis && latexmk && latexmk -c && cd -
	cd $(SCAFFOLDDIR)/undergraduate-thesis-en && latexmk && latexmk -c && cd -
	cd $(SCAFFOLDDIR)/paper-translation && latexmk && latexmk -c && cd -
	mkdir ${UNDERGRAD_DEST_DIR}-${version}
	cp -r $(SCAFFOLDDIR)/undergraduate-thesis/ ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis/
	cp -r $(SCAFFOLDDIR)/undergraduate-thesis-en/ ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis-en/
	cp -r $(SCAFFOLDDIR)/paper-translation/ ${UNDERGRAD_DEST_DIR}-${version}/paper-translation/
	cp ./bithesis.pdf ${UNDERGRAD_DEST_DIR}-${version}/'4-详细配置手册'.pdf
	cp ./handbook/undergraduate-handbook.pdf ${UNDERGRAD_DEST_DIR}-${version}/'5-快速使用手册'.pdf
	(cd ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis/ && zip -rm ../"1-BIThesis-本科毕设论文模板-${version}".zip . )
	(cd ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis-en/ && zip -rm ../"2-BIThesis-本科毕设论文模板（全英文）-${version}".zip . )
	(cd ${UNDERGRAD_DEST_DIR}-${version}/paper-translation/ && zip -rm ../"3-BIThesis-本科毕设外文翻译-${version}".zip . )
	rmdir ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis
	rmdir ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis-en
	rmdir ${UNDERGRAD_DEST_DIR}-${version}/paper-translation
	zip -r ${UNDERGRAD_DEST_DIR}-${version}.zip ${UNDERGRAD_DEST_DIR}-${version}
