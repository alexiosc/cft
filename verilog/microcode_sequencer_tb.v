///////////////////////////////////////////////////////////////////////////////
//
// TEST THE MICROCODE SEQUENCER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// microcode_sequencer_tb.v -- Microcode Sequencer testbench
//
// Copyright © 2011–2020 Alexios Chouchoulas
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

`include "reset.v"
`include "clock.v"
`include "microcode_sequencer.v"

`timescale 1ns/10ps

module microcode_sequencer_tb();
   reg [800:0] status;
   reg         nreset;
   wire        nrsthold;	// Driven by the reset unit
   wire        clk2;		// Driven by the clock generator
   wire        clk3;		// Driven by the clock generator (used for reset)
   wire        clk4;		// Driven by the clock generator

   reg 	       nhalt;
   reg 	       nendext;
   reg 	       nws;

   // Microaddress inputs
   reg [1:0]   idx;
   reg 	       ncond;
   reg 	       in_rsvd;
   reg [15:0]  ir;
   reg 	       nirqsuc;

   // Control outputs
   wire [4:0]  raddr;
   wire [4:0]  waddr;
   wire [4:0]  cond;
   wire [3:0]  action;
   wire        nmem;
   wire        nio;
   wire        nr;
   wire        nwen;
   wire        nend;

   // FP outputs
   wire        nfpua0;		// These hang off a counter's output
   wire        nfpuc0;
   wire        nfpuc1;
   wire        nfpuc2;
   wire        fpfetch;
   wire [7:0]  fpd;

   integer     i,j,fpc;

   initial begin
      
      //$display ("time\t d pulse");
      // $monitor ("t: %7d | %b %h > %h | %b %b %b %b > %h", $time,
      // 		noe, uaddr, ucontrol,
      // 		nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);
      $dumpfile ("vcd/microcode_sequencer_tb.vcd");
      $dumpvars (0, microcode_sequencer_tb);

      status = "init";
      fpc = 0;
      nreset = 0;
      nhalt = 1;
      nendext = 1;
      nws = 1;
      idx = 2'b00;
      ncond = 1;
      in_rsvd = 0;
      ir = 0;
      nirqsuc = 1;
      expupc = 0;

      // Testing the microcode sequencer is easy, because the bulk of the unit
      // is the control store, which is tested in control_store_tb. What
      // remains it the µPC, fetch/exec decoder and functionality like wait
      // state handling, halting, etc.

      #1000 nreset = 1;
      status = "resetting";
      // This delay brings us to approximate phase with T1 (clk4 posedge), as
      // long as all further delays are multiples of 250ns.
      #2254 status = "running";

      #10000 nhalt = 0;
      status = "halted";
      #10000 nhalt = 1;
      status = "running";

      #10000 nws = 0;
      status = "wait state";
      #10000 nws = 1;
      status = "running";

      // These are clk4-synchronous events, so to avoid concurrency issues in
      // the testbench, let's shift ourselves out of phase by 60ns.
      #10060 status = "endext";
      for (i = 0; i < 10; i = i + 1) begin
	 #10000 nendext = 0;
	 #500 nendext = 1;
      end
      status = "finished";

      // Make sure we're not counting during reset.
      // #1000 noe = 1'b1;
      // #1000 noe = 1'b0;

      #10000 $finish;
      
   end // initial begin

   // Assign tristatable wires
   wire nreset_real, nhalt_real, nws_real, nendext_real, in_rsvd_real;
   assign nreset_real = nreset;
   assign nhalt_real = nhalt;
   assign nws_real = nws;
   assign nendext_real = nendext;
   assign in_rsvd_real = in_rsvd;

   // Use the clock generator, configured to run without a DFP at full
   // speed. We only use clk2 and clk4 outputs here.
   clock_generator clock_generator(.nreset(nreset_real),
				   .clk2(clk2), .clk3(clk3), .clk4(clk4));

   // Use the reset unit as it's an important part of the sequencer.
   reset_logic reset_logic(.nreset(nreset_real), .nrsthold(nrsthold), .clk3(clk3));

   // The DUT
   microcode_sequencer microcode_sequencer(.nreset(nreset), .nrsthold(nrsthold),
		       .clk2(clk2), .clk4(clk4),
		       .nhalt(nhalt_real), .nendext(nendext_real), .nws(nws_real),
		       .idx(idx), .ncond(ncond), .in_rsvd(in_rsvd_real),
		       .ir(ir[15:7]), .nirqsuc(nirqsuc),
		       .raddr(raddr), .waddr(waddr), .cond(cond), .action(action),
		       .nmem(nmem), .nio(nio), .nr(nr), .nwen(nwen), .nend(nend),
		       .fpfetch(fpfetch),
		       .nfpua0(nfpua0),
		       .nfpuc0(nfpuc0), .nfpuc1(nfpuc1), .nfpuc2(nfpuc2), .fpd(fpd));

   // Front Panel functionality. For test purposes, we make it synchronous with CLK3 and use a counter.
   always @ (posedge clk2) begin
      fpc = (fpc + 1) % 4;
   end
   assign nfpua0 = nrsthold == 1 && fpc == 0 ? 0 : 1;
   assign nfpuc0 = nrsthold == 1 && fpc == 1 ? 0 : 1;
   assign nfpuc1 = nrsthold == 1 && fpc == 2 ? 0 : 1;
   assign nfpuc2 = nrsthold == 1 && fpc == 3 ? 0 : 1;
  
   // Verify our findings.
   reg [8191:0] msg;
   reg [3:0] 	expupc = 0;
   reg [7:0] 	fpval;
   
   // Check the µPC

   always @ (posedge clk4) begin
      // Let it initialise.
      if ($time > 100) begin
	 #30 begin
   	    msg[7:0] = "";		// Use the msg as a flag.

	    if (nrsthold === 1'b0 && microcode_sequencer.upc != 4'b0000) begin
   	       $sformat(msg, "uPC reset failure: nrsthold=%b but uPC=%b (should be 0000)",
			nrsthold, microcode_sequencer.upc);
	    end

	    else if (nend === 1'b0 && microcode_sequencer.upc != 4'b0000) begin
   	       $sformat(msg, "uPC reset failure: nend=%b but uPC=%b (should be 0000)",
			nend, microcode_sequencer.upc);
	    end

	    else if (nendext === 1'b0 && microcode_sequencer.upc != 4'b0000) begin
   	       $sformat(msg, "uPC reset failure: nendext=%b but uPC=%b (should be 0000)",
			nendext, microcode_sequencer.upc);
	    end

	    else if (nrsthold !== 1'b0 && nrsthold !== 1'b1) begin
   	       $sformat(msg, "testbench bug: nrsthold=%b", nrsthold);
	    end

	    // Only check for nEND when nHALT is deasserted.
	    else if (nend !== 1'b0 && nend !== 1'b1 && nhalt !== 1'b0) begin
   	       $sformat(msg, "testbench bug: nend=%b", nend);
	    end

	    else if (nendext !== 1'b0 && nendext !== 1'b1) begin
   	       $sformat(msg, "testbench bug: nendext=%b", nendext);
	    end

	    // else if (nrsthold !== 1'b0 && nhalt !== 1'b0 && nws !== 1'b0) begin
	    //    if (microcode_sequencer.upc != expupc) begin
   	    // 	  $sformat(msg, "uPC incrementation failure: upc=%b, but expected it to be %b",
	    // 		   microcode_sequencer.upc, expupc);
	    //    end else begin
	    // 	  // Update the expected µPC.
	    // 	  expupc = (microcode_sequencer.upc + 1) & 4'b1111;
	    //    end
	    // end

	    else if (fpfetch !== microcode_sequencer.upc < 2 ? 1'b1 : 1'b0) begin
   	       $sformat(msg, "fpfetch decoding failure: upc=%x but fpfetch=%b (should be %b)",
			microcode_sequencer.upc, fpfetch, microcode_sequencer.upc < 2 ? 1'b1 : 1'b0);
	    end

   	    // Fail if we've logged an issue.
   	    if (msg[7:0]) begin
   	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	       $error("assertion failure");
   	       #100 $finish;
   	    end
   	    else $display("345 OK µPC");
	 end // if ($time > 100)
      end
   end // always @ (posedge clk4)

   always @ (nhalt) begin
      #30 begin
	 if (nhalt === 1'b0 && microcode_sequencer.ucontrol !== 24'bZ) begin
   	    $sformat(msg, "halt tristate failure: nhalt=%b, but ucontrol=%b (should be 24'bZ)",
		     nhalt, microcode_sequencer.ucontrol);
	 end

	 else if (nhalt !== 1'b0 && nhalt !== 1'b1) begin
   	    $sformat(msg, "testbench bug: nhalt=%b", nhalt);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
	 end
	 else $display("345 OK Halt");
      end
   end // always @ (nhalt)

   // This is taken from the control store tests
   always @ (nfpua0, nfpuc0, nfpuc1, nfpuc2) begin
      if ($time > 2000) begin
	 #30 begin
   	    // Front Panel checks

   	    casex ({ nfpua0, nfpuc0, nfpuc1, nfpuc2 })
   	      4'b0111: fpval = microcode_sequencer.uaddr[7:0];
   	      4'b1011: fpval = microcode_sequencer.ucontrol[7:0];
   	      4'b1101: fpval = microcode_sequencer.ucontrol[15:8];
   	      4'b1110: fpval = microcode_sequencer.ucontrol[23:16];
   	      4'b1111: fpval = 8'bzzzzzzzz;
   	      default: fpval = 8'bxxxxzzzz;
   	    endcase // casex ({ nfpua0, nfpuc0, nfpuc1, nfpuc2 })

   	    if (fpval === 8'bxxxxzzzz) begin
   	       $sformat(msg, "testbench bug, nfpua0=%b, nfpuc0=%b, nfpuc1=%b, nfpuc2=%b.",
   			nfpua0, nfpuc0, nfpuc1, nfpuc2);
   	    end else if (fpval != -2 && fpd !== fpval) begin
   	       $sformat(msg, "nfpua0=%b, nfpuc0=%b, nfpuc1=%b, nfpuc2=%b, but fpd=%02x (should be %02x).",
   			nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd, fpval);
   	    end
	    
   	    // Fail if we've logged an issue.
   	    if (msg[7:0]) begin
   	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	       $error("assertion failure");
   	       #100 $finish;
   	    end
   	    else $display("345 OK front panel");
	 end // if ($time > 2000)
      end
   end // always @ (nset, nrst)
endmodule // microcode_sequencer_tb

// End of file.
