#include<stdio.h>
#include<complex.h>

int main(void)
{
	int n;
	int threadhold = 3000;
	double step = 0.1;

	for(double x = -2.0; x < 2.0; x+=step)
	{
		for(double y = -2.0; y < 2.0; y+=step)
		{
			complex double z = 0;
			complex double c = x+y*I;
			for(n = 0; n < threadhold; ++n)
			{
				if(cabs(z) > 2.0) break;
				z = (z*z) + c;
			}
			printf("%f %f\n",x,y);
		}
		printf("\n");
	}
}
