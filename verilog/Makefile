#!/usr/bin/make -f
#
# Copyright © 2011-2019 Alexios Chouchoulas
#

SHELL=/bin/bash
TESTTOOL=../tools/run-verilog-testbench


###############################################################################
#
# VERILOG SOURCE CODE
#
###############################################################################

SRC =		counter.v counter_161_tb.v counter_590_tb.v counter_393h_tb.v counter_4017_tb.v \
		buffer.v buffer_244_tb.v buffer_245_tb.v \
		vibrator.v vibrator_123_tb.v vibrator_555_tb.v \
		demux.v demux_138_tb.v demux_139_tb.v \
		mux.v mux_253_tb.v \
		latch_373_tb.v flipflop_374_tb.v \
		alu_btb_add.v alu_btb_and.v alu_btb_or.v alu_btb_xor.v alu_btb_not.v alu_btb_roll.v alu_btb_cs.v \
		rom.v rom_tb.v \
		ram.v ram_tb.v \
		reset.v reset_tb.v \
		memory.v banked_memory_tb.v \
		io.v \
		regfile.v regfile_670_tb.v \
		comparator.v comparator_688_tb.v comparator_85_tb.v \
		serial.v shiftreg_164_tb.v \
		\
		skip_unit.v skip_unit_tb.v \
		agl.v agl_tb.v \
		constant_store.v constant_store_tb.v \
		int.v int_tb.v intc_tb.v \
		sequencer.v unit_decoder.v \
		addressing.v addressing_tb.v \
		register.v register_tb.v register_reg_L_tb.v \
		cft.v cft_tb.v cft_tb_testing.v \
		microcode_store.v microcode_store_tb.v \
		upc.v upc.v \
		test_panel_revC.v \
		dfp_step.v dfp_step_tb.v \
		dfp_scan.v dfp_scan_tb.v \
		dfp_run_control.v dfp_run_control_tb.v \
#		alu.v alu_tb.v alu_roll_tb.v alu_add_tb.v \

# Basic 74xxx family chips
#               TYPE           TEST BENCHES
IC74XXX	=	buffer.v       buffer_244_tb.v buffer_245_tb.v buffer_541_tb.v \
		comparator.v   comparator_688_tb.v \
		counter.v      counter_193_tb.v \
		demux.v        demux_138_tb.v demux_138_tb.v \
		mux.v          mux_1g157_tb.v mux_2g157_tb.v mux_157_tb.v mux_253_tb.v  \
		flipflop.v     flipflop_112_tb.v flipflop_74_tb.v flipflop_174_tb.v flipflop_574_tb.v flipflop_564_tb.v \

SRC += $(IC74XXX)

# Stuff added or changed for for 2019 updates to the CFT architecture.

CFT2019 = 	clock.v            clock_tb.v \
		ail.v		   ail_tb.v \
		agl.v		   agl_tb.v \
		sbu.v		   sbu_tb.v \
		ism.v		   ism_tb.v \
		flag_unit.v        flag_unit_tb.v \
		reg_ir.v           reg_ir_tb.v \
		reg_ar.v           reg_ar_tb.v \
		reg_mbr.v          reg_mbr_tb.v \
		reg_l.v            reg_l_tb.v \
		reg_v.v            reg_v_tb.v \
		reg_major.v        reg_major_tb.v \
		databus.v          databus_tb.v \
		alu_rom.v          alu_rom_tb.v \

SRC += $(CFT2019)

# Tests for parts of the DFP 2. The rest of the DFP is a relatively
# simple implementation of an Atmega MCU (with lots of memory-mapped
# I/O) and isn't verified here.

DFP2 = 		dfp_run_control.v  dfp_run_control_tb.v \
		dfp_scan.v         dfp_scan_tb.v \

SRC += $(DFP2)

###############################################################################

OBJ =		$(SRC:.v=.o)

VERILOG =	iverilog -Wall -Wno-implicit-dimensions
GTKWAVE =	gtkwave
SAVDIR	= 	sav
VCDDIR	=	vcd

