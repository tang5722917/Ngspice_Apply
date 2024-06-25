set termoption noenhanced
set title "CASCODE - Wide freq range amp"
set xlabel "Fre / Hz"
set ylabel "AC /dB"
set grid lw 2
set logscale x
set xrange [1e+1:1e+8]
set yrange [-100:100]
set border lw 3 
set format y "%g" 
set format x "%g"
plot 'CASCODE_result.txt' using 1:2 with lines lw 2 title "w/ NFB" at graph 0.4,0.40 ,\
     'CASCODE_result.txt' using 3:4 with lines lw 2 title "w/o NFB" at graph 0.4,0.45
set terminal push 
set terminal png noenhanced
set out 'CASCODE.png'
replot 
set term pop 
replot 
pause mouse
