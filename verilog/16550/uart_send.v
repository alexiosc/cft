// synopsys translate_off 
`include "timescale.v" 
// synopsys translate_on 
 
`include "uart_defines.v" 
 
module uart_send 
( 
	clk, 
	reset, 
	r_lcr, 
	enable, 
	afc_cts, 
	serial_out, 
	tf_push, 
	tf_reset, 
	tf_empty, 
	tf_full, 
	tx_empty, 
	tf_datain 
); 
 
input			clk; 
input			reset; 
input [7:0]		r_lcr; 
input			enable; 
input			afc_cts; 
output 			serial_out; 
input			tf_push; 
input			tf_reset; 
output			tf_empty; 
output			tf_full; 
output			tx_empty; 
input [7:0]		tf_datain; 
 
wire			serial_out; 
wire			tf_empty; 
wire			tf_full; 
wire			tx_empty; 
 
/////////////////////////////////// 
 
wire [4:0]		tf_count; 
wire [7:0]		tf_dataout; 
wire			fifo_push; 
wire			tf_pop; 
 
parameter S_TX_IDLE		= 2'd0; 
parameter S_TX_START	= 2'd1; 
parameter S_TX_BYTE		= 2'd2; 
parameter S_TX_STOP2	= 2'd3; 
 
//assign fifo_push = tf_push & ~tf_full; 
 
//====fifo write signal generate==== 
wire            var_push; 
reg             var_push1; 
reg				var_push2; 
 
always @(posedge clk or posedge reset) 
begin 
	if (reset) 
		var_push1 <= 1'b0; 
	else 
		var_push1 <= tf_push; 
end 
 
always @(posedge clk or posedge reset) 
begin 
	if (reset) 
		var_push2 <= 1'b0; 
	else 
		var_push2 <= var_push1; 
end 
 
assign var_push = {var_push1,var_push2} == 2'b10 ? 1'b1 : 1'b0 ; 
assign fifo_push = var_push & ~tf_full; 
//===David add ending=== 
 
scfifo	tx_fifo 
( 
	.rdreq (tf_pop), 
	.sclr (tf_reset), 
	.clock (clk), 
	.wrreq (fifo_push), 
	.data (tf_datain), 
	.usedw (tf_count), 
	.empty (tf_empty), 
	.q (tf_dataout), 
	.full (tf_full), 
	.aclr (reset) 
	// synopsys translate_off 
	, 
	.almost_empty (), 
	.almost_full () 
	// synopsys translate_on 
); 
defparam 
	tx_fifo.lpm_width = 8, 
	tx_fifo.lpm_numwords = 32, 
	tx_fifo.lpm_widthu = 5, 
	tx_fifo.intended_device_family = "Cyclone II", 
	tx_fifo.lpm_type = "scfifo", 
	tx_fifo.lpm_showahead = "ON", 
	tx_fifo.overflow_checking = "ON", 
	tx_fifo.underflow_checking = "ON", 
	tx_fifo.use_eab = "ON", 
	tx_fifo.add_ram_output_register = "ON", 
	tx_fifo.lpm_hint = "RAM_BLOCK_TYPE=M4K"; 
 
uart_out uart_shiftout 
( 
	.clk			(clk), 
	.reset			(reset), 
	.enable			(enable), 
	.data_len		(r_lcr[1:0]), 
	.stop2			(r_lcr[`UART_LC_SB]), 
	.par_ena		(r_lcr[`UART_LC_PE]), 
	.par_even		(r_lcr[`UART_LC_EP]), 
	.par_stk		(r_lcr[`UART_LC_SP]), 
	.afc_cts		(afc_cts), 
	.serial_out		(serial_out), 
	.tf_reset		(tf_reset), 
	.tx_data_valid	(~tf_empty), 
	.tx_data		(tf_dataout), 
	.tx_empty		(tx_empty), 
	.tf_pop			(tf_pop) 
); 
 
endmodule 
