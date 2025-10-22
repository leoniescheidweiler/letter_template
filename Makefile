# Makefile
MAIN = main
LATEXMK = TEXINPUTS=include: BSTINPUTS=include: latexmk

.PHONY: all clean

all:
	set -e; \
	make clean; \
	$(LATEXMK) $(MAIN).tex; \
	gs \
		-sDEVICE=pdfwrite -sPAPERSIZE=a4 -sOUTPUTFILE=letter.pdf \
		-dNOPAUSE -dFIXEDMEDIA -dPDFFitPage -dBATCH \
		"main.pdf"
	pkill -HUP mupdf-gl || true

clean:
	$(LATEXMK) -C
	rm -rf tmp/*
	rm letter.pdf
