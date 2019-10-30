EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 34
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
S -3450 2400 1150 1350
U 5D892D5E
F0 "Accumulator (AC)" 50
F1 "cft_proc_ac.sch" 50
F2 "~FPACH" I L -3450 3550 50 
F3 "~FPACL" I L -3450 3450 50 
F4 "~RAC" I L -3450 2850 50 
F5 "~ACTION-INCAC" I L -3450 3250 50 
F6 "~WRITE-AC" I L -3450 3000 50 
F7 "RESET" I L -3450 2550 50 
F8 "FPO[0..7]" T R -2300 3550 50 
F9 "IBUS[0..15]" I L -3450 2700 50 
F10 "~ACTION-DECAC" I L -3450 3150 50 
F11 "~ACCPL" O R -2300 3150 50 
F12 "FZ" O R -2300 2850 50 
F13 "FN" O R -2300 3000 50 
F14 "AC[0..15]" I R -2300 2700 50 
$EndSheet
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
S 9650 1100 1150 2300
U 5E726BB8
F0 "Unit Decoders" 50
F1 "cft_unit_decoders.sch" 50
F2 "RUNIT[0..3]" I L 9650 1750 50 
F3 "CLK1" I L 9650 1400 50 
F4 "~R1" O R 10800 1250 50 
F5 "~RAGL" O R 10800 1350 50 
F6 "~READ-PC" O R 10800 1450 50 
F7 "~READ-DR" O R 10800 1550 50 
F8 "~RAC" O R 10800 1650 50 
F9 "~R6" O R 10800 1750 50 
F10 "~R7" O R 10800 1850 50 
F11 "~µCE" I L 9650 2050 50 
F12 "WUNIT[0..2]" I L 9650 1900 50 
F13 "~RESET" I L 9650 1250 50 
F14 "CLK3" I L 9650 1550 50 
F15 "~W1" I R 10800 2050 50 
F16 "~WRITE-AR" I R 10800 2150 50 
F17 "~WRITE-PC" I R 10800 2250 50 
F18 "~WIR" I R 10800 2350 50 
F19 "~WRITE-DR" I R 10800 2450 50 
F20 "~WRITE-AC" I R 10800 2550 50 
F21 "~WALU" I R 10800 2650 50 
F22 "~STPDR" I L 9650 2850 50 
F23 "~DEC" I L 9650 3150 50 
F24 "~STPAC" I L 9650 3000 50 
F25 "RESET" O R 10800 2850 50 
F26 "~ACTION-DECDR" O R 10800 2950 50 
F27 "~ACTION-INCDR" O R 10800 3050 50 
F28 "~ACTION-DECAC" O R 10800 3150 50 
F29 "~ACTION-INCAC" O R 10800 3250 50 
$EndSheet
Wire Notes Line
	-3600 -50  -600 -50 
Wire Notes Line
	-3600 4050 -3600 -50 
$Sheet
S 10550 -1900 1150 1350
U 5CE09726
F0 "Sheet5CE09725" 50
F1 "shifter.sch" 50
$EndSheet
$Sheet
S -2000 2400 1150 1350
U 5D1E3359
F0 "Stack Pointer (SP)" 50
F1 "cft_proc_sp.sch" 50
F2 "~FPSPH" I L -2000 3550 50 
F3 "~FPSPL" I L -2000 3450 50 
F4 "~READ-SP" I L -2000 2850 50 
F5 "~ACTION-INCSP" I L -2000 3250 50 
F6 "~WRITE-SP" I L -2000 3000 50 
F7 "RESET" I L -2000 2550 50 
F8 "FPO[0..7]" T R -850 3550 50 
F9 "IBUS[0..15]" I L -2000 2700 50 
F10 "~ACTION-DECSP" I L -2000 3150 50 
$EndSheet
$Sheet
S -1950 250  1150 1350
U 5D79EA4B
F0 "Data Register (DR)" 50
F1 "cft_proc_dr.sch" 50
F2 "~FPDRH" I L -1950 1400 50 
F3 "~FPDRL" I L -1950 1300 50 
F4 "~READ-DR" I L -1950 750 50 
F5 "~INCDR" I L -1950 1100 50 
F6 "~WRITE-DR" I L -1950 850 50 
F7 "RESET" I L -1950 400 50 
F8 "FPO[0..7]" T R -800 1400 50 
F9 "IBUS[0..15]" I L -1950 550 50 
F10 "~DECDR" I L -1950 1000 50 
$EndSheet
$Sheet
S -3350 250  1150 1350
U 5D62E1DC
F0 "Program Counter (PC)" 50
F1 "cft_prog_pc.sch" 50
F2 "~READ-PC" I L -3350 750 50 
F3 "~ACTION-INCPC" I L -3350 950 50 
F4 "~WRITE-PC" I L -3350 850 50 
F5 "RESET" I L -3350 400 50 
F6 "FPO[0..7]" T R -2200 1450 50 
F7 "IBUS[0..15]" I L -3350 550 50 
F8 "~FPPCH" I L -3350 1400 50 
F9 "~FPPCL" I L -3350 1300 50 
F10 "PC[0..15]" I R -2200 550 50 
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
S -8950 225  1150 2100
U 5DC89E19
F0 "ALU" 50
F1 "alu.sch" 50
F2 "IBUS[0..15]" T R -7800 375 50 
F3 "RADDR[0..4]" I L -8950 875 50 
F4 "~RUEN" I L -8950 775 50 
F5 "CLK4" I L -8950 575 50 
F6 "AC[0..15]" I L -8950 1675 50 
F7 "FLOUT" I R -7800 1475 50 
F8 "FLFAST" I L -8950 1475 50 
F9 "CLK2" I L -8950 475 50 
F10 "IR[0..6]" I L -8950 1575 50 
F11 "~RESET" I L -8950 375 50 
F12 "FLCP" I R -7800 1575 50 
F13 "WADDR[0..4]" I L -8950 1175 50 
F14 "~WUEN" I L -8950 1075 50 
F15 "FV" I R -7800 1675 50 
F16 "~ACTION-SRU" I L -8950 1275 50 
F17 "FVCP" O R -7800 1775 50 
$EndSheet
Wire Notes Line
	-600 4050 -3600 4050
