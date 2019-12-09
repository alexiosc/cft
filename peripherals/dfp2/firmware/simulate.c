/*
	simduino.c

	Copyright 2008, 2009 Michel Pollet <buserror@gmail.com>

 	This file is part of simavr.

	simavr is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	simavr is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with simavr.  If not, see <http://www.gnu.org/licenses/>.
 */

#warning "TODO: Review this file for DFP2"

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include <libgen.h>
#include <assert.h>
#include <pthread.h>
#include <ncurses.h>
#include <sys/stat.h>
#include <sys/ioctl.h>

#include <sim_avr.h>
#include <avr_ioport.h>
#include <sim_elf.h>
#include <sim_hex.h>
#include <sim_gdb.h>
#include <uart_pty.h>
#include <sim_vcd_file.h>
#include <sim_irq.h>

#include "simulate.h"
#include "simulate_parts.h"


FILE *     debugfp;
pthread_t  simthread;
char *     progname;
uart_pty_t uart_pty;
avr_t *    avr = NULL;
avr_vcd_t  vcd_file;
float      pixsize = 64;
int        window;
uint32_t   flags = SFL_PROC;


#define UP(n) (switches[n].st == 1)
#define DN(n) (switches[n].st == -1)
#define OP(n) (switches[n].st != 0)


///////////////////////////////////////////////////////////////////////////////
//
// SIMULATED SYSTEM STATE
//
///////////////////////////////////////////////////////////////////////////////

static state_t state;
static sim165_t * ireg_deb;	// 80 bits
static sim165_t * ireg_vp;	// 80 bits

static sim259_t * latch0;	// 8 bits
static sim259_t * latch1;	// 8 bits

static sim595_t * oreg_dbus;	// 16 bits
static sim595_t * oreg_abus;	// 16 bits
static sim595_t * oreg_ibus;	// 16 bits
static sim595_t * oreg_ctl;	// 24 bits
static sim595_t * oreg_or;	// 16 bits

static void
init_board()
{
	ireg_deb = new_sim165(80, "deb");
	ireg_vp = new_sim165(80, "vp");
	//ireg_vp->debug = 1;

	latch0 = new_sim259("latch0");
	latch1 = new_sim259("latch1");
	
	oreg_dbus = new_sim595(16, "dbus");
	oreg_abus = new_sim595(16, "abus");
	oreg_ibus = new_sim595(16, "ibus");
	oreg_ctl = new_sim595(24, "ctl");
	oreg_or = new_sim595(16, "or");

	// Pull up some signals
	state.ndboe = 1;
	state.naboe = 1;
	state.nibusoe = 1;
	state.nctloe = 1;
	state.nustep = 1;
	state.fpclken = 1;

	// Configure the rotors
	state.r_clk.shift = 4;
	state.r_orclk.shift = 5;
	state.r_sample.shift = 2;
	state.r_deben.shift = 2;
	state.r_vpen.shift = 2;
	state.r_nr.shift = 1;
	state.r_nw.shift = 1;
	state.r_nmem.shift = 1;
	state.r_nio.shift = 1;
	state.r_nirq1.shift = 1;
	state.r_nirq6.shift = 1;
	state.r_nincpc.shift = 1;
	state.r_nwac.shift = 1;
	state.r_nrpc.shift = 1;
	state.r_nwar.shift = 1;
	state.r_nwir.shift = 1;
	state.r_nwpc.shift = 1;

	// State
	state.stepping = 0;
	state.ustepping = 0;
	state.resetting = 0;
	state.wait = 1;
}


///////////////////////////////////////////////////////////////////////////////
//
// SIMULATED WIRING TO THE CFT
//
///////////////////////////////////////////////////////////////////////////////

/*
static int
sim_vps_reg(int nclken, int clk, int nsample)
{
	static int clk0 = 0;
	static uint16_t q[5] = { -1, -1, -1, -1, -1 };
	if (nsample == 0) {
		q[0] = state.ac;
		q[1] = state.pc;
		q[2] = state.ir;
		q[3] = state.uvec & 0xffff;
		q[4] = ((state.uvec >> 16) & 0xff) | 0x60; // bits 5 & 6 always high
		if (state.fn) q[4] |= 0x100;
		if (state.fz) q[4] |= 0x200;
		if (state.fv) q[4] |= 0x400;
		if (state.firq) q[4] |= 0x800;
		if (state.fz) q[4] |= 0x1000;
		if (state.wait) q[4] |= 0x2000; // WAIT#
		if (state.uvec & 0x400) q[4] |= 0x4000; // WEN#
		if (state.uvec & 0x200) q[4] |= 0x8000;      // R

		clk0 = clk;
		return q[4] & 0x8000 ? 1 : 0;
	}
	
	// clock disabled
	if (nclken == 1) {
		clk0 = clk;
		return q[4] & 0x8000 ? 1 : 0;
	}

	// L-to-H transition: shift data!
	if (clk0 == 0 && clk == 1) {
		int res;

		res =    q[4] & 0x8000 ? 1 : 0;
		q[4] = ((q[3] & 0x8000 ? 1 : 0) | (q[4] << 1)) & 0xffff;
		q[3] = ((q[2] & 0x8000 ? 1 : 0) | (q[3] << 1)) & 0xffff;
		q[2] = ((q[1] & 0x8000 ? 1 : 0) | (q[2] << 1)) & 0xffff;
		q[1] = ((q[0] & 0x8000 ? 1 : 0) | (q[1] << 1)) & 0xffff;
		q[0] = (                 1      | (q[0] << 1)) & 0xffff;
		
		clk0 = clk;
		return res;
	}
	
	return q[4] & 0x8000 ? 1 : 0;
}
*/

// Simulate the 80-bit Debugging shift register.

