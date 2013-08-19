;;; Interrupt Controller defs

	;; The IRC card has a single I/O space address providing access to one
	;; write-only register and one read-only register:

	.equ IRC R &40		; Base address
	
	.equ IRC_ICR IRC	; IRC IER (OUT only)
	.equ IRC_ISR IRC	; IRC ISR (IN only)

	;; To test for an interrupt, read from the ISR and test one of the
	;; following bits.

	.equ ISR_IRQ0 #_______1	; IRQ0 in ISR
	.equ ISR_IRQ1 #______1_	; IRQ1 in ISR
	.equ ISR_IRQ2 #_____1__	; IRQ2 in ISR
	.equ ISR_IRQ3 #____1___	; IRQ3 in ISR
	.equ ISR_IRQ4 #___1____	; IRQ4 in ISR
	.equ ISR_IRQ5 #__1_____	; IRQ5 in ISR
	.equ ISR_IRQ6 #_1______	; IRQ6 in ISR
	.equ ISR_IRQ7 #1_______	; IRQ7 in ISR

	;; To enable or mask an interrupt, OR the EN or DIS value with
	;; the right interrupt pattern below. Example:
	;;
	;; LI IRQEN IER_IRQ1
	;; OUT IRC_IER
	;;
	;; To acknowledge an interrupt, disable it. Re-enable it immediately
	;; after if still needed.

	.equ IRQEN    #___'1	; ISR enable interrupt bit
	.equ IRQDIS   #___'0	; ISR disable interrupt bit
	.equ IER_IRQ0 #000'_    ; IRQ0 in IER
	.equ IER_IRQ1 #001'_    ; IRQ1 in IER
	.equ IER_IRQ2 #010'_    ; IRQ2 in IER
	.equ IER_IRQ3 #011'_    ; IRQ3 in IER
	.equ IER_IRQ4 #100'_    ; IRQ4 in IER
	.equ IER_IRQ5 #101'_    ; IRQ5 in IER
	.equ IER_IRQ6 #110'_    ; IRQ6 in IER
	.equ IER_IRQ7 #111'_    ; IRQ7 in IER

;;; End of file.
