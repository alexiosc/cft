///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Clock generator and reset controller.
//
// NOTES: I want to experiment with different clocks, and the best and
// easiest way is to use an appropriate programmable part for this. I
// have a lot of Atmega 8s lying around, so I'll use one of those. I
// can program them to issue custom clock pulses.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef clock_v
`define clock_v

`include "flipflop.v"
`include "mux.v"
`include "vibrator.v"
`include "counter.v"
`include "demux.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: CLOCK GENERATOR
//
// NOTES:
//
// The CFT clock is a four-phase clock, although only two of the phases are
// used in the CPU itself. Clock signals CLOCK, CLOCK2, CLOCK3, and CLOCK4 are
// made available. They're 50% duty cycle clocks with a phase difference of 90°
// between them. An additional clock made by ORring CLOCK and CLOCK4,
// (unimaginatively named CLOCK14) provides pulses for latching data to devices
// like registers and RAM.
//
// CLOCK is derived from the raw crystal by a division by a certain factor (e.g
// 8) On actual hardware, ratios between 1 and 16 are available, as well as
// different base frequencies, but that's beyond the scope of this simulation.
//          _   _   _   _   _   _   _   _   _   _   _   _   _ 
// RAWCLK _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |
//            _______         _______         _______      
//  CLK1  ___|       |_______|       |_______|       |_______
//                _______         _______         _______      
//  CLK2  _______|       |_______|       |_______|       |___
//        ___         _______         _______         _______      
//  CLK3     |_______|       |_______|       |_______|       |
//        _______         _______         _______         ___
//  CLK4         |_______|       |_______|       |_______|   
//            _______     _______     _______     _______     
//  CLK5  ___|       |___|       |___|       |___|       |___|
//
// The clock generator has three states of operation:
//
// 1. Running. Clock pulses are output as normal.
//
// 2. Halted. No clock pulses are output. An asynchronous signal (e.g. from the
// front panel) must be put on the RUN line to re-enable to clock.
//
// 3. Single step. External pulses must come in to step the clock
// generator. These are not divided. Slow stepping must be implemented on the
// front panel.
//
// /RESET RAWCLK /HALT RUN STEP   State
// ----------------------------------------------------------------------------
//   0      X      1    X   X     The clock is enabled.
//   X      X      0    X   X     The clock is halted.
//   1      \      1    1   X     The clock is enabled. 
//   X      X      X    X   \     A single clock pulse is output.
//
// When the clock is halted, the STEP signal from the front panel may be used
// to do single- and slow-stepping. This is an external signal, obviously.
//
///////////////////////////////////////////////////////////////////////////////

