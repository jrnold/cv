SRC = Arnold_Jeffrey_CV.md
PDF = $(SRC:%.md=%.pdf)
HTML = $(SRC:%.md=%.html)

PANDOC = pandoc
LATEX = xelatex
OPTS := -f markdown+yaml_metadata_block 
OPTS += -M date="$(shell date +'%B %d, %Y')"
OPTS += --smart
LATEX_TEMPLATE = template.tex
HTML_TEMPLATE = template.html

all: $(PDF) $(HTML)
	@echo $(PDF) $(HTML)

%.html: %.md
	$(PANDOC) $(OPTS) --template=$(HTML_TEMPLATE) -o $@ $<

%.tex: %.md
	$(PANDOC) $(OPTS) --template=$(LATEX_TEMPLATE) -o $@ $<

%.pdf: %.tex
	$(LATEX) -interaction nonstopmode $<
