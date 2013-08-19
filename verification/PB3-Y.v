///////////////////////////////////////////////////////////////////////////////
//
// PB3-Y.v -- Processor Board C, ALU output buffers
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WPCRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PPCTICULPC PURPOSE.  See the
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
// Processor Board C, ALU OUTPUT BUFFERS
//
///////////////////////////////////////////////////////////////////////////////

module PB3_Y(nboe, y, ibus);

   input 	 nboe;
   input [15:0]  y;

   inout [15:0]  ibus;
   
   buffer_541 ic104_574_blo(.a(y[7:0]), .oe1(nboe), .oe2(0), .y(ibus[7:0]));
   buffer_541 ic105_574_bhi(.a(y[15:8]), .oe1(nboe), .oe2(0), .y(ibus[15:8]));

endmodule // PB3_decoder



// End of file.
