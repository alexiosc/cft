// REDESIGNED IN 2019
//
// ///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL BIT SHIFT/ROTATE UNIT
// 
///////////////////////////////////////////////////////////////////////////////


`ifndef serial_shifter_v
`define serial_shifter_v

`include "mux.v"
`include "counter.v"
`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module serial_shifter(nreset,
		      clk2, clk4,
		      nstart,
		      b, fl,
		      op_arithmetic, op_rotate, op_right, op_dist,
		      ibus, b_cp, flout);

   input         nreset;
   input         clk2, clk4;
   input         nstart;
   input [15:0]  b;
   input 	 fl;
   input 	 op_arithmetic;
   input 	 op_rotate;
   input	 op_right;
   input [3:0] 	 op_dist;

   output [15:0] ibus;
   output        b_cp;		// B register write clock;
   output 	 flout;		// FL output

   wire          nreset;
   wire          clk2, clk4;
   wire [15:0] 	 b;
   wire 	 fl;
   wire 	 op_arithmetic;
   wire 	 op_rotate;
   wire	         op_right;
   wire [3:0] 	 op_dist;

   // The clock quadruppler
   wire 	 clk2_delay, clk4_delay, x4clk;
   assign #14 clk2_delay = clk2;	// 2x7ns best case tPLH/tPHL for 74HC04)
   assign #14 clk4_delay = clk4;
   assign #3.4 x4clk = (clk2 ^ clk2_delay) ^ (clk4 ^ clk4_delay);

   // Main state machine (start, wait, count dist_pulses, stop)
   wire 	nstart_sync, tc;
   flipflop_74h ff_state(.d(nstart), .clk(clk2), .set(nreset), .rst(1'b1), .q(nstart_sync));
   counter_191  ctr_state(.p(op_dist), .npl(nstart_sync), .down(1'b1), .nce(tc), .cp(x4clk), .tc(tc));

   // Operation decoder
   wire 	nleft, nright;
   assign #4 nright = ~op_right;
   assign nleft = op_right;

   // Decide what goes in the LSB on left rotations and the MSB on right ones.
   wire 	lsb;
   wire 	msb;
   // Use 74AC253 to halve the propagation delay.
   mux_253h #6.5 msb_mux(.sel({op_rotate, op_arithmetic}), .i({fl, fl, b[15], 1'b0}), .oe(1'b0), .y(msb));
   mux_253h #6.5 lsb_mux(.sel({op_rotate, op_arithmetic}), .i({fl, fl, 1'b0, 1'b0}),  .oe(1'b0), .y(lsb));
   
   // The left rotator (using 74AC541)
   buffer_541 #7 buf_rol_hi(.a({b[6:0], lsb}),  .y(ibus[7:0]),  .oe1(tc), .oe2(nleft));
   buffer_541 #7 buf_rol_lo(.a({b[14:7]}),      .y(ibus[15:8]), .oe1(tc), .oe2(nleft));
   
   // The right rotator (using 74AC541)
   buffer_541 #7 buf_ror_hi(.a(b[8:1]),         .y(ibus[7:0]),  .oe1(tc), .oe2(nright));
   buffer_541 #7 buf_ror_lo(.a({msb, b[15:9]}), .y(ibus[15:8]), .oe1(tc), .oe2(nright));

   // Generate write pulses
   wire 	shiftclk;
   assign #9 shiftclk = (nstart_sync & x4clk) | tc;
   assign b_cp = shiftclk;

   // Generate the L output (B15 left operations, B0 if right operations)
   mux_2g157 l_mux (.sel(nleft), .a(b[15]), .b(b[0]), .ng(1'b0), .y(flout));
   
endmodule // serial_shifter


`endif //  `ifndef serial_shifter_v
