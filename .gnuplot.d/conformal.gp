#!/usr/bin/env gnuplot -dc

set parametric;
set size square;
set size ratio -1;
i={0.0,1.0}
f(t)=5*exp(i*t);

a=3;
conform(zeta)=zeta+a**2/zeta

plot real(f(t)),imag(f(t)),\
real(conform(f(t))),imag(conform(f(t)))

