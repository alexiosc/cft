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

module ism (nreset, clk1, clk3, clk4, nend,
	    naction_sti, naction_cli, nirq,
	    fi, nirqs);

   input        nreset;
   input 	clk1;
   input 	clk3;
   input 	clk4;
   input 	nend;
   input 	naction_sti;
   input 	naction_cli;
   input 	nirq;

   output 	fi, nfi;
   output 	nirqs;

   wire 	nint0;
   wire 	nint;
   wire 	irqs0;
   wire 	nreset_or_cli;
   wire 	endcp;
   wire 	interrupt;
   wire 	nirqsync;

   // Note: the propagation delays are greatly exaggerated for LVC family parts.
   assign #6 nreset_or_cli = nreset & naction_cli;
   assign #6 endcp = clk4 | nend;
   assign #7 nirqsync = nfi | nirq | clk1;
   
   // The Interrupt Flag (FI)
   flipflop_74h ff_fi (.nset(naction_sti), .d(1'b1), .clk(1'b1), .nrst(nreset_or_cli),
		       .q(fi), .nq(nfi));

   // Incoming IRQs.
   flipflop_74h ff_irq1 (.nset(nirqsync), .d(1'b1), .clk(1'b1), .nrst(nreset_or_cli),
   			 .q(interrupt));
   
   flipflop_74h ff_irq2 (.nset(1'b1), .d(interrupt), .clk(endcp), .nrst(nreset),
			 .nq(nirqs));
endmodule // ism

`endif //  `ifndef ism_v

// End of file
