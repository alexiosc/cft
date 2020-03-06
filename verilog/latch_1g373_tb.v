///////////////////////////////////////////////////////////////////////////////
//
// 74LVC1G373 LATCH TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// latch_1g373_tb.v -- 74x1g373 testbench
//
// Copyright © 2011–2020 Alexios Chouchoulas
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

`include "flipflop.v"
`timescale 1ns/10ps

module latch_1g373_tb();
   reg     d, le, noe;
   wire    q;
   integer i;

   // Initialize all variables
   initial begin        
      //$display ("time\t d c s r q Q");
      $monitor ("t: %7d | %b %b %b > %b", $time, le, d, noe, q);
      $dumpfile ("vcd/latch_1g373_tb.vcd");
      $dumpvars (0, latch_1g373_tb);

      d = 0;
      noe = 0;
      le = 1; // To initialise the latch
      

      for (i = 0; i < 512; i = i + 1) begin
	 #100;

	 noe = i[0];
	 d = i[2];
	 le = i[4];
      end
      #300 $display("345 OK");
      $finish;      // Terminate simulation
   end // initial begin
   
   // Connect DUT to test bench
   latch_1g373 latch (.d(d), .le(le), .noe(noe), .q(q));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (noe, le, d) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (le !== 1'b1 && le !== 1'b0) begin
	    $sformat(msg, "testbench bug, le=%b", le);
	 end

	 else if (noe !== 1'b1 && noe !== 1'b0) begin
	    $sformat(msg, "testbench bug, noe=%b", noe);
	 end

	 else if (d !== 1'b1 && d !== 1'b0) begin
	    $sformat(msg, "testbench bug, d=%b", d);
	 end

	 else if (le === 1'b1 && noe === 1'b0 && q !== d) begin
	    $sformat(msg, "latch enabled, but output did not follow input: le=%b, d=%b, noe=%b, but q=%b",
		     le, d, noe, q);
	 end

	 else if (noe === 1'b1 && q !== 1'bz) begin
	    $sformat(msg, "latch disabled, but output is driven: noe=%b, q=%b", noe, q);
	 end
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK latch");
      end
   end // always @ (noe, le, d)
endmodule

// End of file.
