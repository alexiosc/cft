EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 20 20
Title "Wait State & MCU Interrupts"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC112 U?
U 3 1 6163847A
P 3200 7300
AR Path="/6163847A" Ref="U?"  Part="3" 
AR Path="/614F5B8D/6163847A" Ref="U41"  Part="3" 
F 0 "U41" H 3080 7546 50  0000 L CNN
F 1 "74HC112" H 3080 7455 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 2900 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 2900 6950 50  0001 C CNN
	3    3200 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61638480
P 5450 7100
AR Path="/61638480" Ref="C?"  Part="1" 
AR Path="/614F5B8D/61638480" Ref="C43"  Part="1" 
F 0 "C43" H 5359 7146 50  0000 R CNN
F 1 "100nF" H 5359 7055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 7100 50  0001 C CNN
F 3 "~" H 5450 7100 50  0001 C CNN
	1    5450 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61638486
P 5450 7000
AR Path="/61638486" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638486" Ref="#PWR0197"  Part="1" 
F 0 "#PWR0197" H 5450 6850 50  0001 C CNN
F 1 "+5V" H 5465 7173 50  0000 C CNN
F 2 "" H 5450 7000 50  0001 C CNN
F 3 "" H 5450 7000 50  0001 C CNN
	1    5450 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6163848C
P 5450 7200
AR Path="/6163848C" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163848C" Ref="#PWR0198"  Part="1" 
F 0 "#PWR0198" H 5450 6950 50  0001 C CNN
F 1 "GND" H 5455 7027 50  0000 C CNN
F 2 "" H 5450 7200 50  0001 C CNN
F 3 "" H 5450 7200 50  0001 C CNN
	1    5450 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61638492
P 1200 7100
AR Path="/61638492" Ref="C?"  Part="1" 
AR Path="/614F5B8D/61638492" Ref="C40"  Part="1" 
F 0 "C40" H 1291 7054 50  0000 L CNN
F 1 "100nF" H 1291 7145 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 7100 50  0001 C CNN
F 3 "~" H 1200 7100 50  0001 C CNN
	1    1200 7100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61638498
P 1200 7000
AR Path="/61638498" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638498" Ref="#PWR0187"  Part="1" 
F 0 "#PWR0187" H 1200 6850 50  0001 C CNN
F 1 "+5V" H 1215 7173 50  0000 C CNN
F 2 "" H 1200 7000 50  0001 C CNN
F 3 "" H 1200 7000 50  0001 C CNN
	1    1200 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6163849E
P 1200 7200
AR Path="/6163849E" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163849E" Ref="#PWR0188"  Part="1" 
F 0 "#PWR0188" H 1200 6950 50  0001 C CNN
F 1 "GND" H 1205 7027 50  0000 C CNN
F 2 "" H 1200 7200 50  0001 C CNN
F 3 "" H 1200 7200 50  0001 C CNN
	1    1200 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 616384A4
P 2550 7100
AR Path="/616384A4" Ref="C?"  Part="1" 
AR Path="/614F5B8D/616384A4" Ref="C62"  Part="1" 
F 0 "C62" H 2641 7054 50  0000 L CNN
F 1 "100nF" H 2641 7145 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 7100 50  0001 C CNN
F 3 "~" H 2550 7100 50  0001 C CNN
	1    2550 7100
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616384AA
P 2550 7000
AR Path="/616384AA" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384AA" Ref="#PWR0191"  Part="1" 
F 0 "#PWR0191" H 2550 6850 50  0001 C CNN
F 1 "+5V" H 2565 7173 50  0000 C CNN
F 2 "" H 2550 7000 50  0001 C CNN
F 3 "" H 2550 7000 50  0001 C CNN
	1    2550 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616384B0
P 2550 7200
AR Path="/616384B0" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/616384B0" Ref="#PWR0192"  Part="1" 
F 0 "#PWR0192" H 2550 6950 50  0001 C CNN
F 1 "GND" H 2555 7027 50  0000 C CNN
F 2 "" H 2550 7200 50  0001 C CNN
F 3 "" H 2550 7200 50  0001 C CNN
	1    2550 7200
	1    0    0    -1  
$EndComp
Connection ~ 2550 7000
Connection ~ 2550 7200
$Comp
L alexios:74LVC1G07 U?
U 2 1 616384C0
P 5800 7000
AR Path="/616384C0" Ref="U?"  Part="2" 
AR Path="/614F5B8D/616384C0" Ref="U43"  Part="2" 
F 0 "U43" H 5980 6946 50  0000 L CNN
F 1 "74LVC1G07" H 5980 6855 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5875 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5875 7000 50  0001 C CNN
	2    5800 7000
	1    0    0    -1  
