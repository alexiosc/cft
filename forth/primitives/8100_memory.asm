// -*- asm -*-
//
// Memory detection.


_mem_init_strmem:
	.strp "MEM:" 0
_mem_init_strram:
	.strp " kw RAM," 0
_mem_init_strrom:
	.strp " kW ROM " 0


	
	;; word:  MEM.INIT
	;; flags: DOCOL ROM CFT
	;; notes: MBU.INIT ( -- )
	;;        Scan and initialise memory.

	doLIT(_mem_init_strmem)
	.word dw_typep0

	;; Disable emulator sanity checking.
	.word dw_SANITY_off
	
	;; If the MBU is present, scan physical memory. If not, scan just the
	;; standard address space.

	.word dw_MBUq		; MBU? ( f ) \ 1 if MBU present
	.word dw_if_branch	; \ branch if zero
	.word _mem_init_nonbanking

_mem_init_banking:

	;; Store the previous setting of bank 3

	doLIT(3)		; 3 ( 3 )
	.word dw_MBU_fetch	; MBU@ ( a )
	.word dw_to_R		; >R ( )

	;; Go through all 256 memory blocks
	
	doLIT(255)		; 255 ( a )
	.word dw_to_R		; >R ( )
	doLIT(0)		; 0 ( u )
	.word dw_DUP		; DUP ( nrom nram )

	
_mem_init_loop1:	

	;; .word dw_R_fetch	; R@ ( nrom nram bank )
	;; .word dw_PRINTD

	;; Set the bank
	.word dw_R_fetch	; R@ ( nrom nram bank )
	doLIT(3)
	.word dw_MBU_store	; MBU! (nrom nram )

	;; .word dw_times_BANK	; *BANK ( nrom nram addr )
	doLIT(&6000)		; &6000 ( nrom nram &6000 ) \Start of bank #3
	.word dw__MEMq		; MEM? ( nrom nram f1 f2 )
	.word dw_DPLUS		; D+ ( nrom' nram' )


	.word dw_R_from		; R> ( nrom nram bank )
	.word dw_if_DUP		; ?DUP ( nrom nram bank bank | nrom nram 0 )
	.word dw_if_branch	;   branch
	.word _mem_init_end1

	.word dw_dec		; 1- ( nrom nram bank-1 )
	.word dw_to_R		; >R ( nrom nram )
	.word dw_branch
	.word _mem_init_loop1

_mem_init_end1:

	;; Restore the bank configuration
	.word dw_R_from		; R> ( bank )
	doLIT(3)		; 3 ( bank 3 )
	.word dw_MBU_store	; MBU!

_mem_init_report:

	;; Disable emulator sanity checking.
	.word dw_SANITY_on

	;; ( nrom nram )
	.word dw_2DUP		; 2DUP ( nrom nram nrom nram )
	.word dw_256mul		; 256* ( nrom nram nrom nram<<8 )
	.word dw_OR		; OR ( nrom nram nram<<8|nrom )
	doLIT(@SYSMEM&&3ff)	; SYSMEM (remove R bit to get actual address)
	.word dw_store		; Store it.
	
	.word dw_16mul		; 16*
	.word dw_2div		; 2/
	.word dw_dot		; . ( nrom )
	doLIT(_mem_init_strram)
	.word dw_typep0

	.word dw_16mul		; 16*
	.word dw_2div		; 2/
	.word dw_dot		; . ( )

	doLIT(_mem_init_strrom)
	.word dw_typep0

	.word dw_EXIT
	
_mem_init_nonbanking:

	;; Go through all 8 memory, 8kW at a time.
	
	doLIT(7)		; 7 ( a )
	.word dw_to_R		; >R ( )
	doLIT(0)		; 0 ( u )
	.word dw_DUP		; DUP ( nrom nram )

_mem_init_loop2:	

	;; Get the address
	.word dw_R_fetch	; R@ ( nrom nram bank )
	.word dw_BANKS		; BANKS ( nrom nram bank<<13 )
	.word dw__MEMq		; MEM? ( nrom nram f1 f2 )
	.word dw_DPLUS		; D+ ( nrom' nram' )

	.word dw_R_from		; R> ( nrom nram bank )
	.word dw_if_DUP		; ?DUP ( nrom nram bank bank | nrom nram 0 )
	.word dw_if_branch	;   branch
	.word _mem_init_report

	.word dw_dec		; 1- ( nrom nram bank-1 )
	.word dw_to_R		; >R ( nrom nram )
	.word dw_branch
	.word _mem_init_loop2



	;; word:  _MEM?
	;; alias: _MEMq
	;; flags: CODE ROM CFT
	;; notes: _MEM? ( a -- 1 0 | 0 1 | 0 0 )
	;;        Checks address a for writeability. Returns f1 which is 1 iff
        ;;        ROM was found, and f2 which is 1 iff RAM was found. Values of
        ;;        &FFFF or &0000 are non-memory and f1=f2=0 is returned.

	//DEBUGON
	SPEEK(SP)
	STORE TMP1
	LOAD I TMP1
	STORE TMP2

	XOR MINUS1
	STORE I TMP1
	LOAD I TMP1
	XOR TMP2

	SNZ
	JMP _MEMq_maybe_ROM

_MEMq_RAM:
	LOAD TMP2		; Restore the value
	STORE I TMP1
	LI 0
	SPOKE0(SP)
	LI 1
	PUSH(SP)
	NEXT

_MEMq_maybe_ROM:
	LOAD TMP2
	XOR MINUS1		; Is it &FFFF?
	SNZ
	JMP _MEMq_no		; Yes. It's probably not memory (bus pull-up).

	LI 0
	XOR TMP2		; Is it &0000?
	SZA
	JMP _MEMq_ROM		; Yes. It's probably not memory (bus pull-up).

_MEMq_no:
	LI 0
	SPOKE0(SP)
	PUSH(SP)
	NEXT

_MEMq_ROM:
	LI 1
	SPOKE0(SP)
	LI 0
	PUSH(SP)
	NEXT



// End of file.
