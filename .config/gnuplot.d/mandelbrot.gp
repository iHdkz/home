import mandelbrot(a,z) from "gp_plugin"

#mandel(A,z,n) = (abs(z) > 2.0 || n >= 100) ? n : mandel(A,z*z+A, n+1)
mandel(A,z,n) = ( abs(z) < 3.0 &&  n < 100 ) ? mandel(A,z*z+A, n+1) : n


set xrange [-1.5:0.5]
set yrange [-1:1]
set logscale z
set isosample 50,50
set hidden3d
set contour base
set view map
set nosurface
#set cntrparam levels incremental 0,1,1000
set cntrparam levels discrete 900
#set table $datablock

#splot mandel(x+y*{0,1},{0,0},0) notitle
splot mandelbrot(x+y*{0,1},{0,0}) notitle
#unset table

#plot $datablock