/*
static int
sim_deb_reg(int nclken, int clk, int nsample)
{
	static int clk0 = 0;
	static uint16_t q[5] = { -1, -1, -1, -1, -1 };
	if (nsample == 0) {
		int i;
		q[0] = q[1] = q[2] = q[3] = q[4] = 0;

		if (UP(30))         q[4] |= 0x0001; // SWLOCK (active high)
		if (UP(0) || DN(0)) q[4] |= 0x0002; // SWRESET# (active low)
		if (DN(1))          q[4] |= 0x0004; // SWSTOP# (active low)
		if (DN(0) || UP(1)) q[4] |= 0x0008; // SWRUN# (active low)
		if (DN(2))          q[4] |= 0x0010; // SWSTEP# (active low)
		else if (UP(2))     q[4] |= 0x0020; // SWUSTEP# (active low)
		if (DN(3))          q[4] |= 0x0040; // SWSLOW# (active low)
		else if (UP(3))     q[4] |= 0x0080; // SWFAST# (active low)

		// Get the lower 8 bits of the DIP switches.
		// Switches 14-21 -> q[4]bits 15-8.
		for(i = 0; i < 8; i++) if (UP(14 + i)) q[4] |= (1 << (15 - i));
		
		// Copy the SR: switches 6-21 -> q[3] bits 15-0.
		for(i = 0; i < 16; i++) if (UP(6 + i)) q[3] |= (1 << (15 - i));
		
		// The right switch bank (q[2])
		if (DN(22))         q[2] |= 0x0001; // SWLDADDR# (active low)
		else if (UP(22))    q[2] |= 0x0002; // SWLDIR# (active low)
		if (DN(23))         q[2] |= 0x0004; // SWLDAC# (active low)
		else if (UP(23))    q[2] |= 0x0008; // SWSPARE# (active low)
		if (OP(24))         q[2] |= 0x0010; // SWMEMW# (active low)
		if (DN(24))         q[2] |= 0x0020; // SWINC# (active low)
		if (OP(25))         q[2] |= 0x0040; // SWMEMR# (active low)
		if (DN(25))         q[2] |= 0x0020; // SWINC# (active low)
		if (OP(26))         q[2] |= 0x0080; // SWIOW# (active low)
		if (DN(26))         q[2] |= 0x0020; // SWINC# (active low)
		if (OP(27))         q[2] |= 0x0100; // SWIOR# (active low)
		if (DN(27))         q[2] |= 0x0020; // SWINC# (active low)
		if (UP(28))         q[2] |= 0x0200; // SWRAM# (active low)
		if (UP(29))         q[2] |= 0x0400; // SWIRF6# (active low)
		else if (DN(29))    q[2] |= 0x0800; // SWIFR1# (active low)

		// Get the upper 4 bits of the DIP switches.
		// Switches 31-34 -> q[2]bits 15-12.
		for(i = 0; i < 4; i++) if (UP(31 + i)) q[2] |= (1 << (15 - i));

		// The special switches
		if (OP(59))

		// These are on board 2.
		q[1] = state.dbus;
		q[0] = state.abus;
							 

		clk0 = clk;
		return q[4] & 0x8000 ? 1 : 0;
	}
	
	// clock disabled
	if (nclken == 1) {
		clk0 = clk;
		return q[4] & 0x8000 ? 1 : 0;
	}

	// L-to-H transition: shift data!
	if (clk0 == 0 && clk == 1) {
		int res;

		res =    q[4] & 0x8000 ? 1 : 0;
		q[4] = ((q[3] & 0x8000 ? 1 : 0) | (q[4] << 1)) & 0xffff;
		q[3] = ((q[2] & 0x8000 ? 1 : 0) | (q[3] << 1)) & 0xffff;
		q[2] = ((q[1] & 0x8000 ? 1 : 0) | (q[2] << 1)) & 0xffff;
		q[1] = ((q[0] & 0x8000 ? 1 : 0) | (q[1] << 1)) & 0xffff;
		q[0] = (                 1      | (q[0] << 1)) & 0xffff;
		
		clk0 = clk;
		return res;
	}
	
	return q[4] & 0x8000 ? 1 : 0;
}
*/


///////////////////////////////////////////////////////////////////////////////
//
// AVR CORE SIMULATION FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////


/*
 * called when the AVR change any of the pins on port B
 * so lets update our buffer
 */

pthread_mutex_t  changes_mutex;
uint32_t clk = 0;
uint32_t         disp_changes = 0;
uint32_t         pin_changes = 0;
uint8_t          pin_state[7] = {0, 0, 0, 0, 0, 0, 0};
uint32_t nnn = 0;

void pin_changed_hook(struct avr_irq_t * irq, uint32_t value, void * param)
{
	// Param holds the port (lowest 3 bits) and pin number (upper
	// three bits).
	int portpin = (int)param;
	pin_changes++;
	if (value) {
		pin_state[(uint64_t)portpin & 3] |= (1 << (portpin >> 3));
	} else {
		pin_state[(uint64_t)portpin & 3] &= ~(1 << (portpin >> 3));
	}
	return;
	//printf("CHANGE: %02o value=%d, irq=%d\n", portpin, value, irq->irq);

	putchar('\n');
	for (int port = 0; port < 8; port++) {
		printf("%c: %c%c%c%c%c%c%c%c  ",
		       port + 'A',
		       pin_state[port] & 0x80 ? '1' : '0',
		       pin_state[port] & 0x40 ? '1' : '0',
		       pin_state[port] & 0x20 ? '1' : '0',
		       pin_state[port] & 0x10 ? '1' : '0',
		       pin_state[port] & 0x08 ? '1' : '0',
		       pin_state[port] & 0x04 ? '1' : '0',
		       pin_state[port] & 0x02 ? '1' : '0',
		       pin_state[port] & 0x01 ? '1' : '0');
	}
}


void keyCB(unsigned char key, int x, int y)	/* called on key press */
{
	// if (key == 'q')
	// 	exit(0);
	// //static uint8_t buf[64];
	// switch (key) {
	// 	case 'q':
	// 	case 0x1f: // escape
	// 		exit(0);
	// 		break;
	// 	case ' ':
	// 		do_button_press++; // pass the message to the AVR thread
	// 		break;
	// 	case 'r':
	// 		printf("Starting VCD trace\n");
	// 		avr_vcd_start(&vcd_file);
	// 		break;
	// 	case 's':
	// 		printf("Stopping VCD trace\n");
	// 		avr_vcd_stop(&vcd_file);
	// 		break;
	// }
}

// gl timer. if the pin have changed states, refresh display
void timerCB(int i)
{
	// static uint8_t oldstate = 0xff;
	// if (oldstate != pin_state) {
	// 	oldstate = pin_state;
	// 	// Do some work here.
	// }
}


void
do_rotor(rotor_t * r, int v)
{
	assert (r != NULL);
	if (r->v != v) {
		r->v = v;
		r->c++;
	}
}


#define PB 0
#define PC 1
#define PD 2
#define BOOL(n) ((n) != 0)

#define if_not_z(var, val)				\
	{						\
		int64_t x = (int64_t)val;		\
		var = x >= 0? x : 0xffff;		\
	}

#define bushold(var, val)				\
	{						\
		int64_t x = (int64_t)val;		\
		if (flags & SFL_PROC) {			\
			if (x >= 0) var = x;		\
		} else var = x >= 0? x : -1;		\
	}

#define sanity_ibus_driven(field, name)					\
	if (state.field == 0 &&						\
	    state.nibusoe != 0 &&					\
	    state.nmem != 0 &&						\
	    state.nio != 0)						\
		error(name " asserted with IBUS not driven by any unit.\n");

#define sanity_exclusive(s1, n1, s2, n2)				\
	if (state.s1 == 0 && state.s2 == 0)				\
		error(n1 " and " n2 " asserted simultaneously!\n");
	

static inline void
sanity_checks()
{
	// Check for strobes with undriven IBUS
	sanity_ibus_driven(nwir, "WIR#");
	sanity_ibus_driven(nwar, "WAR#");
	sanity_ibus_driven(nwac, "WAC#");
	sanity_ibus_driven(nwpc, "WPC#");
	sanity_ibus_driven(nw, "W#");

	if (state.nr == 0 && state.nmem != 0 && state.nio != 0)
		error("R# asserted without MEM# or IO#.\n");
	if (state.nw == 0 && state.nmem != 0 && state.nio != 0)
		error("W# asserted without MEM# or IO#.\n");

	sanity_exclusive(nr, "R#", nrpc, "RPC#");
	sanity_exclusive(nr, "R#", nw, "W#");
	sanity_exclusive(nmem, "MEM#", nio, "IO#");

	if (state.nr == 0) debug("R#\n");
}

