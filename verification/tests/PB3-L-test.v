///////////////////////////////////////////////////////////////////////////////
//
// PB3-L-test.v -- Processor Board C, L Register test
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

`include "../PB3-L.v"

`timescale 1ns/10ps

module PB3_L_test();

   reg 	nreset;
   reg 	clk3;
   reg 	ncll;
   reg 	ncpl;
   reg 	isroll;
   reg 	roll16;
   reg 	nfltadd;
   reg 	naccpl;

   wire fl;

   integer i;
   reg 	   fl0;

   always begin
      #187 clk3 <= 0;
      #63 clk3 <= 1;
   end

   always @(negedge nreset) begin
      #30 if (fl != 0) begin
   	 $display("%s: [fail] FL did not clear on RESET#",
   		  `TESTNAME);
   	 $display ("%s: [fail] L register error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(negedge ncll) begin
      #30 if (fl != 0) begin
   	 $display("%s: [fail] FL did not clear on CLL#",
   		  `TESTNAME);
   	 $display ("%s: [fail] L register error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(negedge clk3) begin
      fl0 = fl;
      if (ncpl == 0) begin
	 #30 if (fl0 != ~fl) begin
   	    $display("%s: [fail] FL did not toggle on CPL#",
   		     `TESTNAME);
   	    $display ("%s: [fail] L register error.", `TESTNAME);
   	    #100 $finish;
	 end
      end else if (isroll) begin
	 #30 if (fl != roll16) begin
   	    $display("%s: [fail] FL did not follow ROLL16. Is %b, should be %b",
   		     `TESTNAME, fl, roll16);
   	    $display ("%s: [fail] L register error (roll).", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (negedge clk3)
   

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-L-test.vcd");
      $dumpvars (0, PB3_L_test);
`endif
      
      nreset <= 0;
      clk3 <= 1;
      ncll <= 1;
      ncpl <= 1;
      isroll <= 0;
      roll16 <= 0;
      nfltadd <= 1;
      naccpl <= 1;

      #500 nreset <= 1;

      // Test the four toggle inputs.
      for (i = 0; i < 8; i = i + 1) begin
	 #250 ncpl <= 0;
	 #250 ncpl <= 1;

	 #250 nfltadd <= 0;
	 #250 nfltadd <= 1;

	 #250 naccpl <= 0;
	 #250 naccpl <= 1;

	 #250 ncll <= 0;
	 #250 ncll <= 1;
      end // for (i = 0; i < 8; i = i + 1)

      // Test setting/clearing roll inputs
      #1000 for (i = 0; i < 8; i = i + 1) begin
	 #250 isroll <= 1;
	 roll16 <= i & 1;
	 #250 isroll <= 0;
      end // for (i = 0; i < 8; i = i + 1)

      #5000 ;
      $display("%s: [ok] Pass (ALU B port).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_L dut(nreset, clk3, ncll, ncpl, isroll, roll16, nfltadd,
			   naccpl, fl);
			  
endmodule // PB3_L_test


// End of file.
