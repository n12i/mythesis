######
# response.tex �ǻ��Ѥ��롢�����Ͽ�ư��®�ٱ������ڥ��ȥ�ޤ��롣
#
# ���Ѥ��������Ͽ�ư�ϡ�
# ELCNNS.out (���륻��ȥ��Ͽ�)
# G_FUKIAI_NS.out (��奬�����硢ʼ�˸������Ͽ�)
# HACHNS.out (Ȭ���Ͽ�)
# KOBNS.out (���ͳ��ε����桢ʼ�˸������Ͽ�)
# nisiakas_NS.out (JR�����бء�ʼ�˸������Ͽ�)
# takarazu_NS.out (JR���ͱء�ʼ�˸������Ͽ�)
# takatori_NS.out (JR���ء�ʼ�˸������Ͽ�)
# ��7�ĤǤ��롣
#
# 1����(respec1.eps)�ˡ�
# ���ͳ��ε����桢JR���ء�JR�����бء�JR���ͱ�
# 2����(respec2.eps)�ˡ�
# ��奬�����硢���륻��ȥ�Ȭ��
# �Ȥ��롣
# 
# �����ϡ���ͭ���� period(sec) 0��5�äޤ�
# �ļ��ϡ�®�ٱ������ڥ��ȥ� Sv
# 
set term postscript eps 20
set xlabel "period (sec)"
set ylabel "Sv"
set xrange [0:5]
set data style lines

set output "../figs/respec/respec1.eps"
plot 'KOBNS.out' u 1:3 title "JMA Kobe NS",'takatori_NS.out' u 1:3 title "JR Takatori NS",'nisiakas_NS.out' u 1:3 title "JR Nishiakashi NS",'takarazu_NS.out' u 1:3 title "JR Takarazuka NS"

set output "../figs/respec/respec2.eps"
plot 'G_FUKIAI_NS.out' u 1:3 title "Osaka GAS Fukiai NS",'ELCNNS.out' u 1:3 title "ElCentro NS",'HACHNS.out' u 1:3 title "Hachinohe NS"
