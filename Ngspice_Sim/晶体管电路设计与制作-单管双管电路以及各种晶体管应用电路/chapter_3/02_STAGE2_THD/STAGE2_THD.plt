set termoption noenhanced
set title "STAGE2A.CIR - Common emitter+common collector"
set xlabel "Frequency /Hz"
set ylabel "Gain /DB"
set grid lw 2
set logscale x 
set xrange [0.1:4]
set logscale y 
set yrange [0.001:100]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'STAGE2_THD.CIR_result.txt' using 1:2 with lines lw 3 title "Without Boost 1k" ,\
     'STAGE2_THD.CIR_result.txt' using 3:4 with lines lw 3 title "With Boost 1k" ,\
     'STAGE2_THD_20k.CIR_result.txt' using 1:2 with lines lw 3 title "Without Boost 20k" ,\
     'STAGE2_THD_20k.CIR_result.txt' using 3:4 with lines lw 3 title "With Boost 20k"      
set terminal push
set terminal png noenhanced
set out 'STAGE2A.png'
replot
set term pop
replot
pause mouse
