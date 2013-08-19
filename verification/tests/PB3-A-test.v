///////////////////////////////////////////////////////////////////////////////
//
// PB3-A-test.v -- Processor Board C, ALU A port test
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

`include "../PB3-A.v"

`timescale 1ns/10ps

module PB3_B_test();

   reg 	       clk4;
   reg [15:0]  ac;

   wire [15:0] a;

   integer     i;
   
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-A-test.vcd");
      $dumpvars (0, PB3_A_test);
`endif
      
      ac <= 16'hfff0;
      clk4 <= 1;
      
      for (i = 0; i < 65536; i = i + 1) begin
	 #62 ac <= i;
	 #62 clk4 <= 0;
	 #30 clk4 <= 1;

	 #30 if (a !== i) begin
   	    $display("%s: [fail] ALU A port register should be %h, was %h.",
   		     `TESTNAME, ac, a);
   	    $display ("%s: [fail] ALU A port registration error.", `TESTNAME);
   	    #100 $finish;
	 end
	 
      end
      
      #5000 ;
      $display("%s: [ok] Pass (ALU B port).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_A dut(clk4, ac, a);
			  
endmodule // PB3_B_test

// End of file.
