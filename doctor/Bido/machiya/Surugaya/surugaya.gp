#### ��Τš�ա��ꥨ���ڥ��ȥ�(�粰)

set term postscript eps 14
set xrange [0:1]
# set xlabel "period (sec)"
# set ylabel "fourier spectrum"

set data style lines

cd "/home/nakaji/paper/phD/Bido/machiya/Surugaya"
set output "omoya.eps"

set size 1.0,1.8
set origin 0.0,0.0
set multiplot
set size 0.5,0.6


set origin 0.,1.2
set xlabel ""
set ylabel "fourier spectrum"
plot "sr226ns.fft" u 2:3 title "�������(��ɽ)"
set origin 0.5,1.2
set xlabel ""
set ylabel ""
plot "sr226ew1.fft" u 2:3 title "ĥ������(��ɽ)"
set origin 0.,0.6
set xlabel ""
set ylabel "fourier spectrum"
plot "sr226ns.fft" u 2:6 title "������","sr226ns.fft" u 2:5 title "2����"
set origin 0.5,0.6
set xlabel ""
set ylabel ""
plot "sr226ew1.fft" u 2:6 title "������","sr226ew1.fft" u 2:5 title "2����"
set origin 0.,0.
set xlabel "period (sec)"
set ylabel "transfer function"
plot "sr226ns.trs" u 2:5 title "������/��ɽ","sr226ns.trs" u 2:6 title "2����/��ɽ"
set origin 0.5,0.
set xlabel "period (sec)"
set ylabel ""
plot "sr226ew1.trs" u 2:5 title "������/��ɽ","sr226ew1.trs" u 2:6 title "2����/��ɽ"
set nomultiplot
