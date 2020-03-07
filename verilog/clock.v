///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
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

`include "mux.v"
`include "counter.v"
`include "demux.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: CLOCK GENERATOR
//
// NOTES:
//
// The CFT clock is a four-phase, 75% duty cycle clock with two additional
// outputs.
//          _   _   _   _   _   _   _   _   _   _   
//  CLK   _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
//        _____     ________________     ___________
//  CLK1       \___/                \___/           
//        _________     ________________     _______
//  CLK2           \___/                \___/       
//        _____________     ________________     ___
//  CLK3               \___/                \___/   
//        _________________     ________________    
//  CLK4                   \___/                \___
//  ___   _____________         ____________        
//  T34                \_______/            \_______
//
///////////////////////////////////////////////////////////////////////////////

module clock_generator (nreset, fpclk, nfpclk_or_clk,
			clk1, clk2, clk3, clk4, t34, nrsthold);

   parameter cp = 62.5;

   inout nreset;		// Reset input
   inout fpclk;			// Front panel clock
   inout nfpclk_or_clk;		// low = fpclk, high = 4 MHz clock

   // 75% duty cycle clock outputs
   output clk1;			// 0° phase clock output
   output clk2;			// 90° phase clock output
   output clk3;			// 180° phase clock output
   output clk4;			// 270° phase clock output

   output t34;
   output nrsthold;		// nRSTHOLD output to Control Unit

   reg    clk;

   tri1   nreset;
   tri1   nfpclk_or_clk;
   tri1   fpclk;

   reg [15:0] state;		// For debugging, a two-character ASCII
				// register with the current cycle state. (T1-T4)

   // Simulate the oscillator
   initial begin
      clk = 0;
   end
   always begin
      #(cp / 2) clk = ~clk;
   end

   // This is only used for debugging.
   always @(clk1, clk2, clk3, clk4) begin
      case ({clk1, clk2, clk3, clk4})
	4'b0111: state <= "T1";
	4'b1011: state <= "T2";
	4'b1101: state <= "T3";
	4'b1110: state <= "T4";
	default: state <= "??";
      endcase
   end

   // Clock source multiplexer
   wire clkin;
   mux_1g157 clksource (.sel(nfpclk_or_clk), .a(fpclk), .b(clk), .ng(1'b0), .y(clkin));

   // Two phase clock counters.
   wire [3:0] q;
   counter_191 ctr1 (.p(4'b0000), .npl(nreset), .down(1'b0), .nce(1'b0), .cp(clkin), .q(q));

   // Phase clock generators ('139 decoders)
   wire [3:0] tmp;
   demux_139h phasegen1 (.ng(1'b0), .a({q[1], q[0]}), .y({clk4, clk3, clk2, clk1}));
   demux_139h phasegen2 (.ng(1'b0), .a({1'b0,  q[1]}), .y(tmp));
   assign t34 = tmp[1];

   // The Reset Counter forces the Control Unit to execute its reset
   // microprogram for a few hunder cycles after RESET has deasserted. This
   // gives everything ample time to stabilise.
   wire [7:0] resetq;
   assign nrsthold = resetq[4];	// 32 cycles
   //assign nrsthold = resetq[7];	// 128 cycles, true to hardware
   counter_590 reset (.cpc(clk3), .cpr(clk3), .nce(nrsthold), .nmrc(nreset), .noe(1'b0), .q(resetq));
endmodule // clock_generator

`endif //  `ifndef clock_v

// End of file.
