///////////////////////////////////////////////////////////////////////////////
//
// Function: CFT0 CPU Control Unit
//
///////////////////////////////////////////////////////////////////////////////

`include "counter.v"
`include "buffer.v"
`include "demux.v"
`include "flipflop.v"
`include "register.v"
`include "constant_store.v"
//`include "register_PR.v"
`include "skip_unit.v"
`include "alu.v"
`include "int.v"
`include "rom.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Microcode ROM
//
// NOTES: combines three 16kx8 ROMs into a single 16kx24 ROM, permanently
// selected and enabled, which will be used as the heart of the control unit.
//
///////////////////////////////////////////////////////////////////////////////

module microrom (uaddr, control_out, reset);
   input [14:0]  uaddr;		// The microcode ROM address (8k)
   input 	 reset;		// /RESET

   output [23:0] control_out;

   wire [14:0] 	 uaddr;
   wire [23:0] 	 control_out;

   reg 		 ce;
   reg 		 oe;

   wire 	 nreset;

   initial begin
      ce = 0;			// Chip permanently selected
      oe = 0;			// Output permanently enabled
   end

   not #10 mynot (nreset, reset);
   rom #(15, 70, "../microcode/microcode-00.list") rom0 (uaddr, control_out[7:0], ce, nreset);
   rom #(15, 70, "../microcode/microcode-01.list") rom1 (uaddr, control_out[15:8], ce, nreset);
   rom #(15, 70, "../microcode/microcode-02.list") rom2 (uaddr, control_out[23:16], ce, nreset);

   /*
   // We output an idle microcode pattern when reset is active. This is for the
   // Verilog emulator only; on actual hardware, the control lines would be
   // tied up or down, and the reset signal would cause the ROM outputs to go
   // to Z.
   wire [23:0] idle;
   //assign idle = 24'b111111111111111100000000;
   assign idle = 24'b1111111111111111111111;

   buffer_244 rstbuf0 (reset, reset, idle[7:4], idle[3:0], control_out[7:4], control_out[3:0]);
   buffer_244 rstbuf1 (reset, reset, idle[15:12], idle[11:8], control_out[15:12], control_out[11:8]);
   buffer_244 rstbuf2 (reset, reset, idle[23:20], idle[19:16], control_out[23:20], control_out[19:16]);
    */
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
   initial begin
      // $display("BOM: 74x08");
      // $display("BOM: 74x08");
   end

   and #10 and_7408_1a (p[0], pc[10], ~r);
   and #10 and_7408_1b (p[1], pc[11], ~r);
   and #10 and_7408_1c (p[2], pc[12], ~r);
   and #10 and_7408_1d (p[3], pc[13], ~r);
   and #10 and_7408_2a (p[4], pc[14], ~r);
   and #10 and_7408_2b (p[5], pc[15], ~r);

   // Concatenate the page and ir field.
   assign a0 = {p, offset};

   // Buffer it.
   buffer_244 buf0 (oe, oe, a0[3:0],  a0[7:4],   a[3:0],  a[7:4]);
   buffer_244 buf1 (oe, oe, a0[11:8], a0[15:12], a[11:8], a[15:12]);

endmodule // agl


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: The Auto-Index Logic
//
// This is simple, but it's a separate module to keep the control unit
// as simple as possible.
//
// Page 0 has 1024 'registers'. Of these, we wouldn't mind having 128
// autoindex ones. To do this, we partially decode MAR and ensure
// it matches the pattern 16'b000000001XXXXXXX, which makes addresses
// 128-255 autoindex.
//
// We can do this with two 74xxx ICs.
//
// The direction of indexing (increment or decrement) is controlled by
// a System Device registers #0 and #1. OUT SYSDEV 0 sets
// autoincrement. OUT SYSDEV 1 sets autodecrement.
//
///////////////////////////////////////////////////////////////////////////////

