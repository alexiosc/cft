///////////////////////////////////////////////////////////////////////////////
//
// 74x193 COUNTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
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

`include "counter.v"
`timescale 1ns/10ps

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

   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_193_tb.vcd");
      $monitor ("t: %7d | %b %b %b %b %b > %b %b %b", $time, clr, npl, p, cpu, cpd, q, ntcu, ntcd);
      $dumpvars (0, counter_193_tb);

      clr = 0;       // initial value of clock
      npl = 1;
      cpu = 1;
      cpd = 1;
      p = 4'b1101;

      for (j = 0; j < 64; j = j + 1) begin
	 #100 begin
	    p = j[3:0];
	    npl = j[4];
	    clr = j[5];

	    // Count up.
	    for (i = 0; i < 32; i = i + 1) begin
	       #100 cpu = 0;
	       #100 cpu = 1;
	    end

	    // Count up with npl asserted (parallel load should override)
	    #100 npl = 0;
	    for (i = 0; i < 32; i = i + 1) begin
	       #100 cpu = 0;
	       #100 cpu = 1;
	    end
	    #100 npl = 1;

	    // Count up with cpd asserted (nothing should happen)
	    #100 cpd = 0;
	    for (i = 0; i < 32; i = i + 1) begin
	       #100 cpu = 0;
	       #100 cpu = 1;
	    end
	    #100 cpd = 1;

	    // Count down.
	    for (i = 0; i < 32; i = i + 1) begin
	       #100 cpd = 0;
	       #100 cpd = 1;
	    end

	    // Count down with npl asserted
	    #100 npl = 0;
	    for (i = 0; i < 32; i = i + 1) begin
	       #100 cpd = 0;
	       #100 cpd = 1;
	    end
	    #100 npl = 1;

	    // Count down with cpu asserted (nothing should happen)
	    #100 cpu = 0;
	    for (i = 0; i < 32; i = i + 1) begin
	       #100 cpd = 0;
	       #100 cpd = 1;
	    end
	    #100 cpu = 1;
	 end;
      end; // for (j = 0; j < 64; j = j + 1)

      #2000 $display("OK");
      $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   counter_193 c0 (.clr(clr), .npl(npl), .p(p), .cpu(cpu), .cpd(cpd), .q(q), .ntcu(ntcu), .ntcd(ntcd));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (clr, npl, p, cpu, cpd) begin
      #50 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Check for an async clear (clr, active high)
	 if (clr === 1) begin
	    if (q !== 4'b0000) $sformat(msg, "clr=%b (asserted) but q=%b", clr, q);
	    if (cpd !== ntcd) $sformat(msg, "clr=%b (asserted), cpd=%b, but ntcd=%b (should be same as cpd)", clr, cpd, ntcd);
	 end else if (clr !== 0) begin
	    // So it's not 1 and it's not 0. Whoops.
	    $sformat(msg, "testbench bug, clr=%b", clr);
	 end else if (npl === 0) begin
	    // So CLR is low (de-asserted). Let's check for async load. (npl, active low)
	    if (q !== p) $sformat(msg, "npl=%b, p=%b but q=%b", npl, p, q);
	    else if (q === 4'b0000 && cpd != ntcd) $sformat(msg, "async load q=%b with cpd=%b but ntcd=%b", q, cpd, ntcd);
	    else if (q === 4'b1111 && cpu != ntcu) $sformat(msg, "async load q=%b with cpu=%b but ntcu=%b", q, cpd, ntcu);
	 end else if (npl !== 1) begin
	    // So it's not 1 and it's not 0. Whoops.
	    $sformat(msg, "testbench bug, npl=%b", npl);
	 end else begin
	    // Just Basic testing here
	    if (q === 4'b0000 && cpd != ntcd) $sformat(msg, "async load q=%b with cpd=%b but ntcd=%b", q, cpd, ntcd);
	    else if (q === 4'b1111 && cpu != ntcu) $sformat(msg, "async load q=%b with cpu=%b but ntcu=%b", q, cpd, ntcu);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("OK count");
      end
   end
   

endmodule
