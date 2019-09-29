///////////////////////////////////////////////////////////////////////////////
//
// 74x688 COMPARATOR TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// comparator_688_tb.v -- 74x688 testbench
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

`include "comparator.v"
`timescale 1ns/10ps

module comparator_688_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0] a, b;
   reg 	     ng;

   wire      neq;

   integer   i, j, k, m;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/comparator_688_tb.vcd");
      $monitor ("%d | %b %h %h > %b", $time, ng, a, b, neqg);
      $dumpvars (0, comparator_688_tb);

      for (k = 0; k < 2; k = k + 1) begin
	 ng = k[0];
	 for (j = 0; j < 256; j = j + 1) begin
	    a = j;
	    for (i = 0; i < 256; i = i + 1) begin
	       #40 b = i;
	    end
	 end
      end

      #200 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   comparator_688 comparator (.a(a), .b(b), .ng(ng), .neq(neq));

endmodule
