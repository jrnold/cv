SRC = Arnold_Jeffrey_CV.md

TEX_FILE = $(SRC:%.md=%.tex)
PDF_FILE = $(SRC:%.md=%.pdf)
HTML_FILE = index.html

GITHUB_SRC = https://github.com/jrnold/jrnold-cv
GIT_TIMESTAMP = $(shell git --no-pager log -1 HEAD --pretty=format:"%cD")
GIT_REV = $(shell git --no-pager log -1 HEAD --pretty=format:"%h")
TIMESTAMP = $(shell date)

PANDOC = pandoc
PANDOC_CITEPROC = pandoc-citeproc
LATEX = xelatex
OPTS := -f markdown+yaml_metadata_block
OPTS += -M date="$(shell date +'%B %d, %Y')"
OPTS += -M timestamp="$(TIMESTAMP)"
OPTS += -M date-meta="$(TIMESTAMP)"
OPTS += --smart
OPTS += --filter $(PANDOC_CITEPROC) --bibliography=mypubs.bib --csl=csl/chicago-fullnote-bibliography-syllabus.csl
OPTS += --filter ./removebib.py
OPTS += -M pdf-link=$(notdir $(PDF_FILE))
OPTS += -M github-src="$(GITHUB_SRC)"
OPTS += -M git-timestamp="$(GIT_TIMESTAMP)"
OPTS += -M git-rev="$(GIT_REV)"

LATEX_TEMPLATE = template.tex
HTML_TEMPLATE = template.html

HTML_OPTS = --self-contained --template=$(HTML_TEMPLATE) -M css=$(CSS_FILE)
LATEX_OPTS = --template=$(LATEX_TEMPLATE)

CSS_FILE = css/jrnoldcv.css

all: build

index.html: $(SRC) $(HTML_TEMPLATE)
	$(PANDOC) $(OPTS) $(HTML_OPTS) -o $@ $<

%.tex: %.md $(LATEX_TEMPLATE)
	$(PANDOC) $(OPTS) $(LATEX_OPTS) -o $@ $<

%.pdf: %.tex
	$(LATEX) -interaction nonstopmode $<

build: $(PDF_FILE) $(HTML_FILE)

.PRECIOUS: $(TEX_FILE)
