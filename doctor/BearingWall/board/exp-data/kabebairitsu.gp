### �ܡ��ɲ������ɤ��ɤ�����Ψʬ��

set terminal postscript eps 16
set xlabel "���"
set xrange [0.5:10.5]
set xtics ( "No.1a" 1, "No.1b" 2, "No.2a" 3, "No.2b" 4, "No.3a" 5, "No.3b" 6, "No.4a" 7, "No.4b" 8, "No.5a" 9, "No.5b" 10 )
set ylabel "����Ψ"

set key left top left
set data style points
set pointsize 1.8
show data style

set output "../figs/kabebairitsu.eps"
plot 'cewl.dat' u 3 title "ʿ������Ψ" w p pt 7,'cewl.dat' u 1 title "�ƺܲ�����" w p pt 2,'cewl.dat' u 2 notitle w p pt 2
