///////////////////////////////////////////////////////////////////////////////
//
// PB1-reset-test.v -- Processor Board A, Reset test
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

`include "../PB1-clock.v"
`include "../PB1-reset.v"

`timescale 1ns/10ps

module PB1_reset_test();
   
   wire         nreset;
   wire         nrsthold;
   reg 	        nreset_drv;
   reg 	        nfpreset;
   reg 	        powerok;

   wire 	rstclk;

   input [15:0] ibus;


   assign nreset = nreset_drv;
   assign rstclk = clock.fastclock;

   // Check the length of the RSTHOLD# pulse.
   always @(negedge nreset) begin
      // Ensure RSTHOLD# goes low at the same time as RESET#, give or take. 60
      // ns latency is acceptable (we do this to account for the initial X
      // state of RSTHOLD# due to the counter being reset — that's a simulation
      // artifact). The RESET# pulse is usually VERY long because it comes from
      // a human-operated device, or from the power supply (which measures it
      // in milliseconds).
      #80 if (nrsthold !== 1'b0) begin
	    $display("%s: [fail] RSTHOLD# did not go low with RESET#",
		     `TESTNAME,);
	    $display ("%s: [fail] RSTHOLD# failure.", `TESTNAME);
	    #100 $finish;
      end
   end
   always @(posedge nreset) begin
      // Ensure RSTHOLD# goes high 2µs (allow 1 250ns clock pulse +
      // 40ns propagation = 2290 ns total) after RESET#.
      $display ("%s: [ok] RESET went high.", `TESTNAME);
      #2000 if (nrsthold !== 1'b0) begin
	    $display("%s: [fail] RSTHOLD# held low less than 2µs after end of RESET#",
		     `TESTNAME,);
	    $display ("%s: [fail] RSTHOLD# failure.", `TESTNAME);
	    #100 $finish;
      end
      #3000 if (nrsthold !== 1'b1) begin
	    $display("%s: [fail] RSTHOLD# still held low 10µs after end of RESET#",
		     `TESTNAME,);
	    $display ("%s: [fail] RSTHOLD# failure.", `TESTNAME);
	    #100 $finish;
      end
   end // always @ (posedge nreset)

   always @(negedge nrsthold) begin
      #20 if (ibus !== 16'hfff0) begin
	 $display("%s: [fail] Reset vector should be FFF0, was %h",
		  `TESTNAME, ibus);
	 $display ("%s: [fail] Reset vector failure.", `TESTNAME);
	 #100 $finish;
      end
   end

   always @(posedge nrsthold) begin
      #20 if (ibus !== 16'bzzzzzzzzzzzzzzzz) begin
	 $display("%s: [fail] IBUS not tri-stated after RSTHOLD# deassertion",
		  `TESTNAME);
	 $display ("%s: [fail] Reset vector failure.", `TESTNAME);
	 #100 $finish;
      end
   end
	 


   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-reset-test.vcd");
      $dumpvars (0, PB1_reset_test);
`endif
      
      // Initialisation
      nreset_drv = 1'bz;
      nfpreset = 1'bz;
      powerok = 1'b0;		// Simulate power on

      #500 powerok = 1'b1;	// 500 ns stabilisation: fastest PSU ever!

      #5000 nfpreset = 1'b0;
      #1000 nfpreset = 1'bz;

      #5000 powerok = 0;	// Simulate a PSU brown-out
      #100 powerok = 1;

      #5000 nfpreset = 0;	// Simulate a bouncy switch
      #10 nfpreset = 1'bz;
      #20 nfpreset = 0;
      #30 nfpreset = 1'bz;
      #10 nfpreset = 0;
      #50 nfpreset = 1'bz;
      #100 nfpreset = 0;
      #75 nfpreset = 1'bz;
      #200 nfpreset = 0;
      #250 nfpreset = 1'bz;
      #10 nfpreset = 0;
      #50 nfpreset = 1'bz;
      #10 nfpreset = 0;
      #20 nfpreset = 1'bz;

      #20000
      
      $display("%s: [ok] Pass (reset).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin


   PB1_clock clock(.nreset(nreset),
		   //.fpslow(0), .fpfast(1),
		   .fpclken(1), .fpustep(0),
		   .rstclk(rstclk));
   PB1_reset dut(.nreset(nreset),
			       .clk(rstclk),
			       .nfpreset(nfpreset),
			       .powerok(powerok),
			       .nrsthold(nrsthold),
			       .ibus(ibus));
			  
endmodule

// End of file.
