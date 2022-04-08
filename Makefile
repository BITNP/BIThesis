PACKAGE = bithesis

LATEX = xelatex

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty bitart.cls bitbook.cls bitgrad.cls

LATEXMK = latexmk

SCAFFOLDDIR = ./templates

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

test: doc copy FORCE_MAKE
	cd $(SCAFFOLDDIR)/undergraduate-thesis && latexmk && cd ..
	cd $(SCAFFOLDDIR)/master-thesis && latexmk && cd ..
	cd $(SCAFFOLDDIR)/lab-report && latexmk && cd ..
	cd $(SCAFFOLDDIR)/undergraduate-proposal-report && latexmk && cd ..
	cd $(SCAFFOLDDIR)/paper-translation && latexmk && cd ..

regression-test: cls
	zsh ./scripts/regression-testing.zsh

copy: cls
	cp bitbook.cls $(SCAFFOLDDIR)/undergraduate-thesis
	cp bitart.cls $(SCAFFOLDDIR)/lab-report
	cp bitart.cls $(SCAFFOLDDIR)/undergraduate-proposal-report
	cp bitbook.cls $(SCAFFOLDDIR)/paper-translation
	cp bitgrad.cls $(SCAFFOLDDIR)/master-thesis

# Generate scaffolds for overleaf
overleaf: FORCE_MAKE
	git clean -fdx ./templates/
	rm -rf overleaf
	make copy
	mkdir overleaf
	ls templates | xargs -I {} bash -c "cp -r ./templates/{} overleaf && zip -r ./overleaf/{}.zip ./overleaf/{}"
	# cp -r ./templates/undergraduate-thesis overleaf/
	# cp -r ./templates/master-thesis overleaf/
	# cp -r ./templates/lab-report overleaf/
	# cp -r ./templates/undergraduate-proposal-report overleaf/
	# cp -r ./templates/paper-translation overleaf/

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
