#### 小島邸フーリエスペクトル(主屋)

set term postscript eps 14
set xrange [0:1]
# set xlabel "period (sec)"
# set ylabel "fourier spectrum"

set data style lines

cd "/home/nakaji/paper/phD/Bido/machiya/Kojima/omoya"
set output "omoya.eps"

set size 1.0,1.8
set origin 0.0,0.0
set multiplot
set size 0.5,0.6


set origin 0.,1.2
set xlabel ""
set ylabel "fourier spectrum"
plot "EW/kojima02.fft" u 2:3 title "桁行方向(地表)"
set origin 0.5,1.2
set xlabel ""
set ylabel ""
plot "NS/kojima01.fft" u 2:3 title "張間方向(地表)"
set origin 0.,0.6
set xlabel ""
set ylabel "fourier spectrum"
plot "EW/kojima02.fft" u 2:5 title "小屋梁","EW/kojima02.fft" u 2:4 title "2階床"
set origin 0.5,0.6
set xlabel ""
set ylabel ""
plot "NS/kojima01.fft" u 2:5 title "小屋梁","NS/kojima01.fft" u 2:4 title "2階床"
set origin 0.,0.
set xlabel "period (sec)"
set ylabel "transfer function"
plot "EW/kojima02.trs" u 2:4 title "小屋梁/地表","EW/kojima02.trs" u 2:3 title "2階床/地表"
set origin 0.5,0.
set xlabel "period (sec)"
set ylabel ""
plot "NS/kojima01.trs" u 2:4 title "小屋梁/地表","NS/kojima01.trs" u 2:3 title "2階床/地表"
set nomultiplot
