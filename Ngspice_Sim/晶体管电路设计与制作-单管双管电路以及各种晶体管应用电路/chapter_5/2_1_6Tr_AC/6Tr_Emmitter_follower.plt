set termoption noenhanced
set title "EMF6 - 6Tr Emmitter follower"
set xlabel "Fre / Hz"
set ylabel "AC /dB"
set grid lw 2
set logscale x
set xrange [1e+1:1e+8]
set yrange [-120:20]
set border lw 3 
set format y "%g" 
set format x "%g"
plot '6Tr_Emmitter_follower_result.txt' using 1:2 with lines lw 2 title "CL = 2pF" at graph 0.2,0.20 ,\
     '6Tr_Emmitter_follower_result.txt' using 3:4 with lines lw 2 title "CL = 5pF" at graph 0.2,0.25 ,\
     '6Tr_Emmitter_follower_result.txt' using 5:6 with lines lw 2 title "CL = 10pF" at graph 0.2,0.30 ,\
     '6Tr_Emmitter_follower_result.txt' using 7:8 with lines lw 2 title "CL = 20pF" at graph 0.2,0.35
set terminal push 
set terminal png noenhanced
set out '6Tr_Emmitter_follower.png'
replot 
set term pop 
replot 
pause mouse
