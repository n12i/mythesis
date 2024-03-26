#### ���ɼ¸���̤ȼ���š����š�μ¸���̤���Ӥ����

set terminal postscript eps
set xlabel "story deformation angle (rad)"
set ylabel "restoring force (tonf)"
set xrange [0:0.1]
set yrange [0:15]
set xtics 0,0.05,0.1
set ytics 0,5,15

set data style lines

## ����š 2�� vs ����2/���ɤ�1
set output "figs/comp-Shichijo.eps"
plot "shichijo/OUT3" u 9:2 title "SIš2��", "mudwalls.txt" u 1:4 title "���ɤ���", "mudwalls.txt" u 5:8 title "����"

## ��š 2�� vs ����2/���ɤ�1
set output "figs/comp-Tsuji.eps"
plot "tsuji/OUT3" u 9:2 title "TUš2��", "mudwalls.txt" u 1:3 title "���ɤ���", "mudwalls.txt" u 5:7 title "����"
