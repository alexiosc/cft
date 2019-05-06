EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 24
Title "CFT Homebrew 16-bit Minicomputer"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC74 U1201
U 1 1 5F67F76B
P 2300 1750
F 0 "U1201" H 2400 2150 50  0000 L CNN
F 1 "74HC74" H 2400 2050 50  0000 L CNN
F 2 "" H 2300 1750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2300 1750 50  0001 C CNN
	1    2300 1750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U1204
U 3 1 5F6823A1
P 1350 7350
F 0 "U1204" H 1530 7396 50  0000 L CNN
F 1 "74HC74" H 1530 7305 50  0000 L CNN
F 2 "" H 1350 7350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1350 7350 50  0001 C CNN
	3    1350 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F68A0E8
P 1000 7350
AR Path="/5CC0D65F/5F68A0E8" Ref="C?"  Part="1" 
AR Path="/5F68A0E8" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F68A0E8" Ref="C1203"  Part="1" 
F 0 "C1203" H 909 7396 50  0000 R CNN
F 1 "100nF" H 909 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7350 50  0001 C CNN
F 3 "~" H 1000 7350 50  0001 C CNN
	1    1000 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01213
U 1 1 5F68A2D6
P 1000 7250
F 0 "#PWR01213" H 1000 7100 50  0001 C CNN
F 1 "+5V" H 1015 7423 50  0000 C CNN
F 2 "" H 1000 7250 50  0001 C CNN
F 3 "" H 1000 7250 50  0001 C CNN
	1    1000 7250
	1    0    0    -1  
$EndComp
Connection ~ 1000 7250
$Comp
L power:GND #PWR01217
U 1 1 5F68A4B4
P 1000 7450
F 0 "#PWR01217" H 1000 7200 50  0001 C CNN
F 1 "GND" H 1005 7277 50  0000 C CNN
F 2 "" H 1000 7450 50  0001 C CNN
F 3 "" H 1000 7450 50  0001 C CNN
	1    1000 7450
	1    0    0    -1  
$EndComp
Connection ~ 1000 7450
$Comp
L power:GND #PWR01202
U 1 1 5F68BF28
P 1850 1650
F 0 "#PWR01202" H 1850 1400 50  0001 C CNN
F 1 "GND" H 1855 1477 50  0000 C CNN
F 2 "" H 1850 1650 50  0001 C CNN
F 3 "" H 1850 1650 50  0001 C CNN
	1    1850 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2000 1750 2000
Text Label 950  2000 0    50   ~ 0
~WPC
Wire Wire Line
	2350 1350 2350 1300
Wire Wire Line
	2350 1300 950  1300
Text Label 950  1300 0    50   ~ 0
~STI
Text Label 950  2700 0    50   ~ 0
~RESET
Wire Wire Line
	2800 1650 2950 1650
Wire Wire Line
	3300 2000 3150 2000
Wire Wire Line
	3150 2000 3150 2350
Wire Wire Line
	3150 2350 1750 2350
Wire Wire Line
	1750 2350 1750 2000
Connection ~ 1750 2000
Wire Wire Line
	1750 2000 950  2000
$Comp
L Device:C_Small C?
U 1 1 5F6B4251
P 2300 7350
AR Path="/5CC0D65F/5F6B4251" Ref="C?"  Part="1" 
AR Path="/5F6B4251" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F6B4251" Ref="C1204"  Part="1" 
F 0 "C1204" H 2209 7396 50  0000 R CNN
F 1 "100nF" H 2209 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 7350 50  0001 C CNN
F 3 "~" H 2300 7350 50  0001 C CNN
	1    2300 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01214
U 1 1 5F6B47C5
P 2300 7250
F 0 "#PWR01214" H 2300 7100 50  0001 C CNN
F 1 "+5V" H 2315 7423 50  0000 C CNN
F 2 "" H 2300 7250 50  0001 C CNN
F 3 "" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01218
U 1 1 5F6B4C91
P 2300 7450
F 0 "#PWR01218" H 2300 7200 50  0001 C CNN
F 1 "GND" H 2305 7277 50  0000 C CNN
F 2 "" H 2300 7450 50  0001 C CNN
F 3 "" H 2300 7450 50  0001 C CNN
	1    2300 7450
	1    0    0    -1  
