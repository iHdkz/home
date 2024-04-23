#!/usr/bin/env gnuplot -persist -dc

C = 5
set xrange [-C:C]
set yrange [-C:C]
set grid

#set parametric

NUM = 100.
A=2.

np2(p) = 1/(1+sqrt(1+4*p**2))
do for [it=1:NUM] {
	p = A * it / NUM
	set title sprintf("%g times",it)
	plot x**2, "+" using (p):(p**2):(np2(p)):(2*p*np2(p)) with vectors notitle
	pause 0.1
}
