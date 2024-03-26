### ÊÉÅÚ¤ÎÉéÃ´¤»¤óÃÇ±şÎÏ

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

plot "shear-stress.dat" u 1:3 title "¹ÓÊÉ(¶Ú¤«¤¤¤Ê¤·)" lt 1 pt 6,"shear-stress.dat" u 2:5 title "¹ÓÊÉ(¶Ú¤«¤¤ÉÕ)" lt 1 pt 6,"shear-stress.dat" u 1:4 title "ÃæÅÉ¤ê(¶Ú¤«¤¤¤Ê¤·)" lt 3 pt 4,"shear-stress.dat" u 2:6 title "ÃæÅÉ¤ê(¶Ú¤«¤¤ÉÕ)" lt 3 pt 4
