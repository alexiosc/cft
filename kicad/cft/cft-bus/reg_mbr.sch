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
	1650 4700 1650 4900
$Comp
L power:GND #PWR?
U 1 1 5DC014EE
P 3100 6800
AR Path="/5DC014EE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DC014EE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DC014EE" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 3100 6550 50  0001 C CNN
F 1 "GND" H 3105 6627 50  0000 C CNN
F 2 "" H 3100 6800 50  0001 C CNN
F 3 "" H 3100 6800 50  0001 C CNN
	1    3100 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DC014E8
P 3100 6600
AR Path="/5DC014E8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DC014E8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DC014E8" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 3100 6450 50  0001 C CNN
F 1 "+5V" H 3115 6773 50  0000 C CNN
F 2 "" H 3100 6600 50  0001 C CNN
F 3 "" H 3100 6600 50  0001 C CNN
	1    3100 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DC014E2
P 3100 6700
AR Path="/5CC0D65F/5DC014E2" Ref="C?"  Part="1" 
AR Path="/5DC014E2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DC014E2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DC014E2" Ref="C21"  Part="1" 
F 0 "C21" H 3009 6746 50  0000 R CNN
F 1 "100nF" H 3009 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3100 6700 50  0001 C CNN
F 3 "~" H 3100 6700 50  0001 C CNN
	1    3100 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DBF066E
P 3100 7500
AR Path="/5DBF066E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBF066E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBF066E" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 3100 7250 50  0001 C CNN
F 1 "GND" H 3105 7327 50  0000 C CNN
F 2 "" H 3100 7500 50  0001 C CNN
F 3 "" H 3100 7500 50  0001 C CNN
	1    3100 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DBF0668
P 3100 7300
AR Path="/5DBF0668" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBF0668" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBF0668" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 3100 7150 50  0001 C CNN
F 1 "+5V" H 3115 7473 50  0000 C CNN
F 2 "" H 3100 7300 50  0001 C CNN
F 3 "" H 3100 7300 50  0001 C CNN
	1    3100 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DBF0662
P 3100 7400
AR Path="/5CC0D65F/5DBF0662" Ref="C?"  Part="1" 
AR Path="/5DBF0662" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DBF0662" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DBF0662" Ref="C25"  Part="1" 
F 0 "C25" H 3009 7446 50  0000 R CNN
F 1 "100nF" H 3009 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3100 7400 50  0001 C CNN
F 3 "~" H 3100 7400 50  0001 C CNN
	1    3100 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB9AD5C
P 6400 3300
AR Path="/5DB9AD5C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB9AD5C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB9AD5C" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 6400 3050 50  0001 C CNN
F 1 "GND" H 6405 3127 50  0000 C CNN
F 2 "" H 6400 3300 50  0001 C CNN
F 3 "" H 6400 3300 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB9AD56
P 6400 3100
AR Path="/5DB9AD56" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB9AD56" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB9AD56" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 6400 2950 50  0001 C CNN
F 1 "+5V" H 6415 3273 50  0000 C CNN
F 2 "" H 6400 3100 50  0001 C CNN
F 3 "" H 6400 3100 50  0001 C CNN
	1    6400 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB9AD50
P 6400 3200
AR Path="/5CC0D65F/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB9AD50" Ref="C19"  Part="1" 
F 0 "C19" H 6309 3246 50  0000 R CNN
F 1 "100nF" H 6309 3155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6400 3200 50  0001 C CNN
F 3 "~" H 6400 3200 50  0001 C CNN
	1    6400 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB680A4
P 1750 7500
AR Path="/5DB680A4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB680A4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB680A4" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 1750 7250 50  0001 C CNN
F 1 "GND" H 1755 7327 50  0000 C CNN
F 2 "" H 1750 7500 50  0001 C CNN
F 3 "" H 1750 7500 50  0001 C CNN
	1    1750 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB6809E
P 1750 7300
AR Path="/5DB6809E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB6809E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB6809E" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 1750 7150 50  0001 C CNN
F 1 "+5V" H 1765 7473 50  0000 C CNN
F 2 "" H 1750 7300 50  0001 C CNN
F 3 "" H 1750 7300 50  0001 C CNN
	1    1750 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB68098
P 1750 7400
AR Path="/5CC0D65F/5DB68098" Ref="C?"  Part="1" 
AR Path="/5DB68098" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB68098" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB68098" Ref="C24"  Part="1" 
F 0 "C24" H 1659 7446 50  0000 R CNN
F 1 "100nF" H 1659 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1750 7400 50  0001 C CNN
F 3 "~" H 1750 7400 50  0001 C CNN
	1    1750 7400
	1    0    0    -1  
$EndComp
Connection ~ 3100 6600
Connection ~ 3100 6800
$Comp
L alexios:74AHC1G125 U36
U 2 1 5DAF889C
P 3450 6700
F 0 "U36" H 3630 6746 50  0000 L CNN
F 1 "74AHC1G125" H 3630 6655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3625 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3625 6950 50  0001 C CNN
	2    3450 6700
	1    0    0    -1  
$EndComp
Connection ~ 3100 7300
Connection ~ 3100 7500
$Comp
L alexios:74LVC1G74 U40
U 2 1 5DAF7668
P 3450 7400
F 0 "U40" H 3630 7446 50  0000 L CNN
F 1 "74LVC1G74" H 3630 7355 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3900 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 3900 7400 50  0001 C CNN
	2    3450 7400
	1    0    0    -1  
