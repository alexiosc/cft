///////////////////////////////////////////////////////////////////////////////
//
// PB2-DR.v -- Processor Board B, Data Register
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WDRRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PDRTICULDR PURPOSE.  See the
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
// Processor Board B, Data Register
//
///////////////////////////////////////////////////////////////////////////////

module PB2_DR(reset, nrdr, nwdr, nstpdr, ndec, ibus, dr);

   input 	 reset;
   input 	 nrdr;
   input 	 nwdr;
   input 	 nstpdr;
   input 	 ndec;
   
   inout [15:0]  ibus;

   output [15:0] dr;
   
   wire 	 c0, c1, c2, b0, b1, b2;
   wire 	 up, dn;

   // Decode the STPDR#/DEC# signals into UP (count up) and DN (count down)
   // signals.

   wire [3:0] 	 y;
   demux_139h ic075a_139_dr(.g(0), .a({ndec, nstpdr}), .y(y));
   assign dn = y[0];
   assign up = y[2];


   // A 16-bit up counter with parallel load.
   counter_193 ic076_193_dr0(.clear(reset), .load(nwdr),
			     .count_up(up), .count_down(dn),
			     .p(ibus[3:0]), .q(dr[3:0]), .carry(c0), .borrow(b0));
   counter_193 ic077_193_dr1(.clear(reset), .load(nwdr),
			     .count_up(c0), .count_down(b0),
			     .p(ibus[7:4]), .q(dr[7:4]), .carry(c1), .borrow(b1));
   counter_193 ic078_193_dr2(.clear(reset), .load(nwdr),
			     .count_up(c1), .count_down(b1),
			     .p(ibus[11:8]), .q(dr[11:8]), .carry(c2), .borrow(b2));
   counter_193 ic079_193_dr3(.clear(reset), .load(nwdr),
			     .count_up(c2), .count_down(b2),
			     .p(ibus[15:12]), .q(dr[15:12]));

   // Tri-stating buffering
   buffer_541 ic080_541_drlo(.oe1(nrdr), .oe2(0),
			     .a(dr[7:0]), .y(ibus[7:0]));
   buffer_541 ic081_541_drhi(.oe1(nrdr), .oe2(0),
			     .a(dr[15:8]), .y(ibus[15:8]));

   // We do not model the front panel buffers.
   

endmodule // PB2_DR


// End of file.
