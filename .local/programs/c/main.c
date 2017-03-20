#include <stdio.h>
#include "opbit.h"
#include "lagresp.h"

int main(void)
{
	double complex z = cexp( M_PI * I);
	printf("%f\n",creal(z));
	return 0;
}
