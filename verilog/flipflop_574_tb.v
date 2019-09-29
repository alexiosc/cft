///////////////////////////////////////////////////////////////////////////////
//
// 74x574 FLIP-FLOP TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// flipflop_574_tb.v -- 74x574 testbench
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

`include "flipflop.v"
`timescale 1ns/10ps

module flipflop_574_tb();
   reg 	     noe;
   reg 	     clk;
   reg [7:0] d;

   wire [7:0] q;

   // Initialize all variables
   initial begin        
      $monitor ("%d | %b %b %b > %b", $time, noe, clk, d, q);
      $dumpfile ("vcd/out.vcd");
      $dumpvars (0, flipflop_574_tb);

      noe = 1;
      clk = 0;
      d = 0;
      
      #15 noe = 0;
      #100 d = 1;
      #200 d = 2;
      #300 d = 4;
      #400 d = 8;
      #800 noe = 1;

      #900 $finish;      // Terminate simulation
   end

   always begin
      #30 clk = ~clk;
   end
   
   // Connect DUT to test bench
   flipflop_574 flipflop (.noe(noe), .clk(clk), .d(d), .q(q));

endmodule
