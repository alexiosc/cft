///////////////////////////////////////////////////////////////////////////////
//
// PB2-AC.v -- Processor Board B, Accumulator
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WACRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PACTICULAC PURPOSE.  See the
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
`include "comparator.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board B, Accumulator
//
///////////////////////////////////////////////////////////////////////////////

module PB2_AC(reset, nrac, nwac, nstpac, ndec, ibus,
			    ac, naccpl, fn, fz);

   input 	 reset;
   input 	 nrac;
   input 	 nwac;
   input 	 nstpac;
   input 	 ndec;

   inout [15:0]  ibus;

   output [15:0] ac;
   output 	 naccpl;
   output 	 fn;
   output 	 fz;
   
   wire 	 c0, c1, c2, b0, b1, b2;
   wire 	 up, dn;
   wire 	 ninccpl, ndeccpl;

   // Decode the STPAC#/DEC# signals into UP (count up) and DN (count down)
   // signals.

   wire [3:0] 	 y;
   demux_139h ic075b_139_ac(.g(0), .a({ndec, nstpac}), .y(y));
   assign dn = y[0];
   assign up = y[2];


   // A 16-bit up counter with parallel load.
   counter_193 ic084_193_ac0(.clear(reset), .load(nwac),
			     .count_up(up), .count_down(dn),
			     .p(ibus[3:0]), .q(ac[3:0]), .carry(c0), .borrow(b0));
   counter_193 ic085_193_ac1(.clear(reset), .load(nwac),
			     .count_up(c0), .count_down(b0),
			     .p(ibus[7:4]), .q(ac[7:4]), .carry(c1), .borrow(b1));
   counter_193 ic086_193_ac2(.clear(reset), .load(nwac),
			     .count_up(c1), .count_down(b1),
			     .p(ibus[11:8]), .q(ac[11:8]), .carry(c2), .borrow(b2));
   counter_193 ic0787193_ac3(.clear(reset), .load(nwac),
			     .count_up(c2), .count_down(b2),
			     .p(ibus[15:12]), .q(ac[15:12]), .carry(ninccpl), .borrow(ndeccpl));

   // Tri-stating buffering
   buffer_541 ic080_541_aclo(.oe1(nrac), .oe2(0),
			     .a(ac[7:0]), .y(ibus[7:0]));
   buffer_541 ic081_541_achi(.oe1(nrac), .oe2(0),
			     .a(ac[15:8]), .y(ibus[15:8]));

   // Carry/Borrow out to the L register
   and #7 icxx_08_accpl(naccpl, ninccpl, ndeccpl);

   // Flags

   // The Negative flag is trivial: in one's complement, two's complement, or
   // other sign-and-magnitude notations, it's always equal to bit 15 of the
   // Accumulator.
   assign fn = ac[15];

   // The Zero flag is more complex, and requires a comparison.
   wire 	 neq0, neq1;
   comparator_688 ic090_688_fzhi(.a(ac[15:8]), .b(8'd0), .en(0), .equal(neq0));
   comparator_688 ic091_688_fzlo(.a(ac[7:0]), .b(8'd0), .en(neq0), .equal(neq1));
   not #7 ic066f_04_fz(fz, neq1);

   // We do not model the front panel buffers.
   

endmodule // PB2_AC


// End of file.
