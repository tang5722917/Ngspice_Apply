set termoption noenhanced
set title "PWM - Pulse Width Modulation THD sim"
set xlabel "Vout / Vrms"
set ylabel "THD / %"
set grid lw 2
set logscale x
set xrange [0.1:10]
set logscale y
set yrange [0.01:10]
set border lw 3 
set format y "%g" 
set format x "%g"
plot 'PWM_2_THD_result.txt' using 1:2 with lines lw 2 title "Fre = 20Hz" at graph 0.2,0.20
set terminal push 
set terminal png noenhanced
set out 'PWM_2_THD.png'
replot 
set term pop 
replot 
pause mouse
