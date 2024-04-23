#!/usr/bin/env gnuplot -persist -dc

MAXNUM = 1000000
array ps[MAXNUM];

do for [it=1:MAXNUM] { ps[it] = 1 }
do for [it=2:MAXNUM] {
	if (MAXNUM <= it*it) { break } 
	if (!ps[it]) { continue }
	jt = 2
	while (it * jt <= MAXNUM) {
		ps[it *jt] = 0
		jt = jt + 1
	}
}

array spi[MAXNUM]
stepNum = 1
pos = {0.,0.}
spi[stepNum] = pos
array direct[4]
direct[1] = { 0., 1.} # up
direct[2] = {-1., 0.} # left
direct[3] = { 0.,-1.} # down
direct[4] = { 1., 0.} # right

isInArea(lv,pos)=(-lv <= real(pos)) && (real(pos) <= lv) && (-lv <= imag(pos)) && (imag(pos) <= lv)
lv = 1
while (1) {
	if (MAXNUM < stepNum + 8 * lv) { break }
	stepNum = stepNum + 1
	pos = pos + {1.,0.}
	spi[stepNum] = ps[stepNum] ? pos : {0.,0.}
	do for [d=1:4] {
		while (isInArea(lv,pos + direct[d])) {
			stepNum = stepNum + 1
			pos = pos + direct[d]
			spi[stepNum] = ps[stepNum] ? pos : {0.,0.}
		}
	}
	lv = lv + 1
}
plot spi using 2:3 with dots
print stepNum

pause -1
