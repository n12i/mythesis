######
# response.tex で使用する、入力地震動の速度応答スペクトル図を作る。
#
# 使用する入力地震動は、
# ELCNNS.out (エルセントロ地震)
# G_FUKIAI_NS.out (大阪ガス葺合、兵庫県南部地震)
# HACHNS.out (八戸地震)
# KOBNS.out (神戸海洋気象台、兵庫県南部地震)
# nisiakas_NS.out (JR西明石駅、兵庫県南部地震)
# takarazu_NS.out (JR宝塚駅、兵庫県南部地震)
# takatori_NS.out (JR鷹取駅、兵庫県南部地震)
# の7つである。
#
# 1面目(respec1.eps)に、
# 神戸海洋気象台、JR鷹取駅、JR西明石駅、JR宝塚駅
# 2面目(respec2.eps)に、
# 大阪ガス葺合、エルセントロ、八戸
# とする。
# 
# 横軸は、固有周期 period(sec) 0〜5秒まで
# 縦軸は、速度応答スペクトル Sv
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
