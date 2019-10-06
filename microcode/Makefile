#!/usr/bin/make

TOOLDIR	=	../tools
#MC =		$(TOOLDIR)/microcode.py
MC =		/usr/bin/mcasm
MCPARSER = 	$(TOOLDIR)/parse_microcode.py
MKALUB =	$(TOOLDIR)/mkbinaryrom.py
MKALUU =	$(TOOLDIR)/mkunaryrom.py
MCFLAGS += 	-ecsa
#MCFLAGS += 	-r

BASE =		microcode
ALUB =		alu-binary
ALUU =		alu-unary
JSON = 		instruction-set.json

ALUBL =		$(ALUB)-4bit-00.list $(ALUB)-6bit-00.list
ALUBB =		$(ALUB)-4bit-00.bin $(ALUB)-6bit-00.bin

ALUUL =		$(ALUU)-00.bin $(ALUU)-01.bin $(ALUU)-02.bin
ALUUB =		$(ALUU)-00.list $(ALUU)-01.list $(ALUU)-02.list


BINS =		$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin $(ALUBB) $(ALUUB)
LISTS =		$(BASE)-00.list $(BASE)-01.list $(BASE)-02.list $(ALUBL) $(ALUUL)


.PHONY: 	all clean microcode alu-binary alu-unary

all:		microcode $(ALUUL) $(ALUUB) $(ALUBL) $(ALUBB) $(JSON)

clean:
		rm -f *.h *.json

veryclean:
		rm -f *-[0-9][0-9].bin *-[0-9][0-9].list *.h *.json

microcode:	microcode-00.bin microcode.h microcode-8k.mif

alu-unary $(ALUUL) $(ALUUB):
		$(MKALUU)

alu-binary $(ALUBL) $(ALUBB):
		$(MKALUB)

%.h \
%-00.bin:	%.mc $(MC)
		$(MC) $(MCFLAGS) $<

%-8k.mif:	%.mif
		egrep -v '^(0|10)' $< | sed -e 's/32768;/8192;/' -e 's/^11//' >$@

$(JSON):	microcode.mc
		$(MC) -p $< | $(MCPARSER) >$@

# End of file.
