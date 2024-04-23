#!/usr/bin/env python

import numpy as np
def Heun_method(xinit, yinit, f):
    h = 0.01
    stepCnt = 1000
    xs = np.empty((stepCnt + 1,))
    ys = np.empty((stepCnt + 1,))
    xs[0] = xinit
    ys[0] = yinit

    for i in range(stepCnt):
        k1 = h * f(xs[i], ys[i])
        k2 = h * f(xs[i] + h, ys[i] + k1)
        ys[i+1] = ys[i] + 1/2 * (k1 + k2)
        xs[i+1] = xs[i] + h
    return xs,ys

def RungeKutta_method(xinit, yinit, f):
    h = 0.01
    stepCnt = 1000

    xs = np.empty((stepCnt + 1,))
    ys = np.empty((stepCnt + 1,))
    xs[0] = xinit
    ys[0] = yinit
    
    for i in range(stepCnt):
        k1 = h * f(xs[i],ys[i])
        k2 = h * f(xs[i] + h/2, ys[i] + k1/2)
        k3 = h * f(xs[i] + h/2, ys[i] + k2/2)
        k4 = h * f(xs[i] + h  , ys[i] + k3)
        ys[i+1] = ys[i] + 1/6 * (k1 + 2 * k2 + 2 * k3 + k4)
        xs[i+1] = xs[i] + h
    return xs,ys

import PyGnuplot as gp
#xs,ys = RungeKutta_method(0, 2, lambda x,y : -x*y/2)
xs,ys = Heun_method(0,2, lambda x, y : -x*y/2)
gp.s([xs,ys])
gp.c("""
        set grid
        set size ratio -1
     """)
gp.c('plot "tmp.dat" with lines')
gp.c('replot 2*exp(-x**2/4)')

