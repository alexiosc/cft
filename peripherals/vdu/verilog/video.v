`include "register.v"
`include "counter.v"
`include "counter193.v"
`include "shiftreg.v"
`include "horizontalPhase.v"
`include "addressableShiftRegister.v"
`include "frameEngine.v"
`include "vduMemoryAccess.v"

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

module RGBBuffer(pixclk, video, cursor, fgen, fg, bg, cfg, cbg, r, g, b);

   input       pixclk, video, cursor, fgen;
   input [5:0] fg, bg, cfg, cbg;

   output [1:0] r, g, b;

   wire [1:0] r0, g0, b0;

   assign r0 = video ? (cursor ? (fgen ? cfg[1:0] : cbg[1:0]) : (fgen ? fg[1:0] : bg[1:0])) : 2'b00;
   assign g0 = video ? (cursor ? (fgen ? cfg[3:2] : cbg[3:2]) : (fgen ? fg[3:2] : bg[3:2])) : 2'b00;
   assign b0 = video ? (cursor ? (fgen ? cfg[5:4] : cbg[5:4]) : (fgen ? fg[5:4] : bg[5:4])) : 2'b00;

   wire [1:0] r, g, b;
   assign r = r0;
   assign g = g0;
   assign b = b0;
   
   // reg [1:0] r, g, b;
   // always @(posedge pixclk) begin
   //    r <= r0;
   //    g <= g0;
   //    b <= b0;
   // end

