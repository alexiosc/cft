///////////////////////////////////////////////////////////////////////////////
//
// BASIC TESTBENCH FOR THE REG BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// card_reg_tb.v -- The REG Board
//
// Copyright © 2011–2020 Alexios Chouchoulas
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

`ifndef cft2019_v
`define cft2019_v

`include "clock.v"
`include "card_reg.v"

`timescale 1ns/1ps

//`define DELTA 21
`define DELTA 89
//`define DELTA 941
//`define DELTA 1543

module card_reg_tb(
		nreset, nrsthold,            // Reset
		clk1, clk2, clk3, clk4, t34, // Clock
		nirq, nirqs,                 // Unexpanded Interrupts
		nsysdev,                     // I/O space decoder, I/O 000-0FF
		niodev1xx,		     // I/O space 100-1FF
		niodev2xx,		     // I/O space 200-2FF
		niodev3xx,		     // I/O space 300-3FF
		nmem, nio, nw, nr, nws,      // Bus transactions
		ab,                          // 24-bit address bus
		db,                          // 16-bit data bus
		nirqn,                       // Expanded interrupts (nIRQ0–nIRQ7)
		nhalt, nendext, nskipext,    // Run control for processor extensions
		ibus,                        // Processor bus
		raddr, waddr, action,        // Microcode fields
		fpd,			     // 8-bit front panel bus
		rsvd,                        // Reserved for bussed expansion
		wstb, nruen                  // Removed, kept for expansion
                );

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

   // Wire definitions for the above.

   wire          nreset, nrsthold, clk1, clk2, clk3, clk4, t34;
   wire 	 nirqs, nsysdev, niodev1xx, niodev2xx, niodev3xx;
   wire   	 nmem, nio, nw, nr;
   tri1 	 nws, nhalt, nendext, nskipext, nirq;
   wire  	 wstb, nruen;
   wire [23:0] 	 ab;
   wire [15:0] 	 db;
   wire [7:0] 	 nirqn;
   wire [15:0] 	 ibus;
   wire [7:0] 	 fpd;
   wire [4:1] 	 rsvd;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE REG CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   wire [40:1] 	 cport_reg;
   wire [6:0] 	 ir_6_0;
   wire 	 nwen;
   wire 	 fl;
   wire 	 fv;
   wire 	 nflagwe;
   wire 	 fz;
   wire 	 fn;
   wire [15:10]  pc_15_10;


   wire          nfppch;
   wire          nfppcl;
   wire          nfpdrh;
   wire          nfpdrl;
   wire          nfpach;
   wire          nfpacl;
   wire          nfpsph;
   wire          nfpspl;
   wire [15:0]   cport_ac;
   wire          naccpl;
   

   reg 		 nreset_drv;
   reg [15:0] 	 ibus_drv;
   reg [4:0] 	 raddr_drv;
   reg [4:0] 	 waddr_drv;
   reg [3:0] 	 action_drv;
   reg       	 clk4_drv; // This enables write strobing

   reg [800:0] 	 status;
   integer 	 i, j;
   reg [15:0] 	 oldpc, olddr, oldac, oldsp;
   reg 		 mock_fl;
   
   wire [15:0] 	 pc, dr, ac, sp;

   // To keep things clearer and shorter:
   assign pc = card_reg.reg_pc.out;
   assign dr = card_reg.reg_dr.out;
   assign ac = card_reg.reg_ac.out;
   assign sp = card_reg.reg_sp.out;

   always @(posedge naccpl) begin
      mock_fl = ~mock_fl;
   end

   always begin
      $dumpfile ("vcd/card_reg_tb.vcd");
      $dumpvars (0, card_reg_tb);

      status = "Reset";
      nreset_drv = 0;
      ibus_drv = 16'hZZZZ;
      raddr_drv = 0;
      waddr_drv = 0;
      action_drv = 0;
      clk4_drv = 0;
      mock_fl = 0;
      #1000 nreset_drv = 1;

      // NOTE: switched to using the actual clock generator from the full CFT
      // to test this. clk4_drv is still around, and we use it to synchronise
      // our own test clock with the CFT's. The current δt is 51.25ns, hence
      // the delay below.
      #(10000+51.25) status = "RADDR/ADDR";
      // Scan through all RADDR/WADDR addresses
      for (j = 0; j < 32; j++) begin
	 $sformat(status, "ADDR %05b", j[5:0]);

	 // Use `DELTA when addressing the registers, and 523 when not. This
	 // makes the test faster. We don't need to try all possible values on
	 // the IBus when the registers aren't addressed.
	 for (i = 0; i < 65535; i = i + ((j >= 5'b01000 && j <= 5'b01011) ? `DELTA : 523)) begin

	    // First, write to the register.
	    #62.5 ibus_drv = i;
	    #62.5 waddr_drv = j;
	    clk4_drv = 0;
	    #62.5 waddr_drv = 0;
	    clk4_drv = 1;
	    #62.5 ibus_drv = 16'dZ;

	    // Then, read from the register.
	    #62.5 raddr_drv = j;
	    #187.5 raddr_drv = 0;
	 end
      end

      #10000 status = "ACTION";

      // Scan through all ACTION addresses
      for (j = 0; j < 16; j++) begin
	 $sformat(status, "ACTION %04b", j[3:0]);

	 for (i = 0; i < 1000; i = i + 1) begin

	    oldpc = pc;
	    olddr = dr;
	    oldac = ac;
	    oldsp = sp;

	    mock_fl <= 0;
	    #250 action_drv = j[3:0];
	    #250 action_drv = 0;
	    #250;		// Let changes propagate

   	    msg[7:0] = "";	// Use the msg as an error flag.
	    
	    // PC (increments only)
	    if (j == 4'b1000 && pc != 16'(oldpc + 1)) begin
	       $sformat(msg, "INCPC failure: action=%b, but PC went from %04h to %04h (expected %04h)",
	    		j[3:0], oldpc, pc, 16'(oldpc + 1));
	    end
	    else if (j != 4'b1000 && pc != oldpc) begin
	       $sformat(msg, "Unexpected Register change: action=%b, but PC changed from %04h to %04h",
	    		j[3:0], oldpc, pc);
	    end

	    // DR (increment/decrement)
	    if (j == 4'b1010 && dr != 16'(olddr + 1)) begin
	       $sformat(msg, "INCDR failure: action=%b, but DR went from %04h to %04h (expected %04h)",
	    		j[3:0], olddr, dr, 16'(olddr + 1));
	    end
	    else if (j == 4'b1011 && dr != 16'(olddr - 1)) begin
	       $sformat(msg, "DECDR failure: action=%b, but DR went from %04h to %04h (expected %04h)",
	    		j[3:0], olddr, dr, 16'(olddr - 1));
	    end
	    else if (j != 4'b1010 && j != 4'b1011 && dr != olddr) begin
	       $sformat(msg, "Unexpected Register change: action=%b, but DR changed from %04h to %04h",
	    		j[3:0], olddr, dr);
	    end

	    // AC (increment/decrement)
	    if (j == 4'b1100 && ac != 16'(oldac + 1)) begin
	       $sformat(msg, "INCAC failure: action=%b, but AC went from %04h to %04h (expected %04h)",
	    		j[3:0], oldac, ac, 16'(oldac + 1));
	    end
	    else if (j == 4'b1101 && ac != 16'(oldac - 1)) begin
	       $sformat(msg, "DECAC failure: action=%b, but AC went from %04h to %04h (expected %04h)",
	    		j[3:0], oldac, ac, 16'(oldac - 1));
	    end
	    else if (j != 4'b1100 && j != 4'b1101 && ac != oldac) begin
	       $sformat(msg, "Unexpected Register change: action=%b, but AC changed from %04h to %04h",
	    		j[3:0], oldac, ac);
	    end

	    // Check FL complementing when AC wraps around
	    if (j == 4'b1100 && oldac == 16'hffff && mock_fl !== 1'b1) begin
	       $sformat(msg, "naccpl did not strobe on AC wraparound. j=%b, oldac=%04h, ac=%04h, mock_fl=%b",
			j[5:0], oldac, ac, mock_fl);
	    end
	    else if (j == 4'b1100 && oldac == 16'hffff && mock_fl === 1'b1) begin
	       // Things are as expected. This case left here for logic clarity.
	    end
	    else if (j == 4'b1101 && oldac == 16'h0000 && mock_fl !== 1'b1) begin
	       $sformat(msg, "naccpl did not strobe on AC wraparound. j=%b, oldac=%04h, ac=%04h, mock_fl=%b",
			j[5:0], oldac, ac, mock_fl);
	    end
	    else if (j == 4'b1101 && oldac == 16'h0000 && mock_fl === 1'b1) begin
	       // Things are as expected. This case left here for logic clarity.
	    end
	    else if (mock_fl == 1'b1) begin
	       $sformat(msg, "naccpl strobed superfluously. j=%b, oldac=%04h, ac=%04h, mock_fl=%b",
			j[5:0], oldac, ac, mock_fl);
	    end

	    // SP (increment/decrement)
	    if (j == 4'b1110 && sp != 16'(oldsp + 1)) begin
	       $sformat(msg, "INCSP failure: action=%b, but SP went from %04h to %04h (expected %04h)",
	    		j[3:0], oldsp, sp, 16'(oldsp + 1));
	    end
	    else if (j == 4'b1111 && sp != 16'(oldsp - 1)) begin
	       $sformat(msg, "DECSP failure: action=%b, but SP went from %04h to %04h (expected %04h)",
	    		j[3:0], oldsp, sp, 16'(oldsp - 1));
	    end
	    else if (j != 4'b1110 && j!= 4'b1111 && sp != oldsp) begin
	       $sformat(msg, "Unexpected Register change: action=%b, but SP changed from %04h to %04h",
	    		j[3:0], oldsp, sp);
	    end

   	    // Fail if we've logged an issue.
   	    if (msg[7:0]) begin
   	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	       $error("assertion failure");
   	       #10000 $finish;
   	    end
	    else $display("345 OK ACTION");
	 end
      end

      #300000 $finish;
   end

   assign nreset = nreset_drv;
   assign ibus = ibus_drv;
   assign raddr = raddr_drv;
   assign waddr = waddr_drv;
   assign action = action_drv;
   // assign clk4 = clk4_drv;
   // assign clk2 = clk4_drv;	// May 2020 versions of the REG board use clk2 to generate write signals
   // assign clk3 = ~clk4_drv;	// A viable hack, given the way clk3 is used.
   
   clock_generator clock_generator (.nreset(nreset),
				    .clk1(clk1),
				    .clk2(clk2),
				    .clk3(clk3),
				    .clk4(clk4),
				    .t34(t34),
				    .nrsthold(nrsthold));

   // Connect the DUT and its many signals

   assign pc_15_10 = cport_reg[6:1];
   assign cport_reg[11] = nfppch;
   assign cport_reg[12] = nfppcl;
   assign cport_reg[13] = nfpdrh;
   assign cport_reg[14] = nfpdrl;
   assign cport_reg[15] = nfpach;
   assign cport_reg[16] = nfpacl;
   assign cport_reg[17] = nfpsph;
   assign cport_reg[18] = nfpspl;
   // This is the ‘ac’ signal, it's just renamed to avoid clashes here
   assign cport_ac = cport_reg[38:23];
   assign fn = cport_reg[38];   // Note: same as ac[15]
   assign fz = cport_reg[39];
   assign naccpl = cport_reg[40];
   card_reg card_reg(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
		     .nwaiting(1'b1),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
                     .ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_reg),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen)
                     );

   reg [8191:0] msg;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY RESET BEHAVIOUR
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @ (nreset) begin
      #50 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (nreset === 1'b0) begin
	    if (pc !== 16'd0) begin
	       $sformat(msg, "Reset failure: nreset=%b, PC=%04h", nreset, pc !== 16'd0);
	    end
	    else if (dr !== 16'd0) begin
	       $sformat(msg, "Reset failure: nreset=%b, DR=%04h", nreset, dr !== 16'd0);
	    end
	    else if (ac !== 16'd0) begin
	       $sformat(msg, "Reset failure: nreset=%b, AC=%04h", nreset, ac !== 16'd0);
	    end
	    else if (sp !== 16'd0) begin
	       $sformat(msg, "Reset failure: nreset=%b, SP=%04h", nreset, sp !== 16'd0);
	    end
	 end else if (nreset !== 1'b1) $sformat(msg, "testbench bug: nreset=%b", nreset);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK Reset");
      end
   end // always @ (clr, npl, p, cpu, cpd)


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY READING
   //
   ///////////////////////////////////////////////////////////////////////////////

   reg [15:0] correct_ibus;
   reg [80:0] read_regname;
   reg [3:0]  read_vector;

   always @ (raddr) begin
      #50 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex (raddr)
	    5'b01000: begin
	       read_regname = "PC";
	       correct_ibus = pc;
	       read_vector = 4'b1110;
	    end
	    5'b01001: begin
	       read_regname = "DR";
	       correct_ibus = dr;
	       read_vector = 4'b1101;
	    end
	    5'b01010: begin
	       read_regname = "AC";
	       correct_ibus = ac;
	       read_vector = 4'b1011;
	    end
	    5'b01011: begin
	       read_regname = "SP";
	       correct_ibus = sp;
	       read_vector = 4'b0111;
	    end
	    default: begin
	       read_regname = "??";
	       correct_ibus = 16'bZ;
	       read_vector = 4'b1111;
	    end
	 endcase; // casex (raddr)

	 // Only test reads, not writes (the ibus won't be what we expect during writes)
	 if (waddr == 0) begin
	    if (nreset === 1'b1 && ibus !== correct_ibus) begin
	       $sformat(msg, "Register read failure: nreset=%b, %0s=%04h but IBus=%04h", nreset, read_regname, correct_ibus, ibus);
	    end

	    else if (card_reg.nread_pc !== read_vector[0]) begin
	       $sformat(msg, "RADDR decoding failure, raddr=%b but nread_pc=%b", raddr, card_reg.nread_pc);
	    end

	    else if (card_reg.nread_dr !== read_vector[1]) begin
	       $sformat(msg, "RADDR decoding failure, raddr=%b but nread_dr=%b", raddr, card_reg.nread_dr);
	    end

	    else if (card_reg.nread_ac !== read_vector[2]) begin
	       $sformat(msg, "RADDR decoding failure, raddr=%b but nread_ac=%b", raddr, card_reg.nread_ac, read_vector,
			read_regname);
	    end

	    else if (card_reg.nread_sp !== read_vector[3]) begin
	       $sformat(msg, "RADDR decoding failure, raddr=%b but nread_sp=%b", raddr, card_reg.nread_sp);
	    end

	    else if (card_reg.nread_pc !== 1'b0 && card_reg.nread_pc !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nread_pc=%b", card_reg.nread_pc);
	    end
	    else if (card_reg.nread_dr !== 1'b0 && card_reg.nread_dr !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nread_dr=%b", card_reg.nread_dr);
	    end
	    else if (card_reg.nread_ac !== 1'b0 && card_reg.nread_ac !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nread_ac=%b", card_reg.nread_ac);
	    end
	    else if (card_reg.nread_sp !== 1'b0 && card_reg.nread_sp !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nread_sp=%b", card_reg.nread_sp);
	    end
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK RADDR");
      end
   end // always @ (clr, npl, p, cpu, cpd)
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY WRITING
   //
   ///////////////////////////////////////////////////////////////////////////////

   reg [15:0] correct_reg;
   reg [80:0] write_regname;
   reg [3:0]  write_vector;

   always @ (waddr, clk4) begin
      #70 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex (waddr)
	    5'b01000: begin
	       write_regname = "PC";
	       correct_reg = pc;
	       write_vector = 4'b1110;
	    end
	    5'b01001: begin
	       write_regname = "DR";
	       correct_reg = dr;
	       write_vector = 4'b1101;
	    end
	    5'b01010: begin
	       write_regname = "AC";
	       correct_reg = ac;
	       write_vector = 4'b1011;
	    end
	    5'b01011: begin
	       write_regname = "SP";
	       correct_reg = sp;
	       write_vector = 4'b0111;
	    end
	    default: begin
	       write_regname = "??";
	       correct_reg = 16'bZ;
	       write_vector = 4'b1111;
	    end
	 endcase; // casex (waddr)

	 // Only test writes, not writes (the ibus won't be what we expect during writes)
	 if (clk4 == 1'b0 && write_regname != "??") begin
	    if (nreset === 1'b1 && correct_reg !== ibus) begin
	       $sformat(msg, "Register write failure: nreset=%b, clk4=%b, waddr=%b, IBus=%x but %0s=%04h",
			nreset, clk4, waddr, ibus, write_regname, correct_reg);
	    end

	    else if (card_reg.nwrite_pc !== write_vector[0]) begin
	       $sformat(msg, "WADDR decoding failure, clk4=%b, waddr=%b but nwrite_pc=%b", clk4, waddr, card_reg.nwrite_pc);
	    end

	    else if (card_reg.nwrite_dr !== write_vector[1]) begin
	       $sformat(msg, "WADDR decoding failure, clk4=%b, waddr=%b but nwrite_dr=%b", clk4, waddr, card_reg.nwrite_dr);
	    end

	    else if (card_reg.nwrite_ac !== write_vector[2]) begin
	       $sformat(msg, "WADDR decoding failure, clk4=%b, waddr=%b but nwrite_ac=%b", clk4, waddr, card_reg.nwrite_ac);
	    end

	    else if (card_reg.nwrite_sp !== write_vector[3]) begin
	       $sformat(msg, "WADDR decoding failure, clk4=%b, waddr=%b but nwrite_sp=%b", clk4, waddr, card_reg.nwrite_sp);
	    end

	    else if (card_reg.nwrite_pc !== 1'b0 && card_reg.nwrite_pc !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nwrite_pc=%b", card_reg.nwrite_pc);
	    end
	    else if (card_reg.nwrite_dr !== 1'b0 && card_reg.nwrite_dr !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nwrite_dr=%b", card_reg.nwrite_dr);
	    end
	    else if (card_reg.nwrite_ac !== 1'b0 && card_reg.nwrite_ac !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nwrite_ac=%b", card_reg.nwrite_ac);
	    end
	    else if (card_reg.nwrite_sp !== 1'b0 && card_reg.nwrite_sp !== 1'b1) begin
	       $sformat(msg, "Strobe failure: nwrite_sp=%b", card_reg.nwrite_sp);
	    end
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK WADDR");
      end
   end // always @ (clr, npl, p, cpu, cpd)


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY ZERO FLAG
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @(ac) begin
      #100 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (fz != (ac === 16'd0 ? 1'b1 : 1'b0)) begin
	    $sformat(msg, "FZ fault: ac=%04h but fz=%b (should be %b)", ac, fz, (ac === 16'd0 ? 1'b1 : 1'b0));
	 end
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK ZERO FLAG");
      end
   end
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // C PORT PIN-OUT VERIFICATION
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @ (cport_reg, pc_15_10, ac, fn, fz, naccpl,
	     nfppch, nfppcl, nfpdrh, nfpdrl, nfpach, nfpacl, nfpsph, nfpspl) begin
      #180 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Ensure the pinout is correct. This pinout is based on the
	 // backplane spreadsheet at:
	 //
	 // https://docs.google.com/spreadsheets/d/13SUZ3FpwtXLWjZ45vqc8UWCJGz9KExWpTMRTJuJIw_4

	 if (cport_reg[6:1] !== pc_15_10) begin
	    $sformat(msg, "C Port mismatch: cport[6:1]=%b but pc_15_10=%b", cport_reg[6:1], pc_15_10);
	 end

	 else if (cport_reg[18:11] != { nfpspl, nfpsph, nfpacl, nfpach, nfpdrl, nfpdrh, nfppcl, nfppch }) begin
	    $sformat(msg, "C Port mismatch: cport[18:11]=%b but FP strobe vector=%b", cport_reg[18:11],
		     { nfpspl, nfpsph, nfpacl, nfpach, nfpdrl, nfpdrh, nfppcl, nfppch });
	 end

	 else if (cport_reg[38:23] !== cport_ac) begin
	    $sformat(msg, "C Port mismatch: cport[38:23]=%b but ac=%b", cport_reg[38:23], cport_ac);
	 end
	 
	 else if (cport_reg[38] !== fn) begin
	    $sformat(msg, "C Port mismatch: cport[38]=%b but fn=%b", cport_reg[38], fn);
	 end

	 else if (cport_reg[39] !== fz) begin
	    $sformat(msg, "C Port mismatch: cport[39]=%b but fz=%b", cport_reg[39], fz);
	 end

	 else if (cport_reg[40] !== naccpl) begin
	    $sformat(msg, "C Port mismatch: cport[40]=%b but naccpl=%b", cport_reg[40], naccpl);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK CPORT");
      end
   end // always @ (clr, npl, p, cpu, cpd)
endmodule // card_reg_tb

`endif //  `ifndef card_reg_tb_v

// End of file.
