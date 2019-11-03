///////////////////////////////////////////////////////////////////////////////
//
// rom_tb.v -- ROM testbench
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

`include "rom.v"

`timescale 1ns/10ps

module rom_tb();

   parameter bits = 12;

// Declare inputs as regs and outputs as wires
   reg [bits:0] a;
   reg 		oe;
   reg 		ce;

   wire [7:0] 	d;

   integer 	i;

   // Initialize all variables
   initial begin        
      //$display ("time\t oe ce a            d");	
      //$monitor ("%g\t %b %b %b %b", $time, oe, ce, a, d);
      $dumpfile ("vcd/out.vcd");
      $dumpvars (0, rom_tb);

      oe = 1;
      ce = 1;
      a = 0;
      
      #10 oe = 0;
      #10 ce = 0;

      $display ("Simulating...");
      for (i=0; i < 100; i=i+1) begin
	 if ((i % 1024) == 0) begin
	    $display ("Address = ", i);
	 end
	 #(200 + (i * 100)) a = i;
      end

      #(200 + (i * 200)) $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   rom #(13, 70, "test_rom.bin") test_rom (a, d, ce, oe);

endmodule // rom_tb

// End of file.
