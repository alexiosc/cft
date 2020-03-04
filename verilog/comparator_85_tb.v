///////////////////////////////////////////////////////////////////////////////
//
// 74x85 COMPARATOR TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// comparator_688_tb.v -- 74x85 testbench
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

`include "comparator.v"
`timescale 1ns/10ps

module comparator_85_tb();

   // Declare inputs as regs and outputs as wires
   reg [3:0] a, b;
   reg 	     en;

   reg 	     ieq, ilt, igt;
   wire	     oeq, olt, ogt;
   wire [2:0] n;

   integer    i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/comparator_85_tb.vcd");
      $dumpvars (0, comparator_85_tb);

      ilt = 0;
      ieq = 0;
      igt = 0;
      a = 0;
      b =0;

      for (i = 0; i < 2048; i = i + 1) begin
	 #100 { igt, ilt, ieq, b, a } = i[10:0];
      end

      #200 $finish;      // Terminate simulation
   end

   assign n = olt + oeq + ogt;

   // Connect DUT to test bench
   comparator_85 comparator (a, b, ilt, ieq, igt, olt, oeq, ogt);

   // Verify our findings.
   reg [8191:0] msg;
   reg [2:0] 	correct;

   always @ (a, b, ilt, ieq, igt) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Follow the truth table in the datasheet. ‘Correct’ maps to {ogt, olt, oeq}.
	 correct = 3'bzzz;
	 if (a[3] > b[3]) correct = 3'b100;
	 else if (a[3] < b[3]) correct = 3'b010;
	 else if (a[3] === b[3]) begin

	    if (a[2] > b[2]) correct = 3'b100;
	    else if (a[2] < b[2]) correct = 3'b010;
	    else if (a[2] === b[2]) begin

	       if (a[1] > b[1]) correct = 3'b100;
	       else if (a[1] < b[1]) correct = 3'b010;
	       else if (a[1] === b[1]) begin

		  if (a[0] > b[0]) correct = 3'b100;
		  else if (a[0] < b[0]) correct = 3'b010;
		  else if (a[0] === b[0]) begin

		     casex ({ igt, ilt, ieq })
		       3'b000: correct = 3'b110;
		       3'b001: correct = 3'b001;
		       3'b010: correct = 3'b010;
		       3'b011: correct = 3'b001;
		       3'b100: correct = 3'b100;
		       3'b101: correct = 3'b001;
		       3'b110: correct = 3'b000;
		       3'b111: correct = 3'b001;
		       default: correct = 3'bxxx;
		     endcase // casex ({ igt, ilt, ieq })
		  end // if (a[0] === b[0])
	       end // if (a[1] === b[1])
	    end // if (a[2] === b[2])
	 end // if (a[3] === b[3])

	 if (correct === 3'bxxx) begin
	    // We don't care about these values, they're undefined.
	 end
	 if (correct === 3'bzzz) begin
	    $sformat(msg, "testbench bug: did not decode a=%b, b=%b, {igt,ilt,ieq}=%b%b%b",
		     a, b, igt, ilt, ieq);
	 end
	 else if ({ogt, olt, oeq} !== correct) begin
	    $sformat(msg, "testbench bug: did not decode a=%b, b=%b, {igt,ilt,ieq}=%b%b%b, but {ogt,olt,oeq}=%b%b%b (expected %b)",
		     a, b, igt, ilt, ieq, ogt, olt, oeq, correct);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK comparator");
      end
   end
   

endmodule // comparator_85_tb

// End of file.