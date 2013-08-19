///////////////////////////////////////////////////////////////////////////////
//
// PB2-DR-test.v -- Processor Board B, DR register test
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

`include "../PB2-DR.v"

`timescale 1ns/10ps

module PB2_DR_test();

   reg         nreset;
   wire [15:0] ibus;
   reg [15:0]  ibus_drv;
   reg 	       nrdr;
   reg 	       nwdr;
   reg 	       nstpdr;
   reg 	       ndec;

   wire [15:0] dr;
   wire        reset;

   integer     i, j;

   reg 	       cor;
   reg [15:0]  cor_bus;

   assign ibus = ibus_drv;

   always @(nrdr, nwdr) begin
      if (nrdr == 0 && nwdr == 0) begin
   	 $display("%s: [fail] RDR# and WDR# asserted concurrently (testbench error).",
   		  `TESTNAME);
   	 $display ("%s: [fail] testbench error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(ibus, nwdr) begin
      cor_bus = ibus;
      if (nwdr == 0) begin
	 #30 if (dr !== cor_bus) begin
   	    $display("%s: [fail] DR should be %04h (%b), was %4h (%b) instead.",
   		     `TESTNAME, cor_bus, cor_bus, dr, dr);
   	    $display ("%s: [fail] DR latch failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (ibus, nwdr)

   always @(dr, nrdr) begin
      if (nrdr == 0) begin
	 #30 if (dr !== ibus) begin
   	    $display("%s: [fail] DR is %4h (%b), but saw %4h (%b) on IBUS instead.",
   		     `TESTNAME, dr, dr, ibus, ibus);
   	    $display ("%s: [fail] DR drive failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (ibus, nwdr)

   always @(negedge nstpdr) begin
      if (ndec) begin
	 cor_bus = (dr + 1) & 65535;
	 #200 if (dr !== cor_bus) begin
   	    $display("%s: [fail] DR should increment to %4h, was %4h instead.",
   		     `TESTNAME, cor_bus, dr);
   	    $display ("%s: [fail] DR increment failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end else begin
	 cor_bus = (dr - 1) & 65535;
	 #200 if (dr !== cor_bus) begin
   	    $display("%s: [fail] DR should decrement to %4h, was %4h instead.",
   		     `TESTNAME, cor_bus, dr);
   	    $display ("%s: [fail] DR decrement failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB2-DR-test.vcd");
      $dumpvars (0, PB2_DR_test);
`endif

      // Reset and initialise
      nreset <= 0;
      ibus_drv <= 16'bzzzzzzzzzzzzzzzz;
      nrdr <= 1;
      nwdr <= 1;
      nstpdr <= 1;
      ndec <= 1;
      
      #500 nreset <= 1;

      for (i = 0; i < 65536; i = i + 1) begin

	 ibus_drv <= i;
	 nwdr <= 0;
	 #62 nwdr <= 1;
	 #5 ibus_drv <= 16'bzzzzzzzzzzzzzzzz;

	 #25 if (ibus != 16'bzzzzzzzzzzzzzzzz) begin
   	    $display("%s: [fail] IBUS should be tri-stated, was %4h (%b), WDR#=%b, RDR#=%b.",
   		     `TESTNAME, ibus, ibus, nwdr, nrdr);
   	    $display ("%s: [fail] DR driving with RDR# de-asserted.", `TESTNAME);
   	    #100 $finish;
	 end

	 #95 nrdr <= 0;
	 #20 if (ibus !== i) begin
   	    $display("%s: [fail] IBUS should be %4h, was %4h (%b).",
   		     `TESTNAME, i[15:0], ibus, ibus);
   	    $display ("%s: [fail] DR registration error.", `TESTNAME);
   	    #100 $finish;
	 end
	 #42 nrdr <= 1;

	 // Increment
	 #63 for (j = 0; j < 128; j = j + 1) begin
	    #187 nstpdr <= 0;
	    #63 nstpdr <= 1;
	 end

	 // Decrement
	 #63 ndec <= 0;
	 for (j = 0; j < 128; j = j + 1) begin
	    #187 nstpdr <= 0;
	    #63 nstpdr <= 1;
	 end

	 #95 ndec <= 1;

	 if (i % 1024 == 0) begin
	    $display("%s: [ok] Pass (DR, %2d/64).", `TESTNAME, 1 + (i[15:0] / 1024));
	 end
      end // for (i = 0; i < 65536; i = i + 1)

      // Test increments
      #10000 for (j = 0; j < 8; j = j + 1) begin
	 #1000 ndec <= ~j[0];
	 #1000 for (i = 0; i < 65536; i = i + 1) begin
	    #187 nstpdr <= 0;
	    #63 nstpdr <= 1;
	 end
	 if (ndec) 
	   $display("%s: [ok] Pass (DR increment, %1d/8).", `TESTNAME, j + 1);
	 else
	   $display("%s: [ok] Pass (DR decrement, %1d/8).", `TESTNAME, j + 1);
      end
      
      #5000 ;
      $display("%s: [ok] Pass (DR).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   not #6 (reset, nreset);
   PB2_DR dut(.reset(reset),
			    .nrdr(nrdr),
			    .nwdr(nwdr),
			    .nstpdr(nstpdr),
			    .ndec(ndec),
			    .ibus(ibus),
			    .dr(dr));
			  
endmodule // PB1_IR_test

// End of file.
