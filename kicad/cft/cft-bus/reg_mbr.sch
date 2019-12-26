EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 14
Title "Memory Bank Register File"
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	-12450 4300 -12450 4500
$Comp
L power:GND #PWR?
U 1 1 5DC014EE
P -8650 6400
AR Path="/5DC014EE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DC014EE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DC014EE" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H -8650 6150 50  0001 C CNN
F 1 "GND" H -8645 6227 50  0000 C CNN
F 2 "" H -8650 6400 50  0001 C CNN
F 3 "" H -8650 6400 50  0001 C CNN
	1    -8650 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DC014E8
P -8650 6200
AR Path="/5DC014E8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DC014E8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DC014E8" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H -8650 6050 50  0001 C CNN
F 1 "+5V" H -8635 6373 50  0000 C CNN
F 2 "" H -8650 6200 50  0001 C CNN
F 3 "" H -8650 6200 50  0001 C CNN
	1    -8650 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DC014E2
P -8650 6300
AR Path="/5CC0D65F/5DC014E2" Ref="C?"  Part="1" 
AR Path="/5DC014E2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DC014E2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DC014E2" Ref="C21"  Part="1" 
F 0 "C21" H -8741 6346 50  0000 R CNN
F 1 "100nF" H -8741 6255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H -8650 6300 50  0001 C CNN
F 3 "~" H -8650 6300 50  0001 C CNN
	1    -8650 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DBF066E
P -8650 7100
AR Path="/5DBF066E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBF066E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBF066E" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H -8650 6850 50  0001 C CNN
F 1 "GND" H -8645 6927 50  0000 C CNN
F 2 "" H -8650 7100 50  0001 C CNN
F 3 "" H -8650 7100 50  0001 C CNN
	1    -8650 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DBF0668
P -8650 6900
AR Path="/5DBF0668" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBF0668" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBF0668" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H -8650 6750 50  0001 C CNN
F 1 "+5V" H -8635 7073 50  0000 C CNN
F 2 "" H -8650 6900 50  0001 C CNN
F 3 "" H -8650 6900 50  0001 C CNN
	1    -8650 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DBF0662
P -8650 7000
AR Path="/5CC0D65F/5DBF0662" Ref="C?"  Part="1" 
AR Path="/5DBF0662" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DBF0662" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DBF0662" Ref="C25"  Part="1" 
F 0 "C25" H -8741 7046 50  0000 R CNN
F 1 "100nF" H -8741 6955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H -8650 7000 50  0001 C CNN
F 3 "~" H -8650 7000 50  0001 C CNN
	1    -8650 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB9AD5C
P -4400 12950
AR Path="/5DB9AD5C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB9AD5C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB9AD5C" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H -4400 12700 50  0001 C CNN
F 1 "GND" H -4395 12777 50  0000 C CNN
F 2 "" H -4400 12950 50  0001 C CNN
F 3 "" H -4400 12950 50  0001 C CNN
	1    -4400 12950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB9AD56
P -4400 12750
AR Path="/5DB9AD56" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB9AD56" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB9AD56" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H -4400 12600 50  0001 C CNN
F 1 "+5V" H -4385 12923 50  0000 C CNN
F 2 "" H -4400 12750 50  0001 C CNN
F 3 "" H -4400 12750 50  0001 C CNN
	1    -4400 12750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB9AD50
P -4400 12850
AR Path="/5CC0D65F/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB9AD50" Ref="C19"  Part="1" 
F 0 "C19" H -4491 12896 50  0000 R CNN
F 1 "100nF" H -4491 12805 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H -4400 12850 50  0001 C CNN
F 3 "~" H -4400 12850 50  0001 C CNN
	1    -4400 12850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB680A4
P -10000 7100
AR Path="/5DB680A4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB680A4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB680A4" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H -10000 6850 50  0001 C CNN
F 1 "GND" H -9995 6927 50  0000 C CNN
F 2 "" H -10000 7100 50  0001 C CNN
F 3 "" H -10000 7100 50  0001 C CNN
	1    -10000 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB6809E
P -10000 6900
AR Path="/5DB6809E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB6809E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB6809E" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H -10000 6750 50  0001 C CNN
F 1 "+5V" H -9985 7073 50  0000 C CNN
F 2 "" H -10000 6900 50  0001 C CNN
F 3 "" H -10000 6900 50  0001 C CNN
	1    -10000 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB68098
P -10000 7000
AR Path="/5CC0D65F/5DB68098" Ref="C?"  Part="1" 
AR Path="/5DB68098" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB68098" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB68098" Ref="C24"  Part="1" 
F 0 "C24" H -10091 7046 50  0000 R CNN
F 1 "100nF" H -10091 6955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H -10000 7000 50  0001 C CNN
F 3 "~" H -10000 7000 50  0001 C CNN
	1    -10000 7000
	1    0    0    -1  
$EndComp
Connection ~ -8650 6200
Connection ~ -8650 6400
$Comp
L alexios:74AHC1G125 U36
U 2 1 5DAF889C
P -8300 6300
F 0 "U36" H -8120 6346 50  0000 L CNN
F 1 "74AHC1G125" H -8120 6255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -8125 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -8125 6550 50  0001 C CNN
	2    -8300 6300
	1    0    0    -1  
$EndComp
Connection ~ -8650 6900
Connection ~ -8650 7100
$Comp
L alexios:74LVC1G74 U40
U 2 1 5DAF7668
P -8300 7000
F 0 "U40" H -8120 7046 50  0000 L CNN
F 1 "74LVC1G74" H -8120 6955 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H -7850 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H -7850 7000 50  0001 C CNN
	2    -8300 7000
	1    0    0    -1  
$EndComp
Connection ~ -4400 12750
Connection ~ -4400 12950
$Comp
L alexios:74HC541 U30
U 2 1 5DAEC681
P -4050 12850
F 0 "U30" H -3870 12896 50  0000 L CNN
F 1 "74HC541" H -3870 12805 50  0000 L CNN
F 2 "alexios:SOIC-20W" H -4050 12850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H -4050 12850 50  0001 C CNN
	2    -4050 12850
	1    0    0    -1  
$EndComp
Connection ~ -10000 7100
Connection ~ -10000 6900
$Comp
L alexios:74HC139 U39
U 3 1 5DAE9571
P -9650 7000
F 0 "U39" H -9470 7046 50  0000 L CNN
F 1 "74HC139" H -9470 6955 50  0000 L CNN
F 2 "alexios:SOIC-16" H -9650 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -9650 7000 50  0001 C CNN
	3    -9650 7000
	1    0    0    -1  
$EndComp
Text Notes -11350 4200 0    50   ~ 0
High after ~RESET~\nasserted.
Text Notes -11350 4650 0    50   ~ 0
High after ~BANKW0~\nasserted.
Text Notes -14200 6550 1    50   ~ 0
After ~RESET~ and before ~BANKW0~ is asserted, drive AEXT₀₋₇ with &00 (~RAM~/ROM position set to ~RAM~)\nor &80 (set to ROM). Use pull-down resistors for most of the vector. After the first write to an MBR register,\nthis stops and random values can be expected to be present! So the minimum required registers should be\ninitialised as early as possible after reset.
$Comp
L power:GND #PWR058
U 1 1 5DA49867
P -3150 13900
F 0 "#PWR058" H -3150 13650 50  0001 C CNN
F 1 "GND" H -3000 13850 50  0000 C CNN
F 2 "" H -3150 13900 50  0001 C CNN
F 3 "" H -3150 13900 50  0001 C CNN
	1    -3150 13900
	-1   0    0    -1  
