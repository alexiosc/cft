`include "panel.v"
`include "control_unit.v"
`include "clock.v"

`timescale 1ns/10ps

module panel_tb();
   tri1        iend;

   reg [15:0]  sw_sr;
   reg 	       sw_nprwon, sw_lock;
   reg 	       sw_reset_in;
   reg 	       sw_start, sw_stop, sw_cont, sw_step;
   reg         sw_exam_mem, sw_exam_io, sw_dep_mem, sw_dep_io, sw_inc_addr;

   wire        reset, rsthold;
   wire [15:0] ibus;
   wire        isrun, isstop;
   wire        isfetch, isexecute;
   wire        clken, halt, step;

   wire        clk, clk2, clk3, clk4, clk5, guardpulse;

   integer     i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/panel_tb.vcd");
      $dumpvars (0, panel_tb);

      // Start with the switches in the off position
      sw_sr = 0;
      sw_nprwon = 1;
      sw_lock = 1;
      sw_reset_in = 1;
      sw_start = 1;
      sw_stop = 1;
      sw_cont = 1;
      sw_step = 1;
      sw_exam_mem = 1;
      sw_exam_io = 1;
      sw_dep_mem = 1;
      sw_dep_io = 1;
      sw_inc_addr = 1;
      
      // Turn the power on and unlock the panel.
      #500 sw_nprwon = 0;
      #500 sw_lock = 0;

      // Play with the reset, start, stop and continue switches.
      /*
      #40000 sw_reset_in = 0;
      #500 sw_reset_in = 1;
      #20000 sw_start = 0;
      #500 sw_start = 1;
      #20000 sw_stop = 0;
      #500 sw_stop = 1;
      #20000 sw_cont = 0;
      #500 sw_cont = 1;
      #20000 sw_start = 0;
      #500 sw_start = 1;
       */

      #20000 sw_stop = 0;
      #500 sw_stop = 1;

      for (i = 0; i < 4; i = i + 1) begin
	 #20000 sw_step = 0;
	 #10000 sw_step = 1;
      end

      /* 
      #20000 sw_cont = 0;
      #10000 sw_cont = 1;
       */
      
      
      //#4000 sw_start_mem = 0;
      //#50 sw_start_mem = 1;

      #1000 sw_dep_mem = 0;
      #1000 sw_dep_mem = 1;

      /*

      #1000 sw_exam_mem = 0;
      #1000 sw_exam_mem = 1;

      #1000 sw_dep_io = 0;
      #1000 sw_dep_io = 1;

      #1000 sw_exam_io = 0;
      #1000 sw_exam_io = 1;

      sw_step = 1;
      #2000 sw_step = 0;

      #50000 sw_stop = 0;
      #1000 sw_stop = 1;
      */

      #100000 $finish;      // Terminate simulation

   end // initial begin

   // Clock generator.
   clock_generator_v2 clock_generator (clken, // run (front panel)
				       step, // step (front panel)
				       reset,
				       clk, clk2, clk3, clk4, clk5, guardpulse);

   // The uPC counter.
   wire [3:0] upc;
   ucounter ucounter(clk, rsthold, iend, upc);

   // Simulate IEND
   assign iend = upc == 9 ? 1'b0 : 1'b1;

   panel panel (sw_sr,

		sw_nprwon, sw_lock,
		sw_reset_in,
		sw_start, sw_stop, sw_cont,
		sw_step,
		sw_dep_mem, sw_dep_io, sw_exam_mem, sw_exam_io, sw_inc_addr,

		reset, rsthold,
		
		ibus,
		clk,
		upc,
		iend,
		
		isrun, isstop, 
		isfetch, isexecute,
		clken, halt, step);

endmodule // vibrator_123_tb

// End of file.
