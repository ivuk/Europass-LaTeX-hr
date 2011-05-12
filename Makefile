all:
	pdflatex cv_template_hr.tex
	bibtex cv_template_hr.aux
	pdflatex cv_template_hr.tex
	pdflatex cv_template_hr.tex

clean:
	rm -f *.aux *.bbl *.backup *.lot *.lof *.blg *.pdf *.dvi *.log
