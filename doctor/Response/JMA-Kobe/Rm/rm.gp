### …¸∏µŒœ∆√¿≠§À§™§±§Î1°¢2¡ÿΩ≈ŒÃ»Ê(Rm)§Œ±∆∂¡
cd "/home/nakaji/paper/phD/Response/JMA-Kobe/Rm/"
set terminal postscript eps plus 20
set xrange [0:1]
set xlabel "base chear coefficient $C_0$"
set data style lines

set yrange [*:*]
set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 
set ztics border nomirror norotate autofreq 
set key title ""
set key right top Right noreverse box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0

### ∫«¬Á¡ÿ¥÷ —∑¡≥—
set ylabel "maximum story deformation angle"
set yrange [0:0.15]
set ytics 0,0.05,0.15
# 1¡ÿ
set output "figs/max-def-angle-1st.eps"
plot 'Rm04/Nu100/MKOBE.txt' u 4:12 title "$R_m$ = 0.4", 'Rm06/Nu100/MKOBE.txt' u 4:12 title "$R_m$ = 0.6", 'Rm08/Nu100/MKOBE.txt' u 4:12 title "$R_m$ = 0.8", 'Rm10/Nu100/MKOBE.txt' u 4:12 title "$R_m$ = 1.0"

# 2¡ÿ
set output "figs/max-def-angle-2nd.eps"
plot 'Rm04/Nu100/MKOBE.txt' u 4:13 title "$R_m$ = 0.4", 'Rm06/Nu100/MKOBE.txt' u 4:13 title "$R_m$ = 0.6", 'Rm08/Nu100/MKOBE.txt' u 4:13 title "$R_m$ = 0.8", 'Rm10/Nu100/MKOBE.txt' u 4:13 title "$R_m$ = 1.0"

set ytics border mirror norotate autofreq 
### Õ˙ŒÚæ√»Ò•®•Õ•Î•Æ°º
set ylabel "cumulative hysteretic energy"
set yrange [0:1000]
# 1¡ÿ
set output "figs/che-1st.eps"
plot 'Rm04/Nu100/MKOBE.txt' u 4:16 title "$R_m$ = 0.4", 'Rm06/Nu100/MKOBE.txt' u 4:16 title "$R_m$ = 0.6", 'Rm08/Nu100/MKOBE.txt' u 4:16 title "$R_m$ = 0.8", 'Rm10/Nu100/MKOBE.txt' u 4:16 title "$R_m$ = 1.0"

# 2¡ÿ
set output "figs/che-2nd.eps"
plot 'Rm04/Nu100/MKOBE.txt' u 4:17 title "$R_m$ = 0.4", 'Rm06/Nu100/MKOBE.txt' u 4:17 title "$R_m$ = 0.6", 'Rm08/Nu100/MKOBE.txt' u 4:17 title "$R_m$ = 0.8", 'Rm10/Nu100/MKOBE.txt' u 4:17 title "$R_m$ = 1.0"