Wire Notes Line
	-5850 -25  -3900 -25 
Wire Notes Line
	-5850 4000 -5850 -25 
Wire Notes Line
	-3900 4000 -5850 4000
Wire Notes Line
	-3900 -25  -3900 4000
$Sheet
S -7500 2175 1150 1100
U 5D35C694
F0 "Overflow Register (V)" 50
F1 "cft_reg_v_2019.sch" 50
F2 "FV" O R -6350 2325 50 
F3 "~READ-ALU-ADD" I L -7500 2675 50 
F4 "CLK4" I L -7500 2475 50 
F5 "~RESET" I L -7500 2325 50 
F6 "IBUS13" I L -7500 3075 50 
F7 "FVIN-ADD" I L -7500 2775 50 
F8 "~FLAGWE" I L -7500 2975 50 
$EndSheet
Wire Notes Line
	-9250 -25  -6100 -25 
Wire Notes Line
	-9250 4525 -9250 -25 
Wire Notes Line
	-6100 4525 -9250 4525
Wire Notes Line
	-6100 -25  -6100 4525
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
$Sheet
S -5450 150  1150 1500
U 5D46B22D
F0 "Wait States & Write Strobes" 50
F1 "cft_ws_busen.sch" 50
F2 "WSTB" I L -5450 700 50 
F3 "~RESET" I L -5450 300 50 
F4 "CLK3" I L -5450 500 50 
F5 "T34" I L -5450 600 50 
F6 "~MEM" I L -5450 850 50 
F7 "~IO" I L -5450 950 50 
F8 "~HALT" I L -5450 400 50 
F9 "~WEN" I L -5450 1150 50 
F10 "~WS" I L -5450 1400 50 
F11 "~W" T R -4300 1050 50 
F12 "~R" I L -5450 1050 50 
F13 "IBUS[0..15]" T L -5450 1500 50 
F14 "DB[0..15]" T R -4300 1500 50 
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
S -7500 225  1150 1650
U 5D121AA3
F0 "Link Register (L)" 50
F1 "cft_reg_l_2019.sch" 50
F2 "FL" O R -6350 375 50 
F3 "CLK4" I L -7500 525 50 
F4 "~FLAGWE" I L -7500 1275 50 
F5 "~READ-ALU-ADD" I L -7500 775 50 
F6 "FLIN-SRU" I L -7500 1125 50 
F7 "FLIN-ADD" I L -7500 875 50 
F8 "IBUS12" I L -7500 1375 50 
F9 "BCP" I L -7500 1025 50 
F10 "~RESET" I L -7500 375 50 
F11 "FLFAST" O R -6350 1025 50 
F12 "WSTB" I L -7500 625 50 
F13 "ACTION[0..3]" I L -7500 1525 50 
F14 "~ACTION-SRU" O R -6350 1125 50 
$EndSheet
$Sheet
S 8150 1600 1150 1800
U 5DB25C41
F0 "Action Decoders" 50
F1 "cft_action_decoder.sch" 50
F2 "ACTION[0..3]" I L 8150 1750 50 
F3 "~ACTION-CPL" T R 9300 1750 50 
F4 "~ACTION-CLL" T R 9300 1850 50 
F5 "~ACTION-STI" T R 9300 1950 50 
F6 "~ACTION-CLI" T R 9300 2050 50 
F7 "~ACTION-CLA" T R 9300 2150 50 
F8 "~ACTION6" T R 9300 2250 50 
F9 "~ACTION-SRU" T R 9300 2350 50 
F10 "~ACTION-INCPC" T R 9300 2550 50 
F11 "~ACTION-INCDR" T R 9300 2650 50 
F12 "~ACTION-DECDR" T R 9300 2750 50 
F13 "WSTB" I L 8150 1850 50 
F14 "~ACTION-INCAC" T R 9300 2850 50 
F15 "~ACTION-DECAC" T R 9300 2950 50 
F16 "~ACTION-INCSP" T R 9300 3050 50 
F17 "~ACTION-DECSP" T R 9300 3150 50 
F18 "~ACTION15" T R 9300 3250 50 
F19 "~µCE" I L 8150 1950 50 
$EndSheet
$Sheet
S -5450 2950 1150 750 
U 5CC06F10
F0 "Address Register (AR)" 50
F1 "cft_ar.sch" 50
F2 "~MEM" T L -5450 3400 50 
F3 "~IO" T L -5450 3550 50 
F4 "IBUS[0..15]" T L -5450 3100 50 
F5 "~WRITE-AR" I L -5450 3250 50 
F6 "AB[0..23]" O R -4300 3050 50 
F7 "AEXT[0..7]" I L -5450 3000 50 
F8 "~SYSDEV" O R -4300 3150 50 
F9 "~IODEV1XX" O R -4300 3250 50 
F10 "~IODEV2XX" O R -4300 3350 50 
F11 "~IODEV3XX" O R -4300 3450 50 
F12 "~FPAEXT" I L -5450 3650 50 
F13 "FPD[0..7]" T R -4300 3650 50 
$EndSheet
$Comp
L alexios:conn_2x82_ab SLOT?
U 1 1 5D38F4D9
P 13350 2000
F 0 "SLOT?" H 13400 3017 50  0000 C CNN
F 1 "conn_2x82_ab" H 13400 2926 50  0000 C CNN
F 2 "" H 13350 2000 50  0001 C CNN
F 3 "" H 13350 2000 50  0001 C CNN
	1    13350 2000
	1    0    0    -1  