static inline void
side_effects()
{
	if (state.nwir == 0) state.ir = state.ibus;
	if (state.nwar == 0) state.ar = state.ibus;
	if (state.nwac == 0) state.ac = state.ibus;
	if (state.nwpc == 0) state.pc = state.ibus;

	if (flags & SFL_PROC) {
		if (state.nmem == 0) {
			if (state.nr == 0) {
				state.abus = state.ar;
				state.ibus = state.dbus = state.ram[state.ar];
				//debug("R (AR=%04x, IBUS=%04x)!\n", state.ar, state.ibus);
			}
			if (state.nw == 0) {
				state.abus = state.ar;
				state.dbus = state.ibus;
				state.ram[state.ar] = state.ibus;
				//debug("W (AR=%04x, IBUS=%04x)!\n", state.ar, state.ibus);
			}
		}

		// I/O space reads (writes not simulated)
		if (state.nio == 0 && state.nr == 0) {
			state.abus = state.ar;
			state.ibus = state.dbus = rand() & 0xffff;
		}
	} else {
		if (state.nmem == 0 && state.nr == 0) {
			state.dbus = state.ram[state.abus];
			//debug("R (ABUS=%04x, DBUS=%04x)!\n", state.abus, state.dbus);
		}
		if (state.nmem == 0 && state.nw == 0) {
			//debug("W (abus=%04x)!\n", state.abus);
			state.ram[state.abus] = state.dbus;
		}
		// I/O space reads (writes not simulated)
		if (state.nio == 0 && state.nr == 0)
			state.dbus = rand() & 0xffff;
	}

	//if (state.nio == 0 && state.nw == 0)
}

