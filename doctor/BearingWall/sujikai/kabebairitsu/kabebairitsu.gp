### 筋かい付木造軸組の壁倍率一覧

# set term postscript eps plus color 16
set term latex
set xtics ("\\shortstack{\\small スギ\\\\1P}" 1, "\\shortstack{\\small スギ\\\\2P}" 2, "\\shortstack{\\small ベイマツ\\\\1P}" 3, "\\shortstack{\\small ベイマツ\\\\2P}" 4, "\\shortstack{\\small スギ\\\\1P}" 5, "\\shortstack{\\small スギ\\\\2P}" 6, "\\shortstack{\\small ベイマツ\\\\1P}" 7, "\\shortstack{\\small ベイマツ\\\\2P}" 8)
set ylabel "\\shortstack{壁\\\\倍\\\\率}"

set xrange [0.5:8.5]
set yrange [0:2]

! rm kabebairitsu.tmp

set output 'kabebairitsu.tmp'
set label "箱形金物" at 2.4,0.4 center
set label "プレート金物" at 6.5,0.4 center
# set label "1.2" at 1.,1.5 center
# set label "1.6" at 2.,1.1 center
# set label "1.2" at 3.,1.6 center
# set label "1.4" at 4.,0.9 center
# set label "1.3" at 5.,1.5 center
# set label "1.5" at 6.,1.7 center
# set label "2.0" at 7.,1.8 center
# set label "1.9" at 8.,1.8 center
set key 7.3,0.8
plot 'kabebairitsu.txt' u 1:2 title "単調載荷" pt 1,'kabebairitsu.txt' u 1:3 notitle pt 1,'kabebairitsu.txt' u 1:4 title "1方向繰り返し載荷" pt 3,'kabebairitsu.txt' u 1:5 notitle pt 3,'kabebairitsu.txt' u 1:6 title "正負繰り返し載荷" pt 5,'kabebairitsu.txt' u 1:7 notitle pt 5,'line.dat' notitle w l lt 2 lw 3
