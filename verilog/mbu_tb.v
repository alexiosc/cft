///////////////////////////////////////////////////////////////////////////////
//
// MEMORY BANK REGISTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_mbr_tb.v -- Memory Bank Register Testbench
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

`include "mbu.v"
`include "clock.v"
`include "demux.v"
`include "clock.v"

`timescale 1ns/10ps


module reg_mbu_tb();
   reg        nrsthold;
   reg        nfpram_rom;
   reg [15:0] ibus, ab, db, ir;
   reg 	      nr, nwen;
   reg [4:0]  waddr;
   reg [4:0]  raddr;
   wire       nw;
   wire       nir_idx;

   wire       nrsthold_real, nfpram_rom_real;
   wire [15:0] ibus_real, ab_real, db_real;
   wire [7:0]  aext, db_low, ibus_low;
   
   integer    i, j, k;

   reg [800:0] status;

   wire        clk1, clk2, clk3, clk4, t34;
   
   wire        nsysdev;

   // Convenience decoded outputs to the Flag unit.
   wire        nwar;

   wire [7:0]  mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7;

   // Assemble the 8 registers. This makes strong assumptions about the
   // structure of the MBR circuitry!
   assign mb0 = mbu.mb[0];
   assign mb1 = mbu.mb[1];
   assign mb2 = mbu.mb[2];
   assign mb3 = mbu.mb[3];
   assign mb4 = mbu.mb[4];
   assign mb5 = mbu.mb[5];
   assign mb6 = mbu.mb[6];
   assign mb7 = mbu.mb[7];
   
   initial begin        
      $dumpfile ("vcd/mbu_tb.vcd");
      $dumpvars (0, reg_mbu_tb);

      // Check if the ROM image was loaded
      // if (mbu.rom_ctl.mem[0] === 8'bxxxxxxxx) begin
      // 	 $error("FAIL: ROM image not found.");
      // 	 $finish;
      // end;

      // $monitor ("t: %7d | %b %b | init=%b rom=%b | IR: %04x | %d %02x | waddr=%05b raddr=%05b ibus=%02x | regfile: %04x %02x ce=%b we=%b oe=%b | regs: %02x %02x %02x %02x %02x %02x %02x %02x",
      // 		$time,
      // 		waddr, raddr,
      // 		mbu.nenable, nfpram_rom,
      // 		ir,
      // 		mbu.sel, aext,
      // 		waddr, raddr, ibus_low,
      // 		mbu.regfile.a, mbu.regfile.d, mbu.regfile.nce, mbu.regfile.nwe, mbu.regfile.noe,
      // 		mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7);


      // NOTE: Because of the complexity of how the MBU works, we have
      // verification tests running both inside always() blocks like simpler
      // units, but we also test our findings synchronously in this block.


      ///////////////////////////////////////////////////////////////////////////////
      //
      // INITIALISE
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Before we begin, randomise the values of the eight registers to
      // simulate an actual SRAM.
      // for (i = 0; i < 8 ; i = i + 1) begin
      // 	 mbu.regfile.mem[i] = $random & 255;
      // end;
      for (i = 0; i < 2048 ; i = i + 1) begin
	 mbu.regfile_mbu.mem[i] = $random & 255;
      end;

      nrsthold = 0;
      nfpram_rom = 0;		// RAM
      ibus = 16'bzzzzzzzzzzzzzzzz;
      ir = 16'd0;
      
      waddr = 4'b0000;
      raddr = 4'b0000;

      status = "reset";

      #5000 nrsthold = 1;

      // Also, initialise the CTX register. Otherwise, it starts off with an XX
      // value, and that messes up early testing. We won't be testing its
      // correct operation yet, just stick the value in.
      mbu.ff_ctx.q0 = $random;

      // The TB isn't synchronous to the clock, so adjust its phase difference.
      #10;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // VERIFY POWER-ON DEFAULTS
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Read the registers using read_mbn.
      // little more complicated than it should be, but I/O transactions bring
      // the MBU out of its post-reset mode so we can't use them.

      status = "read power-on default MBx (via IR)";
      #1000 raddr = 4'd0;
      for (i = 0; i < 2048 ; i = i + 1) begin
   	 nfpram_rom = i[0];
      	 ibus = 16'bzzzzzzzzzzzzzzz;
	 ir = 16'b0000_11_1100000000 | i[3:1]; // Use IDX registers for good measure.
      	 #250 raddr = 5'b11011;	       // read_mbn
      	 #250 raddr = 5'b00000;	       // idle again
      end

      #1000;

      $finish;
   end // initial begin

   // Bi-directional buses and convenience

   assign nrsthold_real = nrsthold;
   assign nfpram_rom_real = nfpram_rom;
   assign ibus_real = ibus;
   assign ibus_low = ibus_real[7:0]; // This simplifies things with gtkwave

   // Connect the DUT   
   mbu mbu (.nrsthold(nrsthold_real),
	    .clk2(clk2), .clk4(clk4),
	    .t34(t34),
	    .waddr(waddr), .raddr(raddr),
	    .ir(ir[2:0]),
	    .nir_idx(nir_idx),
	    .ibus(ibus_real[7:0]),
	    .aext(aext),
	    .nwar(nwar),
	    .nfpram_rom(nfpram_rom_real)
	    );

   // Make the nir_idx signal work
   assign #15 nir_idx = ir[11:8] === 4'b1111 ? 1'b0 : 1'b1;

   // Use the actual clock generator to make testing more accurate.
   clock_generator clk (.nrsthold(nrsthold_real), .clk1(clk1), .clk2(clk2),
			.clk3(clk3), .clk4(clk4), .t34(t34));

endmodule // reg_mbr_tb


// End of file.
