#!/usr/bin/env gnuplot -persist -dc

N = 100
f(x) = cos(x) 
simpson(a,b)=sum [jt=1:N] f(a + (b - a) * jt/N) * (b-a)/N
print simpson(0.,10.)
