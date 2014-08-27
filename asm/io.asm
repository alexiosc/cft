/// THIS FILE IS OBSOLETE.
///
/// Most I/O definitions are now in individual files.


.pushns __do_not_use__
		
;;; Some standard I/O mnemonics

.equ PANEL  R &030
.equ LSR    IN PANEL 0		; r- Load Switch Register (load front panel switches)
.equ LDSR   IN PANEL 1		; r- Load DIP-Switch Register
.equ SOR    OUT PANEL 2		; -w Set Output Register (set panel lights)
.equ HALT   OUT PANEL 7		; -w Halt the clock
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Early TTY Emulation
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.equ TTY0 R &060
.equ TTY1 R &068
.equ TTY2 R &070
.equ TTY3 R &078

;; Obsolete 26C92 UART
;.equ TTYSR     &1
;.equ TTYFIFO   &3

;; 16550 UART
.equ TTYRHR &0			; r- Receive Holding Reg (read data)
.equ TTYTHR &0			; -w Transmit Holding Reg (write data)
.equ TTYIER &1			; rw Interrupt Enable Reg
.equ TTYISR &2			; r- Interrupt Status Register
.equ TTYFCR &2			; -w FIFO Control Register
.equ TTYLCR &3			; rw Line Control Register
.equ TTYMCR &4			; rw Modem Control Register
.equ TTYLSR &5			; r- Line Status Register
.equ TTYMSR &6			; r- Modem Status Register
.equ TTYSPR &7			; rw Scratchpad Register

.equ TTYTHRE &20		; Transmit register ready
	
	
;;; Interrupt control: OUT 1 to TTYCTL port (OUT 0 to disable
;;; interrupts). An interrupt is generated whenever an input byte is
;;; available.
;;;
;;; Polling: IN TTYPOLL. A non-zero value means input is available.
;;;
;;; I/O: use the TTYDATA address. The high-order bits are ignored (IN
;;; returns zero for bits 8-15).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;.equ IRC_BASE &40		;
;.equ IRC_ICR IRC_BASE 0		; w- Interrupt command register
;.equ IRC_ISR IRC_BASE 0		; -r Interrupt status register

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; The Timer/NVRAM/RTC board
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.equ NVRAMWIN R &090
.equ NVRAMOFS R &080

.popns
		
;;; End of file.
