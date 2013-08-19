// -*- asm -*-
//
// The Memory Banking Unit.


	
	;; word:  SANITY-
	;; alias: SANITY_off
	;; flags: CODE ROM CFT
	;; notes: SANITY- ( -- )
	;;        Disables emulator sanity checking. Used when scanning the bus.

	LI EMF_SANITY
	DISEF
	NEXT


	
	;; word:  SANITY+
	;; alias: SANITY_on
	;; flags: CODE ROM CFT
	;; notes: SANITY+ ( -- )
	;;        Enables emulator sanity checking. Used when scanning the bus.

	LI EMF_SANITY
	ENEF
	NEXT
	
	

	;; word:  BANKS
	;; alias: BANKS
	;; flags: CODE ROM CFT
	;; notes: BANKS ( +n -- a )
	;;        1. Given a bank number, produce its first address in memory.
	;;        2. Converts a number of 8kW blocks (e.g. as returned by SYSMEM)
	;;           to machine words (16-bit cells). Values up to 7 are valid.

	POP SP
	AND PLUS15
	OP1 CLL RNL		; << 4 (also clear L)
	RNL			; << 8
	RNL			; << 12
	SBL			; << 13
	PUSH SP
	NEXT
	
	

	;; word:  kWBANKS
	;; alias: kWBANKS
	;; flags: CODE ROM CFT
	;; notes: kWBANKS ( +n -- a )
	;;        Converts a number of 8kW blocks (e.g. as returned by SYSMEM)
	;;           to kWords (1024 16-bit cells). Values up to 8191 are valid.

	POP SP
	OP1 CLL RNL		; << 4 (also clear L)
	SBR			; << 3
	AND _kwBANKS_data
	PUSH SP
	NEXT

_kwBANKS_data:
	.word &fff8


	
	;; word:  MBU!
	;; alias: MBU_store
	;; flags: CODE ROM CFT
	;; notes: MBU! ( a +n -- )
	;;        Set up MBU register +n (only the lower three bits of which
        ;;        are used) for address a. Each register maps an 8kW area of
        ;;        memory to a block of physical ROM or RAM. Register 0 maps
        ;;        addresses &0000-&1FFF, register 7 maps addresses
        ;;        &E000-&FFFF. The offset into physical memory is 8192*n.

	POP SP			; Bank number (+n)
	AND _dw_MBU_data
	STORE TMP1		; TMP1 = +n & 7

	LIA MBUB0		; Index the MBU register backups
	ADD TMP1
	STORE TMP0		; Pointer to MBUB0+n

	LIA MBU			; Index the MBU register itself
	ADD TMP1
	STORE TMP2		; Pointer to MBU register #n

	POP SP			; Address to assign to register
	STORE I TMP0		; MBUB[n&7] = a
	OUT I TMP2		; Set the MBU register

	NEXT

_dw_MBU_data:
	.word 7
	
	

	;; word:  MBU@
	;; alias: MBU_fetch
	;; flags: CODE ROM CFT
	;; notes: MBU! ( +n -- a )
	;;        Returns the physical location of bank +n. Only the 3 least
        ;;        significant bits of +n are used.

	POP SP
	AND _dw_MBU_data	; +n & 7
	ADD MBUB0		; MBUB[n&7]
	STORE TMP0		; Store array pointer
	LOAD I TMP0		; Read from array
	PUSH SP			; Push it
	NEXT

	

	;; word:  .BANKS
	;; alias: dot_BANKS
	;; flags: DOCOL ROM CFT
	;; notes: .BANKS ( -- )
	;;        Prints out the current memory banking scheme.

	.word dw_BASE_to_R
	.word dw_HEX
	doLIT(8)		; 8 ( max )
	doLIT(0)		; 0 ( max i )