// TODO: This uses the old naming for the clocks.
module clock_generator_v1 (halt, run, step, reset,
			clock, clock2, clock3, clock4, clock14, clock34);
   parameter cp = 250;

   input halt;			// /HALT signal from the CPU/front panel.
   input run;			// RUN signal from the front panel.
   input step;			// STEP signal from the front panel (falling edge clocks).
   input reset;			// /RESET signal.

   tri1  run;			// Pull up /RUN.
   
   output clock;
   output clock2;
   output clock3;
   output clock4;
   output clock14;
   output clock34;

   reg rawclk;

   // Simulate the oscillator
   initial begin
      rawclk = 0;
   end
   always begin
      #(cp / 2) rawclk = ~rawclk;
   end

   // The first FF: The run-clock FF is cleared by the /RESET signal,
   // and set by the /HALT signal.  The second FF produces clk and
   // nclk, complementary clocks at 0° and 180°, and obviously divides
   // the clock by two.
   wire clk, nclk, clken, nclken;
   flipflop_112 ff1 (run, 0, rawclk, reset, 1'b1, clken, nclken,
		    1, 1, rawclk, 1, reset, clk, nclk);

   // The clock source multiplexer.
   //
   // SEL is CLKEN (MSB) and STEP (LSB), so that:
   //
   // CLKEN   STEP    SOURCE
   // -----------------------------------------------------------
   //   0      0      System halted (0, 1).
   //   0      1      Single clock pulse from front panel (1, 0).
   //   1      0      Full-speed crystal clock (clk, nclk)
   //   1      1      Full-speed crystal clock (clk, nclk)
   //
   // Two complementary outputs are provided, routing clk and nclk to ff2 for
   // clock division and phase generation. To keep the clocks in phase when
   // stopped, we route appropriate signals in other states, too (shown in
   // parentheses above).

   wire clk1, nclk1;
   mux_253 clockmux ({clken, step},	       // SEL
		     {clk, clk, 1'b1, 1'b0},   // I1 (MSB-to-LSB)
		     0,			       // OE1
		     clk1,		       // Y1
		     {nclk, nclk, 1'b0, 1'b1}, // I2 (MSB-to-LSB)
		     0,			       // OE2
		     nclk1);		       // Y2

   // The second FF for frequency division and clock phase generation
   wire q1, q2, qn1, qn2;
   flipflop_112 ff2 (1, 1, clk1, 1, reset, q1, qn1,
		    1, 1, nclk1, 1, reset, q2, qn2);
   // Connect the clock phases.
   assign clock = qn1;
   assign clock2 = qn2;
   assign clock3 = q1;
   assign clock4 = q2;

   wire nclock34a, clock34b, nclock34c, clock34d, nclock34e, clock34f, nclock34g, clock34h, nclock34i;

   wire myclock14;
   nand #11 nand_7400a (clock14, clock2, clock3);

   nand #11 nand_7400b (nclock34a, clock3, clock4);
   nand #11 nand_7400c (clock34b, nclock34a);
   nand #11 nand_7400d (nclock34c, clock34b, clock34b);

   nand #11 nand_7400e (clock34d, nclock34c, nclock34c);
   nand #11 nand_7400f (nclock34e, clock34d, clock34d);
   nand #11 nand_7400g (clock34f, nclock34e, nclock34e);
   nand #11 nand_7400h (nclock34g, clock34f, clock34f);

   nand #11 nand_7400i (clock34h, nclock34g, nclock34g);
   nand #11 nand_7400j (nclock34i, clock34h, clock34h);
   nand #11 nand_7400k (clock34, nclock34i, nclock34i);
   //nand #11 nand_7400l (clock34, clock34j, clock34j);

endmodule // clock_generator

   
module clock_generator_v2 (clken, step, reset,
			   clk, clk2, clk3, clk4, clk5, guard);
   parameter cp = 250;

   input clken;			// Active high CLKEN signal from the front panel.
   input step;			// STEP signal from the front panel (falling edge clocks).
   input reset;			// /RESET signal.

   tri1  clken;			// Pull up /RUN.
   
   output clk;
   output clk2;
   output clk3;
   output clk4;
   output clk5;
   output guard;

   reg rawclk;

   // Simulate the oscillator
   initial begin
      rawclk = 0;
   end
   always begin
      #(cp / 2) rawclk = ~rawclk;
   end

   // The first FF: NOT USED! The front panel generates the CLKEN
   // signal for us. (in hardware, the FF from the front panel
   // circuitry might well be merged with this one).
   wire _clk, _nclk;
   //flipflop_112 ff1 (run, 0, rawclk, reset, 1'b1, clken, nclken,
   //		    1, 1, rawclk, 1, reset, clk, nclk);
   flipflop_112h ff1b (1, 1, rawclk, 1, reset, _clk, _nclk);

   // The clock source multiplexer.
   //
   // SEL is CLKEN (MSB) and STEP (LSB), so that:
   //
   // CLKEN   STEP    SOURCE
   // -----------------------------------------------------------
   //   0      0      System halted (0, 1).
   //   0      1      Single clock pulse from front panel (1, 0).
   //   1      0      Full-speed crystal clock (clk, nclk)
   //   1      1      Full-speed crystal clock (clk, nclk)
   //
   // Two complementary outputs are provided, routing clk and nclk to ff2 for
   // clock division and phase generation. To keep the clocks in phase when
   // stopped, we route appropriate signals in other states, too (shown in
   // parentheses above).

   wire _clk1, _nclk1;
   mux_253 clockmux ({clken, step},	       // SEL
		     {_clk, _clk, 1'b1, 1'b0},   // I1 (MSB-to-LSB)
		     0,			       // OE1
		     _clk1,		       // Y1
		     {_nclk, _nclk, 1'b0, 1'b1}, // I2 (MSB-to-LSB)
		     0,			       // OE2
		     _nclk1);		       // Y2

   // The second FF for frequency division and clock phase generation
   wire q1, q2, qn1, qn2;
   flipflop_112 ff2 (1, 1, _clk1, 1, reset, q1, qn1,
		    1, 1, _nclk1, 1, reset, q2, qn2);
   // Connect the clock phases.
   assign clk = qn1;
   assign clk2 = qn2;
   assign clk3 = q1;
   assign clk4 = q2;

   wire nguarda, guardb, nguardc, guardd, nguarde, guardf, nguardg, guardh, nguardi;

   wire myclk5;
   nand #11 nand_7400a (clk5, clk2, clk3);

   nand #11 nand_7400b (nguarda, clk3, clk4);
   nand #11 nand_7400c (guardb, nguarda);
   nand #11 nand_7400d (nguardc, guardb, guardb);

   nand #11 nand_7400e (guardd, nguardc, nguardc);
   nand #11 nand_7400f (nguarde, guardd, guardd);
   nand #11 nand_7400g (guardf, nguarde, nguarde);
   nand #11 nand_7400h (nguardg, guardf, guardf);

   nand #11 nand_7400i (guardh, nguardg, nguardg);
   nand #11 nand_7400j (nguardi, guardh, guardh);
   nand #11 nand_7400k (guard, nguardi, nguardi);
   //nand #11 nand_7400l (guard, guardj, guardj);

