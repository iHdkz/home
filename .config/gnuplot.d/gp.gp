#!/usr/bin/env gnuplot -persist -dc

set size square
do for[it=1:120] {
	plot sin(pi * it * x)
	pause 0.01
}
