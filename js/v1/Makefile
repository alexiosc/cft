#!/usr/bin/make -f

all: microcode.js rom.js

CFTDIR =	/home/alexios/PROJECTS/HARDWARE/cft
MCDIR =		$(CFTDIR)/microcode
ROMDIR =	rom
ROMBASE =	a
OUT = 		$(ROMDIR)/$(ROMBASE)
ROMBIN =	$(OUT).bin
ROMSRC =	$(OUT).asm
CFTASM =	$(CFTDIR)/tools/cftasm

MICROCODE =	$(MCDIR)/microcode-00.bin \
		$(MCDIR)/microcode-01.bin \
		$(MCDIR)/microcode-02.bin

microcode.js:	$(MICROCODE)
		( scripts/microcode.py $(MCDIR) > microcode.js )

rom.js:		$(ROMDIR)/$(ROMBASE).bin
		( cd $(CFTDIR); scripts/rom.py $^ > $@ )

$(ROMBIN):	$(ROMSRC)
		( cd $(ROMDIR); $(CFTASM) $(notdir $(ROMSRC)) )

clean:
		rm -f rom.js microcode.js *~ $(OUT)*.list $(OUT).pasm $(OUT).sym $(OUT).bin $(OUT).map $(ROMDIR)/rom.js

upload:
		rsync -vaz . graviera:bedroomlan/www/local/cftjs/ --exclude='*~' --exclude=termlib --exclude=fonts
