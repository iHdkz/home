#

load "nif2.gp";

_F3 =  _y0/((_x0 - _x1)*(_x0 - _x2)*(_x0 - _x3))\
     + _y1/((_x1 - _x0)*(_x1 - _x2)*(_x1 - _x3))\
     + _y2/((_x2 - _x0)*(_x2 - _x1)*(_x2 - _x3))\
     + _y3/((_x3 - _x0)*(_x3 - _x1)*(_x3 - _x2));

nif3(x) = nif2(x) + _F3 * (x - _x0)*(x - _x1)*(x - _x2);