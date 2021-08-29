#!/usr/bin/make -f

CC = gcc
CFLAGS = -g -Wall -std=c99 -D_GNU_SOURCE -fgnu89-inline
CFLAGS += -Wall
CFLAGS += -DUART16550
CFLAGS += -DCFTEMU
CFLAGS += -I..
CFLAGS += -O2
#CFLAGS += -O0
LDFLAGS = -g

LDFLAGS += -lpthread

LDPATH	= $(shell readlink -f ../peripherals/dfp2/firmware)
LDFLAGS	+= -L$(LDPATH) -Wl,-rpath=$(LDPATH)

PROGRAMS = cftemu
# OBJS = cftemu.o cmdline.o emulator.o io.o pasm.o map.o util.o microcode.o \
# 	fifo.o memory.o mbu.o irc.o nvram.o duart.o ide.o video.o dfp.o \
# 	ui.o ui_panel.o ui_menu.o ui_dfp.o ui_vdu.o ui_tty.o uterm.o psg.o 8912.o \
# 	ay8910.o
OBJS = 	cftemu.o cmdline.o util.o ringbuf.o log.o cft.o microcode.o \
	fifo.o \
	io.o irc.o
OBJS += mem.o

# DEB board
OBJS += deb.o
CFLAGS += -DHAVE_DEB

# DFP board
# OBJS += dfp.o
# CFLAGS += -DHAVE_DFP
# LDFLAGS += -ldfp

# TTY board
OBJS += tty.o
CFLAGS += -DHAVE_TTY

# RTC board
OBJS += rtc.o
CFLAGS += -DHAVE_RTC

# TMR board
OBJS += tmr.o
CFLAGS += -DHAVE_TMR

# IDE board
OBJS += ide.o
CFLAGS += -DHAVE_IDE

###############################################################################
#
# GUI SUPPORT
#
###############################################################################

# Uncomment these to enable the GUI

#OBJS		+= uterm.o
#CFLAGS		+= -DGUI
#LDFLAGS	+= $(shell pkg-config --libs sdl)
#LDFLAGS	+= -lX11

# This is necessary to build dependencies at the moment.
CFLAGS		+= $(shell pkg-config --cflags sdl)




# DFP board
#OBJS += dfp.o
#CFLAGS += -DHAVE_DFP

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
