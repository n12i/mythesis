cd "/home/nakaji/paper/phD/Response/figs"
set term postscript eps enhanced mono dashed 24
set grid xtics
# set data style lines
set xlabel "story deformation angle (rad)"
set ylabel "standardized restoring force"

######
set xrange [0.:0.05]
set yrange [0.:1.7]
set xtics ("" 0, "1/960" 0.0010416667, "1/120" 0.0083333333, "1/30" 0.033333333, "1/20" 0.05)
set ytics ("0" 0, "0.5" 0.5, "1.0" 1.0, "g" 1.2, "g3" 1.5)
set output "tmp/hysteretics.eps"
# set size 1.,1.
# set origin 0.,0.
plot "ql.dat" title "Quadri-linear element" w l lw 2, "sl.dat" title "Slip element" w l lw 2,"total.dat" title "Total" w l lw 4

######
set zeroaxis
set xrange [-0.05:0.05]
set yrange [-1.7:1.7]
set output "tmp/ql.eps"
# set noarrow
# set nolabel
set xtics ("" -0.05, "" -0.0333333, "" -0.0083333333, "0" 0, "" 0.0083333333, "1/30" 0.033333333, "1/20" 0.05)
set ytics ("" -1.5, "-1.0" -1.0, "-0.5" -0.5, "0" 0, "0.5" 0.5, "1.0" 1.0, "g3" 1.5)
load "ql.arrow"
plot "ql2.dat" title "Quadri-linear element" w l lw 4

######
set xtics ("" -0.05, "" -0.0333333, "" -0.0083333333, "0" 0, "" 0.0083333333, "1/30" 0.033333333, "1/20" 0.05)
set ytics ("" -1.5, "-1.0" -1.0, "-0.5" -0.5, "0" 0, "0.5" 0.5, "1.0" 1.0, "" 1.5)
set yrange [-1.5:1.5]
set output "sl.eps"
set noarrow
set nolabel
set arrow from 1./360.,1./3. to 2./360,2./3.
set arrow from 5./360.,1.0 to 1./40.,1.0
set arrow from 1./30.,1. to 7./240.,0.5
set arrow from 1./40.,0. to 1./80.,0.
set arrow from -1./360.,-1./3. to -2./360,-2./3.
set arrow from -5./360.,-1.0 to -1./40.,-1.0
set arrow from -1./30.,-1. to -7./240.,-0.5
set arrow from -1./40.,0. to -1./80.,0.
set label "1/120" at 1./120.,-1.4 center
plot "sl2.dat" title "Slip element" w l lw 5

set noarrow
set nolabel

########## 
set term dxf color
set grid xtics
# set data style lines
set xlabel "story deformation angle (rad)"
set ylabel "standardized restoring force"

######
set xrange [0.:0.05]
set yrange [0.:1.7]
set xtics ("" 0, "1/960" 0.0010416667, "1/120" 0.0083333333, "1/30" 0.033333333, "1/20" 0.05)
set ytics ("0" 0, "0.5" 0.5, "1.0" 1.0, "g" 1.2, "g3" 1.5)
set output "tmp/hysteretics.dxf"
# set size 1.,1.
# set origin 0.,0.
plot "ql.dat" title "Quadri-linear element" w l lw 2, "sl.dat" title "Slip element" w l lw 2,"total.dat" title "Total" w l lw 4

######
set zeroaxis
set xrange [-0.05:0.05]
set yrange [-1.7:1.7]
set output "tmp/ql.dxf"
# set noarrow
# set nolabel
set xtics ("" -0.05, "" -0.0333333, "" -0.0083333333, "0" 0, "" 0.0083333333, "1/30" 0.033333333, "1/20" 0.05)
set ytics ("" -1.5, "-1.0" -1.0, "-0.5" -0.5, "0" 0, "0.5" 0.5, "1.0" 1.0, "g3" 1.5)
load "ql.arrow"
plot "ql2.dat" title "Quadri-linear element" w l lw 4

######
set xtics ("" -0.05, "" -0.0333333, "" -0.0083333333, "0" 0, "" 0.0083333333, "1/30" 0.033333333, "1/20" 0.05)
set ytics ("" -1.5, "-1.0" -1.0, "-0.5" -0.5, "0" 0, "0.5" 0.5, "1.0" 1.0, "" 1.5)
set yrange [-1.5:1.5]
set output "tmp/sl.dxf"
set noarrow
set nolabel
set arrow from 1./360.,1./3. to 2./360,2./3.
set arrow from 5./360.,1.0 to 1./40.,1.0
set arrow from 1./30.,1. to 7./240.,0.5
set arrow from 1./40.,0. to 1./80.,0.
set arrow from -1./360.,-1./3. to -2./360,-2./3.
set arrow from -5./360.,-1.0 to -1./40.,-1.0
set arrow from -1./30.,-1. to -7./240.,-0.5
set arrow from -1./40.,0. to -1./80.,0.
set label "1/120" at 1./120.,-1.4 center
plot "sl2.dat" title "Slip element" w l lw 5