$EndComp
Connection ~ 6400 3100
Connection ~ 6400 3300
$Comp
L alexios:74HC541 U30
U 2 1 5DAEC681
P 6750 3200
F 0 "U30" H 6930 3246 50  0000 L CNN
F 1 "74HC541" H 6930 3155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 6750 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6750 3200 50  0001 C CNN
	2    6750 3200
	1    0    0    -1  
$EndComp
Connection ~ 1750 7500
Connection ~ 1750 7300
$Comp
L alexios:74HC139 U39
U 3 1 5DAE9571
P 2100 7400
F 0 "U39" H 2280 7446 50  0000 L CNN
F 1 "74HC139" H 2280 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2100 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2100 7400 50  0001 C CNN
	3    2100 7400
	1    0    0    -1  
$EndComp
Text Notes 2750 4600 0    50   ~ 0
High after ~RESET~\nasserted.
Text Notes 2750 5050 0    50   ~ 0
High after ~BANKW0~\nasserted.
Text Notes 1100 6150 0    50   ~ 0
After ~RESET~ and before ~BANKW0~ is asserted, drive AEXT₀₋₇ with &00 (~RAM~/ROM position set to ~RAM~)\nor &80 (set to ROM). Use pull-down resistors for most of the vector. After the first write to an MBR register,\nthis stops and random values can be expected to be present! So the minimum required registers should be\ninitialised as early as possible after reset.
$Comp
L power:GND #PWR058
U 1 1 5DA49867
P 7650 4250
F 0 "#PWR058" H 7650 4000 50  0001 C CNN
F 1 "GND" H 7800 4200 50  0000 C CNN
F 2 "" H 7650 4250 50  0001 C CNN
F 3 "" H 7650 4250 50  0001 C CNN
	1    7650 4250
	-1   0    0    -1  
$EndComp
Entry Wire Line
	7100 4400 7200 4500
Entry Wire Line
	7000 4400 7100 4500
Entry Wire Line
	6900 4400 7000 4500
Entry Wire Line
	6800 4400 6900 4500
Entry Wire Line
	6700 4400 6800 4500
Entry Wire Line
	6600 4400 6700 4500
Entry Wire Line
	6500 4400 6600 4500
Entry Wire Line
	6400 4400 6500 4500
Wire Wire Line
	7100 4150 7100 4400
Wire Wire Line
	7000 4150 7000 4400
Wire Wire Line
	6900 4150 6900 4400
Wire Wire Line
	6800 4150 6800 4400
Text Label 6400 4400 1    50   ~ 0
AEXT0
Text Label 7100 4400 1    50   ~ 0
AEXT7
Text Label 7000 4400 1    50   ~ 0
AEXT6
Text Label 6900 4400 1    50   ~ 0
AEXT5
Text Label 6800 4400 1    50   ~ 0
AEXT4
Text Label 6700 4400 1    50   ~ 0
AEXT3
Text Label 6600 4400 1    50   ~ 0
AEXT2
Text Label 6500 4400 1    50   ~ 0
AEXT1
Wire Wire Line
	6700 4150 6700 4400
Wire Wire Line
	6600 4150 6600 4400
Wire Wire Line
	6500 4150 6500 4400
Wire Wire Line
	6400 4150 6400 4400
Text Label 1250 4150 3    50   ~ 0
~BANKW0
Wire Wire Line
	1250 5100 1700 5100
Wire Wire Line
	1250 3550 1250 5100
Wire Wire Line
	2750 3550 1250 3550
Wire Wire Line
	2750 3150 3150 3150
Wire Wire Line
	2700 3150 2750 3150
Connection ~ 2750 3150
Wire Wire Line
	2750 3150 2750 3550
Text Label 3550 5650 0    50   ~ 0
AEXT7
Wire Wire Line
	2700 4450 2700 4800
Wire Wire Line
	1650 4450 2700 4450
Wire Wire Line
	1650 4200 1700 4200
Wire Wire Line
	1650 4450 1650 4200
Text Label 1600 4800 2    50   ~ 0
~RESET
Wire Wire Line
	1100 4800 1700 4800
Text HLabel 1100 4800 0    50   Input ~ 0
~RESET
Wire Wire Line
	3250 5100 3250 5450
Wire Wire Line
	2600 5100 3250 5100
$Comp
L alexios:74LVC1G74 U35
U 1 1 5D1C9022
P 2150 4950
F 0 "U35" H 2150 5367 50  0000 C CNN
F 1 "74LVC1G74" H 2150 5276 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2600 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 2600 4950 50  0001 C CNN
	1    2150 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4900 1650 4900
Wire Wire Line
	1650 5000 1700 5000
Connection ~ 1650 4900
Wire Wire Line
	1650 4900 1650 5000
$Comp
L power:+5V #PWR056
U 1 1 5D1C2F41
P 1650 4700
F 0 "#PWR056" H 1650 4550 50  0001 C CNN
F 1 "+5V" H 1665 4873 50  0000 C CNN
F 2 "" H 1650 4700 50  0001 C CNN
F 3 "" H 1650 4700 50  0001 C CNN
	1    1650 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04 RN2