$EndComp
$Comp
L alexios:conn_2x82_ab SLOT?
U 2 1 5D396164
P 15250 2000
F 0 "SLOT?" H 15300 3017 50  0000 C CNN
F 1 "conn_2x82_ab" H 15300 2926 50  0000 C CNN
F 2 "" H 15250 2000 50  0001 C CNN
F 3 "" H 15250 2000 50  0001 C CNN
	2    15250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 1200 12700 1200
Wire Wire Line
	13100 1300 12700 1300
Wire Wire Line
	13100 1400 12700 1400
Wire Wire Line
	13100 1500 12700 1500
Wire Wire Line
	13100 1600 12700 1600
Wire Wire Line
	13100 1700 12700 1700
Wire Wire Line
	13100 1800 12700 1800
Wire Wire Line
	13100 1900 12700 1900
Wire Wire Line
	13100 2000 12700 2000
Wire Wire Line
	13100 2100 12700 2100
Wire Wire Line
	13100 2200 12700 2200
Wire Wire Line
	13100 2300 12700 2300
Wire Wire Line
	13100 2400 12700 2400
Wire Wire Line
	13100 2500 12700 2500
Wire Wire Line
	13100 2600 12700 2600
Wire Wire Line
	13100 2700 12700 2700
Wire Wire Line
	13100 2800 12700 2800
Wire Wire Line
	13100 2900 12700 2900
Wire Wire Line
	13100 3000 12700 3000
Wire Wire Line
	13100 3100 12700 3100
Wire Wire Line
	13100 3200 12700 3200
Wire Wire Line
	13100 3300 12700 3300
Wire Wire Line
	13100 3400 12700 3400
Wire Wire Line
	13100 3500 12700 3500
Wire Wire Line
	13100 3600 12700 3600
Wire Wire Line
	13100 3700 12700 3700
Wire Wire Line
	13100 3800 12700 3800
Wire Wire Line
	13100 3900 12700 3900
Wire Wire Line
	13100 4000 12700 4000
Wire Wire Line
	13100 4100 12700 4100
Wire Wire Line
	13100 4200 12700 4200
Wire Wire Line
	13100 4300 12700 4300
Wire Wire Line
	13100 4400 12700 4400
Wire Wire Line
	13100 4500 12700 4500
Wire Wire Line
	13100 4600 12700 4600
Wire Wire Line
	13100 4700 12700 4700
