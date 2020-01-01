///////////////////////////////////////////////////////////////////////////////
//
// STATIC RAM TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// ram_tb.v -- Static RAM testbench
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

`include "ram.v"
`timescale 1ns/10ps

module ram_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0]  a;
   reg 	      noe;
   reg 	      nwe;
   reg 	      nce;

   wire [7:0]  d;
   reg [7:0]   d_write;
   
   integer     i;
   integer     t;
   reg 	       sentinel_read, verify;
   
   reg [800:0] status;

   assign d = d_write;
   
   // Initialize all variables
   initial begin        

      $monitor ("t: %7d | %b %b %b %03x %02x > %02x", $time, nce, noe, nwe, a, d_write, d);
      $dumpfile ("vcd/ram_tb.vcd");
      $dumpvars (0, ram_tb);

      // Initialise
      for(i=0 ; i < 256; i = i + 1) ram.mem[i] = 8'h55;
      sentinel_read = 0;
      verify = 0;
      status = "init";
      d_write = 8'bzzzzzzzz;
      noe = 1;
      nwe = 1;
      nce = 1;
      a = 0;

      #1000;

      status = "read with chip disabled";
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
	 noe = 0;
      end
      #250 noe = 1;
      #750
      
      status = "write with chip disabled";
      for (i = 0 ; i < 256; i++) begin
	 a = i;
	 d_write = i[7:0] ^ 8'hf0;
	 #50 nwe = 0;
	 #150 nwe = 1;
	 #50;
      end
      #250 nwe = 1;
      d_write = 8'bz;
      #750

      // Now select the chip and verify we're still reading 0x55 from all locations.
      status = "sentinel read";
      sentinel_read = 1;
      nce = 0;
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
	 noe = 0;
      end
      #250 noe = 1;
      sentinel_read = 0;
      a = 8'bZ;
      #750

      // Write again with chip enabled.
      status = "write";
      for (i = 0 ; i < 256; i++) begin
      	 a = i;
	 d_write = i[7:0] ^ 8'hf0;
      	 #50 nwe = 0;
      	 #150 nwe = 1;
      	 #50;
      end
      #250 nwe = 1;
      d_write = 8'bz;
      a = 8'bZ;
      #750

      // Read again and verify.
      status = "verify";
      verify = 1;
      nce = 0;
      for (i = 0 ; i < 256; i++) begin
	 #250 a = i;
	 noe = 0;
      end
      #250 noe = 1;
      verify = 0;
      a = 8'bZ;
      #750

      #10000 $finish;
   end
   

   // Connect DUT to test bench
   sram #(8, 70) ram (.a(a), .d(d), .nce(nce), .nwe(nwe), .noe(noe));

   reg [8191:0] msg;
   always @(nce, noe, nwe, a) begin
      #80 begin
	 msg[7:0] = "";		// Use the msg as a flag.
	 
	 // Very during the "read" stage
	 if (d_write !== 8'bZ && noe === 0) begin
	    $sformat(msg, "testbench bug: d_write is not Z and noe is 0 (also driving d).");
	 end
	 else if (noe === 0 && nwe === 0) begin
	    $sformat(msg, "testbench bug: noe=%b and nwe=%b (should never hapen)", noe, nwe);
	 end
	 else if (nce === 0 && noe === 0 && sentinel_read === 1) begin
	    if (d !== 8'h55) begin
	       $sformat(msg, "nce=%b, noe=%b, a=%03x, d=%02x (should be 55) during sentinel read. Writes happening with chip disabled?",
			nce, noe, a, d);
	    end
	 end
	 else if (nce === 0 && noe === 0 && verify === 1) begin
	    if (d !== (a ^ 8'hf0)) begin
	       $sformat(msg, "nce=%b, noe=%b, nwe=%b, a=%03x, d=%02x (should be %02x). Verification failed.",
			nce, noe, nwe, a, d, a ^ 8'hf0);
	    end
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK ram");
      end
   end
endmodule
