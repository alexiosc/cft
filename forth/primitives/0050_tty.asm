// -*- asm -*-
//
// Core TTY operations.



	;; word:  tty.init
	;; flags: FFL_PRIMITIVE ROM
	;; notes: tty.init ( -- )
	;;   Initialise the console. Currently does nothing. The emulator
	;;   console is always initialised.
	NEXT
	


	;; word:  tx
	;; flags: FFL_PRIMITIVE ROM
	;; notes: tx ( c -- )
	;;   Transmits c to the console.
	POP (SP)
	OUT R &81
	NEXT
	


	;; word:  rx?
	;; alias: rx_q
	;; flags: FFL_PRIMITIVE ROM
	;; notes: tt.rx? ( -- f )
	;;   Returns true if the console has received a character.
	RPUSH(SP, INPFR)
	NEXT
	


	;; word:  rx
	;; flags: FFL_PRIMITIVE ROM
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
