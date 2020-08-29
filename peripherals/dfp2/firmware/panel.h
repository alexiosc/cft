#warning "TODO: Review this file for DFP2"
#ifndef __PANEL_H__
#define __PANEL_H__


#include <stdint.h>


// The Output Register

#if 0
typedef struct {
	uint16_t ab;
	uint16_t db;

	uint8_t dshi:4;		// High order bits of DIP switch.
	uint8_t ifr1:1;
	uint8_t ifr6:1;
	uint8_t ram:1;
	uint8_t ior:1;

	uint8_t iow:1;		// 
	uint8_t memr:1;		// 
	uint8_t inc:1;		// 
	uint8_t memw:1;		// 
	uint8_t spare:1;	// 
	uint8_t ldac:1;		// 
	uint8_t ldir:1;		// 
	uint8_t ldaddr:1;	// 

	uint16_t sr;

	uint16_t dslo:8;	// Low order DIP switch bits.

	uint8_t fast:1;
	uint8_t slow:1;
	uint8_t ustep:1;
	uint8_t step:1;
	uint8_t run:1;
	uint8_t stop:1;
	uint8_t reset:1;
	uint8_t lock:1;

	// uint16_t leds:4;        // Diagnostic LEDs
	// uint16_t clkspeed:2;	// Current clock speed
	// uint16_t ifr1:1;        // IRQ1 issued
	// uint16_t ifr6:1;        // IRQ6 issued
	// uint16_t fpram:1;	// FPRAM# state (map RAM initially)
	
	uint16_t bkp[4];        // Breakpoints
} panel_bits_t;

typedef union {
	uint16_t      w[5];
	panel_bits_t  b;
} panel_in_t;

typedef struct {
	uint8_t ifr1:1;
	uint8_t ifr6:1;
	uint8_t leds:4;

	uint16_t or;
} panel_out_t;

#define MST_STOP   0
#define MST_RUN    1
#define MST_STEP   2
#define MST_USTEP  3
#define MST_TRACE  4
#define MST_UTRACE 5

#endif

// flags for _swleft

#define SWL_NLOCK  0x0001
#define SWL_RESET  0x0002
#define SWL_STOP   0x0004
#define SWL_RUN    0x0008
#define SWL_STEP   0x0010
#define SWL_USTEP  0x0020
#define SWL_SLOW   0x0040
#define SWL_FAST   0x0080
#define SWL_SPD_SHIFT      6

#define SWL_DS0    0x0100
#define SWL_DS1    0x0200
#define SWL_DS2    0x0400
#define SWL_DS3    0x0800
#define SWL_DS4    0x1000
#define SWL_DS5    0x2000
#define SWL_DS6    0x4000
#define SWL_DS7    0x8000

#define SWL_AUTOREPEAT (SWL_STEP|SWL_USTEP)

// flags for _swright

#define SWR_LDADDR 0x0001
#define SWR_LDIR   0x0002
#define SWR_LDAC   0x0004
#define SWR_SPARE  0x0008
#define SWR_MEMW   0x0010
#define SWR_INC    0x0020
#define SWR_MEMR   0x0040
#define SWR_IOW    0x0080

#define SWR_IOR    0x0100
#define SWR_ROM    0x0200
#define SWR_IFR6   0x0400
#define SWR_IFR1   0x0800

#define SWR_DS8    0x1000
#define SWR_DS9    0x2000
#define SWR_DS10   0x4000
#define SWR_DS11   0x8000

#define SWR_AUTOREPEAT (SWR_MEMW|SWR_MEMR|SWR_IOW|SWR_IOR|SWR_IFR6|SWR_IFR1)

//#define CLK_FAST   0
//#define CLK_SLOW   1
//#define CLK_CREEP  2


//extern panel_in_t panel_in;
//extern panel_out_t panel_out;

#define actuated(bm, sw) (((bm) & (sw)) == 0)

bool_t panel_lock(bool_t lock);

void panel_sr(uint16_t sr);

void panel_reset();

void panel_start();

void panel_run();

void panel_stop();

void panel_step();

void panel_ustep();

void panel_spd(uint8_t spd);

void panel_ldir();

void panel_ldaddr();

void panel_ldac();

void panel_wmem(bool_t inc, uint16_t a, uint16_t d);

void panel_rmem(bool_t inc, uint16_t a);

void panel_wio(bool_t inc, uint16_t a, uint16_t d);

void panel_rio(bool_t inc, uint16_t a);

void panel_rom(uint8_t rom);

void panel_ifr1();

void panel_ifr6();

#endif // __PANEL_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
