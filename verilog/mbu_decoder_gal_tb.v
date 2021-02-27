///////////////////////////////////////////////////////////////////////////////
//
// MNU DECODER GAL TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// mbu_decoder_gal_tb.v -- MBU Decoder GAL Testbench
//
// Copyright © 2011-2021 Alexios Chouchoulas
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

`include "mbu.v"
`timescale 1ns/10ps

module mbu_decoder_gal_tb();
   wire [15:0] ir;
   wire [1:0]  idx;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      // $monitor ("t: %7d | %b > %b %b", $time, raddr, waddir, idx);
      $dumpfile ("vcd/mbu_decoder_gal_tb.vcd");
      $dumpvars (0, mbu_decoder_gal_tb);

      i = 1;
      #250;
      for (i = 0; i < 64; i = i + 1) begin
	 #63.5;
      end

      i = 1;
      #10000;
      
      for (i = 0; i < 2048; i = i + 64) begin
	 #63.5;
      end
      
      i = 1;
      #10000;

      for (i = 0; i < 65536; i = i + 1) begin
	 #63.5;
      end
      
      #500 $display("345 OK");
      $finish;
   end // initial begin

   wire [4:0] raddr;
   wire [4:0] waddr;
   wire       clk4;
   wire       nrmbn;		// Put MBn on IBus
   wire       nrmbp;		// Put MBP (MB0) on IBus
   wire       nrctx;		// Put CTX on IBus
   wire       nwmbn;		// Write IBus to MBn
   wire       nwmbp;		// Write IBus to MBp
   wire       nwctx;		// Write IBus to CTX 
   wire       nwar;		// One of the four write_ar_xx strobes

   assign raddr = i[5:0];
   assign waddr = i[10:6];
   assign clk4 = i[0];
   
   // Connect DUT to test bench
   mbu_decoder_gal mbu_decoder_gal (.raddr(raddr), .waddr(waddr), .clk4(clk4),
				    .nrmbn(nrmbn), .nrmbp(nrmbp), .nrctx(nrctx),
				    .nwmbn(nwmbn), .nwmbp(nwmbp), .nwctx(nwctx), .nwar(nwar)
				    );
   
   // Verify our findings.
   reg [8191:0] msg, what;
   reg [1:0] 	correct_idx;
   reg [2:0] 	rval;
   reg [3:0] 	wval;
   
   always @ (raddr) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // Ensure raddr is sane.
	 if ((raddr[4] !== 1'b0 && raddr[4] !== 1'b1) ||
   	     (raddr[3] !== 1'b0 && raddr[3] !== 1'b1) ||
   	     (raddr[2] !== 1'b0 && raddr[2] !== 1'b1) ||
   	     (raddr[1] !== 1'b0 && raddr[1] !== 1'b1) ||
   	     (raddr[0] !== 1'b0 && raddr[0] !== 1'b1)) begin
   	    $sformat(msg, "testbench bug: raddr=%b", raddr);
	 end


	 // val: nrmbn, nrmbp, nrctx
   	 casex (raddr)
   	   5'b11011: begin rval = 3'b0_1_1; $sformat(what, "nrmbn should decode"); end
   	   5'b11100: begin rval = 3'b1_0_1; $sformat(what, "nrmbp should decode"); end
   	   5'b11101: begin rval = 3'b1_1_0; $sformat(what, "nrctx should decode (1)"); end
   	   5'b11110: begin rval = 3'b1_1_0; $sformat(what, "nrctx should decode (2)"); end

   	   5'b?????: begin rval = 3'b1_1_1; $sformat(what, "no read should decode"); end
	 endcase // casex ({ waddr, clk4 })

	 if ({nrmbn, nrmbp, nrctx} !== rval) begin
   	    $sformat(msg, "raddr decoding failure: %0s (raddr=%b, rval=%b != %b_%b_%b)", what, raddr, rval, nrmbn, nrmbp, nrctx);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: (%0s)", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK raddr");
      end // always @ (raddr)
   end // always @ (raddr)

   always @ (waddr, clk4) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

   	 // Ensure waddr and clk4 are sane.
   	 if ((waddr[4] !== 1'b0 && waddr[4] !== 1'b1) ||
   	     (waddr[3] !== 1'b0 && waddr[3] !== 1'b1) ||
   	     (waddr[2] !== 1'b0 && waddr[2] !== 1'b1) ||
   	     (waddr[1] !== 1'b0 && waddr[1] !== 1'b1) ||
   	     (waddr[0] !== 1'b0 && waddr[0] !== 1'b1)) begin
   	    $sformat(msg, "testbench bug: waddr=%b", waddr);
   	 end

   	 if ((clk4 !== 1'b0 && clk4 !== 1'b1)) begin
   	    $sformat(msg, "testbench bug: waddr=%b", waddr);
   	 end

   	 // val: nwmbn, nwmbp, nwctx, nwar
   	 casex ({ waddr, clk4 })
   	   6'b001??_0: begin wval = 4'b1110; $sformat(what, "nwar should decode"); end
   	   6'b11011_0: begin wval = 4'b0111; $sformat(what, "nwmbn should decode"); end
   	   6'b11100_0: begin wval = 4'b1011; $sformat(what, "nwmbp should decode"); end
   	   6'b11101_0: begin wval = 4'b1101; $sformat(what, "nwctx should decode (1)"); end
   	   6'b11110_0: begin wval = 4'b1101; $sformat(what, "nwctx should decode (2)"); end

   	   6'b?????_0: begin wval = 4'b1111; $sformat(what, "no write should decode"); end
   	   6'b?????_1: begin wval = 4'b1111; $sformat(what, "clk4 high, writes should be idle"); end
   	 endcase // casex ({ waddr, clk4 })

   	 if ({nwmbn, nwmbp, nwctx, nwar} !== wval[3:0]) begin
   	    $sformat(msg, "waddr decoding failure: %0s (waddr=%b, clk4=%b, wval=%b)", what, waddr, clk4, wval);
   	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: (%0s)", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK waddr");
      end

   end
endmodule // mbu_decoder_gal_tb

// End of file.
