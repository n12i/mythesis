# Ãİ¾®Éñ²¼ÃÏÅÚÊÉ¤ÎÊÉÇÜÎ¨¤ÎÊ¬ÉÛ
#
# 'a+'	'a-'	'b+'	'b-'	'+'	'-'
#  ¡Ü    ¡Ü      ¡Ü      ¡Ü      ¡û      ¢¤

# modify with tgif to make LABELS
cd "/home/nakaji/paper/phD/BearingWall/tsuchikabe/kaberitsu/"
set terminal tgif
set terminal postscript eps plus monochrome 18
set terminal latex

set xrange [0.5:7.5]
set yrange [0.0:5.0]
set xlabel ""
set ylabel "{\\bf ÊÉÇÜÎ¨} ¦Á"

set key left top Left
set key 2.8, 4.5 Right

set output "kaberitsu.obj"
set output "kaberitsu.eps"
set output "kaberitsu.tmp"

set xtics ( "´Ó¤Î¤ß" 1.0, "´Ó¡¦²¼ÃÏ" 2.0, "¹ÓÊÉ" 3.0, "ÃæÅÉ¤ê" 4.0, "¶Ú¤«¤¤ÉÕ\\\\´Ó¡¦²¼ÃÏ" 5.0, "¶Ú¤«¤¤ÉÕ\\\\¹ÓÊÉ" 6.0, "¶Ú¤«¤¤ÉÕ\\\\ÃæÅÉ¤ê" 7.0 )
set ytics 0,1.0,5.0

plot 'kaberitsu.dat' u 1:6 title "ºÜ²ÙÊı¸şÀµ" w points,'kaberitsu.dat' u 1:7 title "ºÜ²ÙÊı¸şÉé" w points pt 3,'kaberitsu.dat' u 1:2 title "³Æ»î¸³ÂÎ¡¢ºÜ²ÙÊı¸ş" w points pt 2,'kaberitsu.dat' u 1:3 notitle w points pt 2,'kaberitsu.dat' u 1:4 notitle w points pt 2,'kaberitsu.dat' u 1:5 notitle w points pt 2
