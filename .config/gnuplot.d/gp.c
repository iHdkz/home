#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	FILE *gp = popen("gnuplot -persist", "w");

	fprintf(gp, "set size square\n");
	for(size_t it = 0; it != 12000; ++it) {
		fprintf(gp, "plot sin(%f *x)\n", (double)it/12000);
		fprintf(gp, "pause 0.01\n");
		fflush(NULL);
	}

	fprintf(gp, "exit\n");
	pclose(gp);
	return 0;
}
