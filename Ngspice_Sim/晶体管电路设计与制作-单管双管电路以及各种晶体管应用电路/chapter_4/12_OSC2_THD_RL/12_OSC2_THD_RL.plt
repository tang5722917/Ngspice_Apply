set termoption noenhanced
set title "12_OSC2_THD_RL - Sinusoidal Oscillator RL sim  (THD/VMS)"
set xlabel "RL / kOHM"
set ylabel "THD / %"
set grid lw 2
set logscale x
set xrange [1:100]
set logscale y
set yrange [0.01:1]
set y2label "VMS / V"
set y2range [0.1:10]
set logscale y2
set y2tics
set border lw 3 
set format y "%g" 
set format x "%g"
plot '12_OSC2_THD_RL_result.txt' using 1:2 with lines lw 2 title "THD/RL" at graph 0.9,0.80 ,\
     '12_OSC2_THD_RL_result.txt' using 3:4 with lines lw 2 title "OUT-VMS/RL" at graph 0.9,0.85 axis x1y2
set terminal push 
set terminal png noenhanced
set out '12_OSC2_THD_RL.png'
replot 
set term pop 
replot 
pause mouse
