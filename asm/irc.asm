;;; -*- cftasm -*-
;;; 
;;; Definitions for the IRC (Interrupt Controller) board.

;;; The IRC card has a single I/O space address providing access to one
;;; write-only register and one read-only register:

.pushns irc

;;; Definitions

.equ IRC R 0				; Base address
.equ IER IRC 0				; rw Interrupt Enable Register
.equ IDR IRC 8				; -w Interrupt Disable Register
.equ ISR IRC 8				; r- Interrupt Status Register

.equ IRQ_DISABLE IRC 0
.equ IRQ_ENABLE IRC 8

;;; Useful macros. You probably won't have to use anything other than these, ISR
;;; and ISR_IRQn for testing if an interrupt has been signaled.

.macro enable(irq)
		OUT irc.IER %irq
.endmacro

.macro disable(irq)
		OUT irc.IDR %irq
.endmacro

.macro ack(irq)
		irc.disable(%irq)
		irc.enable(%irq)
.endmacro

;;; To detect the IRC, read the IER and/or ISR and AND it with DET_MASK. The top
;;; eight bits should be equal to DET_VAL.

.equ DET_MASK   #11111111'00000000
.equ DET_VAL    #00111111'--------
	
;; To test for an interrupt, read from the ISR and test one of the
;; following bits.

.equ ISR_IRQ0 #-------1			; IRQ0 in ISR
.equ ISR_IRQ1 #------1-			; IRQ1 in ISR
.equ ISR_IRQ2 #-----1--			; IRQ2 in ISR
.equ ISR_IRQ3 #----1---			; IRQ3 in ISR
.equ ISR_IRQ4 #---1----			; IRQ4 in ISR
.equ ISR_IRQ5 #--1-----			; IRQ5 in ISR
.equ ISR_IRQ6 #-1------			; IRQ6 in ISR
.equ ISR_IRQ7 #1-------			; IRQ7 in ISR

.popns irc

;;; End of file.
