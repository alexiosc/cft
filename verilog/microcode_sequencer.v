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

`timescale 1ns/1ps


`ifndef BASEDIR
 `define BASEDIR ".."
`endif // BASEDIR


///////////////////////////////////////////////////////////////////////////////
//
// CONTROL STORE
//
///////////////////////////////////////////////////////////////////////////////

module microcode_sequencer(nreset, nrsthold, clk2, clk4,
			   nhalt, nendext, nws,
			   idx, ncond, in_rsvd, ir, nirqsuc,
			   raddr, waddr, cond, action,
			   nmem, nio, nr, nwen, nend,
			   fpfetch,
			   nfpua0, nfpuc0, nfpuc1, nfpuc2, fpd);

   input        nreset;
   input 	nrsthold;
   input 	clk2;
   input 	clk4;
   inout 	nhalt;
   inout 	nendext;
   inout 	nws;
   input [1:0] 	idx;
   input 	ncond;
   inout 	in_rsvd;
   input [15:7] ir;
   input 	nirqsuc;

   tri1 	nendext;
   tri1 	halt;
   tri0 	in_rsvd;

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


   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE MICRO-PROGRAM COUNTER (UPC)
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	nupcclr;
   wire [3:0] 	upc;
   assign #6 nupcclr = nendext & nend;
   counter_161 ctr_upc (.mr(nrsthold), .cp(clk4), .cet(nhalt), .cep(nws),
			.pe(nupcclr), .p(4'b0000),
			.q(upc));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CONTROL STORE: ROMS AND FRONT PANEL BUFFERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [18:0] uaddr;
   wire [23:0] ucontrol;

   // Break out the Micro-Address Vector
   assign uaddr = {
		   nrsthold,	   // bit 18
		   nirqsuc,	   // bit 17
		   ir[15:7],	   // bits 16-8
		   in_rsvd,	   // bit 7
		   ncond,	   // bit 6
		   idx[1:0],	   // bits 5-4
		   upc[3:0]	   // bits 3-0
		   };

   // Break out the Micro-Control Vector
   assign {
	   nend,	   // bit 23
	   nwen,	   // bit 22
	   nr,   	   // bit 21
	   nio,	   // bit 20
	   nmem,	   // bit 19
	   action[3:0], // bits 18-15
	   cond[4:0],   // bits 14-10
	   waddr[4:0],  // bits 9-5
	   raddr[4:0]   // bits 4-0
	   } = ucontrol;

   // Output enable for the Control Store
   wire        ncse;
   assign #7 ncse = ~(nreset & nhalt);
   
   control_store control_store(.noe(ncse), .clk(clk2),
			       .uaddr(uaddr),
			       .ucontrol(ucontrol));


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
