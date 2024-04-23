#!/usr/bin/env gnuplot -persist -dc

set size ratio -1
set xrange [-10:10]
set yrange [-1:100]
set parametric

h=100
g=9.8
fall(t)=-g*t

time=0
while (h - g*time > 0) {
	#set obj 1 circle at 0,h - g*time size 0.1 front fs solid noborder fc rgb "black"
	#plot 0, h - g*time with points
	plot cos(t), sin(t) - h + g * time/10000.
	time=time+0.1
}
