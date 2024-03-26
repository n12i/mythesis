BASE = sr226ns sr226ew1 sr226ud
SPC = spc $(OPT)
OPT = #-s5 -b0.5

all:
	for i in $(BASE) ; do $(SPC) $$i ; done
	$(SPC) -t sr226ew2

clean:
	rm -f *.fft *.trs *~ core
