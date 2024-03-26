all:
	gnuplot puplot.eng
	for i in *.ps; do ps2epsi $$i; done
	for i in *.epsi; do mv $$i `basename $$i .epsi`.ps; done

clean:
	-rm -f *.ps */*.ps *.epsi *~
