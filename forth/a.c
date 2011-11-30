#include <stdio.h>
#include <assert.h>
#include <inttypes.h>

#define SHIFT 32
#define MASK 0xffffffff

// #define SHIFT 16
// #define MASK 0xffff

int main()
{
	int64_t x = 0xf2345678;
	int64_t y = 0xf000f005; //0x000349ff;

	int64_t div, mod, i, tmp;

	div = x;
	mod = 0;

	printf("Calculating %llx / %llx\n", x, y);

	for (i=0; i < SHIFT; i++) {
		// Combine mod and div and roll them together as <mod,div>.
		tmp = ((mod & MASK) << SHIFT) | (div & MASK);
		tmp = tmp << 1;

		// Split tmp into mod and div again (no need in CFT
		// assembly, they're still separate)
		mod = (tmp >> SHIFT) & MASK;
		div = tmp & MASK;

		printf("%2d. div:mod = %08llx:%08llx",
		       i,
		       div, mod);
		int64_t foo = mod - y;
		printf(" %llx - %08llx = %08llx", mod & 0xffffffff, y & 0xffffffff, foo & 0xffffffff);
		printf(" %s\n",
		       mod >= y ? " *** It fits ***" : "");

		// Will it fit?
		//printf("\t mod - y = %08x\n", mod - y);
		if (mod >= y) {
			// It fits. Update the modulo.
			mod = mod - y;
			// And increment the quotient.
			div++;
			printf("\t div is now %08x\n", div);
		}
	}

	printf("Result: div=%lld (0x%llx) mod=%lld (0x%llx)\n", div, div, mod, mod);

	assert((y * div + mod) == x);
	printf("Verifies ok.\n");

	return 0;
}
