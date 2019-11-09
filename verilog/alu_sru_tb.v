///////////////////////////////////////////////////////////////////////////////
//
// ALU SRU TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// alu_sru_tb.v -- testbench for the ALU's serial Shift/Rotate Unit
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


`include "alu_sru.v"
`include "flipflop.v"
`timescale 1ns/10ps

module alu_sru_tb();
   // Declare inputs as regs and outputs as wires
   reg         clk2, clk4;
   reg         nreset;
   reg 	       op_arithmetic;
   reg 	       op_rotate;
   reg 	       op_right;
   reg [3:0]   op_dist;
   reg 	       noe;
   reg         nstart;
   reg         nwrite_alu;
   reg [15:0]  ibus;
   wire [15:0] ibus_real;
   wire [15:0] b;
   wire        b_cp;
   wire        fl;
   wire [2:0]  shift_op;	// This simplified decoding in gtk_wave;

   integer     i, j, k, l;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_sru_tb.vcd");
      $dumpvars (0, alu_sru_tb);

      op_arithmetic = 0;
      op_rotate = 0;
      op_right = 0;
      op_dist = 0;
      noe = 1;
      nstart = 1;
      noe = 0;
      nreset = 0;
      nwrite_alu = 1;
      #50 nreset = 1;
      #100 ibus = 16'h1111;
      nwrite_alu = 0;
      #250 nwrite_alu = 1;
      #20 ibus = 16'bzzzz_zzzz_zzzz_zzzz;

      for (i = 0; i < 2; i = i + 1) begin
      	 for (j = 0; j < 2; j = j + 1) begin
      	    for (k = 0; k < 2; k = k + 1) begin
      	       //for (l = 0; l < 16; l = l + 1) begin
      	       l = 15;
      	       op_arithmetic = i;
      	       op_rotate = 1;
      	       op_right = k;
      	       op_dist = l;
      	       #250 nstart = 0;
      	       #300 nstart = 1;
	       #1500;
      	       //end
      	    end
      	 end
      end

      #3000 $finish;      // Terminate simulation
   end // initial begin

   assign ibus_real = ibus;

   wire flin;
   flipflop_74h l_ff(.d(flin), .clk(b_cp), .nset(1'b1), .nrst(nreset), .q(fl));

   assign shift_op = { op_arithmetic, op_rotate, op_right };
   
   always begin
      #63.5 clk2 = 0;
      #63.5 clk2 = 1;
      #63.5 clk4 = 0;
      #63.5 clk4 = 1;
   end

   // Simulate the ALU's B register
   flipflop_574 alu_b_hi (.d(ibus_real[15:8]), .q(b[15:8]), .clk(nwrite_alu & b_cp), .noe(1'b0));
   flipflop_574 alu_b_lo (.d(ibus_real[7:0]),  .q(b[7:0]),  .clk(nwrite_alu & b_cp), .noe(1'b0));

   alu_sru alu_sru (.nreset(nreset),
		    .clk2(clk2), .clk4(clk4),
		    .b(b),
		    .fl(fl),
		    .nwrite_alu(nwrite_alu),
		    .nstart(nstart),
		    .op_arithmetic(op_arithmetic),
		    .op_rotate(op_rotate),
		    .op_right(op_right),
		    .op_dist(op_dist),
		    .noe(noe),
		    .ibus(ibus_real),
		    .b_cp(b_cp),
		    .flout(flin));
endmodule // alu_sru_tb

// End of file.


