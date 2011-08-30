///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A simple 16-bit register.
//
// NOTE: combines two 8-bit D-flip-flops into a simple 16-bit register.
//
///////////////////////////////////////////////////////////////////////////////

`include "buffer.v"
`include "counter.v"
`include "flipflop.v"

`timescale 1ns/1ps


module simple_reg16 (d, q, latch, oe);
   input [15:0] d;		// Data
   input 	latch;		// Clock
   input 	oe;		// /OE (active low): output enable
   
   output [15:0] q;		// Output
   
   wire [15:0] 	 d;
   wire 	 latch;
   wire 	 oe;
   
   wire [15:0] 	 q;

   reg [15:0] 	 q_debug;

   // Debugging
   always @(posedge latch) begin
      q_debug = d;
   end
   
   flipflop_574 reg_low (d[7:0], q[7:0], latch, oe);
   flipflop_574 reg_hi  (d[15:8], q[15:8], latch, oe);
endmodule // End of Module counter


module simple_reg8 (d, q, latch, oe);
   input [7:0] d;		// Data
   input 	latch;		// Clock
   input 	oe;		// /OE (active low): output enable
   
   output [7:0] q;		// Output
   
   wire [7:0] 	 d;
   wire 	 latch;
   wire 	 oe;
   
   wire [7:0] 	 q;

   reg [7:0] 	 q_debug;

   // Debugging
   always @(posedge latch) begin
      q_debug = d;
   end
   
   flipflop_574 reg_low (d, q, latch, oe);
endmodule // End of Module counter


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A 16-bit register with increment control.
//
// NOTE: Implemented with four 74x193 4-bit counters and two 74x244 tri-state
// buffers (the '193 doesn't tri-state its outputs).
//
///////////////////////////////////////////////////////////////////////////////

module inc_reg16 (d, q, q_unbuf, latch, oe, inc, dec, reset);
   input [15:0] d;
   input 	latch;		// Clocks in data on rising edge
   input 	oe;		// OE = 0: output enabled
   input 	inc;		// Increments on rising edge
   input 	dec;		// Decrement on rising edge
   input 	reset;

   output [15:0] q;
   output [15:0] q_unbuf;	// Unbuffered Q output (for panel
				// and other buses)
   wire [15:0] 	 d;
   wire 	 latch;
   wire 	 oe;
   wire 	 inc;

   wire [15:0] 	 q_unreg;

   wire 	 clear;

   nor #10 nor_74hct02_8 (clear, reset, reset);
   
   // The register is latched. This creates timing problems, so we need to load
   // data on the rising edge of load. To this end, we have a rising edge
   // detector which pulses just long enough for the '193s to load the
   // parallel-in values. According to the datasheet for the 74HCT193, 30ns
   // should be more than the worst-case minimum time at 5V. We use six NAND
   // gates with 8 to 10ns propagation delay, and the pulse width is around 40
   // to 50ns.
   wire 	 xload, latch0, latch1, latch2, latch3, latch4;
   wire 	 xlatch, xlatch0;
   nor #10 nor_74hct02_1 (latch0, latch, latch); // inverted
   nor #10 nor_74hct02_2 (latch1, latch0, latch0);
   //nor #10 nor_74hct02_3 (latch2, latch1, latch1); // inverted
   //nor #10 nor_74hct02_4 (latch3, latch2, latch2);
   //nor #10 nor_74hct02_5 (latch4, latch3, latch3); // inverted
   nor #10 nor_74hct02_6 (xlatch0, latch, latch0);
   nor #10 nor_74hct02_7 (xlatch, xlatch0, xlatch0);

   wire 	 c0, c1, c2, c3, b0, b1, b2, b3;
   
   counter_193 counter0 (clear, xlatch, d[3:0],   inc, dec, q_unbuf[3:0],   c0, b0);
   counter_193 counter1 (clear, xlatch, d[7:4],   c0, b0,    q_unbuf[7:4],   c1, b1);
   counter_193 counter2 (clear, xlatch, d[11:8],  c1, b1,    q_unbuf[11:8],  c2, b2);
   counter_193 counter3 (clear, xlatch, d[15:12], c2, b2,    q_unbuf[15:12], c3, b3);

   buffer_244 buf0 (oe, oe, q_unbuf[3:0], q_unbuf[7:4], q[3:0], q[7:4]);
   buffer_244 buf1 (oe, oe, q_unbuf[11:8], q_unbuf[15:12], q[11:8], q[15:12]);
endmodule // inc_reg16


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A 16-bit register with a console connection, output
// enable and reset.
//
// NOTE: combines two 8-bit D-flip-flops into a simple 16-bit register.
//
///////////////////////////////////////////////////////////////////////////////

