set term postscript 18
set output "|/usr/ucb/lpr -Plw"
set xlabel "Frequency(cps)"
set ylabel "Fourier spectrum"
set xrange [0:30]
set data style lines

set title "Fourier spectrum of longitudinal direction"
plot 'sr226ns.fft' u 1:6 title "loft",'sr226ns.fft' u 1:5 title "2nd floor",'sr226ns.fft' u 1:4 title "1st floor",'sr226ns.fft' u 1:3 title "ground"
#pause -1

set title "Fourier spectrum ratio of longitudinal direction"
plot 'sr226ns.trs' u 1:5 title "loft vs ground",'sr226ns.trs' u 1:6 title "2nd floor vs ground"
#pause -1

set title "Fourier spectrum of span direction"
plot 'sr226ew1.fft' u 1:6 title "loft",'sr226ew1.fft' u 1:5 title "2nd floor",'sr226ew1.fft' u 1:4 title "1st floor",'sr226ew1.fft' u 1:3 title "ground"
#pause -1

set title "Fourier spectrum ratio of span direction"
plot 'sr226ew1.trs' u 1:5 title "loft vs ground",'sr226ew1.trs' u 1:6 title "2nd floor vs ground"
#pause -1

set title "Fourier spectrum of vertical direction"
plot 'sr226ud.fft' u 1:6 title "loft",'sr226ud.fft' u 1:5 title "2nd floor",'sr226ud.fft' u 1:4 title "1st floor",'sr226ud.fft' u 1:3 title "ground"
#pause -1

set title "Fourier spectrum ratio of vertical direction"
plot 'sr226ud.trs' u 1:5 title "loft vs ground",'sr226ud.trs' u 1:6 title "2nd floor vs ground"
#pause -1

set title "Fourier spectrum of ground surface"
plot 'sr226ns.fft' u 1:3 title "longitudinal direction",'sr226ew1.fft' u 1:3 title "span direction",'sr226ud.fft' u 1:3 title "vertical direction"
#pause -1

set title "Fourier spectrum of 1st floor"
plot 'sr226ns.fft' u 1:4 title "longitudinal direction",'sr226ew1.fft' u 1:4 title "span direction",'sr226ud.fft' u 1:4 title "vertical direction"
#pause -1

set title "Fourier spectrum of 2nd floor"
plot 'sr226ns.fft' u 1:5 title "longitudinal direction",'sr226ew1.fft' u 1:5 title "span direction",'sr226ud.fft' u 1:5 title "vertical direction"
#pause -1

set title "Fourier spectrum of loft"
plot 'sr226ns.fft' u 1:6 title "longitudinal direction",'sr226ew1.fft' u 1:6 title "span direction",'sr226ud.fft' u 1:6 title "vertical direction"
#pause -1
