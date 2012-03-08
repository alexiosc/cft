`include "clock.v"
`include "reset.v"
`include "sequencer.v"
`include "unit_decoder.v"
`include "skip_unit.v"
`include "addressing.v"
`include "databus.v"
`include "int.v"
`include "ir.v"
`include "register.v"
`include "alu.v"
`include "memory.v"
`include "io.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Function: The CFT CPU
//
///////////////////////////////////////////////////////////////////////////////

module cft(fpclken, fpustep, fpfast, fpslow, fpreset, nfpram, powerok,
	   nreset,
	   aext, ab, db, nmem, nio, nr, nw,
	   nirq_in,
	   clk1, clk2, clk3, clk4, clk5, nguard);

   input 	 fpclken, fpustep, fpfast, fpslow, fpreset, nfpram;
   input 	 powerok;
   inout 	 nreset;

   output 	 nmem, nio, nr, nw;
   output [7:0]  aext;
   output [15:0] ab;
   inout [15:0]  db, ibus;

   input [7:0] 	 nirq_in;

   output 	 clk1, clk2, clk3, clk4, clk5, nguard;
   
   wire 	 slowclk, testclk;
   wire 	 nrsthold;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Timing and reset
   //
   ///////////////////////////////////////////////////////////////////////////////

   clock_generator clock_generator (fpclken, fpustep,
				    nreset,
				    slowclk, testclk,
				    fpfast, fpslow,
				    clk1, clk2, clk3, clk4, clk5, nguard);
   slow_clock_generator slow_clocks (slowclk, testclk);
   // Reset Logic
   reset_logic reset_logic(nreset, nrsthold, clk1, fpreset, powerok, ibus);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // The Control Unit
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   wire 	 naindex, nskip, fl, fv, nirqs, nws, nhalt;
   wire [15:0] 	 ir;
   wire [3:0] 	 runit, opif;
   wire [2:0] 	 wunit;
   wire 	 ncpl, ncll, nsti, ncli, nincac, nincpc, nincdr, uinstr18;
   wire 	 nend, nuce, nwir;
   wire 	 nragl, nrpc, nrdr, nrac;
   wire 	 nwar, nwpc, nwdr, nwac, nwalu;
   wire 	 nwen;
   
   sequencer sequencer (clk1, nreset,
			naindex, nskip, fl, fv, nirqs, nrsthold, nws, nhalt, ir,
			runit, wunit, opif, ncpl, ncll, nsti, ncli,
			nincac, nincpc, nincdr,
			uinstr18, nmem, nio, nr, nwen, nend,
			nuce);

   unit_decoder decoder (clk5, nguard, nreset, nuce,
			 runit, wunit,
			 nragl, nrpc, nrdr, nrac,
			 nwar, nwpc, nwir, nwdr, nwac, nwalu);

   skip_unit skip_unit (clk1, nreset,
			ir, opif, fneg, fzero, fl, fv,
			nskip);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Addressing and bus drivers
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   wire [15:0] 	 ar;
   wire 	 nsysdev, niodev1, niodev2, niodev3;

   // The Address Register
   reg_ar regar (ibus, nwar, nreset, ar);

   // The SYSDEV# generator
   sysdev_demux sysdev (ab, nio, nsysdev, niodev1, niodev2, niodev3);

   // Auto-Increment Logic
   ail ail (ar, nend, naindex);

   // Address Bus Driver.
   ab_driver ab_driver (ar, nmem, nio, ab);

   // Data Bus Driver.
   databus db_driver (clk5, ibus, nmem, nio, nr, nwen, db, nw);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // Interrupts
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	 nirq, fint, firq;
   intsm intsm (nreset, nsti, ncli, nend, nirq, fint, firq, nirqs);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Registers & Flags
   //
   ///////////////////////////////////////////////////////////////////////////////

   reg_ir regir (ibus, nwir, nreset, ir);

   wire 	 nfltadd, isroll, roll16;
   reg_L regl (nreset, clk5, ncll, ncpl, nfltadd, isroll, roll16, fl);

   // The Major Registers
   wire 	 reset, fneg, fzero, ninccpl;
   wire [15:0] 	 pc, dr, ac;
   not #6 (reset, nreset);
   reg_pc regpc (ibus, nrpc, nwpc, nincpc, reset, pc);
   reg_dr regdr (ibus, nrdr, nwdr, nincdr, reset, dr);
   reg_ac regac (ibus, nrac, nwac, nincac, reset, ac, fneg, fzero, ninccpl);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // ALU
   //
   ///////////////////////////////////////////////////////////////////////////////
   wire 	 nflstrobe;	// Purposefully unconnected (for future expansion)
   alu alu (nreset, nrsthold, clk5, nguard, nirqs,
	    runit,
	    ir, ibus, ac,
	    fl,
	    nwalu,
	    nflstrobe, fv, nfltadd, roll16, isroll);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // Peripherals (some essential)
   //
   ///////////////////////////////////////////////////////////////////////////////
   // Memory banking controller and memory
   wire 	 banking;	// LED connection to front panel
   bank_switch p_bs (nreset, nmem, nw, nsysdev, ab, db, nfpram, aext, banking);

   // RAM and ROM card (512kW RAM, 512kW ROM)
   memory mem (aext, ab, db, nmem, nr, nw);

   // The Interrupt Controller
   intc p_intc (nreset, nsysdev, nr, nw, ab, db, nirq_in, nirq);

   // Some I/O for debugging purposes.
   debug_io debug_io (ab, db, nio, nr, nw, nhalt);
endmodule // cft

// End of file.
