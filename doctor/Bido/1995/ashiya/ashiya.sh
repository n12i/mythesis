#! /usr/local/bin/bash

SUBDIR="Shigi Mizu Ikeda Saito"
DIRECTION="ns ew ud"

cat >ashiya.gp <<EOF
set term postscript eps 24
set xlabel "natural period (sec)"
set xrange [0.0:0.5]
set ylabel "power spectrum"
EOF

for d in ${SUBDIR}; do
    dd=$(echo $d | tr [:upper:] [:lower:])
    test -d ${d}/figs || mkdir -p ${d}/figs
    for i in ${DIRECTION}; do
	cat >>ashiya.gp <<EOF
set output "${d}/figs/${i}.eps"
plot "${d}/${i}/${dd}${i}.fft" u 2:8 notitle w l,"${d}/${i}/${dd}${i}.fft" u 2:7 notitle w l
EOF
    done
done

gnuplot ashiya.gp
# rm -rf ashiya.gp

exit 0
