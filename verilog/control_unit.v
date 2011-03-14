///////////////////////////////////////////////////////////////////////////////
//
// Function: CFT0 CPU Control Unit
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "counter.v"
`include "buffer.v"
`include "demux.v"
`include "flipflop.v"
`include "register.v"
`include "reset.v"
`include "clock.v"
`include "constant_store.v"
//`include "register_PR.v"
`include "skip_unit.v"
`include "alu.v"
`include "rom.v"
`include "ram.v"



///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Microcode ROM
//
// NOTES: combines two 8kx8 ROMs into a single 8x16 ROM, permanently selected
// and enabled, which will be used as the heart of the control unit.
//
///////////////////////////////////////////////////////////////////////////////

module microrom (uaddr, control_out, reset);
   input [12:0]  uaddr;		// The microcode ROM address (8k)
   input 	 reset;		// /RESET

   output [23:0] control_out;

   wire [12:0] 	 uaddr;
   wire [23:0] 	 control_out;

   reg 		 ce;
   reg 		 oe;

   initial begin
      ce = 0;			// Chip permanently selected
      oe = 0;			// Output permanently enabled
   end

   rom #(13, 70, "../microcode-00.list") rom0 (uaddr, control_out[7:0], ce, ~reset);
   rom #(13, 70, "../microcode-01.list") rom1 (uaddr, control_out[15:8], ce, ~reset);
   rom #(13, 70, "../microcode-02.list") rom2 (uaddr, control_out[23:16], ce, ~reset);

   // We output an idle microcode pattern when reset is active.
   wire [23:0] idle;
   assign idle = 24'b111111111010100000000000;

   buffer_244 rstbuf0 (reset, reset, idle[7:4], idle[3:0], control_out[7:4], control_out[3:0]);
   buffer_244 rstbuf1 (reset, reset, idle[15:12], idle[11:8], control_out[15:12], control_out[11:8]);
   buffer_244 rstbuf2 (reset, reset, idle[23:20], idle[19:16], control_out[23:20], control_out[19:16]);
endmodule // microrom


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the low order bit microcode counter.
//
// NOTES: a 4 bit counter used to step through microprograms. (Each
// microprogram has a maximum of 16 instructions).
//
///////////////////////////////////////////////////////////////////////////////

module ucounter (step, reset, load, out);
   input step;			// Step counter on posedge.
   input reset;			// -RESET (active low). Reset counter to 0.
   input load;			// Synchronous load.

   output [3:0] out;		// Output count

   wire 	step;
   wire 	reset;

   wire 	tc;

   counter_161 counter (reset, step, 1, 1, load, 0, out, tc);
endmodule // ucounter


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the Address Generation Logic.
//
// NOTES: the AGL creates an address of 16 bits by combining the 10 lower-order
// bits of the IR and the 6 of the PR (the AE is dealt with externally).
//
// If IR[10] (the R flag, R is for register) is clear, the page accessed is
// page zero. Address extension is not affected, which allows multiple 'register
// files', one every 64 kwords.
//
///////////////////////////////////////////////////////////////////////////////

module agl (pc, r, offset, oe, a);
   input [15:0]  pc;
   input 	 r;
   input [9:0] 	 offset;
   input 	 oe;
   
   wire [15:0] 	 pc;
   wire 	 r;
   wire [9:0] 	 offset;

   output [15:0] a0, a;
   output [5:0]  p;		// The page.

   // Zero page handling.
   and(p[0], pc[10], r);
   and(p[1], pc[11], r);
   and(p[2], pc[12], r);
   and(p[3], pc[13], r);
   and(p[4], pc[14], r);
   and(p[5], pc[15], r);

   // Concatenate the page and ir field.
   assign a0 = {p, offset};

   // Buffer it.
   buffer_244 buf0 (oe, oe, a0[3:0],  a0[7:4],   a[3:0],  a[7:4]);
   buffer_244 buf1 (oe, oe, a0[11:8], a0[15:12], a[11:8], a[15:12]);

endmodule // agl


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: The Auto-Increment Logic
//
// This is simple, but it's a separate module to keep the control unit
// as simple as possible.
//
// Page 0 has 1023 'registers'. Of these, we wouldn't mind having 64
// autoincrement ones. To do this, we partially decode MAR and ensure
// it matches the pattern 16'b000000001XXXXXXX, which makes addresses
// 128-255 autoincrement.
//
// We can do this with two 74xxx ICs.
//
///////////////////////////////////////////////////////////////////////////////

