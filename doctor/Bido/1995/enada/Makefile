OUT = wav fft trs

SPC = spc -b0.5 -s3 --blc

all: tomi tsubo aga aga2

tomi: tomi.ns tomi.ew tomi.ud

tsubo: tsubo.ns tsubo.ew tsubo.ud

aga: aga.ns aga.ew aga.ud

aga2: aga2.ns aga2.ew aga2.ud

tomi.ns:
	( cd TOMI/NS ; $(SPC) tomi1 )

tomi.ew:
	( cd TOMI/EW ; $(SPC) tomi2 )

tomi.ud:
	( cd TOMI/UD ; $(SPC) tomi3 )

tsubo.ns:
	( cd TSUBO/NS ; $(SPC) tsubo2 )

tsubo.ew:
	( cd TSUBO/EW ; $(SPC) tsubo3 )

tsubo.ud:
	( cd TSUBO/UD ; $(SPC) tsubo1 )

aga.ns:
	( cd AGA/NS ; $(SPC) aga1 )

aga.ew:
	( cd AGA/EW ; $(SPC) aga2 )

aga.ud:
	( cd AGA/UD ; $(SPC) aga3 )

aga2.ns:
	( cd AGA2/NS ; $(SPC) aga22 )

aga2.ew:
	( cd AGA2/EW ; $(SPC) aga23 )

aga2.ud:
	( cd AGA2/UD ; $(SPC) aga21 )

clean:
	for d in TOMI TSUBO AGA AGA2 ; do \
	    ( cd $$d ; \
		for sub in NS EW UD ; do \
		    (cd $$sub ; for ext in $(OUT); do rm -f *.$$ext; done) ; \
		done ) ; \
	done
