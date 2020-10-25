#warning "TODO: Review this file for DFP2"

#ifndef __BUS_H__
#define __BUS_H__


typedef struct {
	int       clk;
	uint16_t  d[10];
	int       size;
	char *    name;
	int       debug:1;
} sim165_t;

typedef struct {
	int        bits;
	int        stcp;
	int        shcp;
	uint64_t   sr;
	uint64_t   q;
	uint64_t   mask;
	char     * name;
	uint16_t * var;
} sim595_t;


typedef struct {
	uint8_t    q;
	char     * name;
} sim259_t;

sim165_t * new_sim165(int bits, char *name);

int sim_165(sim165_t * ctx, int nclken, int clk, int nsample,
	    uint16_t * data_in, int cascade_in);

sim595_t * new_sim595(int bits, char *name);

int64_t sim_595(sim595_t * ctx, int nclr, int stcp, int shcp, int noe, int din);

sim259_t * new_sim259(char *name);

uint8_t sim_259(sim259_t * ctx, int nclr, int ng, int addr, int data);

#endif // __BUS_H__

// End of file.
