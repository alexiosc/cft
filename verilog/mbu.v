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
`include "mux.v"
`include "demux.v"
`include "buffer.v"
`include "regfile.v"
`include "flipflop.v"

`timescale 1ns/1ps


// This is the MBU Decoder GAL.
module mbu_decoder_gal(raddr,	// CFT Read Unit
		       waddr,	// CFT WRite Unit
		       clk4,    // Write strobe
		       nrmbn,	// Put MBn on IBus
		       nrmbp,	// Put MBP (MB0) on IBus
		       nrctx,	// Put CTX on IBus
		       nwmbn,	// Write IBus to MBn
		       nwmbp,   // Write IBus to MBp
		       nwctx,   // Write IBus to CTX 
		       nwar     // One of the four write_ar_xx strobes
		       );

   parameter delay = 15;

   input [4:0] raddr;
   input [4:0] waddr;
   input       clk4;
   
   output      nrmbn;
   output      nrmbp;
   output      nrctx;
   output      nwmbn;
   output      nwmbp;
   output      nwctx;
   output      nwar;

   // REVISION: MBUDEC00

   assign #delay nrmbn = (raddr == 5'b11011) ? 1'b0 : 1'b1;
   assign #delay nrmbp = (raddr == 5'b11100) ? 1'b0 : 1'b1;
   assign #delay nrctx = (raddr == 5'b11110 || raddr == 5'b11101) ? 1'b0 : 1'b1;
   
   assign #delay nwmbn = (waddr == 5'b11011 && clk4 == 1'b0) ? 1'b0 : 1'b1;
   assign #delay nwmbp = (waddr == 5'b11100 && clk4 == 1'b0) ? 1'b0 : 1'b1;
   assign #delay nwctx = ((waddr == 5'b11110 || waddr == 5'b11101) && clk4 == 1'b0) ? 1'b0 : 1'b1;
   // assign #delay nflags = ((waddr == 5'b11111 || waddr == 5'b11101) && clk4 == 1'b0) ? 1'b0 : 1'b1;
   assign #delay nwar = ((waddr[4:2] == 3'b001) && clk4 == 1'b0) ? 1'b0 : 1'b1;
