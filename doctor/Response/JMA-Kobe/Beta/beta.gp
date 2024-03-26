### Éü¸µÎÏÆÃÀ­¤Ë¤ª¤±¤ë¦Â¤Î°ã¤¤
cd "/home/nakaji/paper/phD/Response/JMA-Kobe/Beta/"
set terminal postscript eps plus 20
set xrange [0:1]
set xlabel "base chear coefficient $C_0$"
set data style lines

### ºÇÂçÁØ´ÖÊÑ·Á³Ñ
set ylabel "maximum story deformation angle"
set yrange [0:0.3]
# 1ÁØ
set output "figs/max-def-angle-1st.eps"
plot 'Beta02/Nu100/MKOBE.txt' u 4:12 title "$\beta$ = 0.2", 'Beta03/Nu100/MKOBE.txt' u 4:12 title "$\beta$ = 0.3", 'Beta04/Nu100/MKOBE.txt' u 4:12 title "$\beta$ = 0.4", 'Beta06/Nu100/MKOBE.txt' u 4:12 title "$\beta$ = 0.6"

# 2ÁØ
set output "figs/max-def-angle-2nd.eps"
plot 'Beta02/Nu100/MKOBE.txt' u 4:13 title "$\beta$ = 0.2", 'Beta03/Nu100/MKOBE.txt' u 4:13 title "$\beta$ = 0.3", 'Beta04/Nu100/MKOBE.txt' u 4:13 title "$\beta$ = 0.4", 'Beta06/Nu100/MKOBE.txt' u 4:13 title "$\beta$ = 0.6"

### ÍúÎò¾ÃÈñ¥¨¥Í¥ë¥®¡¼
set ylabel "cumulative hysteretic energy"
set yrange [0:1000]
# 1ÁØ
set output "figs/che-1st.eps"
plot 'Beta02/Nu100/MKOBE.txt' u 4:16 title "$\beta$ = 0.2", 'Beta03/Nu100/MKOBE.txt' u 4:16 title "$\beta$ = 0.3", 'Beta04/Nu100/MKOBE.txt' u 4:16 title "$\beta$ = 0.4", 'Beta06/Nu100/MKOBE.txt' u 4:16 title "$\beta$ = 0.6"

# 2ÁØ
set output "figs/che-2nd.eps"
plot 'Beta02/Nu100/MKOBE.txt' u 4:17 title "$\beta$ = 0.2", 'Beta03/Nu100/MKOBE.txt' u 4:17 title "$\beta$ = 0.3", 'Beta04/Nu100/MKOBE.txt' u 4:17 title "$\beta$ = 0.4", 'Beta06/Nu100/MKOBE.txt' u 4:17 title "$\beta$ = 0.6"
