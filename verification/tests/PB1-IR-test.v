///////////////////////////////////////////////////////////////////////////////
//
// PB1-IR-test.v -- Processor Board A, IR test
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

`include "../PB1-IR.v"

`timescale 1ns/10ps

module PB1_IR_test();

   reg 	       nreset;
   reg [15:0]  ibus;
   reg 	       nwir;

   wire [15:0] ir;
   
   integer    i, j, ph;

   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD      
      $dumpfile ("vcd/PB1-IR-test.vcd");
      $dumpvars (0, PB1_IR_test);
`endif

      // Reset

      nreset <= 0;
      ibus <= 0;
      nwir <= 1;
      #100 nreset <= 1;

      for (i = 0; i < 65536; i = i + 1) begin
	 ibus <= i;

	 #20 nwir <= 0;
	 #20 nwir <= 1;

	 #40 if (ir !== i) begin
   	    $display("%s: [fail] IR should be %h, is %h.",
   		     `TESTNAME, ibus, ir);
   	    $display ("%s: [fail] IR value error.", `TESTNAME);
   	    #100 $finish;
	 end
      end

      #5000 ;
      $display("%s: [ok] Pass (IR).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB1_IR dut(.nreset(nreset),
			    .ibus(ibus),
			    .nwir(nwir),
			    .ir(ir));
			  
endmodule // PB1_IR_test

// End of file.
