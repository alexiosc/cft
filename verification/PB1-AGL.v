///////////////////////////////////////////////////////////////////////////////
//
// PB1-AGL.v -- Processor Board A, Address Generation Logic
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
// Processor Board A, Address Generation Logic
//
///////////////////////////////////////////////////////////////////////////////

module PB1_AGL(pc10_15, ir, nragl, nend, ibus);

   input [5:0]  pc10_15;
   input [15:0] ir;
   input 	nragl;
   input 	nend;

   output [15:0] ibus;
   
   tri0 [7:0] 	 page;

   // A multiplexer using a tri-stated flipflop and pull-down
   // resistors. Outputs PC[15:10] if IR[10] is 1, otherwise 6'b000000 (as a
   // result of pulling down the undriven lines).
    flipflop_374 ic037_574_agl (.d({2'b00, pc10_15}), .oc(ir[10]),
			       .clk(nend), .q(page));

   // Tri-state buffers for driving the IBUS when required.
   buffer_541 ic038_541_agllo (.oe1(nragl), .oe2(0),
			       .a(ir[7:0]), .y(ibus[7:0]));
   buffer_541 ic039_541_aglhi (.oe1(nragl), .oe2(0),
			       .a({page[5:0], ir[9:8]}), .y(ibus[15:8]));
   
endmodule // PB1_AGL



// End of file.
