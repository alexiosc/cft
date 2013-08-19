// -*- asm -*-
//
// Variables.

	
 
	;; word:  SYSCFG
	;; flags: CODE ROM CFT
	;; notes: SYSCFG ( -- u )
	;;        The system configuration value.

	LOAD SYSCFG
	PUSH SP
	NEXT

	
 
	;; word:  SYSMEM
	;; flags: CODE ROM CFT
	;; notes: SYSMEM ( -- u1 u2 )
	;;        Returns the amount of installed ROM (in u1) and the amount of
        ;;        installed RAM (in u2). Both are expressed in units of 8kW
        ;;        blocks.

	LOAD SYSMEM
	GETLOCHAR()
	PUSH(SP)

	LOAD SYSMEM
	GETHICHAR()
	PUSH(SP)
	NEXT

	
 
	;; word:  UP@
	;; alias: UP_fetch
	;; flags: CODE ROM
	;; notes: UP@ ( -- a )
	;;        The base address of the user area.
	
	RPUSH(SP, UP)
	NEXT

	
 
	;; word:  SP0
	;; flags: USER ROM
	;; notes: SP0 ( -- a )
	;;        The base address of the data stack.
	
	.word 	UAOFS_SP0

	
 
	;; word:  RP0
	;; flags: USER ROM
	;; notes: RP0 ( -- a )
	;;        The base address of the return stack.
	
	.word 	UAOFS_RP0

	
 
	;; word:  STATE
	;; flags: USER ROM
	;; notes: STATE ( -- a )
	;;        The address of the STATE variable, the Forth language state.
	;;        If STATE @ is zero, we are interpreting. Otherwise, we're
	;;        compiling. User programs may not change this variable
	;;        directly.
	
	.word	UAOFS_STATE

	
 
	;; word:  BASE
	;; flags: USER ROM
	;; notes: BASE ( -- a )
	;;        The address of the BASE variable, which defines the current
	;;        number base.
	
	.word	UAOFS_BASE


	
	;; word:  BASE>R
	;; alias: BASE_to_R
	;; flags: CODE ROM CFT
	;; notes: BASE>R ( -- )
	;;        Pushes the value of BASE onto the return stack.

	LOADUP(UAOFS_BASE)
	PUSH RP
	NEXT


	
	;; word:  R>BASE
	;; alias: R_to_BASE
	;; flags: CODE ROM CFT
	;; notes: R>BASE ( -- )
	;;        Pops a value from the return stack and stores it in BASE.

	RPOP(TMP1, RP)
	STOREUP(UAOFS_BASE, TMP1)
	NEXT


	
	;; word:  #TIB
	;; alias: cTIB
	;; flags: USER ROM
	;; notes: #TIB ( -- n )
	;;        Return the address of the variable holding the number of
	;;        characters in the Terminal Input Buffer.
	
	.word UAOFS_cTIB


	
	;; word:  TIB
	;; flags: USER ROM
	;; notes: TIB ( -- a )
	;;   Return the address of the first character in the Terminal Input
	;;   Buffer.
	
	.word UAOFS_TIB


	
	;; word:  TIBADDR
	;; flags: CONST ROM
	;; notes: TIBADDR ( -- a )
	;;        The default, boot-time address of the terminal input buffer.
	
	.word TIBADDR



	;; word:  TIBS
	;; flags: CONST ROM
	;; notes: TIBS ( -- a )
	;;        The defualt, boot-time size of the TIB.
	
	.word TIBS



	;; word:  >IN
	;; alias: ofsIN
	;; flags: USER ROM
	;; notes: >IN ( -- a )
	;;        The address of the offset into the current input stream.

	.word UAOFS_ofsIN


	
	;; word:  SPAN
	;; flags: USER ROM
	;; notes: SPAN ( -- a )
	;;        Returns the address of the SPAN variable.

	.word	UAOFS_SPAN


	
	;; word:  BLK
	;; flags: USER ROM
	;; notes: BLK ( -- a )
	;;        Returns the address of the block number currently being
        ;;        interpreted. If 0, input is from the terminal.

	.word	UAOFS_BLK


	
	;; word:  >BLK
	;; alias: pBLK
	;; flags: USER ROM CFT
	;; notes: >BLK ( -- a )
	;;        Returns the address of a pointer into the current block being
        ;;        interpreted.

	.word	UAOFS_pBLK


	
	;; word:  #BLK
	;; alias: cBLK
	;; flags: USER ROM CFT
	;; notes: #BLK ( -- +n )
	;;        Returns the length of the last block (after trimming for trainling junk).

	.word	UAOFS_cBLK


	
	;; word:  BLKBUF
	;; flags: USER ROM CFT
	;; notes: BLKBUF ( -- a )
	;;        Returns the address of a pointer to the current block buffer.

	.word	UAOFS_BLKBUF


	
	;; word:  BLKBUF0
	;; flags: USER ROM CFT
	;; notes: BLKBUF0 ( -- a )
	;;        Returns the address of a pointer to the first block buffer.

	.word	UAOFS_BLKBUF0


	
	;; word:  BLKBUF1
	;; flags: USER ROM CFT
	;; notes: BLKBUF1 ( -- a )
	;;        Returns the address of a pointer to the first block buffer.

	.word	UAOFS_BLKBUF1


	
	;; word:  BLKBS
	;; flags: CONST ROM CFT
	;; notes: BLKBS ( -- +n )
	;;        Returns the block buffer size.

	.word	BLKBS


	
	;; word:  >LINE
	;; alias: pLINE
	;; flags: USER ROM CFT
	;; notes: >LINE ( -- a )
	;;        Returns the address of the offset of the current line into the current block.

	.word	UAOFS_pLINE


	
	;; word:  #LINE
	;; alias: cLINE
	;; flags: USER ROM CFT
	;; notes: #LINE ( -- +n )
	;;        Returns the length of the last line parsed from the block buffer.

	.word	UAOFS_cLINE


	
	;; word:  HLD
	;; flags: USER ROM
	;; notes: HLD ( -- a )
	;;        Returns the address of the HLD pointer.

	.word	UAOFS_HLD



	;; word:  CURRENT
	;; flags: USER ROM
	;; notes: CURRENT ( -- a )
	;;        The address of the CURRENT variable, which points to the
	;;        vocabulary to add new words to.
	
	.word	UAOFS_CURRENT



	;; word:  pCONTEXT
	;; flags: USER ROM
	;; notes: pCONTEXT ( -- a )
	;;        The address of the pCONTEXT variable, which holds the
	;;        vocabulary stack pointer.
	
	.word	UAOFS_pCONTEXT


	
	;; word:  CONTEXT
	;; flags: USER ROM
	;; notes: CONTEXT ( -- a )
	;;        The address of the CONTEXT variable, which points to the
	;;        bottom of the vocabulary stack.
	
	.word	UAOFS_CONTEXT


	
	;; word:  CSP
	;; flags: USER ROM CFT
	;; notes: CONTEXT ( -- a )
	;;        The address of the CSP.
	
	.word	UAOFS_CSP


	
	;; word:  HANDLER
	;; flags: USER ROM CFT
	;; notes: CONTEXT ( -- a )
	;;        The address of the HANDLER.
	
	.word	UAOFS_HANDLER


	
	;; word:  DISKUNIT
	;; flags: USER ROM CFT
	;; notes: DISKUNIT ( -- a )
	;;        The address of the DISKUNIT variable.
	
	.word	UAOFS_DISKUNIT


	
	;; word:  ROTOR
	;; flags: USER ROM CFT
	;; notes: ROTOR ( -- a )
	;;        The address of the ROTOR variable.
	
	.word	UAOFS_ROTOR


	
	;; word:  'EMIT
	;; alias: tick_EMIT
	;; flags: USER ROM
	;; notes: 'EMIT ( -- a )
	;;        The base address of a word to output characters.
	
	.word 	UAOFS_EMIT

	
 
	;; word:  'INSRC
	;; alias: tick_INSRC
	;; flags: USER ROM CFT
	;; notes: 'INSRC ( -- a )
	;;        The address of a word to return the current input buffer and buffer size.
	
	.word	UAOFS_INSRC


	;; word:  '.READY
	;; alias: tick_dot_READY
	;; flags: USER ROM CFT
	;; notes: '.READY ( -- a | 0 )
	;;        The address of the message printed when QUIT runs.
	
	.word	UAOFS_READY


	
	;; word:  '.PS1
	;; alias: tick_dot_PS1
	;; flags: USER ROM CFT
	;; notes: '.PS1 ( -- a | 0 )
	;;        The address of the start-of-line prompt vector (or 0).
	
	.word	UAOFS_PS1


	
	;; word:  '.PS2
	;; alias: tick_dot_PS2
	;; flags: USER ROM CFT
	;; notes: '.PS2 ( -- a | 0 )
	;;        The address of the end-of-line prompt vector (or 0).
	
	.word	UAOFS_PS2

	
	
	;; word:  '.OK
	;; alias: tick_dot_OK
	;; flags: USER ROM CFT
	;; notes: '.OK ( -- a | 0 )
	;;        The address of the .OK prompt vector (or 0).
	
	.word	UAOFS_OK

	
	
	;; word:  'EVAL
	;; alias: tick_EVAL
	;; flags: USER ROM CFT
	;; notes: 'EVAL ( -- a | 0 )
	;;        The address of the EVAL vector (or 0).
	
	.word	UAOFS_EVAL

	
	
	;; word:  'NUMBER
	;; alias: tick_NUMBER
	;; flags: USER ROM CFT
	;; notes: 'NUMBER ( -- a | 0 )
	;;        The address of the NUMBER vector (or 0).
	
	.word	UAOFS_NUMBER

	
	
	;; word:  'EOB?
	;; alias: tick_EOBq
	;; flags: USER ROM CFT
	;; notes: 'EOB? ( -- a | 0 )
	;;        The address of the EOB? vector (or 0).
	
	.word	UAOFS_EOBq

	
	
	;; word:  'EOL?
	;; alias: tick_EOLq
	;; flags: USER ROM CFT
	;; notes: 'EOL? ( -- a | 0 )
	;;        The address of the EOB? vector (or 0).
	
	.word	UAOFS_EOLq



// End of file.
