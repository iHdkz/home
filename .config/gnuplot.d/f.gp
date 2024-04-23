#!/usr/bin/env gnuplot -persist -dc

N = 100
i = {0.0,1.0}
array F[N]
f(x) = x > 3 ? 1 : 0
d = 2. * pi / N
W = exp(d*i)

do for [jt=1:N] { F[jt] = f(d * (jt - 1.)) }

array A[N]
do for [k=1:N] { A[k] = 1. / N * sum [jt=1:N] F[jt] * W**(-(jt - 1)*k) }

array Ft[N]
do for [jt=1:N] { Ft[jt] = sum [k=1:N] A[k] * W**((jt - 1)*k) }

#print A

#plot Ft using (($1 - 1)*d):2 with points
plot A using ($1/100):2 with lines
#plot Ft using (($1 - 1) * d):2 with lines
do for [k=1:N] { print k, A[k] }
pause -1
