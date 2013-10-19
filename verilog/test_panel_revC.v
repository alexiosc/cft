`include "flipflop.v"
`include "clock.v"
`include "vibrator.v"
`include "priority.v"
`include "counter.v"

`timescale 1ns/10ps

module PB1_clock(nreset,
		 fpclken, fpustep,
		 rstclk,
		 clk1, clk2, clk3, clk4, nt12, nt34);

   input  nreset;
   input  fpclken;
   input  fpustep;

   output rstclk;
   output clk1;
   output clk2;
   output clk3;
   output clk4;
   output nt12;
   output nt34;

   wire fastclock;
   
   vibrator_xo #63 xtal1(.q(fastclock));

   // This is used by the reset sequencer
   assign rstclk = fastclock;

   // The current PB1 has no on-board slow clocks to save board estate. Slow
   // clocks live on the front panel board, which makes more sense -- without the
   // front panel, they'd be unusable anyway.
   
   wire rawclock0, rawclock1;

   // Run/Stop/Step Control. fpustep is pulled low, fpclken is pulled high.
   mux_253h ic003a_253_runcontrol (.sel({fpclken, fpustep}),
   				    .i({fastclock, fastclock, 2'b10}),
   				    .oe(0), .y(rawclock1));
   // Phase counter
   wire [3:0] 	  phase_q;
   counter_193 ic004_193_phase (.clear(0), .load(nreset), .p(4'b0000),
   				.count_up(rawclock1), .count_down(1), .q(phase_q));

   // Phase decoders
   wire 	  nt12;
   wire [3:0] 	  ph90, ph180;

   demux_139h ic005a_139_ph90 (.g(0), .a(phase_q[1:0]), .y(ph90));
   demux_139h ic005b_139_ph180 (.g(0), .a({1'b0, phase_q[1]}), .y(ph180));
   
   assign clk1 = ph90[0];
   assign clk2 = ph90[1];
   assign clk3 = ph90[2];
   assign clk4 = ph90[3];
   assign nt12 = ph180[0];
   assign nt34 = ph180[1];
   
endmodule // PB1_clock



module test();

   wire pclk;
   
   reg nreset;

   wire clk1, clk2, clk3, clk4, nt12, nt34;

   reg 	nsw_run, nsw_stop, nsw_step, nsw_ustep;
   reg  nsw_ldaddr, nsw_ldca, nsw_ldir;
   reg  nsw_memw, nsw_memr;
   reg  nsw_iow, nsw_ior;
   reg  nsw_inc;
   reg  ar_timer;

   wire [2:0] ah, al;
   wire       gsh, gsl, ngs, gs, start, start0, swclken;
   wire       eo, op_inc, fpinc;
   wire       nopend, nidle0, nidle;
   wire [3:0] op0, fpop;
   wire [7:0] op1, op2;
   wire       nswstrobe;
   wire [3:0] state_count;
   wire [7:0] t;

   wire [2:0] st, st1;
   wire       ar0, ar12;

   integer i;
   
      
initial begin
     
     //$display ("time\t d pulse");
     //$monitor ("%g\t  %b %b %b %b", 
     // 	       $time, d, pulse1, pulse2, pulse);
     $dumpfile ("vcd/test_panel_revC.vcd");
     $dumpvars (0, test);

   ar_timer <= 0;
   nreset = 0;
   nsw_run = 1;
   nsw_stop = 1;
   nsw_step = 1;
   nsw_ustep = 1;
   nsw_ldaddr = 1;
   nsw_ldca = 1;
   nsw_ldir = 1;
   nsw_memw = 1;
   nsw_memr = 1;
   nsw_iow = 1;
   nsw_ior = 1;
   nsw_inc = 1;

   #1000 nreset = 1;
   #5000;
   

   #333333 nsw_run = 0;
   #9666660 nsw_run = 1;

   // #333333 nsw_stop = 0;
   // #333333 nsw_stop = 1;

   // #333333 nsw_step = 0;
   // #333333 nsw_step = 1;

   // #333333 nsw_ustep = 0;
   // #333333 nsw_ustep = 1;

   // #333333 nsw_ldaddr = 0;
   // #333333 nsw_ldaddr = 1;

   // #333333 nsw_ldca = 0;
   // #333333 nsw_ldca = 1;

   // #333333 nsw_ldir = 0;
   // #333333 nsw_ldir = 1;

   // #333333 nsw_memw = 0;
   // #333333 nsw_memw = 1;

   // #333333 nsw_memr = 0;
   // #333333 nsw_memr = 1;

   // #333333 nsw_iow = 0;
   // #333333 nsw_iow = 1;

   // #333333 nsw_ior = 0;
   // #333333 nsw_ior = 1;

   
   // #5000 ei <= 1;
   // for (i = 0; i < 256; i = i + 1) begin
   //    #1000 a <= i;
   // end

   // #5000 ei <= 0;
   // for (i = 0; i < 256; i = i + 1) begin
   //    #1000 a <= i;
   // end
   
   #3000000 $finish;
     
end // initial begin

   priority_148 ph(.a({nsw_memw,
		      nsw_memr,
		      nsw_iow,
		      nsw_ior,
		      nsw_run,
		      nsw_stop,
		      nsw_step,
		      nsw_ustep
		      }), .ei(0), .y(ah), .gs(gsh), .eo(eo));
   
   priority_148 pl(.a({nsw_ldaddr,
		       nsw_ldca,
		       nsw_ldir,
		       5'b11111}), .ei(eo), .y(al), .gs(gsl));

   mux_157 opmux (.sel(gsh), .i1({1'b0, ah}), .i2({1'b1, al}), .oe(0), .y(op0));

   assign op_inc = ~nsw_inc;

   and #7 (ngs, gsl, gsh);
   not #7 (gs, ngs);
   
   flipflop_574 op_cdc0 (.d({~op_inc, 3'b00, op0}), .q(op1), .clk(pclk), .oe(0));   
   flipflop_574 op_cdc1 (.d(op1), .q(op2), .clk(pclk), .oe(0));

   // and #14 (nopend, t[7], nreset);
   // //assign nopend = nreset;
		 
   // flipflop_112h strobe0 (.set(1), .j(1), .clk(ngs), .k(0), .rst(nopend), .q(nidle0));
   // flipflop_112h strobe1 (.set(1), .j(nidle0), .clk(pclk), .k(0), .rst(nopend), .qn(nidle));

   // // State counter
   // counter_193 state_ctr (.clear(nidle), .load(1), .p(0), .count_up(pclk), .count_down(1), .q(state_count));
   // demux_138 state_demux (.g1(1), .g2a(nidle), .g2b(0), .a(state_count[2:0]), .y(t));

   
   assign fpinc = op2[7];
   assign fpop = op2[3:0];


   flipflop_74h cdc_start1(.d(1), .clk(gs), .set(1), .rst(nreset && t[7]), .q(start0));
   flipflop_74h cdc_start2(.d(start0), .clk(pclk), .set(1), .rst(nreset), .q(start));
   
   mux_251 mux_state0(.sel(st), .d({ar0, 6'b101010, start}), .e(0), .y(st1[0]));
   mux_251 mux_state1(.sel(st), .d({ar12, 7'b1100110}), .e(0), .y(st1[1]));
   mux_251 mux_state2(.sel(st), .d({ar12, 7'b1111000}), .e(0), .y(st1[2]));

   flipflop_175 ff_state (.d({1'b0, st1}), .q(st), .clk(pclk), .rst(nreset));

   demux_138 demux_state (.g1(1), .g2a(0), .g2b(0), .a(st), .y(t));

   mux_253 mux_ar(.sel({ar_timer, gs}), .i1(4'b1010), .oe1(0), .y1(ar0), .i2(4'b0010), .oe2(0), .y2(ar12));


   always @(t[1], negedge t[3]) begin
      if (t[1] == 0) ar_timer <= 1;
      else if (t[3] == 0) begin
	 #5000000 ar_timer <= 0;
      end
   end
   
   vibrator_555 #(200000,200000) clockgen(pclk);

   PB1_clock cft_clock (.nreset(nreset),
	      .fpclken(1), .fpustep(0),
	      .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4),
	      .nt12(nt12), .nt34(nt34));

endmodule // tritest
