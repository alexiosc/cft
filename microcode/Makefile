#!/usr/bin/make

TOOLDIR	=	../tools
MC =		$(TOOLDIR)/microcode.py
MKALUB =	$(TOOLDIR)/mkbinaryrom.py
MKALUU =	$(TOOLDIR)/mkunaryrom.py
MCFLAGS += 	-e -c

BASE =		microcode
ALUB =		alub-binary
ALUU =		alub-unary

ALUBL =		$(ALUB)-00.list
ALUBB =		$(ALUB)-00.bin

ALUUL =		$(ALUU)-00.bin $(ALUU)-01.bin $(ALUU)-02.bin
ALUUB =		$(ALUU)-00.list $(ALUU)-01.list $(ALUU)-02.list


BINS =		$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin $(ALUBB) $(ALUUB)
LISTS =		$(BASE)-00.list $(BASE)-01.list $(BASE)-02.list $(ALUBL) $(ALUUL)


.PHONY: 	all clean microcode alu-binary alu-unary

all:		microcode alu-binary alu-unary

clean:
		rm -f *-[0-9][0-9].bin *-[0-9][0-9].list *.h

microcode:	microcode-00.bin

alu-unary $(ALUUL) $(ALUUB):
		$(MKALUU)

alu-binary $(ALUBL) $(ALUBB):
		$(MKALUB)

%-00.bin:	%.mc $(MC)
		$(MC) $(MCFLAGS) $<

# End of file.
