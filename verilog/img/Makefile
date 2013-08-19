#/usr/bin/make

TOOLDIR =	../../tools
ASMDIR =	../../asm
BUILD =		.

ASM =		$(TOOLDIR)/cftasm
ASMFLAGS +=	--min-addr=49152

ASMLIBS +=	$(ASMDIR)/io.asm $(ASMDIR)/testing.asm

PROGS =		a
CLEANFILES =	$(BUILD)/a-[0-9][0-9].list a.bin \
		$(BUILD)/$(PROGS:=-[0-9][0-9].list) \
		$(BUILD)/$(PROGS:=.bin) \
		$(BUILD)/*.map $(BUILD)/*.pasm $(BUILD)/*.sym

.PHONY:		all clean $(PROGS)

all:		$(PROGS:=.bin)

clean:	
		rm -f $(CLEANFILES)

%:		%.bin

%.bin:		%.asm
		$(ASM) $(ASMFLAGS) $(ASMLIBS) -o $@ $^

romfont:	../../emulator/romfont.bin
		dd if=$< bs=32k conv=sync | $(TOOLDIR)/bin2list.py /dev/stdin > vdu-cg0.list


# End of file.
