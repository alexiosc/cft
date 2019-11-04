EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 12
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3200 4850 1150 1650
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbl.sch" 50
F2 "~SKIP" O R 4350 5000 50 
F3 "FN" I L 3200 6100 50 
F4 "~SKIPEXT" T L 3200 6350 50 
F5 "FV" I L 3200 5650 50 
F6 "FL" I L 3200 5800 50 
F7 "FZ" I L 3200 5950 50 
F8 "CLK4" I L 3200 5150 50 
F9 "COND[0..4]" I L 3200 5450 50 
F10 "~RESET" I L 3200 5000 50 
F11 "IR[0..6]" I L 3200 5300 50 
$EndSheet
$Sheet
S 1250 4600 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L 1250 4750 50 
F3 "IR[0..15]" B R 2400 4750 50 
F4 "~FPIRL" I L 1250 5050 50 
F5 "~FPIRH" I L 1250 5200 50 
F6 "FPO[0..7]" T R 2400 5200 50 
F7 "~WRITE-IR" I L 1250 4900 50 
$EndSheet
$Sheet
S 1250 6750 1150 750 
U 5F3EA987
F0 "Address Generation Logic (AGL)" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R 2400 6900 50 
F3 "IR[0..10]" I L 1250 6900 50 
F4 "PC[10..15]" I L 1250 7050 50 
F5 "~END" I L 1250 7200 50 
F6 "~READ-AGL" I L 1250 7350 50 
$EndSheet
$Sheet
S 1250 5750 1150 600 
U 5CD3AC27
F0 "Auto-Index Logic (AIL)" 50
F1 "cft_ail.sch" 50
F2 "IR[6..11]" I L 1250 6050 50 
F3 "IDX[0..1]" I R 2400 6050 50 
$EndSheet
$Sheet
S 3200 6750 1150 850 
U 5E507DE3
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "~RUEN" I L 3200 6900 50 
F3 "RADDR[0..4]" I L 3200 7050 50 
F4 "IBUS[0..15]" B R 4350 6900 50 
$EndSheet
$Sheet
S 4950 3300 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R 6100 4450 50 
F3 "IBUS[8..15]" T R 6100 3450 50 
F4 "~FPFLAGS" I L 4950 4450 50 
F5 "~ACTION-CPL" O R 6100 3600 50 
F6 "~ACTION-CLL" O R 6100 3700 50 
F7 "~ACTION-STI" O R 6100 3800 50 
F8 "~ACTION-CLI" O R 6100 3900 50 
F9 "WADDR[0..4]" I L 4950 3450 50 
F10 "RADDR[0..4]" I L 4950 3600 50 
F11 "ACTION[0..3]" I L 4950 3750 50 
F12 "FI" I L 4950 3900 50 
F13 "FV" I L 4950 4000 50 
F14 "FL" I L 4950 4100 50 
F15 "FZ" I L 4950 4200 50 
F16 "FN" I L 4950 4300 50 
F17 "~FLAGWE" O R 6100 4300 50 
$EndSheet
Text Label 650  3100 0    50   ~ 0
IN-RSVD
Text Label 650  3000 0    50   ~ 0
COND
Text Label 650  3300 0    50   ~ 0
~IRQSµC
Wire Wire Line
	1250 3300 650  3300
Wire Bus Line
	1250 3200 650  3200
Wire Wire Line
	1250 3000 650  3000
Wire Bus Line
	1250 2900 650  2900
Text Label 3000 4200 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	2400 4200 3000 4200
Text Label 3000 3850 2    50   ~ 0
~FPµC2
Text Label 3000 3750 2    50   ~ 0
~FPµC1
Text Label 3000 3650 2    50   ~ 0
~FPµC0
Text Label 3000 3550 2    50   ~ 0
~FPµA2
Text Label 3000 3450 2    50   ~ 0
~FPµA1
Text Label 3000 3350 2    50   ~ 0
~FPµA0
Wire Wire Line
	2400 3850 3000 3850
Wire Wire Line
	2400 3750 3000 3750
Wire Wire Line
	2400 3650 3000 3650
Wire Wire Line
	2400 3550 3000 3550