$EndComp
Entry Wire Line
	-3700 14050 -3600 14150
Entry Wire Line
	-3800 14050 -3700 14150
Entry Wire Line
	-3900 14050 -3800 14150
Entry Wire Line
	-4000 14050 -3900 14150
Entry Wire Line
	-4100 14050 -4000 14150
Entry Wire Line
	-4200 14050 -4100 14150
Entry Wire Line
	-4300 14050 -4200 14150
Entry Wire Line
	-4400 14050 -4300 14150
Wire Wire Line
	-3700 13800 -3700 14050
Wire Wire Line
	-3800 13800 -3800 14050
Wire Wire Line
	-3900 13800 -3900 14050
Wire Wire Line
	-4000 13800 -4000 14050
Text Label -4400 14050 1    50   ~ 0
AEXT0
Text Label -3700 14050 1    50   ~ 0
AEXT7
Text Label -3800 14050 1    50   ~ 0
AEXT6
Text Label -3900 14050 1    50   ~ 0
AEXT5
Text Label -4000 14050 1    50   ~ 0
AEXT4
Text Label -4100 14050 1    50   ~ 0
AEXT3
Text Label -4200 14050 1    50   ~ 0
AEXT2
Text Label -4300 14050 1    50   ~ 0
AEXT1
Wire Wire Line
	-4100 13800 -4100 14050
Wire Wire Line
	-4200 13800 -4200 14050
Wire Wire Line
	-4300 13800 -4300 14050
Wire Wire Line
	-4400 13800 -4400 14050
Text Label -12850 3750 3    50   ~ 0
~BANKW0
Wire Wire Line
	-12850 4700 -12400 4700
Wire Wire Line
	-12850 3150 -12850 4700
Wire Wire Line
	-11350 3150 -12850 3150
Wire Wire Line
	-11350 2750 -10950 2750
Wire Wire Line
	-11400 2750 -11350 2750
Connection ~ -11350 2750
Wire Wire Line
	-11350 2750 -11350 3150
Text Label -10550 5250 0    50   ~ 0
AEXT7
Wire Wire Line
	-11400 4050 -11400 4400
Wire Wire Line
	-12450 4050 -11400 4050
Wire Wire Line
	-12450 3800 -12400 3800
Wire Wire Line
	-12450 4050 -12450 3800
Text Label -12500 4400 2    50   ~ 0
~RESET
Wire Wire Line
	-13000 4400 -12400 4400
Text HLabel -13000 4400 0    50   Input ~ 0
~RESET
Wire Wire Line
	-10850 4700 -10850 5050
Wire Wire Line
	-11500 4700 -10850 4700
$Comp
L alexios:74LVC1G74 U35
U 1 1 5D1C9022
P -11950 4550
F 0 "U35" H -11950 4967 50  0000 C CNN
F 1 "74LVC1G74" H -11950 4876 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H -11500 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H -11500 4550 50  0001 C CNN
	1    -11950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-12400 4500 -12450 4500
Wire Wire Line
	-12450 4600 -12400 4600
Connection ~ -12450 4500
Wire Wire Line
	-12450 4500 -12450 4600
$Comp
L power:+5V #PWR056
U 1 1 5D1C2F41
P -12450 4300
F 0 "#PWR056" H -12450 4150 50  0001 C CNN
F 1 "+5V" H -12435 4473 50  0000 C CNN
F 2 "" H -12450 4300 50  0001 C CNN
F 3 "" H -12450 4300 50  0001 C CNN
	1    -12450 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04 RN2
U 1 1 5D5C7149
P -3800 13600
F 0 "RN2" H -3612 13554 50  0000 L CNN
F 1 "4.7kΩ" H -3612 13645 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V -3525 13600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H -3800 13600 50  0001 C CNN
	1    -3800 13600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04 RN1
U 1 1 5D532D59
P -4200 13600
F 0 "RN1" H -4479 13554 50  0000 R CNN
F 1 "4.7kΩ" H -4479 13645 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP5" V -3925 13600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H -4200 13600 50  0001 C CNN
	1    -4200 13600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G125 U14
U 1 1 5D51C57C
P -10900 5250
F 0 "U14" H -10800 5500 50  0000 L CNN
F 1 "74AHC1G125" H -10800 5400 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H -10725 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H -10725 5500 50  0001 C CNN
	1    -10900 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 61FE7EBF
P -12400 3500
F 0 "#PWR055" H -12400 3350 50  0001 C CNN
F 1 "+5V" H -12385 3673 50  0000 C CNN
F 2 "" H -12400 3500 50  0001 C CNN
F 3 "" H -12400 3500 50  0001 C CNN
	1    -12400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-11500 4400 -11400 4400
Wire Wire Line
	-13000 5250 -12850 5250
Text Label -11700 5250 2    50   ~ 0
~FPRAM~∕ROM
Text Label -12500 4700 2    50   ~ 0
~BANKW0
Text HLabel -13000 5250 0    50   Input ~ 0
~FPRAM~∕ROM
Text Label 5800 850  0    50   ~ 0
IBUS[0..7]
Wire Wire Line
	-10950 2250 -12800 2250
NoConn ~ -11400 3700
NoConn ~ -11400 3500
NoConn ~ -11400 2850
NoConn ~ -11400 2650
Wire Wire Line
	-12800 2250 -12800 2950
Wire Wire Line
	-12800 2950 -12400 2950
Text HLabel 5650 850  0    50   3State ~ 0
IBUS[0..7]
Wire Bus Line
	6300 850  5650 850 
Text HLabel 1100 1400 0    50   Input ~ 0
IR[0..11]
Text HLabel 1100 1250 0    50   Input ~ 0
WADDR[0..4]
Text Label 6400 2850 1    50   ~ 0
IBUS[0..7]
Entry Bus Bus
	6500 850  6400 950 
Entry Bus Bus
	6300 850  6400 950 
Entry Bus Bus
	-4850 14200 -4950 14100
Text Label -12650 2950 0    50   ~ 0
~WMBR
Text Label -12650 3600 0    50   ~ 0
SEL2
Wire Wire Line
	-12400 3600 -12650 3600
Text Label -12650 2750 0    50   ~ 0
IR2
Wire Wire Line
	-12400 2750 -12650 2750
$Comp
L alexios:74HC139 U31
U 1 1 61FE7ED6
P -11900 2750
F 0 "U31" H -11900 3117 50  0000 C CNN
F 1 "74HC139" H -11900 3026 50  0000 C CNN
F 2 "alexios:SOIC-16" H -11900 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -11900 2750 50  0001 C CNN
	1    -11900 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR052
U 1 1 61FE7ED0
P -12400 2650
F 0 "#PWR052" H -12400 2500 50  0001 C CNN
F 1 "+5V" H -12385 2823 50  0000 C CNN
F 2 "" H -12400 2650 50  0001 C CNN
F 3 "" H -12400 2650 50  0001 C CNN
	1    -12400 2650
	1    0    0    -1  
$EndComp
Text Label -10950 2750 2    50   ~ 0
~BANKW0
Text Label -10950 2950 2    50   ~ 0
~BANKW1
$Comp
L alexios:74HC139 U31
U 2 1 61FE7EC7
P -11900 3600
F 0 "U31" H -11900 3967 50  0000 C CNN
F 1 "74HC139" H -11900 3876 50  0000 C CNN
F 2 "alexios:SOIC-16" H -11900 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H -11900 3600 50  0001 C CNN
	2    -11900 3600
	1    0    0    -1  
