i={0,1}
C=10
q=1
b=1
#f(z)=q*(z + a*a/z)
f(z)=i*q*log(z)
set isosample 100;
set contour base
set cntrparam levels incremental -10,0.5,10
set view map
set nosurface
set size square
set size ratio -1

set xrange [-C:C]
set yrange [-C:C]

a=2
set object 1 circle at 0,0 size a fc rgb "gray" fs solid front
g(z)=imag(f(z))
splot g(x+i*y)

