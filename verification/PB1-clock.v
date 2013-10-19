///////////////////////////////////////////////////////////////////////////////
//
// PB1-clock.v -- Processor Board A, Clock Generator
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`include "counter.v"
`include "buffer.v"
`include "vibrator.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board A, Clock Generator
//
///////////////////////////////////////////////////////////////////////////////

module PB1_clock(nreset,
		 fpclken, fpustep,
		 rstclk,
		 clk1, clk2, clk3, clk4, nt12, nt34);

   input  nreset;
   input  fpclken;
   input  fpustep;

   output rstclk;
   output clk1;
   output clk2;
   output clk3;
   output clk4;
   output nt12;
   output nt34;


   wire fastclock;
   
   vibrator_xo #63 xtal1(.q(fastclock));

   // This is used by the reset sequencer
   assign rstclk = fastclock;

   // The current PB1 has no on-board slow clocks to save board estate. Slow
   // clocks live on the front panel board, which makes more sense -- without the
   // front panel, they'd be unusable anyway.
   
   wire rawclock0, rawclock1;

`ifdef OLD_STYLE_SLOW_CLOCKS

   // Simulate the three clock generators using pronounced duty cycles. To make
   // testing bearable, the slow clocks don't run at ~250 Hz and ~25 Hz. They
   // run at 4 MHz (250 ns period) and 1 MHz (1000 ns period)
   // respectively. These clocks are divided by four to generate the system
   // clock, so the numbers make more sense. Compare the normal clock
   // (fastclock), which is 16 MHz (63.5 ns period) before division.

   wire slowclock, testclock;
   
   vibrator_555 #(150, 100) ic001a_556_clockgen(.q(slowclock));
   vibrator_555 #(920, 80) ic001b_556_clockgen(.q(testclock));
   
   // Multiplex the clock sources. Half of a '253 is used. p1_fpfast is pulled
   // high, p1_fplow is pulled low (this is done in the input signal
   // definition above).
   mux_253h ic002a_hct253_clockmux (.sel({fpslow, fpfast}),
   				    .i({fastclock, testclock, fastclock, slowclock}),
   				    .oe(0), .y(rawclock0));

   // Run/Stop/Step Control. fpustep is pulled low, fpclken is pulled high.
   mux_253h ic003a_253_runcontrol (.sel({fpclken, fpustep}),
   				   .i({rawclock0, rawclock0, 1'b1, 1'b0}),
   				   .oe(0), .y(rawclock1));

`else // !`ifdef EXTERNAL_CLOCKS

   // Run/Stop/Step Control. fpustep is pulled low, fpclken is pulled high.
   mux_253h ic003a_253_runcontrol (.sel({fpclken, fpustep}),
   				    .i({fastclock, fastclock, 2'b10}),
   				    .oe(0), .y(rawclock1));
   
`endif // !`ifdef EXTERNAL_CLOCKS


   // Phase counter
   wire [3:0] 	  phase_q;
   counter_193 ic004_193_phase (.clear(0), .load(nreset), .p(4'b0000),
   				.count_up(rawclock1), .count_down(1), .q(phase_q));

   // Phase decoders
   wire 	  nt12;
   wire [3:0] 	  ph90, ph180;

   // ph90 are clk1-4. Ph180[1:0] are T12# and T34#.
   //
   // phase_q       00011122233300011122233300011122233300
   //                   ________    ________    ________
   // φ90[0]   CLK1 \__/        \__/        \__/        \_
   //               :__    _____:__    ________    _______
   // φ90[1]   CLK2 /  \__/     :  \__/        \__/
   //               :_____:   __:_____    ________    ____
   // φ90[2]   CLK3 :     \__/  :     \__/        \__/
   //               :_____:__   :_____:__    ________    _
   // φ90[3]   CLK4 :     :  \__/     :  \__/        \__/
   //               :     :_____:     :_____:      _____
   // φ180[0]  T12# \_____/     \_____/     \_____/     \_
   //                _____       _____:     :_____       _
   // φ180[1]  T34# /     \_____/     \_____/     \_____/
   
   demux_139h ic005a_139_ph90 (.g(0), .a(phase_q[1:0]), .y(ph90));
   demux_139h ic005b_139_ph180 (.g(0), .a({1'b0, phase_q[1]}), .y(ph180));
   
   assign clk1 = ph90[0];
   assign clk2 = ph90[1];
   assign clk3 = ph90[2];
   assign clk4 = ph90[3];
   assign nt12 = ph180[0];
   assign nt34 = ph180[1];
   
endmodule // PB1_clock




// End of file.
