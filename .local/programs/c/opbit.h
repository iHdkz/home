#include <stdio.h>
#include <assert.h>

#define OPBIT_DEBUG_LEVEL 0
#if defined(OPBIT_DEBUG_LEVEL) && OPBIT_DEBUG_LEVEL >= 10
#define check_bit_order(e) do { fputs(__func__, stderr); assert(e); } while(0)
#else
#define check_bit_order(e) do { } while(0)
#endif

#define bit_sizeof(b) sizeof(b)*8
	
#define trim3B(n) ((n) & 0xFFFFFF)
#define trim2B(n) ((n) & 0xFFFF)
#define trim1B(n) ((n) & 0xFF)
#define trim6b(n) ((n) & 0x3F)
#define trim4b(n) ((n) & 0xF)
#define trim2b(n) ((n) & 0x3)

static inline unsigned int toBin4(unsigned int n) {
	return    (n & 0x1)
		+ ((n >> 1) & 0x1) * 10
		+ ((n >> 2) & 0x1) * 100
		+ ((n >> 3) & 0x1) * 1000;
}

static inline
unsigned int to1Byte(unsigned int n) {
	return    toBin4((n >> 4) & 0xF) * 10000
		+ toBin4(n & 0xF);
}

static inline
unsigned int pickNbit(unsigned int b, int n) {
	check_bit_order(n < bit_sizeof(b));
	return (b >> (n-1)) & 0x1;
}

static inline
unsigned int setNbit(unsigned int* b,  int n) {
	check_bit_order(n < bit_sizeof(b));
	(*b) |= 0x1 << n;
	return *b;
}

static inline
unsigned int clrNbit(unsigned int* b, int n) {
	check_bit_order(n < bit_sizeof(b));
	(*b) &= ~(0x1 << n);
	return *b;
}

extern void putBin(unsigned int /*input*/, int /* total bit size */, int /* bit unit size */);
