#ifndef __PANEL_H__
#define __PANEL_H__


#include <stdint.h>


// The Output Register

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
	uint8_t hof:1;
	uint8_t leds:4;

	uint16_t or;
} panel_out_t;


#define MST_STOP   0
#define MST_RUN    1
#define MST_STEP   2
#define MST_USTEP  3
#define MST_TRACE  4
#define MST_UTRACE 5

#define CLK_FAST   0
#define CLK_SLOW   1
#define CLK_CREEP  2


extern panel_in_t panel_in;
extern panel_out_t panel_out;

void async_lock(uint8_t lock);

void async_sr(uint16_t sr);

void async_reset();

void async_start();

void async_run();

void async_stop();

void async_step();

void async_ustep();

void async_spd(uint8_t spd);

void async_ldir();

void async_ldaddr();

void async_ldac();

void async_wmem();

void async_wmeminc();

void async_rmem();

void async_rmeminc();

void async_wio();

void async_wioinc();

void async_rio();

void async_rioinc();

void async_rom(uint8_t rom);

void async_ifr1();

void async_ifr6();

#endif // __PANEL_H__

// End of file.
