set encoding utf8
set termoption noenhanced
set title "Transitor emitter follower frequency characteristic"
set xlabel "Frequency /Hz"
set ylabel "Vo/Vs /DB"
set grid
set logscale x 
set xrange [1.000000e+01:1.000000e+07]
unset logscale y 
set yrange [-7.400000e+00:1.400000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'emf1_frequency.data' using 1:2 with lines lw 3 title "outdb"
set terminal push
set terminal png noenhanced
set out 'emf1_frequency.png'
replot
set term pop
replot
