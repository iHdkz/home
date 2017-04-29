#
# Fourier series expansion functions.

__TERM(n,x)=(n <= 0 ?		0 : (-1)**2 * 2.0 / n * sin(n*x));
series(n,x)=(n <= 0 ? __TERM(0,x) : __TERM(n,x) + series(n-1,x));
print "import function series(n : int, x)";

