///////////////////////////////////////////////////////////////////////////////
//
// MAJOR REGISTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// reg_major_tb.v -- Major Register Testbench
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

`include "reg_major.v"
`timescale 1ns/10ps

module reg_major_tb();
   reg         reset;
   reg [15:0]  ibus;
   reg         nread;
   reg         nwrite;
   reg 	       ninc;
   reg 	       ndec;
   wire [15:0] out;

   wire        fz;
   wire        fn;
   wire        naccpl;
   
   reg 	       nfpl;
   reg 	       nfph;
   wire [7:0]  fpd;

   integer    i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t oe1 oe2 a y");	
      $monitor ("%d | %b %b %b %b %b %h > %h %h %b %b %b | %b %b %h", $time,
		reset, nread, nwrite, ninc, ndec, ibus,
		ibus_real, out, fz, fn, naccpl,
		nfpl, nfph, fpd);
      $dumpfile ("vcd/reg_major_tb.vcd");
      $dumpvars (0, reg_major_tb);

      reset = 1;
      nread = 1;
      nwrite = 1;
      ninc = 1;
      ndec = 1;
      nfpl = 1;
      nfph = 1;
      ibus = 16'bzzzzzzzzzzzzzzzz;

      // To properly cover the register we need to test:
      // * Resets
      // * Reads
      // * Writes
      // * Increments
      // * Decrements
      //
      // We'll be using 250ns delays because that's the maximum
      // frequency of strobes coming in from the control unit.

      // Test reset
      #250 reset = 0;		// Should be zero
      #250 ibus = 16'h5678;
      #250 nwrite = 0;
      #63.5 nwrite = 1;
      #186.5 ibus = 16'hZZZZ;	// Shoul be 5678
      #250 reset = 1;
      #63.5 reset = 0;		// Should be zero again.

      // Test writes and reads. The Control Unit ‘guarantees’ (via
      // microcode) that a read and write can't be asserted
      // simultaneously.
      for (i = 0; i < 65536 ; i = i + 1) begin
      	 #63.5 ibus = i ^ 16'h1234;	// Mix up the values a little bit.
      	 #63.5 nwrite = 0;
      	 #63.5 nwrite = 1;
      	 #63.5 ibus = 16'hZZZZ;
      	 #63.5 nread = 0;
      	 #63.5 nread = 1;
      end

      // Test increments
      for (i = 0; i < 65540 ; i = i + 1) begin
      	 #186.5 ninc = 0;
      	 #63.5 ninc = 1;
      end

      // Test decrements
      for (i = 0; i < 65540 ; i = i + 1) begin
	 #186.5 ndec = 0;
	 #63.5 ndec = 1;
      end

      #1000 $finish;      // Terminate simulation
   end // initial begin

   // Asynchronous Front Panel functionality
   always begin
      #1937 nfpl = 0;		// 1937 is prime, and so is 1937+30+30
      #30 nfpl = 1; 
      nfph = 0;
      #30 nfph = 1;
   end

   wire [15:0] ibus_real = ibus;
   assign ibus_real = ibus;

   // Connect DUT to test bench
   reg_major reg_major (.reset(reset), .ibus(ibus_real),
			.nread(nread), .nwrite(nwrite),
			.ninc(ninc), .ndec(ndec), .out(out),
			.fz(fz), .fn(fn), .naccpl(naccpl),
			.nfpl(nfpl), .nfph(nfph), .fpd(fpd));
endmodule // reg_major_tb

// End of file.
