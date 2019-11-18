///////////////////////////////////////////////////////////////////////////////
//
// THE CONSTANT STORE
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// constant_store.v -- The Constant Store
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


// The old constant store output 0000, 0001, 0002, FFFE, or FFFF
// depending on a number of hardwired conditions. The new one can
// output 0000, 0001, 0002, or 0003. It always outputs 0000 when
// RSTHOLD# is asserted.
//
// The new CS is mapped to control unit read addresses 110aa. ‘aa’
// actually represents the least significant bits of the constant to
// be output. All other bits are zero.

`include "buffer.v"
`include "demux.v"
`timescale 1ns/10ps

module constant_store (nruen, raddr, ibus);
   input         nruen;
   input [4:0]   raddr;

   output [15:0] ibus;

   wire 	 ncsoe;

   // The constant store decodes RADDR 001aa, with aa being the least
   // significant bits of the constant to output.

   wire [7:0] 	 y;
   demux_138 cs_demux (.g1(1'b1), .ng2a(nruen), .ng2b(1'b0), .a(raddr[4:2]), .y(y));
   assign ncsoe = y[1];		// raddr == 010xx

   buffer_541 cs_lo (.a({6'b000000, raddr[1:0]}), .y(ibus[7:0]),  .noe1(ncsoe), .noe2(1'b0));
   buffer_541 cs_hi (.a(8'h00),                   .y(ibus[15:8]), .noe1(ncsoe), .noe2(1'b0));

endmodule // constant_store

// End of file.
