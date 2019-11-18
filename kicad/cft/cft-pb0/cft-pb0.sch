EESchema Schematic File Version 4
LIBS:cft-pb0-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 12
Title "Control Unit Board"
Date ""
Rev ""
Comp ""
Comment1 "CUB"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 7550 2750 1150 1300
U 5EFCF155
F0 "Skip/Branch Unit" 50
F1 "cft_sbl.sch" 50
F2 "~COND" O R 8700 2900 50 
F3 "FN" I L 7550 3700 50 
F4 "~SKIPEXT" T L 7550 3900 50 
F5 "FV" I L 7550 3400 50 
F6 "FL" I L 7550 3500 50 
F7 "FZ" I L 7550 3600 50 
F8 "CLK4" I L 7550 3000 50 
F9 "COND[0..4]" I L 7550 3100 50 
F10 "~RESET" I L 7550 2900 50 
F11 "IR[0..6]" I L 7550 3200 50 
$EndSheet
$Sheet
S 7550 4650 1150 750 
U 5F3EA987
F0 "Address Generation Logic (AGL)" 50
F1 "cft_agl.sch" 50
F2 "IBUS[0..15]" T R 8700 4800 50 
F3 "IR[0..10]" I L 7550 4800 50 
F4 "PC[10..15]" I L 7550 4950 50 
F5 "~END" I L 7550 5100 50 
F6 "~READ-AGL" I L 7550 5250 50 
$EndSheet
$Sheet
S 7550 5650 1150 300 
U 5CD3AC27
F0 "Auto-Index Logic (AIL)" 50
F1 "cft_ail.sch" 50
F2 "IR[6..11]" I L 7550 5800 50 
F3 "IDX[0..1]" I R 8700 5800 50 
$EndSheet
$Sheet
S 11250 4350 1150 850 
U 5E507DE3
F0 "Constant Store" 50
F1 "cpu_cs.sch" 50
F2 "~RUEN" I L 11250 4500 50 
F3 "RADDR[0..4]" I L 11250 4650 50 
F4 "IBUS[0..15]" B R 12400 4500 50 
$EndSheet
$Sheet
S 14850 2150 1150 1300
U 5D69F3FD
F0 "Flag Unit" 50
F1 "flag_unit.sch" 50
F2 "FPD[0..7]" T R 16000 3300 50 
F3 "IBUS[8..15]" T R 16000 2300 50 
F4 "~FPFLAGS" I L 14850 3300 50 
F5 "~ACTION-CPL" O R 16000 2450 50 
F6 "~ACTION-CLL" O R 16000 2550 50 
F7 "~ACTION-STI" O R 16000 2650 50 
F8 "~ACTION-CLI" O R 16000 2750 50 
F9 "WADDR[0..4]" I L 14850 2300 50 
F10 "RADDR[0..4]" I L 14850 2450 50 
F11 "ACTION[0..3]" I L 14850 2600 50 
F12 "FI" I L 14850 2750 50 
F13 "FV" I L 14850 2850 50 
F14 "FL" I L 14850 2950 50 
F15 "FZ" I L 14850 3050 50 
F16 "FN" I L 14850 3150 50 
F17 "~FLAGWE" O R 16000 3150 50 
$EndSheet
Text Label 3500 3150 0    50   ~ 0
IN-RSVD
Text Label 3500 3050 0    50   ~ 0
~COND
Text Label 3500 3350 0    50   ~ 0
~IRQSµC
Wire Wire Line
	4100 3350 3500 3350
Text Label 5850 4250 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	5250 4250 5850 4250
Text Label 3500 4250 0    50   ~ 0
~FPµC2
Text Label 3500 4150 0    50   ~ 0
~FPµC1
Text Label 3500 4050 0    50   ~ 0
~FPµC0
Text Label 3500 3950 0    50   ~ 0
~FPµA2
Text Label 3500 3850 0    50   ~ 0
~FPµA1
Text Label 3500 3750 0    50   ~ 0
~FPµA0
Wire Wire Line
	4100 4250 3500 4250