_dot_BANKS_loop:
	.word dw_DUP		; DUP ( max i i )
	.word dw_MBU_fetch	; MBU@ ( max i a )
	doLIT(2)
	.word dw_u_dot_0r	; U.0R ( max i )
	.word dw_SPACE		; SPACE ( max i )
	.word dw_inc		; 1+ ( max i+1 )
	.word dw_2DUP		; 2DUP ( max i+1 max i+1 )
	.word dw_equal		; = ( max i+1 f )
	.word dw_if_branch	; ?branch
	.word _dot_BANKS_loop
	.word dw_2DROP
	.word dw_R_to_BASE
	.word dw_EXIT

	

	;; word:  MBU.GO
	;; flags: CODE ROM CFT
	;; notes: MBU.GO ( -- )
	;;        Set up the default memory banking scheme.

	LIA _mbu_go_data
	STORE I0
	LI MBUB0
	STORE I1
	LI MBU
	STORE I2

	RMOV(TMP0, I I0)

_mbu_go_loop:
	LOAD I I0
	STORE I I1
	OUT I I2
	ISZ TMP0
	JMP _mbu_go_loop

	;; Also enable the unit. Doing it multiple times can't hurt.
	OUT MBUEN
	NEXT

_mbu_go_data:
	.word -8
	;; For 8kW ROM systems:
	;; .word &00		; RAM bank 0
	;; .word &01		; RAM bank 1
	;; .word &02		; RAM bank 2
	;; .word &03		; RAM bank 3
	;; .word &04		; RAM bank 4
	;; .word &05		; RAM bank 5
	;; .word &06		; RAM bank 6
	;; .word &80		; ROM bank 0

	;; For 16kW ROM systems:
	.word &00		; RAM bank 0
	.word &01		; RAM bank 1
	.word &02		; RAM bank 2
	.word &03		; RAM bank 3
	.word &04		; RAM bank 4
	.word &05		; RAM bank 5
	.word &80		; ROM bank 0
	.word &81		; ROM bank 1
	
	

_mbu_data:
	.word &2000


	;; word:  MBU.INIT
	;; flags: CODE ROM CFT
	;; notes: MBU.INIT ( -- )
	;;        Detect and initialise the MBU. Be verbose.

	;; Ensure the emulator doesn't crash at this point. On hardware, these
	;; instructions are basically NOPs.

	LI EMF_SANITY
	DISEF

	;; Chick & Egg: to initialise the MBU, we'll need to enable it. To
	;; enable it, we need to set up a mapping. So we'll do just that: set
	;; up the default banking scheme, enable banking, then detect if it
	;; worked. If the MBU card isn't present, all this will do nothing.

	FORTH(dw_MBU_GO)

	;; Now, on to the detection

	;; Detection strategy: read value at &2000. Set bank 1 to ROM bank 0
        ;; (&80). Read value at &1FF8. If the values differ, we have an MBU. If
        ;; not, change the value. Read it back. If the value has not been
        ;; changed, the bank is ROM (the values just happened to be the
        ;; same). Otherwise, the bank is still RAM. We don't have an MBU.

	LOAD I _mbu_data
	STORE TMP0

	LI &80			; Select ROM bank 0.
	OUT MBU 1		; Map it to &2000-&3fff.

	LOAD I _mbu_data
	XOR TMP0
	SZA
	JMP _mbu_init_yes

	;; Change the data. If the ROM bank has been selected, that won't
	;; happen. Note: this is safe even for Flash chips (they don't normally
	;; obey write instructions unless unlocked via a sequence of special
	;; accesses).
	
	LOAD I _mbu_data	; This is already the same as TMP0
	XOR MINUS1
	STORE I _mbu_data	; Try to write it.
	LOAD I _mbu_data	; Read it back and compare
	XOR TMP0
	SNZ
	JMP _mbu_init_yes	; It's identical: this *IS* the ROM.

_mbu_init_no:
	LI EMF_SANITY
	ENEF

	LI 0			; Return 0.
	PUSH(SP)

	NEXT

_mbu_init_yes:
	LI EMF_SANITY		; Re-enable emulator sanity checks.
	ENEF

	LI CFG_MBU		; Update the system configuration bitmap.
	OR SYSCFG
	STORE SYSCFG

	LI 1			; Return 1.
	PUSH(SP)
	NEXT




	;; word:  MBU?
	;; alias: MBUq
	;; flags: CODE ROM CFT
	;; notes: MBU? ( -- f )
	;;        Returns a non-zero value if the MBU has been detected.

	LI CFG_MBU		; Update the system configuration bitmap.
	AND SYSCFG
	PUSH(SP)
	NEXT
	


// End of file.
