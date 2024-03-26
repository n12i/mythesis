# -*- Gnu-Plot -*-
# 荷重〜変位関係および荷重〜ねじれ変形角関係をプロットするための 
# GNUPLOT コマンド
# $Id: puplot.eng,v 1.1 1997/02/20 11:35:13 nakaji Exp nakaji $
#
set term ps2 eps 24
#set term ps2 16
set size 
set xlabel "{\bf Relative\ story\ displacement\ {\it u}\ {\rm (cm)}}" 0,-0.5
set ylabel "{\bf Load\ {\it P}\ {\rm (tf)}}" 3,0
set xrange [-5:30]
set yrange [0:15]

set output "|/usr/ucb/lpr -Plw"

# 七条邸
#set output "shichijo1e.ps"
set arrow from -2.0,2.1 to 0.37,2.51
set label "\small{\sf    #101}" at -4.2,1.9
set arrow from -2.0,3.9 to 0.72,3.41
set label "\small{\sf    #107}" at -4.0,4.1
set arrow from -1.0,5.3 to 1.40,5.01
set label "\small{\sf    #115}" at -4.5,5.5
set arrow from -1.0,6.45 to 2.28,6.01
set label "\small{\sf    #122}" at -4.0,6.5
set arrow from 6.0,9.5 to 7.05,7.37
set label "\small{\sf    #142}" at 2.3,9.7
set arrow from 8.0,9.5 to 7.47,7.55
set label "\small{\sf    #144}" at 7.3,9.7
set arrow from 13.65,9.3 to 13.65,8.2
set label "{\sf P_{max}}" at 14.0,9.6
#set title "\large\large{ {\sf House\ SH}}"
plot [] [:10] "/home/nakaji/paper/experiment/data/shichijo/OUT2" u 9:2 title "u_2" w linespoints,"/home/nakaji/paper/experiment/data/shichijo/OUT2" u 10:2 title "u_1" w linespoints

set noarrow
set nolabel
# TU邸
#set output "tsuji1e.ps"
set arrow from -1.0,5. to 0.90,5.40
set label "\small{\sf    #70}" at -4.0,4.5
set arrow from -1.0,5.7 to 1.57,6.20
set label "\small{\sf    #77}" at -4.0,5.6
set arrow from -0.9,6.6 to 1.72,6.42
set label "\small{\sf    #78}" at -4.0,6.8
set arrow from -1.0,7.7 to 3.40,7.52
set label "\small{\sf    #91}" at -4.0,7.8
set arrow from 2.0,9.0 to 4.25,8.02
set label "\small{\sf    #149}" at -1.5,9.2
set arrow from 3.0,10.0 to 4.90,9.05
set label "\small{\sf    #155}" at -0.5,10.2
set arrow from 7.92,11.3 to 7.92,10.8
set label "{\sf P_{max}}" at 7.0,11.5
#set label "\small{\sf    #70}\ 外壁崩れ" at 21,9.5
#set label "\small{\sf    #77}\ 壁落下" at 21,8.8
#set label "\small{\sf    #78}\ 柱傾斜、壁のちり" at 21,8.1
#set label "\small{\sf    #91}\ クレーンすべり" at 21,7.4
#set label "\small{\sf    #149}\ 障子破れ始め" at 21,6.7
#set label "\small{\sf    #155}\ 筋違落ちる" at 21,6.0
#set title "{ {\sf House\ TS}}"
plot [:20] [0:12] "/home/nakaji/paper/experiment/data/tsuji/OUT2" u 9:2 title "u_2" w linespoints,"/home/nakaji/paper/experiment/data/tsuji/OUT2" u 10:2 title "u_1" w linespoints