U 1 1 5D5C7149
P 7000 3950
F 0 "RN2" H 7188 3904 50  0000 L CNN
F 1 "4.7kΩ" H 7188 3995 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 7275 3950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7000 3950 50  0001 C CNN
	1    7000 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04 RN1
U 1 1 5D532D59
P 6600 3950
F 0 "RN1" H 6321 3904 50  0000 R CNN
F 1 "4.7kΩ" H 6321 3995 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP5" V 6875 3950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6600 3950 50  0001 C CNN
	1    6600 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G125 U14
U 1 1 5D51C57C
P 3200 5650
F 0 "U14" H 3300 5900 50  0000 L CNN
F 1 "74AHC1G125" H 3300 5800 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3375 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3375 5900 50  0001 C CNN
	1    3200 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 61FE7EBF
P 1700 3900
F 0 "#PWR055" H 1700 3750 50  0001 C CNN
F 1 "+5V" H 1715 4073 50  0000 C CNN
F 2 "" H 1700 3900 50  0001 C CNN
F 3 "" H 1700 3900 50  0001 C CNN
	1    1700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4800 2700 4800
Wire Wire Line
	1100 5650 1250 5650
Text Label 2400 5650 2    50   ~ 0
~FPRAM~∕ROM
Text Label 1600 5100 2    50   ~ 0
~BANKW0
Text HLabel 1100 5650 0    50   Input ~ 0
~FPRAM~∕ROM
Text Label 1250 700  0    50   ~ 0
IBUS[0..7]
Wire Wire Line
	3150 2650 1300 2650
NoConn ~ 2700 4100
NoConn ~ 2700 3900
NoConn ~ 2700 3250
NoConn ~ 2700 3050
Wire Wire Line
	1300 2650 1300 3350
Wire Wire Line
	1300 3350 1700 3350
Text HLabel 1100 700  0    50   3State ~ 0
IBUS[0..7]
Wire Bus Line
	3500 700  1100 700 
Text HLabel 1100 1800 0    50   Input ~ 0
IR[0..11]
Text HLabel 1100 1650 0    50   Input ~ 0
WADDR[0..4]
Text Label 3600 2850 1    50   ~ 0
IBUS[0..7]
Text Label 8100 4550 0    50   ~ 0
AEXT[0..7]
Entry Bus Bus
	3700 700  3600 800 
Entry Bus Bus
	3500 700  3600 800 
Entry Bus Bus
	7800 700  7900 800 
Entry Wire Line
	7800 1000 7900 900 
Entry Wire Line
	7800 1100 7900 1000
Entry Wire Line
	7800 1200 7900 1100
Entry Wire Line
	7800 1300 7900 1200
Entry Wire Line
	7800 1400 7900 1300
Entry Wire Line
	7800 1500 7900 1400
Entry Wire Line
	7800 1600 7900 1500
Entry Wire Line
	7800 1700 7900 1600
Entry Bus Bus
	5950 4550 5850 4450
Text HLabel 10700 4550 2    50   Output ~ 0
AEXT[0..7]
Wire Wire Line
	7450 1700 7800 1700
Wire Wire Line
	7450 1600 7800 1600
Wire Wire Line
	7450 1500 7800 1500
Wire Wire Line
	7450 1400 7800 1400
Wire Wire Line
	7450 1300 7800 1300
Wire Wire Line
	7450 1200 7800 1200
Wire Wire Line
	7450 1100 7800 1100
Wire Wire Line
	7450 1000 7800 1000
Text Label 6150 1900 0    50   ~ 0
~RMBR
Wire Wire Line
	6450 1900 6150 1900
$Comp
L alexios:74HC541 U30
U 1 1 61FE7F80
P 6950 1500
F 0 "U30" H 6950 2267 50  0000 C CNN
F 1 "74HC541" H 6950 2176 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6950 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6950 1500 50  0001 C CNN
	1    6950 1500
	1    0    0    -1  
$EndComp
Text Label 1450 3350 0    50   ~ 0
~WMBR
Entry Wire Line
	5950 1700 5850 1800
Entry Wire Line
	5950 1600 5850 1700
Entry Wire Line
	5950 1500 5850 1600
Entry Wire Line
	5950 1400 5850 1500
Text Label 6350 1700 2    50   ~ 0
AEXT7
Text Label 6350 1600 2    50   ~ 0
AEXT6
Text Label 6350 1500 2    50   ~ 0
AEXT5
Text Label 6350 1400 2    50   ~ 0
AEXT4
Wire Wire Line
	6450 1700 5950 1700
Wire Wire Line
	6450 1600 5950 1600
Wire Wire Line
	6450 1500 5950 1500
Wire Wire Line
	6450 1400 5950 1400
Entry Wire Line
	5950 1300 5850 1400
Entry Wire Line
	5950 1200 5850 1300
Entry Wire Line
	5950 1100 5850 1200
Entry Wire Line
	5950 1000 5850 1100
Text Label 6350 1300 2    50   ~ 0
AEXT3
Text Label 6350 1200 2    50   ~ 0
AEXT2
Text Label 6350 1100 2    50   ~ 0
AEXT1
Text Label 6350 1000 2    50   ~ 0
AEXT0
Wire Wire Line
	6450 1300 5950 1300
Wire Wire Line
	6450 1200 5950 1200
Wire Wire Line
	6450 1100 5950 1100
Wire Wire Line
	6450 1000 5950 1000
