### ボード下地土塗り壁の荷重と変形の関係

set terminal postscript eps 16
set data style lines
set xlabel "story deformation angle (rad)"
set xrange [-0.15:0.15]
set ylabel "load (kgf)"
set zeroaxis

### No.1a and No.1b
set output "../figs/PvsGamma/No1a.eps"
plot 'No1a.dat' u 2:1 title "No.1a"
set output "../figs/PvsGamma/No1b.eps"
plot 'No1b.dat' u 2:1 title "No.1b"

### No.2a and No.2b
set output "../figs/PvsGamma/No2a.eps"
plot 'No2a.dat' u 2:1 title "No.2a"
set output "../figs/PvsGamma/No2b.eps"
plot 'No2b.dat' u 2:1 title "No.2b"

### No.3a and No.3b
set output "../figs/PvsGamma/No3a.eps"
plot 'No3a.dat' u 2:1 title "No.3a"
set output "../figs/PvsGamma/No3b.eps"
plot 'No3b.dat' u 2:1 title "No.3b"

### No.4a and No.4b
set output "../figs/PvsGamma/No4a.eps"
plot 'No4a.dat' u 2:1 title "No.4a"
set output "../figs/PvsGamma/No4b.eps"
plot 'No4b.dat' u 2:1 title "No.4b"

### No.5a and No.5b
set output "../figs/PvsGamma/No5a.eps"
plot 'No5a.dat' u 2:1 title "No.5a"
set output "../figs/PvsGamma/No5b.eps"
plot 'No5b.dat' u 2:1 title "No.5b"
