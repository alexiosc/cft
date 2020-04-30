///////////////////////////////////////////////////////////////////////////////
//
// ALU PORT A BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// alu_porta_tb.v -- ALU Port A testbench
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

`include "alu_porta.v"
`timescale 1ns/10ps

module alu_porta_tb();
   reg [15:0]  ac;
   reg 	       acp;
   
   wire [15:0] a;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_porta_tb.vcd");
      $dumpvars (0, alu_porta_tb);

      ac = 16'h5555;
      acp = 0;

      for (i = 0; i < 65536; i = i + 1) begin
	 #125 ac = i;
	 #62.5 acp = 0;
	 #62.5 acp = 1;
      end
      
      #1000 $display("345 OK");
      $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   alu_porta alu_porta (.ac(ac), .acp(acp),.a(a));

   // Verify our findings.
   reg [8191:0] msg;
   reg [15:0] 	olda = 16'hZZZZ;
   
   always @ (a) begin
      #40 begin	
	 if (olda !== 16'hZZZZ && a !== olda) begin
	    $sformat(msg, "Port A changed from %04h to %04h without reason.", olda, a);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK ALU Port A");
      end 
   end

   always @ (posedge acp) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Check the Gate first. If it's high (previous result unequal), the
	 // comparison should always be unequal.
	 if (a !== ac) begin
	    $sformat(msg, "ac=%b (%04h) but a=%b (%04h) on rising edge of acp", ac, ac, a, a);
	 end

	 olda = a;

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK ALU Port A");
      end
   end
endmodule // alu_porta_tb

// End of file.