Text Label 1450 4000 0    50   ~ 0
SEL2
Wire Wire Line
	1700 4000 1450 4000
Text Label 1450 3150 0    50   ~ 0
IR2
Wire Wire Line
	1700 3150 1450 3150
$Comp
L alexios:74HC139 U31
U 1 1 61FE7ED6
P 2200 3150
F 0 "U31" H 2200 3517 50  0000 C CNN
F 1 "74HC139" H 2200 3426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2200 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2200 3150 50  0001 C CNN
	1    2200 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR052
U 1 1 61FE7ED0
P 1700 3050
F 0 "#PWR052" H 1700 2900 50  0001 C CNN
F 1 "+5V" H 1715 3223 50  0000 C CNN
F 2 "" H 1700 3050 50  0001 C CNN
F 3 "" H 1700 3050 50  0001 C CNN
	1    1700 3050
	1    0    0    -1  
$EndComp
Text Label 3150 3150 2    50   ~ 0
~BANKW0
Text Label 3150 3350 2    50   ~ 0
~BANKW1
$Comp
L alexios:74HC139 U31
U 2 1 61FE7EC7
P 2200 4000
F 0 "U31" H 2200 4367 50  0000 C CNN
F 1 "74HC139" H 2200 4276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2200 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2200 4000 50  0001 C CNN
	2    2200 4000
	1    0    0    -1  
$EndComp
Text Label 3150 4000 2    50   ~ 0
~BANKR0
Text Label 3150 4200 2    50   ~ 0
~BANKR1
Wire Wire Line
	2700 4200 3150 4200
Wire Wire Line
	2700 4000 3150 4000
Wire Wire Line
	2700 3350 3150 3350
Text HLabel 1100 1500 0    50   Input ~ 0
RADDR[0..4]
Text Label 7650 1000 2    50   ~ 0
IBUS0
Text Label 7650 1100 2    50   ~ 0
IBUS1
Text Label 7650 1200 2    50   ~ 0
IBUS2
Text Label 7650 1300 2    50   ~ 0
IBUS3
Text Label 7650 1400 2    50   ~ 0
IBUS4
Text Label 7650 1500 2    50   ~ 0
IBUS5
Text Label 7650 1600 2    50   ~ 0
IBUS6
Text Label 7650 1700 2    50   ~ 0
IBUS7
$Comp
L power:GND #PWR050
U 1 1 60B7235A
P 6450 2000
F 0 "#PWR050" H 6450 1750 50  0001 C CNN
F 1 "GND" H 6455 1827 50  0000 C CNN
F 2 "" H 6450 2000 50  0001 C CNN
F 3 "" H 6450 2000 50  0001 C CNN
	1    6450 2000
	1    0    0    -1  
$EndComp
$Sheet
S 1500 1350 1150 650 
U 63C9F04D
F0 "Decoder" 50
F1 "reg_mbr_decoder.sch" 50
F2 "~RMBR" O R 2650 1800 50 
F3 "~WMBR" O R 2650 1650 50 
F4 "RADDR[0..4]" I L 1500 1500 50 
F5 "WADDR[0..4]" I L 1500 1650 50 
F6 "SEL[0..2]" O R 2650 1500 50 
F7 "IR[0..11]" I L 1500 1800 50 
$EndSheet
Wire Bus Line
	1100 1500 1500 1500
Wire Bus Line
	1100 1650 1500 1650
Wire Bus Line
	1500 1800 1100 1800
Wire Bus Line
	2650 1500 3050 1500
Text Label 3050 1500 2    50   ~ 0
SEL[0..2]
Wire Wire Line
	2650 1800 3050 1800
Text Label 3050 1650 2    50   ~ 0
~WMBR
Text Label 3050 1800 2    50   ~ 0
~RMBR
Text Notes 1100 1150 0    100  ~ 20
Register Address Decoding
Wire Wire Line
	3150 1650 3150 2650
Wire Wire Line
	2650 1650 3150 1650
Text Notes 1000 9800 0    50   ~ 0
MBn registers are accessed when:\n\n1. Write access when WADDR=00001 is selected (~WRITE-MBP+FLAGS~).\n2. Write access when WADDR=00011 is selected (~WRITE-MBn~).\n3. Read access when RADDR=00001 is selected (~READ-MBP+FLAGS~).\n4. Read access when RADDR=00011 is selected (~READ-MBn~).\n5. Read access when WADDR=001xx (~WRITE-AR:MBn~). Note, even though\nwe respond on WADDR, this is a READ operation.\n\nThe register to use is usually identified by IR₀₋₂, except in cases 1 and 3\n(which always use MB0 aka MBP), and case 5 where one of the first four\nregisters is selected by WADDR₀₋₁ unless WADDR=00111 (~WRITE-AR:MBZ~)\nand IR₁₁₋₈=1111 (I=1, R=1, Operand 3XX₁₆).
$Comp
L Device:R_Small R?
U 1 1 5D8BACBF
P 1250 5450
AR Path="/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/61F95ACC/5D8BACBF" Ref="R3"  Part="1" 
F 0 "R3" H 1309 5496 50  0000 L CNN
F 1 "4.7kΩ" H 1309 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1250 5450 50  0001 C CNN
F 3 "~" H 1250 5450 50  0001 C CNN
	1    1250 5450
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 5D8E1171
P 1250 5350
F 0 "#PWR059" H 1250 5200 50  0001 C CNN
F 1 "+5V" H 1100 5450 50  0000 C CNN
F 2 "" H 1250 5350 50  0001 C CNN
F 3 "" H 1250 5350 50  0001 C CNN
	1    1250 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5550 1250 5650
