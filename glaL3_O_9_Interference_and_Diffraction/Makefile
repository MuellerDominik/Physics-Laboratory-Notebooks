name = glaL3_O_9_Interference_and_Diffraction_Mueller_Dominik

all:
	

build:
	pdflatex -interaction=batchmode $(name).tex
	biber --onlylog $(name)
	pdflatex -interaction=batchmode $(name).tex
	pdflatex -interaction=batchmode $(name).tex

clean:
	rm -f *.aux *.glo *.ist *.log *.out *.toc *.lof *.lot *.fls *.fmt *.fot *.cb *.cb2 .*.lb
	rm -f *.synctex *.synctex\(busy\) *.synctex.gz *.synctex.gz\(busy\) *.pdfsync
	rm -f *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml
	rm -f ./sections/*.aux ./sections/*.bib.bak ./sections/*.bib.sav ./sections/*.log
	rm -f *.glg *.gls

purge: clean
	rm -f *.pdf
