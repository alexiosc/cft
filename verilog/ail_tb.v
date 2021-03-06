///////////////////////////////////////////////////////////////////////////////
//
// AUTO-INDEX LOGIC TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// ail_tb.v -- Auto-Index Logic Testbench
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

`include "ail.v"
`timescale 1ns/10ps

module ail_tb();
   wire [15:0] ir;
   wire [1:0]  idx;
   wire        nidxen;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      $monitor ("t: %7d | %b > %b %b", $time, ir, idx, nidxen);
      $dumpfile ("vcd/ail_tb.vcd");
      $dumpvars (0, ail_tb);

      i = 0;
            
      for (i = 0; i < 65536; i = i + 1) begin
	 #62.5;
      end
      
      #500 $display("345 OK");
      $finish;
   end // initial begin

   assign ir = i[15:0];
   
   // Connect DUT to test bench
   ail ail (.ir(ir), .idx(idx), .nidxen(nidxen));

   // Verify our findings.
   reg [8191:0] msg;
   reg [1:0] 	correct_idx;
   always @ (ir) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Table is from schematics
	 casex (ir[9:0])
	   10'b00????????: correct_idx = 2'b00;
	   10'b01????????: correct_idx = 2'b00;
	   10'b10????????: correct_idx = 2'b00;
	   10'b1100??????: correct_idx = 2'b00;
	   10'b1101??????: correct_idx = 2'b01;
	   10'b1110??????: correct_idx = 2'b10;
	   10'b1111??????: correct_idx = 2'b11;
	 endcase // casex (ir)

	 if (idx !== correct_idx) begin
	    $sformat(msg, "ir[9:0]=%b (&%03x) but idx=%b (should be %b)",
		     ir[9:0], ir[9:0], idx, correct_idx);
	 end

	 else if (nidxen !== (ir[9:8] === 2'b11 ? 1'b0 : 1'b1)) begin
	    $sformat(msg, "idxen decoding failure: ir[9:8]=%b (&%04x), but nindxen=%b",
		     ir[9:8], ir[9:0], nidxen);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK ail");
      end
   end // always @ (nread_agl, ir, pc)
endmodule // ail_tb

// End of file.
