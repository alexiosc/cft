`ifndef horizontalPhase_v
 `define horizontalPhase_v
 `timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// HORIZONTAL PHASE DELAY
//
// Function: Provides a programmable delay that facilitates smooth horizontal
// scrolling. The delays are different for 40- and 80-column modes, and the
// timings are quite counter-intuitive due (I suppose) to Moiré effects.
//
// The table of values was calculated entirely empirically and is as follows:
//
// HPC 80col 40col
// ---------------
//   0   980   680
//   1   940   600    
//   2   900   520
//   3   860   440
//   4   820   360
//   5   780   280
//   6   740   200
//   7   700   120
//
// The formulae are thus:
//
// 80 cols: 40ns * (24 - hphase) + 20ns
// 40 cols: 80ns * (8 - hphase) + 40ns
//
// The half-pixel clocks (20ns for 80-col and 40ns for 40-col) come from
// inverting the pixel clock input.
//
// The remainder of the table is implemented using a presettable, 6-bit down
// counter. While NRESET (active low) is asserted, the counter is disabled, and
// preset to 24 (for 80-column modes) and 8 (for 40-column modes). When NRESET
// is deasserted, it counts down on the negative edge of PIXCLK. The count
// decreases until it reaches the value of HPC, whereupon it stops, asserting
// Q.
//
// The delays are (in decimal and binary)
//
// HPC    80col      40col
// -------------------------------------------------------------------------------
//   0    24 11000   8 01000
//   1    23 10111   7 00111
//   2    22 10110   6 00110
//   3    21 10101   5 00101
//   4    20 10100   4 00100
//   5    19 10011   3 00011
//   6    18 10010   2 00010
//   7    17 10001   1 00001
//
// Bits [3:0] are identical in both cases, bit 4 is set for 80col and
// clear for 40col.
//
///////////////////////////////////////////////////////////////////////////////

module HorizontalPhase(nreset, pixclk, col40, hpc, phase);

   input       nreset;
   input       pixclk;
   input       col40;
   input [2:0] hpc;
   
   output      phase;

   reg [5:0]   hphase;

   initial begin 
      hphase <= 0;
   end

   wire [5:0] startcount;

   // Set the start count.
   assign startcount[5] = col40 ? 1'b0 : 1'b0;
   assign startcount[4:0] = hpc == 3'd0 ? 4'd8 :
			    hpc == 3'd1 ? 4'd7 :
			    hpc == 3'd2 ? 4'd6 :
			    hpc == 3'd3 ? 4'd5 :
			    hpc == 3'd4 ? 4'd4 :
			    hpc == 3'd5 ? 4'd3 :
			    hpc == 3'd6 ? 4'd2 :
			    hpc == 3'd7 ? 4'd1 : 4'd8;

   always @(negedge pixclk, negedge nreset) begin
      if (nreset == 1'b0) begin
	 //hphase <= col40 ? 7 : 23; //  Off by one due to phase strobing
	 //hphase <= {~col40, 4'b0111};
	 hphase <= startcount;
      end else if (hphase != 5'b11111) hphase <= hphase - 1;
   end
   assign phase = hphase != 0;

endmodule // HorizontalPhase

`endif //  `ifndef horizontalPhase_v

// End of file.


// // `ifndef horizontalPhase_v
//  `define horizontalPhase_v
//  `timescale 1ns/1ps

// ///////////////////////////////////////////////////////////////////////////////
// //
// // HORIZONTAL PHASE DELAY
// //
// // Function: Provides a programmable delay that facilitates smooth horizontal
// // scrolling. The delays are different for 40- and 80-column modes, and the
// // timings are quite counter-intuitive due (I suppose) to Moiré effects.
// //
// // The table of values was calculated entirely empirically and is as follows:
// //
// // HPC 80col 40col
// // ---------------
// //   0   980   680
// //   1   940   600    
// //   2   900   520
// //   3   860   440
// //   4   820   360
// //   5   780   280
// //   6   740   200
// //   7   700   120
// //
// // The formulae are thus:
// //
// // 80 cols: 40ns * (24 - hphase) + 20ns
// // 40 cols: 80ns * (8 - hphase) + 40ns
// //
// // The half-pixel clocks (20ns for 80-col and 40ns for 40-col) come from
// // inverting the pixel clock input.
// //
// // The remainder of the table is implemented using a presettable, 6-bit down
// // counter. While NRESET (active low) is asserted, the counter is disabled, and
// // preset to 24 (for 80-column modes) and 8 (for 40-column modes). When NRESET
// // is deasserted, it counts down on the negative edge of PIXCLK. The count
// // decreases until it reaches the value of HPC, whereupon it stops, asserting
// // Q.
// //
// ///////////////////////////////////////////////////////////////////////////////

// module HorizontalPhase(nreset, pixclk, col40, hpc, phase);

//    input       nreset;
//    input       pixclk;
//    input       col40;
//    input [2:0] hpc;
   
//    output reg  phase;

//    reg [5:0]   hphase;

//    initial begin 
//       hphase <= 0;
//       phase <= 1;
//    end

//    always @(negedge pixclk, negedge nreset) begin
//       if (nreset == 1'b0) begin
// 	 hphase <= {~col40, 4'b0111};
// 	 //hphase <= col40 ? 7 : 23; //  Off by one due to phase strobing
// 	 phase <= 1;
//       end else if (hphase != hpc) hphase <= hphase - 1;
//       else phase <= 1;
//       // TODO: Reinstate this (and make them synthesise)
//       //if (hphase == (hpc + 1)) phase <= 0;
//    end
//    //assign phase = hphase == hpc;

// endmodule // HorizontalPhase

// `endif //  `ifndef horizontalPhase_v

// // End of file.