#!/usr/bin/env gnuplot -pdc

set size square
set parametric
set trange [0:20]

plot cos(t)+t*sin(t),sin(t)-t*cos(t)
pause -1
