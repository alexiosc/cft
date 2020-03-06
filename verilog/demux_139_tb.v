///////////////////////////////////////////////////////////////////////////////
//
// 74x139 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// buffer_139_tb.v -- 74x139 testbench
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

module demux_139_tb();

// Declare inputs as regs and outputs as wires
   reg [1:0]  a1, a2;
   reg 	      ng1, ng2;
   wire [3:0] y1, y2;

   integer    i, j;

   // Initialize all variables
   initial begin        
      $monitor("t: %7d | %b %b > %b | %b %b > %b", $time, ng1, a1, y1,  ng2, a2, y2);
      $dumpfile ("vcd/demux_139_tb.vcd");
      $dumpvars (0, demux_139_tb);

      ng1 = 1;
      ng2 = 1;
      a1 = 0;
      a2 = 0;

      for (i = 0; i < 64; i = i + 1) begin
	 #100 { a2, a1, ng2, ng1 } = i;
      end

      #200 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   demux_139 demux (.ng1(ng1), .a1(a1), .y1(y1), .ng2(ng2), .a2(a2), .y2(y2));

   // Verify our findings.
   reg [8191:0] msg;
   reg [3:0] 	cy1, cy2;

   // Test unit 1
   always @ (ng1, a1) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({ng1, a1})
	   {1'b1, 2'b??}: cy1 = 4'b1111;
	   {1'b0, 2'b00}: cy1 = 4'b1110;
	   {1'b0, 2'b01}: cy1 = 4'b1101;
	   {1'b0, 2'b10}: cy1 = 4'b1011;
	   {1'b0, 2'b11}: cy1 = 4'b0111;
	 endcase // casex ({ng1, a1})

	 if (y1 !== cy1) $sformat(msg, "ng1=%b, a1=%b, but y1=%b (should be %b)", ng1, a1, y1, cy1);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK unit1");
      end
   end // always @ (ng1, a1)

   // Test unit 1
   always @ (ng2, a2) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({ng2, a2})
	   {1'b1, 2'b??}: cy2 = 4'b1111;
	   {1'b0, 2'b00}: cy2 = 4'b1110;
	   {1'b0, 2'b01}: cy2 = 4'b1101;
	   {1'b0, 2'b10}: cy2 = 4'b1011;
	   {1'b0, 2'b11}: cy2 = 4'b0111;
	 endcase // casex ({ng2, a2})

	 if (y2 !== cy2) $sformat(msg, "ng2=%b, a2=%b, but y2=%b (should be %b)", ng2, a2, y2, cy2);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK unit2");
      end
   end // always @ (ng2, a2)

endmodule
