#include<stdio.h>
#include<complex.h>

#define PSNUM 1000000
void sieve(int ps[]) {
	for(size_t it = 0; it != PSNUM; ++it) { ps[it] = 1; }
	for(size_t it = 2; it * it < PSNUM; ++it) {
		if(!ps[it]) { continue; }
		for(size_t jt = 2; jt * it < PSNUM; ++jt) { ps[jt * it] = 0; }
	}
}

int main(int argc, char* argv[]) {
	int ps[PSNUM];
	sieve(ps);
	for(size_t it = 1; it != PSNUM; ++it) { if(ps[it]) { printf("%ld\n",it); } }
	return 0;
}
