SHELL = /bin/bash

DISTDIR = dist/
INSTALLDIR = $(shell kpsewhich --var-value TEXMFHOME)/tex/latex/philipptempel/
SOURCES = $(shell find ./ -type f -name "philipptempel-*.dtx" -and -not -name "philipptempel-vers.dtx")
ADDL_INCLUDES = .latexmkrc
DOCS = $(SOURCES:dtx=pdf)

LATEX = pdflatex --shell-escape
MAKEINDEX = makeindex -s
LATEXMK = latexmk

.PHONY: all
all: ins docs dist

.PHONY: ins
ins: philipptempel.ins $(SOURCES)
	$(LATEX) philipptempel.ins

.PHONY: docs
docs: ins $(DOCS)

# any PDF file depends on its base documented TeX file
%.pdf: %.dtx | ins
	$(LATEX) $^
	$(MAKEINDEX) gind.ist $*.idx
	$(MAKEINDEX) gglo.ist -o $*.gls $*.glo
	$(LATEX) $^

# class files depend on the insaller
%.cls: ins

# combination of everything that needs to be done for distributing
.PHONY:
dist: ins docs
	mkdir -p $(DISTDIR)
	cp *.sty $(DISTDIR)
	cp *.code.tex $(DISTDIR)
	cp *.pdf $(DISTDIR)

# clean directory from all dirt
.PHONY: clean
clean:
	[ `ls -1 *.cls 2>/dev/null | wc -l` == 0 ] || rm *.cls
	[ `ls -1 *.sty 2>/dev/null | wc -l` == 0 ] || rm *.sty
	[ `ls -1 *.dict 2>/dev/null | wc -l` == 0 ] || rm *.dict
	[ `ls -1 *.dtx 2>/dev/null | wc -l` == 0 ] || $(LATEXMK) -c -silent *.dtx
	[ `ls -1 *.tex 2>/dev/null | wc -l` == 0 ] || $(LATEXMK) -c -silent *.ins
	[ `ls -1 *.tex 2>/dev/null | wc -l` == 0 ] || $(LATEXMK) -c -silent *.tex

# reseat directory to its original, distributed state
.PHONY: distclean
distclean: clean
	[ `ls -1 *.dtx 2>/dev/null | wc -l` == 0 ] || $(LATEXMK) -C -silent *.dtx
	[ `ls -1 *.dtx 2>/dev/null | wc -l` == 0 ] || $(LATEXMK) -C -silent *.ins
	[ `ls -1 *.tex 2>/dev/null | wc -l` == 0 ] || $(LATEXMK) -C -silent *.tex && rm -f *.tex
	[ ! -d $(DISTDIR) ] || rm -r $(DISTDIR)

# copy compiled files over to user's texmf home
.PHONY: install
install: ins
	mkdir -p $(INSTALLDIR)
	[ `ls -1 *.cls 2>/dev/null | wc -l` == 0 ] || cp *.cls $(INSTALLDIR)
	[ `ls -1 *.sty 2>/dev/null | wc -l` == 0 ] || cp *.sty $(INSTALLDIR)
	[ `ls -1 *.code.tex 2>/dev/null | wc -l` == 0 ] || cp *.code.tex $(INSTALLDIR)

# uninstall from user's texmf home
.PHONY: uninstall
uninstall: distclean
	rm -rf $(INSTALLDIR)