Wire Wire Line
	4100 4150 3500 4150
Wire Wire Line
	4100 4050 3500 4050
Wire Wire Line
	4100 3950 3500 3950
Wire Wire Line
	4100 3850 3500 3850
Wire Wire Line
	4100 3750 3500 3750
Text Label 5850 3100 2    50   ~ 0
~END
Text Label 5850 3000 2    50   ~ 0
~WEN
Text Label 5850 2900 2    50   ~ 0
~R
Text Label 5850 2800 2    50   ~ 0
~IO
Text Label 5850 2700 2    50   ~ 0
~MEM
Wire Wire Line
	5250 3000 5850 3000
Wire Wire Line
	5250 2900 5850 2900
Wire Wire Line
	5250 2800 5850 2800
Wire Wire Line
	5250 2700 5850 2700
Text Label 3500 2750 0    50   ~ 0
~WS
Text Label 3500 2650 0    50   ~ 0
~ENDEXT
Wire Wire Line
	3500 2750 4100 2750
Wire Wire Line
	3500 2650 4100 2650
Text Label 3500 2250 0    50   ~ 0
~RESET
Wire Wire Line
	4100 2250 3500 2250
Text Label 3500 2350 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	3500 2350 4100 2350
Text Label 3500 2450 0    50   ~ 0
CLK4
Wire Wire Line
	4100 2450 3500 2450
Text Label 3500 2550 0    50   ~ 0
~HALT
Wire Wire Line
	4100 2550 3500 2550
Text Label 2850 1650 2    50   ~ 0
WSTB
Text Label 2850 1500 2    50   ~ 0
T34
Text Label 2850 1350 2    50   ~ 0
CLK4
Text Label 2850 1250 2    50   ~ 0
CLK3
Text Label 2850 1150 2    50   ~ 0
CLK2
Text Label 2850 1050 2    50   ~ 0
CLK1
Text Label 2850 900  2    50   ~ 0
~RSTHOLD
Wire Wire Line
	2400 1650 2850 1650
Wire Wire Line
	2400 1500 2850 1500
Wire Wire Line
	2400 1350 2850 1350
Wire Wire Line
	2400 1250 2850 1250
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
	2400 1150 2850 1150
Wire Wire Line
	2400 1050 2850 1050
Wire Wire Line
	2850 900  2400 900 
Text Label 800  1500 0    50   ~ 0
POWEROK
Text Label 800  1250 0    50   ~ 0
FPCLKEN
Text Label 800  1150 0    50   ~ 0
FPCLK
Text Label 800  1050 0    50   ~ 0
~FPRESET
Text Label 800  900  0    50   ~ 0
~RESET
Wire Wire Line
	1250 1250 800  1250
Wire Wire Line
	1250 1150 800  1150
Wire Wire Line
	1250 1050 800  1050
Wire Wire Line
	1250 900  800  900 
Wire Wire Line
	1250 1500 800  1500
Text Label 3500 2950 0    50   ~ 0
IDX[0..1]
Text Label 3500 3250 0    50   ~ 0
IR[7..15]
Wire Bus Line
	5250 2400 5850 2400
Wire Bus Line
	5250 2600 5850 2600
Text Label 5850 2300 2    50   ~ 0
RADDR[0..4]
Wire Bus Line
	5250 2300 5850 2300
Text Label 5850 2400 2    50   ~ 0
WADDR[0..4]
Text Label 5850 2500 2    50   ~ 0
COND[0..4]
Text Label 5850 2600 2    50   ~ 0
ACTION[0..3]
Text Label 5850 4800 2    50   ~ 0
IR[0..15]
Text Label 5850 5250 2    50   ~ 0
FPO[0..7]
Wire Bus Line
	5250 5250 5850 5250
Wire Bus Line
	4100 4800 3500 4800
Text Label 3500 4800 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	4100 4950 3500 4950
Wire Wire Line
	4100 5100 3500 5100
Wire Wire Line
	4100 5250 3500 5250
