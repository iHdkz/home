reset

C(n,r)=(r<=0 ? 1.0 : 1.0*(n-r+1)/r*C(n,r-1));
P(n,r)=(r<=1 ? n : n*P(n-1,r-1));

B(n,r,t)=C(n,r)*(1-t)**(n-r)*t**r

D=100
#set xrange [-D:D]
#set yrange [-3*D:3*D]

startpt = {-100,0};
endpt   = { 100,0};
ctrl1={-1,2}; 
ctrl2={3,2};
N=3;
cor(t)=B(N,0,t)*startpt + B(N,1,t)*ctrl1 + B(N,2,t)*ctrl2 + B(N,3,t)*endpt;

set parametric
do for [j=1:10] {
	ctrl2=ctrl2 * {2,2};
plot [t=0:1] real(cor(t)), imag(cor(t)), \
	real(startpt),imag(startpt) with points , \
	real(ctrl1),imag(ctrl1) with points , \
	real(ctrl2),imag(ctrl2) with points , \
	real(endpt),imag(endpt) with points
	pause 1
}
