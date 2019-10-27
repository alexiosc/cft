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

module flag_unit (waddr, raddr, action,
		  fn, fz, fl, fv, fi,
		  ibus, nflagwe,
		  naction_cpl, naction_cll, naction_sti, naction_cli,
		  nfpflags, fpd);

   input [4:0]    waddr;
   input [4:0] 	  raddr;
   input [3:0] 	  action;
   input 	  fn, fz, fl, fv, fi;

   output [15:8]  ibus;
   output 	  nflagwe;
   
   output 	  naction_cpl;
   output 	  naction_cll;
   output 	  naction_sti;
   output 	  naction_cli;

   input 	  nfpflags;
   output [7:0]   fpd;

   wire [7:0] 	  wy, ry, ay;

   demux_138 demux_write (.a(waddr[2:0]), .g1(waddr[3]), .ng2a(waddr[4]), .ng2b(1'b0), .y(wy));
   demux_138 demux_read  (.a(raddr[2:0]), .g1(raddr[3]), .ng2a(raddr[4]), .ng2b(1'b0), .y(ry));

   // Decode the write signals, generate nflagwe.
   wire 	  nwrite_mbp_flags, nwrite_flags;
   assign nwrite_mbp_flags = wy[5];
   assign nwrite_flags = wy[6];
   assign #7 nflagwe = nwrite_mbp_flags | nwrite_flags;

   // Decode the read signals, generate nflagoe.
   wire 	  nread_mbp_flags, nread_flags, nflagoe;
   assign nread_mbp_flags = ry[5];
   assign nread_flags = ry[6];
   assign #7 nflagoe = nread_mbp_flags | nread_flags;

   // The action decoder for flag-related actions is here too.
   demux_138 demux_action (.a(action[2:0]), .g1(1'b1), .ng2a(action[3]), .ng2b(1'b0), .y(ay));
   assign naction_cpl = ay[1];
   assign naction_cll = ay[2];
   assign naction_sti = ay[3];
   assign naction_cli = ay[4];

   // Note: we don't model the three RSVDxx signals here, we just use 0.
   buffer_541 buf_ibus (.a({fi, 1'b0, fv, fl, fz, fn, 2'b00}), .y(ibus[15:8]),
	       .noe1(nflagoe), .noe2(1'b0));

   // Now: *WRITING* to flags isn't done here. We only generate the nFLAGWE
   // strobe, and flag circuitry that can be set this way (currently, FI, FV
   // and FL) will do so itself.

   // The front panel buffer drives the flag section of the FP. The light
   // layout is the same as the IBUS[15:8] bitmap.
   buffer_541 buf_fp (.a({fi, 1'b0, fv, fl, fz, fn, 2'b00}), .y(fpd),
	       .noe1(nfpflags), .noe2(1'b0));
endmodule // flag_unit

`endif //  `ifndef flag_unit_v

// End of file
