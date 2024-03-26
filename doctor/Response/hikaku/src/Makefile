#SHELL = /usr/local/bin/bash -norc

FC = f77
FFLAGS = -xtarget=ultra
#FFLAGS = -fast
LIBS = -lV77

OBJ = qs2his.o qs2fhis.o rkf20.o 2damp.o

PROGRAM = qs2his

#SITES=	JMA-Kobe

all: $(PROGRAM)
	rm -f tmperr tmperr2
	test -d outfiles || mkdir outfiles

$(PROGRAM): $(OBJ)
	$(FC) $(FFLAGS) -o $(PROGRAM) $(OBJ) $(LIBS)

clean:
	rm -f $(OBJ) core *~ $(PROGRAM) .datafiles *.out */*~
	rm -f tmperr temp.dat *.txt *.log

outclean:
	find . -name '*.txt.gz' -print | xargs rm -fv

gzip:
	find . -name '*.txt' -print | xargs gzip -9v

check:
	( cd ..; ./hikaku.pl )
	./qs2his temp.dat >/dev/null

#nu:
#	./utils/nu.sh

gamma:
	./utils/testgamma.pl ${SITES}

Rm:
	./utils/weightratio.pl ${SITES}

vary:
	./utils/varicalib.pl ${SITES}

beta:
	./utils/beta.pl ${SITES}