Wire Wire Line
	13100 4800 12700 4800
Wire Wire Line
	13100 4900 12700 4900
Wire Wire Line
	13100 5000 12700 5000
Wire Wire Line
	13100 5100 12700 5100
Wire Wire Line
	13100 5200 12700 5200
Wire Wire Line
	14100 1200 13700 1200
Wire Wire Line
	14100 1300 13700 1300
Wire Wire Line
	14100 1400 13700 1400
Wire Wire Line
	14100 1500 13700 1500
Wire Wire Line
	14100 1600 13700 1600
Wire Wire Line
	14100 1700 13700 1700
Wire Wire Line
	14100 1800 13700 1800
Wire Wire Line
	14100 1900 13700 1900
Wire Wire Line
	14100 2000 13700 2000
Wire Wire Line
	14100 2100 13700 2100
Wire Wire Line
	14100 2200 13700 2200
Wire Wire Line
	14100 2300 13700 2300
Wire Wire Line
	14100 2400 13700 2400
Wire Wire Line
	14100 2500 13700 2500
Wire Wire Line
	14100 2600 13700 2600
Wire Wire Line
	14100 2700 13700 2700
Wire Wire Line
	14100 2900 13700 2900
Wire Wire Line
	14100 3000 13700 3000
Wire Wire Line
	14100 3100 13700 3100
Wire Wire Line
	14100 3200 13700 3200
Wire Wire Line
	14100 3300 13700 3300
Wire Wire Line
	14100 3400 13700 3400
Wire Wire Line
	14100 3500 13700 3500
Wire Wire Line
	14100 3600 13700 3600
Wire Wire Line
	14100 3800 13700 3800
Wire Wire Line
	14100 3900 13700 3900
Wire Wire Line
	14100 4000 13700 4000
Wire Wire Line
	14100 4100 13700 4100
Wire Wire Line
	14100 4200 13700 4200
Wire Wire Line
	14100 4300 13700 4300
Wire Wire Line
	14100 4400 13700 4400
Wire Wire Line
	14100 4500 13700 4500
Wire Wire Line
	14100 4600 13700 4600
Wire Wire Line
	14100 4700 13700 4700
Wire Wire Line
	14100 4800 13700 4800
Wire Wire Line
	14100 4900 13700 4900
Wire Wire Line
	14100 5000 13700 5000
Wire Wire Line
	14100 5100 13700 5100
Wire Wire Line
	14100 5200 13700 5200
Wire Wire Line
	15000 1200 14600 1200
Wire Wire Line
	15000 1300 14600 1300
Wire Wire Line
	15000 1400 14600 1400
Wire Wire Line
	15000 1500 14600 1500
Wire Wire Line
	15000 1600 14600 1600
Wire Wire Line
	15000 1700 14600 1700
Wire Wire Line
	15000 1800 14600 1800
Wire Wire Line
	15000 1900 14600 1900
Wire Wire Line
	15000 2000 14600 2000
Wire Wire Line
	15000 2100 14600 2100
Wire Wire Line
	15000 2200 14600 2200
Wire Wire Line
	15000 2300 14600 2300
Wire Wire Line
	15000 2400 14600 2400
Wire Wire Line
	15000 2500 14600 2500
Wire Wire Line
	15000 2600 14600 2600
Wire Wire Line
	15000 2700 14600 2700
Wire Wire Line
	15000 2800 14600 2800
Wire Wire Line
	15000 2900 14600 2900
Wire Wire Line
	15000 3000 14600 3000
Wire Wire Line
	15000 3100 14600 3100
Wire Wire Line
	15000 3200 14600 3200
Wire Wire Line
	15000 3300 14600 3300
Wire Wire Line
	15000 3400 14600 3400
Wire Wire Line
	15000 3500 14600 3500
Wire Wire Line
	15000 3600 14600 3600
Wire Wire Line
	15000 3700 14600 3700
Wire Wire Line
	15000 3800 14600 3800
Wire Wire Line
	15000 3900 14600 3900
Wire Wire Line
	15000 4000 14600 4000
Wire Wire Line
	15000 4100 14600 4100
Wire Wire Line
	15000 4200 14600 4200
Wire Wire Line
	15000 4300 14600 4300
Wire Wire Line
	15000 4400 14600 4400
Wire Wire Line
	15000 4500 14600 4500
Wire Wire Line
	15000 4600 14600 4600
Wire Wire Line
	15000 4700 14600 4700
Wire Wire Line
	16000 1200 15600 1200
Wire Wire Line
	16000 1300 15600 1300
Wire Wire Line
	16000 1400 15600 1400
Wire Wire Line
	16000 1500 15600 1500
Wire Wire Line
	16000 1600 15600 1600
