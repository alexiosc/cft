///////////////////////////////////////////////////////////////////////////////
//
// PB2-AIL-test.v -- Processor Board B, Autoindex logic
//
// Copyright © 2011-2013 Alexios Chouchoulas
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

`include "../PB2-AIL.v"

`timescale 1ns/10ps

module PB2_AIL_test();

   reg        nreset;
   reg [15:0] ibus;
   reg 	      nwir;

   wire       naindex;

   integer     i;

   reg 	       cor;

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB2-AIL-test.vcd");
      $dumpvars (0, PB2_AIL_test);
`endif

      // Reset and initialise
      nreset <= 0;
      ibus <= 0;
      nwir <= 1;
      
      #500 nreset <= 1;
      
      for (i = 0; i < 65536; i = i + 1) begin

	 ibus <= i[0] ? (~i[15:1]) : i[15:1];
	 #63 nwir <= 0;
	 #62 nwir <= 1;

	 #30 begin

	    // the IBUS value represents the contents of the instruction
	    // register, i.e is an instruction. As such:
	    //
	    //  15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
	    // +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
	    // | Operation |I |R |    10-bit Operand/offset    |
	    // +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
	    //
	    // The operation is a don'd care field. AIL should set on WIR#
	    // assertion if and only if I=1, R=1 and the operand is between 080
	    // and 0FF (hex).

	    cor = !(ibus[11:10] == 3 && ibus[9:0] >= 128 && ibus[9:0] < 256);

	    if (naindex !== cor) begin
   	       $display("%s: [fail] AINDEX# should be %b, was %b (IBUS=%4h, I=%b, R=%b, ofs=%b).",
   			`TESTNAME, cor, naindex, ibus, ibus[11], ibus[10], ibus[9:0]);
   	       $display ("%s: [fail] ABEN# error.", `TESTNAME);
   	       #100 $finish;
	    end
	    
	 end

	 #95 ;
      end // for (i = 0; i < 65536; i = i + 1)
      
      $display("%s: [ok] Pass (AIL).", `TESTNAME);
      
      #5000 ;
      $display("%s: [ok] Pass (AIL).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB2_AIL dut(.nreset(nreset),
			     .ibus(ibus),
			     .nwir(nwir),
			     .naindex(naindex));
			  
endmodule // PB1_IR_test

// End of file.
