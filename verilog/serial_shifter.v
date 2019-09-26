///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL BIT SHIFT/ROTATE UNIT
// 
///////////////////////////////////////////////////////////////////////////////

// DESIGNED FOR THE 2019 OF THE CFT


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
		      b, fl, nwrite_alu,
		      op_arithmetic, op_rotate, op_right, op_dist,
		      noe,
		      ibus, b_cp, flout);

   input         nreset;
   input         clk2, clk4;
   input         nstart;
   input [15:0]  b;
   input 	 fl;
   input 	 nwrite_alu;
   input 	 op_arithmetic;
   input 	 op_rotate;
   input	 op_right;
   input [3:0] 	 op_dist;
   input         noe;

   output [15:0] ibus;
   output        b_cp;		// B register write clock;
   output 	 flout;		// FL output

   wire          nreset;
   wire          clk2, clk4;
   wire [15:0] 	 b;
   wire 	 fl;
   wire 	 nwrite_alu;
   wire 	 op_arithmetic;
   wire 	 op_rotate;
   wire	         op_right;
   wire [3:0] 	 op_dist;
   wire          noe;

   // The clock quadruppler
   wire 	 clk2_delay, clk4_delay, x4clk;
   assign #14 clk2_delay = clk2;	// 2x7ns best case tPLH/tPHL for 74HC04)
   assign #14 clk4_delay = clk4;
   assign #5 x4clk = (clk2 ^ clk2_delay) ^ (clk4 ^ clk4_delay);

   // Main state machine
   wire 	nstart_sync, tc;
   flipflop_74h ff_state(.d(nstart), .clk(clk2), .set(nreset), .rst(1'b1), .q(nstart_sync));
   counter_191  ctr_state(.p(op_dist), .npl(nstart_sync), .down(1'b1), .nce(tc), .cp(x4clk), .tc(tc));

   // Operation decoder
   wire 	nleft, nright;
   assign nright = ~op_right;
   assign nleft = op_right;

   // Decide what goes in the LSB on left rotations and the MSB on right ones.
   wire 	lsb;
   wire 	msb;
   mux_253h msb_mux(.sel({op_rotate, op_arithmetic}), .i({fl, fl, b[15], 1'b0}), .oe(1'b0), .y(msb));
   mux_253h lsb_mux(.sel({op_rotate, op_arithmetic}), .i({fl, fl, 1'b0, 1'b0}),      .oe(1'b0), .y(lsb));
   
   // The left rotator
   buffer_541   buf_rol_hi(.a({b[6:0], lsb}),  .y(ibus[7:0]),  .oe1(tc), .oe2(nleft));
   buffer_541   buf_rol_lo(.a({b[14:7]}),      .y(ibus[15:8]), .oe1(tc), .oe2(nleft));
   
   // The right rotator
   buffer_541   buf_ror_hi(.a(b[8:1]),         .y(ibus[7:0]),  .oe1(tc), .oe2(nright));
   buffer_541   buf_ror_lo(.a({msb, b[15:9]}), .y(ibus[15:8]), .oe1(tc), .oe2(nright));

   // Generate write pulses
   wire 	shiftclk;
   assign #9 shiftclk = (nstart_sync & x4clk) | tc;
   assign b_cp = shiftclk;

   // Generate the L output
   //wire 	lmuxout;
   mux_1g_157 l_mux (.sel(nleft), .a(b[15]), .b(b[0]), .ng(1'b0), .y(flout));
   //flipflop_74h l_ff(.d(lmuxout), .clk(shiftclk), .set(1'b1), .rst(nreset), .q(flout));
   
   // assign #15 acarry = clk;
   // assign #7 bcarry = acarry ^ clk;

   // // 18-state counter, last state is ‘stop’
   // counter_193 ctr_a16(.clear(1'b0), .load(nstart), .p(4'b0000),
   // 		     .count_up(clken & clk), .count_down(1'b1),
   // 		     .q(a[3:0]), .carry(acarry));
   // flipflop_74h ctr_a17(.d(1'b1), .clk(acarry), .set(nreset), .rst(nstart), .q(a[4]));
   // flipflop_74h ff_clken(.d(a[4]), .clk(clk), .set(nstart), .rst(nreset), .qn(clken));

   // counter_193 ctr_b16(.clear(1'b0), .load(nstart), .p(op_dist),
   // 		     .count_up(clken & clk), .count_down(1'b1),
   // 		     .q(b[3:0]), .carry(bcarry));
   // flipflop_74h ctr_b17(.d(1'b1), .clk(bcarry), .set(nreset), .rst(nstart), .q(b[4]));

   // assign clken = 1'b1;
   

   // flipflop_74h ff_clken(.d(1'b0), .clk(a[4]), .set(nstart), .rst(nreset), .q(clken));
   
   
   // // 17-state counter. This is preset to the roll/shift distance.
   // counter_193 ctr_b16(.clear(1'b0), .load(nstart), .p(op_dist),
   // 		     .count_up(clk), .count_down(clken),
   // 		     .q(b[3:0]), .carry(bcarry));
   // flipflop_74h ctr_n17(.d(bcarry), .clk(clk), .set(start), .rst(1'b1), .qn(b[4]));




   
   // mux_1g157 endmux(.sel(op_right), .i1(ntgtstop), .i2(nsrcstop), .oe(1'b0), .y(nstop));
   // flipflop_74h ff_state1(.d(1'b0), .clk(nstop), .set(nstart), .rst(nreset), .q(count));

   // // Multiplex the source and destination counts.
   // mux_157 mux_src(.sel(op_right), .i1(4'b0000), .i2(op_dist), .oe(1'b0), .y(srcp));
   // mux_157 mux_tgt(.sel(op_right), .i1(op_dist), .i2(4'b0000), .oe(1'b0), .y(tgtp));

   // counter_193 ctr_src(.clear(1'b0), .load(nstart), .p(srcp),
   // 		       .count_up(clk), .count_down(count),
   // 		       .q(src[3:0]), .carry(ntcsrc));
   // flipflop_74h ctr_src16(.d(1'b1), .clk(ntcsrc), .set(1'b1), .rst(nstart), .q(src[4]));
   // flipflop_74h ctr_src17(.d(src[4]), .clk(ntcsrc), .set(1'b1), .rst(nstart), .qn(nsrcstop));
   
   // counter_193 ctr_tgt(.clear(1'b0), .load(nstart), .p(tgtp),
   // 		       .count_up(clk), .count_down(count),
   // 		       .q(tgt), .carry(ntctgt));
   // flipflop_74h ctr_tgt16(.d(1'b1), .clk(ntctgt), .set(1'b1), .rst(nstart), .q(tgt[4]));
   // flipflop_74h ctr_tgt17(.d(tgt[4]), .clk(clk), .set(1'b1), .rst(nstart), .qn(nsrcstop));

   // latch_573 latch_out_lo(.d(8'b00000000), .q(ibus[7:0]), .nle(nstop), .nclr(1'b1));
   // latch_573 latch_out_hi(.d(8'b00000000), .q(ibus[15:8]), .nle(nstop), .nclr(1'b1));

endmodule // serial_shifter


`endif //  `ifndef serial_shifter_v
