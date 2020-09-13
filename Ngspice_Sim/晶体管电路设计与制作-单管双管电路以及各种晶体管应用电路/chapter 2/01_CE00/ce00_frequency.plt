set termoption noenhanced
set title "CE00 frequency characteristic"
set xlabel "Frequency Hz"
set ylabel "Vo/Vs DB"
set grid lw 3 
set logscale x 
set xrange [1.000000e+01:1.000000e+05]
unset logscale y 
set yrange [-2.500000e+00:5.250000e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'ce00_frequency.data' using 1:2 with lines lw 3 title "outdb"
set terminal push
set terminal png noenhanced
set out 'ce00_frequency.png'
replot
set term pop
replot
