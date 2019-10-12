///////////////////////////////////////////////////////////////////////////////
//
// TEST THE ADDRESS REGISTER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_ar_tb.v -- Address Register testbench
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

`include "reg_ar.v"
`timescale 1ns/10ps

module reg_ar_tb();
   reg          nmem;
   reg          nio;
   reg [7:0]    aext;
   reg [15:0]   ibus;
   wire [15:0] 	ibus_real;

   wire [23:0] 	ab;

   reg 		nwrite_ar;
   reg 		nfparh;
   wire [7:0] 	fpd;

   wire 	nsysdev;
   wire 	niodev1xx;
   wire 	niodev2xx;
   wire 	niodev3xx;
   
   integer    i;
   
   // Initialize all variables
   initial begin
      $monitor ("%d | %b %b %h:%h > %h %b %b %b %b | %b > %h", $time,
		nmem, nio, aext, ibus, nwrite_ar,
		ab, nsysdev, niodev1xx, niodev2xx, niodev3xx,
		nfparh, fpd);
      $dumpfile ("vcd/reg_ar_tb.vcd");
      $dumpvars (0, reg_ar_tb);

      aext = 8'd0;
      ibus = 16'h0000;
      nwrite_ar = 1;
      nmem = 1;
      nfparh = 1;

      // Simulate reset
      //#250 nreset = 1;

      // First, test I/O transactions because they're easier. We only
      // have 1,024 I/O addresses, but test up to 2,048. NOTE: there's
      // a '138 glitch that causes a spurious nsysdev strobe 
      for (i = 0; i < 2048; i = i + 37) begin
	 #62.5 ibus = i[15:0];
	 aext = 8'd0;
	 nwrite_ar = 0;
	 #62.5 nwrite_ar = 1;
	 nio = 0;
	 #125 nio = 1;
      end

      #2000;
      
      // Now to some of the memory. We'll just do 256K in big
      // increments. Should be enough!
      for (i = 0; i < 262144; i = i + 3169) begin
	 #62.5 ibus = i[15:0];
	 aext = i[23:16];
	 nwrite_ar = 0;
	 #62.5 nwrite_ar = 1;
	 nmem = 0;
	 #125 nmem = 1;
      end
      
      #2000 $display("OK");
      $finish;      // Terminate simulation
   end // initial begin

   // Load the IR every now and then
   // always begin
   //    #1000 nwrite_ir = 0;
   //    #63.5 nwrite_ir = 1;
   // end

   assign ibus_real = ibus;

   // Asynchronous Front Panel functionality
   always begin
      #229 nfparh = 0;		// 1937 is prime, and so is 1937+30+30
      #250 nfparh = 1;
   end

   // Connect DUT to test bench
   reg_ar reg_ar (.nmem(nmem),
		  .nio(nio),
		  .ibus(ibus_real),
		  .aext(aext),
		  .nwrite_ar(nwrite_ar),
		  .ab(ab),
		  .nsysdev(nsysdev),
		  .niodev1xx(niodev1xx),
		  .niodev2xx(niodev2xx),
		  .niodev3xx(niodev3xx),
		  .nfparh(nfparh),
		  .fpd(fpd));

endmodule // reg_ar_tb

// End of file.
