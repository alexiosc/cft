// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// GENERIC REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

// Allocate general registers in page zero, between &00-%2F and
// &80-&8F (auto-increment).

.equ	RETV	R &000
.equ	RTTV	R &001
.equ	RTIV	R &002
	
.equ	R0	R &003
.equ	R1	R &004
.equ	R2	R &005
.equ	R3	R &006
.equ	R4	R &007
.equ	R5	R &008

.equ    TR0     R &009
.equ    TR1     R &00a
.equ    TR2     R &00b
.equ    TR3     R &00c

// Forth word-local registers
.equ    TMP15   R &010
.equ    TMP14   R &011
.equ    TMP13   R &012
.equ    TMP12   R &013
.equ    TMP11   R &014
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

// Arguments for traps (possibly obsolete)

.equ    ARG0    R &020
.equ    ARG1    R &021
.equ    ARG2    R &022
.equ    ARG3    R &023

.equ    I0      R &080
.equ    I1      R &081
.equ    I2      R &082
.equ    I3      R &083

.equ    ARGP    R &084		; Param block pointer for traps
.equ    TI0     R &085
.equ    TI1     R &086
.equ    TI2     R &087


;; ISR registers

.equ ISRR0	 R &0030
.equ ISRR1	 R &0031
.equ ISRR2	 R &0032
.equ ISRR3	 R &0033

.equ ISRABKP     R &0034
.equ ISRR0BKP    R &0035
.equ ISRR1BKP    R &0036

.equ IIR0	 R &0088
.equ IIR1	 R &0089
.equ IIR2	 R &008a
.equ IIR3	 R &008b

// End of file.
