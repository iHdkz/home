#!/usr/bin/env gnuplot -dc -persist

i = {0.0,1.0};
array A[200];
do for [it = 1:200] { A[it] = exp(i*it/100.) }
fourier(k,x) = sin(3./2*k)/k * 2./3*cos(k*x);
set multiplot
do for [power = 0:5] {
	TERMS = 10**power;
	set title sprintf("%g term Fourier series",TERMS);
	plot 0.5 + sum [k=1:TERMS] fourier(k,x) notitle;
}
unset multiplot
pause -1