$EndComp
Text Label -10950 3600 2    50   ~ 0
~BANKR0
Text Label -10950 3800 2    50   ~ 0
~BANKR1
Wire Wire Line
	-11400 3800 -10950 3800
Wire Wire Line
	-11400 3600 -10950 3600
Wire Wire Line
	-11400 2950 -10950 2950
Text HLabel 1100 1100 0    50   Input ~ 0
RADDR[0..4]
$Sheet
S 1500 950  1150 650 
U 63C9F04D
F0 "Decoder" 50
F1 "reg_mbr_decoder.sch" 50
F2 "~RMBR" O R 2650 1400 50 
F3 "~WMBR" O R 2650 1250 50 
F4 "RADDR[0..4]" I L 1500 1100 50 
F5 "WADDR[0..4]" I L 1500 1250 50 
F6 "SEL[0..2]" O R 2650 1100 50 
F7 "IR[0..11]" I L 1500 1400 50 
$EndSheet
Wire Bus Line
	1100 1100 1500 1100
Wire Bus Line
	1100 1250 1500 1250
Wire Bus Line
	1500 1400 1100 1400
Wire Bus Line
	2650 1100 3050 1100
Text Label 3050 1100 2    50   ~ 0
SEL[0..2]
Wire Wire Line
	2650 1400 3050 1400
Text Label 3050 1250 2    50   ~ 0
~WMBR
Text Label 3050 1400 2    50   ~ 0
~RMBR
Text Notes 1100 750  0    100  ~ 20
Register Address Decoding
Wire Wire Line
	2650 1250 3150 1250
Text Notes 1000 9800 0    50   ~ 0
MBn registers are accessed when:\n\n1. Write access when WADDR=00001 is selected (~WRITE-MBP+FLAGS~).\n2. Write access when WADDR=00011 is selected (~WRITE-MBn~).\n3. Read access when RADDR=00001 is selected (~READ-MBP+FLAGS~).\n4. Read access when RADDR=00011 is selected (~READ-MBn~).\n5. Read access when WADDR=001xx (~WRITE-AR:MBn~). Note, even though\nwe respond on WADDR, this is a READ operation.\n\nThe register to use is usually identified by IR₀₋₂, except in cases 1 and 3\n(which always use MB0 aka MBP), and case 5 where one of the first four\nregisters is selected by WADDR₀₋₁ unless WADDR=00111 (~WRITE-AR:MBZ~)\nand IR₁₁₋₈=1111 (I=1, R=1, Operand 3XX₁₆).
$Comp
L Device:R_Small R?
U 1 1 5D8BACBF
P -12850 5050
AR Path="/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/61F95ACC/5D8BACBF" Ref="R3"  Part="1" 
F 0 "R3" H -12791 5096 50  0000 L CNN
F 1 "4.7kΩ" H -12791 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H -12850 5050 50  0001 C CNN
F 3 "~" H -12850 5050 50  0001 C CNN
	1    -12850 5050
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 5D8E1171
P -12850 4950
F 0 "#PWR059" H -12850 4800 50  0001 C CNN
F 1 "+5V" H -13000 5050 50  0000 C CNN
F 2 "" H -12850 4950 50  0001 C CNN
F 3 "" H -12850 4950 50  0001 C CNN
	1    -12850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	-12850 5150 -12850 5250
Connection ~ -12850 5250
Wire Wire Line
	-12850 5250 -11100 5250
Text Notes -4550 12300 0    50   ~ 0
IBUS[8..15] are purposefully not driven here!\nThey are handled by the flag unit.
Text Notes -4550 12100 0    50   ~ 10
Note
Text Label 7800 1450 0    50   ~ 0
AEXT3
Text Label 7800 1350 0    50   ~ 0
AEXT2
Text Label 7800 1250 0    50   ~ 0
AEXT1
Text Label 7800 1150 0    50   ~ 0
AEXT0
Wire Wire Line
	7650 1450 8100 1450
Wire Wire Line
	7650 1350 8100 1350
Wire Wire Line
	7650 1250 8100 1250
Wire Wire Line
	7650 1150 8100 1150
Text Label 7800 1550 0    50   ~ 0
AEXT4
Text Label 7800 1650 0    50   ~ 0
AEXT5
Text Label 7800 1750 0    50   ~ 0
AEXT6
Text Label 7800 1850 0    50   ~ 0
AEXT7
Wire Wire Line
	7650 1550 8100 1550
Wire Wire Line
	7650 1850 8100 1850
Wire Wire Line
	7650 1750 8100 1750
Wire Wire Line
	7650 1650 8100 1650
Wire Wire Line
	6950 1450 6500 1450
Wire Wire Line
	6950 1350 6500 1350
Wire Wire Line
	6950 1250 6500 1250
Wire Wire Line
	6950 1150 6500 1150
Entry Wire Line
	6500 1550 6400 1450
Entry Wire Line
	6500 1650 6400 1550
Entry Wire Line
	6500 1750 6400 1650
Entry Wire Line
	6500 1850 6400 1750
Entry Wire Line
	6500 1150 6400 1050
Entry Wire Line
	6500 1250 6400 1150
Entry Wire Line
	6500 1350 6400 1250
Entry Wire Line
	6500 1450 6400 1350
Wire Wire Line
	6950 1550 6500 1550
Wire Wire Line
	6950 1850 6500 1850
Wire Wire Line
	6950 1750 6500 1750
Wire Wire Line
	6950 1650 6500 1650
Text Label 6600 1150 0    50   ~ 0
IBUS0
Text Label 6600 1250 0    50   ~ 0
IBUS1
Text Label 6600 1350 0    50   ~ 0
IBUS2
Text Label 6600 1450 0    50   ~ 0
IBUS3
Text Label 6600 1550 0    50   ~ 0
IBUS4
Text Label 6600 1650 0    50   ~ 0
IBUS5
Text Label 6600 1750 0    50   ~ 0
IBUS6
Text Label 6600 1850 0    50   ~ 0
IBUS7
Wire Wire Line
	6950 2050 6500 2050
Wire Wire Line
	6950 2250 6500 2250
Wire Wire Line
	6950 2350 6500 2350
Text Label 6500 2250 0    50   ~ 0
SEL0
Text Label 6500 2350 0    50   ~ 0
SEL1
Text Label 6500 2050 0    50   ~ 0
~BANKW0
Entry Wire Line
	8200 1650 8100 1550
Entry Wire Line
	8200 1750 8100 1650
Entry Wire Line
	8200 1850 8100 1750
Entry Wire Line
	8200 1950 8100 1850
Entry Wire Line
	8200 1250 8100 1150
Entry Wire Line
	8200 1350 8100 1250
Entry Wire Line
	8200 1450 8100 1350
Entry Wire Line
	8200 1550 8100 1450
Wire Wire Line
	7650 2050 8100 2050
Wire Wire Line
	7650 2250 8100 2250
Wire Wire Line
	7650 2350 8100 2350
Text Label 8100 2050 2    50   ~ 0
~BANKR0
Text Label 8100 2250 2    50   ~ 0
IR0
Text Label 8100 2350 2    50   ~ 0
IR1
$Comp
L alexios:74AC161 U?
U 1 1 5DF5E120
P 13950 50
F 0 "U?" H 13950 817 50  0000 C CNN
F 1 "74AC161" H 13950 726 50  0000 C CNN
F 2 "" H 14250 300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 14250 300 50  0001 C CNN
	1    13950 50  
	1    0    0    -1  
$EndComp
Wire Wire Line
	14450 -450 14900 -450