Wire Wire Line
	16000 1700 15600 1700
Wire Wire Line
	16000 1800 15600 1800
Wire Wire Line
	16000 1900 15600 1900
Wire Wire Line
	16000 2000 15600 2000
Wire Wire Line
	16000 2100 15600 2100
Wire Wire Line
	16000 2200 15600 2200
Wire Wire Line
	16000 2300 15600 2300
Wire Wire Line
	16000 2400 15600 2400
Wire Wire Line
	16000 2500 15600 2500
Wire Wire Line
	16000 2600 15600 2600
Wire Wire Line
	16000 2700 15600 2700
Wire Wire Line
	16000 2800 15600 2800
Wire Wire Line
	16000 2900 15600 2900
Wire Wire Line
	16000 3000 15600 3000
Wire Wire Line
	16000 3100 15600 3100
Wire Wire Line
	16000 3200 15600 3200
Wire Wire Line
	16000 3300 15600 3300
Wire Wire Line
	16000 3400 15600 3400
Wire Wire Line
	16000 3500 15600 3500
Wire Wire Line
	16000 3600 15600 3600
Wire Wire Line
	16000 3700 15600 3700
Wire Wire Line
	16000 3800 15600 3800
Wire Wire Line
	16000 3900 15600 3900
Wire Wire Line
	16000 4000 15600 4000
Wire Wire Line
	16000 4100 15600 4100
Wire Wire Line
	16000 4200 15600 4200
Wire Wire Line
	16000 4300 15600 4300
Wire Wire Line
	16000 4400 15600 4400
Wire Wire Line
	16000 4500 15600 4500
Wire Wire Line
	16000 4600 15600 4600
Wire Wire Line
	16000 4700 15600 4700
Wire Wire Line
	16000 4800 15600 4800
Wire Wire Line
	16000 4900 15600 4900
Wire Wire Line
	16000 5000 15600 5000
Wire Wire Line
	16000 5100 15600 5100
Wire Wire Line
	16000 5200 15600 5200
