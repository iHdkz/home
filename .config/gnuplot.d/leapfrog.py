#!/usr/bin/env python

import numpy as np

def leapFrogs_method(xinit, yinit, f):
    h = 0.01
    stepCnt = 1000
    xs = np.empty((stepCnt + 1,))
    ys = np.empty((stepCnt + 1,))

    xs[0] = xinit
    ys[0] = yinit

    for i in range(stepCnt):
        if i / 2 == 0 : 
