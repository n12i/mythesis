set terminal postscript eps plus 20
set xrange [0:20]
set autoscale y
set xlabel "time (sec)"
set ylabel "story deformation angle (rad)"
set zeroaxis

set output 'hen.eps'
plot '/home/nakaji/paper/Response/Qslip0812/outfiles/JR-Takatori/Gm225/Nu100/MTKTR03.txt' u 1:3 title "$C_0 = 0.15$" w l,'/home/nakaji/paper/Response/Qslip0812/outfiles/JR-Takatori/Gm225/Nu100/MTKTR04.txt' u 1:3 title "$C_0 = 0.20$" w l