$EndComp
Text Label 5700 1300 2    50   ~ 0
~STI-STROBE
Wire Wire Line
	5700 1300 5700 1350
Wire Wire Line
	4950 1300 5700 1300
Wire Wire Line
	4950 2000 4950 1300
Text Label 3300 2000 2    50   ~ 0
~WPC
$Comp
L alexios:74HC74 U1202
U 1 1 5F6CA555
P 5650 1750
F 0 "U1202" H 5750 2150 50  0000 L CNN
F 1 "74HC74" H 5750 2050 50  0000 L CNN
F 2 "" H 5650 1750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5650 1750 50  0001 C CNN
	1    5650 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01203
U 1 1 5F6CD4CC
P 5150 2050
F 0 "#PWR01203" H 5150 1800 50  0001 C CNN
F 1 "GND" H 5155 1877 50  0000 C CNN
F 2 "" H 5150 2050 50  0001 C CNN
F 3 "" H 5150 2050 50  0001 C CNN
	1    5150 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2800 1750 2800
Text Label 950  2800 0    50   ~ 0
~CLI
Wire Wire Line
	5700 2750 5700 2300
Text Label 2450 2750 0    50   ~ 0
~RESET-OR-CLI
$Comp
L alexios:74AHC1G08 U1203
U 1 1 5F6D6DDF
P 2050 2750
F 0 "U1203" H 1975 3017 50  0000 C CNN
F 1 "74AHC1G08" H 1975 2926 50  0000 C CNN
F 2 "" H 1700 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1700 2750 50  0001 C CNN
	1    2050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2750 2350 2750
$Comp
L alexios:74HC74 U1202
U 2 1 5F6D8D27
P 7800 3000
F 0 "U1202" H 7900 3400 50  0000 L CNN
F 1 "74HC74" H 7900 3300 50  0000 L CNN
F 2 "" H 7800 3000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7800 3000 50  0001 C CNN
	2    7800 3000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U1205
U 3 1 5F6DB546
P 2650 7350
F 0 "U1205" H 2750 7750 50  0000 L CNN
F 1 "74HC74" H 2750 7650 50  0000 L CNN
F 2 "" H 2650 7350 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2650 7350 50  0001 C CNN
	3    2650 7350
	1    0    0    -1  
$EndComp
Connection ~ 2300 7250
Connection ~ 2300 7450
Text Notes 2000 700  0    67   ~ 0
Enable Armed
Text Notes 2950 700  0    67   ~ 0
Enable Strobe Generation
Text Notes 4850 700  0    67   ~ 0
Interrupts Enabled
Text Notes 7650 4050 0    67   ~ 0
IRQ Seen
Wire Wire Line
	5200 1650 5150 1650
Wire Wire Line
	5150 1650 5150 2000
Wire Wire Line
	5200 2000 5150 2000
Connection ~ 5150 2000
Wire Wire Line
	5150 2000 5150 2050
Wire Wire Line
	7350 2900 7300 2900
Wire Wire Line
	7300 2900 7300 3250
$Comp
L power:GND #PWR01205
U 1 1 5F6E5459
P 7300 3300
F 0 "#PWR01205" H 7300 3050 50  0001 C CNN
F 1 "GND" H 7305 3127 50  0000 C CNN
F 2 "" H 7300 3300 50  0001 C CNN
F 3 "" H 7300 3300 50  0001 C CNN
	1    7300 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3250 7300 3250
Connection ~ 7300 3250
Wire Wire Line
	7300 3250 7300 3300
$Comp
L alexios:74HC74 U1204
U 1 1 5F6EBBCA
P 2300 4750
F 0 "U1204" H 2400 5150 50  0000 L CNN
F 1 "74HC74" H 2400 5050 50  0000 L CNN
F 2 "" H 2300 4750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2300 4750 50  0001 C CNN
	1    2300 4750
	1    0    0    -1  
