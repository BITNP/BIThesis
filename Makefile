# 以下命令仅保证能在 Linux 或 MacOS 环境下执行。
# 如果你是 Windows 用户，可以使用 Git Bash 或者 Cygwin 来执行；
# 或者可以考虑将此脚本移植为 PowerShell。
PACKAGE = bithesis

LATEX = xelatex

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty bitreport.cls bithesis.cls bitbeamer.cls

LATEXMK = latexmk

SCAFFOLDDIR = ./templates
TESTDIR = ./tests
EXAMPLEDIR = ./examples

ifeq ($(OS), Windows_NT)
	REGRESSION_TEST_COMMAND=pwsh ./scripts/regression-testing.ps1
else
	REGRESSION_TEST_COMMAND=zsh ./scripts/regression-testing.zsh
endif


.PHONY: all cls doc clean FORCE_MAKE copy pkg pkg-only

$(PACKAGE).pdf: cls FORCE_MAKE
	@$(LATEXMK) -xelatex $(PACKAGE).dtx

$(CLSFILE): $(SOURCES)
	yes y | xetex $(PACKAGE).ins

cls: $(CLSFILE)

doc: $(PACKAGE).pdf

viewdoc: doc
	$(LATEXMK) -pv $(PACKAGE).dtx

clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	-rm -rf *.glo $(CLSFILE)

clean-dist:
	-rm -rf $(PACKAGE).pdf

clean-all: clean clean-dist FORCE_MAKE

test: doc copy FORCE_MAKE
	cd $(SCAFFOLDDIR)/undergraduate-thesis && latexmk && cd ..
	cd $(SCAFFOLDDIR)/paper-translation && latexmk && cd ..
	cd $(SCAFFOLDDIR)/undergraduate-thesis-en && latexmk && cd ..
	cd $(SCAFFOLDDIR)/graduate-thesis && latexmk && cd ..
	cd $(SCAFFOLDDIR)/reading-report && latexmk && cd ..
	cd $(SCAFFOLDDIR)/lab-report && latexmk && cd ..
	cd $(SCAFFOLDDIR)/presentation-slide && latexmk && cd ..
	cd $(TESTDIR)/doctor-thesis && latexmk && cd ..
	cd $(TESTDIR)/autorefs && latexmk && cd ..
	cd ./the-graduates-handbook && latexmk && latexmk -c \
		&& GRADUATE=true latexmk && cd ..

regression-test: cls
	$(REGRESSION_TEST_COMMAND)

copy: cls
	cp bithesis.cls $(SCAFFOLDDIR)/undergraduate-thesis
	cp bithesis.cls $(SCAFFOLDDIR)/undergraduate-thesis-en
	cp bithesis.cls $(SCAFFOLDDIR)/paper-translation
	cp bithesis.cls $(SCAFFOLDDIR)/graduate-thesis
	cp bithesis.cls $(SCAFFOLDDIR)/reading-report
	cp bithesis.cls $(TESTDIR)/doctor-thesis
	cp bithesis.cls $(TESTDIR)/autorefs
	cp bithesis.cls ./the-graduates-handbook
	cp bitreport.cls $(SCAFFOLDDIR)/lab-report
	cp bitbeamer.cls $(SCAFFOLDDIR)/presentation-slide

# Generate scaffolds for overleaf
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
		xargs -I {} bash -c \
		"cp -r ./templates/{} overleaf && cp $(PACKAGE).pdf ./overleaf/{} && (cd overleaf/{}/ && zip -r ../BIThesis-{}-v$(version).zip .)"

dev:
	ls bithesis.dtx | entr -s 'yes y | make doc && make copy'

dev-doc:
	ls bithesis.dtx | entr -s 'make clean-all && yes y | make doc && open bithesis.pdf'

pkg-only:
	rm -rf ./bithesis ./bithesis.zip
	mkdir bithesis
	cp bithesis.ins bithesis.dtx bithesis.pdf ./README*.md ./contributing*.md ./bithesis
	mv ./bithesis/README-bithesis.md ./bithesis/README.md
	zip -r bithesis.zip bithesis

pkg: doc pkg-only

GRAD_DEST_DIR = ./BIThesis-graduate-thesis-template

handbooks: copy FORCE_MAKE
	cd the-graduates-handbook && latexmk -c \
		&& GRADUATE=true latexmk && mv main.pdf graduate-handbook.pdf \
	  && latexmk -c \
	  && latexmk && mv main.pdf undergraduate-handbook.pdf && cd -

# 用于提供给研究生院
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
	cp ./the-graduates-handbook/graduate-handbook.pdf ${GRAD_DEST_DIR}-${version}/'2-快速使用手册'.pdf
	(cd ${GRAD_DEST_DIR}-${version}/graduate-thesis/ && zip -rm ../"1-BIThesis-论文模板-${version}".zip . )
	rmdir ${GRAD_DEST_DIR}-${version}/graduate-thesis
	zip -r ${GRAD_DEST_DIR}-${version}.zip ${GRAD_DEST_DIR}-${version}

UNDERGRAD_DEST_DIR = ./BIThesis-undergraduate-thesis-templates

# 用于提供给教务部
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
	cp ./the-graduates-handbook/undergraduate-handbook.pdf ${UNDERGRAD_DEST_DIR}-${version}/'5-快速使用手册'.pdf
	(cd ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis/ && zip -rm ../"1-BIThesis-本科毕设论文模板-${version}".zip . )
	(cd ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis-en/ && zip -rm ../"2-BIThesis-本科毕设论文模板（全英文）-${version}".zip . )
	(cd ${UNDERGRAD_DEST_DIR}-${version}/paper-translation/ && zip -rm ../"3-BIThesis-本科毕设外文翻译-${version}".zip . )
	rmdir ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis
	rmdir ${UNDERGRAD_DEST_DIR}-${version}/undergraduate-thesis-en
	rmdir ${UNDERGRAD_DEST_DIR}-${version}/paper-translation
	zip -r ${UNDERGRAD_DEST_DIR}-${version}.zip ${UNDERGRAD_DEST_DIR}-${version}

examples: cls
	cp bithesis.cls $(EXAMPLEDIR)/cover/
	cp bithesis.cls $(EXAMPLEDIR)/publications/
	cd $(EXAMPLEDIR)/cover && latexmk && cd -
	cd $(EXAMPLEDIR)/publications && latexmk && cd -

