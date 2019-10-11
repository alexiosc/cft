// REDESIGNED IN 2019

`ifndef reg_l_v
`define reg_l_v

`include "flipflop.v"
`include "mux.v"
`timescale 1ns/10ps


// #READ-ALU-ADD = clock for FLIN-ADD
// ____________                              ______          ___   ___
// READ-ALU-ADD  FLIN-ADD   BCP    FLIN-SRU  FLAGWE   IBUS   CLL   CPL  |   FF IN    CLKSEL
//      0            0       X        X         X       X     X     X   |     0      READ-ALU-ADD
//      0            1       X        X         X       X     X     X   |     1      READ-ALU-ADD
//      1            X       0        0         X       X     X     X   |     0      BCP
//      1            X       0        1         X       X     X     X   |     1      BCP
//      1            X       1        X         0       0     X     X   |     0      #WRITE-FLAGS
//      1            X       1        X         0       1     X     X   |     1      #WRITE-FLAGS
//      1            X       1        X         1       X     0     X   |     0      #CLL
//      1            X       1        X         1       X     1     0   |     #FL    #CPL
//
// Default: BCP
// If #READ-ALU-ADD:
//     * select #READ-ALU-ADD for clock
//     * select FLIN-ADD for data
// Else if #WRITE-FLAGS:
//     * select #WRITE-FLAGS for clock
//     * select FLIN-ADD for data
// Else:
//     * select BCP for clock
//     * select FLIN-SRU for data

// Clock = and(READ-ALU-ADD, WRITE-FLAGS, BCP)
// Data = mux(FLIN-ADD, FLIN-SRU, IBUS)
// #CLL & CPL: combine into #PRE/#CLR ff inputs.
//
// #PRE = #CPL OR Q
// #CLR = #RESET AND #CLL AND (#CPL OR #Q)
// But: what happens after Q changes as a result of setting or clearing?
// (use a second FF that clocks on raising edge of CLK4?)


module reg_l(nreset, clk4, naction_cpl, ibus12, flin_add, 
	     flin_sru, nread_alu_add, nflagwe, bcp, naction_cll,
	     fl, flfast);
   // Declare inputs as regs and outputs as wires
   input  nreset;
   input  clk4;
   input  naction_cpl;
   input  ibus12;
   input  flin_add;
   input  flin_sru;
   input  nread_alu_add;
   input  nflagwe;
   input  bcp;
   input  naction_cll;
   
   output fl, flfast;

   wire   nreset;
   wire   clk4;
   wire   naction_cpl;
   wire   ibus12;
   wire   flin_add;
   wire   flin_sru;
   wire   nread_alu_add;
   wire   nflagwe;
   wire   bcp;
   wire   naction_cll;
   wire   fl, nfl, flfast;
   
   // Source multiplexer for input data, with a 21ns delay line so
   // flip flop hold times aren't violated.
   wire   ld, ld0;
   mux_253h ld_mux (.sel({nflagwe, nread_alu_add}),
		    .i({flin_sru, flin_add, ibus12, ibus12}),
		    .noe(1'b0), .y(ld0));
   assign #21 ld = ld0;

   wire   nsetl, nclrl0, nclrl;

   // These implement CPL (toggle L. CPL is driven to both asynchronous SET and
   // CLR signals on the flip flop, but one of these is masked depending on the
   // FF state).
   assign #6 nsetl = fl | naction_cpl; // Mask #CPL when FL is 1.
   assign #6 nclrl0 = nfl | naction_cpl; // Mask #CPL when FL is 0.

   // The FF is cleared when nreset, naction_cll, or nclrl0 are asserted (low).
   assign #4 nclrl = nclrl0 & nreset & naction_cll;

   // The clock
   wire   clkl0, clkl;
   assign #3 clkl0 = nflagwe & nread_alu_add;
   assign #3 clkl = clkl0 & bcp;

   // Finally, the L flip flop. This runs in the Shift/Roll Unit's clock domain
   // (which can be 4× the rest of the processor's)
   flipflop_74h flfast_ff (.d(ld), .clk(clkl), .nset(nsetl), .nrst(nclrl), .q(flfast));

   // And this FF runs in the processor's clock domain, filtering out transient
   // FL changes and also drastically reducing the risk of metastability.
   flipflop_74h fl_ff (.d(flfast), .clk(clk4), .nset(1'b1), .nrst(nreset), .q(fl), .nq(nfl));
   
endmodule // reg_l

`endif //  `ifndef reg_l_v

// End of file.