Wire Wire Line
	14450 -350 14900 -350
Text Label 14900 -450 2    50   ~ 0
FPR0
Text Label 14900 -350 2    50   ~ 0
FPR1
Text Label 14900 -250 2    50   ~ 0
FPR2
NoConn ~ 14450 -150
NoConn ~ 14450 50  
Wire Wire Line
	13450 150  13350 150 
$Comp
L power:+5V #PWR?
U 1 1 5DFAEFFD
P 13350 -550
F 0 "#PWR?" H 13350 -700 50  0001 C CNN
F 1 "+5V" H 13365 -377 50  0000 C CNN
F 2 "" H 13350 -550 50  0001 C CNN
F 3 "" H 13350 -550 50  0001 C CNN
	1    13350 -550
	1    0    0    -1  
$EndComp
Wire Wire Line
	13450 250  13350 250 
Wire Wire Line
	13450 350  12950 350 
Text Label 12950 350  0    50   ~ 0
~FPMBREN
Wire Wire Line
	13450 550  12950 550 
Text Label 12950 550  0    50   ~ 0
~FPMBRR
Wire Wire Line
	13350 250  13350 150 
Connection ~ 13350 150 
Wire Wire Line
	13350 150  13350 50  
Wire Wire Line
	13450 -450 13350 -450
Connection ~ 13350 -450
Wire Wire Line
	13350 -450 13350 -550
Wire Wire Line
	13450 -350 13350 -350
Connection ~ 13350 -350
Wire Wire Line
	13350 -350 13350 -450
Wire Wire Line
	13450 -250 13350 -250
Connection ~ 13350 -250
Wire Wire Line
	13350 -250 13350 -350
Wire Wire Line
	13450 -150 13350 -150
Connection ~ 13350 -150
Wire Wire Line
	13350 -150 13350 -250
Wire Wire Line
	13450 50   13350 50  
Connection ~ 13350 50  
Wire Wire Line
	13350 50   13350 -150
$Sheet
S 6950 1000 700  1500
U 5DF70AAD
F0 "MBR File (half)" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 6950 2250 50 
F3 "WA1" I L 6950 2350 50 
F4 "RA0" I R 7650 2250 50 
F5 "RA1" I R 7650 2350 50 
F6 "~RE" I R 7650 2050 50 
F7 "~WE" I L 6950 2050 50 
F8 "IN0" I L 6950 1150 50 
F9 "IN1" I L 6950 1250 50 
F10 "IN2" I L 6950 1350 50 
F11 "IN3" I L 6950 1450 50 
F12 "IN4" I L 6950 1550 50 
F13 "IN5" I L 6950 1650 50 
F14 "IN6" I L 6950 1750 50 
F15 "IN7" I L 6950 1850 50 
F16 "OUT0" O R 7650 1150 50 
F17 "OUT1" O R 7650 1250 50 
F18 "OUT2" O R 7650 1350 50 
F19 "OUT3" O R 7650 1450 50 
F20 "OUT4" O R 7650 1550 50 
F21 "OUT5" O R 7650 1650 50 
F22 "OUT6" O R 7650 1750 50 
F23 "OUT7" O R 7650 1850 50 
$EndSheet
$Sheet
S 8850 1000 700  1500
U 5DF72441
F0 "sheet5DF72429" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 8850 2250 50 
F3 "WA1" I L 8850 2350 50 
F4 "RA0" I R 9550 2250 50 
F5 "RA1" I R 9550 2350 50 
F6 "~RE" I R 9550 2050 50 
F7 "~WE" I L 8850 2050 50 
F8 "IN0" I L 8850 1150 50 
F9 "IN1" I L 8850 1250 50 
F10 "IN2" I L 8850 1350 50 
F11 "IN3" I L 8850 1450 50 
F12 "IN4" I L 8850 1550 50 
F13 "IN5" I L 8850 1650 50 
F14 "IN6" I L 8850 1750 50 
F15 "IN7" I L 8850 1850 50 
F16 "OUT0" O R 9550 1150 50 
F17 "OUT1" O R 9550 1250 50 
F18 "OUT2" O R 9550 1350 50 
F19 "OUT3" O R 9550 1450 50 
F20 "OUT4" O R 9550 1550 50 
F21 "OUT5" O R 9550 1650 50 
F22 "OUT6" O R 9550 1750 50 
F23 "OUT7" O R 9550 1850 50 
$EndSheet
$Sheet
S 6950 2750 700  1500
U 5DF7BF78
F0 "sheet5DF7BF60" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 6950 4000 50 
F3 "WA1" I L 6950 4100 50 
F4 "RA0" I R 7650 4000 50 
F5 "RA1" I R 7650 4100 50 
F6 "~RE" I R 7650 3800 50 
F7 "~WE" I L 6950 3800 50 
F8 "IN0" I L 6950 2900 50 
F9 "IN1" I L 6950 3000 50 
F10 "IN2" I L 6950 3100 50 
F11 "IN3" I L 6950 3200 50 
F12 "IN4" I L 6950 3300 50 
F13 "IN5" I L 6950 3400 50 
F14 "IN6" I L 6950 3500 50 
F15 "IN7" I L 6950 3600 50 
F16 "OUT0" O R 7650 2900 50 
F17 "OUT1" O R 7650 3000 50 
F18 "OUT2" O R 7650 3100 50 
F19 "OUT3" O R 7650 3200 50 
F20 "OUT4" O R 7650 3300 50 
F21 "OUT5" O R 7650 3400 50 
F22 "OUT6" O R 7650 3500 50 
F23 "OUT7" O R 7650 3600 50 
$EndSheet
$Sheet
S 8850 2750 700  1500
U 5DF852BC
F0 "sheet5DF852A4" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 8850 4000 50 
F3 "WA1" I L 8850 4100 50 
F4 "RA0" I R 9550 4000 50 
F5 "RA1" I R 9550 4100 50 
F6 "~RE" I R 9550 3800 50 
F7 "~WE" I L 8850 3800 50 
F8 "IN0" I L 8850 2900 50 
F9 "IN1" I L 8850 3000 50 
F10 "IN2" I L 8850 3100 50 
F11 "IN3" I L 8850 3200 50 
F12 "IN4" I L 8850 3300 50 
F13 "IN5" I L 8850 3400 50 
F14 "IN6" I L 8850 3500 50 
F15 "IN7" I L 8850 3600 50 
F16 "OUT0" O R 9550 2900 50 
F17 "OUT1" O R 9550 3000 50 
F18 "OUT2" O R 9550 3100 50 
F19 "OUT3" O R 9550 3200 50 
F20 "OUT4" O R 9550 3300 50 
F21 "OUT5" O R 9550 3400 50 
F22 "OUT6" O R 9550 3500 50 
F23 "OUT7" O R 9550 3600 50 
$EndSheet
Wire Wire Line
	6950 3200 6500 3200
Wire Wire Line
	6950 3100 6500 3100
Wire Wire Line
	6950 3000 6500 3000
Wire Wire Line
	6950 2900 6500 2900
Entry Wire Line
	6500 3300 6400 3200
Entry Wire Line
	6500 3400 6400 3300
Entry Wire Line
	6500 3500 6400 3400
Entry Wire Line
	6500 3600 6400 3500
Entry Wire Line
	6500 2900 6400 2800
Entry Wire Line
	6500 3000 6400 2900
Entry Wire Line
	6500 3100 6400 3000
Entry Wire Line
	6500 3200 6400 3100
Wire Wire Line
	6950 3300 6500 3300
