;;; Some standard I/O mnemonics

.equ PANEL   &0000
.equ IPSW    IN PANEL 0		; Read panel switches
.equ OPLT    OUT PANEL 1	; Write panel lights
.equ IHWF    IN PANEL 2		; Read hardware flags
.equ HALT    OUT PANEL 7	; Halt the clock

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Early TTY Emulation
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.equ TTY0 &080
.equ TTY1 &084
.equ TTY2 &088
.equ TTY3 &08c

.equ TTYPOLL   &0
.equ TTYDATA   &1
.equ TTYCTL    &2

;;; Interrupt control: OUT 1 to TTYCTL port (OUT 0 to disable
;;; interrupts). An interrupt is generated whenever an input byte is
;;; available.
;;;
;;; Polling: IN TTYPOLL. A non-zero value means input is available.
;;;
;;; I/O: use the TTYDATA address. The high-order bits are ignored (IN
;;; returns zero for bits 8-15).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; End of file.
