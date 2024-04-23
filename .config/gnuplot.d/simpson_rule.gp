#
# Simpson's rule

set macros;

if(ARGC >= 1) { eval "integrand(x) =" . ARG1; }

_4term(sta,end,h) = 4 * sum [it=0:ceil((end - sta)/2/h)-1]\
			integrand(sta + h * (2 * it + 1));
_2term(sta,end,h) = 2 * sum [it=0:ceil((end-sta)/2/h)-1]\
			integrand(sta + h * 2 * it);
_Sum(sta,end,h) = integrand(sta) \
		+ _4term(sta,end,h) + _2term(sta,end,h) \
		+ integrand(sta + h * 2 * ceil((end-sta)/2/h));
int_simpson(sta,end,h) = 1.0/3 * h * _Sum(sta,end,h);

print "import the function 'int_simpson(sta,end,h)' ";