SUBDIRS = 	img

BPLANE	=	ascii
CPLANE	=	fg64
VIDEOTEST =	NORMAL
VIDEODEFS +=	-D$(VIDEOTEST)
VFLAGS =	
#FONT =		/usr/local/share/fonts/truetype/winxp/Impact.otf
FONT =		/usr/share/fonts/truetype/ttf-bitstream-vera/VeraBd.ttf
EMUMON =	../tools/emu-monitor
EMUMONFLAGS =	-F $(FONT) -S 16

.PHONY: all all-subdirs subdirs $(SUBDIRS) batch-test inv test-2019

all: 	$(SUBDIRS) $(OBJ)

test-2019:   $(patsubst %.v,%.o,$(shell $(TESTTOOL) -lSr *_tb.v))
	$(TESTTOOL) -Sc $(patsubst %.o,%.v,$^)

clean:
	rm -f $(OBJ) *.o a.out out.vcd test_rom.bin

inv:
	$(TESTTOOL) -l *_tb.v

$(SUBDIRS):
	$(MAKE) -C $@

%.o:	%.v
	$(VERILOG) -o $@ $<


###############################################################################
#
# MANUAL TESTING/DEBUGGING OF GENERIC COMPONENTS
#
###############################################################################

test_test:	test.o
		./test.o
		$(GTKWAVE) $(VCDDIR)/test.vcd $(SAVDIR)/test.sav

# Buffers

test_244:	buffer_244_tb.o buffer.o
		./buffer_244_tb.o
		$(GTKWAVE) $(VCDDIR)/buffer_244_tb.vcd $(SAVDIR)/buffer_244_tb.sav

test_245:	buffer_245_tb.o buffer.o
		./buffer_245_tb.o
		$(GTKWAVE) $(VCDDIR)/buffer_245_tb.vcd $(SAVDIR)/buffer_245_tb.sav

test_541:	buffer.o buffer_541_tb.o
		./buffer_541_tb.o
		$(GTKWAVE) $(VCDDIR)/buffer_541_tb.vcd $(SAVDIR)/buffer_541_tb.sav


# Comparators

test_688:	comparator_688_tb.o comparator.o
		./comparator_688_tb.o
		$(GTKWAVE) $(VCDDIR)/comparator_688_tb.vcd $(SAVDIR)/comparator_688_tb.sav

test_85:	comparator_85_tb.o comparator.o
		./comparator_85_tb.o
		$(GTKWAVE) $(VCDDIR)/comparator_85_tb.vcd $(SAVDIR)/comparator_85_tb.sav

# Counters

test_161:	counter_161_tb.o counter.o
		./counter_161_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_161_tb.vcd $(SAVDIR)/counter_161_tb.sav

test_191:	counter_191_tb.o counter.o
		./counter_191_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_191_tb.vcd $(SAVDIR)/counter_191_tb.sav

test_193:	counter_193_tb.o counter.o
		./counter_193_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_193_tb.vcd $(SAVDIR)/counter_193_tb.sav

test_193b:	counter_193b_tb.o counter.o
		./counter_193b_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_193b_tb.vcd $(SAVDIR)/counter_193b_tb.sav

test_590:	counter_590_tb.o counter.o
		./counter_590_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_590_tb.vcd $(SAVDIR)/counter_590_tb.sav

test_393h:	counter_393h_tb.o counter.o
		./counter_393h_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_393h_tb.vcd $(SAVDIR)/counter_393h_tb.sav

test_4017:	counter_4017_tb.o counter.o
		./counter_4017_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_4017_tb.vcd $(SAVDIR)/counter_4017_tb.sav

# Encoders/Multiplexers

test_1g157:	mux_1g157_tb.o mux.o
		./mux_1g157_tb.o
		$(GTKWAVE) $(VCDDIR)/mux_1g157_tb.vcd $(SAVDIR)/mux_1g157_tb.sav