set noarrow
set nolabel
# TA邸
#set output "tanaka1e.ps"
set arrow from -1.0,7.0 to 1.65,6.82
set label "\small{\sf    #109}" at -4.5,7.0
set arrow from -1.0,8.0 to 1.70,6.85
set label "\small{\sf    #110}" at -4.5,8.0
set arrow from 4.0,12.0 to 6.00,10.29
set label "\small{\sf    #189}" at 2.5,12.2
set arrow from 6.67,12.5 to 6.67,10.6
set label "{\sf P_{max}}" at 6.0,12.7
set arrow from 8.5,11.0 to 7.28,10.53
set label "\small{\sf    #199}" at 8.6,11.2
set arrow from 12.4,10.5 to 10.18,9.99
set label "\small{\sf    #207}" at 12.5,10.7
#set label "\small{\sf    #109}\ 屋根が歪み始めた" at 15,9.5
#set label "\small{\sf    #110}\ 窓の下の壁にクラック" at 15,8.8
#set label "\small{\sf    #189}\ 壁が崩れる" at 15,8.1
#set label "\small{\sf    # 199}\ 南東の隅柱が折れる" at 15,7.4
#set label "\small{\sf    # 207}\ 南東の隅柱が飛ぶ" at 15,6.7
#set title "{ {\sf House\ TA}}"
set xrange [:20]
set yrange [:15]
set ytics ("0" 0,"5" 5,"10" 10, "15" 15)
plot "/home/nakaji/paper/experiment/data/tanaka/OUT2" u 9:2 title "u_2" w linespoints,"/home/nakaji/paper/experiment/data/tanaka/OUT2" u 10:2 title "u_1" w linespoints

set noarrow
set nolabel
#SU邸
set xrange[-5:15]
set yrange [0:20]
set ytics ("0" 0,"5" 5,"10" 10, "15" 15, "20" 20)
#set output "sugiura1e.ps"
set label "\small{\sf    #30}" at 10,6
set arrow from 10,6 to 1.38,5.25
set label "\small{\sf    #51}" at 10,8.0
set arrow from 10,8 to 1.95,6.76
set label "\small{\sf    #86\ (P_{max})}" at 6.0,18.0
set arrow from 7.25,17.5 to 7.25,14.18
#set title "{ {\sf House\ SU}}"
plot "/home/nakaji/paper/experiment/data/sugiura/OUT2" u 9:2 title "u_2" w linespoints,"/home/nakaji/paper/experiment/data/sugiura/OUT2" u 10:2 title "u_1" w linespoints

set noarrow
set nolabel
# H棟
set xrange [-10.0:90.0]
set yrange [-1.0:2.5]
set ytics
#set output "haumesse1e.ps"
set arrow from -1.0,1.2 to 6.22,1.07
set label "\small{\sf    #27}" at -10.0,1.23
set arrow from 6.0,1.5 to 13.85,1.46
set label "\small{\sf    #105}" at -1.65,1.5
set arrow from 12.0,1.8 to 16.35,1.56
set label "\small{\sf    #110}" at 5.0,1.8
set arrow from 18.0,2.0 to 17.80,1.66
set label "\small{\sf    #111}" at 10.0,2.1
set arrow from 24.5,1.85 to 21.57,1.73
set label "\small{\sf    #114}" at 25.0,1.85
set arrow from 29.0,1.68 to 25.73,1.54
set label "\small{\sf    #119}" at 29.0,1.6
set arrow from 21.57,2.00 to 21.57,1.73
set label "{\sf P_{max}}" at 20.0,2.20
#set title "{ {\sf Frame\ H}}"
plot [-10:50] "/home/nakaji/paper/experiment/data/haumesse/OUT2" u 9:2 title "u_2" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT2" u 10:2 title "u_1" w linespoints

set noarrow
set nolabel
#set output "haumesse2e.ps"
#set title "{ {\sf H}}{\bf 棟 荷重〜変位関係（構面b）}"
plot [-10:80] "/home/nakaji/paper/experiment/data/haumesse/OUT1" u 5:2 title "d_{2b}" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT1" u 6:2 title "d_{1b}" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT1" u 7:2 title "d_{0b}" w linespoints

#set output "haumesse3e.ps"
#set title "{ {\sf H}}{\bf 棟 荷重〜変位関係（構面a）}"
plot "/home/nakaji/paper/experiment/data/haumesse/OUT1" u 8:2 title "d_{2a}" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT1" u 9:2 title "d_{1a}" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT1" u 10:2 title "d_{0a}" w linespoints

#set output "haumesse4e.ps"
#set title "{ {\sf H}}{\bf 棟 荷重〜層間変位関係（構面b）}"
plot [-10:50] "/home/nakaji/paper/experiment/data/haumesse/OUT2" u 5:2 title "u_{2b}" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT2" u 6:2 title "u_{1b}" w linespoints

