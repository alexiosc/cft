// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// ABSTRACT DEFINITIONS FOR DRIVERS
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __ABSTRACT_H__
#define __ABSTRACT_H__

#include <stdint.h>
#include "dfp.h"
#include "hwcompat.h"

// Sanity check
#ifdef AVR
#  ifdef HOST
#    error "Both -DAVR and -DHOST have been passed to the compiler."
#  endif // HOST
#endif // AVR


///////////////////////////////////////////////////////////////////////////////
//
// THE BASICS
//
///////////////////////////////////////////////////////////////////////////////


// The high-level state of the driver is represented using this structure which
// includes fields for previously read computer registers etc.

// NOTE: the AVR is Little Endian, and the compiler will generate considerably
// better code if fields are listed in least-to-most-significant order
// (e.g. l→h).
typedef struct {
	// Direct Inputs
	uint8_t   ab_l,  ab_m, ab_h; // Last sampled value of the Address Bus
	uint8_t   db_l, db_h;        // Last sampled value of the Data Bus
	uint8_t   ibus_l, ibus_h;    // Last sampled value from the IBUS
	uint16_t  dsr0, dsr1, dsr2;  // The DIP switches (or overridden value)

	// Computer Inputs
	uint8_t   ir_l, ir_h;
	uint8_t   pc_l, pc_h;
	uint8_t   dr_l, dr_h;
	uint8_t   ac_l, ac_h;
	uint8_t   sp_l, sp_h;
	uint8_t   ucv_l, ucv_m, ucv_h;

	// Direct Outputs
	uint8_t   or_l, or_h;	     // Last set value of the OR

	// Internal DFP State
	uint16_t  clk_div;	     // The slow clock divider.
	uint8_t   clk_prescaler:3;   // The slow clock prescaler.
	uint8_t   clk_fast:1;	     // Using the full speed clock of the CFT.
	uint8_t   clk_stopped:1;     // The clock has been stopped.

	uint8_t   is_halted:1;	     // Set when the computer has been halted.

        // TODO: Remove these
        uint8_t   have_ctl:1;
        uint8_t   have_reg:1;
        //uint8_t   have_alu:1;
        //uint8_t   have_bus:1;

        // Flags for detected (and operational) units
        uint8_t   have_dfp:1;        // The DFP board has been detected. (pretty basic)
        uint8_t   have_pod_ucv0;     // Microcode Control Vector Pod, RADDR field
        uint8_t   have_pod_ucv1;     // Microcode Control Vector Pod, WADDR field
        uint8_t   have_pod_ucv2;     // Microcode Control Vector Pod, ACTION & COND fields
        uint8_t   have_pod_ibus0;    // IBus, bits 0-7
        uint8_t   have_pod_ibus1;    // IBus, bits 8-15
        uint8_t   have_pod_ab0;      // Address Bus Pod, bits 0-7
        uint8_t   have_pod_ab1;      // Address Bus Pod, bits 8-15
        uint8_t   have_pod_ab2;      // Address Bus Pod, bits 16-23
        uint8_t   have_pod_db0;      // Data Bus Pod, bits 0-7
        uint8_t   have_pod_db1;      // Data Bus Pod, bits 8-15

        // Units on PB0
        uint8_t   have_clock:1;      // PB0: Clock generator
        uint8_t   have_reset:1;      // PB0: Reset
        uint8_t   have_ir:1;         // PB0: Instruction Register
        uint8_t   have_ucv:1;        // PB0: Microcode Sequencer (control vector present)
        uint8_t   have_flag_unit:1;  // PB0: Flag Unit
        uint8_t   have_agl:1;        // PB0: Address Generation Logic
        uint8_t   have_pc:1;         // PB0: Program Counter
        uint8_t   have_dr:1;         // PB0: Data Register
        uint8_t   have_cs:1;         // PB0: Constant Store
        uint8_t   have_mbu:1;        // PB0: Memory Banking Unit
        uint8_t   have_ar:1;         // PB0: Address Register
        uint8_t   have_bus:1;        // PB0: Address/Data Bus driver
        uint8_t   have_ism:1;        // PB0: Interrupt State Machine (detected via FI)

        // Units on PB1
        uint8_t   have_porta:1;      // PB1: ALU Port A (implicitly detected)
        uint8_t   have_portb:1;      // PB1: ALU Port B
        uint8_t   have_alu:1;        // PB1: ALU ROMs
        uint8_t   have_fl:1;         // PB1: Link flag working
        uint8_t   have_fv:1;         // PB1: Overflow working
        uint8_t   have_sru:1;        // PB1: Shift/Rotate Unit
        uint8_t   have_swab:1;       // PB1: Byte-swap
        uint8_t   have_ac:1;         // PB1: Accumulator
        uint8_t   have_sp:1;         // PB1: Stack Pointer

	uint8_t   is_busy:1;         // The DFP is busy.
	uint8_t   is_booting:1;      // Blink the PANEL light during boot/diagnostics.

	uint8_t   fp_autoscan:1;     // The FP scanner is on (AUTOSCAN# asserted)
	uint8_t   fp_grab:1;         // The DFP controls the front panel

	uint8_t   swdata[8];         // Front Panel Switches

	// Switches
	uint8_t   switches[8];       // 64 switch bits
	uint8_t   swchange[8];       // 64 switch bits
	uint16_t  sr;                // The value of the SR from swdata.
} hwstate_t;