endmodule // RGBBuffer


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

   parameter REG_MCR0 = 0;	// Mode control 0 + interrupt
   parameter REG_SR = 0;	// Status register (same as MCR0)
   parameter REG_MCR1 = 1;	// Mode control 1 + split control
   parameter REG_SCR0 = 2;	// Smooth scrolling
   parameter REG_SCR1 = 3;
   parameter REG_SAR0 = 4;	// Start address
   parameter REG_SAR1 = 5;
   parameter REG_MAR0 = 6;	// Modulo address
   parameter REG_MAR1 = 7;
   parameter REG_CCR = 8;	// Cursor control
   parameter REG_CAR = 9;	// Cursor address
   parameter REG_HAR = 10;	// Host address reg
   parameter REG_RSVD1 = 11;	//   *Reserved
   parameter REG_RSVD2 = 12;	//   *Reserved
   parameter REG_RSVD3 = 13;	//   *Reserved
   parameter REG_CPORT = 14;	// CPORT REG
   parameter REG_CMD = 15;	// Command and B/CG data
   parameter REG_BCGPORT = 15;	// B/CG data (same as CMD)

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



   ///////////////////////////////////////////////////////////////////////////////
   //
   // REGISTERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Mode control
   reg 	       vduen;		// MCR0[15]: enable VDU
   reg 	       irqscl;		// MCR0[7]: interrupt on SCL
   reg 	       irqvs;		// MCR0[6]: interrupt on VSYNC
   reg 	       istscl;		// (read) MCR0[7]: interrupt status: SCL
   reg 	       istvs;		// (read) MCR0[6]: interrupt status: VSYNC
   reg [1:0]   cs2_0, cs2_1;	// MCR0/1[5:4]: CG addr bits 14-15.
   reg 	       col40_0, col40_1;	// MCR0/1[3]: 40-column mode.
   reg [2:0]   crh_0, crh_1;	// MCR0/1[2:0]: Vertical mode.
   reg [7:0]   scl;		// MCR1[15:8]: Split scanline
   reg         sen;		// MCR1[7]: Split enable
   
   // Scrolling
   reg [2:0]   hscr_0, hscr_1;	// SCR0/1[2:0]: horizontal smooth scroll
   reg [3:0]   vscr_0, vscr_1;	// SCR0/1[7:4]: vertical smooth scroll
   
   // Addresses
   reg [15:0]  sar_0, sar_1;	// SAR0/1: start address
   reg [15:0]  mar_0, mar_1;	// MAR0/1: modulo address
   
   // Cursor control
   reg [5:0]   cbg;		// CCR[5:0]: cursor foreground
   reg [5:0]   cfg;		// CCR[8:13]: cursor background
   reg [1:0]   cbc;		// CCR[7:6]: cursor blink control
   reg [15:0]  car;		// CAR: Cursor address
   
   // Host control
   reg [15:0]  har;		// HAR: Host address
   reg         ncmdsent;	// CMD[15]: command sent
   reg [2:0]   hostcmd;		// CMD[12:10]: Host command
   reg 	       hostincy;	// CMD[9]: Y increment.
   reg 	       hostincx;	// CMD[8]: X increment.
   reg [7:0]   bcgport;		// CMD[7:0]: B/CG plane port.
   reg [15:0]  cport;		// CPORT: C plane port.
   reg         nbusy;		// Command processing (active low)
   
   // Note: each x_0 and x_1 registers is linked to signal x depending on which
   // side of the mode split we are, as follows:
   reg 	       splitmode;	// 1 if we're at or past the split point
   wire        nsmstb;		// Split mode strobe (active low)
   
   wire [1:0]  cs2;
   wire        col40;
   wire [2:0]  crh;
   wire [2:0]  hscr;
   wire [3:0]  vscr;
   wire [15:0] sar;
   wire [15:0] mar;

   // Splitmode is high if we're past the split point.
   assign cs2 = splitmode ? cs2_1 : cs2_0;
   assign col40 = splitmode ? col40_1 : col40_0;
   assign crh = splitmode ? crh_1 : crh_0;
   assign hscr = splitmode ? hscr_1 : hscr_0;
   assign vscr = splitmode ? vscr_1 : vscr_0;
   assign sar = splitmode ? sar_1 : sar_0;
   assign mar = splitmode ? mar_1 : mar_0;


   ///////////////////////////////////////////////////////////////////////////////
   //
   // RESET AND INITIALISATION
   //
   ///////////////////////////////////////////////////////////////////////////////

   // For simulation only
   initial begin
      vduen <= 0;		// Disable VDU
      irqscl <= 1;		// For testing: IRQs on SCL
      irqvs <= 1;		// For testing: IRQs on VSYNC
      istscl <= 0;		// Clear IRQ status
      istvs <= 0;		// Clear IRQ status
      cs2_0 <= 0;		// Clear ST2 (25-row mode)
      cs2_1 <= 0;		// Clear ST2 (25-row mode)
      col40_0 <= 0;		// 80 column mode
      col40_1 <= 0;		// 80 column mode
      crh_0 <= 0;		// 25 row mode
      crh_1 <= 0;		// 25 row mode
      scl <= 0;			// Disable split
      sen <= 0;			// Disable split
      hscr_0 <= 0;		// Idle horizontal scrolling
      hscr_1 <= 0;		// Idle horizontal scrolling
      vscr_0 <= 0;		// Idle vertical scrolling
      vscr_1 <= 0;		// Idle vertical scrolling
      sar_0 <= 0;		// Default start address
      sar_1 <= 0;		// Default start address
      mar_0 <= {9'd511,7'd127};	// 
      mar_1 <= {9'd511,7'd127};	// 
      cbg <= 0;			// Invisible cursor
      cfg <= 0;			// Invisible cursor
      cbc <= 0;			// Cursor off
      car <= 0;			// Cursor at top left
      har <= 0;			// Host address at top left
      ncmdsent <= 1;		// No command pending
      hostcmd <= 0;		// Host transfer direction
      hostincy <= 0;		// No row increment
      hostincx <= 0;		// No cell increment
      bcgport <= 0;		// Clear host commands
      cport <= 0;		// Clear host commands


   // These conditional compile-time defaults are used while the host interface
   // is untested or disabled.

`ifdef COL40
      col40_0 <= 1;
`else
      col40_0 <= 0;
`endif
      
`ifdef ROW50
      crh_0 <= 3'b001;		// 8 lines per row (x50)
`else
 `ifdef ROW100
      crh_0 <= 3'b010;		// 4 lines per row (x100)
 `else
  `ifdef ROW200
      crh_0 <= 3'b011;		// 2 lines per row (x200)
  `else
   `ifdef ROW400
      crh_0 <= 3'b100;
   `else // ROW25 (default)
      crh_0 <= 3'b000;
   `endif
  `endif
 `endif
`endif // !`ifdef ROW50

