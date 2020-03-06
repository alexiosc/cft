///////////////////////////////////////////////////////////////////////////////
//
// 74x139 (half) BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// buffer_139h_tb.v -- 74x139 testbench (half the chip)
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

`include "demux.v"
`timescale 1ns/10ps

module demux_139h_tb();

// Declare inputs as regs and outputs as wires
   reg [1:0]  a;
   reg 	      ng;
   wire [3:0] y;

   integer    i;

   // Initialize all variables
   initial begin        
      $monitor("t: %7d | %b %b > %b", $time, ng, a, y);
      $dumpfile ("vcd/demux_139h_tb.vcd");
      $dumpvars (0, demux_139h_tb);

      ng = 1;
      a = 0;

      for (i = 0; i < 16; i = i + 1) begin
	 #100 { a, ng } = i;
      end

      #200 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   demux_139h demux (.ng(ng), .a(a), .y(y));

   // Verify our findings.
   reg [8191:0] msg;
   reg [3:0] 	cy;

   always @ (ng, a) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({ng, a})
	   {1'b1, 2'b??}: cy = 4'b1111;
	   {1'b0, 2'b00}: cy = 4'b1110;
	   {1'b0, 2'b01}: cy = 4'b1101;
	   {1'b0, 2'b10}: cy = 4'b1011;
	   {1'b0, 2'b11}: cy = 4'b0111;
	 endcase // casex ({ng1, a1})

	 if (y !== cy) $sformat(msg, "ng=%b, a=%b, but y=%b (should be %b)", ng, a, y, cy);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK unit1");
      end
   end // always @ (ng1, a1)

endmodule // demux_139h_tb

// End of file.

