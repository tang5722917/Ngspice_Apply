set termoption noenhanced
set title "04_STAGE2B_AC_CF - Common emitter+common collector"
set xlabel "Frequency /Hz"
set ylabel "Gain /DB"
set grid lw 2
set logscale x 
set xrange [10:100000000]
#set logscale y 
set yrange [-30e+00:10e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot '04_STAGE2B_AC_CF_result.txt' using 1:2 with lines lw 2 title "CF :5pF" at graph 0.5,0.5 ,\
     '04_STAGE2B_AC_CF_result.txt' using 3:4 with lines lw 2 title "CF :10pF" at graph 0.5,0.55,\
     '04_STAGE2B_AC_CF_result.txt' using 5:6 with lines lw 2 title "CF :22pF" at graph 0.5,0.6,\
     '04_STAGE2B_AC_CF_result.txt' using 7:8 with lines lw 2 title "CF :47pF" at graph 0.5,0.65
set terminal push
set terminal png noenhanced
set out '04_STAGE2B_AC_CF.png'
replot
set term pop
replot
pause mouse
