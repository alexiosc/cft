///////////////////////////////////////////////////////////////////////////////
//
// 74x238 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// buffer_238_tb.v -- 74x238 testbench
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

`include "demux.v"
`timescale 1ns/10ps

module demux_238_tb();

// Declare inputs as regs and outputs as wires
   wire [2:0]  a;
   wire        g1, g2a, g2b;
   wire [7:0]  y;
   
   integer     i;

   // Initialize all variables
   initial begin        
      $monitor ("%d | %b %b %b %h > %b", 
		$time, g1, g2a, g2b, a, y);

      $dumpfile ("vcd/demux_238_tb.vcd");
      $dumpvars (0, demux_238_tb);

      for (i = 0; i < 64; i = i + 1) begin
	 #40 ;
      end

      #500 $finish;      // Terminate simulation
   end // initial begin

   assign g1 = i[5];
   assign g2a = i[4];
   assign g2b = i[3];
   assign a = i[2:0];

   // Connect DUT to test bench
   demux_238 demux (.g1(g1), .g2a(g2a), .g2b(g2b), .a(a), .y(y));

endmodule
