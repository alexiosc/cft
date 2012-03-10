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
	;; flags: FFL_PRIMITIVE ROM
	;; notes: tt.rx? ( -- f )
	;;   Returns true if the console has received a character.
	IN R &80
	PUSH (SP)
	NEXT
	


	;; word:  rx
	;; flags: FFL_PRIMITIVE ROM
	;; notes: rx? ( -- f )
	;;   Receive a character from the console. Block if one isn't available.
	IN R &81
	PUSH (SP)
	NEXT



// End of file.
