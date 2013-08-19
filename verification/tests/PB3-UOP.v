///////////////////////////////////////////////////////////////////////////////
//
// PB3-UOP.v -- Processor Board C, Unary op test
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

`include "../PB3-unary.v"

`timescale 1ns/10ps
`define MAX 65536

`define UOP_RBL 0
`define UOP_RBR 1
`define UOP_RNL 2
`define UOP_RNR 3
`define UOP_NOT0 4
`define UOP_NOT1 5
`define UOP_CS1 6
`define UOP_CS2 7


module PB3_UOP();

   reg 	       nreset;
   reg 	       nuoe;
   reg 	       fl;
   reg 	       nirqs;
   reg [15:0]  ac;
   reg [2:0]   uop;

   wire        roll16;
   wire        isroll;
   wire [15:0] ibus;

   wire [16:0] al, yl;
   assign al = {fl, ac};
   assign yl = {roll16, ibus};
   
   integer     i, j, k, cor, l_cor;

   // Test tri-stating
   always @(posedge nuoe) begin
      #20 if (ibus != 16'bzzzzzzzzzzzzzzzz) begin
   	 $display("%s: [fail] ALU Unary ROM still driving UBUS 20ns after UOE# deassertion.",
   		  `TESTNAME);
   	 $display ("%s: [fail] ALU Unary ROM tri-stating error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   // Test for valid results
   always @(negedge nuoe) begin
      #60 begin
	 // Rolls
	 if (uop == `UOP_RBR || uop == `UOP_RBL || uop == `UOP_RNR || uop == `UOP_RNL) begin
	    case (uop)
	      `UOP_RBR: cor = ((al >> 1) | ((al & 1) << 16));
	      `UOP_RBL: cor = ((al << 1) & 17'h1ffff) | ((al >> 16) & 1);
	      `UOP_RNR: cor = (al >> 4) | ((al & 15) << 13);
	      `UOP_RNL: cor = ((al << 4) & 17'h1ffff) | ((al & 17'h1e000) >> 13);
	    endcase // case (uop)
	    
	    if (yl !== cor) begin
   	       $display("%s: [fail] uop=%3b: R%s%s <%b,%04h> is <%b,%04h>, got <%b,%04h> instead",
   			`TESTNAME, uop,
			uop == `UOP_RBL || uop == `UOP_RBR ? "B" : "N",
			uop == `UOP_RBL || uop == `UOP_RNL ? "L" : "R",
			al[16], al[15:0], cor[16], cor[15:0], yl[16], yl[15:0]);
   	       $display ("%s: [fail] ALU Unary ROM pattern error.", `TESTNAME);
   	       #100 $finish;
	    end

	    if (isroll !== 1) begin
   	       $display("%s: [fail] uop=%3b, fl=%b, nirqs=%b: ISROLL should be 1, was %b",
   			`TESTNAME, uop, fl, nirqs, isroll);
   	       $display ("%s: [fail] ALU Unary ROM pattern error.", `TESTNAME);
   	       #100 $finish;
	    end
	 end

	 // Negation
	 else if (uop == `UOP_NOT0 || uop == `UOP_NOT1) begin
	    cor = (~ac) & 65535;
	    if (ibus !== cor) begin
   	       $display("%s: [fail] uop=%3b, fl=%b, nirqs=%b: NOT %04h is %04h, got %04h instead",
   			`TESTNAME, uop, fl, nirqs, ac, cor, ibus);
   	       $display ("%s: [fail] ALU Unary ROM pattern error.", `TESTNAME);
   	       #100 $finish;
	    end
	 end

	 // Constant Sources 1 and 2, with IRQ set and clear
	 else if (uop == `UOP_CS1 || uop == `UOP_CS2) begin
	    if (uop == `UOP_CS1) cor = nirqs == 1'b1 ? 0 : 2;
	    else cor = nirqs == 1'b1 ? 1 : 16'hfff8;
	    
	    if (ibus !== cor) begin
   	       $display("%s: [fail] uop=%3b, fl=%b, nirqs=%b: CS%d should be %04h, was %04h",
   			`TESTNAME, uop, fl, nirqs, uop == `UOP_CS1 ? 1 : 2, cor, ibus);
   	       $display ("%s: [fail] ALU Unary ROM pattern error.", `TESTNAME);
   	       #100 $finish;
	    end
	 end // if (uop == `UOP_CS1 || uop == `UOP_CS2)

	 else begin
   	    $display("%s: [fail] uop=%3b, fl=%b, nirqs=%b: case not covered by test",
   		     `TESTNAME, uop, fl, nirqs);
   	    $display ("%s: [fail] Coverage error.", `TESTNAME);
   	    #100 $finish;
	 end

      end // always @ (negedge nuoe)
   end // always @ (negedge nuoe)
      
   
   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB3-UOP.vcd");
      $dumpvars (0, PB3_UOP);
`endif

      // Reset
      nreset <= 0;
      nuoe <= 1;
      fl <= 0;
      nirqs <= 1;
      ac <= 0;
      uop <= 0;

      #250 nreset <= 1;

      for (i = 0; i < 16; i = i + 1) begin
	 if (i == 8) begin
	    #25000 nirqs <= 0;
	    #25000;
	 end
	 uop <= i & 15;

	 #10000 for (j = 0; j < `MAX; j = j + 1) begin
	    ac <= j & 65535;
	    fl <= j & 131072 ? 1'b1 : 1'b0;

	    #63 nuoe <= 0;
	    #187 nuoe <= 1;
	 end

	 $display("%s: [ok] uop=%3b, nirqs=%b: tests successful (%1d/16).",
		  `TESTNAME, uop, nirqs, i + 1);
      end
      

      #5000 ;
      $display("%s: [ok] Pass (ALU unary ROM).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB3_unary dut (nreset, nuoe, fl, nirqs, ac, uop,
				roll16, isroll, ibus);
   

endmodule // PB3_BOP_add

// End of file.
