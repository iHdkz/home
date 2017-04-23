#
# Newton Interpolation formula function

set macros

_deg = 0;
if(strlen(ARG1) != 0) _x0 = real(@ARG1); _y0 = imag(@ARG1);
if(strlen(ARG2) != 0) _x1 = real(@ARG2); _y1 = imag(@ARG2); _deg = 1;
if(strlen(ARG3) != 0) _x2 = real(@ARG3); _y2 = imag(@ARG3); _deg = 2;
if(strlen(ARG4) != 0) _x3 = real(@ARG4); _y3 = imag(@ARG4); _deg = 3;
if(strlen(ARG5) != 0) _x4 = real(@ARG5); _y4 = imag(@ARG5); _deg = 4;

print _deg;

if(_deg != 0) load "nif" . _deg . ".gp"; eval "plot nif" . _deg . "(x)";