Text Label 12700 1200 0    50   ~ 0
IBUS0
Text Label 12700 1300 0    50   ~ 0
IBUS1
Text Label 12700 1400 0    50   ~ 0
IBUS2
Text Label 12700 1500 0    50   ~ 0
IBUS3
Text Label 12700 1600 0    50   ~ 0
IBUS4
Text Label 12700 1700 0    50   ~ 0
IBUS5
Text Label 12700 1800 0    50   ~ 0
IBUS6
Text Label 12700 1900 0    50   ~ 0
IBUS7
Text Label 12700 2000 0    50   ~ 0
IBUS8
Text Label 12700 2100 0    50   ~ 0
IBUS9
Text Label 12700 2200 0    50   ~ 0
IBUS10
Text Label 12700 2300 0    50   ~ 0
IBUS11
Text Label 12700 2400 0    50   ~ 0
IBUS12
Text Label 12700 2500 0    50   ~ 0
IBUS13
Text Label 12700 2600 0    50   ~ 0
IBUS14
Text Label 12700 2700 0    50   ~ 0
IBUS15
Text Label 12700 2800 0    50   ~ 0
AB0
Text Label 12700 2900 0    50   ~ 0
AB1
Text Label 12700 3000 0    50   ~ 0
AB2
Text Label 12700 3100 0    50   ~ 0
AB3
Text Label 12700 3200 0    50   ~ 0
AB4
Text Label 12700 3300 0    50   ~ 0
AB5
Text Label 12700 3400 0    50   ~ 0
AB6
Text Label 12700 3500 0    50   ~ 0
AB7
Text Label 12700 3600 0    50   ~ 0
AB8
Text Label 12700 3700 0    50   ~ 0
AB9
Text Label 12700 3800 0    50   ~ 0
AB10
Text Label 12700 3900 0    50   ~ 0
AB11
Text Label 12700 4000 0    50   ~ 0
AB12
Text Label 12700 4100 0    50   ~ 0
AB13
Text Label 12700 4200 0    50   ~ 0
AB14
Text Label 12700 4300 0    50   ~ 0
AB15
Text Label 12700 4400 0    50   ~ 0
AB16
Text Label 12700 4500 0    50   ~ 0
AB17
Text Label 12700 4600 0    50   ~ 0
AB18
Text Label 12700 4700 0    50   ~ 0
AB19
Text Label 12700 4800 0    50   ~ 0
AB20
Text Label 12700 4900 0    50   ~ 0
AB21
Text Label 12700 5000 0    50   ~ 0
AB22
Text Label 12700 5100 0    50   ~ 0
AB23
Text Label 14100 1200 2    50   ~ 0
DB0
Text Label 14100 1300 2    50   ~ 0
DB1
Text Label 14100 1400 2    50   ~ 0
DB2
Text Label 14100 1500 2    50   ~ 0
DB3
Text Label 14100 1600 2    50   ~ 0
DB4
Text Label 14100 1700 2    50   ~ 0
DB5
Text Label 14100 1800 2    50   ~ 0
DB6
Text Label 14100 1900 2    50   ~ 0
DB7
Text Label 14100 2000 2    50   ~ 0
DB8
Text Label 14100 2100 2    50   ~ 0
DB9
Text Label 14100 2200 2    50   ~ 0
DB10
Text Label 14100 2300 2    50   ~ 0
DB11
Text Label 14100 2400 2    50   ~ 0
DB12
Text Label 14100 2500 2    50   ~ 0
DB13
Text Label 14100 2600 2    50   ~ 0
DB14
Text Label 14100 2700 2    50   ~ 0
DB15
Text Label 14100 2900 2    50   ~ 0
~IRQ0
Text Label 14100 3000 2    50   ~ 0
~IRQ1
Text Label 14100 3100 2    50   ~ 0
~IRQ2
Text Label 14100 3200 2    50   ~ 0
~IRQ3
Text Label 14100 3300 2    50   ~ 0
~IRQ4
Text Label 14100 3400 2    50   ~ 0
~IRQ5
Text Label 14100 3500 2    50   ~ 0
~IRQ6
Text Label 14100 3600 2    50   ~ 0
~IRQ7
Text Label 14100 3800 2    50   ~ 0
CLK1
Text Label 14100 3900 2    50   ~ 0
CLK2
Text Label 14100 4000 2    50   ~ 0
CLK3
Text Label 14100 4100 2    50   ~ 0
WSTB
Text Label 14100 4200 2    50   ~ 0
~RESET
Text Label 14100 4300 2    50   ~ 0
RADDR0
Text Label 14100 4400 2    50   ~ 0
RADDR1
Text Label 14100 4500 2    50   ~ 0
RADDR2
Text Label 14100 4600 2    50   ~ 0
RADDR3
Text Label 14100 4700 2    50   ~ 0
RADDR4
Text Label 14100 4800 2    50   ~ 0
WADDR0
Text Label 14100 4900 2    50   ~ 0
WADDR1
Text Label 14100 5000 2    50   ~ 0
WADDR2
Text Label 14100 5100 2    50   ~ 0
WADDR3
Text Label 14100 5200 2    50   ~ 0
WADDR4
Text Label 14600 1200 0    50   ~ 0
ACTION0
Text Label 14600 1300 0    50   ~ 0
ACTION1
Text Label 14600 1400 0    50   ~ 0
ACTION2
Text Label 14600 1500 0    50   ~ 0
ACTION3
Text Label 16000 1200 2    50   ~ 0
~HALT
Text Label 16000 1300 2    50   ~ 0
~ENDEXT
Text Label 16000 1400 2    50   ~ 0
~SKIPEXT
Wire Wire Line
	13700 2800 14100 2800
