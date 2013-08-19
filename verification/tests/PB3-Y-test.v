///////////////////////////////////////////////////////////////////////////////
//
// PB3-Y-test.v -- Processor Board C, ALU Y output test
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

`include "../PB3-Y.v"

`timescale 1ns/10ps

module PB3_Y_test();

   reg 	       nboe;
   reg [15:0]  y;

   wire [15:0] ibus;

   integer     i;

   always @(negedge nboe) begin
      #15 if (ibus != y) begin
   	 $display("%s: [fail] ALU IBUS output should be %h, was %h.",
   		  `TESTNAME, y, ibus);
   	 $display ("%s: [fail] ALU Y port error.", `TESTNAME);
   	 #100 $finish;
      end
   end
   
   always @(posedge nboe) begin
      #15 if (ibus != 16'bzzzzzzzzzzzzzzzz) begin
   	 $display("%s: [fail] ALU IBUS not at high impedance with BOE# high.",
   		  `TESTNAME, y, ibus);
   	 $display ("%s: [fail] ALU Y port error.", `TESTNAME);
   	 #100 $finish;
      end
   end
   
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-Y-test.vcd");
      $dumpvars (0, PB3_Y_test);
`endif
      
      y <= 16'hfff0;
      nboe <= 1;
      
      for (i = 0; i < 65536; i = i + 1) begin
	 #62 y <= i;
	 #62 nboe <= 0;
	 #126 nboe <= 1;
      end
      
      #5000 ;
      $display("%s: [ok] Pass (ALU Y port).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_Y dut(nboe, y, ibus);
			  
endmodule // PB3_Y_test

// End of file.
