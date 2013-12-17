#ifndef __ABSTRACT_H__
#define __ABSTRACT_H__

#include <stdint.h>

#include "hwcompat.h"

// Sanity check
#ifdef AVR
#ifdef HOST
#error "Both -DAVR and -DHOST have been passed to the compiler."
#endif // HOST
#endif // AVR


void hw_init();
void hw_tick();
void hw_done();

// DEB Console I/O
unsigned char query_char(int timeout_usec);
unsigned char read_next_char();
void serial_write(unsigned char c);

// Input
void deb_sample(bool_t quick);
uint16_t get_ab();		// Address bus
uint16_t get_db();		// Data bus
uint16_t get_dsr();		// DIP switch reg (12 bits)
void set_sr(const uint16_t sr);
uint16_t get_sr();		// Switch reg
uint32_t get_sw();		// Remaining switches

void virtual_panel_sample(bool_t quick); // Read the machine state

#define CFL_FN       0x01
#define CFL_FZ       0x02
#define CFL_FV       0x04
#define CFL_FI       0x08
#define CFL_FL       0x10
#define CFL_NWAIT    0x20
#define CFL_NWEN     0x40
#define CFL_NR       0x80

#define get_flags get_misc
uint8_t get_misc();		// flags, card select signals
uint32_t get_uvec();		// uC vector
uint16_t get_ir();		// IR
uint16_t get_pc();		// PC
uint16_t get_ac();		// AC
uint16_t get_dr();		// DR

// Output
void write_leds(const uint8_t);   // Set the diagnostic LEDs

uint16_t get_or();
void set_or(const uint16_t);	// Output (lights) register

void drive_ibus();		// Drive IBUS
void write_ibus(const uint16_t); // Output to IBUS
void tristate_ibus();		// Stop driving IBUS

void drive_ab();		// Drive Address bus
void write_ab(const uint16_t);	// Output to Address bus
void tristate_ab();		// Stop driving Address bus

void drive_db();
void write_db(const uint16_t);
void tristate_db();

void addr_inc();

void clk_stop();		// Stop clock
void clk_start();		// Start clock
void clk_fast();		// Set fast clock
void clk_slow();		// Set slow clock
void clk_creep();		// Set creep clock
void set_clkfreq(uint8_t prescaler, uint16_t div);	// Clock frequency select

void wait_for_halt();		// Wait until the processor clock is stopped

void set_steprun(bool_t x);	// Start the step state machine
void strobe_step();		// Start the step state machine
void strobe_ustep();		// Start the microstep state machine
void set_buspu(const uint8_t x);// Control bus pull-up
void set_safe(bool_t x);	// SAFE#
void set_irq1(bool_t x);	// IRQ1#
void set_irq6(bool_t x);	// IRQ6#
void set_fpram(bool_t x);	// FPRAM#
void strobe_fpreset();		// FPRESET#
void strobe_wpc();		// WPC#
void strobe_wac();		// WAC#
void strobe_wir();		// WIR#
void strobe_w();		// W#
void set_r(bool_t x);		// R#
void set_mem(bool_t x);		// MEM#
void set_io(bool_t x);		// IO#
void strobe_war();		// WAR#
void strobe_rpc();		// RPC#
void strobe_incpc();		// INCPC#
void set_halt(bool_t x);	// HALT#
void set_fprunstop(bool_t x);	// 1=FPRUN, 0=FPSTOP

void wait_for_halt();

// CFT-side I/O
void queue_char(uint8_t c);
uint16_t maybe_dequeue_char();

#endif // __ABSTRACT_H__

// End of file.
