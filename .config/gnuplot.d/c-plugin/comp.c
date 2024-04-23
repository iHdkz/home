#include<stdio.h>
#include<complex.h>

int main(void)
{
	double complex c = 1 + 2*I;
	printf("%f+%fi\n", creal(c), cimag(c));
	return 0;
}