extern hwstate_t hwstate;


// These functions are driver entry points. They don't make sense for all
// drivers. E.g the AVR doesn't need hw_tick() and never de-initialises so it
// doesn't need hw_done() either.

void hw_init();                 // Initialise the driver
void hw_tick();                 // Handle periodic tasks (emulator only)
void hw_done();                 // Free resources


///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL PORT, BOTH PHYSICAL (PROTOCOL) AND VIRTUAL CONSOLE (TTYD)
//
///////////////////////////////////////////////////////////////////////////////


void serial_init();

void serial_write(unsigned char c);

// This extern is required so that the protocol layer can be called from the
// comms driver to receive a new character.
extern unsigned char proto_input(unsigned char c);


///////////////////////////////////////////////////////////////////////////////
//
// LOW-LEVEL DFP FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////

// Read an arbitrary address from the DFP bus.
uint8_t read_dfp_address(xmem_addr_t a);

// Obtain full control of the front panel lights.
void fp_grab();

// Release the front panel lights to the CFT.
void fp_release();

// Front panel light addresses are in the range 0 to 19 (base 10), first across
// then down. Module A1 is top left (address 0), module D1 is top right
// (address 3), module D5 is bottom right (address 19).
//
// PRECONDITION: call fp_grab() first.
void
fp_write(uint8_t module, uint8_t row, uint8_t value);


///////////////////////////////////////////////////////////////////////////////
//
// THE TTYD SERIAL PORT
//
///////////////////////////////////////////////////////////////////////////////

// This is a serial port as seen from the CFT, and is what we interact with
// when in the console (cons command). We use a ring buffer for it. The ring
// buffer has a size that's a power of two so we can use faster instructions on
// the Atmega.

// Ring buffer size in bits (we do not use modulo)
#ifdef HOST
#define RBSIZE_BITS 8
#endif
#ifdef AVR
#define RBSIZE_BITS 5
#endif // AVR
#define RBMASK ((1 << RBSIZE_BITS) - 1)
typedef struct {
	uint8_t ip, op;
	uint8_t b[(1 << RBSIZE_BITS)];
} ringbuf_t;

#if RBMASK == 0
#  error "RBMASK is zero"
#endif

extern ringbuf_t ringbuf;


///////////////////////////////////////////////////////////////////////////////
//
// BUSES, COMPUTER STATE AND TRANSACTIONS
//
///////////////////////////////////////////////////////////////////////////////

void read_full_state(); // Updates the entire virtual front panel synchronously

// Control Unit functionality

errno_t write_to_ibus_unit(uint8_t waddr, uint16_t val);

errno_t read_from_ibus_unit(uint8_t raddr, uint16_t * val);

errno_t processor_action(uint8_t action);


///////////////////////////////////////////////////////////////////////////////
//
// FRONT PANEL SWITCHES AND FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////


void sw_clear_changed();

void sw_read();

void set_mfd(mfd_t mfd);

word_t get_or();

void set_or(const word_t);	// Output (lights) register


///////////////////////////////////////////////////////////////////////////////
//
// REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

#define get_ar24() ((hwstate.ar_h << 16) | (hwstate.ar_m << 8) | hwstate.ar_l)
#define get_ar16() ((hwstate.ar_m << 8) | hwstate.ar_l)

#define get_ir() ((hwstate.ir_h << 8) | hwstate.ir_l)
#define get_pc() ((hwstate.pc_h << 8) | hwstate.pc_l)
#define get_dr() ((hwstate.dr_h << 8) | hwstate.dr_l)
#define get_ac() ((hwstate.ac_h << 8) | hwstate.ac_l)
#define get_sp() ((hwstate.sp_h << 8) | hwstate.sp_l)


