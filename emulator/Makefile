#!/usr/bin/make -f

CC = gcc
CFLAGS = -g -Wall -std=c99 -D_GNU_SOURCE -fgnu89-inline
CFLAGS += -Wall
CFLAGS += -DUART16550
CFLAGS += -DCFTEMU
CFLAGS += -I..
#CFLAGS += -O2
CFLAGS += -O0
LDFLAGS = -g

CFLAGS  += $(shell pkg-config --cflags sdl)
LDFLAGS += $(shell pkg-config --libs sdl)
LDFLAGS += -lX11
LDFLAGS += -lpthread

LDPATH	= $(shell readlink -f ../front-panel/lib)
LDFLAGS	+= -L$(LDPATH) -Wl,-rpath=$(LDPATH) -ldfp

PROGRAMS = cftemu
# OBJS = cftemu.o cmdline.o emulator.o io.o pasm.o map.o util.o microcode.o \
# 	fifo.o memory.o mbu.o irc.o nvram.o duart.o ide.o video.o dfp.o \
# 	ui.o ui_panel.o ui_menu.o ui_dfp.o ui_vdu.o ui_tty.o uterm.o psg.o 8912.o \
# 	ay8910.o
OBJS = util.o log.o cft.o cmdline.o cftemu.o microcode.o mem.o
GENERATED = romfont.h

ASMINCLUDES = ../../asm/io.asm ../../asm/debugging.asm ../../asm/testing.asm 

.PHONY: 	all dep test

all:		$(GENERATED) $(PROGRAMS)

cftemu:		$(OBJS) $(DFPOBJS)
		$(CC) $(OBJS) $(DFPOBJ) -o $@ $(LDFLAGS)

dep .depends:   $(GENERATED)
		$(CC) $(CFLAGS) -M *.c >.depends

clean:
		-rm -rf *.o $(PROGRAMS) .depends .test $(GENERATED) romfont.fnt

cftemu: $(OBJS)

romfont.fnt:	FixedMedium-13-patched.bdf bdf2bin.py
		./bdf2bin.py $< >$@

romfont.h: 	romfont.fnt bin2h.py
		./bin2h.py $< romfont >$@ || rm -f $@

include .depends

# End of file.
