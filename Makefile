TEX = medical_tests
BIB = references.bib

.PHONY: all clean distclean

all: $(TEX).pdf

$(TEX).pdf: $(TEX).tex $(wildcard tests_chapters/*.tex) $(BIB)
	pdflatex -interaction=nonstopmode $(TEX)
	pdflatex -interaction=nonstopmode $(TEX)
	for aux in tests_chapters/*.aux; do \
		if grep -q '\\bibdata' "$$aux"; then bibtex "$$aux"; fi; \
	done
	pdflatex -interaction=nonstopmode $(TEX)
	pdflatex -interaction=nonstopmode $(TEX)

clean:
	rm -f *.aux *.idx *.log *.out *.toc *.bbl *.blg tests_chapters/*.aux tests_chapters/*.bbl tests_chapters/*.blg

distclean: clean
	rm -f $(TEX).pdf
