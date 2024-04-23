#!/usr/bin/env gnuplot -psdc

set size ratio -1
set parametric

plot t-sin(t),1-cos(t)
pause -1
