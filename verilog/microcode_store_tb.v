// REDESIGNED IN 2019
//
// microcode-store_tb.v -- Testbench for Microcode ROMs
//
// Copyright © 2011-2019 Alexios Chouchoulas

`include "microcode_store.v"

`timescale 1ns/10ps

module microcode_store_tb();
   reg nreset;
   reg nhalt;
   
   reg [18:0] uaddr;

   wire [23:0] udata;

   // Front panel handling      
   reg 	        nfpua0;
   reg 	        nfpuc0;
   reg 	        nfpuc1;
   reg 	        nfpuc2;
   wire [7:0]   fpd;

   initial begin
      
      //$display ("time\t d pulse");
      $monitor ("t: %7d | %b %b %h > %h | %b %b %b %b > %h", $time,
		nreset, nhalt, uaddr, udata,
		nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);
      $dumpfile ("vcd/microcode_store_tb.vcd");
      $dumpvars (0, microcode_store_tb);

      nreset = 1'b0;
      nhalt = 1'b1;
      uaddr = 24'b1100000000000000000; // That's where the good stuff starts.

      nfpua0 = 1;
      nfpuc0 = 1;
      nfpuc1 = 1;
      nfpuc2 = 1;

      // Make sure we're not counting during reset.
      #1000 nreset = 1'b1;

      #1000 nhalt = 1'b0;
      #1000 nhalt = 1'b1;

      #500000 $finish;
      
   end // initial begin

   // Simulate a realistic fast clock
   always begin
      #250 uaddr = uaddr + 1;
   end

   // Asynchronous Front Panel functionality. 1817 + 4×30 = 1937 which
   // is prime. This makes it a more realistic test. (the CFT and FP
   // clock domains being out of phase)
   always begin
      #1817 nfpua0 = 0;
      #30   nfpua0 = 1; 
            nfpuc0 = 0;
      #30   nfpuc0 = 1; 
            nfpuc1 = 0;
      #30   nfpuc1 = 1; 
            nfpuc2 = 0;
      #30   nfpuc2 = 1;
   end

   microcode_store microcode_store(.nreset(nreset), .nhalt(nhalt), .uaddr(uaddr),
				   .udata(udata),
				   .nfpua0(nfpua0),
				   .nfpuc0(nfpuc0), 
				   .nfpuc1(nfpuc1),
				   .nfpuc2(nfpuc2),
				   .fpd(fpd));
   
endmodule // microcode_store_tb

// End of file.
