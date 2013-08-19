`include "vibrator.v"
`include "counter.v"
`include "comparator.v"
`include "flipflop.v"
`include "demux.v"
`include "mux.v"
`include "ram.v"
`include "serial.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// CLOCK PHASE DELAY 
//
///////////////////////////////////////////////////////////////////////////////

module ClockDelay(d, clk, ph, y);

   input      d, clk, ph;

   output     y;

   tri0 [7:0] phases;

   flipflop_374i phaseFF ({d, phases[7:1]}, 0, clk, phases);
   assign y = phases[ph];

endmodule // clockDelay


///////////////////////////////////////////////////////////////////////////////
//
// CLOCK GENERATOR
//
///////////////////////////////////////////////////////////////////////////////

module ClockGenerator(nreset, nvduen, clk, clk2, clk4, clk8);

   input      nreset, nvduen;
   
   output     clk, clk2, clk4, clk8;

   wire       pixclk2, pixclk4, pixclk8;
   wire [7:0] q;

   vibrator_xo #40 clock (clk);
   counter_590 clockDiv (clk, nvduen, nreset, clk, 0, q, );

   assign clk2 = q[0];
   assign clk4 = q[1];
   assign clk8 = q[2];
    
endmodule // ClockGenerator



///////////////////////////////////////////////////////////////////////////////
//
// THE FRAME STATE MACHINE
//
///////////////////////////////////////////////////////////////////////////////

