set terminal postscript eps plus 18
set xlabel "story deformation angle (rad)"
set xrange [-0.1:0.1]
set ylabel "energy (kgf¡¦rad)"
set zeroaxis

set nolinestyle
set linestyle 1 lt 1 lw 2 pt 4 ps 2
set linestyle 2 lt 1 lw 2 pt 5 ps 2
set linestyle 3 lt 1 lw 2 pt 6 ps 2

set data style linespoints

set output "no-sujikai.eps"
plot "no-sujikai.dat" u 1:2 title "ÊÉÅÚ¤Ê¤·" ls 1,"no-sujikai.dat" u 1:3 title "¹ÓÊÉ" ls 2,"no-sujikai.dat" u 1:4 title "ÃæÅÉ¤êÊÉ" ls 3,"no-sujikai-minus.dat" u 1:2 notitle ls 1,"no-sujikai-minus.dat" u 1:3 notitle ls 2,"no-sujikai-minus.dat" u 1:4 notitle ls 3

set output "sujikai.eps"
plot "sujikai.dat" u 1:2 title "ÊÉÅÚ¤Ê¤·" ls 1,"sujikai.dat" u 1:3 title "¹ÓÊÉ" ls 2,"sujikai.dat" u 1:4 title "ÃæÅÉ¤êÊÉ" ls 3,"sujikai-minus.dat" u 1:2 notitle ls 1,"sujikai-minus.dat" u 1:3 notitle ls 2,"sujikai-minus.dat" u 1:4 notitle ls 3

set output "hikaku-sujikai-no-sujikai.eps"
plot "no-sujikai.dat" u 1:2 title "ÊÉÅÚ¤Ê¤·" ls 1,"no-sujikai.dat" u 1:3 title "¹ÓÊÉ" ls 2,"no-sujikai.dat" u 1:4 title "ÃæÅÉ¤êÊÉ" ls 3,"sujikai-minus.dat" u 1:2 notitle ls 1,"sujikai-minus.dat" u 1:3 notitle ls 2,"sujikai-minus.dat" u 1:4 notitle ls 3
