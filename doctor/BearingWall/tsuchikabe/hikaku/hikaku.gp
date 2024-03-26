#### ≈⁄ …º¬∏≥∑Î≤Ã§»º∑æÚ≈°°¢ƒ‘≈°§Œº¬∏≥∑Î≤Ã§Ú»Ê≥”§π§Îøﬁ

set terminal postscript eps
set xlabel "story deformation angle (rad)"
set ylabel "restoring force (tonf)"
set xrange [0:0.1]
set yrange [0:15]
set xtics 0,0.05,0.1
set ytics 0,5,15

set data style lines

## º∑æÚ≈° 2¡ÿ vs π” …2/√Ê≈…§Í1
set output "figs/comp-Shichijo.eps"
plot "shichijo/OUT3" u 9:2 title "SI≈°2¡ÿ", "mudwalls.txt" u 1:4 title "√Ê≈…§Í …", "mudwalls.txt" u 5:8 title "π” …"

## ƒ‘≈° 2¡ÿ vs π” …2/√Ê≈…§Í1
set output "figs/comp-Tsuji.eps"
plot "tsuji/OUT3" u 9:2 title "TU≈°2¡ÿ", "mudwalls.txt" u 1:3 title "√Ê≈…§Í …", "mudwalls.txt" u 5:7 title "π” …"