// NOTE: RESET# input used for simulation only.
// NOTE: HCNT and VCNT may only be needed for debugging.
module FrameStateMachine(nreset, clk4, clk8,
			 hs, nhs, hvideo, nhvideo,
			 vs, nvs, vvideo, nvvideo,
			 video, nvideo
			 );

   input nreset, clk4, clk8;

   output 	hs, nhs, hvideo, nhvideo;

   output 	vs, nvs, vvideo, nvvideo;

   output 	video, nvideo;

   wire [7:0] 	hcnt;
   wire [8:0] 	vcnt;

   //
   // The horizontal cell counter
   //

   wire       nnewfield;
   
   // NOTE: RESET# input used for simulation only. AND gate unnecessary on
   // hardware.
   counter_590i fsmHorzCounter (clk8, 0, nreset & nnewfield, clk4, 0, hcnt, );

   //
   // The horizontal comparators
   //

   wire [3:0] hcmp;
   comparator_688 fsmHorzCompA (hcnt,   1, 0, hcmp[3]); // horizontal back porch
   comparator_688 fsmHorzCompB (hcnt,  81, 0, hcmp[2]); // field width
   comparator_688 fsmHorzCompC (hcnt,  87, 0, hcmp[1]); // horizontal front porch
   comparator_688 fsmHorzCompD (hcnt,  99, 0, hcmp[0]); // horizontal sync width

   //
   // State: horizontal sync and video on
   //

   wire       hvideo, nhvideo;

   flipflop_74h fsmStateHVideo(0, 0, nhvidon, nhvidoff, hvideo, nhvideo);
   flipflop_74h fsmStateHSync(0, 0,  nhson, nhsoff, hs, nhs);

   //
   // The vertical cell counter
   //

   tri1       nnewframe;
   wire       vcnt8;
   
   // RESET# used for simulation only.
   counter_590i fsmVertCounter (nhsoff, 0, nreset & nnewframe, clk8, 0, vcnt[7:0], vcnt8);
   flipflop_74h fsmVertCountBit8 (1, vcnt8, 1, nreset & nnewframe, vcnt[8], );

   //
   // The vertical comparators
   //

   wire [3:0] vcmp;
   // For these, use the G# signal as a ninth bit, shuffling lines accordingly.
   comparator_688 fsmVertCompA (vcnt[7:0],  12, vcnt[8], vcmp[0]); // 12 (back porch)
   comparator_688 fsmVertCompB (vcnt[8:1], 8'b11001110, vcnt[0], vcmp[1]); // 412 (frame)
   comparator_688 fsmVertCompC ({vcnt[8:7], vcnt[5:0]},  8'b11111111, vcnt[6], vcmp[2]); // 447 (front porch)
   comparator_688 fsmVertCompD ({vcnt[8:6], vcnt[4:0]}, 8'b11100001, vcnt[5], vcmp[3]); // 449 (sync width)

   //
   // State: horizontal sync and video on
   //

   wire       vvideo, nvvideo;
   
   flipflop_74h fsmStateVVideo(0, 0, nvvidon, nvvidoff, vvideo, nvvideo);
   flipflop_74h fsmStateVSync(0, 0,  nvson, nvsoff, vs, nvs);

   //
   // Signal register
   //

   wire [7:0] q;
   wire       nhsoff, nhson;
   wire       nhvidoff, nhvidon;
   wire       nvsoff, nvson;
   wire       nvvidoff, nvvidon;
   
   flipflop_374i fsmCompReg ({vcmp, hcmp}, 0, clk4, q);

   assign nnewfield = q[0];
   assign nhsoff = q[0];
   assign nhson = q[1];
   assign nhvidoff = q[2];
   assign nhvidon = q[3];

   assign nnewframe = q[7];
   assign nvsoff = q[7];
   assign nvson = q[6];
   assign nvvidoff = q[5];
   assign nvvidon = q[4];


   // State: video on

   wire       nvideo, video;

   // soup
   assign #7 nvideo = nhvideo | nvvideo;
   assign #7 video = hvideo & vvideo;

endmodule // FrameStateMachine


///////////////////////////////////////////////////////////////////////////////
//
// PIXEL CLOCK SELECTOR
//
///////////////////////////////////////////////////////////////////////////////

module PixelClockSelector (clk1, clk2, col40, pixclk, npixclk);

   input  clk1, clk2, col40;
   
   output pixclk, npixclk;
   
   // Pixel clock selector using a 74AC00 NAND chip. The 74HC251 isn't fast
   // enough for this. The 'AC00 has a 1.9 to 6.6 ns propagation delay. Dennis
   // Kuschel's ‘VGA’ design does this, but it also uses pull-down resistors to
   // produce a more square waveform.

   wire 	_ncol40, _pxc0, _pxc1;
   nand #7 pxcNAND0 (_ncol40, col40, 1); // Produce NOT COL40
   nand #7 pxcNAND1 (_pxc0, _ncol40, clk1); // Produce 25 MHz pixel clock
   nand #7 pxcNAND2 (_pxc1, col40, clk2);   // Produce 12.5 MHz pixel clock
   nand #7 pxcNAND3 (pixclk, _pxc0, _pxc1);
   not #6  pxcNOT (npixclk, pixclk);

endmodule // PixelClockSelector



///////////////////////////////////////////////////////////////////////////////
//
// 8-PHASE CLOCK GENERATOR (VDU SEQUENCER)
//
///////////////////////////////////////////////////////////////////////////////

module ClockPhaseGenerator(pixclk, npixclk, nhs, vs, nhvideo, nvvideo, phi);
   input         pixclk, npixclk, nhs, vs, nhvideo, nvvideo;
   output [7:0]  phi;

   // Divide pixclk (phase shifted because of propagation delays) by eight.
   wire [7:0] 	 q;
   counter_590   ctr (pixclk, vs, nhs, pixclk, 0, q, );

   // Generate synchronous, 8-phase active high clocks.
   demux_138 demux (1, 0, 0, q[2:0], phi);
   //demux_138 demux (1, nhvideo, nvvideo, q[2:0], phi);
endmodule // ClockPhaseGenerator



///////////////////////////////////////////////////////////////////////////////
//
// CELL FIELD (SCANLINE) MODULO-N COUNTER
//
///////////////////////////////////////////////////////////////////////////////

module CellFieldCounter(nreset, vvideo, hs, nhs, modulo, cfc, nnewrow);
   input        nreset, vvideo, hs, nhs;
   input [3:0] 	modulo;
   
   output [3:0] cfc;
   output 	nnewrow;
   
   wire [7:0] 	_cfc, _mod;
   wire         cfcc;

   // TODO: link this to the appropriate register (modulo)
`ifdef CFCP8
   assign _mod = 7;
`else
 `ifdef CFCP4
   assign _mod = 3;
 `else
  `ifdef CFCP2
   assign _mod = 1;
  `else
   `ifdef CFCP1
   assign _mod = 0;
   `endif
  `endif
 `endif
   assign _mod = 15;		//  Lines per cell = 1
`endif // !`ifdef CFCP8

   

   // ~nreset is only needed to initialise the simulation, not needed by hardware.
   counter_590 cellRowCnt (hs, 0, nreset & vvideo & nnewrow, nhs, 0, _cfc, );
   comparator_688 cellRowCmp (_mod, _cfc, nhs, nnewrow);

   assign cfc = _cfc[3:0];

endmodule // CellFieldCounter


///////////////////////////////////////////////////////////////////////////////
//
// PLANE ADDRESS GENERATOR
//
///////////////////////////////////////////////////////////////////////////////

module PlaneAddressGenerator(nreset, clk8, hvideo, nvideo, vvideo,
			     nvdumem,
			     nnewrow, phase1, phase2,
			     sar,
			     pa);
   input 	 nreset, clk8, hvideo, nvideo, vvideo, nvdumem;
   input 	 nnewrow, phase1, phase2;
   input [15:0]  sar;
   
   output [15:0] pa;
   
   wire [7:0] 	 colcnt;
   wire [11:0] 	 rowcnt;
   wire 	 hclr, hclk, vclr, nrg, rclk;
   wire [2:0] 	 _pacc;

   assign hclr = ~nreset | nvideo;
   assign hclk = /*nvideo | */phase1;
   assign vclr = ~nreset;
   assign nrg = nvdumem;
   assign rclk = nreset & phase2;
   
   // Horizontal address counter
   //TODO: implement a delay line some other way. (FF?)
   wire 	 nvideox;
   tri0 [7:0] 	 foo;
   flipflop_374i testFF ({nvideo, foo[7:1]}, 0, clk8, foo);
   assign nvideox = ~foo[0];
      
   counter_193 #20 hctr0 (hclr, nvideox, sar[3:0], hclk, 1, colcnt[3:0], _pacc[0], );
   counter_193 #20 hctr1 (hclr, nvideox, {1'b0, sar[6:4]}, _pacc[0], 1, colcnt[7:4], , );
   //assign pac[6:0] = colcnt[6:0];

   counter_193 #20 vctr0 (~nreset, vvideo, sar[10:7], nnewrow, 1, rowcnt[3:0], _pacc[1], );
   counter_193 #20 vctr1 (~nreset, vvideo, sar[14:11], _pacc[1], 1, rowcnt[7:4], _pacc[2], );
   counter_193 #20 vctr2 (~nreset, vvideo, {3'b000, sar[15]}, _pacc[2], 1, rowcnt[11:8], , );
   //assign pac[15:7] = rowcnt[8:0];

   // Address register
   // NOTE: nreset not needed outside of the emulator.
   flipflop_374i paReg0 ({rowcnt[0], colcnt[6:0]}, nrg, rclk, pa[7:0]);
   flipflop_374i paReg1 (rowcnt[8:1], nrg, rclk, pa[15:8]);

endmodule // PlaneAddressGenerator



///////////////////////////////////////////////////////////////////////////////
//
// THE B PLANE (64Kx8 REGISTERED SRAM)
//
///////////////////////////////////////////////////////////////////////////////

module BPlane(a, d, dr, nce0, nce1, nw, nr, clk);

   input [14:0] a;
   input 	nce0, nce1, nw, nr, clk;

   inout [7:0] 	d;

   output [7:0] dr;

   // 64Kx8 of memory
   
   flashram #(15, 20, "img/vdu-bp0.list", "bp0") ram0 (a[14:0], d, nce0, nw, nr);
   flashram #(15, 20, "img/vdu-bp1.list", "bp1") ram1 (a[14:0], d, nce1, nw, nr);

   // The regsister
   flipflop_374i register (d, 0, clk, dr);
endmodule // BPlane



///////////////////////////////////////////////////////////////////////////////
//
// THE C PLANE (64Kx16 REGISTERED SRAM)
//
///////////////////////////////////////////////////////////////////////////////

module CPlane(a, d, dr, nce0, nce1, nw, nr, clk);
   input [14:0]  a;
   input 	 nce0, nce1, nw, nr, clk;
   
   inout [15:0]  d;
   
   output [15:0] dr;

   // 64Kx8 of memory
   
   wire [15:0] 	_cpd, cpd;
   flashram #(15, 20, "img/vdu-cp0lo.list", "cp0lo") ram0lo (a[14:0], d[7:0], nce0, nw, nr);
   flashram #(15, 20, "img/vdu-cp0hi.list", "cp0hi") ram0hi (a[14:0], d[15:8], nce0, nw, nr);
   flashram #(15, 20, "img/vdu-cp1lo.list", "cp1lo") ram1lo (a[14:0], d[7:0], nce1, nw, nr);
   flashram #(15, 20, "img/vdu-cp1hi.list", "cp1hi") ram1hi (a[14:0], d[15:8], nce1, nw, nr);

   flipflop_374i cprlo (d[7:0], 0, clk, dr[7:0]);
   flipflop_374i cprhi (d[15:8], 0, clk, dr[15:8]);
endmodule // CPlane



///////////////////////////////////////////////////////////////////////////////
//
// THE CHARACTER GENERATOR SRAM (32Kx8)
//
///////////////////////////////////////////////////////////////////////////////

module CharGenerator(a, d, nce, nw, nr);
   input [14:0] a;
   input 	nce, nw, nr;

   inout [7:0] d;

   flashram #(15, 20, "img/vdu-cg0.list", "cg0") ram (a, d, nce, nw, nr);
endmodule // CharGenerator
       


///////////////////////////////////////////////////////////////////////////////
//
// FAST SHIFT REGISTER MADE FROM DISCRETE AC ICS
//
///////////////////////////////////////////////////////////////////////////////

module ShiftRegister (p, q, nload_in, nshift);
   input [0:7] p;
   input       nload_in, nshift;
   
   output      q;
   
   wire [0:7]  p;
   tri0 [0:7]  q0;
   wire [0:7]  q1;
   tri0 [0:7]  q2;
   wire        nstate0, nstaten, nload;


   flipflop_74h #10 loadff (1, nload_in, 1, nload, , nload);

   // State machine. Typical delays 6-8ns, using 10ns (worst case).
   flipflop_74h #10 state (1, nshift, 1, nload, nstate0, nstaten);
      
   // 'AC541: using the worst-case scenario of 10ns. Typical propagation delay
   // is as low as 4ns.
   buffer_541 #10 loadreg (nstate0, 0, p, q0);

   // // 'AC574: using the worst-case scenario time of 11ns.
   trior       dummy;
   wire        shift;
   assign #8 shift = ~nshift;

   flipflop_574 #11 shiftreg (q1, q2, nshift, nstaten);

   // Icarus Verilog has some issue with feedback on weakly driven wires (?),
   // so I'm using pull-up wires and zero-delay OR gates to simulate the spiral
   // connections.
   
   or (q1[0], q0[0], q2[1]);
   or (q1[1], q0[1], q2[2]);
   or (q1[2], q0[2], q2[3]);
   or (q1[3], q0[3], q2[4]);
   or (q1[4], q0[4], q2[5]);
   or (q1[5], q0[5], q2[6]);
   or (q1[6], q0[6], q2[7]);
   or (q1[7], q0[7], 0);
   
   // Output register
   wire        load;
   assign load = ~nload;
   //flipflop_74h #10 outreg (q1[0], shift | load, 1, 1, q, );
   assign q = q1[0];
   
endmodule // ShiftRegister
       


///////////////////////////////////////////////////////////////////////////////
//
// BLINK CLOCK
//
///////////////////////////////////////////////////////////////////////////////

module BlinkEngine (nreset, vs, slow, fast);

   input       nreset, vs;

   output      slow, fast;

   wire [7:0]  q;
   counter_590i ctr (vs, 0, nreset, vs, 0, q, );

   assign slow = q[2];	  // slow blink = vsync/8 = 60Hz/8 = 3.75Hz
   assign fast = q[3];	  // fast blink = vsync/16 = 60Hz/16 = 7.5Hz

endmodule // blinkEngine
       


///////////////////////////////////////////////////////////////////////////////
//
// CURSOR UNIT
//
///////////////////////////////////////////////////////////////////////////////

module CursorUnit (pa, ca, cbm, slow, fast, cursor, ncursor);

   input [15:0] pa, ca;
   input [1:0] 	cbm;
   input 	slow, fast;

   output 	cursor, ncursor;

   wire nceq0, nceq1;
   // The two comparators are not cascaded to allow for faster cursor
   // comparison. This happens when pa is incremented, so there is a fair bit
   // of time until pixels start shifting out, but keeping delays to a minimum
   // saves times for other processes.
   comparator_688 cmp0 (pa[7:0], ca[7:0], 0, nceq0);
   comparator_688 cmp1 (pa[15:8], ca[15:8], 0, nceq1);

   // CBM:
   //   00 = cursor always on
   //   01 = fast blink
   //   10 = slow blink
   //   11 = cursor off

   // Function table:
   //
   // NCEQ1 NCEQ0 CBM1 CBM0   CURSOR NCURSOR
   // -------------------------------------------
   //   1     X     X    X       0     1      (*)
   //   0     1     X    X       0     1     (**)
   //   0     0     0    0       1     0
   //   0     0     0    1     (fast blink input)
   //   0     0     1    0     (slow blink input)
   //   0     0     1    1       0     1
   //
   // (*) deselects mux.
   //                         cbm =  11    10    01  00     (*)
   mux_151 mux ({nceq0, cbm}, {5'b00000, slow, fast, 1'b1}, nceq1, cursor, ncursor);
   //                             ^^^^ = (**) don't care values
   
endmodule // CursorUnit
       


///////////////////////////////////////////////////////////////////////////////
//
// COLOUR AND ATTRIBUTE MUX
//
///////////////////////////////////////////////////////////////////////////////

module ColourMux(npixen, ncursor, nvideo, ccr, cpd, slow, pixel, r, g, b);

   input        npixen, ncursor, nvideo;
   input [15:0] ccr, cpd;
   input 	slow, pixel;

   output [1:0] r, g, b;

   wire [5:0] 	fg, bg, cfg, cbg;
   wire 	ainvert, ablink;
   
   assign fg = cpd[5:0];
   assign bg = cpd[13:8];
   assign ainvert = cpd[14];
   assign ablink = cpd[15];

   assign cfg = ccr[5:0];
   assign cbg = ccr[13:8];

   // Foreground/Background selector Function table
   //
   //                          SLOW     __  __
   // PIXEL  AINVERT  ABLINK  (BLINK)   FG  BG   Notes
   // -----------------------------------------------------------------
   //   0       0       0        X       1   0   True bg pixel
   //   0       0       1        0       1   0   
   //   0       0       1        1       1   0   (*)
   // -----------------------------------------------------------------
   //   0       1       0        X       0   1   Inverted bg
   //   0       1       1        0       0   1
   //   0       1       1        1       0   1   (*)
   // -----------------------------------------------------------------
   //   1       0       0        X       0   1   True fg pixel
   //   1       0       1        0       0   1
   //   1       0       1        1       1   0
   // -----------------------------------------------------------------
   //   1       1       0        X       1   0   Inverted fg
   //   1       1       1        0       1   0
   //   1       1       1        1       0   1
   // -----------------------------------------------------------------
   // (*) True (IBM-style) blinking. Invert for Spectrum-style blinking
   //     (alternating bg/fg).

   // Simplified function table (8 entries, for '251):
   //
   //   C       B       A     __  __
   // PIXEL  AINVERT  ABLINK  FG  BG   Notes
   // -----------------------------------------------------------------
   //   0       0       0      1   0   True bg pixel
   //   0       0       1      1   0
   //   0       1       0      0   1   Inverted bg
   //   0       1       1      0   1
   //   1       0       0      0   1   True fg pixel
   //   1       0       1      SLOW    Allow blinking to drive FG/BG.
   //   1       1       0      1   0   Inverted fg
   //   1       1       1      SLOW
   // -----------------------------------------------------------------

   wire       nfgen, nbgen;
   mux_151 mux ({pixel, ainvert, ablink}, {slow, 1'b0, slow, 5'b11100},
		0, nbgen, nfgen);

   wire [1:0] dummy;

   // These buffers form a large multiplexer.
   // Function table:
   // _____  ______   ____   ____
   // PIXEN  CURSOR   FGEN   BGEN    Enabled
   // ---------------------------------------------------------------------
   //   0       X       0      X     Pixel foreground
   //   0       X       X      0     Pixel background
   //   X       0       0      X     Cursor foreground
   //   X       0       X      0     Cursor background
   // ---------------------------------------------------------------------
   //
   // There can clearly be contention between these. Only the listed
   // combinations are valid because PIXEN# = CURSOR (synchronously, out of a
   // '251) and FGEN# = BGEN (same, from mux part above). This only allows four
   // states, but expanded into four active low signals for easy enabling of
   // the buffers below.

   // Note: 74AC541 are used here, for speed. These parts have 6ns typical
   // TPLH/TPHL propagation delays.

   wire       npixenv, ncursorv;

   or #7 (npixenv, npixen, nvideo);
   or #7 (ncursorv, ncursor, nvideo);
   
   buffer_541 #6 pixelForeground (nfgen, npixenv, {2'b00, fg}, {dummy, b, g, r});
   buffer_541 #6 pixelBackground (nbgen, npixenv, {2'b00, bg}, {dummy, b, g, r});

   buffer_541 #6 cursorForeground (nfgen, ncursorv, {2'b00, cfg}, {dummy, b, g, r});
   buffer_541 #6 cursorBackground (nbgen, ncursorv, {2'b00, cbg}, {dummy, b, g, r});
   
endmodule // colourMux



///////////////////////////////////////////////////////////////////////////////
//
// Function: The CFT VDU
//
///////////////////////////////////////////////////////////////////////////////

module video(ab, db, niodev1, nr, nw, nreset,
	     rr, gg, bb, nhs_out, nvs_out,
	     debug_nhvideo, debug_nvvideo);
   parameter bpc = 2;
   parameter pixel_clock = 20;	// 2 * 20ns = 25 MHz. SHOULD have: 25.175 MHz

   input [15:0] ab;
   inout [15:0]     db;
   input 	    niodev1, nr, nw;
   input 	    nreset;
   
   output [bpc-1:0] rr, gg, bb;
   output 	    nhs_out, nvs_out;
   output 	    debug_nhvideo, debug_nvvideo;

   tri0 [bpc-1:0]   r, g, b;
   
   wire 	    nven;
   wire [7:0] 	    hc;
   wire [11:0] 	    vc;
   wire [15:0] 	    pa;
   
   wire 	    reset;


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VDU REGISTERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	      nvduen;
   wire               col40;
   wire [15:0] 	      sar, car, ccr;
   wire [1:0] 	      cbm;

`ifdef COL40
   assign col40 = 1;	//  TODO: assign this to a register.
`else
   assign col40 = 0;	//  TODO: assign this to a register.
`endif
   assign sar = 0;	   // TODO: assign this to a register.
   assign nvduen = ~nreset; // TODO: assign this to a register

   assign car = 3072;		// position (0, 24).
   assign ccr = {8'b00001011, 8'b00000000}; // Orange fg, black bg
   assign cbm = 2'b11;			    //  Cursor off (00 = on)


   ///////////////////////////////////////////////////////////////////////////////
   //
   // TIME STAGE 0: CLOCK GENERATION
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	      st0_clk, st0_clk2, st0_clk4, st0_clk8;

   ClockGenerator clockGenerator (nreset, nvduen, st0_clk, st0_clk2, st0_clk4, st0_clk8);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // TIME STAGE 1: FRAME STATE MACHINE
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	      st1_hs, st1_nhs, st1_hvideo, st1_nhvideo;
   wire 	      st1_vs, st1_nvs, st1_vvideo, st1_nvvideo;
   wire 	      st1_video, st1_nvideo;
   
   FrameStateMachine frameStateMachine (nreset, st0_clk4, st0_clk8,
					st1_hs, st1_nhs, st1_hvideo, st1_nhvideo,
					st1_vs, st1_nvs, st1_vvideo, st1_nvvideo,
					st1_video, st1_nvideo
					);

   wire 	      st2_pixclk, st2_npixclk;
   PixelClockSelector pixelClockSelector (st0_clk, st0_clk2, col40, st2_pixclk, st2_npixclk);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // MEMORY SEQUENCING
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The VRAM Address counter: 16 bits with presetting.
   wire [7:0] 	      st3_phi;
   wire 	      paclk1, paclk2, clkb, clkc, nshiftload, nshiftout;

   // TODO: SOME SIGNALS OUT OF SYNC
   ClockPhaseGenerator clockPhaseGenerator(st2_pixclk, st2_npixclk,
					   st1_nhs, st1_vs, st1_nhvideo, st1_nvvideo, st3_phi);

`ifdef FOOBAR
   // Sequence signals
   assign clkb = phi[0];
   assign clkc = phi[6];
   assign paclk1 = phi[2];
   assign paclk2 = phi[4];
   //or #10 (nshiftload, nvideo, phi[5]);
   assign nshiftload = nvvideo | phi[5];
   //assign #20 nshiftload = phi[5];
   //nor #10 (nshiftout, nvideo, pixclk);
   assign nshiftout = (nvvideo | ~pixclk);
   //assign nshiftout = pixclk;

   // Cell Field Counter
   wire 	nnewrow;
   wire [3:0] 	cfc;
   CellFieldCounter cellFieldCounter(nreset, vvideo, hs, nhs, /*cfcp*/0, cfc, nnewrow);

   PlaneAddressGenerator planeAddressGenerator(nreset, clk2,
					       hvideo, /*nvideo*/ hs, vvideo,
   					       0, // TODO: connect nvdumem
   					       nnewrow, paclk1, paclk2,
   					       sar,
   					       pa);

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // VIDEO PLANES
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Chip enable
   wire 	nvdumem;
   wire [3:0] 	_memsel;
   assign nvdumem = 0; // TODO: attach this to the host sync logic.
   demux_139h vplSelect (nvdumem, {1'b0, pa[15]}, _memsel);
   wire 	nce0, nce1;
   assign nce0 = _memsel[0];
   assign nce1 = _memsel[1];
   wire 	_nmemw;
   assign _nmemw = 1;		// TODO: attach this to the host sync logic.

   // B Plane (65536×8)
   wire [7:0] 	bpd;
   BPlane bPlane (pa[14:0], /* dbus */, bpd, nce0, nce1, _nmemw, 0/*nr*/, clkb);
   
   // C Plane (65536×16)
   wire [15:0] 	cpd;
   CPlane cPlane (pa[14:0], /* dbus */, cpd, nce0, nce1, _nmemw, 0/*nr*/, clkc);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // CHARACTER GENERATOR
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [1:0] 	cset;
   wire 	_ncgrw, _ncgrr;
   wire [7:0] 	cgd;

   assign cset = 2'b00;		// TODO: Sort this out (from the C plane)
   assign _ncgrw = 1;		// TODO: sort out _ncgrw, _ncgrr
   assign _ncgrr = 0;
   CharGenerator charGenerator({1'b0, cset, bpd, cfc[3:0]}, cgd, 0 /*CE*/, _ncgrw, _ncgrr);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // PIXEL SHIFT REGISTER
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	pixel;
   ShiftRegister shiftRegister (cgd, pixel, nshiftload, nshiftout);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // COLOURS, ATTRIBUTES ETC.
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The blink engine.
   wire 	slowblink, fastblink;
   BlinkEngine blinkEngine (nreset, vs, slowblink, fastblink);

   // The hardware cursor
   // TODO: use a FF to buffer cursor/ncursor for the duration of the 8-column
   // cell.
   wire 	npixen, ncursor;
   CursorUnit cursorUnit (pa, car, cbm, slowblink, fastblink, npixen, ncursor);

   // The colour mux.
   ColourMux colourMux (npixen, ncursor, nvideo, ccr, cpd, slowblink, pixel, r, g, b);

   // Register RGB signals to synchronise them.
   wire 	xxx;
   assign #15 xxx = pixclk;
   flipflop_374i rgbReg0 ({nvs, nhs, r, g, b}, 0, xxx, {nvs_out, nhs_out, rr, gg, bb});


   // WORK IN PROGRESS
   
   // assign #80 nvs_out = nvs0;
   // assign #80 nhs_out = nhs0;

   wire [1:0] 	_dummy;
   wire 	hvideo_out, nhvideo_out, vvideo_out, nvvideo_out, video_out, nvideo_out;
   flipflop_374i rgbReg1 ({2'b00,  hvideo,     nhvideo,     vvideo,     nvvideo,     video,     nvideo},
   			  0, pixclk,
   			  {_dummy, hvideo_out, nhvideo_out, vvideo_out, nvvideo_out, video_out, nvideo_out});
   // assign nvvideo_out = nvvideo;
   // assign nhvideo_out = nhvideo;

   assign debug_nvvideo = nvvideo_out;
   assign debug_nhvideo = nhvideo_out;

`endif

   // END OF VDU.

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // EARLY TEST PATTERNS
   //
   ///////////////////////////////////////////////////////////////////////////////
   // Generate a test pattern (usually not compiled in).

`ifdef EARLY
   // Frame test: green frame
`ifdef TESTFRAME
   assign rr = video == 1 ? 2'b01 : 0;
   assign gg = video == 1 ? 2'b10 : 0;
   assign bb = video == 1 ? 2'b01 : 0;
`endif

   // C plane test.
`ifdef TESTC
   wire [32:0] 	x;
   assign x = debug_pa +rowcnt;
   assign r = video_out == 1 ? x[1:0] : 0;
   assign g = video_out == 1 ? x[1:0] : 0;
   assign b = video_out == 1 ? x[1:0] : 0;
`endif

   // Shift reg, B plane and Char Generator test:
`ifdef TESTSHIFT
   assign r = video_out == 1 ? (pixel == 1 ? 3 : 0) : 0;
   assign g = video_out == 1 ? (pixel == 1 ? 3 : 0) : 0;
   assign b = video_out == 1 ? (pixel == 1 ? 3 : 0) : 0;
`endif

   // Shift reg, C plane (fg only) B plane and Char Generator test:
`ifdef TESTSHIFT2
   assign r = video_out == 1 ? (pixel == 1 ? {cpd[1], 1'b1} : 0) : 0;
   assign g = video_out == 1 ? (pixel == 1 ? {cpd[3], 1'b1} : 0) : 0;
   assign b = video_out == 1 ? (pixel == 1 ? {cpd[5], 1'b1} : 0) : 0;
`endif

   // Shift reg, C plane (fg only) B plane and Char Generator test:
`ifdef TESTSHIFT3
   assign r = video_out == 1 ? (pixel == 1 ? {hcnt[1:0]} : 0) : 0;
   assign g = video_out == 1 ? (pixel == 1 ? {hcnt[3:2]} : 0) : 0;
   assign b = video_out == 1 ? (pixel == 1 ? {hcnt[5:4]} : 0) : 0;
`endif

   // B, C plane & CG test:
`ifdef TESTSHIFT4
   assign r = video_out == 1 ? (pixel == 1 ? cpd[1:0] : cpd[9:8]) : 0;
   assign g = video_out == 1 ? (pixel == 1 ? cpd[3:2] : cpd[11:10]) : 0;
   assign b = video_out == 1 ? (pixel == 1 ? cpd[5:4] : cpd[13:12]) : 0;
`endif

   // Test 1
`ifdef TEST1
   assign r = video_out == 1 ? hcnt[3:2] : 2'b00;
   assign g = video_out == 1 ? hcnt[5:4] : 2'b00;
   assign b = video_out == 1 ? vcnt[6:5] : 2'b00;
`endif

   // Test 2: PA colour grid
`ifdef TEST2
   assign r = video_out == 1 ? pa[3:2] : 2'b00;
   assign g = video_out == 1 ? pa[5:4] : 2'b00;
   assign b = video_out == 1 ? pa[11:10] : 2'b00;
`endif

   // Test 3: C Plane background
`ifdef TEST3
   assign r = video_out == 1 ? cpd[7:6] : 2'b00;
   assign g = video_out == 1 ? cpd[9:8] : 2'b00;
   assign b = video_out == 1 ? cpd[11:10] : 2'b00;
`endif

   // assign g = video == 1 ? pa[5:4] : 2'b00;
   // assign b = video == 1 ? pa[11:10] : 2'b00;

`endif //  `ifndef NORMAL

endmodule // video

// End of file.
