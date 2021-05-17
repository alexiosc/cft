///////////////////////////////////////////////////////////////////////////////
//
// THE L REGISTER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// reg_l.v -- The L Register
//
// Copyright © 2011–2019 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`ifndef reg_l_v
`define reg_l_v

`include "flipflop.v"
`include "mux.v"
`timescale 1ns/10ps

// The Link Register is a complex register:
//
// * It can acquire its value from the ALU ROM as a result of addition.
// * It can acquire its value from the SRU (shifts and rotations)
// * It can acquire its value from the Flag Unit (IBUS12)
// * It can be cleared by the Control Unit.
// * It can be toggled by the Control Unit.
//
// Slow paths: ACTION_CLL, ACTION_CPL, NFLAGWE
// Fast paths: ALU ROM, SRU
//
// The SRU is the most critical, fastest path and is given special dispensation
// in the schematics. (e.g. it's the ‘default’ value for the multiplexer)
//
// This makes the logic quite complicated and the L register currently has a
// chip count of seven.
//   ________                                ______          ___   ___
//   SETL-ROM    FLOUT-ROM  BCP  FLOUT-SRU   FLAGWE   IBUS   CLL   CPL  |   FF IN    CLKSEL
//      0            0       X        X         X       X     X     X   |     0      SETL-ROM
//      0            1       X        X         X       X     X     X   |     1      SETL-ROM
//      1            X       0        0         X       X     X     X   |     0      BCP
//      1            X       0        1         X       X     X     X   |     1      BCP
//      1            X       1        X         0       0     X     X   |     0      #WRITE-FLAGS
//      1            X       1        X         0       1     X     X   |     1      #WRITE-FLAGS
//      1            X       1        X         1       X     0     X   |     0      #CLL
//      1            X       1        X         1       X     1     0   |     #FL    #CPL
//
// Default: BCP
// If #READ-ALU-ADD:
//     * select #SETL-ROM for clock
//     * select FLOUT-ROM for data
// Else if #WRITE-FLAGS:
//     * select #WRITE-FLAGS for clock
//     * select IBUS12 for data
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


module reg_l(nrsthold, clk4,
	     naction_cpl, ibus12, 
	     flin_add,  flin_sru,
	     nsetl_rom, nflagwe, bcp, naction_cll,
	     fl, flfast);
   // Declare inputs as regs and outputs as wires
   input  nrsthold;
   input  clk4;
   input  naction_cpl;
   input  ibus12;
   input  flin_add_toggle;
   input  flin_add;
   input  flin_sru;
   input  nsetl_rom;
   input  nflagwe;
   input  bcp;
   input  naction_cll;
   
   output fl, flfast;

   wire   nfl;

   // // U19: toggle FL when the ROM requests it.
   // assign flin_add_toggle = flin_add ^ fl;
   
   // // Cascaded 1-of-3 priotiry selector for input data, with a 21ns delay line
   // // so flip flop hold times aren't violated.
   // wire   ld, ld0;
   // // mux_253h ld_mux (.sel({nflagwe, nsetl_rom}),
   // // 		    .i({flin_sru, flin_add, ibus12, ibus12}),
   // // 		    .noe(1'b0), .y(ld0));
   // mux_253h ld_mux (.sel({nflagwe, nsetl_rom}),
   // 		    .i({flin_sru, flin_add_toggle, ibus12, ibus12}),
   // 		    .noe(1'b0), .y(ld0));
   // assign #21 ld = ld0;

   // wire   nsetl, nclrl0, nclrl;

   // // These implement CPL (toggle L. CPL is driven to both asynchronous SET and
   // // CLR signals on the flip flop, but one of these is masked depending on the
   // // FF state).
   // assign #6 nsetl = fl | naction_cpl;   // Mask #CPL when FL is 1.
   // assign #6 nclrl0 = nfl | naction_cpl; // Mask #CPL when FL is 0.

   // // The FF is cleared when nrsthold, naction_cll, or nclrl0 are asserted (low).
   // assign #4 nclrl = nclrl0 & nrsthold & naction_cll;

   // // The clock
   // // wire   clkl0, clkl;
   // // assign #0.5 clkl0 = nflagwe & nsetl_rom;
   // // assign #0.5 clkl = clkl0 & bcp;
   // wire   clkl;
   // assign #4 clkl = nflagwe & nsetl_rom & bcp;

   // // Finally, the L flip flop. This runs in the Shift/Roll Unit's clock domain
   // // (which can be 4× the rest of the processor's). Note: use AC family here,
   // // 10ns propagation delays at 5V.
   // flipflop_74h #(10,10) flfast_ff (.d(ld), .clk(clkl), .nset(nsetl), .nrst(nclrl), .q(flfast));


   // This implements the FL part of the flag GAL in lieu of the more
   // complicated description above. Chip count is now three or four for both
   // FL and FV.

   wire   nclrl, nsetl;
   assign #15 nclrl = (nrsthold == 1'b0 ||
		       naction_cll == 1'b0 ||
		       (fl == 1'b1 && naction_cpl == 1'b0) ||
		       (ibus12 == 1'b0 && nflagwe == 1'b0) ||
		       (fl == 1'b1 && flin_add == 1'b1 && nsetl_rom == 1'b0)) ? 1'b0 : 1'b1;
   
   assign #15 nsetl = ((fl == 1'b0 && naction_cpl == 1'b0) ||
		       (ibus12 == 1'b1 && nflagwe == 1'b0) ||
		       (fl == 1'b0 && flin_add == 1'b1 && nsetl_rom == 1'b0)) ? 1'b0 : 1'b1;
   
   flipflop_74h #(10,10) flfast_ff (.d(flin_sru), .clk(bcp), .nset(nsetl), .nrst(nclrl), .q(flfast));

   // And this FF runs in the processor's clock domain, filtering out transient
   // FL changes and also drastically reducing the risk of metastability.
   flipflop_74h fl_ff (.d(flfast), .clk(clk4), .nset(1'b1), .nrst(nrsthold), .q(fl), .nq(nfl));
   
endmodule // reg_l

`endif //  `ifndef reg_l_v

// End of file.

