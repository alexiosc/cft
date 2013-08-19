///////////////////////////////////////////////////////////////////////////////
//
// PB1-ISM-test.v -- Processor Board A, ISM test
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

`include "../PB1-ISM.v"

`timescale 1ns/10ps

module PB1_ISM_test();

   reg nreset;
   reg nend;
   reg nsti;
   reg ncli;
   reg nirq;

   wire fint;
   wire firq;
   wire nirqs;
   

   integer    i, j, ph;

   always @(negedge nreset) begin
      #30 if (fint != 0) begin
   	 $display("%s: [fail] I Flag failed to clear on RESET#",
   		  `TESTNAME);
   	 $display ("%s: [fail] FIRQ failure.", `TESTNAME);
   	 #100 $finish;
      end
   end
   always @(negedge ncli) begin
      #30 if (nreset == 1 && fint != 0) begin
   	 $display("%s: [fail] I Flag failed to clear on CLI#",
   		  `TESTNAME);
   	 $display ("%s: [fail] FIRQ failure.", `TESTNAME);
   	 #100 $finish;
      end
   end
   always @(negedge nsti) begin
      #30 if (nreset == 1 && fint != 1) begin
   	 $display("%s: [fail] I Flag failed to set on STI#",
   		  `TESTNAME);
   	 $display ("%s: [fail] FIRQ failure.", `TESTNAME);
   	 #100 $finish;
      end
   end

   // Check setting of the internal async FIRQ
   always @(fint, nirq) begin
      if (ncli == 1 && fint == 1 && nirq == 0) begin
	 #30 if (ncli == 1 && fint == 1 && nirq == 0 && firq != 1) begin
   	    $display("%s: [fail] Internal (async) IRQ flag failed to set on IRQ#",
   		     `TESTNAME);
   	    $display ("%s: [fail] Asynchronous IRQ registration failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end

   // Check masking of the internal async FIRQ
   always @(negedge fint, negedge nirq) begin
      if (fint == 0 && nirq == 0) begin
	 #30 if (fint == 0 && nirq == 0 && firq != 0) begin
   	    $display("%s: [fail] Internal (async) IRQ flag did not ignore masked IRQ#.",
   		     `TESTNAME);
   	    $display ("%s: [fail] Asynchronous IRQ masking failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end

   // Check IRQS# activation
   always @(posedge nend) begin
      if (fint == 1 && firq == 1) begin
	 #30 if (nirqs != 0) begin
   	    $display("%s: [fail] IRQS# was not asserted on END#.",
   		     `TESTNAME);
   	    $display ("%s: [fail] Synchronous IRQS# failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end

   always begin
      #1100 nirq <= 0;
      #260 nirq <= 1;
   end

   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-ISM-test.vcd");
      $dumpvars (0, PB1_ISM_test);
`endif
      
      // Reset
      nreset <= 0;
      nend <= 1;
      nsti <= 1;
      ncli <= 1;
      nirq <= 1;

      #250 nreset <= 1;

      // Test the I flag
      #250 nsti <= 0;
      #63 nsti <= 1;
      
      #250 ncli <= 0;
      #63 ncli <= 1;

      #250 nsti <= 0;
      #63 nsti <= 1;
      
      #250 nreset <= 0;
      #63 nreset <= 1;

      // Test IRQ setting and masking
      #2000 for (i = 0; i < 200; i = i + 1) begin
	 #1250 nsti <= 0;
	 #63 nsti <= 1;

	 #1000 ncli <= 0;
	 #63 ncli <= 1;
      end

      #1250 nsti <= 0;
      #63 nsti <= 1;

      // Test instruction-synchronous registration
      #2000 for (i = 0; i < 200; i = i + 1) begin
	 #500 nend <= 0;
	 #63 nend <= 1;
	 #250 ncli <= 0;
	 #63 ncli <= 1;
	 #250 nsti <= 0;
	 #63 nsti <= 1;
      end

      #5000 ;
      $display("%s: [ok] Pass (ISM).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB1_ISM dut(nreset, nend, nsti, ncli, nirq, fint, firq, nirqs);
			  
endmodule // PB1_ISM_test

// End of file.
