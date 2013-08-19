// synopsys translate_off 
`include "timescale.v" 
// synopsys translate_on 
 
`include "uart_defines.v" 
 
module uart_top 
( 
	// bus signals 
	pclk_i, preset_i, 
	psel_i, paddr_i, 
	pread_i, pwrite_i, 
	prdata, pwdata, 
 
	int_o,	// interrupt request 
 
	// UART	signals 
	stx_pad_o, srx_pad_i, rts_pad_o, cts_pad_i, 
 
	// Modem signals 
	dtr_pad_o, dsr_pad_i, dcd_pad_i, ri_pad_i 
); 
 
input			pclk_i; 
input 			preset_i; 
input [2:0]		paddr_i; 
input 			psel_i; 
input			pread_i; 
input 			pwrite_i; 
 
output [7:0] 	prdata; 
input [7:0]		pwdata; 
 
output			int_o; 
 
// UART	signals 
input			srx_pad_i; 
output			stx_pad_o; 
output			rts_pad_o; 
input			cts_pad_i; 
 
// modem signals 
input			dsr_pad_i, dcd_pad_i, ri_pad_i; 
output			dtr_pad_o; 
 
wire [7:0]		prdata; 
wire			int_o; 
wire 			stx_pad_o; 
wire 			rts_pad_o; 
wire			dtr_pad_o; 
 
wire            wr_ack,rd_ack; 
 
/////////////////////////// 
 
assign wr_ack = psel_i & (~pwrite_i); 
assign rd_ack = psel_i & (~pread_i); 
 
uart_core	uart 
( 
	.clk_i		(pclk_i), 
	.reset_i	(preset_i), 
	.addr_i		(paddr_i), 
	.data_i		(pwdata), 
	.data_o		(prdata), 
	.rd_i		(rd_ack), 
	.we_i		(wr_ack), 
	.stx_pad_o	(stx_pad_o), 
	.srx_pad_i	(srx_pad_i), 
	.rts_pad_o	(rts_pad_o), 
	.cts_pad_i	(cts_pad_i), 
	.dtr_pad_o	(dtr_pad_o), 
	.dsr_pad_i	(dsr_pad_i), 
	.dcd_pad_i	(dcd_pad_i), 
	.ri_pad_i	(ri_pad_i), 
	.int_o		(int_o) 
); 
 
endmodule 
