///////////////////////////////////////////////////////////////////////////////
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
// The CFT clock is a four-phase, 75% duty cycle clock with two additional
// outputs.
//          _   _   _   _   _   _   _   _   _   _   
//  CLK   _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
//        _____     ________________     ___________
//  CLK1       \___/                \___/           
//        _________     ________________     _______
//  CLK2           \___/                \___/       
//        _____________     ________________     ___
//  CLK3               \___/                \___/   
//        _________________     ________________    
//  CLK4                   \___/                \___
//  ___   _____________         ____________        
//  T34                \_______/            \_______
//        __________________   ___________________  
//  WSTB                    |_|                   |_
//
///////////////////////////////////////////////////////////////////////////////

module clock_generator (nreset, fpclk, nfpclk_or_clk,
			clk1, clk2, clk3, clk4, t34, wstb);

   parameter cp = 63.5;

   input nreset;		// Reset input
   input fpclk;			// Front panel clock
   input nfpclk_or_clk;		// low = fpclk, high = 4 MHz clock

   // 75% duty cycle clock outputs
   output clk1;			// 0° phase clock output
   output clk2;			// 90° phase clock output
   output clk3;			// 180° phase clock output
   output clk4;			// 270° phase clock output

   output t34;
   output wstb;

   reg clk;

   // Simulate the oscillator
   initial begin
      clk = 0;
   end
   always begin
      #(cp / 2) clk = ~clk;
   end

   // Clock source multiplexer
   wire clkin;
   mux_1g157 clksource (.sel(nfpclk_or_clk), .i1(fpclk), .i2(clk), .oe(1'b0), .y(clkin));

   // Two phase clock counters.
   wire [3:0] q;
   counter_191 ctr1 (.p(4'b0000), .npl(nreset), .down(1'b0), .nce(1'b0), .cp(clkin), .q(q));

   // Phase clock generators ('139 decoders)
   wire [3:0] tmp;
   demux_139h phasegen1 (.g(1'b0), .a({q[1], q[0]}), .y({clk4, clk3, clk2, clk1}));
   demux_139h phasegen2 (.g(1'b0), .a({1'b0,  q[1]}), .y(tmp));
   assign t34 = tmp[1];

   // Write strobe (WSTB) generation
   wire       nq0;

   assign #3 nq0 = ~q[0];
   assign #5 wstb = clk4 | nq0;
endmodule // clock_generator

`endif //  `ifndef clock_v

// End of file.
