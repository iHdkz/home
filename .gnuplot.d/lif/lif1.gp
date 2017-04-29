#

_1term0 = _y0 / (_x0 - _x1);
_1term1 = _y1 / (_x1 - _x0);
lif1(x) = _1term0 * (x - _x1) \
	+ _1term1 * (x - _x0);