$EndComp
Text Label 950  4650 0    50   ~ 0
~IRQ
Wire Wire Line
	1850 5000 1800 5000
Text Label 950  5000 0    50   ~ 0
CLK4
Wire Wire Line
	2350 4300 2350 4350
$Comp
L power:+5V #PWR01209
U 1 1 5F6F1FC3
P 2150 5300
F 0 "#PWR01209" H 2150 5150 50  0001 C CNN
F 1 "+5V" H 2000 5350 50  0000 C CNN
F 2 "" H 2150 5300 50  0001 C CNN
F 3 "" H 2150 5300 50  0001 C CNN
	1    2150 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5300 2150 5350
Wire Wire Line
	2150 5350 2350 5350
Wire Wire Line
	2350 5350 2350 5300
$Comp
L alexios:74HC74 U1204
U 2 1 5F6F7807
P 3600 4750
F 0 "U1204" H 3700 5150 50  0000 L CNN
F 1 "74HC74" H 3700 5050 50  0000 L CNN
F 2 "" H 3600 4750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3600 4750 50  0001 C CNN
	2    3600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5650 1800 5650
Wire Wire Line
	2900 5000 3150 5000
Text Label 950  5650 0    50   ~ 0
CLK2
Wire Wire Line
	2800 4650 3150 4650
Wire Wire Line
	3650 4300 3650 4350
Wire Wire Line
	3450 5300 3450 5350
Wire Wire Line
	3450 5350 3650 5350
Wire Wire Line
	3650 5350 3650 5300
$Comp
L power:+5V #PWR01210
U 1 1 5F6FF057
P 3450 5300
F 0 "#PWR01210" H 3450 5150 50  0001 C CNN
F 1 "+5V" H 3300 5350 50  0000 C CNN
F 2 "" H 3450 5300 50  0001 C CNN
F 3 "" H 3450 5300 50  0001 C CNN
	1    3450 5300
	1    0    0    -1  
$EndComp
Text Label 4500 4300 0    50   ~ 0
~IRQ-CLK-DOMAIN
$Comp
L alexios:74HC74 U1201
U 3 1 5F70759D
P 3950 7300
F 0 "U1201" H 4050 7700 50  0000 L CNN
F 1 "74HC74" H 4050 7600 50  0000 L CNN
F 2 "" H 3950 7300 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3950 7300 50  0001 C CNN
	3    3950 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F707BE7
P 3600 7300
AR Path="/5CC0D65F/5F707BE7" Ref="C?"  Part="1" 
AR Path="/5F707BE7" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F707BE7" Ref="C1201"  Part="1" 
F 0 "C1201" H 3509 7346 50  0000 R CNN
F 1 "100nF" H 3509 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3600 7300 50  0001 C CNN
F 3 "~" H 3600 7300 50  0001 C CNN
	1    3600 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01211
U 1 1 5F7083B1
P 3600 7200
F 0 "#PWR01211" H 3600 7050 50  0001 C CNN
F 1 "+5V" H 3615 7373 50  0000 C CNN
F 2 "" H 3600 7200 50  0001 C CNN
F 3 "" H 3600 7200 50  0001 C CNN
	1    3600 7200
	1    0    0    -1  
$EndComp
Connection ~ 3600 7200
$Comp
L power:GND #PWR01215
U 1 1 5F708D3E
P 3600 7400
F 0 "#PWR01215" H 3600 7150 50  0001 C CNN
F 1 "GND" H 3605 7227 50  0000 C CNN
F 2 "" H 3600 7400 50  0001 C CNN
F 3 "" H 3600 7400 50  0001 C CNN
	1    3600 7400
	1    0    0    -1  
$EndComp
Connection ~ 3600 7400
Text Label 2950 5000 0    50   ~ 0
CLK2
NoConn ~ 2800 5000
Wire Wire Line
	950  2700 1750 2700
Wire Wire Line
	2350 2300 2350 2750
