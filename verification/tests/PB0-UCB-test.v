///////////////////////////////////////////////////////////////////////////////
//
// PB0-ucb.v -- Processor Board, Microcode Store, UCB Extension
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

`include "../PB0-UCB.v"

`timescale 10ns/10ps

module PB0_ucb();

   // Expansion connector (DIN 41612)
   output reg [15:0] ab;        // 16-bit address bus
   output reg 	     nreset;
   output reg 	     nw;
   output reg 	     nio;
   output reg  	     nend;

   wire 	     nsysdev;

   wire [3:0] 	     ucb;

   integer 	     i, j;
      
   // Combinatorial evaluation of SYSDEV
   assign nsysdev = ~(nio == 0 && ab[15:8] == 8'd0);
      
   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB0-ucb.vcd");
      $dumpvars (0, PB0_ucb);
`endif
      
      // Reset. Normally, the bus is driven by the processor but in this case,
      // we just idle it to test the microcode Ucb with actually driving any
      // processor units.
      ab <= 16'b0;
      nio <= 1'b1;
      nw <= 1'b1;
      nreset <= 1'b0;		// Assert reset!

      nend <= 1'b1;

      // Come out of reset and out of tri-state
      #125 nreset <= 1'b1;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // TEST PERMANENT UCB
      //
      ///////////////////////////////////////////////////////////////////////////////
      
      for (i = 1; i < 18; i = i + 1) begin
	 #125 begin
	    ab <= i & 15;
	    nio <= 1'b0;
	    nw <= 1'b0;
	    nend = 1'b0;
	 end
	 
	 #63 nw <= 1'b1;
	 #63 begin

	    // Ensure the UCB hasn't been set yet.
	    if (ucb == (i & 15)) begin
	       $display("%s: [fail] i=perm/%h: UCB set too early, should latch after END#",
			`TESTNAME, i);
	       $display ("%s: [fail] Assertion failed (UCB latched too early).", `TESTNAME);
	       #100 $finish;
	    end
	    
	    nio <= 1'b1;
	    nend = 1'b1;
	 end // #63

	 #30 begin
	    // Ensure the UCB has been set at this point
	    if (ucb != (i & 15)) begin
	       $display("%s: [fail] i=perm/%h: UCB incorrect. Should be %h, is %h.",
			`TESTNAME, i, (i & 15), ucb);
	       $display ("%s: [fail] Assertion failed (UCB incorrect).", `TESTNAME);
	       #100 $finish;
	    end
	    /*
	    // Ensure the uADDR includes the new setting of the UCB
	    if (dut.uaddr[18:15] != ucb) begin
	       $display("%s: [fail] i=perm/%h: uADDR (%h) does not contain UCB (%h)!",
			`TESTNAME, i, dut.uaddr, ucb);
	       $display ("%s: [fail] Assertion failed (uADDR incorrect).", `TESTNAME);
	       #100 $finish;
	    end
	     */
	 end

	 #95 nend = 0;
	 #125 nend = 1;

	 #30 begin
	    // Ensure the UCB is still the same (permanent change)
	    if (ucb != (i & 15)) begin
	       $display("%s: [fail] i=perm/%h: UCB incorrect after END# strobe. Should be %h, is %h.",
			`TESTNAME, i, (i & 15), ucb);
	       $display ("%s: [fail] Assertion failed (UCB changed after END#).", `TESTNAME);
	       #100 $finish;
	    end
	 end
      end // for (i = 1; i < 18; i = i + 1)

      $display("%s: [ok] Pass (permanent UCB).", `TESTNAME);

      ///////////////////////////////////////////////////////////////////////////////
      //
      // TEMPORARY UCB TEST
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Keep a record of what the UCB is now.
      j = ucb;
      
      #500 for (i = 0; i < 18; i = i + 1) begin
	 #125 begin
	    ab <= 16'd16 + (i & 15);
	    nio <= 1'b0;
	    nw <= 1'b0;
	    nend = 1'b0;
	 end
	 
	 #63 nw <= 1'b1;
	 #63 begin
	    // Ensure the UCB hasn't been set yet. Don't check the UCB we've
	    // already set because this causes the test to fail spuriously.
	    if (((i & 15) != j) && ucb == (i & 15)) begin
	       $display("%s: [fail] i=temp/%h: UCB set too early, should latch after END#",
			`TESTNAME, i);
	       $display ("%s: [fail] Assertion failed (UCB latched too early).", `TESTNAME);
	       #100 $finish;
	    end
	    
	    nio <= 1'b1;
	    nend = 1'b1;
	 end

	 #30 begin
	    // Ensure the UCB has been set at this point
	    if (ucb != (i & 15)) begin
	       $display("%s: [fail] i=temp/%h: UCB incorrect. Should be %h, is %h.",
			`TESTNAME, i, (i & 15), ucb);
	       $display ("%s: [fail] Assertion failed (UCB incorrect).", `TESTNAME);
	       #100 $finish;
	    end
	    /*
	    // Ensure the uADDR includes the new setting of the UCB
	    if (dut.uaddr[18:15] != ucb) begin
	       $display("%s: [fail] i=temp/%h: uADDR (%h) does not contain UCB (%h)!",
			`TESTNAME, i, dut.uaddr, ucb);
	       $display ("%s: [fail] Assertion failed (uADDR incorrect).", `TESTNAME);
	       #100 $finish;
	    end
	     */
	 end

	 #95 nend = 0;
	 #125 nend = 1;
	   
	 #30 begin
	    // Ensure the UCB has reverted to the permanent one (temporary change)
	    if (ucb != j) begin
	       $display("%s: [fail] i=temp/%h: UCB incorrect after END# strobe. Should be %h, is %h.",
			`TESTNAME, i, j, ucb);
	       $display ("%s: [fail] Assertion failed (temp UCB did not revert after END#).", `TESTNAME);
	       #100 $finish;
	    end
	 end
      end

      $display("%s: [ok] Pass (temporary UCB).", `TESTNAME);
      #500 $finish;      // Terminate simulation
   end // initial begin

   PB0_UCB dut(
	       .nreset(nreset),
	       .nsysdev(nsysdev),
	       .nw(nw),
	       .ab(ab),
	       .nend(nend),
	       .ucb(ucb));

endmodule // PB0_ucb

// End of file.
