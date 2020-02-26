///////////////////////////////////////////////////////////////////////////////
//
// FLAG UNIT TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// flag_unit_tb.v -- Flag Unit Testbench
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

`include "flag_unit.v"
`timescale 1ns/10ps

module flag_unit_tb();
   reg          clk4;
   reg [4:0]    waddr;
   reg [4:0] 	raddr;
   reg [3:0] 	action;
   reg 	        fn, fz, fl, fv, fi;

   wire [15:0] 	ibus;
   wire [7:0] 	ibus_hi;
   wire 	nflagwe;
   wire 	nwrite_ir;
   wire 	nread_agl;
   // wire 	naction_cpl;
   // wire 	naction_cll;
   // wire 	naction_sti;
   // wire 	naction_cli;

   reg 		nfpflags;
   wire [7:0] 	fpd;
   
   integer    i;
   reg [800:0] status;

   // Zero the IBus LSB. The DUT doesn't read or write from mit.
   assign ibus_hi = ibus[15:8];
   
   initial begin        
      //$display ("time\t rst oe cs q");
      $monitor ("t: %7d | %b > %b %b | %b > %04h %b | %b > %02x",
		$time,
		waddr, nflagwe, nwrite_ir,
		raddr, ibus, nread_agl,
		nfpflags, fpd);
      $dumpfile ("vcd/flag_unit_tb.vcd");
      $dumpvars (0, flag_unit_tb);

      waddr = 0;
      raddr = 0;
      action = 0;
      nfpflags = 1;
      fn = 0;
      fz = 1;
      fl = 1;
      fv = 1;
      fi = 1;
      clk4 = 1;

      status = "raddr";
      for (i = 0; i < 32; i = i + 1) begin
	 #250 raddr = i;
      end
      #250 raddr = 0;

      #250 status = "waddr";
      for (i = 0; i < 32; i = i + 1) begin
	 #125 waddr = i;
	 #62.5 clk4 = 0;
	 #62.5 clk4 = 1;
      end
      #250 waddr = 0;

      #250 status = "action";
      for (i = 0; i < 16; i = i + 1) begin
	 #125 action = i;
	 #62.5 clk4 = 0;
	 #62.5 clk4 = 1;
      end
      #250 action = 0;
      #250 status = "";

      #5000 $display("OK");
      $finish;
   end // initial begin

   // Connect DUT to test bench
   flag_unit flag_unit (.clk4(clk4),
			.waddr(waddr),
			.raddr(raddr),
			.fn(fn), .fz(fz), .fl(fl), .fv(fv), .fi(fi),
			.ibus(ibus[15:8]),
			.nflagwe(nflagwe),
			.nread_agl(nread_agl),
			.nwrite_ir(nwrite_ir),
			//.action(action),
			//.naction_cpl(naction_cpl),
			//.naction_cll(naction_cll),
			//.naction_sti(naction_sti),
			//.naction_cli(naction_cli),
			.nfpflags(nfpflags), .fpd(fpd));

   // Front Panel emulation
   always begin
      #437.5 nfpflags = 0;
      #62.5  nfpflags = 1;
   end
   
   // Verify our findings.
   reg [8191:0] msg;
   integer 	ca;

   // Test the reader (driving the IBus MBS with flag values)
   always @ (raddr) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (raddr === 5'b01101 || waddr === 5'b01110) begin
	    if (ibus[15:8] !== { fi, 1'b0, fv, fl, fz, fn, 2'b00 }) begin
	       $sformat(msg, "raddr=%b but ibus[15:8]=%b (should be %b)",
			waddr, ibus[15:8], { fi, 1'b0, fv, fl, fz, fn, 2'b00 });
	    end
	 end

	 else if (raddr === 5'b01111 && nread_agl !== 1'b0) begin
	    $sformat(msg, "nread_agl decode error: raddr=%b but nread_agl=%b (should be 0)",
		     raddr, nread_agl);
	 end

	 // Purposefully not else-if!
	 if (raddr !== 5'b01111 && nread_agl !== 1'b1) begin
	    $sformat(msg, "nread_agl decode error: raddr=%b but nread_agl=%b (should be 1)",
		     raddr, nread_agl);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK raddr");
      end
   end

   
   // Test the writer (strobing nflagwe)
   always @ (waddr) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (waddr === 5'b01101 || waddr === 5'b01110) begin
	    if (nflagwe !== 0) begin
	       $sformat(msg, "waddr=%b but nflagwe=%b (should be 0)",
			waddr, nflagwe);
	    end
	 end

	 else if (nflagwe === 0) begin
	       $sformat(msg, "waddr=%b but nflagwe=%b (should be 1)",
			waddr, nflagwe);
	 end

	 else if (waddr === 5'b01111 && nwrite_ir !== 1'b0) begin
	    $sformat(msg, "nwrite_ir decode error: waddr=%b but nwrite_ir=%b (should be 0)",
		     waddr, nwrite_ir);
	 end

	 // Purposefully not else-if!
	 if (waddr !== 5'b01111 && nwrite_ir !== 1'b1) begin
	    $sformat(msg, "nwrite_ir decode error: waddr=%b but nwrite_ir=%b (should be 1)",
		     waddr, nwrite_ir);
	 end
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK waddr");
      end
   end

   // Note: (2019-01-06): the ALU decodes its own CPL/CLL signals. The
   // interrupt state machine decodes STI/CLI. This is no longer
   // needed here.

   // // Test the action decoder
   // always @ (action) begin
   //    #30 begin
   // 	 msg[7:0] = "";		// Use the msg as a flag.

   // 	 casex ({ action, naction_cli, naction_sti, naction_cll, naction_cpl })
   // 	   8'b0000_1111: ca = 1; // Idle;
   // 	   8'b0001_1110: ca = 1; // CPL
   // 	   8'b0010_1101: ca = 1; // CLL
   // 	   8'b0011_1011: ca = 1; // STI
   // 	   8'b0100_0111: ca = 1; // CLI
   // 	   8'b0101_1111: ca = 1; // (not selected)
   // 	   8'b0110_1111: ca = 1; // (not selected)
   // 	   8'b0111_1111: ca = 1; // (not selected)
   // 	   8'b1000_1111: ca = 1; // (not selected)
   // 	   8'b1001_1111: ca = 1; // (not selected)
   // 	   8'b1010_1111: ca = 1; // (not selected)
   // 	   8'b1011_1111: ca = 1; // (not selected)
   // 	   8'b1100_1111: ca = 1; // (not selected)
   // 	   8'b1101_1111: ca = 1; // (not selected)
   // 	   8'b1110_1111: ca = 1; // (not selected)
   // 	   8'b1111_1111: ca = 1; // (not selected)
   // 	   default: ca = 0;
   // 	 endcase; // casex ({ action, naction_cli, naction_sti, naction_cll,naction_cpl })

   // 	 if (ca == 0) begin
   // 	    $sformat(msg, "action=%b but naction_cpl=%b, naction_cll=%b, naction_sti=%b, naction_cli=%b",
   // 		     action, naction_cpl, naction_cll, naction_sti, naction_cli);
   // 	 end

   // 	 // Fail if we've logged an issue.
   // 	 if (msg[7:0]) begin
   // 	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   // 	    $error("assertion failure");
   // 	    #100 $finish;
   // 	 end
   // 	 else $display("OK nflagwe");
   //    end
   // end

   // Test the front panel interface
   always @ (nfpflags) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (nfpflags === 1) begin
	    if (fpd != 8'bzzzzzzzz) begin
	       $sformat(msg, "nfpflags=%b, but fpd=%b (should be Z)", nfpflags, fpd);
	    end
	 end else
	    
   	 if (nfpflags === 0) begin
	    if (fpd !== { fi, 1'b0, fv, fl, fz, fn, 2'b00 }) begin
	       $sformat(msg, "nfpflags=%b, but fpd=%b (should be %b)",
			nfpflags, fpd, { fi, 1'b0, fv, fl, fz, fn, 2'b00 });
	    end
	 end

	 else begin
   	    $sformat(msg, "testbench bug, nfpflags=%b (should never happen)",
   		     nfpflags);
   	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK fp");
      end
   end // always @ (nread_agl, ir, pc)

endmodule