Text Label 3500 4950 0    50   ~ 0
~WRITE-IR
Text Label 3500 5100 0    50   ~ 0
~FPIRL
Text Label 3500 5250 0    50   ~ 0
~FPIRH
$Sheet
S 4100 2100 1150 2300
U 5DEAC282
F0 "Microprogram Sequencer" 50
F1 "cft_microcode.sch" 50
F2 "~ENDEXT" I L 4100 2650 50 
F3 "~RSTHOLD" I L 4100 2350 50 
F4 "~WS" I L 4100 2750 50 
F5 "~HALT" I L 4100 2550 50 
F6 "CLK4" I L 4100 2450 50 
F7 "~RESET" I L 4100 2250 50 
F8 "RADDR[0..4]" O R 5250 2300 50 
F9 "WADDR[0..4]" O R 5250 2400 50 
F10 "COND[0..4]" O R 5250 2500 50 
F11 "ACTION[0..3]" O R 5250 2600 50 
F12 "~MEM" O R 5250 2700 50 
F13 "~IO" O R 5250 2800 50 
F14 "~R" O R 5250 2900 50 
F15 "~WEN" O R 5250 3000 50 
F16 "~END" O R 5250 3100 50 
F17 "~IRQSµC" I L 4100 3350 50 
F18 "IN-RSVD" I L 4100 3150 50 
F19 "~COND" I L 4100 3050 50 
F20 "IR[7..15]" I L 4100 3250 50 
F21 "FPD[0..7]" T R 5250 4250 50 
F22 "~FPµA0" I L 4100 3750 50 
F23 "~FPµA1" I L 4100 3850 50 
F24 "~FPµA2" I L 4100 3950 50 
F25 "~FPµC0" I L 4100 4050 50 
F26 "~FPµC1" I L 4100 4150 50 
F27 "~FPµC2" I L 4100 4250 50 
F28 "IDX[0..1]" I L 4100 2950 50 
F29 "FPFETCH" O R 5250 4150 50 
$EndSheet
Wire Wire Line
	5250 4150 5850 4150
Text Label 5850 4150 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 1300 1750 0    70   ~ 14
Verilog
Text Notes 4800 3950 0    70   ~ 14
Verilog
Text Notes 15200 4900 0    70   ~ 14
Verilog
$Sheet
S 14850 3900 1150 1050
U 5F67D4B5
F0 "Interrupt State Machine" 50
F1 "cft_int_fsm.sch" 50
F2 "~IRQ" I L 14850 4850 50 
F3 "~RESET" I L 14850 4000 50 
F4 "FI" O R 16000 4000 50 
F5 "~IRQS" O R 16000 4750 50 
F6 "~END" I L 14850 4700 50 
F7 "CLK4" I L 14850 4200 50 
F8 "~ACTION-STI" I L 14850 4400 50 
F9 "~ACTION-CLI" I L 14850 4300 50 
F10 "CLK1" I L 14850 4100 50 
F11 "~IRQSµC" O R 16000 4850 50 
F12 "IBUS15" I L 14850 4500 50 
F13 "~FLAGWE" I L 14850 4600 50 
$EndSheet
Text Notes 15300 3000 0    70   ~ 14
Verilog
Entry Bus Bus
	6050 5700 6150 5800
Wire Bus Line
	6150 5800 7550 5800
Wire Bus Line
	6050 5700 6050 4900
Wire Bus Line
	8700 4800 9300 4800
Text Label 9300 4800 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	8700 2900 9550 2900
Wire Wire Line
	9550 2900 9550 6500
Wire Wire Line
	9550 6500 2400 6500
Wire Wire Line
	2400 6500 2400 3050
Wire Wire Line
	2400 3050 4100 3050
Text Label 8850 2900 0    50   ~ 0
~COND
Entry Bus Bus
	5950 4800 6050 4900
Text Label 7000 2900 0    50   ~ 0
~RESET
Wire Wire Line
	7550 2900 7000 2900
