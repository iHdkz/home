#!/usr/bin/env gnuplot -dc -persist

set contour base
set cntrparam levels incremental -10,0.5,10
set view map
set nosurface

set isosample 100;
set size square
set size ratio -1

C=10
set xrange [-C:C]
set yrange [-C:C]

i={0.0, 1.0}

q=1

a=2
set object 1 circle at 0,0 size a fc rgb "gray" fs solid front

f(z)=i*q*log(z)
#f(z)=q*(z + a**2/z**2)

splot imag(f(x+i*y))

pause -1