test_2g157:	mux_2g157_tb.o mux.o
		./mux_2g157_tb.o
		$(GTKWAVE) $(VCDDIR)/mux_2g157_tb.vcd $(SAVDIR)/mux_2g157_tb.sav

test_251:	mux_251_tb.o mux.o
		./mux_251_tb.o
		$(GTKWAVE) $(VCDDIR)/mux_251_tb.vcd $(SAVDIR)/mux_251_tb.sav

test_253:	mux_253_tb.o mux.o
		./mux_253_tb.o
		$(GTKWAVE) $(VCDDIR)/mux_253_tb.vcd $(SAVDIR)/mux_253_tb.sav

# Decoders/Demultiplexers

test_138:	demux_138_tb.o demux.o
		./demux_138_tb.o
		$(GTKWAVE) $(VCDDIR)/demux_138_tb.vcd $(SAVDIR)/demux_138_tb.sav

test_139:	demux_139_tb.o demux.o
		./demux_139_tb.o
		$(GTKWAVE) $(VCDDIR)/demux_139_tb.vcd $(SAVDIR)/demux_139_tb.sav

test_238:	demux_238_tb.o demux.o
		./demux_238_tb.o
		$(GTKWAVE) $(VCDDIR)/demux_238_tb.vcd $(SAVDIR)/demux_238_tb.sav


# Flip-Flops

test_74:	flipflop_74_tb.o flipflop.o
		./flipflop_74_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_74_tb.vcd $(SAVDIR)/flipflop_74_tb.sav

test_112:	flipflop_112_tb.o flipflop.o
		./flipflop_112_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_112_tb.vcd $(SAVDIR)/flipflop_112_tb.sav

test_174:	flipflop_174_tb.o flipflop.o
		./flipflop_174_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_174_tb.vcd $(SAVDIR)/flipflop_174_tb.sav

test_273:	flipflop_273_tb.o flipflop.o
		./flipflop_273_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_273_tb.vcd $(SAVDIR)/flipflop_273_tb.sav

test_373:	latch_373_tb.o flipflop.o
		./latch_373_tb.o
		$(GTKWAVE) $(VCDDIR)/latch_373_tb.vcd $(SAVDIR)/latch_373_tb.sav

test_374:	flipflop_374_tb.o flipflop.o
		./flipflop_374_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_374_tb.vcd $(SAVDIR)/flipflop_374_tb.sav

test_574:	flipflop_574_tb.o flipflop.o
		./flipflop_574_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_574_tb.vcd $(SAVDIR)/flipflop_574_tb.sav

test_564:	flipflop_564_tb.o flipflop.o
		./flipflop_564_tb.o
		$(GTKWAVE) $(VCDDIR)/out.vcd

# Shift Registers

test_164:	shiftreg_164_tb.o serial.o
		./shiftreg_164_tb.o
		$(GTKWAVE) $(VCDDIR)/shiftreg_164_tb.vcd $(SAVDIR)/shiftreg_164_tb.sav


# Vibrators

test_123:	vibrator_123_tb.o buffer.o
		./vibrator_123_tb.o
		$(GTKWAVE) $(VCDDIR)/vibrator_123_tb.vcd $(SAVDIR)/vibrator_123_tb.sav

# This is obviously a very basic, digital implementation of the 555.
test_555:	vibrator_555_tb.o buffer.o
		./vibrator_555_tb.o
		$(GTKWAVE) $(VCDDIR)/vibrator_555_tb.vcd $(SAVDIR)/vibrator_555_tb.sav

# Miscellaneous, generic chips

test_181:	alu_181_tb.o alu.o
		./alu_181_tb.o
		$(GTKWAVE) $(VCDDIR)/alu_181_tb.vcd $(SAVDIR)/alu_181_tb.sav

test_670:	regfile_670_tb.o regfile.o
		./regfile_670_tb.o
		$(GTKWAVE) $(VCDDIR)/regfile_670_tb.vcd $(SAVDIR)/regfile_670_tb.sav

###############################################################################
#
# MANUAL TESTBENCHES OF INDIVIDUAL CFT COMPONENTS
#
###############################################################################

