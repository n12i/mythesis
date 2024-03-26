cd "/home/nakaji/paper/phD/Bido/nagaya/"
set term postscript eps "Helvetica-Gothic" 20
set xrange [0:20]
set yrange [ * : * ] noreverse nowriteback
set xlabel "frequency (Hz)"
set ylabel "transfer function"
set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 

set data style lines
set output "figs/nagaya-ns.eps"
### $B7e9TJ}8~(B
plot "nagayans.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","nagayans.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"

set output "figs/nagaya-ew.eps"
### $BD%4VJ}8~(B
plot "nagayaew.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","nagayaew.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"
