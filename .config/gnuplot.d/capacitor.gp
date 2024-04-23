#!/usr/bin/env gnuplot -pdc

f(u,v)=u+exp(u)*cos(v)
g(u,v)=v+exp(u)*sin(v)

plot "++" using (f($1,$2)):(g($1,$2)) with lines
pause -1
