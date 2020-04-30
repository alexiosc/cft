///////////////////////////////////////////////////////////////////////////////
//
// ALU ADDRESS DECODER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// alu_decoder_tb.v — ALU Address decoder tetbench
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

`include "alu_decoder.v"

`timescale 1ns/10ps


module alu_decoder_tb();
   reg         t34;
   reg [4:0]   raddr;
   reg [4:0]   waddr;
   reg [3:0]   action;

   wire        nromoe;
   wire        nread_alu_b;
   wire        nwrite_alu_b;
   wire        naction_cpl;
   wire        naction_cll;
   wire        naction_sru;
   //wire        naction_wpa;

   integer     i;
   reg [800:0] status;
   
   initial begin        
      $dumpfile ("vcd/alu_decoder_tb.vcd");
      $dumpvars (0, alu_decoder_tb);

      // $monitor ("t: %7d | %b %b | init=%b rom=%b | IR: %04x | %d %02x | waddr=%05b raddr=%05b ibus=%02x | regfile: %04x %02x ce=%b we=%b oe=%b | regs: %02x %02x %02x %02x %02x %02x %02x %02x",
      // 		$time,
      // 		waddr, raddr,
      // 		mbu.nenable, nfpram_rom,
      // 		ir,
      // 		mbu.sel, aext,
      // 		waddr, raddr, ibus_low,
      // 		mbu.regfile.a, mbu.regfile.d, mbu.regfile.nce, mbu.regfile.nwe, mbu.regfile.noe,
      // 		mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7);

      // Init
      t34 = 1;
      raddr = 0;
      waddr = 0;
      action = 0;

      status = "Read";
      for (i = 0; i < 128; i++) begin
	 #125 raddr = i[6:2];
	 t34 = i[0];
      end
      #500 raddr = 0;
      #5000;
      
      status = "Write";
      for (i = 0; i < 128; i++) begin
	 #125 waddr = i[6:2];
	 t34 = i[0];
      end
      #500 waddr = 0;
      #5000;
      
      status = "Action";
      for (i = 0; i < 32; i++) begin
	 #1000 action = i;
      end
      #500 action = 0;
      #5000;
      
      
      #10000 $finish;
      
   end // initial begin

   // Connect the DUT
   alu_decoder alu_decoder (
			    .t34(t34), .raddr(raddr), .waddr(waddr), .action(action), 
			    .nromoe(nromoe),
			    .nread_alu_b(nread_alu_b),
			    .nwrite_alu_b(nwrite_alu_b),
			    .naction_cpl(naction_cpl), 
			    .naction_cll(naction_cll),
			    .naction_sru(naction_sru)
			    //.naction_wpa(naction_wpa)
			    );


   // Verify our findings.
   reg [8191:0] msg;

   // Verify reading
   always @(raddr, t34) #30 begin

      // Ensure raddr is sane.
      if ((raddr[4] !== 1'b0 && raddr[4] !== 1'b1) ||
   	  (raddr[3] !== 1'b0 && raddr[3] !== 1'b1) ||
   	  (raddr[2] !== 1'b0 && raddr[2] !== 1'b1) ||
   	  (raddr[1] !== 1'b0 && raddr[1] !== 1'b1) ||
   	  (raddr[0] !== 1'b0 && raddr[0] !== 1'b1)) begin
   	 $sformat(msg, "testbench bug: raddr=%b", raddr);
      end

      // Ensure nromoe is asserted for all ALU addresses during T34.
      if (raddr[4:3] === 2'b10) begin
   	 if (nromoe !== t34) begin
   	    $sformat(msg, "nROMOE decoding failure 1: raddr=%b, t34=%b, but nromoe=%b (should be %b)",
   		     raddr, t34, nromoe, t34);
   	 end
      end
      else if (nromoe !== 1'b1) begin
   	 $sformat(msg, "nROMOE decoding failure 2: raddr=%b, t34=%b, but nromoe=%b (should be 1)",
   		  raddr, t34, nromoe);
      end

      // Check nread_alu_b
      if (raddr === 5'b11000) begin
   	 if (nread_alu_b !== t34) begin
   	    $sformat(msg, "nREAD-ALU-B decoding failure: raddr=%b, t34=%b, but nread_alu_b=%b (should be %b)",
   		     raddr, t34, nread_alu_b, t34);
   	 end
      end
      else if (nread_alu_b !== 1'b1) begin
   	 $sformat(msg, "nREAD-ALU-B decoding failure 2: raddr=%b, t34=%b, but nread_alu_b=%b (should be 1)",
   		  raddr, t34, nread_alu_b);
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
   	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	 $error("assertion failure");
   	 #100 $finish;
      end
      else begin
   	 $display("345 OK raddr");
      end
   end

   // Verify writing
   always @(waddr, t34) #30 begin

      // Ensure waddr is sane.
      if ((waddr[4] !== 1'b0 && waddr[4] !== 1'b1) ||
   	  (waddr[3] !== 1'b0 && waddr[3] !== 1'b1) ||
   	  (waddr[2] !== 1'b0 && waddr[2] !== 1'b1) ||
   	  (waddr[1] !== 1'b0 && waddr[1] !== 1'b1) ||
   	  (waddr[0] !== 1'b0 && waddr[0] !== 1'b1)) begin
   	 $sformat(msg, "testbench bug: waddr=%b", waddr);
      end

      // Check nwrite_alu_b
      if (waddr[4:0] === 5'b11000) begin
   	 if (nwrite_alu_b !== t34) begin
   	    $sformat(msg, "nWRITE-ALU-B decoding failure: waddr=%b, t34=%b, but nwrite_alu_b=%b (should be %b)",
   		     waddr, t34, nwrite_alu_b, t34);
   	 end
      end
      else if (nwrite_alu_b !== 1'b1) begin
   	 $sformat(msg, "nWRITE-ALU-B decoding failure: waddr=%b, t34=%b, but nwrite_alu_b=%b (should be 1)",
   		  waddr, t34, nwrite_alu_b);
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
   	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	 $error("assertion failure");
   	 #100 $finish;
      end
      else begin
   	 $display("345 OK waddr");
      end
   end

   // Verify writing
   always @(action) #30 begin
      // Ensure waddr is sane.
      if ((action[3] !== 1'b0 && action[3] !== 1'b1) ||
	  (action[2] !== 1'b0 && action[2] !== 1'b1) ||
	  (action[1] !== 1'b0 && action[1] !== 1'b1) ||
	  (action[0] !== 1'b0 && action[0] !== 1'b1)) begin
   	 $sformat(msg, "testbench bug: action=%b", action);
      end

      if (naction_cpl !== (action === 4'b0001 ? 1'b0 : 1'b1)) begin
   	 $sformat(msg, "nACTION-CPL decoding failure: action=%b, naction_cpl=%b",
		  action, naction_cpl);
      end

      if (naction_cll !== (action === 4'b0010 ? 1'b0 : 1'b1)) begin
   	 $sformat(msg, "nACTION-CLL decoding failure: action=%b, naction_cll=%b",
		  action, naction_cll);
      end

      // if (naction_wpa !== (action === 4'b0110 ? 1'b0 : 1'b1)) begin
      // 	 $sformat(msg, "nACTION-WPA decoding failure: action=%b, naction_wpa=%b",
      // 		  action, naction_wpa);
      // end

      if (naction_sru !== (action === 4'b0111 ? 1'b0 : 1'b1)) begin
   	 $sformat(msg, "nACTION-SRU decoding failure: action=%b, naction_sru=%b",
		  action, naction_sru);
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
      	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
      	 $error("assertion failure");
      	 #100 $finish;
      end
      else begin
      	 $display("345 OK action");
      end
   end

endmodule // alu_decoder_tb


// End of file.
