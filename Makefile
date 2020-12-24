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
	$(LATEXMK) $(PACKAGE).dtx

$(CLSFILE): $(SOURCES)
	xetex $(PACKAGE).ins

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
