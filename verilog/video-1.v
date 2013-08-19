`include "counter.v"
`include "comparator.v"
`include "flipflop.v"
`include "demux.v"
`include "mux.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Function: The CFT CPU
//
///////////////////////////////////////////////////////////////////////////////

module video(ab, db, niodev1, nr, nw, nreset, r, g, b, hs, vs);
   parameter bpc = 2;
   parameter pixel_clock = 20;	// 39ns = ~25.64 MHz. SHOULD have: 25.175 MHz

   input [15:0]   ab;
   inout [15:0]   db;
   input 	  niodev1, nr, nw;
   input 	  nreset;
   
   output [bpc:0] r, g, b;
   output 	  hs, vs;

   wire [bpc:0]   r, g, b;
   wire 	  hs, vs;

   reg 		  pxclk;
   wire 	  nven;
   wire [7:0] 	  hc;
   wire [11:0] 	  vc;

   wire 	      reset;

   initial begin
      pxclk = 0;
   end

   wire [2:0] ur, ug, ub;
   
   assign ur = nven ? 0 : (hct - 1) & 3;
   assign ug = nven ? 0 : ((hct - 1) >> 2) & 3;
   assign ub = nven ? 0 : ((hct - 1) >> 4) & 3;

   wire [4:0] dummy;
   flipflop_374 r_buf({5'b0000, ur}, 0, ncolclk, {dummy, r});
   flipflop_374 g_buf({5'b0000, ug}, 0, ncolclk, {dummy, g});
   flipflop_374 b_buf({5'b0000, ub}, 0, ncolclk, {dummy, b});

   assign reset = ~nreset;
   assign vs = nvsync;
   assign #6 hs = vs & hsync;
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // PROCESSOR INTERFACE: ADDRESS DECODER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // TODO: provide actual addressing details
   wire [5:0] 	      nregsel;
   tri1 	      nwsar;
   tri1               nwmr;
   
   demux_138 demux_io(1, 0, niodev1, ab[2:0], {nregsel, nwsar, nwmr});


   ///////////////////////////////////////////////////////////////////////////////
   //
   // REGISTERS
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The start address register.
   wire [15:0] 	      reg_sar;	// Start Video Address

   flipflop_374 reg_sar_hi (db[15:8], 0, nwsar, reg_sar[15:8]);
   flipflop_374 reg_sar_lo (db[7:0], 0, nwsar, reg_sar[7:0]);

   // The mode register.
   //
   // mr[3:0]   height of character in scanlines (1-15).
   wire [15:0] 	      reg_mr;	// the Mode Register (MR)

   flipflop_374 reg_mr_hi (db[15:8], 0, nwmr, reg_mr[15:8]);
   flipflop_374 reg_mr_lo (db[7:0], 0, nwmr, reg_mr[7:0]);

   // Convenience designations
   
   wire [1:0] 	      mr_char_height;
   
   assign mr_char_height = reg_mr[1:0];

   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // PIXEL CLOCK
   //
   ///////////////////////////////////////////////////////////////////////////////

   always begin
      #pixel_clock pxclk = ~pxclk;
   end


   ///////////////////////////////////////////////////////////////////////////////
   //
   // HORIZONTAL TIMING
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [3:0] _pq;
   // Use a 393 because it can run much faster (~50 MHz) than the
   // typical 193 (~27 MHz).
   counter_393h pixel_counter (pxclk, nreset, _pq);

   // The FALLING edge of _pq[2] is the end of an 8-pulse block (one
   // character column).
   wire       colclk, ncolclk;
   assign colclk = _pq[2];
   assign #6 ncolclk = ~colclk;
   
   wire [7:0] hct;
   counter_590 col_counter (colclk, 0, nreset & uhtot, ncolclk, 0, hct, );

   // // Generate the horizontal position (character cell)
   // wire 	      pq2_delayed;
   // assign #10 pq2_delayed = pq[2];
   // counter_590 cnt_col (pq[2], nven, nreset & uhtot, pq2_delayed, 0, hc, );

   // // Generate the vertical position
   // wire 	      rowclk, rowclk_delayed, vtot_delayed, rco;
   // assign #10 rowclk_delayed = rowclk;
   // assign #10 vtot_delayed = ~vtot;
   // flipflop_112h ff_rowcount (0, 0, 0, hss, hse, , rowclk);
   // //counter_590 cnt_row (rowclk, 0, nreset & vtot, rowclk_delayed, 0, vc[7:0], rco);
   // counter_393h cnt_row1 (rowclk, nreset & vtot, vc[3:0]);
   // counter_393h cnt_row2 (vc[3], nreset & vtot, vc[7:4]);
   // counter_393h cnt_row3 (vc[7], nreset & vtot, vc[11:8]);
   
   // Horizontal clock comparators (front porch, sync start, sync end, total) The
   // timings come from David Kuschel's 'VGA' implementation. They provide
   // a resolution of 640x400.

   //
   // FP | IMAGE DATA | BP | 
   // ---------------------------------------------------------------------------------------------------
   wire       uhfp, uhss, uhse, uhtot;
   // comparator_688 cmp_hfp (hct, 4, 0, uhfp);
   // comparator_688 cmp_hss (hct, 84, 0, uhss);
   // comparator_688 cmp_hse (hct, 87, 0, uhse);
   // comparator_688 cmp_htot (hct, 99, 0, uhtot);
   comparator_688 cmp_hss (hct, 80, 0, uhss);
   comparator_688 cmp_hse (hct, 83, 0, uhse);
   comparator_688 cmp_hfp (hct, 95, 0, uhfp);
   comparator_688 cmp_htot (hct, 99, 0, uhtot);


   // Temporary
   // wire 	      hfp, hss, hse, htot;
   // assign hfp = uhfp;
   // assign hss = uhss;
   // assign hse = uhse;
   // assign htot = uhtot;

   wire 	      nhven, hven;
   flipflop_74h hven_ff (1, htot, 1, hss, nhven, hven);

   wire 	      hsync, nhsync;
   flipflop_74h hsync_ff (0, 0, hss, hse, hsync, nhsync);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VIDEO ENABLE
   //
   ///////////////////////////////////////////////////////////////////////////////

   or #6 nven_gen(nven, hven, vven);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERTICAL TIMING
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [15:0] vct;
   wire       nhsync_delayed;
   wire       vct_rco;
   assign #20 nhsync_delayed = nhsync;
   counter_590 row_counter0 (nhsync, 0, nreset & vtot, hsync, 0, vct[7:0], vct_rco);
   counter_590 row_counter1 (vct_rco, 0, nreset & vtot, hsync, 0, vct[15:8], );

   // Vertical clock comparators (front porch, sync start, sync end, total) The
   // timings come from David Kuschel's 'VGA' implementation. They provide a
   // resolution of 640x400.
   wire 	      uvfp, uvss, uvse, uvtot;
   // comparator_688 cmp_vfp (vct[7:0], 38, vct[8], uvfp); // 38 = 0:0010:1000
   // comparator_688 cmp_vss ({vct[8:7], vct[5:0]}, 8'b11110110, vct[6], uvss); // 438 = 1:1011:0110
   // comparator_688 cmp_vse ({vct[8:7], vct[5:0]}, 8'b11111111, vct[6], uvse); // 447 = 1:1011:1111
   // comparator_688 cmp_vtot ({vct[8:6], vct[4:0]}, 8'b11100001, vct[5], uvtot); // 449 = 1:1100:0001


   //       8 7654 3210
   // -------------------------------------------------------------------------------
   // 400 = 1:1001:0000   end of image, start of vsync, IRQ.
   // 409 = 1:1001:1001   end of vsync
   // 411 = 1:1001:1011   end of frame, start of front porch of next frame.
   // 449 = 1:1100:0001   end of front porch of next frame. Image starts.
   
   comparator_688 cmp_vss ({vct[8:7], vct[5:0]}, 8'b11010000, vct[6], uvss); // 400 = 1:1001:0000
   comparator_688 cmp_vse ({vct[8:7], vct[5:0]}, 8'b11011001, vct[6], uvse); // 409 = 1:1001:1001
   comparator_688 cmp_vfp ({vct[8:7], vct[5:0]}, 8'b11011011, vct[6], uvfp); // 411 = 1:1001:1011
   comparator_688 cmp_vtot({vct[8:6], vct[4:0]}, 8'b11100001, vct[5], uvtot); // 449 = 1:1100:0001

   // Temporary
   // wire 	      vfp, vss, vse, vtot;
   // assign vfp = uvfp;
   // assign vss = uvss;
   // assign vse = uvse;
   // assign vtot = uvtot;

   wire 	       nvven, vven;
   flipflop_74h vven_ff (1, vtot, 1, vss, nvven, vven);

   wire 	       vsync, nvsync;
   flipflop_74h vsync_ff (0, 0, vss, vse, vsync, nvsync);
   
   wire 	       row0, nrow0;
   flipflop_74h row0_ff (0, rowclk, nvven, 1, row0, nrow0);
   
   ///////////////////////////////////////////////////////////////////////////////
   //
   // TIMING BUFFER
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Buffer sync comparisons
   wire 	      hfp, hss, hse, htot;
   wire 	      vfp, vss, vse, vtot;
   flipflop_374 cmp_buf({uhfp, uhss, uhse, uhtot, uvfp, uvss, uvse, uvtot}, 0, ncolclk,
   			{hfp, hss, hse, htot, vfp, vss, vse, vtot});



   ///////////////////////////////////////////////////////////////////////////////
   //
   // CHARACTER ROW COUNTER AND SCREEN ROW CLOCK
   //
   ///////////////////////////////////////////////////////////////////////////////

   //wire [3:0] 	      csc;	// Character scanline count
   wire 	      rowclk;
   //counter_393h char_scanline_cnt (nhsync, vfp, csc);
   mux_253h char_height_mux (mr_char_height, {vct[3:1], nhsync}, 0, rowclk);
   // wire 	      foo;
   //comparator_688 char_height_cmp({4'b0000, vct[3:0]}, {4'b0000, mr_char_height}, nven, foo);


   ///////////////////////////////////////////////////////////////////////////////
   //
   // ADDRESS GENERATION
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [15:0] 	      vhaddr, laddr;
   wire 	      charclk;

   or #6 (charclk, nven, ncolclk);

   // The address offset counter
   wire [2:0] 	      hagc;
   counter_193 cnt_haddrgen0 (reset, hfp, laddr[3:0], charclk, 0, vhaddr[3:0], hagc[0], );
   counter_193 cnt_haddrgen1 (reset, hfp, laddr[7:4], hagc[0], 0, vhaddr[7:4], hagc[1], );
   counter_193 cnt_haddrgen2 (reset, hfp, laddr[11:8], hagc[1], 0, vhaddr[11:8], hagc[2], );
   counter_193 cnt_haddrgen3 (reset, hfp, laddr[15:12], hagc[2], 0, vhaddr[15:12], , );

   // The line start address counter
   wire [2:0] 	      lagc;
   wire 	      lstb;
   wire [9:0] 	      _lstbq;

   wire 	      lstep;
   or #6 (lstep, rowclk, row0);

   counter_4017 cnt_5pulse (colclk & nvven, _lstbq[9], reset | lstep, _lstbq, );
   nor #6 (lstb, _lstbq[0], _lstbq[2], _lstbq[4], _lstbq[6], _lstbq[8]);

   assign laddr[3:0] = 4'b0000;
   //assign lstb = rowclk;
   
   //counter_193 cnt_laddrgen0 (reset, nvsync, reg_sar[3:0], rowclk, 0, laddr[3:0], lagc[0], );
   counter_193 cnt_laddrgen1 (reset, nvsync, reg_sar[7:4], lstb, 0, laddr[7:4], lagc[1], );
   counter_193 cnt_laddrgen2 (reset, nvsync, reg_sar[11:8], lagc[1], 0, laddr[11:8], lagc[2], );
   counter_193 cnt_laddrgen3 (reset, nvsync, reg_sar[15:12], lagc[2], 0, laddr[15:12], , );
   
   
   // // RGB signal inhibit
   // wire 	      rgben;
   // flipflop_112h ff_rgben (0, 0, 0, hfp, hss, rgben, );
   
   // // Horizontal sync
   // wire 	      nhsync;
   // flipflop_112h ff_hsync (0, 0, 0, hss, hse, hsync, nhsync);

   // // Vertical sync
   // wire 	      nvsync;
   // flipflop_112h ff_vsync (0, 0, 0, vss, vse, vsync, nvsync);


endmodule // video

// End of file.
