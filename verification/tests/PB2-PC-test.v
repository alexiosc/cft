///////////////////////////////////////////////////////////////////////////////
//
// PB2-PC-test.v -- Processor Board B, PC register test
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

`include "../PB2-PC.v"

`timescale 1ns/10ps

module PB2_PC_test();

   reg         nreset;
   wire [15:0] ibus;
   reg [15:0]  ibus_drv;
   reg 	       nrpc;
   reg 	       nwpc;
   reg 	       nincpc;

   wire [15:0] pc;
   wire        reset;

   integer     i, j;

   reg 	       cor;
   reg [15:0]  cor_bus;

   assign ibus = ibus_drv;

   always @(nrpc, nwpc) begin
      if (nrpc == 0 && nwpc == 0) begin
   	 $display("%s: [fail] RPC# and WPC# asserted concurrently (testbench error).",
   		  `TESTNAME);
   	 $display ("%s: [fail] testbench error.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(ibus, nwpc) begin
      cor_bus = ibus;
      if (nwpc == 0) begin
	 #30 if (pc !== cor_bus) begin
   	    $display("%s: [fail] PC should be %04h (%b), was %4h (%b) instead.",
   		     `TESTNAME, cor_bus, cor_bus, pc, pc);
   	    $display ("%s: [fail] PC latch failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (ibus, nwpc)

   always @(pc, nrpc) begin
      if (nrpc == 0) begin
	 #30 if (pc !== ibus) begin
   	    $display("%s: [fail] PC is %4h (%b), but saw %4h (%b) on IBUS instead.",
   		     `TESTNAME, pc, pc, ibus, ibus);
   	    $display ("%s: [fail] PC drive failure.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end // always @ (ibus, nwpc)

   always @(negedge nincpc) begin
      cor_bus = (pc + 1) & 65535;
      #200 if (pc !== cor_bus) begin
   	 $display("%s: [fail] PC should increment to %4h, was %4h instead.",
   		  `TESTNAME, cor_bus, pc);
   	 $display ("%s: [fail] PC increment failure.", `TESTNAME);
   	 #100 $finish;
      end
   end

   initial begin
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB2-PC-test.vcd");
      $dumpvars (0, PB2_PC_test);
`endif

      // Reset and initialise
      nreset <= 0;
      ibus_drv <= 16'bzzzzzzzzzzzzzzzz;
      nrpc <= 1;
      nwpc <= 1;
      nincpc <= 1;
      
      #500 nreset <= 1;

      for (i = 0; i < 65536; i = i + 1) begin

	 ibus_drv <= i;
	 nwpc <= 0;
	 #62 nwpc <= 1;
	 #5 ibus_drv <= 16'bzzzzzzzzzzzzzzzz;

	 #25 if (ibus != 16'bzzzzzzzzzzzzzzzz) begin
   	    $display("%s: [fail] IBUS should be tri-stated, was %4h (%b), WPC#=%b, RPC#=%b.",
   		     `TESTNAME, ibus, ibus, nwpc, nrpc);
   	    $display ("%s: [fail] PC driving with RPC# de-asserted.", `TESTNAME);
   	    #100 $finish;
	 end

	 #95 nrpc <= 0;
	 #20 if (ibus !== i) begin
   	    $display("%s: [fail] IBUS should be %4h, was %4h (%b).",
   		     `TESTNAME, i[15:0], ibus, ibus);
   	    $display ("%s: [fail] PC registration error.", `TESTNAME);
   	    #100 $finish;
	 end
	 #42 nrpc <= 1;

	 #63 for (j = 0; j < 256; j = j + 1) begin
	    #187 nincpc <= 0;
	    #63 nincpc <= 1;
	 end

	 #95 ;

	 if (i % 1024 == 0) begin
	    $display("%s: [ok] Pass (PC, %2d/64).", `TESTNAME, 1 + (i[15:0] / 1024));
	 end
      end // for (i = 0; i < 65536; i = i + 1)

      // Test increments
      #10000 for (j = 0; j < 8; j = j + 1) begin
	 for (i = 0; i < 65536; i = i + 1) begin
	    #187 nincpc <= 0;
	    #63 nincpc <= 1;
	 end
	 $display("%s: [ok] Pass (PC increment, %1d/8).", `TESTNAME, j + 1);
      end
      
      #5000 ;
      $display("%s: [ok] Pass (PC).", `TESTNAME);
      #500 $finish;      // Terminate simulation
      
   end // initial begin

   not #6 (reset, nreset);
   PB2_PC dut(.reset(reset),
			    .nrpc(nrpc),
			    .nwpc(nwpc),
			    .nincpc(nincpc),
			    .ibus(ibus),
			    .pc(pc));
			  
endmodule // PB1_IR_test

// End of file.
