///////////////////////////////////////////////////////////////////////////////
//
// 74x541 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// buffer_541_tb.v -- 74x541 testbench
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

`include "buffer.v"
`timescale 1ns/10ps

module buffer_541_tb();
   reg 	      noe1, noe2;
   reg [7:0]  a;

   wire [7:0] y;

   integer    i, j;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t noe1 noe2 a y");	
      $monitor ("t: %7d | %b %b %b > %b", $time, noe1, noe2, a, y);
      $dumpfile ("vcd/buffer_541_tb.vcd");
      $dumpvars (0, buffer_541_tb);

      for (j = 0; j < 4; j = j + 1) begin
	 noe1 = j[0];
	 noe2 = j[1];

	 for (i = 0; i < 256; i = i + 1) begin
	    #100 a = i;
	 end

	 #500;
      end
      
      #1000 $display("OK");
      $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   buffer_541 buffer (.noe1(noe1), .noe2(noe2), .a(a), .y(y));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (noe1, noe2, a) begin
      #30 begin
	 msg[0] = "";		// Use the msg as a flag.

	 // Check the Gate first. If it's high (previous result unequal), the
	 // comparison should always be unequal.
	 if (noe1 === 1 || noe2 === 1) begin
	    if (y !== 8'bzzzzzzzz) $sformat(msg, "noe1=%b, noe2=%b, a=%02x, but y=%b (should be Z)", noe1, noe2, a, y);
	 end

	 else if (noe1 === 0 && noe2 === 0) begin
	    if (y !== a) $sformat(msg, "noe1=%b, noe2=%b, a=%02x, but y=%b (should be %02x)", noe1, noe2, a, y, a);
	 end

	 else $sformat(msg, "testbench bug, noe1=%b, noe2=%b", noe1, noe2);

	 // Fail if we've logged an issue.
	 if (msg[0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
      end
   end
endmodule // buffer_541_tb

// End of file.
