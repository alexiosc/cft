`include "video.v"
`include "ram.v"
`include "vibrator.v"
`timescale 1ns/10ps

module video_tb();

   wire [1:0]  r, g, b;
   wire        hsync, vsync, hvideo, vvideo;
   wire        niodev1;

   reg 	       nreset, nr, nw;
   reg [15:0]  ab, db;
   wire [15:0] db_real;

   integer     i;

   assign niodev1 = ab[15:8] == 8'h1f;
   assign db_real = db;

   // Initialize all variables
   initial begin
`ifndef VIDEO_OUT
      $dumpfile ("vcd/video_tb.vcd");
      $dumpvars (0, video_tb);
`endif // VIDEO_OUT

      nw = 1;
      nr = 1;
      ab = 15'h0000;
      db = 15'h0000;

      // Reset.
      nreset <= 0;
      #300 nreset <= 1;

      // MCR0: enable VDU and set mode
      #100 ab <= 16'h01f0;
      db = {1'b1, 7'b0000000, 1'b1, 1'b1, 2'b0, 1'b0, 3'b0};
      #50 nw = 0;
      #50 nw = 1;
      #50 ab <= 0;

      // MCR1: set the SCL to allow for SCL interrupts (no split screen though)
      #100 ab <= 16'h01f1;
      db = {8'd30, 1'b0, 1'b0, 2'b00, 1'b0, 3'b0};
      #50 nw = 0;
      #50 nw = 1;
      #50 ab <= 0;

      #14990

      // // Write a character.
      // // Set HAR
      // #1000 ab <= 16'h01fa;
      // db = 256 + 3;		// location (2,2)
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;

      // // Set C
      // #1000 ab <= 16'h01fe;
      // db = {2'b00, 6'b111111, 2'b00, 6'b000000}; // black on white
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;
      
      // // CMD: Write chequered block char (14)
      // #1000 ab <= 16'h01ff;
      // db = {3'b000, 3'b000, 1'b1, 1'b1, 8'd14};
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;
      
      // // CMD: Write chequered block char (14)
      // #1000 ab <= 16'h01ff;
      // db = {3'b000, 3'b000, 1'b1, 1'b1, 8'd14};
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;
      
      // // CMD: Write chequered block char (14)
      // #1000 ab <= 16'h01ff;
      // db = {3'b000, 3'b010, 1'b0, 1'b1, 8'd14};
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;
      
      // // CMD: Write chequered block char (14)
      // #1000 ab <= 16'h01ff;
      // db = {3'b000, 3'b001, 1'b0, 1'b1, 8'd14};
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;
      
      // // CMD: Write chequered block char (14)
      // #1000 ab <= 16'h01ff;
      // db = {3'b000, 3'b010, 1'b0, 1'b1, 8'd14};
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;
      

      // // Write to the CG RAM.
      // // Set HAR
      // #1000 ab <= 16'h01fa;
      // db = 16'h0210;		// Modify &21 (!), first scanline
      // #50 nw = 0;
      // #50 nw = 1;
      // #50 ab <= 0;

      // // CMD: Update scanlines
      // for (i = 0; i < 4; i = i + 1) begin
      // 	 #650 ab <= 16'h01ff;
      // 	 db = {3'b000, 3'b011, 1'b0, 1'b1, 8'b01011111};
      // 	 #50 nw = 0;
      // 	 #50 nw = 1;
      // 	 #50 ab <= 0;

      // 	 #650 ab <= 16'h01ff;
      // 	 db = {3'b000, 3'b011, 1'b0, 1'b1, 8'b10101111};
      // 	 #50 nw = 0;
      // 	 #50 nw = 1;
      // 	 #50 ab <= 0;
      // end // for (i = 0; i < 4; i = i + 1)



      // Read characters
      // Set HAR
      #1000 ab <= 16'h01fa;
      db = 16'h0000;
      #50 nw = 0;
      #50 nw = 1;
      #50 ab <= 0;

      // Send read command
      #650 ab <= 16'h01ff;
      db = {3'b000, 3'b100, 1'b0, 1'b1, 8'b00000000};
      #50 nw = 0;
      #50 nw = 1;
      #50 ab <= 0;
      
      // Read C
      #650 ab <= 16'h01fe;
      db = 16'bzzzzzzzzzzzzzzzz;
      #50 nr = 0;
      #25 $display("READ C PLANE: %h\n", db_real);
      #25 nr = 1;
      #50 ab <= 0;
      
      // Read B port
      #650 ab <= 16'h01ff;
      db = 16'bzzzzzzzzzzzzzzzz;
      #50 nr = 0;
      #25 $display("READ B/CG PLANE: %h\n", db_real);
      #25 nr = 1;
      #50 ab <= 0;

      // Read C
      #650 ab <= 16'h01fe;
      db = 16'bzzzzzzzzzzzzzzzz;
      #50 nr = 0;
      #25 $display("READ C PLANE: %h\n", db_real);
      #25 nr = 1;
      #50 ab <= 0;
      
      // Read B port
      #650 ab <= 16'h01ff;
      db = 16'bzzzzzzzzzzzzzzzz;
      #50 nr = 0;
      #25 $display("READ B/CG PLANE: %h\n", db_real);
      #25 nr = 1;
      #50 ab <= 0;


`ifdef QUICK
      #80000 $finish;      // Terminate simulation
`else
      #20000000 $finish;      // Terminate simulation
`endif
      
      //#300000 $finish;      // Terminate simulation
   end // initial begin

`ifdef VIDEO_OUT
   always begin
      #40 $display ("RGB: %d %d %d %d %d %d %d", r, g, b, hsync, vsync, hvideo, vvideo);
   end
`endif

   // 50 MHz clock
   wire clk;
   vibrator_xo #20 clock (clk);

   // Connect DUT to test bench
   wire [16:0] pa;
   wire [23:0] pd;
   wire        ncs0, ncs1, ncs2, npr, npw, dir, irq;
   
   video v (clk, nreset,
	    ab[7:0], db_real, niodev1, nr, nw,
	    r, g, b, hsync, vsync,
	    hvideo, vvideo,
	    pa, pd, ncs0, ncs1, ncs2, npr, npw, dir, irq);

   // The B Plane and character generator RAM
   flashram #(17, 10, "img/vdu-bpcg.list", "bpcg") bpcg (pa[16:0], pd[23:16], ncs2, npw, npr);

   // The C Plane: 128kB x 16
   flashram #(17, 10, "img/vdu-cplo.list", "cplo") cplo (pa[16:0], pd[7:0], ncs1, npw, npr);
   flashram #(17, 10, "img/vdu-cphi.list", "cphi") cphi (pa[16:0], pd[15:8], ncs0, npw, npr);

endmodule // video_tb

// End of file.
