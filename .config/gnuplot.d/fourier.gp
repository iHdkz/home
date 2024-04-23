#!/usr/bin/env gnuplot -persist -dc

set multiplot layout 2,2
fourier(k,x) = sin(3./2*k)/k * 2./3*cos(k*x)
do for [power = 0:3] {
	TERMS = 10**power
	set title sprintf("%g term Fourier series", TERMS)
	plot 0.5 + sum [k=1:TERMS] fourier(k,x) notitle
}
unset multiplot

pause -1
