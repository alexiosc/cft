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

.equ    TMP6    R &019
.equ    TMP5    R &01a
.equ    TMP4    R &01b
.equ    TMP3    R &01c
.equ    TMP2    R &01d
.equ	TMP1	R &01e
.equ	TMP0	R &01f

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

// End of file.
