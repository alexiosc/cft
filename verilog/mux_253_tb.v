///////////////////////////////////////////////////////////////////////////////
//
// 74x253 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// mux_253_tb.v -- 74x253 testbench
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

`include "mux.v"
`timescale 1ns/10ps

module mux_253_tb();

   reg [1:0] sel;
   reg [3:0] i1, i2;
   reg 	     noe1, noe2;
   wire      y1, y2;

   integer   i, s;

   // Initialize all variables
   initial begin        
      //$display ("time\t oe1 sel i1  y1   oe2 sel i2   y2");
      $monitor ("t: %7d | %b %b   %b %b  %b > %b %b", $time, noe1, i1, noe2, i2, sel, y1, y2);
      $dumpfile ("vcd/mux_253_tb.vcd");
      $dumpvars (0, mux_253_tb);

      noe1 = 0;
      noe2 = 0;
      i1 = 0;
      i2 = 0;
      sel = 0;
      
      for (i = 0; i < 4096; i = i + 1) begin
	 #100 i1 = i[3:0];
	 i2 = i[7:4];
	 sel = i[9:8];
	 noe1 = i[10];
	 noe2 = i[11];
      end

      #200 $display("OK");
      $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   mux_253 mux_253 (.sel(sel),
		    .i1(i1), .noe1(noe1), .y1(y1),
		    .i2(i2), .noe2(noe2), .y2(y2));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (noe1, i1, noe2, i2, sel) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.
	 
	 // Check unit 1
   	 if (noe1 === 1) begin
   	    if (y1 !== 1'bz) $sformat(msg, "noe1=%b but y1=%b (should be z", noe1, y1);
   	 end

	 else if (noe1 !== 0) begin
   	    $sformat(msg, "testbench bug, noe1=%b", noe1);
	 end
	   
   	 else begin
   	    if (y1 !== i1[sel]) $sformat(msg, "noe1=%b, i1=%b, sel=%b but y1=%b", noe1, i1, sel, y1);
   	 end


	 // Check unit 2
   	 if (noe2 === 1) begin
   	    if (y2 !== 1'bz) $sformat(msg, "noe2=%b but y2=%b (should be z", noe2, y2);
   	 end

	 else if (noe2 !== 0) begin
   	    $sformat(msg, "testbench bug, noe2=%b", noe2);
	 end
	   
   	 else begin
   	    if (y2 !== i2[sel]) $sformat(msg, "noe2=%b, i2=%b, sel=%b but y2=%b", noe2, i2, sel, y2);
   	 end


   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("OK mux");
      end
   end
   

endmodule
