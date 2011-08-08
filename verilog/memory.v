`ifndef memory_v
`define memory_v

`include "ram.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: An array of SRAMs to the tune of 262,144 16-bit words.
//
// NOTE: combines two 8-bit SRAMs. We preload a ram image to simplify
// simulation.
//
///////////////////////////////////////////////////////////////////////////////

module memory (abus, dbus, mem, r, w, clock);

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
   
// End of file.
