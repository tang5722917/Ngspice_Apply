set termoption noenhanced
set title "01_TRANSFORMER ST7 - 01_TRANSFORMER ST71"
set xlabel "Fre / Hz"
set ylabel "AC /dB"
set grid lw 2
set logscale x
set xrange [1e+1:2e+5]
set yrange [-13:1]
set border lw 3 
set format y "%g" 
set format x "%g"
plot '01_TRANSFORMER_ST71_result.txt' using 1:2 with lines lw 2 title "RL = 2kohm" at graph 0.2,0.20 ,\
     '01_TRANSFORMER_ST71_result.txt' using 3:4 with lines lw 2 title "RL = 600ohm" at graph 0.2,0.25
set terminal push 
set terminal png noenhanced
set out '01_TRANSFORMER_ST71.png'
replot 
set term pop 
replot 
pause mouse
