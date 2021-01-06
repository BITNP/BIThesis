PACKAGE = bithesis

LATEX = xelatex

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty bitart.cls bitbook.cls

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
	yes -y y | $(LATEXMK) -xelatex $(PACKAGE).dtx

$(CLSFILE): $(SOURCES)
	yes -y y | xetex $(PACKAGE).ins

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


copy:
	cp bitbook.cls $(SCAFFOLDDIR)/graduation-thesis
	cp bitart.cls $(SCAFFOLDDIR)/lab-report
	cp bitart.cls $(SCAFFOLDDIR)/proposal-report

dev:
	ls bithesis.dtx | entr -s 'yes -y y | make doc && make copy'

dev-doc:
	ls bithesis.dtx | entr -s 'make clean-all && yes -y y | make doc && open bithesis.pdf'

pkg: doc
	zip -r bithesis.zip bithesis.{ins,dtx,pdf} README.md