Connection ~ 1250 5650
Wire Wire Line
	1250 5650 3000 5650
Text Notes 6250 2650 0    50   ~ 0
IBUS[8..15] are purposefully not driven here!\nThey are handled by the flag unit.
Text Notes 6250 2450 0    50   ~ 10
Note
Text Label 5450 1300 0    50   ~ 0
AEXT3
Text Label 5450 1200 0    50   ~ 0
AEXT2
Text Label 5450 1100 0    50   ~ 0
AEXT1
Text Label 5450 1000 0    50   ~ 0
AEXT0
Wire Wire Line
	5300 1300 5750 1300
Wire Wire Line
	5300 1200 5750 1200
Wire Wire Line
	5300 1100 5750 1100
Wire Wire Line
	5300 1000 5750 1000
Text Label 5450 1400 0    50   ~ 0
AEXT4
Text Label 5450 1500 0    50   ~ 0
AEXT5
Text Label 5450 1600 0    50   ~ 0
AEXT6
Text Label 5450 1700 0    50   ~ 0
AEXT7
Wire Wire Line
	5300 1400 5750 1400
Wire Wire Line
	5300 1700 5750 1700
Wire Wire Line
	5300 1600 5750 1600
Wire Wire Line
	5300 1500 5750 1500
Wire Wire Line
	4150 1300 3700 1300
Wire Wire Line
	4150 1200 3700 1200
Wire Wire Line
	4150 1100 3700 1100
Wire Wire Line
	4150 1000 3700 1000
Entry Wire Line
	3700 1400 3600 1300
Entry Wire Line
	3700 1500 3600 1400
Entry Wire Line
	3700 1600 3600 1500
Entry Wire Line
	3700 1700 3600 1600
Entry Wire Line
	3700 1000 3600 900 
Entry Wire Line
	3700 1100 3600 1000
Entry Wire Line
	3700 1200 3600 1100
Entry Wire Line
	3700 1300 3600 1200
Wire Wire Line
	4150 1400 3700 1400
Wire Wire Line
	4150 1700 3700 1700
Wire Wire Line
	4150 1600 3700 1600
Wire Wire Line
	4150 1500 3700 1500
Text Label 3800 1000 0    50   ~ 0
IBUS0
Text Label 3800 1100 0    50   ~ 0
IBUS1
Text Label 3800 1200 0    50   ~ 0
IBUS2
Text Label 3800 1300 0    50   ~ 0
IBUS3
Text Label 3800 1400 0    50   ~ 0
IBUS4
Text Label 3800 1500 0    50   ~ 0
IBUS5
Text Label 3800 1600 0    50   ~ 0
IBUS6
Text Label 3800 1700 0    50   ~ 0
IBUS7
Wire Wire Line
	4150 1900 3700 1900
Wire Wire Line
	4150 2100 3700 2100
Wire Wire Line
	4150 2200 3700 2200
Text Label 3700 2100 0    50   ~ 0
SEL0
Text Label 3700 2200 0    50   ~ 0
SEL1
Text Label 3700 1900 0    50   ~ 0
~BANKW0
Entry Wire Line
	5850 1500 5750 1400
Entry Wire Line
	5850 1600 5750 1500
Entry Wire Line
	5850 1700 5750 1600
Entry Wire Line
	5850 1800 5750 1700
Entry Wire Line
	5850 1100 5750 1000
Entry Wire Line
	5850 1200 5750 1100
Entry Wire Line
	5850 1300 5750 1200
Entry Wire Line
	5850 1400 5750 1300
Wire Wire Line
	5300 1900 5750 1900
Wire Wire Line
	5300 2100 5750 2100
Wire Wire Line
	5300 2200 5750 2200
