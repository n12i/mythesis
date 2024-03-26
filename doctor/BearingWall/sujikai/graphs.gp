# �ڤ����ɼ¸� �ٽš��ѷ��ط�
# �ڤ�����̵ͭ�ˤ��㤤

set terminal postscript eps 24
set xlabel "story deformation angle (rad)"
set ylabel "load (kgf)"

set xrange [0:0.15]
set xtics 0,0.05,0.15
set yrange [0:]
#set yrange [0:2000]
set data style lines

# ����1P PS1C1, AS1C2 and AS1M2 (Ȣ����ʪ)
set output "figs/chigai-S1P.eps"
plot 'AS1M2/AS1M2.dat' u 1:17 title "ñĴ�ܲ�",'AS1C2/AS1C2.dat' u 1:17 title "1���������֤��ܲ�",'PS1C1/PS1C1.dat' u 1:17 title "�ڤ����ʤ�"

# ����2P PS2C1,AS2M2 and AS2C2 (Ȣ����ʪ)
set output "figs/chigai-S2P.eps"
plot 'AS2M2/AS2M2.dat' u 1:17 title "ñĴ�ܲ�",'AS2C2/AS2C2.dat' u 1:17 title "1���������֤��ܲ�",'PS2C1/PS2C1.dat' u 1:17 title "�ڤ����ʤ�"

# �٥��ޥ�1P AM1M2, AM1C2 and PM1C1 (Ȣ����ʪ)
set output "figs/chigai-M1P.eps"
plot 'AM1M2/AM1M2.dat' u 1:17 title "ñĴ�ܲ�",'AM1C2/AM1C2.dat' u 1:17 title "1���������֤��ܲ�",'PM1C1/PM1C1.dat' u 1:17 title "�ڤ����ʤ�"

# �٥��ޥ�2P AM2M1, AM2C2 and PM2C1 (Ȣ����ʪ)
set output "figs/chigai-M2P.eps"
plot 'AM2M1/AM2M1.dat' u 1:17 title "ñĴ�ܲ�",'AM2C2/AM2C2.dat' u 1:17 title "1���������֤��ܲ�",'PM2C1/PM2C1.dat' u 1:17 title "�ڤ����ʤ�"
