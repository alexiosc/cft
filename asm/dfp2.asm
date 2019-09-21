;;; -*- cftasm -*-
;;; Definitions for the all new DFP 2 (Debugging Front Panel) subsystem for
;;; the 2019 CFT.
;;;
;;; NOTE: This file is expected to change as the DFP 2 firmware is
;;;       developed. The basics will stay the same as for the DFP, DEB and PFP,
;;;       though.

;;; Extended Instructions (globally available)

.equ SOR        dfp.SOR			; SOR: set Output Register
.equ HALT       dfp.HALT		; Halt the system
.equ LSR        dfp.LSR			; Load the value of the Switch Register
		
.pushns dfp

.equ DFP_BASE R &100			; Base address of the DPF card

;;; I/O Registers 
	
.equ RX   DFP &11		        ; Last read byte from DFP console
.equ TX   DFP &11		        ; Write to the DFP console
.equ ICR  DFP &0a		        ; ICR: interrupt control register
.equ ISR  DFP &0a		        ; ISR: interrupt status register

;;; Other extended instructions have been moved to the DFP namespace to keep the
;;; global namespace clean.
.equ SOR	OUT DFP_BASE &00	; SOR: set Output Register
.equ LSR        IN  DFP_BASE &00	; LSR: load Switch Register
.equ LDSR       IN  DFP_BASE &01	; LDSR: load DIP switch register
.equ ENEF	OUT DFP_BASE &08	; ENEF: enable feature
.equ DISEF	OUT DFP_BASE &09	; DISEF: disable feature
.equ SENTINEL	OUT DFP_BASE &0f	; SENTINEL instruction
.equ PRINTA     OUT DFP_BASE &10	; Print out an address
.equ PRINTC     OUT TX			; Print out a character
.equ PRINTD     OUT DFP_BASE &12	; Print AC in base 10, signed
.equ PRINTU     OUT DFP_BASE &13	; Print AC in base 10, unsigned
.equ PRINTH     OUT DFP_BASE &14	; Print AC in base 16
.equ PRINTB     OUT DFP_BASE &15	; Print AC in base 2
.equ PRINTSP    OUT DFP_BASE &16	; Print out a space
.equ PRINTNL    OUT DFP_BASE &17	; Print out a newline
.equ DEBUGON    OUT DFP_BASE &18	; Start tracing (slow)
.equ DEBUGOFF   OUT DFP_BASE &19	; Stop tracing (slow)
.equ DUMP       OUT DFP_BASE &1a	; Dump current state
.equ PRINTHI    OUT DFP_BASE &1b	; Set a HI word for PRINTLO
.equ PRINTLO    OUT DFP_BASE &1c	; Print out HI:LO words
.equ SUCCESS    OUT DFP_BASE &1e	; Assert: true
.equ HALT	OUT DFP_BASE &1d	; Halt the system
.equ FAIL       OUT DFP_BASE &1f	; Assert: false

.equ QEF        IN dfp.DFP_BASE &08	; QEF: query features (see below)

;;; Flags for the QEF instruction

.equ QEF_PFP  #--------'-------1        ; PFP: full front panel installed
.equ QEF_DEB  #--------'------1-        ; DEB functionality present
.equ QEF_TTY  #--------'-----1--        ; Debug TTY present
.equ QEF_TST  #--------'----1---        ; Testing interface (PRINTx) present
.equ QEF_TRC  #--------'---1----        ; Tracing (DEBUGON/OFF) available
.equ QEF_UTR  #--------'--1-----	; Microcode tracing available
.equ QEF_DMP  #--------'-1------	; DUMP available
.equ QEF_SNT  #--------'1-------	; SENTINEL available
.equ QEF_HOF  #-------1'--------	; Will halt on FAIL
.equ QEF_HOS  #------1-'--------	; Will halt on SENTINEL
.equ QEF_LCK  #-----1--'--------	; Panel is locked
.equ QEF_DVE  #000-----'--------	; Detection/version: verilog
.equ QEF_DHW  #010-----'--------	; Detection/version: hardware
.equ QEF_DCE  #110-----'--------        ; Detection/version: C-emulated panel
.equ QEF_DJE  #111-----'--------        ; Detection/version: JS-emulated panel
.equ QEF_DET  #111-----'--------        ; Detection mask

;;; Flags for the ENEF/DISEF instruction
		
.equ FTR_HOB  #---------------1         ; Halt on bus errors (emulator only)
.equ FTR_TRC  #-----------1----		; Assembly trace
.equ FTR_UTR  #----------1-----		; Microcode trace
.equ FTR_HOS  #------1---------		; Halt on SENTINEL

;;; Flags for the ISR register

.equ ISR_IRQ6 #---------------1         ; IRQ6 asserted
.equ ISR_IRQ1 #--------------1-         ; IRQ1 asserted (IFR1 switch operated)
.equ ISR_IFR6 #-------------1--         ; IFR6 switch operated
.equ ISR_TTYQ #------------1---         ; TTY characters available

;;; Flags for the ICR register
		
.equ ICR_IFR1 #--------------1-         ; Signal IRQ1 on IFR1 press
.equ ICR_IFR6 #-------------1--         ; Signal IRQ6 (or IRQ) on IFR6 press
.equ ICR_TTYQ #------------1---         ; IRQ6 when TTY characters available

;;; Macro: enef(lit)
;;;
;;; Enable features. Flags are given as literals, using the FTR_xxx values
;;; above.
;;;
;;; Side effects:
;;;   AC = lit
;;;   DFP features enabled.
.macro enef (lit)
		LI %lit			; enef(%lit)
		ENEF
.end
					; TTY characters available

;;; Macro: disef(lit)
;;;
;;; Disable features. Flags are given as literals, using the FTR_xxx values
;;; above.
;;;
;;; Side effects:
;;;   AC = lit
;;;   DFP features disabled.
.macro disef (lit)
		LI %lit			; disef(%lit)
		DISEF
.end
		


.popns
	
;;; End of file.
