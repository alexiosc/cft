///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the Interrupt State Machine.
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////


`ifndef ism_v
`define ism_v

`include "flipflop.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// NOTES
//
// The ISM is state machine with 5 states, tradtionally numbered q1–q5.
//
// q0: the state on reset. Interrupts are disabled.
//
// q1: Entered on STI. Interrupts are enabled.
//
// q2: An interrupt request (IRQ) has been received at the rising edge
//     of clk2.
//
// q3: The first rising edge of clk4 has been seen after entering
//     q3. This is an additional state to avoid metastability and
//     bring asynchronous interrupt requests into the CFT's clock
//     domain. When the current instruction ends (CLK₄ goes high while
//     nEND is low), q5 is entered.
//
// q4: Interrupt acknowledged, and the processor is running the
//     Interrupt microprogram that will in turn

module ism (nreset, clk2, clk3, clk4, nend,
	    naction_sti, naction_cli, nirq,
	    fi, nirqs);

   input        nreset;
   input 	clk2;
   input 	clk3;
   input 	clk4;
   input 	nend;
   input 	naction_sti;
   input 	naction_cli;
   input 	nirq;

   output 	fi;
   output 	nirqs;

   wire 	nint0;
   wire 	nint;
   wire 	irqs0;
   wire 	nreset_or_cli;
   wire 	clk4_or_end;
   
   assign #6 nreset_or_cli = nreset & naction_cli;
   assign #6 clk4_or_end = clk4 | nend;

   // The Interrupt Flag (FI)
   flipflop_74h ff_fi (.nset(naction_sti), .d(1'b1), .clk(1'b1), .nrst(nreset_or_cli), .q(fi));

   // Incoming IRQs.

   // FF1: as long as FI is low (interrupts disabled), the FF is stuck with
   // Q=1. Otherwise, a low nIRQ will start triggering in interrupt on the
   // raising edge of CLK2.
   //
   // Note: The two FFs are technically clocked from different clocks, but clk2
   // and clk3 are different phases of the *same* clock and guaranteed to
   // always be 90° and 62.5ns apart, so it's really the same clock domain.
   flipflop_74h ff_irq1 (.nset(fi), .d(nirq),  .clk(clk2), .nrst(1'b1), .q(nint0));
   flipflop_74h ff_irq2 (.nset(fi), .d(nint0), .clk(clk3), .nrst(1'b1), .q(nint));

   // The state machine has now accepted an interrupt and brought it into the
   // processor's clock domain. Next step, feed this into the microcode store
   // when the next instruction is done.

   flipflop_74h ff_irq3 (.nset(nint), .d(1'b1),  .clk(1'b1), .nrst(nreset_or_cli), .q(irqs0));
   flipflop_74h ff_irq4 (.nset(1'b1), .d(irqs0),  .clk(clk4_or_end), .nrst(nreset_or_cli), .nq(nirqs));
endmodule // ism

`endif //  `ifndef ism_v

// End of file
