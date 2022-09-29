PACKAGE = bithesis

LATEX = xelatex

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty bitart.cls bitbook.cls bitgrad.cls bitreport.cls bithesis.cls bitbeamer.cls

LATEXMK = latexmk

SCAFFOLDDIR = ./templates
TESTDIR = ./tests

# make deletion work on Windows
ifdef SystemRoot
  RM = del /Q
else
  RM = rm -f
endif

.PHONY: all cls doc clean FORCE_MAKE copy

$(PACKAGE).pdf: cls FORCE_MAKE
	$(LATEXMK) -xelatex $(PACKAGE).dtx

$(CLSFILE): $(SOURCES)
	yes y | xetex $(PACKAGE).ins

cls: $(CLSFILE)

doc: $(PACKAGE).pdf

viewdoc: doc
	$(LATEXMK) -pv $(PACKAGE).dtx

clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	-@$(RM) -r *.glo $(CLSFILE)

clean-dist:
	-@$(RM) -r $(PACKAGE).pdf

clean-all: clean clean-dist FORCE_MAKE

test: doc copy FORCE_MAKE
	cd $(SCAFFOLDDIR)/undergraduate-proposal-report && latexmk && cd ..
	cd $(SCAFFOLDDIR)/undergraduate-thesis && latexmk && cd ..
	cd $(SCAFFOLDDIR)/paper-translation && latexmk && cd ..
	cd $(SCAFFOLDDIR)/undergraduate-thesis-en && latexmk && cd ..
	cd $(SCAFFOLDDIR)/graduate-thesis && latexmk && cd ..
	cd $(SCAFFOLDDIR)/lab-report && latexmk && cd ..
	cd $(SCAFFOLDDIR)/presentation-slide && latexmk && cd ..
	cd $(TESTDIR)/doctor-thesis && latexmk && cd ..

regression-test: cls
	zsh ./scripts/regression-testing.zsh

copy: cls
	cp bithesis.cls $(SCAFFOLDDIR)/undergraduate-thesis
	cp bithesis.cls $(SCAFFOLDDIR)/undergraduate-thesis-en
	cp bithesis.cls $(SCAFFOLDDIR)/paper-translation
	cp bithesis.cls $(SCAFFOLDDIR)/graduate-thesis
	cp bithesis.cls $(TESTDIR)/doctor-thesis
	cp bitreport.cls $(SCAFFOLDDIR)/undergraduate-proposal-report
	cp bitreport.cls $(SCAFFOLDDIR)/lab-report
	cp bitbeamer.cls $(SCAFFOLDDIR)/presentation-slide

# Generate scaffolds for overleaf
overleaf: FORCE_MAKE
	git clean -fdx ./templates/
	rm -rf overleaf
	make copy
	mkdir overleaf
	ls templates | xargs -I {} bash -c "cp -r ./templates/{} overleaf && zip -r ./overleaf/{}.zip ./overleaf/{}"

dev:
	ls bithesis.dtx | entr -s 'yes y | make doc && make copy'

dev-doc:
	ls bithesis.dtx | entr -s 'make clean-all && yes y | make doc && open bithesis.pdf'

pkg: doc
	rm -rf ./bithesis ./bithesis.zip
	mkdir bithesis
	cp bithesis.{ins,dtx,pdf} ./README*.md ./contributing*.md ./bithesis
	mv ./bithesis/README-bithesis.md ./bithesis/README.md
	zip -r bithesis.zip bithesis
