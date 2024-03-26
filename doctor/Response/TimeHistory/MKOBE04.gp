######
# response.tex 中、図：中程度重量建物の応答時刻歴(JMA Kobe NS入力時)
# 
# ファイル：MKOBE04.txt
# 1面目: 各層の層間変形角
# 2面目: 各層の速度
# 3面目: 履歴消費エネルギー
# 4面目: 復元力特性

cd "/home/nakaji/paper/phD/Response/TimeHistory"
set term postscript eps 24
set data style lines

set xlabel "time (sec)"
set xrange [0:20]
set yrange [*:*]
set zeroaxis
set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 
set ztics border nomirror norotate autofreq 
set key title ""
set key right top Right noreverse box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0

# 1面目
set output "../figs/timehistory/gamma.eps"
set ylabel "story deformation angle (rad)"
plot 'MKOBE04.txt' u 1:3 title "1st story",'MKOBE04.txt' u 1:10 title "2nd story"

# 2面目
set output "../figs/timehistory/vel.eps"
set ylabel "velocity (kine)"
plot 'MKOBE04.txt' u 1:4 title "1st story",'MKOBE04.txt' u 1:11 title "2nd story"

# 3面目
set output "../figs/timehistory/che.eps"
set ylabel "cumulative hysteretic energy"
set key bottom
plot 'MKOBE04.txt' u 1:8 title "1st story",'MKOBE04.txt' u 1:15 title "2nd story"

# 4面目
set output "../figs/timehistory/hys-loop.eps"
set xlabel "story deformation angle (rad)"
set ylabel "story restoring force (tonf)"
set xrange [-0.06:0.06]
set yrange [-20:20]
plot 'MKOBE04.txt' u 3:5 title "1st story",'MKOBE04.txt' u 10:12 title "2nd story"


#set term corel color "Helvetica" 22 8.2 10 1.5
#set term png medium color
set term dxf
set xlabel "time (sec)"
set xrange [0:20]
set yrange [*:*]
set zeroaxis
set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 
set ztics border nomirror norotate autofreq 
set key title ""
set key right top Right noreverse box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0

# 1面目
set output "gamma.dxf"
set ylabel "story deformation angle (rad)"
plot 'MKOBE04.txt' u 1:3 title "1st story",'MKOBE04.txt' u 1:10 title "2nd story"

# 2面目
set output "vel.dxf"
set ylabel "velocity (kine)"
plot 'MKOBE04.txt' u 1:4 title "1st story",'MKOBE04.txt' u 1:11 title "2nd story"

# 3面目
set output "che.dxf"
set ylabel "cumulative hysteretic energy"
set key bottom
plot 'MKOBE04.txt' u 1:8 title "1st story",'MKOBE04.txt' u 1:15 title "2nd story"

# 4面目
set output "hys-loop.dxf"
set xlabel "story deformation angle (rad)"
set ylabel "story restoring force (tonf)"
set xrange [-0.06:0.06]
set yrange [-20:20]
plot 'MKOBE04.txt' u 3:5 title "1st story",'MKOBE04.txt' u 10:12 title "2nd story"
