///////////////////////////////////////////////////////////////////////////////
//
// PB2-AC-test.v -- Processor Board B, AC register test
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

`include "../PB2-AC.v"

`timescale 1ns/10ps

module PB2_AC_test();

   reg         nreset;
   wire [15:0] ibus;
   reg [15:0]  ibus_drv;
   reg 	       nrac;
   reg 	       nwac;
   reg 	       nstpac;
   reg 	       ndec;

   wire [15:0] ac;
   wire        reset;
   wire        naccpl;
   wire        fn;
   wire        fz;

   integer     i, j;

   reg 	       cor, cor_z, cor_n;
   reg [15:0]  cor_bus;

   assign ibus = ibus_drv;

   always @(nrac, nwac) begin
      if (nrac == 0 && nwac == 0) begin
   	 $display("%s: [fail] RAC# and WAC# asserted concurrently (testbench error).",
   		  `TESTNAME);
   	 $display ("%s: [fail] testbench error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(ibus, nwac) begin
      cor_bus = ibus;
      if (nwac == 0) begin
	 #30 if (ac !== cor_bus) begin
   	    $display("%s: [fail] AC should be %04h (%b), was %4h (%b) instead.",
   		     `TESTNAME, cor_bus, cor_bus, ac, ac);
   	    $display ("%s: [fail] AC latch failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (ibus, nwac)

   always @(ac, nrac) begin
      if (nrac == 0) begin
	 #30 if (ac !== ibus) begin
   	    $display("%s: [fail] AC is %4h (%b), but saw %4h (%b) on IBUS instead.",
   		     `TESTNAME, ac, ac, ibus, ibus);
   	    $display ("%s: [fail] AC drive failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (ibus, nwac)

   always @(negedge nstpac) begin
      if (ndec) begin
	 cor_bus = (ac + 1) & 65535;
	 #200 if (ac !== cor_bus) begin
   	    $display("%s: [fail] AC should increment to %4h, was %4h instead.",
   		     `TESTNAME, cor_bus, ac);
   	    $display ("%s: [fail] AC increment failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end else begin
	 cor_bus = (ac - 1) & 65535;
	 #200 if (ac !== cor_bus) begin
   	    $display("%s: [fail] AC should decrement to %4h, was %4h instead.",
   		     `TESTNAME, cor_bus, ac);
   	    $display ("%s: [fail] AC decrement failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (negedge nstpac)

   // Check the Z and N flags
   always @(fz, fn) begin
      cor_z = ac ? 0 : 1;
      if (nreset) begin
   	 if (fn !== ac[15]) begin
   	    $display("%s: [fail] AC was %4h, but FN was %b (should be %b).",
   		     `TESTNAME, ac, fn, ac[15]);
   	    $display ("%s: [fail] FN evaluation failure.", `TESTNAME);
   	    #100 $finish;
   	 end
	 
   	 #50 if (fz !== cor_z) begin
   	    $display("%s: [fail] AC was %4h, but FZ was %b (should be %b).",
   		     `TESTNAME, ac, fz, cor_z);
   	    $display ("%s: [fail] FZ evaluation failure.", `TESTNAME);
   	    #100 $finish;
   	 end
      end // if (nreset)
   end // always @ (fz, fn)

   // Check the L outputs
   always @(posedge nstpac) begin
      if (ndec && ac == 65535) begin
	 #70 if (naccpl) begin
   	    $display("%s: [fail] AC incremented from FFFF, but ACCPL# did not strobe.",
   		     `TESTNAME);
   	    $display ("%s: [fail] ACCPL# failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end else if (ndec == 0 && ac == 0) begin
	 #70 if (naccpl) begin
   	    $display("%s: [fail] AC decremented from 0000, but ACCPL# did not strobe.",
   		     `TESTNAME);
   	    $display ("%s: [fail] ACCPL# failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (posedge nstpac)

   // Ensure ACCPL# never assert (except as above)
   always @(negedge naccpl) begin
      #70 if (ac !== 0 && ac !== 65535) begin
   	 $display("%s: [fail] ACCPL# strobed spuriously (AC=%04h).",
   		  `TESTNAME, ac);
   	 $display ("%s: [fail] ACCPL# failure.", `TESTNAME);
   	 #100 $finish;
      end
   end

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB2-AC-test.vcd");
      $dumpvars (0, PB2_AC_test);
`endif

      // Reset and initialise
      nreset <= 0;
      ibus_drv <= 16'bzzzzzzzzzzzzzzzz;
      nrac <= 1;
      nwac <= 1;
      nstpac <= 1;
      ndec <= 1;
      
      #500 nreset <= 1;

      for (i = 0; i < 65536; i = i + 1) begin

	 ibus_drv <= i;
	 nwac <= 0;
	 #62 nwac <= 1;
	 #5 ibus_drv <= 16'bzzzzzzzzzzzzzzzz;

	 #25 if (ibus != 16'bzzzzzzzzzzzzzzzz) begin
   	    $display("%s: [fail] IBUS should be tri-stated, was %4h (%b), WAC#=%b, RAC#=%b.",
   		     `TESTNAME, ibus, ibus, nwac, nrac);
   	    $display ("%s: [fail] AC driving with RAC# de-asserted.", `TESTNAME);
   	    #100 $finish;
	 end

	 #95 nrac <= 0;
	 #20 if (ibus !== i) begin
   	    $display("%s: [fail] IBUS should be %4h, was %4h (%b).",
   		     `TESTNAME, i[15:0], ibus, ibus);
   	    $display ("%s: [fail] AC registration error.", `TESTNAME);
   	    #100 $finish;
	 end
	 #42 nrac <= 1;

	 // Increment
	 #63 for (j = 0; j < 128; j = j + 1) begin
	    #187 nstpac <= 0;
	    #63 nstpac <= 1;
	 end

	 // Decrement
	 #63 ndec <= 0;
	 for (j = 0; j < 128; j = j + 1) begin
	    #187 nstpac <= 0;
	    #63 nstpac <= 1;
	 end

	 #95 ndec <= 1;

	 if (i % 1024 == 0) begin
	    $display("%s: [ok] Pass (AC, %2d/64).", `TESTNAME, 1 + (i[15:0] / 1024));
	 end
      end // for (i = 0; i < 65536; i = i + 1)

      // Test increments
      #10000 for (j = 0; j < 8; j = j + 1) begin
	 #1000 ndec <= ~j[0];
	 #1000 for (i = 0; i < 65536; i = i + 1) begin
	    #187 nstpac <= 0;
	    #63 nstpac <= 1;
	 end
	 if (ndec) 
	   $display("%s: [ok] Pass (AC increment, %1d/8).", `TESTNAME, j + 1);
	 else
	   $display("%s: [ok] Pass (AC decrement, %1d/8).", `TESTNAME, j + 1);
      end
      
      #5000 ;
      $display("%s: [ok] Pass (AC).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   not #6 (reset, nreset);
   PB2_AC dut(.reset(reset),
			    .nrac(nrac),
			    .nwac(nwac),
			    .nstpac(nstpac),
			    .ndec(ndec),
			    .ibus(ibus),
			    .ac(ac),
			    .naccpl(naccpl),
			    .fn(fn),
			    .fz(fz));
			  
endmodule // PB1_IR_test

// End of file.