test_inc_reg16:	register_inc_reg16_tb.o register.o
		./register_inc_reg16_tb.o
		$(GTKWAVE) $(VCDDIR)/register_inc_reg16_tb.vcd $(SAVDIR)/register_inc_reg16_tb.sav

test_L test_l test_reg_L:	register_reg_L_tb.o register.o
		./register_reg_L_tb.o
		$(GTKWAVE) $(VCDDIR)/register_reg_L_tb.vcd $(SAVDIR)/register_reg_L_tb.sav

test_reg_I:	register_reg_I_tb.o register.o
		./register_reg_I_tb.o
		$(GTKWAVE) $(VCDDIR)/register_reg_I_tb.vcd $(SAVDIR)/register_reg_I_tb.sav

test_addr test_addressing: addressing_tb.o addressing.o
		./addressing_tb.o
		$(GTKWAVE) $(VCDDIR)/addressing_tb.vcd $(SAVDIR)/addressing_tb.sav

test_pc test_dr test_ac test_reg: register.o register_tb.o
		./register_tb.o
		$(GTKWAVE) $(VCDDIR)/register_tb.vcd $(SAVDIR)/register_tb.sav

#test_reg_PR:	register_PR_tb.o register_PR.o
#		./register_PR_tb.o
#		$(GTKWAVE) $(VCDDIR)/register_PR_tb.vcd $(SAVDIR)/register_PR_tb.sav

test_alu_v1:	alu_tb_v1.o alu.o
		./alu_tb_v1.o
		$(GTKWAVE) $(VCDDIR)/alu_tb_v1.vcd $(SAVDIR)/alu_tb_v1.sav

test_alu:	alu_tb.o alu.o
		./alu_tb.o
		$(GTKWAVE) $(VCDDIR)/alu_tb.vcd $(SAVDIR)/alu_tb.sav

test_alu2:	alu_tb2.o alu.o
		./alu_tb2.o
		$(GTKWAVE) $(VCDDIR)/alu_tb2.vcd $(SAVDIR)/alu_tb2.sav

test_int:	int_tb.o int.o
		./int_tb.o
		$(GTKWAVE) $(VCDDIR)/int_tb.vcd $(SAVDIR)/int_tb.sav

test_intc:	intc_tb.o int.o addressing.o
		./intc_tb.o
		$(GTKWAVE) $(VCDDIR)/intc_tb.vcd $(SAVDIR)/intc_tb.sav

test_reset:	reset_tb.o reset.o
		./reset_tb.o
		$(GTKWAVE) $(VCDDIR)/reset_tb.vcd $(SAVDIR)/reset_tb.sav

test_clock1:	clock1_tb.o clock.o
		./clock1_tb.o
		$(GTKWAVE) $(VCDDIR)/clock1_tb.vcd $(SAVDIR)/clock1_tb.sav

test_clock2:	clock2_tb.o clock.o
		./clock2_tb.o
		$(GTKWAVE) $(VCDDIR)/clock2_tb.vcd $(SAVDIR)/clock2_tb.sav

test_step:	step_tb.o step.o clock.o
		./step_tb.o
		$(GTKWAVE) $(VCDDIR)/step_tb.vcd $(SAVDIR)/step_tb.sav

test_roll:	alu_roll_tb.o alu.o
		./alu_roll_tb.o
		$(GTKWAVE) $(VCDDIR)/alu_roll_tb.vcd $(SAVDIR)/alu_roll_tb.sav

test_add:	alu_add_tb.o alu.o
		./alu_add_tb.o
		$(GTKWAVE) $(VCDDIR)/alu_add_tb.vcd $(SAVDIR)/alu_add_tb.sav

test_skip:	skip_unit_tb.o skip_unit.o
		./skip_unit_tb.o
		$(GTKWAVE) $(VCDDIR)/skip_unit_tb.vcd $(SAVDIR)/skip_unit_tb.sav

