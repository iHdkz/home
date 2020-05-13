###
### Gnuplot version 5.0 intialization file
### This file is loaded by gnuplot at the start of each run.
### It is provided as a template, with all commands commented out.
### Uncomment and customize lines for local use.
### Any commands placed here will affect all users.
### To customize gnuplot's initial state for an individual user,
### place commands in a private file ~/.gnuplot instead.

if(exist("__init__") != 0) exit;
__init__ = "done";

reset;
# the imaginary unit in complex number.
i = {0.0,1.0};

# set locale;
# set encoding locale;
#set xrange [-C:C];
#set yrange [-C:C];
#set size ratio 1;
set size square;	#print "set size square";
set size ratio -1;	#print "set size ratio -1";
#set grid;		print "set grid";
set key right bottom;	#print "key right bottom";
set macros;		#print "set macros";
#set noautoscale;

#set isosample 100;
#set contour base;
#set cntrparam levels incremental -10,1.5,10;
#set view map;
#set nosurface;

#set object 1 circle at 0,0 size a fc rgb "gray" fs solid front
###
### Some commonly used functions that are not built in
###

func_ndist="ndist(x,mu,sigma)=1/(sqrt(2*pi) * sigma) * exp(-(x - mu)**2 / (2*sigma**2));"
func_sinc="sinc(x) = sin(pi * x)/(pi * x);"
func_cointoss="cointoss(dummy) = (rand(0)<0.5) ? 1 : 0;"
func_C="C(n,r)=(r<=0 ? 1.0 : 1.0*(n-r+1)/r*C(n,r-1));"
func_P="P(n,r)=(r<=1 ? n : n*P(n-1,r-1));"
func_bindist="bindist(n,r,p)=C(n,r)*(p**r)*((1.0-p)**(n-r));"

###
### Default line colors and repeat cycle
###
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);
hsv(h,s,v) = sprintf("#%06x",hsv2rgb(h,s,v))

set linetype 1 linewidth 1 linecolor rgb "red-orange"
set linetype 2 linewidth 1 linecolor rgb "dark-violet"
set linetype cycle 8

#set style line 1 linecolor rgb 'black' pt 5   # square
#set style line 2 linecolor rgb 'black' pt 7   # circle
#set style line 3 linecolor rgb 'black' pt 9   # triangle
###
### Initialize the default loadpath for shared gnuplot scripts and data.
### Please confirm that this path is correct before uncommented the line below.
###
set loadpath "/opt/local/share/doc/gnuplot/demo" "~/.gnuplot.d/";

