#include "opbit.h"

typedef long int B64unit;

void putBin(unsigned int b, int brng, int unum) {
	for( int it = 0; it != brng; ++it) {
		putchar( pickNbit(b, brng - it) ? '1' : '0' );
		if( (it+1) % unum == 0 ) { putchar(' '); }
	}
	putchar('\n');
	return;
}

static inline
char B64tb(int n) {
	return ("ABCDEFGHIJKLMNOPQRSTUVWXYZ" \
		"abcdefghijklmnopqrstuvwxyz0123456789+/")[align6b(n)];
}

static inline
void encodeB64(B64unit u, int num, FILE *fp) {
	putc( B64tb(u >> 18), fp);
	putc( B64tb(u >> 12), fp);
	if( num == 2 ) { putc('=', fp); putc('=', fp); return; }
	putc( B64tb(u >>  6), fp);
	if( num == 1 ) { putc('=', fp); return; }
	putc( B64tb(u),	      fp);
	return;
}

static inline
B64unit pushc(B64unit u, char c) { return ((u << 8) | align1B(c)); }

void putB64(char c, FILE *fp) {
	static B64unit u;
	static int cnt = 0;

	if( cnt == 0 ) { u = pushc(0, c); }
	else	       { u = pushc(u, c); }

	cnt = (cnt + 1) % 3;
	if( cnt == 0  ) { encodeB64(u, 0, fp); }
	if( c == '\n' ) {
		switch( cnt ) {
			case 1: u = pushc(u,0);
				u = pushc(u,0);
				encodeB64(u, 2, fp);
				cnt = 0;
				break;
			case 2: u = pushc(u,0);
				encodeB64(u, 1, fp);
				cnt = 0;
				break;
		}
	}
	return;
}