test_rom:	rom_tb.o rom.o test_rom.bin
		./rom_tb.o
		$(GTKWAVE) $(VCDDIR)/rom_tb.vcd $(SAVDIR)/rom_tb.sav

test_ram:	ram_tb.o ram.o test_rom.bin
		./ram_tb.o
		$(GTKWAVE) $(VCDDIR)/ram_tb.vcd $(SAVDIR)/ram_tb.sav

test_banked_memory:	memory.o ram.o demux.o comparator.o flipflop.o regfile.o mux.o banked_memory_tb.o
		./banked_memory_tb.o
		$(GTKWAVE) $(VCDDIR)/banked_memory_tb.vcd $(SAVDIR)/banked_memory_tb.sav

test_panel_autorepeat:	panel_autorepeat_tb.o
		./panel_autorepeat_tb.o
		$(GTKWAVE) $(VCDDIR)/panel_autorepeat_tb.vcd $(SAVDIR)/panel_autorepeat_tb.sav

test_panel:	panel.o panel_tb.o
		./panel_tb.o
		$(GTKWAVE) $(VCDDIR)/panel_tb.vcd $(SAVDIR)/panel_tb.sav

test_panel_revC:test_panel_revC.o
		./test_panel_revC.o
		$(GTKWAVE) $(VCDDIR)/test_panel_revC.vcd $(SAVDIR)/test_panel_revC.sav

test_rom.bin:	./make_test_rom.py
		./make_test_rom.py

test_cs:	constant_store_tb.o constant_store.o
		./constant_store_tb.o
		$(GTKWAVE) $(VCDDIR)/constant_store_tb.vcd $(SAVDIR)/constant_store_tb.sav

test_cu:	control_unit_tb.o control_unit.o test_rom.bin
		./control_unit_tb.o
		$(GTKWAVE) $(VCDDIR)/control_unit_tb.vcd $(SAVDIR)/control_unit_tb.sav


###############################################################################
#
# MANUAL TEST BENCHES OF 2019 REDESIGN
#
###############################################################################

test_clock:	clock_tb.o clock.o
		./clock_tb.o
		$(GTKWAVE) $(VCDDIR)/clock_tb.vcd $(SAVDIR)/clock_tb.sav

test_upc:	upc_tb.o upc.o counter.o
		./upc_tb.o
		$(GTKWAVE) $(VCDDIR)/upc_tb.vcd $(SAVDIR)/upc_tb.sav

test_microcode_store:	microcode_store_tb.o microcode_store.o buffer.o rom.o
		./microcode_store_tb.o
		$(GTKWAVE) $(VCDDIR)/microcode_store_tb.vcd $(SAVDIR)/microcode_store_tb.sav

test_constant_store:	constant_store_tb.o constant_store_tb.o buffer.o demux.o
		./constant_store_tb.o
		$(GTKWAVE) $(VCDDIR)/constant_store_tb.vcd $(SAVDIR)/constant_store_tb.sav

test_ail:	ail_tb.o ail.o demux.o
		./ail_tb.o
		$(GTKWAVE) $(VCDDIR)/ail_tb.vcd $(SAVDIR)/ail_tb.sav

test_agl:	agl_tb.o agl.o buffer.o flipflop.o
		./agl_tb.o
		$(GTKWAVE) $(VCDDIR)/agl_tb.vcd $(SAVDIR)/agl_tb.sav

test_sbu:	sbu_tb.o sbu.o mux.o flipflop.o
		./sbu_tb.o
		$(GTKWAVE) $(VCDDIR)/sbu_tb.vcd $(SAVDIR)/sbu_tb.sav

test_ism:	ism_tb.o ism.o flipflop.o
		./ism_tb.o
		$(GTKWAVE) $(VCDDIR)/ism_tb.vcd $(SAVDIR)/ism_tb.sav

test_flag_unit:	flag_unit_tb.o flag_unit.o demux.o buffer.o
		./flag_unit_tb.o
		$(GTKWAVE) $(VCDDIR)/flag_unit_tb.vcd $(SAVDIR)/flag_unit_tb.sav