Connection ~ 2350 2750
Text HLabel 900  4650 0    50   Input ~ 0
~IRQ
Text HLabel 900  2700 0    50   Input ~ 0
~RESET
Text HLabel 900  2800 0    50   Input ~ 0
~CLI
Text HLabel 900  2000 0    50   Input ~ 0
~WPC
Text HLabel 900  1300 0    50   Input ~ 0
~STI
Text HLabel 900  6300 0    50   Input ~ 0
~END
Wire Notes Line
	5300 4000 5300 6150
Wire Notes Line
	1350 4000 1350 6150
Wire Notes Line
	1350 4000 5300 4000
Text Notes 1400 4150 0    50   ~ 0
~IRQ~ Clock Domain transition
Wire Wire Line
	2350 2750 3100 2750
Wire Wire Line
	6150 1650 6750 1650
Wire Wire Line
	6750 1650 6750 3850
Wire Wire Line
	6750 3850 3100 3850
Wire Wire Line
	3100 3850 3100 4300
Text Label 6150 1650 0    50   ~ 0
IRQEN
Text Label 2350 4300 0    50   ~ 0
IRQEN
Text Label 3650 4300 2    50   ~ 0
IRQEN
Text Notes 1400 3600 0    50   ~ 0
Because the CFT lacks a single Return from Interrupt instruction, the end of an\nInterrupt Service Routine (ISR ) is signalled by calling STI to re-enable interrupts,\nthen RETurning. So, an interrupt can cause the ISR to be re-entered before its\nprevious execution is done! This is mitigated in hardware. The FSM delays obeying\nthe STI instruction until the PC is next written to (JMP instructions).\n\nCondition: ~WPC~ & ~STI~ should not be asserted simultaneously.
Text Notes 1400 6050 0    50   ~ 0
To avoid metastability, bring the asynchronous ~IRQ~ signal into the CFT's clock\ndomain. CLK4 and CLK2 are the same clock, 90° apart. This delays an Interrupt\nRequest by 125–250 ns.
$Comp
L Jumper:SolderJumper_3_Bridged12 JP1201
U 1 1 5F77319E
P 1800 5400
F 0 "JP1201" V 1800 5467 50  0000 L CNN
F 1 "SolderJumper_3_Bridged12" H 1800 5514 50  0001 C CNN
F 2 "" H 1800 5400 50  0001 C CNN
F 3 "~" H 1800 5400 50  0001 C CNN
	1    1800 5400
	0    -1   1    0   
$EndComp
Connection ~ 1800 5000
Wire Wire Line
	1800 5000 900  5000
Wire Wire Line
	1800 5650 1800 5600
Wire Wire Line
	1800 5000 1800 5200
Wire Wire Line
	1950 5400 2900 5400
Wire Wire Line
	2900 5400 2900 5000
Text HLabel 900  5000 0    50   Input ~ 0
CLK4
Text HLabel 900  5650 0    50   Input ~ 0
CLK2
Wire Notes Line
	1350 6150 5300 6150
Wire Wire Line
	900  4650 1850 4650
Connection ~ 3100 4300
Wire Wire Line
	3100 4300 3650 4300
Wire Wire Line
	2350 4300 3100 4300
Wire Notes Line
	1350 850  1350 3650
Wire Notes Line
	1350 3650 5050 3650
Wire Notes Line
	5050 3650 5050 850 
Wire Notes Line
	5050 850  1350 850 
Text Notes 1400 1000 0    50   ~ 0
Enabling Interrupts (~STI~)
Text Notes 1350 3900 0    67   ~ 0
Incoming Interrupt Requests
Text Label 6150 2000 0    50   ~ 0
IRQENLED
$Comp
L Connector:TestPoint TP1201
U 1 1 5F82539B
P 2950 1150
F 0 "TP1201" H 3008 1222 50  0000 L CNN
F 1 "TestPoint" H 3008 1177 50  0001 L CNN
F 2 "" H 3150 1150 50  0001 C CNN
F 3 "~" H 3150 1150 50  0001 C CNN
	1    2950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1150 2950 1650
