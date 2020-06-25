SHELL   = /bin/sh

FILE0   = main
TEX     = $(FILE0).tex
XDV     = $(FILE0).xdv
PDF     = $(FILE0).pdf
PDFOUT  = $(FILE0)_final.pdf
FILE1   = handout
HTEX    = $(FILE1).tex
HXDV    = $(FILE1).xdv
HPDF    = $(FILE1).pdf


all:
	make tex

tex:
	xelatex -no-pdf $(TEX)
	bibtex $(FILE0)
	xelatex -no-pdf $(TEX)
	xelatex $(TEX)
	make clean

handout:
	xelatex -no-pdf $(HTEX)
	xelatex -no-pdf $(HTEX)
	xdvipdfmx.exe $(HXDV)
#       xelatex $(HTEX)
	make clean

pw:
	pdftk $(PDF) output $(PDFOUT) owner_pw ownerpasswd user_pw userpasswd compress encrypt_128bit


help:
	echo "USAGE: make [all/tex/handout/pw/clean]"

clean:
	rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.nav *.out *.snm *.xdv *.bbl *.fls *.fdb_latexmk *.blg *.toc *~
