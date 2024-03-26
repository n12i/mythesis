cd "/home/nakaji/paper/phD/Response/hikaku"
set term postscript eps enhanced "Helvetica-Gothic" 24
set xrange [-0.1:0.1]
set yrange [-10:10]
set ytics -10,5,10

set noarrow
set nolabel

set data style lines
set zeroaxis

set output "jr-takatori-c0-0_55.eps"

set linestyle 1 lt 2 lw 1
set linestyle 2 lt 1 lw 3
set label "JR Takatori, C_0 = 0.55, {/Symbol g}= 1.5" at -0.04,-9
set key -0.04,8
plot "src/TEST02.txt" u 10:12 title "≤Ú¿œ•‚•«•Î" ls 1, "envelope-shichijo.dat" u 2:1 title "SI≈°" ls 2, "shichijo.dat" u 2:1 notitle ls 2

set nolabel
