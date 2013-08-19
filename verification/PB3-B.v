///////////////////////////////////////////////////////////////////////////////
//
// PB3-B.v -- Processor Board C, ALU B port register
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
// Processor Board C, ALU B PORT REGISTER
//
///////////////////////////////////////////////////////////////////////////////

module PB3_B(nwalu, ibus, b);

   input 	 nwalu;
   input [15:0]  ibus;

   output [15:0] b;

   flipflop_574 ic099_574_blo(.d(ibus[7:0]), .clk(nwalu), .oe(0), .q(b[7:0]));
   flipflop_574 ic100_574_bhi(.d(ibus[15:8]), .clk(nwalu), .oe(0), .q(b[15:8]));

endmodule // PB3_B



// End of file.
