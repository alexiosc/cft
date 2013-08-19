// -*- asm -*-
//
// Core TTY operations.



	;; word:  EMIT
	;; flags: CODE ROM
	;; notes: EMIT ( c -- )
	;;        Execute the current word set in 'EMIT.
	;; code:  : EMIT ( c -- ) 'EMIT @EXECUTE ;
	LOADUP(UAOFS_EMIT)
	LJMP(_fetch_execute)
	


	;; WARNING: THESE ARE ALL FOR THE 26C92 DUART.
	
	;; DUART bit values

	.equ DUART_IMR_ARXINT  #----'--1- ; UART A: RX interrupt (on reception or FIFO full)
	.equ DUART_IMR_BRXINT  #--1-'---- ; UART B: RX interrupt (on reception or FIFO full)
	
	.equ DUART_CMD_MR0     #1011'----
	.equ DUART_CMD_MR1     #0001'----
	.equ DUART_CMD_RXEN    #----'---1
	.equ DUART_CMD_RXDIS   #----'--1-
	.equ DUART_CMD_TXEN    #----'-1--
	.equ DUART_CMD_TXDIS   #----'1---

	.equ DUART_MR1_5BIT    #------00
	.equ DUART_MR1_6BIT    #------01
	.equ DUART_MR1_7BIT    #------10
	.equ DUART_MR1_8BIT    #------11
	.equ DUART_MR1_EVEN    #-----0-- ; Even parity (must have WP or FP too)
	.equ DUART_MR1_ODD     #-----1-- ; Odd parity (must have WP or FP too)
	.equ DUART_MR1_WP      #---00--- ; With parity
	.equ DUART_MR1_FP      #---01--- ; Forced parity
	.equ DUART_MR1_NP      #---10--- ; No parity
	.equ DUART_MR1_MD      #---11--- ; Multidrop
	.equ DUART_MR1_ERRC    #--1----- ; Char error
	.equ DUART_MR1_ERRB    #--0----- ; Block error
	.equ DUART_MR1_INTRX   #-0------ ; RX interrupt on reception
	.equ DUART_MR1_INTF    #-1------ ; RX interrupt on Rx FIFO full
	.equ DUART_MR1_RXRTS   #0------- ; RX controls RTS
	.equ DUART_MR1_NRXRTS  #1------- ; RX does not control RTS

	.equ DUART_MR2_1SB     #----0111 ; 1 stop bit.
	.equ DUART_MR2_1_5SB   #----1000 ; 1.5 (actually 1.563) stop bit.
	.equ DUART_MR2_2SB     #----1111 ; 2 stop bits.
	.equ DUART_MR2_CTS     #---10000 ; CTS Enable Tx
	.equ DUART_MR2_NRTS    #--0----- ; Tx does not control RTS
	.equ DUART_MR2_RTS     #--1----- ; Tx controls RTS
	.equ DUART_MR2_NORMAL  #00------ ; Normal mode

	.equ DUART_CSR_B4800   #0000
	.equ DUART_CSR_B9600   #1011
	.equ DUART_CSR_B19200  #0011
	.equ DUART_CSR_B38400  #1100
	.equ DUART_CSR_B57600  #0101
	.equ DUART_CSR_B115200 #0110

	

	;; word:  TTY.INIT
	;; flags: CODE ROM
	;; notes: tty.init ( -- )
	;;   Initialise the console. Currently does nothing. The emulator
	;;   console is always initialised.

	;; DUART0: channel A IRQ on Rx.
	;; LI DUART_IMR_ARXINT
	;; OUT DUART0 DUART_IMR

	;; DUART0, UART A: enable transmitter and receiver. Also point to MR1
	;; LI DUART_CMD_MR1 DUART_CMD_RXEN DUART_CMD_TXEN
	;; OUT DUART0 UARTA UARTCR

	;; MR0. 8 bits, no partiy, char errors, interrupt on reception, and RTS.
	;; LI DUART_MR1_8BIT DUART_MR1_NP DUART_MR1_INTRX DUART_MR1_RXRTS
	;; OUT DUART0 UARTMR

	;; MR2 is selected automatically. Set it for normal operation, 1 stop bit.
	;; LI DUART_MR2_NORMAL DUART_MR2_CTS DUART_MR2_RTS DUART_MR2_1SB
	;; OUT DUART0 UARTMR

	;; Delay a bit and set MR0.
	;; LI 0
	;; OUT DUART0 UARTA UARTCR
	;; OUT DUART0 UARTA UARTCR
	;; OUT DUART0 UARTA UARTCR
	;; OUT DUART0 UARTA UARTCR
	;; LI DUART_CMD_MR0
	;; OUT DUART0 UARTA UARTCR

	;; Set the MR for normal operation and Extended II bps rates.
	;; LI #0000101
	;; OUT DUART0 UARTA UARTACR

	;; Set the baud rate. This needs to be set twice, in the low
	;; (transmitter) and high (receiver) nybbles.
	;; LI DUART_CSR_B115200
	;; STORE TMP0
	;; CLL RNL
	;; OR TMP0
	;; OUT DUART0 UARTA UARTCSR

	LIA _tty_init_str
	PUSH SP
	FORTH(dw_typep0)


	;; TEMPORARY: enable IRQ2 interrupt.
	LI #010'1
	OUT R IRC_ICR
	

	;; Done.
	NEXT

_tty_init_str:
	.strp 10 10 "TTY: 0A* 0B 1A 1B (16550)" 10 0
	


	;; word:  TTY.EMIT
	;; flags: CODE ROM
	;; notes: TTY.EMIT ( c -- )
	;;        Transmits c to the current TTY port.

	POP SP
	AND PLUS127
	STORE TMP0
	
_tty_emit:
	IN I ttylsr		; Load 
	AND ttyther
	SNZ
	JMP _tty_emit	; Wait until ready
	
	LOAD TMP0
	OUT I ttyrxtx

	NEXT

	;; TODO: move to user variables
ttyrxtx:
	.word @TTY0&&3ff TTYRHR
ttylsr:
	.word @TTY0&&3ff TTYLSR
ttyther:
	.word TTYTHRE		; Ready to send


	
	;; word:  rx?
	;; alias: rx_q
	;; flags: CODE ROM
	;; notes: tt.rx? ( -- f )
	;;   Returns true if the console has received a character.
	RPUSH(SP, INPFR)
	NEXT
	


	;; word:  rx
	;; flags: CODE ROM
	;; notes: rx? ( -- c )
	;;   Receive a character from the console. Block if one isn't available.
_rx_loop:
	LI IFL_NEWCHAR
	AND INPFR
	SNZ
	JMP _rx_loop

	RPUSH(SP, INPCH)

	LI IFL_NEWCHAR		; Clear the flag
	XOR MINUS1		; Faster than NOT
	AND INPFR
	STORE INPFR
	
	NEXT



// End of file.