Wire Wire Line
	2400 3450 3000 3450
Wire Wire Line
	2400 3350 3000 3350
Text Label 3000 3200 2    50   ~ 0
~µCE
Wire Wire Line
	2400 3200 3000 3200
Text Label 3000 3050 2    50   ~ 0
~END
Text Label 3000 2950 2    50   ~ 0
~WEN
Text Label 3000 2850 2    50   ~ 0
~R
Text Label 3000 2750 2    50   ~ 0
~IO
Text Label 3000 2650 2    50   ~ 0
~MEM
Wire Wire Line
	2400 3050 3000 3050
Wire Wire Line
	2400 2950 3000 2950
Wire Wire Line
	2400 2850 3000 2850
Wire Wire Line
	2400 2750 3000 2750
Wire Wire Line
	2400 2650 3000 2650
Text Label 650  2700 0    50   ~ 0
~WS
Text Label 650  2600 0    50   ~ 0
~ENDEXT
Wire Wire Line
	650  2700 1250 2700
Wire Wire Line
	650  2600 1250 2600
Text Label 650  2200 0    50   ~ 0
~RESET
Wire Wire Line
	1250 2200 650  2200
Text Label 650  2300 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	650  2300 1250 2300
Text Label 650  2400 0    50   ~ 0
CLK4
Wire Wire Line
	1250 2400 650  2400
Text Label 650  2500 0    50   ~ 0
~HALT
Wire Wire Line
	1250 2500 650  2500
Text Label 3000 1650 2    50   ~ 0
WSTB
Text Label 3000 1500 2    50   ~ 0
T34
Text Label 3000 1350 2    50   ~ 0
CLK4
Text Label 3000 1250 2    50   ~ 0
CLK3
Text Label 3000 1150 2    50   ~ 0
CLK2
Text Label 3000 1050 2    50   ~ 0
CLK1
Text Label 3000 900  2    50   ~ 0
~RSTHOLD
Wire Wire Line
	2400 1650 3000 1650
Wire Wire Line
	2400 1500 3000 1500
Wire Wire Line
	2400 1350 3000 1350
Wire Wire Line
	2400 1250 3000 1250
$Sheet
S 1250 750  1150 1050
U 5E36D9C8
F0 "Clock Generator" 50
F1 "cft_clk.sch" 50
F2 "CLK1" O R 2400 1050 50 
F3 "CLK2" O R 2400 1150 50 
F4 "CLK3" O R 2400 1250 50 
F5 "CLK4" O R 2400 1350 50 
F6 "~RESET" I L 1250 900 50 
F7 "FPCLK" I L 1250 1150 50 
F8 "~RSTHOLD" O R 2400 900 50 
F9 "POWEROK" I L 1250 1500 50 
F10 "~FPRESET" I L 1250 1050 50 
F11 "~FPCLK~⁄CLK" I L 1250 1250 50 
F12 "T34" O R 2400 1500 50 
F13 "WSTB" O R 2400 1650 50 
$EndSheet
Wire Wire Line
	2400 1150 3000 1150
Wire Wire Line
	2400 1050 3000 1050
Wire Wire Line
	3000 900  2400 900 
Text Label 650  1500 0    50   ~ 0
POWEROK
Text Label 650  1250 0    50   ~ 0
FPCLKEN
Text Label 650  1150 0    50   ~ 0
FPCLK
Text Label 650  1050 0    50   ~ 0
~FPRESET
Text Label 650  900  0    50   ~ 0
~RESET
Wire Wire Line
	1250 1250 650  1250
Wire Wire Line
	1250 1150 650  1150
Wire Wire Line
	1250 1050 650  1050
Wire Wire Line
	1250 900  650  900 
Wire Wire Line
	1250 1500 650  1500
Text Label 650  2900 0    50   ~ 0
IDX[0..1]
Text Label 650  3200 0    50   ~ 0
IR[7..15]
Wire Bus Line
	2400 2350 3000 2350
Wire Bus Line
	2400 2450 3000 2450
Wire Bus Line
	2400 2550 3000 2550
