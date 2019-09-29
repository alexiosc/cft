///////////////////////////////////////////////////////////////////////////////
//
// 74x541 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// buffer_541_tb.v -- 74x541 testbench
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

`include "buffer.v"
`timescale 1ns/10ps

module buffer_541_tb();
   reg 	      oe1, oe2;
   reg [7:0]  a;

   wire [7:0] y;

   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $display ("time\t oe1 oe2 a y");	
      $monitor ("%d | %b %b %b > %b", $time, oe1, oe2, a, y);
      $dumpfile ("vcd/buffer_541_tb.vcd");
      $dumpvars (0, buffer_541_tb);

      for (j = 0; j < 4; j = j + 1) begin
	 oe1 = j[0];
	 oe2 = j[1];

	 for (i = 0; i < 256; i = i + 1) begin
	    #50 a = i;
	 end

	 #500;
      end
      
      #1000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   buffer_541 buffer (.oe1(oe1), .oe2(oe2), .a(a), .y(y));
endmodule // buffer_541_tb

// End of file.
