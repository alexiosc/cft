// REDESIGNED IN 2019

`ifndef reg_v_v
`define reg_v_v

`include "flipflop.v"
`include "mux.v"
`timescale 1ns/10ps


module reg_v(nreset, clk4, ibus13, fvin_add, 
	     nread_alu_add, nflagwe,
	     fv);
   // Declare inputs as regs and outputs as wires
   input  nreset;
   input  clk4;
   input  ibus13;
   input  fvin_add;
   input  nread_alu_add;
   input  nflagwe;
   
   output fv;

   wire   nreset;
   wire   clk4;
   wire   ibus13;
   wire   fvin_add;
   wire   nread_alu_add;
   wire   nflagwe;
   wire   fv, fv0, vd, vd0;

   // Source multiplexer for input data, with a 21ns delay line so
   // flip flop hold times aren't violated.
   mux_2g157 vd_mux (.sel(nflagwe), .a(ibus13), .b(fvin_add), .ng(1'b0), .y(vd0));

   // 3× 74hc32 used as a delay line.
   assign #21 vd = vd0;

   // The FF is clocked on the rising edge of nflagwe or nread_alu_add.
   assign #3 clkv = nflagwe & nread_alu_add;

   // Finally, the V flip flop.
   flipflop_74h vff1 (.d(vd), .clk(clkv), .set(1'b1), .rst(nreset), .q(fv0));

   // And this FF runs in the processor's clock domain, filtering out transient
   // FL changes and also drastically reducing the risk of metastability.
   flipflop_74h vff2 (.d(fv0), .clk(clk4), .set(1'b1), .rst(nreset), .q(fv));
   
endmodule // reg_v

`endif //  `ifndef reg_v_v

// End of file.

