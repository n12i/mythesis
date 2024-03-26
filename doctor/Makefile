LATEX = platex
BIBTEX = pbibtex
DVIPS = dvips
PRINTER = lp
DVIPSOPT = #-P$(PRINTER)
WAIT = 300
SHELL = /usr/local/bin/bash
CWD = /home/nakaji/paper/phD

all default:
	@test -f paper.dvi && xdvi paper || echo "run 'make dvi' first."

dvi: clean
	$(LATEX) paper
	$(BIBTEX) paper
	$(LATEX) paper
	$(LATEX) paper
	$(LATEX) paper

ps:
	$(DVIPS) -o paper.ps paper

print:
	$(DVIPS) $(DVIPSOPT) -l 10 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 11 -l 20 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 21 -l 30 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 31 -l 40 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 41 -l 50 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 51 -l 60 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 61 -l 70 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 71 -l 80 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 81 -l 90 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 91 -l 100 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 101 -l 110 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 111 -l 120 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 121 -l 130 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 131 -l 140 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 141 -l 150 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 151 -l 160 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 161 -l 170 paper ; sleep $(WAIT)
	$(DVIPS) $(DVIPSOPT) -p 171 paper

draft:
	$(MAKE) print PRINTER=oki

html: dvi
	@test -d ./paper && rm -rf ./paper || true
	env TEXINPUTS=$(CWD)/styles/:$${TEXINPUTS} jlatex2html -html_version 4.0,math paper.tex 2>&1 | tee make.html.log

clean:
	rm -f *.toc *.aux *.log
	rm -f *.bbl *.blg
	rm -f *~ core

distclean realclean: clean
	rm -f *.dvi
	rm -f *.ps
	rm -fr paper

sync: get put
get:
	rsync -avuzb --exclude '*~' -e ssh nakaji@zeisei8.dpri.kyoto-u.ac.jp:/home/nakaji/paper/phD/. .
put:
	rsync -avuzb --exclude '*~' -e ssh . nakaji@zeisei8.dpri.kyoto-u.ac.jp:/home/nakaji/paper/phD/.
