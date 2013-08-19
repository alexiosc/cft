// -*- cftasm -*-

.include "../asm/testing.asm"

&0000:

.include "b.asm"

.str "Hello World"
.strp "Hello World"

.macro foo(a,b,c)

	// Foo: %_n

foo%_:	

	LOAD %a
	ADD %b
	STORE %c
	JMP foo%_

.end

	foo(1,2,3)
	foo  ( 4, 5, 6 )
