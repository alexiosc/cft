#warning "TODO: Review this file for DFP2"
#ifndef __SIMULATE_H__
#define __SIMULATE_H__


typedef struct {
	uint64_t v;
	int32_t  c;
	int      shift;
} rotor_t;


typedef struct {
	uint16_t pc;
	uint16_t dr;
	uint16_t ac;
	uint16_t ir;
	uint16_t ar;
	uint32_t uvec;

	int64_t  abus;
	int64_t  dbus;
	int64_t  ibus;

	uint16_t ram[65536];

	uint16_t or;
	uint32_t ctl;		// Control out shift register

	uint32_t fn, fz, fv, firq, fl;
	uint32_t wait;

	int ndboe;		// DB drive enable
	int naboe;		// AB drive enable
	int nibusoe;		// IBUS drive enable
	int nctloe;		// Control signal drive enable
	
	int nsample;		// Sample data
	int nvpen;		// Shift reg 1 enable
	int ndeben;		// Shift reg 2 enable
	int nclr;		// Reset shift registers
	int steprun;		// STEP/RUN FSM trigger
	int nustep;		// USTEP FSM trigger
	int orclk;		// Clock output register

	int buspu;		// Bus Pull-up
	int stcp;		// STCP
	int ctlclk;		// Control sreg clock
	int ibusclk;		// IBUS sreg clock
	int abclk;		// AB sreg clock
	int dbclk;		// DB sreg clock

	// Outputs from the 24-bit control shift register
	int nirq1, nirq6, nincpc, nwac, nrpc, nwar, nwir, nwpc;
	int nsafe, nreset, nrsthold, nwen, nfpram, nfpreset;
	int nw, nr, nmem, nio, nhalt, fprun, fpstop;

	int fpclken;
	int fpustep;
	
	// Pulse counters
	rotor_t r_clk;
	rotor_t r_cmd0;
	rotor_t r_cmd1;
	rotor_t r_sample;
	rotor_t r_deben;
	rotor_t r_vpen;
	rotor_t r_orclk;

	rotor_t r_nr, r_nw, r_nmem, r_nio;
	rotor_t r_nirq1, r_nirq6, r_nincpc, r_nwac;
	rotor_t r_nrpc, r_nwar, r_nwir, r_nwpc;

	// The run/stop state machine
	int stepping, ustepping, resetting;
} state_t;



#define SW_2ST        0	// An on/on switch
#define SW_3ST        2	// A three-state switch, ON-OFF-ON
#define SW_MOM        3	// A momentary (ON)-OFF-(ON) switch
#define SW_2MOM       4	// A momentary (ON)-OFF switch

typedef struct {
	int x, y;	// Cursor co-ordinates
	int col;	// Colour
	int st;
	int type; // 0 = ON-ON, 1 = ON-OFF-ON, 2 = (ON)-OFF-(ON), 3 = ON-OFF
	char *tooltip;
} switch_t;


extern switch_t switches[];

typedef struct {
	char * text;
	int    flag;
} menu_t;

#define SFL_PROC    1
#define SFL_FBUSDRV 2
#define SFL_FRESET  4
#define SFL_FCLOCK  8

extern uint32_t flags;

extern menu_t options[];


extern FILE * debugfp;
#define debug(...) fprintf(debugfp, "D: " __VA_ARGS__); fflush(debugfp)
#define error(...) fprintf(debugfp, "E: " __VA_ARGS__); fflush(debugfp)


#endif // __SIMULATE_H__

// End of file.
