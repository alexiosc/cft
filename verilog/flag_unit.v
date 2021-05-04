///////////////////////////////////////////////////////////////////////////////
//
// THE FLAG UNIT
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// flag-unit.v -- Flag Unit
//
// Copyright © 2011—2020 Alexios Chouchoulas
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


`ifndef flag_unit_v
`define flag_unit_v

`include "demux.v"
`include "buffer.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module flag_unit (clk4, waddr, raddr,
		  fn, fz, fl, fv, fi,
		  ibus, nwrite_fl, nwrite_ir, nread_agl,
		  nfpflags, fpd);

   input          clk4;
   input [4:0]    waddr;
   input [4:0] 	  raddr;
   input 	  fn, fz, fl, fv, fi;

   output [15:8]  ibus;
   output 	  nwrite_fl;
   output 	  nwrite_ir;
   output 	  nread_agl;
   
   input 	  nfpflags;
   output [7:0]   fpd;

   wire [7:0] 	  wy, ry, ay;

   // Interim solution: duplicate the decoding of the RADDR GAL so as
   // not to change the test harnesses etc.
   
   // demux_138 demux_write (.a(waddr[2:0]), .g1(waddr[3]), .ng2a(waddr[4]), .ng2b(1'b0), .y(wy));
   // demux_138 demux_read  (.a(raddr[2:0]), .g1(raddr[3]), .ng2a(raddr[4]), .ng2b(1'b0), .y(ry));

   // Decode the write signals, generate nwrite_fl.
   wire 	  nwrite_flags, nread_flags;
   // assign nwrite_flags = wy[5];
   // assign nwrite_flags = wy[6];
   // assign #7 nwrite_fl = (nwrite_flags & nwrite_flags) | clk4; // Writing only happens during T4
   // assign nwrite_ir = wy[7];

   assign #7 nwrite_flags = (clk4 == 1'b0 && (waddr == 5'b11110 || waddr == 5'b11111)) ? 1'b0 : 1'b1;
   assign #7 nread_flags = (raddr == 5'b11110) ? 1'b0 : 1'b1;
   assign nwrite_fl = nwrite_flags;

   // Also this one (for now)
   assign #7 nwrite_ir = (clk4 == 0 && waddr == 5'b01111) ? 1'b0 : 1'b1;
   assign #7 nread_agl = (raddr == 5'b01111) ? 1'b0 : 1'b1;

   // Note: we don't model the three RSVDxx signals here, we just use 0.
   buffer_541 buf_ibus (.a({fi, 1'b0, fv, fl, fz, fn, 2'b00}), .y(ibus[15:8]),
	       .noe1(nread_flags), .noe2(1'b0));

   // Now: *WRITING* to flags isn't implemented here. We only generate the
   // nwrite_fl strobe, and flag circuitry that can be set this way (currently,
   // FI, FV and FL) will do so itself.

   // The front panel buffer drives the flag section of the FP. The light
   // layout is the same as the IBUS[15:8] bitmap.
   buffer_541 buf_fp (.a({fi, 1'b0, fv, fl, fz, fn, 2'b00}), .y(fpd),
	       .noe1(nfpflags), .noe2(1'b0));
endmodule // flag_unit

`endif //  `ifndef flag_unit_v

// End of file
