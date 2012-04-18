;;; Some standard I/O mnemonics

.equ PANEL   R &008
.equ LSR    IN PANEL 0		; r- Load Switch Register (load front panel switches)
.equ LDSR   IN PANEL 1		; r- Load DIP-Switch Register
.equ SOR    OUT PANEL 2		; -w Set Output Register (set panel lights)
.equ HALT   OUT PANEL 7		; -w Halt the clock
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Early TTY Emulation
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.equ TTY0 &060
.equ TTY1 &068
.equ TTY2 &070
.equ TTY3 &078

.equ TTYSR     &1
.equ TTYFIFO   &3
	
;;; Interrupt control: OUT 1 to TTYCTL port (OUT 0 to disable
;;; interrupts). An interrupt is generated whenever an input byte is
;;; available.
;;;
;;; Polling: IN TTYPOLL. A non-zero value means input is available.
;;;
;;; I/O: use the TTYDATA address. The high-order bits are ignored (IN
;;; returns zero for bits 8-15).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; The Timer/NVRAM/RTC board
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.equ NVRAMWIN &090
.equ NVRAMOFS &080

;;; End of file.
