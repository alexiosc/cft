///////////////////////////////////////////////////////////////////////////////
//
// 74x191 COUNTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// counter_191_tb.v -- 74x191 testbench
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

`timescale 1ns/10ps
`include "counter.v"

module counter_191_tb();
   // Declare inputs as regs and outputs as wires
   reg 	      npl;
   reg 	      down;
   reg        nce;
   reg        cp;
   reg [3:0]  p;
   wire [3:0] q;
   wire       nrc;
   wire       tc;
   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_191_tb.vcd");
      $monitor ("t: %7d | %b %b %b %b %b > %b %b %b", $time, npl, down, nce, cp, p, q, nrc, tc);
      $dumpvars (0, counter_191_tb);

      cp = 0;
      down = 0;
      nce = 1;
      npl = 1;
      p = 0;

      // Set the initial value.
      for (j = 0; j < 16; j = j + 1) begin
	 #1000 p = j;
	 #100 npl = 0;
	 #100 npl = 1;

	 for (i = 0; i < 128; i = i + 1) begin
	    #50 cp = i[0];
	    down = i[5];
	    nce = i[6];
	 end
      end

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   counter_191 c0 (.p(p), .npl(npl), .down(down), .nce(nce), .cp(cp),
		   .q(q), .nrc(nrc), .tc(tc));

   // Verify our findings.
   reg [8191:0] msg;
   integer 	val = -1, newval = -1;

   // Check value loading
   always @ (npl) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

   	 // Check for an async clear (clr, active high)
   	 if (npl === 0) begin
	    val = p;
   	    if (q !== p) $sformat(msg, "npl=%b, p=%b, but q=%b (should be same as p)", npl, p, q);
	 end else if (npl !== 1) $sformat(msg, "testbench bug, npl=%b", npl);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK load");
      end
   end // always @ (npl)

   integer correct_tc;

   // Check counting
   always @ (posedge cp, nce, down) begin
      #15 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Check terminal count
	 casex ({down, q})
	   5'b0_1111: correct_tc = 1;
	   5'b1_0000: correct_tc = 1;
	   default: correct_tc = 0;
	 endcase // casex ({down, q})

	 // Ensure a value has been loaded, otherwise the counter is in an
	 // unknown state.
	 if (val === -1) begin
	    $sformat(msg, "testbench bug, on cp posedge, val has not been set yet");
	 end

	 // Check correct TC calculated above.
	 else if (tc !== correct_tc) begin
	    $sformat(msg, "down=%b, q=%b (%0d) but tc=%b (should be 1)", down, q, q, tc);
	 end

	 else if (cp === 0) begin
	    if (val !== q) begin
	       $sformat(msg, "nce=%b, cp=%b (negedge), down=%b, but value changed from %b (%0d) to %b (%0d).",
			nce, cp, down, val[3:0], val[3:0], q, q);
	    end
	 end

	 else if (cp !== 1) $sformat(msg, "testbench bug, cp=%b", cp);

   	 // The output shouldn't change if nce is high.
	 else if (nce === 1) begin
	    if (val !== q) begin
	       $sformat(msg, "nce=%b, cp=%b (posedge), down=%b, but value changed from %b (%0d) to %b (%0d).",
			nce, cp, down, val[3:0], val[3:0], q, q);
	    end
	 end

	 // Ensure nce is valid
	 else if (nce !== 0) $sformat(msg, "testbench bug, nce=%b", nce);

	 // Check count up
	 else if (down === 0) begin
	    newval = (val + 1) & 4'b1111;
	    if (q !== newval) begin
	       $sformat(msg, "nce=%b, cp=%b (posedge), down=%b, but value changed from %b (%0d) to %b (%0d). It should have changed to %b (%0d).",
			nce, cp, down, val[3:0], val[3:0], q, q, newval[3:0], newval[3:0]);
	    end
	    val = newval;
	 end
	    
	 // Check count down
	 else if (down === 1) begin
	    newval = (val - 1) & 4'b1111;
	    if (q !== newval) begin
	       $sformat(msg, "nce=%b, cp=%b (posedge), down=%b, but value changed from %b (%0d) to %b (%0d). It should have changed to %b (%0d).",
			nce, cp, down, val, val, q, q, newval, newval);
	    end
	    val = newval;
	 end

	 else $sformat(msg, "testbench bug, down=%b", down);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK count");
      end
   end // always @ (npl)
endmodule // counter_191_tb

// End of file.