endmodule

 
// This is the MBU Control GAL.
module mbu_control_gal(ndis,	// MBU Disable
		       nrmbp,
		       nrmbn,
		       nwar,
		       nidxen,
		       nwmbp,
		       nwmbn,
		       raddr1_0,	// RADDR[1:0]
		       ir2_0,	// IR[2:0]
		       a,
		       noe,
		       nwe
		       );
   
   parameter delay = 15;

   input       ndis;
   input       nrmbp;
   input       nrmbn;
   input       nwar;
   input       nidxen;
   input       nwmbp;
   input       nwmbn;
   input [1:0] raddr1_0;
   input [2:0] ir2_0;

   output [2:0] a;
   output 	noe;
   output 	nwe;

   // Taken directly from running:
   // 
   // espresso  ../microcode/mbu-control.espresso  | ../tools/espresso2pld


   // Map galasm name to verilog names
   wire 	dis, rmbp, rmbn, war, wmbn, wmbp, iden, addr0, addr1, ir0, ir1, ir2;
   wire 	a0, a1, a2, oe, we;

   assign dis = ndis;
   assign rmbp = nrmbp;
   assign rmbn = nrmbn;
   assign war = nwar;
   assign wmbn = nwmbn;
   assign wmbp = nwmbp;
   assign iden = nidxen;
   assign addr0 = raddr1_0[0];
   assign addr1 = raddr1_0[1];
   assign ir0 = ir2_0[0];
   assign ir1 = ir2_0[1];
   assign ir2 = ir2_0[2];

   assign a = {a2, a1, a0};
   assign noe = oe;
   assign nwe = we;

   // REVISION: MBUCTL00


   assign #delay a2 = (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir2 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir2 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir2 == 1'b1);

   assign #delay a1 = (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir1 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (addr1 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir1 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir1 == 1'b1);

   assign #delay a0 = (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir0 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (addr0 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir0 == 1'b1) || 
		      (dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir0 == 1'b1);

   assign #delay oe = (dis == 1'b0) || 
		      (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) || 
		      (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b0) && (wmbn == 1'b1);

   assign #delay we = (dis == 1'b0) || 
		      (rmbp == 1'b0) || 
		      (rmbn == 1'b0) || 
		      (war == 1'b0) || 
		      (wmbp == 1'b1) && (wmbn == 1'b1) || 
		      (wmbp == 1'b0) && (wmbn == 1'b0);

endmodule // mbu_control_gal




// The Memory Bank Register File

module mbu (nreset,
	    clk1, clk2, clk3, clk4, t34,
	    raddr,
	    waddr,
	    nir_idx,		// During nwar, CU wants ir[2:0] to select MBR
	    ir,			// Only bits 0–2 are used.
	    ibus,		// Only bits 0–7 of the IBUS are used.
	    aext,		//
	    nr, nw,
	    ab,	db, nsysdev,	// Only bits 0–7 of the AB and DB are used.
	    nwar,		// Convenience output to the AR
	    nfpram_rom		// RAM/ROM switch from front panel
	    );
   
   input        nreset;
   input 	clk1, clk2, clk3, clk4, t34;
   input [4:0] 	waddr, raddr;
   input 	nir_idx;
   input [2:0] 	ir;
   input 	nsysdev;
   input 	nr;
   input 	nw;
   inout 	nfpram_rom;
   
   inout [7:0] 	ibus;
   inout [7:0] 	ab;
   inout [15:0] db;		// Real hardware only uses 7:0.
   
   output [7:0] aext;
   output 	nwar;

   wire 	nreset;
   wire [4:0] 	waddr;
   wire [4:0] 	raddr;
   wire [7:0] 	ibus;

   tri0 [7:0] 	aext;
   tri1 	nfpram_rom;

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // DECODING		
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [7:0] 	dec_ab, dec_raddr, dec_waddr1, dec_waddr2;
   wire 	niombr;
   wire 	nrmbp;
   wire 	nwmbp;
   wire 	nwar;

   // U10: This decodes I/O addresses &008–&00F.
   demux_138 demux_ab (.a(ab[6:4]), .g1(ab[3]), .ng2a(ab[7]), .ng2b(nsysdev), .y(dec_ab));
   assign niombr = dec_ab[0];
   
   // U12: We decode RADDR 01101, read_mbp+flags.
   // demux_138 demux_raddr (.a(raddr[2:0]), .g1(raddr[3]), .ng2a(raddr[4]), .ng2b(t34), .y(dec_raddr));
   demux_138 demux_raddr (.a(raddr[2:0]), .g1(raddr[3]), .ng2a(raddr[4]), .ng2b(1'b0), .y(dec_raddr));
   assign nrmbp = dec_raddr[5];

   // U16: We decode WADDRs 01100, 01101, and 01110. Symmetric to the above '138.
   demux_138 demux_waddr1 (.a(waddr[3:1]), .g1(1'b1), .ng2a(waddr[4]), .ng2b(clk4), .y(dec_waddr1));
   assign nwmbp = dec_waddr1[6];

   // U17: decode WADDR to get nwar.
   demux_138 demux_waddr2 (.a(waddr[4:2]), .g1(1'b1), .ng2a(1'b0), .ng2b(1'b0), .y(dec_waddr2));
   assign nwar = dec_waddr2[1];

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // POWER-ON DEFAULTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // After reset, the outputs of all register files are tri-stated and a value
   // of either &00 or &80 is imposed using pull-down resistors and a
   // multiplexer. The first time the MBU is written to using an OUT
   // instruction, it comes out of reset and starts driving values.

   // U18: the MBU enable FF. We output complementary active-low pair (nEN,
   // nDIS). nEN is also connected to a LED, but there's a solder jumper to
   // disconnect it if the current draw becomes too much.
   wire 	nen, ndis, niowmbr;
   flipflop_74h ff_init(.d(1'b1), .clk(1'b1), .nset(nreset), .nrst(niowmbr),
			.q(nen), .nq(ndis));

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // THE REGISTER FILE
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [1:0] 	ra, wa;
   wire [7:0] 	rd;
   wire 	nren0, nren1;
   wire 	nwen0, nwen1;

   // 8 8-bit registers formed out of 4 4×4-bit '670 register files. These are
   // sluggish chips compared to the SRAM of the previous design, but simpler
   // to use.
   regfile_670 rf_0lo (.d(ibus[3:0]), .nre(nren0), .nwe(nwen0), .ra(ra), .wa(wa), .q(rd[3:0]));
   regfile_670 rf_0hi (.d(ibus[7:4]), .nre(nren0), .nwe(nwen0), .ra(ra), .wa(wa), .q(rd[7:4]));

   regfile_670 rf_1lo (.d(ibus[3:0]), .nre(nren1), .nwe(nwen1), .ra(ra), .wa(wa), .q(rd[3:0]));
   regfile_670 rf_1hi (.d(ibus[7:4]), .nre(nren1), .nwe(nwen1), .ra(ra), .wa(wa), .q(rd[7:4]));

   // Connect the RD bus to AEXT when the MBU is enabled. We use a multiplexer
   // (and no pull-down resistors) for bit 7 because it changes depending on
   // the value of nfpram_rom.
   wire [7:0] 	buf_aext_y;
   buffer_541 buf_aext (.noe1(nen), .noe2(1'b0), .a({1'b0, rd[6:0]}), .y(buf_aext_y));
   mux_2g157 mux_aext7 (.sel(nen), .a(rd[7]), .b(nfpram_rom), .ng(1'b0), .y(aext[7]));
   assign aext[6:0] = buf_aext_y;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // WRITE ADDRESSING
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The MBU registers are written to in response to two actions:
   //
   // (a) When the Control Unit asserts write_mbp or write_mbp+flags (decoded
   //     as nwmbp here).
   // (b) Programmatically, using the When the Control Unit asserts write_mbp
   //     or write_mbp+flags (decoded as niowmbr).
   //
   // In case (a), the address is always 000 (MBP).
   // In case (b), the address is AB[2:0].
   // ____   ______                ____   ____
   // WBMP   IOWMBR    WA0   WA1   WEN0   WEN1   What
   // ------------------------------------------------------------------------
   //   1      1        X     X     1       1    No write
   //   0      1        0     0     0       1    Write to MBP
   //   1      0       AB0   AB1   AB2    !AB2   Write to MB[AB[2:0]]
   //
   // To implement this, we use one stages of three multiplexers plus two
   // 1g0832 AND/OR ICs.

   mux_2g157 wmux0 (.a(ab[0]), .b(1'b0), .sel(niombr), .ng(1'b0), .y(wa[0]));
   mux_2g157 wmux1 (.a(ab[1]), .b(1'b0), .sel(niombr), .ng(1'b0), .y(wa[1]));

   // The third mux selects the correct bank of 670s for writing.
   wire 	nw0, nw1;
   mux_2g157 wmux2 (.a(ab[2]), .b(1'b0), .sel(niombr), .ng(1'b0), .y(nw0), .ny(nw1));

   // And then generate write enables when (niombr and nw) or nmbp are asserted:
   assign #4 niowmbr = niombr | nw;

   // This uses two 74LVG1G0832 units:
   assign #4 nwen0 = (niowmbr & nwmbp) | nw0;
   assign #4 nwen1 = (niowmbr & nwmbp) | nw1;

   // Timing note: the enables are delayed a little bit compared to the WA
   // address multiplexing, but not enough for maintaining the '670s languid
   // setup time (≥10ns). Luckily, IO addressing (and niombr) is decoded ~
   // 62.5ns before the nw strobe (and thus ~64.5ns before niowmbr), so in
   // practice this is no concern.

   ///////////////////////////////////////////////////////////////////////////////
   //
   // READ ADDRESSING
   //
   ///////////////////////////////////////////////////////////////////////////////

   // There are four ways to read MBU registers. The truth table is complex
   // because it also implements auto-indexed addressing modes:
   // ____  ___  ______  
   // RMBP  WAR  IORMBR  WADDR  NIR_IDX  ADDR       What
   // -------------------------------------------------------------------------
   //  X     X    X          X    X         X      MBU disabled. AEXT=&00 or &80.
   //  0     X    X          X    X       000      Reading MBP. AEXT drives IBus.
   //  1     0    X      ...00    X       000      Indexing with MBP. Address: waddr[0:1]
   //  1     0    X      ...01    X       001      Indexing with MBD.
   //  1     0    X      ...10    X       010      Indexing with MBS.
   //  1     0    X      ...11    0       011      Indexing with MBS.
   //  1     0    X      ...11    1       ir[2:0]  Autoindexing, address is IR[2:0].
   //  1     1    0          X    X       ab[1:0]  IN from MBR. AEXT drives DB.
   // -------------------------------------------------------------------------

   wire 	nrg, cur0, cur1, cur2;
   assign #4 nrg = !nrmbp;

   wire 	nir_idxreg;
   // flipflop_74h ff_idx(.d(1'b0), .clk(t34), .nset(nir_idx), .nrst(nreset),
   // 		       .nq(nir_idxreg));
   flipflop_74h ff_idx(.d(1'b0), .clk(clk2), .nset(nir_idx), .nrst(nreset),
		       .nq(nir_idxreg));

   // FOR TESTING ONLY: when the MBU isn't being read from (RG# is high) and
   // the AB is tri-stated, X values appear in Verilog waveforms because
   // not(Z)=X.  On real hardware, the AB has Bus Hold circuitry so its values
   // are never defined. The MBU would be driving AEXT with a bogus register,
   // which isn't used anyway. On the simulator, we don't use Bus Hold on AB so
   // that these problems are more obvious. So, to fix the X issue here, we
   // treat AB[2:0] specially. To help locate this, we pull up the values to
   // emit register 7.
   wire [2:0] 	ab2_0;
   assign ab2_0[0] = ab[0] === 1'bz ? 1 : ab[0];
   assign ab2_0[1] = ab[1] === 1'bz ? 1 : ab[1];
   assign ab2_0[2] = ab[2] === 1'bz ? 1 : ab[2];

   // First stage mux, choose between IR and AB as source for AR indexing.
   mux_2g157 rmux1_0 (.a(ir[0]), .b(waddr[0]), .sel(nir_idxreg), .ng(1'b0), .y(cur0));
   mux_2g157 rmux1_1 (.a(ir[1]), .b(waddr[1]), .sel(nir_idxreg), .ng(1'b0), .y(cur1));
   mux_2g157 rmux1_2 (.a(ir[2]), .b(1'b0),     .sel(nir_idxreg), .ng(1'b0), .y(cur2));

   // Second stage mux, choose between the previous stage and AB[2:0].
   mux_2g157 rmux2_0 (.a(cur0), .b(ab2_0[0]), .sel(nwar), .ng(nrg), .y(ra[0]));
   mux_2g157 rmux2_1 (.a(cur1), .b(ab2_0[1]), .sel(nwar), .ng(nrg), .y(ra[1]));
   mux_2g157 rmux2_2 (.a(cur2), .b(ab2_0[2]), .sel(nwar), .ng(nrg), .y(nren0), .ny(nren1));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // OUTPUT BUS INTERFACE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // There are three outputs:
   //
   // (a) AEXT (dedicated, always active, the MBU is the only driver)
   // (b) IBUS[7:0] (we only drive bits 0–7 on Control Unit)
   // (c) DB[7:0] (when an IN instruction is issued)

   buffer_541 buf_ibus (.noe1(nrmbp), .noe2(1'b0), .a(aext), .y(ibus[7:0]));
   buffer_541 buf_db   (.noe1(niombr), .noe2(nr), .a(aext), .y(db[7:0]));

   // This is here ONLY for debugging, otherwise the testbench throws
   // a spurious bus error: we need to drive all 16 bits of the IBUS.
   //
   // Note (2020-04-19): removed this, as read_bmp has been removed in
   // favour of read_bmp+flags which always drives all 16 bits of the
   // IBus.

   // tri0 [7:0] 	_db_pullup;
   // assign db[15:8] = nrmbp ? 8'bZ : _db_pullup;

   // Note that the RMB instruction only drives the lower 8 bits. On real
   // hardware, Bus Hold would make the MSB equal to the last memory operation,
   // which will almost certainly be an instruction fetch, so &54 would be
   // returned. We do this here by adding an MSB buffer, which SHOULD NOT be
   // present in real hardware.
   buffer_541 buf_db_simulator_only (.noe1(niombr), .noe2(nr), .a(8'h54), .y(db[15:8]));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFICATION CONVENIENCE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // These are used only for debuging.

   wire [7:0] 	mb[7:0];
   wire [7:0] 	mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7;

   assign mb[0] = { rf_0hi.q0[0], rf_0lo.q0[0] };
   assign mb[1] = { rf_0hi.q0[1], rf_0lo.q0[1] };
   assign mb[2] = { rf_0hi.q0[2], rf_0lo.q0[2] };
   assign mb[3] = { rf_0hi.q0[3], rf_0lo.q0[3] };
   assign mb[4] = { rf_1hi.q0[0], rf_1lo.q0[0] };
   assign mb[5] = { rf_1hi.q0[1], rf_1lo.q0[1] };
   assign mb[6] = { rf_1hi.q0[2], rf_1lo.q0[2] };
   assign mb[7] = { rf_1hi.q0[3], rf_1lo.q0[3] };

   assign mb0 = mb[0];
   assign mb1 = mb[1];
   assign mb2 = mb[2];
   assign mb3 = mb[3];
   assign mb4 = mb[4];
   assign mb5 = mb[5];
   assign mb6 = mb[6];
   assign mb7 = mb[7];

endmodule // mbu
`endif //  `ifndef mbu_v

// End of file
