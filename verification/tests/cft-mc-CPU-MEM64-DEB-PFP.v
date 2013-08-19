///////////////////////////////////////////////////////////////////////////////
//
// cft-mc-test.v -- CFT Machine Code Test (generic)
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

`include "../processor.v"
`include "../mem64k.v"
`include "../debugging-board.v"
`include "../front-panel.v"

`timescale 1ns/10ps


module cft_mc_test();

   
   wire [15:0] ab;
   wire [7:0]  aext;
   wire [15:0] db;
   
   wire        nmem;
   wire        nio;
   wire        nr;
   wire        nw;

   wire        nhalt;
   wire        nreset;
   wire        nsysdev;
   wire        niodev3xx;
   
   wire        clk1;
   wire        clk2;
   wire        clk3;
   wire        clk4;
   wire        nt34;
   
   reg 	       nreset_drv;

   integer     i;

   assign nreset = nreset_drv;

   // Command-line options
   //integer     have_MEM;


   reg [4096:0] vcd;
   integer 	timeout;


   // Check registers for invalid values
   always @(CPU.pb1.ir) begin
      if (nreset && (^CPU.pb1.ir == 1'bx || CPU.pb1.ir === {16{1'bz}})) begin
	 $display("ERROR: IR has invalid value (%b).", CPU.pb1.ir);
	 $display("%s: [fail] Processor mis-timing or contention.", `TESTNAME);
	 #100 $finish;
      end
   end
   always @(CPU.pb2.PBB_AR.ar) begin
      if (nreset && (^CPU.pb2.PBB_AR.ar == 1'bx || CPU.pb2.PBB_AR.ar === {16{1'bz}})) begin
	 $display("ERROR: AR has invalid value (%b).", CPU.pb2.PBB_AR.ar);
	 $display("%s: [fail] Processor mis-timing or contention.", `TESTNAME);
	 #100 $finish;
      end
   end
   always @(CPU.pb2.pc) begin
      #70 if (nreset && CPU.c2_nwpc &&
	  (^CPU.pb2.pc == 1'bx || CPU.pb2.pc === {16{1'bz}})) begin
	 $display("ERROR: PC has invalid value (%b).", CPU.pb2.pc);
	 $display("%s: [fail] Processor mis-timing or contention.", `TESTNAME);
	 #100 $finish;
      end
   end
   always @(CPU.pb2.dr) begin
      #70 if (nreset && CPU.c2_nwdr &&
	  (^CPU.pb2.dr == 1'bx || CPU.pb2.dr === {16{1'bz}})) begin
	 $display("ERROR: DR has invalid value (%b).", CPU.pb2.dr);
	 $display("%s: [fail] Processor mis-timing or contention.", `TESTNAME);
	 #100 $finish;
      end
   end
   always @(CPU.pb2.ac) begin
      #70 if (nreset && CPU.c2_nwac &&
	  (^CPU.pb2.ac == 1'bx || CPU.pb2.ac === {16{1'bz}})) begin
   	 $display("ERROR: AC has invalid value (%b).", CPU.pb2.ac);
   	 $display("%s: [fail] Processor mis-timing or contention.", `TESTNAME);
   	 #100 $finish;
      end
   end

   always @(negedge nio, negedge nmem) begin
      #100 if (nreset && db === {16{1'bz}}) begin
	 $display("ERROR: Reading from tri-stated data bus (AB=%4h).", ab);
	 $display("%s: [fail] Bus error.", `TESTNAME);
	 #100 $finish;
      end
   end

   always @(ab, db, aext) begin
      // There may be unset signals at startup, ignore those
      if (nreset) begin
	 if (^ab === 1'bx && ab !== {16{1'bz}}) begin
	    $display("ERROR: Address Bus contention (%b).", ab);
	    $display("%s: [fail] Address Bus contention.", `TESTNAME);
	    #100 $finish;
	 end

	 if (^CPU.c2_ibus === 1'bx && CPU.c2_ibus !== {16{1'bz}}) begin
	    $display("ERROR: IBUS contention (%b).", CPU.c2_ibus);
	    $display("%s: [fail] IBUS contention.", `TESTNAME);
	    #5 $finish;
	 end

	 if (^db === 1'bx && db !== {16{1'bz}}) begin
	    $display("ERROR: Data Bus contention (%b).", db);
	    $display("%s: [fail] Data Bus contention.", `TESTNAME);
	    #100 $finish;
	 end

	 if (^aext === 1'bx && aext !== 8'bzzzzzzzz) begin
	    $display("ERROR: AEXT contention (%b).", aext);
	    $display("%s: [fail] AEXT contention.", `TESTNAME);
	    #100 $finish;
	 end
	 if (nmem === 1'bx) begin
	    $display("ERROR: MEM# contention.");
	    $display("%s: [fail] MEM# contention.", `TESTNAME);
	    #100 $finish;
	 end
	 if (nio === 1'bx) begin
	    $display("ERROR: IO# contention.");
	    $display("%s: [fail] IO# contention.", `TESTNAME);
	    #100 $finish;
	 end
	 if (nr === 1'bx) begin
	    $display("ERROR: R# contention.");
	    $display("%s: [fail] R# contention.", `TESTNAME);
	    #100 $finish;
	 end
	 if (nw === 1'bx) begin
	    $display("ERROR: W# contention.");
	    $display("%s: [fail] #W contention.", `TESTNAME);
	    #100 $finish;
	 end
      end
   end
   
   initial begin
      // Parse command line args
      //have_MEM = $test$plusargs("MEM");

      $display("%s: [start] Start testing.", `TESTNAME);

      if ($value$plusargs("vcd=%s", vcd)) begin
	 $dumpfile (vcd);
	 $dumpvars (0, cft_mc_test);
      end
      if (!$value$plusargs("timeout=%d", timeout)) begin
	 timeout = 2000000;
      end
      
      nreset_drv <= 0;

      #1000 nreset_drv <= 1;

      // for (i = 0; i < 65536; i = i + 1) begin
      // 	 $display("%04h: %02h%02h", i[15:0], MEM.ic003_64c008_ramlo.mem[i], MEM.ic005_64c008_ramhi.mem[i]);
      // end

      #timeout begin
	 $display("ERROR: Emulation timed out without halting, t=", `TESTNAME, timeout);
	 $display("%s: [fail] Emulation timeout, t=", `TESTNAME, timeout);
	 $finish();
      end
   end

   // Slots 1--4: the Processor

   processor CPU(
		 // DIN-41612
		 .ec_ab(ab),         // 16-bit address bus
		 .ec_aext(aext),     // 8-bit address bus extension
		 .ec_db(db),         // 16-bit data bus
		 .ec_nirq0(8'b11111111),
		 /*
		 ec_nirq,       // 8 open drain interrupt lines
		 ec_nirqs,      // IRQ acknowledge, active low
		  */
		 .ec_nmem(nmem),     // memory strobe, active low
		 .ec_nio(nio),	     // I/O strobe, active low
		 .ec_nr(nr),         // read strobe, active low
		 .ec_nw(nw),         // write strobe, active low
		 .ec_nhalt(nhalt),   // halt machine, open drain
		 .ec_nreset(nreset), // reset machine, open drain
		 /*
		 ec_nendext,    // end currentinstruction, open drain
		 ec_nskipext,   // skip input, open drain
		 ec_nws,        // wait state, open drain
		  */
		 .ec_nsysdev(nsysdev),    // I/O 0000-00FF selected
		 /*
		 ec_niodev1xx,  // I/O 0100-01FF selected 
		 ec_niodev2xx,  // I/O 0200-02FF selected
		  */
		 .ec_niodev3xx(niodev3xx),  // I/O 0300-03ff selected
		 .ec_clk1(clk1),       // 4 MHz clock, 75%, 90°
		 .ec_clk2(clk2),       // 4 MHz clock, 75%, 180°
		 .ec_clk3(clk3),       // 4 MHz clock, 75%, 270°
		 .ec_clk4(clk4),       // 4 MHz clock, 75%, 0°
		 .ec_nt34(nt34)       // 4 MHz clock, 50%, 0°
		 );

   // Slot 5: Basic MEM board (64k RAM only)

   mem64k MEM(
   	      // DIN-41612
   	      .ec_ab(ab),	// 16-bit address bus
   	      .ec_db(db),	// 16-bit data bus
   	      .ec_nmem(nmem),	// memory strobe, active low
   	      .ec_nr(nr),	// read strobe, active low
   	      .ec_nw(nw)	// write strobe, active low
   	      );

   // Slot 6: Basic DEB board

   debugging_board DEB(
   		       // DIN-41612
   		       .ec_ab(ab),	// 16-bit address bus
   		       .ec_db(db),	// 16-bit data bus
   		       .ec_nio(nio),	// debugging-board strobe, active low
   		       .ec_nr(nr),	// read strobe, active low
   		       .ec_nw(nw),	// write strobe, active low
   		       .ec_clk1(clk1),	// write strobe, active low
   		       .ec_nhalt(nhalt), // halt
   		       .ec_niodev3xx(niodev3xx)
   	      );

   // Slot 7: PFP (Programmer's Front Panel) board

   front_panel PFP(
   		   // DIN-41612
   		   .ec_ab(ab),	     // 16-bit address bus
   		   .ec_db(db),	     // 16-bit data bus
   		   .ec_nio(nio),     // debugging-board strobe, active low
   		   .ec_nr(nr),	     // read strobe, active low
   		   .ec_nw(nw),	     // write strobe, active low
   		   .ec_nhalt(nhalt), // halt
   		   .ec_nsysdev(nsysdev)
   	      );

endmodule // processor_test

// End of file.
