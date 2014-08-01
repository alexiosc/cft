#!/usr/bin/make -f

all: rom.js

BASEADDR = 	32768
CFTDIR =	../..
MCDIR =		$(CFTDIR)/microcode
ROMDIR =	rom
ROMBASE =	a
OUT = 		$(ROMDIR)/$(ROMBASE)
ROMBIN =	$(OUT).bin
ROMSRC =	$(OUT).asm
CFTASM =	$(CFTDIR)/tools/cftasm -I $(CFTDIR)/.. --min-addr=$(BASEADDR) --xpm=map.xpm

rom.js:		$(ROMDIR)/$(ROMBASE).bin
		scripts/rom.py $^ > $@

$(ROMBIN):	$(ROMSRC)
		(cd $(ROMDIR); ../$(CFTASM) $(notdir $(ROMSRC)))

clean:
		rm -f rom.js microcode.js *~ $(OUT)*.list $(OUT).pasm $(OUT).sym $(OUT).bin $(OUT).map $(ROMDIR)/rom.js

upload:
		rsync -vaz . graviera:bedroomlan/www/local/cftjs2/ --exclude='*~' --exclude=termlib --exclude=fonts
