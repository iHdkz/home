#!/usr/bin/env gnuplot -dc -persist

set grid
set size square
set size ratio -1
set parametric

i={0.0, 1.0};

c=16
a=c/4
f(zeta)=zeta+(a**2)/zeta;

if(exist("M") == 0) M = 3.5; C=0.5+i
rval(t)=real(f(M*exp(i*t)+C));
ival(t)=imag(f(M*exp(i*t)+C));
plot rval(t),ival(t)
C=C+0.01*i
print C
if(abs(C)<1) reread

pause -1

