SRC = Arnold_Jeffrey_CV.md
OUTPUT_DIR = output

TEX_FILE = $(SRC:%.md=%.tex)
PDF_FILE = $(SRC:%.md=$(OUTPUT_DIR)/%.pdf)
HTML_FILE = $(OUTPUT_DIR)/index.html

PANDOC = pandoc
LATEX = xelatex
OPTS := -f markdown+yaml_metadata_block 
OPTS += -M date="$(shell date +'%B %d, %Y')"
OPTS += -M date-meta="$(shell date +'%B %d, %Y')"
OPTS += --smart
LATEX_TEMPLATE = template.tex
HTML_TEMPLATE = template.html

CSS_FILE = css/jrnoldcv.css

all: build

$(OUTPUT_DIR):
	mkdir $(OUTPUT_DIR)

$(OUTPUT_DIR)/index.html: $(SRC) $(HTML_TEMPLATE)
	$(PANDOC) $(OPTS) --template=$(HTML_TEMPLATE) -M css=$(CSS_FILE) -M pdf-link=$(notdir $(PDF_FILE)) -o $@ $<

%.tex: %.md $(LATEX_TEMPLATE)
	$(PANDOC) $(OPTS) --template=$(LATEX_TEMPLATE) -o $@ $<

$(OUTPUT_DIR)/%.pdf: %.tex
	$(LATEX) -interaction nonstopmode -output-directory $(OUTPUT_DIR) $<
	-cd $(OUTPUT_DIR) && rm *.log *.aux *.out

build: $(OUTPUT_DIR) $(PDF_FILE) $(HTML_FILE)
	@echo $(OUTPUT_DIR) $(PDF_FILE) $(HTML_FILE)
	cp -R css $(OUTPUT_DIR)


