#!/usr/bin/python2.6
"""
Tests:

* Quite a few instructions.
* Looping.
* Strings.
"""

import unittest
import testlib


ASM1 = """
// -*- asm -*-

.equ    I0      R &080

.equ    TMP10   R &015
.equ    TMP9    R &016
.equ    TMP8    R &017
.equ    TMP7    R &018
.equ    TMP6    R &019
.equ    TMP5    R &01a
.equ    TMP4    R &01b
.equ    TMP3    R &01c
.equ    TMP2    R &01d
.equ	TMP1	R &01e
.equ	TMP0	R &01f		; Clobbered by most stack routines

.equ    divn_hi TMP0
.equ    divn_lo TMP1
.equ    dvdr_hi TMP2
.equ    dvdr_lo TMP3

.equ TMPOUT  R &81		; Temporary (early development) tty out
;.equ PUTCHAR OUT TMPOUT

.include "../../forth/registers.asm"
.include "../../forth/macro_generic.asm"

&0100:
MINUS1:
        .word -1

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

&0080:
       .word data

&0400:

	;; A 32-bit unsigned division routine based on div16.
	;; Inputs (HI,LO)
	;;   TMP0,TMP1 = dividend (d1)
	;;   TMP2,TMP3 = divisor (d2)
	;; 
	;; Output:
	;;   TMP0,TMP1 = quotient
	;;   TMP4,TMP5 = modulo (remainder)
	;;   AC = 0 => division by zero.
	;; 
	;; Registers:
	;;   TMP6:       bit counter
        ;;   TMP8, TMP9: temporary 32-bit reg

start:
        RMOV (TMP10, I I0)

next_test:
        RMOV(TMP0, I I0)        ; Dividend HI (left hand side)
        RMOV(TMP1, I I0)        ; Dividend LO (left hand side)

        RMOV(TMP2, I I0)        ; Divisor HI (left hand side)
        RMOV(TMP3, I I0)        ; Divisor LO (left hand side)

        JSR _udiv32

        /PRINTD                  ; Print the ok/error flag
        SNZ
        JMP divby0

        /PRINTSP
        PRINT32(TMP0,TMP1)      ; Print out quotient
        PRINTSP
        PRINT32(TMP4,TMP5)      ; Print out remainder

skipreport:
        SUCCESS
        ISZ TMP10               ; Decrement the number of data.
        JMP next_test           ; Go again.

        SUCCESS                 ; One final checkpoint.
	HALT

divby0:
        LI 0
        PRINTH
        JMP skipreport


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


_udiv32_done:
        LI 1
        RET

_udiv32:
        ; Check for division by zero.
        LOAD TMP2
        OR TMP3
        SNZ
        RET                     ; Return with AC = 0

	RMOV(TMP6, MINUS32)     ; loop counter: 32 bits, 32 iterations

	LSET(TMP4, 0)           ; Modulo high = 0
        STORE TMP5              ; Modulo low = 0

_udiv32_nextbit:
        ISZ TMP6                ; TMP6++, skip if 0.
        JMP @+2
        JMP _udiv32_done        ; We're done.

        ; Magic: Shift left <TMP0,TMP1,TMP4,TMP5> 64-bit value (<modulo,quotient>)

        RSBL(TMP1, TMP1)        ; Shift first word.
        RRBL(TMP0, TMP0)        ; Roll subsequent for bit propagation.
        RRBL(TMP5, TMP5)        ; Roll subsequent for bit propagation.
        RRBL(TMP4, TMP4)        ; Roll subsequent for bit propagation.

_udiv32_compare:

        ; Calculate modulo - divisor (<TMP4,TMP5> - <TMP2,TMP3>)

        ; First, negate <TMP2,TMP3> (complement, then add <0,1>)
        RNEG32(TMP7,TMP8,TMP2,TMP3) ; <TMP7,TMP8> = -<TMP2,TMP3>

        ; Now, add module + (-divisor) (<TMP4,TMP5> + <TMP7,TMP8>)
        CLL
        RADD(TMP8, TMP8, TMP5)  ; Add low words. Keep the result for later.
        LOAD TMP7
        ADC(TMP4)               ; Add high words with carry.

_udiv32_does_it_fit:
	SNN			; Will it fit?
	JMP _udiv32_nextbit	; No. Try next bit.

_udiv32_it_fits:
	STORE TMP4 		; We already have the result of the subtraction. Store it.
        RMOV(TMP5,TMP8)         ; Transfer the low order word too.

	INC32(TMP0,TMP1)	; Add one to the quotient

	JMP _udiv32_nextbit     ; And loop again.
	
MINUS32:  .word -33
"""


datum = """
        .word &%(ah)x
        .word &%(al)x
        .word &%(bh)x
        .word &%(bl)x
"""

class Div32(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 32-bit integer division"""
        self.results = []
        self.num = 0

        def _div32(a, b):
            ah = (a >> 16) & 0xffff
            al = a & 0xffff

            bh = (b >> 16) & 0xffff
            bl = b & 0xffff

            self.num += 1
            #print datum % locals()
            self.asm(datum % locals())

            if b == 0:
                self.results.append('0000[ok]')
            else:
                self.results.append('%x %x[ok]' % (a // b, a % b))

        self.asm(ASM1 % locals())
        self.asm('&1001:')      #  This is where the data starts


        _div32(100001, 0)       #  Try division by zero.

        _div32(100001, 3)

        N = 10
        for a in xrange(N):
            for b in xrange(N):
                _div32(215320001 *  a + 28, 35979121 *  b + 19)

        N = 10
        for a in xrange(N):
            for b in xrange(N):
                _div32(215320231 *  a + 28, 3597911 *  b + 19)

        N = 10
        for a in xrange(N):
            for b in xrange(N):
                _div32(23432481 *  a + 28, 2348292 *  b + 19)

        N = 10
        for a in xrange(N):
            for b in xrange(N):
                _div32(99 *  a + 28, 11 *  b + 19)

        self.asm('&1000:')
        self.asm('data: .word -%d' % self.num)

        expected = ''.join(self.results)
        expected += '[ok]'

        #print '\n'.join(self._source)
        self.assertSim(expected)


# End of file.

