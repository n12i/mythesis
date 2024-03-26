###
### ≤ŸΩ≈°¡ —∑¡¥ÿ∑∏§ÚÃµº°∏µŒÃ§«…Ω§π
###
set term ps2 eps 28
set size 
set xlabel "{\bf Story}\ {\bf deformation}\ {\bf angle}\ {\bf (rad)}"
set ylabel "{\bf Load}\ {\bf per}\ {\bf wall}\ {\bf length}\ {\it P/W}" 3,0
set xtics ("" -1.0/30.0, "" -1.0/45.0, "" -1.0/60.0, "" -1.0/120.0, "" -1.0/200.0, "" -1.0/500.0, "0" 0.0,"" 1.0/500.0, "" 1.0/200.0, "" 1.0/120.0, "1/60" 1.0/60.0, "" 1.0/45.0, "1/30" 1.0/30.0, "1/20" 1.0/20.0, "1/15" 1.0/15.0, "1/10" 1.0/10.0)
#set xzeroaxis
set yzeroaxis
#set grid
set xrange [0.0:1.0/10.0]

#set output "shichijo_ga.ps"
#set title "\large{\large {\sf SH}}{\bf ≈° ≤ŸΩ≈°¡ ø∂—¡ÿ¥÷ —∑¡≥—¥ÿ∑∏}"
#plot "../../data/shichijo/OUT3" u 9:11 title "\gamma _2" w l,"../../data/shichijo/OUT3" u 10:11 title "\gamma _1" w l

#set output "tsuji_ga.ps"
#set title "\large{\large {\sf TS}}{\bf ≈° ≤ŸΩ≈°¡ ø∂—¡ÿ¥÷ —∑¡≥—¥ÿ∑∏}"
#plot "../../data/tsuji/OUT3" u 9:11 title "\gamma _2" w l,"../../data/tsuji/OUT3" u 10:11 title "\gamma _1" w l

#set output "tanaka_ga.ps"
#set title "\large{\large {\sf TA}}{\bf ≈° ≤ŸΩ≈°¡ ø∂—¡ÿ¥÷ —∑¡≥—¥ÿ∑∏}"
#plot "../../data/tanaka/OUT3" u 9:11 title "\gamma _2" w l,"../../data/tanaka/OUT3" u 10:11 title "\gamma _1" w l

#set output "sugiura_ga.ps"
#set title "\large{\large {\sf SU}}{\bf ≈° ≤ŸΩ≈°¡ ø∂—¡ÿ¥÷ —∑¡≥—¥ÿ∑∏}"
#plot "../../data/sugiura/OUT3" u 9:11 title "\gamma _2" w l,"../../data/sugiura/OUT3" u 10:11 title "\gamma _1" w l

#set autoscale
#set output "haumesse_ga.ps"
#set title "\large{\large {\sf H}}{\bf ≈Ô ≤ŸΩ≈°¡ ø∂—¡ÿ¥÷ —∑¡≥—¥ÿ∑∏}"
#plot "../../data/haumesse/OUT3" u 9:11 title "\gamma _2" w l,"../../data/haumesse/OUT3" u 10:11 title "\gamma _1" w l

set data style linespoints
set xlabel "Story\  deformation\ angle\ (rad)"
set ylabel "Base\ shear"
set output "mujigen.ps"
set yrange [0.0:0.6]
plot "../../data/shichijo/OUT3" u 9:11 title "SI","../../data/tsuji/OUT3" u 9:11 title "TU","../../data/tanaka/OUT3" u 9:11 title "TA","../../data/sugiura/OUT3" u 9:11 title "SU"

set ylabel "shear\ coefficient\ of\ 2nd\ story"
set output "mujigen.eps"
set yrange [0.0:2.0]
plot 'shichi.txt' u 1:3 title "SI",'tuji.txt' u 1:3 title "TU","tanak.txt" u 1:3 title "TA","sugi.txt" u 1:3 title "SU"