## �Ͽ̱������Ϥ��Ѥ����Ͽ���

set term postscript eps
set data style lines
set xrange [0:60]
set yrange [-1000:1000]
set noxtics
set noytics
set xtics 0.,30.,60.
set ytics ("" -1000., "" 0., "1000" 1000.)

cd "/home/nakaji/paper/phD/Response/Seismic-Data"
set output "waves.eps"

set size 1.0,2.1
set origin 0.,0.
set multiplot
set size 1.0,0.3

set nolabel
set origin 0.,1.8
set xlabel ""
set label "max= 818.0gal" at 45,-800
plot 'kob.ns' title "JMA Kobe"

set nolabel
set origin 0.,1.5
set xlabel ""
set label "max= 605.5gal" at 45,-800
plot 'takatori.NS' title "JR Takatori"

set nolabel
set origin 0.,1.2
set xlabel ""
set label "max= 473.8gal" at 45,-800
plot 'nisiakas.NS' title "JR Nisiakasi"

set nolabel
set origin 0.,0.9
set xlabel ""
set label "max= 683.6gal" at 45,-800
plot 'takarazu.NS' title "JR Takarazuka"

set nolabel
set origin 0.,0.6
set xlabel ""
set label "max= 686.5gal" at 45,-800
plot 'G_FUKIAI.ns' title "O-GAS Fukiai"

set nolabel
set origin 0.,0.3
set xlabel ""
set label "max= 341.7.0gal" at 45,-800
plot 'ELCNNS.OUT' title "ElCentro"

set nolabel
set origin 0.,0.
set xlabel "time (sec)"
set label "max= 225.0gal" at 45,-800
plot 'HACHNS.dat' title "Hachinohe"

set nolabel
set nomultiplot
