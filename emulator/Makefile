#/usr/bin/make

CC = gcc
CFLAGS = -g -Wall -std=c99 -D_GNU_SOURCE -fgnu89-inline
CFLAGS += -O2
#CFLAGS += -O0
LDFLAGS = -g

PROGRAMS = cftemu
OBJS = cftemu.o cmdline.o emulator.o io.c pasm.c map.c util.c microcode.c \
	fifo.o memory.o mbu.o nvram.o duart.o ide.o panel.o debug.o

ASMINCLUDES = ../../asm/io.asm ../../asm/debugging.asm ../../asm/testing.asm 

.PHONY: 	all dep test

all:		$(PROGRAMS)

dep .depends:
		$(CC) $(CFLAGS) -M *.c >.depends

clean:
		-rm -rf *.o $(PROGRAMS) .depends .test

cftemu: $(OBJS)

include .depends

# End of file.
