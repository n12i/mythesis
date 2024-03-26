### ���ڤ���ô�����Ǳ���

set terminal postscript eps plus 18
set xlabel "story deformation angle (rad)"
set xrange [-0.1:0.1]
set ylabel "shear stress (kgf/cm$^2$)"
set yrange [-2.5:2.5]
set ytics -2.5,0.5,2.5
set zeroaxis

set output "shear-stress.eps"
set data style linespoints
set key left

plot "shear-stress.dat" u 1:3 title "����(�ڤ����ʤ�)" lt 1 pt 6,"shear-stress.dat" u 2:5 title "����(�ڤ�����)" lt 1 pt 6,"shear-stress.dat" u 1:4 title "���ɤ�(�ڤ����ʤ�)" lt 3 pt 4,"shear-stress.dat" u 2:6 title "���ɤ�(�ڤ�����)" lt 3 pt 4