Connection ~ 2950 1650
Wire Wire Line
	2950 1650 3300 1650
Text Label 2950 1600 1    50   ~ 0
STI-SEEN
$Comp
L alexios:74HC74 U1205
U 1 1 5F8432B4
P 6300 4750
F 0 "U1205" H 6400 4300 50  0000 L CNN
F 1 "74HC74" H 6400 4200 50  0000 L CNN
F 2 "" H 6300 4750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6300 4750 50  0001 C CNN
	1    6300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4650 4200 4650
Wire Wire Line
	5850 4650 5850 5000
Connection ~ 5850 5000
$Comp
L alexios:74HC74 U1205
U 2 1 5F85D9E4
P 7800 4750
F 0 "U1205" H 7900 4300 50  0000 L CNN
F 1 "74HC74" H 7900 4200 50  0000 L CNN
F 2 "" H 7800 4750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7800 4750 50  0001 C CNN
	2    7800 4750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U1202
U 3 1 5F85E5AB
P 5250 7300
F 0 "U1202" H 5350 7700 50  0000 L CNN
F 1 "74HC74" H 5350 7600 50  0000 L CNN
F 2 "" H 5250 7300 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5250 7300 50  0001 C CNN
	3    5250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F85ED41
P 4900 7300
AR Path="/5CC0D65F/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F85ED41" Ref="C?"  Part="1" 
AR Path="/5F67D4B5/5F85ED41" Ref="C1202"  Part="1" 
F 0 "C1202" H 4809 7346 50  0000 R CNN
F 1 "100nF" H 4809 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4900 7300 50  0001 C CNN
F 3 "~" H 4900 7300 50  0001 C CNN
	1    4900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01212
U 1 1 5F85F21B
P 4900 7200
F 0 "#PWR01212" H 4900 7050 50  0001 C CNN
F 1 "+5V" H 4915 7373 50  0000 C CNN
F 2 "" H 4900 7200 50  0001 C CNN
F 3 "" H 4900 7200 50  0001 C CNN
	1    4900 7200
	1    0    0    -1  
$EndComp
Connection ~ 4900 7200
$Comp
L power:GND #PWR01216
U 1 1 5F85F700
P 4900 7400
F 0 "#PWR01216" H 4900 7150 50  0001 C CNN
F 1 "GND" H 4905 7227 50  0000 C CNN
F 2 "" H 4900 7400 50  0001 C CNN
F 3 "" H 4900 7400 50  0001 C CNN
	1    4900 7400
	1    0    0    -1  
$EndComp
Connection ~ 4900 7400
Text Notes 6100 4050 0    67   ~ 0
IRQ Armed
Wire Wire Line
	6350 4300 6350 4350
Wire Wire Line
	5850 5000 5850 5100
$Comp
L power:GND #PWR01208
U 1 1 5F855FA0
P 5850 5100
F 0 "#PWR01208" H 5850 4850 50  0001 C CNN
F 1 "GND" H 5855 4927 50  0000 C CNN
F 2 "" H 5850 5100 50  0001 C CNN
F 3 "" H 5850 5100 50  0001 C CNN
	1    5850 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5300 6350 5450
Wire Wire Line
	6350 5450 5700 5450
Wire Wire Line
	5700 5450 5700 2750
Connection ~ 5700 2750
Text Label 6400 5450 0    50   ~ 0
~RESET-OR-CLI
Text Label 950  6300 0    50   ~ 0
~END
Wire Wire Line
	7100 6300 7100 5000
Wire Wire Line
	7100 5000 7350 5000
Wire Wire Line
	900  6300 7100 6300
Text Label 7350 5000 2    50   ~ 0
~END
$Comp
L power:+5V #PWR01207
U 1 1 5F8B0630
P 7850 4350
F 0 "#PWR01207" H 7850 4200 50  0001 C CNN
F 1 "+5V" H 7865 4523 50  0000 C CNN
F 2 "" H 7850 4350 50  0001 C CNN
F 3 "" H 7850 4350 50  0001 C CNN
	1    7850 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5450 7850 5450
