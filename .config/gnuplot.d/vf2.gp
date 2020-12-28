
set isosample 10;
set sample 10;
#set size square;
set size ratio -1;
i = {0.0,1.0};

u0 = 1;
v0 = 1;
q=10;
dFdz(x,y) = q/(2*pi*(x+i*y))
rl(x,y) = real(dFdz(x,y))
im(x,y) = imag(dFdz(x,y))
delta = 0.5

plot '++' using 1:2:(delta*rl($1,$2)):(delta*im($1,$2)) with vectors
