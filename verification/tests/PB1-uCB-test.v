///////////////////////////////////////////////////////////////////////////////
//
// PB1-uCB-test.v -- Processor Board A, uCB linkage
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

`include "../PB1-uCB.v"

`timescale 1ns/10ps

module PB1_uCB_test();

   reg 	      nreset;
   reg 	      nrsthold;
   reg 	      clk4;
   reg 	      nws;
   reg 	      nhalt;
   reg 	      nend;
   reg 	      nendext;

   wire [3:0] upc;
   wire       nuce;

   integer    i, j;

   integer    upc0;

   // Ensure uPC resets when appropriate
   always @(negedge nrsthold) begin
      #30 if (upc !== 4'b0000) begin
   	 $display("%s: [fail] uPC did not reset on RSTHOLD# assertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] uPC reset error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(posedge clk4) begin
      #30 if (nend == 0 && upc !== 4'b0000) begin
   	 $display("%s: [fail] uPC did not reset on END# assertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] uPC reset error.", `TESTNAME);
   	 #100 $finish;
      end else if (nendext == 0 && upc != 4'b0000) begin
   	 $display("%s: [fail] uPC did not reset on ENDEXT# assertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] uPC reset error.", `TESTNAME);
   	 #100 $finish;
      end
   end // always @ (posedge clk4)

   always @(posedge clk4) begin
      if (nend == 1 && nendext == 1 && nreset == 1 && nrsthold == 1) begin
	 upc0 <= upc;
	 #30 if (upc0 == upc) begin
   	    $display("%s: [fail] uPC did not increment on raising edge of CLK4.",
   		     `TESTNAME);
   	    $display ("%s: [fail] uPC count error.", `TESTNAME);
	 end
      end
   end

   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-uCB-test.vcd");
      $dumpvars (0, PB1_uCB_test);
`endif
      
      // Reset

      nreset <= 0;
      nrsthold <= 0;
      clk4 <= 1;
      nws <= 1;
      nhalt <= 1;
      nend <= 1;
      nendext <= 1;

      #500 nreset <= 1;
      #500 nrsthold <= 1;

      #2000 for (j = 0 ; j < 20; j = j + 1) begin
	 for (i = 0 ; i < j ; i = i + 1) begin
	    #187 clk4 <= 0;
	    #63 clk4 <= 1;
	 end

	 #157 nend <= 0;
	 #30 clk4 <= 0;
	 #63 clk4 <= 1;
	 #30 nend <= 1;
      end

      #2000 for (j = 0 ; j < 20; j = j + 1) begin
	 for (i = 0 ; i < j ; i = i + 1) begin
	    #187 clk4 <= 0;
	    #63 clk4 <= 1;
	 end

	 #157 nendext <= 0;
	 #30 clk4 <= 0;
	 #63 clk4 <= 1;
	 #30 nendext <= 1;
      end

      #2000 nreset <= 0;
      #40 nrsthold <= 0;
      #500 nreset <= 1;
      #500 nrsthold <= 1;

      #2000 nhalt <= 0;
      #500 nhalt <= 1;

      #2000 nws <= 0;
      #500 nws <= 1;

      #5000 ;
      $display("%s: [ok] Pass (A-to-uCB linkage and uPC).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB1_uCB dut(nreset, nrsthold, clk4, nws, nhalt, nend,
			     nendext, upc, nuce);
			  
endmodule // PB1_uCB_test

// End of file.
