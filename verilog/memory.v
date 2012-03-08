`ifndef memory_v
`define memory_v

`include "ram.v"
`include "rom.v"
`include "demux.v"
`include "comparator.v"
`include "flipflop.v"
`include "regfile.v"
`include "mux.v"
`include "buffer.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: An array of SRAMs to the tune of 262,144 16-bit words.
//
// NOTE: combines two 8-bit SRAMs. We preload a ram image to simplify
// simulation.
//
///////////////////////////////////////////////////////////////////////////////

module memory_v0 (abus, dbus, mem, r, w, clock);

   input [15:0] abus;
   inout [15:0] dbus;

   input 	mem;		// /MEM: cpu wants to talk to RAM.
   input 	r;		// /R: latch data FROM memory.
   input 	w;		// /W: latch data TO memory.
   input 	clock;

   //wire [17:0] 	a;
   wire [15:0] 	a;
   wire [15:0] 	dbus;
   wire 	mem;
   wire 	r;
   wire 	w;

  //assign a[17:16] = 2'b00;	// Force high order bits to zero.
   assign a[15:0] = abus[15:0];	// Connect the low order bits to the abus.

   // CPU /W -->  SRAM /WE
   // CPU /R -->  SRAM /OE
   wire [7:0] 	x;

`ifndef DISABLE_SRAM_DEBUGGING
   // Debugging.
   always @(posedge w, posedge mem) begin
      if (!w || !mem) begin
	 $display("sram[", abus, "] <- ", dbus);
      end
   end
`endif
   
   // Make sure memory is written when the buses are stable.
   wire we;
   or #10 or_7432_1a (we, w, clock);

   sram #(16, 55, "img/a-00.list", "lo") sram_lo (a, dbus[7:0], mem, w, r);
   sram #(16, 55, "img/a-01.list", "hi") sram_hi (a, dbus[15:8], mem, w, r);

   // Allow a memory image to be dumped, if requested.
   event dump_core;
   always @(dump_core) begin
      $display("D: Dumping core...");
      $writememh("img/core-00.list", sram_lo.mem); // Dump core (low)
      $writememh("img/core-01.list", sram_hi.mem); // Dump core (high)
   end
	 
endmodule // memory




///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: An array of SRAMs to the tune of 262,144 16-bit words.
//
// NOTE: combines two 8-bit SRAMs. We preload a ram image to simplify
// simulation.
//
///////////////////////////////////////////////////////////////////////////////

