#!/bin/make -f

CC		=	gcc
CFLAGS		=	-Wall -pedantic -O3 -s

PROGRAMS	=	control disasm uaddr
TARGETS		=	$(PROGRAMS) disasm_ir10

.PHONY:	clean

all:		$(TARGETS)

#control:	control.c

#filter:		filter.c

disasm:		disasm.c

disasm_ir10:	disasm
		ln -s disasm disasm_ir10

clean:
		-rm -f $(TARGETS)
