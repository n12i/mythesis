# �ݾ��������ɤ�����Ψ��ʬ��
#
# 'a+'	'a-'	'b+'	'b-'	'+'	'-'
#  ��    ��      ��      ��      ��      ��

# modify with tgif to make LABELS
cd "/home/nakaji/paper/phD/BearingWall/tsuchikabe/kaberitsu/"
set terminal tgif
set terminal postscript eps plus monochrome 18
set terminal latex

set xrange [0.5:7.5]
set yrange [0.0:5.0]
set xlabel ""
set ylabel "{\\bf ����Ψ} ��"

set key left top Left
set key 2.8, 4.5 Right

set output "kaberitsu.obj"
set output "kaberitsu.eps"
set output "kaberitsu.tmp"

set xtics ( "�ӤΤ�" 1.0, "�ӡ�����" 2.0, "����" 3.0, "���ɤ�" 4.0, "�ڤ�����\\\\�ӡ�����" 5.0, "�ڤ�����\\\\����" 6.0, "�ڤ�����\\\\���ɤ�" 7.0 )
set ytics 0,1.0,5.0

plot 'kaberitsu.dat' u 1:6 title "�ܲ�������" w points,'kaberitsu.dat' u 1:7 title "�ܲ�������" w points pt 3,'kaberitsu.dat' u 1:2 title "�ƻ�Ρ��ܲ�����" w points pt 2,'kaberitsu.dat' u 1:3 notitle w points pt 2,'kaberitsu.dat' u 1:4 notitle w points pt 2,'kaberitsu.dat' u 1:5 notitle w points pt 2
