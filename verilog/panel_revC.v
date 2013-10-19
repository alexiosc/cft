`ifndef panel_v
 `define panel_v

 `include "flipflop.v"
 `include "vibrator.v"
 `include "comparator.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: the Front Panel.
//
///////////////////////////////////////////////////////////////////////////////

module panel(

	     // Front panel switches
	     sr,
	     npwron, lock,
	     reset_in,		// Reset on negedge
	     start, stop, cont,
	     step_in,
	     dep_mem, dep_io, exam_mem, exam_io, inc_addr,

	     // Inputs from the processor
	     reset, rsthold,
	     ibus,
	     clk,
	     upc,
	     iend,

	     // Lights
	     isrun, isstop,
	     isfetch, isexecute,

	     // Output signals
	     clken, halt, step);

   input [15:0] sr;		// The switch register

   input 	npwron, lock;	// The lock switch

   // Active low switches
   input 	reset_in;
   input 	start, stop, cont;
   input 	step_in;

   // Memory and I/O examine/deposit switches. Double pole. Downwards
   // performs examine/deposit op, upwards also increments address
   // register (PC). All four inc_addr signals are wired together into
   // one.
   input 	dep_mem, dep_io, exam_mem, exam_io, inc_addr;

   output 	reset, rsthold;

   inout [15:0] ibus;
   input        clk;
   input [3:0] 	upc;
   input        iend;

   output 	isrun, isstop;
   output 	isfetch, isexecute;
   output       clken, halt, step;
   
   wire [15:0] 	sr;
   wire 	reset0, reset, rsthold;
   wire 	isrun, isstop;

   reg          powergood;
   wire 	reset_in0;

   // Reset circuitry
   assign reset_in0 = reset_in & start & powergood;
   vibrator_123h #2000 ffreset1 (reset_in0, 1'b1, 1'b1, , reset0);
   assign reset = reset0 & reset_in0;
   vibrator_123h #8000 ffreset2 (1'b0, reset, 1'b1, , rsthold);

   // Run/stop circuitry
   //
   // Run conditions (asynchronous):
   //   * Run switch activated.
   //   * Step switch activated.
   //
   // Stop conditions:
   //   * Power on (asynchronous)
   //   * Power failure (asynchronous)
   //   * Stop switch activated (synchronous)
   //   * Step switch activated and execute stage reached (synchronous)
   //   * Processor OUTs to location HALT (FPHALTINSTR; synchronous)
   //
   // Use a 112 flip-flop. Power on behaviour is hard-coded using the
   // J/K inputs, with CLK provided by by the PSU's POWERGOOD signal
   // (which is low for a few milliseconds when the PSU is first
   // turned on, and during brown-outs).
      
   wire 	fprun, fpstop, fpstep, fpstep0, fpstep1, fpstep2;
   wire 	fetch, f0, f1, f2;
   wire 	isrun1, isrun2;
   wire 	isstep, nisstep;
   assign fprun = start && cont;
   assign fpstop = ~stop;

   // Edge detect fpstep
   nand #20 (fpstep0, step_in, step_in);
   nand #20 (fpstep, step_in, fpstep0);

   // Edge detect fetch
   nand #20 (f0, ~isfetch, ~isfetch);
   nand #20 (fetch, ~isfetch, f0);
	     
   flipflop_112h ff_rc1 (0, fpstop, clk, fprun, powergood, isrun1,);
   flipflop_112h ff_rc2 (1, 0, fpstep, 1, fetch, isrun2,);

   // This should an open collector output
   assign isrun = isrun1 || isrun2;
   assign clken = isrun;
   assign isstop = ~isrun;
   assign halt = ~isstop;


   // When the power turns on, simulate the power good signal
   initial begin
      powergood <= 0;
   end
   
   always @(negedge npwron) begin
      powergood <= 0;
      #2000 powergood <= 1;
   end

   // !STEP Autorepeat Warning: time delays are NOT to scale, and only
   // set to these values to ease viewing of the pulses. The 555
   // should output a frequency lower than the clock frequency of the
   // processor. Since a human is operating the !STEP switch,
   // something in the order of 10 to 20 Hz is right. The '123 time
   // delay should be in the order of seconds.
   wire autorepeat_p1, autorepeat_p2, autorepeat_p3;
   vibrator_123h #1000000 step_autorepeat_123 (1'b0, step_in, 1'b1, , autorepeat_p1);
   vibrator_555 #(50000,50000) step_autorepeat_555 (autorepeat_p2);
   nand step_autorepeat_nand1 (autorepeat_p3, autorepeat_p1, autorepeat_p2);
   nand step_autorepeat_nand2 (step, step_in, autorepeat_p3);

   ///////////////////////////////////////////////////////////////////////////////
   //
   // MEMORY/I/O SEQUENCER
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   // Sequencer waveform (!MCSTART is the trigger)
   //          _____
   // !MCSTART    \_\______________________________ _ _ _
   //          ____      ________________________________
   // !MC0         |____|
   //          ____          ____________________________
   // !MC1         |________|
   //          _____________                  ___________
   // !MC2                  |________________|
   //          _____________          ___________________
   // !MC3                  |________|
   //
   //
   // Memory or I/O write waveform
   //          _____
   // !MCSTART    \_\______________________________ _ _ _
   //          ____      ________________________________
   // !WAR         |____|
   //          ____          ____________________________
   // !RPC         |________|
   //          _____________                  ___________
   // !MEM,!IO              |________________|
   //            ___________                  ___________
   // !INCPC (2)            |________________|
   //          _____________                  ___________
   // !RAC                  |________________|
   //          _____________          ___________________
   // !W                    |________|
   //
   //
   // Memory or I/O read waveform
   //          _____
   // !MCSTART    \_\______________________________ _ _ _
   //          ____      ________________________________
   // !WAR         |____|
   //          ____          ____________________________
   // !RPC         |________|
   //          _____________                  ___________
   // !MEM,!IO              |________________|
   //            ___________                  ___________
   // !INCPC (2)            |________________|
   //          _____________                  ___________
   // !R                    |________________|
   //          _____________          ___________________
   // !WAC                  |________|
   //
   //
   // NOTES:
   //
   // (1) !MCSTART must last longer than the entire sequence, but
   //     !MCSTART is human operated and the switch will likely stay
   //     pressed for at least a few milliseconds.
   // (2) !INCPC is only triggered when !INCADDR is asserted via the
   //     front panel (upward push of deposit/examine switch).
   // (3) Since the address is stored in the PC, it must be clocked to
   //     the AR before the memory cycle begins. The AR clocks on the
   //     rising edge of !WAR.

   wire mcstart;
   vibrator_123h #125 ffmioseq1 (mcstart, 1'b1, 1'b1, , mc0);
   vibrator_123h #250 ffmioseq2 (mcstart, 1'b1, 1'b1, , mc1);
   vibrator_123h #500 ffmioseq3 (1'b0, mc1, 1'b1, , mc2);
   vibrator_123h #250 ffmioseq4 (1'b0, mc1, 1'b1, , mc3);

   // Memory examine/deposit switch decoder
   wire mc0, mc1, mc2, mc3, fpio, fpmem, fpr, fpw;
   and and_startmem (mcstart, dep_mem, dep_io, exam_mem, exam_io);
   and and_fpio (fpio, dep_io, exam_io);
   and and_fpmem (fpmem, dep_mem, exam_mem);
   and and_fpr (fpr, exam_io, exam_mem);
   and and_fpw (fpw, dep_io, dep_mem);

   // Examine/deposit cycle encoder
   wire mem0, io0, r0, w0, incpc0, rpc0, war0, incaddr0, rac0, wac0;
   or or_mem (mem0, fpmem, mc2);
   or or_io (io0, fpio, mc2);

   or or_r (r0, fpr, mc2);
   or or_w (w0, fpw, mc3);
   or or_incaddr (incaddr0, inc_addr, mc2);
   or or_rpc (rpc0, mc1, mc1);
   or or_war (war0, mc0, mc0);
   or or_rac (rac0, fpw, mc2);
   or or_wac (wac0, fpr, mc3);

   // Decode the fetch/execute. This is done by checking the UPC. The
   // first 4 cycles are fetch, the rest execute. For flexibility, a
   // three-bit dip switch (or jumper bank) and comparator is used. We
   // hardwire the number here, though. The OR gate is a wired OR.
   wire exec1, exec2;
   comparator_85 fecmp (upc, 3, 1'b0, 1'b1, 1'b0, isfetch, exec1, exec2);
   or orexec(isexecute, exec1, exec2);

endmodule // panel


`endif //  `ifndef panel_v

// End of file.
