#! /usr/local/bin/bash

fsdir="FourierSpectrum"
test -d ${fsdir} && rm -rf ${fsdir}
mkdir ${fsdir}

for csv in csv/*.csv.gz; do
    out=${fsdir}/$(basename ${csv} .csv.gz).dat
    echo "${csv} -> ${out}"
    gzip -cd ${csv} | /usr/local/bin/perl ./spectrum.pl >$out
done

for dat in ${fsdir}/*.dat; do
    d=$(basename ${dat} .dat)
    test -d $d && rm -rf $d
    mkdir $d

    cat >temp.gp <<EOF
set terminal postscript eps
set xrange [0:20]
set xlabel "frequency (Hz)"

set data style lines
set output "$d/${d}.eps"
set size 1.0,1.8
set origin 0.,0.
set multiplot
set size 0.5,0.6
EOF
    case ${d} in
    Arichi | Yamamoto)   ### 平屋 7ch計測
    cat >>temp.gp <<EOF
set origin 0.,1.2
set ylabel "fourier spectrum"
plot "${dat}" u 1:3 title "張間方向(地表)"
set origin 0.5,1.2
plot "${dat}" u 1:2 title "桁行方向(地表)"
set origin 0.,0.6
set ylabel "fourier spectrum"
plot "${dat}" u 1:8 title "小屋梁"
set origin 0.5,0.6
plot "${dat}" u 1:7 title "小屋梁"
set origin 0.,0.
set ylabel "transfer function"
plot "${dat}" u 1:12 title "小屋梁/地表"
set origin 0.5,0.
plot "${dat}" u 1:10 title "小屋梁/地表"
set nomultiplot
EOF
    ;;
    Otsuka)   ### 平屋 9ch計測
    cat >>temp.gp <<EOF
set origin 0.,1.2
set ylabel "fourier spectrum"
plot "${dat}" u 1:2 title "桁行方向(地表)"
set origin 0.5,1.2
plot "${dat}" u 1:3 title "張間方向(地表)"
set origin 0.,0.6
plot "${dat}" u 1:9 title "小屋梁"
set origin 0.5,0.6
plot "${dat}" u 1:10 title "小屋梁"
set origin 0.,0.
set ylabel "transfer function"
plot "${dat}" u 1:13 title "小屋梁/地表"
set origin 0.5,0.
plot "${dat}" u 1:16 title "小屋梁/地表"
set nomultiplot
EOF
    ;;
    Shimazaki | Kinoshita | Kodai | Yasufuku | Shirai)
    cat >>temp.gp <<EOF
set origin 0.,1.2
set ylabel "fourier spectrum"
plot "${dat}" u 1:3 title "桁行方向(地表)"
set origin 0.5,1.2
plot "${dat}" u 1:2 title "張間方向(地表)"
set origin 0.,0.6
set ylabel "fourier spectrum"
plot "${dat}" u 1:10 title "小屋梁","${dat}" u 1:8 title "2階床"
set origin 0.5,0.6
plot "${dat}" u 1:9 title "小屋梁","${dat}" u 1:7 title "2階床"
set origin 0.,0.
set ylabel "transfer function"
plot "${dat}" u 1:16 title "小屋梁/地表","${dat}" u 1:15 title "2階床/地表"
set origin 0.5,0.
plot "${dat}" u 1:13 title "小屋梁/地表","${dat}" u 1:12 title "2階床/地表"
set nomultiplot
EOF
    ;;
    Misawa22 | Suzuki | Kohata | Nagata | Sumikura)
    cat >>temp.gp <<EOF
set origin 0.,1.2
set ylabel "fourier spectrum"
plot "${dat}" u 1:2 title "桁行方向(地表)"
set origin 0.5,1.2
plot "${dat}" u 1:3 title "張間方向(地表)"
set origin 0.,0.6
set ylabel "fourier spectrum"
plot "${dat}" u 1:9 title "小屋梁","${dat}" u 1:7 title "2階床"
set origin 0.5,0.6
plot "${dat}" u 1:10 title "小屋梁","${dat}" u 1:8 title "2階床"
set origin 0.,0.
set ylabel "transfer function"
plot "${dat}" u 1:13 title "小屋梁/地表","${dat}" u 1:12 title "2階床/地表"
set origin 0.5,0.
plot "${dat}" u 1:16 title "小屋梁/地表","${dat}" u 1:15 title "2階床/地表"
set nomultiplot
EOF
    ;;
    Misawa23)   ### 小屋梁測れず
    cat >>temp.gp <<EOF
set origin 0.,1.2
set ylabel "fourier spectrum"
plot "${dat}" u 1:3 title "張間方向(地表)"
set origin 0.5,1.2
plot "${dat}" u 1:2 title "桁行方向(地表)"
set origin 0.,0.6
set ylabel "fourier spectrum"
plot "${dat}" u 1:8 title "2階床"
set origin 0.5,0.6
plot "${dat}" u 1:7 title "2階床"
set origin 0.,0.
set ylabel "transfer function"
plot "${dat}" u 1:12 title "2階床/地表"
set origin 0.5,0.
plot "${dat}" u 1:10 title "2階床/地表"
set nomultiplot
EOF
    ;;
esac

    gnuplot temp.gp
    rm -f temp.gp
done

rm -rf Aoto??
test -d Aoto || mkdir Aoto

dat="FourierSpectrum/Aoto09.dat"     ## 8ch is NS (張間?)
dat1="FourierSpectrum/Aoto10.dat"    ## 8ch is EW (桁行?)

cat >temp.gp <<EOF
set terminal postscript eps
set xrange [0:20]
set xlabel "frequency (Hz)"

set data style lines
set output "Aoto/Aoto.eps"
set size 1.0,1.8
set origin 0.,0.
set multiplot
set size 0.5,0.6

set origin 0.,1.2
set ylabel "fourier spectrum"
plot "${dat1}" u 1:3 title "桁行方向(地表)"
set origin 0.5,1.2
plot "${dat}" u 1:2 title "張間方向(地表)"
set origin 0.,0.6
set ylabel "fourier spectrum"
plot "${dat1}" u 1:9 title "小屋梁","${dat}" u 1:8 title "2階床"
set origin 0.5,0.6
plot "${dat}" u 1:9 title "小屋梁","${dat}" u 1:7 title "2階床"
set origin 0.,0.
set ylabel "transfer function"
plot "${dat1}" u 1:14 title "小屋梁/地表","${dat}" u 1:13 title "2階床/地表"
set origin 0.5,0.
plot "${dat}" u 1:12 title "小屋梁/地表","${dat}" u 1:11 title "2階床/地表"
set nomultiplot
EOF

gnuplot temp.gp
rm -f temp.gp

exit 0
