#! /usr/local/bin/bash

runcommand() {
    ( cd $1; spc --blc --noswin $2 )
}

dirs="1st 2nd 3rd 4th"

cat >awaji.gp <<EOF
set term postscript eps 24
set xlabel "natural period (sec)"
set xrange [0.0:0.5]
set ylabel "power spectrum"
EOF

for d in $dirs; do
    dd=$(echo $d | sed 's/\(.\)../\1/')
    test -d ${d}/figs || mkdir -p ${d}/figs
    test -f $d/hoso${dd}.fft || runcommand $d hoso${dd}
    cat >>awaji.gp <<EOF
set output "${d}/figs/hoso${dd}.eps"
plot "${d}/hoso${dd}.fft" u 2:8 notitle w l,"${d}/hoso${dd}.fft" u 2:7 notitle w l
EOF
done

gnuplot awaji.gp

exit 0
