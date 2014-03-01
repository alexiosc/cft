;;; -*- cftasm -*-
;;; Definitions for the IRC (Interrupt Controller) board.

;;; The IRC card has a single I/O space address providing access to one
;;; write-only register and one read-only register:

.pushns irc

;;; Useful macros. You probably won't have to use anything other than these, ISR
;;; and ISR_IRQn for testing if an interrupt has been signaled.

.macro enable(irq)
		LI ICR_EN ICR_IRQ%irq
		OUT ICR
.end

.macro disable(irq)
		LI ICR_DIS ICR_IRQ%irq
		OUT ICR
.end

.macro ack(irq)
		disable(irq)
		enable(irq)
.end

;;; Definitions

.equ IRC R &28				; Base address
	
.equ ICR IRC				; IRC ICR (OUT only)
.equ ISR IRC				; IRC ISR (IN only)

;;; To detect the IRC, read the ISR. The top eight bits should be as
;;; follows:
	
.equ ISR_DETECT #00001111'--------
	
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

;; To enable or mask an interrupt, OR the EN or DIS value with the right
;; interrupt pattern below. Example:
;;
;; LI IRQEN IER_IRQ1
;; OUT IRC_IER
;;
;; To acknowledge an interrupt, disable it. Re-enable it immediately after if
;; still needed.

.equ ICR_EN   #---'1	                ; ISR enable interrupt bit
.equ ICR_DIS  #---'0	                ; ISR disable/acknowledge interrupt bit
.equ ICR_IRQ0 #000'-	                ; IRQ0 in ICR
.equ ICR_IRQ1 #001'-	                ; IRQ1 in ICR
.equ ICR_IRQ2 #010'-			; IRQ2 in ICR
.equ ICR_IRQ3 #011'-			; IRQ3 in ICR
.equ ICR_IRQ4 #100'-			; IRQ4 in ICR
.equ ICR_IRQ5 #101'-			; IRQ5 in ICR
.equ ICR_IRQ6 #110'-			; IRQ6 in ICR
.equ ICR_IRQ7 #111'-			; IRQ7 in ICR

.popns

;;; End of file.
