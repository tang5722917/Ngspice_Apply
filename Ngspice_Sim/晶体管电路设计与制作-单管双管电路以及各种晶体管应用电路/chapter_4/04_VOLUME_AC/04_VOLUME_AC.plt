set termoption noenhanced
set title "VOLUME - Electronic Volume "
set xlabel "Frequency /Hz"
set ylabel "Gain /DB"
set grid lw 2
set logscale x 
set xrange [10:100000]
#set logscale y 
set yrange [-100e+00:0e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot '04_VOLUME_AC_result.txt' using 1:2 with lines lw 2 title "VC = 0V" at graph 0.5,0.5 ,\
     '04_VOLUME_AC_result.txt' using 3:4 with lines lw 2 title "VC = 2V" at graph 0.5,0.55,\
     '04_VOLUME_AC_result.txt' using 5:6 with lines lw 2 title "VC = 3V" at graph 0.5,0.6, \
     '04_VOLUME_AC_result.txt' using 7:8 with lines lw 2 title "VC = 4V" at graph 0.5,0.65,\
     '04_VOLUME_AC_result.txt' using 9:10 with lines lw 2 title "VC = 6V" at graph 0.5,0.7, \
     '04_VOLUME_AC_result.txt' using 11:12 with lines lw 2 title "VC = 8V" at graph 0.5,0.75

set terminal push
set terminal png noenhanced
set out '04_VOLUME_AC.png'
replot
set term pop
replot
pause mouse
