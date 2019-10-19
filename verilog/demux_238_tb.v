///////////////////////////////////////////////////////////////////////////////
//
// 74x238 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// buffer_238_tb.v -- 74x238 testbench
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

`include "demux.v"
`timescale 1ns/10ps

module demux_238_tb();

// Declare inputs as regs and outputs as wires
   wire [2:0]  a;
   wire        g1, ng2a, ng2b;
   wire [7:0]  y;
   
   integer     i;

   // Initialize all variables
   initial begin        
      $monitor ("t: %7d | %b %b %b %h > %b", $time, g1, ng2a, ng2b, a, y);

      $dumpfile ("vcd/demux_238_tb.vcd");
      $dumpvars (0, demux_238_tb);

      for (i = 0; i < 64; i = i + 1) begin
	 #40 ;
      end

      #500 $display("OK");
      $finish;      // Terminate simulation
   end // initial begin

   assign g1 = i[5];
   assign ng2a = i[4];
   assign ng2b = i[3];
   assign a = i[2:0];

   // Connect DUT to test bench
   demux_238 demux (.g1(g1), .ng2a(ng2a), .ng2b(ng2b), .a(a), .y(y));

   // Verify our findings.
   reg [8191:0] msg;
   reg [7:0] 	correct_y;
   always @ (i) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (g1 !== 1 && g1 !== 0) $sformat(msg, "testbench bug, g1=%b", g1);
	 else if (ng2a !== 1 && ng2a !== 0) $sformat(msg, "testbench bug, ng2a=%b", ng2a);
	 else if (ng2b !== 1 && ng2b !== 0) $sformat(msg, "testbench bug, ng2b=%b", ng2b);

	 else if (g1 === 1 && ng2a === 0 && ng2b === 0) begin
	    casex ({g1, ng2a, ng2b, a})
	      6'b0_?_?_???: correct_y = 8'b00000000; // Not selected (g1 low)
	      6'b1_1_?_???: correct_y = 8'b00000000; // Not selected (ng2a high)
	      6'b1_?_1_???: correct_y = 8'b00000000; // Not selected (ng2b high)
	      6'b1_0_0_000: correct_y = 8'b00000001; // A=0
	      6'b1_0_0_001: correct_y = 8'b00000010; // A=1
	      6'b1_0_0_010: correct_y = 8'b00000100; // A=2
	      6'b1_0_0_011: correct_y = 8'b00001000; // A=3
	      6'b1_0_0_100: correct_y = 8'b00010000; // A=4
	      6'b1_0_0_101: correct_y = 8'b00100000; // A=5
	      6'b1_0_0_110: correct_y = 8'b01000000; // A=6
 	      6'b1_0_0_111: correct_y = 8'b10000000; // A=7
	      default:
		$sformat(msg, "testbench bug, unmatched input g1=%b, ng2a=%b, ng2b=%a, a=%b", g1, ng2a, ng2b, a);
	    endcase; // casex ({g1, ng2a, ng2b, a})

	    if (y !== correct_y) begin
	       $sformat(msg, "g1=%b, ng2a=%b, ng2b=%b, a=%b but y=%b (should be %b)", g1, ng2a, ng2b, a, y, correct_y);
	    end
	    
	 end // if (g1 === 1 && ng2a === 0 && ng2b === 0)
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("OK demux");
      end
   end // always @ (nset, nrst)e


endmodule
