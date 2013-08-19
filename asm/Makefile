#/usr/bin/make

TOOLDIR =	../tools
BUILD =	build

ASM =		$(TOOLDIR)/cftasm
ASMFLAGS +=	

PROGS =		test2
CLEANFILES =	$(BUILD)/a-[0-9][0-9].list a.bin \
		$(BUILD)/$(PROGS:=-[0-9][0-9].list) \
		$(BUILD)/$(PROGS:=.bin) \
		$(BUILD)/*.map $(BUILD)/*.pasm $(BUILD)/*.sym

.PHONY:		all clean $(PROGS)

all:		$(PROGS:=.bin)

clean:	
		rm -f $(CLEANFILES)

test2.bin:	io.asm test2.asm

%:		%.bin

%.bin:		%.asm
		$(ASM) $(ASMFLAGS) -o $@ $^
		mv $(<:.asm=)*{bin,list,pasm,sym} $(BUILD)/

# End of file.
