// REDESIGNED IN 2019

`ifndef reg_v_v
`define reg_v_v

`include "flipflop.v"
`include "mux.v"
`timescale 1ns/10ps


module reg_v(nreset, clk4,
	     fvout_rom,  nsetv_rom,
	     ibus13, nflagwe,
	     fv);
   // Declare inputs as regs and outputs as wires
   input  nreset;
   input  clk4;
   input  fvout_rom;
   input  nsetv_rom;
   input  ibus13;
   input  nflagwe;
   
   output fv;

   wire   nreset;
   wire   clk4;
   wire   fvout_rom;
   wire   netv_rom;
   wire   ibus13;
   wire   nflagwe;
   wire   fv, fv0, vd, vd0;

   // Source multiplexer for input data, with a 21ns delay line so
   // flip flop hold times aren't violated.
   mux_2g157 vd_mux (.sel(nflagwe), .a(ibus13), .b(fvout_rom), .ng(1'b0), .y(vd0));

   // 3× 74hc32 used as a delay line.
   assign #21 vd = vd0;

   // The FF is clocked on the rising edge of nflagwe or nread_alu_add.
   wire   clkv;
   assign #3 clkv = nflagwe & nsetv_rom;

   // Finally, the V flip flop.
   flipflop_74h vff1 (.d(vd), .clk(clkv), .nset(1'b1), .nrst(nreset), .q(fv0));

   // And this FF runs in the processor's clock domain, filtering out transient
   // FL changes and also drastically reducing the risk of metastability.
   flipflop_74h vff2 (.d(fv0), .clk(clk4), .nset(1'b1), .nrst(nreset), .q(fv));
   
endmodule // reg_v

`endif //  `ifndef reg_v_v

// End of file.

