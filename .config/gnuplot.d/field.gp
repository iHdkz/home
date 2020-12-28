#!/usr/bin/env gnuplot -dc -persist

set grid
set sample  50
set isosample 50,50
set urange [-50:50]
set vrange [-50:50]
set size ratio -1
i = {0.0,1.0};

w=2;
q=2;
gmm=200;
a=15;

if(exist("cntr") == 0) cntr=-50;
g(z)=w+i*gmm/(2*pi*(z-cntr))-q*a**2/(2*pi*((z-cntr)**2))
#g(z)=w-q*a**2/(2*pi*((z-cntr)**2))
vfilter(val,absmax)=abs(val) > absmax ? 0 : val
rfield(z)=vfilter( real(g(z)),5);
ifield(z)=vfilter(-imag(g(z)),5);
plot '++' using 1:2:(rfield($1+$2*i)):(ifield($1+$2*i)) with vectors

cntr = cntr + 1;
if(abs(cntr) < 50) reread;

pause -1

