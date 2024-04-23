#
# Trapezoidal rule.

set macros;

if(ARGC >= 1) { eval "integrand(x) =" . ARG1; }

_t(sta,end,h) = sum [it=1:ceil((end - sta)/h) - 1] integrand(sta + h * it); 
_sum_term(sta,end,h) = integrand(sta) + 2 * _t(sta,end,h) \
		+ integrand(sta + h * ceil((end - sta)/h));
int_trapezoidal(sta,end,h) = 1.0/2 * h * _sum_term(sta,end,h);

print "import the function 'int_trapezoidal(sta,end,h)' ";