Text Label 14100 2800 2    50   ~ 0
~IRQ
Text Label 14600 1600 0    50   ~ 0
~MEM
Text Label 14600 1700 0    50   ~ 0
~IO
Text Label 14600 1800 0    50   ~ 0
~R
Text Label 14600 1900 0    50   ~ 0
~W
Text Label 14600 2000 0    50   ~ 0
~SYSDEV
Text Label 14600 2100 0    50   ~ 0
~IODEV1XX
Text Label 14600 2200 0    50   ~ 0
~IODEV2XX
Text Label 14600 2300 0    50   ~ 0
~IODEV3XX
Text Label 14600 2400 0    50   ~ 0
~WS
Text Label 14600 2500 0    50   ~ 0
C1
Text Label 14600 2600 0    50   ~ 0
C2
Text Label 14600 2700 0    50   ~ 0
C3
Text Label 14600 2800 0    50   ~ 0
C4
Text Label 14600 2900 0    50   ~ 0
C5
Text Label 14600 3000 0    50   ~ 0
C6
Text Label 14600 3100 0    50   ~ 0
C7
Text Label 14600 3200 0    50   ~ 0
C8
Text Label 14600 3300 0    50   ~ 0
C9
Text Label 14600 3400 0    50   ~ 0
C10
Text Label 14600 3500 0    50   ~ 0
C11
Text Label 14600 3600 0    50   ~ 0
C12
Text Label 14600 3700 0    50   ~ 0
C13
Text Label 14600 3800 0    50   ~ 0
C14
Text Label 14600 3900 0    50   ~ 0
C15
Text Label 14600 4000 0    50   ~ 0
C16
Text Label 14600 4100 0    50   ~ 0
C17
Text Label 14600 4200 0    50   ~ 0
C18
Text Label 14600 4300 0    50   ~ 0
C19
Text Label 14600 4400 0    50   ~ 0
C20
Text Label 14600 4500 0    50   ~ 0
C21
Text Label 14600 4600 0    50   ~ 0
C22
Text Label 14600 4700 0    50   ~ 0
C23
Text Label 16000 3600 2    50   ~ 0
C24
Text Label 16000 3700 2    50   ~ 0
C25
Text Label 16000 3800 2    50   ~ 0
C26
Text Label 16000 3900 2    50   ~ 0
C27
Text Label 16000 4000 2    50   ~ 0
C28
Text Label 16000 4100 2    50   ~ 0
C29
Text Label 16000 4200 2    50   ~ 0
C30
Text Label 16000 4300 2    50   ~ 0
C31
Text Label 16000 4400 2    50   ~ 0
C32
Text Label 16000 4500 2    50   ~ 0
C33
Text Label 16000 4600 2    50   ~ 0
C34
Text Label 16000 4700 2    50   ~ 0
C35
Text Label 16000 4800 2    50   ~ 0
C36
Text Label 16000 4900 2    50   ~ 0
C37
Text Label 16000 5000 2    50   ~ 0
C38
Text Label 16000 5100 2    50   ~ 0
C39
Text Label 16000 5200 2    50   ~ 0
C40
Text Label 16000 1500 2    50   ~ 0
FPO0
Text Label 16000 1600 2    50   ~ 0
FPO1
Text Label 16000 1700 2    50   ~ 0
FPO2
Text Label 16000 1800 2    50   ~ 0
FPO3
Text Label 16000 1900 2    50   ~ 0
FPO4
Text Label 16000 2000 2    50   ~ 0
FPO5
Text Label 16000 2100 2    50   ~ 0
FPO6
Text Label 16000 2200 2    50   ~ 0
FPO7
Wire Wire Line
	13700 3700 14100 3700
Text Label 14100 3700 2    50   ~ 0
~IRQS
Text Label 16000 2300 2    50   ~ 0
PWR
Text Label 16000 2400 2    50   ~ 0
PWR
Text Label 16000 2500 2    50   ~ 0
PWR
Text Label 16000 2600 2    50   ~ 0
PWR
Text Label 16000 2700 2    50   ~ 0
PWR
Text Label 16000 2800 2    50   ~ 0
PWR
Text Label 16000 2900 2    50   ~ 0
PWR
Text Label 16000 3000 2    50   ~ 0
PWR
Wire Wire Line
	15000 4800 14600 4800
Wire Wire Line
	15000 4900 14600 4900
Wire Wire Line
	15000 5000 14600 5000
Wire Wire Line
	15000 5100 14600 5100
Wire Wire Line
	15000 5200 14600 5200
$Comp
L alexios:CFT-2019-Bus P?
U 1 1 5D3829BF
P 18100 2100
F 0 "P?" H 18100 2267 50  0000 C CNN
F 1 "CFT-2019-Bus" H 18100 2176 50  0000 C CNN
F 2 "" H 18050 1200 50  0001 C CNN
F 3 "" H 18050 1200 50  0001 C CNN
	1    18100 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P?
U 2 1 5D382B6D
P 19550 2100
F 0 "P?" H 19550 2267 50  0000 C CNN
F 1 "CFT-2019-Bus" H 19550 2176 50  0000 C CNN
F 2 "" H 19500 1200 50  0001 C CNN
F 3 "" H 19500 1200 50  0001 C CNN
	2    19550 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P?
U 3 1 5D388A11
P 22500 3150
F 0 "P?" H 22500 3317 50  0000 C CNN
F 1 "CFT-2019-Bus" H 22500 3226 50  0000 C CNN
F 2 "" H 22450 2250 50  0001 C CNN
F 3 "" H 22450 2250 50  0001 C CNN
	3    22500 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P?
U 4 1 5D388A98
P 22450 2050
F 0 "P?" H 22450 2217 50  0000 C CNN
F 1 "CFT-2019-Bus" H 22450 2126 50  0000 C CNN
F 2 "" H 22400 1150 50  0001 C CNN
F 3 "" H 22400 1150 50  0001 C CNN
	4    22450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	17500 2250 17100 2250
Wire Wire Line
	17500 2450 17100 2450
Wire Wire Line
	17500 2550 17100 2550
Wire Wire Line
	17500 2650 17100 2650
Wire Wire Line
	17500 2750 17100 2750
Wire Wire Line
	17500 2850 17100 2850
Wire Wire Line
	17500 2950 17100 2950
Wire Wire Line
	17500 3050 17100 3050
Wire Wire Line
	17500 3150 17100 3150
