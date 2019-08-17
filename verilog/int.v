// REDESIGNED IN 2019

///////////////////////////////////////////////////////////////////////////////
//
// Function: the CFT interrupt finite state machine.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef int_v
`define int_v

`include "flipflop.v"
`include "buffer.v"
`include "demux.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// INTERRUPT LOGIC
//
// NOTES:
//
// Interrupts are signalled asynchronously, but we respond to them
// synchronously, at the beginning of a fetch cycle. We only respond when
// the Interrupt Flag (I register) is set.
//
// The interrupt state machine has four states:
//
// * Q1: Interrupts disabled
// * Q2: Interrupts enabled
// * Q3: Interrupt armed
// * Q4: Interrupt seen (signalled to the microcode store)
//
// The initial sate is Q1.
//
// Since IRQ# is asynchronous, registering it is subject to
// metastability problems. We use a pair of flip flops to cross into
// the CFT processor clock domain. This adds to the IRQ latency. To
// reduce this latency, observer that CLK1-4 are phases of the same
// clock, and thus in the same clock domain (since clock skew is
// negligible at our clock rates). So:
//
// IRQ# is registered on the rising edge of CLK1.  It bocomes INT₀# on
// the rising edge of CLK2 or CLK3 (jumper settable). This delays by
// 62.5 or 125 ns, plenty of time for hold times to be honoured and
// metastability to not be an issue.
//
// The final (Q4) state is reached on the rising edge of CLK4, if END#
// is also asserted. This makes the processor enter the interrupt
// microprogram after it's done executing the current instruction.
//
// If the IRQ comes in WHEN the processor is in the last processor
// cycle of its current instruction (END# asserted), the IRQ latency
// is 187.5ns (75% of a processor cycle). (plus the execution time of the interrupt
// microprogam).
//
// Note: we can reduce this to 125ns if we register IRQ# on the rising
// edge of CLK2, and assert INT₀# on CLK3.
//
///////////////////////////////////////////////////////////////////////////////

