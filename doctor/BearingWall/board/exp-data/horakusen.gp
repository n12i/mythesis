### ボード下地 包絡線

set terminal postscript eps 16
set zeroaxis
set xlabel "story deformation angle (rad)"
set ylabel "load (kgf)"
set data style lines
set xtics ( "1/120" 1./120., "1/60" 1./60., "1/30" 1./30., "1/15" 1./15. )
set grid x
set xrange [-0.1:0.1]

# No1a -- No5a
set output "../figs/horakusen/1a-5a.eps"
plot 'horakusen/no1a.txt' u 5:1 title "No.1a",'horakusen/no2a.txt' u 5:1 title "No.2a",'horakusen/no3a.txt' u 5:1 title "No.3a",'horakusen/no4a.txt' u 5:1 title "No.4a",'horakusen/no5a.txt' u 5:1 title "No.5a"

# No1b -- No5b
set output "../figs/horakusen/1b-5b.eps"
plot 'horakusen/no1b.txt' u 5:1 title "No.1b",'horakusen/no2b.txt' u 5:1 title "No.2b",'horakusen/no3b.txt' u 5:1 title "No.3b",'horakusen/no4b.txt' u 5:1 title "No.4b",'horakusen/no5b.txt' u 5:1 title "No.5b"

# No1a vs No1b
set output "../figs/horakusen/1a-1b.eps
plot 'horakusen/no1a.txt' u 5:1 title "No.1a",'horakusen/no1b.txt' u 5:1 title "No.1b"

# No2a vs No2b
set output "../figs/horakusen/2a-2b.eps
plot 'horakusen/no2a.txt' u 5:1 title "No.2a",'horakusen/no2b.txt' u 5:1 title "No.2b"

# No3a vs No3b
set output "../figs/horakusen/3a-3b.eps
plot 'horakusen/no3a.txt' u 5:1 title "No.3a",'horakusen/no3b.txt' u 5:1 title "No.3b"

# No4a vs No4b
set output "../figs/horakusen/4a-4b.eps
plot 'horakusen/no4a.txt' u 5:1 title "No.4a",'horakusen/no4b.txt' u 5:1 title "No.4b"

# No5a vs No5b
set output "../figs/horakusen/5a-5b.eps
plot 'horakusen/no5a.txt' u 5:1 title "No.5a",'horakusen/no5b.txt' u 5:1 title "No.5b"
