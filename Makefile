PACKAGE = bithesis

LATEX = xelatex

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty bitart.cls bitbook.cls bitgraduate.cls

LATEXMK = latexmk

SCAFFOLDDIR = ../BIThesis-scaffold

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
	-@$(RM) -r *.glo $(CLSFILE) _minted-bithesis

clean-dist:
	-@$(RM) -r $(PACKAGE).pdf

clean-all: clean clean-dist FORCE_MAKE


copy: cls
	cp bitbook.cls $(SCAFFOLDDIR)/graduation-thesis
	cp bitart.cls $(SCAFFOLDDIR)/lab-report
	cp bitart.cls $(SCAFFOLDDIR)/proposal-report
	cp bitbook.cls $(SCAFFOLDDIR)/paper-translation
	cp bitgrad.cls $(SCAFFOLDDIR)/master-thesis

dev:
	ls bithesis.dtx | entr -s 'yes y | make doc && make copy'

dev-doc:
	ls bithesis.dtx | entr -s 'make clean-all && yes y | make doc && open bithesis.pdf'

pkg: doc
	rm -rf ./bithesis
	mkdir bithesis
	cp bithesis.{ins,dtx,pdf} *.md ./bithesis
	mv ./bithesis/README.md ./bithesis/README-zh.md
	mv ./bithesis/README-en.md ./bithesis/README.md
	zip -r bithesis.zip bithesis
