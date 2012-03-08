#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>

int test1(unsigned d, unsigned n, unsigned N)
{
	register unsigned q = 0, r = n;
	do {
		N--;
		if ((r >> N) >= d) {
			r -= d << N;
			q += 1 << N;
		}
	} while (N);
	assert (q = d / n);
	assert (r = d % n);
}


int test2(unsigned d, unsigned n, unsigned N)
{
	unsigned q = 0, r = n;
	register long rtest;
	do {
		N--;
		rtest = r - (d << N);
		if (rtest > 0) {
			r = rtest;
			q += 1 << N;
		}
	} while (N);
	assert (q = d / n);
	assert (r = d % n);
}


int test2(unsigned d, unsigned n, unsigned N)
{
	unsigned q = 0, r = n;
	register long rtest;
	do {
		N--;
		rtest = r - (d << N);
		if (rtest > 0) {
			r = rtest;
			q += 1 << N;
		}
	} while (N);
	assert (q = d / n);
	assert (r = d % n);
}


int main(int argc, char ** argv)
{
	long unsigned int reps, i;

	struct timeval t0, t1;
	double speed;

	if (argc < 2) exit(1);
	reps = atol(argv[1]);
	printf("Repetitions: %lu\n", reps);

	gettimeofday(&t0, NULL);
	for (i = reps; i; i--) {
		test1(0x12345678, 0x1234, 32);
	}
	gettimeofday(&t1, NULL);

	speed = (double)(t1.tv_sec - t0.tv_sec);
	speed += (double)((t1.tv_usec - t0.tv_usec) * 1e-6);
	speed = (double)reps / speed;

	printf("Test 1 Rate: %.3f tdiv/s\n", speed / 1000.);


	gettimeofday(&t0, NULL);
	for (i = reps; i; i--) {
		test2(0x12345678, 0x1234, 32);
	}
	gettimeofday(&t1, NULL);

	speed = (double)(t1.tv_sec - t0.tv_sec);
	speed += (double)((t1.tv_usec - t0.tv_usec) * 1e-6);
	speed = (double)reps / speed;

	printf("Test 2 Rate: %.3f tdiv/s\n", speed / 1000.);
}