module ail (mar, clock, clear, reset, autoinc);
   input [15:0] mar;
   input 	clock;
   input 	clear;
   input 	reset;		// Active high.
   output 	autoinc;	// Active low.

   // Evaluate mar[15:8] == 0 using two ICs (1x 7402, one 7408).
   nor #10 nor_74hct02a (x0, mar[15], mar[14]);
   nor #10 nor_74hct02b (x1, mar[13], mar[12]);
   nor #10 nor_74hct02c (x2, mar[11], mar[10]);
   nor #10 nor_74hct02d (x3, mar[9], mar[8]);

   and #10 and_74hct08a (y0, x0, x1);
   and #10 and_74hct08b (y1, x2, x3);

   and #10 and_74hct08c (hizero, y0, y1); // hizero is active high.
   and #10 and_74hct08d (j, hizero, mar[7]); // autoinc is active high.

   flipflop_112 ff (j, 0, clock, clear, reset, autoinc, ,
		    0, 0, clock, 1'b1, 1'b1, , );

endmodule // ail

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Unit-to-unit decoder
//
// NOTE: decodes bits 1..4 of the microinstruction to determine which unit's
// output to enable, and which unit to latch it into.
//
// TIMING: the read unit outputs its value on the ibus. The write unit
// latches from the ibus. Obviously, these should not happen
// simultaneously. We implement a delay line for this. Control lines
// are registered using flip-flops.
//
//                __________            __________            __________
// CLK __________|          |__________|          |__________|          |__
//      _________            __________            __________            __
// CLK2          |__________|          |__________|          |__________|
//               :          :
//               |----------:---------|  Source unit data valid
//                          :_____________________
// Latch ___________________|                     |________________________
//                          :
//                          : Target unit latches on rising edge
//
///////////////////////////////////////////////////////////////////////////////

module unit_demux (r_unit, w_unit, clock_read, clock_write, clock_pulse, reset,
		   w_dbus, w_mar, w_pc, w_ir, w_dr, w_a,
		   r_dbus, r_pc, r_agl, r_const, r_dr, r_a,
		   r_add, r_and, r_or, r_xor, r_not, r_roll);
   input [3:0] r_unit;
   input [2:0] w_unit;
   input       clock_read;
   input       clock_write;
   input       clock_pulse;
   input       reset;

   output      w_dbus;
   output      w_mar;
   output      w_pc;
   output      w_ir;
   output      w_dr;
   output      w_a;

   output      r_dbus;
   output      r_pc;
   output      r_agl;
   output      r_const;
   output      r_dr;
   output      r_a;
   output      r_add;
   output      r_and;
   output      r_or;
   output      r_xor;
   output      r_not;
   output      r_roll;

   // CAUTION: PULL UP ALL OUTPUTS OR SHORTS MAY OCCUR DURING RESET.
   tri1 [7:0]  w_y;
   tri1 [15:0]  r_y;
   
   wire [7:0]  w_y0;
   wire [7:0]  r_y0, r_y1;

   // Write-unit decoder (always enabled)
   demux_138 w_demux (1, 0, 0, w_unit, w_y0);
   //flipflop_175 wff0 (w_y0[3:0], w_y[3:0], , clock_write, reset);
   //flipflop_175 wff1 (w_y0[7:4], w_y[7:4], , clock_write, reset);
   // TODO: fix choice of FF here.
   //flipflop_574 w_reg (w_y0, w_y, clock_write, ~reset);
   assign w_y = w_y0;
 

   // w_y[0] = no write unit
   or (w_dbus, w_y[1], clock_pulse);	// 001 = DBUS
   or (w_mar, w_y[2], clock_pulse);	// 010 = MAR
   or (w_pc, w_y[3], clock_pulse);	// 011 = PC
   or (w_ir, w_y[4], clock_pulse);	// 100 = IR
   or (w_dr, w_y[5], clock_pulse);	// 101 = DR
   or (w_a, w_y[6], clock_pulse);	// 110 = A
   //or (w_pr, w_y[7], clock_pulse);	// 111 = PR


   // Read-unit 4-to-16 decoder (always enabled)
   demux_138 r_demux0 (1, 0, r_unit[3], r_unit[2:0], r_y0);
   demux_138 r_demux1 (r_unit[3], 0, 0, r_unit[2:0], r_y1);
   
   //flipflop_574 r_reg (r_y0, r_y, clock_read, ~reset);
   ////flipflop_175 rff0 (r_y0[3:0], r_y[3:0], , clock_read, reset);
   ////flipflop_175 rff1 (r_y0[7:4], r_y[7:4], , clock_read, reset);

   assign r_y = {r_y1, r_y0};

   // r_y[0] = no read unit
   assign r_dbus = r_y[1];	// 001 = DBUS
   assign r_agl = r_y[2];	// 010 = AGL
   assign r_pc = r_y[3];	// 011 = PC
   assign r_dr = r_y[4];	// 100 = IR
   assign r_a = r_y[5];		// 101 = A
   assign r_const = r_y[6];	// 110 = constant (OP decides between 0 and 1)
   //assign r_pr = r_y[7];	// 111 = PR

   assign r_add = r_y[8];
   assign r_and = r_y[9];
   assign r_or = r_y[10];
   assign r_xor = r_y[11];
   assign r_not = r_y[12];
   assign r_roll = r_y[13];
   
