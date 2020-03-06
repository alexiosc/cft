///////////////////////////////////////////////////////////////////////////////
//
// 74x245 BUFFER/TRANSCEIVER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// buffer_245_tb.v -- 74x245 testbench
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

`include "buffer.v"
`timescale 1ns/10ps

module buffer_245_tb();
   reg 	        nen, dir;
   
   wire [7:0] 	a, b;
   reg [7:0] 	aw, bw;

   // Hack to allow bidirectional tri-state driving/reading.
   assign a = aw;
   assign b = bw;

   reg [800:0] 	status;
   integer 	i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/buffer_245_tb.vcd");
      $dumpvars (0, buffer_245_tb);
      $monitor ("t: %7d | %b %b %02x %02x (%0s)",
		$time, nen, dir, a, b, status);

      status = "reset";
      
      nen = 1;
      dir = 0;
      aw = 8'bzzzzzzzz;
      bw = 8'bzzzzzzzz;

      #100;

      // Drive A->B first
      status = "A->B";
      dir = 1;
      bw = 8'bzzzzzzzz;
      for (i = 0; i < 512; i = i + 1) begin
	 #100 nen = i[0];
	 aw = i[8:1];
      end
      aw = 8'bzzzzzzzz;

      // Drive A->B first
      #500 status = "B->A";
      dir = 0;
      aw = 8'bzzzzzzzz;
      for (i = 0; i < 512; i = i + 1) begin
	 #100 nen = i[0];
	 bw = i[8:1];
      end
      bw = 8'bzzzzzzzz;

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   buffer_245 #(2) buffer (.nen(nen), .dir(dir), .a(a), .b(b));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (dir, nen, a, b) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Check the Gate first. If it's high (previous result unequal), the
	 // comparison should always be unequal.
	 casex ({nen, dir})
	   2'b11: // disabled, dir=A->B
	     if (b !== 8'bzzzzzzzz) begin
	      $sformat(msg, "nen=%b, dir=%b, a=%02x but b=%b (B should be Z)", nen, dir, a, b);
	     end

	   2'b10: // disabled, dir=B->A
	     if (a !== 8'bzzzzzzzz) begin
		$sformat(msg, "nen=%b, dir=%b, b=%02x but a=%b (A should be Z)", nen, dir, b, a);
	     end

	   2'b01: // enabled, dir=A->B -- check aw, a and b
	     if (aw !== a || a !== b) begin
		$sformat(msg, "nen=%b, dir=%b, aw=%02x, a=%02x, b=%b (all three should be equal)", nen, dir, aw, a, b);
	     end

	   2'b00: // enabled, dir=B->A -- check wb, a and b
	     if (bw !== b || b !== a) begin
		$sformat(msg, "nen=%b, dir=%b, bw=%02x, b=%02x, a=%b (all three should be equal)", nen, dir, bw, b, a);
	     end

	   default: $sformat(msg, "testbench bug, nen=%b, dir=%b", nen, dir);
	 endcase; // casex ({nen, dir})

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK xceiver");
      end
   end
endmodule // buffer_245_tb

// End of file.
