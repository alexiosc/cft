#/usr/bin/make

# This won't work with dash (/bin/sh on many Debianoids)
SHELL = 	/bin/bash

NAME = 		forth
ROMSIZE = 	8192
EMU = 		../emulator/cftemu
ASM = 		../tools/cftasm
ASMFLAGS = 	-m $(NAME).map -a $(NAME).pasm -o $(NAME)-rom.bin -s $(NAME).sym --xpm $(NAME).xpm
ASMDIR = 	../asm
ASMINCLUDES = 	$(ASMDIR)/io.asm $(ASMDIR)/debugging.asm $(ASMDIR)/testing.asm 
SCRIPTDIR = 	scripts
PRIMITIVEDIR = 	primitives
TESTFLAGS +=	-a v1 -t -p $(NAME).pasm -M $(NAME).map
#TESTFLAGS +=	--debug-asm
#TESTFLAGS +=	--debug-microcode

GEN =		_generated_

VECTABLE =	$(GEN)vectable.asm
PRIMITIVES = 	$(GEN)primitives.asm
PRIMTABLE = 	$(GEN)dwtable.asm

SOURCES = \
	forth.asm \
	$(PRIMITIVES) \
	cpuvec.asm \

.PHONY: 	all clean mrproper test

all:		$(NAME).bin

$(NAME).bin:	$(SOURCES) $(ASMINCLUDES) $(ASM)
		$(ASM) $(ASMINCLUDES) $(SOURCES) $(ASMFLAGS) --min-addr=$$[0xe000]
#		@rm $(NAME)-[0-9][0-9].list || true

clean:
		-rm -f _generated_*.asm output *.pasm *.sym *.map *.bin *-[0-9][0-9].list

mrproper:	clean
		-rm *~ primitives/*~

test:		$(NAME).bin $(EMU)
		$(EMU) $(TESTFLAGS) -vv --image-start=$$[0xe000] $(NAME)-rom.bin;

$(VECTABLE):	$(SCRIPTDIR)/mkvectors.py vectable.asm
		$^ >$@

$(PRIMTABLE) \
$(PRIMITIVES):	$(SCRIPTDIR)/mkprimitives.py $(PRIMITIVEDIR)/[0-9]*.asm
		chmod +wr $(PRIMITIVES) || true
		$^ >$(PRIMITIVES)
		chmod -w $(PRIMITIVES)

test-%:		test-%.asm $(ASMINCLUDES)
		$(ASM) $(ASMINCLUDES) --min-addr=$$[0xe000] $@.asm -o $@.bin
		$(EMU) $(TESTFLAGS) -t -vv $@.bin -M $@.map -p $@.pasm

# End of file.
