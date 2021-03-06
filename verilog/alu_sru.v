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

module alu_sru(nreset, nrsthold,
	       clk2, clk3, clk4,
	       nstart,
	       b, fl,
	       op_arithmetic, op_rotate, op_right, op_dist,
	       ibus, bcp, flout_sru, nsru_run);

   input         nreset;
   input         nrsthold;
   input         clk2, clk3, clk4;
   input         nstart;
   input [15:0]  b;
   input 	 fl;
   input 	 op_arithmetic;
   input 	 op_rotate;
   input	 op_right;
   input [3:0] 	 op_dist;

   output [15:0] ibus;
   output        bcp;		        // B register write clock;
   output 	 flout_sru;		// FL output
   output 	 nsru_run;		// Low while the SRU is running

   wire          nreset;
   wire          clk2, clk4;
   wire [15:0] 	 b;
   wire 	 fl;
   wire 	 op_arithmetic;
   wire 	 op_rotate;
   wire	         op_right;
   wire [3:0] 	 op_dist;

   // The clock quadruppler.
   
   // wire 	 clk2_delay, clk4_delay, clk2_xor, clk4_xor, x4clk;
   // assign #14 clk2_delay = clk2;	// 2x7ns best case tPLH/tPHL for 74HC04)
   // assign #14 clk4_delay = clk4;
   // assign #8  clk2_xor = clk2 ^ clk2_delay;
   // assign #8  clk4_xor = clk4 ^ clk4_delay;
   // assign #8  x4clk = clk2_xor ^ clk4_xor;

   reg 		 x4clk_pll;
   wire 	 x4clk;
   initial begin
      x4clk_pll = 0;
   end
   always @(posedge clk4) begin
      x4clk_pll = 1;
      #31.25 x4clk_pll = 0;

      #31.25 x4clk_pll = 1;
      #31.25 x4clk_pll = 0;

      #31.25 x4clk_pll = 1;
      #31.25 x4clk_pll = 0;

      #31.25 x4clk_pll = 1;
      #31.25 x4clk_pll = 0;
   end // always @ (posedge clk4)
   assign #4 x4clk = ~x4clk_pll;

   // Main state machine
   wire 	nstart_sync, tc;
   flipflop_74h ff_state(.d(nstart), .clk(clk3), .nset(nreset), .nrst(1'b1), .q(nstart_sync));
   assign nsru_run = tc;

   // FIXME: during reset, the counter can run, driving the IBus and causing
   // bus contention. Potential solutions:
   //
   // 1. Add a flip-flop to stop this. The FF should be driving the count
   // enable signal and/or the rotator output enables.
   //
   // 2. The rotators should enable their outputs on (tc | nrsthold), which
   // provides a long interlock to allow the counter to terminate, no matter
   // what value it resets to.
   //
   // 3. Force a counter load with zero during reset. (this may have a high
   // chip count: a MUX plus one gate or five gates).

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

   // The counter may reset to any value. If that value is non-zero, it'll
   // start counting down (and driving the IBus). This will cause bus contention
   // during reset. So disable the IBus drivers while nrsthold is asserted (0).

   // TODO: VERIFY THIS
   wire 	nen;
   mux_1g157 reset_interlock (.sel(nrsthold), .a(1'b1), .b(tc), .y(nen));

   initial begin
      #100 ctr_state.q <= 6;
   end
   
   // The left rotator
   buffer_541   buf_rol_lo(.a({b[6:0], lsb}),  .y(ibus[7:0]),  .noe1(nen), .noe2(nleft));
   buffer_541   buf_rol_hi(.a({b[14:7]}),      .y(ibus[15:8]), .noe1(nen), .noe2(nleft));
   
   // The right rotator
   buffer_541   buf_ror_lo(.a(b[8:1]),         .y(ibus[7:0]),  .noe1(nen), .noe2(nright));
   buffer_541   buf_ror_hi(.a({msb, b[15:9]}), .y(ibus[15:8]), .noe1(nen), .noe2(nright));

   // Generate write pulses at every step.
   wire 	shiftclk;
   assign #9 shiftclk = (nstart_sync & x4clk) | tc;
   assign bcp = shiftclk;

   // // Generate the FL clock output
   // assign #7 flcp_sru = op_rotate == 1 ? shiftclk : 1'b1;

   // wire 	flout;
   // flipflop_74h #(5,5) fi_fl    (.d(flout), .clk(flcp_sru), .nset(1'b1), .nrst(nreset), .q(flout_sru));

   // Generate the L output
   // TODO: VERIFY THIS.
   mux_1g157 l_mux (.sel(nleft), .a(b[15]), .b(b[0]), .y(flout_sru));
   // mux_1g157 l_mux (.sel(nleft), .a(b[15]), .b(b[0]), .ng(1'b0), .y(flout));

endmodule // alu_sru

`endif //  `ifndef alu_sru_v

// End of file.
