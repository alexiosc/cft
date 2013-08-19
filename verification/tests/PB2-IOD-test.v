///////////////////////////////////////////////////////////////////////////////
//
// PB2-IOD-test.v -- Processor Board B, I/O Address Decoder test
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

`include "../PB2-AR.v"
`include "../PB2-IOD.v"

`timescale 1ns/10ps

module PB2_IOD_test();

   reg 	       nreset;
   reg [15:0]  ibus;
   reg 	       nwar;
   reg 	       nio;

   wire        naben;
   wire [15:0] ar, ab;

   wire        nsysdev;
   wire        niodev1xx;
   wire        niodev2xx;
   wire        niodev3xx;

   integer     i, j;
   reg 	       cor0, cor1, cor2, cor3;

   always @(ar, nio) begin
      if (nio == 0) begin
	 #40 begin
	    cor0 = (ar < 256) ? 0 : 1;
	    cor1 = (ar >= 256 && ar < 512) ? 0 : 1;
	    cor2 = (ar >= 512 && ar < 768) ? 0 : 1;
	    cor3 = (ar >= 768 && ar < 1024) ? 0 : 1;

	    if (nsysdev !== cor0) begin
   	       $display("%s: [fail] SYSDEV# should be %b, was %b (IO#=%b, AR=%4x).",
   			`TESTNAME, cor0, nsysdev, nio, ar);
   	       $display ("%s: [fail] address decoding error.", `TESTNAME);
   	       #100 $finish;
	    end
	    
	    if (niodev1xx !== cor1) begin
   	       $display("%s: [fail] IODEV1XX# should be %b, was %b (IO#=%b, AR=%4x).",
   			`TESTNAME, cor1, niodev1xx, nio, ar);
   	       $display ("%s: [fail] address decoding error.", `TESTNAME);
   	       #100 $finish;
	    end
	    
	    if (niodev2xx !== cor2) begin
   	       $display("%s: [fail] IODEV2XX# should be %b, was %b (IO#=%b, AR=%4x).",
   			`TESTNAME, cor2, niodev2xx, nio, ar);
   	       $display ("%s: [fail] address decoding error.", `TESTNAME);
   	       #100 $finish;
	    end
	    
	    if (niodev3xx !== cor3) begin
   	       $display("%s: [fail] IODEV3XX# should be %b, was %b (IO#=%b, AR=%4x).",
   			`TESTNAME, cor3, niodev3xx, nio, ar);
   	       $display ("%s: [fail] address decoding error.", `TESTNAME);
   	       #100 $finish;
	    end
	    
	 end
      end
   end

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB2-IOD-test.vcd");
      $dumpvars (0, PB2_IOD_test);
`endif

      // Reset and initialise
      nreset <= 0;
      ibus <= 16'bzzzzzzzzzzzzzzzz;
      nwar <= 1;
      nio <= 1;

      #500 nreset <= 1;
      #2000;

      
      for (i = 0; i < 65536; i = i + 1) begin

	 #20 ibus <= i;
	 nwar <= 0;
	 #30 nwar <= 1;
	 ibus <= 16'bzzzzzzzzzzzzzzzz;
	 #33 begin
	    nio <= 0;
	    // j < 3 <==> MEM# or IO# asserted
	    #20 if (ab !== i) begin
   	       $display("%s: [fail] Address Bus should be %4h, was %4h (%b).",
   			`TESTNAME, i[15:0], ab, ab);
   	       $display ("%s: [fail] IOD registration error.", `TESTNAME);
   	       #100 $finish;
	    end
	 end
	 #187 begin
	    nio <= 1;
	    #20 if (ab !== 16'bzzzzzzzzzzzzzzzz) begin
   	       $display("%s: [fail] Address Bus failed to tri-state (IO#=%b).",
   			`TESTNAME, nio);
   	       $display ("%s: [fail] IOD tri-stating error.", `TESTNAME);
   	       #100 $finish;
	    end
	 end
      end // for (i = 0; i < 65536; i = i + 1)
      
      $display("%s: [ok] Pass (IOD).", `TESTNAME);
      
      #5000 ;
      $display("%s: [ok] Pass (IOD).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   PB2_AR AR(.ibus(ibus), .nwar(nwar),
	     .nmem(1), .nio(nio), .naben(naben),
	     .ar(ar),
	     .abus(ab));
   
   PB2_IOD dut(.nio(nio),
	       .ar(ar),
	       .nsysdev(nsysdev),
	       .niodev1xx(niodev1xx),
	       .niodev2xx(niodev2xx),
	       .niodev3xx(niodev3xx));
			  
endmodule // PB1_IR_test

// End of file.
