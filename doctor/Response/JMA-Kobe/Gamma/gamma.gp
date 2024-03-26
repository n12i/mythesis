### �����������ˤ������3�ΰ㤤
cd "/home/nakaji/paper/phD/Response/JMA-Kobe/Gamma/"
set terminal postscript eps enhanced 24
set xrange [0:1]
set xlabel "base chear coefficient $C_0$"
set data style lines

set xtics border mirror norotate autofreq 
set ytics border mirror norotate autofreq 
set ztics border nomirror norotate autofreq 
set key title ""
set key right top Right noreverse box linetype -2 linewidth 1.000 samplen 4 spacing 1 width 0

### �����ش��ѷ���
set ylabel "maximum story deformation angle"
set yrange [0:0.15]
set ytics 0,0.05,0.15
# 1��
set output "figs/max-def-angle-1st.eps"
plot 'Gm125/MKOBE.txt' u 4:12 title "{/Symbol g}_3 = 1.25", 'Gm150/MKOBE.txt' u 4:12 title "{/Symbol g}_3 = 1.50", 'Gm175/MKOBE.txt' u 4:12 title "{/Symbol g}_3 = 1.75", 'Gm200/MKOBE.txt' u 4:12 title "{/Symbol g}_3 = 2.00",'Gm225/MKOBE.txt' u 4:12 title "{/Symbol g}_3 = 2.25", 'Gm250/MKOBE.txt' u 4:12 title "{/Symbol g}_3 = 2.50"

# 2��
set output "figs/max-def-angle-2nd.eps"
plot 'Gm125/MKOBE.txt' u 4:13 title "{/Symbol g}_3 = 1.25", 'Gm150/MKOBE.txt' u 4:13 title "{/Symbol g}_3 = 1.50", 'Gm175/MKOBE.txt' u 4:13 title "{/Symbol g}_3 = 1.75", 'Gm200/MKOBE.txt' u 4:13 title "{/Symbol g}_3 = 2.00",'Gm225/MKOBE.txt' u 4:13 title "{/Symbol g}_3 = 2.25", 'Gm250/MKOBE.txt' u 4:13 title "{/Symbol g}_3 = 2.50"

set ytics border mirror norotate autofreq 
### ������񥨥ͥ륮��
set ylabel "cumulative hysteretic energy"
set yrange [0:1000]
# 1��
set output "figs/che-1st.eps"
plot 'Gm125/MKOBE.txt' u 4:16 title "{/Symbol g}_3 = 1.25", 'Gm150/MKOBE.txt' u 4:16 title "{/Symbol g}_3 = 1.50", 'Gm175/MKOBE.txt' u 4:16 title "{/Symbol g}_3 = 1.75", 'Gm200/MKOBE.txt' u 4:16 title "{/Symbol g}_3 = 2.00",'Gm225/MKOBE.txt' u 4:16 title "{/Symbol g}_3 = 2.25", 'Gm250/MKOBE.txt' u 4:16 title "{/Symbol g}_3 = 2.50"

# 2��
set output "figs/che-2nd.eps"
plot 'Gm125/MKOBE.txt' u 4:17 title "{/Symbol g}_3 = 1.25", 'Gm150/MKOBE.txt' u 4:17 title "{/Symbol g}_3 = 1.50", 'Gm175/MKOBE.txt' u 4:17 title "{/Symbol g}_3 = 1.75", 'Gm200/MKOBE.txt' u 4:17 title "{/Symbol g}_3 = 2.00",'Gm225/MKOBE.txt' u 4:17 title "{/Symbol g}_3 = 2.25", 'Gm250/MKOBE.txt' u 4:17 title "{/Symbol g}_3 = 2.50"