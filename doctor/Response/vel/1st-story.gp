### ���Ϥκ���®�٤ˤ��1�ؤκ����ش��ѷ��ѡ�������񥨥ͥ륮���ΰ㤤
cd "/home/nakaji/paper/phD/Response/vel/"
set term postscript eps plus 24

set xlabel "base shear coefficient $C_0$"
set xrange [0:1.0]

set data style lines

set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 
set ztics border nomirror norotate autofreq 
set key title ""
set key right top Right noreverse box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0

## 1�ؤκ����ش��ѷ���
set ylabel "maximum story deformation angle"
set yrange [0:0.1]
set ytics 0,0.05,0.15

set output "figs/max-rad/50kine.eps"
plot '50/JMA-Kobe/MKOBE.txt' u 4:12 title 'JMA-Kobe','50/JR-Takatori/MTKTR.txt' u 4:12 title 'JR Takatori', '50/JR-Nisiakasi/MNSAK.txt' u 4:12 title 'JR Nishi-Akashi', '50/JR-Takarazuka/MTKRZ.txt' u 4:12 title 'JR Takarazuka', '50/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:12 title 'Osaka GAS Fukiai', '50/ElCentro/MELCN.txt' u 4:12 title 'ElCentro', '50/Hachinohe/MHACH.txt' u 4:12 title 'Hachinohe'

set output "figs/max-rad/75kine.eps"
plot '75/JMA-Kobe/MKOBE.txt' u 4:12 title 'JMA-Kobe','75/JR-Takatori/MTKTR.txt' u 4:12 title 'JR Takatori', '75/JR-Nisiakasi/MNSAK.txt' u 4:12 title 'JR Nishi-Akashi', '75/JR-Takarazuka/MTKRZ.txt' u 4:12 title 'JR Takarazuka', '75/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:12 title 'Osaka GAS Fukiai', '75/ElCentro/MELCN.txt' u 4:12 title 'ElCentro', '75/Hachinohe/MHACH.txt' u 4:12 title 'Hachinohe'

set yrange [0:0.15]

set output "figs/max-rad/100kine.eps"
plot '100/JMA-Kobe/MKOBE.txt' u 4:12 title 'JMA-Kobe','100/JR-Takatori/MTKTR.txt' u 4:12 title 'JR Takatori', '100/JR-Nisiakasi/MNSAK.txt' u 4:12 title 'JR Nishi-Akashi', '100/JR-Takarazuka/MTKRZ.txt' u 4:12 title 'JR Takarazuka', '100/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:12 title 'Osaka GAS Fukiai', '100/ElCentro/MELCN.txt' u 4:12 title 'ElCentro', '100/Hachinohe/MHACH.txt' u 4:12 title 'Hachinohe'

set output "figs/max-rad/125kine.eps"
plot '125/JMA-Kobe/MKOBE.txt' u 4:12 title 'JMA-Kobe','125/JR-Takatori/MTKTR.txt' u 4:12 title 'JR Takatori', '125/JR-Nisiakasi/MNSAK.txt' u 4:12 title 'JR Nishi-Akashi', '125/JR-Takarazuka/MTKRZ.txt' u 4:12 title 'JR Takarazuka', '125/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:12 title 'Osaka GAS Fukiai', '125/ElCentro/MELCN.txt' u 4:12 title 'ElCentro', '125/Hachinohe/MHACH.txt' u 4:12 title 'Hachinohe'

## 1�ؤ�������񥨥ͥ륮��
set ylabel "cumulative hysteretic energy"
set yrange [0:2000]

set output "figs/che/50kine.eps"
plot '50/JMA-Kobe/MKOBE.txt' u 4:16 title 'JMA-Kobe','50/JR-Takatori/MTKTR.txt' u 4:16 title 'JR Takatori', '50/JR-Nisiakasi/MNSAK.txt' u 4:16 title 'JR Nishi-Akashi', '50/JR-Takarazuka/MTKRZ.txt' u 4:16 title 'JR Takarazuka', '50/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:16 title 'Osaka GAS Fukiai', '50/ElCentro/MELCN.txt' u 4:16 title 'ElCentro', '50/Hachinohe/MHACH.txt' u 4:16 title 'Hachinohe'

set output "figs/che/75kine.eps"
plot '75/JMA-Kobe/MKOBE.txt' u 4:16 title 'JMA-Kobe','75/JR-Takatori/MTKTR.txt' u 4:16 title 'JR Takatori', '75/JR-Nisiakasi/MNSAK.txt' u 4:16 title 'JR Nishi-Akashi', '75/JR-Takarazuka/MTKRZ.txt' u 4:16 title 'JR Takarazuka', '75/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:16 title 'Osaka GAS Fukiai', '75/ElCentro/MELCN.txt' u 4:16 title 'ElCentro', '75/Hachinohe/MHACH.txt' u 4:16 title 'Hachinohe'

set output "figs/che/100kine.eps"
plot '100/JMA-Kobe/MKOBE.txt' u 4:16 title 'JMA-Kobe','100/JR-Takatori/MTKTR.txt' u 4:16 title 'JR Takatori', '100/JR-Nisiakasi/MNSAK.txt' u 4:16 title 'JR Nishi-Akashi', '100/JR-Takarazuka/MTKRZ.txt' u 4:16 title 'JR Takarazuka', '100/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:16 title 'Osaka GAS Fukiai', '100/ElCentro/MELCN.txt' u 4:16 title 'ElCentro', '100/Hachinohe/MHACH.txt' u 4:16 title 'Hachinohe'

set output "figs/che/125kine.eps"
plot '125/JMA-Kobe/MKOBE.txt' u 4:16 title 'JMA-Kobe','125/JR-Takatori/MTKTR.txt' u 4:16 title 'JR Takatori', '125/JR-Nisiakasi/MNSAK.txt' u 4:16 title 'JR Nishi-Akashi', '125/JR-Takarazuka/MTKRZ.txt' u 4:16 title 'JR Takarazuka', '125/O_GAS_Fukiai/MG_FUKIAI.txt' u 4:16 title 'Osaka GAS Fukiai', '125/ElCentro/MELCN.txt' u 4:16 title 'ElCentro', '125/Hachinohe/MHACH.txt' u 4:16 title 'Hachinohe'