Text Label 7000 3000 0    50   ~ 0
CLK4
Wire Wire Line
	7550 3000 7000 3000
Entry Bus Bus
	5950 4800 6050 4700
Wire Bus Line
	6050 4700 6050 3300
Entry Bus Bus
	6050 3300 6150 3200
Wire Bus Line
	6150 3200 7550 3200
Wire Bus Line
	7550 4950 6950 4950
Text Label 6950 4950 0    50   ~ 0
PC[10..15]
Wire Wire Line
	6300 3100 6300 5100
Wire Wire Line
	5250 3100 6300 3100
Wire Wire Line
	6300 5100 7550 5100
Text Label 6950 5100 0    50   ~ 0
~END
Wire Wire Line
	7550 3400 7000 3400
Wire Wire Line
	7550 3500 7000 3500
Wire Wire Line
	7550 3600 7000 3600
Wire Wire Line
	7550 3700 7000 3700
Text Label 7000 3400 0    50   ~ 0
FV
Text Label 7000 3500 0    50   ~ 0
FL
Text Label 7000 3600 0    50   ~ 0
FZ
Text Label 7000 3700 0    50   ~ 0
FN
Wire Bus Line
	7550 3100 6400 3100
Wire Bus Line
	6400 3100 6400 2500
Wire Bus Line
	5250 2500 6400 2500
Text Label 7000 3100 0    50   ~ 0
COND[0..4]
Text Label 7000 3200 0    50   ~ 0
IR[0..6]
Text Label 6950 4800 0    50   ~ 0
IR[0..10]
Wire Wire Line
	7550 3900 7000 3900
Text Label 7000 3900 0    50   ~ 0
~SKIPEXT
$Sheet
S 4100 4650 1150 750 
U 5F63066B
F0 "Instruction Register (IR)" 50
F1 "cfg_reg_ir.sch" 50
F2 "IBUS[0..15]" T L 4100 4800 50 
F3 "IR[0..15]" B R 5250 4800 50 
F4 "~FPIRL" I L 4100 5100 50 
F5 "~FPIRH" I L 4100 5250 50 
F6 "FPO[0..7]" T R 5250 5250 50 
F7 "~WRITE-IR" I L 4100 4950 50 
$EndSheet
Entry Bus Bus
	5950 5800 6050 5700
Wire Bus Line
	5950 5800 2900 5800
Wire Bus Line
	2900 5800 2900 3250
Wire Bus Line
	2900 3250 4100 3250
Wire Bus Line
	2800 2950 2800 6150
Wire Bus Line
	2800 6150 9400 6150
Wire Bus Line
	9400 6150 9400 5800
Wire Bus Line
	9400 5800 8700 5800
Wire Bus Line
	2800 2950 4100 2950
Text Label 9300 5800 2    50   ~ 0
IDX[0..1]
$Comp
L Device:R_Small R?
U 1 1 5E01FB7B
P 2500 3350
AR Path="/5E01FB7B" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E01FB7B" Ref="R?"  Part="1" 
AR Path="/5D54E677/5E01FB7B" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5E01FB7B" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5E01FB7B" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5E01FB7B" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5E01FB7B" Ref="R?"  Part="1" 
F 0 "R?" H 2559 3396 50  0000 L CNN
F 1 "4.7kΩ" H 2559 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2500 3350 50  0001 C CNN
F 3 "~" H 2500 3350 50  0001 C CNN
	1    2500 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E02261A
P 2500 3450
F 0 "#PWR?" H 2500 3200 50  0001 C CNN
F 1 "GND" H 2588 3413 50  0000 L CNN
F 2 "" H 2500 3450 50  0001 C CNN
F 3 "" H 2500 3450 50  0001 C CNN
	1    2500 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3150 2500 3250
Wire Wire Line
	2500 3150 4100 3150
Wire Wire Line
	7550 5250 6950 5250
Wire Bus Line
	5250 4800 7550 4800
Text Label 6950 5250 0    50   ~ 0
~READ-AGL
$EndSCHEMATC