module int_unit (nreset, clk2, clk3, clk4,
		 nirq,
		 naction_cli, naction_sti, nend,
		 fi, nirqs);
   

   input  nreset;
   input  clk2, clk3, clk4;
   input  nend;
   input  nirq;
   input  naction_cli, naction_sti;

   wire   nreset;
   wire   clk2, clk3, clk4;
   wire   nend;
   wire   nirq;
   wire   naction_cli, naction_sti;

   output fi;
   output nirqs;

   wire   nreset_or_cli;
   wire   fi;

   assign #4 nreset_or_cli = nreset & naction_cli;

   flipflop_74h ff_q1 (.d(1'b1), .clk(1'b1), .set(naction_sti), .rst(nreset_or_cli), .q(fi));

   wire   nintn, nint;
   flipflop_74h ff_q2a (.d(nirq),  .clk(clk2), .set(fi), .rst(1'b1), .q(nintn));
   flipflop_74h ff_q2b (.d(nintn), .clk(clk3), .set(fi), .rst(1'b1), .q(nint));

   wire   irqs0;
   wire   clk4_and_nend;

   flipflop_74h ff_q3  (.d(1'b1), .clk(1'b1),  .set(nint), .rst(nreset_or_cli), .q(irqs0));

   assign #4 clk4_and_nend = clk4 | nend;
   flipflop_74h ff_q4  (.d(irqs0), .clk(clk4_and_nend),  .set(1'b1), .rst(nreset_or_cli), .qn(nirqs));
  
endmodule // int_unit

	      

		 



// Old versions below

`ifdef never
module int_unit_v0 (clock, upc, go_fetch, cli, i_flag, irq, reset, int_out);

   input clock;
   input [0:3] upc;		// the microPC
   input       go_fetch;	// active high: reset signal for the PC.
   input       cli;             // active low: CLI line.
   input       i_flag;		// active low: enable IRQs.
   input       sti;		// -STI: allow further IRQs.
   input       irq;		// async -IRQ signal.
   input       reset;		// async -RESET signal.

   output      int_out;		// active low: go to interrupt handler now.

   // The -I_FLAG signal masks interrupt requests. When it's high, interrupt
   // requests are ignored. When it's low, they're allowed.
   //
   // -IRQ I_FLAG   IRQ_IN
   // ---------------------
   //   0     0        0
   //   0     1        1
   //   1     0        1
   //   1     1        1
   wire        isig;
   wire        reset_and_cli;
   wire        nint_out;
   
   or #10 or7432_a (isig, irq, i_flag);

   and #10 and7408_a (reset_and_cli, reset, cli);

   // The interrupt state machine.

   wire        int_seen;
   //                  J         K         \CLK       -SET -RESET          Q         -Q
   flipflop_112 state (0,        0,        clock,     isig, reset_and_cli, int_seen, ,
		       int_seen, nint_out, go_fetch, 1,     reset,         nint_out, int_out);
   

endmodule // int_unit

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// The Interrupt State Machine. This is handled by three J-K FFs designated
// FFA, FFB, FFC. FFA registers the interrupt enable flag which is controlled
// by the STI# and CLI# signals. FFB registers incoming interrupts, provided
// they aren't masked by FFA (when CLI# has been asserted). FFB works
// asynchronously, so interrupts are almost certain to arrive
// mid-instruction. Its output is thus registered by a third FF, FFC, which is
// synchronous with the rising edge of END#. The output is connected to the
// IRQS# input to the microcode sequencer, so that new interrupts are only
// noticed immediately before the beginning of a new instruction.
//
// Asserting CLI# masks further interrupts, but also resets the pending
// interrupt output from FFB. This is picked up by FFC at the end of the
// current instruction. In this way, since the default interrupt microprogram
// asserts CLI#, it continues to run until the microprogram has completed,
// interrupts have been masked, and control has transferred to the Interrupt
// Service Routine. At that point IRQS# is deasserted and execution continues
// within the ISR.
//
// NOTA BENE: CLI# must be asserted in the microprogram starting immediately
// after the assertion of IRQS#. That is, the interrupt-handilng microprogram
// MUST clear interrupts. If not, every assertion of END# thereafter will
// toggle IRQS# instead.

module intsm (nreset, nsti, ncli, nend, nirq, fint, firq, nirqs);
   input  nreset, nsti, ncli, nend, nirq;
   output fint, firq, nirqs;
   
   wire   nreset, nsti, ncli, nend;
   tri1   nirq;
   wire   fint, firq, nirqs;

   wire   nreset_or_cli, nmasked_irq, nfint;

   and #6 (nreset_or_cli, nreset, ncli);
   or #6 (nmasked_irq, nfint, nirq);

   flipflop_112h ffa (0, 0, 0, nsti, nreset_or_cli, fint, nfint);
   flipflop_112h ffb (0, 0, 0, nmasked_irq, nreset_or_cli, firq, );
   flipflop_112h ffc (firq, 1, nend, 1, nreset, , nirqs);
   
endmodule // intsm


module intc (nreset, nsysdev, nr, nw, ab, db, nirq_in, nirq);
   input nreset, nsysdev, nr, nw;

   input [15:0] ab;
   inout [15:0] db;
   input [7:0] 	nirq_in;

   output 	nirq;

   wire 	nr, nreset, nsysdev, nw;

   wire [15:0] ab, db;
   wire [7:0]  nirq_in;
   wire        nirq;

   wire [7:0]  nirf;

   // Address decoder
   wire [7:0]  y;
   wire        nierw, nisrr, ab56;
   and #6 (ab56, ab[5], ab[6]);
   demux_138 dec (ab[4], ab[7], nsysdev, {ab56, nr, nw}, y);
   assign nierw = y[2];
   assign nisrr = y[1];

   // The Interrupt Status Register
   buffer_540 buf_isr (nisrr, nisrr, nirf, db[7:0]);

   // The Interrupt Enable Register
   tri0 [7:0]  ien;
   wire        nq;
   flipflop_112h ff_ierr  (0, 0, 0, nierw, nreset, , nq);
   flipflop_574 ff_ier (db[7:0], ien, nierw, nq);

   // The Interrupt Registers
   flipflop_112h ff_irq0 (1, 0, nirq_in[0], 1, ien[0], , nirf[0]);
   flipflop_112h ff_irq1 (1, 0, nirq_in[1], 1, ien[1], , nirf[1]);
   flipflop_112h ff_irq2 (1, 0, nirq_in[2], 1, ien[2], , nirf[2]);
   flipflop_112h ff_irq3 (1, 0, nirq_in[3], 1, ien[3], , nirf[3]);
   flipflop_112h ff_irq4 (1, 0, nirq_in[4], 1, ien[4], , nirf[4]);
   flipflop_112h ff_irq5 (1, 0, nirq_in[5], 1, ien[5], , nirf[5]);
   flipflop_112h ff_irq6 (1, 0, nirq_in[6], 1, ien[6], , nirf[6]);
   flipflop_112h ff_irq7 (1, 0, nirq_in[7], 1, ien[7], , nirf[7]);

   // IRQ# Generator. A tree of AND gates.
   wire        nirfa, nirfb, nirfc, nirfd;
   wire        nirfab, nirfcd;
   
   and #6 (nirfa, nirf[0], nirf[1]);
   and #6 (nirfb, nirf[2], nirf[3]);
   and #6 (nirfc, nirf[4], nirf[5]);
   and #6 (nirfd, nirf[6], nirf[7]);

   and #6 (nirfab, nirfa, nirfb);
   and #6 (nirfcd, nirfc, nirfd);

   and #6 (nirq, nirfab, nirfcd);
endmodule

`endif //  `ifdef never

`endif //  `ifndef int_v

// End of file.
