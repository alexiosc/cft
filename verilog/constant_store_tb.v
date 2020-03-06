///////////////////////////////////////////////////////////////////////////////
//
// CONSTANT STORE TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// constant_store_tb.v -- Constant Store Testbench
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

`include "constant_store.v"
`timescale 1ns/10ps

module constant_store_tb();
   wire [4:0]   raddr;
   wire [15:0] 	ibus;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      $monitor ("t: %7d | %b > %h", $time, raddr, ibus);
      $dumpfile ("vcd/constant_store_tb.vcd");
      $dumpvars (0, constant_store_tb);

      i = 0;
            
      for (i = 0; i < 64; i = i + 1) begin
	 #63.5;
      end
      
      #500 $display("345 OK");
      $finish;      // Terminate simulation
   end // initial begin

   assign raddr = i[4:0];
   
   
   // Connect DUT to test bench
   constant_store constant_store (.raddr(raddr), .ibus(ibus));

   // Verify our findings.
   reg [8191:0] msg;
   reg [15:0] 	correct_value;
   
   always @ (raddr) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // if (nruen === 1) begin
	 //    if (ibus !== 16'bzzzzzzzzzzzzzzzz) begin
	 //       $sformat(msg, "nruen=%b, but ibus was ibus=%b, %04x (should be Z)", nruen, ibus, ibus);
	 //    end
	 // end
	 //
	 //else 

	 correct_value = 16'bzzzzzzzzzzzzzzzz;
	 casex (raddr)
	   5'b00100: correct_value = 16'd0;
	   5'b00101: correct_value = 16'd1;
	   5'b00110: correct_value = 16'd2;
	   5'b00111: correct_value = 16'd3;
	 endcase // case raddr
	 
	 if (ibus !== correct_value) $sformat(msg, "raddr=%b, ibus=%b (should be %b)", raddr, ibus, correct_value);

	 // else $sformat(msg, "testbench bug, nruen=%b", nruen);

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK constant");
      end
   end


endmodule
