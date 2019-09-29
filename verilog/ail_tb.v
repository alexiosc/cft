///////////////////////////////////////////////////////////////////////////////
//
// AUTO-INDEX LOGIC TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// ail_tb.v -- Auto-Index Logic Testbench
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

`include "ail.v"
`timescale 1ns/10ps

module ail_tb();
   wire [15:0] ir;
   wire [1:0]  idx;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      $monitor ("%d | %b > %b", $time, ir, idx);
      $dumpfile ("vcd/ail_tb.vcd");
      $dumpvars (0, ail_tb);

      i = 0;
            
      for (i = 0; i < 65536; i = i + 1) begin
	 #63.5;
      end
      
      #500 $finish;      // Terminate simulation
   end // initial begin

   assign ir = i[15:0];
   
   // Connect DUT to test bench
   ail ail (.ir(ir), .idx(idx));

endmodule
