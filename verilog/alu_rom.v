///////////////////////////////////////////////////////////////////////////////
//
// THE ALU ROM
//
// REDESIGNED IN 2019
//
// NOTES: This is a 24-bit ROM that implements all ALU operations including
//        output L and V flags.
//
///////////////////////////////////////////////////////////////////////////////


`ifndef alu_rom_v
`define alu_rom_v

`include "buffer.v"
`include "rom.v"

`timescale 1ns/1ps

module alu_rom (nromoe, fl, x_in, a, b, op,
		ibus, x0, x1, fvout_rom, nsetv_rom, flout_rom, nsetl_rom);
   
   input 	  nromoe;
   input 	  fl;
   input 	  x_in;		// X in, for future expansion
   input [15:0]   a, b;
   input [2:0] 	  op;

   output [15:0]  ibus, y;
   output 	  x0, x1;	// Cascaded X for future expansion
   output 	  fvout_rom;
   output 	  nsetv_rom;
   output 	  flout_rom;
   output 	  nsetl_rom;

   // The three ROMs. Pretend they're much slower for testing. The
   // hardware uses 50ns units.

   wire [18:0] 	  ba0, ba1, ba2;
   wire [7:0] 	  bd0, bd1, bd2;
   wire 	  c0, c1;

   rom #(19, 70, "../microcode/build/alu-rom-00.list") romb0 (.a(ba0), .d(bd0), .nce(1'b0), .noe(1'b0));
   rom #(19, 70, "../microcode/build/alu-rom-01.list") romb1 (.a(ba1), .d(bd1), .nce(1'b0), .noe(1'b0));
   rom #(19, 70, "../microcode/build/alu-rom-02.list") romb2 (.a(ba2), .d(bd2), .nce(1'b0), .noe(1'b0));

   // Connect address buses appropriately.

   assign ba0 = { 2'd0, op, x_in, fl, b[5:0],   a[5:0] };
   assign ba1 = { 2'd0, op, x0,   c0, b[11:6],  a[11:6] };
   assign ba2 = { 6'd0, op, x1,   c1, b[15:12], a[15:12] };

   // Connect data buses.

   assign { x0, c0, y[5:0] } = bd0;
   assign { x1, c1, y[11:6] } = bd1;
   assign { nsetl_rom, flout_rom, nsetv_rom, fvout_rom, y[15:12] } = bd2;

   // The ROMs need to be tri-stated because they eventually drive the IBus,
   // but the cascaded signals still need to drive the next ROM's address bits
   // even with nOE de-asserted. So we buffer the Y port using two '541
   // buffers. The ROMs are always driving, but the IBus can be isolated from
   // this.

   buffer_541 buflo (.a(y[7:0]),  .y(ibus[7:0]),  .noe1(nromoe), .noe2(1'b0));
   buffer_541 bufhi (.a(y[15:8]), .y(ibus[15:8]), .noe1(nromoe), .noe2(1'b0));

endmodule // alu_rom

`endif //  `ifndef alu_rom_v

// End of file
