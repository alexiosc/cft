#/usr/bin/make

NAME = 		forth
EMU = 		../emulator/cftemu
ASM = 		../tools/cftasm
ASMFLAGS = 	-m $(NAME).map -a $(NAME).pasm -o $(NAME).bin -s $(NAME).sym --xpm $(NAME).xpm
ASMDIR = 	../asm
ASMINCLUDES = 	$(ASMDIR)/io.asm $(ASMDIR)/debugging.asm $(ASMDIR)/testing.asm 
SCRIPTDIR = 	scripts
PRIMITIVEDIR = 	primitives
TESTFLAGS =	-t -p $(NAME).pasm -M $(NAME).map
#TESTFLAGS +=	--debug-asm

GEN =		_generated_

VECTABLE =	$(GEN)vectable.asm
PRIMITIVES = 	$(GEN)primitives.asm
PRIMTABLE = 	$(GEN)dwtable.asm

SOURCES = \
	macros.asm \
	regs.asm \
	forthregs.asm \
	$(VECTABLE) \
	forth.asm \
	vectable.asm \
	io.asm \
	stack.asm \
	strings.asm \
	memory.asm \
	dicts.asm \
	numbers.asm \
	math.asm \
	pager.asm \
	$(PRIMITIVES) \
	isr.asm \
	cpuvec.asm

.PHONY: 	all clean mrproper test

all:		$(NAME).bin

$(NAME).bin:	$(SOURCES) $(ASMINCLUDES) $(ASM)
		$(ASM) $(ASMINCLUDES) $(SOURCES) $(ASMFLAGS) 
		@rm $(NAME)-[0-9][0-9].list || true

clean:
		-rm -f _generated_*.asm output *.pasm *.sym *.map *.bin *-[0-9][0-9].list

mrproper:	clean
		-rm *~ primitives/*~

test:		$(NAME).bin $(EMU)
		$(EMU) $(TESTFLAGS) -vv $(NAME).bin;

$(VECTABLE):	$(SCRIPTDIR)/mkvectors.py vectable.asm
		$^ >$@

$(PRIMTABLE) \
$(PRIMITIVES):	$(SCRIPTDIR)/mkprimitives.py $(PRIMITIVEDIR)/[0-9]*.asm
		$^ >$(PRIMITIVES)

# End of file.
