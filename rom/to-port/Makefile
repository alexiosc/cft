#!/usr/bin/make -f

BASENAME =	rom

BASEADDR = 	32768
CFTDIR =	..
TOOLDIR =	$(CFTDIR)/tools
MCDIR =		$(CFTDIR)/microcode
DOCDIR =	$(CFTDIR)/documentation
EMUDIR =	$(CFTDIR)/emulator

SRCDIR =	src
GENDIR = 	generated
SCRIPTDIR = 	scripts
BUILDDIR =	build

ROMSRC =	$(SRCDIR)/$(BASENAME).asm

ROMBIN =	$(BUILDDIR)/$(BASENAME).bin
XPMFILE = 	$(BUILDDIR)/$(BASENAME).xpm
MAPFILE =	$(BUILDDIR)/$(BASENAME).map
PASMFILE =	$(BUILDDIR)/$(BASENAME).pasm
CFTEMU =	$(CFTDIR)/emulator/cftemu $(CFTEMUOPTS)
CFTEMUOPTS +=	-a v4 -M $(MAPFILE) -p $(PASMFILE)
#CFTEMUOPTS +=	-V
CFTEMUOPTS +=	--nvram
CFTEMUOPTS +=	--hd0=hd0
#CFTEMUOPTS +=	--hd1=hd1
#CFTEMUOPTS +=	--hd2=hd2
#CFTEMUOPTS +=	--hd3=hd3
#CFTEMUOPTS +=	--debug-irc
#CFTEMUOPTS +=	--debug-ide
CFTEMUOPTS +=	--dfp-pts
#CFTEMUOPTS +=	--debug-mem

BASEVECASM =	$(GENDIR)/base-vectable.asm
FORTHVECASM =	$(GENDIR)/forth-vectable.asm

LOGOASM =	$(GENDIR)/cft-logo.asm
LOGO =		$(DOCDIR)/logo/cft-logo-v2-cftbanner.png

FONTASM =	$(GENDIR)/romfont.asm
FONT =		$(EMUDIR)/romfont.fnt
FONT2ASM =	$(SCRIPTDIR)/mkromfont

KEYMAPASM =	$(GENDIR)/keymap.asm
MKKEYMAP =	$(SCRIPTDIR)/mkkeymap

GENASM =	$(BASEVECASM) $(FORTHVECASM) $(LOGOASM) $(FONTASM) $(KEYMAPASM)

CFTASM =	$(TOOLDIR)/cftasm
CFTASMFLAGS =	-I $(CFTDIR) --min-addr=$(BASEADDR)
CFTASMFLAGS +=	--xpm=$(XPMFILE)
IMG2ASM =	$(TOOLDIR)/vdu-img2asm

all:		$(ROMBIN)

.PHONY: 	all clean test view

$(ROMBIN):	$(shell find $(SRCDIR) -name '*asm') $(GENASM) ../asm/*asm
		$(CFTASM) $(CFTASMFLAGS) -I $(SRCDIR) $(ROMSRC) -o $(ROMBIN)

$(BASEVECASM): 	$(SRCDIR)/base-vectable.asm $(SCRIPTDIR)/mkvectors
		$(SCRIPTDIR)/mkvectors $< >$@

$(FORTHVECASM): $(SRCDIR)/forth-vectable.asm $(SCRIPTDIR)/mkvectors
		$(SCRIPTDIR)/mkvectors $< >$@

$(LOGOASM):	$(LOGO) $(IMG2ASM)
		$(IMG2ASM) $< >$@

$(FONTASM):	$(FONT) $(FONT2ASM)
		$(FONT2ASM) $< >$@

$(KEYMAPASM):	$(MKKEYMAP)
		$(MKKEYMAP) >$@

clean:
		-rm -f $(ROMBIN) $(SRCDIR)/*~ $(BUILDDIR)/*.list $(BUILDDIR)/*.pasm \
			$(BUILDDIR)/*.sym $(BUILDDIR)/*.bin $(BUILDDIR)/*.map \
			$(BUILDDIR)/*.xpm $(GENASM) output output[0-3]

test:		all
		$(CFTEMU) $(ROMBIN)

view:		all
		display $(XPMFILE)