Wire Wire Line
	7850 5450 7850 5300
Connection ~ 6350 5450
Text Label 7350 4650 2    50   ~ 0
IRQ-ARMED
Wire Wire Line
	6800 4650 6850 4650
$Comp
L Connector:TestPoint TP1207
U 1 1 5F8C939B
P 6350 4300
F 0 "TP1207" H 6408 4372 50  0000 L CNN
F 1 "TestPoint" H 6408 4327 50  0001 L CNN
F 2 "" H 6550 4300 50  0001 C CNN
F 3 "~" H 6550 4300 50  0001 C CNN
	1    6350 4300
	1    0    0    -1  
$EndComp
Connection ~ 6350 4300
Wire Wire Line
	8300 5000 8550 5000
Text HLabel 8700 5000 2    50   Output ~ 0
~IRQS
Text Label 8300 5000 0    50   ~ 0
~IRQS
$Comp
L power:+5V #PWR01204
U 1 1 5F90DF9A
P 7850 2600
F 0 "#PWR01204" H 7850 2450 50  0001 C CNN
F 1 "+5V" H 7865 2773 50  0000 C CNN
F 2 "" H 7850 2600 50  0001 C CNN
F 3 "" H 7850 2600 50  0001 C CNN
	1    7850 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01206
U 1 1 5F90E234
P 7550 3600
F 0 "#PWR01206" H 7550 3450 50  0001 C CNN
F 1 "+5V" H 7565 3773 50  0000 C CNN
F 2 "" H 7550 3600 50  0001 C CNN
F 3 "" H 7550 3600 50  0001 C CNN
	1    7550 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3600 7850 3550
$Comp
L Connector:TestPoint TP1209
U 1 1 5F9307F3
P 8550 4900
F 0 "TP1209" H 8608 4972 50  0000 L CNN
F 1 "TestPoint" H 8608 4927 50  0001 L CNN
F 2 "" H 8750 4900 50  0001 C CNN
F 3 "~" H 8750 4900 50  0001 C CNN
	1    8550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4900 8550 5000
Connection ~ 8550 5000
Wire Wire Line
	8550 5000 8700 5000
$Comp
L Connector:TestPoint TP1210
U 1 1 5F9349A9
P 4100 5000
F 0 "TP1210" V 4100 5188 50  0000 L CNN
F 1 "TestPoint" H 4158 5027 50  0001 L CNN
F 2 "" H 4300 5000 50  0001 C CNN
F 3 "~" H 4300 5000 50  0001 C CNN
	1    4100 5000
	0    1    1    0   
$EndComp
Text Label 4450 1600 1    50   ~ 0
STI-STROBE
Wire Wire Line
	4450 1650 4450 1150
Wire Wire Line
	4250 1650 4450 1650
$Comp
L alexios:74HC74 U1201
U 2 1 5F67FE3C
P 3750 1750
F 0 "U1201" H 3850 2150 50  0000 L CNN
F 1 "74HC74" H 3850 2050 50  0000 L CNN
F 2 "" H 3750 1750 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3750 1750 50  0001 C CNN
	2    3750 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1202
U 1 1 5F82F1E7
P 4450 1150
F 0 "TP1202" H 4508 1222 50  0000 L CNN
F 1 "TestPoint" H 4508 1177 50  0001 L CNN
F 2 "" H 4650 1150 50  0001 C CNN
F 3 "~" H 4650 1150 50  0001 C CNN
	1    4450 1150
	1    0    0    -1  
$EndComp
Text Notes 3550 2500 0    50   ~ 0
Edge detects ~STI~.
Wire Notes Line style solid
	4475 2050 4550 2050
Wire Notes Line style solid
	4475 2150 4475 2050
Wire Notes Line style solid
	4450 2150 4475 2150
Wire Notes Line style solid
	4450 2050 4450 2150
Wire Notes Line style solid
	4400 2050 4450 2050
Wire Wire Line
	4250 2000 4300 2000
Wire Wire Line
	4300 2000 4300 2350
