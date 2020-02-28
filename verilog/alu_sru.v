///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL BIT SHIFT/ROTATE UNIT
// 
///////////////////////////////////////////////////////////////////////////////

// DESIGNED FOR THE 2019 OF THE CFT


`ifndef alu_sru_v
`define alu_sru_v

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

module alu_sru(nreset,
		      clk2, clk4,
		      nstart,
		      b, fl,
		      op_arithmetic, op_rotate, op_right, op_dist,
		      ibus, bcp, flout, flcp);

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
   output        bcp;		// B register write clock;
   output 	 flout;		// FL output
   output 	 flcp;		// FL clock

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
   assign #5 x4clk = (clk2 ^ clk2_delay) ^ (clk4 ^ clk4_delay);

   // Main state machine
   wire 	nstart_sync, tc;
   flipflop_74h ff_state(.d(nstart), .clk(clk2), .nset(nreset), .nrst(1'b1), .q(nstart_sync));
   counter_191  ctr_state(.p(op_dist), .npl(nstart_sync), .down(1'b1), .nce(tc), .cp(x4clk), .tc(tc));

   // Operation decoder
   wire 	nleft, nright;
   assign nright = ~op_right;
   assign nleft = op_right;

   // Decide what goes in the LSB on left rotations and the MSB on right
   // ones. This is what allows the same circuitry to do rotations, shifts, and
   // optional sign-extensions.
   wire 	lsb;
   wire 	msb;
   mux_253h msb_mux(.sel({op_rotate, op_arithmetic}), .i({b[0], fl, b[15], 1'b0}), .noe(1'b0), .y(msb));
   mux_253h lsb_mux(.sel({op_rotate, op_arithmetic}), .i({b[15], fl, 1'b0, 1'b0}),  .noe(1'b0), .y(lsb));
   
   // The left rotator
   buffer_541   buf_rol_lo(.a({b[6:0], lsb}),  .y(ibus[7:0]),  .noe1(tc), .noe2(nleft));
   buffer_541   buf_rol_hi(.a({b[14:7]}),      .y(ibus[15:8]), .noe1(tc), .noe2(nleft));
   
   // The right rotator
   buffer_541   buf_ror_lo(.a(b[8:1]),         .y(ibus[7:0]),  .noe1(tc), .noe2(nright));
   buffer_541   buf_ror_hi(.a({msb, b[15:9]}), .y(ibus[15:8]), .noe1(tc), .noe2(nright));

   // Generate write pulses at every step.
   wire 	shiftclk;
   assign #9 shiftclk = (nstart_sync & x4clk) | tc;
   assign bcp = shiftclk;

   // Generate the FL clock output
   // TODO: TEST THIS!
   assign #7 flcp = shiftclk & op_rotate;

   // Generate the L output
   //wire 	lmuxout;
   mux_1g157 l_mux (.sel(nleft), .a(b[15]), .b(b[0]), .ng(1'b0), .y(flout));

endmodule // alu_sru

`endif //  `ifndef alu_sru_v

// End of file.
