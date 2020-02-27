///////////////////////////////////////////////////////////////////////////////
//
// THE INTERRUPT STATE MACHINE
//
// REDESIGNED IN 2019
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////


`ifndef int_v
`define int_v

`include "flipflop.v"
`include "buffer.v"
`include "demux.v"

`timescale 1ns/10ps

module int_fsm (nreset, clk4, action, ibus15, nflagwe, nend, nirq,
		fi, nirqs, nirqsuc);

   input       nreset;
   input       clk4;
   input [3:0] action;
   input       ibus15;
   input       nflagwe;
   input       nend;
   inout       nirq;

   output      fi;
   output      nirqs;		// IRQS signal for the bus
   output      nirqsuc;		// Identical IRQµC signal for the Control Unit

   wire [7:0]  y;
   wire        naction_sti;
   wire        naction_cli;

   // Decode the ACTION microcode field to derive STI and CLI strobes.
   demux_138 action_decoder (.g1(1'b1), .ng2a(action[3]), .ng2b(clk4), .a(action[2:0]), .y(y));
   assign naction_sti = y[3];
   assign naction_cli = y[4];

   // Generate control strobes
   wire        nreset_or_cli;
   wire        endcp;
   assign #6 nreset_or_cli = nreset & naction_cli; // Active low logic: & is ‘or’
   assign #6 endcp = nend | clk4;		   // nEND asserted during CLK4.

   // The Interrupt Flag.
   flipflop_74h fi_ff    (.d(ibus15), .clk(nflagwe), .nset(naction_sti), .nrst(nreset_or_cli), .q(fi));
   // Note: FI and nINH(IBIT) are the same signal.

   // Incoming interrupts go through a latch and flip-flop to reduce the chances of metastability.
   wire        nirq0, nirq1;
   latch_1g373 irq_latch (.noe(1'b0), .le(clk4), .d(nirq), .q(nirq0));
   flipflop_74h irq_ff   (.d(nirq0), .clk(clk4), .nset(fi), .nrst(1'b1), .q(nirq1));

   // Once an IRQ has been registered, we wait until the end of the current
   // instruction before we signal the Control Unit. Signalling the CU is
   // always done on the rising edge of clk4, and signal endcp combines END and
   // CLK4 to do this.
   flipflop_74h irqs_ff (.d(nirq1), .clk(endcp), .nset(nreset_or_cli), .nrst(1'b1), .q(nirqsuc));

   // IRQS and IRQµC are the same signal here. On the CFT, they're driven
   // separately, with IRQS driven from the inverted flipflop output, through
   // an '1G04 inverter to flip it back again.
   assign #6 nirqs = nirqsuc;
endmodule // int_unit


`endif //  `ifndef int_v

// End of file.
