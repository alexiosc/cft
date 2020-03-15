;;; -*- cftasm -*-
;;; Definitions for the UCB (Microcode Banking Unit).
;;;
;;; The UCB extends the microprogram space of the CFT architecture by 16 times
;;; to better take advantage of the large Flash parts used on the Microcode
;;; Store.
;;;
;;; There are 16 microcode banks, each completely independent. Two registers
;;; allow the currently used bank to be switched either persistently, or for the
;;; next instruction only. These two registers are accessed at 16 locations
;;; each, to allow for extended instructions with a 4-bit operand.
;;;
;;; Example:
;;;
;;; SBP 0  / Set default microcode bank for rest of program
;;; SBN 7  / Set microcode bank for next instruction
;;; FOO    / Hypothetical instruction in bank 7
;;; RET    / Back to bank 0
;;;
;;; Note: the operands MUST be between 0 and 15.

.equ SBP OUT R ucb.UCBA			; SBP: Set permanent microcode bank
.equ SBN OUT R ucb.UCBB			; SBN: Set microcode bank for next instr.
		
.pushns ucb

;;; UCB base registers.

.equ UCBA R #00000000'----		; Permanent microcode bank
.equ UCBB R #00000001'----		; Temporary microcode bank
.equ BNK0 R #--------'0000		; Microcode Bank 0
.equ BNK1 R #--------'0001		; Microcode Bank 1
.equ BNK2 R #--------'0010		; Microcode Bank 2
.equ BNK3 R #--------'0011		; Microcode Bank 3
.equ BNK4 R #--------'0100		; Microcode Bank 4
.equ BNK5 R #--------'0101		; Microcode Bank 5
.equ BNK6 R #--------'0110		; Microcode Bank 6
.equ BNK7 R #--------'0111		; Microcode Bank 7
.equ BNK8 R #--------'1000		; Microcode Bank 8
.equ BNK9 R #--------'1001		; Microcode Bank 9
.equ BNKA R #--------'1010		; Microcode Bank 10
.equ BNKB R #--------'1011		; Microcode Bank 11
.equ BNKC R #--------'1100		; Microcode Bank 12
.equ BNKD R #--------'1101		; Microcode Bank 13
.equ BNKE R #--------'1110		; Microcode Bank 14
.equ BNKF R #--------'1111		; Microcode Bank 15

.popns ucb

;;; End of file.
