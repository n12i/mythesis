SPC=spc
DIR=Hata Kojima
SUBDIR1=omoya omote
SUBDIR2=omoya kura
DBL=`ls *.dbl | sed -e 's/\.dbl//'`

all: hata kojima

hata: hata.ns hata.ew hata.ud
kojima: kojima.ns kojima.ew kojima.ud

ns: hata.ns kojima.ns
ew: hata.ew kojima.ew
ud: hata.ud kojima.ud

hata.ns:
	( cd Hata ; \
	  for dir in $(SUBDIR1) ; do \
		( cd $$dir/NS ; $(SPC) $(DBL) ) ; \
	  done )

hata.ew:
	( cd Hata ; \
	  for dir in $(SUBDIR1) ; do \
		( cd $$dir/EW ; $(SPC) $(DBL) ) ; \
	  done )

hata.ud:
	( cd Hata ; \
	  for dir in $(SUBDIR1) ; do \
		( cd $$dir/UD ; $(SPC) $(DBL) ) ; \
	  done )

kojima.ns:
	( cd Kojima ; \
	  for dir in $(SUBDIR2) ; do \
		( cd $$dir/NS ; $(SPC) $(DBL) ) ; \
	  done )

kojima.ew:
	( cd Kojima ; \
	  for dir in $(SUBDIR2) ; do \
		( cd $$dir/EW ; $(SPC) $(DBL) ) ; \
	  done )

kojima.ud:
	( cd Kojima ; \
	  for dir in $(SUBDIR2) ; do \
		( cd $$dir/UD ; $(SPC) $(DBL) ) ; \
	  done )

clean:
	for d in $(DIR) ; do ( cd $$d ; \
		for dir in $(SUBDIR1) $(SUBDIR2) ; do \
		if [ -d $$dir ] ; then \
		rm -f $$dir/*/[D-P]* ; \
		fi ; done ) ; \
	done
