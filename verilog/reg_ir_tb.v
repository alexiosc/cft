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
   reg 	       clk4;
   reg 	       nwrite_ir;
   reg [15:0]  ibus;
   wire [15:0] ibus_real;
   
   reg 	       nfpirl;
   reg 	       nfpirh;
   wire [7:0]  fpd;

   wire [15:0] ir;
   
   integer     i, wa;
   
   // Initialize all variables
   initial begin
      $monitor ("t: %7d | %b %b %h > %h | %b %b > %h", $time, clk4, nwrite_ir, ibus_real, ir, nfpirl, nfpirh, fpd);
      $dumpfile ("vcd/reg_ir_tb.vcd");
      $dumpvars (0, reg_ir_tb);

      wa = 0;
      ibus = 16'h0000;
      nfpirl = 1;
      nfpirh = 1;
      nwrite_ir = 1;
      clk4 = 0;
      #250;

      // Let it wrap around
      for (i = 0; i < 65600; i = i + 1) begin
	 #62.5 ibus = i;	// T3
	 nwrite_ir = 0;
	 #62.5 clk4 = 0;	// T4
	 #62.5 clk4 = 1;	// T1
	 #62.5 nwrite_ir = 1;	// T2

	 #62.5 nfpirl = 0;
	 #62.5 nfpirl = 1;
	 #62.5 nfpirh = 0;
	 #62.5 nfpirh = 1;
      end
      #1000 $display("OK");
      $finish;      // Terminate simulation
   end // initial begin

   assign ibus_real = ibus;

   // Connect DUT to test bench
   reg_ir reg_ir (.clk4(clk4),
		  .ibus(ibus_real),
		  .nwrite_ir(nwrite_ir),
		  .ir(ir),
		  .nfpirl(nfpirl), .nfpirh(nfpirh), .fpd(fpd));

   // Verify our findings.
   reg [8191:0] msg;
   reg [15:0] 	prev_ir = 16'bzzzzzzzzzzzzzzzz;

   always @ (posedge clk4) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Check IR behaviour.
	 if (clk4 === 1'b1 && nwrite_ir === 1'b0) begin
	    prev_ir = ir;
	    if (ir !== ibus) $sformat(msg, "nwrite_ir=%b, ibus=%x but ir=%x",
				      nwrite_ir, ibus, ir);
	 end

	 else if (clk4 !== 1'b0 && clk4 !== 1'b1) begin
	    $sformat(msg, "testbench bug, clk4=%b", clk4);
	 end

	 else if (prev_ir != ir) begin
	    $sformat(msg, "nwrite_ir=%b, ibus=%x, ir changed unexpectedly from %x to %x",
		     nwrite_ir, ibus, prev_ir, ir);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #1000 $finish;
	 end
	 else $display("OK IR");

      end // always @ (posedge clk4)
   end // always @ (posedge clk4)

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
