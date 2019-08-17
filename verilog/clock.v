//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Clock generator and reset controller.
//
// NOTES: I want to experiment with different clocks, and the best and
// easiest way is to use an appropriate programmable part for this. I
// have a lot of Atmega 8s lying around, so I'll use one of those. I
// can program them to issue custom clock pulses.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef clock_v
`define clock_v

`include "flipflop.v"
`include "mux.v"
`include "vibrator.v"
`include "counter.v"
`include "demux.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: CLOCK GENERATOR
//
// NOTES:
//
// The CFT clock is a four-phase clock. Clock signals CLK1, CLK2, CLK3, CLK4
// are available. They're 75% duty cycle clocks with a phase difference of 90°
// between them so that two transitions happen at once, one positive, one negative.
//
// CLOCK is derived from the raw crystal by a division by a certain factor (e.g
// 8) On actual hardware, ratios between 1 and 16 are available, as well as
// different base frequencies, but that's beyond the scope of this simulation.
//          _   _   _   _   _   _   _   _   _   _   _   _   _ 
// RAWCLK _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |
//            _______         _______         _______      
//  CLK1  ___|       |_______|       |_______|       |_______
//                _______         _______         _______      
//  CLK2  _______|       |_______|       |_______|       |___
//        ___         _______         _______         _______      
//  CLK3     |_______|       |_______|       |_______|       |
//        _______         _______         _______         ___
//  CLK4         |_______|       |_______|       |_______|   
//            _______     _______     _______     _______     
//  CLK5  ___|       |___|       |___|       |___|       |___|
//
// The clock generator has three states of operation:
//
// 1. Running. Clock pulses are output as normal.
//
// 2. Halted. No clock pulses are output. An asynchronous signal (e.g. from the
// front panel) must be put on the RUN line to re-enable to clock.
//
// 3. Single step. External pulses must come in to step the clock
// generator. These are not divided. Slow stepping must be implemented on the
// front panel.
//
// /RESET RAWCLK /HALT RUN STEP   State
// ----------------------------------------------------------------------------
//   0      X      1    X   X     The clock is enabled.
//   X      X      0    X   X     The clock is halted.
//   1      \      1    1   X     The clock is enabled. 
//   X      X      X    X   \     A single clock pulse is output.
//
// When the clock is halted, the STEP signal from the front panel may be used
// to do single- and slow-stepping. This is an external signal, obviously.
//
///////////////////////////////////////////////////////////////////////////////

// TODO: This uses the old naming for the clocks.
module clock(fpclk, nfpclk_or_clk, nreset,
	     clk1, clk2, clk3, clk4, t34, wstb);
   parameter rate = 62.5;	// 16 MHz.

   input fpclk;			// Slow/step clock from the front panel.
   input nfpclk_or_clk;		// When low: use FPCLK. Otherwise, use CLK.
   input nreset;		// RESET# signal.
   
   output clk1;
   output clk2;
   output clk3;
   output clk4;
   output t34;
   output wstb;
   
   reg clk;

   wire [3:0] q0, q1;
   wire       clkin;

   // Simulate the oscillator
   initial begin
      clk = 0;
   end
   always begin
      #(rate / 2) clk = ~clk;
   end

   counter_191 ctr0 (.p(4'b0000), .npl(nreset), .down(1'b0), .nce(1'b0), .cp(clkin), .q(q0));
   counter_191 ctr1 (.p(4'b0001), .npl(nreset), .down(1'b0), .nce(1'b0), .cp(clkin), .q(q1));

   mux_2g157 clkmux (.sel(nfpclk_or_clk), .a(fpclk), .b(clk), .ng(1'b0), .y(clkin));

   wire [3:0] y0, y1;
   demux_139h demux0 (.g(1'b0), .a(q0[1:0]), .y(y0));
   demux_139h demux1 (.g(1'b0), .a({1'b0, q0[1]}), .y(y1));

   assign clk1 = y0[0];
   assign clk2 = y0[1];
   assign clk3 = y0[2];
   assign clk4 = y0[3];
   assign t34 = y1[1];
   assign #4 wstb = clk4 | q1[0];


endmodule // clock_generator

`endif //  `ifndef clock_v

// End of file.
