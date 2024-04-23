set sample 50

plot "++" using ($1):($1*$1):(1/sqrt(1+4*$1*$1)):(2*$1/sqrt(1+4*$1*$1)) with vectors
pause -1
