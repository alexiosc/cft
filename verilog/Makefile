SRC =		counter.v counter_161_tb.v \
		buffer.v buffer_244_tb.v buffer_245_tb.v \
		vibrator.v vibrator_123_tb.v vibrator_555_tb.v \
		demux.v demux_138_tb.v demux_139_tb.v \
		mux.v mux_253_tb.v \
		flipflop.v flipflop_112_tb.v flipflop_74_tb.v flipflop_174_tb.v flipflop_574_tb.v flipflop_564_tb.v \
		alu.v alu_tb.v alu_roll_tb.v alu_add_tb.v \
		alu_btb_add.v alu_btb_and.v alu_btb_or.v alu_btb_xor.v \
		skip_unit.v skip_unit_tb.v \
		clock.v clock_tb.v clock2_tb.v \
		rom.v rom_tb.v \
		ram.v ram_tb.v \
		reset.v reset_tb.v \
		memory.v banked_memory_tb.v \
		io.v \
		regfile.v regfile_670_tb.v \
		comparator.v comparator_688_tb.v comparator_85_tb.v \
		register.v register_inc_reg16_tb.v register_reg_L_tb.v register_reg_I_tb.v \
		\
		constant_store.v constant_store_tb.v \
		int.v int_tb.v \
		control_unit.v \
		cft.v cft_tb.v cft_tb_testing.v \
		panel.v panel_tb.v test.v panel_autorepeat_tb.v

#		Disused code:
#		register_PR.v register_PR_tb.v

OBJ =		$(SRC:.v=.o)

VERILOG =	iverilog -Wall
GTKWAVE =	gtkwave
SAVDIR	= 	sav
VCDDIR	=	vcd

SUBDIRS = 	img

.PHONY: all all-subdirs subdirs $(SUBDIRS) batch-test

all: 	$(SUBDIRS) $(OBJ)

clean:
	rm -f $(OBJ) *.o a.out out.vcd test_rom.bin

$(SUBDIRS):
	$(MAKE) -C $@

%.o:	%.v
	$(VERILOG) -o $@ $<

test_test:	test.o
		./test.o
		$(GTKWAVE) $(VCDDIR)/test.vcd $(SAVDIR)/test.sav

test_74:	flipflop_74_tb.o flipflop.o
		./flipflop_74_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_74_tb.vcd $(SAVDIR)/flipflop_74_tb.sav

test_112:	flipflop_112_tb.o flipflop.o
		./flipflop_112_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_112_tb.vcd $(SAVDIR)/flipflop_112_tb.sav

test_138:	demux_138_tb.o demux.o
		./demux_138_tb.o
		$(GTKWAVE) $(VCDDIR)/demux_138_tb.vcd $(SAVDIR)/demux_138_tb.sav

test_139:	demux_139_tb.o demux.o
		./demux_139_tb.o
		$(GTKWAVE) $(VCDDIR)/demux_139_tb.vcd $(SAVDIR)/demux_139_tb.sav

test_161:	counter_161_tb.o counter.o
		./counter_161_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_161_tb.vcd $(SAVDIR)/counter_161_tb.sav

test_174:	flipflop_174_tb.o flipflop.o
		./flipflop_174_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_174_tb.vcd $(SAVDIR)/flipflop_174_tb.sav

test_181:	alu_181_tb.o alu.o
		./alu_181_tb.o
		$(GTKWAVE) $(VCDDIR)/alu_181_tb.vcd $(SAVDIR)/alu_181_tb.sav

test_253:	mux_253_tb.o mux.o
		./mux_253_tb.o
		$(GTKWAVE) $(VCDDIR)/mux_253_tb.vcd $(SAVDIR)/mux_253_tb.sav

test_193:	counter_193_tb.o counter.o
		./counter_193_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_193_tb.vcd $(SAVDIR)/counter_193_tb.sav

test_193b:	counter_193b_tb.o counter.o
		./counter_193b_tb.o
		$(GTKWAVE) $(VCDDIR)/counter_193b_tb.vcd $(SAVDIR)/counter_193b_tb.sav

test_273:	flipflop_273_tb.o flipflop.o
		./flipflop_273_tb.o
		$(GTKWAVE) $(VCDDIR)/flipflop_273_tb.vcd $(SAVDIR)/flipflop_273_tb.sav

