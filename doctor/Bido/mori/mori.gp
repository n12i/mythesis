cd "/home/nakaji/paper/phD/Bido/mori/"
set term postscript eps "Helvetica-Gothic" 20
set xrange [0:20]
set yrange [ * : * ] noreverse nowriteback
set xlabel "frequency (Hz)"
set ylabel "transfer function"
set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 

set data style lines

### 桁行方向(補強前)
set output "figs/mori-ns-mae.eps"
plot "mori2.trs" u 1:3 title "小屋梁/1階床","mori2.trs" u 1:4 title "2階床/1階床"
### 桁行方向(補強後)
set output "figs/mori-ns-ato.eps"
plot "moria2.trs" u 1:3 title "小屋梁/1階床","moria2.trs" u 1:4 title "2階床/1階床"

set output "figs/mori-ew-mae.eps"
### 張間方向(補強前)
plot "mori1.trs" u 1:3 title "小屋梁/1階床","mori1.trs" u 1:4 title "2階床/1階床"
set output "figs/mori-ew-ato.eps"
### 張間方向(補強後)
plot "moria1.trs" u 1:3 title "小屋梁/1階床","moria1.trs" u 1:4 title "2階床/1階床"

set term corel color
### 桁行方向(補強前)
set output "figs/png/mori-ns-mae.cdr"
plot "mori2.trs" u 1:3 title "小屋梁/1階床","mori2.trs" u 1:4 title "2階床/1階床"
### 桁行方向(補強後)
set output "figs/png/mori-ns-ato.cdr"
plot "moria2.trs" u 1:3 title "小屋梁/1階床","moria2.trs" u 1:4 title "2階床/1階床"

set output "figs/png/mori-ew-mae.cdr"
### 張間方向(補強前)
plot "mori1.trs" u 1:3 title "小屋梁/1階床","mori1.trs" u 1:4 title "2階床/1階床"
set output "figs/png/mori-ew-ato.cdr"
### 張間方向(補強後)
plot "moria1.trs" u 1:3 title "小屋梁/1階床","moria1.trs" u 1:4 title "2階床/1階床"
