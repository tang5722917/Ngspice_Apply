set termoption noenhanced
set title "EMF4 - 4 Tr Emitter follower AC sim"
set xlabel "AC /dB"
set ylabel "Fre / Hz"
set grid lw 2
set logscale x
set xrange [1e+1:1e+8]
set yrange [-120:20]
set border lw 3 
set format y "%g" 
set format x "%g"
plot '07_EMF4_AC_result.txt' using 1:2 with lines lw 2 title "CL = 0.1uF" at graph 0.2,0.20 ,\
     '07_EMF4_AC_result.txt' using 3:4 with lines lw 2 title "CL = 0.01uF" at graph 0.2,0.25 ,\
     '07_EMF4_AC_result.txt' using 5:6 with lines lw 2 title "CL = 1000pF" at graph 0.2,0.30 ,\
     '07_EMF4_AC_result.txt' using 7:8 with lines lw 2 title "CL = 100pF" at graph 0.2,0.35
set terminal push 
set terminal png noenhanced
set out '07_EMF4_AC.png'
replot 
set term pop 
replot 
pause mouse
