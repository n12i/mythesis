set term postscript eps 24
set xlabel "natural period (sec)"
set xrange [0.0:0.5]
set ylabel "power spectrum"
set output "TOMI/figs/NS.eps"
plot "TOMI/NS/tomi1.fft" u 2:8 notitle w l,"TOMI/NS/tomi1.fft" u 2:7 notitle w l
set output "TOMI/figs/EW.eps"
plot "TOMI/EW/tomi2.fft" u 2:8 notitle w l,"TOMI/EW/tomi2.fft" u 2:7 notitle w l
set output "TOMI/figs/UD.eps"
plot "TOMI/UD/tomi3.fft" u 2:8 notitle w l,"TOMI/UD/tomi3.fft" u 2:7 notitle w l
set output "TSUBO/figs/NS.eps"
plot "TSUBO/NS/tsubo2.fft" u 2:8 notitle w l,"TSUBO/NS/tsubo2.fft" u 2:7 notitle w l
set output "TSUBO/figs/EW.eps"
plot "TSUBO/EW/tsubo3.fft" u 2:8 notitle w l,"TSUBO/EW/tsubo3.fft" u 2:7 notitle w l
set output "TSUBO/figs/UD.eps"
plot "TSUBO/UD/tsubo1.fft" u 2:8 notitle w l,"TSUBO/UD/tsubo1.fft" u 2:7 notitle w l
set output "AGA/figs/NS.eps"
plot "AGA/NS/aga1.fft" u 2:8 notitle w l,"AGA/NS/aga1.fft" u 2:7 notitle w l
set output "AGA/figs/EW.eps"
plot "AGA/EW/aga2.fft" u 2:8 notitle w l,"AGA/EW/aga2.fft" u 2:7 notitle w l
set output "AGA/figs/UD.eps"
plot "AGA/UD/aga3.fft" u 2:8 notitle w l,"AGA/UD/aga3.fft" u 2:7 notitle w l
set output "AGA2/figs/NS.eps"
plot "AGA2/NS/aga22.fft" u 2:8 notitle w l,"AGA2/NS/aga22.fft" u 2:7 notitle w l
set output "AGA2/figs/EW.eps"
plot "AGA2/EW/aga23.fft" u 2:8 notitle w l,"AGA2/EW/aga23.fft" u 2:7 notitle w l
set output "AGA2/figs/UD.eps"
plot "AGA2/UD/aga21.fft" u 2:8 notitle w l,"AGA2/UD/aga21.fft" u 2:7 notitle w l
