#! /usr/local/bin/bash

FILES=$(echo csv/*[SM]*.csv)

for file in $FILES
do
    d=$(basename $file .csv)
    test -d $d || mkdir $d
    out=${d}/${d}.dat
    case $d in
    AS1M1_2)
	haba=1
	;;
    3B[MS]?C1)
	haba=$(echo $d | sed 's/3B[MS]\(.\)C1/\1/')
	;;
    A[MS]?[MCR][12])
	haba=$(echo $d | sed 's/A[MS]\(.\)[MCR][12]/\1/')
	;;
    esac
    echo $d $haba
    nkf -e ${file} >${d}.euc
    ./shori.pl ${d}.euc $haba >${out} 2>${d}/${d}.max
    mv -f envelope alpha alpha2 hosei ${d} 2>/dev/null
    rm -f ${d}.euc
done

## 荷重と変形の関係をグラフ化する。グラフは、ディレクトリ Graphs に作る。
test -d Graphs || mkdir Graphs

test -f tmp.gp && rm -f tmp.gp

for file in $FILES
do
    d=$(basename $file .csv)
    test -f ${d}/${d}.dat || exit 9

    if [ "$d" != "AS1M1" ]; then
	case $d in
	AS1C1 | AM1M1 | AM2C1 | 3BS1C1)
	    cat >tmp.gp <<EOF
# set xrange [:0.15]
# set xtics -0.15,0.05,0.15
set xlabel "story deformation angle (rad)"
set ylabel "load (kgf)"
set term postscript eps 20
set output "Graphs/${d}.ps"
set linestyle 1 lt 1 lw 2 pt 3 ps 0.5
set zeroaxis
plot "${d}/${d}.dat" u 2:17 title "${d}" w l,"${d}/envelope" u 3:2 title "Envelope" w l ls 1

set xlabel "loading force (kgf)"
set ylabel "axial force of a brace (kgf)"
set xrange [ * : * ] noreverse nowriteback
set xtics border mirror norotate autofreq 
set output "Graphs/${d}_br.ps"
plot "${d}/envelope" u 2:4 title "${d}" w l
quit
EOF
	;;
# 	AS2M1)
# 	    cat >tmp.gp <<EOF
# set xrange [:0.05]
# set xtics -0.15,0.025,0.15
# set xrange [ * : * ] noreverse nowriteback
# set xtics border mirror norotate autofreq 
# set xlabel "story deformation angle (rad)"
# set ylabel "load (kgf)"
# set term postscript eps 20
# set output "Graphs/${d}.ps"
# set linestyle 1 lt 1 lw 2 pt 3 ps 0.5
# set zeroaxis
# plot "${d}/${d}.dat" u 2:17 title "${d}" w l,"${d}/envelope" u 3:2 title "Envelope" w l ls 1

# set xlabel "loading force (kgf)"
# set ylabel "axial force of a brace (kgf)"
# set xrange [ * : * ] noreverse nowriteback
# set xtics border mirror norotate autofreq 
# set output "Graphs/${d}_br.ps"
# plot "${d}/envelope" u 2:4 title "${d}" w l
# quit
# EOF
# 	;;
	*)
	    cat >tmp.gp <<EOF
# set xrange [:0.15]
# set xtics -0.15,0.05,0.15
set xlabel "story deformation angle (rad)"
set ylabel "load (kgf)"
set term postscript eps 20
set output "Graphs/${d}.ps"
set linestyle 1 lt 1 lw 2 pt 3 ps 0.5
set zeroaxis
plot "${d}/${d}.dat" u 1:17 title "${d}" w l,"${d}/envelope" u 1:2 title "Envelope" w l ls 1

set xlabel "loading force (kgf)"
set ylabel "axial force of a brace (kgf)"
set xrange [ * : * ] noreverse nowriteback
set xtics border mirror norotate autofreq 
set output "Graphs/${d}_br.ps"
plot "${d}/envelope" u 2:4 title "${d}" w l
quit
EOF
	;;
	esac

	gnuplot tmp.gp && rm -f tmp.gp
    fi
done

rm -f tmp.tex
for i in $(grep '^[A-Z0-9]' kabebairitsu-hosei.tex | awk '{print $1}')
do
    cat $i/alpha2 >>tmp.tex
done