$EndComp
Connection ~ 5450 7000
Connection ~ 5450 7200
Text Notes 8600 1950 0    100  ~ 20
Wait State Generator
Text Notes 2250 3350 0    50   ~ 0
Decodes I/O Space &0100–&011F
Wire Wire Line
	7550 2500 7650 2500
$Comp
L Device:R_Small R36
U 1 1 5DB1351D
P 7750 2500
F 0 "R36" V 7554 2500 50  0000 C CNN
F 1 "30Ω" V 7645 2500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 2500 50  0001 C CNN
F 3 "~" H 7750 2500 50  0001 C CNN
	1    7750 2500
	0    1    1    0   
$EndComp
Text Label 7900 1700 2    50   ~ 0
~IOINT
Text HLabel 1200 1650 0    50   Input ~ 0
AB[5..7]
Text Label 1250 1650 0    50   ~ 0
AB[5..7]
Wire Bus Line
	1650 1650 1200 1650
Entry Bus Bus
	1650 1650 1750 1750
Text HLabel 1200 2400 0    50   Input ~ 0
~IODEV1xx
Text HLabel 1200 3700 0    50   Input ~ 0
CLRWS
Text HLabel 1200 2500 0    50   Input ~ 0
~DBOE0
Text HLabel 1200 2600 0    50   3State ~ 0
~R
Text HLabel 8000 1700 2    50   Output ~ 0
~IOINT
Connection ~ 5500 2100
Wire Wire Line
	5500 1700 8000 1700
Wire Wire Line
	5500 2100 5500 1700
Text Label 1250 3700 0    50   ~ 0
CLRWS
$Comp
L alexios:74LVC1G07 U?
U 1 1 616384BA
P 7250 2500
AR Path="/616384BA" Ref="U?"  Part="1" 
AR Path="/614F5B8D/616384BA" Ref="U43"  Part="1" 
F 0 "U43" H 7300 2767 50  0000 C CNN
F 1 "74LVC1G07" H 7300 2676 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7325 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7325 2500 50  0001 C CNN
	1    7250 2500
	1    0    0    -1  
$EndComp
NoConn ~ 6950 2100
NoConn ~ 5400 2100
$Comp
L power:GND #PWR?
U 1 1 6163846A
P 6000 2200
AR Path="/6163846A" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163846A" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 6000 1950 50  0001 C CNN
F 1 "GND" V 5950 2100 50  0000 R CNN
F 2 "" H 6000 2200 50  0001 C CNN
F 3 "" H 6000 2200 50  0001 C CNN
	1    6000 2200
	0    1    1    0   
$EndComp
Text Label 5650 2100 0    50   ~ 0
~IOINT
Text Label 5650 2300 0    50   ~ 0
CLRWS
Text Label 4800 3700 0    50   ~ 0
CLRWS
Wire Wire Line
	6000 2300 5600 2300
Connection ~ 5950 2400
Wire Wire Line
	5950 2500 6000 2500
Wire Wire Line
	5950 2400 5950 2500
Wire Wire Line
	6000 2400 5950 2400
$Comp
L power:+5V #PWR?
U 1 1 6163845B
P 5950 2400
AR Path="/6163845B" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/6163845B" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 5950 2250 50  0001 C CNN
F 1 "+5V" V 5965 2528 50  0000 L CNN
F 2 "" H 5950 2400 50  0001 C CNN
F 3 "" H 5950 2400 50  0001 C CNN
	1    5950 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 2500 4400 2750
Wire Wire Line
	4450 2500 4400 2500
Wire Wire Line
	5400 2500 5500 2500
Wire Wire Line
	5500 2100 5500 2500
Wire Wire Line
	6000 2100 5500 2100
$Comp
L alexios:74HC112 U?
U 2 1 6163844D
P 6800 2050
AR Path="/6163844D" Ref="U?"  Part="2" 
AR Path="/614F5B8D/6163844D" Ref="U41"  Part="2" 
F 0 "U41" H 6475 2267 50  0000 C CNN
F 1 "74HC112" H 6475 2176 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6500 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 6500 1700 50  0001 C CNN
	2    6800 2050
	1    0    0    -1  
$EndComp
Text HLabel 8100 2500 2    50   3State ~ 0
~WS
Text Label 8050 2500 2    50   ~ 0
~WS
Wire Wire Line
	7850 2500 8100 2500
Wire Wire Line
	4300 2300 4450 2300
Wire Wire Line
	4300 2100 4300 2300
$Comp
L power:GND #PWR?
U 1 1 61638441
P 4450 2400
AR Path="/61638441" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638441" Ref="#PWR0196"  Part="1" 
F 0 "#PWR0196" H 4450 2150 50  0001 C CNN
F 1 "GND" V 4550 2300 50  0000 R CNN
F 2 "" H 4450 2400 50  0001 C CNN
F 3 "" H 4450 2400 50  0001 C CNN
	1    4450 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 2100 4400 2200
