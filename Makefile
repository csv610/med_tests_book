TEX = medical_tests

.PHONY: all clean distclean

all: $(TEX).pdf

$(TEX).pdf: $(TEX).tex $(wildcard tests_chapters/*.tex)
	pdflatex -interaction=nonstopmode $(TEX)
	pdflatex -interaction=nonstopmode $(TEX)

clean:
	rm -f *.aux *.idx *.log *.out *.toc tests_chapters/*.aux

distclean: clean
	rm -f $(TEX).pdf
