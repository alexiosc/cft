///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// FUNCTION: the Memory Bank Unit.
//
// MATCHES: Board Revision 2006, verified 2020-02-05.
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
`include "ram.v"
`include "demux.v"
`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps

// The Memory Bank Register File

module mbu (nreset,
	    wstb, t34,
	    raddr, nruen,
	    waddr, nwuen,
	    ir,			// Only bits 0–2 and 8–11 are used.
	    ibus,		// Only bits 0–7 of the IBUS are used.
	    aext,		//
	    nr, nw,
	    ab,	db, nsysdev,	// Only bits 0–7 of the AB and DB are used.
	    nwrite_flags,	// Convenience output to the flag unit
	    nwrite_mbp_flags,	// Convenience output to the flag unit
	    nread_flags,	// Convenience output to the flag unit
	    nread_mbp_flags,	// Convenience output to the flag unit
	    nfpram_fprom	// RAM/ROM switch from front panel
	    );
	    
   input        nreset;
   input 	wstb;
   input 	t34;
   input [4:0] 	waddr, raddr;
   input 	nruen, nwuen;
   input [11:0] ir;
   input 	nsysdev;
   input 	nr;
   input 	nw;
   input 	nfpram_fprom;
   
   inout [7:0] 	ibus;
   inout [7:0] 	ab;
   inout [7:0] 	db;
   
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

   // U10: This decodes I/O addresses &008–&00F.
   demux_138 demux_ab (.a(ab[6:4]), .g1(ab[3]), .ng2a(ab[7]), .ng2b(nsysdev), .y(dec_ab));
   assign niombr = dec_ab[0];
   
   // U12: We decode RADDRs 01100, 01101, and 01110.
   demux_138 demux_raddr (.a(raddr[2:0]), .g1(raddr[3]), .ng2a(raddr[4]), .ng2b(nruen), .y(dec_raddr));
   assign nread_mbp = dec_raddr[4];
   assign nread_mbp_flags = dec_raddr[5];
   assign nread_flags = dec_raddr[6];

   // U16: We decode WADDRs 01100, 01101, and 01110. Symmetric to the above '138.
   demux_138 demux_waddr1 (.a(waddr[2:0]), .g1(waddr[3]), .ng2a(waddr[4]), .ng2b(nwuen), .y(dec_waddr1));
   assign nwrite_mbp = dec_waddr1[4];
   assign nwrite_mbp_flags = dec_waddr1[5];
   assign nwrite_flags = dec_waddr1[6];

   // U17: decode WADDR to get nwrite_ar_mbx.
   demux_138 demux_waddr2 (.a(waddr[4:2]), .g1(1'b1), .ng2a(1'b0), .ng2b(nwuen), .y(dec_waddr2));
   assign nwrite_ar_mbx = dec_waddr2[1];


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

   wire 	ndis;
   wire 	nenable;

   // This is to ease debugging.
   assign nenable = niombr;

   // U18: the MBU enable FF
   flipflop_74h ff_init(.d(1'b1), .clk(1'b1), .nset(nreset),
			.nrst(nenable /* == niombr */), .nq(ndis));

   // U20: If the RAM/ROM switch is in the ROM position (high), default all MBx
   // registers to &80 to address ROM.
   buffer_125q buf_aext7 (.a(nfpram_fprom), .noe(ndis), .y(aext[7]));


   ///////////////////////////////////////////////////////////////////////////////
   // 
   // CONTROL ROM
   //
   ///////////////////////////////////////////////////////////////////////////////

   // U9: The ROM saves us using a ‘more modern’ (cough) PAL device. If the ROM
   // isn't fast enough, a 20V10 PAL will need to replace it.
   
   wire [14:0] 	addr;
   wire [7:0] 	data;
   wire 	nibusw;
   wire 	nibusen;
   wire 	nuse_ir;
   wire 	nuse_waddr;
   wire 	nuse_zero;
   wire 	nuse_ab;
   wire 	nwmbr0, nwmbr;
   wire 	nrmbr0, nrmbr;


   assign addr = { ndis,	      // A14
		   ir[11:8],	      // A13–A10
		   waddr[1:0],	      // A9–A8
		   nwrite_ar_mbx,     // A7
		   nwrite_mbp_flags,  // A6
		   nwrite_mbp,	      // A5
		   nread_mbp_flags,   // A4
		   nread_mbp,	      // A3
		   niombr,	      // A2
		   nw,		      // A1
		   nr		      // A0
		   };

   assign { nibusw,	      // D7
            nibusen,	      // D6
            nuse_ir,	      // D5
            nuse_waddr,	      // D4
            nuse_zero,	      // D3
            nuse_ab,	      // D2
            nwmbr0,	      // D1
            nrmbr0	      // D0
	    } = data;
   
   rom #(15, 45, "../microcode/build/mbu-rom.list") rom_ctl (.a(addr), .d(data), .nce(1'b0), .noe(1'b0));


   // There are three OR gates of an 74AC32 delaying nRMBR. This is almost
   // certainly not needed, but we have solder jumpers to configure the delay.
   assign nrmbr = nrmbr0;	// Configuration 1
   // assign #10 nrmbr = nrmbr0;	// Configuration 2
   // assign #20 nrmbr = nrmbr0;	// Configuration 3
   // assign #30 nrmbr = nrmbr0;	// Configuration 4

   // Likewise, nWMBR can be gated by WSTB or not.
   //assign nwmbr = nwmbr0;	        // Direct drive
   assign #10 nwmbr = nwmbr0 | wstb;	// Only asserted during WSTB


   ///////////////////////////////////////////////////////////////////////////////
   // 
   // REGISTER ADDRESS MULTIPLEXER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The ‘multiplexer’ is actually made from two '244 buffers controlling 3
   // bits each, outputs wired together. We'll do it with direct assignments
   // rather than the '244 module because they're a little cleaner to code.

   // assign #7 sel = nuse_ab    ? 3'bzzz : ab[2:0];
   // assign #7 sel = nuse_zero  ? 3'bzzz : 3'b000;
   // assign #7 sel = nuse_waddr ? 3'bzzz : { 1'b0, waddr[1:0] };
   // assign #7 sel = nuse_ir    ? 3'bzzz : ir[2:0];

   // And now let's do it with '244s for better testing.

   wire [3:0] 	sel_4bit;
   assign sel = sel_4bit[2:0];

   // U13: SEL multiplexer 1
   buffer_244 #7 selmux1 (.oe1(nuse_ab),    .a1({1'b0, ab[2:0]}),     .y1(sel_4bit),
		          .oe2(nuse_zero),  .a2(4'b0000),             .y2(sel_4bit));
   // U11: SEL multiplexer 2
   buffer_244 #7 selmux2 (.oe1(nuse_waddr), .a1({2'b0, waddr[1:0]}),  .y1(sel_4bit),
			  .oe2(nuse_ir),    .a2({1'b0, ir[2:0]}),     .y2(sel_4bit));

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // THE REGISTER FILE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // U15: The register file is a 32K×8 static RAM chip.

   sram #(13, 15) regfile (.a({10'd0, sel}), .d(aext),
			   .nce(t34), .nwe(nwmbr), .noe(nrmbr));

   // Note: AEXT is pulled low via its definition (tri0).

   // The SRAMs data bus can connect to the IBUS (register reads/writes), AR
   // (register reads) or DB (register writes).

   // IN instructions: Drive the DB ← AEXT to avoid bus contention.
   // OUT instructions: read from the IBUS directly. (DB == IBUS)
   // Control Unit reads: Drive the IBus.
   // Writes to the AR: Drive the AEXT bus (which drives ar[23:16].
   // Other writes: Drive the IBus.

   // U14: The IBus transceiver.
   buffer_245 buf_ibus (.dir(nibusw), .nen(nibusen), .a(ibus[7:0]), .b(aext));

   // U19: The DB Driver. Used in IN instructions (nr asserted).
   buffer_541 buf_db (.noe1(nuse_ab), .noe2(nr), .a(aext), .y(db[7:0]));
endmodule // mbu
`endif //  `ifndef mbu_v

// End of file
