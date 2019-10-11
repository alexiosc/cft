///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: DFP Run Control State Machine
//
///////////////////////////////////////////////////////////////////////////////

// The DFP uses a counter and decoders to produce 32 pulses which
// drive various quantities on the 8-bit FPD (Front Panel Data)
// bus. These are synchronised with the front panel modules to update
// the front panel lights, and can also be used by the DFP itself to
// read the state of the computer in detail. The DFP needs to
// interrupt the automatic scan featuer when it needs to read, but
// hopefully this happens so quickly that the panel user is none the
// wiser.
//
// And it saves approximately 160 wires!

`ifndef dfp_run_control_v
`define dfp_run_control_v

`include "mux.v"
`include "flipflop.v"

`timescale 1ns/10ps


module dfp_run_control (nreset, nrsthold, clk4,
			step_nrun, fpfetch_nexec, nclr, nustep,
			fpclken_in, fpustep_in,
			fpclken_out, fpustep_out,
			nwait);
   
   input 	 clk4;		
   input 	 nreset;
   input 	 nrsthold;

   input         step_nrun;	// 1 = step, 0 = run
   input         fpfetch_nexec;	// 1 = fetch, 0 = exec
   input 	 nclr;		// Reset signal from MCU.
   input 	 nustep;	// 0 = MCU requesting microstep.
   input 	 fpclken_in;
   input 	 fpustep_in;

   output 	 fpclken_out;
   output 	 fpustep_out;
   output 	 nwait;		// 1 = run control idle, 0 = MCU must wait for halt.

   // FF 1 allows for stopping, running, and stepping through whole
   // instructions.
   wire 	 stepping, nstepping;
   flipflop_74h ff1 (.d(1'b0), .clk(fpfetch_nexec), .nset(step_nrun), .nrst(nclr), .q(stepping), .nq(nstepping));

   // FF 2 allows for microsteps: one processor cycle at a time.
   wire 	 ustepping, nustepping;
   flipflop_74h ff2 (.d(1'b0), .clk(clk4), .nset(nustep), .nrst(nclr), .q(ustepping), .nq(nustepping));
   
   // FF 3 switches to the highest clock speed during resets. (because resets
   // last a large number of clock cycles and the DFP may have set a very slow
   // clock speed and the reset sequence may last for whole minutes.)
   wire 	 resetting, nresetting;
   flipflop_74h ff3 (.d(1'b0), .clk(nrsthold), .nset(nreset), .nrst(nclr), .q(resetting), .nq(nresetting));

   // Use a '253 as an arbitrary function evaluator to select the correct clock
   // control signals to the clock generator.
   mux_253 clk_mux (.sel({ustepping, stepping}),
		    .i1({fpclken_in, fpclken_in, fpclken_in, 1'b0}), .noe1(resetting), .y1(fpclken_out),
		    .i2({fpustep_in, fpustep_in, fpustep_in, 1'b0}), .noe2(resetting), .y2(fpustep_out));

   // Finally, generate the WAIT# output to the MCU. (worst case propagation
   // delay for LVC device at 5V)
   assign #6 nwait = nstepping & nustepping & nresetting;
   
endmodule // dfp_run_control

`endif //  `ifndef clock_v

// End of file.
