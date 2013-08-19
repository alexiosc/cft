///////////////////////////////////////////////////////////////////////////////
//
// PB1-SBL-test.v -- Processor Board A, SBL test
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

`include "../PB1-SBL.v"

`timescale 1ns/10ps

module PB1_SBL_test();

   reg         nreset;
   reg 	       clk4;
   reg 	       fv;
   reg 	       fl;
   reg 	       fz;
   reg 	       fn;
   reg [9:0]   ir;		// The SBL only uses IR[9:0].
   reg [3:0]   opif;
   wire        nskipext;
   reg 	       nskipext_drv;
   assign nskipext = nskipext_drv;

   wire        nskip;

   wire [3:0]  flagvec;
   assign flagvec = { fv, fl, fz, fn };
		    
   integer     i, j, k, m;
   reg 	       cor_nskip, ifbranch;

   reg 	       dnskip;
   
   // Ensure the SKIP# register behaves properly, and test SKIPEXT# while we're
   // at it.
   always @(posedge clk4, negedge nreset) begin
      if (nreset == 1'b1) begin
	 #30 if (nskip != (nskipext && dut.nskip0)) begin
	    $display("%s: [fail] SKIP# should be %b, is %b",
		     `TESTNAME, ~(nskipext && dut.nskip0), nskip);
	    $display ("%s: [fail] SKIP# registration error.", `TESTNAME);
	    #100 $finish;
	 end
      end else if (nreset == 1'b0) begin
	 #30 if (nskip != 1'b1) begin
	    $display("%s: [fail] SKIP# should be 1 on RESET# assertion",
		     `TESTNAME);
	    $display ("%s: [fail] SKIP# register reset failure.", `TESTNAME);
	    #100 $finish;
	 end
      end
   end // always @ (posedge clk4, negedge nreset)

   // Ensure the SKIP result is correct.

   always @(posedge clk4) begin
      // Give it a bit to settle, and only test when RESET# is inactive.
      if (nreset == 1'b1 && nskipext == 1'b1) begin
	 // Simulate the behaviour of the OP2 branch instructions.
	 ifbranch <= 0;
	 if (ir[0] == 1'b1) ifbranch = ifbranch | fv;
	 if (ir[1] == 1'b1) ifbranch = ifbranch | fl;
	 if (ir[2] == 1'b1) ifbranch = ifbranch | fz;
	 if (ir[3] == 1'b1) ifbranch = ifbranch | fn;
	 if (ir[4] == 1'b1) ifbranch = ~ifbranch;

	 // If branch = yes, then DON'T skip next micro-instruction (it'll
	 // increment PC). This is a complete reversal of semantics and tricky
	 // as all fuck. I've already reversed it a few times designing this
	 // thing. :)
	 //ifbranch = ~ifbranch;

	 // Which skip input should be used?
	 case (opif)
	   4'h0: cor_nskip <= 1;	   // IDLE
	   4'h1: cor_nskip <= ~ir[3];	   // IF3
	   4'h2: cor_nskip <= ~ir[4];	   // IF4
	   4'h3: cor_nskip <= ~ir[5];	   // IF5
	   4'h4: cor_nskip <= ~ir[6];	   // IF6
	   4'h5: cor_nskip <= ~ir[7];	   // IF7
	   4'h6: cor_nskip <= ~ir[8];	   // IF8
	   4'h7: cor_nskip <= ~ir[9];	   // IF9
	   4'h8: cor_nskip <= 1;	   // IDLE
	   4'h9: cor_nskip <= 1;	   // IDLE
	   4'ha: cor_nskip <= ~fv;	   // IFV: SKIP iff FV = 0
	   4'hb: cor_nskip <= ~fl;	   // IFL: SKIP iff FL = 0
	   4'hc: cor_nskip <= ~fz;	   // IFZ: SKIP iff FZ = 0
	   4'hd: cor_nskip <= ~fn;	   // IFN: SKIP iff FN = 0
	   4'he: cor_nskip <= ir[2:0] == 0; // IFROLL: skip unless rolling bits set
	   4'hf: cor_nskip <= ~ifbranch;
	 endcase // case (opif)
      end // if (nreset == 1'b1 && nskipext == 1'b1)
   end // always @ (posedge clk4)

   always @(nskip, cor_nskip) begin
      #20 if (nreset == 1'b1 && nskipext == 1'b1) begin
	 dnskip <= cor_nskip ^ nskip;
	 if (cor_nskip != nskip) begin
	    $display("%s: [fail] OPIF=%b, IR=%b, VLZN=%b%b%b%b, SKIPEXT#=%b: SKIP# should be %b, was %b",
	 	     `TESTNAME, opif, ir, fv, fl, fz, fn, nskipext, cor_nskip, nskip);
	    $display ("t=%d", $time);
	    $display ("%s: [fail] SKIP# value incorrect.", `TESTNAME);
	    #200 $finish;
	 end
      end
   end // always @ (nskip, cor_nskip)

   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-SBL-test.vcd");
      $dumpvars (0, PB1_SBL_test);
`endif
      
      // Initialise and reset
      dnskip <= 0;
      cor_nskip <= 1;
      nreset <= 0;
      clk4 <= 1;
      ir <= 0;
      opif <= 0;
      fv <= 0;
      fl <= 0;
      fz <= 0;
      fn <= 0;
      nskipext_drv <= 1'bz;
      #100 nreset <= 1;

      for (m = 0; m < 4; m = m + 1) begin

	 // m is the test mode.
	 // m = 0: normal test.
	 // m = 1: test with RESET# active.
	 // m = 2: test with RESET# and SKIPEXT# active.
	 // m = 3: test with SKIPEXT# active.

	 if (m == 1) nreset <= 0;
	 else if (m == 2) nskipext_drv <= 0;
	 else if (m == 3) nreset <= 1'b1;
	 
	 #1 $display("%s: [ok] SBL: m=%1d: RESET#=%b, SKIPEXT#=%b", `TESTNAME, m, nreset, nskipext);
	 
	 #1600000 for (k = 0; k < 16; k = k + 1) begin
	    #400000 opif <= k;
	    
	    for (j = 0; j < 16; j = j + 1) begin
	       #100000 {fv, fl, fz, fn} <= j;

	       // Only the first 10 bits of the IR are used.
	       for (i = 0; i < 1024; i = i + 1) begin
		  #250 ir <= i;

		  // Clk4 should clock data into the skip flag register
		  #187 clk4 <= 0;
		  #63 clk4 <= 1;
	       end
	    end
	 end // for (k = 0; k < 16; k = k + 1)
      end // for (m = 0; m < 3; m = m + 1)

      #5000 ;
      $display("%s: [ok] Pass (SBL).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB1_SBL dut(nreset, clk4, fv, fl, fz, fn, ir, opif,
			     nskipext, nskip);
			  
endmodule // PB1_SBL_test

// End of file.
