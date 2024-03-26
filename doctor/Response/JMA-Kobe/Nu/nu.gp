### …¸∏µŒœ∆√¿≠§À§™§±§Î¶Õ§Œ∞„§§
cd "/home/nakaji/paper/phD/Response/JMA-Kobe/Nu/"

set terminal postscript eps enhanced 24
set xrange [0:1]
set xlabel "base chear coefficient $C_0$"
set data style lines
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
plot 'Nu06/MKOBE.txt' u 4:12 title "{/Symbol n} = 0.6", 'Nu08/MKOBE.txt' u 4:12 title "{/Symbol n} = 0.8", 'Nu10/MKOBE.txt' u 4:12 title "{/Symbol n} = 1.0", 'Nu12/MKOBE.txt' u 4:12 title "{/Symbol n} = 1.2", 'Nu14/MKOBE.txt' u 4:12 title "{/Symbol n} = 1.4"

# 2¡ÿ
set output "figs/max-def-angle-2nd.eps"
plot 'Nu06/MKOBE.txt' u 4:13 title "{/Symbol n} = 0.6", 'Nu08/MKOBE.txt' u 4:13 title "{/Symbol n} = 0.8", 'Nu10/MKOBE.txt' u 4:13 title "{/Symbol n} = 1.0", 'Nu12/MKOBE.txt' u 4:13 title "{/Symbol n} = 1.2", 'Nu14/MKOBE.txt' u 4:13 title "{/Symbol n} = 1.4"

### Õ˙ŒÚæ√»Ò•®•Õ•Î•Æ°º
set ylabel "cumulative hysteretic energy"
set yrange [0:1000]
set ytics border mirror norotate autofreq 
# 1¡ÿ
set output "figs/che-1st.eps"
plot 'Nu06/MKOBE.txt' u 4:16 title "{/Symbol n} = 0.6", 'Nu08/MKOBE.txt' u 4:16 title "{/Symbol n} = 0.8", 'Nu10/MKOBE.txt' u 4:16 title "{/Symbol n} = 1.0", 'Nu12/MKOBE.txt' u 4:16 title "{/Symbol n} = 1.2", 'Nu14/MKOBE.txt' u 4:16 title "{/Symbol n} = 1.4"

# 2¡ÿ
set output "figs/che-2nd.eps"
plot 'Nu06/MKOBE.txt' u 4:17 title "{/Symbol n} = 0.6", 'Nu08/MKOBE.txt' u 4:17 title "{/Symbol n} = 0.8", 'Nu10/MKOBE.txt' u 4:17 title "{/Symbol n} = 1.0", 'Nu12/MKOBE.txt' u 4:17 title "{/Symbol n} = 1.2", 'Nu14/MKOBE.txt' u 4:17 title "{/Symbol n} = 1.4"