typedef enum { reg_ir, reg_pc, reg_dr, reg_ac, reg_sp } reg_t;

// Higher-leve function to set a subset of computer registers.
// FIXME: this should probably not be here! (not even implemented in driver_avr)
uint8_t set_reg(reg_t reg, uint16_t value);


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// Note: ICR_TTY is used to enable IRQ6# when console characters
// received.

// #warning "Review these flags, IFR1/IFR6 are no longer available"
// #define ICR_IFR6 2
// #define ICR_IFR1 4
// #define ICR_TTY  8

// extern uint16_t icr;
// extern uint8_t ifr6_operated;

// #define defer_cb_write() defercb++




// #define ISR_IRQ6 1
// #define ISR_IRQ1 2
// #define ISR_IFR6 4
// #define ISR_TTY  8

// // DEB Console I/O
// unsigned char query_char(int timeout_usec);
// unsigned char read_next_char();
// void serial_write(unsigned char c);

// // Input
// void deb_sample(bool_t quick);
// uint16_t get_ab();		// Address bus
// uint16_t get_db();		// Data bus
// void set_db(uint16_t);		// Data bus
// uint16_t get_dsr();		// DIP switch reg (12 bits)
// void set_sr(const uint16_t sr);
// uint16_t get_sr();		// Switch reg
// uint16_t get_lsw();		// Left switches
// uint16_t get_rsw();		// Right switches

// void virtual_panel_sample(bool_t quick); // Read the machine state

// #define CFL_FN       0x01
// #define CFL_FZ       0x02
// #define CFL_FV       0x04
// #define CFL_FI       0x08
// #define CFL_FL       0x10
// #define CFL_NWAIT    0x20
// #define CFL_NWEN     0x40
// #define CFL_NR       0x80	// The R# signal is here too

// #define get_flags get_misc
// uint8_t get_misc();		// flags, card select signals
// uint32_t get_uvec();		// uC vector
// uint16_t get_ir();		// IR
// uint16_t get_pc();		// PC
// uint16_t get_ac();		// AC
// uint16_t get_dr();		// DR

// // Output
// void write_leds(const uint8_t);   // Set the diagnostic LEDs

// void drive_ibus();		// Drive IBUS
// void write_ibus(const uint16_t); // Output to IBUS
// void tristate_ibus();		// Stop driving IBUS

// void drive_ab();		// Drive Address bus
// void write_ab(const uint16_t);	// Output to Address bus
// void tristate_ab();		// Stop driving Address bus

// void drive_db();
// void write_db(const uint16_t);
// void tristate_db();

// void addr_inc();

void clk_stop();		// Stop clock
void clk_start();		// Start clock
void clk_fast();		// Set fast clock
void clk_slow();		// Set slow clock
void clk_creep();		// Set creep clock
void clk_setfreq(uint8_t prescaler, uint16_t div);// Clock frequency select

// void wait_for_halt(bool_t reckless); // Wait until the processor clock is stopped

// void set_stopping();		// Request a stop of the processor
// void set_steprun(bool_t x);	// Start the step state machine
// void perform_step();		// Start the step state machine
// void perform_ustep();		// Start the microstep state machine
// void set_buspu(const uint8_t x);// Control bus pull-up
// void set_safe(bool_t x);	// SAFE#
// void set_irq1(bool_t x);	// IRQ1#
// void set_irq6(bool_t x, bool_t fromPanel);	// IRQ6#
// void set_fpram(bool_t x);	// FPRAM#
// void perform_reset();		// FPRESET# or RESET#/RSTHOLD#
// void strobe_wpc();		// WPC#
// void strobe_wac();		// WAC#
// void strobe_wir();		// WIR#
// void strobe_w();		// W#
// void set_r(bool_t x);		// R#
// void set_mem(bool_t x);		// MEM#
// void set_io(bool_t x);		// IO#
// void release_bus();		// Release all bus signals
// void strobe_war();		// WAR#
// void strobe_rpc();		// RPC#
// void strobe_incpc();		// INCPC#
// void set_halt(bool_t x);	// HALT#
// void set_fprunstop(bool_t x);	// 1=FPRUN, 0=FPSTOP

// void wait_for_halt(bool_t reckless);

// // CFT-side I/O
// void queue_char(uint8_t c);
// uint16_t maybe_dequeue_char();

// void run_buscmd_interrupt();

errno_t ringbuf_add(uint8_t c);

errno_t ringbuf_get(uint8_t *c);


#endif // __DRIVER_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
