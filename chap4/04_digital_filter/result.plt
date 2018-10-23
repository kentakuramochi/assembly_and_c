# result.plt
# gnuplot script file
#
# usage:
# $ gnuplot result.plt
#

# axis label
set xl "time [s]"
set yl "signal"

# axis range
set xrange [0:1.2]

set grid

# plot
plot "result.txt" using 1:2 w l title "u(t)",\
     "result.txt" using 1:3 w l title "y(t)"

# display graph 3 sec
pause 3

# output png
set terminal pngcairo
set out "result.png"
replot

