LATEX = platex
BIBTEX = pbibtex
XDVI = xdvi

MAIN = paper.tex
BIB = reference.bib
AUX = paper.aux
BBL = paper.bbl
DVI = paper.dvi
PS = paper.ps

SECTIONS = section1.tex section2.tex section3.tex section4.tex section6.tex\
           appendix.tex
OTHERS = ronbun.tex sites.tex table_bido.tex plan.tex tairyoku.tex \
	 kaberitsu.tex kabetype.tex skelton.tex kasane.tex params.tex \
	 koyushuki.tex juryokijun.tex spec.tex bidowave.tex notation.tex \
         kekka.tex freewave.tex fspec.tex figs.tex
INCLUDES = $(SECTIONS) $(OTHERS) shuron.bst

FIG1 = figs/bido3.eps figs/fv.eps figs/disp_meter.eps\
       figs/kigo.eps figs/enload.eps figs/shichijo.eps\
       figs/haumesse.eps

FIG2 = $(PDDIR)/shichijo1.ps $(PDDIR)/shichijo6.ps \
       $(PDDIR)/tsuji1.ps $(PDDIR)/tsuji6.ps \
       $(PDDIR)/tanaka1.ps $(PDDIR)/tanaka6.ps \
       $(PDDIR)/sugiura1.ps $(PDDIR)/sugiura6.ps \
       $(PDDIR)/haumesse1.ps $(PDDIR)/haumesse6.ps

FIG3 = $(PDDIR)/shichijo_ga.ps \
       $(PDDIR)/tsuji_ga.ps \
       $(PDDIR)/tanaka_ga.ps \
       $(PDDIR)/sugiura_ga.ps \
       $(PDDIR)/haumesse_ga.ps \

FIG4 = $(PLANDIR)/shichi12.eps $(PLANDIR)/tsuji.eps $(PLANDIR)/tanaka.eps\
       $(PLANDIR)/sugiura.eps $(PLANDIR)/haumesse.eps \
       figs/bido/shb.epsi figs/bido/sha.epsi \
       figs/FV/*.ps \
       figs/Res/outo1.ps figs/Res/outo2.ps figs/Res/outo3.ps \
       figs/Res/outo4.ps figs/Res/outo5.ps 

PHOTO1 = figs/photos/keisoku.eps figs/photos/loadsel.eps \
         figs/photos/pickup.eps figs/photos/rufter_vert.ps \
         figs/photos/spc35.eps figs/photos/sh-sujikai.eps \
         figs/photos/sh-harami.eps figs/photos/sh-hazure.eps \
         figs/photos/tu77.eps figs/photos/tu-shoji.eps \
         figs/photos/tu-glass.eps figs/photos/ta-hashira.eps

PDDIR = figs/load-disp
PLANDIR = figs/plan

TEX_SOURCE = $(MAIN) $(INCLUDES)
FIGS = $(FIG1) $(FIG2) $(FIG3) $(FIG4) $(PHOTO1)

all: $(DVI)

$(DVI): $(TEX_SOURCE) $(FIGS) reference.bib
	$(LATEX) $(MAIN)
	$(BIBTEX) `basename $(MAIN) .tex`
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

# $(BBL): $(TEX_SOURCES) $(FIGS)
# 	$(LATEX) $(MAIN)
# 	$(BIBTEX) `basename $(MAIN) .tex`

# $(FIG2): $(FIGDIR)/puplot
# 	( cd $(FIGDIR) ; gnuplot puplot )

# $(FIG3): $(FIGDIR)/gamma
# 	( cd $(FIGDIR) ; gnuplot gamma )

view: $(DVI)
	xdvi $< 

ps: $(PS)
$(PS): $(DVI)
	dvi2ps $(DVI) > $@

out: all
	dvi2ps $(DVI) | lp -d lw	

clean:
	rm -f *.toc *.aux *.log *.cp *.cps *.fn *.tp *.vr *.pg *.ky *~
	rm -f *.bbl *.blg
realclean: clean
	rm -f *.dvi
	rm -f $(PS)
