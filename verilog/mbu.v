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

`include "ram.v"
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

   parameter delay = 10;	// Maximum delay per the Microchip/Atmel datasheet

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
		       waddr1_0, // WADDR[1:0]
		       ir2_0,	 // IR[2:0]
		       a,
		       noe,
		       nwe,
		       nibusen
		       );
   
   parameter delay = 10;	// Maximum delay per the Microchip/Atmel datasheet

   input       ndis;
   input       nrmbp;
   input       nrmbn;
   input       nwar;
   input       nidxen;
   input       nwmbp;
   input       nwmbn;
   input [1:0] waddr1_0;
   input [2:0] ir2_0;

   output [2:0] a;
   output 	noe;
   output 	nwe;
   output 	nibusen;

   // Taken directly from running:
   // 
   // espresso  ../microcode/mbu-control.espresso  | ../tools/espresso2pld


   // Map galasm name to verilog names
   wire 	dis, rmbp, rmbn, war, wmbn, wmbp, iden, addr0, addr1, ir0, ir1, ir2;
   wire 	a0, a1, a2, oe, we, ibusen;

   assign dis = ndis;
   assign rmbp = nrmbp;
   assign rmbn = nrmbn;
   assign war = nwar;
   assign wmbn = nwmbn;
   assign wmbp = nwmbp;
   assign iden = nidxen;
   assign addr0 = waddr1_0[0];
   assign addr1 = waddr1_0[1];
   assign ir0 = ir2_0[0];
   assign ir1 = ir2_0[1];
   assign ir2 = ir2_0[2];

   assign a = {a2, a1, a0};
   assign noe = oe;
   assign nwe = we;
   assign nibusen = ibusen;

   // REVISION: MBUCTL00

   assign #delay ibusen = ((war == 1'b0)) || 
			  ((wmbn == 1'b0)) || 
			  ((wmbp == 1'b0)) || 
			  ((rmbp == 1'b0) && (rmbn == 1'b0)) || 
			  ((rmbp == 1'b1) && (rmbn == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1));

   assign #delay oe = ((dis == 1'b0)) || 
		      ((rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b0) && (wmbn == 1'b1)) || 
		      ((rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0));

   assign #delay we = ((dis == 1'b0)) || 
		      ((war == 1'b0)) || 
		      ((rmbn == 1'b0)) || 
		      ((rmbp == 1'b0)) || 
		      ((wmbp == 1'b0) && (wmbn == 1'b0)) || 
		      ((rmbp == 1'b1) && (rmbn == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1));

   assign #delay a0 = ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir0 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir0 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir0 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (addr0 == 1'b1));

   assign #delay a1 = ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir1 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir1 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir1 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (addr1 == 1'b1));

   assign #delay a2 = ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir2 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir2 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir2 == 1'b1));

endmodule // mbu_control_gal




// The Memory Bank Register File

module mbu (nrsthold,
	    clk2, clk4, t34,
	    raddr,
	    waddr,
	    ibus,		// Only bits 0–7 of the IBUS are used.
	    nir_idx,		// During nwar, CU wants ir[2:0] to select MBR
	    ir,			// Only bits 0–2 are used.
	    aext,		//
	    nfpram_rom,		// RAM/ROM switch from front panel
	    nwar		// Convenience output to the AR
	    );
   
   input        nrsthold;
   input 	clk2, clk4, t34;
   input [4:0] 	waddr, raddr;
   input [2:0] 	ir;
   input 	nir_idx;
   inout 	nfpram_rom;
   inout [15:0] ibus;		// Real hardware only uses [7:0].
   
   output [7:0] aext; 
   output 	nwar;

   wire [7:0] 	aext;
   tri1 	nfpram_rom;

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // DECODING
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   wire 	nrmbn, nrmbp, nrctx;
   wire 	nwmbn, nwmbp, nwctx;

   mbu_decoder_gal decoder_gal(
			       .raddr(raddr),	// CFT Read Unit
			       .waddr(waddr),	// CFT WRite Unit
			       .clk4(clk4),	// Write strobe
			       .nrmbn(nrmbn),	// Put MBn on IBus
			       .nrmbp(nrmbp),	// Put MBP (MB0) on IBus
			       .nrctx(nrctx),	// Put CTX on IBus
			       .nwmbn(nwmbn),	// Write IBus to MBn
			       .nwmbp(nwmbp),   // Write IBus to MBp
			       .nwctx(nwctx),   // Write IBus to CTX 
			       .nwar(nwar)      // One of the four write_ar_xx strobes
			       );   

   ///////////////////////////////////////////////////////////////////////////////
   // 
   // CONTROL
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	ndis;
   wire 	nir_idxr;
   wire [2:0] 	a;
   wire 	noe;
   wire 	nwe;
   wire 	nibusen;
   
   mbu_control_gal control_gal(
			       .ndis(ndis),	// MBU Disable
			       .nrmbp(nrmbp),
			       .nrmbn(nrmbn),
			       .nwar(nwar),
			       .nidxen(nir_idxr),
			       .nwmbp(nwmbp),
			       .nwmbn(nwmbn),
			       .waddr1_0(waddr[1:0] ),	// WADDR[1:0]
			       .ir2_0(ir[2:0]),
			       .a(a),
			       .noe(noe),
			       .nwe(nwe),
			       .nibusen(nibusen)
			       );


   ///////////////////////////////////////////////////////////////////////////////
   // 
   // THE CONTEXT REGISTER
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [7:0] 	ctx;
   
   flipflop_574 ff_ctx (.d(ibus[7:0]), .q(ctx), .clk(nwctx), .noe(1'b0));
   buffer_541 buf_ctx (.noe1(nrctx), .noe2(1'b0), .a(ctx), .y(ibus[7:0]));


   ///////////////////////////////////////////////////////////////////////////////
   // 
   // THE REGISTER FILE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Reproduce the pull-down/up scheme in the schematics
   assign (weak0, weak1) aext[7] = nfpram_rom; // This is how it's done in hardware
   assign (pull0, pull1) aext[6:0] = 6'd0;
   
   sram #(11, 12) regfile_mbu (.a({ctx, a}), .d(aext), .nce(1'b0), .nwe(nwe), .noe(noe));
   buffer_541 buf_mbu_in (.noe1(nwe), .noe2(1'b0), .a(ibus[7:0]), .y(aext));
   //buffer_541 buf_mbu_out (.noe1(nibusen), .noe2(t34), .a(aext), .y(ibus[7:0]));
   buffer_541 buf_mbu_out (.noe1(nibusen), .noe2(1'b0), .a(aext), .y(ibus[7:0]));

   // Verilog only: to ease testing, drive the upper 8 bits of the IBUS here,
   // too. On real hardware, we have bus hold but that's less predictable.
   wire [7:0] 	hex54;
   assign hex54 = 8'h54;
   buffer_541 buf_mbu_out_hi (.noe1(nibusen & nrctx), .noe2(1'b0), .a(hex54), .y(ibus[15:8]));



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
   flipflop_74h ff_init(.d(1'b1), .clk(1'b1), .nset(nwmbn), .nrst(nrsthold), 
			.q(ndis));

   flipflop_74h ff_idx(.d(1'b1), .clk(clk2), .nrst(nir_idx), .nset(nrsthold), 
			.q(nir_idxr));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFICATION CONVENIENCE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // These are used only for debuging.

   wire [7:0] 	mb[7:0];
   wire [7:0] 	mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7;

   assign mb[0] = regfile_mbu.mem[{ctx, 3'd0 }];
   assign mb[1] = regfile_mbu.mem[{ctx, 3'd1 }];
   assign mb[2] = regfile_mbu.mem[{ctx, 3'd2 }];
   assign mb[3] = regfile_mbu.mem[{ctx, 3'd3 }];
   assign mb[4] = regfile_mbu.mem[{ctx, 3'd4 }];
   assign mb[5] = regfile_mbu.mem[{ctx, 3'd5 }];
   assign mb[6] = regfile_mbu.mem[{ctx, 3'd6 }];
   assign mb[7] = regfile_mbu.mem[{ctx, 3'd7 }];

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
