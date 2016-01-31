;;; -*- cftasm -*-
;;; Definitions for the 16550-based UARTs.
;;;

.pushns tty

;;; Base addresses

.equ TTY &60				; Base address for TTY caard

.equ DUART0 R &000			; Base address for DUART 0
.equ DUART1 R &010			; Base address for DUART 1

.equ UNIT0  R &000			; Base address of UART 0
.equ UNIT1  R &008			; Base address of UART 1

.equ TTY0 TTY DUART0 UNIT0		; Individual UART base addresses
.equ TTY1 TTY DUART0 UNIT1
.equ TTY2 TTY DUART1 UNIT0
.equ TTY3 TTY DUART1 UNIT1

;;; I/O Registers (offsets only)
	
.equ RHR #000				; -w: Receive Holding Register
.equ THR #000				; r-: Transmit Holding Register
.equ IER #001				; rw: Interrupt Enable Register
.equ FCR #010				; -w: FIFO Control Register
.equ ISR #010				; r-: Interrupt Status Register
.equ LCR #011				; rw: Line Control Register
.equ MCR #100				; r-: Modem Control Register
.equ LSR #101				; r-: Line Status Register
.equ MSR #110				; r-: Modem Status register
.equ SPR #111				; rw: Scratchpad Register

;;; Special register set (LCR7 must be set to access these).

.equ DLL #000				; rw: LSB of Divisor Latch
.equ DLM #001				; rw: MSB of Divisor Latch
.equ AFR #010				; rw: Alternate Function Register

;;; Flags for the Interrupt Enable Register

.equ IER_RHR  #-------1			; Interrupt when received data available
.equ IER_THR  #------1-			; Interrupt when ready to send data
.equ IER_RLS  #-----1--			; Interrupt on line errors
.equ IER_MSR  #----1---			; Interrupt when the MSR changes

;;; Flags for the FIFO Control Register

.equ FCR_OFF  #-------0			; Disable FIFOs
.equ FCR_ON   #-------1			; Enable FIFOs
.equ FCR_RFS  #------11			; Receiver FIFO reset (flush)
.equ FCR_TFS  #-----1-1			; Transmitter FIFO reset (flush)
.equ FCR_MD0  #---0----			; TXRDY#/RDRDY# Mode 0 (default)
.equ FCR_MD1  #---1----			; TXRDY#/RDRDY# Mode 1 ('DMA' mode)
.equ FCR_RT01 #00-----1			; Set Receive Trigger level to 1
.equ FCR_RT04 #01-----1			; Set Receive Trigger level to 4
.equ FCR_RT08 #10-----1			; Set Receive Trigger level to 8
.equ FCR_RT14 #11-----1			; Set Receive Trigger level to 14

;;; Flags for the Interrupt Status Register

.equ ISR_NINT #-------1			; No interrupts pending
.equ ISR_INT  #-------0			; Interrupt(s) pending
.equ ISR_LSR  #----0110			; Line Status interrupt
.equ ISR_RXR  #----0100			; Received data ready
.equ ISR_RXTO #----1100			; Receive data timeout
.equ ISR_TXR  #----0010			; Transmitter holding register empty
.equ ISR_MSR  #----0000			; Modem Status interrupt
.equ ISR_FIFO #11------			; FIFOs are enabled

;;; Flags for the Line Control Register

.equ LCR_5BIT #------00			; 5 bits per frame
.equ LCR_6BIT #------01			; 6 bits per frame
.equ LCR_7BIT #------10			; 7 bits per frame
.equ LCR_8BIT #------11			; 8 bits per frame
.equ LCR_1SB  #-----0--			; 1 stop bit
.equ LCR_2SB  #-----1--			; 2 stop bits (1.5 if LCR_5BIT)
.equ LCR_NP   #--000---			; No parity
.equ LCR_ODDP #--001---			; Odd parity
.equ LCR_EVNP #--011---			; Even parity
.equ LCR_MRKP #--101---			; Mark parity (always 1)
.equ LCR_SPCP #--111---			; Space parity (always 0)
.equ LCR_BRK1 #-1------			; Set break
.equ LCR_BRK0 #-0------			; Clear break
.equ LCR_DLEN #1-------			; Switch to special register set

;;; Flags for the Modem Control Register

.equ MCR_DTRN #-------0			; De-assert DTR
.equ MCR_DTRY #-------1			; Assert DTR
.equ MCR_RTSN #------0-			; De-assert RTS
.equ MCR_RTSY #------1-			; Assert RTS
.equ MCR_LTO1 #-----1--			; Loopback test: control RI
.equ MCR_LTO2 #----1---			; Loopback test: control CD
.equ MCR_LT   #---1----			; Loopback test enable

;;; Flags for the Line Status Register

.equ LSR_RDR  #-------1			; Data ready for reception
.equ LSR_OERR #------1-			; Overrun error
.equ LSR_PERR #-----1--			; Parity error
.equ LSR_FERR #----1---			; Framing error
.equ LSR_BRK  #---1----			; Break being received
.equ LSR_THR  #--1-----			; Host can send data
.equ LSR_TSR  #-1------			; Transmitter FIFO and shift reg empty.
.equ LSR_ERR  #1-------			; FIFO data error.

;;; Flags for the Modem Status Register

.equ MSR_DCTS #-------1			; CTS has changed state
.equ MSR_DDSR #------1-			; DSR has changed state
.equ MSR_DRI  #-----1--			; RI has changed state
.equ MSR_DCD  #----1---			; CD has changed state
.equ MSR_CTS  #---1----			; CTS# asserted
.equ MSR_DSR  #--1-----			; DSR# asserted
.equ MSR_RI   #-1------			; RI# asserted
.equ MSR_CD   #1-------			; CD# asserted

;;; Flags for the Alternate Function Register (we don't use these)

.equ AFR_UAM    #-------1 		; UARTs Akimbo Mode (write to both units)
.equ AFR_MFOP2  #-----00-		; MFA# pin is OP2#.
.equ AFR_MFBOUT #-----01-		; MFA# pin is BAUDOUT#.
.equ AFR_MFRXRD #-----10-		; MFA# pin is RXRDY#.

;;; Baud rate divisor for 14.7456 MHz clock.

.equ B921K      1			; 921600 bps -- eat my dust, IBM 5150.
.equ B460K      2			; 460800 bps
.equ B230K      4			; 230400 bps
.equ B115K      8			; 115200 bps
.equ B57600    16			; 57600 bps
.equ B38400    24			; 38400 bps
.equ B19200    48			; 19200 bps
.equ B9600     96			; 9600 bps
.equ B7200    128			; 4800 bps
.equ B4800    192			; 7200 bps
.equ B2400    384			; 2400 bps
.equ B1200    768			; 1200 bps
.equ B600    1536			; 600 bps
.equ B300    3072			; 300 bps
.equ B150    6144			; 150 bps
.equ B75    12288			; 75 bps
.equ B50    24576			; 50 bps
.equ B25    49152			; 25 bps (lowest standard rate we can do)

;;; Sane Defaults

.equ LCR_INIT LCR_8BIT LCR_NP LCR_1SB 	; 8 bits, no parity, 1 stop bit
.equ IER_INIT IER_RHR ; IER_THR		; RxRDY, TxRDY interrupts
.equ FCR_INIT FCR_ON FCR_RFS FCR_TFS	; FIFO ON, Flush both FIFOs
.equ DLL_INIT @B38400&&00ff		; Bit rate divisor, low
.equ DLM_INIT @B38400>>8		; Bit rate divisor, high

.popns
	
;;; End of file.
