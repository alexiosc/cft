///////////////////////////////////////////////////////////////////////////////
//
// 74x670 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// regfile_670_tb.v -- 74x670 testbench
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

`include "regfile.v"
`timescale 1ns/10ps

module regfile_670_tb();

// Declare inputs as regs and outputs as wires
   reg [3:0]   d;
   reg 	       nwe, nre;
   reg [1:0]   ra, wa;

   wire [3:0]  q;
   
   reg [3:0]   x;
   
   reg [800:0] status;
   integer     i, j;
   
   // Initialize all variables
   initial begin        
      $monitor ("t: %7d | %b %b %b | %b %b %b (%b %b %b %b)", $time, d, wa, nwe,   ra, nre, q, lastd[0], lastd[1], lastd[2], lastd[3]);
      $dumpfile ("vcd/regfile_670_tb.vcd");
      $dumpvars (0, regfile_670_tb);

      
      ra = 2'b00;
      nre = 1'b1;
      nwe = 1'b1;

      status = "writing";
      for (i = 0; i < 2048; i = i + 1) begin
	 #50 d = i[4:1];
	 #25  wa = i[6:5];
	 #25  nwe = i[0];
      end
      status = "reading";

   end // initial begin

   initial begin
      #100075 begin
	 status = "writing + reading";
	 for (j = 0; j < 2048; j = j + 1) begin
	    #100  {ra, nre} = j[2:0];
	 end
      end
      #5000 $display("OK");
      $finish;
   end

   // always begin
   //    #400 ra = ra + 1;
   // end
   
   // always begin
   //    x = x + 1;
   //    #500 d = x;
   //    #10 wa = 2'b11;
   //    #10 we = 1'b0;
   //    #50 we = 1'b1;
   //    #10 d = 4'bzzzz;
   // end
   
   // always begin
   //    #50 re = ~re;
   // end
   
   // Connect DUT to test bench
   regfile_670 regfile (.d(d), .nre(nre), .nwe(nwe), .ra(ra), .wa(wa), .q(q));

   // Verify our findings.
   reg [8191:0] msg;
   reg [3:0] 	lastd[0:3];	// An array of 4-bit values

   // Verify writing. We'll peer into the '670 to do this properly.
   always @ (posedge nwe, d) begin
      #30 begin
	 msg[0] = "";		// Use the msg as a flag.

	 // posedge!
	 if (nwe === 1'b1) begin
	    // Store the value for future reference.
	    $display("*** wa=%b, d=%b, lastd[wa]=%b", wa, d, lastd[wa]);
	    
	    lastd[wa] = d;
	    
	    // Check the 670's guts.
	    if (regfile.q0[wa] !== d) $sformat(msg, "nwe=%b, wa=%b, d=%b, but regfile.q0[wa]=%b", nwe, wa, d, regfile.q0[wa]);
	 end

	 else if (nwe !== 1'b0) $sformat(msg, "testbench bug, new=%b", nwe);

	 // Fail if we've logged an issue.
	 if (msg[0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK write");
      end
   end

   // Verify reading.
   always @ (nre, ra) begin
      #40 begin
	 msg[0] = "";		// Use the msg as a flag.

	 if (nre === 1'b0) begin
	    // Check the 670's guts.
	    if (q !== regfile.q0[ra]) $sformat(msg, "nre=%b, ra=%b, regfile.q0[wa]=%b, but q=%b", nre, ra, regfile.q0[wa], q);
	 end

	 else if (nre === 1'b1) begin
	    if (q !== 4'bzzzz) $sformat(msg, "nre=%b but q=%b (should be Z)", nre, q);
	 end

	 else if (nre !== 1'b1) $sformat(msg, "testbench bug, new=%b", nwe);

	 // Fail if we've logged an issue.
	 if (msg[0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK read");
      end
   end

endmodule
