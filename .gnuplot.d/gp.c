#include <stdio.h>
#include <stdlib.h>
#define GP_PATH "/opt/local/bin/gnuplot"

int main(void)
{
	FILE *gp; //gpはプログラム変数
	gp = popen(GP_PATH " -persist", "w");

	fprintf(gp, "plot x*x\n");
	fflush(gp);

	fprintf(gp, "exit\n");

	pclose(gp);
	return 0;
}
