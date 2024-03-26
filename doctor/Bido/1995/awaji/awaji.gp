set term postscript eps 24
set xlabel "natural period (sec)"
set xrange [0.0:0.5]
set ylabel "power spectrum"
set output "1st/figs/hoso1.eps"
plot "1st/hoso1.fft" u 2:8 notitle w l,"1st/hoso1.fft" u 2:7 notitle w l
set output "2nd/figs/hoso2.eps"
plot "2nd/hoso2.fft" u 2:8 notitle w l,"2nd/hoso2.fft" u 2:7 notitle w l
set output "3rd/figs/hoso3.eps"
plot "3rd/hoso3.fft" u 2:8 notitle w l,"3rd/hoso3.fft" u 2:7 notitle w l
set output "4th/figs/hoso4.eps"
plot "4th/hoso4.fft" u 2:8 notitle w l,"4th/hoso4.fft" u 2:7 notitle w l
