///////////////////////////////////////////////////////////////////////////////
//
// PB2-IOD.v -- Processor Board B, I/O Address Decoder
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WIODRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PIODTICULIOD PURPOSE.  See the
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
// Processor Board B, I/O Address Decoder
//
///////////////////////////////////////////////////////////////////////////////

// The IOD used to be driven from the Address Bus. It is now driven directly by
// the unbuffered, un-tristated AR. This makes it transition faster by one '541
// propagation delay period (approximately 10 ns). On the downside, if another
// device is mastering the bus, it would have to provide its own I/O decoding
// to drive devices on the bus. Since the CFT doesn't currently support bus
// mastering, this isn't a big deal.

module PB2_IOD(nio, /*naben, */ ar,
			     nsysdev, niodev1xx, niodev2xx, niodev3xx);
   input 	nio;
   //input 	naben;
   input [15:0] ar;

   output 	nsysdev;
   output 	niodev1xx;
   output 	niodev2xx;
   output 	niodev3xx;

   wire 	neq;

   comparator_688 ic064_688_iod(.a({3'b000, ar[15:11]}),
				.b(8'b00000000),
				.en(nio),
				.equal(neq));

   wire [7:0] 	y;
   // The G2B enable was driven by ABEN#, which is asserted when either IO# or
   // MEM# are asserted. This is pointless: the '688 already asserts when and
   // only when IO# is asserted so the IO# check is subsumed. This makes the
   // circuit faster.
   demux_138 ic065_138_iod(.g1(1), .g2a(neq), .g2b(/*naben*/0),
			   .a(ar[10:8]), .y(y));

   assign nsysdev = y[0];
   assign niodev1xx = y[1];
   assign niodev2xx = y[2];
   assign niodev3xx = y[3];

endmodule // PB2_IOD


// End of file.
