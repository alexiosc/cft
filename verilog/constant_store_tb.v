///////////////////////////////////////////////////////////////////////////////
//
// CONSTANT STORE TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// constant_store_tb.v -- Constant Store Testbench
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

`include "constant_store.v"
`timescale 1ns/10ps

module constant_store_tb();
   wire         nruen;
   wire [4:0]   raddr;
   wire [15:0] 	ibus;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      $monitor ("%d | %b %b > %h", $time, nruen, raddr, ibus);
      $dumpfile ("vcd/constant_store_tb.vcd");
      $dumpvars (0, constant_store_tb);

      i = 0;
            
      for (i = 0; i < 64; i = i + 1) begin
	 #63.5;
      end
      
      #500 $finish;      // Terminate simulation
   end // initial begin

   assign nruen = i[5];
   assign raddr = i[4:0];
   
   
   // Connect DUT to test bench
   constant_store constant_store (.nruen(nruen), .raddr(raddr), .ibus(ibus));

endmodule
