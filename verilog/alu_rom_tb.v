///////////////////////////////////////////////////////////////////////////////
//
// ALU ROM TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// alu_rom_tb.v -- testbench for the ALU's operation ROM table
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


`include "alu_rom.v"
`timescale 1ns/10ps

//`define DELTA_A 21
`define DELTA_A 89
//`define DELTA_A 941
//`define DELTA_A 1543

//`define DELTA_B `DELTA_A
`define DELTA_B 941
//`define DELTA_B 1543


module alu_rom_tb();

   reg            noe;
   reg 		  flin;
   reg 		  xin;
   reg [2:0] 	  op;
   reg [15:0] 	  a, b;
   
   wire [15:0] 	  ibus;
   wire 	  fvout, nsetv;
   wire 	  flout, nsetl;
   
   reg [15:0] 	  ibus_drv, db_drv;
   
   integer 	  i, j, k;
   integer 	  da, db;
   
   reg [23:0] 	  ops[0:7];
   wire [23:0] 	  curop;
   initial begin
      ops[0] = "ADD";
      ops[1] = "AND";
      ops[2] = "OR";
      ops[3] = "XOR";
      ops[4] = "NOT";
      ops[5] = "op5";
      ops[6] = "op6";
      ops[7] = "op7";
   end
   assign curop = ops[op];

   initial begin        
      $dumpfile ("vcd/alu_rom_tb.vcd");
      $dumpvars (0, alu_rom_tb);
      $monitor ("t: %7d | %b %04x (%016b) %04x (%016b) %03b %03s > %b %b %b %b %04x (%016b)",
		$time,
		flin, a, a, b, b, op, curop, nsetv, fvout, nsetl, flout, ibus, ibus);

      noe = 1;
      flin = 1;
      xin = 0;
      op = 0;
      a = 0;
      b = 0;

      da = 1;
      db = 1;
      
      for (k = 0; k < 8; k += 1) begin
	 #5000 op = k;
	 flin = 0;

	 da = `DELTA_A;
	 db = `DELTA_B;

	 #5000 for (j = 0; j <= 65535; j += db) begin
	    for (i = 0; i <= 65535; i += da) begin
	       flin = 0;
	       #50 noe = 0;
	       a = i;
	       b = j;
	       #450 noe = 1;

	       flin = 1;
	       #50 noe = 0;
	       a = i;
	       b = j;
	       #450 noe = 1;
	    end
	 end
      end

      #5000 $finish;      // Terminate simulation
   end // initial begin

   // Connect DUT to test bench
   alu_rom alu_rom (.noe(noe),
		    .flin(flin), .xin(xin),
		    .op(op), .a(a), .b(b),
		    .ibus(ibus),
		    .fvout(fvout), .nsetv(nsetv),
		    .flout(flout), .nsetl(nsetl));


   // Verify our findings.
   reg [8191:0]   msg;
   reg 		  correct_nbusen;

   // Check tri-stating
   always @ (noe) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (noe === 1) begin
	   if (ibus !== 16'bZ) begin
	      $sformat(msg, "noe=%b, but ibus=%b (should be Z)", noe, ibus);
	   end
	 end

	 else if (noe !== 0) $sformat(msg, "testbench bug, noe=%b", noe);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK noe");
      end
   end // always @ (noe)


   // Check results
   reg [31:0]          correct_y;
   reg 	               correct_l, correct_v;
   wire signed [15:0]  as, bs, ibuss, flins;
   reg signed [31:0]   unbounded_ys;

   assign as = a;
   assign bs = b;
   assign ibuss = ibus;
   assign flins = { 14'b0, flin};

   always @ (op, a, b) begin
      #350 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (noe === 0) begin
	    casex (op)
	      3'b000: correct_y = a + b + flin;	// ADD
	      3'b001: correct_y = a & b;	// AND
	      3'b010: correct_y = a | b;	// OR
	      3'b011: correct_y = a ^ b;	// XOR
	      3'b100: correct_y = ~a;		// NOT
	      3'b101: correct_y = 17'b0;	// Spare instruction
	      3'b110: correct_y = 17'b0;	// Spare instruction
	      3'b111: correct_y = 17'b0;	// Spare instruction
	      default: $sformat(msg, "testbench bug, op=%b", op);
	    endcase // casex (op)

	    if (ibus !== correct_y[15:0]) begin
	       $sformat(msg, "noe=%b, a=%04x, b=%04x, op=%3b, but ibus=%04x (expecting %04x)",
			noe, a, b, op, ibus, correct_y[15:0]);
	    end

	    // Only ADD should be setting L and V in this version of the
	    // ALU ROMs. And ADD should ALWAYS set them.
	    if (op === 3'b000) begin
	       if (nsetl === 1)      $sformat(msg, "op=%03b but nsetl=%b (should be 0)", op, nsetl);
	       else if (nsetv === 1) $sformat(msg, "op=%03b but nsetv=%b (should be 0)", op, nsetv);
	       else if (nsetl !== 0) $sformat(msg, "testbench bug, nsetl=%b", nsetl);
	       else if (nsetv !== 0) $sformat(msg, "testbench bug, nsetv=%b", nsetv);
	       
	       correct_l = a + b + flin > 65535 ? 1'b1 : 1'b0;
	       if (flout != correct_l) begin
		  $sformat(msg, "%0d + %0d -> %0d, L=%b (should be %b)",
			   a, b, ibus, flout, correct_l);
	       end;

	       // Overflow calculations using result comparison.
	       unbounded_ys = as + bs + flins;
	       correct_v = unbounded_ys != ibuss ? 1'b1 : 1'b0;
	       if (correct_v !== fvout) begin
		  $display("as=%0d, bs=%0d, flins=%0d, unbounded_ys=%0d, ibus=%0d. Equal? %d",
			   as, bs, flins, unbounded_ys, ibuss, unbounded_ys == ibuss);

		  $sformat(msg, "%0d + %0d + %0d -> %0d (%04x + %04x + %0d-> %04x), V=%b (should be %b, correct unbounded result is %0d)",
			   as, bs, flins, ibuss,
			   a, b, flins, ibus,
			   fvout, correct_v,
			   unbounded_ys);
	       end;
	       
	    end else begin
	       if (nsetl === 0)      $sformat(msg, "op=%03b but nsetl=%b (should be 1)", op, nsetl);
	       else if (nsetv === 0) $sformat(msg, "op=%03b but nsetv=%b (should be 1)", op, nsetv);
	       else if (nsetl !== 1) $sformat(msg, "testbench bug, nsetl=%b", nsetl);
	       else if (nsetv !== 1) $sformat(msg, "testbench bug, nsetv=%b", nsetv);
	    end // else: !if(op === 3'b000)
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK %s", curop);
      end
   end // always @ (noe)


endmodule // buffer_245_tb

// End of file.