test_reg_ir:	reg_ir_tb.o reg_ir.o flipflop.o buffer.o 
		./reg_ir_tb.o
		$(GTKWAVE) $(VCDDIR)/reg_ir_tb.vcd $(SAVDIR)/reg_ir_tb.sav

test_reg_ar:	reg_ar_tb.o reg_ar.o flipflop.o buffer.o comparator.o demux.o
		./reg_ar_tb.o
		$(GTKWAVE) $(VCDDIR)/reg_ar_tb.vcd $(SAVDIR)/reg_ar_tb.sav

test_reg_major:	reg_major_tb.o reg_major.o counter.o buffer.o comparator.o
		./reg_major_tb.o # >reg_major_tb.log
		$(GTKWAVE) $(VCDDIR)/reg_major_tb.vcd $(SAVDIR)/reg_major_tb.sav

test_reg_l:	reg_l_tb.o reg_l.o flipflop.o mux.o
		./reg_l_tb.o
		$(GTKWAVE) $(VCDDIR)/reg_l_tb.vcd $(SAVDIR)/reg_l_tb.sav

test_reg_v:	reg_v_tb.o reg_v.o flipflop.o mux.o
		./reg_v_tb.o
		$(GTKWAVE) $(VCDDIR)/reg_v_tb.vcd $(SAVDIR)/reg_v_tb.sav

test_reg_mbr:	reg_mbr_tb.o reg_mbr.o flipflop.o mux.o
		./reg_mbr_tb.o
		$(GTKWAVE) $(VCDDIR)/reg_mbr_tb.vcd $(SAVDIR)/reg_mbr_tb.sav

test_serial_shifter:	serial_shifter_tb.o serial_shifter.o
		./serial_shifter_tb.o
		$(GTKWAVE) $(VCDDIR)/serial_shifter_tb.vcd $(SAVDIR)/serial_shifter_tb.sav

test_db test_databus: databus_tb.o databus.o
		./databus_tb.o
		$(GTKWAVE) $(VCDDIR)/databus_tb.vcd $(SAVDIR)/databus_tb.sav

test_alu_rom: alu_rom_tb.o alu_rom.o rom.o
		./alu_rom_tb.o
		$(GTKWAVE) $(VCDDIR)/alu_rom_tb.vcd $(SAVDIR)/alu_rom_tb.sav

###############################################################################
#
# 2019 DFP 2 TESTS
#
###############################################################################

test_dfp_scan:	dfp_scan_tb.o dfp_scan.o counter.o demux.o
		./dfp_scan_tb.o
		$(GTKWAVE) $(VCDDIR)/dfp_scan_tb.vcd $(SAVDIR)/dfp_scan_tb.sav

test_dfp_run_control:	dfp_run_control_tb.o dfp_run_control.o clock.o \
			flipflop.o mux.o vibrator.o counter.o demux.o mux.o
		./dfp_run_control_tb.o
		$(GTKWAVE) $(VCDDIR)/dfp_run_control_tb.vcd $(SAVDIR)/dfp_run_control_tb.sav

###############################################################################
#
# VDU CARD TESTS
#
###############################################################################

img/vdu-cg.list: ../emulator/romfont.fnt
		../tools/bin2list.py ../emulator/romfont.fnt >img/vdu-cg.list

img/vdu-cg0.list: ../emulator/romfont.fnt
		dd if=$< bs=32k count=1 conv=sync | ../tools/bin2list.py /dev/stdin >$@

test_video:	video_tb.o video.o img/vdu-cg.list img
		(cd img; ../../tools/testpattern -b $(BPLANE) -c $(CPLANE))
		(cd img; cat vdu-bp?.list vdu-cg.list > vdu-bpcg.list)
		(cd img; cat vdu-cp?lo.list vdu-cp?lo.list > vdu-cplo.list)
		(cd img; cat vdu-cp?hi.list vdu-cp?hi.list > vdu-cphi.list)
		$(VERILOG) $(VIDEODEFS) -o video.o video.v
		$(VERILOG) $(VIDEODEFS) -o video_tb.o video_tb.v
		./video_tb.o
		$(GTKWAVE) $(VCDDIR)/video_tb.vcd $(SAVDIR)/video_tb.sav

