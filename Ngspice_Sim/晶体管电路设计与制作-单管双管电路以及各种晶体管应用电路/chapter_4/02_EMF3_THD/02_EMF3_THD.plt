set termoption noenhanced
set title "EMF3 - 3 Tr emitter follower"
set xlabel "V rms / V"
set ylabel "THD /%"
set grid lw 2
set logscale x 
set xrange [0.1:4]
set logscale y 
set yrange [0.001:1]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot '02_EMF3_THD_PY.CIR_result.txt' using 1:2 with lines lw 3 title "RL = 75 Ohm" at graph 0.2,0.95,\
     '02_EMF3_THD_PY.CIR_result.txt' using 3:4 with lines lw 3 title "RL = 6k Ohm" at graph 0.2,0.9
set terminal png noenhanced
set out '02_EMF3_THD.png'
replot
set term pop
replot
pause mouse
