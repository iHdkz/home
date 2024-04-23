#!/usr/bin/env gnuplot -persist -dc

#set parametric

i = {0.0,1.0}
N = 4 
step = 2. * pi / N

W = exp(step*i)
W(kjt) = W**(kjt)

func(x) = cos(x)

array F[N]
do for [jt=1:N] { F[jt] = func(step*(jt - 1)) }

array A[N]
do for [k=1:N] { A[k] = 1./N * sum [jt=1:N] F[jt] * W(-k*(jt - 1)) }

array Ft[N]
do for [jt=1:N] { Ft[jt] = sum [k=1:N] A[k] * W(k*(jt - 1)) }

do for [it=1:N] { print it, A[it] }
plot A with lines
#plot Ft with lines

pause -1