module ail (mar, clock, reset, clear, autoindex);
   input [15:0] mar;
   input 	clock;
   input 	clear;
   input 	reset;		// Active high.
   output 	autoindex;	// Active low.

   wire 	x0, x1, x2, x3, y0, y1, hizero, j;

   initial begin
      // $display("BOM: 74hct02");
      // $display("BOM: 74hct08");
   end

   // Evaluate mar[15:8] == 0 using two ICs (1x 7402, one 7408).
   nor #10 nor_74hct02a (x0, mar[15], mar[14]);
   nor #10 nor_74hct02b (x1, mar[13], mar[12]);
   nor #10 nor_74hct02c (x2, mar[11], mar[10]);
   nor #10 nor_74hct02d (x3, mar[9], mar[8]);

   and #10 and_74hct21a (hizero, x0, x1, x2, x3);

   and #10 and_74hct21b (j, hizero, mar[7]); // autoindex is active high.

   // The AIL FF goes high on reset (set1 = reset), because this is
   // the best way to give it a definite value for the sake of the
   // Verilog simulator.
   flipflop_112 ff (j, 0, clock, 1, reset, autoindex, ,
		    0, 0, 0, 1, 1, , );

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

module unit_demux (r_unit, w_unit, clock,
		   busbusy, reset, guardpulse,
		   //w_dbus,
		   w_mar, w_pc, w_ir, w_dr, w_ac, w_alu,
		   //r_dbus,
		   r_pc, r_agl, r_cs1, r_cs2, r_dr, r_ac,
		   r_aluop);
   input [3:0] r_unit;
   input [2:0] w_unit;
   input       clock;
   input       busbusy;
   input       reset;
   input       guardpulse;

   //output      w_dbus;
   output      w_mar;
   output      w_pc;
   output      w_ir;
   output      w_dr;
   output      w_ac;
   output      w_alu;

   //output      r_dbus;
   output      r_pc;
   output      r_agl;
   output      r_cs1;
   output      r_cs2;
   output      r_dr;
   output      r_ac;
   //output      r_add;
   //output      r_and;
   //output      r_or;
   //output      r_xor;
   //output      r_not;
   //output      r_roll;
   output [3:0] r_aluop;

   // CAUTION: PULL UP ALL OUTPUTS OR SHORTS MAY OCCUR DURING RESET.
   tri1 [7:0]  w_y;
   //tri1 [15:0]  r_y;
   tri1 [7:0]  r_y;
   
   wire [7:0]  w_y0;
   wire [7:0]  r_y0;
   //wire [7:0]  r_y1;

   initial begin
       // $display("BOM: 74x32");
       // $display("BOM: 74x32");
   end

   // Write-unit decoder. Enabled when clock14 = 0.
   demux_138 w_demux (1, 0, clock, w_unit, w_y0);
   assign w_y = w_y0;

   // w_y[0] = no write unit
   //assign w_dbus = w_y[1];
   assign w_mar = w_y[2];
   assign w_pc = w_y[3];
   assign w_ir = w_y[4];
   assign w_dr = w_y[5];
   assign w_ac = w_y[6];
   assign w_alu = w_y[7];
   
   // Read-unit 4-to-16 decoder (always enabled)
   demux_138 r_demux0 (1, r_unit[3], 0, r_unit[2:0], r_y0); // SOUP
   // The v2 (ROM-based) ALU doesn't need decoded read enable signals
   //demux_138 r_demux1 (r_unit[3], 0, 0, r_unit[2:0], r_y1);
   
   //assign r_y = {r_y1, r_y0};
   assign r_y = r_y0;		// Just use the register enables.


   // The Constant Store and Address Generation Logic seem to be
   // causing problems with bus contention. We'll OR their enable
   // lines with the guardpulse to make sure they let go of the bus in
   // time. For now, the remaining units don't seem to cause bus
   // contentions, so we'll leave them as they are.

   //Guardpulse currently disabled.
   //or #20 or_7432_2c (r_agl, r_y[2], guardpulse);
   //or #20 or_7432_2d (r_cs1, r_y[6], guardpulse);
   //or #20 or_7432_3a (r_cs2, r_y[7], guardpulse);

   //or #20 or_7432_4a (r_pc, r_y[3], guardpulse);
   //or #20 or_7432_4b (r_dr, r_y[4], guardpulse);
   //or #20 or_7432_4c (r_a, r_y[5], guardpulse);
   
   assign r_agl = r_y[2];	// 010 = AGL
   assign r_cs1 = r_y[6];	// 110 = constant source 1
   assign r_cs2 = r_y[7];	// 111 = constant source 2
   assign r_pc = r_y[3];	// 011 = PC
   assign r_dr = r_y[4];	// 100 = IR
   assign r_ac = r_y[5];	// 101 = AC

   // r_y[0] = no read unit
   //assign r_dbus = r_y[1];	// 001 = DBUS
   //assign r_agl = r_y[2];	// 010 = AGL
   //assign r_cs1 = r_y[6];	// 110 = constant source 1
   //assign r_cs2 = r_y[7];	// 111 = constant source 2

   // The v2 (ROM-based) ALU doesn't need decoded read enables.
   //assign r_add = r_y[8];
   //assign r_and = r_y[9];
   //assign r_or = r_y[10];
   //assign r_xor = r_y[11];
   //assign r_not = r_y[12];
   //assign r_roll = r_y[13];
   assign r_aluop = r_unit;
   