static inline void
act_on_changes()
{
	int iclk = pin_state[PC] & 0x04;    // PC2
	int dout = pin_state[PC] & 0x08;    // PC3
	int cmd0 = pin_state[PC] & 0x10;    // PC4
	int cmd1 = pin_state[PC] & 0x20;    // PC5

	state.ndboe = pin_state[PD] & 0x08;   // PD3
	state.naboe = pin_state[PD] & 0x10;   // PD4
	state.nibusoe = pin_state[PD] & 0x20; // PD5
	state.nctloe = pin_state[PD] & 0x40;  // PD6	

	int cout = pin_state[PD] & 0x80;    // PD7

	int ioaddr = (pin_state[PB] >> 3) & 7; // PB3, PB4, PB5
	
	state.fpustep = pin_state[0] & 2 ? 1 : 0;
	state.fpclken = pin_state[0] & 4 ? 1 : 0;

	// Latch commands
	uint8_t out0 = sim_259(latch0, state.nclr, cmd0, ioaddr, cout);
	uint8_t out1 = sim_259(latch1, state.nclr, cmd1, ioaddr, cout);

	state.nsample =  !BOOL(out0 & 0x01);
	state.nvpen =    !BOOL(out0 & 0x02);
	state.ndeben =   !BOOL(out0 & 0x04);
	state.nclr =     !BOOL(out0 & 0x10);
	state.steprun =  !BOOL(out0 & 0x20);
	state.nustep =   !BOOL(out0 & 0x40);
	state.orclk =     BOOL(out0 & 0x80);

	state.dbclk =     BOOL(out1 & 0x01);
	state.abclk =     BOOL(out1 & 0x02);
	state.ibusclk =   BOOL(out1 & 0x04);
	state.ctlclk =    BOOL(out1 & 0x08);
	state.stcp =      BOOL(out1 & 0x20);
	state.buspu =    !BOOL(out1 & 0x80);

	// Output shift registers
	bushold(state.dbus, sim_595(oreg_dbus, state.nclr, state.stcp, state.dbclk, state.ndboe, dout));
	bushold(state.abus, sim_595(oreg_abus, state.nclr, state.stcp, state.abclk, state.naboe, dout));
	bushold(state.ibus, sim_595(oreg_ibus, state.nclr, state.stcp, state.ibusclk, state.nibusoe, dout));
	if_not_z(state.or, sim_595(oreg_or, state.nclr, state.stcp, state.orclk, 0, dout));
	if_not_z(state.ctl, sim_595(oreg_ctl, state.nclr, state.stcp, state.ctlclk, state.nctloe, dout));
	//if(state.naboe == 0) debug("AB: %04x\n", state.abus);
	//if(state.nw == 0) debug("AB: %04x, DB: %04x\n", state.abus, state.dbus);

	// Read output data from the shift registers
#define ctl_sig(x) state.nctloe == 0 ? x : -1
	state.nirq1 =  ctl_sig(state.ctl & 0x000001);
	state.nirq6 =  ctl_sig(state.ctl & 0x000002);
	state.nincpc = ctl_sig(state.ctl & 0x000004);
	state.nwac =   ctl_sig(state.ctl & 0x000008);
	state.nrpc =   ctl_sig(state.ctl & 0x000010);
	state.nwar =   ctl_sig(state.ctl & 0x000020);
	state.nwir =   ctl_sig(state.ctl & 0x000040);
	state.nwpc =   ctl_sig(state.ctl & 0x000080);

	state.nsafe =    ctl_sig(state.ctl & 0x000100);
	state.nreset =   ctl_sig(state.ctl & 0x000200);
	state.nrsthold = ctl_sig(state.ctl & 0x000400);
	state.nwen =     ctl_sig(state.ctl & 0x002000);
	state.nfpram =   ctl_sig(state.ctl & 0x004000);
	state.nfpreset = ctl_sig(state.ctl & 0x008000);

	state.nw =       ctl_sig(state.ctl & 0x010000);
	state.nr =       ctl_sig(state.ctl & 0x020000);
	state.nmem =     ctl_sig(state.ctl & 0x040000);
	state.nio =      ctl_sig(state.ctl & 0x080000);
	state.nhalt =    ctl_sig(state.ctl & 0x100000);
	state.fprun =    ctl_sig(state.ctl & 0x200000);
	state.fpstop =   ctl_sig(state.ctl & 0x400000);

	// Side effects (register assignments etc)
	side_effects();


	// Encode data for the input shift registers.
	uint16_t q[5];
	int i;

	memset(q, 0xff, sizeof(q));
	
	// Note: all front panel switches are active low and pulled up.
	q[0] = 0xffff;
	if (UP(30))         q[0] &= ~0x0001; // SWLOCK (active high)
	if (UP(0) || DN(0)) q[0] &= ~0x0002; // SWRESET# (active low)
	if (DN(1))          q[0] &= ~0x0004; // SWSTOP# (active low)
	if (DN(0) || UP(1)) q[0] &= ~0x0008; // SWRUN# (active low)
	if (DN(2))          q[0] &= ~0x0010; // SWSTEP# (active low)
	else if (UP(2))     q[0] &= ~0x0020; // SWUSTEP# (active low)
	if (DN(3))          q[0] &= ~0x0040; // SWSLOW# (active low)
	else if (UP(3))     q[0] &= ~0x0080; // SWFAST# (active low)

	// Get the lower 8 bits of the DIP switches.
	// Switches 35-42 -> q[4]bits 15-8.
	for(i = 0; i < 8; i++) if (DN(35 + i)) q[0] &= ~(1 << (15 - i));
		
	// Copy the SR: switches 6-21 -> q[3] bits 15-0.
	for(i = 0; i < 16; i++) if (DN(6 + i)) q[1] &= ~(1 << (15 - i));
		
	// The right switch bank (q[2])
	if (DN(22))         q[2] &= ~0x0001; // SWLDADDR# (active low)
	else if (UP(22))    q[2] &= ~0x0002; // SWLDIR# (active low)
	if (DN(23))         q[2] &= ~0x0004; // SWLDAC# (active low)
	else if (UP(23))    q[2] &= ~0x0008; // SWSPARE# (active low)
	if (OP(24))         q[2] &= ~0x0010; // SWMEMW# (active low)
	if (DN(24))         q[2] &= ~0x0020; // SWINC# (active low)
	if (OP(25))         q[2] &= ~0x0040; // SWMEMR# (active low)
	if (DN(25))         q[2] &= ~0x0020; // SWINC# (active low)
	if (OP(26))         q[2] &= ~0x0080; // SWIOW# (active low)
	if (DN(26))         q[2] &= ~0x0020; // SWINC# (active low)
	if (OP(27))         q[2] &= ~0x0100; // SWIOR# (active low)
	if (DN(27))         q[2] &= ~0x0020; // SWINC# (active low)
	if (UP(28))         q[2] &= ~0x0200; // SWRAM# (active low)
	if (UP(29))         q[2] &= ~0x0400; // SWIRF6# (active low)
	else if (DN(29))    q[2] &= ~0x0800; // SWIFR1# (active low)
		
	// Get the upper 4 bits of the DIP switches.
	// Switches 31-34 -> q[2]bits 15-12.
	for(i = 0; i < 4; i++) if (DN(31 + i)) q[2] &= ~(1 << (15 - i));

	// Special (cyan) switches
	if (UP(62)) {
		// Reset the DFP MCU.
		avr_reset(avr);
	}

	// These are on board 2.
	q[3] = state.dbus;
	q[4] = state.abus;
	//debug("FOO: %04x\n", q[3]);

	// Update the value of the PC0 (DIN) pin.
	int d = sim_165(ireg_deb, state.ndeben, iclk, state.nsample, q,
			pin_state[PB] & 8 ? 1 : 0);
	avr_raise_irq(avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 0), d);

	// Run sanity checks on the update state
	sanity_checks();


	///////////////////////////////////////////////////////////////////////////////

	memset(q, 0, sizeof(q));
	q[0] = state.ac;
	q[1] = state.pc;
	q[2] = state.ir;
	q[3] = state.uvec & 0xffff;
	q[4] = ((state.uvec >> 16) & 0xff) | 0x60; // bits 5 & 6 always high
	if (state.fn) q[4] |= 0x100;
	if (state.fz) q[4] |= 0x200;
	if (state.fv) q[4] |= 0x400;
	if (state.firq) q[4] |= 0x800;
	if (state.fz) q[4] |= 0x1000;
	if (state.wait) q[4] |= 0x2000; // WAIT#
	if (state.uvec & 0x400) q[4] |= 0x4000; // WEN#
	if (state.uvec & 0x200) q[4] |= 0x8000; // R#
	
	d = sim_165(ireg_vp, state.nvpen, iclk, state.nsample, q,
		    pin_state[PB] & 8 ? 1 : 0);

	// Update the value of the PC1 (VPIN) pin.
	avr_raise_irq(avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 1), d);

	// Rotors
	do_rotor(&state.r_clk, pin_state[0] & 2);
	do_rotor(&state.r_orclk, state.orclk);
	do_rotor(&state.r_sample, state.nsample);
	do_rotor(&state.r_deben, state.ndeben);
	do_rotor(&state.r_vpen, state.nvpen);

	do_rotor(&state.r_nr, state.nr);
	do_rotor(&state.r_nw, state.nw);
	do_rotor(&state.r_nmem, state.nmem);
	do_rotor(&state.r_nio, state.nio);

	do_rotor(&state.r_nirq1, state.nirq1);
	do_rotor(&state.r_nirq6, state.nirq6);
	do_rotor(&state.r_nincpc, state.nincpc);
	do_rotor(&state.r_nwac, state.nwac);
	do_rotor(&state.r_nrpc, state.nrpc);
	do_rotor(&state.r_nwar, state.nwar);
	do_rotor(&state.r_nwir, state.nwir);
	do_rotor(&state.r_nwpc, state.nwpc);

	disp_changes++;
}


static inline int
proc_random_run()
{
	static int cpu_state = 0;
	//debug("Random run\n");

	cpu_state = (cpu_state + 1) & 3;

	state.uvec = 0x7ff800 | (rand() % 0xffffff);

	if (cpu_state == 0) state.ar = state.pc++;
	else if (cpu_state == 1) state.ir = rand() % 0xffff;
	else if (cpu_state == 2 && (rand() & 3) == 1) state.ac = rand() % 0xffff;

	return cpu_state;
}


