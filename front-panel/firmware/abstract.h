#ifndef __ABSTRACT_H__
#define __ABSTRACT_H__

#include <stdint.h>

// Sanity check
#ifdef AVR
#ifdef HOST
#error "Both -DAVR and -DHOST have been passed to the compiler."
#endif // HOST
#endif // AVR


void hw_init();
void hw_tick();
void hw_done();

// Console I/O
unsigned char query_char(int timeout_usec);
unsigned char read_next_char();
void serial_write(unsigned char c);

// Input
void deb_sample();
uint16_t read_ab();		// Address bus
uint16_t read_db();		// Data bus
uint16_t read_dsr();		// DIP switch reg (12 bits)
uint16_t read_sr();		// Switch reg
uint32_t read_sw();		// Remaining switches


void virtual_panel_sample();    // Read the machine state
uint32_t read_misc();		// uC vector, flags, card select signals
uint16_t read_ir();		// IR
uint16_t read_pc();		// PC
uint16_t read_ac();		// AC

// Output
void write_leds(const uint8_t);   // Set the diagnostic LEDs

void write_or(const uint16_t);	// Output (lights) register

void drive_ibus();		// Drive IBUS
void write_ibus(const uint16_t); // Output to IBUS
void tristate_ibus();		// Stop driving IBUS

void drive_ab();		// Drive Address bus
void write_ab(const uint16_t);	// Output to Address bus
void tristate_ab();		// Stop driving Address bus

void drive_db();
void write_db(const uint16_t);
void tristate_db();

// Strobes & miscellaneous signals
void set_clk(int x);		// Clock enable/disable
void set_clkfreq(int x);	// Clock frequency select
void strobe_step();		// Start the step state machine
void strobe_ustep();		// Start the microstep state machine
void set_buspu(int x);		// Control bus pull-up
void set_safe(int x);		// SAFE#
void set_irq1(int x);		// IRQ1#
void set_irq6(int x);		// IRQ6#
void set_fpram(int x);		// FPRAM#
void strobe_fpreset();		// FPRESET#
void strobe_wpc();		// WPC#
void strobe_wac();		// WAC#
void strobe_wir();		// WIR#
void strobe_w();		// W#
void set_r(int x);		// R#
void set_mem(int x);		// MEM#
void set_io(int x);		// IO#
void strobe_war();		// WAR#
void strobe_rpc();		// RPC#
void strobe_incpc();		// INCPC#
void set_halt(int x);		// HALT#
void set_runstop(int x);	// 1=FPRUN, 0=FPSTOP

#endif // __ABSTRACT_H__

// End of file.
