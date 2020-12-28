#!/usr/bin/env gnuplot -dc -persist

set grid
set size ratio -1

#dx/dt = -sigma x + sigma y
#dy/dt = -y + r x - x z
#dz/dt = -bz + x y
sigma=10
b=8/3
r=28
dxdt(x,y,z)=-sigma*x + sigma*y
dydt(x,y,z)=-y + r*x - x*z
dzdt(x,y,z)=-b*z + x*y

splot '++' using 1:2:3