static void
proc_tick()
{
	static int old_ustep = 0;
	static int rsthold_ctr = 0;
	static uint64_t tick = 0;

	// No processor? Bail out
	if ((flags & SFL_PROC) == 0) return;

	tick++;

	// Simulate effect of the CLR# signal on the FSM.
	if (state.nclr == 0) {
		state.ustepping = 0;
		state.stepping = 0;
		state.resetting = 0;
		state.wait = 1;
		return;
	}
	

	// Simulate stopped and slow clocks, and the run/stop state machine
	if (state.ustepping == 0 && state.nustep == 0) debug("ustep, fpclken=%d\n", state.fpclken);
	if (state.stepping == 0 && state.steprun == 0) debug("step, fpclken=%d\n", state.fpclken);

	//state.ustepping = 0;
	//if (state.fpclken && state.stepping > 0) state.stepping--;

	if (state.steprun == 0) state.stepping = 4;
	if (state.nustep == 0) state.ustepping = 1;

	state.wait = state.stepping || state.ustepping || state.resetting ? 0 : 1;

	// Simulate reset
	if (state.nreset == 0 || state.nfpreset == 0) {
		//if ((tick % 100) == 0) debug("Reset\n");
		rsthold_ctr = 0;
		state.resetting = 1;
		return;
	}

	// FSM Truth table:

	// resetting  ustepping  stepping  clken  ustep-in  notes
	// ---------------------------------------------------------------------------------
	//     0          0          0       0        0       Clock stopped
	//     1          X          X       Z        Z       PB1 pull ups select full speed
	//     0          X          1       ?        ?       Clock enabled (DFP has control)
	//     0          1          X       ?        ?       Clock enabled (DFP has control)

	// The clock is stopped: no tick.
	if (state.stepping == 0 && state.ustepping == 0 &&
	    state.resetting == 0) return;

	// The DFP has control of the clock, a slow clock is selected,
	// and there's no edge yet: no tick.
	if (state.resetting == 0 && state.fpclken == 0 &&
	    old_ustep == state.fpustep) return;
	old_ustep = state.fpustep;

	//if (state.steprun && state.stepping) debug("step 2A, stepping=%d\n", state.stepping);
	//if (state.resetting == 0 && state.ustepping) debug("ustep 2A, fpclken=%d\n", state.fpclken);

	// Th DFP has control of the clock, a slow clock is seleced,
	// and it's a falling edge: no tick.
	if (state.resetting == 0 && state.fpclken == 0
	    && state.fpustep == 0) return;

	//if (state.steprun && state.stepping) debug("step 3A, stepping=%d\n", state.stepping);
	//if (state.resetting == 0 && state.ustepping) debug("ustep 3A\n");

	// Simulate reset hold
	if (rsthold_ctr < 255) {
		rsthold_ctr++;
		state.pc = 0xfff8;
		state.ir = 0xfff8;
		state.ac = 0xfff8;
		debug("Reset Hold %d\n", rsthold_ctr);
		state.uvec = 0x7ff800;
		return;
	} else if (rsthold_ctr == 255) {
		rsthold_ctr++;
		state.nrsthold = 1;
		state.resetting = 0;	// Disable the reset state machine
		state.uvec = 0x7ff800;
		debug("End of reset Hold\n");
	}

	// Simulate halting
	if (state.nhalt == 0) return;

	// Simulate the CPU running.
	proc_random_run();
	
	state.ustepping = 0;
	if (state.stepping > 0) state.stepping--;
}



static void *
avr_run_thread(void * param)
{
	sleep(1);
	printf("\nStarting simulation.\n");
	int avr_tick = 0;
	while (1) {
		int avr_state = avr_run(avr);
		if (avr_state == cpu_Done || avr_state == cpu_Crashed) break;
		if (pin_changes) {
			pthread_mutex_lock(&changes_mutex);
			pin_changes = 0;
			#warning "TODO: reinstate this!"
			//act_on_changes();
		}
		
		// Should we run the CFT processor? Normally, it runs once
		// every 3.5 AVR clocks. (4.213 MHz, but close enough). We
		// diffuse the error from integer division by clocking the
		// processor {0,0,0,1,0,0,1} pattern per AVR clock modulo 7.

		avr_tick = (avr_tick + 1) % 7;
		if (avr_tick == 3 || avr_tick == 6) proc_tick();

		pthread_mutex_unlock(&changes_mutex);
	}
	return NULL;
}


 
char avr_flash_path[1024];
int avr_flash_fd = 0;

// avr special flash initalization
void
avr_special_init(avr_t * avr)
{
	printf("*** SUCCESS\n");
        // // here: load a flash image
	// // open the file
	// avr_flash_fd = open(avr_flash_path, O_RDWR|O_CREAT, 0644);
	// if (avr_flash_fd < 0) {
	// 	perror(avr_flash_path);
	// 	exit(1);
	// }
	// // resize and map the file the file
	// if (ftruncate(avr_flash_fd, avr->flashend + 1) != 0) {
	// 	perror("ftruncate");
	// 	exit(1);
	// }
	// ssize_t r = read(avr_flash_fd, avr->flash, avr->flashend + 1);
	// if (r != avr->flashend + 1) {
	// 	fprintf(stderr, "unable to load flash memory\n");
	// 	perror(avr_flash_path);
	// 	exit(1);
	// }
}

// avr special flash deinitalization
//void avr_special_deinit(avr_t* avr)
void
avr_special_deinit(avr_t * avr, void * data)
{
        // // here: cleanup the persistent storage
	// puts(__func__);
	// lseek(avr_flash_fd, SEEK_SET, 0);
	// ssize_t r = write(avr_flash_fd, avr->flash, avr->flashend + 1);
	// if (r != avr->flashend + 1) {
	// 	fprintf(stderr, "unable to load flash memory\n");
	// 	perror(avr_flash_path);
	// }
	// close(avr_flash_fd);
	uart_pty_stop(&uart_pty);
}


///////////////////////////////////////////////////////////////////////////////
//
// CURSES INTERFACE
//
///////////////////////////////////////////////////////////////////////////////

void
handle_winch(int sig)
{
	endwin();
	refresh();
	clear();
}


#define fg(n) attrset(COLOR_PAIR(n))
#define bfg(n) attrset(A_BOLD | COLOR_PAIR(n))


int      tab     = 0;
int      mpos    = 0;
int      mposmax = 0;
int      spos    = 0;
int      sposmax = 0;


// 3 run control switches,
// 3 clock/panel switches
// 16 switch register switches
// 8 programming switches
// 1 Lock switch
// 12 DIP switches

menu_t options[] = {
	{"Processor present (bus hold and bus chatter)", SFL_PROC},
	{"Bus faults (extraneous bus chatter)", SFL_FBUSDRV},
	{"Reset faults (FP inputs ignored)", SFL_FRESET},
	{"Clock generator faults (FP inputs ignored)", SFL_FCLOCK},
	{NULL, 0}
};

