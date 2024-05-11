set termoption noenhanced
set title "EMF6 - 6Tr Emmitter follower"
set xlabel "RL / k OHM"
set ylabel "THD / %"
set grid lw 2
set logscale x
set xrange [0.4:10]
set logscale y
set yrange [0.00001:0.1]
set border lw 3 
set format y "%g" 
set format x "%g"
plot '6Tr_Emmitter_follower_result.txt' using 1:2 with lines lw 2 title "Fre = 1000Hz" at graph 0.8,0.80 ,\
     '6Tr_Emmitter_follower_result.txt' using 3:4 with lines lw 2 title "Fre = 20000Hz" at graph 0.8,0.85
set terminal push 
set terminal png noenhanced
set out '6Tr_Emmitter_follower.png'
replot 
set term pop 
replot 
pause mouse