Text Label 4800 2000 2    50   ~ 0
~STI-STROBE
Wire Wire Line
	3800 2350 3800 2300
Wire Wire Line
	3800 2350 4300 2350
$Comp
L power:+5V #PWR01201
U 1 1 5F6BEE3F
P 3800 1350
F 0 "#PWR01201" H 3800 1200 50  0001 C CNN
F 1 "+5V" H 3815 1523 50  0000 C CNN
F 2 "" H 3800 1350 50  0001 C CNN
F 3 "" H 3800 1350 50  0001 C CNN
	1    3800 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2000 4950 2000
Connection ~ 4300 2000
$Comp
L Connector:TestPoint TP1205
U 1 1 5F95343A
P 2800 2000
F 0 "TP1205" V 2900 1950 50  0000 L CNN
F 1 "TestPoint" H 2858 2027 50  0001 L CNN
F 2 "" H 3000 2000 50  0001 C CNN
F 3 "~" H 3000 2000 50  0001 C CNN
	1    2800 2000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP1203
U 1 1 5F95541F
P 4950 1150
F 0 "TP1203" H 5008 1222 50  0000 L CNN
F 1 "TestPoint" H 5008 1177 50  0001 L CNN
F 2 "" H 5150 1150 50  0001 C CNN
F 3 "~" H 5150 1150 50  0001 C CNN
	1    4950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1150 4950 1300
Connection ~ 4950 1300
Wire Wire Line
	4200 4300 6350 4300
Wire Wire Line
	4200 4300 4200 4650
$Comp
L Connector:TestPoint TP1208
U 1 1 5F95D835
P 6850 4300
F 0 "TP1208" H 6908 4372 50  0000 L CNN
F 1 "TestPoint" H 6908 4327 50  0001 L CNN
F 2 "" H 7050 4300 50  0001 C CNN
F 3 "~" H 7050 4300 50  0001 C CNN
	1    6850 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4300 6850 4650
Connection ~ 6850 4650
Wire Wire Line
	6850 4650 7350 4650
$Comp
L Connector:TestPoint TP1206
U 1 1 5F961485
P 3100 2650
F 0 "TP1206" H 3158 2722 50  0000 L CNN
F 1 "TestPoint" H 3158 2677 50  0001 L CNN
F 2 "" H 3300 2650 50  0001 C CNN
F 3 "~" H 3300 2650 50  0001 C CNN
	1    3100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2650 3100 2750
Connection ~ 3100 2750
Wire Wire Line
	3100 2750 5700 2750
NoConn ~ 8300 2900
NoConn ~ 8300 3250
Text Notes 8750 5450 0    50   ~ 0
~IRQS~ is Interrupt Seen. It's sent to the Control Unit\nto run the Interrupt microprogram. It also doubles\nas the Interrupt acknowledge signal on the CFT Bus.
Wire Wire Line
	8300 4650 8700 4650
Text HLabel 8700 4650 2    50   Output ~ 0
FPIRQS
Text Label 8300 4650 0    50   ~ 0
FPIRQS
NoConn ~ 6800 5000
Text Notes 8750 2350 0    50   ~ 0
This is the Interrupt Flag (interrupt handling enabled)\ndisplayed on the front panel.
Wire Wire Line
	7550 3600 7850 3600
Wire Wire Line
	8500 2000 8700 2000
Connection ~ 8500 2000
Wire Wire Line
	8500 1900 8500 2000
Text HLabel 8700 2000 2    50   Output ~ 0
FPFI
Wire Wire Line
	6150 2000 8500 2000
$Comp
L Connector:TestPoint TP1204
U 1 1 5F8358D4
P 8500 1900
F 0 "TP1204" H 8558 1972 50  0000 L CNN
F 1 "TestPoint" H 8558 1927 50  0001 L CNN
F 2 "" H 8700 1900 50  0001 C CNN
F 3 "~" H 8700 1900 50  0001 C CNN
	1    8500 1900
	1    0    0    -1  
$EndComp
Text Notes 7150 7000 0    197  ~ 39
Interrupt State Machine
$EndSCHEMATC
