`define UART_ADDR_WIDTH 3 
`define UART_DATA_WIDTH 8 
 
// Register addresses 
`define UART_REG_RB		3'd0	// RBR - receiver buffer 
`define UART_REG_TR     3'd0	// TBR - transmitter 
`define UART_REG_IE		3'd1	// IER - Interrupt enable 
`define UART_REG_II     3'd2	// IIR - Interrupt identification 
`define UART_REG_FC     3'd2	// FCR - FIFO control 
`define UART_REG_LC		3'd3	// LCR - Line Control 
`define UART_REG_MC		3'd4	// MCR - Modem control 
`define UART_REG_LS     3'd5	// LSR - Line status 
`define UART_REG_MS     3'd6	// MSR - Modem status 
`define UART_REG_SR     3'd7	// SCR - Scratch register 
`define UART_REG_DL1	3'd0	// Divisor latch bytes (1-2) 
`define UART_REG_DL2	3'd1 
 
// IER - Interrupt Enable register bits 
`define UART_IE_RDA		0		// Received Data available interrupt 
`define UART_IE_THRE	1		// Transmitter Holding Register empty interrupt 
`define UART_IE_RLS		2		// Receiver Line Status Interrupt 
`define UART_IE_MS		3		// Modem Status Interrupt 
 
// IIR - Interrupt Identification register bits 
`define UART_II_IP		0		// Interrupt pending when 0 
`define UART_II_II		3:1		// Interrupt identification 
 
// IIR - Interrupt identification values for bits 3:1 
`define UART_II_RLS		3'b011	// Receiver Line Status 
`define UART_II_RDA		3'b010	// Receiver Data available 
`define UART_II_TI		3'b110	// Timeout Indication 
`define UART_II_THRE	3'b001	// Transmitter Holding Register empty 
`define UART_II_MS		3'b000	// Modem Status 
 
// FCR - FIFO Control Register bits 
`define UART_FC_TL		1:0		// Trigger level 
 
// FCR - FIFO trigger level values 
`define UART_FC_1		2'b00 
`define UART_FC_8		2'b01 
`define UART_FC_16		2'b10 
`define UART_FC_28		2'b11 
 
// LCR - Line Control register bits 
`define UART_LC_BITS	1:0		// bits in character 
`define UART_LC_SB		2		// stop bits 
`define UART_LC_PE		3		// parity enable 
`define UART_LC_EP		4		// even parity 
`define UART_LC_SP		5		// stick parity 
`define UART_LC_BC		6		// Break control 
`define UART_LC_DL		7		// Divisor Latch access bit 
 
// MCR - Modem Control register bits 
`define UART_MC_DTR		0 
`define UART_MC_RTS		1 
`define UART_MC_OUT1	2 
`define UART_MC_OUT2	3 
`define UART_MC_LB		4		// Loopback mode 
`define UART_MC_AFC		5		// !!NEW -- auto flow control enable 
 
// LSR - Line Status Register bits 
`define UART_LS_DR		0		// Data ready 
`define UART_LS_OE		1		// Overrun Error 
`define UART_LS_PE		2		// Parity Error 
`define UART_LS_FE		3		// Framing Error 
`define UART_LS_BI		4		// Break interrupt 
`define UART_LS_TFE		5		// Transmit FIFO is empty 
`define UART_LS_TE		6		// Transmitter Empty indicator 
`define UART_LS_EI		7		// Error indicator 
 
`define UART_LS_ERR		4:1 
 
// MSR - Modem Status Register bits 
`define UART_MS_DCTS	0		// Delta signals 
`define UART_MS_DDSR	1 
`define UART_MS_TERI	2 
`define UART_MS_DDCD	3 
`define UART_MS_CCTS	4		// Complement signals 
`define UART_MS_CDSR	5 
`define UART_MS_CRI		6 
`define UART_MS_CDCD	7 
 
`define MSR_CSIGS		7:4 
`define MSR_DSIGS		3:0 
 
// FIFO parameter defines 
 
`define UART_FIFO_WIDTH		8 
`define UART_FIFO_DEPTH		16 
`define UART_FIFO_POINTER_W	4 
`define UART_FIFO_COUNTER_W	5 
// receiver fifo has width 11 because it has break, parity and framing error bits 
`define UART_FIFO_REC_WIDTH	11 
 
`define UART_RF_FE		8 
`define UART_RF_PE		9 
`define UART_RF_BI		10 