Text Label 3000 2250 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	2400 2250 3000 2250
Text Label 3000 2350 2    50   ~ 0
WADDR[0..4]
Text Label 3000 2450 2    50   ~ 0
COND[0..4]
Text Label 3000 2550 2    50   ~ 0
ACTION[0..3]
Wire Bus Line
	2400 4750 3000 4750
Text Label 3000 4750 2    50   ~ 0
IR[0..15]
Text Label 3000 5200 2    50   ~ 0
FPO[0..7]
Wire Bus Line
	2400 5200 3000 5200
Wire Bus Line
	1250 4750 650  4750
Text Label 650  4750 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	1250 4900 650  4900
Wire Wire Line
	1250 5050 650  5050
Wire Wire Line
	1250 5200 650  5200
Text Label 650  4900 0    50   ~ 0
~WRITE-IR
Text Label 650  5050 0    50   ~ 0
~FPIRL
Text Label 650  5200 0    50   ~ 0
~FPIRH
$Sheet
S 1250 2050 1150 2300
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L 1250 2600 50 
F3 "~RSTHOLD" I L 1250 2300 50 
F4 "~WS" I L 1250 2700 50 
F5 "~HALT" I L 1250 2500 50 
F6 "CLK4" I L 1250 2400 50 
F7 "~RESET" I L 1250 2200 50 
F8 "~µCE" O R 2400 3200 50 
F9 "RADDR[0..4]" O R 2400 2250 50 
F10 "WADDR[0..4]" O R 2400 2350 50 
F11 "COND[0..4]" O R 2400 2450 50 
F12 "ACTION[0..3]" O R 2400 2550 50 
F13 "~MEM" O R 2400 2650 50 
F14 "~IO" O R 2400 2750 50 
F15 "~R" O R 2400 2850 50 
F16 "~WEN" O R 2400 2950 50 
F17 "~END" O R 2400 3050 50 
F18 "~IRQSµC" I L 1250 3300 50 
F19 "IN-RSVD" I L 1250 3100 50 
F20 "COND" I L 1250 3000 50 
F21 "IR[7..15]" I L 1250 3200 50 
F22 "FPD[0..7]" T R 2400 4200 50 
F23 "~FPµA0" I R 2400 3350 50 
F24 "~FPµA1" I R 2400 3450 50 
F25 "~FPµA2" I R 2400 3550 50 
F26 "~FPµC0" I R 2400 3650 50 
F27 "~FPµC1" I R 2400 3750 50 
F28 "~FPµC2" I R 2400 3850 50 
F29 "IDX[0..1]" I L 1250 2900 50 
F30 "FPFETCH" O R 2400 4100 50 
$EndSheet
Wire Wire Line
	2400 4100 3000 4100
Text Label 3000 4100 2    50   ~ 0
FPFETCH∕~EXEC
Wire Wire Line
	650  3100 1250 3100
Text Notes 1300 1750 0    70   ~ 14
Verilog
Text Notes 1300 4300 0    70   ~ 14
Verilog
Text Notes 1300 5300 0    70   ~ 14
Verilog
Text Notes 3250 7550 0    70   ~ 14
Verilog
Text Notes 1800 5900 0    70   ~ 14
To Merge
Text Notes 1300 6300 0    70   ~ 14
Verilog
Text Notes 1350 7450 0    70   ~ 14
Verilog
Text Notes 3900 6400 0    70   ~ 14
Verilog
Text Notes 5300 6050 0    70   ~ 14
Verilog
$Sheet
S 4950 5050 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L 4950 6000 50 
F3 "~RESET" I L 4950 5150 50 
F4 "FI" O R 6100 5150 50 
F5 "~IRQS" O R 6100 5900 50 
F6 "~END" I L 4950 5850 50 
F7 "CLK4" I L 4950 5350 50 
F8 "~ACTION-STI" I L 4950 5550 50 
F9 "~ACTION-CLI" I L 4950 5450 50 
F10 "CLK1" I L 4950 5250 50 
F11 "~IRQSµC" O R 6100 6000 50 
F12 "IBUS15" I L 4950 5650 50 
F13 "~FLAGWE" I L 4950 5750 50 
$EndSheet
Text Notes 5400 4150 0    70   ~ 14
Verilog
$EndSCHEMATC
