#!/usr/bin/env gnuplot -dc
set isosample 10;
set sample 10;

set grid;

set size square;
set size ratio -1;

C=3;
set urange [-C:C];
set vrange [-C:C];

set xrange [-C:C];
set yrange [-C:C];

splot '++' using 1:2:3:(0.1):(0.1):(0.1) with vectors
