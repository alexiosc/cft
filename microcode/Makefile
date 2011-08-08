#!/usr/bin/make

TOOLDIR	=	../tools
MC =		$(TOOLDIR)/microcode.py
MCFLAGS += 	-e -c

BASE =		microcode

BINS =		$(BASE)-00.bin $(BASE)-01.bin $(BASE)-02.bin
LISTS =		$(BASE)-00.list $(BASE)-01.list $(BASE)-02.list

.PHONY: 	all clean microcode

all:		microcode

clean:
		rm -f *-[0-9][0-9].bin *-[0-9][0-9].list *.h

microcode:	microcode-00.bin

%-00.bin:	%.mc $(MC)
		$(MC) $(MCFLAGS) $<

# End of file.
