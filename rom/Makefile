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
CFTEMU =	$(CFTDIR)/emulator/cftemu $(CFTEMUOPTS)
CFTEMUOPTS =	-a v4 -V -M $(MAPFILE)

VECASM =	$(GENDIR)/vector-table.asm

LOGOASM =	$(GENDIR)/cft-logo.asm
LOGO =		$(DOCDIR)/logo/cft-logo-v2-cftbanner.png

FONTASM =	$(GENDIR)/romfont.asm
FONT =		$(EMUDIR)/romfont.fnt
FONT2ASM =	$(SCRIPTDIR)/mkromfont

GENASM =	$(VECASM) $(LOGOASM) $(FONTASM)

CFTASM =	$(TOOLDIR)/cftasm
CFTASMFLAGS =	-I $(CFTDIR) --min-addr=$(BASEADDR)
CFTASMFLAGS +=	--xpm=$(XPMFILE)
IMG2ASM =	$(TOOLDIR)/vdu-img2asm

all:		$(ROMBIN)

.PHONY: 	all clean test view

$(ROMBIN):	$(SRCDIR)/*asm $(GENASM)
		$(CFTASM) $(CFTASMFLAGS) -I $(SRCDIR) $(ROMSRC) -o $(ROMBIN)

$(VECASM): 	$(SRCDIR)/vector-table.asm $(SCRIPTDIR)/mkvectors
		$(SCRIPTDIR)/mkvectors $< >$@

$(LOGOASM):	$(LOGO) $(IMG2ASM)
		$(IMG2ASM) $< >$@

$(FONTASM):	$(FONT) $(FONT2ASM)
		$(FONT2ASM) $< >$@

clean:
		-rm -f $(ROMBIN) $(SRCDIR)/*~ $(BUILDDIR)/*.list $(BUILDDIR)/*.pasm \
			$(BUILDDIR)/*.sym $(BUILDDIR)/*.bin $(BUILDDIR)/*.map \
			$(BUILDDIR)/*.xpm $(GENASM) output output[0-3]

test:		all
		$(CFTEMU) $(ROMBIN)

view:		all
		display $(XPMFILE)
