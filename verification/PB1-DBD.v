///////////////////////////////////////////////////////////////////////////////
//
// PB1-DBD.v -- Processor Board A, Data Bus Driver
//
// Copyright © 2011-2013 Alexios Chouchoulas
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

`include "counter.v"
`include "buffer.v"
`include "vibrator.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board A, Data Bus Driver
//
///////////////////////////////////////////////////////////////////////////////

module PB1_DBD(nreset, clk2, clk4, nt34, nws,
			     nmem, nio, nr, nwen, nw, ibus, dbus);

   input 	nreset;
   input 	clk2;
   input 	clk4;
   input 	nt34;
   input 	nws;
   input 	nmem;
   input 	nio;
   input 	nr;
   input 	nwen;

   output 	nw;

   inout [15:0] ibus;
   inout [15:0] dbus;

   // Wait States
   wire nt34_or_nws;
   or #6 ic051a_32_ws (nt34_or_nws, nt34, nws);

   wire waiting, nwaiting;
   flipflop_74h ic047a_74_ws (.set(nt34_or_nws), .rst(nreset),
			      .d(0), .clk(clk2),
			      .q(waiting), .qn(nwaiting));


   // Write Strobe Generation (inhibited by wait states). This is
   // quite complex. The idea is to generate a W# strobe that is long
   // enough for most hardware, yet (a) short enough to allow for hold
   // times, and (b) shorter than 25% of the clock period (i.e. 62.5
   // ns). This write pulse is inhibited during wait states.
   
   wire wsg0, wsg1, wsg2;
   //or #6 ic051c_32_writestrobe0 (wsg0, clk4, nwen);
   ////or #6 ic051d_32_writestrobe1 (wsg1, wsg0, waiting); // WAITING inhibits write strobes
   //nor #6 ic051d_32_writestrobe1 (wsg2, wsg0, waiting); // WAITING inhibits write strobes
   //not #6 ic052a_04_writestrobe2 (wsg2, wsg1);
   nor #8 ic014a_27_writestrobe (wsg2, clk4, nwen, waiting);

   // In the hardware, we form a delay line out of an AND gate and two
   // inverters, which should give an approximate delay of 21 ns (7 ns
   // each). We simple model the delay here. This delay is used to
   // clear the W# register, and thus determines the width of the
   // Write pulse.

   wire nw_delayed, wsg3;
   //assign #21 nw_delayed = nwclr;
   assign #7 nw_delayed = nwclr;
   and #6 ic048c_08_writestrobe3 (wsg3, nreset, nw_delayed);

   // We use two flip flops for the write strobe. One is used to drive
   // the W# signal, the other (with the same inputs) drives the CLR#
   // signal via the delay line to control the period of the
   // pulse. The original design used one flip flop, which drove both
   // the delay line and W#. However, that would have made the load
   // and capacitance on the delay line inconstant, and the width of
   // the W# strobe would vary as a result. Using two separate flip
   // flops avoids this.

   // Finally, the Write Strobe register drives W#.
   wire nwclr;
   flipflop_74h ic013a_74_w (.set(1), .rst(wsg3),
			     .d(1), .clk(wsg2),
			     .qn(nwclr));
   // W# driver FF
   flipflop_74h ic013b_74_w (.set(1), .rst(wsg3),
			     .d(1), .clk(wsg2),
			     .qn(nw));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // DATA BUS TRANSCEIVER
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   // Bus Enable (Memory or I/O cycle, unless in wait state)
   wire nbusen0, nbusen1, nbusen;
   //or #6 ic051b_32_nbusben0 (nbusen0, waiting, nt34);
   assign nbusen0 = nwaiting;
   and #6 ic048a_08_nbusben1 (nbusen1, nmem, nio);
   and #6 ic048b_08_nbusben (nbusen, nbusen0, nbusen1);

   wire dir;
   assign dir = nr;
   buffer_245 ic049_245_dblo (.a(ibus[7:0]), .b(dbus[7:0]),
				 .dir(dir), .en(nbusen));
      
   buffer_245 ic050_245_dbhi (.a(ibus[15:8]), .b(dbus[15:8]),
			      .dir(dir), .en(nbusen));

endmodule // PB1_DBD


// End of file.
