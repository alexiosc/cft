`include "counter.v"
`include "registerFile.v"
`include "frameEngine.v"
`include "horizontalPhase.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// RGB BUFFER
//
// Function: selects the correct RGB data to output depending on
// whether this is a foreground or background pixel and whether or not
// it's the cursor location. Sinks current (black output) when video
// is disabled.
//
///////////////////////////////////////////////////////////////////////////////


// TODO: Make CURSOR signal multiplex CREG/{CFG,CBG}
module RGBBuffer(pixclk, video, cursor, fgen, fg, bg, cfg, cbg, r, g, b);

   input       pixclk, video, cursor, fgen;
   input [5:0] fg, bg, cfg, cbg;

   output [1:0] r, g, b;

   reg [5:0] 	rgb;

   always @(posedge pixclk) begin
      if (pixclk == 1'b1) begin
	 case ({video, cursor, fgen})	// synthesis parallel_case
	   3'b100: rgb <= bg;		// Cursor off, bg pixel
	   3'b101: rgb <= fg;		// Cursor off, fg pixel
	   3'b110: rgb <= cbg;	// Cursor on, bg pixel
	   3'b111: rgb <= cfg;	// Cursor on, fg pixel
	   default: rgb <= 6'b000000;	// Video off (0XX)
	 endcase // case ({video, cursor, fgen})
      end
   end

   assign r = rgb[1:0];
   assign g = rgb[3:2];
   assign b = rgb[5:4];

endmodule // RGBBuffer


///////////////////////////////////////////////////////////////////////////////
//
// PLANE ADDRESS COUNTER
//
///////////////////////////////////////////////////////////////////////////////

module PlaneAddressCounter(incaddr, nreset, phase, nrow, sar, mar, vvideo, nsmstb, paddr);
   input 	 incaddr;	// Increment address clock
   input 	 nreset;	// Reset (active low)
   input 	 phase;		// Line start (active high)
   input 	 nrow;		// Row count
   input [15:0]  sar, mar;	// Start/end address
   input 	 vvideo;	// Vertical video enabled
   input 	 nsmstb;	// Split screen strobe

   output [16:0] paddr;		// Plane address

   // Plane address. The address works like a <y,x> vector. The vertical
   // component (y) is 9 bits (0..511) to cover the 400-pixel resolutions. The
   // horizontal component (x) is 7 bits, which allows values between
   // (0..127). Lines are aligned with the 7-bit boundary, so at first glance
   // they are not contiguous. In practice though, this forms a 128x512 virtual
   // screen with two-axis cell-level scrolling. It's wasteful, but much
   // easier. X addresses are actually mod 128, so they wrap around. This makes
   // horizontal scrolling much easier. Vertical addresses are mod 512, and
   // this has largely the same effect and provides a hardware-assisted
   // 512-line backscroll buffer in text modes.
   //
   // The horizontal count is incremented by the sequencer (above), as a result
   // of the incaddr signal. The vertical count is incremented when the last
   // line of the current cell has completed, which is done by the cell line
   // counter (below).
   wire        nhmod, nvmod;
   assign paddr[16] = 1'b0;
   assign nhmod = ~(paddr[6:0] == mar[6:0]);
   assign nvmod = ~(paddr[15:7] == mar[15:7]);
   counter193 #7 hAddressCounter (~incaddr, nreset, /*nldhcnt*/ phase & nhmod, sar[6:0], paddr[6:0]);
   counter193 #9 vAddressCounter (nrow, nreset, vvideo & nsmstb & nvmod, sar[15:7], paddr[15:7]);
endmodule // PlaneAddressCounter



module Sequencer(clk, /*pixclk, */nreset, phase, col40, memenable,
		 nhostread, nhostwrite, nbusy, nhost,
		 incaddr,
		 paen, par,
		 cgaen, cgar,
		 load, //nshift,
		 ccmp,
		 nhaen, nhr, nhw, nhcmdstb);

   input clk;
   //input pixclk;
   input nreset;
   input phase;
   input col40;
   input memenable;
   input nhostread;
   input nhostwrite;
   input nbusy;

   output nhost;		// Host memory cycle strobe
   output incaddr;		// Increment plane address
   output paen;			// Enable paddr on address bus
   output par;			// Plane read strobe
   output cgaen;		// Enable char gen addr on address bus
   output cgar;			// Char gen data read strobe
   output load;			// Load shift register
   //output nshift;		// Shift out a pixel
   output ccmp;			// Cursor comparison strobe
   output nhaen;		// Host address enable
   output nhr;			// Host read strobe
   output nhw;			// Host write strobe
   output nhcmdstb;		// Host command strobe
   
   // The line state machine is based on an 11-bit counter, counting at 50
   // MHz. This may seem a bit excessive, but the previous solution was much
   // more complicated and used just as many register bits in the end. The
   // counter provides both the horizontal position in the line (in pixels) and
   // a sub-pixel n-phase, 20ns clock (2 ticks per pixel for 80-column modes, 4
   // ticks per pixel for 40-column modes). This is used to sequence memory
   // accesses as well as shipping out cells to the shift register.
   wire [9:0] xpos;
   wire [4:0] ph40;		// 40 column phase
   wire [3:0] ph80;		// 80 column phase
   wire [10:0] ticks;
   counter #11 xPosCtr (clk, nreset & phase, ticks);
   assign xpos = col40 ? {1'b0, ticks[10:2]} : ticks[10:1];
   assign ph40 = ticks[4:0];
   assign ph80 = ticks[3:0];

   wire        ph_0, ph_1, ph_2, ph_4, ph_5;
   assign ph_0 = {col40 & ph40[4], ph40[3:0]} == 5'd0;
   assign ph_1 = {col40 & ph40[4], ph40[3:0]} == 5'd1;
   assign ph_2 = {col40 & ph40[4], ph40[3:0]} == 5'd2;
   assign ph_4 = {col40 & ph40[4], ph40[3:0]} == 5'd4;
   assign ph_5 = {col40 & ph40[4], ph40[3:0]} == 5'd5;
   assign incaddr = memenable & (col40 ? (ph40 == 5'd30) : (ph80 == 4'd14));
   assign paen =    memenable & (ph_1 | ph_2);
   assign par =     memenable & ph_1;
   assign cgaen =   memenable & (ph_4 | ph_5);
   assign cgar =    memenable & ph_4;

   // Shift register signals
   assign load =    memenable & ph_0;
   //assign nshift =   pixclk;

   // Cursor comparison (must happen before increment)
   assign ccmp =    ph_1 | ph_2;

   // Host accesses
   assign nhcmdstb = ~ph_1;
   assign nhaen =    nbusy | ~(col40 ? (ph40 == 5'd7 || ph40 == 5'd8) : (ph80 >= 4'd7));
   assign nhost =    ~(col40 ? (ph40 == 5'd9) : (ph80 == 4'd9 || ph80 == 4'd11 || ph80 == 4'd13));
   assign nhr =      nbusy | nhostread | nhost;
   assign nhw =      nbusy | nhostwrite | nhost;
endmodule // Sequencer



///////////////////////////////////////////////////////////////////////////////
//
// Function: The CFT VDU
//
///////////////////////////////////////////////////////////////////////////////

module video(clk, nreset,
	     ab, db, niodev, nr, nw,
	     r, g, b, hsync, vsync,
	     debug_nhvideo, debug_nvvideo,
	     pa, pd, ncs0, ncs1, ncs2, npr, npw, dir,
	     irq);

`include "registerNames.v"

   input [7:0] 	ab;
   inout [15:0] db;		// input/output databus port
   input        niodev;
   input        nr;
   input        nw;
   
   input        nreset;
   input        clk;
   
   output [16:0] pa;
   inout [23:0]  pd;
   output        ncs0, ncs1, ncs2;
   output        npr;
   output        npw;
   output        dir;		// Used for the level shifting buffers

   output        hsync;
   output        vsync;
   output [1:0]  r, g, b;

   output 	 debug_nhvideo;
   output 	 debug_nvvideo;

   output 	 irq;

   // Mode control
   wire 	       vduen;	// MCR0[15]: enable VDU
   wire 	       irqscl;	// MCR0[7]: interrupt on SCL
   wire 	       irqvs;	// MCR0[6]: interrupt on VSYNC
   wire 	       istscl;  // (read) MCR0[7]: interrupt status: SCL
   wire 	       istvs;   // (read) MCR0[6]: interrupt status: VSYNC
   wire [1:0] 	       cs2;	// MCR0/1[5:4]: CG addr bits 14-15.
   wire 	       col40;	// MCR0/1[3]: 40-column mode.
   wire [2:0] 	       crh;	// MCR0/1[2:0]: Vertical mode.
   wire [7:0] 	       scl;	// MCR1[15:8]: Split scanline
   wire 	       sen;	// MCR1[7]: Split enable
   
   // Scrolling
   wire [2:0] 	hscr;	      // SCR0/1[2:0]: horizontal smooth scroll
   wire [3:0] 	vscr;	      // SCR0/1[7:4]: vertical smooth scroll
   
   // Addresses
   wire [15:0] 	sar;		// SAR0/1: start address
   wire [15:0] 	mar;		// MAR0/1: modulo address
   
   // Cursor control
   wire [5:0] 	cbg;		// CCR[5:0]: cursor foreground
   wire [5:0] 	cfg;		// CCR[8:13]: cursor background
   wire [1:0] 	cbc;		// CCR[7:6]: cursor blink control
   wire [15:0] 	car;		// CAR: Cursor address
   
   // Host control
   wire [15:0] 	har;		// HAR: Host address
   wire         ncmdsent;	// CMD[15]: command sent
   wire [2:0] 	hostcmd;		// CMD[12:10]: Host command
   wire 	hostincy;	// CMD[9]: Y increment.
   wire 	hostincx;	// CMD[8]: X increment.
   wire [7:0] 	bcgport;		// CMD[7:0]: B/CG plane port.
   wire [15:0] 	cport;		// CPORT: C plane port.
   wire         nbusy;		// Command processing (active low)
   
   // Note: each x_0 and x_1 registers is linked to signal x depending on which
   // side of the mode split we are, as follows:
   reg 		splitmode;	// 1 if we're at or past the split point

   wire 	incx;		// Strobe to increment HAR.x
   wire 	incy;		// Strobe to increment HAR.y

   wire 	devsel;		// Device selected by the host (I/O address &01Fx)


   ///////////////////////////////////////////////////////////////////////////////
   //
   // CFT INTERFACE
   //
   ///////////////////////////////////////////////////////////////////////////////

   assign devsel = (niodev == 1'b0) && (ab[7:4] == 4'hf);

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // REGISTER FILE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The register file.
   registerFile regFile(.nreset(nreset),
			.devsel(devsel),
			.nw(nw),
			.nr(nr),
			.ab(ab[3:0]),
			.db(db),
			.altmode(splitmode),
			.vduen(vduen),
			.irqscl(irqscl),
			.irqvs(irqvs),
			.cs2(cs2),
			.col40(col40),
			.crh(crh),
			.scl(scl),
			.sen(sen),
			.vscr(vscr),
			.hscr(hscr),
			.cbg(cbg),
			.cfg(cfg),
			.cbc(cbc),
			.sar(sar),
			.mar(mar),
			.car(car),
			.incx(incx),
			.incy(incy),
			.har(har));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE FRAME ENGINE
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire       hs;		// Horizontal sync (positive)
   wire       hvideo;		// Horizontal video enable
   wire       cellclken;	// Cell clock enable (after delay)
   wire       vs;		// Vertical sync (positive)
   wire       vvideo;		// Vertical video enable
   wire       video;		// Video enable
   wire [6:0] hcnt;		// Horizontal count (in frame)
   wire [8:0] vcnt;		// Scanline number (for split screen)
   wire       memenable;	// Host memory access enable
   wire       nldhcnt;		// Load horizontal count
      
   frameEngine frameStateMachine (.nreset(nreset),
				  .vduen(vduen),
				  .clk(clk),
				  .hs(hs),
				  .hvideo(hvideo),
				  .hcnt(hcnt),
				  .vs(vs),
				  .vvideo(vvideo),
				  .vcnt(vcnt),
				  .video(video),
				  .memenable(memenable));

   // Clock divider synchronised with start of line.
   wire       clk2, clk4;
   counter #2 clockDivider (clk, vduen & nreset, {clk4, clk2});

   // The pixel clock
   wire       pixclk;
   assign pixclk = col40 ? clk4 : clk2;


   // Horizontal phase. Ensures the first memory access happens one cell before
   // the start of the visible line, and allows smooth horizontal scrolling by
   // fine-tuning this delay.
   wire       phase;
   HorizontalPhase hPhase(nreset & memenable, pixclk, col40, hscr, phase);

   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // LINE SEQUENCER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Forward (and support) definitions
   wire        nhostread;	// Host wants to read from the VDU
   wire        nhostwrite;	// Host wants to write to the VDU
   wire        nhmaskc;		// Host wants to access C plane
   wire        nhmaskbcg;	// Host wants to access B plane or CG RAM
   wire        nhost;		// Host memory cycle strobe
   wire        har16;		// The 17th bit of the host-side address

   wire        nrow;		// New row strobe (active low)
   wire        rdevsel;
   wire        rdstatus;
   wire        rdcport;
   wire        rdbcgport;

   wire [5:0]  fg, bg;
   wire [1:0]  cs1;
   wire        invert, blink;

   // Sequencer signals
   wire        incaddr;	// Increment plane address
   wire        paen;		// Enable paddr on address bus
   wire        par;		// Plane read strobe
   wire        cgaen;		// Enable char gen addr on address bus
   wire        cgar;		// Char gen data read strobe
   wire        load;		// Load shift register
   wire        nshift;		// Shift out a pixel
   wire        ccmp;		// Cursor comparison strobe
   wire        nhaen;		// Host address enable
   wire        nhr;		// Host read strobe
   wire        nhw;		// Host write strobe
   wire        nhcmdstb;	// Host command strobe

   Sequencer sequencer(.clk(clk), .nreset(nreset), .phase(phase),
		       .col40(col40), .memenable(memenable),
		       .nhostread(nhostread), .nhostwrite(nhostwrite), .nbusy(nbusy),
		       .nhost(nhost),
		       .incaddr(incaddr),
		       .paen(paen), .par(par),
		       .cgaen(cgaen), .cgar(cgar),
		       .load(load),
		       .ccmp(ccmp),
		       .nhaen(nhaen), .nhr(nhr), .nhw(nhw), .nhcmdstb(nhcmdstb));
   assign nshift =   pixclk;


   // Plane address. The address works like a <y,x> vector. The vertical
   // component (y) is 9 bits (0..511) to cover the 400-pixel resolutions. The
   // horizontal component (x) is 7 bits, which allows values between
   // (0..127). Lines are aligned with the 7-bit boundary, so at first glance
   // they are not contiguous. In practice though, this forms a 128512 virtual
   // screen with two-axis cell-level scrolling. It's wasteful, but much
   // easier. X addresses are actually mod 128, so they wrap around. This makes
   // horizontal scrolling much easier. Vertical addresses are mod 512, and
   // this has largely the same effect and provides a hardware-assisted
   // 512-line backscroll buffer in text modes.
   //
   // The horizontal count is incremented by the sequencer (above), as a result
   // of the incaddr signal. The vertical count is incremented when the last
   // line of the current cell has completed, which is done by the cell line
   // counter (below).
   wire [16:0] paddr, cgaddr;
   PlaneAddressCounter planeAddress(.incaddr(incaddr), .nreset(nreset),
				    .phase(phase),
				    .sar(sar), .mar(mar),
				    .vvideo(vvideo),
				    .nsmstb(nsmstb),
				    .paddr(paddr));


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VIDEO MEMORY
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Address bus
   assign pa = paen ? paddr :
	       cgaen ? cgaddr :
	       {har16, har}; // Just output the host address in all other cases.
   

   // Memory control: CS, OE and WE
   assign ncs0 = ~((paen == 1'b1) || (nhmaskc == 1'b0)); // C plane low
   assign ncs1 = ~((paen == 1'b1) || (nhmaskc == 1'b0)); // C plane high
   assign ncs2 = ~((paen == 1'b1) || (cgaen == 1'b1) || (nhmaskbcg == 1'b0)); // B plane or CG accesses
   assign npr = ~((paen == 1'b1) || (cgaen == 1'b1) || (nhr == 1'b1));
   //assign npw = 1;
   assign npw = npr == 1'b0 ? 1'b1 : nhw; // Safety interlock

   // Data bus driver (with safety interlocks to avoid contention)
   assign pd[15:0] = npr == 1'b0 ? 16'bzzzzzzzzzzzzzzzz :
   		     nhaen == 1'b0 && nhmaskc == 0 ? cport :
   		     16'bzzzzzzzzzzzzzzzz;
   assign pd[23:16] = npr == 1'b0 ? 8'bzzzzzzzz :
   		      nhaen == 1'b0 && nhmaskbcg == 0 ? bcgport :
   		      8'bzzzzzzzz;

   // Read from memory to internal registers
   wire [15:0] creg0;
   wire [7:0]  breg, cgreg;

   fe_register #16 creg0FF(par, nreset, pd[15:0], creg0);
   fe_register #8 bregFF(par, nreset, pd[23:16], breg);
   fe_register #8 cgregFF(cgar, nreset, pd[23:16], cgreg);



   ///////////////////////////////////////////////////////////////////////////////
   //
   // CHARACTER GENERATOR
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   // The cell line address. Each row of characters has 1, 2, 4, or 8
   // scanlines, and this counter goes through them. This is used to form
   // character generator addresses. Rather than reset the counter, we let it
   // count mod 16, and we AND its output with an appropriate mask.
   wire [3:0] clc;
   wire       nclcclr;
   //TODO: Also reset the clcCounter on screen split
   counter193 #4 clcCounter(hs, nreset, vvideo, vscr, clc);

   // CRH masking
   // TODO: independent module, parallel
   wire [3:0] crhmask, clcmasked;
   assign crhmask = 
		    crh == 3'b100 ? 4'b0000 :
		    crh == 3'b000 ? 4'b1111 :
		    crh == 3'b001 ? 4'b0111 : 
		    crh == 3'b010 ? 4'b0011 : 
                                    4'b0001;
   assign clcmasked = clc & crhmask;
   assign nrow = ~hs &  ((clc & crhmask) == 4'b0000);

   // Character generator address
   assign cgaddr = {1'b1, cs2[1:0], cs1[1:0], breg, clcmasked};



   ///////////////////////////////////////////////////////////////////////////////
   //
   // HORIZONTAL SPLIT (GRAPHICS+TEXT)
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The alternate mode engine (partial TODO)
   initial splitmode <= 0;

   // Note: scl is 8 bits, vert addr is 9. We compare the top 8 bits, so
   // switching can happen every 2 lines. The SMSTB# signal also resets the
   // vertical part of the plane address and sets an interrupt (if enabled).
   wire       sclcmp;
   assign sclcmp = {scl, 1'b0} == vcnt;
   assign nsmstb = memenable | ~((sen == 1'b1) && (sclcmp == 1'b1));
   always @(negedge nsmstb, posedge vs) begin
      if (nsmstb == 1'b0) splitmode <= 1'b1;
      else if (vs == 1'b1) splitmode <= 1'b0;
   end



   ///////////////////////////////////////////////////////////////////////////////
   //
   // BLINKING
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [4:0]  bcnt;
   wire        blinkon;
   wire        cblinkon;

   // This counter provides cursor and character blinking signals using
   // vertical sync as a clock, so blinking is synchronised with the frame. The
   // frame rate is divided by 16 (fast blink) or 32 (slow blink). With the
   // VESA-standard 25.000 640400 mode, we have a 74.228 Hz refresh rate, and
   // approximately 4.6 Hz (215 ms period fast blink) and 2.3 Hz (433 ms slow
   // blink). The slow blink is always used for characters. The cursor can be
   // configured for slow, fast or no blink at all.
   
   counter #5 blinkcounter (vs, nreset, bcnt);
   
`ifdef BLINKON
   assign blinkon = 1'b1;
`else
 `ifdef BLINKOFF
   assign blinkon = 1'b0;
 `else
   assign blinkon = bcnt[3];
 `endif
`endif
   
`ifdef CURSORON
   assign cblinkon = 1'b01;
`else
 `ifdef CURSOROFF
   assign cblinkon = 1'b00;
 `else
   assign cblinkon = cbc == 2'b00 ? 0 :
		     cbc == 2'b01 ? 1 :
		     cbc == 2'b10 ? bcnt[2] :
		     bcnt[3];
 `endif
`endif

   
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // COLOUR/ATTRIBUTE CONTROL
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   // Delay setting the C register until the shift register is loaded,
   // so both planes are in sync. Otherwise, pixels trail behind
   // colours (i.e. colours appear shifted left of pixels).
   wire [15:0] creg;
   fe_register #16 cregFF(load, nreset, creg0, creg);

   // Name the C plane fields (for convenience)
   assign {blink, invert, bg, cs1, fg} = creg;



   ///////////////////////////////////////////////////////////////////////////////
   //
   // HARDWARE CURSOR
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Detect if the cursor should be shown. This is registered, because when
   // the cursor is on we modify the colours of the current cell, but at that
   // time, the address has already advanced (making the cursor off by one). By
   // registering the flag we avoid putting the address comparison in the
   // colour multiplexer (and making it slower due to propagation delays), and
   // we get the address comparison right. The cursor flag is further
   // synchronised with the pixel shift register to ensure the cursor coincides
   // with the current cell.
   reg        cursorcmp, cursor;
   always @(negedge ccmp) cursorcmp <= paddr[15:0] == car;
   initial cursor <= 0;
   always @(posedge load, negedge nreset) begin
      if (nreset == 1'b0) cursor <= 0;
      else cursor <= cursorcmp && (cblinkon == 1'b1);
   end



   ///////////////////////////////////////////////////////////////////////////////
   //
   // PIXEL ENGINE
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   // The pixel shift register
   wire        pixelout;
   shiftreg #8 pixelShiftreg(nreset, ~load, nshift, cgreg, pixelout);
   wire        co;
   
   // Foreground/background selection mux
   wire [7:0]  fgtable;
   assign fgtable = {blinkon, 1'b0, blinkon, 5'b11100};
   wire        selectfg = fgtable[{pixelout, invert, blink}];

   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // OUTPUT DRIVERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // debug signals
   assign debug_nhvideo = ~hvideo;
   assign debug_nvvideo = ~vvideo;

   // Sync signals per VESA standards for VESA CVT 0.26MA
   assign hsync = ~hs;		// Negative horizontal sync
   assign vsync = vs;		// Positive vertical sync

   // The RBG output driver
   RGBBuffer rgbbuffer(pixclk, video, cursor, selectfg, fg, bg, cfg, cbg, r, g, b);

endmodule // video

// End of file.
