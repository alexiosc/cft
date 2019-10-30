EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
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
S 1700 1525 1150 2100
U 5DC89E19
F0 "ALU" 50
F1 "alu.sch" 50
F2 "IBUS[0..15]" T R 2850 1675 50 
F3 "RADDR[0..4]" I L 1700 2175 50 
F4 "~RUEN" I L 1700 2075 50 
F5 "CLK4" I L 1700 1875 50 
F6 "AC[0..15]" I L 1700 2975 50 
F7 "FLOUT" I R 2850 2775 50 
F8 "FLFAST" I L 1700 2775 50 
F9 "CLK2" I L 1700 1775 50 
F10 "IR[0..6]" I L 1700 2875 50 
F11 "~RESET" I L 1700 1675 50 
F12 "FLCP" I R 2850 2875 50 
F13 "WADDR[0..4]" I L 1700 2475 50 
F14 "~WUEN" I L 1700 2375 50 
F15 "FV" I R 2850 2975 50 
F16 "~ACTION-SRU" I L 1700 2575 50 
F17 "FVCP" O R 2850 3075 50 
$EndSheet
$Sheet
S 3150 3475 1150 1100
U 5D35C694
F0 "Overflow Register (V)" 50
F1 "cft_reg_v_2019.sch" 50
F2 "FV" O R 4300 3625 50 
F3 "~READ-ALU-ADD" I L 3150 3975 50 
F4 "CLK4" I L 3150 3775 50 
F5 "~RESET" I L 3150 3625 50 
F6 "IBUS13" I L 3150 4375 50 
F7 "FVIN-ADD" I L 3150 4075 50 
F8 "~FLAGWE" I L 3150 4275 50 
$EndSheet
Wire Notes Line
	1400 1275 4550 1275
Wire Notes Line
	1400 5825 1400 1275
Wire Notes Line
	4550 5825 1400 5825
Wire Notes Line
	4550 1275 4550 5825
$Sheet
S 3150 1525 1150 1650
U 5D121AA3
F0 "Link Register (L)" 50
F1 "cft_reg_l_2019.sch" 50
F2 "FL" O R 4300 1675 50 
F3 "CLK4" I L 3150 1825 50 
F4 "~FLAGWE" I L 3150 2575 50 
F5 "~READ-ALU-ADD" I L 3150 2075 50 
F6 "FLIN-SRU" I L 3150 2425 50 
F7 "FLIN-ADD" I L 3150 2175 50 
F8 "IBUS12" I L 3150 2675 50 
F9 "BCP" I L 3150 2325 50 
F10 "~RESET" I L 3150 1675 50 
F11 "FLFAST" O R 4300 2325 50 
F12 "WSTB" I L 3150 1925 50 
F13 "ACTION[0..3]" I L 3150 2825 50 
F14 "~ACTION-SRU" O R 4300 2425 50 
$EndSheet
$Comp
L alexios:CFT-2019-Bus P1
U 1 1 5D3829BF
P 14100 1700
F 0 "P1" H 14100 1867 50  0000 C CNN
F 1 "CFT-2019-Bus" H 14100 1776 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 14050 800 50  0001 C CNN
F 3 "" H 14050 800 50  0001 C CNN
	1    14100 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P1
U 2 1 5D382B6D
P 15550 1700
F 0 "P1" H 15550 1867 50  0000 C CNN
F 1 "CFT-2019-Bus" H 15550 1776 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 15500 800 50  0001 C CNN
F 3 "" H 15500 800 50  0001 C CNN
	2    15550 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P1
U 3 1 5D388A11
P 18500 2750
F 0 "P1" H 18500 2917 50  0000 C CNN
F 1 "CFT-2019-Bus" H 18500 2826 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 18450 1850 50  0001 C CNN
F 3 "" H 18450 1850 50  0001 C CNN
	3    18500 2750
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P1
U 4 1 5D388A98
P 18450 1650
F 0 "P1" H 18450 1817 50  0000 C CNN
F 1 "CFT-2019-Bus" H 18450 1726 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 18400 750 50  0001 C CNN
F 3 "" H 18400 750 50  0001 C CNN
	4    18450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13500 1850 13100 1850
Wire Wire Line
	13500 2050 13100 2050
Wire Wire Line
	13500 2150 13100 2150
Wire Wire Line
	13500 2250 13100 2250
Wire Wire Line
	13500 2350 13100 2350
Wire Wire Line
	13500 2450 13100 2450
Wire Wire Line
	13500 2550 13100 2550
Wire Wire Line
	13500 2650 13100 2650
Wire Wire Line
	13500 2750 13100 2750
Wire Wire Line
	13500 2850 13100 2850
Wire Wire Line
	13500 2950 13100 2950
Wire Wire Line
	13500 3050 13100 3050
Wire Wire Line
	13500 3150 13100 3150
Wire Wire Line
	13500 3250 13100 3250
Wire Wire Line
	13500 3350 13100 3350
Wire Wire Line
	13500 3450 13100 3450
Wire Wire Line
	13500 3550 13100 3550
Wire Wire Line
	13500 3650 13100 3650
Wire Wire Line
	13500 3750 13100 3750
Wire Wire Line
	13500 3850 13100 3850
Wire Wire Line
	13500 3950 13100 3950
Wire Wire Line
	13500 4050 13100 4050
Wire Wire Line
	13500 4150 13100 4150
Wire Wire Line
	13500 4250 13100 4250
Wire Wire Line
	13500 4350 13100 4350
Wire Wire Line
	13500 4450 13100 4450
Wire Wire Line
	13500 4550 13100 4550
Wire Wire Line
	13500 4650 13100 4650
Wire Wire Line
	13500 4750 13100 4750
Wire Wire Line
	13500 4850 13100 4850
Wire Wire Line
	13500 4950 13100 4950
Wire Wire Line
	13500 5050 13100 5050
Wire Wire Line
	13500 5150 13100 5150
Text Label 13100 1850 0    50   ~ 0
~RESET
Text Label 13100 2050 0    50   ~ 0
CLK1
Text Label 13100 2150 0    50   ~ 0
CLK2
Text Label 13100 2250 0    50   ~ 0
CLK3
Text Label 13100 2350 0    50   ~ 0
CLK4
Text Label 13100 2450 0    50   ~ 0
WSTB
Text Label 13100 2550 0    50   ~ 0
T34
Wire Wire Line
	18000 3600 17350 3600
Text Label 17350 3600 0    50   ~ 0
FPFETCH∕~EXEC
Text Notes 3900 4525 0    70   ~ 14
Verilog
Text Notes 3900 3125 0    70   ~ 14
Verilog
Text Notes 1425 1100 0    118  ~ 24
ALU
$EndSCHEMATC