Text Label 5750 1900 2    50   ~ 0
~BANKR0
Text Label 5750 2100 2    50   ~ 0
IR0
Text Label 5750 2200 2    50   ~ 0
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
S 4150 850  1150 1500
U 5DF70AAD
F0 "MBR File (half)" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 4150 2100 50 
F3 "WA1" I L 4150 2200 50 
F4 "RA0" I R 5300 2100 50 
F5 "RA1" I R 5300 2200 50 
F6 "~RE" I R 5300 1900 50 
F7 "~WE" I L 4150 1900 50 
F8 "IN0" I L 4150 1000 50 
F9 "IN1" I L 4150 1100 50 
F10 "IN2" I L 4150 1200 50 
F11 "IN3" I L 4150 1300 50 
F12 "IN4" I L 4150 1400 50 
F13 "IN5" I L 4150 1500 50 
F14 "IN6" I L 4150 1600 50 
F15 "IN7" I L 4150 1700 50 
F16 "OUT0" O R 5300 1000 50 
F17 "OUT1" O R 5300 1100 50 
F18 "OUT2" O R 5300 1200 50 
F19 "OUT3" O R 5300 1300 50 
F20 "OUT4" O R 5300 1400 50 
F21 "OUT5" O R 5300 1500 50 
F22 "OUT6" O R 5300 1600 50 
F23 "OUT7" O R 5300 1700 50 
$EndSheet
$Sheet
S 8550 850  1150 1500
U 5DF72441
F0 "sheet5DF72429" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 8550 2100 50 
F3 "WA1" I L 8550 2200 50 
F4 "RA0" I R 9700 2100 50 
F5 "RA1" I R 9700 2200 50 
F6 "~RE" I R 9700 1900 50 
F7 "~WE" I L 8550 1900 50 
F8 "IN0" I L 8550 1000 50 
F9 "IN1" I L 8550 1100 50 
F10 "IN2" I L 8550 1200 50 
F11 "IN3" I L 8550 1300 50 
F12 "IN4" I L 8550 1400 50 
F13 "IN5" I L 8550 1500 50 
F14 "IN6" I L 8550 1600 50 
F15 "IN7" I L 8550 1700 50 
F16 "OUT0" O R 9700 1000 50 
F17 "OUT1" O R 9700 1100 50 
F18 "OUT2" O R 9700 1200 50 
F19 "OUT3" O R 9700 1300 50 
F20 "OUT4" O R 9700 1400 50 
F21 "OUT5" O R 9700 1500 50 
F22 "OUT6" O R 9700 1600 50 
F23 "OUT7" O R 9700 1700 50 
$EndSheet
$Sheet
S 4150 2750 1150 1500
U 5DF7BF78
F0 "sheet5DF7BF60" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 4150 4000 50 
F3 "WA1" I L 4150 4100 50 
F4 "RA0" I R 5300 4000 50 
F5 "RA1" I R 5300 4100 50 
F6 "~RE" I R 5300 3800 50 
F7 "~WE" I L 4150 3800 50 
F8 "IN0" I L 4150 2900 50 
F9 "IN1" I L 4150 3000 50 
F10 "IN2" I L 4150 3100 50 
F11 "IN3" I L 4150 3200 50 
F12 "IN4" I L 4150 3300 50 
F13 "IN5" I L 4150 3400 50 
F14 "IN6" I L 4150 3500 50 
F15 "IN7" I L 4150 3600 50 
F16 "OUT0" O R 5300 2900 50 
F17 "OUT1" O R 5300 3000 50 
F18 "OUT2" O R 5300 3100 50 
F19 "OUT3" O R 5300 3200 50 
F20 "OUT4" O R 5300 3300 50 
F21 "OUT5" O R 5300 3400 50 
F22 "OUT6" O R 5300 3500 50 
F23 "OUT7" O R 5300 3600 50 
$EndSheet
$Sheet
S 8550 2750 1150 1500
U 5DF852BC
F0 "sheet5DF852A4" 50
F1 "reg_mbr_4x8regfile.sch" 50
F2 "WA0" I L 8550 4000 50 
F3 "WA1" I L 8550 4100 50 
F4 "RA0" I R 9700 4000 50 
F5 "RA1" I R 9700 4100 50 
F6 "~RE" I R 9700 3800 50 
F7 "~WE" I L 8550 3800 50 
F8 "IN0" I L 8550 2900 50 
F9 "IN1" I L 8550 3000 50 
F10 "IN2" I L 8550 3100 50 
F11 "IN3" I L 8550 3200 50 
F12 "IN4" I L 8550 3300 50 
F13 "IN5" I L 8550 3400 50 
F14 "IN6" I L 8550 3500 50 
F15 "IN7" I L 8550 3600 50 
F16 "OUT0" O R 9700 2900 50 
F17 "OUT1" O R 9700 3000 50 
F18 "OUT2" O R 9700 3100 50 
F19 "OUT3" O R 9700 3200 50 
F20 "OUT4" O R 9700 3300 50 
F21 "OUT5" O R 9700 3400 50 
F22 "OUT6" O R 9700 3500 50 
F23 "OUT7" O R 9700 3600 50 
$EndSheet
Wire Wire Line
	4150 3200 3700 3200
Wire Wire Line
	4150 3100 3700 3100
Wire Wire Line
	4150 3000 3700 3000
Wire Wire Line
	4150 2900 3700 2900
Entry Wire Line
	3700 3300 3600 3200
Entry Wire Line
	3700 3400 3600 3300
Entry Wire Line
	3700 3500 3600 3400
Entry Wire Line
	3700 3600 3600 3500
Entry Wire Line
	3700 2900 3600 2800
Entry Wire Line
	3700 3000 3600 2900
Entry Wire Line
	3700 3100 3600 3000
Entry Wire Line
	3700 3200 3600 3100
Wire Wire Line
	4150 3300 3700 3300
Wire Wire Line
	4150 3600 3700 3600
Wire Wire Line
	4150 3500 3700 3500
Wire Wire Line
	4150 3400 3700 3400
Text Label 3800 2900 0    50   ~ 0
IBUS0
Text Label 3800 3000 0    50   ~ 0
IBUS1
Text Label 3800 3100 0    50   ~ 0
IBUS2
Text Label 3800 3200 0    50   ~ 0
IBUS3
Text Label 3800 3300 0    50   ~ 0
IBUS4
Text Label 3800 3400 0    50   ~ 0
IBUS5
Text Label 3800 3500 0    50   ~ 0
IBUS6
Text Label 3800 3600 0    50   ~ 0
IBUS7
Wire Wire Line
	4150 3800 3700 3800
Wire Wire Line
	4150 4000 3700 4000
Wire Wire Line
	4150 4100 3700 4100
