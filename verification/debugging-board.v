///////////////////////////////////////////////////////////////////////////////
//
// debugging-board.v -- The DEB board (partial implementation)
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


`include "rom.v"
`include "ram.v"
`include "demux.v"


`timescale 1ns/1ps

`ifndef DEB_LOGFILE
 `define DEB_LOGFILE "/dev/stdout"
`endif // DEB_LOGFILE


`define DEB_ENEF         16'h03e0 /*     3e0: -w-ef enable emulator features */
`define DEB_DISEF        16'h03e1 /*     3e1: -w-ef disable emulator features */
`define DEB_QEF          16'h03e0 /*     3e0: r--e- query emulator features */
`define DEB_QEF_ALT      16'h03e1 /*     3e1: r--e- (same) */

`define DEB_TICKS        16'h03e8 /*     3e8: rw-ef TICKS (Tick counter, 32 bits) */
`define DEB_CLR_TICKS    16'h03e9 /*     3e8: rw-ef CLRTCK (Clear tick counter) */

`define DEB_SENTINEL     16'h03ef /*     3ef: rw-ef log sentinel execution and halt */

`define DEB_PRINTA	 16'h03f0 /*     3f0: -whef Log AC as address */
`define DEB_PRINTC	 16'h03f1 /*     3f1: -whef Log AC as character */
`define DEB_PRINTD	 16'h03f2 /*     3f2: -whef Log AC as integer */
`define DEB_PRINTU	 16'h03f3 /*     3f3: -whef Log AC as unsigned int */
`define DEB_PRINTH	 16'h03f4 /*     3f4: -whef Log AC in hex */
`define DEB_PRINTB	 16'h03f5 /*     3f6: -whef Log AC in binary */
`define DEB_PRINTSP	 16'h03f6 /*     3f6: -whef Log a space */
`define DEB_PRINTNL	 16'h03f7 /*     3f7: -whef Log a newline */
`define DEB_DEBUGON	 16'h03f8 /*     3f8: -w-ef Emulator enables assembly tracing */
`define DEB_DEBUGOFF	 16'h03f9 /*     3f9: -w-ef Emulator disables assembly tracing */
`define DEB_DUMP  	 16'h03fa /*     3fa: -w-ef Emulator dumps state */
`define DEB_PRINTHI	 16'h03fb /*     3fb: -whef HI:=AC */
`define DEB_PRINTLO	 16'h03fc /*     3fc: -whef Log 32-bit int as HI:AC */
`define DEB_HALT	 16'h03fd /*     3fd: -whef HALT: (Debugging board) halt */
`define DEB_SUCCESS      16'h03fe /*     3fe: -whef Log test success */
`define DEB_FAIL 	 16'h03ff /*     3ff: -whef Log test failure and HALT */


// The following addresses are used by a dummy device (activated by
// specifying +iot-test on the command line) that allows testing the
// IOT instruction by providing a hardware multiplier. This is not
// part of the hardware.