module banked_memory (abus, dbus, mem, io, r, w, reset, clock);

   input [15:0] abus;
   inout [15:0] dbus;

   input 	mem;		// /MEM: cpu wants to talk to RAM.
   input        io;		// /IO: (used to address the bank registers)
   input 	r;		// /R: latch data FROM memory.
   input 	w;		// /W: latch data TO memory.
   input 	reset;		// /RESET: used to reset the bank registers
   input 	clock;

   wire [7:0] 	aext;		// Extended address bits
   wire [15:0] 	abus;
   wire [15:0] 	dbus;
   wire 	mem;
   wire 	io;
   wire 	r;
   wire 	w;

   wire [5:0] 	bapad, cepad, brpad;
   wire 	bren_high;      // Active low output from the comparator.
   wire 	breng2a;        // Active low: -IO OR -W (active when both are active)
   wire 	breng2b;        // Active low: ABUS6, bren0 (active when both are 0)
   wire 	bankw0, bankw1;	// Active low: write enables for the two register files.
   wire 	bankr0, bankr1;	// Active low: read enables for the two register files.
   wire [7:0] 	brout;		// Output from the selected bridge register
   wire 	banken;		// Active low: the banking registers have been written to.
   wire [7:0] 	defbank;        // Initial bank layout after -RESET is asserted.

   wire 	ramen, romen;	// RAM and ROM enable signals (-CE)

   wire [21:0] 	ae;		// Extended A bus (mostly for debugging)

   // Bank register addressing
   demux_138 braddr (1'b1, 1'b0, 1'b0, {2'b00, abus[15]}, {bapad, bankr1, bankr0});

   // The chip select lines for RAM and ROM.
   demux_138 chipselect (1'b1, mem, 1'b0, {1'b0, aext[6], aext[7]}, {cepad, romen, ramen});

   // Address decoding for the bank registers
   comparator_688 bren (abus[15:8], 8'b00000000, abus[7], bren_high);
   or #7 or_7432a (breng2a, io, w);
   or #7 or_7432b (breng2b, abus[6], bren_high);
   demux_138 brsel (abus[5], breng2a, breng2b, abus[4:2], {brpad, bankw1, bankw0});

   // The 4x4 register files organised as a 2x2 array to get 8 8-bit registers.
   regfile_670 br0lo (dbus[3:0], bankr0, bankw0, abus[14:13], abus[1:0], brout[3:0]);
   regfile_670 br0hi (dbus[7:4], bankr0, bankw0, abus[14:13], abus[1:0], brout[7:4]);

   regfile_670 br1lo (dbus[3:0], bankr1, bankw1, abus[14:13], abus[1:0], brout[3:0]);
   regfile_670 br1hi (dbus[7:4], bankr1, bankw1, abus[14:13], abus[1:0], brout[7:4]);

   // Provide a default bank just after reset so that the ROM is accessible.
   flipflop_112 ff (1'b0, 1'b0, 1'b0, bankw1, reset, , banken,
		    1'b0, 1'b0, 1'b0, 1'b1, 1'b1, ,);
   assign defbank = {abus[15], 5'b00000, abus[14:13]};
   mux_157 muxlo(banken, brout[3:0], defbank[3:0], 1'b0, aext[3:0]);
   mux_157 muxhi(banken, brout[7:4], defbank[7:4], 1'b0, aext[7:4]);

   // And finally, the RAM and ROM.
   assign ae = {aext, abus[12:0]};
   sram #(19, 55) ramlo (ae[18:0], dbus[7:0], ramen, w, r);
   sram #(19, 55) ramhi (ae[18:0], dbus[15:8], ramen, w, r);

   rom #(19, 70, "img/a-00.list") romlo (ae[18:0], dbus[7:0], romen, r);
   rom #(19, 70, "img/a-01.list") romhi (ae[18:0], dbus[15:8], romen, r);

   //always @(mem, r, abus) begin
   //   if ((mem == 1'b0) && (r == 1'b0)) begin
   //	 $display("Reset vector read (fff0). %04x", abus);
   //      end
   //   end
      
   // Allow a memory image to be dumped, if requested.
   event dump_core;
   always @(dump_core) begin
      $display("D: Dumping core...");
      $writememh("img/core-00.list", ramlo.mem); // Dump core (low)
      $writememh("img/core-01.list", ramhi.mem); // Dump core (high)
   end
	 
endmodule


`endif //  `ifndef memory_v

/*
 
 BANK SWITCHING NOTES
 
 SRAM chips with 128k x 8 are easy to find. We need two to get a 16 bit memory,
 but this raises the issue of using the extra memory. It also raises the issue
 of switching off the ROM when it's no longer needed.
 
 Proposal:
 
 * Use a 256k address space
 * 192k for RAM, 64k for ROM (or whatever).
 * Use a bus extension / paging technique.
 * Take the upper 2? 3? 4? bits of the address bus ...
 * ... and map them to 4? 5? 6? bits of the total address space.
 * The lowest bank should be shared.
 * Each bank position needs one D flip flop and one I/O (or memory location).

 Two bits are too few (16k regions). Three are probably ideal as they match the
 suggested size of the ROM (8k). With three bits, we'd need:
 
 * Address decoding for the registers
 * Address decoding for the Address bus.
 * 7x 5-bit registers (might as well have 7x 8-bit regs).
 * OR: one small SRAM.

 MEMORY MAP:

          Basic, unexpanded
          system.
 
 0x0000   +---------------+
          | Regs etc      |
          | NOT SWITCHED. |
 0x2000   +---------------+
          | BANK 1        |
          |               |
 0x4000   +---------------+
          | BANK 2        |
          |               |
 0x6000   +---------------+
          | BANK 3        |
          |               |
 0x8000   +---------------+
          | BANK 4        |
          |               |
 0xA000   +---------------+
          | BANK 5        |
          |               |
 0xC000   +---------------+
          | BANK 6        |
          |               |
 0xE000   +---------------+
          | BANK 7/ROM    |
          |               |
 0xFFFF   +---------------+

 
 For an expanded system, 
  
 */


/*
 
 Implemented banking scheme:
 
 Since we can source 74x670 4x4 register files, we can have 8 8-bit
 bank registers. 64 kW / 8 = 8kW which is our bank size.
 
 We use four in a 2x2 layout, which gives us 8 8-bit registers, so
 that our address space is expanded by 8 bits, keyed by the top 3 bits
 of the unexpanded address space:
 
 Expanded Address = bank_register[A[15..13]] OR A[12..0]
                      = 8 bits                +   13 bits
 
 This gives us 21 bits of address space, or 2 megawords.
 
 Because of the availability of 512kx8 SRAM and Flash chips, we now
 have 512kW of RAM and 512kW of ROM, each of which is 19 bits wide,
 and we have another 1mW unmapped.
 
 Since CFT needs ROM at its highest addresses, the physical memory map is now as follows:
 
 0x000000   +---------------+
            | 512kW RAM     | For expanding RAM (e.g. video buffers)
            |               |
 0x07FFFF   +---------------+
            | HOLE          |
            |               |
 0x100000   +---------------+ First ROM address (1'0000'0000'0000'0000'0000)
            | 512kW ROM     |
            |               |
 0x17FFFF   +---------------+
            | HOLE          | For expanding ROM
            |               |
 0x1FFFFF   +---------------+ Highest physical address (1'1111'1111'1111'1111'1111)
 

  The logical memory map is as follows:
 
 0x0000   +---------------+
          | BANK 0        | Registers & context
 0x2000   +---------------+
          | BANK 1        |
 0x4000   +---------------+
          | BANK 2        |
 0x6000   +---------------+
          | BANK 3        |
 0x8000   +---------------+
          | BANK 4        |
 0xA000   +--------------+
          | BANK 5        |
 0xC000   +---------------+
          | BANK 6        |
 0xE000   +---------------+
          | BANK 7        |
 0xFFFF   +---------------+

 
 Each of the 8 bank registers is an 8-bit value X that points to 8kW physical
 memory pages. Values 000000-07FFFF point to 512kW of RAM, values 100000-17FFFF
 point to 512kW of ROM. The rest is decoded but unmapped.
 
 
 ==Boot time==
 
 When -RESET is asserted, a '112 flip flop sets the active low -BANKEN signal
 (-BANKEN=1). This in turn drives two '157 data selectors, switching them to
 data source B.
 
 When using source A, the top 8 bits of the physical address are driven by the
 value of the selected bank register.
 
 When using source B, the top 8 bits of the physical address are hardwired to:
 
 {A15, 0, 0, 0, 0, A15, A14, A13}
 
 This partitions the logical memory as follows:
 
 0x0000   +---------------+
          | 32kW RAM      | physical RAM 000000-007fff (first 32kW of RAM)
          |               |
 0x8000   +---------------+
          | 32kW ROM      | physical ROM 100000-107fff (first 32kW of ROM)
          |               |
 0xFFFF   +---------------+
 
 Writing to the top for bank registers (BANKR4 to BANKR7) sets -BANKEN low,
 which immediately switches to using the bank registers for addressing
 memory. -BANKEN cannot be disabled without resetting the system, and it's not
 desirable to do so. The mechanism simply provides a default mapping for the
 earliest parts of the boot process.
 
  ==Where is the boot code?==
 
 Since, at boot time, logical 0x8000 is mapped to physical 0x100000, which is
 address 0x0000 of the ROM, and the CPU reset vector is located at logical
 address 0xfff0, the location of the boot code is physical address 0x17ff0, or
 offset 0x7ff0 of the ROM (just before the end of the 32nd K).
 
 ==ROM Map==
 
 Since we have so much ROM space, we can store a lot of software
 permanently without much need for a filesystem (yet). A tentative ROM map:
 
 0x0000   +---------------+
          | 32kW ROM      | physical ROM 100000-11fff
          |               |
 0x2000   +---------------+
          | Forth?        | physical ROM 102000-13fff
          |               |
 0x4000   +---------------+
          | ROM builtins? | physical ROM 104000-15fff
          |               |
 0x6000   +---------------+
          | Boot and 'OS' | physical ROM 106000-17fff
          |     code.     |
 0x7FFF   +---------------+
 
 
 ==Boostrap process==
 
 If we put a magic number at the beginning of every bootable ROM (physical
 addresses 100000, 102000, ... 1FE000) bootstrap code can detect entry
 points. Note that we stop at 1FE000, not 17F000 (which is the limit or our
 512kW ROM), so that ROM may be expanded using the ROM hole.
 
 
 */


///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module bank_switch (nreset, nmem, nw, nsysdev, ab, db, nfpram, aext, banking);

   input        nreset, nmem, nw, nfpram, nsysdev;
   input [15:0] ab;
   inout [15:0] db;

   output [7:0] aext;
   output 	banking;
   
   wire 	nreset, nmem, nw, nsysdev;
   // Pull down AB for debugging (the real bus has bus-hold circuitry
   // so the behaviour is similar but not identical)
   tri0 [15:0] 	ab, db;

   wire [7:0] 	aext;
   wire 	banking;

   // Bank write decoder
   wire 	ab6nw, ab7nsysdev;
   wire 	nbankw0, nbankw1;
   wire [7:0] 	yw;
   or #6 (ab6nw, ab[6], ab[7]);
   or #6 (ab7nsysdev, nw, nsysdev);
   demux_138 dec_w (ab[5], ab6nw, ab7nsysdev, ab[4:2], yw);
   assign nbankw0 = yw[0];
   assign nbankw1 = yw[1];

   // RAM Bank selector (AB -> {AEXT,AB})
   wire [7:0] 	yr;
   wire 	nbankr0, nbankr1;
   demux_138 banksel (1, nmem, 0, {2'b0, ab[15]}, yr);
   assign nbankr0 = yr[0];
   assign nbankr1 = yr[1];

   // The 4x4 register files organised as a 2x2 array to get 8 8-bit registers.
   wire [7:0] 	ae0;
   // BR0--BR3
   regfile_670 br0_lo (db[3:0], nbankr0, nbankw0, ab[14:13], ab[1:0], ae0[3:0]);
   regfile_670 br0_hi (db[7:4], nbankr0, nbankw0, ab[14:13], ab[1:0], ae0[7:4]);
   // BR4--BR7
   regfile_670 br1_lo (db[3:0], nbankr1, nbankw1, ab[14:13], ab[1:0], ae0[3:0]);
   regfile_670 br2_hi (db[7:4], nbankr1, nbankw1, ab[14:13], ab[1:0], ae0[7:4]);

   // Reset logic
   wire 	nbanking;
   flipflop_112h rstff (0, 0, 0, nbankw1, nreset, banking, nbanking);
   buffer_541 buflnr (banking, banking, {ab15nram, 5'b00000, ab[14:13]}, aext);
   buffer_541 bufbnk (nbanking, nbanking, ae0, aext);

   // Allow FPRAM# to work without a front panel attached. Without a
   // front panel, it's assumed this is a turn-key machine, so it
   // should always start with ROM enabled, hence FPRAM# is deasserted
   // (pulled up).
   tri1 	nfpram;
   wire 	ab15nram;
   and #6 (ab15nram, ab[15], nfpram);

   // Note: front panel outputs are not modelled.

endmodule // bank_switch


module memory (aext, ab, db, nmem, nr, nw);
   input [7:0]  aext;
   input [15:0] ab;
   inout [15:0] db;
   input 	nmem, nr, nw;

   wire [7:0] 	y;
   wire 	nramen0, nramen1, nromen0, nromen1;
   
   demux_138 decoder(1, nmem, 0, {1'b0, aext[7:6]}, y);
   assign nramen0 = y[0];
   assign nramen1 = y[1];
   assign nromen0 = y[2];
   assign nromen1 = y[3];

   // Simulate the ROM/ROM address jumpers.
   wire 	nramen, nromen;
   assign nramen = nramen0;
   //assign nramen = nramen1;
   assign nromen = nromen0;
   //assign nromen = nromen1;

   // And finally, the RAM and ROM.
   wire [21:0] 	ae;
   assign ae = {aext, ab[12:0]};
   sram #(19, 55) ram_lo (ae[18:0], db[7:0], nramen, nw, nr);
   sram #(19, 55) ram_hi (ae[18:0], db[15:8], nramen, nw, nr);

   rom #(19, 70, "img/a-00.list") rom_lo (ae[18:0], db[7:0], nromen, nr);
   rom #(19, 70, "img/a-01.list") rom_hi (ae[18:0], db[15:8], nromen, nr);

   // Allow a memory image to be dumped, if requested.
   event dump_core;
   always @(dump_core) begin
      $display("D: Dumping core...");
      $writememh("img/core-00.list", ram_lo.mem); // Dump core (low)
      $writememh("img/core-01.list", ram_hi.mem); // Dump core (high)
   end
endmodule // memory

   
// End of file.