Text Label 3700 4000 0    50   ~ 0
SEL0
Text Label 3700 4100 0    50   ~ 0
SEL1
Text Label 3700 3800 0    50   ~ 0
~BANKW1
Text Label 5450 3200 0    50   ~ 0
AEXT3
Text Label 5450 3100 0    50   ~ 0
AEXT2
Text Label 5450 3000 0    50   ~ 0
AEXT1
Text Label 5450 2900 0    50   ~ 0
AEXT0
Wire Wire Line
	5300 3200 5750 3200
Wire Wire Line
	5300 3100 5750 3100
Wire Wire Line
	5300 3000 5750 3000
Wire Wire Line
	5300 2900 5750 2900
Text Label 5450 3300 0    50   ~ 0
AEXT4
Text Label 5450 3400 0    50   ~ 0
AEXT5
Text Label 5450 3500 0    50   ~ 0
AEXT6
Text Label 5450 3600 0    50   ~ 0
AEXT7
Wire Wire Line
	5300 3300 5750 3300
Wire Wire Line
	5300 3600 5400 3600
Wire Wire Line
	5300 3500 5750 3500
Wire Wire Line
	5300 3400 5750 3400
Entry Wire Line
	5850 3400 5750 3300
Entry Wire Line
	5850 3500 5750 3400
Entry Wire Line
	5850 3600 5750 3500
Entry Wire Line
	5850 3700 5750 3600
Entry Wire Line
	5850 3000 5750 2900
Entry Wire Line
	5850 3100 5750 3000
Entry Wire Line
	5850 3200 5750 3100
Entry Wire Line
	5850 3300 5750 3200
Wire Wire Line
	5300 3800 5750 3800
Wire Wire Line
	5300 4000 5750 4000
Wire Wire Line
	5300 4100 5750 4100
Text Label 5750 3800 2    50   ~ 0
~BANKR1
Text Label 5750 4000 2    50   ~ 0
IR0
Text Label 5750 4100 2    50   ~ 0
IR1
Wire Wire Line
	8550 1300 8100 1300
Wire Wire Line
	8550 1200 8100 1200
Wire Wire Line
	8550 1100 8100 1100
Wire Wire Line
	8550 1000 8100 1000
Entry Wire Line
	8100 1400 8000 1300
Entry Wire Line
	8100 1500 8000 1400
Entry Wire Line
	8100 1600 8000 1500
Entry Wire Line
	8100 1700 8000 1600
Entry Wire Line
	8100 1000 8000 900 
Entry Wire Line
	8100 1100 8000 1000
Entry Wire Line
	8100 1200 8000 1100
Entry Wire Line
	8100 1300 8000 1200
Wire Wire Line
	8550 1400 8100 1400
Wire Wire Line
	8550 1700 8100 1700
Wire Wire Line
	8550 1600 8100 1600
Wire Wire Line
	8550 1500 8100 1500
Text Label 8200 1000 0    50   ~ 0
IBUS0
Text Label 8200 1100 0    50   ~ 0
IBUS1
Text Label 8200 1200 0    50   ~ 0
IBUS2
Text Label 8200 1300 0    50   ~ 0
IBUS3
Text Label 8200 1400 0    50   ~ 0
IBUS4
Text Label 8200 1500 0    50   ~ 0
IBUS5
Text Label 8200 1600 0    50   ~ 0
IBUS6
Text Label 8200 1700 0    50   ~ 0
IBUS7
Wire Wire Line
	8550 1900 8100 1900
Wire Wire Line
	8550 2100 8100 2100
Wire Wire Line
	8550 2200 8100 2200
Text Label 8100 2100 0    50   ~ 0
SEL0
Text Label 8100 2200 0    50   ~ 0
SEL1
Text Label 8100 1900 0    50   ~ 0
~BANKW0
Wire Wire Line
	8550 3200 8100 3200
Wire Wire Line
	8550 3100 8100 3100
Wire Wire Line
	8550 3000 8100 3000
Wire Wire Line
	8550 2900 8100 2900
Entry Wire Line
	8100 3300 8000 3200
Entry Wire Line
	8100 3400 8000 3300
Entry Wire Line
	8100 3500 8000 3400
Entry Wire Line
	8100 3600 8000 3500
Entry Wire Line
	8100 2900 8000 2800
Entry Wire Line
	8100 3000 8000 2900
Entry Wire Line
	8100 3100 8000 3000
Entry Wire Line
	8100 3200 8000 3100
Wire Wire Line
	8550 3300 8100 3300
Wire Wire Line
	8550 3600 8100 3600
Wire Wire Line
	8550 3500 8100 3500
Wire Wire Line
	8550 3400 8100 3400
Text Label 8200 2900 0    50   ~ 0
IBUS0
Text Label 8200 3000 0    50   ~ 0
IBUS1
Text Label 8200 3100 0    50   ~ 0
IBUS2
Text Label 8200 3200 0    50   ~ 0
IBUS3
Text Label 8200 3300 0    50   ~ 0
IBUS4
Text Label 8200 3400 0    50   ~ 0
IBUS5
Text Label 8200 3500 0    50   ~ 0
IBUS6
Text Label 8200 3600 0    50   ~ 0
IBUS7
Wire Wire Line
	8550 3800 8100 3800
Wire Wire Line
	8550 4000 8100 4000
