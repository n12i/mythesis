# 筋かい壁実験 荷重〜変形関係
# 筋かいの有無による違い

set terminal postscript eps 24
set xlabel "story deformation angle (rad)"
set ylabel "load (kgf)"

set xrange [0:0.15]
set xtics 0,0.05,0.15
set yrange [0:]
#set yrange [0:2000]
set data style lines

# スギ1P PS1C1, AS1C2 and AS1M2 (箱形金物)
set output "figs/chigai-S1P.eps"
plot 'AS1M2/AS1M2.dat' u 1:17 title "単調載荷",'AS1C2/AS1C2.dat' u 1:17 title "1方向繰り返し載荷",'PS1C1/PS1C1.dat' u 1:17 title "筋かいなし"

# スギ2P PS2C1,AS2M2 and AS2C2 (箱形金物)
set output "figs/chigai-S2P.eps"
plot 'AS2M2/AS2M2.dat' u 1:17 title "単調載荷",'AS2C2/AS2C2.dat' u 1:17 title "1方向繰り返し載荷",'PS2C1/PS2C1.dat' u 1:17 title "筋かいなし"

# ベイマツ1P AM1M2, AM1C2 and PM1C1 (箱形金物)
set output "figs/chigai-M1P.eps"
plot 'AM1M2/AM1M2.dat' u 1:17 title "単調載荷",'AM1C2/AM1C2.dat' u 1:17 title "1方向繰り返し載荷",'PM1C1/PM1C1.dat' u 1:17 title "筋かいなし"

# ベイマツ2P AM2M1, AM2C2 and PM2C1 (箱形金物)
set output "figs/chigai-M2P.eps"
plot 'AM2M1/AM2M1.dat' u 1:17 title "単調載荷",'AM2C2/AM2C2.dat' u 1:17 title "1方向繰り返し載荷",'PM2C1/PM2C1.dat' u 1:17 title "筋かいなし"
