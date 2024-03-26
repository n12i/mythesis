# 竹小舞下地土塗り壁 荷重〜変形関係包絡線
#
#		貫のみ	荒壁	中塗り
# 筋かいなし	1:3	1:4	1:5
# 筋かい付	2:6	2:7	2:8
#
# $Id$
cd "/home/nakaji/paper/phD/BearingWall/tsuchikabe/horakusen/"
set terminal postscript eps plus monochrome "Helvetica-Gothic" 20

set xrange [-0.1:0.1]
set yrange [-2000:2000]
set ylabel "load (kgf)"
set xlabel "story deformation angle (rad)"
set zeroaxis
set xtics -0.1,0.05,0.1
set ytics -2000,500,2000

set data style linespoints
set key left top Left

### 包絡線
set output "envelope.eps"
plot 'envelope.nb.dat' u 1:2 title "No.1", 'envelope.nb.dat' u 1:3 title "No.3", 'envelope.nb.dat' u 1:4 title "No.4", 'envelope.wb.dat' u 1:2 title "No.5", 'envelope.wb.dat' u 1:3 title "No.6", 'envelope.wb.dat' u 1:4 title "No.7"

### 壁土の負担耐力
set key right bottom Right spacing 1.6
set yrange [-1500:1500]
set terminal postscript eps plus monochrome "Helvetica-Gothic" 18
set output "mud-capacity.eps"
plot 'mud-cap.nb.dat' u 1:2 title "荒壁-貫のみ" lt 1 pt 6, 'mud-cap.nb.dat' u 1:3 title "中塗り壁-貫のみ" lt 2 pt 6, 'mud-cap.wb.dat' u 1:2 title "荒壁-貫・下地(筋かい付)" lt 1 pt 4, 'mud-cap.wb.dat' u 1:3 title "中塗り壁-貫・下地(筋かい付)" lt 2 pt 4

### 筋かいの負担耐力
set yrange [-1000:500]
set ytics -1000,250,500
set key right bottom spacing 1.6
# set terminal postscript eps plus monochrome 14
set output "brace-capacity.eps"
plot 'brace-cap.dat' u 4:1 title "壁土なし", 'brace-cap.dat' u 4:2 title "荒壁", 'brace-cap.dat' u 4:3 title "中塗り"
