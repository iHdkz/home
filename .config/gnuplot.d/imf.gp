u0=1;
a=2;
f(x,y)=u0*x*(1+a**2/(x**2+y**2));
circ(x,y)=x**2+y**2 - a**2
C=10

set xrange[-C:C]
set yrange[-C:C]

set isosamples 100,100
set contour base
#set cntrparam levels discrete  0.0
set nosurface
set size square
set size ratio 1
#set view 0,0,2,
set view map;
#set view equal xy;

splot circ(x,y)

pause -1
