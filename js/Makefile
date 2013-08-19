#!/usr/bin/make -f

all: microcode.js rom.js

CFTDIR =	..
MCDIR =		$(CFTDIR)/microcode
ROMDIR =	rom
ROMBASE =	a
ROMBIN =	$(ROMDIR)/$(ROMBASE).bin
ROMSRC =	$(ROMDIR)/$(ROMBASE).asm
CFTASM =	$(CFTDIR)/tools/cftasm

MICROCODE =	$(MCDIR)/microcode-00.bin \
		$(MCDIR)/microcode-01.bin \
		$(MCDIR)/microcode-02.bin

microcode.js:	$(MICROCODE)
		scripts/microcode.py > microcode.js

rom.js:		$(ROMDIR)/$(ROMBASE).bin
		scripts/rom.py $^ > $@

$(ROMBIN):	$(ROMSRC)
		(cd $(ROMDIR); ../$(CFTASM) $(notdir $(ROMSRC)))

clean:
		rm -f rom.js microcode.js *~

upload:
		rsync -vaz . graviera:bedroomlan/www/local/cftjs/ --exclude='*~' --exclude=termlib --exclude=fonts
