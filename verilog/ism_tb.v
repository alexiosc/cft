///////////////////////////////////////////////////////////////////////////////
//
// INTERRUPT LOGIC TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OKxxxFAIL OUTPUT
//
// ism_tb.v -- Interrupt Logic Testbench
//
// Copyright © 2011–2019 Alexios Chouchoulas
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

`include "ism.v"
`include "clock.v"
`timescale 1ns/10ps

module ism_tb();
   reg        nreset;
   reg 	      nend;
   reg 	      naction_sti;
   reg 	      naction_cli;
   reg 	      nirq;
   
   wire       clk1, clk2, clk3, clk4;
   wire       fi;
   wire       nirqs;
   
   wire [4:0] state;
   
   integer    upc = 0;
   integer    i;
   reg [800:0] status;

   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");
      $monitor ("t: %7d | %b %b %b %b %b %b | %b %b > %b | %b > %b",
		$time,
		nreset, clk1, clk2, clk3, clk4, nend,
		naction_sti, naction_cli, fi,
		nirq, nirqs);
      $dumpfile ("vcd/ism_tb.vcd");
      $dumpvars (0, ism_tb);

      status = "reset";
      nreset = 0;
      nend = 1;
      nirq = 1;
      naction_sti = 1;
      naction_cli = 1;
      #250 nreset = 1;

      // Simulate the interrupt part of the reset sequence.

      for (i = 0; i < 5; i = i + 1) begin
	 #2000 status = "STI";
	 naction_sti = 0;
	 #250 naction_sti = 1;

	 #2000 status = "CLI";
	 naction_cli = 0;
	 #250 naction_cli = 1;
      end

      #2000 status = "Masked INT";
      nirq = 0;

      #4000 status = "INT";
      naction_sti = 0;
      #250 naction_sti = 1;

      #2000 nirq = 1;
      
      #4000 status = "CLI";
      naction_cli = 0;
      #250 naction_cli = 1;

      #2000 status = "STI";
      naction_sti = 0;
      #250 naction_sti = 1;
      

      // for (i = 0; i < 10; i = i + 1) begin
      // 	 #5000 naction_sti = 0;
      // 	 #1000 naction_sti = 1;
      // 	 #5000 naction_cli = 0;
      // 	 #1000 naction_cli = 1;
      // end;
      
      // for (i = 0; i < 65536; i = i + 1) begin
      // 	 #63.5;
      // end
      
      #5000 $display("OK");
      $finish;
   end // initial begin

   // Simulate IRQs
   // always begin
   //    #1933 nirq = 0;
   //    #1933 nirq = 1;
   // end

   // Simulate nend
   always @(posedge clk1) begin
      if (upc == 3) begin
	 #55 nend = 1'b0;
	 upc = 0;
      end else begin
	 #55 nend = 1;
	 upc = upc + 1;
      end
   end

   // Create a state vector, which we can use to decode ISM states.
   assign state = { fi, ism.nint0, ism.nint, ism.irqs0, nirqs };

   // Use the standard clock generator.
   clock_generator clock_generator (.nreset(nreset),
				    .fpclk(1'b1), .nfpclk_or_clk(1'b1),
				    .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4));
   
   // Connect DUT to test bench
   ism ism (.nreset(nreset), .clk1(clk1), .clk3(clk3), .clk4(clk4),
	    .nend(nend), .naction_cli(naction_cli), .naction_sti(naction_sti),
	    .nirq(nirq), .fi(fi), .nirqs(nirqs));

   // Verify our findings.
   reg [8191:0] msg;
   reg 		correct_fi = 0;
   always @ (naction_cli, naction_sti) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (naction_cli === 0 && naction_sti === 0) begin
	    $sformat(msg, "testbench bug, naction_cli=%b, naction_sti=%b (should never happen)",
		     naction_cli, naction_sti);
	 end
	 else if (naction_cli === 0) correct_fi = 0;
	 else if (naction_sti === 0) correct_fi = 1;
	 else if (naction_cli !== 1) $sformat(msg, "testbench bug, naction_cli=%b", naction_cli);
	 else if (naction_sti !== 1) $sformat(msg, "testbench bug, naction_sti=%b", naction_sti);

	 if (fi !== correct_fi) begin
	    $sformat(msg, "naction_cli=%b, naction_sti=%b, fi=%b (should be %b)",
		     naction_cli, naction_sti, fi, correct_fi);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK fi");
      end
   end // always @ (nread_agl, ir, pc)

endmodule