endmodule // unit_demux


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: The flag unit.
//
///////////////////////////////////////////////////////////////////////////////

module flag_unit (a, n, z);
   input [15:0] a;
   output 	n;
   output 	z;

   wire [15:0] 	a;
   tri0 	n;
   tri0 	z;

   // The easy one.
   assign n = a[15];	// Twos complement: A[15] == 1 => A < 0

   wire z0, z1, z2, z3;

   initial begin
      // $display("BOM: 4072");
      // $display("BOM: 7425");
   end
   
   or #10 zf_or_4072_1a (z3, a[15], a[14], a[13], a[12]);
   or #10 zf_or_4072_1b (z2, a[11], a[10], a[9], a[8]);
   or #10 zf_or_4072_2a (z1, a[7], a[6], a[5], a[4]);
   or #10 zf_or_4072_2b (z0, a[3], a[2], a[1], a[0]);
   nor #10 zf_nor_7425a (z, z3, z2, z1, z0);

endmodule // flag_unit


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Control Unit
//
// NOTES: read and interpret microcode that will be used to drive other CPU
// units.
//
///////////////////////////////////////////////////////////////////////////////

module control_unit (abus, dbus, ibus,
		     reset, rst_hold_in, irq,
		     clock, clock14, guardpulse,
		     mem, io, r, w, halt,
		     iospace_region);
   inout [15:0]  dbus;
   inout [15:0]  ibus;
   input 	 reset;		// -RESET: active low reset signal
   input 	 rst_hold_in;	// Long reset pulse to allow hardware to settle.
   input 	 irq;           // active low interrupt request signal

   input  	 clock;
   input  	 clock14;
   input  	 guardpulse;

   output [15:0] abus;
   output        mem;
   output        io;
   output        r;
   output        w;
   output 	 halt;
   output        iend;

   output [7:0]  iospace_region;

   wire [15:0] 	 dbus;
   //reg  [15:0]   dbus_write;	// Driver for writing data to the dbus.
   
   wire [15:0] 	 ibus;
   //wire [15:0]   ibus_write;	// Driver for writing data to the ibus.
   wire 	 reset;

   wire [15:0] 	 abus;

   wire [15:0] 	 ir;

   // Unbuffered values from the registers used to control/drive units other
   // than the ibus, and also for the front panel.
   wire [15:0] pc_unbuf;
   wire [15:0] mar_unbuf;
   wire [15:0] a_unbuf;
   wire [15:0] dr_unbuf;
   
   // ACTIVE-HIGH LINES ARE PULLED DOWN
   tri0 [2:0] 	 write_unit;	// The unit to write to

   // ALL THESE ARE PULLED UP
   tri1 	 w_dbus;	// Write to the data bus
   tri1 	 w_pc;		// Write to the PC
   tri1 	 w_dr;		// Write to the DR
   tri1 	 w_ac;		// Write to the A
   tri1 	 w_alu;		// Write to the ALU B port
   tri1 	 w_mar;		// Write to the MAR
   tri1 	 w_ir;		// Write to the IR.
   
   tri0 [3:0] 	 read_unit;	// The unit to read from

   // ALL THESE ARE PULLED UP
   tri1 	 r_dbus;	// Read from the data bus
   tri1 	 r_pc;		// Read the PC
   tri1 	 r_agl;		// Address generation logic
   tri1 	 r_cs1;	// Constant store (bank 1)
   tri1 	 r_cs2;	// Constant store (bank 2)
   tri1 	 r_dr;		// Read the DR
   tri1          r_ac;		// Read the Accumulator
   tri1 [3:0]    r_aluop;       // The v2 (ROM-based) ALU operator field.
   //tri1 	 r_add;		// ALU ADD
   //tri1 	 r_and;		// ALU AND
   //tri1 	 r_or;		// ALU OR
   //tri1 	 r_xor;		// ALU XOR
   //tri1 	 r_not;		// ALU NOT
   //tri1 	 r_roll;	// ALU ROLL

   tri1          inc_pc;	// Increment PC
   tri1 	 step_ac;	// Increment/Decrement AC
   tri1 	 step_dr;	// Increment/Decrement DR
   tri1 	 dec;		// Decrement AC/DR

   tri0          l_out;		// L output from the ALU
   tri0          l_latch; 	// Clock in L output from the ALU

   // ACTIVE-LOW LINES ARE PULLED UP
   tri1 	 cll;		// Clear L
   tri1 	 cpl;		// Complement L
   tri1 	 cli;		// Clear I
   tri1 	 sti;		// Set I
   
   //tri1		 dab;		// -DAB: drive address bus
   tri1		 mem;		// -MEM: memory access
   tri1		 io;		// -IO: I/O access
   tri1		 r;		// -R: read data
   tri1		 w;		// -W: read data
   tri1          iend; 	// -END: go back to fetch cycle.

   // This is output by the temporary debug I/O unit. In a real implementation,
   // the front panel I/O unit would contain a flip-flop to control the clock,
   // and that would contain this signal.
   tri1          halt;		// HALT: stop the clock.

   // Autoincrement: this control signal is 0 when the MAR incicates
   // an auto-increment location.
   wire          autoindex;

   wire [14:0] 	 uaddr;		// The microROM address.
   wire [23:0] 	 control;	// Control signals from the microROM.

   // These are part of the system device

   //wire 	 mode_autoinc;	// Active low.
   //wire 	 mode_autodec;	// Active low.

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Buses
   //
   ///////////////////////////////////////////////////////////////////////////////

   // TODO: Turn buscon into 74xxx gates.
   wire 	 buscon, guardpulse;
   //assign #120 guardpulse = clock3 & clock4;
   and #10 (buscon, mem, io, r, w);

   buffer_245 idbuf0(r, buscon, ibus[7:0], dbus[7:0]);
   buffer_245 idbuf1(r, buscon, ibus[15:8], dbus[15:8]);
   //buffer_245 idbuf0(r, buscon | guardpulse, ibus[7:0], dbus[7:0]);
   //buffer_245 idbuf1(r, buscon | guardpulse, ibus[15:8], dbus[15:8]);



   ///////////////////////////////////////////////////////////////////////////////
   //
   // Registers
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The MAR
   rc_reg16 reg_mar (ibus, abus, mar_unbuf, reset, w_mar, dab);

   // The PC
   inc_reg16 reg_pc (ibus, ibus, pc_unbuf, w_pc, r_pc, inc_pc, 1'b1, reset);

   // The Accumulator
   inc_reg16 reg_a (ibus, ibus, a_unbuf, w_ac, r_ac, step_ac, 1'b1, reset);

   // The IR
   wire ir_and_reset;
   and #10 and_7408a (ir_and_reset, w_ir, rst_hold);

   // NOTE: Verilog is strict about signal states, but unaware of the
   // complexities of a processor. We don't NEED a reset signal for
   // the IR. Its initial value is undefined, but is immediately
   // loaded by the sequencer. The IR is an input to the sequencer,
   // though. This feedback loop could break the processor, were it
   // not for the fact that the microcode's reset sequence IGNORES the
   // value of the IR (because, of course, it's undefined). The
   // Verilog simulator doesn't know this, so it chokes.
   rc_reg16 reg_ir (ibus, ir, , reset, w_ir, 1'b0);

   // The DR
   //
   inc_reg16 reg_dr (ibus, ibus, dr_unbuf, w_dr, r_dr, step_dr, 1, reset);

   // The L Register
   wire l_unbuf;
   
   assign alu_l_in = l_unbuf;
   //TODO: make alu_l_toggle a wired AND (open collector)
   reg_L reg_l (alu_l_out, alu_l_latch, cll, cpl & (~alu_l_toggle), clock14, reset, l_unbuf, );

   // The I Register
   wire i_flag;
   reg_I reg_i (cli, sti, clock, reset, , i_flag);

   // The V Register
   // TODO: wire this up properly;
   wire 	v_unbuf;
   assign v_unbuf = 1'b1;


   ///////////////////////////////////////////////////////////////////////////////
   //
   // Interrupt & reset logic
   //
   ///////////////////////////////////////////////////////////////////////////////

   tri1 	rst_hold;
   wire 	aaa;
   assign aaa = ~clock & iend;
   //flipflop_112h ff_rst_hold (1'b0, 1'b0, 1'b0, rst_hold_in, aaa, , rst_hold);
   assign rst_hold = rst_hold_in;

   wire int_out;
   int_unit int (clock14, upc, iend, cli, i_flag, irq, reset, int_out);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // ADDRESS GENERATION LOGIC
   //
   ///////////////////////////////////////////////////////////////////////////////

   agl unit_agl (pc_unbuf, ir[10], ir[9:0], r_agl, ibus);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE I/O SPACE DECODER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The decoder's aim is twofold. Originally, it was meant to decode
   // the SYSTEM device so that system flags may be accessed. It
   // splits the least significant 10 bits of the address into eight
   // 7-bit regions. The control lines for these regions will be
   // exported on the bus, simplifying interfacing.
   //
   // The most significant 6 bits [15:10] are ignored, which is
   // customary for CFT I/O: we partially decode the A bus because,
   // essentially, all I/O should be zero-page-addressed.

   //demux_138 iospace_demux (1, 0, 0, mar_unbuf[9:7], iospace_region);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE SYSTEM I/O DEVICE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The System Device controls the CPU. It owns I/O addresses 0 to
   // 7, which it uses as follows:
   // 
   // 0 000 -> 00010XX000: Autoindex = Increment
   // 1 001 -> 00010X0001: Autoindex = Decrement
   // 2 002 -> 00010XX010: 
   // 3 003 -> 00010XX011: 
   // 4 004 -> 00010XX100:
   // 5 005 -> 00010XX101:
   // 6 006 -> 00010XX110:
   // 7 007 -> 00010XX111:

   // DECODING:
   //
   // BITS:
   // 15  14  13  12  11  10  09  08  07  06  05  04  03  02  01  00
   // ****** IGNORED *******  ** IOR0 **   
   //  X   X   X   X   X   X   0   0   0   1   0   X   X  D2  D1  D0
   //
   // Ignoring bits 10:15 which aren't really used for I/O, this
   // partially decodes I/O addresses 00010XX011 where XXX are don't
   // care bits and AAA are the actual device addresses.
   //
   // As such, the 32 I/O addresses 0x040 to 0x05b are used by the
   // system (i.e. the CPU). They contain 4 copies of the same eight
   // addresses.

   //wire [7:0] sysdev;
   //demux_138 sysdev_demux (mar_unbuf[6], mar_unbuf[5], iospace_region[0],
   //			   mar_unbuf[2:0], sysdev);
   //wire       set_autoinc;
   //wire       set_autodec;

   // The autoinc/autodec flipflop is in the autoincrement logic module.
   //assign set_autoinc = sysdev[0]; // Active low
   //assign set_autodec = sysdev[1]; // Active low
     

   ///////////////////////////////////////////////////////////////////////////////
   //
   // AUTOINCREMENT LOGIC
   //
   ///////////////////////////////////////////////////////////////////////////////

   //ail unit_ail (mar_unbuf, clock, reset, iend, autoindex,
   //		 set_autoinc, set_autodec, mode_autoinc, mode_autodec);
   ail unit_ail (mar_unbuf, clock, reset, iend, autoindex);
      

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CONSTANT STORE
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   //constant_store unit_ct (rst_hold, int_out, r_cs1, r_cs2, ibus);

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE FLAG UNIT
   //
   // These should be located close to the Accumulator to cut down on cabling.
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire flag_n, flag_z;
   flag_unit flag_unit (a_unbuf, flag_n, flag_z);

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE ALU
   //
   // Its A port is the Accumulator. Its B port is inside the ALU. Control
   // signals are derived from the microinstruction.
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [2:0] rollop = ir[2:0];	// The least significant 3 bits of the IR
				// select the roll op.

   wire alu_l_in;
   wire alu_l_out;
   wire alu_l_toggle;
   wire alu_l_latch;

   rom_alu alu (ibus, w_a, w_alu,
		clock14, guardpulse, reset, rst_hold,
		r_aluop, rollop,
		alu_l_in, alu_l_toggle, alu_l_out, alu_l_latch, int_out,
		ibus);
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Sequencing
   //
   // This is build around a microcode ROM addressed by a vector of various
   // signals around the CPU. The microcode ROM outputs control signals that
   // drive CPU units and can also change the microcode address.
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Sequencing
   wire [3:0] 	  skipctl;
   assign read_unit = control[3:0];
   assign write_unit = control[6:4];
   assign skipctl = control[10:7];

   assign cpl = control[11];	// Complement L
   assign cll = control[12];	// Clear L
   assign sti = control[13];	// Set I
   assign cli = control[14];	// Clear I
   
   assign inc_pc = control[15];
   assign step_dr = control[16];
   assign step_ac = control[17];
   assign dec = control[18];
   
   assign mem = control[19];	// Active low
   assign io = control[20];	// Active low
   assign r = control[21];	// Active low
   assign w = control[22];	// Active low
   assign iend = control[23] & ifend;	// Active low (note: '&' performed by open collector)
   
   //assign halt = control[23];

   wire 	  dab;
   and #8 and_7408c(dab, mem, io);
   
   // The microPC
   wire [3:0] 	  upc;
   ucounter reg_upc (clock, rst_hold, iend, upc);

   // The MicroROM address vector.
   assign uaddr = {rst_hold, int_out, v_unbuf, l_unbuf, ir[15:12], ir[11], skip, autoindex, upc};

   // The MicroROM itself.
   microrom microrom (uaddr, control, reset);

   // Debugging.
`ifndef DISABLE_CU_DEBUGGING
   always @(upc) begin
      if (upc == 3) begin
      $display("PC: %h  IR: %s %s %b %h  L: %b  A: %h  DR: %h", pc_unbuf,
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
	       ir[11] ? "I" : " ", ir[10] ? " " : "Z", ir[9:0], l_unbuf, a_unbuf, dr_unbuf);
	 end
   end // always @ (upc)
`endif
   
   // The skip unit, plus registering of the SKIP signal.
   wire skip0, skip;
   wire [2:0] 	 dummy;
   wire 	 nrst_hold;

   not #10 my_not(nrst_hold, rst_hold);

   wire 	 ifend;
   skip_unit skip_unit (skipctl, ir[9:0], flag_z, flag_n, l_unbuf, v_unbuf, nrst_hold, skip0, ifend);
   flipflop_175 skip_reg ({3'b0, skip0}, {dummy, skip}, , clock, rst_hold);

   // Decode the signals in the microinstruction into individual signals to control units.
   unit_demux unit_demux (read_unit, write_unit, clock14, buscon, reset, guardpulse,
			  /*w_dbus,*/ w_mar, w_pc, w_ir, w_dr, w_a, w_alu,
			  /*r_dbus,*/ r_pc, r_agl, r_cs1, r_cs2, r_dr, r_ac,
			  r_aluop); /* v2 ROM-based ALU */
   			  //r_add, r_and, r_or, r_xor, r_not, r_roll); /* v1 discrete ALU */

endmodule
   

// End of file.
