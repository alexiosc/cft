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

;; VDU registers

.reg VDUATTR     R @		; VDU current attribute
.reg VDUROWS     R @		; VDU screen number of rows
.reg VDUCOLS     R @		; VDU screen number of columns
.reg VDUSTADDR   R @		; VDU copy of VDU SAR (start address)
.reg VDUCRSADDR  R @ 		; Cursor address
	;; TODO: Review these!
.reg VDUSCRSZ    R @		; VDU screen size (in cells)
.reg VDUSCR      R @		; VDU copy of VDU SCR (top of screen)
.reg VDUCA       R @		; VDU copy of the CA register
.reg VDUCPX      R @		; VDU cursor position, X ordinate (0..VDUCNC)
.reg VDUCPY      R @		; VDU cursor position, Y ordinate (0..VDUCNR)

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

.reg    IIR0	R @		; ISR @index regisgters
.reg    IIR1	R @
.reg    IIR2	R @
.reg    IIR3	R @

.reg    VDUKBST R @		; VDU keyboard state
.reg    VDUKBM  R @		; VDU keyboard modifiers
.reg    VDUKEY  R @		; VDU last data from keyboard

// End of file.