endmodule // unit_demux


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Control Unit
//
// NOTES: read and interpret microcode that will be used to drive other CPU
// units.
//
///////////////////////////////////////////////////////////////////////////////

module control_unit (abus, dbus, ibus,
		     reset,
		     clock, clock2, clock3, clock4,
		     mem, io, r, w, halt);
   inout [15:0]  dbus;
   inout [15:0]  ibus;
   input 	 reset;		// -RESET: active low reset signal

   output 	 clock;
   output 	 clock2;	// Phase 2 of the clock.
   output 	 clock3;	// Phase 3 of the clock.
   output 	 clock4;	// Phase 4 of the clock.
   output [15:0] abus;
   output        mem;
   output        io;
   output        r;
   output        w;
   output 	 halt;

   wire 	 clock14;

   assign clock14 = clock | clock4;

   wire [15:0] 	 dbus;
   //reg  [15:0]   dbus_write;	// Driver for writing data to the dbus.
   
   wire [15:0] 	 ibus;
   //wire [15:0]   ibus_write;	// Driver for writing data to the ibus.
   wire 	 clock;
   wire 	 reset;

   wire [15:0] 	 abus;

   wire [15:0] 	 ir;
   
   // ACTIVE-HIGH LINES ARE PULLED DOWN
   tri0 [2:0] 	 write_unit;	// The unit to write to

   // ALL THESE ARE PULLED UP
   tri1 	 w_dbus;	// Write to the data bus
   tri1 	 w_pc;		// Write to the PC
   tri1 	 w_dr;		// Write to the DR
   tri1 	 w_a;		// Write to the A
   tri1 	 w_mar;		// Write to the MAR
   
   tri0 [3:0] 	 read_unit;	// The unit to read from

   // ALL THESE ARE PULLED UP
   tri1 	 r_dbus;	// Read from the data bus
   tri1 	 r_pc;		// Read the PC
   tri1 	 r_agl;		// Address generation logic
   tri1 	 r_const;	// Constant store
   tri1 	 r_dr;		// Read the DR
   tri1          r_a;		// Read the Accumulator
   tri1 	 r_add;		// ALU ADD
   tri1 	 r_and;		// ALU AND
   tri1 	 r_or;		// ALU OR
   tri1 	 r_xor;		// ALU XOR
   tri1 	 r_not;		// ALU NOT
   tri1 	 r_roll;	// ALU ROLL

   tri1 	 inc_a;		// Increment A
   tri0 	 cpl;		// Complelent L
   tri0 	 cpi;		// Complement I
   tri1          inc_pc;	// Increment PC

   tri0          l_out;		// L output from the ALU
   tri0          l_latch; 	// Clock in L output from the ALU

   // ACTIVE-LOW LINES ARE PULLED UP
   tri1 	 cll;		// Clear L
   tri1 	 cli;		// Clear I
   
   //tri1		 dab;		// -DAB: drive address bus
   tri1		 mem;		// -MEM: memory access
   tri1		 io;		// -IO: I/O access
   tri1		 r;		// -R: read data
   tri1		 w;		// -W: read data
   tri1          go_fetch; 	// -END: go back to fetch cycle.

   // This is output by the temporary debug I/O unit. In a real implementation,
   // the front panel I/O unit would contain a flip-flop to control the clock,
   // and that would contain this signal.
   tri1          halt;		// HALT: stop the clock.

   // Autoincrement: this control signal is 0 when the MAR incicates
   // an auto-increment location.
   wire          autoinc;

   wire [12:0] 	 uaddr;		// The microROM address.
   wire [23:0] 	 control;	// Control signals from the microROM.

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Clock generation
   //
   // For experimentation, we have a three phase clock (0°, 90°, 180°,
   // 270°). Some of these clocks may go away later.
   //
   // The clock generator has a reset signal. It only counts when reset is
   // inactive.
   //
   // The parameter is the period (in ns) of the clock. 1,000 ns = 1 μs =
   // 1/(1MHz).
   //
   ///////////////////////////////////////////////////////////////////////////////

   clock_generator #(1000) clock_generator (clock, clock2, clock3, clock4, halt, rst_hold);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // Reset logic
   //
   ///////////////////////////////////////////////////////////////////////////////

   // reset rst_hold go_fetch => IR.rst
   // ---------------------------------
   //   0       X        X          1
   //   1       1        1          1
   //   1       1        0          0
   //
   // IR.rst = rst_hold AND ~go_fetch

   // We use a 74x161 counter to perform reset sequencing.

   wire 	 rst_hold, resetting, ir_rst;

   //nand (neg_go_fetch, go_fetch, go_fetch);
   //nand (ir_rst, rst_hold, neg_go_fetch);
     
   reset_logic #(10000) reset_logic (clock, reset, rst_hold);
   //flipflop_112h reset_ff (1'b0, 1'b0, clock, rst_hold, go_fetch, ir_rst,);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Buses
   //
   ///////////////////////////////////////////////////////////////////////////////

   // This allows the bus to be bi-directional by simulating a tri-state bus
   // with a bus driver. We use dbus_write (the tri-state bus-driver) to put
   // values on the bus, or just read the dbus wires to perform a bus read.
   //assign dbus = dbus_write;
   //assign ibus = ibus_write;

