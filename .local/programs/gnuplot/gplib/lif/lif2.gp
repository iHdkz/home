#

_term0 = _y0 / (_x0 - _x1) / (_x0 - _x2);
_term1 = _y1 / (_x1 - _x0) / (_x1 - _x2);
_term2 = _y2 / (_x2 - _x0) / (_x2 - _x1);
lif2(x) = _term0 * (x - _x1)*(x - _x2) \
	+ _term1 * (x - _x0)*(x - _x2) \
	+ _term2 * (x - _x0)*(x - _x1);

