# Ãİ¾®Éñ²¼ÃÏÅÚÅÉ¤êÊÉ ²Ù½Å¡ÁÊÑ·Á´Ø·¸ÊñÍíÀş
#
#		´Ó¤Î¤ß	¹ÓÊÉ	ÃæÅÉ¤ê
# ¶Ú¤«¤¤¤Ê¤·	1:3	1:4	1:5
# ¶Ú¤«¤¤ÉÕ	2:6	2:7	2:8
#
# $Id$
cd "/home/nakaji/paper/phD/BearingWall/tsuchikabe/horakusen/"
set terminal postscript eps plus monochrome "Helvetica-Gothic" 20

set xrange [-0.1:0.1]
set yrange [-2000:2000]
set ylabel "load (kgf)"
set xlabel "story deformation angle (rad)"
set zeroaxis
set xtics -0.1,0.05,0.1
set ytics -2000,500,2000

set data style linespoints
set key left top Left

### ÊñÍíÀş
set output "envelope.eps"
plot 'envelope.nb.dat' u 1:2 title "No.1", 'envelope.nb.dat' u 1:3 title "No.3", 'envelope.nb.dat' u 1:4 title "No.4", 'envelope.wb.dat' u 1:2 title "No.5", 'envelope.wb.dat' u 1:3 title "No.6", 'envelope.wb.dat' u 1:4 title "No.7"

### ÊÉÅÚ¤ÎÉéÃ´ÂÑÎÏ
set key right bottom Right spacing 1.6
set yrange [-1500:1500]
set terminal postscript eps plus monochrome "Helvetica-Gothic" 18
set output "mud-capacity.eps"
plot 'mud-cap.nb.dat' u 1:2 title "¹ÓÊÉ-´Ó¤Î¤ß" lt 1 pt 6, 'mud-cap.nb.dat' u 1:3 title "ÃæÅÉ¤êÊÉ-´Ó¤Î¤ß" lt 2 pt 6, 'mud-cap.wb.dat' u 1:2 title "¹ÓÊÉ-´Ó¡¦²¼ÃÏ(¶Ú¤«¤¤ÉÕ)" lt 1 pt 4, 'mud-cap.wb.dat' u 1:3 title "ÃæÅÉ¤êÊÉ-´Ó¡¦²¼ÃÏ(¶Ú¤«¤¤ÉÕ)" lt 2 pt 4

### ¶Ú¤«¤¤¤ÎÉéÃ´ÂÑÎÏ
set yrange [-1000:500]
set ytics -1000,250,500
set key right bottom spacing 1.6
# set terminal postscript eps plus monochrome 14
set output "brace-capacity.eps"
plot 'brace-cap.dat' u 4:1 title "ÊÉÅÚ¤Ê¤·", 'brace-cap.dat' u 4:2 title "¹ÓÊÉ", 'brace-cap.dat' u 4:3 title "ÃæÅÉ¤ê"
