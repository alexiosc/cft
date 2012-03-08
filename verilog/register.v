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
`include "comparator.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A 16-bit register with increment control.
//
// NOTE: Implemented with four 74x193 4-bit counters and two 74x244 tri-state
// buffers (the '193 doesn't tri-state its outputs).
//
///////////////////////////////////////////////////////////////////////////////

module inc_reg16_v1 (d, q, q_unbuf, latch, oe, inc, dec, reset);
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
   // nor #10 nor_74hct02_1 (latch0, latch, latch); // inverted
   // nor #10 nor_74hct02_2 (latch1, latch0, latch0);
   // //nor #10 nor_74hct02_3 (latch2, latch1, latch1); // inverted
   // //nor #10 nor_74hct02_4 (latch3, latch2, latch2);
   // //nor #10 nor_74hct02_5 (latch4, latch3, latch3); // inverted
   // nor #10 nor_74hct02_6 (xlatch0, latch, latch0);
   // nor #10 nor_74hct02_7 (xlatch, xlatch0, xlatch0);

   assign xlatch = latch;
   
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
   flipflop_273 reg0 (d[7:0], qc[7:0], load, reset);
   flipflop_273 reg1 (d[15:8], qc[15:8], load, reset);

   // We artifially use 175s so they can be reset for the benefic of
   // the simulator.
   //flipflop_175 reg0 (d[3:0],   qc[3:0], ,   load, reset);
   //flipflop_175 reg1 (d[7:4],   qc[7:4], ,   load, reset);
   //flipflop_175 reg2 (d[11:8],  qc[11:8], ,  load, reset);
   //flipflop_175 reg3 (d[15:12], qc[15:12], , load, reset);

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
// d latch /clear /toggle clock /reset  q nq
// -----------------------------------------
// X   X      X      X       X     0    0  1
// X   X      0      X       X     0    0  1
// X   X      1      0       \     1    FLIP
// 0   1      1      1       \     1    0  1
// 1   1      1      1       \     1    1  0
// X   0      1      1       \     1    NO CHANGE
//
// J = (d AND latch) OR (NOT /toggle)
// K = ((NOT d) AND latch) OR (NOT /toggle)
// FF_RESET = reg_reset AND clear
//
// I.e. one FF, 3x AND, 2x OR, 2x NOT.
//
// This is used for the L register. The I register uses a simpler version of
// this, which occupies the other half of the '112 and another quarter of the
// '32 (OR).
//
///////////////////////////////////////////////////////////////////////////////

// TODO: toggling L is done by open collector outputs now.
module reg_L_v0 (d, latch, clear, toggle, clock, reset, q, nq);
   input d;
   input latch;                 // Active HIGH.
   input clear;			// Active LOW.
   input toggle;		// Active high toggle signals.
   input clock;			// Clocks on NEGATIVE edge.
   input reset;			// Ative LOW.

   output q;
   output nq;

   tri0   d;
   wire   j, k, nd, j0, k0, ff_reset;
   wire   ntoggle;

   // Not-toggle.
   not #8 not_7404a (ntoggle, toggle);
   
   // Not-d.
   not #8 not_7404b (nd, d);
   
   initial begin
      $display("BOM: 7404");
      $display("BOM: 7408");
      $display("BOM: 7432");
   end

   // J/K/Toggle logic.
   and #8 and_7408a (j0, d, latch);
   and #8 and_7408b (k0, nd, latch);
   and #8 and_7408c (ff_reset, reset, clear);

   // J/K FF interface.
   or #8 or_7432a (j, j0, ntoggle);
   or #8 or_7432b (k, k0, ntoggle);

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




///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: A 16-bit register with increment control.
//
// NOTE: Implemented with four 74x193 4-bit counters and two 74x244 tri-state
// buffers (the '193 doesn't tri-state its outputs).
//
///////////////////////////////////////////////////////////////////////////////

module major_register (ibus, nread, nwrite, ninc, reset, regout, cout);
   inout [15:0]  ibus;
   input 	 nread, nwrite, ninc, reset;
   
   output [15:0] regout;
   output 	 cout;

   wire [15:0] 	 ibus;
   wire  	 nread, nwrite, ninc, reset;

   wire [15:0]	 regout;
   wire 	 cout;

   wire 	 co0, co1, co2;

   // Four '193s provide the register and increment functionality.
   counter_193 c0 (reset, nwrite, ibus[3:0],   ninc, 0, regout[3:0],   co0, );
   counter_193 c1 (reset, nwrite, ibus[7:4],   co0,  0, regout[7:4],   co1, );
   counter_193 c2 (reset, nwrite, ibus[11:8],  co1,  0, regout[11:8],  co2, );
   counter_193 c3 (reset, nwrite, ibus[15:12], co2,  0, regout[15:12], cout, );

   // Tri-state bufering
   buffer_541 buf_lo (nread, nread, regout[7:0], ibus[7:0]);
   buffer_541 buf_hi (nread, nread, regout[15:8], ibus[15:8]);

   // The two front panel buffers are not modelled.

endmodule // major_register


module reg_pc (ibus, nrpc, nwpc, nincpc, reset, pc);
   inout [15:0]  ibus;
   input 	 nrpc, nwpc, nincpc, reset;
   
   output [15:0] pc;

   wire [15:0] 	 ibus, pc;
   wire 	 nrpc, nwpc, nincpc, reset;

   // The register itself.
   major_register register (ibus, nrpc, nwpc, nincpc, reset, pc,);   
endmodule // reg_pc


module reg_dr (ibus, nrdr, nwdr, nincdr, reset, dr);
   inout [15:0]  ibus;
   input 	 nrdr, nwdr, nincdr, reset;
   
   output [15:0] dr;

   wire [15:0] 	 ibus, dr;
   wire 	 nrdr, nwdr, nincdr, reset;

   // The register itself.
   major_register register (ibus, nrdr, nwdr, nincdr, reset, dr,);   
endmodule // reg_dr


module reg_ac (ibus, nrac, nwac, nincac, reset, ac, fneg, fzero, ninccpl);
   inout [15:0]  ibus;
   input 	 nrac, nwac, nincac, reset;
   
   output [15:0] ac;
   output 	 fneg, fzero, ninccpl;

   wire [15:0] 	 ibus, ac;
   wire 	 nrac, nwac, nincac, reset;
   wire 	 fneg, fzero, ninccpl;

   // The register itself.
   major_register register (ibus, nrac, nwac, nincac, reset, ac, ninccpl);

   // The Zero Flag
   wire 	 cmp0, nfzero;
   comparator_688 comp_hi (ac[15:8], 0, 0, cmp0);
   comparator_688 comp_lo (ac[7:0], 0, cmp0, nfzero);
   not #6 not_fz (fzero, nfzero);

   // The Negative Flag (is really simple)
   assign fneg = ac[15];
endmodule // reg_ac

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the L Register
//
///////////////////////////////////////////////////////////////////////////////

// Behaviour:
//
// * Cleared on RESET# or CLL#.
// * Toggled on CPL# or FLTADD# (carry out signal from AC)
// * Set or cleared on ROLL instructions according to the 17th bit of
//   the output.

module reg_L (nreset, clk5, ncll, ncpl, nfltadd, isroll, roll16, fl);
   
   input nreset, clk5, ncll, ncpl, nfltadd, isroll, roll16;

   output fl;

   wire   nreset, clk5, ncll, ncpl, nfltadd, isroll, roll16;
   wire   fl;

   // Clear L on RESET# or CLL#.
   wire   nlclr;
   and #6 (nlclr, nreset, ncll);

   // Roll data output (generates LJ and LK)
   wire   nroll16, lj, lk;
   and #6 (lj, roll16, isroll);
   nand #6 (nroll16, 1, roll16);
   and #6 (lk, nroll16, isroll);

   // Toggles
   wire   toggle;
   nand #6 (toggle, ncpl, nfltadd);

   // Flip Flop inputs
   wire   j, k;
   or #6 (j, toggle, lj);
   or #6 (k, toggle, lk);

   // The register itself
   flipflop_112h reg_L (j, k, clk5, 1, nlclr, fl,);

endmodule // reg_L


// End of file.
