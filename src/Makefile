# Use FORCE_MAKE to let latexmk handle dependencies
.PHONY: FORCE_MAKE

CLSFILE = dtx-style.sty bitreport.cls bithesis.cls bitbeamer.cls

bithesis.pdf: cls assets/faq.tex FORCE_MAKE
	latexmk -xelatex bithesis.dtx

.PHONY: cls
cls: $(CLSFILE)

$(CLSFILE): bithesis.ins bithesis.dtx
	yes y | xetex bithesis.ins

assets/faq.tex:
	curl https://bithesis.bitnp.net/faq/index.tex -o assets/faq.tex