Wire Wire Line
	6950 3600 6500 3600
Wire Wire Line
	6950 3500 6500 3500
Wire Wire Line
	6950 3400 6500 3400
Text Label 6600 2900 0    50   ~ 0
IBUS0
Text Label 6600 3000 0    50   ~ 0
IBUS1
Text Label 6600 3100 0    50   ~ 0
IBUS2
Text Label 6600 3200 0    50   ~ 0
IBUS3
Text Label 6600 3300 0    50   ~ 0
IBUS4
Text Label 6600 3400 0    50   ~ 0
IBUS5
Text Label 6600 3500 0    50   ~ 0
IBUS6
Text Label 6600 3600 0    50   ~ 0
IBUS7
Wire Wire Line
	6950 3800 6550 3800
Wire Wire Line
	6950 4000 6550 4000
Wire Wire Line
	6950 4100 6550 4100
Text Label 6550 4000 0    50   ~ 0
SEL0
Text Label 6550 4100 0    50   ~ 0
SEL1
Text Label 6550 3800 0    50   ~ 0
~BANKW1
Text Label 7800 3200 0    50   ~ 0
AEXT3
Text Label 7800 3100 0    50   ~ 0
AEXT2
Text Label 7800 3000 0    50   ~ 0
AEXT1
Text Label 7800 2900 0    50   ~ 0
AEXT0
Wire Wire Line
	7650 3200 8100 3200
Wire Wire Line
	7650 3100 8100 3100
Wire Wire Line
	7650 3000 8100 3000
Wire Wire Line
	7650 2900 8100 2900
Text Label 7800 3300 0    50   ~ 0
AEXT4
Text Label 7800 3400 0    50   ~ 0
AEXT5
Text Label 7800 3500 0    50   ~ 0
AEXT6
Text Label 7800 3600 0    50   ~ 0
AEXT7
Wire Wire Line
	7650 3300 8100 3300
Wire Wire Line
	7650 3500 8100 3500
Wire Wire Line
	7650 3400 8100 3400
Entry Wire Line
	8200 3400 8100 3300
Entry Wire Line
	8200 3500 8100 3400
Entry Wire Line
	8200 3600 8100 3500
Entry Wire Line
	8200 3700 8100 3600
Entry Wire Line
	8200 3000 8100 2900
Entry Wire Line
	8200 3100 8100 3000
Entry Wire Line
	8200 3200 8100 3100
Entry Wire Line
	8200 3300 8100 3200
Wire Wire Line
	7650 3800 8050 3800
Wire Wire Line
	7650 4000 8050 4000
Wire Wire Line
	7650 4100 8050 4100
Text Label 8050 3800 2    50   ~ 0
~BANKR1
Text Label 8050 4000 2    50   ~ 0
IR0
Text Label 8050 4100 2    50   ~ 0
IR1
Wire Wire Line
	8850 1450 8400 1450
Wire Wire Line
	8850 1350 8400 1350
Wire Wire Line
	8850 1250 8400 1250
Wire Wire Line
	8850 1150 8400 1150
Entry Wire Line
	8400 1550 8300 1450
Entry Wire Line
	8400 1650 8300 1550
Entry Wire Line
	8400 1750 8300 1650
Entry Wire Line
	8400 1850 8300 1750
Entry Wire Line
	8400 1150 8300 1050
Entry Wire Line
	8400 1250 8300 1150
Entry Wire Line
	8400 1350 8300 1250
Entry Wire Line
	8400 1450 8300 1350
Wire Wire Line
	8850 1550 8400 1550
Wire Wire Line
	8850 1850 8400 1850
Wire Wire Line
	8850 1750 8400 1750
Wire Wire Line
	8850 1650 8400 1650
Text Label 8500 1150 0    50   ~ 0
IBUS0
Text Label 8500 1250 0    50   ~ 0
IBUS1
Text Label 8500 1350 0    50   ~ 0
IBUS2
Text Label 8500 1450 0    50   ~ 0
IBUS3
Text Label 8500 1550 0    50   ~ 0
IBUS4
Text Label 8500 1650 0    50   ~ 0
IBUS5
Text Label 8500 1750 0    50   ~ 0
IBUS6
Text Label 8500 1850 0    50   ~ 0
IBUS7
Wire Wire Line
	8850 2050 8400 2050
Wire Wire Line
	8850 2250 8400 2250
Wire Wire Line
	8850 2350 8400 2350
Text Label 8400 2250 0    50   ~ 0
SEL0
Text Label 8400 2350 0    50   ~ 0
SEL1
Text Label 8400 2050 0    50   ~ 0
~BANKW0
Wire Wire Line
	8850 3200 8400 3200
Wire Wire Line
	8850 3100 8400 3100
Wire Wire Line
	8850 3000 8400 3000
Wire Wire Line
	8850 2900 8400 2900
Entry Wire Line
	8400 3300 8300 3200
Entry Wire Line
	8400 3400 8300 3300
Entry Wire Line
	8400 3500 8300 3400
Entry Wire Line
	8400 3600 8300 3500
Entry Wire Line
	8400 2900 8300 2800
Entry Wire Line
	8400 3000 8300 2900
Entry Wire Line
	8400 3100 8300 3000
Entry Wire Line
	8400 3200 8300 3100
Wire Wire Line
	8850 3300 8400 3300
Wire Wire Line
	8850 3600 8400 3600
Wire Wire Line
	8850 3500 8400 3500
Wire Wire Line
	8850 3400 8400 3400
Text Label 8500 2900 0    50   ~ 0
IBUS0
Text Label 8500 3000 0    50   ~ 0
IBUS1
Text Label 8500 3100 0    50   ~ 0
IBUS2
Text Label 8500 3200 0    50   ~ 0
IBUS3
Text Label 8500 3300 0    50   ~ 0
IBUS4
Text Label 8500 3400 0    50   ~ 0
IBUS5
Text Label 8500 3500 0    50   ~ 0
IBUS6
Text Label 8500 3600 0    50   ~ 0
IBUS7
Wire Wire Line
	8850 3800 8450 3800
Wire Wire Line
	8850 4000 8450 4000
Wire Wire Line
	8850 4100 8450 4100
Text Label 8450 4000 0    50   ~ 0
SEL0
Text Label 8450 4100 0    50   ~ 0
SEL1
Text Label 8450 3800 0    50   ~ 0
~BANKW1
Wire Wire Line
	9550 2050 10000 2050
Wire Wire Line
	9550 2250 10000 2250
Wire Wire Line
	9550 2350 10000 2350
Text Label 10000 2250 2    50   ~ 0
FPR0
Text Label 10000 2350 2    50   ~ 0
FPR1
Text Label 10000 2050 2    50   ~ 0
~BANKFP0
Wire Wire Line
	9550 3800 9950 3800
Wire Wire Line
	9550 4000 9950 4000
Wire Wire Line
	9550 4100 9950 4100
Text Label 9950 4000 2    50   ~ 0
FPR0
Text Label 9950 4100 2    50   ~ 0
FPR1
Text Label 9950 3800 2    50   ~ 0
~BANKFP1
Wire Wire Line
	9550 3200 10000 3200
Wire Wire Line
	9550 3100 10000 3100
Wire Wire Line
	9550 3000 10000 3000
Wire Wire Line
	9550 2900 10000 2900
Wire Wire Line
	9550 3300 10000 3300
Wire Wire Line
	9550 3600 10000 3600
Wire Wire Line
	9550 3500 10000 3500
Wire Wire Line
	9550 3400 10000 3400
