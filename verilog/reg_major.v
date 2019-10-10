///////////////////////////////////////////////////////////////////////////////
//
// A MAJOR REGISTER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// reg_major.v -- One Major Register
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

`ifndef reg_major_v
`define reg_major_v

`include "counter.v"
`include "buffer.v"
`include "comparator.v"

`timescale 1ns/10ps


// The CFT has four major registers (PC, DR, AC, SP) with very
// slightly different features. This represents the union of all of
// them.
//
// Register  inc  dec  out  flags
//    PC      Y    -    Y     -
//    DR      Y    Y    -     -
//    AC      Y    Y    Y     Y
//    SP      Y    Y    -     -

module reg_major (reset, ibus, nread, nwrite, ninc, ndec, out,
		  fz, fn, naccpl,
		  nfpl, nfph, fpd);
   
   input 	 reset;		// Active high reset
   inout [15:0]  ibus;
   input 	 nread;		// Drive ibus with register value (active low)
   input 	 nwrite;	// Read register value from ibus (active low)
   input 	 ninc;		// Increment register
   input 	 ndec;		// Decrement register
   output [15:0] out;		// Register output (PC and AC only)

   output 	 fz;		// Register is zero (AC only)
   output 	 fn;		// Register is negative (AC only)
   output 	 naccpl;	// Toggle the L flag (AC only)

   input 	 nfpl;		// Front panel low select
   input 	 nfph;		// Front panel high select
   output [7:0]	 fpd;		// Front panel output

   // Four '193 counters are used as registers. This lets us increment
   // and decrement on the cheap.
   wire [3:0] 	 nco, nbo;
   counter_193 c0 (.clr(reset), .npl(nwrite), .p(ibus[3:0]),   .cpu(ninc),   .cpd(ndec),   .q(out[3:0]),   .ntcu(nco[0]), .ntcd(nbo[0]));
   counter_193 c1 (.clr(reset), .npl(nwrite), .p(ibus[7:4]),   .cpu(nco[0]), .cpd(nbo[0]), .q(out[7:4]),   .ntcu(nco[1]), .ntcd(nbo[1]));
   counter_193 c2 (.clr(reset), .npl(nwrite), .p(ibus[11:8]),  .cpu(nco[1]), .cpd(nbo[1]), .q(out[11:8]),  .ntcu(nco[2]), .ntcd(nbo[2]));
   counter_193 c3 (.clr(reset), .npl(nwrite), .p(ibus[15:12]), .cpu(nco[2]), .cpd(nbo[2]), .q(out[15:12]), .ntcu(nco[3]), .ntcd(nbo[3]));

   // The counters can't tri-state their outputs, so we add a couple of buffers.
   buffer_541 b0 (.a(out[7:0]),  .y(ibus[7:0]),  .noe1(nread), .noe2(1'b0));
   buffer_541 b1 (.a(out[15:8]), .y(ibus[15:8]), .noe1(nread), .noe2(1'b0));

   // The AC has an output to toggle the L register on underflow or
   // overflow. This is an active low output.
   assign #6 naccpl = nco[3] & nbo[3];

   // The AC outputs the FZ (zero) and FN (negative) flags. The FN flag is
   // really easy, but the FZ one needs two comparators.
   assign fn = out[15];

   // Comparison to zero using two cascaded comparators to get !(AC == 0),
   // which we then invert to get the active high zero flag.
   wire 	 neq0, nfz;
   comparator_688 z0 (.a(out[7:0]),  .b(8'h00), .ng(1'b0), .neq(neq0));
   comparator_688 z1 (.a(out[15:8]), .b(8'h00), .ng(neq0), .neq(nfz));
   assign #6 fz = ~nfz;

   // The front panel buffers
   buffer_541 rm_fpbuf_lo (.a(out[7:0]),  .y(fpd), .noe1(nfpl), .noe2(1'b0));
   buffer_541 rm_fpbuf_hi (.a(out[15:8]), .y(fpd), .noe1(nfph), .noe2(1'b0));
endmodule // reg_major

`endif //  `ifndef reg_major_v

// End of file.
