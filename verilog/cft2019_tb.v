///////////////////////////////////////////////////////////////////////////////
//
// BASIC TESTS OF THE CFT 2019 SIMULATED COMPUTER
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////


`ifndef cft2019_tb_v
`define cft2019_tb_v

`include "cft2019.v"

`timescale 1ns/1ps

module cft2019_tb();
   inout         nreset;	// Open drain, various drivers.
   output        nrsthold;	// Driven by the reset unit.

   output 	 clk1;		// Output by the clock unit.
   output 	 clk2;		// Output by the clock unit.
   output 	 clk3;		// Output by the clock unit.
   output 	 clk4;		// Output by the clock unit.
   output 	 t34;		// Output by the clock unit.

   input 	 nirq;		// Input to the ISM
   output 	 nirqs;		// Interrupt acknowledge, driven by the ISM

   output 	 nsysdev;	// Driven by the I/O addr decoder (BUS board)
   output 	 niodev1xx;	// Driven by the I/O addr decoder (BUS board)
   output 	 niodev2xx;	// Driven by the I/O addr decoder (BUS board)
   output 	 niodev3xx;	// Driven by the I/O addr decoder (BUS board)

   output 	 nmem;		// Microcode store output
   output 	 nio;		// Microcode store output
   output 	 nw;		// Driven by the BUS board.
   output 	 nr;		// Microcode store output
   inout 	 nws;		// Open drain, handled by BUS board

   output [23:0] ab;		// 24-bit address bus
   inout  [15:0] db;		// 16-bit data bus

   inout  [7:0]	 nirqn;		// Open drain extended IRQs (INT board)

   inout 	 nhalt;		// Open drain, multiple readers
   inout 	 nendext;	// Open drain, handled by the microcode sequencer
   inout 	 nskipext;	// Open drain, handled by SBU

   inout  [15:0] ibus;		// 16-bit processor bus
   output [4:0]  raddr;		// 5-bit IBus read address
   output [4:0]  waddr;		// 5-bit IBus write address
   output [3:0]  action;	// 4-bit action address (STI, CLI, etc.)

   output [7:0]  fpd;		// 8-bit front panel data

   inout  [4:1]	 rsvd;		// Reserved bussed pins
   inout 	 wstb;		// Removed, kept for expansion
   inout 	 nruen;		// Removed, kept for expansion
   inout 	 nwuen;		// Removed, kept for expansion

   // Wire definitions for the above.

   wire          nreset, nrsthold, clk1, clk2, clk3, clk4, t34;
   wire 	 nirqs, nsysdev, niodev1xx, niodev2xx, niodev3xx;
   wire   	 nmem, nio, nw, nr;
   tri1 	 nws, nhalt, nendext, nskipext, nirq;
   wire  	 wstb, nruen, nwuen;
   wire [23:0] 	 ab;
   wire [15:0] 	 db;
   wire [7:0] 	 nirqn;
   wire [15:0] 	 ibus;
   wire [7:0] 	 fpd;
   wire [4:1] 	 rsvd;

   reg 		 nreset_drv;
   integer 	 timeout;

   initial begin
      $dumpfile ("vcd/cft2019_tb.vcd");
      $dumpvars (0, cft2019_tb);

      nreset_drv = 1'b0;
      #1000 nreset_drv = 1'b1;

      if ($value$plusargs("timeout=%d", timeout)) begin
	 //$display("Timeout set to %0d.", timeout);
	 #(timeout) begin
	    $display("931 Set timeout expired");
	    $finish;
	 end
      end else begin
	 #100000 begin
	    $display("931 Default timeout expired");
	    $finish;      // Terminate simulation
	 end
      end
   end

   assign nreset = nreset_drv;

   always @(cft.card_dfp.halting) begin
      //->cft.mem.dump_core;
     //#20000 
      $finish;
   end

   always @(db) begin
      #70 if (nmem == 1'b0 && db === 16'bZ) begin
	 $display("346 Bus error");
	 $finish;
      end
   end

   // Connect the DUT
   cft2019 cft (
		.nreset(nreset), .nrsthold(nrsthold),
		.clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
		.nirq(nirq), .nirqs(nirqs),
		.nsysdev(nsysdev), .niodev1xx(niodev1xx),
		.niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
		.nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
		.ab(ab), .db(db),
		.nirqn(nirqn),
		.nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
		.ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
		.fpd(fpd),
		.rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
		);
`endif //  `ifndef cft2019_tb_v
endmodule // cft2019_tb


// End of file
