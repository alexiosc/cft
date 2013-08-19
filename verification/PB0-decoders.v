///////////////////////////////////////////////////////////////////////////////
//
// PB0-decoders.v -- Processor Board 0, Decoders Handling
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
// READ UNIT DECODER
//
///////////////////////////////////////////////////////////////////////////////

module read_unit_decoder(nreset, clk1, nuce, runit, nragl, nrpc, nrdr, nrac);

   input       nreset;
   input       clk1;
   input       nuce;
   input [3:0] runit;

   output      nragl;
   output      nrpc;
   output      nrdr;
   output      nrac;
   
   // Read unit decoding: we decode half of the possible 16 read units, 0-7
   // (RUNIT[3]=0). The eight upper sources are handled by the ALU board. To
   // allow the front panel to function, the decoded lines are tri-stated (and
   // pulled up) when UCE# is asserted (e.g. when the front panel asserts HALT#
   // to gain control of the bus). This allows other bus mastering devices to
   // do the same.

   wire 	  nruen;
   wire [7:0] 	  ry0;
   tri1 [7:0] 	  ry;		// Pulled high

   // Decoder
   not #6 ic024a_04_nruen (nruen, nreset);
   demux_138 ic025_138_runit (.g1(clk1), .g2a(runit[3]), .g2b(nruen),
   			      .a(runit[2:0]), .y(ry0));

   // Tri-state buffer
   buffer_541 ic027_541_runit (.oe1(nuce), .oe2(0), .a(ry0), .y(ry));

   // Assign decoded values
   assign nragl = ry[2];
   assign nrpc = ry[3];
   assign nrdr = ry[4];
   assign nrac = ry[5];
endmodule // read_unit_decoder



///////////////////////////////////////////////////////////////////////////////
//
// WRITE UNIT DECODER
//
///////////////////////////////////////////////////////////////////////////////


module write_unit_decoder(nreset, clk3, nuce, wunit,
			  nwar, nwpc, nwir, nwdr, nwac, nwalu);


   input       nreset;
   input       clk3;
   input       nuce;
   input [2:0] wunit;

   output      nwar;
   output      nwpc;
   output      nwir;
   output      nwdr;
   output      nwac;
   output      nwalu;
   
   // Write unit decoding: tri-stated in the same way as the read unit decoder.
   wire [7:0]  wy0;
   tri1 [7:0]  wy;		// Pulled high
   demux_138 ic026_138_wunit (.g1(nreset), .g2a(clk3), .g2b(0),
   			      .a(wunit), .y(wy0));

   // Tri-state buffer
   buffer_541 ic028_541_wunit (.oe1(nuce), .oe2(0), .a(wy0), .y(wy));

   // Assign decoded values
   assign nwar = wy[2];
   assign nwpc = wy[3];
   assign nwir = wy[4];
   assign nwdr = wy[5];
   assign nwac = wy[6];
   assign nwalu = wy[7];

endmodule // write_unit_decoder


// End of file.
