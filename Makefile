LATEX := pdflatex -file-line-error -interaction=nonstopmode

MASTER := eht-bh-fact-sheet

# rule names that don't have real targets
.PHONY: default all clean

# Just make the PDF by default
default: $(MASTER).pdf

all: $(MASTER).pdf $(MASTER).png

%.pdf: %.tex
	$(LATEX) $^

%.png: %.pdf
	convert -verbose -density 200 $^ $@

clean:
	rm -f *.aux *.out *.log $(MASTER).pdf