endmodule // clock_generator
`endif //  `ifndef clock_v


///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module slow_clock_generator (slowclk, testclk);
   output slowclk, testclk;
   
   // The two slow clocks are used for demonstration and debugging
   // purposes. The slow clock runs at a frequency lower than 100Hz, the test
   // clock at a frequency lower than 10Hz. The latter is meant for testing
   // microcode.
   
   vibrator_555 #(30000, 30000) testclock_555 (testclk);
   vibrator_555 #(3000, 3000) fastclock_555 (slowclk);
endmodule // slow_clock_generator
   

module clock_generator_v3 (fpclken, fpustep,
			   nreset,
			   slowclk, testclk,
			   fpfast, fpslow,
			   clk1, clk2, clk3, clk4, clk5, nguard);
   parameter rawclock_period = 63;

   input fpclken, fpustep;	// Front panel run/step control
   input fpfast, fpslow;	// Front panel clock speed control
   input nreset;		// RESET#
   input slowclk, testclk;	// slow clock 555 vibrators

   output clk1, clk2, clk3, clk4, clk5, nguard;

   // FPCLKEN is pulled up, so the clock will always run if the front panel is
   // disconnected. FPUSTEP is pulled down to protect CMOS circuitry if the
   // panel is disconnected. Likewise FPFAST and FPSLOW are pulled up and down
   // respectively to select the fastest clock rate by default.
   
   tri1   fpclken;		// Pull up
   tri0   fpustep;		// Pull down
   tri1   fpfast;		// Pull up
   tri0   fpslow;		// Pull down

   // The crystal oscillator. Not really a 555, but it'll do for simulation
   // purposes. Configured for a 50% duty cycle of 0.5 * rawclock_period.
   wire   fastclk;
   vibrator_555 #(rawclock_period / 2, rawclock_period / 2) xo (fastclk);

   // Raw clock selector mux
   wire   rawclk;
   mux_253 raw_clock_mux ({fpslow, fpfast},
			  {1'b0, testclk, fastclk, slowclk}, 0, rawclk,
			  4'b0, 0,);
   
   // Divide by 2, generate two phases
   wire   clkindiv2, nclkindiv2;
   flipflop_112h ff_div2a (1, 1, rawclk, 1, nreset, clkindiv2, nclkindiv2);

   // Clock Control (run/stop/step) mux
   wire   clkdiv2, nclkdiv2;
   mux_253 clock_ctrl_mux ({fpclken, fpustep},
			   {clkindiv2,  clkindiv2,  2'b10}, 0, clkdiv2,
			   {nclkindiv2, nclkindiv2, 2'b01}, 0, nclkdiv2);

   // Divide by 2, generate four phases.
   flipflop_112 ff_div2b (1, 1, clkdiv2,  1, nreset, clk3, clk1,
			  1, 1, nclkdiv2, 1, nreset, clk4, clk2);

   // Generate clk5
   nand #7 gen_clk5 (clk5, clk3, clk2);

   // Generate GUARD# using 10 NAND gates in series.
   wire   nguarda, guardb, nguardc, guardd, nguarde, guardf, nguardg, guardh, nguardi, guardj;

   // Where delays are #0, the delay has effectively been jumpered off. (easier
   // to code in Verilog than adding/removing gates).
   nand #7 nand_7400b (nguarda, clk3, clk4);
   nand #7 nand_7400c (guardb, nguarda, nguarda);
   nand #7 nand_7400d (nguardc, guardb, guardb);
   nand #7 nand_7400e (guardd, nguardc, nguardc);
   nand #7 nand_7400f (nguarde, guardd, guardd);
   nand #7 nand_7400g (guardf, nguarde, nguarde);
   nand #0 nand_7400h (nguardg, guardf, guardf);
   nand #0 nand_7400i (guardh, nguardg, nguardg);
   nand #0 nand_7400j (nguardi, guardh, guardh);
   nand #0 nand_7400k (guardj, nguardi, nguardi);

   // Set the delay 'jumper' to guardb (14ns), guardd (28ns), guardf (42ns),
   // guardh (56ns) or guardj (70ns), so that the rising edge of GUARD# occurs
   // between the rising edge of CLK5 and around 20ns before the rising edge of
   // CLK.
   
   //assign nguard = guardb;
   //assign nguard = guardd;
   assign nguard = guardf;	// Looks appropriate for a 16MHz raw clock.
   //assign nguard = guardh;
   //assign nguard = guardj;
      
endmodule // clock_generator_v3

module clock_generator (fpclken, fpustep,
			   nreset,
			   slowclk, testclk,
			   fpfast, fpslow,
			   clk1, clk2, clk3, clk4, nt12, nt34);
   parameter rawclock_period = 63;

   input fpclken, fpustep;	// Front panel run/step control
   input fpfast, fpslow;	// Front panel clock speed control
   input nreset;		// RESET#
   input slowclk, testclk;	// slow clock 555 vibrators

   output clk1, clk2, clk3, clk4, nt12, nt34;
   wire   nt12, nt34;

   // FPCLKEN is pulled up, so the clock will always run if the front panel is
   // disconnected. FPUSTEP is pulled down to protect CMOS circuitry if the
   // panel is disconnected. Likewise FPFAST and FPSLOW are pulled up and down
   // respectively to select the fastest clock rate by default.
   
   tri1   fpclken;		// Pull up
   tri0   fpustep;		// Pull down
   tri1   fpfast;		// Pull up
   tri0   fpslow;		// Pull down

   // The crystal oscillator. Not really a 555, but it'll do for simulation
   // purposes. Configured for a 50% duty cycle of 0.5 * rawclock_period.
   wire   fastclk;
   vibrator_555 #(rawclock_period / 2, rawclock_period / 2) xo (fastclk);

   // Raw clock selector MUX
   wire   rawclk;
   mux_253 mux_speed ({fpslow, fpfast},
		      {1'b0, testclk, fastclk, slowclk}, 0, rawclk,
		      4'b0, 0,);
   
   // Clock Control (run/stop/step) MUX
   wire    ctrclk;
   mux_253 mux_runstop ({fpclken, fpustep},
			{rawclk, rawclk,  2'b10}, 0, ctrclk,
			0, 0, );
      
   // Clock Counter (only 2 bits used)
   wire [3:0] clkcq;
   counter_193 ctr_clk (0, nreset, 0, ctrclk, 1, clkcq, ,);

   // Phase generator
   wire [1:0] _dummy;
   demux_139 demux_clk (0, clkcq[1:0],    {clk4, clk3, clk2, clk1},
			0, {1'b0, clkcq[1]}, {_dummy, nt34, nt12});

endmodule // clock_generator

// End of file.
