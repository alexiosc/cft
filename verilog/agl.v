///////////////////////////////////////////////////////////////////////////////
//
// ADDRESS GENERATION LOGIC
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// agl.v -- The Address-Generation Logic
//
// Copyright © 2011-2019 Alexios Chouchoulas
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

// The AGL is increasingly a misnomer. For that short whlie when the
// CFT had purely 16 bit addresses, it really was responsible for
// generating addresses. Then the MBU (21-bit addressing) got tacked
// on, and then the new MBR (24-bit addressing) plus indexing logic, etc.
//
// Currently, it just implements Page-Local and Page Zero addressing,
// so it should probably be renamed Page Zero Logic or something like
// that.


`ifndef agl_v
`define agl_v

`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps


module agl(ir, pc, nread_agl, nend, ibus);

   input [15:0]  pc, ir;
   input 	 nread_agl;
   input 	 nend;

   output [15:0] ibus;

   wire [15:0] 	pc, ir;
   wire 	nragl;
   wire 	nend;

   wire [15:0] 	ibus;

   // Zero Page Logic
   wire [5:0] 	page;
   tri0 [7:0] 	q;		// Pull down the outputs.
   flipflop_574 zpff (.d({2'b0, pc[15:10]}), .noe(ir[10]), .clk(nend), .q(q));
   assign page = q[5:0];

   // Address Generation Logic tri-stating buffers
   buffer_541 buf_lo (.noe1(nread_agl), .noe2(1'b0), .a(ir[7:0]),         .y(ibus[7:0]));
   buffer_541 buf_hi (.noe1(nread_agl), .noe2(1'b0), .a({page, ir[9:8]}), .y(ibus[15:8]));

endmodule // agl


`endif //  `ifndef agl_v
