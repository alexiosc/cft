///////////////////////////////////////////////////////////////////////////////
//
// Function: the CFT interrupt finite state machine.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef int_v
`define int_v

`include "flipflop.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// INTERRUPT LOGIC
//
// NOTES:
//
// Interrupts are signalled asynchronously, but we respond to them
// synchronously, at the beginning of a fetch cycle. We only respond when
// the Interrupt Flag (I register) is set.
//
// To do this, we use two halves of a '112 FF. One half records the incoming
// interrupt request asynchronously, while the second one registers this
// request until the end of the current instruction. This then sets the I
// MicroROM condition flag which causes a jump to the microcode interrupt
// handler, which in turn makes the entire machine jump to location ffff.
//
// Location ffff is expected to have a JMP to the actuall ISR.
//
// The interrupt logic is a three-state FSM:
//
// State W: Waiting for an interrupt.
// State S: Seen an IRQ.
// State H: Handling the interrupt.
//
// State transitions:
//
// ISIG: the falling edge of the IRQ line OR the CLI flag. (*)
// UPC0: the uPC is zero (the rising edge of go_fetch)
// UPC1: the uPC is non-zero (clock1 & uPC0)
//
// State transition diagram:
//
// T1. W (00): ISIG -> S (01)
// T2. S (01): UPC0 -> H (11)
// T3. H (11): UPC1 -> W (00)
// T4. H (11): ISIG -> S (01)
//
// We encode the three states in two bits, where:
//
// W = 00
// S = 01
// H = 11
//
// To implement this, we use both halves of a '112 flip-flop. The first half
// handles the LSB (S1), the second half the MSB (S2).
//
// S1: 0 -> 1 on S2 = 0 && ISIG
//     1 -> 0 on S2 = 1 && UPC1
// S2: 0 -> 1 on S1 = 1 && UPC0
//     1 -> 0 on (S1 = 1 && UPC1)
//
// TODO: REWORK THIS.
//
// First half:
//   * Asynchronously cleared by -RESET.
//   * Asynchronously set by ISIG input (T1, T4)
//
// Second half:
//   * Asynchronously cleared by -RESET
//   * Set by uPC0 (when first half is set) (T2)
//   * Cleared by UPC1 (T3)
//   * Cleared by ISIG (T4)
// 
//
// (*) ISIG logic:
//
// -IRQ  CLI   ISIG (OR)  -ISIG (NOR)
//   0    0     1             0
//   0    1     0             1
//   1    0     0             1
//   1    1     0             1
//
///////////////////////////////////////////////////////////////////////////////

module int_unit (clock, upc, go_fetch, cli, i_flag, irq, reset, int_out);

   input clock;
   input [0:3] upc;		// the microPC
   input       go_fetch;	// active high: reset signal for the PC.
   input       cli;             // active low: CLI line.
   input       i_flag;		// active low: enable IRQs.
   input       sti;		// -STI: allow further IRQs.
   input       irq;		// async -IRQ signal.
   input       reset;		// async -RESET signal.

   output      int_out;		// active low: go to interrupt handler now.

   // The -I_FLAG signal masks interrupt requests. When it's high, interrupt
   // requests are ignored. When it's low, they're allowed.
   //
   // -IRQ I_FLAG   IRQ_IN
   // ---------------------
   //   0     0        0
   //   0     1        1
   //   1     0        1
   //   1     1        1
   wire        isig;
   wire        reset_and_cli;
   wire        nint_out;
   
   or #10 or7432_a (isig, irq, i_flag);

   and #10 and7408_a (reset_and_cli, reset, cli);

   // The interrupt state machine.

   wire        int_seen;
   //                  J         K         \CLK       -SET -RESET          Q         -Q
   flipflop_112 state (0,        0,        clock,     isig, reset_and_cli, int_seen, ,
		       int_seen, nint_out, go_fetch, 1,     reset,         nint_out, int_out);
   

endmodule // int_unit

`endif //  `ifndef int_v

// End of file.
