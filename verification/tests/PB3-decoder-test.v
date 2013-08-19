///////////////////////////////////////////////////////////////////////////////
//
// PB3-decoder-test.v -- Processor Board C, ALU decoder
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

`include "../PB3-decoder.v"

`timescale 1ns/10ps

module PB3_decoder_test();

   reg 	      nreset;
   reg 	      nrsthold;
   reg 	      nt34;
   reg [3:0]  runit;
   reg [3:0]  ir0_3;


   wire       nuoe;
   wire       nboe;
   
   wire [2:0] uop;

   integer    i, j;
   
   always begin
      #125 nt34 <= 0;
      #125 nt34 <= 1;
   end

   // Ensure the rising edge of T34# disables the ALU.
   always @(posedge nt34) begin
      #40 if (runit >= 8 && runit < 12 && nboe !== 1) begin
   	 $display("%s: [fail] ALU binary ROM not deselected when T34# is high.",
   		  `TESTNAME);
   	 $display ("%s: [fail] ALU Binary ROM selection error.", `TESTNAME);
   	 $finish;
      end

      #40 if (runit >= 12 && nuoe !== 1) begin
   	 $display("%s: [fail] ALU unary ROM not deselected when T34# is high.",
   		  `TESTNAME);
   	 $display ("%s: [fail] ALU Unary ROM selection error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   // Ensure RUNIT is decoded properly.
   always @(negedge nt34) begin
      if (runit < 8) begin
	 #30 if (nuoe !== 1) begin
      	    $display("%s: [fail] ALU unary ROM selected when the ALU was idle (runit=%b).",
      		     `TESTNAME, runit);
      	    $display ("%s: [fail] ALU Unary ROM selection error.", `TESTNAME);
      	    #100 $finish;
	 end

	 if (nboe !== 1) begin
   	    $display("%s: [fail] ALU binary ROM selected when the ALU was idle (runit=%b).",
   		     `TESTNAME, runit);
   	    $display ("%s: [fail] ALU Binary ROM selection error.", `TESTNAME);
   	    #100 $finish;
	 end
      end else if (runit < 12) begin // if (runit < 8)
	 #30 if (nboe !== 0) begin
   	    $display("%s: [fail] ALU binary ROM not selected when it should have been (runit=%b).",
   	 	     `TESTNAME, runit);
   	    $display ("%s: [fail] ALU Binary ROM selection error.", `TESTNAME);
   	    #100 $finish;
	 end
      end else begin
	 #30 if (nuoe !== 0) begin
      	    $display("%s: [fail] ALU unary ROM not selected when it should have been (runit=%b).",
      	 	     `TESTNAME, runit);
      	    $display ("%s: [fail] ALU Unary ROM selection error.", `TESTNAME);
      	    #100 $finish;
	 end
      end
   end // always @ (runit)

   // Ensure the two OE# signals never get asserted simultaneously.
   always @(nuoe, nboe) begin
      if (nuoe == 0 && nboe == 0) begin
      	 $display("%s: [fail] Both Unary and Binary ROMs selected (runit=%b).",
      		  `TESTNAME, runit);
      	 $display ("%s: [fail] ALU contention in ROM selection.", `TESTNAME);
      	 #100 $finish;
      end
   end
   

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-decoder-test.vcd");
      $dumpvars (0, PB3_decoder_test);
`endif
      
      nreset <= 0;
      nrsthold <= 0;
      nt34 <= 1;
      runit <= 0;
      ir0_3 <= 0;

      #500 nreset <= 1;
      #500 nrsthold <= 1;

      for (j = 0 ; j < 16; j = j + 1) begin
	 #500 runit <= j;
	 for (i = 0 ; i < 16; i = i + 1) begin
	    #250 ir0_3 <= i;

	 end
      end

      #500 runit <= 0;
      
      #5000 ;
      $display("%s: [ok] Pass (ALU decoder).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_decoder dut (.nreset(nreset),
		    .nrsthold(nrsthold),
		    .nt34(nt34),
		    .runit(runit),
		    .ir0(ir0_3[0]), .ir2(ir0_3[2]),
		    .nuoe(nuoe),
		    .nboe(nboe),
		    .uop(uop));
   
endmodule // PB3_decoder_test

// End of file.