Wire Wire Line
	17500 3250 17100 3250
Wire Wire Line
	17500 3350 17100 3350
Wire Wire Line
	17500 3450 17100 3450
Wire Wire Line
	17500 3550 17100 3550
Wire Wire Line
	17500 3650 17100 3650
Wire Wire Line
	17500 3750 17100 3750
Wire Wire Line
	17500 3850 17100 3850
Wire Wire Line
	17500 3950 17100 3950
Wire Wire Line
	17500 4050 17100 4050
Wire Wire Line
	17500 4150 17100 4150
Wire Wire Line
	17500 4250 17100 4250
Wire Wire Line
	17500 4350 17100 4350
Wire Wire Line
	17500 4450 17100 4450
Wire Wire Line
	17500 4550 17100 4550
Wire Wire Line
	17500 4650 17100 4650
Wire Wire Line
	17500 4750 17100 4750
Wire Wire Line
	17500 4850 17100 4850
Wire Wire Line
	17500 4950 17100 4950
Wire Wire Line
	17500 5050 17100 5050
Wire Wire Line
	17500 5150 17100 5150
Wire Wire Line
	17500 5250 17100 5250
Wire Wire Line
	17500 5350 17100 5350
Wire Wire Line
	17500 5450 17100 5450
Wire Wire Line
	17500 5550 17100 5550
Text Label 17100 2250 0    50   ~ 0
~RESET
Text Label 17100 2450 0    50   ~ 0
CLK1
Text Label 17100 2550 0    50   ~ 0
CLK2
Text Label 17100 2650 0    50   ~ 0
CLK3
Text Label 17100 2750 0    50   ~ 0
CLK4
Text Label 17100 2850 0    50   ~ 0
WSTB
Text Label 17100 2950 0    50   ~ 0
T34
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
$Sheet
S -5450 1900 1150 750 
U 61F95ACC
F0 "Memory Bank Registers (MBR)" 50
F1 "reg_mbr.sch" 50
F2 "FPO[0..7]" T R -4300 2500 50 
F3 "~RESET" I L -5450 2000 50 
F4 "AEXT[0..7]" O R -4300 2100 50 
F5 "WADDR[0..4]" I L -5450 2200 50 
F6 "IR[0..11]" I L -5450 2400 50 
F7 "~FPRAM~∕ROM" I L -5450 2500 50 
F8 "~FPAEXT" I R -4300 2400 50 
F9 "IBUS[0..7]" T R -4300 2000 50 
F10 "RADDR[0..4]" I L -5450 2100 50 
$EndSheet
Wire Wire Line
	2400 4100 3000 4100
Text Label 3000 4100 2    50   ~ 0
FPFETCH∕~EXEC
Wire Wire Line
	22000 4000 21350 4000
Text Label 21350 4000 0    50   ~ 0
FPFETCH∕~EXEC
Text Notes 12500 5500 0    100  ~ 20
NOT ACTUAL PINOUT! Just testing what can fit.
Wire Wire Line
	650  3100 1250 3100
Text Notes 1300 1750 0    70   ~ 14
Verilog
Text Notes 1300 4300 0    70   ~ 14
Verilog
Text Notes 1300 5300 0    70   ~ 14
Verilog
Text Notes -3400 3700 0    70   ~ 14
Verilog
Text Notes -1950 3700 0    70   ~ 14
Verilog
Text Notes -3300 1550 0    70   ~ 14
Verilog
Text Notes -1900 1550 0    70   ~ 14
Verilog
Text Notes 3250 7550 0    70   ~ 14
Verilog
Text Notes 1800 5900 0    70   ~ 14
To Merge
Text Notes 1300 6300 0    70   ~ 14
Verilog
Text Notes 1350 7450 0    70   ~ 14
Verilog
Text Notes -3600 -150 0    118  ~ 24
REG Board
Wire Notes Line
	-600 4050 -600 -50 
Text Notes -5100 3550 0    70   ~ 14
Verilog
Text Notes -6750 3225 0    70   ~ 14
Verilog
Text Notes -6750 1825 0    70   ~ 14
Verilog
Text Notes -4800 2300 0    70   ~ 14
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
Wire Notes Line
	7850 700  11050 700 
Wire Notes Line
	11050 700  11050 3750
Wire Notes Line
	11050 3750 7850 3750
Wire Notes Line
	7850 3750 7850 700 
Text Notes 8050 950  0    75   ~ 15
May not be needed as-is.
Text Notes 5400 4150 0    70   ~ 14
Verilog
Text Notes -4775 1275 0    70   ~ 14
Verilog
Text Notes -5800 -150 0    118  ~ 24
Bus Board
Text Notes -9225 -200 0    118  ~ 24
ALU
$EndSCHEMATC
