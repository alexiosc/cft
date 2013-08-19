///////////////////////////////////////////////////////////////////////////////
//
// PB1-AGL-test.v -- Processor Board A, AGL test
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

`include "../PB1-AGL.v"

`timescale 1ns/10ps

module PB1_AGL_test();

   reg [5:0]   pc10_15;
   reg [15:0]  ir;
   reg 	       nragl;
   reg 	       nend;

   wire [15:0] ibus, correct_ibus;
   
   integer    i, j, ph;

   // Evaluate the correct IBUS value (when NRAGL# asserted)
   assign correct_ibus = {ir[10] == 1'b1 ? 6'd0 : pc10_15, ir[9:0]};
   
   always @(nragl) begin
      if (nragl == 1'b1) begin
	 #15 if (ibus !== 16'bzzzzzzzzzzzzzzzz) begin
   	    $display("%s: [fail] AGL driving IBUS (%b) with RAGL# deasserted",
   		     `TESTNAME, ibus);
   	    $display ("%s: [fail] tri-stating error.", `TESTNAME);
   	    #100 $finish;
   	 end
      end else if (nragl == 1'b0) begin
	 #15 if (ibus === 16'bzzzzzzzzzzzzzzzz) begin
   	    $display("%s: [fail] AGL not driving IBUS (%b) with RAGL# asserted",
   		     `TESTNAME, ibus);
   	    $display ("%s: [fail] tri-stating error.", `TESTNAME);
   	    #100 $finish;
   	 end
      end
   end // always @ (nragl)

      
   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-AGL-test.vcd");
      $dumpvars (0, PB1_AGL_test);
`endif
      
      // Reset
      
      #100 nragl <= 0;

      for (i = 0; i < 64; i = i + 1) begin
	 pc10_15 <= i;
	 // Toggle in the PC value
	 #63 nend <= 1'b0;
	 #63 nend <= 1'b1;

	 for (j = 0; j < 2048; j = j + 1) begin
	    // Values 0-1023 have R=0, values 1024-2048 have R=1 since
	    // R=IR[10].
	    #100 ir <= j;
	    #30 if (ibus != correct_ibus) begin
   	       $display("%s: [fail] page=%h, IR[10:0]=%b:%h: IBUS should be %h (%b), is %h (%b) instead.",
   			`TESTNAME, pc10_15, ir[10], ir[9:0], correct_ibus, correct_ibus, ibus, ibus);
   	       $display ("%s: [fail] AGL value error.", `TESTNAME);
   	       #100 $finish;
	    end
	    #43 nragl <= 1;
	    #63 nragl <= 0;
	 end

   	 //$display("%s: [ok] AGL for page=%h", `TESTNAME, pc10_15);
      end

      #5000 ;
      $display("%s: [ok] Pass (AGL).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB1_AGL dut(.pc10_15(pc10_15),
			     .ir(ir),
			     .nragl(nragl),
			     .nend(nend),
			     .ibus(ibus));
			  
endmodule // PB1_AGL_test

// End of file.
