/*
  The files gp_plugin.c and gnuplot_plugin.h serve as templates
  showing how to create an external shared object containing functions
  that can be accessed from inside a gnuplot session using the import
  command.  For example, after compiling this file into a shared
  object (gnuplot_plugin.so or gnuplot_plugin.dll) the functions it
  contains can be imported as shown:
 
  gnuplot> import divisors(x) from "demo_plugin"
  gnuplot> import mysinc(x) from "demo_plugin:sinc"
  gnuplot> import nsinc(N,x) from "demo_plugin"
 */

#include "gp_plugin.h"

complex double id(complex double c) { return c; }
EXPORT_GPFUNC_C(s, id);