switch_t switches[] = {
	{3, 2, 1, 0, SW_MOM,  "Reset / Start"}, // 0
	{6, 2, 1, 0, SW_MOM,  "Run / Stop"},	// 1
	{9, 2, 1, 0, SW_MOM,  "Microstep / Step"}, // 2

	{15, 2, 3, 1, SW_3ST, "Fast / Slow / Creep"}, // 3
	{18, 2, 3, 0, SW_2ST, "Lights on / off (ignored)"}, // 4
	{21, 2, 3, 0, SW_3ST, "MDF: Output Register / Data Register / micro-Address"}, // 5
	
	{27 + 0 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 15 on / off"}, // 6
	{27 + 1 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 14 on / off"}, // 7
	{27 + 2 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 13 on / off"}, // 8
	{27 + 3 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 12 on / off"}, // 9
	{27 + 4 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 11 on / off"}, // 10
	{27 + 5 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 10 on / off"}, // 11
	{27 + 6 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 9 on / off"},  // 12
	{27 + 7 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 8 on / off"}, // 13
	{27 + 8 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 7 on / off"}, // 14
	{27 + 9 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 6 on / off"}, // 15
	{27 + 10 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 5 on / off"}, // 16
	{27 + 11 * 3, 2, 1, 0, SW_2ST, "Switch Register bit 4 on / off"}, // 17
	{27 + 12 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 3 on / off"}, // 18
	{27 + 13 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 2 on / off"}, // 19
	{27 + 14 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 1 on / off"}, // 20
	{27 + 15 * 3, 2, 3, 0, SW_2ST, "Switch Register bit 0 on / off"}, // 21

	{78, 2, 1, 0, SW_MOM, "Set IR / Set PC"},                  // 22
	{81, 2, 1, 0, SW_MOM, "Set AC"},	                   // 23
	{84, 2, 3, 0, SW_MOM, "Memory Write / Memory Write Next"}, // 24
	{87, 2, 3, 0, SW_MOM, "Memory Read / Memory Read Next"},   // 25
	{90, 2, 1, 0, SW_MOM, "I/O Write / I/O Write Next"},	   // 26
	{93, 2, 1, 0, SW_MOM, "I/O Read / I/O Read Next"},	   // 27
	{96, 2, 3, 1, SW_2ST, "RAM / ROM"},			   // 28
	{99, 2, 3, 0, SW_MOM, "IFR1 / IFR6"},			   // 29

	{3, 7, 7,  0, SW_2ST, "Panel Lock on / off"},              // 30
	
	{15 + 0 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 11 on / off"}, // 31
	{15 + 1 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 10 on / off"}, // 32
	{15 + 2 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 9 on / off"}, // 33
	{15 + 3 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 8 on / off"}, // 34
	{15 + 4 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 7 on / off"}, // 35
	{15 + 5 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 6 on / off"}, // 36
	{15 + 6 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 5 on / off"}, // 37
	{15 + 7 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 4 on / off"}, // 38
	{15 + 8 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 3 on / off"}, // 39
	{15 + 9 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 2 on / off"}, // 40
	{15 + 10 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 1 on / off"}, // 41
	{15 + 11 * 3, 7, 7,  0, SW_2ST, "DIP Switch Register bit 0 on / off"}, // 42

	{3 + 0 * 3, 12, 7,  0, SW_2MOM, "Emulate SOR instruction."},      // 43
	{3 + 1 * 3, 12, 7,  0, SW_2MOM, "Emulate ICR instruction."},      // 44
	{3 + 2 * 3, 12, 7,  0, SW_2MOM, "Emulate SENTINEL instruction."}, // 45
	{3 + 3 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTA instruction."},   // 46
	{3 + 4 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTC instruction."},   // 47
	{3 + 5 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTD instruction."},   // 48
	{3 + 6 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTU instruction."},   // 49
	{3 + 7 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTH instruction."},   // 50
	{3 + 8 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTB instruction."},   // 51
	{3 + 9 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTSP instruction."},  // 52
	{3 + 10 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTNL instruction."},  // 53
	{3 + 11 * 3, 12, 7,  0, SW_2MOM, "Emulate DEBUGON instruction."},  // 54
	{3 + 12 * 3, 12, 7,  0, SW_2MOM, "Emulate DEBUGOFF instruction."}, // 55
	{3 + 13 * 3, 12, 7,  0, SW_2MOM, "Emulate DUMP instruction."},     // 56
	{3 + 14 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTHI instruction."},  // 57
	{3 + 15 * 3, 12, 7,  0, SW_2MOM, "Emulate PRINTLO instruction."},  // 58
	{3 + 16 * 3, 12, 7,  0, SW_2MOM, "Emulate HALT instruction."},     // 59
	{3 + 17 * 3, 12, 7,  0, SW_2MOM, "Emulate SUCCESS instruction."},  // 60
	{3 + 18 * 3, 12, 7,  0, SW_2MOM, "Emulate FAIL instruction."},     // 61

	{3 + 20 * 3, 12, 7,  0, SW_2MOM, "Reset DFP board."},              // 62
	
	{0, 0, 0, 0, 0, NULL}
};
		
	  

#define WIDTH 104

void
init_menu()
{
	initscr();
	int y, x;
	getmaxyx(stdscr, y, x);
	y++;			// Get rid of spurious warning
	if (x < WIDTH) {
		endwin();
		fprintf(stderr, "%s: a terminal of at least %d columns is needed\n",
			progname, WIDTH);
		exit(1);
	}
	
	start_color();
	keypad(stdscr, 1);

	init_pair(1, COLOR_RED, COLOR_BLACK);
	init_pair(2, COLOR_GREEN, COLOR_BLACK);
	init_pair(3, COLOR_YELLOW, COLOR_BLACK);
	init_pair(4, COLOR_BLUE, COLOR_BLACK);
	init_pair(5, COLOR_MAGENTA, COLOR_BLACK);
	init_pair(6, COLOR_CYAN, COLOR_BLACK);
	init_pair(7, COLOR_WHITE, COLOR_BLACK);

	for (mposmax = 0; options[mposmax].text != NULL; mposmax++);
	for (sposmax = 0; switches[sposmax].tooltip; sposmax++) {
		if (switches[sposmax].type == SW_2ST && switches[sposmax].st == 0) {
			switches[sposmax].st = -1;
		}
	}
}

static void
draw_tabline(int curtab)
{
	attrset(tab == curtab ? A_BOLD : 0);
	mvaddch(getcury(stdscr) + 1, 0, ACS_VLINE);
	mvaddch(getcury(stdscr), WIDTH - 1, ACS_VLINE);
	move (getcury(stdscr), 3);
	attroff(A_BOLD);
}

static void
draw_tabtop(int curtab)
{
	int i;

	// Top line
	attrset(tab == curtab ? A_BOLD : 0);
	addch(ACS_ULCORNER);
	for (i = 0; i < (WIDTH - 2); i++) addch(ACS_HLINE);
	addch(ACS_URCORNER);

	// First blank line
	draw_tabline(curtab);
}

static void
draw_tabbottom(int curtab)
{
	int i;

	// First blank line
	draw_tabline(curtab);
	
	// Bottom line
	attrset(tab == curtab ? A_BOLD : 0);
	mvaddch(getcury(stdscr) + 1, 0, ACS_LLCORNER);
	for (i = 0; i < (WIDTH - 2); i++) addch(ACS_HLINE);
	addch(ACS_LRCORNER);
	move(getcury(stdscr) + 1, 0);
}


static void 
draw_switch(int sw, int ln)
{
	attron(A_REVERSE);
	if (switches[sw].st == (1 - ln)) {
		attron(A_REVERSE);
		printw("== ");
		// addch(ACS_BLOCK);
		// addch(ACS_BLOCK);
		// addch(32);
	} else {
		printw("   ");
	}
	attroff(A_REVERSE | A_BOLD);
}


static void
printb(uint32_t n, int bits)
{
	for (bits--; bits >= 0; bits--) {
		addch(n & (1 << bits) ? '1' : '0');
	}
}


static void
show_hex(char *s, uint32_t val, int pad)
{
	fg(7); printw(s);
	fg(2); printw("%0*x", pad, val);
}


static void
show_bus(char *s, int64_t val)
{
	fg(7); printw(s);
	if (val < 0) {
		fg(3);
		printw("   Z");
	} else {
		fg(2);
		printw("%04x", val & 0xffff);
	}
}


static void
show_rotor(char *s, rotor_t * r)
{
	static char *rotor_chars = "-\\|/";
	fg(7); printw(s);
	fg(2); addch(rotor_chars[(r->c >> r->shift) & 3]);
}


static void
show_nbrotor(char *s, rotor_t * r)
{
	static char *rotor_chars = "-\\|/";
	fg(7); printw(s);
	fg(!r->v ? 1 : 2); addch(rotor_chars[(r->c >> r->shift) & 3]);
}


static void
show_bool(char *s, int val)
{
	fg(7); printw(s);
	if (val) {
		fg(3);
		attron(A_BOLD);
		printw("A");
	} else {
		fg(7);
		printw("-");
	}
}


static void
show_ctl(char *s, int val)
{
	fg(7); printw(s);
	if (state.nctloe != 0) {
		fg(3);
		printw("Z");
	} else if (val) {
		fg(3);
		attron(A_BOLD);
		printw("A");
	} else {
		fg(7);
		printw("-");
	}
}



void
draw()
{
	int i;

	clear();
	fg(7);
	printw("CFT Mini Computer\n");
	printw("Debugging Front Panel Simulation\n\n");

	printw("Press "); bfg(3); printw("Tab"); fg(7);
	printw(" to move between sections.\n");
	printw("Use the "); bfg(3); printw("arrow keys "); fg(7);
	printw("and "); bfg(3); printw("space"); fg(7);
	printw(" to navigate and toggle values.\n\n");

	///////////////////////////////////////////////////////////////////////////////
	//
	// FIRST TAB: options
	//
	///////////////////////////////////////////////////////////////////////////////

	draw_tabtop(0);
	// The options themselves.
	int y0 = getcury(stdscr) + 1;
	mpos = mpos % mposmax;
	for (i = 0; options[i].text != NULL; i++) {
		attrset(tab == 0 ? A_BOLD : 0);
		mvaddch(y0 + i, 0, ACS_VLINE);
		fg(7);
		if (i == mpos) attron(A_BOLD);
		if (flags & options[i].flag) {
			printw("   [X] ");
			fg(2);
		} else {
			printw("   [ ] ");
			fg(7);
		}
		if (i == mpos) attron(A_BOLD);
		printw(options[i].text);
		fg(7);
		attrset(tab == 0 ? A_BOLD : 0);
		mvaddch(y0 + i, WIDTH - 1, ACS_VLINE);
	}
	draw_tabbottom(0);

	///////////////////////////////////////////////////////////////////////////////
	//
	// SECOND TAB: FRONT PANEL SWITCHES
	//
	///////////////////////////////////////////////////////////////////////////////

	draw_tabtop(1);
	attrset(tab == 1 ? A_BOLD : 0);
	int y1 = getcury(stdscr) + 1;
	draw_tabline(1);
	move (y1, 3);

	printw("Rs Ru uS    Fs Lt OR    Switch Register");
	printw("                                    ");
	printw("IR    MW MR IW IR RA I1");

#define tsw() draw_switch(sw++, j)

	int sw;
	for (int j = 0; j < 3; j++) {
		sw = 0;
		draw_tabline(1);
		fg(1); tsw(); tsw(); tsw(); fg(7); printw(j == 1 ? " S ": "   ");
		fg(3); tsw(); tsw(); tsw(); fg(7); printw(j == 1 ? "D  ": "   ");
		for(i = 0; i < 4; i++) {
			fg(i & 1 ? 3 : 1);
			tsw(); tsw(); tsw(); tsw();
		}
	
		printw("   ");
		for(i = 0; i < 4; i++) {
			fg(i & 1 ? 3 : 1);
			tsw(); tsw();
		}
	}
	draw_tabline(1);
	printw("RS HL St    Cr    uA    ");
	printw("15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00");
	printw("    PC AC W+ R+ W+ R+ RO I6");

	int sw0 = sw;
	draw_tabline(1);
	draw_tabline(1);
	fg(7); draw_switch(sw0, 0);
	printw("         ");
	fg(1); for(sw = sw0 + 1, i = 0; i < 12; i++) draw_switch(sw++, 0);

	draw_tabline(1);
	fg(7); draw_switch(sw0, 2);
	printw("         ");
	fg(1); for(sw = sw0 + 1, i = 0; i < 12; i++) draw_switch(sw++, 2);
	printw("      ");
	draw_tabline(1);
	printw("Lock        DIP switches");


	sw0 = sw;
	draw_tabline(1);
	draw_tabline(1);
	printw("Emulated CFT-side instructions", sw);

	draw_tabline(1);
	fg(6); for(sw = sw0, i = 0; i < 19; i++) draw_switch(sw++, 0);
	printw("   "); draw_switch(sw++, 0);
	draw_tabline(1);
	fg(6); for(sw = sw0, i = 0; i < 19; i++) draw_switch(sw++, 1);
	printw("   "); draw_switch(sw++, 1);
	draw_tabline(1);
	fg(6); printw("SOR   SNT A  C  D  U  H  B SP NL ON OFF   HI LO HLT   FAIL  RST");
	draw_tabline(1);
	fg(6); printw("   ICR    PRINTxx              DEBUG   DMP PRT     OK");
	

	draw_tabline(1);
	draw_tabline(1);
	fg(2);
	printw("%-80.80s", tab == 1 ? switches[spos].tooltip: "");
	fg(7);
	
	draw_tabbottom(1);


	///////////////////////////////////////////////////////////////////////////////
	//
	// THIRD TAB: STATUS
	//
	///////////////////////////////////////////////////////////////////////////////

	draw_tabtop(2);
	draw_tabline(2);
	show_bus("IBUS:  ", state.ibus);
	show_bus("  ABUS:  ", state.abus);
	show_bus("  DBUS:  ", state.dbus);

	draw_tabline(2);
	show_hex("AC:    ", state.ac, 4);
	show_hex("  PC:    ", state.pc, 4);
	show_hex("  IR:    ", state.ir, 4);
	show_hex("  AR:   ", state.ar, 4);
	show_hex("  uC: ", state.uvec, 6);
	fg(1); printw("  fl: "); fg(2); printw("-----");
	show_hex("  OR:   ", state.or, 4);

	draw_tabline(2);
	show_nbrotor("IRQ1:     ", &state.r_nirq1);
	show_nbrotor("  IRQ6:     ", &state.r_nirq6);
	show_nbrotor("  INCPC:    ", &state.r_nincpc);
	show_nbrotor("  WAC:     ", &state.r_nwac);
	show_nbrotor("  RPC:    ", &state.r_nrpc);
	show_nbrotor("  WAR:     ", &state.r_nwar);
	show_nbrotor("  WIR:    ", &state.r_nwir);
	show_nbrotor("   WPC:     ", &state.r_nwpc);

	draw_tabline(2);
	show_ctl("SAFE:     ", !state.nsafe);
	show_ctl("  RESET:    ", !state.nreset);
	show_ctl("  RSTHOLD:  ", !state.nrsthold);
	show_ctl("  WEN:     ", !state.nwen);
	show_ctl("  FPRAM:  ", !state.nfpram);
	show_ctl("  FPRESET: ", !state.nfpreset);

	draw_tabline(2);
	show_ctl("W:        ", !state.nw);
	show_ctl("  R:        ", !state.nr);
	show_ctl("  MEM:      ", !state.nmem);
	show_ctl("  IO:      ", !state.nio);
	show_ctl("  HALT:   ", !state.nhalt);
	show_ctl("  FPRUN:   ", state.fprun);
	show_ctl("  FPSTOP: ", state.fpstop);
	show_bool("   FPCLKEN: ", state.fpclken);

	draw_tabline(2);
	show_bool("ABOE:     ", !state.naboe);
	show_bool("  DBLOE:    ", !state.ndboe);
	show_bool("  IBUSOE:   ", !state.nibusoe);
	show_bool("  CTLOE:   ", !state.nctloe);
	show_bool("  BUSPU:  ", state.buspu);

	draw_tabline(2);
	show_rotor("FP Clk:   ", &state.r_clk);
	show_rotor("  OR Clk:   ", &state.r_orclk);
	show_rotor("  SAMPLE:   ", &state.r_sample);
	show_rotor("  DEBEN:   ", &state.r_deben);
	show_rotor("  VPEN:   ", &state.r_vpen);
	show_bool("  STP/RUN: ", !state.steprun);
	show_bool("  USTEP:  ", !state.nustep);
	//debug("*** %d\n", state.r_orclk.c);

	draw_tabline(2);
	fg(7); printw("B: "); fg(2); printb(pin_state[0], 8);
	fg(7); printw("  C: ");  fg(2); printb(pin_state[1], 8);
	fg(7); printw("  D: ");  fg(2); printb(pin_state[2], 8); 
	show_bool("  stepn:   ", state.stepping);
	show_bool("  ustepn: ", state.ustepping);
	show_bool("  resetn:  ", state.resetting);
	show_bool("  wait:   ", !state.wait);
	
	draw_tabbottom(2);



	// Position the cursor
	if (tab == 0) move(y0 + mpos, 5);
	else if (tab == 1) {
		// Short switch?
		int adj = -switches[spos].st;
		if (spos >= 3+3+16+8) adj = adj < 0 ? adj : 0;

		move(switches[spos].y + y1 + adj, switches[spos].x);
	}
}

void
init_avr()
{
	elf_firmware_t f;
	const char * fname = FIRMWARE;

	printf("Loading firmware...\n");
	elf_read_firmware(fname, &f);
	printf("Done.\n\n");

	printf("MCU:      %s\n", MCU_TARGET);
	printf("Firmware: %s\n", fname);
	printf("Clock:    %d.%06d MHz\n", F_CPU / 1000000, F_CPU % 1000000);

	avr = avr_make_mcu_by_name(MCU_TARGET);
	if (!avr) {
		fprintf(stderr, "%s: AVR '%s' not known\n", progname, MCU_TARGET);
		exit(1);
	}
	avr_init(avr);
	avr->frequency = F_CPU;
	//avr->special_deinit = avr_special_deinit;
	avr->custom.deinit = avr_special_deinit;

	// Initialise the UART
	uart_pty_init(avr, &uart_pty);
	uart_pty_connect(&uart_pty, '0');

	// Initialise the board simulation
	init_board();

	// Register callbacks
	for (int port = 0; port < 8; port++) {
		for (int i = 0; i < 8; i++) {
			avr_irq_register_notify(
				avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('A' + port), i),
				pin_changed_hook, 
				(void *)(port | (i << 3)));
		}
	}

	avr_load_firmware(avr, &f);

	// Initialise VCD dumping
	// avr_vcd_init(avr, "sim_dfp.vcd", &vcd_file, 100000);
	// avr_vcd_add_signal(&vcd_file, avr_io_get_irq(


}


void
run_threaded()
{
	// Initialise the mutex
	pthread_mutex_init(&changes_mutex, NULL);
	// Run the simulation
	pthread_create(&simthread, NULL, avr_run_thread, NULL);
}


void
done()
{
	endwin();
	pthread_cancel(simthread);
	kill(0, SIGTERM);
}


#ifndef CTRL
#define CTRL(x) ((x) - '@')
#endif // CTRL

int main(int argc, char *argv[])
{

	if ((debugfp = fopen("log.out", "w")) == NULL) {
		fprintf(stderr, "error while creating log.out: %m\n");
		exit(1);
	}
	
	progname = argv[0];

	init_avr();
	////init_menu();

	////signal(SIGWINCH, SIG_IGN);
	////signal(SIGTERM, SIG_IGN);

	run_threaded();
	atexit(done);


	int c, dt = 0;
	disp_changes++;
	timeout(20);
	for(;;);
	while ((c = getch()) != 'q') {
		dt++;

		// A key was released, reset all momentary switches.
		if (tab == 1 && c < 0 && dt >= 10) {
			int i;
			for (i = 0; i < sposmax; i++) {
				if (switches[i].type == SW_MOM || switches[i].type == SW_2MOM) {
					switches[i].st = 0;
					disp_changes++;
				}
			}
		}

		// Do we need do update anything? Is there a key to
		// process?
		__sync_synchronize();
		if (disp_changes == 0 && c < 0) continue;
		disp_changes = 0;

		if (c >= 0) dt = 0;
		switch(tab) {
		case 0:
			switch(c) {
			case CTRL('I'): // tab
				tab++;
				break;
				
			case CTRL('P'):
			case KEY_UP:
				if (--mpos < 0) mpos = mposmax - 1;
				break;
			case CTRL('N'):
			case KEY_DOWN:
				mpos = (mpos + 1) % mposmax;
				break;
			case ' ':
			case 10:
			case 13:
			case KEY_ENTER:
				flags ^= options[mpos].flag;
				break;
				;
			}
			break;
			
		case 1:
			switch(c) {
			case CTRL('I'): // tab
				tab = 0;
				break;
			case CTRL('P'):
			case KEY_LEFT:
				if (--spos < 0) spos = sposmax - 1;
				break;
			case CTRL('N'):
			case KEY_RIGHT:
				spos = (spos + 1) % sposmax;
				break;
			case ' ':
				if (switches[spos].type == SW_2ST) {
					switches[spos].st = -switches[spos].st;
				}
				break;
			case KEY_UP:
				// TODO: debugging leftovers?
				//avr_raise_irq(avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 0), 1);
				switches[spos].st++;
				if (switches[spos].type == SW_2ST && switches[spos].st == 0) 
					switches[spos].st = 1;
				if (switches[spos].st > 1) switches[spos].st = 1;
				break;
			case KEY_DOWN:
				// TODO: debugging leftovers?
				//avr_raise_irq(avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('C'), 0), 0);
				switches[spos].st--;
				if (switches[spos].type == SW_2ST && switches[spos].st == 0) 
					switches[spos].st = -1;
				if (switches[spos].st < -1) switches[spos].st = -1;
				break;
			}
		}
		
		// If we need to update, do so now.
		disp_changes = 0;
		draw();
		//bfg(5);mvprintw(20, 0, "(%d)   ", c);
		refresh();
	}
}


// End of file.
