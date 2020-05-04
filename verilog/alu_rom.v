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
`include "latch.v"
`include "flipflop.v"
`include "rom.v"

`timescale 1ns/1ps

module alu_rom (t34, nalu_op, nread_alu_y,
		fl, x_in, a, b, raddr,
		ibus, x0, x1, fvout_rom, nsetv_rom, flout_rom, nsetl_rom);

   input          t34;
   
   input 	  nalu_op;
   input 	  nread_alu_y;
   input 	  fl;
   input 	  x_in;		// X in, for future expansion
   input [15:0]   a, b;
   input [2:0] 	  raddr;

   output [15:0]  ibus, y;
   output 	  x0, x1;	// Cascaded X for future expansion
   output 	  fvout_rom;
   output 	  nsetv_rom;
   output 	  flout_rom;
   output 	  nsetl_rom;

   wire [16:0] 	  ba0, ba1, ba2;
   wire [7:0] 	  bd0, bd1, bd2;
   wire 	  c0, c1;

   wire [2:0] 	  op;

   // Register ROM inputs whenever an ALU operation is requested. This
   // allows data to propagate through all three ROMs.

   wire 	  x_in_reg, fl_reg;
   wire [7:0] 	  alureg_q;
   wire 	  regle;

   // Generate a latch enable pulse
   flipflop_74h #(5,5) fi_regle (.d(1'b0), .clk(t34), .nset(nalu_op), .nrst(1'b1), .q(regle));
   latch_573 alureg (.d({ 3'd0, raddr[2:0], x_in, fl }), .q(alureg_q), .le(regle), .noe(1'b0));
   assign fl_reg = alureg_q[0];
   assign x_in_reg = alureg_q[1];
   assign op[2:0] = alureg_q[4:2];

   // All three ROMs are 128K×8 55ns units. ROMs 00 & 01 use the full 17
   // bits. ROM 02 uses 13 bits (the most significant four bits are tied to
   // ground). We declare a smaller ROM here to avoid warnings.
   rom #(17, 55, "../microcode/build/alu-rom-00.list") romb0 (.a(ba0), .d(bd0), .nce(1'b0), .noe(1'b0));
   rom #(17, 55, "../microcode/build/alu-rom-01.list") romb1 (.a(ba1), .d(bd1), .nce(1'b0), .noe(1'b0));
   rom #(17, 55, "../microcode/build/alu-rom-02.list") romb2 (.a(ba2), .d(bd2), .nce(1'b0), .noe(1'b0));

   // Connect address buses appropriately.

   assign ba0 = { op, x_in_reg, fl_reg,   b[5:0],         a[5:0] };
   assign ba1 = { op, x0,       c0,       b[11:6],        a[11:6] };
   assign ba2 = { op, x1,       c1,       2'b0, b[15:12], 2'b0, a[15:12] };

   // Connect data buses.
   wire 	  nsetl_rom_ung;
   wire 	  nsetv_rom_ung;
   
   assign { x0, c0, y[5:0] } = bd0;
   assign { x1, c1, y[11:6] } = bd1;
   assign { nsetl_rom_ung, flout_rom, nsetv_rom_ung, fvout_rom, y[15:12] } = bd2;

   // The ROMs need to be tri-stated because they eventually drive the IBus,
   // but the cascaded signals still need to drive the next ROM's address bits
   // even with nOE de-asserted. So we buffer the Y port using two '541
   // buffers. The ROMs are always driving, but the IBus can be isolated from
   // this.

   wire 	  naluoe;
   assign #7 naluoe = nread_alu_y & nalu_op;

   buffer_541 buflo (.a(y[7:0]),  .y(ibus[7:0]),  .noe1(naluoe), .noe2(1'b0));
   buffer_541 bufhi (.a(y[15:8]), .y(ibus[15:8]), .noe1(naluoe), .noe2(1'b0));
   // buffer_541 buflo (.a(y[7:0]),  .y(ibus[7:0]),  .noe1(naluoe), .noe2(t34));
   // buffer_541 bufhi (.a(y[15:8]), .y(ibus[15:8]), .noe1(naluoe), .noe2(t34));

   // Gate the FV and FL enables so they're only enabled when the ALU store is
   // enabled.
   assign #4 nsetl_rom = nsetl_rom_ung | nread_alu_y;
   assign #4 nsetv_rom = nsetv_rom_ung | nread_alu_y;
   
   

endmodule // alu_rom

`endif //  `ifndef alu_rom_v

// End of file