Entry Wire Line
	10100 3400 10000 3300
Entry Wire Line
	10100 3500 10000 3400
Entry Wire Line
	10100 3600 10000 3500
Entry Wire Line
	10100 3700 10000 3600
Entry Wire Line
	10100 3000 10000 2900
Entry Wire Line
	10100 3100 10000 3000
Entry Wire Line
	10100 3200 10000 3100
Entry Wire Line
	10100 3300 10000 3200
$Comp
L alexios:74HC139 U?
U 1 1 5E128A82
P 15900 -350
F 0 "U?" H 15900 17  50  0000 C CNN
F 1 "74HC139" H 15900 -74 50  0000 C CNN
F 2 "alexios:SOIC-16" H 15900 -350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 15900 -350 50  0001 C CNN
	1    15900 -350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 2 1 5E128A89
P 15900 500
F 0 "U?" H 15900 867 50  0000 C CNN
F 1 "74HC139" H 15900 776 50  0000 C CNN
F 2 "alexios:SOIC-16" H 15900 500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 15900 500 50  0001 C CNN
	2    15900 500 
	1    0    0    -1  
$EndComp
Wire Wire Line
	15400 700  15350 700 
Wire Wire Line
	15350 700  15350 500 
Wire Wire Line
	15400 400  15350 400 
Connection ~ 15350 400 
Wire Wire Line
	15350 400  15350 350 
Wire Wire Line
	15400 500  15350 500 
Connection ~ 15350 500 
Wire Wire Line
	15350 500  15350 400 
$Comp
L power:+5V #PWR?
U 1 1 5E174FED
P 15350 350
F 0 "#PWR?" H 15350 200 50  0001 C CNN
F 1 "+5V" H 15365 523 50  0000 C CNN
F 2 "" H 15350 350 50  0001 C CNN
F 3 "" H 15350 350 50  0001 C CNN
	1    15350 350 
	1    0    0    -1  
$EndComp
NoConn ~ 16400 400 
NoConn ~ 16400 500 
NoConn ~ 16400 600 
NoConn ~ 16400 700 
NoConn ~ 16400 -250
NoConn ~ 16400 -150
Wire Wire Line
	16400 -450 16850 -450
Text Label 16850 -450 2    50   ~ 0
~BANKFP0
Text Label 16850 -350 2    50   ~ 0
~BANKFP1
Wire Wire Line
	16400 -350 16850 -350
Wire Wire Line
	15250 -250 15250 -450
Wire Wire Line
	15250 -450 15400 -450
Wire Wire Line
	14450 -250 15250 -250
$Comp
L power:GND #PWR?
U 1 1 5E1DB966
P 15350 -100
F 0 "#PWR?" H 15350 -350 50  0001 C CNN
F 1 "GND" H 15355 -273 50  0000 C CNN
F 2 "" H 15350 -100 50  0001 C CNN
F 3 "" H 15350 -100 50  0001 C CNN
	1    15350 -100
	1    0    0    -1  
$EndComp
Wire Wire Line
	15350 -100 15350 -150
Wire Wire Line
	15350 -350 15400 -350
Wire Wire Line
	15400 -150 15350 -150
Connection ~ 15350 -150
Wire Wire Line
	15350 -150 15350 -350
Entry Bus Bus
	10050 5800 10150 5900
Text Label 10100 2700 1    50   ~ 0
FPD[0..7]
Wire Wire Line
	-10600 5250 -10300 5250
Wire Wire Line
	-4400 13400 -4400 13300
Wire Wire Line
	-4400 13300 -4000 13300
Wire Wire Line
	-3150 13300 -3150 13900
Wire Wire Line
	-4000 13400 -4000 13300
Connection ~ -4000 13300
Wire Wire Line
	-4000 13300 -3150 13300
$Comp
L alexios:74HC541 U?
U 1 1 5E550ECF
P 9200 5350
F 0 "U?" H 9200 4675 50  0000 C CNN
F 1 "74HC541" H 9200 4584 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 9200 5350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9200 5350 50  0001 C CNN
	1    9200 5350
	1    0    0    -1  
$EndComp
Wire Bus Line
	6500 850  8200 850 
Entry Bus Bus
	8200 850  8300 950 
Wire Wire Line
	7650 3600 8100 3600
$Comp
L power:GND #PWR050
U 1 1 60B7235A
P 7800 5850
F 0 "#PWR050" H 7800 5600 50  0001 C CNN
F 1 "GND" H 7805 5677 50  0000 C CNN
F 2 "" H 7800 5850 50  0001 C CNN
F 3 "" H 7800 5850 50  0001 C CNN
	1    7800 5850
	-1   0    0    -1  
$EndComp
Text Label 7800 4850 0    50   ~ 0
AEXT0
Text Label 7800 4950 0    50   ~ 0
AEXT1
Text Label 7800 5050 0    50   ~ 0
AEXT2
Text Label 7800 5150 0    50   ~ 0
AEXT3
Text Label 7800 5250 0    50   ~ 0
AEXT4
Text Label 7800 5350 0    50   ~ 0
AEXT5
Text Label 7800 5450 0    50   ~ 0
AEXT6
Text Label 7800 5550 0    50   ~ 0
AEXT7
$Comp
L alexios:74HC541 U30
U 1 1 61FE7F80
P 7300 5350
F 0 "U30" H 7300 4675 50  0000 C CNN
F 1 "74HC541" H 7300 4584 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7300 5350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7300 5350 50  0001 C CNN
	1    7300 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7800 5750 8000 5750
Text Label 8000 5750 2    50   ~ 0
~RMBR
Entry Wire Line
	6500 5550 6400 5450
Entry Wire Line
	6500 5450 6400 5350
Entry Wire Line
	6500 5350 6400 5250
Entry Wire Line
	6500 5250 6400 5150
Entry Wire Line
	6500 5150 6400 5050
Entry Wire Line
	6500 5050 6400 4950
Entry Wire Line
	6500 4950 6400 4850
Entry Wire Line
	6500 4850 6400 4750
Text Label 6600 4850 0    50   ~ 0
IBUS0
Text Label 6600 4950 0    50   ~ 0
IBUS1
Text Label 6600 5050 0    50   ~ 0
IBUS2
Text Label 6600 5150 0    50   ~ 0
IBUS3
Text Label 6600 5250 0    50   ~ 0
IBUS4
Text Label 6600 5350 0    50   ~ 0
IBUS5
Text Label 6600 5450 0    50   ~ 0
IBUS6
Text Label 6600 5550 0    50   ~ 0
IBUS7
Wire Wire Line
	6500 4850 6800 4850
Wire Wire Line
	6500 4950 6800 4950
Wire Wire Line
	6500 5050 6800 5050
Wire Wire Line
	6500 5150 6800 5150
Wire Wire Line
	6500 5250 6800 5250
Wire Wire Line
	6500 5350 6800 5350
Wire Wire Line
	6500 5450 6800 5450
Wire Wire Line
	6500 5550 6800 5550
Entry Wire Line
	10100 1550 10000 1450
Entry Wire Line
	10100 1450 10000 1350
Entry Wire Line
	10100 1350 10000 1250
Entry Wire Line
	10100 1250 10000 1150
Entry Wire Line
	10100 1950 10000 1850
Entry Wire Line
	10100 1850 10000 1750
Entry Wire Line
	10100 1750 10000 1650
Entry Wire Line
	10100 1650 10000 1550
Wire Wire Line
	9550 1650 10000 1650
Wire Wire Line
	9550 1750 10000 1750