Wire Wire Line
	8550 4100 8100 4100
Text Label 8100 4000 0    50   ~ 0
SEL0
Text Label 8100 4100 0    50   ~ 0
SEL1
Text Label 8100 3800 0    50   ~ 0
~BANKW1
Wire Wire Line
	9700 1300 10150 1300
Wire Wire Line
	9700 1200 10150 1200
Wire Wire Line
	9700 1100 10150 1100
Wire Wire Line
	9700 1000 10150 1000
Wire Wire Line
	9700 1400 10150 1400
Wire Wire Line
	9700 1700 10150 1700
Wire Wire Line
	9700 1600 10150 1600
Wire Wire Line
	9700 1500 10150 1500
Entry Wire Line
	10250 1500 10150 1400
Entry Wire Line
	10250 1600 10150 1500
Entry Wire Line
	10250 1700 10150 1600
Entry Wire Line
	10250 1800 10150 1700
Entry Wire Line
	10250 1100 10150 1000
Entry Wire Line
	10250 1200 10150 1100
Entry Wire Line
	10250 1300 10150 1200
Entry Wire Line
	10250 1400 10150 1300
Wire Wire Line
	9700 1900 10150 1900
Wire Wire Line
	9700 2100 10150 2100
Wire Wire Line
	9700 2200 10150 2200
Text Label 10150 2100 2    50   ~ 0
FPR0
Text Label 10150 2200 2    50   ~ 0
FPR1
Text Label 10150 1900 2    50   ~ 0
~BANKFP0
Wire Wire Line
	9700 3800 10150 3800
Wire Wire Line
	9700 4000 10150 4000
Wire Wire Line
	9700 4100 10150 4100
Text Label 10150 4000 2    50   ~ 0
FPR0
Text Label 10150 4100 2    50   ~ 0
FPR1
Text Label 10150 3800 2    50   ~ 0
~BANKFP1
Text Label 10100 1000 2    50   ~ 0
FPD0
Text Label 10100 1100 2    50   ~ 0
FPD1
Text Label 10100 1200 2    50   ~ 0
FPD2
Text Label 10100 1300 2    50   ~ 0
FPD3
Text Label 10100 1400 2    50   ~ 0
FPD4
Text Label 10100 1500 2    50   ~ 0
FPD5
Text Label 10100 1600 2    50   ~ 0
FPD6
Text Label 10100 1700 2    50   ~ 0
FPD7
Wire Wire Line
	9700 3200 10150 3200
Wire Wire Line
	9700 3100 10150 3100
Wire Wire Line
	9700 3000 10150 3000
Wire Wire Line
	9700 2900 10150 2900
Wire Wire Line
	9700 3300 10150 3300
Wire Wire Line
	9700 3600 10150 3600
Wire Wire Line
	9700 3500 10150 3500
Wire Wire Line
	9700 3400 10150 3400
Entry Wire Line
	10250 3400 10150 3300
Entry Wire Line
	10250 3500 10150 3400
Entry Wire Line
	10250 3600 10150 3500
Entry Wire Line
	10250 3700 10150 3600
Entry Wire Line
	10250 3000 10150 2900
Entry Wire Line
	10250 3100 10150 3000
Entry Wire Line
	10250 3200 10150 3100
Entry Wire Line
	10250 3300 10150 3200
Text Label 10100 2900 2    50   ~ 0
FPD0
Text Label 10100 3000 2    50   ~ 0
FPD1
Text Label 10100 3100 2    50   ~ 0
FPD2
Text Label 10100 3200 2    50   ~ 0
FPD3
Text Label 10100 3300 2    50   ~ 0
FPD4
Text Label 10100 3400 2    50   ~ 0
FPD5
Text Label 10100 3500 2    50   ~ 0
FPD6
Text Label 10100 3600 2    50   ~ 0
FPD7
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
	10250 4250 10350 4350
Wire Bus Line
	10350 4350 10700 4350
Text Label 10250 2700 1    50   ~ 0
FPD[0..7]
Text HLabel 10700 4350 2    50   3State ~ 0
FPD[0..7]
Wire Bus Line
	3700 700  7800 700 
Wire Wire Line
	5400 5650 5400 3600
Wire Wire Line
	3500 5650 5400 5650
Wire Bus Line
	5950 4550 10700 4550
Connection ~ 5400 3600
Wire Wire Line
	5400 3600 5750 3600
Text Label 5400 4800 1    50   ~ 0
AEXT7
Wire Wire Line
	6400 3750 6400 3650
Wire Wire Line
	6400 3650 6800 3650
Wire Wire Line
	7650 3650 7650 4250
Wire Wire Line
	6800 3750 6800 3650
Wire Bus Line
	8000 800  8000 1600
Wire Bus Line
	8000 2700 8000 3500
Wire Bus Line
	7900 800  7900 1600
Wire Bus Line
	3600 800  3600 3500
Wire Bus Line
	10250 1100 10250 4250
Wire Bus Line
	5850 1100 5850 4450
Connection ~ 6800 3650
Wire Wire Line
	6800 3650 7650 3650
$Comp
L alexios:74HC541 U?
U 1 1 5E550ECF
P 10950 3450
F 0 "U?" H 10950 4217 50  0000 C CNN
F 1 "74HC541" H 10950 4126 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 10950 3450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10950 3450 50  0001 C CNN
	1    10950 3450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
