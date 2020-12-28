#!/usr/bin/env python

import PyGnuplot as gp

gp.c("""
        set grid
        set size square
        set size ratio -1
        set parametric
     """)
gp.c("""
        i={0.0, 1.0};

        c=16
        a=c/4
        f(zeta)=zeta+(a**2)/zeta;

        M = 3.5
        C = 0.5 + i
        rval(t)=real(f(M*exp(i*t)+C));
        ival(t)=imag(f(M*exp(i*t)+C));
     """)

gp.c('plot "++" using (f($1)):(f($2)) with dots')