Wire Wire Line
	9550 1850 10000 1850
Wire Wire Line
	9550 1550 10000 1550
Wire Wire Line
	9550 1150 10000 1150
Wire Wire Line
	9550 1250 10000 1250
Wire Wire Line
	9550 1350 10000 1350
Wire Wire Line
	9550 1450 10000 1450
Text Label 9900 5550 2    50   ~ 0
FPD7
Text Label 9900 5450 2    50   ~ 0
FPD6
Text Label 9900 5350 2    50   ~ 0
FPD5
Text Label 9900 5250 2    50   ~ 0
FPD4
Text Label 9900 5150 2    50   ~ 0
FPD3
Text Label 9900 5050 2    50   ~ 0
FPD2
Text Label 9900 4950 2    50   ~ 0
FPD1
Text Label 9900 4850 2    50   ~ 0
FPD0
Entry Wire Line
	10050 5250 9950 5150
Entry Wire Line
	10050 5150 9950 5050
Entry Wire Line
	10050 5050 9950 4950
Entry Wire Line
	10050 4950 9950 4850
Entry Wire Line
	10050 5650 9950 5550
Entry Wire Line
	10050 5550 9950 5450
Entry Wire Line
	10050 5450 9950 5350
Entry Wire Line
	10050 5350 9950 5250
Wire Wire Line
	9700 5350 9950 5350
Wire Wire Line
	9700 5450 9950 5450
Wire Wire Line
	9700 5550 9950 5550
Wire Wire Line
	9700 5250 9950 5250
Wire Wire Line
	9700 4850 9950 4850
Wire Wire Line
	9700 4950 9950 4950
Wire Wire Line
	9700 5050 9950 5050
Wire Wire Line
	9700 5150 9950 5150
Text Label 9650 1150 0    50   ~ 0
FPOD0
Text Label 9650 1250 0    50   ~ 0
FPOD1
Text Label 9650 1350 0    50   ~ 0
FPOD2
Text Label 9650 1450 0    50   ~ 0
FPOD3
Text Label 9650 1550 0    50   ~ 0
FPOD4
Text Label 9650 1650 0    50   ~ 0
FPOD5
Text Label 9650 1750 0    50   ~ 0
FPOD6
Text Label 9650 1850 0    50   ~ 0
FPOD7
Text Label 9650 2900 0    50   ~ 0
FPOD0
Text Label 9650 3000 0    50   ~ 0
FPOD1
Text Label 9650 3100 0    50   ~ 0
FPOD2
Text Label 9650 3200 0    50   ~ 0
FPOD3
Text Label 9650 3300 0    50   ~ 0
FPOD4
Text Label 9650 3400 0    50   ~ 0
FPOD5
Text Label 9650 3500 0    50   ~ 0
FPOD6
Text Label 9650 3600 0    50   ~ 0
FPOD7
Text Label 8500 5550 0    50   ~ 0
FPOD7
Text Label 8500 5450 0    50   ~ 0
FPOD6
Text Label 8500 5350 0    50   ~ 0
FPOD5
Text Label 8500 5250 0    50   ~ 0
FPOD4
Text Label 8500 5150 0    50   ~ 0
FPOD3
Text Label 8500 5050 0    50   ~ 0
FPOD2
Text Label 8500 4950 0    50   ~ 0
FPOD1
Text Label 8500 4850 0    50   ~ 0
FPOD0
Entry Wire Line
	8400 5150 8300 5050
Entry Wire Line
	8400 5050 8300 4950
Entry Wire Line
	8400 4950 8300 4850
Entry Wire Line
	8400 4850 8300 4750
Entry Wire Line
	8400 5550 8300 5450
Entry Wire Line
	8400 5450 8300 5350
Entry Wire Line
	8400 5350 8300 5250
Entry Wire Line
	8400 5250 8300 5150
Wire Wire Line
	8400 5350 8700 5350
Wire Wire Line
	8400 5450 8700 5450
Wire Wire Line
	8400 5550 8700 5550
Wire Wire Line
	8400 5250 8700 5250
Wire Wire Line
	8400 4850 8700 4850
Wire Wire Line
	8400 4950 8700 4950
Wire Wire Line
	8400 5050 8700 5050
Wire Wire Line
	8400 5150 8700 5150
Entry Bus Bus
	8300 4550 8400 4450
Wire Bus Line
	8400 4450 10000 4450
Entry Bus Bus
	10000 4450 10100 4350
Text Label 10550 5900 2    50   ~ 0
FPD[0..7]
Entry Bus Bus
	8200 6250 8300 6350
Text Label 10200 6350 0    50   ~ 0
AEXT[0..7]
Text Label 8200 6100 1    50   ~ 0
AEXT[0..7]
Text Label 8200 2850 1    50   ~ 0
AEXT[0..7]
Wire Bus Line
	8300 6350 10650 6350
Text HLabel 10650 6350 2    50   Input ~ 0
AEXT[0..7]
Text HLabel 10650 5900 2    50   3State ~ 0
FPD[0..7]
Wire Bus Line
	10150 5900 10650 5900
Text Notes 6600 750  0    100  ~ 20
Main Register File
Text Notes 8350 750  0    100  ~ 20
Front Panel Shadow File
Text Notes 6700 4650 0    100  ~ 20
Register Reads
Wire Wire Line
	7800 5150 8100 5150
Wire Wire Line
	7800 5050 8100 5050
Wire Wire Line
	7800 4950 8100 4950
Wire Wire Line
	7800 4850 8100 4850
Wire Wire Line
	7800 5250 8100 5250
Wire Wire Line
	7800 5450 8100 5450
Wire Wire Line
	7800 5350 8100 5350
Entry Wire Line
	8200 5350 8100 5250
Entry Wire Line
	8200 5450 8100 5350
Entry Wire Line
	8200 5550 8100 5450
Entry Wire Line
	8200 5650 8100 5550
Entry Wire Line
	8200 4950 8100 4850
Entry Wire Line
	8200 5050 8100 4950
Entry Wire Line
	8200 5150 8100 5050
Entry Wire Line
	8200 5250 8100 5150
Wire Wire Line
	7800 5550 8100 5550
Text Label 8200 4700 1    50   ~ 0
AEXT[0..7]
$Comp
L power:GND #PWR?
U 1 1 5E6037F2
P 8700 5850
F 0 "#PWR?" H 8700 5600 50  0001 C CNN
F 1 "GND" H 8705 5677 50  0000 C CNN
F 2 "" H 8700 5850 50  0001 C CNN
F 3 "" H 8700 5850 50  0001 C CNN
	1    8700 5850
	1    0    0    -1  
$EndComp
Text Label 8350 5750 0    50   ~ 0
~FPMBREN
Wire Wire Line
	8700 5750 8350 5750
Text Notes 7150 4950 0    198  ~ 0
←
$Comp
L alexios:IS61C64AL U?
U 1 1 5EA76CCD
P 2000 4100
F 0 "U?" H 2000 5267 50  0000 C CNN
F 1 "IS61C64AL" H 2000 5176 50  0000 C CNN
F 2 "Package_SO:SOJ-28_10.16x23.49mm_P1.27mm" V 1900 4125 50  0001 C CNN
F 3 "https://www.mouser.co.uk/datasheet/2/198/61C64AL-258428.pdf" H 1900 4200 50  0001 C CNN
F 4 "870-IS61C64AL10JLITR; €1.11" H 1350 3050 50  0001 L CNN "AC:BOM-Mouser"
	1    2000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3500 1450 3500
Wire Wire Line
	1450 3500 1450 3600
