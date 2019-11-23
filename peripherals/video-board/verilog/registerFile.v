`ifndef registerFile_v
 `define registerFile_v

 `include "register.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// REGISTER FILE
//
// Function: a simple n-bit registerFile with an active-low asynchronous
// clear signal. By default, this is a 4-bit registerFile but it can be configured
// for any number of bits. Here's a 11-bit registerFile:
//
// registerFile #11 foo(clk, nclr, q);
//
///////////////////////////////////////////////////////////////////////////////


module registerFile(nreset, devsel, nw, nr, ab, db,
		    /*vduen, irqscl, irqvs,
		    cs2_0, cs2_1,
		    col40_0, col40_1,
		    crh_0, crh_1,
		    scl, sen,
		    vscr_0, vscr_1,
		    hscr_0, hscr_1,
		    cbg, cfg, cbc,*/
		    sar_0, sar_1,
		    mar_0, mar_1,
		    car
		    );

`include "registerNames.v"

   input 		nreset;
   input 		devsel;
   input 		nw;
   input 		nr;
   input [3:0] 		ab;

   inout [15:0] 	db;

   // output reg 		vduen;
   // output reg 		irqscl;
   // output reg 		irqvs;
   // output reg [1:0] 	cs2_0, cs2_1;
   // output reg 		col40_0, col40_1;
   // output reg [2:0] 	crh_0, crh_1;
   // output reg [7:0] 	scl;
   // output reg 		sen;
   // output reg [3:0] 	vscr_0, vscr_1;
   // output reg [2:0] 	hscr_0, hscr_1;
   // output reg [5:0] 	cbg, cfg;
   // output reg [1:0] 	cbc;
   output [15:0] 	sar_0, sar_1, mar_0, mar_1, car;

   wire [15:0] 		regen;
   demux16 foo1(ab, devesel, regen);
   register #16 regsar0(regen[REG_SAR0], nreset, db, sar_0);
   register #16 regsar1(regen[REG_SAR1], nreset, db, sar_1);
   register #16 regmar0(regen[REG_MAR0], nreset, db, mar_0);
   register #16 regmar1(regen[REG_MAR1], nreset, db, mar_1);
   register #16 regcar(regen[REG_CAR], nreset, db, car);
endmodule // registerFile

	

//    always @(posedge nw, negedge nreset) begin

//       // Reset code for registers. Just the basics to disable the VDU.
//       if (nreset == 1'b0) begin

// `ifndef TEST
// 	 //vduen <= 0;		// Disable VDU
// `else
// 	 //vduen <= 1;		// For testing, enable VDU early
// `endif
// 	 // irqscl <= 0;		// No IRQs on SCL
// 	 // irqvs <= 0;		// NO IRQs on VSYNC

//       end else if (devsel == 1'b1 && nw == 1'b1) begin
// 	 if (ab == REG_SAR0) sar_0 <= db;
// 	 //if (ab == REG_SAR1) sar_1 <= db;
// 	 //if (ab == REG_MAR0) mar_0 <= db;
// 	 //if (ab == REG_MAR1) mar_1 <= db;

// 	 // if (nreset == 1'b0)
// 	 // case (ab[3:0] )
// 	 //   REG_MCR0: begin	// Enable, top mode, interrupt
// 	 //      vduen <= db[15];
// 	 //      irqscl <= db[7];
// 	 //      irqvs <= db[6];
// 	 //      cs2_0 <= db[5:4];
// 	 //      col40_0 <= db[3];
// 	 //      crh_0 <= db[2:0];
// 	 //   end

// 	 //   REG_MCR1: begin	// Split screen, bottom mode
// 	 //      scl <= db[15:8];
// 	 //      sen <= db[15:7];
// 	 //      cs2_1 <= db[5:4];
// 	 //      col40_1 <= db[3];
// 	 //      crh_1 <= db[2:0];
// 	 //   end

// 	 //   REG_SCR0: begin	// Top smooth scroll
// 	 //      vscr_0 <= db[7:4];
// 	 //      hscr_0 <= db[2:0];
// 	 //   end
	   
// 	 //   REG_SCR1: begin	// Bottom smooth scroll
// 	 //      vscr_1 <= db[7:4];
// 	 //      hscr_1 <= db[2:0];
// 	 //   end

// 	 //   REG_CCR: begin	// Cursor control (fg, bg, blink)
// 	 //      cbg <= db[13:8];
// 	 //      cbc <= db[7:6];
// 	 //      cfg <= db[5:0];
// 	 //   end

// 	   // REG_CMD: implemented below (host memory interface)

// 	   // 16-bit wide regs
// 	   // REG_SAR0: sar_0 <= db; // Top start address
// 	   // REG_SAR1: sar_1 <= db; // Bottom start address
// 	   // REG_MAR0: mar_0 <= db; // Top modulo address
// 	   // REG_MAR1: mar_1 <= db; // Bottom modulo address
// 	   // REG_CAR: car <= db;	  // Cursor address
// 	   //REG_HAR: har <= db;  // Host address (dealt with below)
// 	   //REG_CPORT: cport <= db; // C port value (dealt with below)
// 	 //endcase // case (ab[3:0])
//       end
//    end // always @ (posedge nw, negedge nreset)

// endmodule // registerFile



module register16(rst, d, clk, q);
   input rst;
   input [15:0] d;
   input 	clk;
   output reg [15:0] q;

   always @(negedge rst, posedge clk) begin
      if (rst == 1'b0) q <= 16'd0;
      else if (clk == 1'b1) q <= d;
   end
endmodule // reg16


`endif //  `ifndef registerFile_v

// End of file.
