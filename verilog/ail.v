///////////////////////////////////////////////////////////////////////////////
//
// THE AUTO-INDEX LOGIC
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// ail.v -- The Auto-Index Logic
//
// Copyright © 2011-2019 Alexios Chouchoulas
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


`include "buffer.v"
`include "demux.v"
`timescale 1ns/10ps

// The AIL snoops the IR when it's written and generates the IDX0
// and IDX1 signals for the microcode store. This helps various
// instruction microprograms select the correct addressing mode. This
// is PARTIAL DECODING! To select an auto-index addressing mode, the I
// and R fields must also be checked. This is done in microcode.

// I R Operand       IDX Notes
// -------------------------------------------------------------------------------
// 0 X XX:XXXX:XXXX  00 Normal registers
// 1 0 XX:XXXX:XXXX  00 Normal registers
// 1 1 00:XXXX:XXXX  00 Normal registers
// 1 1 01:XXXX:XXXX  00 Normal registers
// 1 1 10:XXXX:XXXX  00 Normal registers
// 1 1 11:00XX:XXXX  00 Normal registers (MBR-relative; also handled by microcode)
// 1 1 11:01XX:XXXX  01 Auto-increment registers
// 1 1 11:10XX:XXXX  10 Auto-decdement registers
// 1 1 11:11XX:XXXX  11 Stack Pointers

// NOTE: on the original CFT, this unit snooped the IBUS while the IR was
// written to because it wasn't on the same board as the IR and didn't have
// access to its signals. On the 2019 version, the IR and AIL are colocated on
// the Control Unit board. (hopefully, I haven't crammed everything together
// quite yet), so this isn't necessary and we save another IC, some
// metastability risk, and plenty of propagation delay.

module ail (ir, idx);
   input [15:0]  ir;
   output [1:0]  idx;

   wire [7:0] 	 y;
   wire 	 nidxen;
	
   demux_238 ail_demux (.g1(ir[11]), .ng2a(1'b0), .ng2b(1'b0), .a(ir[10:8]), .y(y));
   assign nidxen = y[7];

   assign #7 idx[0] = ir[6] & nidxen;
   assign #7 idx[1] = ir[7] & nidxen;

endmodule // constant_store

// End of file.
