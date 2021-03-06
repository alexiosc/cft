///////////////////////////////////////////////////////////////////////////////
//
// OVERFLOW FLAG TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_v_tb.v -- reg_v testbench
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

`include "reg_v.v"

`timescale 1ns/10ps


module reg_v_tb();
   reg    nreset;
   reg 	  ibus13;
   reg 	  fvout_rom;		// Output FROM the ROM; input to us.
   reg 	  nsetv_rom;
   reg 	  nflagwe;
   reg 	  clken;
   
   wire   fv;
   reg 	  clk4;
   
   integer i, j, k;

   initial begin        
      $dumpfile ("vcd/reg_v_tb.vcd");
      $dumpvars (0, reg_v_tb);
      $monitor ("t: %7d | %b %b %b %b %b %b > %b", $time, nreset, clk4, ibus13, nflagwe, fvout_rom, nsetv_rom, fv);
      
      nreset = 0;
      clk4 = 1;
      ibus13 = 0;
      nflagwe = 1;
      fvout_rom = 0;
      nsetv_rom = 1;
      clken = 0;
      // #1000 nreset = 1;
      // #1000 clken = 1;

      for (i = 0 ; i < 32; i = i + 1) begin
	 #62.5 begin
	    ibus13 = i[0];
	    fvout_rom = i[1];
	    nsetv_rom = i[2];
	    nreset = i[4];
	    #19 nflagwe = i[3];	// Simulate WADDR decoding delay (12ns for '138 + 7ns for LCT AND gate)
	 end;
	 #187.5 clk4 = 0; nflagwe = 1; nsetv_rom = 1;
	 #62.5 clk4 = 1;
      end

      // // Test write_flags from the bus.
      // #400 for (i = 0; i < 4; i++) begin
      // 	 #400 ibus13 = 0;
      // 	 #100 nflagwe = 0;
      // 	 #100 nflagwe = 1;
	 
      // 	 #400 ibus13 = 1;
      // 	 #100 nflagwe = 0;
      // 	 #100 nflagwe = 1;
      // end

      // // Test L loading from the ALU's adder
      // #1000 for (i = 0; i < 4; i++) begin
      // 	 #400 fvout_rom = 0;
      // 	 #100 nsetv_rom = 0;
      // 	 #100 nsetv_rom = 1;
	 
      // 	 #400 fvout_rom = 1;
      // 	 #100 nsetv_rom = 0;
      // 	 #100 nsetv_rom = 1;
      // end

      #1000 $display("345 OK");
      $finish;

   end // initial begin

   // always begin
   //    #62.5 _clk4 = 1;
   //    #187.5 _clk4 = 0;
   // end
   // assign clk4 = clken == 1 ? _clk4 : clk;

   // Instantiate the DUT.
   reg_v reg_v (.nreset(nreset), .clk4(clk4),
		.fvout_rom(fvout_rom),
		.nsetv_rom(nsetv_rom),
		.ibus13(ibus13), .nflagwe(nflagwe),
		.fv(fv));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (nreset, posedge clk4) begin // ibus13, nflagwe, fvout_rom, nsetv_rom, fv) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // FV should clear to zero on reset.
	 if (nreset === 0) begin
	    if (fv !== 0) $sformat(msg, "nreset=%b but fv=%b (should be 0)", nreset, fv);
	 end else if (nreset !== 1) begin
	    if (fv !== 1) $sformat(msg, "testbench bug, nreset=%b", nreset);
	 end else if (clk4 === 1 && nflagwe === 0) begin
	    // If #FLAGWE is low, the rising edge of clk4 should set FV to the
	    // value in IBUS13. This is for retrieving the flag value from the
	    // hardware stack.
	    if (fv !== ibus13) $sformat(msg, "nflagwe=%b, ibus13=%b but fv=%b (should be same as ibus13)", nflagwe, ibus13, fv);
	 end
	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #1000 $finish;
	 end
	 else $display("345 OK reset");
      end
   end

   always @ (posedge nflagwe, posedge nsetv_rom) begin
      #30 begin
	 if (nreset === 1 && clk4 === 1 && nflagwe === 0) begin
	    // If #FLAGWE is low, the rising edge of clk4 should set FV to the
	    // value in IBUS13. This is for retrieving the flag value from the
	    // hardware stack.
	    if (fv !== ibus13) $sformat(msg, "nflagwe=%b, ibus13=%b but fv=%b (should be same as ibus13)", nflagwe, ibus13, fv);
	 end

	 else if (nreset === 1 && clk4 === 1 && nsetv_rom === 0) begin
	    // If #READ_ALU_ADD is low, the rising edge of clk4 should set FV
	    // to the value in FVIN-ADD.
	    if (fv !== fvout_rom) $sformat(msg, "nsetv_rom=%b, fvout_rom=%b but fv=%b (should be same as fvout_rom)",
					  nsetv_rom, ibus13, fvout_rom);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #1000 $finish;
	 end
	 else $display("345 OK write");
      end
   end
endmodule // reg_v_tb


// End of file.
