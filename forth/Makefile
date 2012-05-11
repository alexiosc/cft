#/usr/bin/make

# This won't work with dash (/bin/sh on many Debianoids)
SHELL = 	/bin/bash
VIEWER =	gwenview

NAME = 		forth
#ROMSIZE = 	8192
ROMSIZE = 	16384
ARCH =		v2-16k
ROMIMAGE =	$(NAME)-rom.bin
EMU = 		../emulator/cftemu
ASM = 		../tools/cftasm
ASMFLAGS = 	-m $(NAME).map -a $(NAME).pasm -o $(ROMIMAGE) -s $(NAME).sym --xpm $(NAME).xpm
ASMDIR = 	../asm
ASMINCLUDES = 	$(ASMDIR)/io.asm $(ASMDIR)/debugging.asm $(ASMDIR)/testing.asm 
SCRIPTDIR = 	scripts
PRIMITIVEDIR = 	primitives
TESTFLAGS :=	-a $(ARCH) -t -p $(NAME).pasm -M $(NAME).map $(TESTFLAGS)
TESTFLAGS +=	--sentinel
TESTFLAGS +=	--nvram
TESTFLAGS +=    --hd0 hd0.bin
TESTFLAGS +=    --ide-speed 1000
#TESTFLAGS +=	--debug-asm
#TESTFLAGS +=	--debug-microcode

DEBUGGER = 	gdb

GEN =		_generated_

TABLES =	$(GEN)tables.asm
PRIMITIVES = 	$(GEN)primitives.asm
PRIMTABLE = 	$(GEN)dwtable.asm

SOURCES = 	*.asm $(PRIMITIVES) $(TABLES)

.PHONY: 	all clean mrproper test remote view tasks tags todo

all:		$(ROMIMAGE)

$(ROMIMAGE):	$(SOURCES) $(ASMINCLUDES) $(ASM)
		$(ASM) $(NAME).asm $(ASMFLAGS) --min-addr=$$[0x10000 - $(ROMSIZE)]
#		@rm $(NAME)-[0-9][0-9].list || true

clean:
		-rm -f _generated_*.asm output{,[0-9]} *.pasm *.sym *.map
		-rm -f $(ROMIMAGE) *-[0-9][0-9].list

mrproper:	clean
		-rm *~ primitives/*~

test:		$(ROMIMAGE) $(EMU)
		$(EMU) $(TESTFLAGS) $(ROMIMAGE);
#		$(EMU) $(TESTFLAGS) -vv --image-start=$$[0xe000] $(ROMIMAGE);

view:		$(ROMIMAGE)
		$(VIEWER) $(NAME).xpm

$(TABLES):	$(SCRIPTDIR)/mkvectors.py tables.asm
		[ -e $(TABLES) ] && chmod +wr $(TABLES) || true
		$^ >$@
		chmod -w $(TABLES)

$(PRIMTABLE) \
$(PRIMITIVES):	$(SCRIPTDIR)/mkprimitives.py $(PRIMITIVEDIR)/[0-9]*.asm
		[ -e $(PRIMITIVES) ] && chmod +wr $(PRIMITIVES) || true
		$^ >$(PRIMITIVES)
		chmod -w $(PRIMITIVES)

test-%:		test-%.asm $(ASMINCLUDES)
		$(ASM) $(ASMINCLUDES) --min-addr=$$[0x10000 - $(ROMsiZE)] $@.asm -o $@.bin
		$(EMU) $(TESTFLAGS) -t -vv $@.bin -M $@.map -p $@.pasm

remote:
		xterm -title 'CFT Mini-Computer emulator' \
			-geometry 90x25 \
			-name myTerm -bg black -fg gray70 -fn 7x14 \
			-ah \
			-e make remote-run &

remote-run:
		\rm -f output
		mkfifo output
		while [ -p output ]; do clear; cat output; echo -e '\n\n\n\033[0;1;32m*** simulation finished ***\033[0m'; sleep 5; done


tasks tags todo:
		rgrep -En '(TODO|FIXME|XXX):' . | scripts/tags.py

debug:		$(ROMIMAGE) $(EMU)
		\rm -f output
		$(DEBUGGER) --args $(EMU) $(TESTFLAGS) -vv $(ROMIMAGE)

# End of file.
