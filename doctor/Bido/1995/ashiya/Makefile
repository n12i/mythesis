SPC=spc --blc --swin=3 --band=0.5
OUTFILE = fft trs

all: ikeda mizu saito shigi togo
	
clean:
	for dir in Ikeda Mizu Saito Shigi Togo; do\
	   for subdir in ns ew ud; do\
	   ( cd $$dir/$$subdir ; for ext in $(OUTFILE); do rm *.$$ext ; done );\
	   done;\
	done
ikeda:
	( cd Ikeda ; for dir in ns ew ud ; do\
	  ( cd $$dir ; $(SPC) ikeda$$dir ) ;\
	done )

mizu:
	( cd Mizu ; for dir in ns ew ud ; do\
	  ( cd $$dir ; $(SPC) mizu$$dir ) ;\
	done )

saito:
	( cd Saito ; for dir in ns ew ud ; do\
	  ( cd $$dir ; $(SPC) saito$$dir ) ;\
	done )

shigi:
	( cd Shigi ; for dir in ns ew ud ; do\
	  ( cd $$dir ; $(SPC) shigi$$dir ) ;\
	done )

togo:
	( cd Togo ; for dir in ns ew ud ; do\
	  ( cd $$dir ; $(SPC) togo$$dir ) ;\
	done )
