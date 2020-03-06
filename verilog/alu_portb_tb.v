///////////////////////////////////////////////////////////////////////////////
//
// ALU PORT A BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// alu_portb_tb.v -- ALU Port A testbench
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

`include "alu_portb.v"
`timescale 1ns/10ps

module alu_portb_tb();
   reg [15:0]  ibus_drv;
   reg 	       bcp;
   reg 	       nread_alu_b;
   
   wire [15:0] b, ibus;

   integer     i;

   assign ibus = ibus_drv;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_portb_tb.vcd");
      $dumpvars (0, alu_portb_tb);

      nread_alu_b = 1;
      #5 ibus_drv = $random;
      bcp = 0;
      #5 bcp = 1;
      #5 ibus_drv = 16'hZZZZ;
      #1000;

      for (i = 0; i < 65536; i = i + 1) begin
	 // Write it.
	 #62.5 ibus_drv = i;
	 #125 bcp = 0;
	 #62.5 bcp = 1;
	 #62.5 ibus_drv = 16'hZZZZ;

	 // Read it back.
	 #187.5 nread_alu_b = 0;
	 #250 nread_alu_b = 1;
	 #187.5;
      end
      
      #1000 $display("345 OK");
      $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   
   alu_portb alu_portb (.ibus(ibus), .bcp(bcp), .nread_alu_b(nread_alu_b), .b(b));

   // Verify our findings.
   reg [8191:0] msg;
   reg [15:0] 	oldb = 16'hZZZZ;
   
   always @ (b) begin
      #40 begin	
   	 if (oldb !== 16'hZZZZ && b !== oldb) begin
   	    $sformat(msg, "Port B changed from %04h to %04h without reason.", oldb, b);
   	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK port B stable");
      end 
   end

   always @ (posedge bcp) begin
      if ($time > 100) begin
	 #30 begin
   	    msg[7:0] = "";		// Use the msg as a flag.
	    
   	    // Check the Gate first. If it's high (previous result unequal), the
   	    // comparison should always be unequal.
   	    if (b !== ibus) begin
   	       $sformat(msg, "ibus=%b (%04h) but b=%b (%04h) on rising edge of bcp", ibus, ibus, b, b);
   	    end
	    
   	    oldb = b;
	    
   	    // Fail if we've logged an issue.
   	    if (msg[7:0]) begin
   	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	       $error("assertion failure");
   	       #100 $finish;
   	    end
   	    else $display("345 OK port B set");
	 end
      end // if ($time > 100)
   end // always @ (posedge bcp)

   always @ (posedge bcp) begin
      if ($time > 100) begin
	 #30 begin
   	    msg[7:0] = "";		// Use the msg as a flag.
	    
   	    // Check the Gate first. If it's high (previous result unequal), the
   	    // comparison should always be unequal.
   	    if (b !== ibus) begin
   	       $sformat(msg, "ibus=%b (%04h) but b=%b (%04h) on rising edge of bcp", ibus, ibus, b, b);
   	    end
	    
   	    oldb = b;
	    
   	    // Fail if we've logged an issue.
   	    if (msg[7:0]) begin
   	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	       $error("assertion failure");
   	       #100 $finish;
   	    end
   	    else $display("345 OK port B set");
	 end
      end // if ($time > 100)
   end // always @ (posedge bcp)
endmodule // alu_portb_tb

// End of file.
