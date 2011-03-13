SRC =		counter.v counter_161_tb.v \
		buffer.v buffer_244_tb.v buffer_245_tb.v \
		demux.v demux_tb.v \
		mux.v mux_253_tb.v \
		flipflop.v flipflop_112_tb.v flipflop_174_tb.v flipflop_574_tb.v flipflop_564_tb.v \
		alu_181.v alu_181_tb.v \
		register_PR.v register_PR_tb.v \
		alu.v alu_tb.v alu_roll_tb.v alu_add_tb.v \
		skip_unit.v skip_unit_tb.v \
		rom.v rom_tb.v \
		ram.v ram_tb.v \
		reset.v reset_tb.v \
		register.v register_inc_reg16_tb.v register_reg_L_tb.v register_reg_I_tb.v \
		\
		constant_store.v constant_store_tb.v \
		control_unit.v control_unit_tb.v \
		test.v

OBJ =		$(SRC:.v=.o)

VERILOG =	iverilog
GTKWAVE =	gtkwave

all: 	$(OBJ)

clean:
	rm -f $(OBJ) *.o a.out out.vcd test_rom.bin

%.o:	%.v
	$(VERILOG) -o $@ $<

test_test:	test.o
		./test.o
		$(GTKWAVE) test.vcd test.sav

test_112:	flipflop_112_tb.o flipflop.o
		./flipflop_112_tb.o
		$(GTKWAVE) flipflop_112_tb.vcd counter_112_tb.sav

test_161:	counter_161_tb.o counter.o
		./counter_161_tb.o
		$(GTKWAVE) counter_161_tb.vcd counter_161_tb.sav

test_174:	flipflop_174_tb.o flipflop.o
		./flipflop_174_tb.o
		$(GTKWAVE) flipflop_174_tb.vcd flipflop_174_tb.sav

test_181:	alu_181_tb.o alu.o
		./alu_181_tb.o
		$(GTKWAVE) alu_181_tb.vcd alu_181_tb.sav

test_253:	mux_253_tb.o mux.o
		./mux_253_tb.o
		$(GTKWAVE) mux_253_tb.vcd mux_253_tb.sav

test_193:	counter_193_tb.o counter.o
		./counter_193_tb.o
		$(GTKWAVE) counter_193_tb.vcd counter_193_tb.sav

test_574:	flipflop_574_tb.o flipflop.o
		./flipflop_574_tb.o
		$(GTKWAVE) out.vcd

test_564:	flipflop_564_tb.o flipflop.o
		./flipflop_564_tb.o
		$(GTKWAVE) out.vcd

test_244:	buffer_244_tb.o buffer.o
		./buffer_244_tb.o
		$(GTKWAVE) buffer_244_tb.vcd buffer_244_tb.sav

test_245:	buffer_245_tb.o buffer.o
		./buffer_245_tb.o
		$(GTKWAVE) buffer_245_tb.vcd buffer_245_tb.sav

test_demux:	demux_tb.o demux.o test_rom.bin
		./demux_tb.o
		$(GTKWAVE) demux_tb.vcd demux_tb.sav

test_inc_reg16:	register_inc_reg16_tb.o register.o
		./register_inc_reg16_tb.o
		$(GTKWAVE) register_inc_reg16_tb.vcd register_inc_reg16_tb.sav

test_reg_L:	register_reg_L_tb.o register.o
		./register_reg_L_tb.o
		$(GTKWAVE) register_reg_L_tb.vcd register_reg_L_tb.sav

test_reg_I:	register_reg_I_tb.o register.o
		./register_reg_I_tb.o
		$(GTKWAVE) register_reg_I_tb.vcd register_reg_I_tb.sav

test_reg_PR:	register_PR_tb.o register_PR.o
		./register_PR_tb.o
		$(GTKWAVE) register_PR_tb.vcd register_PR_tb.sav

test_alu:	alu_tb.o alu.o
		./alu_tb.o
		$(GTKWAVE) alu_tb.vcd alu_tb.sav

test_reset:	reset_tb.o reset.o
		./reset_tb.o
		$(GTKWAVE) reset_tb.vcd reset_tb.sav

test_roll:	alu_roll_tb.o alu.o
		./alu_roll_tb.o
		$(GTKWAVE) alu_roll_tb.vcd alu_roll_tb.sav

test_add:	alu_add_tb.o alu.o
		./alu_add_tb.o
		$(GTKWAVE) alu_add_tb.vcd alu_add_tb.sav

test_skip:	skip_unit_tb.o skip_unit.o
		./skip_unit_tb.o
		$(GTKWAVE) skip_unit_tb.vcd skip_unit_tb.sav

test_rom:	rom_tb.o rom.o test_rom.bin
		./rom_tb.o
		$(GTKWAVE) out.vcd

test_ram:	ram_tb.o ram.o test_rom.bin
		./ram_tb.o
		$(GTKWAVE) ram_tb.vcd ram_tb.sav

test_rom.bin:	./make_test_rom.py
		./make_test_rom.py

test_cs:	constant_store_tb.o constant_store.o
		./constant_store_tb.o
		$(GTKWAVE) constant_store_tb.vcd constant_store_tb.sav

test_cu:	control_unit_tb.o control_unit.o test_rom.bin
		./control_unit_tb.o
		$(GTKWAVE) control_unit_tb.vcd control_unit_tb.sav

filter:		filter.c
		$(CC)  -Wall -pedantic -O2 -o $@ $<

# End of file.