`ifdef SPLIT
      // For testing the horizontal split mode, we'll have 640×240 on top
      // (based on the 640×400 mode), and 40×10 at the bottom (based on 40×25 timings).
      
      scl <= 5 + 15*8;		// row 15 = 10 + 15*16 (scanline 250) / 2 = 125
      sen <= 1;			// Enable split mode
      col40_0 <= 0;		// 640px res top
      crh_0 <= 3'b100;		// High resolution graphics on top
      col40_1 <= 1;		// 40col res bottom
      crh_1 <= 3'b000;		// 25-line text bottom
      cs2_0 <= 3;		// Bitmap graphics on top
      hscr_1 <= 4;		// 4-pixel Horizontal scroll bottom
      sar_1 <= 1;		// Change the start address for the bottom mode
`endif //  `ifdef TESTALT

      // Set the cursor
      cfg <= 6'b000000; // Black
      cbg <= 6'b001011; // Orange
      cbc <= 2'b10;	// Blinking cursor
      
   end // initial begin

   
   // The frame engine
   wire       hs;		// Horizontal sync (positive)
   wire       hvideo;		// Horizontal video enable
   //wire       len40, len80;	// Initialise line sequencer
   wire       cellclken;	// Cell clock enable (after delay)
   wire       vs;		// Vertical sync (positive)
   wire       vvideo;		// Vertical video enable
   wire       video;		// Video enable
   wire [6:0] hcnt;		// Horizontal count (in frame)
   wire [8:0] vcnt;		// Scanline number (for split screen)
   wire       memenable;	// Host memory access enable
   wire       nldhcnt;		// Load horizontal count
      
   FrameEngine frameEngine (nreset, vduen, clk,
			    hs, hvideo, hcnt,
			    //len40, len80,
			    vs, vvideo, vcnt,
			    video, memenable);

   assign nldhcnt = ~(hcnt == 7'd84);

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
   HorizontalPhase horizontalPhase(nreset & memenable, pixclk, col40, hscr, phase);



   ///////////////////////////////////////////////////////////////////////////////
   //
   // LINE SEQUENCER
   //
   ///////////////////////////////////////////////////////////////////////////////

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

   // Memory access signals
   // This had a 7 or 23 pixel delay for 40- or 80-column modes
   // respectively. The delay got moved to the horizontal phase counter.

   wire        ph_0, ph_1, ph_2, ph_4, ph_5;
   assign ph_0 = {col40 & ph40[4], ph40[3:0]} == 5'b00000;
   assign ph_1 = {col40 & ph40[4], ph40[3:0]} == 5'b00001;
   assign ph_2 = {col40 & ph40[4], ph40[3:0]} == 5'b00010;
   assign ph_4 = {col40 & ph40[4], ph40[3:0]} == 5'b00100;
   assign ph_5 = {col40 & ph40[4], ph40[3:0]} == 5'b00101;
   assign incaddr = memenable & (col40 ? (ph40 == 5'd30) : (ph80 == 4'd14));
   assign paen =    memenable & (ph_1 | ph_2);
   assign par =     memenable & ph_1;
   assign cgaen =   memenable & (ph_4 | ph_5);
   assign cgar =    memenable & ph_4;

   // Shift register signals
   assign load =    memenable & ph_0;
   assign nshift =   pixclk;

   // Cursor comparison (must happen before increment)
   assign ccmp =    col40 ? (ph40 == 1 || ph40 == 2) : (ph80 == 1 || ph80 == 2);

   // Host accesses
   assign nhcmdstb = ~(col40 ? (ph40 == 5'd1) : (ph80 == 4'd1));
   assign nhaen =    nbusy | ~(col40 ? (ph40 == 5'd7 || ph40 == 8) : (ph80 >= 4'd7));
   assign nhost =    ~(col40 ? (ph40 == 5'd9) : (ph80 == 4'd9 || ph80 == 4'd11 || ph80 == 4'd13));
   assign nhr =      nbusy | nhostread | nhost;
   assign nhw =      nbusy | nhostwrite | nhost;

   // Plane address. The address works like a <y,x> vector. The vertical
   // component (y) is 9 bits (0..511) to cover the 400-pixel resolutions. The
   // horizontal component (x) is 7 bits, which allows values between
   // (0..127). Lines are aligned with the 7-bit boundary, so at first glance
   // they are not contiguous. In practice though, this forms a 128×512 virtual
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
   wire        nhmod, nvmod;
   assign paddr[16] = 1'b0;
   assign nhmod = ~(paddr[6:0] == mar[6:0]);
   assign nvmod = ~(paddr[15:7] == mar[15:7]);
   counter193 #7 hAddressCounter (~incaddr, nreset, /*nldhcnt*/ phase & nhmod, sar[6:0], paddr[6:0]);
   counter193 #9 vAddressCounter (nrow, nreset, vvideo & nsmstb & nvmod, sar[15:7], paddr[15:7]);


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
   counter193 #4 clcCounter(hs, nreset, vvideo, vscr, clc);

   // CRH masking
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
   // VESA-standard 25.000 640×400 mode, we have a 74.228 Hz refresh rate, and
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


   ///////////////////////////////////////////////////////////////////////////////
   //
   // INTERRUPTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire        nrmcr0;		// Reading MCR0 clears the interrupts

   // Vertical sync interrupts


   //TODO: Reinstate these (and make them synthesise)
   // always @(negedge nreset, negedge rdstatus, posedge vs) begin
   //    if (nreset == 1'b0 || rdstatus == 1'b0) istvs <= 0;
   //    if (irqvs == 1'b1 && vs == 1'b1) istvs <= 1;
   // end

   // always @(negedge nreset, negedge rdstatus, posedge sclcmp) begin
   //    if (nreset == 1'b0 || rdstatus == 1'b0) istscl <= 0;
   //    if (irqscl == 1'b1 && sclcmp == 1'b1) istscl <= 1;
   // end

   assign irq = istvs | istscl;

   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // CFT-SIDE OUTPUT I/O PORTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Device select decode. This decodes to I/O address &F0-&FF. Depending on
   // which IODEV signal is used, it would be &1F0-&1FF, &2F0-&2FF or
   // &3F0-&3FF. &0F0-&0FF is already used by other standard devices.
   
   assign devsel = (niodev == 1'b0) && (ab[7:4] == 4'hf);

   // Write I/O
   always @(posedge nw, negedge nreset) begin

      // Reset code for registers. Just the basics to disable the VDU.
      if (nreset == 1'b0) begin

`ifndef TEST
	 vduen <= 0;		// Disable VDU
`else
	 vduen <= 1;		// For testing, enable VDU early
`endif
	 irqscl <= 0;		// No IRQs on SCL
	 irqvs <= 0;		// NO IRQs on VSYNC

      end else if (devsel == 1'b1 && nw == 1'b1) begin // if (nreset == 1'b0)
	 case (ab[3:0])
	   REG_MCR0: begin	// Enable, top mode, interrupt
	      vduen <= db[15];
	      irqscl <= db[7];
	      irqvs <= db[6];
	      cs2_0 <= db[5:4];
	      col40_0 <= db[3];
	      crh_0 <= db[2:0];
	   end

	   REG_MCR1: begin	// Split screen, bottom mode
	      scl <= db[15:8];
	      sen <= db[15:7];
	      cs2_1 <= db[5:4];
	      col40_1 <= db[3];
	      crh_1 <= db[2:0];
	   end

	   REG_SCR0: begin	// Top smooth scroll
	      vscr_0 <= db[7:4];
	      hscr_0 <= db[2:0];
	   end
	   
	   REG_SCR1: begin	// Bottom smooth scroll
	      vscr_1 <= db[7:4];
	      hscr_1 <= db[2:0];
	   end

	   REG_CCR: begin	// Cursor control (fg, bg, blink)
	      cbg <= db[13:8];
	      cbc <= db[7:6];
	      cfg <= db[5:0];
	   end

	   // REG_CMD: implemented below (host memory interface)

	   // 16-bit wide regs
	   REG_SAR0: sar_0 <= db; // Top start address
	   REG_SAR1: sar_1 <= db; // Bottom start address
	   REG_MAR0: mar_0 <= db; // Top modulo address
	   REG_MAR1: mar_1 <= db; // Bottom modulo address
	   REG_CAR: car <= db;	  // Cursor address
	   //REG_HAR: har <= db;  // Host address (dealt with below)
	   //REG_CPORT: cport <= db; // C port value (dealt with below)
	 endcase // case (ab[3:0])
      end
   end // always @ (posedge nw, negedge nreset)

   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // CFT-SIDE INPUT I/O PORTS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Read I/O ports. This is done asynchronously.

   // An added safety interlock to avoid weird cases.
   assign rdevsel = (niodev == 1'b0) && (ab[7:4] == 4'hf) && nw && ~nr;

   // Access the Status register
   assign rdstatus = rdevsel && (ab[3:0] == REG_SR);

   // Access the C plane data register
   assign rdcport = rdevsel && (ab[3:0] == REG_CPORT);

   // Access the B plane (or CG RAM) data register
   assign rdbcgport = rdevsel && (ab[3:0] == REG_BCGPORT);

   // Configure the level shifters for output to CFT
   assign dir = rdstatus | rdcport | rdbcgport;
   wire dir_in;			// For convenience
   assign dir_in = ~dir;
   
   assign db = dir_in ? 16'bzzzzzzzzzzzzzzzz :
	       rdstatus ? {vduen, 7'b0000010, istscl, istvs, cs2_0, col40_0, crh_0} :
	       rdcport ? cport :
	       rdbcgport ? {ncmdsent, 2'b00, hostcmd, hostincy, hostincx, bcgport} :
	       16'bzzzzzzzzzzzzzzzz;
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // HOST-VIDEO MEMORY INTERFACE
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The HAR
   // TODO: Reinstate these (and make them synthesise)
   // always @(posedge nw, negedge nhcmdstb) begin
   //    if (nw == 1'b1 && devsel == 1'b1 && ab[3:0] == REG_HAR) har <= db;
   //    else if (nhcmdstb == 1'b0 && nbusy == 1'b0) begin
   // 	 // Increment the HAR after a host transaction.
   // 	 if (hostincy == 1'b1) har[15:7] <= har[15:7] + 1;
   // 	 if (hostincx == 1'b1) har[6:0] <= har[6:0] + 1;
   //    end
   // end

   // The C Port
   // TODO: Reinstate these (and make them synthesise)
   // always @(posedge nw, posedge nhr) begin
   //    if (nw == 1'b1 && devsel == 1'b1 && ab[3:0] == REG_CPORT) cport <= db;
   //    else if (nhr == 1'b1) cport <= pd [15:0];
   // end

   // Commands:
   // 000: Write B & C
   // 001: Write B
   // 010: Write C
   // 011: Write CG (same as B plane with har16 set)
   // 100: Read B & C
   // 101:  **RESERVED
   // 110:  **RESERVED
   // 111:  **RESERVED
   
   // The command register (REG_CMD)

   // TODO: Reinstate these (and make them synthesise)
   // TODO: Find a way to recode this so that it's synthesiseable, AND
   // can distinguish between read (nr) and write (nw) events.
   // always @(negedge nreset, posedge nw, posedge nr, negedge nbusy, posedge nhr) begin
   //    if (nreset == 1'b0) ncmdsent <= 1; // Cancel last command
   //    else if (nbusy == 1'b0) ncmdsent <= 1; // Command under way, clear the flag
   //    else if (devsel == 1'b1 && nw == 1'b1 && ab[3:0] == REG_CMD) begin
   // 	 ncmdsent <= db[15];
   // 	 hostcmd <= db[12:10];
   // 	 hostincy <= db[9];
   // 	 hostincx <= db[8];
   // 	 bcgport <= db[7:0];
   //    end else if (rdevsel == 1'b1 && nr == 1'b1 && ab[3:0] == REG_CMD) begin
   // 	 // When reading a value previously read from VRAM (i.e
   // 	 // hostcmd=3'b100), perform another NVRAM read command at the
   // 	 // END of the host bus cycle, so new values will be available.
   // 	 ncmdsent <= 0;
   //    end
   //    if (hostcmd == 3'b100 && nhr == 1'b1) bcgport <= pd[23:16];
   // end // always @ (negedge nreset, posedge nw, negedge nbusy)

   // Host read/write
   assign har16 = hostcmd == 3'b011 ? 1'b1 : 1'b0; // Access CG RAM sub-plane
   assign nhostread = ~(hostcmd == 3'b100);
   assign nhostwrite = ~(hostcmd[2] == 1'b0);
   assign nhmaskc = hostcmd[0];
   assign nhmaskbcg = hostcmd[1] & ~(hostcmd == 3'b011);

   // The busy flag (which enables host memory cycles)
   always @(negedge nreset, posedge nhcmdstb) begin
      if (nreset == 1'b0) begin
	 nbusy <= 1;
      end
      else if (nhcmdstb == 1'b1) nbusy <= ncmdsent;
   end

endmodule // video

// End of file.
