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
module clock_generator (halt, run, step, reset,
			clock, clock2, clock3, clock4, clock14, clock34);
   parameter cp = 250;

   input halt;			// /HALT signal from the CPU/front panel.
   input run;			// RUN signal from the front panel.
   input step;			// STEP signal from the front panel (falling edge clocks).
   input reset;			// /RESET signal.
   
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
   flipflop_112 ff1 (run, 0, rawclk, reset, halt, clken, nclken,
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

   
`endif //  `ifndef clock_v
// End of file.
