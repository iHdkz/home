#!/usr/bin/env python

import numpy as np

def forwardEuler_method(xinit, yinit, f):
    h = 0.05
    stepCnt = 100
    xs = np.empty((stepCnt + 1,))
    ys = np.empty((stepCnt + 1,))

    xs[0] = xinit
    ys[0] = yinit

    for i in range(stepCnt):
        ys[i+1] = ys[i] + f(xs[i], ys[i])
        xs[i+1] = xs[i] + h

    return xs, ys

if __name__ == "__main__":
    import math
    xs, ys = forwardEuler_method(0.0, 1.0,
            lambda x,y: -y - math.pi*math.exp(-x) * math.sin(math.pi*x)) 
    import PyGnuplot as gp
    gp.s([xs,ys])
    gp.c("""
            set grid
            set size ratio -1
         """)
    gp.c('plot "tmp.dat" with lines')
    
         