Connection ~ 4400 2100
Wire Wire Line
	4450 2100 4400 2100
Wire Wire Line
	4400 2200 4450 2200
Wire Wire Line
	4400 2050 4400 2100
$Comp
L power:+5V #PWR?
U 1 1 61638436
P 4400 2050
AR Path="/61638436" Ref="#PWR?"  Part="1" 
AR Path="/614F5B8D/61638436" Ref="#PWR0195"  Part="1" 
F 0 "#PWR0195" H 4400 1900 50  0001 C CNN
F 1 "+5V" H 4415 2223 50  0000 C CNN
F 2 "" H 4400 2050 50  0001 C CNN
F 3 "" H 4400 2050 50  0001 C CNN
	1    4400 2050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U?
U 1 1 61638430
P 5250 2050
AR Path="/61638430" Ref="U?"  Part="1" 
AR Path="/614F5B8D/61638430" Ref="U41"  Part="1" 
F 0 "U41" H 4925 2267 50  0000 C CNN
F 1 "74HC112" H 4925 2176 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 4950 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 4950 1700 50  0001 C CNN
	1    5250 2050
	1    0    0    -1  
$EndComp
Text Notes 8600 2850 0    50   ~ 0
When the DFP is addressed at I/O space &0100–&011F,\na flip flop is set, asserting a Wait State ~WS~.\nSimultaneously, the MCU is interrupted to service the\nbus request by asserting ~IOINT~.\n\nOnce the request has been service, the MCU strobes\nCLRWS, which clears the Wait State and the processor\ncan move on.\n\nThis is obviously very slow.
Wire Notes Line width 12 style solid
	10900 1650 8450 1650
Wire Notes Line width 12 style solid
	8450 1650 8450 3000
Wire Notes Line width 12 style solid
	8450 3000 10900 3000
Wire Notes Line width 12 style solid
	10900 3000 10900 1650
Text Notes 2250 1500 0    100  ~ 20
Address Decoder &\nData Bus Enable
Text Notes 4350 1500 0    100  ~ 20
Wait State Generation & Microcontroller Interrupts
Text Notes 7550 4250 0    100  ~ 20
Autonomic Data Bus Driver
Text Notes 7550 5050 0    50   ~ 0
The '251 is configured as an arbitrary function generator. It\nenables the Data Bus driver when the CFT is addressing the DFP\nfor reading, or when the MCU asserts ~DBOE~ to take control of\nthe Data Bus.\n\nDriving is done autonomically rather than purely under MCU\nprogrammatic control in an effort to speed up reporting values to\nthe CFT when it performs DFP register reads.
Wire Notes Line width 12 style solid
	10300 3950 7400 3950
Wire Notes Line width 12 style solid
	7400 3950 7400 5200
Wire Notes Line width 12 style solid
	7400 5200 10300 5200
Wire Notes Line width 12 style solid
	10300 5200 10300 3950
Text Notes 8050 6200 0    50   ~ 0
~DBOE~\n\n  0\n  1\n  0\n  1\n  0\n  1\n  0\n  1
Text Notes 7900 6200 0    50   ~ 0
~R~\n\n0\n0\n1\n1\n0\n0\n1\n1
Text Notes 7500 6200 0    50   ~ 0
~DFPSEL~\n\n   0\n   0\n   0\n   0\n   1\n   1\n   1\n   1
Text Notes 8450 6200 0    50   ~ 0
~DBOE1~\n\n  0\n  0\n  0\n  1\n  0\n  1\n  0\n  1
Wire Notes Line width 12 style solid
	7400 5340 8800 5340
Wire Notes Line width 12 style solid
	7400 6250 8800 6250
Wire Notes Line width 12 style solid
	7400 6250 7400 5340
Wire Notes Line width 12 style solid
	7400 5510 8800 5510
Wire Notes Line width 12 style solid
	8800 6250 8800 5340
Wire Notes Line
	8360 6250 8360 5330
Wire Wire Line
	2450 2400 1200 2400
Wire Wire Line
	2450 2500 1200 2500
Text Label 1900 2400 0    50   ~ 0
~IODEV1xx
Text Label 1900 2300 0    50   ~ 0
AB7
Text Label 1900 2200 0    50   ~ 0
AB6
Text Label 1900 2100 0    50   ~ 0
AB5
Text Label 1900 2500 0    50   ~ 0
~DBOE0
Text Label 1900 2600 0    50   ~ 0
~R
Text Label 3800 2100 2    50   ~ 0
~DFPSEL
Wire Wire Line
	3900 2800 3350 2800
