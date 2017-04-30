###
### Gnuplot version 5.0 intialization file
### This file is loaded by gnuplot at the start of each run.
### It is provided as a template, with all commands commented out.
### Uncomment and customize lines for local use.
### Any commands placed here will affect all users.
### To customize gnuplot's initial state for an individual user,
### place commands in a private file ~/.gnuplot instead.
if(exist("__INITIALIZATION__") != 0) exit;
__INITIALIZATION__ = "done";

reset;
###
### Language initialization
###
# set locale
# set encoding locale
#set xrange [-1:1]
#set yrange [-1:1]
#set size ratio 1;	print "set size ratio 1";
set size square;	print "set size square";
set grid;		print "set grid";
set key right bottom;	print "set key right bottom";

###
### Macro definitions
###
set macros;	print "set macros";
pts = "with points";
dts = "with dots";
vts = "with vectors";

ls1 = "linestyle 1";
ls2 = "linestyle 2";
ls3 = "linestyle 3";

###
### Default line colors and repeat cycle
###
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);
hsv(h,s,v) = sprintf("#%06x",hsv2rgb(h,s,v))

set linetype 1 linewidth 1 linecolor rgb "red-orange"
set linetype 2 linewidth 1 linecolor rgb "dark-violet"
#set linetype 3 linewidth 1 linecolor rgb "#56b4e9"
#set linetype 4 linewidth 1 linecolor rgb "#e69f00"
#set linetype 5 linewidth 1 linecolor rgb "#f0e442"
#set linetype 6 linewidth 1 linecolor rgb "#0072b2"
#set linetype 7 linewidth 1 linecolor rgb "#e51e10"
#set linetype 8 linewidth 1 linecolor rgb "black"
set linetype cycle 8

#set style line 1 linecolor rgb 'black' pt 5   # square
#set style line 2 linecolor rgb 'black' pt 7   # circle
#set style line 3 linecolor rgb 'black' pt 9   # triangle
###
### Initialize the default loadpath for shared gnuplot scripts and data.
### Please confirm that this path is correct before uncommented the line below.
###
set loadpath "/opt/local/share/doc/gnuplot/demo" "~/.gnuplot.d/";
mode_anim  = "modes/conf_animation.gp";
mode_inter = "modes/conf_interactive.gp";
mode_disc  = "modes/conf_discrete.gp";

###
### Some commonly used functions that are not built in
###
_=" "
__FUNCNAMES="sinc"._."P"._."C"._."cointoss"._."ndist";
do for [n=1:words(__FUNCNAMES)] {
	call "functions/".word(__FUNCNAMES,n).".gp";
	eval sprintf("print 'import function '.__FUNC_%s", word(__FUNCNAMES,n));
	}

###
### Other preferences
###
# set clip two

# the imaginary unit in complex number.
i = {0.0,1.0};

#