/* -----\/----- EXCLUDED -----\/-----
   initial begin
      dbus_write = {16{1'bz}};
      //ibus_write = {16{1'bz}};
   end
 -----/\----- EXCLUDED -----/\----- */

   // Connect the dbus and ibus when mem is enabled.
   //assign ibus = r_dbus == 1'b0 ? dbus : {16{1'bz}};
   // port a = ibus
   // port b = dbus
   //
   // w_dbus r_dbus dir en
   // --------------------
   wire buscon;
   and (buscon, mem, r, w);
   buffer_245 idbuf0(r, buscon, ibus[7:0], dbus[7:0]);
   buffer_245 idbuf1(r, buscon, ibus[15:8], dbus[15:8]);



   ///////////////////////////////////////////////////////////////////////////////
   //
   // Registers
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The MAR
   wire [15:0] mar_unbuf;
   rc_reg16 reg_mar (ibus, abus, mar_unbuf, reset, w_mar, dab);

   // The PC resets on /RESET, then decrements by one on /RST_HOLD.
   wire [15:0] pc_unbuf;       // Unbuffered PC connection for the front panel.
   inc_reg16 reg_pc (ibus, ibus, pc_unbuf, w_pc, r_pc, inc_pc, 1'b1, reset);

   // The Accumulator
   wire [15:0] a_unbuf;		// This goes to the ALU A port and front panel.
   inc_reg16 reg_a (ibus, ibus, a_unbuf, w_a, r_a, inc_a, 1'b1, reset);


   // The IR
   rc_reg16 reg_ir (ibus, ir, , reset, w_ir & rst_hold, 1'b0);

   // The DR
   wire [15:0] dr_unbuf;
   inc_reg16 reg_dr (ibus, ibus, dr_unbuf, w_dr, r_dr, inc_dr, dec_dr, reset);

   
   // The L Register
   // TODO: Link these to the ALU.
   assign alu_l_in = l_unbuf;
   reg_L reg_l (alu_l_out, alu_l_latch, cll, cpl, alu_l_toggle, clock14, reset, l_unbuf, );

   // The I Register
   reg_I reg_i (cli, cpi, clock, reset, i_in, );
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // ADDRESS GENERATION LOGIC
   //
   ///////////////////////////////////////////////////////////////////////////////

   agl unit_agl (pc_unbuf, ir[10], ir[9:0], r_agl, ibus);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // AUTOINCREMENT LOGIC
   //
   ///////////////////////////////////////////////////////////////////////////////

   ail unit_ail (mar_unbuf, clock, reset, go_fetch, autoinc);
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CONSTANT STORE
   //
   ///////////////////////////////////////////////////////////////////////////////

   assign cs0 = 1'b0;
   assign cs1 = ir[12];
   constant_store unit_ct (r_const & rst_hold, rst_hold, {cs1, cs0}, ibus);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE FLAG UNIT
   //
   // These should be located close to the Accumulator to cut down on cabling.
   //
   ///////////////////////////////////////////////////////////////////////////////

   tri0        flag_n, flag_z;

   // The easy one.
   assign flag_n = a_unbuf[15];	// Twos complement: A[15] == 1 => A < 0

   wire flag_z0, flag_z1, flag_z2, flag_z3;
   or zf_or_4072_1a (flag_z3, a_unbuf[15], a_unbuf[14], a_unbuf[13], a_unbuf[12]);
   or zf_or_4072_1b (flag_z2, a_unbuf[11], a_unbuf[10], a_unbuf[9], a_unbuf[8]);
   or zf_or_4072_2a (flag_z1, a_unbuf[7], a_unbuf[6], a_unbuf[5], a_unbuf[4]);
   or zf_or_4072_2b (flag_z0, a_unbuf[3], a_unbuf[2], a_unbuf[1], a_unbuf[0]);
   nor zf_nor_7425a (flag_z, flag_z3, flag_z2, flag_z1, flag_z0);
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE ALU
   //
   // Its A port is the Accumulator. Its B port is the DR. Control signals are
   // derived from the microinstruction.
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [2:0] rollop = ir[2:0];	// The least significant 3 bits of the IR
				// select the roll op.

   // TODO: Fix this.
   alu alu (a_unbuf, dr_unbuf, clock14,
	    r_add, r_and, r_or, r_xor, r_not, r_roll, rollop,
	    alu_l_in, alu_l_toggle, alu_l_out, alu_l_latch,
	    ibus);
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Sequencing
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Sequencing
   wire [3:0] 	  skipctl;
   assign read_unit = control[3:0];
   assign write_unit = control[6:4];
   assign skipctl = control[10:7];

   assign inc_a = control[11];
   assign cpl = control[12];	// Complement L
   assign cll = control[13];	// Clear L
   assign cpi = control[14];	// Complement I
   assign cli = control[15];	// Clear I
   
   assign inc_pc = control[16];
   assign inc_dr = control[17];
   assign dec_dr = control[18];
   assign mem = control[19];
   assign io = control[20];
   assign r = control[21];
   assign w = control[22];
   assign go_fetch = control[23];
   //assign halt = control[23];

   and #8 and_7408(dab, mem, io);
   
   // The microPC
   wire [3:0]	 upc;
   ucounter reg_upc (clock, rst_hold, go_fetch, upc);

   // The MicroROM address vector.
   assign uaddr = {rst_hold, 1'b0, ir[15:12], ir[11], skip, autoinc, upc};

   always @(upc) begin
      if (upc == 3) begin
      $display("PC: %h  IR: %s %s %b %h  A: %h  DR: %h", pc_unbuf,
	       ir[15:12] == 0? "TRAP" :
	       ir[15:12] == 1? "????" :
	       ir[15:12] == 2? "LOAD" :
	       ir[15:12] == 3? "STOR" :
	       ir[15:12] == 4? "IN  " :
	       ir[15:12] == 5? "OUT " :
	       ir[15:12] == 6? "JMP " :
	       ir[15:12] == 7? "JSR " :
	       ir[15:12] == 8? "ADD " :
	       ir[15:12] == 9? "AND " :
	       ir[15:12] == 10? "OR  " :
	       ir[15:12] == 11? "XOR " :
	       ir[15:12] == 12? "OP1 " :
	       ir[15:12] == 13? "OP2 " :
	       ir[15:12] == 14? "???? " :
	       ir[15:12] == 15? "LIA " : "????",
	       ir[11] ? "I" : " ", ir[10] ? " " : "Z", ir[9:0], a_unbuf, dr_unbuf);
	 end
   end

   microrom microrom (uaddr, control, reset);

   // The skip unit, plus registering of the SKIP signal.
   skip_unit skip_unit (skipctl, ir[9:0], flag_z, flag_n, l_unbuf, ~rst_hold, skip0);
   wire [2:0] 	 dummy;
   flipflop_175 skip_reg ({3'b0, skip0}, {dummy, skip}, , clock, reset);

   //flipflop_174 skip_reg (skip0, skip, clock, rst_hold);

   // Decode the signals in the microinstruction into individual signals to control units.
   unit_demux unit_demux (read_unit, write_unit, clock2, clock, clock14, reset,
			  w_dbus, w_mar, w_pc, w_ir, w_dr, w_a,
			  r_dbus, r_pc, r_agl, r_const, r_dr, r_a,
			  r_add, r_and, r_or, r_xor, r_not, r_roll);

   // TODO: move this elsewhere.
   memory memory (abus, dbus, mem, r, w);
   
   // TODO: move this elsewhere.
   debug_io debug_io (abus, dbus, io, r, w, halt);
   

endmodule
   

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: An array of SRAMs to the tune of 262,144 16-bit words.
//
// NOTE: combines two 8-bit SRAMs. We preload a ram image to simplify
// simulation.
//
///////////////////////////////////////////////////////////////////////////////

module memory (abus, dbus, mem, r, w);

   input [15:0] abus;
   inout [15:0] dbus;

   input 	mem;		// /MEM: cpu wants to talk to RAM.
   input 	r;		// /R: latch data FROM memory.
   input 	w;		// /W: latch data TO memory.

   wire [17:0] 	a;
   wire [15:0] 	dbus;
   wire 	mem;
   wire 	r;
   wire 	w;

   assign a[17:16] = 2'b00;	// Force high order bits to zero.
   assign a[15:0] = abus[15:0];	// Connect the low order bits to the abus.

   // CPU /W -->  SRAM /WE
   // CPU /R -->  SRAM /OE
   // TODO: change the file.
   // REMOVE THIS!!!
   //assign dbus = (mem || r) ? 16'bzzzzzzzzzzzzzzzz : 16'hffff;
   //assign dbus = (mem || r) ? 16'bzzzzzzzzzzzzzzzz : a;
   wire [7:0] 	x;

   // Debugging.
   always @(posedge w, posedge mem) begin
      if (!w || !mem) begin
	 $display("sram[", abus, "] <- ", dbus);
      end
   end
   
   sram #(18, 55, "../a-00.list", "lo") sram_lo (a, dbus[7:0], mem, w, r);
   sram #(18, 55, "../a-01.list", "hi") sram_hi (a, dbus[15:8], mem, w, r);
endmodule
   
   

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Simulate some I/O for debugging purposes.
//
///////////////////////////////////////////////////////////////////////////////

module debug_io (abus, dbus, io, r, w, halt);

   input [15:0] abus;
   inout [15:0] dbus;

   input 	io;		// /MEM: cpu wants to talk to RAM.
   input 	r;		// /R: latch data FROM memory.
   input 	w;		// /W: latch data TO memory.

   output 	halt;		// Debugging only.

   wire [17:0] 	a;
   wire [15:0] 	dbus;
   wire 	mem;
   wire 	r;
   wire 	w;

   reg 		halt;

   assign a[17:16] = 2'b00;	// Force high order bits to zero.
   assign a[15:0] = abus[15:0];	// Connect the low order bits to the abus.

   // CPU /W -->  SRAM /WE
   // CPU /R -->  SRAM /OE
   // TODO: change the file.
   // REMOVE THIS!!!
   //assign dbus = (mem || r) ? 16'bzzzzzzzzzzzzzzzz : 16'hffff;
   //assign dbus = (mem || r) ? 16'bzzzzzzzzzzzzzzzz : a;
   wire [7:0] 	x;

   wire [9:0] 	addr = abus & 'h3ff;

   initial begin
      halt = 1;
   end
   
   // Debugging.
   always @(posedge w, posedge io) begin
      if (!w || !io) begin
	 if (addr == 'h001) begin
	    $display("*** HALTING");
	    halt <= 1'b0;
	 end
	 else if (addr == 'h101) begin
	    //$display("*** PRINT CHAR: '%s'", dbus[7:0]);
	    $display("CONSOLE: %s", dbus[7:0]);
	 end
	 else if (addr == 'h102) begin
	    $display("CONSOLE: %d", dbus);
	    //$display("*** PRINT INT: %d (%x, %b)", dbus, dbus, dbus);
	 end
	 else $display("io[%h] <- %h", addr, dbus);
      end
   end
endmodule
   
   

// End of file.
