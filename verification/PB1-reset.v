///////////////////////////////////////////////////////////////////////////////
//
// PB1-reset.v -- Processor Board A, Reset Handling
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
// Processor Board A, Reset Handling
//
///////////////////////////////////////////////////////////////////////////////

module PB1_reset(nreset, clk, nfpreset, powerok, nrsthold, ibus);

   inout wand 	 nreset;
   input 	 clk;
   input 	 nfpreset;
   input 	 powerok;

   output [15:0] ibus;
   output 	 nrsthold;

   // Much of this sheet is a collection of open drain reset sources,
   // all wired together.

   // Connect all the reset sources to RESET#. We don't bother emulating
   // Schmitt inverters connected to open drain inverters. We also don't bother
   // emulating the optional reset button.
   assign nreset = nfpreset; // pulled up
   assign nreset = powerok;  // pulled up

   // The reset counter generates RSTHOLD#
   wire [7:0] 	  nrsthold_q;
   counter_590 ic008_590_reset(.clk(clk), .ccken(nrsthold), .cclr(nreset),
   			       .rck(clk), .g(0), .q(nrsthold_q));

   // Our reset counter is hardwired for 2µs pulses. The hardware has
   // a jumper to allow 0.125, 0.25, 0.5, 1, 2, 4 or 8µs periods. We
   // need simulations to finish quickly, so reset must be quick.
   assign nrsthold = nrsthold_q[5];

   // The reset vector. Outputs FFF0 on the IBUS while RSTHOLD# is asserted.
   buffer_541 ic009_541_resetvector(.oe1(nrsthold), .oe2(nrsthold), .a(8'hf0), .y(ibus[7:0]));
   buffer_541 ic010_541_resetvector(.oe1(nrsthold), .oe2(nrsthold), .a(8'hff), .y(ibus[15:8]));
   
endmodule // PB1_reset


// End of file.
