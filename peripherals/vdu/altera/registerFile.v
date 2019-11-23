`ifndef registerFile_v
 `define registerFile_v

 //`include "demux16.v"

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


module registerFile(nreset, devsel, nw, nr, ab, db, altmode,
		    vduen, irqscl, irqvs,
		    cs2,
		    col40,
		    crh,
		    scl, sen,
		    vscr,
		    hscr,
		    cbg, cfg, cbc,
		    sar,
		    mar,
		    car,
		    incx, incy, har
		    );
   
 `include "registerNames.v"
   
   input 		nreset;
   input 		devsel;
   input 		nw;
   input 		nr;
   input [3:0] 		ab;
   
   inout [15:0] 	db;

   input 		altmode;
   input 		incx, incy;
   
   output 		vduen;
   output 		irqscl;
   output 		irqvs;
   output [1:0] 	cs2;
   output 		col40;
   output [2:0] 	crh;
   output [7:0] 	scl;
   output 		sen;
   output [3:0] 	vscr;
   output [2:0] 	hscr;
   output [5:0] 	cbg, cfg;
   output [1:0] 	cbc;
   output [15:0] 	sar, mar, car, har;

   wire [1:0] 		cs2_0, cs2_1;
   wire 		col40_0, col40_1;
   wire [2:0] 		crh_0, crh_1;
   wire [3:0] 		vscr_0, vscr_1;
   wire [2:0] 		hscr_0, hscr_1;
   wire [15:0] 		sar_0, sar_1, mar_0, mar_1, car;
   
   wire [15:0] 		regen;
   demux16 regsel(ab, devsel == 1'b1 && nw == 1'b0, regen);

   // MCR0
   register #1 regmcr0a(regen[REG_MCR0], nreset, db[15], vduen);
   register #1 regmcr0b(regen[REG_MCR0], nreset, db[7], irqscl);
   register #1 regmcr0c(regen[REG_MCR0], nreset, db[6], irqvs);
   register #2 regmcr0d(regen[REG_MCR0], nreset, db[5:4], cs2_0);
   register #1 regmcr0e(regen[REG_MCR0], nreset, db[3], col40_0);
   register #3 regmcr0f(regen[REG_MCR0], nreset, db[2:0], crh_0);
   
   // MCR1
   register #8 regmcr1a(regen[REG_MCR1], nreset, db[15:8], scl);
   register #1 regmcr1b(regen[REG_MCR1], nreset, db[7], sen);
   register #2 regmcr1c(regen[REG_MCR1], nreset, db[5:4], cs2_1);
   register #1 regmcr1d(regen[REG_MCR1], nreset, db[3], col40_1);
   register #3 regmcr1e(regen[REG_MCR1], nreset, db[2:0], crh_1);

   // SCR0
   register #4 regscr0a(regen[REG_SCR0], nreset, db[7:4], vscr_0);
   register #3 regscr0b(regen[REG_SCR0], nreset, db[2:0], hscr_0);

   // SCR1
   register #4 regscr1a(regen[REG_SCR1], nreset, db[7:4], vscr_1);
   register #3 regscr1b(regen[REG_SCR1], nreset, db[2:0], hscr_1);

   // CCR
   register #6 regccra(regen[REG_CCR], nreset, db[13:8], cbg);
   register #2 regccrb(regen[REG_CCR], nreset, db[7:6], cbc);
   register #6 regccrc(regen[REG_CCR], nreset, db[5:0], cfg);

   // Other simple registers
   register #16 regsar0(regen[REG_SAR0], nreset, db, sar_0);
   register #16 regsar1(regen[REG_SAR1], nreset, db, sar_1);
   register #16 regmar0(regen[REG_MAR0], nreset, db, mar_0);
   register #16 regmar1(regen[REG_MAR1], nreset, db, mar_1);
   register #16 regcar(regen[REG_CAR], nreset, db, car);

   // The HAR is a pair of (9,7)-bit counters
   counter193 #9 hary(incy, nreset, regen[REG_HAR], db[15:7], har[15:7]);
   counter193 #7 harx(incx, nreset, regen[REG_HAR], db[6:0], har[6:0]);

   // Multiplex
   assign cs2 = altmode ? cs2_1 : cs2_0;
   assign col40 = altmode ? col40_1 : col40_0;
   assign crh = altmode ? crh_1 : crh_0;
   assign vscr = altmode ? vscr_1 : vscr_0;
   assign hscr = altmode ? hscr_1 : hscr_0;
   assign sar = altmode ? sar_1 : sar_0;
   assign mar = altmode ? mar_1 : mar_0;

endmodule // registerFile


`endif //  `ifndef registerFile_v


// End of file.