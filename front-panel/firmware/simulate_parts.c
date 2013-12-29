#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include <libgen.h>
#include <assert.h>
#include <ncurses.h>
#include <sys/stat.h>
#include <sys/ioctl.h>

#include "simulate.h"
#include "simulate_parts.h"



///////////////////////////////////////////////////////////////////////////////
//
// SIMULATED PARTS
//
///////////////////////////////////////////////////////////////////////////////

// Simulate an 80-bit parallel in, serial out shift register (10
// 74x165 ICs cascaded together).

sim165_t *
new_sim165(int bits, char *name)
{
	sim165_t * ctx = malloc(sizeof(sim165_t));
	ctx->name = strdup(name);

	assert ((bits % 16) == 0);
	ctx->size = bits / 16;
	ctx->clk = 0;
	ctx->d[0] = 0xffff;
	ctx->d[1] = 0xffff;
	ctx->d[2] = 0xffff;
	ctx->d[3] = 0xffff;
	ctx->d[4] = 0xffff;
	return ctx;
}


int
sim_165(sim165_t * ctx, int nclken, int clk, int nsample, uint16_t * data_in)
{
	assert (ctx != NULL);
	assert (data_in != NULL);
	//static int n = 0;

	//debug("*** 165(%s) size=%d, en=%d, clk=%d, sample=%d\n", ctx->name, ctx->size, nclken, clk, nsample);

	if (nsample == 0) {
		//sleep(1);
		//n = 0;
		//debug("*** 165(%s) sampled!\n", ctx->name);
		for (int i = 0; i < ctx->size; i++) ctx->d[i] = data_in[i];
	}

	if (nclken == 0 && ctx->clk == 0 && clk != 0) {
		//debug("*** 165(%s) shift out! n = %2d, bit = %d\n", ctx->name, ++n, ctx->d[ctx->size - 1] & 0x8000 ? 1 : 0);
		int i;
		for (i = ctx->size - 1; i > 0; i--) {
			ctx->d[i] = ((ctx->d[i-1] & 0x8000 ? 1 : 0) |
				     (ctx->d[i] << 1)) & 0xffff;
		}
		// The serial in of the first register is tied high
		// for diagnostic reasons.
		ctx->d[0] = (1 | (ctx->d[0] << 1)) & 0xffff;
	}

	// Always return the shift register output
	ctx->clk = clk;
	return ctx->d[ctx->size - 1] & 0x8000 ? 1 : 0;
}


// Simulate a 16-bit serial in, parallel out shift register (like two
// 74x595 cascaded).

sim595_t *
new_sim595(int bits, char *name)
{
	sim595_t * ctx = malloc(sizeof(sim595_t));
	ctx->name = strdup(name);

	ctx->bits = bits;
	ctx->stcp = 0;
	ctx->shcp = 0;
	ctx->mask = ((1 << bits) - 1);
	ctx->q = -1 & ctx->mask;
	return ctx;
}


int64_t
sim_595(sim595_t * ctx, int nclr, int stcp, int shcp, int noe, int din)
{
	assert (ctx != NULL);
	assert (ctx->bits > 4);

	
	if (nclr == 0) {
		// Reset
		ctx->sr = 0;
		if (ctx->stcp == 0 && stcp != 0) ctx->q = 0;
	} else {
		// Operation
		if (ctx->stcp == 0 && stcp != 0) {
			//debug("595: STCP clock, q=%lx!\n", ctx->q);
			ctx->q = ctx->sr;
		}
		if (ctx->shcp == 0 && shcp != 0) {
			//debug("595(%s): SHCP clock (din=%d, q=%lx)!\n", ctx->name, din, ctx->q);
			ctx->sr = ((din ? 1 : 0) | (ctx->sr << 1));
			ctx->sr &= ctx->mask;
		}
	}

	ctx->stcp = stcp;
	ctx->shcp = shcp;
	
	// Tri-state outputs?
	//debug("595(%s): c=%d, t=%d, h=%d, oe=%d, din=%d, q=%lx\n", ctx->name, nclr, stcp, shcp, noe, din, ctx->q);

	if (noe == 0) return ctx->q;
	else return -1;
}

// Simulate an 8-bit addressable latch (74x259).

sim259_t *
new_sim259(char *name)
{
	sim259_t * ctx = malloc(sizeof(sim259_t));
	ctx->name = strdup(name);

	ctx->q = 0;
	return ctx;
}


uint8_t
sim_259(sim259_t * ctx, int nclr, int ng, int addr, int data)
{
	assert (ctx != 0);
	assert (addr >= 0 && addr < 8);
	data = data ? 1 : 0;

	if (nclr == 0) ctx->q = 0;
	if (ng == 0) {
		if (data) ctx->q |= (1 << addr);
		else ctx->q &= ~(1 << addr);
		//debug("259(%s): nclr=%d, ng=%d, addr=%d, data=%d => q=%x\n", ctx->name, nclr, ng, addr, data, ctx->q);
	}
	return ctx->q;
}


// End of file.
