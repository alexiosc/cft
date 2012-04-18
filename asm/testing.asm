;;; Mnemonics used in testing. These correspond to a virtual (and as yet
;;; unimplemented in hardware) device that helps capture and log debugging
;;; information out-of-band. The CFT issues instructions to this board, and it
;;; sends out data via some external link (RS-232 or USB) to a
;;; logging/debugging computer. If running on the emulator, it can also enable
;;; or disable certain emulator features.

.equ SENTINEL	OUT R &3ef	; The emulator sentinel command.
	
.equ DEBUG      R &03e0		; Base address of the debugging board


;;; The first 16 I/O locations are emulator-specific.

.equ ENEF       OUT DEBUG &00	; Disable emulator features.
.equ DISEF      OUT DEBUG &01	; Enable emulator features.
.equ QEF        IN DEBUG &00	; Query emulator features.


.equ STT        OUT DEBUG &08   ; Start timer
.equ LTL        IN DEBUG &08    ; Load ticks low (since last STT)
.equ LTH        IN DEBUG &09    ; Load ticks high (since last STT)

;; The debugging board proper starts at DEBUG + &10. All these need to be
;; exactly one word (AC may not be modified), so each action has its own
;; location.

.equ PRINTA     OUT DEBUG &10	; Print out an address
.equ PRINTC     OUT DEBUG &11	; Print out a character
.equ PRINTD     OUT DEBUG &12	; Print out a decimal number in A
.equ PRINTU     OUT DEBUG &13	; Print out a decimal number in A
.equ PRINTH     OUT DEBUG &14	; Print out a hex number in A
.equ PRINTB     OUT DEBUG &15	; Print out a binary number in A
.equ PRINTSP    OUT DEBUG &16	; Print out a space
.equ PRINTNL    OUT DEBUG &17	; Print out a newline
.equ DEBUGON    OUT DEBUG &18	; Emulator: start debugging
.equ DEBUGOFF   OUT DEBUG &19	; Emulator: stop debugging
.equ DUMP       OUT DEBUG &1a	; Emulator: dump current state
.equ PRINTHI    OUT DEBUG &1b	; Set a HI word for later printing.
.equ PRINTLO    OUT DEBUG &1c	; Emulator: print out HI:LO words

.equ SUCCESS    OUT DEBUG &1e	; Assert: true
.equ FAIL       OUT DEBUG &1f	; Assert: false


;; AC values for ENEF, DISEF and QEF.

	                            ; qed (q=can query, e=can enable,
	                            ;      d=can disable)
.equ EMF_SANITY   #---------------1 ; qed  Sanity mode (same as --(no)sanity)
.equ EMF_SENTINEL #--------------1- ; qed  Sentinel detection (same as --sentinel)
.equ EMF_D_ASM    #-------------1-- ; qed  Assembly tracing (same as --debug-asm or DEBUGON/OFF)
.equ EMF_D_MC     #------------1--- ; qed  Microcode tracing (same as --debug-microcode)
.equ EMF_D_TEST   #-----------1---- ; qed  Show debugging board log (--testing)
.equ EMF_ISEMU    #1--------------- ; q--  Running on emulator


;;; End of file.
