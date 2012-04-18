// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// GENERIC REGISTERS
//
///////////////////////////////////////////////////////////////////////////////

// Allocate general registers in page zero, between &00-%2F and
// &80-&8F (auto-increment).

&0000:	
.reg	RETV	R &000
.reg	RTTV	R &001
.reg	RTIV	R &002

&0003:
.reg	R0	R @
.reg	R1	R @
.reg	R2	R @
.reg	R3	R @
.reg	R4	R @
.reg	R5	R @

.reg    TR0     R @
.reg    TR1     R @
.reg    TR2     R @
.reg    TR3     R @

// Forth word-local registers
.reg	TMP0	R @		; Clobbered by most stack routines
.reg	TMP1	R @
.reg    TMP2    R @
.reg    TMP3    R @
.reg    TMP4    R @
.reg    TMP5    R @
.reg    TMP6    R @
.reg    TMP7    R @
.reg    TMP8    R @
.reg    TMP9    R @
.reg    TMP10   R @
.reg    TMP11   R @
.reg    TMP12   R @
.reg    TMP13   R @
.reg    TMP14   R @
.reg    TMP15   R @

// Arguments for traps (possibly obsolete)

&0040:
.reg    ARG0    R @
.reg    ARG1    R @
.reg    ARG2    R @
.reg    ARG3    R @

;; ISR registers

&0050:
.reg ISRR0	 R @
.reg ISRR1	 R @
.reg ISRR2	 R @
.reg ISRR3	 R @

.reg ISRABKP     R @
.reg ISRR0BKP    R @
.reg ISRR1BKP    R @

// Autoincrement registers

&0080:
.reg    I0      R @
.reg    I1      R @
.reg    I2      R @
.reg    I3      R @

.reg    ARGP    R @		; Param block pointer for traps
.reg    TI0     R @
.reg    TI1     R @
.reg    TI2     R @

.reg    IIR0	R @	; ISR @index regisgters
.reg    IIR1	R @
.reg    IIR2	R @
.reg    IIR3	R @


// End of file.
