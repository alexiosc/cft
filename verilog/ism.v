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
`include "latch.v"
`include "buffer.v"
`include "demux.v"

`timescale 1ns/10ps

module ism_control_gal (nreset, clk4, fi, action, nend, nidxen,
			nsti, ncli, ninh, endcp,
			naction_incpc, naction_incdr, naction_decdr,
			nir_idx);

   parameter delay = 10;	// Maximum delay per the Microchip/Atmel datasheet

   input       nreset;		// Actually RSTHOLD
   input       clk3;		// 
   input       clk4;		// 
   input       fi;		// Current interrupt flat
   input [3:0] action;		// Microcode ACTION field
   input       nend;		// End of microinstruction
   input       nidxen;		// (for convenience outputs): Indexing enabled

   output      nsti;		// Set FI
   output      ncli;		// Clear FI
   output      ninh;		// Inhibit interrupts
   output      endcp;		// End of instruction, rising CLK4
   output      naction_incpc;	// Convenience output: INCPC
   output      naction_incdr;	// Convenience output: INCDR
   output      naction_decdr;	// Convenience output: DECPC
   output      nir_idx;		// Convenience output: activate indexing

   // REVISION: ISMCTL00

   // STI asserted when action is 0011 during clk4.
   assign nsti = (                    ((clk4 == 1'b0) && (action == 4'b0011))) ? 1'b0 : 1'b1;

   // CLI asserted on reset (asynchronously), and also when action is 0100 during clk4.
   assign ncli = ((nreset == 1'b0) || ((clk4 == 1'b0) && (action == 4'b0100))) ? 1'b0 : 1'b1;

   // INH clears any pending interrupts and ignores subsequent incoming ones
   // while asserted. It's asserted asserted on reset (asynchronously), or when
   // ncli is asserted. Because the GAL treats everything as a sum of minterms,
   // ncli has to be decoded again in this equation.

   assign ninh = ((nreset == 1'b0) ||
		  ((clk4 == 1'b0) && (action == 4'b0100)) ||
		  (fi == 1'b0)) ? 1'b0 : 1'b1;

   // ENDCP is low when END is asserted during CLK4. This causes a rising edge
   // shortly after CLK4 which in turns turns nIRQSUC if an interrupt has been
   // received, and in turn causes the Control Store to jump to the interrupt
   // handler.
   assign endcp = ((clk4 == 1'b0) && (nend == 1'b0)) ? 1'b0 : 1'b1;

   // And these are some convenience outputs to reduce chip count.

   assign nir_idx = ({clk4, nidxen, action} == 6'b0_0_0101) ? 1'b0 : 1'b1;

   assign naction_incpc = ({clk4, action} == 5'b0_1000) ? 1'b0 : 1'b1;
   assign naction_incdr = ({clk4, action} == 5'b0_1010) ? 1'b0 : 1'b1;
   assign naction_decdr = ({clk4, action} == 5'b0_1011) ? 1'b0 : 1'b1;
endmodule // ism_control_gal


module int_fsm (nreset, clk3, clk4, action, ibus15, nwrite_fl, nend, nirq,
		fi, nirqs, nirqsuc,
		// Convenience outputs below
		nidxen,
		naction_incpc, naction_incdr, naction_decdr,
		nir_idx);

   input       nreset;
   input       clk3;
   input       clk4;
   input [3:0] action;
   input       ibus15;
   input       nwrite_fl;
   input       nend;
   inout       nirq;
   input       nidxen;		// (for convenience outputs): Indexing enabled

   output      fi;
   output      nirqs;		// IRQS signal for the bus
   output      nirqsuc;		// Identical IRQµC signal for the Control Unit

   output      naction_incpc;	// Convenience output: INCPC
   output      naction_incdr;	// Convenience output: INCDR
   output      naction_decdr;	// Convenience output: DECPC
   output      nir_idx;		// Convenience output: activate indexing

   wire        nsti;
   wire        ncli;

   // The control GAL saves a bunch of chips and makes it easy for me to fix logic errors.

   wire        ninh, endcp;

   ism_control_gal control_gal (.nreset(nreset),
				.clk4(clk4),
				.fi(fi),
				.action(action),
				.nend(nend),
				.nsti(nsti),
				.ncli(ncli),
				.ninh(ninh),
				.endcp(endcp),
				// These are for the convenience of other units, and not used here:
				.nidxen(nidxen),
				.naction_incpc(naction_incpc),
				.naction_incdr(naction_incdr),
				.naction_decdr(naction_decdr),
				.nir_idx(nir_idx));
   
   // The Interrupt Flag.
   flipflop_74h #(5,5) fi_ff (.d(ibus15), .clk(nwrite_fl), .nset(nsti), .nrst(ncli), .q(fi));

   // Incoming interrupts go through two flip-flops to reduce the chances of metastability.
   wire        nirq0, nirqr;

   flipflop_74h #(5,5) irq_ff0 (.d(nirq),  .clk(clk3), .nset(ninh), .nrst(1'b1), .q(nirq0));
   flipflop_74h #(5,5) irq_ff1 (.d(nirq0), .clk(clk4), .nset(ninh), .nrst(1'b1), .q(nirqr));
   //                            ^^^^         ^^^^                                ^^^^^
   
   // Once an IRQ has been registered, we wait until the end of the current
   // instruction before we signal the Control Unit. Signalling the CU is
   // always done on the rising edge of clk4, and signal endcp combines END and
   // CLK4 to do this.
   
   flipflop_74h #(5,5) irqs_ff0 (.d(nirqr), .clk(endcp), .nset(nreset), .nrst(1'b1), .q(nirqsuc));

   // IRQS and IRQµC are the same signal here driven by dirrent family flip-flops.
   flipflop_74h #(5,5) irqs_ff1 (.d(nirqr), .clk(endcp), .nset(nreset), .nrst(1'b1), .q(nirqs));

endmodule // int_unit


`endif //  `ifndef int_v

// End of file.
