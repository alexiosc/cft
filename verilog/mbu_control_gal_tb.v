///////////////////////////////////////////////////////////////////////////////
//
// MNU CONTROL GAL TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// mbu_control_gal_tb.v -- MBU Decoder GAL Testbench
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

module mbu_control_gal_tb();
   wire [15:0] ir;
   wire [1:0]  idx;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t rst oe cs q");	
      // $monitor ("t: %7d | %b > %b %b", $time, raddr, waddir, idx);
      $dumpfile ("vcd/mbu_control_gal_tb.vcd");
      $dumpvars (0, mbu_control_gal_tb);

      i = 0;
      #250;
      for (i = 0; i < 4096; i = i + 1) begin
	 #63.5;
      end
      
      #500 $display("345 OK");
      $finish;
   end // initial begin

   wire       ndis;
   wire       nrmbp;
   wire       nrmbn;
   wire       nwar;
   wire       nidxen;
   wire       nwmbp;
   wire       nwmbn;
   wire [1:0] raddr1_0;
   wire [2:0] ir2_0;
   wire [2:0] a;
   wire       nibusen;
   wire       noe;
   wire       nwe;

   assign { ndis, nrmbp, nrmbn, nwar, nidxen, nwmbp, nwmbn, raddr1_0, ir2_0 } = i;
   
   // Connect DUT to test bench
   mbu_control_gal mbu_control_gal (
				    .ndis(ndis),
				    .nrmbp(nrmbp),
				    .nrmbn(nrmbn),
				    .nwar(nwar),
				    .nidxen(nidxen),
				    .nwmbp(nwmbp),
				    .nwmbn(nwmbn),
				    .raddr1_0(raddr1_0),
				    .ir2_0(ir2_0),
				    .a(a),
				    .nibusen(nibusen),
				    .noe(noe),
				    .nwe(nwe)
				    );
   
   // Verify our findings.
   reg [8191:0] msg, what;
   reg [5:0] 	vec;
   
   always @ (i) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 // val: nrmbn, nrmbp, nrctx
   	 casex ({ndis, nrmbp, nrmbn, nwar, nidxen, nwmbp, nwmbn, raddr1_0, ir2_0})
	   12'b0_?_?_?_?_?_?_??_???: begin vec = 6'b000_1_1_1; $sformat(what, "should be idle when disabled"); end
	   12'b1_1_1_1_?_1_1_??_???: begin vec = 6'b000_1_0_1; $sformat(what, "enabled, read MB0"); end
	   
	   12'b1_0_1_1_?_1_1_??_???: begin vec = 6'b000_0_0_1; $sformat(what, "nread_mbp"); end
	   
	   12'b1_1_0_1_?_1_1_??_000: begin vec = 6'b000_0_0_1; $sformat(what, "nread_mbn, a=0"); end
	   12'b1_1_0_1_?_1_1_??_001: begin vec = 6'b001_0_0_1; $sformat(what, "nread_mbn, a=1"); end
	   12'b1_1_0_1_?_1_1_??_010: begin vec = 6'b010_0_0_1; $sformat(what, "nread_mbn, a=2"); end
	   12'b1_1_0_1_?_1_1_??_011: begin vec = 6'b011_0_0_1; $sformat(what, "nread_mbn, a=3"); end
	   12'b1_1_0_1_?_1_1_??_100: begin vec = 6'b100_0_0_1; $sformat(what, "nread_mbn, a=4"); end
	   12'b1_1_0_1_?_1_1_??_101: begin vec = 6'b101_0_0_1; $sformat(what, "nread_mbn, a=5"); end
	   12'b1_1_0_1_?_1_1_??_110: begin vec = 6'b110_0_0_1; $sformat(what, "nread_mbn, a=6"); end
	   12'b1_1_0_1_?_1_1_??_111: begin vec = 6'b111_0_0_1; $sformat(what, "nread_mbn, a=7"); end

	   12'b1_1_1_0_1_1_1_00_???: begin vec = 6'b000_1_0_1; $sformat(what, "write_ar_mbp, a=0"); end
	   12'b1_1_1_0_1_1_1_01_???: begin vec = 6'b001_1_0_1; $sformat(what, "write_ar_mbd, a=1"); end
	   12'b1_1_1_0_1_1_1_10_???: begin vec = 6'b010_1_0_1; $sformat(what, "write_ar_mbs, a=2"); end
	   12'b1_1_1_0_1_1_1_11_???: begin vec = 6'b011_1_0_1; $sformat(what, "write_ar_mbz, a=3"); end

	   12'b1_1_1_0_0_1_1_??_000: begin vec = 6'b000_1_0_1; $sformat(what, "read MB0 index reg"); end
	   12'b1_1_1_0_0_1_1_??_001: begin vec = 6'b001_1_0_1; $sformat(what, "read MB1 index reg"); end
	   12'b1_1_1_0_0_1_1_??_010: begin vec = 6'b010_1_0_1; $sformat(what, "read MB2 index reg"); end
	   12'b1_1_1_0_0_1_1_??_011: begin vec = 6'b011_1_0_1; $sformat(what, "read MB3 index reg"); end
	   12'b1_1_1_0_0_1_1_??_100: begin vec = 6'b100_1_0_1; $sformat(what, "read MB4 index reg"); end
	   12'b1_1_1_0_0_1_1_??_101: begin vec = 6'b101_1_0_1; $sformat(what, "read MB5 index reg"); end
	   12'b1_1_1_0_0_1_1_??_110: begin vec = 6'b110_1_0_1; $sformat(what, "read MB6 index reg"); end
	   12'b1_1_1_0_0_1_1_??_111: begin vec = 6'b111_1_0_1; $sformat(what, "read MB7 index reg"); end

	   12'b1_1_1_1_?_0_1_??_???: begin vec = 6'b000_1_1_0; $sformat(what, "nwrite_mbp"); end

	   12'b1_1_1_1_?_1_0_??_000: begin vec = 6'b000_1_1_0; $sformat(what, "nwrite_MBN, a=0"); end
	   12'b1_1_1_1_?_1_0_??_001: begin vec = 6'b001_1_1_0; $sformat(what, "nwrite_MBN, a=1"); end
	   12'b1_1_1_1_?_1_0_??_010: begin vec = 6'b010_1_1_0; $sformat(what, "nwrite_MBN, a=2"); end
	   12'b1_1_1_1_?_1_0_??_011: begin vec = 6'b011_1_1_0; $sformat(what, "nwrite_MBN, a=3"); end
	   12'b1_1_1_1_?_1_0_??_100: begin vec = 6'b100_1_1_0; $sformat(what, "nwrite_MBN, a=4"); end
	   12'b1_1_1_1_?_1_0_??_101: begin vec = 6'b101_1_1_0; $sformat(what, "nwrite_MBN, a=5"); end
	   12'b1_1_1_1_?_1_0_??_110: begin vec = 6'b110_1_1_0; $sformat(what, "nwrite_MBN, a=6"); end
	   12'b1_1_1_1_?_1_0_??_111: begin vec = 6'b111_1_1_0; $sformat(what, "nwrite_MBN, a=7"); end

	   12'b1_?_?_?_?_?_?_??_???: begin vec = 6'b000_1_0_1; $sformat(what, "safety interlock, read MB0"); end
	 endcase // casex ({ waddr, clk4 })

	 if ({a, nibusen, noe, nwe} !== vec) begin
   	    $sformat(msg, "failure: %0s", what);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: (%0s)", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK MBU control");
      end // always @ (raddr)
   end // always @ (raddr)
endmodule // mbu_control_gal_tb


// End of file.
