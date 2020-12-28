#/usr/bin/env gnuplot -dc -persist

i={0.0,1.0};

set size square;
w=3+4*i;
q=2
a=10
rd=a-0.1
abmax=5

g(z)=q-q*a**2/((z-cntr)**2)
#g(z,c)=f(z,c)+a**2/f(z,c)
vfilter(val,bound)=abs(val)>bound ? 0 : val
rvct(z)=vfilter( real(g(z)), abmax)
ivct(z)=vfilter(-imag(g(z)), abmax)

set sample 50;
set isosample 50;
set urange [-50:50]
set vrange [-50:50]

if(exist("cntr") == 0) cntr={0.0,0.0}
cntr=cntr-0.05

set obj 1 circle at real(cntr),imag(cntr) size rd front fs solid noborder fc rgb "black"
plot '++' using 1:2:(rvct($1+$2*i)):(ivct($1+$2*i)) with vectors

print cntr
#replot real(5*exp(i*t)+cntr),imag(5*exp(i*t)+cntr) with boxes

if (abs(cntr)<20); reread

pause -1
