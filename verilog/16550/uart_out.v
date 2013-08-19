// synopsys translate_off 
`include "timescale.v" 
// synopsys translate_on 
 
`include "uart_defines.v" 
 
module uart_out 
( 
	clk, 
	reset, 
	enable, 
	data_len, stop2, par_ena, par_even, par_stk, 
	afc_cts, serial_out, 
	tf_reset, 
	tx_data_valid, 
	tx_data, 
	tx_empty, 
	tf_pop 
); 
 
input			clk; 
input			reset; 
input			enable; 
 
input [1:0]		data_len;			// data bits - 1 
input			stop2, par_ena, par_even, par_stk; 
 
input			afc_cts; 
output			serial_out; 
output			tx_empty; 
output			tf_pop; 
 
input			tf_reset; 
input			tx_data_valid; 
input [7:0]		tx_data; 
 
wire			serial_out; 
reg				tx_empty; 
reg				tf_pop; 
 
/////////////////////////////////// 
 
reg				data_parity; 
reg				tx_parity; 
reg [3:0]		bit_cnt; 
reg [8:0]		tx_shift; 
reg [7:0]		tx_shadow; 
reg [1:0]		tx_state; 
 
reg				tx_frame; 
reg [3:0]		cnt16; 
reg				bit_pulse, half_pulse; 
 
parameter S_TX_IDLE		= 2'd0; 
parameter S_TX_START	= 2'd1; 
parameter S_TX_BYTE		= 2'd2; 
parameter S_TX_STOP2	= 2'd3; 
 
assign serial_out = tx_shift[0]; 
 
always @( data_len or tx_shadow ) 
	case ( data_len ) 
		2'b00 : data_parity = ^tx_shadow[4:0]; 
		2'b01 : data_parity = ^tx_shadow[5:0]; 
		2'b10 : data_parity = ^tx_shadow[6:0]; 
		2'b11 : data_parity = ^tx_shadow[7:0]; 
	endcase 
 
always @( par_stk or par_even or data_parity ) 
	case ( { par_stk, par_even } ) 
		2'b00 : tx_parity = ~data_parity;	// odd parity 
		2'b01 : tx_parity = data_parity;	// even parity 
		2'b10 : tx_parity = 1'b1;			// '1' 
		2'b11 : tx_parity = 1'b0;			// '0' 
	endcase 
 
always @( posedge clk or posedge reset ) 
begin 
	if( reset ) 
	begin 
		cnt16 &lt;= #1 4'd13; 
		bit_pulse &lt;= #1 1'b0; 
		half_pulse &lt;= #1 1'b0; 
	end 
	else if( enable ) 
	begin 
		if( !tx_frame ) 
		begin 
			cnt16 &lt;= #1 4'd13; 
			bit_pulse &lt;= #1 1'b0; 
			half_pulse &lt;= #1 1'b0; 
		end 
		else 
		begin 
			bit_pulse &lt;= #1 (cnt16==4'd0); 
			half_pulse &lt;= #1 (cnt16==4'd8); 
			cnt16 &lt;= #1 cnt16 - 4'd1; 
		end 
	end 
end 
 
