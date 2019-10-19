///////////////////////////////////////////////////////////////////////////////
//
// TEST THE INSTRUCTION REGISTER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_ir_tb.v -- Instruction Register testbench
//
// Copyright © 2011-2019 Alexios Chouchoulas
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

`include "reg_ir.v"
`timescale 1ns/10ps

module reg_ir_tb();
   reg         nreset;
   reg         nwrite_ir;
   reg [15:0]  ibus;
   wire [15:0] ibus_real;
   
   reg 	       nfpirl;
   reg 	       nfpirh;
   wire [7:0]  fpd;

   wire [15:0] ir;
   
   integer    i;
   
   // Initialize all variables
   initial begin
      $monitor ("t: %7d | %b %b %h > %h | %b %b > %h", $time, nreset, nwrite_ir, ibus_real, ir, nfpirl, nfpirh, fpd);
      $dumpfile ("vcd/reg_ir_tb.vcd");
      $dumpvars (0, reg_ir_tb);

      ibus = 16'h0000;
      nreset = 0;
      nfpirl = 1;
      nfpirh = 1;
      nwrite_ir = 1;

      // Simulate reset
      #250 nreset = 1;

      for (i = 0; i < 65536; i = i + 1) begin
	 #250 ibus = i;
      end
      
      #1000 $display("OK");
      $finish;      // Terminate simulation
   end // initial begin

   // Load the IR and front panel every now and then. Note: the two
   // processes are interlocked because having them truly asynchronous
   // makes it harder to code this testbench.
   always begin
      #682.5 nwrite_ir = 0;
      #63.5 nwrite_ir = 1;
      #63.5 nfpirl = 0;
      #63.5 nfpirl = 1;
      #63.5 nfpirh = 0;
      #63.5 nfpirh = 1;
   end

   assign ibus_real = ibus;

   // Connect DUT to test bench
   reg_ir reg_ir (.nreset(nreset),
		  .ibus(ibus_real),
		  .nwrite_ir(nwrite_ir),
		  .ir(ir),
		  .nfpirl(nfpirl), .nfpirh(nfpirh), .fpd(fpd));

   // Verify our findings.
   reg [8191:0] msg;
   reg [15:0] 	prev_ir = 16'bzzzzzzzzzzzzzzzz;

   always @ (nreset, posedge nwrite_ir) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Check IR behaviour.
	 if (nreset === 0) begin
	    if (ir !== 16'bzzzzzzzzzzzzzzzz) $sformat(msg, "nreset=%b but ir=%b (should be Z)", nreset, ir);
	 end

	 else if (nreset !== 1) begin
	    $sformat(msg, "testbench bug, nreset=%b", nreset);
	 end

	 else if (nwrite_ir === 0) begin
	    prev_ir = ir;
	    if (ir !== ibus) $sformat(msg, "nreset=%b, nwrite_ir=%b, ibus=%x but ir=%x",
				      nreset, nwrite_ir, ibus, ir);
	 end

	 else if (nwrite_ir !== 1) begin
	    $sformat(msg, "testbench bug, nwrite_ir=%b", nwrite_ir);
	 end

	 else if (prev_ir != ir) begin
	    $sformat(msg, "nreset=%b, nwrite_ir=%b, ibus=%x, ir changed unexpectedly from %x to %x",
		     nreset, nwrite_ir, ibus, prev_ir, ir);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #1000 $finish;
	 end
	 else $display("OK IR");

      end // always @ (nreset, posedge nwrite_ir)
   end // always @ (nreset, posedge nwrite_ir)

   always @(nfpirl, nfpirh, fpd) begin
      #20 begin
	 if (nfpirl === 1 && nfpirh === 1) begin
	    if (fpd != 8'bzzzzzzzz) $sformat(msg, "nfpirl=%b, nfpirh=%b, but fpd=%x (should be Z)", nfpirl, nfpirh, fpd);
	 end

	 else if (nfpirl === 0) begin
	    if (fpd != ir[7:0]) $sformat(msg, "nfpirl=%b, nfpirh=%b, ir=%x, but fpd=%x", nfpirl, nfpirh, ir, fpd);
	 end

	 else if (nfpirl !== 1) $sformat(msg, "testbench bug, nfpirl=%b", nfpirl);

	 else if (nfpirh === 0) begin
	    if (fpd != ir[15:8]) $sformat(msg, "nfpirl=%b, nfpirh=%b, ir=%x, but fpd=%x", nfpirl, nfpirh, ir, fpd);
	 end

	 else if (nfpirh !== 1) $sformat(msg, "testbench bug, nfpirh=%b", nfpirh);


	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #1000 $finish;
	 end
	 else $display("OK Front Panel");
      end
   end
endmodule // reg_ir_tb

// End of file.
