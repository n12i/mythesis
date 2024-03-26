cd "/home/nakaji/paper/phD/figs/suitei/"
set term postscript eps plus "Helvetica-Gothic" 18
set xlabel "Story deformation angle (rad)"
set ylabel "Load (tonf)"
set xtics ("" -1.0/30.0, "" -1.0/45.0, "" -1.0/60.0, "" -1.0/120.0, "" -1.0/200.0, "" -1.0/500.0, "0" 0.0,"" 1.0/500.0, "" 1.0/200.0, "" 1.0/120.0, "1/60" 1.0/60.0, "" 1.0/45.0, "1/30" 1.0/30.0, "1/20" 1.0/20.0, "1/15" 1.0/15.0, "1/10" 1.0/10.0)
set ytics 0,0.5,2.0

set xrange [0.0:1.0/10.0]
set yrange [0:2.0]
set grid
set size 1,0.7
set key 1.0/12.0,0.4
set output "suitei.eps"

# set term latex
# set output "suitei.tex"
plot 'hau_check.xls' u 2:6 title "HÅï¼Â¸³·ë²Ì" w l,'hau_check1.xls' u 2:7 title "´û±ý¤Î¼Â¸³·ë²Ì¤è¤ê»»Äê" w p pt 1 ps 2

set term postscript eps plus 18
set output "suitei_en.eps"
plot 'hau_check.xls' u 2:6 title "experiment" w l,'hau_check1.xls' u 2:7 title "calculation" w p pt 1 ps 2