always @(posedge clk or posedge reset) 
	begin 
	if (reset) 
	begin 
		tx_empty	&lt;= #1 1'b1; 
		tx_state	&lt;= #1 S_TX_IDLE; 
		tf_pop		&lt;= #1 1'b0; 
		tx_frame	&lt;= #1 1'b0; 
		tx_shift	&lt;= #1 9'b111111111; 
	end 
	else if (enable) 
	begin 
		case (tx_state) 
		S_TX_IDLE: 
			if ( tx_data_valid && !tf_reset ) 
			begin 
				tx_empty &lt;= #1 1'b0; 
				if( afc_cts ) 
				begin 
					tx_shadow &lt;= #1 tx_data; 
					tx_shift[0] &lt;= #1 1'b0; 
					tf_pop &lt;= #1 1'b1; 
					tx_state &lt;= #1 S_TX_START; 
				end 
			end 
 
		S_TX_START : 
		begin 
			tx_frame &lt;= #1 1'b1; 
			if (bit_pulse) 
			begin 
				case ( {par_ena, data_len} ) 
				3'b000 : begin bit_cnt &lt;= #1 4'd5;	tx_shift &lt;= #1 {4'b1111, tx_shadow[4:0]};	end	// 5+stop 
				3'b001 : begin bit_cnt &lt;= #1 4'd6;	tx_shift &lt;= #1 {3'b111, tx_shadow[5:0]};	end	// 6+stop 
				3'b010 : begin bit_cnt &lt;= #1 4'd7;	tx_shift &lt;= #1 {2'b11, tx_shadow[6:0]};	end	// 7+stop 
				3'b011 : begin bit_cnt &lt;= #1 4'd8;	tx_shift &lt;= #1 {1'b1, tx_shadow[7:0]};	end	// 8+stop 
				3'b100 : begin bit_cnt &lt;= #1 4'd6;	tx_shift &lt;= #1 {3'b111, tx_parity, tx_shadow[4:0]};	end	// 5+parity+stop 
				3'b101 : begin bit_cnt &lt;= #1 4'd7;	tx_shift &lt;= #1 {2'b11, tx_parity, tx_shadow[5:0]};	end	// 6+parity+stop 
				3'b110 : begin bit_cnt &lt;= #1 4'd8;	tx_shift &lt;= #1 {1'b1, tx_parity, tx_shadow[6:0]};		end	// 7+parity+stop 
				3'b111 : begin bit_cnt &lt;= #1 4'd9;	tx_shift &lt;= #1 {tx_parity, tx_shadow[7:0]};		end	// 8+parity+stop 
				endcase 
				tx_state &lt;= #1 S_TX_BYTE; 
			end 
		end 
 
		S_TX_BYTE : 
			if (bit_pulse) 
			begin 
				tx_shift[8:0] &lt;= #1 {1'b1,tx_shift[8:1]}; 
				if( ~|bit_cnt ) 
				begin 
					if( stop2 ) 
						tx_state &lt;= #1 S_TX_STOP2; 
					else if( !tx_data_valid || tf_reset || !afc_cts ) 
					begin 
						tx_empty &lt;= #1 !tx_data_valid | tf_reset; 
						tx_frame &lt;= #1 1'b0; 
						tx_state &lt;= #1 S_TX_IDLE; 
					end 
					else 
					begin 
						tx_shadow &lt;= #1 tx_data; 
						tf_pop &lt;= #1 1'b1; 
						tx_shift[0] &lt;= #1 1'b0; 
						tx_frame &lt;= #1 1'b0; 
						tx_state &lt;= #1 S_TX_START; 
					end 
				end 
				bit_cnt &lt;= #1 bit_cnt - 1'b1; 
			end 
 
		S_TX_STOP2 : 
			case( {data_len, half_pulse, bit_pulse} ) 
			4'b0010, 4'b0101, 4'b1001, 4'b1101 : 
				if( !tx_data_valid || !afc_cts ) 
				begin 
					tx_empty &lt;= #1 !tx_data_valid | tf_reset; 
					tx_frame &lt;= #1 1'b0; 
					tx_state &lt;= #1 S_TX_IDLE; 
				end 
				else 
				begin 
					tx_shadow &lt;= #1 tx_data; 
					tf_pop &lt;= #1 1'b1; 
					tx_shift[0] &lt;= #1 1'b0; 
					tx_frame &lt;= #1 1'b0; 
					tx_state  &lt;= #1 S_TX_START; 
				end 
			default: 
				; 
			endcase 
 
		default : // should never get here 
		begin 
			tx_empty &lt;= #1 1'b1; 
			tx_frame &lt;= #1 1'b0; 
			tx_shift &lt;= #1 9'b111111111; 
			tx_state &lt;= #1 S_TX_IDLE; 
		end 
		endcase 
	end // end if enable 
	else 
		tf_pop &lt;= #1 1'b0;  // tf_pop must be 1 cycle width 
end // transmitter logic 
 
endmodule 
