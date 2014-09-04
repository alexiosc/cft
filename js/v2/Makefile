#!/usr/bin/make -f

all: rom.js cal.js

.PHONY: 	all clean upload test

BASEADDR = 	32768
CFTDIR =	../..
MCDIR =		$(CFTDIR)/microcode
ROMDIR =	rom
ROMBASE =	rom-v0.2
CALBASE = 	calibrate
OUT = 		$(ROMDIR)/$(ROMBASE)
CALOUT = 	$(ROMDIR)/$(CALBASE)
ROMBIN =	$(OUT).bin
ROMSRC =	$(OUT).asm
CALROMBIN =	$(CALOUT).bin
CALROMSRC =	$(CALOUT).asm
CFTASM =	$(CFTDIR)/tools/cftasm -I $(CFTDIR)/.. --min-addr=$(BASEADDR) --xpm=map.xpm
CFTEMU =	$(CFTDIR)/emulator/cftemu $(CFTEMUOPTS)
CFTEMUOPTS =	-a v4 -V

cal.js:		$(ROMDIR)/$(CALBASE).bin
#		dd if=$(ROMDIR)/$(CALBASE).bin of=$(ROMDIR)/$(CALBASE).bin~ bs=2k count=64k
#		mv $(ROMDIR)/$(CALBASE).bin~ $(ROMDIR)/$(CALBASE).bin
		scripts/rom.py $^ 32768 > $@

rom.js:		$(ROMDIR)/$(ROMBASE).bin
		scripts/rom.py $^ > $@

$(ROMDIR)/%.bin:	$(ROMDIR)/%.asm
			f=$(notdir $(basename $^)); (cd $(ROMDIR); ../$(CFTASM) $$f.asm -o $$f.bin)

clean:
		-rm -f rom.js microcode.js *~ $(ROMDIR)/*.list \
		$(ROMDIR)/*.pasm $(ROMDIR)/*.sym $(ROMDIR)/*.bin \
		$(ROMDIR)/*.map $(ROMDIR)/*.js $(ROMDIR)/*.xpm

upload:         all
		rsync -vaz . graviera:bedroomlan/www/local/cftjs2/ --exclude='*~' --exclude=termlib --exclude=fonts

test:		all
		$(CFTEMU) $(ROMBIN)
