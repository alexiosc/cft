///////////////////////////////////////////////////////////////////////////////
//
// ROM TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// rom_tb.v -- ROM testbench
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

`include "rom.v"

`timescale 1ns/10ps


module rom_tb();
   // Declare inputs as regs and outputs as wires
   reg [7:0]  a;
   reg 	      noe;
   reg 	      nce;
   wire [7:0] d;
   integer    i, j;

   reg [800:0] status;

   // Initialize all variables
   initial begin        
      $monitor ("t: %7d | %b %b %03x > %02x", $time, nce, noe, a, d);
      $dumpfile ("vcd/rom_tb.vcd");
      $dumpvars (0, rom_tb);


      // Configure the ROM. We can do this because it's not really read-only
      // from Verilog's point of view.
      for(i=0 ; i < 256; i = i + 1) rom.mem[i] = i ^ 8'hf0;

      // Initialise
      status = "init";
      noe = 1;
      nce = 1;
      a = 0;

      status = "chip idle";
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
      end
      #1000;

      status = "read with chip disabled";
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
	 noe = 0;
      end
      #250 noe = 1;
      #750

      status = "read with output disabled";
      nce = 0;
      noe = 1;
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
      end
      #1000;


      // Read again and verify.
      status = "read";
      nce = 0;
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
	 noe = 0;
      end
      #250 noe = 1;
      a = 8'bZ;
      #750;

      #1000 $finish;
   end
   
   // Connect DUT to test bench
   rom #(8, 70, "foo") rom (.a(a), .d(d), .nce(nce), .noe(noe));

   reg [8191:0] msg;
   always @(nce, noe, a) begin
      #80 begin
	 msg[7:0] = "";		// Use the msg as a flag.
	 
	 if (nce === 1 || noe === 1) begin
	    if (d !== 8'bZ) begin
	       $sformat(msg, "nce=%b, noe=%b, a=%03x, d=%02x (should be Z)",
			nce, noe, a, d);
	    end
	 end
	 else if (nce === 0 && noe === 0) begin
	    if (d !== (a ^ 8'hf0)) begin
	       $sformat(msg, "nce=%b, noe=%b, a=%03x, d=%02x (should be %02x). Verification failed.",
			nce, noe, a, d, a ^ 8'hf0);
	    end
	 end
	 
	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK rom");
      end
   end
endmodule // rom_tb

// End of file.
