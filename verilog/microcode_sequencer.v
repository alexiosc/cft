///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// microcode_sequencer.v -- The Microcode Sequencer unit
//
// Copyright © 2011–2020 Alexios Chouchoulas
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

`include "control_store.v"
`include "comparator.v"
`include "buffer.v"
`include "counter.v"
`include "mux.v"
`include "latch.v"
`include "flipflop.v"

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


///////////////////////////////////////////////////////////////////////////////
//
// CONTROL STORE
//
///////////////////////////////////////////////////////////////////////////////

module microcode_sequencer(nreset, nrsthold, clk1, clk2, clk4,
			   nhalt, nendext, nws,
			   idx, ncond, ir, nirqsuc,
			   raddr, waddr, cond, action,
			   nwaiting,
			   nmem, nio, nr, nwen, nend,
			   fpfetch,
			   nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);

   input        nreset;
   input 	nrsthold;
   input 	clk1;
   input 	clk2;
   input 	clk4;
   inout 	nhalt;
   inout 	nendext;
   inout 	nws;
   input 	nwaiting;
   input [1:0] 	idx;
   input 	ncond;
   input [15:7] ir;
   input 	nirqsuc;

   tri1 	nendext;
   tri1 	halt;

   output [4:0] raddr;
   output [4:0] waddr;
   output [4:0] cond;
   output [3:0] action;
   output 	nmem;
   output 	nio;
   output 	nr;
   output 	nwen;
   output 	nend;

   output 	fpfetch;
   input        nfpua0;
   input        nfpuc0;
   input        nfpuc1;
   input        nfpuc2;
   output [7:0] fpd;

   // These are pulled high/lowo here.
   tri1 	nmem, nio, nr, nwen;
   tri0 [4:0] 	raddr;
   tri0 [4:0] 	waddr;
   tri0 [4:0] 	cond;
   tri0 [3:0] 	action;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE MICROPROGRAM COUNTER (UPC)
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [3:0] 	upc;
   //wire 	nupcclr;
   //assign #6 nupcclr = nendext & nend;

   tri1 	nupcclr;
   mux_251 endmux (.d(8'b10001111), .sel({nwaiting, nend, nendext}), .ne(clk4), .y(nupcclr));

   // WS# and WAITING# seem to work similarly for .cep() here. Decide which, or use a jumper.
   counter_161 ctr_upc (.mr(nrsthold), .cp(clk4), .cet(nhalt), .cep(nws),
			.pe(nupcclr), .p(4'b0000),
			.q(upc));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CONTROL STORE: ROMS AND FRONT PANEL BUFFERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [17:0] uaddr;
   wire [23:0] ucontrol;

   // Break out the Micro-Address Vector
   assign uaddr = {
		   nrsthold,	   // bit 17
		   nirqsuc,	   // bit 16
		   ir[15:7],	   // bits 15-7
		   ncond,	   // bit 6
		   idx[1:0],	   // bits 5-4
		   upc[3:0]	   // bits 3-0
		   };

   tri1        nmem0, nio0, nr0, nwen0;

   // Break out the Micro-Control Vector
   assign {
	   nend,	   // bit 23
	   nwen0,	   // bit 22
	   nr0,   	   // bit 21
	   nio0,	   // bit 20
	   nmem0,	   // bit 19
	   action[3:0],	   // bits 18-15
	   cond[4:0],	   // bits 14-10
	   waddr[4:0],	   // bits 9-5
	   raddr[4:0]	   // bits 4-0
	   } = ucontrol;

   // Output enable for the Control Store
   wire        ncse;
   //assign #7 ncse = ~(nreset & nhalt);

   // Add metastability protection for HALT. Also make sure it runs for a whole
   // number of clock cycles, so the processor never resumes at the wrong clock
   // phase. As a bonus, this also keeps ncse de-asserted during reset.

   tri1        nhalt;
   wire        nhalt0;
   latch_1g373 halt_latch (.d(nhalt), .noe(1'b0), .le(clk1), .q(nhalt0));
   flipflop_74h #(5, 5) halt_ff (.d(nhalt0), .clk(clk1), .nset(1'b1), .nrst(nreset), .nq(ncse));

   // The control store.
   control_store control_store(.noe(ncse), .clk(clk2),
			       .uaddr(uaddr),
			       .ucontrol(ucontrol));

   // The reset interlock multiplexer disables bus transaction strobes during
   // reset. This is to avoid glitches causing side-effects right after
   // reset. Use AC family and assume worst case.
   mux_257 #13.5 reset_interlock (.sel(nrsthold), .i1(4'b1111),
				  .i2({nio0, nwen0, nr0, nmem0}), .noe(ncse),
				  .y({nio, nwen, nr, nmem}));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE FETCH-EXECUTE DECODER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // This is output for the sake of the DFP and front panel. The DFP uses it
   // when single-stepping, so HALT can be asserted when an instruction fetch
   // is done. The front panel displays the fetch/exec state on two LEDs.
   comparator_85 cmp_fe (.a(upc), .b(4'b0010), .ilt(1'b0), .ieq(1'b1), .igt(1'b0),
			 .olt(fpfetch));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // FRONT PANEL BUFFERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Uaddr is 19 bits. Of these, 2 are state bits and 9 come from the
   // IR. These are displayed in their own sections of the front panel. The
   // remaining 8 bits are displayed in the uADDR LOW front panel section,
   // requiring just one buffer.
   buffer_541 buf_ua0 (.a(uaddr[7:0]),   .y(fpd), .noe1(nfpua0), .noe2(1'b0));

   buffer_541 buf_uc0 (.a(ucontrol[7:0]),   .y(fpd), .noe1(nfpuc0), .noe2(1'b0));
   buffer_541 buf_uc1 (.a(ucontrol[15:8]),  .y(fpd), .noe1(nfpuc1), .noe2(1'b0));
   buffer_541 buf_uc2 (.a(ucontrol[23:16]), .y(fpd), .noe1(nfpuc2), .noe2(1'b0));

endmodule // microcode_sequencer

// End of file.
