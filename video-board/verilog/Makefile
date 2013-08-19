###############################################################################
#
# VDU SUB-PROJECT MAKEFILE
#
###############################################################################

SRC =		\
		vibrator.v \
		demux16.v \
		ram.v \
		register.v \
		counter.v \
		gatedCounter.v \
		counter193.v \
		delayLine.v \
		frameEngine.v \
		horizontalPhase.v \
		vduMemoryAccess.v \
		registerFile.v \
		video.v \
		video_tb.v \

OBJ =		$(SRC:.v=.o)

VERILOG =	iverilog -Wall
GTKWAVE =	gtkwave
SAVDIR	= 	sav
VCDDIR	=	vcd

TOOLDIR =	../../tools
EMUDIR =	../../emulator

SUBDIRS = 	#img

BPLANE	=	ascii
CPLANE	=	fg64
VIDEOTEST =	NORMAL
VIDEODEFS +=	-D$(VIDEOTEST)
VFLAGS =	
#FONT =		/usr/local/share/fonts/truetype/winxp/Impact.otf
FONT =		/usr/share/fonts/truetype/ttf-bitstream-vera/VeraBd.ttf
EMUMON =	$(TOOLDIR)/emu-monitor
EMUMONFLAGS =	-F $(FONT) -S 16 --negative-hs

.PHONY: all all-subdirs subdirs $(SUBDIRS) batch-test

all: 	$(SUBDIRS) $(OBJ)

clean:
	rm -f $(OBJ) *.o a.out out.vcd test_rom.bin

$(SUBDIRS):
	$(MAKE) -C $@

%.o:	%.v
	$(VERILOG) $(VIDEODEFS) -o $@ $<

img/vdu-cg.list: $(EMUDIR)/romfont.fnt
		$(TOOLDIR)/bin2list.py ../emulator/romfont.fnt >img/vdu-cg.list

img/vdu-cg0.list: $(EMUDIR)/romfont.fnt
		dd if=$< bs=32k count=1 conv=sync | $(TOOLDIR)/bin2list.py /dev/stdin >$@

test_video:	$(OBJ) img/vdu-cg.list img
		$(VERILOG) $(VIDEODEFS) -o video.o video.v
		$(VERILOG) $(VIDEODEFS) -o video_tb.o video_tb.v
		(cd img; ../$(TOOLDIR)/testpattern -b $(BPLANE) -c $(CPLANE))
		(cd img; cat vdu-bp?.list vdu-cg.list > vdu-bpcg.list)
		(cd img; cat vdu-cp?lo.list vdu-cp?lo.list > vdu-cplo.list)
		(cd img; cat vdu-cp?hi.list vdu-cp?hi.list > vdu-cphi.list)
		./video_tb.o
		$(GTKWAVE) $(VCDDIR)/video_tb.vcd $(SAVDIR)/video_tb.sav

test_video_out:	$(OBJ) img/vdu-cg.list img
		$(VERILOG) $(VIDEODEFS) -o video.o video.v
		$(VERILOG) $(VIDEODEFS) -o video_tb.o video_tb.v
		(cd img; ../$(TOOLDIR)/testpattern -b $(BPLANE) -c $(CPLANE))
		(cd img; cat vdu-bp?.list vdu-cg.list > vdu-bpcg.list)
		(cd img; cat vdu-cp?lo.list vdu-cp?lo.list > vdu-cplo.list)
		(cd img; cat vdu-cp?hi.list vdu-cp?hi.list > vdu-cphi.list)
		./video_tb.o | grep ^RGB: | $(EMUMON) $(EMUMONFLAGS) -

test_video_pat:	$(OBJ) img/vdu-cg0.list img/vdu-cg.list img
		$(VERILOG) -DVIDEO_OUT $(VIDEODEFS) -o video.o video.v
		$(VERILOG) -DVIDEO_OUT $(VIDEODEFS) -o video_tb.o video_tb.v
		(cd img; ../$(TOOLDIR)/testpattern -b $(BPLANE) -c $(CPLANE))
		(cd img; cat vdu-bp?.list vdu-cg.list > vdu-bpcg.list)
		(cd img; cat vdu-cp?lo.list vdu-cp?lo.list > vdu-cplo.list)
		(cd img; cat vdu-cp?hi.list vdu-cp?hi.list > vdu-cphi.list)
		./video_tb.o | grep ^RGB: | \
			$(EMUMON) -L '$(VIDEODEFS), B=$(BPLANE), C=$(CPLANE), frame %d' $(EMUMONFLAGS) -

# End of file.
