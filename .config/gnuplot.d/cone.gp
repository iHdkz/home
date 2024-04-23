#!/usr/bin/env gnuplot -persist -dc

C = 10
set xrange [-C:C]
set yrange [-C:C]
set zrange [0:20*C]

NUM = 100.
do for [it=1:NUM] {
	p = it / NUM
	set title sprintf("%g times.",it)
	splot x**2 + y**2 notitle
	pause 0.1
}

