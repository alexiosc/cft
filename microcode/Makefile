#!/usr/bin/make

BUILDDIR =		build
TOOLDIR	=		../tools
#MC =			$(TOOLDIR)/microcode.py
#MC ?=			/usr/bin/mcasm
MC ?=			/home/alexios/PROJECTS/RELEASED/mcasm/mcasm/mcasm
MCIN =			microcode.mc
MCPARSER = 		$(TOOLDIR)/parse_microcode.py
MKALUROM =		$(TOOLDIR)/make_alu_rom
GALASM = 		$(TOOLDIR)/galasm
# MKMBUROM =		$(TOOLDIR)/make_mbu_rom
MCFLAGS += 		-ecsa
#MCFLAGS += 		-r

BASE =			$(BUILDDIR)/microcode
JSON = 			$(BUILDDIR)/instruction-set.json
DISASM = 		$(BUILDDIR)/disasm.h
CFTASM = 		$(BUILDDIR)/builtins.asm
HDROUT =		$(BASE).h
VOUT =			$(BASE).v
MCOUT = 		$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin 
MIFOUT = 		$(BASE).mif
#MIF8kOUT = 		$(BASE)-8k.mif

ALUROMLIST =		$(BUILDDIR)/alu-rom-00.list $(BUILDDIR)/alu-rom-01.list $(BUILDDIR)/alu-rom-02.list
ALUROMBIN =		$(ALUROMLIST:.list=.bin)
ALUBL =			$(ALUROM)-4bit-00.list $(ALUB)-6bit-00.list
ALUBB =			$(ALUB)-4bit-00.bin $(ALUB)-6bit-00.bin

# MBUROMLIST =		$(BUILDDIR)/mbu-rom.list
# MBUROMBIN =		$(MBUROMLIST:.list=.bin)

# ALUUL =		$(ALUU)-00.bin $(ALUU)-01.bin $(ALUU)-02.bin
# ALUUB =		$(ALUU)-00.list $(ALUU)-01.list $(ALUU)-02.list

BINS =			$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin $(ALUBB) $(ALUUB)
LISTS =			$(BASE)-00.list $(BASE)-01.list $(BASE)-02.list $(ALUBL) $(ALUUL)

PLDS =			$(BUILDDIR)/mbu-control.jed $(BUILDDIR)/mbu-decode.jed


#.PHONY: 		all clean microcode alu-binary alu-unary
.PHONY: 		all clean microcode json disasm alu-rom

#all:			microcode $(ALUUL) $(ALUUB) $(ALUBL) $(ALUBB) $(JSON) $(DISASM) $(CFTASM)
all:			$(MCOUT) $(HDROUT) $(MIFOUT) $(VOUT) $(JSON) $(DISASM) $(CFTASM) $(ALUROMLIST) $(ALUROMBIN) $(PLDS)

clean:
			rm -f *.h *.json

veryclean:
			rm -f *-[0-9][0-9].bin *-[0-9][0-9].list *.h *.json ./$(BUILDDIR)/*

$(BASE)%:		$(MC) $(MCIN)
			$(MC) $(MCFLAGS) $(MCIN) -o $(BASE)

$(BUILDDIR)/alu-rom%list $(BUILDDIR)/alu-rom%bin:
			cd $(BUILDDIR); ../$(MKALUROM)

$(BUILDDIR)/%.jed:	%.pld
			$(GALASM) $<
			mv *.chp *.fus *.jed *.pin $(BUILDDIR)

# $(BUILDDIR)/mbu-rom%list $(BUILDDIR)/mbu-rom%bin:
# 			cd $(BUILDDIR); ../$(MKMBUROM)

# $(MIF8kOUT):		$(MIFOUT)
# 			egrep -v '^(0|10)' $< | sed -e 's/32768;/8192;/' -e 's/^11//' >$@

json $(JSON):		microcode.mc
			$(MC) -p $< | $(MCPARSER) --json >$@

disasm	$(DISASM):	microcode.mc
			$(MC) -p $< | $(MCPARSER) --disassembly >$@

cftasm	$(CFTASM):	microcode.mc
			$(MC) -p $< | $(MCPARSER) --cftasm >$@

# End of file.
