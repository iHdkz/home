#
__N = 50; 
if(exists(ARGC) != 0) __N = @ARG1; print sprintf("__N = %d", __N);
set sample __N;			print sprintf("set sample %d" , __N);
set xrange [0: __N - 1];	print sprintf("set xrange [0:%d]" , __N-1);

