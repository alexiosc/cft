///////////////////////////////////////////////////////////////////////////////
//
// PB2-AR-test.v -- Processor Board B, Address Register test
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

`include "../PB2-AR.v"

`timescale 1ns/10ps

module PB2_AR_test();

   reg 	       nreset;
   reg [15:0]  ibus;
   reg 	       nwar;
   reg 	       nmem;
   reg 	       nio;

   wire        naben;
   wire [15:0] ab;

   integer     i, j;

   always @(negedge nmem, negedge nio) begin
      #30 if (naben !== 1'b0) begin
   	 $display("%s: [fail] ABEN# failed to assert (MEM#=%b, IO#=%b).",
   		  `TESTNAME, nmem, nio);
   	 $display ("%s: [fail] ABEN# error.", `TESTNAME);
   	 #100 $finish;
      end
   end
      
   // always @(nreset, ab) begin
   //    #20 if (nreset == 0 && ab !== 16'bzzzzzzzzzzzzzzzz) begin
   // 	 $display("%s: [fail] Address Bus was not tri-stated during RESET#.",
   // 		  `TESTNAME);
   // 	 $display ("%s: [fail] AR tri-stating error.", `TESTNAME);
   // 	 #100 $finish;
   //    end
   // end
      
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB2-AR-test.vcd");
      $dumpvars (0, PB2_AR_test);
`endif

      // Reset and initialise
      nreset <= 0;
      ibus <= 16'bzzzzzzzzzzzzzzzz;
      nwar <= 1;
      nmem <= 1;
      nio <= 1;

      #500 nreset <= 1;
      #2000;

      
      for (j = 0; j < 4; j = j + 1) begin
	 // Set a combination of MEM# and IO#
	 for (i = 0; i < 65536; i = i + 1) begin

	    #63 ibus <= i;
	    #62 nwar <= 0;
	    #63 nwar <= 1;
	    ibus <= 16'bzzzzzzzzzzzzzzzz;
	    #63 begin
	       nmem <= j[0];
	       nio <= j[1];
	       // j < 3 <==> MEM# or IO# asserted
	       if (j < 3) begin
		  #20 if (ab !== i) begin
   		     $display("%s: [fail] Address Bus should be %4h, was %4h (%b).",
   			      `TESTNAME, i[15:0], ab, ab);
   		     $display ("%s: [fail] AR registration error.", `TESTNAME);
   		     #100 $finish;
		  end
	       end else begin
		  #20 if (ab !== 16'bzzzzzzzzzzzzzzzz) begin
   		     $display("%s: [fail] Address Bus failed to tri-state (MEM#=%b, IO#=%b).",
   			      `TESTNAME, nmem, nio);
   		     $display ("%s: [fail] AR tri-stating error.", `TESTNAME);
   		     #100 $finish;
		  end
	       end
	    end
	    #63 begin
	       nmem <= 1;
	       nio <= 1;
	       #20 if (ab !== 16'bzzzzzzzzzzzzzzzz) begin
   		  $display("%s: [fail] Address Bus failed to tri-state (MEM#=%b, IO#=%b).",
   			   `TESTNAME, nmem, nio);
   		  $display ("%s: [fail] AR tri-stating error.", `TESTNAME);
   		  #100 $finish;
	       end
	    end
	    
	 end // for (i = 0; i < 65536; i = i + 1)
	 $display("%s: [ok] Pass (AR, MEM#=%b, IO#=%b).", `TESTNAME, j[0], j[1]);

	 #10000;

      end // for (j = 0; j < 4; j = j + 1)
      
      #5000 ;
      $display("%s: [ok] Pass (AR).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB2_AR dut(.ibus(ibus), .nwar(nwar),
	      .nmem(nmem), .nio(nio), .naben(naben), 
	      .abus(ab));
			  
endmodule // PB1_IR_test

// End of file.
