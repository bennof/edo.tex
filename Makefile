## Makefile for Edo.TeX 
## written by Benno Falkner

YEAR := 2019
VERSION := v0.3
TEXMF_PATH ?= /var/lib/

export TEXINPUTS=$(shell pwd)/texmf/tex/edo 
export TEXFORMAT=$(shell pwd)/texmf/tex/edo 
export ENCFONTS=$(shell pwd)/texmf/fonts/enc 
export TFMFONTS=$(shell pwd)/texmf/fonts/tfm 
export TEXFONTMAPS=$(shell pwd)/texmf/fonts/map 
export T1FONTS=$(shell pwd)/texmf/fonts/type1 

all: build

update:
	git pull

build: texmf/tex/edo/edo.pdf.fmt edotex
	
clean:
	rm -f texmf/tex/edo/edo.pdf.fmt
	rm -f edo.pdf.fmt
	rm -f *.log
	rm -f *.fls
	rm -f edotex
	rm -f .tmp
	
texmf/tex/edo/edo.pdf.fmt: texmf/tex/edo/edo.pdf.tex
	TEXINPUTS=$$(pwd)/texmf/tex/edo export TEXINPUTS; \
	TEXFORMAT=$$(pwd)/texmf/tex/edo export TEXFORMAT; \
	ENCFONTS=$$(pwd)/texmf/fonts/enc export ENCFONTS; \
	TFMFONTS=$$(pwd)/texmf/fonts/tfm export TFMFONTS; \
	TEXFONTMAPS=$$(pwd)/texmf/fonts/map export TEXFONTMAPS; \
	T1FONTS=$$(pwd)/texmf/fonts/type1 export T1FONTS; \
	pdftex --ini --recorder --file-line-error edo.pdf.tex
	mv -f edo.pdf.fmt texmf/tex/edo/

edotex: FORCE
	@echo echo "Edo.TeX $(YEAR) $(VERSION)" > edotex
	@echo CDIR=$$(pwd) >> edotex
	@echo TEXINPUTS=.:\$${CDIR}/texmf/tex/edo export TEXINPUTS >> edotex
	@echo TEXFORMAT=\$${CDIR}/texmf/tex/edo export TEXFORMAT >> edotex
	@echo ENCFONTS=\$${CDIR}/texmf/fonts/enc export ENCFONTS >> edotex
	@echo TFMFONTS=\$${CDIR}/texmf/fonts/tfm export TFMFONTS >> edotex
	@echo TEXFONTMAPS=\$${CDIR}/texmf/fonts/map export TEXFONTMAPS >> edotex
	@echo T1FONTS=\$${CDIR}/texmf/fonts/type1 export T1FONTS >> edotex
	@echo pdftex -fmt \$${CDIR}/texmf/tex/edo/edo.pdf \$$@ >> edotex
	@chmod 755 edotex

.PHONY: FORCE
FORCE: 

install:
	find texmf -type f -exec install -D -m 644 "{}" $(TEXMF_PATH)"{}" \;
	cat edotex | sed 's#^CDIR.*#CDIR=$(TEXMF_PATH)#' > .tmp
	install -m 755 .tmp /usr/local/bin/edotex

install-osx:
	cp -r texmf $(TEXMF_PATH)
	chmod -R 644 $(TEXMF_PATH)texmf
	find $(TEXMF_PATH)texmf -type d -exec chmod 755 {} \;
	cat edotex | sed 's#^CDIR.*#CDIR=$(TEXMF_PATH)#' > .tmp
	install -m 755 .tmp /usr/local/bin/edotex
	
