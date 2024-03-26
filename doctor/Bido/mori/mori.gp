cd "/home/nakaji/paper/phD/Bido/mori/"
set term postscript eps "Helvetica-Gothic" 20
set xrange [0:20]
set yrange [ * : * ] noreverse nowriteback
set xlabel "frequency (Hz)"
set ylabel "transfer function"
set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 

set data style lines

### $B7e9TJ}8~(B($BJd6/A0(B)
set output "figs/mori-ns-mae.eps"
plot "mori2.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","mori2.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"
### $B7e9TJ}8~(B($BJd6/8e(B)
set output "figs/mori-ns-ato.eps"
plot "moria2.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","moria2.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"

set output "figs/mori-ew-mae.eps"
### $BD%4VJ}8~(B($BJd6/A0(B)
plot "mori1.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","mori1.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"
set output "figs/mori-ew-ato.eps"
### $BD%4VJ}8~(B($BJd6/8e(B)
plot "moria1.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","moria1.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"

set term corel color
### $B7e9TJ}8~(B($BJd6/A0(B)
set output "figs/png/mori-ns-mae.cdr"
plot "mori2.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","mori2.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"
### $B7e9TJ}8~(B($BJd6/8e(B)
set output "figs/png/mori-ns-ato.cdr"
plot "moria2.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","moria2.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"

set output "figs/png/mori-ew-mae.cdr"
### $BD%4VJ}8~(B($BJd6/A0(B)
plot "mori1.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","mori1.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"
set output "figs/png/mori-ew-ato.cdr"
### $BD%4VJ}8~(B($BJd6/8e(B)
plot "moria1.trs" u 1:3 title "$B>.20NB(B/1$B3,>2(B","moria1.trs" u 1:4 title "2$B3,>2(B/1$B3,>2(B"
