///////////////////////////////////////////////////////////////////////////////
//
// PB2-PC.v -- Processor Board B, Program Counter
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WPCRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PPCTICULPC PURPOSE.  See the
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
// Processor Board B, Program Counter
//
///////////////////////////////////////////////////////////////////////////////

module PB2_PC(reset, nrpc, nwpc, nincpc, ibus, pc);

   input 	 reset;
   input 	 nrpc;
   input 	 nwpc;
   input 	 nincpc;

   inout [15:0]  ibus;

   output [15:0] pc;


   wire 	 c0, c1, c2;

   // A 16-bit up counter with parallel load.
   counter_193 ic067_193_pc0(.clear(reset), .load(nwpc),
			     .count_up(nincpc), .count_down(1),
			     .p(ibus[3:0]), .q(pc[3:0]), .carry(c0));
   counter_193 ic068_193_pc1(.clear(reset), .load(nwpc),
			     .count_up(c0), .count_down(1),
			     .p(ibus[7:4]), .q(pc[7:4]), .carry(c1));
   counter_193 ic069_193_pc2(.clear(reset), .load(nwpc),
			     .count_up(c1), .count_down(1),
			     .p(ibus[11:8]), .q(pc[11:8]), .carry(c2));
   counter_193 ic070_193_pc3(.clear(reset), .load(nwpc),
			     .count_up(c2), .count_down(1),
			     .p(ibus[15:12]), .q(pc[15:12]));

   // Tri-stating buffering
   buffer_541 ic071_541_pclo(.oe1(nrpc), .oe2(0),
			     .a(pc[7:0]), .y(ibus[7:0]));
   buffer_541 ic072_541_pchi(.oe1(nrpc), .oe2(0),
			     .a(pc[15:8]), .y(ibus[15:8]));

   // We do not model the front panel buffers.
   

endmodule // PB2_PC


// End of file.
