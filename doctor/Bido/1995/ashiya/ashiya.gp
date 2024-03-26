set term postscript eps 24
set xlabel "natural period (sec)"
set xrange [0.0:0.5]
set ylabel "power spectrum"
set output "Shigi/figs/ns.eps"
plot "Shigi/ns/shigins.fft" u 2:8 notitle w l,"Shigi/ns/shigins.fft" u 2:7 notitle w l
set output "Shigi/figs/ew.eps"
plot "Shigi/ew/shigiew.fft" u 2:8 notitle w l,"Shigi/ew/shigiew.fft" u 2:7 notitle w l
set output "Shigi/figs/ud.eps"
plot "Shigi/ud/shigiud.fft" u 2:8 notitle w l,"Shigi/ud/shigiud.fft" u 2:7 notitle w l
set output "Mizu/figs/ns.eps"
plot "Mizu/ns/mizuns.fft" u 2:8 notitle w l,"Mizu/ns/mizuns.fft" u 2:7 notitle w l
set output "Mizu/figs/ew.eps"
plot "Mizu/ew/mizuew.fft" u 2:8 notitle w l,"Mizu/ew/mizuew.fft" u 2:7 notitle w l
set output "Mizu/figs/ud.eps"
plot "Mizu/ud/mizuud.fft" u 2:8 notitle w l,"Mizu/ud/mizuud.fft" u 2:7 notitle w l
set output "Ikeda/figs/ns.eps"
plot "Ikeda/ns/ikedans.fft" u 2:8 notitle w l,"Ikeda/ns/ikedans.fft" u 2:7 notitle w l
set output "Ikeda/figs/ew.eps"
plot "Ikeda/ew/ikedaew.fft" u 2:8 notitle w l,"Ikeda/ew/ikedaew.fft" u 2:7 notitle w l
set output "Ikeda/figs/ud.eps"
plot "Ikeda/ud/ikedaud.fft" u 2:8 notitle w l,"Ikeda/ud/ikedaud.fft" u 2:7 notitle w l
set output "Saito/figs/ns.eps"
plot "Saito/ns/saitons.fft" u 2:8 notitle w l,"Saito/ns/saitons.fft" u 2:7 notitle w l
set output "Saito/figs/ew.eps"
plot "Saito/ew/saitoew.fft" u 2:8 notitle w l,"Saito/ew/saitoew.fft" u 2:7 notitle w l
set output "Saito/figs/ud.eps"
plot "Saito/ud/saitoud.fft" u 2:8 notitle w l,"Saito/ud/saitoud.fft" u 2:7 notitle w l
