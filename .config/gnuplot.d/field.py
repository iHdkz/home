#!/usr/bin/env python

import PyGnuplot as gp
import numpy as np

gp.c("""
        set grid;
        set size ratio -1;
        set urange [-50:50];
        set vrange [-50:50];
        set sample 20;
        set isosample 20;
    """)
gp.c("""
        i = {0.0, 1.0}
        a = 0.1
        g(z)= a*z
     """)

#gp.c('plot "++" using 1:2:(real(g($1+$2*i))):(-imag(g($1+$2*i))) with vectors')
gp.c('plot "++" using 1:2:(-a*$2):(a*$1) with vectors')