test_video_out:	video.o img/vdu-cg.list img
		(cd img; ../../tools/testpattern -b $(BPLANE) -c $(CPLANE))
		(cd img; cat vdu-bp?.list vdu-cg.list > vdu-bpcg.list)
		(cd img; cat vdu-cp?lo.list vdu-cp?lo.list > vdu-cplo.list)
		(cd img; cat vdu-cp?hi.list vdu-cp?hi.list > vdu-cphi.list)
		$(VERILOG) -DVIDEO_OUT $(VIDEODEFS) -o video.o video.v
		$(VERILOG) -DVIDEO_OUT $(VIDEODEFS) -o video_tb.o video_tb.v
		./video_tb.o | grep ^RGB: | $(EMUMON) $(EMUMONFLAGS) -

test_video_pat:	video.o img/vdu-cg0.list img/vdu-cg.list img
		(cd img; ../../tools/testpattern -b $(BPLANE) -c $(CPLANE))
		(cd img; cat vdu-bp?.list vdu-cg.list > vdu-bpcg.list)
		(cd img; cat vdu-cp?lo.list vdu-cp?lo.list > vdu-cplo.list)
		(cd img; cat vdu-cp?hi.list vdu-cp?hi.list > vdu-cphi.list)
		$(VERILOG) -DVIDEO_OUT $(VIDEODEFS) -o video.o video.v
		$(VERILOG) -DVIDEO_OUT $(VIDEODEFS) -o video_tb.o video_tb.v
		./video_tb.o | grep ^RGB: | \
			$(EMUMON) -L '$(VIDEODEFS), B=$(BPLANE), C=$(CPLANE), frame %d' $(EMUMONFLAGS) -

test_video_shiftreg:	video_shiftreg_tb.o video.o
		./video_shiftreg_tb.o
		$(GTKWAVE) $(VCDDIR)/video_shiftreg_tb.vcd $(SAVDIR)/video_shiftreg_tb.sav

test_video_crc:	video_crc_tb.o video.o
		./video_crc_tb.o
		$(GTKWAVE) $(VCDDIR)/video_crc_tb.vcd $(SAVDIR)/video_crc_tb.sav

test_video_paddr:	video_paddr_tb.o video.o
		./video_paddr_tb.o
		$(GTKWAVE) $(VCDDIR)/video_paddr_tb.vcd $(SAVDIR)/video_paddr_tb.sav

test_video_modnctr:	video_modnctr_tb.o video.o
		./video_modnctr_tb.o
		$(GTKWAVE) $(VCDDIR)/video_modnctr_tb.vcd $(SAVDIR)/video_modnctr_tb.sav



test:		$(OBJ)
		( cd img; ../../tools/cftasm --min-addr 32768 ../../asm/testing.asm ../../asm/io.asm ../../asm/test2.asm )
		./cft_tb.o
		$(GTKWAVE) $(VCDDIR)/cft_tb.vcd $(SAVDIR)/cft_tb.sav

batch_test:		batch_test_alu_add \
			batch_test_alu_and \
			batch_test_alu_or \
			batch_test_alu_xor

batch_test_alu_add:	alu_btb_add.o alu.o
			./alu_btb_add.o

batch_test_alu_and:	alu_btb_and.o alu.o
			./alu_btb_and.o

batch_test_alu_or:	alu_btb_or.o alu.o
			./alu_btb_or.o

batch_test_alu_xor:	alu_btb_xor.o alu.o
			./alu_btb_xor.o

batch_test_alu_not:	alu_btb_not.o alu.o
			./alu_btb_not.o

batch_test_alu_roll:	alu_btb_roll.o alu.o
			./alu_btb_roll.o

batch_test_alu_cs:	alu_btb_cs.o alu.o
			./alu_btb_cs.o

# End of file.
