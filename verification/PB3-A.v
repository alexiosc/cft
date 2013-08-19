///////////////////////////////////////////////////////////////////////////////
//
// PB3-A.v -- Processor Board C, ALU A port register
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
// Processor Board C, ALU A PORT REGISTER
//
///////////////////////////////////////////////////////////////////////////////

module PB3_A(clk4, ac, a);

   input 	 clk4;
   input [15:0]  ac;

   output [15:0] a;

   //assign a = ac;

   flipflop_574 ic099_574_blo(.d(ac[7:0]), .clk(clk4), .oe(0), .q(a[7:0]));
   flipflop_574 ic100_574_bhi(.d(ac[15:8]), .clk(clk4), .oe(0), .q(a[15:8]));

   pullup(a[0]);
   pullup(a[1]);
   pullup(a[2]);
   pullup(a[3]);
   pullup(a[4]);
   pullup(a[5]);
   pullup(a[6]);
   pullup(a[7]);
   pullup(a[8]);
   pullup(a[9]);
   pullup(a[10]);
   pullup(a[11]);
   pullup(a[12]);
   pullup(a[13]);
   pullup(a[14]);
   pullup(a[15]);

endmodule // PB3_A



// End of file.