module rc_reg16 (d, q, qc, reset, load, oe);
   input [15:0] d;		// Data
   input 	reset;		// /RESET: q <- 0000
   input 	load;		// /LOAD
   input 	oe;		// /OE (active low): output enable
   
   output [15:0] q;		// Output
   output [15:0] qc;		// Output for the console
   
   wire [15:0] 	 d;
   wire 	 load;
   wire 	 oe;
   
   wire [15:0] 	 q;

   // Four 74x175 D flipflops hold the data.
   flipflop_175 reg0 (d[3:0],   qc[3:0], ,   load, reset);
   flipflop_175 reg1 (d[7:4],   qc[7:4], ,   load, reset);
   flipflop_175 reg2 (d[11:8],  qc[11:8], ,  load, reset);
   flipflop_175 reg3 (d[15:12], qc[15:12], , load, reset);

   // Output enable buffers.
   buffer_244 buf0 (oe, oe, qc[3:0], qc[7:4], q[3:0], q[7:4]);
   buffer_244 buf1 (oe, oe, qc[11:8], qc[15:12], q[11:8], q[15:12]);

endmodule // End of Module counter


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A single-bit register with d (set), toggle and reset
// (i.e. basically a J-K flip-flop and some gates. A 74x112 will do).
//
// NOTES: Truth table:
//
// d latch /clear toggle clock /reset  q nq
// ----------------------------------------
// X   X      X      X      X     0    0  1
// X   X      0      X      X     0    0  1
// X   X      1      1      \     1    FLIP
// 0   1      1      0      \     1    0  1
// 1   1      1      0      \     1    1  0
// X   0      1      0      \     1    NO CHANGE
//
// J = (d AND latch) OR toggle
// K = ((NOT d) AND latch) OR toggle
// FF_RESET = reg_reset AND clear
//
// I.e. one FF, 2x AND, 2x OR, 1x NOT.
//
// This is used for the L register. The I register uses a simpler version of
// this, which occupies the other half of the '112 and another quarter of the
// '32 (OR).
//
///////////////////////////////////////////////////////////////////////////////

module reg_L (d, latch, clear, toggle1, toggle2, clock, reset, q, nq);
   input d;
   input latch;                 // Active HIGH.
   input clear;			// Active LOW.
   input toggle1, toggle2;	// Active high toggle signals.
   input clock;			// Clocks on NEGATIVE edge.
   input reset;			// Ative LOW.

   output q;
   output nq;

   tri0   d;
   wire   j, k, nd, j0, k0, ff_reset;
   wire   toggle, toggle1, toggle2, toggle3, toggle4;

   // Not-d.
   nor nor_74hct02_a (nd, d, d);
   
   // Edge detection.
   //nor nor_74hct02a (toggle4, toggle3, toggle3);
   //nor nor_74hct02b (toggle, toggle3, toggle4);

   initial begin
      $display("TODO: Reinstate edge detection for toggle circuit, otherwise CU toggles L twice.");
   end

   // J/K/Toggle logic.
   and and_7408a (j0, d, latch);
   and and_7408b (k0, nd, latch);
   and and_7408c (ff_reset, reset, clear);
   or or_7432a (toggle, toggle1, toggle2);

   // J/K FF interface.
   or or_7432b (j, j0, toggle);
   or or_7432c (k, k0, toggle);

   // The other half of this '112 is used in reg_I.
   flipflop_112 ff (j, k, clock, 1'b1, ff_reset, q, nq, 0, 0, 1, 1, 1, ,);

endmodule // reg_L


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A single-bit register with clear, toggle and reset
// (i.e. basically a J-K flip-flop and some gates. A 74x112 will do).
//
// NOTES: Truth table:
//
// clear toggle clock reset q nq
// -------------------------------
//   X     X      X     0   0  1
//   0     0      \     X   0  1
//   1     1      \     1   FLIP
//   1     0      \     1   NO CHANGE
//
// J = toggle
// K = clear OR toggle
//
// I.e. one FF, 1x OR.
//
// The chip count for this is essentially zero, as it shares ICs with bitreg_d
// (the L register).
//
///////////////////////////////////////////////////////////////////////////////

module reg_I (clear, set, clock, reset, q, nq);
   input clear;			// Active LOW.
   input latch;
   input set;			// Active LOW.
   input clock;			// Clocks on NEGATIVE edge.
   input reset;			// Active LOW.

   output q;
   output nq;

   // The other three AND gates are in reg_L
   wire   ff_reset;
   
   and and_7408d (ff_reset, reset, clear);

   // The other half of the FF is i reg_L.
   flipflop_112 ff (0, 0, clock, set, ff_reset, q, nq, 0, 0, 1, 1, 1, ,);
endmodule // reg_I

// End of file.