#set output "haumesse5e.ps"
#set title "{ {\sf H}}{\bf 棟 荷重〜層間変位関係（構面a）}"
plot [-10:50] "/home/nakaji/paper/experiment/data/haumesse/OUT2" u 7:2 title "u_{2a}" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT2" u 8:2 title "u_{1a}" w linespoints

# 荷重〜ねじれ変形角関係
#
set xrange [-0.05:0.05]
set yrange [0:15]
set xlabel "{\bf Tortional\ angle\ \theta\ {\sf (rad)}}"
set xtics ("" -1.0/30.0, "" -1.0/45.0, "-1/60" -1.0/60.0, "" -1.0/120.0, "" -1.0/200.0, "" 0.0, "" 1.0/200.0, "" 1.0/120.0, "1/60" 1.0/60.0, "" 1.0/45.0, "1/30" 1.0/30.0, "" 1.0/20.0, "1/15" 1.0/15.0, "1/10" 1.0/10.0)
# 七条邸
#set output "shichijo6e.ps"
#set title "{\sf House\ SH}"
set ytics
plot [-0.016666667:0.01666666667] [:10] "/home/nakaji/paper/experiment/data/shichijo/OUT2" u 11:2 title "\theta _2" w linespoints,"/home/nakaji/paper/experiment/data/shichijo/OUT2" u 12:2 title "\theta _1" w linespoints

# TU邸
set xrange [-.05:0.05]
set yrange [0:12]
set xtics ("-1/20" -1.0/20.0, "-1/30" -1.0/30.0, "-1/60" -1.0/60.0, "" -1.0/120.0, "" -1.0/200.0, "" 0.0, "" 1.0/200.0, "" 1.0/120.0, "1/60" 1.0/60.0, "1/30" 1.0/30.0, "1/20" 1.0/20.0)
set ytics
#set output "tsuji6e.ps"
#set title "{\sf House\ TS}"
plot "/home/nakaji/paper/experiment/data/tsuji/OUT2" u 11:2 title "\theta _2" w linespoints,"/home/nakaji/paper/experiment/data/tsuji/OUT2" u 12:2 title "\theta _1" w linespoints

# TA邸
set xrange [-0.0083333333:0.0083333333]
set yrange [:15]
set xtics ("-1/60" -1.0/60.0, "-1/120" -1.0/120.0, "" -1.0/200.0, "" 0.0, "" 1.0/200.0, "1/120" 1.0/120.0, "1/60" 1.0/60.0)
set ytics ("0" 0,"5" 5,"10" 10, "15" 15)
#set output "tanaka6e.ps"
#set title "{\sf House\ TA}"
plot "/home/nakaji/paper/experiment/data/tanaka/OUT2" u 11:2 title "\theta _2" w linespoints,"/home/nakaji/paper/experiment/data/tanaka/OUT2" u 12:2 title "\theta _1" w linespoints

# SU邸
set xrange [-0.016666667:0.016666667]
set yrange [0:15]
set xtics ("-1/60" -1.0/60.0, "-1/120" -1.0/120.0, "" -1.0/200.0, "" 0.0, "" 1.0/200.0, "1/120" 1.0/120.0, "1/60" 1.0/60.0)
set ytics ("0" 0,"5" 5,"10" 10, "15" 15)
#set output "sugiura6e.ps"
#set title "{\sf House\ SU}"
plot "/home/nakaji/paper/experiment/data/sugiura/OUT2" u 11:2 title "\theta _2" w linespoints,"/home/nakaji/paper/experiment/data/sugiura/OUT2" u 12:2 title "\theta _1" w linespoints

# H棟
set xrange [-0.0333333:0.05]
set yrange [-1.0:2.5]
set xtics ("-1/30" -1.0/30.0, "-1/60" -1.0/60.0, "" -1.0/120.0, "" -1.0/200.0, "" 0.0, "" 1.0/200.0, "" 1.0/120.0, "1/60" 1.0/60.0, "1/30" 1.0/30.0, "1/20" 1.0/20.0, "1/15" 1.0/15.0, "1/10" 1.0/10.0)
#set output "haumesse6e.ps"
set ytics
#set title "{\sf Frame\ H}"
plot "/home/nakaji/paper/experiment/data/haumesse/OUT2" u 11:2 title "\theta _2" w linespoints,"/home/nakaji/paper/experiment/data/haumesse/OUT2" u 12:2 title "\theta _1" w linespoints