`define DEB_TEST_IOT     16'h03e7

  
///////////////////////////////////////////////////////////////////////////////
//
// The DEB (debugging) board
//
///////////////////////////////////////////////////////////////////////////////

module debugging_board(
		       // DIN-41612
		       ec_ab,         // 16-bit address bus
		       //ec_aext,       // 8-bit address bus extension
		       ec_db,         // 16-bit data bus
		       /*
			ec_nirq0,      // Single open drain interrupt line
			ec_nirq,       // 8 open drain interrupt lines
			ec_nirqs,      // IRQ acknowledge, active low
			*/
		       //ec_nmem,       // memory strobe, active low
		       ec_nio,        // I/O strobe, active low
		       ec_nr,         // read strobe, active low
		       ec_nw,         // write strobe, active low
		       ec_nhalt,      // halt machine, open drain
		       ec_nreset,     // reset machine, open drain
		       ec_nendext,    // end current instruction, open drain
		       ec_nskipext,   // skip input, open drain
		       /*
		       ec_nws,        // wait state, open drain
			ec_nsysdev,    // I/O 0000-00FF selected
			ec_niodev1xx,  // I/O 0100-01FF selected 
			ec_niodev2xx,  // I/O 0200-02FF selected
			*/
		       ec_niodev3xx,  // I/O 0300-03ff selected
		       ec_clk1,       // 4 MHz clock, 75%, 90°
		       /*
			ec_clk2,       // 4 MHz clock, 75%, 180°
			ec_clk3,       // 4 MHz clock, 75%, 270°
			ec_clk4,       // 4 MHz clock, 75%, 0°
			ec_nt34        // 4 MHz clock, 50%, 0°
			*/
		       );
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // EXPANSION CONNECTOR (DIN 41612)
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The bus directions are the official directions for interfacing devices.

   input [15:0] ec_ab;         // 16-bit address bus
   input [7:0] 	ec_aext;       // 8-bit address bus extension (generated here)
   inout [15:0] ec_db;         // 16-bit data bus
   /*
   input        ec_nirq0;      // Single open drain interrupt line
   input [7:0]  ec_nirq;       // 8 open drain interrupt lines
   inout        ec_nirqs;      // IRQ acknowledge, active low
    */
   //input       ec_nmem;       // memory strobe, active low
   input        ec_nio;        // I/O strobe, active low
   input 	ec_nr;         // read strobe, active low
   input 	ec_nw;         // write strobe, active low
   inout        ec_nhalt;       // halt machine, open drain
   inout        ec_nreset;      // reset machine, open drain
   inout        ec_nendext;     // end current instruction, open drain
   inout        ec_nskipext;    // skip input, open drain
   /*
   inout        ec_nws;         // wait state, open drain
   output       ec_nsysdev;     // I/O 0000-00FF selected
   output       ec_niodev1xx;   // I/O 0100-01FF selected
   output       ec_niodev2xx;   // I/O 0200-02FF selected
    */
   input       ec_niodev3xx;   // I/O 0300-03ff selected
   input        ec_clk1;	// 4 MHz clock, 75%, 90°
   /*
   output       ec_clk2;        // 4 MHz clock, 75%, 180°
   output       ec_clk3;        // 4 MHz clock, 75%, 270°
   output       ec_clk4;        // 4 MHz clock, 75%, 0°
   output       ec_nt34;        // 4 MHz clock, 50%, 0°
    */



   // We don't implement the debugging board in full. For testing reasons, all
   // we need to do is implement the logging/assertion extended
   // instructions. The DEB board decodes I/O addresses 03E0-03FF. Not all
   // ports are implemented or need to be.

   // We also don't simulate HARDWARE here. We provide a functional simulation
   // of the DEB board in Verilog.
   
   reg 		     ec_nhalt_drv;
   assign ec_nhalt = ec_nhalt_drv;

   reg signed [15:0] si;

   integer 	     logfile;
   integer 	     ticks;
   integer 	     hi;

   event 	     assertion_failed;
   event 	     halting;
   event 	     dump;
   event 	     sentinel;

   wire 	     dec_addr;

   reg [4096:0] deb_logfile;

   reg [15:0] 	db_drv;         // 16-bit data bus
   reg [15:0] 	deb_test_iot;
   
   initial begin
      if ($value$plusargs("deblog=%s", deb_logfile)) begin
	 logfile = $fopen(deb_logfile, "w");
      end else begin
	 logfile = $fopen(`DEB_LOGFILE, "w");
      end

      $fwrite(logfile, "I: Log file created.\n");

      // Initialise stuff
      ticks = 0;
      ec_nhalt_drv <= 1'bz;
      db_drv <= 0;
   end

   
   // The DEB board can halt the system. When this happens, we assert HALT#,
   // wait a little bit, then exit.
   always @(halting) begin
      ec_nhalt_drv <= 1'b0;
      $finish;
   end 

   
   // Count CPU clock ticks
   always @(negedge ec_clk1) begin
      ticks = ticks + 1;
   end

   assign dec_addr = ((ec_ab & 16'hffe0) === 16'h03e0) ? 1'b1 : 1'b0;
   
   // Respond to the IN instructions
   always @(negedge ec_nr) begin
      if (ec_niodev3xx == 0 && ec_nio == 0 && dec_addr) begin
	 case (ec_ab)
	   `DEB_QEF:
	     $fwrite(logfile, "I: QEF not yet implemented\n");
	   
	   `DEB_QEF_ALT:
	     $fwrite(logfile, "I: QEF not yet implemented\n");

	   `DEB_TEST_IOT:
		db_drv <= (deb_test_iot * 10) & 16'hffff;
	   default:
	     $fwrite(logfile, "E: read from I/O %04h not implemented\n", ec_ab);
	 endcase // case (ec_ab)
      end // if (ec_niodev3xx == 0 && ec_nio == 0)
   end // always @ (negedge ec_nr)


   // Connect the data bus driver
   assign ec_db = (ec_niodev3xx == 0 &&
		   ec_nio == 0 &&
		   ec_nr == 0 && 
		   ec_ab == `DEB_TEST_IOT) ? ((deb_test_iot * 10) & 16'hffff) : {16{1'bz}};


   always @(ec_nreset) begin
      if (ec_nreset === 1'b0) $fwrite(logfile, "T: RESET# asserted\n");
      else $fwrite(logfile, "T: RESET# cleared\n");
   end

   always @(ec_nhalt) begin
      if (ec_nhalt === 1'b0) begin
	 $fwrite(logfile, "T: HALT# asserted\n");
	 -> halting;
      end else $fwrite(logfile, "T: HALT# cleared\n");
   end

   
   // Respond to OUT instructions
   always @(negedge ec_nw) begin
      if (ec_niodev3xx == 0 && ec_nio == 0 && dec_addr) begin
	 case (ec_ab)
	   `DEB_ENEF:		// ENEF instruction
	     $fwrite(logfile, "I: ENEF not implemented\n");
	   
	   `DEB_DISEF:		// DISEF instruction
	     $fwrite(logfile, "I: DISEF not implemented\n");
	   
	   `DEB_TICKS:		// TICKS instruction
	     $fwrite(logfile, "T: TICKS %-0d\n", ticks);
	   
	   `DEB_CLR_TICKS:		// CLRTCK instruction
	     $fwrite(logfile, "I: CLRTCK Tick counter cleared\n");
	   
	   `DEB_TEST_IOT:
	     deb_test_iot <= ec_db;

	   `DEB_SENTINEL:		// Instruction sentinel
	     begin
		$fwrite(logfile, "T: SENTINEL instruction executed\n");
		-> sentinel;
		-> halting;
	     end

	   `DEB_PRINTA:		// Print DB as address
	     $fwrite(logfile, "T: PRINTA %04h (?)\n", ec_db);

	   `DEB_PRINTC:		// Print DB as char
	     begin
		if (ec_db > 32 && ec_db < 127) $fwrite(logfile, "T: PRINTC: %s\n", ec_db[7:0]);
		else $fwrite(logfile, "T: PRINTc: %d\n",ec_db[7:0]);
		//$time, ec_db, ec_ab, ec_nio, ec_nw, dec_addr);
	     end

	   `DEB_PRINTD:		// Print DB as signed integer
	     begin
		si = ec_db;
		$fwrite(logfile, "T: PRINTD %d\n", si);
	     end

	   `DEB_PRINTU:		// Print DB as unsigned integer
	     $fwrite(logfile, "T: PRINTU %d\n", ec_db);

	   `DEB_PRINTH:		// Print DB as zero-padded 16-bit hex
	     $fwrite(logfile, "T: PRINTH %04h\n", ec_db);

	   `DEB_PRINTB:		// Print DB as zero-padded 16-bit binary
	     $fwrite(logfile, "T: PRINTB %b\n", ec_db);

	   `DEB_PRINTSP:		// Print a space
	     $fwrite(logfile, "T: PRINTc 32\n");

	   `DEB_PRINTNL:		// Print a newline
	     $fwrite(logfile, "T: PRINTc 10\n");

	   `DEB_PRINTNL:		// Print a newline
	     $fwrite(logfile, "T: PRINTc 10\n");

	   `DEB_DEBUGON:		// DEBUGON instruction
	     $fwrite(logfile, "I: DEBUGON not implemented\n");

	   `DEB_DEBUGOFF:		// DEBUGOFF instruction
	     $fwrite(logfile, "I: DEBUGOFF not implemented\n");

	   `DEB_DUMP:		// DUMP instruction (ad-hoc)
	     begin
		$fwrite(logfile, "T: DUMP follows (ad hoc)\n");
		->dump;
	     end

	   `DEB_PRINTHI:		// PRINTHI instruction
	     hi <= ec_db;

	   `DEB_PRINTLO:		// PRINTLO instruction
	     $fwrite(logfile, "T: PRINTL %04x%04x\n", hi[15:0], ec_db);

	   `DEB_HALT:		// DEB board HALT instruction
	     begin
		$fwrite(logfile, "T: HALTING (using temporary DEB board instruction)\n");
		->halting;
	     end
	   
	   `DEB_SUCCESS:
	     $fwrite(logfile, "T: ASSERT: TRUE\n");
	   
	   `DEB_FAIL:
	     begin
		$fwrite(logfile, "T: ASSERT: FAIL\n");
		-> assertion_failed;
		-> halting;
	     end
	   
	   default: // Not implemented
	     begin
		$display("ERROR: write %04h to I/O %04h not implemented", ec_db, ec_ab);
		$fwrite(logfile, "E: write %04h to I/O %04h not implemented\n", ec_db, ec_ab);
	     end
	 endcase // case (ec_ab)
      end // if (ec_nio == 0)
   end // always @ (negedge ec_nw)

endmodule // memory

// End of file.
