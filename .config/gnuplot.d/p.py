#!/usr/bin/env python
import PyGnuplot as gp
import numpy as np

X = np.arange(100)
Y = np.sin(X/2*np.pi)
Z = Y ** 2.0
gp.s([X,Y,Z])
gp.c('plot "tmp.dat" u 1:2 w l')
gp.c('replot "tmp.dat" u 1:3 w l')
#gp.p("myfigure.ps")
