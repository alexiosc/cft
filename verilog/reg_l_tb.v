///////////////////////////////////////////////////////////////////////////////
//
// TEST THE L REGISTER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_l_tb.v -- L Register testbench
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

`include "reg_l.v"

`timescale 1ns/10ps


module reg_l_tb();
   reg nrsthold;
   reg clk;
   reg naction_cpl;
   reg naction_cll;
   reg ibus12;
   reg flin_add;
   reg flin_sru;
   reg nsetl_rom;
   reg nflagwe;
   reg bcp;
   reg clken;

   wire fl;
   wire flfast;
   wire clk4;
   reg _clk4;

   integer     i, j, k;

   initial begin        
      $dumpfile ("vcd/reg_l_tb.vcd");
      $dumpvars (0, reg_l_tb);

      $monitor ("t: %7d | %b %b %b > %b", $time, nrsthold, naction_cll, naction_cpl, fl);

      nrsthold = 0;
      clk = 1;
      naction_cpl = 1;
      naction_cll = 1;
      ibus12 = 0;
      nflagwe = 1;
      flin_add = 0;
      flin_sru = 0;
      nsetl_rom = 1;
      bcp = 1;
      clken = 0;
      #1000 nrsthold = 1;

      // Try out the asynchronous signals

      #187.5 naction_cll = 0;
      clk = 0;
      #62.5 naction_cll = 1;
      clk = 1;

      #187.5 naction_cpl = 0;
      clk = 0;
      #62.5 naction_cpl = 1;
      clk = 1;
      
      #500 for (i = 0; i < 4; i++) begin
	 #187.6 naction_cpl = 0;
	 clk = 0;
	 #62.5 naction_cpl = 1;
	 clk = 1;
      end

      // Test the synchronous features
      #1000 clken = 1;

      // Test write_flags from the bus.
      #400 for (i = 0; i < 4; i++) begin
	 #400 ibus12 = 0;
	 #50 nflagwe = 0;
	 #50 nflagwe = 1;
	 
	 #400 ibus12 = 1;
	 #50 nflagwe = 0;
	 #50 nflagwe = 1;
      end

      // Test L loading from the ALU's adder
      #1000 for (i = 0; i < 4; i++) begin
	 #400 flin_add = 0;
	 #50 nsetl_rom = 0;
	 #50 nsetl_rom = 1;
	 
	 #400 flin_add = 1;
	 #50 nsetl_rom = 0;
	 #50 nsetl_rom = 1;
      end

      // And also test fast toggling from the serial shifter.
      #1000;
      #62.5 for (i = 0; i < 32; i++) begin
	 #30 flin_sru = 0;
	 bcp = 0;
	 #30 bcp = 1;
	 
	 #30 flin_sru = 1;
	 bcp = 0;
	 #30 bcp = 1;
      end
      #62.5;

      #1000 $display("345 OK");
      $finish;

   end // initial begin

   always begin
      #62.5 _clk4 = 1;
      #187.5 _clk4 = 0;
   end
   assign clk4 = clken == 1 ? _clk4 : clk;

   // Instantiate the DUT.
   reg_l reg_l (.nrsthold(nrsthold),
		.clk4(clk4),
		.naction_cpl(naction_cpl), .ibus12(ibus12),
		.flin_add(flin_add), .flin_sru(flin_sru),
		.nsetl_rom(nsetl_rom), .nflagwe(nflagwe),
		.bcp(bcp), .naction_cll(naction_cll), 
		.fl(fl), .flfast(flfast));

   // Verify our findings.
   reg [8191:0] msg;
   reg 		old_fl;

   // Check against FLFAST because it's simpler. We'll then check if
   // FLFAST correctly updates FL synchronously with clk4.
   always @ (nrsthold, naction_cll, naction_cpl) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Reset
	 if (nrsthold === 0) begin
	    if (flfast !== 0) $sformat(msg, "nrsthold=%b, flfast=%b (should be 0)", nrsthold, flfast);
	    old_fl = flfast;
	 end
	 
	 else if (nrsthold !== 1) $sformat(msg, "testbench bug, nrsthold=%b", nrsthold);

	 // CLL
	 if (naction_cll === 0) begin
	    if (flfast !== 0) $sformat(msg, "nrsthold=%b, naction_cll=%b, flfast=%b (should be 0)",
				   nrsthold, naction_cll, flfast, old_fl);
	    old_fl = flfast;
	 end
	 
	 else if (naction_cll !== 1) $sformat(msg, "testbench bug, naction_cll=%b", naction_cll);

	 // CPL
	 if (naction_cpl === 0) begin
	    if (flfast !== ~old_fl) begin
	       $sformat(msg, "nrsthold=%b, naction_cpl=%b, flfast=%b (should be %b)",
			nrsthold, naction_cpl, flfast, ~old_fl);
	    end
	    old_fl = flfast;
	 end
	 
	 else if (naction_cpl !== 1) $sformat(msg, "testbench bug, naction_cpl=%b", naction_cpl);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK reset/cll/cpl");
      end
   end // always @ (nmem, nio)

   always @ (posedge nsetl_rom, posedge nflagwe) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({nflagwe, nsetl_rom})
	   2'b00: correct_flfast = ibus12;
	   2'b01: correct_flfast = ibus12;
	   2'b10: correct_flfast = flin_add;
	   2'b11: correct_flfast = flin_sru;
	 endcase

	 // nflagwe (setting flag from IBUS)
	 if (nflagwe === 0) begin
	    if (flfast !== ibus12)
	      $sformat(msg, "nflagwe=%b, nsetl_rom=%b, flfast=%b (should be %b)",
		       nflagwe, nsetl_rom, flfast, ibus12);
	 end
	 else if (nflagwe !== 1) $sformat(msg, "testbench bug, nflagwe=%b", nflagwe);
	    
	 // nsetl_rom (toggling flag as a result of addition)
	 else if (nsetl_rom === 0) begin
	    if (flfast !== flin_add)
	      $sformat(msg, "nflagwe=%b, nsetl_rom=%b, flfast=%b (should be %b)",
		       nflagwe, nsetl_rom, flfast, flin_add);
	 end
	 else if (nsetl_rom !== 1) $sformat(msg, "testbench bug, nsetl_rom=%b", nsetl_rom);
	    

	 // CLL
	 if (naction_cll === 0) begin
	    if (flfast !== 0) $sformat(msg, "nrsthold=%b, naction_cll=%b, flfast=%b (should be 0)",
				   nrsthold, naction_cll, flfast, old_fl);
	    old_fl = flfast;
	 end
	 
	 else if (naction_cll !== 1) $sformat(msg, "testbench bug, naction_cll=%b", naction_cll);

	 // CPL
	 if (naction_cpl === 0) begin
	    if (flfast !== ~old_fl) begin
	       $sformat(msg, "nrsthold=%b, naction_cpl=%b, flfast=%b (should be %b)",
			nrsthold, naction_cpl, flfast, ~old_fl);
	    end
	    old_fl = flfast;
	 end
	 
	 else if (naction_cpl !== 1) $sformat(msg, "testbench bug, naction_cpl=%b", naction_cpl);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK set");
      end
   end // always @ (nmem, nio)
   

   reg correct_flfast;
   always @ (posedge bcp) begin
      #50 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({nflagwe, nsetl_rom})
	   2'b00: correct_flfast = ibus12;
	   2'b01: correct_flfast = ibus12;
	   2'b10: correct_flfast = flin_add;
	   2'b11: correct_flfast = flin_sru;
	 endcase

	 // nflagwe (setting flag from SRU)
	 if (bcp === 1) begin
	    if (flfast !== flin_sru)
	      $sformat(msg, "bcp=%b, flfast=%b (should be %b)",
		       bcp, flfast, flin_sru);
	 end
	 
	 else if (bcp !== 0) $sformat(msg, "testbench bug, bcp=%b", bcp);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK bcp");
      end
   end // always @ (nmem, nio)
   

endmodule // reg_l_tb


// End of file.
