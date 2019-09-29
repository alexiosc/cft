///////////////////////////////////////////////////////////////////////////////
//
// ADDRESS GENERATION LOGIC TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// agl_tb.v -- Address Generation Logic Testbench
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

`include "agl.v"
`timescale 1ns/10ps

module agl_tb();
   localparam DELTA = 21553;

   // Declare inputs as regs and outputs as wires
   reg [15:0] ir;
   reg [15:0] pc;
   reg 	      nread_agl;
   reg 	      nend;

   wire [15:0] ibus;

   integer     i, j;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/agl_tb.vcd");
      $monitor ("%d | %b %h %h > %h", $time, nend, ir, pc, ibus);
      $dumpvars (0, agl_tb);

      ir = 0;
      pc = 0;
      nread_agl = 1;
      nend = 1;

      #1000 nread_agl = 0;

      // the AGL only looks at ir[10:0]
      for (j = 0; j < 2048; j = j + 1) begin
	 #250 ir = j;
	 
	 for (i = 0; i < 65535 ; i = i + 1024) begin
	    #187.5 pc = i;
	    nend = 0;
	    #62.5 nend = 1;
	 end
      end

      #2000 $finish;      // Terminate simulation
   end

   agl agl_unit (.ir(ir), .pc(pc), .nread_agl(nread_agl), .nend(nend), .ibus(ibus));
endmodule
