#/usr/bin/env gnuplot -dc -persist

i={0.0,1.0};

set size square;
q=2.5
a=10
abmax=5

g(z,c)=q-q*a**2/((z-c)**2)
#g(z,c)=f(z,c)+a**2/f(z,c)
vfilter(val,bound)=abs(val)>bound ? 0 : val
rvct(z,c)=vfilter( real(g(z,c)), abmax)
ivct(z,c)=vfilter(-imag(g(z,c)), abmax)

set sample 30;
set isosample 30;
set urange [-50:50]
set vrange [-50:50]

do for [it=1:1000] {
	c = - {0.05, 0.0} * it 
	#set obj 1 circle at real(c),imag(c) size a - 0.1 front fs solid noborder fc rgb "black"
	#plot '++' using 1:2:(rvct($1+$2*i,c)):(ivct($1+$2*i,c)) with vectors
	plot "++" using 1:2:(real(log($1+$2*i))):(-imag(log($1+$2*i))) with vectors
}

#replot real(5*exp(i*t)+cntr),imag(5*exp(i*t)+cntr) with boxes

pause -1
