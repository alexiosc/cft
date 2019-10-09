///////////////////////////////////////////////////////////////////////////////
//
// 74x193 COUNTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// counter_193_tb.v -- 74x193 testbench
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

`timescale 1ns/10ps
`include "counter.v"

module counter_193_tb();

// Declare inputs as regs and outputs as wires
   reg 	      clr;
   reg 	      npl;
   reg 	      cpu;
   reg 	      cpd;
   reg [3:0]  p;
   wire [3:0] q;
   wire       ntcu;
   wire       ntcd;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_193_tb.vcd");
      $monitor ("%d | %b %b %b %b %b > %b %b %b", $time, clr, npl, p, cpu, cpd, q, ntcu, ntcd);
      $dumpvars (0, counter_193_tb);

      clr = 0;       // initial value of clock
      npl = 1;
      cpu = 1;
      cpd = 1;
      p = 4'b1101;

      #50 clr = 1;
      #50 clr = 0;
      #20 npl = 0;
      #50 npl = 1;
      #20 npl = 1;		// NOP

      for (i = 0; i < 32; i = i + 1) begin
	 #50 cpu = 0;
	 #50 cpu = 1;
      end

      #20 npl = 1;
      
      for (i = 0; i < 32; i = i + 1) begin
	 #50 cpd = 0;
	 #50 cpd = 1;
      end

      // Now npl something high.
      #50 p = 4'ha;
      #50 npl = 0;
      #50 npl = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #50 cpu = 0;
	 #50 cpu = 1;
      end
      

      // Now load something very high (test wrap-around).
      #200 p = 4'ha;
      #50 npl = 0;
      #50 npl = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #50 cpu = 0;
	 #50 cpu = 1;
      end
      

      // Now load something very low (test wrap-around).
      #200 p = 4'h3;
      #50 npl = 0;
      #50 npl = 1;
      
      for (i = 0; i < 10; i = i + 1) begin
	 #50 cpd = 0;
	 #50 cpd = 1;
      end
      
      // Now load something very low (debug carry/borrow on npl).
      #200 p = 4'h0;
      #50 npl = 0;
      #30 npl = 1;
      

      #500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   counter_193 c0 (.clr(clr), .npl(npl), .p(p), .cpu(cpu), .cpd(cpd), .q(q), .ntcu(ntcu), .ntcd(ntcd));

   

endmodule