test_574:	flipflop_574_tb.o flipflop.o
		./flipflop_574_tb.o
		$(GTKWAVE) $(VCDDIR)/out.vcd

test_564:	flipflop_564_tb.o flipflop.o
		./flipflop_564_tb.o
		$(GTKWAVE) $(VCDDIR)/out.vcd

test_244:	buffer_244_tb.o buffer.o
		./buffer_244_tb.o
		$(GTKWAVE) $(VCDDIR)/buffer_244_tb.vcd $(SAVDIR)/buffer_244_tb.sav

test_245:	buffer_245_tb.o buffer.o
		./buffer_245_tb.o
		$(GTKWAVE) $(VCDDIR)/buffer_245_tb.vcd $(SAVDIR)/buffer_245_tb.sav

test_123:	vibrator_123_tb.o buffer.o
		./vibrator_123_tb.o
		$(GTKWAVE) $(VCDDIR)/vibrator_123_tb.vcd $(SAVDIR)/vibrator_123_tb.sav

test_555:	vibrator_555_tb.o buffer.o
		./vibrator_555_tb.o
		$(GTKWAVE) $(VCDDIR)/vibrator_555_tb.vcd $(SAVDIR)/vibrator_555_tb.sav

test_670:	regfile_670_tb.o regfile.o
		./regfile_670_tb.o
		$(GTKWAVE) $(VCDDIR)/regfile_670_tb.vcd $(SAVDIR)/regfile_670_tb.sav

test_688:	comparator_688_tb.o comparator.o
		./comparator_688_tb.o
		$(GTKWAVE) $(VCDDIR)/comparator_688_tb.vcd $(SAVDIR)/comparator_688_tb.sav

test_85:	comparator_85_tb.o comparator.o
		./comparator_85_tb.o
		$(GTKWAVE) $(VCDDIR)/comparator_85_tb.vcd $(SAVDIR)/comparator_85_tb.sav

test_demux:	demux_tb.o demux.o test_rom.bin
		./demux_tb.o
		$(GTKWAVE) $(VCDDIR)/demux_tb.vcd $(SAVDIR)/demux_tb.sav

test_inc_reg16:	register_inc_reg16_tb.o register.o
		./register_inc_reg16_tb.o
		$(GTKWAVE) $(VCDDIR)/register_inc_reg16_tb.vcd $(SAVDIR)/register_inc_reg16_tb.sav

test_reg_L:	register_reg_L_tb.o register.o
		./register_reg_L_tb.o
		$(GTKWAVE) $(VCDDIR)/register_reg_L_tb.vcd $(SAVDIR)/register_reg_L_tb.sav

test_reg_I:	register_reg_I_tb.o register.o
		./register_reg_I_tb.o
		$(GTKWAVE) $(VCDDIR)/register_reg_I_tb.vcd $(SAVDIR)/register_reg_I_tb.sav

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

test_reset:	reset_tb.o reset.o
		./reset_tb.o
		$(GTKWAVE) $(VCDDIR)/reset_tb.vcd $(SAVDIR)/reset_tb.sav

test_clock:	clock_tb.o clock.o
		./clock_tb.o
		$(GTKWAVE) $(VCDDIR)/clock_tb.vcd $(SAVDIR)/clock_tb.sav

test_clock2:	clock2_tb.o clock.o
		./clock2_tb.o
		$(GTKWAVE) $(VCDDIR)/clock2_tb.vcd $(SAVDIR)/clock2_tb.sav

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
		$(GTKWAVE) $(VCDDIR)/out.vcd

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

test_rom.bin:	./make_test_rom.py
		./make_test_rom.py

test_cs:	constant_store_tb.o constant_store.o
		./constant_store_tb.o
		$(GTKWAVE) $(VCDDIR)/constant_store_tb.vcd $(SAVDIR)/constant_store_tb.sav

test_cu:	control_unit_tb.o control_unit.o test_rom.bin
		./control_unit_tb.o
		$(GTKWAVE) $(VCDDIR)/control_unit_tb.vcd $(SAVDIR)/control_unit_tb.sav

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

# End of file.