$Comp
L power:GND #PWR?
U 1 1 5EA872CC
P 1450 5000
F 0 "#PWR?" H 1450 4750 50  0001 C CNN
F 1 "GND" H 1455 4827 50  0000 C CNN
F 2 "" H 1450 5000 50  0001 C CNN
F 3 "" H 1450 5000 50  0001 C CNN
	1    1450 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3600 1450 3600
Connection ~ 1450 3600
Wire Wire Line
	1450 3600 1450 3700
Wire Wire Line
	1500 3700 1450 3700
Connection ~ 1450 3700
Wire Wire Line
	1450 3700 1450 3800
Wire Wire Line
	1500 3800 1450 3800
Connection ~ 1450 3800
Wire Wire Line
	1450 3800 1450 3900
Wire Wire Line
	1500 3900 1450 3900
Connection ~ 1450 3900
Wire Wire Line
	1450 3900 1450 4000
Wire Wire Line
	1500 4000 1450 4000
Connection ~ 1450 4000
Wire Wire Line
	1450 4000 1450 4100
Wire Wire Line
	1500 4100 1450 4100
Connection ~ 1450 4100
Wire Wire Line
	1450 4100 1450 4200
Wire Wire Line
	1500 4200 1450 4200
Connection ~ 1450 4200
Wire Wire Line
	1450 4200 1450 4300
Wire Wire Line
	1500 4300 1450 4300
Connection ~ 1450 4300
Wire Wire Line
	1450 4300 1450 4400
Wire Wire Line
	1500 4400 1450 4400
Connection ~ 1450 4400
Wire Wire Line
	1450 4400 1450 4600
Wire Wire Line
	1500 4600 1450 4600
Connection ~ 1450 4600
Wire Wire Line
	1450 4600 1450 5000
Wire Wire Line
	1500 4700 1050 4700
Text Label 1050 4700 0    50   ~ 0
~RMBR
Wire Wire Line
	1500 4800 1050 4800
Text Label 1050 4800 0    50   ~ 0
~WMBR
Entry Wire Line
	3000 3700 2900 3600
Entry Wire Line
	3000 3800 2900 3700
Entry Wire Line
	3000 3900 2900 3800
Entry Wire Line
	3000 4000 2900 3900
Entry Wire Line
	3000 3300 2900 3200
Entry Wire Line
	3000 3400 2900 3300
Entry Wire Line
	3000 3500 2900 3400
Entry Wire Line
	3000 3600 2900 3500
Text Label 2600 3200 0    50   ~ 0
AEXT0
Text Label 2600 3300 0    50   ~ 0
AEXT1
Text Label 2600 3400 0    50   ~ 0
AEXT2
Text Label 2600 3500 0    50   ~ 0
AEXT3
Text Label 2600 3600 0    50   ~ 0
AEXT4
Text Label 2600 3700 0    50   ~ 0
AEXT5
Text Label 2600 3800 0    50   ~ 0
AEXT6
Text Label 2600 3900 0    50   ~ 0
AEXT7
Wire Wire Line
	3500 3500 3100 3500
Wire Wire Line
	3500 3400 3100 3400
Wire Wire Line
	3500 3300 3100 3300
Wire Wire Line
	3500 3200 3100 3200
Wire Wire Line
	3500 3600 3100 3600
Wire Wire Line
	3500 3900 3100 3900
Wire Wire Line
	3500 3800 3100 3800
Wire Wire Line
	3500 3700 3100 3700
Entry Wire Line
	3000 3700 3100 3600
Entry Wire Line
	3000 3800 3100 3700
Entry Wire Line
	3000 3900 3100 3800
Entry Wire Line
	3000 4000 3100 3900
Entry Wire Line
	3000 3300 3100 3200
Entry Wire Line
	3000 3400 3100 3300
Entry Wire Line
	3000 3500 3100 3400
Entry Wire Line
	3000 3600 3100 3500
Text Label 3400 3200 2    50   ~ 0
AEXT0
Text Label 3400 3300 2    50   ~ 0
AEXT1
Text Label 3400 3400 2    50   ~ 0
AEXT2
Text Label 3400 3500 2    50   ~ 0
AEXT3
Text Label 3400 3600 2    50   ~ 0
AEXT4
Text Label 3400 3700 2    50   ~ 0
AEXT5
Text Label 3400 3800 2    50   ~ 0
AEXT6
Text Label 3400 3900 2    50   ~ 0
AEXT7
Wire Wire Line
	2500 3200 2900 3200
Text Label 3000 4450 1    50   ~ 0
AEXT[0..7]
Entry Wire Line
	4850 3900 4950 3800
Entry Wire Line
	4850 3800 4950 3700
Entry Wire Line
	4850 3700 4950 3600
Entry Wire Line
	4850 3600 4950 3500
Entry Wire Line
	4850 3500 4950 3400
Entry Wire Line
	4850 3400 4950 3300
Entry Wire Line
	4850 3300 4950 3200
Entry Wire Line
	4850 3200 4950 3100
Text Label 4750 3200 2    50   ~ 0
IBUS0
Text Label 4750 3300 2    50   ~ 0
IBUS1
Text Label 4750 3400 2    50   ~ 0
IBUS2
Text Label 4750 3500 2    50   ~ 0
IBUS3
Text Label 4750 3600 2    50   ~ 0
IBUS4
Text Label 4750 3700 2    50   ~ 0
IBUS5
Text Label 4750 3800 2    50   ~ 0
IBUS6
Text Label 4750 3900 2    50   ~ 0
IBUS7
Wire Wire Line
	2500 3500 2900 3500
Wire Wire Line
	2500 3400 2900 3400
Wire Wire Line
	2500 3300 2900 3300
Wire Wire Line
	2500 3600 2900 3600
Wire Wire Line
	2500 3900 2900 3900
Wire Wire Line
	2500 3800 2900 3800
Wire Wire Line
	2500 3700 2900 3700
Wire Wire Line
	4500 3200 4850 3200
Wire Wire Line
	4500 3300 4850 3300
Wire Wire Line
	4500 3400 4850 3400
Wire Wire Line
	4500 3500 4850 3500
Wire Wire Line
	4500 3600 4850 3600
Wire Wire Line
	4500 3700 4850 3700
Wire Wire Line
	4500 3800 4850 3800
Wire Wire Line
	4500 3900 4850 3900
Wire Wire Line
	1500 3200 1050 3200
Wire Wire Line
	1500 3300 1050 3300
Wire Wire Line
	1500 3400 1050 3400
Text Label 1050 3200 0    50   ~ 0
SEL0
Text Label 1050 3300 0    50   ~ 0
SEL1
Text Label 1050 3400 0    50   ~ 0
SEL2
$Comp
L alexios:74HC245 U?
U 1 1 5E2BA1D9
P 4000 3700
F 0 "U?" H 4000 4467 50  0000 C CNN
F 1 "74HC245" H 4000 4376 50  0000 C CNN
F 2 "" H 4000 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 4000 3750 50  0001 C CNN
	1    4000 3700
	1    0    0    -1  
$EndComp
Wire Bus Line
	8300 4550 8300 5450
Wire Bus Line
	4950 2900 4950 3800
Wire Bus Line
	10050 4950 10050 5800
Wire Bus Line
	3000 3300 3000 4500
Wire Bus Line
	8300 950  8300 3500
Wire Bus Line
	6400 950  6400 5450
Wire Bus Line
	10100 1250 10100 4350
Wire Bus Line
	8200 1250 8200 6250
$EndSCHEMATC
