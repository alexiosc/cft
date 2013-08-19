///////////////////////////////////////////////////////////////////////////////
//
// PB1-DBD-test.v -- Processor Board A, DBD test
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

`include "../PB1-clock.v"
`include "../PB1-DBD.v"

`timescale 1ns/10ps

module PB1_DBD_test();

   reg 	       nreset;
   reg 	       nws;
   reg 	       nmem;
   reg 	       nio;
   reg 	       nr;
   reg 	       nwen;

   wire        nw;

   wire [15:0] ibus, dbus;
   reg [15:0]  ibus_drv, dbus_drv;

   wire        clk1;
   wire        clk2;
   wire        clk4;
   wire        nt34;

   assign ibus = ibus_drv;
   assign dbus = dbus_drv;

   integer     i;

   always @(posedge clk1) begin
      if (i < 32768) begin
	 nws <= 1;
	 if (i & 2) begin
	    nio <= 0;
	    nmem <= 1;
	 end else begin
	    nmem <= 0;
	    nio <= 1;
	 end

	 if (i % 8 >= 6) #40 nws <= 0;
	 
	 if (i & 1) begin
	    // Simulate a read
	    dbus_drv <= i;
	    ibus_drv <= 16'bzzzzzzzzzzzzzzzz;
	    nr <= 0;
	    nwen <= 1;
	 end else begin
	    // Simulate a write
	    ibus_drv <= ~i;
	    dbus_drv <= 16'bzzzzzzzzzzzzzzzz;
	    nwen <= 0;
	    nr <= 1;
	 end // else: !if(i & 1)
      end else if (i < 65536) begin
	 $display("%s: [ok] Pass (DBD).", `TESTNAME);
	 #500 $finish;      // Terminate simulation
      end

      i = i + 1;
   end // always @ (negedge clk1)

   always @(negedge clk1) begin
      nmem <= 1;
      nio <= 1;
      nr <= 1;
      nwen <= 1;
   end

   ///////////////////////////////////////////////////////////////////////////////
   //
   // TEST THE W# STROBE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Test the W# strobe
   always @(negedge clk4) begin
      // Test setup time
      if (nwen == 0) begin
	 if (nw == 0) begin
   	    $display("%s: [fail] W# set-up sanity check failed.",
   		     `TESTNAME);
   	    $display ("%s: [fail] W# strobe timing violation.", `TESTNAME);
   	    #100 $finish;
	 end
	 #6 if (nw == 0) begin
   	    $display("%s: [fail] W# went low within 6ns of CLK4 going low.",
   		     `TESTNAME);
   	    $display ("%s: [fail] W# set-up time violation.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end
   always @(posedge nw) begin
      // Test hold time
      if (nwen == 0) begin
	 if (clk4 == 1) begin
   	    $display("%s: [fail] W# hold sanity check failed.",
   		     `TESTNAME);
   	    $display ("%s: [fail] W# strobe timing violation.", `TESTNAME);
   	    #100 $finish;
	 end
	 #6 if (clk4 == 1) begin
   	    $display("%s: [fail] W# went high within 6ns of CLK4 going high.",
   		     `TESTNAME);
   	    $display ("%s: [fail] W# hold time violation.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end
   always @(negedge clk4) begin
      // Test W# occurrence
      if (nwen == 0) begin
	 #30 if (nw != 0 && dut.waiting == 0) begin
   	    $display("%s: [fail] W# did not assert within 30ns of CLK4 going low.",
   		     `TESTNAME);
   	    $display ("%s: [fail] W# strobe failure.", `TESTNAME);
   	    #100 $finish;
	 end else if (nw == 0 && dut.waiting == 1) begin
   	    $display("%s: [fail] W# strobed during a wait state.",
   		     `TESTNAME);
   	    $display ("%s: [fail] W# wait state violation.", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end
   always @(negedge nw) begin
      if (clk4 == 1) begin
   	 $display("%s: [fail] W# strobed before falling edge of CLK4.",
   		  `TESTNAME);
   	 $display ("%s: [fail] W# strobe timing violation.", `TESTNAME);
   	 #100 $finish;
      end
   end
   always @(posedge nw) begin
      if (clk4 == 1) begin
   	 $display("%s: [fail] W# strobe crossed rising edge of CLK4.",
   		  `TESTNAME);
   	 $display ("%s: [fail] W# strobe timing violation.", `TESTNAME);
   	 #100 $finish;
      end
   end
   // Test bus validity during W# strobe
   always @(negedge nwen) begin
      if (dbus != ibus_drv) begin
   	 $display("%s: [fail] DBUS should be %h at W# strobe, but was %h instead.",
   		  `TESTNAME, ibus_drv, dbus);
   	 $display ("%s: [fail] Bus value failure (write).", `TESTNAME);
   	 #100 $finish;
      end
   end


   ///////////////////////////////////////////////////////////////////////////////
   //
   // TEST BUS CONNECTION
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @(negedge nr) begin
      if (nmem == 0 || nio == 0) begin
	 #15 if (dut.nbusen != 0) begin
   	    $display("%s: [fail] IBUS-DBUS did not connect within 15ns of R# going low.",
   		     `TESTNAME);
   	    $display ("%s: [fail] Bus enable failure (read).", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end
   always @(negedge nw) begin
      if (nmem == 0 || nio == 0) begin
	 #15 if (dut.nbusen != 0) begin
   	    $display("%s: [fail] IBUS-DBUS did not connect within 15ns of W# going low.",
   		     `TESTNAME);
   	    $display ("%s: [fail] Bus enable failure (write).", `TESTNAME);
   	    #100 $finish;
	 end
      end
   end

   // Check bus link direction
   always @(negedge dut.nbusen) begin
      #15 if (nwen == 0 && dbus != ibus_drv) begin
   	 $display("%s: [fail] IBUS-to-DBUS (write) connection failed.",
   		  `TESTNAME);
   	 $display ("%s: [fail] Bus buffer direction failure (write).", `TESTNAME);
   	 #100 $finish;
      end else if (nr == 0 && ibus != dbus_drv) begin
   	 $display("%s: [fail] DBUS-to-IBUS (read) connection failed.",
   		  `TESTNAME);
   	 $display ("%s: [fail] Bus buffer direction failure (read).", `TESTNAME);
   	 #100 $finish;
      end
   end

   

   // Initialize all variables
   initial begin        
      $display("%s: [start] Start testing.", `TESTNAME);
`ifdef WRITE_VCD
      $dumpfile ("vcd/PB1-DBD-test.vcd");
      $dumpvars (0, PB1_DBD_test);
`endif
      
      // Initialisation
      i <= 65536;		// Inhibit clock-synchronous testing
      nreset <= 0;
      nws <= 1;
      nmem <= 1;
      nio <= 1;
      nr <= 1;
      nwen <= 1;
      ibus_drv <= 16'bzzzzzzzzzzzzzzzz;
      dbus_drv <= 16'bzzzzzzzzzzzzzzzz;

      #250 nreset <= 1;

      // Test spurious pulses
      #250 nr <= 0;
      dbus_drv <= 65535;
      #63 nr <= 1;

      #250 nwen <= 0;
      #63 nwen <= 1;

      // Start synchronous testing
      #1000 i <= 0;
   end // initial begin

   PB1_clock clock(.nreset(nreset),
		   .fpclken(1), .fpustep(0),
		   .clk1(clk1), .clk2(clk2), .clk4(clk4), .nt34(nt34));

   PB1_DBD dut(nreset, clk2, clk4, nt34, nws, nmem, nio, nr,
	       nwen, nw, ibus, dbus);
   
endmodule

// End of file.
