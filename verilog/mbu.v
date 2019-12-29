///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// FUNCTION: the Memory Bank Unit.
//
// NOTES:
//
// The MBU is a complex unit accessible on various control unit read and write
// addresses, and mapped to I/O space. It was initially implemened on nearly 30
// control ICs and 74HC670 register file ICs. This version uses a 27C128 ROM
// for the control logic and a 15ns, 32K SRAM to store the registers. The
// latter is severe overkill: I'm using 8 of 32,768 bytes. But I have those ICs
// lying around and I'm going to use them. (also, they no longer make smaller
// ones)
//
///////////////////////////////////////////////////////////////////////////////


`ifndef mbu_v
`define mbu_v

`include "rom.v"
`include "demux.v"
`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps

// The Memory Bank Register File

module mbu (nreset,
	    wstb,
	    raddr, waddr,
	    ir,			// Only bits 0–2 and 8–11 are used.
	    ibus,		// Only bits 0–7 of the IBUS are used.
	    aext,		//
	    nr, nw,
	    ab,	nsysdev,	// Only bits 0–7 are used.
	    nwrite_flags,	// Convenience output to the flag unit
	    nwrite_mbp_flags,	// Convenience output to the flag unit
	    nread_flags,	// Convenience output to the flag unit
	    nread_mbp_flags,	// Convenience output to the flag unit
	    nfpram_fprom	// RAM/ROM switch from front panel
	    );
	    
   input        nreset;
   input 	wstb;
   input [4:0] 	waddr;
   input [4:0] 	raddr;
   input [11:0] ir;
   input 	nsysdev;
   input 	nr;
   input 	nw;
   input 	nfpram_fprom;
   
   inout [7:0] 	ibus;
   inout [7:0] 	ab;
   
   output [7:0] aext;
   output 	nread_mbp_flags, nread_flags;
   output 	nwrite_mbp_flags, nwrite_flags;

   wire 	nreset;
   wire [4:0] 	waddr;
   wire [4:0] 	raddr;
   wire [7:0] 	ibus;

   wire [2:0] 	sel;
   tri0 [7:0] 	aext;

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // DECODING		
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [7:0] 	dec_ab, dec_raddr, dec_waddr1, dec_waddr2;
   wire 	niombr;
   wire 	nread_mbp, nread_mbp_flags, nread_flags;
   wire 	nwrite_mbp, nwrite_mbp_flags, nwrite_flags;
   wire 	nwrite_ar_mbx;

   // This decodes I/O addresses &008–&00F.
   demux_138 demux_ab (.a(ab[6:4]), .g1(ab[3]), .ng2a(ab[7]), .ng2b(nsysdev), .y(dec_ab));
   assign niombr = dec_ab[0];
   
   // We decode RADDRs 01100, 01101, and 01110.
   demux_138 demux_raddr (.a(raddr[2:0]), .g1(raddr[3]), .ng2a(raddr[4]), .ng2b(1'b0), .y(dec_raddr));
   assign nread_mbp = dec_raddr[4];
   assign nread_mbp_flags = dec_raddr[5];
   assign nread_flags = dec_raddr[5];

   // We decode WADDRs 01100, 01101, and 01110. Symmetric to the above '138.
   demux_138 demux_waddr1 (.a(waddr[2:0]), .g1(waddr[3]), .ng2a(waddr[4]), .ng2b(1'b0), .y(dec_waddr1));
   assign nwrite_mbp = dec_waddr1[4];
   assign nwrite_mbp_flags = dec_waddr1[5];
   assign nwrite_flags = dec_waddr1[5];

   // We decode WADDRs 01100, 01101, and 01110. Symmetric to the above '138.
   demux_138 demux_waddr2 (.a(3'b111), .g1(waddr[2]), .ng2a(waddr[3]), .ng2b(waddr[4]), .y(dec_waddr2));
   assign nwrite_ar_mbx = dec_waddr2[7];

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // POWER-ON DEFAULTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Since the SRAM won't be reset to all zeroes, we disable its drivers after
   // reset and rely on pull-down addresses to read all zeroes. The SRAM will
   // be enabled on the first OUT instruction addressing it. Note that this
   // will cause all other registers to change from &00 to random values, so if
   // one register is configured, the first four (at least) must all be
   // configured too.

   wire 	nclr, ndis;

   // TODO: Check if this is needed. Likely just niombr is enough!
   assign #6 nclr = wstb | niombr;
   flipflop_74h ff_init(.d(1'b1), .clk(1'b1), .nset(nreset), .nrst(nclr), .nq(ndis));

   // If the RAM/ROM switch is in the ROM position (high), default all MBx
   // registers to &80 to address ROM.
   buffer_125q buf_aext7 (.a(nfpram_fprom), .oe(ndis), .y(aext[7]));


   ///////////////////////////////////////////////////////////////////////////////
   // 
   // CONTROL ROM
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The ROM saves us using a ‘more modern’ (cough) PAL device. If the ROM
   // isn't fast enough, a 20V10 PAL will need to replace it.
   
   wire [14:0] 	addr;
   wire [7:0] 	data;

   rom #(15, 45, "../microcode/build/mbu-rom.list") rom_ctl (.a(addr), .d(data), .nce(1'b0), .noe(1'b0));
   
   
endmodule // mbu
`endif //  `ifndef mbu_v

// End of file