Text Label 3800 2800 2    50   ~ 0
~DBOE1
Wire Wire Line
	1200 2600 2450 2600
Entry Wire Line
	1850 2100 1750 2000
Entry Wire Line
	1850 2200 1750 2100
Entry Wire Line
	1850 2300 1750 2200
$Comp
L alexios:ATF16V8B U40
U 2 1 60F337DD
P 1550 7100
F 0 "U40" H 1730 7146 50  0000 L CNN
F 1 "ATF16V8B" H 1730 7055 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 1550 7100 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 1550 7100 50  0001 C CNN
F 4 "SIGNTR" V 1550 7150 50  0001 C CNB "Signature"
F 5 "dfp-decode.jed" H 1730 7009 50  0001 L CNN "Image Filename"
	2    1550 7100
	1    0    0    -1  
$EndComp
Connection ~ 1200 7200
Connection ~ 1200 7000
Wire Wire Line
	1850 2100 2450 2100
Wire Wire Line
	1850 2200 2450 2200
Wire Wire Line
	1850 2300 2450 2300
Wire Wire Line
	3350 2100 4300 2100
Wire Wire Line
	1200 3700 5600 3700
$Comp
L Device:R_Small R14
U 1 1 60F902A7
P 4900 2750
F 0 "R14" V 5004 2750 50  0000 C CNN
F 1 "1kΩ?" V 5095 2750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 2750 50  0001 C CNN
F 3 "~" H 4900 2750 50  0001 C CNN
	1    4900 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 2750 4800 2750
Text Notes 5900 3050 0    100  ~ 20
Autonomic Data Bus Driver
Text HLabel 3900 2800 2    50   Output ~ 0
~DBOE1
Wire Wire Line
	6950 2500 7000 2500
Wire Wire Line
	7000 2500 7000 2750
Connection ~ 7000 2500
Wire Wire Line
	7000 2500 7050 2500
Wire Wire Line
	5000 2750 7000 2750
Wire Wire Line
	3350 2700 3900 2700
Wire Wire Line
	3350 2600 3900 2600
Wire Wire Line
	3350 2400 3900 2400
Wire Wire Line
	3350 2500 3900 2500
Text Label 3800 2700 2    50   ~ 0
~WEN0
Text Label 3800 2600 2    50   ~ 0
~WEN1
Text Label 3800 2400 2    50   ~ 0
~REN0
Text Label 3800 2500 2    50   ~ 0
~REN1
Text HLabel 3900 2700 2    50   Output ~ 0
~WEN0
Text HLabel 3900 2600 2    50   Output ~ 0
~WEN1
Text HLabel 3900 2400 2    50   Output ~ 0
~REN0
Text HLabel 3900 2500 2    50   Output ~ 0
~REN1
Text Notes 2250 3550 0    50   ~ 0
Also decodes µCU XMEM A6 line\nfor DFP reads/writes.
Wire Wire Line
	5600 2300 5600 3700
$Comp
L alexios:ATF16V8B U40
U 1 1 60F2558F
P 2900 2550
F 0 "U40" H 2900 3300 50  0000 C CNN
F 1 "ATF16V8B" H 2900 3200 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2900 2550 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2900 2550 50  0001 C CNN
F 4 "DFPDEC" V 2900 2600 50  0000 C CNB "Signature"
F 5 "dfp-decode.jed" H 2900 1900 50  0000 C CNN "Image Filename"
	1    2900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2700 1850 2700
Wire Wire Line
	2450 2800 1850 2800
Wire Wire Line
	2450 2900 1850 2900
Wire Wire Line
	2450 3000 1850 3000
Text Label 1900 3000 0    50   ~ 0
FPA3
Text Label 1900 2900 0    50   ~ 0
FPA4
Text Label 1900 2800 0    50   ~ 0
FPA5
Text Label 1900 2700 0    50   ~ 0
FPA6
Entry Wire Line
	1850 2900 1750 3000
Entry Wire Line
	1850 2800 1750 2900
Entry Wire Line
	1850 2700 1750 2800
Entry Wire Line
	1850 3000 1750 3100
Entry Wire Line
	1850 2900 1750 3000
Entry Wire Line
	1850 2800 1750 2900
Text HLabel 1200 3450 0    50   Input ~ 0
FPA[0..7]
Text Label 1250 3450 0    50   ~ 0
FPA[0..7]
Wire Bus Line
	1650 3450 1200 3450
Entry Bus Bus
	1650 3450 1750 3350
Wire Bus Line
	1750 1750 1750 2200
Wire Bus Line
	1750 2800 1750 3350
$EndSCHEMATC
