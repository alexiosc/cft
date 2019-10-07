///////////////////////////////////////////////////////////////////////////////
//
// THE SKIP UNIT
//
// REDESINGED IN 2019
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


module sbu(clk4, nreset, nskipext,
	   ir, cond, fv, fl, fz, fn,
	   nskip);

   input        clk4;
   input 	nreset;
   input [15:0] ir;
   input 	nskipext;
   input [3:0] 	cond;
   input 	fv, fl, fz, fn;

   output 	nskip;


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
   or #6 (s, sa, sb);

   // Fourth stage: optionally negate the result with an XOR gate if IR4 is set.
   wire 	if_branch;
   xor #11 (if_branch, s, ir[4]);
   
   // Use a couple of XOR gates to avoid hazards because we need to invert cond[3].
   wire 	cond3_0, cond3_1;
   xor #11 (cond3_0, cond[3], 1'b0);
   xor #11 (cond3_1, cond[3], 1'b1);

   // Condition multiplexing
   tri1 	nskip0, nskip1;
   mux_251 muxlo (.sel(cond[2:0]), .d({ir[9:3], 1'b1}),
		  .ne(cond3_0), .ny(nskip0));
   mux_251 muxhi (.sel(cond[2:0]), .d({if_branch, 1'b1, fn, fz, fl, fv, 2'b1}),
		  .ne(cond3_1), .ny(nskip1));

   // Combine the outputs
   wire 	nskip2;
   assign #6 nskip2 = nskip0 & nskip1 & nskipext;

   // Register SKIP# for the duration of this micro-instruction.
   wire [3:0] 	nq;
   flipflop_74h skipff (.d(nskip2), .clk(clk4), .set(nreset), .rst(1'b1), .q(nskip));

endmodule // sbu

     
`endif //  `ifndef sbu_v
