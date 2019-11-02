#!/usr/bin/make

BUILDDIR =		build
TOOLDIR	=		../tools
#MC =			$(TOOLDIR)/microcode.py
MC =			/usr/bin/mcasm
MCIN =			microcode.mc
MCPARSER = 		$(TOOLDIR)/parse_microcode.py
MKALUROM =		$(TOOLDIR)/make_alu_rom
MCFLAGS += 		-ecsa
#MCFLAGS += 		-r

BASE =			$(BUILDDIR)/microcode
ALUROMLIST =		alu-rom-00.list alu-rom-01.list alu-rom-02.list
ALUROMBIN =		$(ALUROMLIST:.list=.bin)
JSON = 			$(BUILDDIR)/instruction-set.json
DISASM = 		$(BUILDDIR)/disasm.h
HDROUT =		$(BASE).h
MCOUT = 		$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin
MIFOUT = 		$(BASE).mif
#MIF8kOUT = 		$(BASE)-8k.mif

ALUBL =			$(ALUROM)-4bit-00.list $(ALUB)-6bit-00.list
ALUBB =			$(ALUB)-4bit-00.bin $(ALUB)-6bit-00.bin

# ALUUL =		$(ALUU)-00.bin $(ALUU)-01.bin $(ALUU)-02.bin
# ALUUB =		$(ALUU)-00.list $(ALUU)-01.list $(ALUU)-02.list

BINS =			$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin $(ALUBB) $(ALUUB)
LISTS =			$(BASE)-00.list $(BASE)-01.list $(BASE)-02.list $(ALUBL) $(ALUUL)


#.PHONY: 		all clean microcode alu-binary alu-unary
.PHONY: 		all clean microcode json disasm alu-rom

#all:			microcode $(ALUUL) $(ALUUB) $(ALUBL) $(ALUBB) $(JSON) $(DISASM)
all:			microcode alu-rom

clean:
			rm -f *.h *.json

veryclean:
			rm -f *-[0-9][0-9].bin *-[0-9][0-9].list *.h *.json ./$(BUILDDIR)/*

alu-rom \
$(ALUROMLIST) \
$(ALUROMBIN):
			cd $(BUILDDIR); ../$(MKALUROM)

microcode $(BASE)-00.bin: $(MC) $(MCIN)
			$(MC) $(MCFLAGS) $(MCIN) -o $(BASE)

# $(MIF8kOUT):		$(MIFOUT)
# 			egrep -v '^(0|10)' $< | sed -e 's/32768;/8192;/' -e 's/^11//' >$@

json $(JSON):		microcode.mc
			$(MC) -p $< | $(MCPARSER) --json >$@

disasm	$(DISASM):	microcode.mc
			$(MC) -p $< | $(MCPARSER) --disassembly >$@

# End of file.
