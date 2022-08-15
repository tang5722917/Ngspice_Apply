set termoption noenhanced
set title "VOLUME - Electronic Volume "
set xlabel "Time /s"
set ylabel "V(OUT) / V"
set grid lw 2
#set logscale x 
set xrange [0:1e-03]
#set logscale y 
set yrange [-4:+4]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot '05_VOLUME_Wave_result.txt' using 1:2 with lines lw 2 title "VC = 0V" at graph 0.2,0.2 ,\
     '05_VOLUME_Wave_result.txt' using 3:4 with lines lw 2 title "VC = 2V" at graph 0.2,0.25,\
     '05_VOLUME_Wave_result.txt' using 5:6 with lines lw 2 title "VC = 3V" at graph 0.2,0.3, \
     '05_VOLUME_Wave_result.txt' using 7:8 with lines lw 2 title "VC = 4V" at graph 0.2,0.35,\
     '05_VOLUME_Wave_result.txt' using 9:10 with lines lw 2 title "VC = 6V" at graph 0.2,0.4, \
     '05_VOLUME_Wave_result.txt' using 11:12 with lines lw 2 title "VC = 8V" at graph 0.2,0.45

set terminal push
set terminal png noenhanced
set out '05_VOLUME_Wave.png'
replot
set term pop
replot
pause mouse
