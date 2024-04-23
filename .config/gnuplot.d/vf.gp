
set size square;
set size ratio -1;
set sample 20;
set isosample 20;
i = {0.0,1.0};

set urange [-10:10];
set vrange [-10:10];

set parametric;

c=0.8;
q=2*10**(-2);
a=5.1;
sphere(x,y)=x**2+y**2 <= a**2
dFdz(x,y)=c*(1-a**2/(x+i*y)**2)
rl(x,y)=real(dFdz(x,y));
im(x,y)=imag(dFdz(x,y));
set title "vector field";
plot '++' using 1:2:(sphere($1,$2) ? 0 : rl($1,$2)):\
		    (sphere($1,$2) ? 0 : im($1,$2)) with vectors title "key",\
		    (a-1)*cos(t),(a-1)*sin(t) with lines

