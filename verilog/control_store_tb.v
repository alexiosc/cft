///////////////////////////////////////////////////////////////////////////////
//
// TEST THE MICROCODE STORE
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// microcode_store_tb.v -- Microcode Store testbench
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

`include "control_store.v"

`timescale 1ns/10ps

module control_store_tb();
   reg ncse;
   
   reg [18:0] uaddr;

   wire [23:0] udata;

   // Front panel handling      
   reg 	        nfpua0;
   reg 	        nfpuc0;
   reg 	        nfpuc1;
   reg 	        nfpuc2;
   wire [7:0]   fpd;

   initial begin
      
      //$display ("time\t d pulse");
      $monitor ("t: %7d | %b %h > %h | %b %b %b %b > %h", $time,
		ncse, uaddr, udata,
		nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);
      $dumpfile ("vcd/control_store_tb.vcd");
      $dumpvars (0, control_store_tb);

      ncse = 1'b0;
      uaddr = 24'b1100000000000000000; // That's where the good stuff starts.

      nfpua0 = 1;
      nfpuc0 = 1;
      nfpuc1 = 1;
      nfpuc2 = 1;

      // Make sure we're not counting during reset.
      #1000 ncse = 1'b1;
      #1000 ncse = 1'b0;

      #3000000 $finish;
      
   end // initial begin

   // Simulate a realistic fast clock
   always begin
      #1000 uaddr = uaddr + 1;
   end

   // Asynchronous Front Panel functionality. 1817 + 4×30 = 1937 which
   // is prime. This makes it a more realistic test. (the CFT and FP
   // clock domains being out of phase)
   always begin
      #1000 nfpua0 = 0;
      #250  nfpua0 = 1; 
            nfpuc0 = 0;
      #250  nfpuc0 = 1; 
            nfpuc1 = 0;
      #250  nfpuc1 = 1; 
            nfpuc2 = 0;
      #250  nfpuc2 = 1;
   end

   control_store control_store(.ncse(ncse),
			       .uaddr(uaddr),
			       .udata(udata),
			       .nfpua0(nfpua0),
			       .nfpuc0(nfpuc0), 
			       .nfpuc1(nfpuc1),
			       .nfpuc2(nfpuc2),
			       .fpd(fpd));
   
   // Verify our findings.
   reg [8191:0] msg;
   reg [7:0] 	fpval;
   
   always @ (ncse) begin
      #70 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

   	 // Address loading checks
   	 if (ncse === 1) begin
   	    if (udata !== 24'hZZZZ) begin
   	       $sformat(msg, "ncse=%b, uaddr=%04x, but udata=%06x (should be Z)",
			ncse, uaddr, udata);
   	    end;
   	 end
	 else if (ncse !== 0) $sformat(msg, "testbench bug, ncse=%b", ncse);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK microcode");
      end
   end // always @ (ncse)

   always @ (nfpua0, nfpuc0, nfpuc1, nfpuc2) begin
      #30 begin
   	 // Front Panel checks

	 casex ({ nfpua0, nfpuc0, nfpuc1, nfpuc2 })
	   4'b0111: fpval = uaddr[7:0];
	   4'b1011: fpval = udata[7:0];
	   4'b1101: fpval = udata[15:8];
	   4'b1110: fpval = udata[23:16];
	   4'b1111: fpval = 8'bzzzzzzzz;
	   default: fpval = 8'bxxxxzzzz;
	 endcase // casex ({ nfpua0, nfpuc0, nfpuc1, nfpuc2 })

	 if (fpval === 8'bxxxxzzzz) begin
	    $sformat(msg, "testbench bug, nfpua0=%b, nfpuc0=%b, nfpuc1=%b, nfpuc2=%b.",
		     nfpua0, nfpuc0, nfpuc1, nfpuc2);
	 end else if (fpval != -2 && fpd !== fpval) begin
	    $sformat(msg, "nfpua0=%b, nfpuc0=%b, nfpuc1=%b, nfpuc2=%b, but fpd=%02x (should be %02x).",
		     nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd, fpval);
	 end
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("OK front panel");
      end
   end // always @ (nset, nrst)
endmodule // control_store_tb

// End of file.
