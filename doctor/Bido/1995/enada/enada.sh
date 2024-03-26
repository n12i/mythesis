#! /usr/local/bin/bash

SUBDIR="TOMI TSUBO AGA AGA2"
DIRECTION="NS EW UD"

cat >enada.gp <<EOF
set term postscript eps 24
set xlabel "natural period (sec)"
set xrange [0.0:0.5]
set ylabel "power spectrum"
EOF

for d in ${SUBDIR}; do
    dd=$(echo $d | tr [:upper:] [:lower:])
    test -d ${d}/figs || mkdir -p ${d}/figs
    for i in ${DIRECTION}; do
	file=$(basename ${d}/${i}/*.fft)    ## Here is only one .fft file
	cat >>enada.gp <<EOF
set output "${d}/figs/${i}.eps"
plot "${d}/${i}/${file}" u 2:8 notitle w l,"${d}/${i}/${file}" u 2:7 notitle w l
EOF
    done
done

gnuplot enada.gp

exit 0
