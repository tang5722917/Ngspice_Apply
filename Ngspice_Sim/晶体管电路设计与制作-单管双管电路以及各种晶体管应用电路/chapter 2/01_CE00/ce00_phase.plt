set termoption noenhanced
set title "CE00 frequency characteristic"
set xlabel "Frequency Hz"
set ylabel "Phase C"
set grid lw 3 
unset logscale x 
set xrange [1.000000e+01:1.000000e+05]
unset logscale y 
set yrange [-1.890000e+02:9.000000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
set logscale x
plot 'ce00_phase.data' using 1:2 with lines lw 3 title "outdph"
set terminal push
set terminal png noenhanced
set out 'ce00_phase.png'
replot
set term pop
replot
