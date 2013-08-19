// -*- asm -*-
//
// Logic primitives

	;; word:  TRUE
	;; alias: TRUE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: TRUE ( -- true )
	;;   Pushes true (-1, &ffff) onto the stack.
	CLA NOT
	TRAP T_PUSH
	RTF


	;; word:  FALSE
	;; alias: FALSE
	;; flags: FFL_PRIMITIVE ROM
	;; notes: FALSE ( -- false )
	;;   Pushes false (0) the stack.
	CLA
	TRAP T_PUSH
	RTF


	;; word:  AND
	;; alias: AND
	;; flags: FFL_PRIMITIVE ROM
	;; notes: AND ( a b -- c )
	;;   c is the binary AND of a & b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	AND R31
	TRAP T_PUSH
	RTF


	;; word:  OR
	;; alias: OR
	;; flags: FFL_PRIMITIVE ROM
	;; notes: OR ( a b -- c )
	;;   c is the binary OR of a | b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	OR R31
	TRAP T_PUSH
	RTF


	;; word:  XOR
	;; alias: XOR
	;; flags: FFL_PRIMITIVE ROM
	;; notes: XOR ( a b -- c )
	;;   c is the binary XOR of a ^ b
	TRAP T_POP
	STORE R31
	TRAP T_POP
	XOR R31
	TRAP T_PUSH
	RTF


	;; word:  NOT
	;; alias: NOT
	;; flags: FFL_PRIMITIVE ROM
	;; notes: NOT ( a -- b )
	;;   b is the ones' complement (binary negation) of a
	TRAP T_POP
	NOT
	TRAP T_PUSH
	RTF


// End of file.
