///////////////////////////////////////////////////////////////////////////////
//
// THE SKIP UNIT
//
// REDESIGNED IN 2019
//
// NOTES: the Skip/Branch Unit allows the Control Unit to make decisions and to
// allow code to make decisions.
//
// The original document from 2011 included a ton of documentation and proofs
// which I've removed for now.
// 
///////////////////////////////////////////////////////////////////////////////


`ifndef sbu_v
`define sbu_v

`include "mux.v"
`include "demux.v"
`include "flipflop.v"

`timescale 1ns/1ps


module sbu(nreset, clk4, nskipext,
	   ir, cond, fv, fl, fz, fn,
	   cext8, cext9, cext10,
	   ncond);

   input        clk4;
   input 	nreset;
   input [15:0] ir;
   input [4:0] 	cond;
   inout 	nskipext;
   input 	fv, fl, fz, fn;
   inout 	cext8, cext9, cext10;

   tri1  	nskipext;
   tri0 	cext8, cext9, cext10; // Reserved (and pulled down) for future expansion.

   output 	ncond;

   // Flag (macrocode) skip logic, for branch instructions. This simultaneously
   // detects if a branch instruction has been specified and if the branch
   // should be taken.
   wire 	sv, sl, sz, sn;
   and #7 (sv, fv, ir[0]);
   and #7 (sl, fl, ir[1]);
   and #7 (sz, fz, ir[2]);
   and #7 (sn, fn, ir[3]);

   // Second stage: or the previous results.
   wire 	sa, sb;
   or #7 (sa, sv, sl);
   or #7 (sb, sz, sn);

   // Third stage: or them into a single signal
   wire 	s;
   or #7 (s, sa, sb);

   // Fourth stage: optionally negate the result with an XOR gate if IR4 is set.
   wire 	if_branch;
   xor #20 (if_branch, s, ir[4]); // Typ. 11ns @ 5V, 15pF for HC, but going with 6V max.

   // COND decoder. Enables mux 0 on COND=00xxx and mux 1 on
   // COND=01xxx. We decode cond[4] but do not use it.
   wire [3:0] 	y;
   wire 	ncen0, ncen1;
   demux_139h cond_decoder(.ng(1'b0), .a(cond[4:3]), .y(y));
   assign { ncen1, ncen0 } = y[1:0];

   // Condition multiplexing
   tri1 	ncond00, ncond01;
   mux_251 muxlo (.sel(cond[2:0]),
		  .d({
		      ir[6], // COND 0111, IR6
		      ir[5], // COND 0110, IR5
		      ir[4], // COND 0101, IR4
		      ir[3], // COND 0100, IR3
		      ir[2], // COND 0011, IR2
		      ir[1], // COND 0010, IR1
		      ir[0], // COND 0001, IR0
		      1'b0   // COND 0000, idle (always true)
		      }),
		  .ne(ncen0), .ny(ncond00));
   mux_251 muxhi (.sel(cond[2:0]),
		  .d({
		      if_branch, // COND 1111, SKP instruction logic
		      fn,        // COND 1110, FN
		      fz,        // COND 1101, FZ
		      fl,        // COND 1100, FL
		      fv,        // COND 1011, FV
		      cext10,	 // COND 1010, CEXT10 (Reserved)
		      cext9,     // COND 1001, CEXT9 (Reserved)
		      cext8	 // COND 1000, CEXT8 (Reserved)
		      }),
		  .ne(ncen1), .ny(ncond01));

   // Combine the outputs of the muxes and throw nskipext into the mix. We used
   // to use a wired OR here, but it went away many moons ago in favour of an
   // actual gate. Faster and cleaner.
   wire 	ncond0;
   assign #7 ncond0 = ncond00 & ncond01 & nskipext; // Double the 3.5ns PD of the LVC family

   // Register SKIP# for the duration of this micro-instruction. Use a latch to
   // protect against metastability.

   wire 	ncond1;
   latch_1g373  ncond_latch (.noe(1'b0), .le(clk4), .d(ncond0), .q(ncond1));
   flipflop_74h ncond_ff    (.d(ncond1), .clk(clk4), .nset(nreset), .nrst(1'b1), .q(ncond));
endmodule // sbu
     
`endif //  `ifndef sbu_v
