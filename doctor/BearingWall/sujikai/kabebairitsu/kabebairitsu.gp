### �ڤ�������¤���Ȥ�����Ψ����

# set term postscript eps plus color 16
set term latex
set xtics ("\\shortstack{\\small ����\\\\1P}" 1, "\\shortstack{\\small ����\\\\2P}" 2, "\\shortstack{\\small �٥��ޥ�\\\\1P}" 3, "\\shortstack{\\small �٥��ޥ�\\\\2P}" 4, "\\shortstack{\\small ����\\\\1P}" 5, "\\shortstack{\\small ����\\\\2P}" 6, "\\shortstack{\\small �٥��ޥ�\\\\1P}" 7, "\\shortstack{\\small �٥��ޥ�\\\\2P}" 8)
set ylabel "\\shortstack{��\\\\��\\\\Ψ}"

set xrange [0.5:8.5]
set yrange [0:2]

! rm kabebairitsu.tmp

set output 'kabebairitsu.tmp'
set label "Ȣ����ʪ" at 2.4,0.4 center
set label "�ץ졼�ȶ�ʪ" at 6.5,0.4 center
# set label "1.2" at 1.,1.5 center
# set label "1.6" at 2.,1.1 center
# set label "1.2" at 3.,1.6 center
# set label "1.4" at 4.,0.9 center
# set label "1.3" at 5.,1.5 center
# set label "1.5" at 6.,1.7 center
# set label "2.0" at 7.,1.8 center
# set label "1.9" at 8.,1.8 center
set key 7.3,0.8
plot 'kabebairitsu.txt' u 1:2 title "ñĴ�ܲ�" pt 1,'kabebairitsu.txt' u 1:3 notitle pt 1,'kabebairitsu.txt' u 1:4 title "1���������֤��ܲ�" pt 3,'kabebairitsu.txt' u 1:5 notitle pt 3,'kabebairitsu.txt' u 1:6 title "���鷫���֤��ܲ�" pt 5,'kabebairitsu.txt' u 1:7 notitle pt 5,'line.dat' notitle w l lt 2 lw 3
