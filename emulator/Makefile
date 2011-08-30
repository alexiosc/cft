#/usr/bin/make

CC = gcc
CFLAGS = -g -O2 -Wall -pedantic -std=c99 -D_GNU_SOURCE -fgnu89-inline
LDFLAGS = -g

PROGRAMS = cftemu
OBJS = cftemu.o cmdline.o emulator.o io.c pasm.c map.c util.c microcode.c

ASMINCLUDES = ../../asm/io.asm ../../asm/debugging.asm ../../asm/testing.asm 

.PHONY: 	all dep test

all:		$(PROGRAMS)

dep .depends:
		$(CC) $(CFLAGS) -M *.c >.depends

clean:
		-rm -rf *.o $(PROGRAMS) .depends .test

test:		$(PROGRAMS)
		@mkdir .test 2>/dev/null || true
		@echo Assembling...
		cd .test; ../../tools/cftasm $(ASMINCLUDES) ../../asm/test2.asm \
			-m test.map -a test.pasm -o test.bin -s test.sym
		@echo "Emulating..."
		cd .test; ../cftemu $(TESTFLAGS) -vv test.bin;

echo:		$(PROGRAMS)
		@mkdir .test 2>/dev/null || true
		@echo Assembling...
		cd .test; ../../tools/cftasm $(ASMINCLUDES) ../../asm/echo.asm \
			-m test.map -a test.pasm -o test.bin -s test.sym
		@echo "Emulating..."
		cd .test; ../cftemu $(TESTFLAGS) -vv test.bin;

line-edit:	$(PROGRAMS)
		@mkdir .test 2>/dev/null || true
		@echo Assembling...
		cd .test; ../../tools/cftasm $(ASMINCLUDES) ../../asm/line-edit.asm \
			-m test.map -a test.pasm -o test.bin -s test.sym
		@echo "Emulating..."
		cd .test; ../cftemu $(TESTFLAGS) -vv test.bin;

pforth:		$(PROGRAMS)
		@mkdir .test 2>/dev/null || true
		@echo Assembling...
		cd .test; ../../tools/cftasm $(ASMINCLUDES) ../../asm/pforth.asm \
			-m test.map -a test.pasm -o test.bin -s test.sym
		@echo "Emulating..."
		cd .test; ../cftemu $(TESTFLAGS) -vv test.bin;

cftemu: $(OBJS)

include .depends

# End of file.
