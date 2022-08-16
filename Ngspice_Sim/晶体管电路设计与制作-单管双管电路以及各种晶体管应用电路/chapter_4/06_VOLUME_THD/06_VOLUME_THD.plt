set termoption noenhanced
set title "VOLUME - Electronic Volume THD"
set xlabel "Vin / Vrms"
set ylabel "THD / %"
set grid lw 2
set logscale x
set xrange [0.01:4]
set logscale y
set yrange [0.01:1]
set border lw 3 
set format y "%g" 
set format x "%g"
plot '06_VOLUME_THD_result.txt' using 1:2 with lines lw 2 title "VC = 0V" at graph 0.2,0.20 ,\
     '06_VOLUME_THD_result.txt' using 3:4 with lines lw 2 title "VC = 2V" at graph 0.2,0.25 ,\
     '06_VOLUME_THD_result.txt' using 5:6 with lines lw 2 title "VC = 3V" at graph 0.2,0.30 ,\
     '06_VOLUME_THD_result.txt' using 7:8 with lines lw 2 title "VC = 4V" at graph 0.2,0.35
set terminal push 
set terminal png noenhanced
set out '06_VOLUME_THD.png'
replot 
set term pop 
replot 
pause mouse
