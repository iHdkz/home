#include "opbit.h"

void putBin(unsigned int b, int brng, int unum) {
	for( int it = 0; it != brng; ++it) {
		putchar( pickNbit(b, brng - it) ? '1' : '0' );
		if( (it+1) % unum == 0 ) { putchar(' '); }
	}
	putchar('\n');
	return;
}

