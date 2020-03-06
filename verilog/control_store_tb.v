///////////////////////////////////////////////////////////////////////////////
//
// TEST THE CONTROL STORE
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// control_store_tb.v -- Control Store testbench
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

`include "control_store.v"

`timescale 1ns/10ps

module control_store_tb();
   reg noe;
   reg clk;
   
   reg [18:0] uaddr;

   wire [23:0] ucontrol;

   initial begin
      
      //$display ("time\t d pulse");
      $monitor ("t: %7d | %b %h > %h", $time, noe, uaddr, ucontrol); 
      $dumpfile ("vcd/control_store_tb.vcd");
      $dumpvars (0, control_store_tb);

      clk = 1'b1;
      noe = 1'b0;
      uaddr = 24'b1100000000000000000; // That's where the good stuff starts.

      // Make sure we're not counting during reset.
      #1000 noe = 1'b1;
      #1000 noe = 1'b0;

      #3000000 $finish;
      
   end // initial begin

   // Simulate a realistically fast clock
   always begin
      #875 uaddr = uaddr + 1;
      #62.5 clk = 0;
      #62.5 clk = 1;
   end

   // Connect the DUT
   control_store control_store(.noe(noe),
			       .clk(clk),
			       .uaddr(uaddr),
			       .ucontrol(ucontrol));
   
   // Verify our findings.
   reg [8191:0] msg;
   reg [7:0] 	fpval;
   
   always @ (noe) begin
      #70 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

   	 // Address loading checks
   	 if (noe === 1) begin
   	    if (ucontrol !== 24'hZZZZ) begin
   	       $sformat(msg, "noe=%b, uaddr=%04x, but ucontrol=%06x (should be Z)",
			noe, uaddr, ucontrol);
   	    end;
   	 end
	 else if (noe !== 0) $sformat(msg, "testbench bug, noe=%b", noe);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK microcode");
      end
   end // always @ (noe)
endmodule // control_store_tb

// End of file.
