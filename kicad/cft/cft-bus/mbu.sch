EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title "Memory Bank Unit"
Date ""
Rev "2006"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 "mbu.v"
$EndDescr
Text Notes -3650 1900 0    100  ~ 20
Address Decoding
$Comp
L alexios:IS61C64AL U15
U 1 1 5EA76CCD
P 7600 -3350
F 0 "U15" H 7600 -2183 50  0000 C CNN
F 1 "IS61C64AL" H 7600 -2274 50  0000 C CNN
F 2 "alexios:SOJ-28_300mil_50mil" V 7500 -3325 50  0001 C CNN
F 3 "https://www.mouser.co.uk/datasheet/2/198/61C64AL-258428.pdf" H 7500 -3250 50  0001 C CNN
F 4 "870-IS61C64AL10JLITR; €1.11" H 6950 -4400 50  0001 L CNN "AC:BOM-Mouser"
	1    7600 -3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 -3950 7050 -3950
Wire Wire Line
	7050 -3950 7050 -3850
Wire Wire Line
	7100 -3850 7050 -3850
Connection ~ 7050 -3850
Wire Wire Line
	7050 -3850 7050 -3750
Wire Wire Line
	7100 -3750 7050 -3750
Connection ~ 7050 -3750
Wire Wire Line
	7050 -3750 7050 -3650
Wire Wire Line
	7100 -3650 7050 -3650
Connection ~ 7050 -3650
Wire Wire Line
	7050 -3650 7050 -3550
Wire Wire Line
	7100 -3550 7050 -3550
Connection ~ 7050 -3550
Wire Wire Line
	7050 -3550 7050 -3450
Wire Wire Line
	7100 -3450 7050 -3450
Connection ~ 7050 -3450
Wire Wire Line
	7050 -3450 7050 -3350
Wire Wire Line
	7100 -3350 7050 -3350
Connection ~ 7050 -3350
Wire Wire Line
	7050 -3350 7050 -3250
Wire Wire Line
	7100 -3250 7050 -3250
Connection ~ 7050 -3250
Wire Wire Line
	7050 -3250 7050 -3150
Wire Wire Line
	7100 -3150 7050 -3150
Connection ~ 7050 -3150
Wire Wire Line
	7050 -3150 7050 -3050
Wire Wire Line
	7100 -3050 7050 -3050
Wire Wire Line
	7100 -2750 6800 -2750
Text Label 6800 -2750 0    50   ~ 0
~RMBR
Wire Wire Line
	7100 -2650 6800 -2650
Text Label 6800 -2650 0    50   ~ 0
~WMBR
Wire Wire Line
	7100 -4250 6800 -4250
Wire Wire Line
	7100 -4150 6800 -4150
Wire Wire Line
	7100 -4050 6800 -4050
Text Label 6850 -4250 0    50   ~ 0
SEL0
Text Label 6850 -4150 0    50   ~ 0
SEL1
Text Label 6850 -4050 0    50   ~ 0
SEL2
Wire Wire Line
	2100 -5900 1800 -5900
Wire Wire Line
	2100 -5800 1800 -5800
Wire Wire Line
	2100 -5700 1800 -5700
Wire Wire Line
	2100 -5300 1800 -5300
Wire Wire Line
	2100 -5200 1800 -5200
Text Label 1800 -5900 0    50   ~ 0
RADDR0
Text Label 1800 -5800 0    50   ~ 0
RADDR1
Text Label 1800 -5700 0    50   ~ 0
RADDR2
Text Label 1800 -5300 0    50   ~ 0
RADDR3
Text Label 1800 -5200 0    50   ~ 0
RADDR4
Text Notes 2650 -5250 1    50   ~ 10
RADDR=01XXX
$Comp
L alexios:74HC138 U?
U 1 1 5EDE7D4D
P -2850 6600
AR Path="/5F3EA987/5EDE7D4D" Ref="U?"  Part="1" 
AR Path="/5EDE7D4D" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7D4D" Ref="U17"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5EDE7D4D" Ref="U?"  Part="1" 
F 0 "U17" H -2850 7267 50  0000 C CNN
F 1 "74HC138" H -2850 7176 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2850 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2850 6600 50  0001 C CNN
	1    -2850 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3350 6400 -3750 6400
Text Label -3750 6400 0    50   ~ 0
WADDR4
NoConn ~ -2350 6400
NoConn ~ -2350 6500
NoConn ~ -2350 6600
NoConn ~ -2350 6700
NoConn ~ -2350 6800
Text Notes -2800 6850 1    50   ~ 10
WADDR=001XX
$Comp
L alexios:74HC138 U?
U 1 1 5EDE7D6F
P 2600 -4250
AR Path="/5F3EA987/5EDE7D6F" Ref="U?"  Part="1" 
AR Path="/5EDE7D6F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7D6F" Ref="U16"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5EDE7D6F" Ref="U?"  Part="1" 
F 0 "U16" H 2600 -3583 50  0000 C CNN
F 1 "74HC138" H 2600 -3674 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 -4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 -4250 50  0001 C CNN
	1    2600 -4250
	1    0    0    -1  
$EndComp
Text Notes 2650 -4000 1    50   ~ 10
WADDR=01XXX
Wire Wire Line
	2100 -4650 1800 -4650
Wire Wire Line
	2100 -4550 1800 -4550
Wire Wire Line
	2100 -4450 1800 -4450
Wire Wire Line
	2100 -4050 1800 -4050
Wire Wire Line
	2100 -3950 1800 -3950
Text Label 1800 -4650 0    50   ~ 0
WADDR0
Text Label 1800 -4550 0    50   ~ 0
WADDR1
Text Label 1800 -4450 0    50   ~ 0
WADDR2
Text Label 1800 -4050 0    50   ~ 0
WADDR3
Text Label 1800 -3950 0    50   ~ 0
WADDR4
Entry Wire Line
	1700 -6000 1800 -5900
Entry Wire Line
	1700 -5900 1800 -5800
Entry Wire Line
	1700 -5800 1800 -5700
Entry Wire Line
	1700 -5400 1800 -5300
Entry Wire Line
	1700 -5300 1800 -5200
Entry Wire Line
	1700 -4750 1800 -4650
Entry Wire Line
	1700 -4650 1800 -4550
Entry Wire Line
	1700 -4550 1800 -4450
Entry Wire Line
	1700 -4150 1800 -4050
Entry Wire Line
	1700 -4050 1800 -3950
Entry Bus Bus
	1600 -6150 1700 -6050
Entry Bus Bus
	1600 -4900 1700 -4800
Wire Bus Line
	1600 -4900 1250 -4900
Wire Bus Line
	1600 -6150 1250 -6150
Text HLabel 1250 -6150 0    50   Input ~ 0
RADDR[0..4]
Text HLabel 1250 -4900 0    50   Input ~ 0
WADDR[0..4]
Wire Wire Line
	-3350 2450 -3650 2450
Wire Wire Line
	-3350 2550 -3650 2550
Wire Wire Line
	-3350 2650 -3650 2650
Wire Wire Line
	-3350 3050 -3650 3050
Wire Wire Line
	-3350 3150 -3650 3150
Wire Wire Line
	-3350 3250 -4200 3250
Text Label -3650 3250 0    50   ~ 0
~SYSDEV
$Comp
L alexios:74HC138 U?
U 1 1 5EDE7D98
P -2850 2850
AR Path="/5F3EA987/5EDE7D98" Ref="U?"  Part="1" 
AR Path="/5EDE7D98" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7D98" Ref="U10"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5EDE7D98" Ref="U?"  Part="1" 
F 0 "U10" H -2850 3500 50  0000 C CNN
F 1 "74HC138" H -2850 3400 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2850 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2850 2850 50  0001 C CNN
	1    -2850 2850
	1    0    0    -1  
$EndComp
Text Label -3650 3050 0    50   ~ 0
AB3
Text Label -3650 2450 0    50   ~ 0
AB4
Text Label -3650 2550 0    50   ~ 0
AB5
Text Label -3650 2650 0    50   ~ 0
AB6
Text Label -3650 3150 0    50   ~ 0
AB7
Text Notes -2800 3250 1    50   ~ 10
IOADDR=00:00001xxx
NoConn ~ -2350 2550
NoConn ~ -2350 2650
NoConn ~ -2350 2750
NoConn ~ -2350 2850
NoConn ~ -2350 2950
NoConn ~ -2350 3050
NoConn ~ -2350 3150
NoConn ~ 3100 -5900
NoConn ~ 3100 -5800
NoConn ~ 3100 -5700
NoConn ~ 3100 -5600
NoConn ~ 3100 -4650
NoConn ~ 3100 -4550
NoConn ~ 3100 -4450
NoConn ~ 3100 -4350
Text Label 3150 -5500 0    50   ~ 0
~READ-MBP
Text Label 3150 -5400 0    50   ~ 0
~READ-MBP+FLAGS
Text Label 3150 -4250 0    50   ~ 0
~WRITE-MBP
Text Label 3150 -4150 0    50   ~ 0
~WRITE-MBP+FLAGS
Text Label -1700 6300 2    50   ~ 0
~WAR
Text Notes 3250 -7050 0    50   ~ 0
&008–&00F
Text Label -2000 2450 2    50   ~ 0
~IOMBR
Text Label 4600 -6450 0    50   ~ 0
WADDR1
Wire Wire Line
	4600 -6450 5000 -6450
Text Label 4600 -6550 0    50   ~ 0
WADDR0
Wire Wire Line
	4600 -6550 5000 -6550
Text Label 4300 -6850 0    50   ~ 0
~WRITE-MBP
Text Label 4300 -7050 0    50   ~ 0
~READ-MBP
Text Label 4300 -7150 0    50   ~ 0
~IOMBR
Text Label 4300 -6650 0    50   ~ 0
~WRITE-AR-MBx
$Comp
L alexios:27C256 U?
U 1 1 5EDE7DE9
P 5500 -6450
AR Path="/61F95ACC/63C9F04D/5EDE7DE9" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7DE9" Ref="U9"  Part="1" 
F 0 "U9" H 5500 -5283 50  0000 C CNN
F 1 "27C256" H 5500 -5374 50  0000 C CNN
F 2 "alexios:DIP-28_W15.24mm" H 5475 -7600 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/doc0014-1280163.pdf" H 5500 -6425 50  0001 C CNN
F 4 "556-AT27C256R-45PU; €1.69" H 5525 -7700 50  0001 C CNN "Mouser"
	1    5500 -6450
	1    0    0    -1  
$EndComp
Text Label 6550 -4250 2    50   ~ 0
SEL0
Text Label 6550 -4150 2    50   ~ 0
SEL1
Text Label 6550 -4050 2    50   ~ 0
SEL2
Wire Wire Line
	6350 -4250 6600 -4250
Wire Wire Line
	6350 -4150 6600 -4150
Wire Wire Line
	6350 -4050 6600 -4050
Wire Wire Line
	4900 -5550 4900 -5500
Connection ~ 4900 -5550
Wire Wire Line
	5000 -5550 4900 -5550
Wire Wire Line
	4900 -5650 4900 -5550
Wire Wire Line
	5000 -5650 4900 -5650
$Comp
L power:GND #PWR?
U 1 1 5EDE7DFA
P 4900 -5500
AR Path="/61F95ACC/63C9F04D/5EDE7DFA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5EDE7DFA" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 4900 -5750 50  0001 C CNN
F 1 "GND" H 4905 -5673 50  0000 C CNN
F 2 "" H 4900 -5500 50  0001 C CNN
F 3 "" H 4900 -5500 50  0001 C CNN
	1    4900 -5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 -7250 3700 -7250
Text Label 4300 -7250 0    50   ~ 0
~W
Text Label 4300 -7350 0    50   ~ 0
~R
Entry Wire Line
	6600 -4250 6700 -4150
Entry Wire Line
	6600 -4150 6700 -4050
Entry Wire Line
	6600 -4050 6700 -3950
$Comp
L alexios:74AC32 U?
U 2 1 5EDE7E0B
P 8150 -7550
AR Path="/61F95ACC/63C9F04D/5EDE7E0B" Ref="U?"  Part="2" 
AR Path="/61F95ACC/5EDE7E0B" Ref="U8"  Part="2" 
F 0 "U8" H 8150 -7475 50  0000 C CNN
F 1 "74AC32" H 8150 -7566 50  0000 C CNN
F 2 "alexios:SOIC-14" H 8150 -7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8150 -7550 50  0001 C CNN
	2    8150 -7550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC32 U?
U 3 1 5EDE7E11
P 8800 -7550
AR Path="/61F95ACC/63C9F04D/5EDE7E11" Ref="U?"  Part="3" 
AR Path="/61F95ACC/5EDE7E11" Ref="U8"  Part="3" 
F 0 "U8" H 8800 -7475 50  0000 C CNN
F 1 "74AC32" H 8800 -7566 50  0000 C CNN
F 2 "alexios:SOIC-14" H 8800 -7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8800 -7550 50  0001 C CNN
	3    8800 -7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 -7350 7850 -7400
Wire Wire Line
	7850 -7400 7900 -7400
Wire Wire Line
	7900 -7300 7850 -7300
Wire Wire Line
	7850 -7300 7850 -7350
Connection ~ 7850 -7350
Wire Wire Line
	8500 -7400 8550 -7400
Wire Wire Line
	8550 -7300 8500 -7300
Wire Wire Line
	9050 -7350 9100 -7350
Text Label 9900 -7350 2    50   ~ 0
~RMBR
$Comp
L alexios:74AC32 U?
U 1 1 5EDE7E21
P 7500 -7550
AR Path="/61F95ACC/63C9F04D/5EDE7E21" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7E21" Ref="U8"  Part="1" 
F 0 "U8" H 7500 -7475 50  0000 C CNN
F 1 "74AC32" H 7500 -7566 50  0000 C CNN
F 2 "alexios:SOIC-14" H 7500 -7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7500 -7550 50  0001 C CNN
	1    7500 -7550
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 5EDE7E2E
P 8050 -7000
AR Path="/61F95ACC/63C9F04D/5EDE7E2E" Ref="JP?"  Part="1" 
AR Path="/61F95ACC/5EDE7E2E" Ref="JP9"  Part="1" 
F 0 "JP9" H 8250 -6950 50  0000 C CNN
F 1 "Jumper_2_Open" H 8050 -6856 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 8050 -7000 50  0001 C CNN
F 3 "~" H 8050 -7000 50  0001 C CNN
	1    8050 -7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 -7350 7800 -7350
Wire Wire Line
	7800 -7350 7800 -7000
$Comp
L Jumper:Jumper_2_Bridged JP?
U 1 1 5EDE7E36
P 9300 -7350
AR Path="/61F95ACC/63C9F04D/5EDE7E36" Ref="JP?"  Part="1" 
AR Path="/61F95ACC/5EDE7E36" Ref="JP7"  Part="1" 
F 0 "JP7" H 9300 -7247 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 9300 -7246 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 9300 -7350 50  0001 C CNN
F 3 "~" H 9300 -7350 50  0001 C CNN
	1    9300 -7350
	1    0    0    -1  
$EndComp
Connection ~ 9550 -7350
Wire Wire Line
	9550 -7350 9900 -7350
Wire Wire Line
	9500 -7350 9550 -7350
Wire Wire Line
	8500 -7400 8500 -7350
Wire Wire Line
	8400 -7350 8450 -7350
Connection ~ 8500 -7350
Wire Wire Line
	8500 -7350 8500 -7300
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 5EDE7E44
P 8700 -7150
AR Path="/61F95ACC/63C9F04D/5EDE7E44" Ref="JP?"  Part="1" 
AR Path="/61F95ACC/5EDE7E44" Ref="JP8"  Part="1" 
F 0 "JP8" H 9000 -7100 50  0000 C CNN
F 1 "Jumper_2_Open" H 8700 -7006 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 8700 -7150 50  0001 C CNN
F 3 "~" H 8700 -7150 50  0001 C CNN
	1    8700 -7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 -7350 8450 -7150
Wire Wire Line
	8900 -7150 9550 -7150
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 5EDE7E4D
P 7400 -6850
AR Path="/61F95ACC/63C9F04D/5EDE7E4D" Ref="JP?"  Part="1" 
AR Path="/61F95ACC/5EDE7E4D" Ref="JP10"  Part="1" 
F 0 "JP10" H 7400 -6700 50  0000 C CNN
F 1 "Jumper_2_Open" H 7400 -6706 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 7400 -6850 50  0001 C CNN
F 3 "~" H 7400 -6850 50  0001 C CNN
	1    7400 -6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 -6850 9550 -6850
Wire Wire Line
	7800 -7350 7850 -7350
Connection ~ 7800 -7350
Wire Wire Line
	8450 -7350 8500 -7350
Connection ~ 8450 -7350
Connection ~ 9550 -7150
Wire Wire Line
	9550 -7150 9550 -7350
Wire Wire Line
	9550 -7150 9550 -7000
Connection ~ 9550 -7000
Wire Wire Line
	9550 -7000 9550 -6850
Text Label 4300 -6750 0    50   ~ 0
~WRITE-MBP+FLAGS
Text Label 4300 -6950 0    50   ~ 0
~READ-MBP+FLAGS
$Comp
L alexios:74AC244 U?
U 1 1 5EDE7E65
P 5850 -3750
AR Path="/61F95ACC/63C9F04D/5EDE7E65" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7E65" Ref="U13"  Part="1" 
F 0 "U13" H 5850 -2983 50  0000 C CNN
F 1 "74AC244" H 5850 -3074 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5875 -3375 50  0001 C CNN
F 3 "" H 5875 -3375 50  0001 C CNN
	1    5850 -3750
	1    0    0    -1  
$EndComp
Text Label 6550 -3850 2    50   ~ 0
SEL0
Text Label 6550 -3750 2    50   ~ 0
SEL1
Text Label 6550 -3650 2    50   ~ 0
SEL2
Wire Wire Line
	6350 -3850 6600 -3850
Wire Wire Line
	6350 -3750 6600 -3750
Wire Wire Line
	6350 -3650 6600 -3650
Entry Wire Line
	6600 -3850 6700 -3750
Entry Wire Line
	6600 -3750 6700 -3650
Entry Wire Line
	6600 -3650 6700 -3550
Entry Wire Line
	6600 -2200 6700 -2300
Entry Wire Line
	6600 -2300 6700 -2400
Entry Wire Line
	6600 -2400 6700 -2500
Entry Wire Line
	6600 -2600 6700 -2700
Entry Wire Line
	6600 -2700 6700 -2800
Entry Wire Line
	6600 -2800 6700 -2900
Text Label 6550 -7150 2    50   ~ 0
~USE_AB
Text Label 6550 -6850 2    50   ~ 0
~USE_IR
Text Label 6550 -6950 2    50   ~ 0
~USE_WADDR
Text Label 6550 -7050 2    50   ~ 0
~USE_ZERO
Text Label 4950 -3350 0    50   ~ 0
~USE_AB
Text Label 4950 -3250 0    50   ~ 0
~USE_ZERO
$Comp
L power:GND #PWR?
U 1 1 5EDE7E9C
P 5300 -3500
AR Path="/61F95ACC/63C9F04D/5EDE7E9C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5EDE7E9C" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 5300 -3750 50  0001 C CNN
F 1 "GND" H 5150 -3500 50  0000 C CNN
F 2 "" H 5300 -3500 50  0001 C CNN
F 3 "" H 5300 -3500 50  0001 C CNN
	1    5300 -3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 -3950 5300 -3950
Wire Wire Line
	5300 -3950 5300 -3850
Wire Wire Line
	5350 -3850 5300 -3850
Connection ~ 5300 -3850
Wire Wire Line
	5300 -3850 5300 -3750
Wire Wire Line
	5350 -3750 5300 -3750
Connection ~ 5300 -3750
Wire Wire Line
	5300 -3750 5300 -3650
Wire Wire Line
	5350 -3650 5300 -3650
Connection ~ 5300 -3650
Wire Wire Line
	5300 -3650 5300 -3550
Wire Wire Line
	5350 -3550 5300 -3550
Connection ~ 5300 -3550
Wire Wire Line
	5300 -3550 5300 -3500
$Comp
L Jumper:Jumper_3_Bridged12 JP?
U 1 1 5EDE7ECD
P 9300 -6450
AR Path="/61F95ACC/63C9F04D/5EDE7ECD" Ref="JP?"  Part="1" 
AR Path="/61F95ACC/5EDE7ECD" Ref="JP11"  Part="1" 
F 0 "JP11" V 9450 -6700 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H 9300 -6337 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 9300 -6450 50  0001 C CNN
F 3 "~" H 9300 -6450 50  0001 C CNN
	1    9300 -6450
	0    -1   1    0   
$EndComp
Text Label 8250 -6400 0    50   ~ 0
CLK3
Text Notes 9550 -6750 2    50   ~ 0
Optional 0–3×Tpd delay line
Wire Wire Line
	9250 -6200 9300 -6200
Wire Wire Line
	5000 -5750 4800 -5750
$Comp
L power:+5V #PWR?
U 1 1 5EDE7EE1
P 4800 -5750
AR Path="/61F95ACC/63C9F04D/5EDE7EE1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5EDE7EE1" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 4800 -5900 50  0001 C CNN
F 1 "+5V" H 4742 -5713 50  0000 R CNN
F 2 "" H 4800 -5750 50  0001 C CNN
F 3 "" H 4800 -5750 50  0001 C CNN
	1    4800 -5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 -3950 6550 -3950
Text Label 6550 -3950 2    50   ~ 0
LED1
Wire Wire Line
	6350 -3550 6550 -3550
Text Label 6550 -3550 2    50   ~ 0
LED2
Entry Wire Line
	6700 -4150 6800 -4250
Entry Wire Line
	6700 -4050 6800 -4150
Entry Wire Line
	6700 -3950 6800 -4050
Entry Wire Line
	-3750 2350 -3650 2450
Entry Wire Line
	-3750 2450 -3650 2550
Entry Wire Line
	-3750 2550 -3650 2650
Entry Wire Line
	-3750 2950 -3650 3050
Entry Wire Line
	-3750 3050 -3650 3150
Entry Bus Bus
	-3850 2150 -3750 2250
Wire Bus Line
	-3850 2150 -4200 2150
Text HLabel -4200 2150 0    50   Input ~ 0
AB[0..7]
Text Label -3750 2850 1    50   ~ 0
AB[0..7]
Text Label 1700 -5500 1    50   ~ 0
RADDR[0..4]
Text Label 1700 -4250 1    50   ~ 0
WADDR[0..4]
Wire Wire Line
	7250 -7400 7200 -7400
Wire Wire Line
	7200 -7400 7200 -7350
Wire Wire Line
	7250 -7300 7200 -7300
Wire Wire Line
	7200 -7350 7150 -7350
Wire Wire Line
	7150 -6850 7200 -6850
Connection ~ 7200 -7350
Wire Wire Line
	7200 -7350 7200 -7300
Wire Wire Line
	8750 -6250 8700 -6250
Wire Wire Line
	6000 -7250 7050 -7250
$Comp
L alexios:74AC32 U?
U 4 1 5EDE7EDA
P 9000 -6400
AR Path="/61F95ACC/63C9F04D/5EDE7EDA" Ref="U?"  Part="4" 
AR Path="/61F95ACC/5EDE7EDA" Ref="U8"  Part="4" 
F 0 "U8" H 8950 -6400 50  0000 C CNN
F 1 "74AC32" H 8950 -6300 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9000 -6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9000 -6400 50  0001 C CNN
	4    9000 -6400
	1    0    0    -1  
$EndComp
Connection ~ 7150 -7350
Wire Wire Line
	6000 -7350 7150 -7350
Wire Wire Line
	7150 -7350 7150 -6850
Wire Wire Line
	6850 -6950 6850 -4950
Wire Wire Line
	6000 -6950 6850 -6950
Wire Wire Line
	6000 -6850 6950 -6850
Wire Wire Line
	6950 -6850 6950 -4850
Wire Wire Line
	6750 -7050 6750 -5050
Wire Wire Line
	6000 -7050 6750 -7050
Wire Wire Line
	4750 -3250 5350 -3250
Wire Wire Line
	6650 -7150 6650 -5150
Wire Wire Line
	6000 -7150 6650 -7150
Wire Wire Line
	4850 -3350 5350 -3350
Text Label 4850 -3750 1    50   ~ 0
~USE_AB
Text Label 4750 -3750 1    50   ~ 0
~USE_ZERO
Text Label 4650 -3750 1    50   ~ 0
~USE_WADDR
Text Label 4550 -3750 1    50   ~ 0
~USE_IR
Text Label 6650 -5800 1    50   ~ 0
~USE_AB
Text Label 6750 -5800 1    50   ~ 0
~USE_ZERO
Text Label 6850 -5800 1    50   ~ 0
~USE_WADDR
Text Label 6950 -5800 1    50   ~ 0
~USE_IR
Text Label 5650 -5150 2    50   ~ 0
~USE_AB
Text Label 5650 -4850 2    50   ~ 0
~USE_IR
Text Label 5650 -4950 2    50   ~ 0
~USE_WADDR
Text Label 5650 -5050 2    50   ~ 0
~USE_ZERO
Wire Wire Line
	4650 -4950 6850 -4950
Wire Wire Line
	4550 -4850 6950 -4850
Wire Wire Line
	4750 -5050 6750 -5050
Wire Wire Line
	4850 -5150 6650 -5150
Wire Wire Line
	4850 -5150 4850 -3350
Wire Wire Line
	4750 -5050 4750 -3250
Wire Wire Line
	4650 -4950 4650 -1900
Wire Wire Line
	4550 -4850 4550 -1800
Wire Wire Line
	-2350 2450 -2000 2450
Wire Wire Line
	3100 -4250 4100 -4250
Wire Wire Line
	3100 -4150 4200 -4150
Wire Wire Line
	4100 -6850 5000 -6850
Wire Wire Line
	4100 -6850 4100 -4250
Wire Wire Line
	5000 -6750 4200 -6750
Wire Wire Line
	4200 -6750 4200 -4150
Wire Wire Line
	4300 -6650 5000 -6650
Wire Wire Line
	5000 -7350 3700 -7350
Text HLabel 3700 -7350 0    50   Input ~ 0
~R
Text HLabel 3700 -7250 0    50   Input ~ 0
~W
Entry Wire Line
	4400 -2300 4500 -2200
Entry Wire Line
	4400 -2400 4500 -2300
Entry Wire Line
	4400 -2500 4500 -2400
$Comp
L alexios:74AC32 U?
U 5 1 5F790273
P 9150 -5600
AR Path="/61F95ACC/63C9F04D/5F790273" Ref="U?"  Part="4" 
AR Path="/61F95ACC/5F790273" Ref="U8"  Part="5" 
F 0 "U8" H 9330 -5854 50  0000 L CNN
F 1 "74AC32" H 9330 -5945 50  0000 L CNN
F 2 "alexios:SOIC-14" H 9150 -5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9150 -5600 50  0001 C CNN
	5    9150 -5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F791A6F
P 8800 -5200
AR Path="/5F791A6F" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F791A6F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F791A6F" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 8800 -5450 50  0001 C CNN
F 1 "GND" H 8805 -5373 50  0000 C CNN
F 2 "" H 8800 -5200 50  0001 C CNN
F 3 "" H 8800 -5200 50  0001 C CNN
	1    8800 -5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F791A75
P 8800 -5400
AR Path="/5F791A75" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F791A75" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F791A75" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 8800 -5550 50  0001 C CNN
F 1 "+5V" H 8815 -5227 50  0000 C CNN
F 2 "" H 8800 -5400 50  0001 C CNN
F 3 "" H 8800 -5400 50  0001 C CNN
	1    8800 -5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F791A7B
P 8800 -5300
AR Path="/5CC0D65F/5F791A7B" Ref="C?"  Part="1" 
AR Path="/5F791A7B" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F791A7B" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F791A7B" Ref="C13"  Part="1" 
F 0 "C13" H 8709 -5254 50  0000 R CNN
F 1 "100nF" H 8709 -5345 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8800 -5300 50  0001 C CNN
F 3 "~" H 8800 -5300 50  0001 C CNN
	1    8800 -5300
	1    0    0    -1  
$EndComp
Connection ~ 8800 -5400
Connection ~ 8800 -5200
$Comp
L power:GND #PWR?
U 1 1 5F7CEA82
P 8550 -4500
AR Path="/5F7CEA82" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F7CEA82" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F7CEA82" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 8550 -4750 50  0001 C CNN
F 1 "GND" H 8555 -4673 50  0000 C CNN
F 2 "" H 8550 -4500 50  0001 C CNN
F 3 "" H 8550 -4500 50  0001 C CNN
	1    8550 -4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F7CEA88
P 8550 -4700
AR Path="/5F7CEA88" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F7CEA88" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F7CEA88" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 8550 -4850 50  0001 C CNN
F 1 "+5V" H 8565 -4527 50  0000 C CNN
F 2 "" H 8550 -4700 50  0001 C CNN
F 3 "" H 8550 -4700 50  0001 C CNN
	1    8550 -4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F7CEA8E
P 8550 -4600
AR Path="/5CC0D65F/5F7CEA8E" Ref="C?"  Part="1" 
AR Path="/5F7CEA8E" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F7CEA8E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F7CEA8E" Ref="C15"  Part="1" 
F 0 "C15" H 8459 -4554 50  0000 R CNN
F 1 "100nF" H 8459 -4645 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 -4600 50  0001 C CNN
F 3 "~" H 8550 -4600 50  0001 C CNN
	1    8550 -4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5F84B8BC
P -4150 2800
AR Path="/5F3EA987/5F84B8BC" Ref="U?"  Part="1" 
AR Path="/5F84B8BC" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F84B8BC" Ref="U10"  Part="2" 
AR Path="/61F95ACC/63C9F04D/5F84B8BC" Ref="U?"  Part="1" 
F 0 "U10" H -4250 3100 50  0000 L CNN
F 1 "74HC138" H -4300 2550 50  0000 L CNN
F 2 "alexios:SOIC-16" H -4150 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -4150 2800 50  0001 C CNN
	2    -4150 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F84D2EB
P -4500 2900
AR Path="/5F84D2EB" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F84D2EB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F84D2EB" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H -4500 2650 50  0001 C CNN
F 1 "GND" H -4495 2727 50  0000 C CNN
F 2 "" H -4500 2900 50  0001 C CNN
F 3 "" H -4500 2900 50  0001 C CNN
	1    -4500 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F84D2F1
P -4500 2700
AR Path="/5F84D2F1" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F84D2F1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F84D2F1" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H -4500 2550 50  0001 C CNN
F 1 "+5V" H -4485 2873 50  0000 C CNN
F 2 "" H -4500 2700 50  0001 C CNN
F 3 "" H -4500 2700 50  0001 C CNN
	1    -4500 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F84D2F7
P -4500 2800
AR Path="/5CC0D65F/5F84D2F7" Ref="C?"  Part="1" 
AR Path="/5F84D2F7" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F84D2F7" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F84D2F7" Ref="C9"  Part="1" 
F 0 "C9" H -4591 2846 50  0000 R CNN
F 1 "100nF" H -4591 2755 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -4500 2800 50  0001 C CNN
F 3 "~" H -4500 2800 50  0001 C CNN
	1    -4500 2800
	1    0    0    -1  
$EndComp
Connection ~ -4500 2700
Connection ~ -4500 2900
$Comp
L alexios:74HC138 U?
U 2 1 5F8C5E3C
P 1300 -5550
AR Path="/5F3EA987/5F8C5E3C" Ref="U?"  Part="1" 
AR Path="/5F8C5E3C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F8C5E3C" Ref="U12"  Part="2" 
AR Path="/61F95ACC/63C9F04D/5F8C5E3C" Ref="U?"  Part="1" 
F 0 "U12" H 1200 -5250 50  0000 L CNN
F 1 "74HC138" H 1150 -5800 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 -5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 -5550 50  0001 C CNN
	2    1300 -5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8C5E42
P 950 -5450
AR Path="/5F8C5E42" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F8C5E42" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F8C5E42" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 950 -5700 50  0001 C CNN
F 1 "GND" H 955 -5623 50  0000 C CNN
F 2 "" H 950 -5450 50  0001 C CNN
F 3 "" H 950 -5450 50  0001 C CNN
	1    950  -5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F8C5E48
P 950 -5650
AR Path="/5F8C5E48" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F8C5E48" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F8C5E48" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 950 -5800 50  0001 C CNN
F 1 "+5V" H 965 -5477 50  0000 C CNN
F 2 "" H 950 -5650 50  0001 C CNN
F 3 "" H 950 -5650 50  0001 C CNN
	1    950  -5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F8C5E4E
P 950 -5550
AR Path="/5CC0D65F/5F8C5E4E" Ref="C?"  Part="1" 
AR Path="/5F8C5E4E" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F8C5E4E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F8C5E4E" Ref="C12"  Part="1" 
F 0 "C12" H 859 -5504 50  0000 R CNN
F 1 "100nF" H 859 -5595 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 -5550 50  0001 C CNN
F 3 "~" H 950 -5550 50  0001 C CNN
	1    950  -5550
	1    0    0    -1  
$EndComp
Connection ~ 950  -5650
Connection ~ 950  -5450
$Comp
L alexios:74HC138 U?
U 2 1 5F8D8796
P 1300 -4300
AR Path="/5F3EA987/5F8D8796" Ref="U?"  Part="1" 
AR Path="/5F8D8796" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F8D8796" Ref="U16"  Part="2" 
AR Path="/61F95ACC/63C9F04D/5F8D8796" Ref="U?"  Part="1" 
F 0 "U16" H 1200 -4000 50  0000 L CNN
F 1 "74HC138" H 1150 -4550 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 -4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 -4300 50  0001 C CNN
	2    1300 -4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8D879C
P 950 -4200
AR Path="/5F8D879C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F8D879C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F8D879C" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 950 -4450 50  0001 C CNN
F 1 "GND" H 955 -4373 50  0000 C CNN
F 2 "" H 950 -4200 50  0001 C CNN
F 3 "" H 950 -4200 50  0001 C CNN
	1    950  -4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F8D87A2
P 950 -4400
AR Path="/5F8D87A2" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F8D87A2" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F8D87A2" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 950 -4550 50  0001 C CNN
F 1 "+5V" H 965 -4227 50  0000 C CNN
F 2 "" H 950 -4400 50  0001 C CNN
F 3 "" H 950 -4400 50  0001 C CNN
	1    950  -4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F8D87A8
P 950 -4300
AR Path="/5CC0D65F/5F8D87A8" Ref="C?"  Part="1" 
AR Path="/5F8D87A8" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F8D87A8" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F8D87A8" Ref="C16"  Part="1" 
F 0 "C16" H 859 -4254 50  0000 R CNN
F 1 "100nF" H 859 -4345 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 -4300 50  0001 C CNN
F 3 "~" H 950 -4300 50  0001 C CNN
	1    950  -4300
	1    0    0    -1  
$EndComp
Connection ~ 950  -4400
Connection ~ 950  -4200
$Comp
L alexios:74HC138 U?
U 2 1 5F8EB572
P 1300 -3450
AR Path="/5F3EA987/5F8EB572" Ref="U?"  Part="1" 
AR Path="/5F8EB572" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F8EB572" Ref="U17"  Part="2" 
AR Path="/61F95ACC/63C9F04D/5F8EB572" Ref="U?"  Part="1" 
F 0 "U17" H 1200 -3150 50  0000 L CNN
F 1 "74HC138" H 1150 -3700 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 -3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 -3450 50  0001 C CNN
	2    1300 -3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8EB578
P 950 -3350
AR Path="/5F8EB578" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F8EB578" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F8EB578" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 950 -3600 50  0001 C CNN
F 1 "GND" H 955 -3523 50  0000 C CNN
F 2 "" H 950 -3350 50  0001 C CNN
F 3 "" H 950 -3350 50  0001 C CNN
	1    950  -3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F8EB57E
P 950 -3550
AR Path="/5F8EB57E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F8EB57E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F8EB57E" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 950 -3700 50  0001 C CNN
F 1 "+5V" H 965 -3377 50  0000 C CNN
F 2 "" H 950 -3550 50  0001 C CNN
F 3 "" H 950 -3550 50  0001 C CNN
	1    950  -3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F8EB584
P 950 -3450
AR Path="/5CC0D65F/5F8EB584" Ref="C?"  Part="1" 
AR Path="/5F8EB584" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F8EB584" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F8EB584" Ref="C17"  Part="1" 
F 0 "C17" H 859 -3404 50  0000 R CNN
F 1 "100nF" H 859 -3495 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 -3450 50  0001 C CNN
F 3 "~" H 950 -3450 50  0001 C CNN
	1    950  -3450
	1    0    0    -1  
$EndComp
Connection ~ 950  -3550
Connection ~ 950  -3350
$Comp
L alexios:74AC244 U?
U 2 1 5F911511
P 10500 -6100
AR Path="/61F95ACC/63C9F04D/5F911511" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F911511" Ref="U11"  Part="2" 
F 0 "U11" H 10680 -5654 50  0000 L CNN
F 1 "74AC244" H 10680 -5745 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10525 -5725 50  0001 C CNN
F 3 "" H 10525 -5725 50  0001 C CNN
	2    10500 -6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F912F96
P 10150 -6400
AR Path="/5F912F96" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F912F96" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F912F96" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 10150 -6650 50  0001 C CNN
F 1 "GND" H 10155 -6573 50  0000 C CNN
F 2 "" H 10150 -6400 50  0001 C CNN
F 3 "" H 10150 -6400 50  0001 C CNN
	1    10150 -6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F912F9C
P 10150 -6600
AR Path="/5F912F9C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F912F9C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F912F9C" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 10150 -6750 50  0001 C CNN
F 1 "+5V" H 10165 -6427 50  0000 C CNN
F 2 "" H 10150 -6600 50  0001 C CNN
F 3 "" H 10150 -6600 50  0001 C CNN
	1    10150 -6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F912FA2
P 10150 -6500
AR Path="/5CC0D65F/5F912FA2" Ref="C?"  Part="1" 
AR Path="/5F912FA2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F912FA2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F912FA2" Ref="C10"  Part="1" 
F 0 "C10" H 10059 -6454 50  0000 R CNN
F 1 "100nF" H 10059 -6545 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 -6500 50  0001 C CNN
F 3 "~" H 10150 -6500 50  0001 C CNN
	1    10150 -6500
	1    0    0    -1  
$EndComp
Connection ~ 10150 -6600
Connection ~ 10150 -6400
$Comp
L alexios:74AC244 U?
U 2 1 5F93A350
P 10500 -5450
AR Path="/61F95ACC/63C9F04D/5F93A350" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F93A350" Ref="U13"  Part="2" 
F 0 "U13" H 10680 -5004 50  0000 L CNN
F 1 "74AC244" H 10680 -5095 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10525 -5075 50  0001 C CNN
F 3 "" H 10525 -5075 50  0001 C CNN
	2    10500 -5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F93A356
P 10150 -5750
AR Path="/5F93A356" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F93A356" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F93A356" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 10150 -6000 50  0001 C CNN
F 1 "GND" H 10155 -5923 50  0000 C CNN
F 2 "" H 10150 -5750 50  0001 C CNN
F 3 "" H 10150 -5750 50  0001 C CNN
	1    10150 -5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F93A35C
P 10150 -5950
AR Path="/5F93A35C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F93A35C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F93A35C" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 10150 -6100 50  0001 C CNN
F 1 "+5V" H 10165 -5777 50  0000 C CNN
F 2 "" H 10150 -5950 50  0001 C CNN
F 3 "" H 10150 -5950 50  0001 C CNN
	1    10150 -5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F93A362
P 10150 -5850
AR Path="/5CC0D65F/5F93A362" Ref="C?"  Part="1" 
AR Path="/5F93A362" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F93A362" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F93A362" Ref="C11"  Part="1" 
F 0 "C11" H 10059 -5804 50  0000 R CNN
F 1 "100nF" H 10059 -5895 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 -5850 50  0001 C CNN
F 3 "~" H 10150 -5850 50  0001 C CNN
	1    10150 -5850
	1    0    0    -1  
$EndComp
Connection ~ 10150 -5950
Connection ~ 10150 -5750
$Comp
L alexios:IS61C64AL U15
U 2 1 5F94D2B4
P 9000 -4600
F 0 "U15" H 9080 -4554 50  0000 L CNN
F 1 "IS61C64AL" H 9080 -4645 50  0000 L CNN
F 2 "alexios:SOJ-28_300mil_50mil" V 8900 -4575 50  0001 C CNN
F 3 "https://www.mouser.co.uk/datasheet/2/198/61C64AL-258428.pdf" H 8900 -4500 50  0001 C CNN
F 4 "870-IS61C64AL10JLITR; €1.11" H 8350 -5650 50  0001 L CNN "AC:BOM-Mouser"
	2    9000 -4600
	1    0    0    -1  
$EndComp
Connection ~ 8550 -4700
Connection ~ 8550 -4500
Text Notes 5000 -7700 0    100  ~ 20
Control ROM
Text Notes 7650 -7700 0    100  ~ 20
Strobe Synchronisation
Text Notes 5150 -4600 0    100  ~ 20
Address Multiplexer
Wire Wire Line
	6000 -6750 6550 -6750
Wire Wire Line
	6000 -6650 6550 -6650
Text Label 6550 -6650 2    50   ~ 0
~IBUSW
Text Label 6550 -6750 2    50   ~ 0
~IBUSEN
NoConn ~ 3100 -3950
NoConn ~ 3100 -5200
$Comp
L Device:LED_ALT D1
U 1 1 5FB8F590
P 7550 -6100
F 0 "D1" H 7543 -6264 50  0000 C CNN
F 1 "LED_ALT" H 7543 -6264 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 -6100 50  0001 C CNN
F 3 "~" H 7550 -6100 50  0001 C CNN
	1    7550 -6100
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5FB9352C
P 7850 -6100
F 0 "R5" V 7654 -6100 50  0000 C CNN
F 1 "680Ω" V 7745 -6100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7850 -6100 50  0001 C CNN
F 3 "~" H 7850 -6100 50  0001 C CNN
	1    7850 -6100
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 -6100 7750 -6100
Wire Wire Line
	7950 -6100 8050 -6100
$Comp
L power:+5V #PWR039
U 1 1 5FBBB2E7
P 8050 -6150
F 0 "#PWR039" H 8050 -6300 50  0001 C CNN
F 1 "+5V" H 8000 -5950 50  0000 C CNN
F 2 "" H 8050 -6150 50  0001 C CNN
F 3 "" H 8050 -6150 50  0001 C CNN
	1    8050 -6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 -6100 7150 -6100
Text Label 7150 -6100 0    50   ~ 0
LED1
$Comp
L Device:LED_ALT D2
U 1 1 5FC12B9E
P 7550 -5800
F 0 "D2" H 7543 -5964 50  0000 C CNN
F 1 "LED_ALT" H 7543 -5964 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 -5800 50  0001 C CNN
F 3 "~" H 7550 -5800 50  0001 C CNN
	1    7550 -5800
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5FC12BA4
P 7850 -5800
F 0 "R6" V 7654 -5800 50  0000 C CNN
F 1 "680Ω" V 7745 -5800 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7850 -5800 50  0001 C CNN
F 3 "~" H 7850 -5800 50  0001 C CNN
	1    7850 -5800
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 -5800 7750 -5800
Wire Wire Line
	7950 -5800 8050 -5800
Wire Wire Line
	7400 -5800 7150 -5800
Text Label 7150 -5800 0    50   ~ 0
LED2
Wire Wire Line
	8050 -6150 8050 -6100
Connection ~ 8050 -6100
Wire Wire Line
	8050 -6100 8050 -5800
$Comp
L Device:LED_ALT D3
U 1 1 5FC4E153
P 7550 -5500
F 0 "D3" H 7543 -5664 50  0000 C CNN
F 1 "LED_ALT" H 7543 -5664 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 -5500 50  0001 C CNN
F 3 "~" H 7550 -5500 50  0001 C CNN
	1    7550 -5500
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5FC4E159
P 7850 -5500
F 0 "R7" V 7654 -5500 50  0000 C CNN
F 1 "680Ω" V 7745 -5500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7850 -5500 50  0001 C CNN
F 3 "~" H 7850 -5500 50  0001 C CNN
	1    7850 -5500
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 -5500 7750 -5500
Wire Wire Line
	7950 -5500 8050 -5500
Wire Wire Line
	7400 -5500 7150 -5500
Text Label 7150 -5500 0    50   ~ 0
LED3
Wire Wire Line
	8050 -5800 8050 -5500
$Comp
L Device:LED_ALT D4
U 1 1 5FC627D5
P 7550 -5200
F 0 "D4" H 7543 -5364 50  0000 C CNN
F 1 "LED_ALT" H 7543 -5364 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 -5200 50  0001 C CNN
F 3 "~" H 7550 -5200 50  0001 C CNN
	1    7550 -5200
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5FC627DB
P 7850 -5200
F 0 "R8" V 7654 -5200 50  0000 C CNN
F 1 "680Ω" V 7745 -5200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7850 -5200 50  0001 C CNN
F 3 "~" H 7850 -5200 50  0001 C CNN
	1    7850 -5200
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 -5200 7750 -5200
Wire Wire Line
	7950 -5200 8050 -5200
Wire Wire Line
	7400 -5200 7150 -5200
Text Label 7150 -5200 0    50   ~ 0
LED4
Wire Wire Line
	8050 -5500 8050 -5200
Connection ~ 8050 -5800
Connection ~ 8050 -5500
Text Notes 7150 -6400 0    100  ~ 20
MUX LEDs
Wire Wire Line
	7050 -6700 8700 -6700
Wire Wire Line
	7050 -6700 7050 -7250
Wire Wire Line
	5350 -4250 4950 -4250
Wire Wire Line
	5350 -4150 4950 -4150
Wire Wire Line
	5350 -4050 4950 -4050
Text Label 4950 -4250 0    50   ~ 0
AB0
Text Label 4950 -4150 0    50   ~ 0
AB1
Text Label 4950 -4050 0    50   ~ 0
AB2
Text Notes 5900 -5450 0    50   ~ 0
mbu_rom.bin
Text Notes 7200 -4600 0    100  ~ 20
Register File
Text Notes 5550 -6250 1    50   ~ 0
45ns EPROM
Wire Wire Line
	-3450 8650 -3050 8650
Text HLabel -3450 8650 0    50   Input ~ 0
~RESET
Entry Wire Line
	9250 -3850 9350 -3950
Entry Wire Line
	9250 -3950 9350 -4050
Entry Wire Line
	9250 -4050 9350 -4150
Entry Wire Line
	9250 -4150 9350 -4250
Entry Wire Line
	9250 -3450 9350 -3550
Entry Wire Line
	9250 -3550 9350 -3650
Entry Wire Line
	9250 -3650 9350 -3750
Entry Wire Line
	9250 -3750 9350 -3850
Text Label 8250 -1900 0    50   ~ 0
AEXT[0..7]
Text HLabel 8750 -1900 2    50   Input ~ 0
AEXT[0..7]
Text Label 8250 -2000 0    50   ~ 0
IBUS[0..7]
Wire Bus Line
	8250 -2000 8750 -2000
Wire Wire Line
	4600 -6250 5000 -6250
Text Label 4600 -6250 0    50   ~ 0
~DIS
Text Label -3400 8650 0    50   ~ 0
~RESET
Wire Bus Line
	8250 -1900 8750 -1900
Text Label 6550 -2100 2    50   ~ 0
LED4
Text Label 6550 -2500 2    50   ~ 0
LED3
$Comp
L alexios:74AC244 U?
U 1 1 5EDE7EF0
P 5850 -2300
AR Path="/61F95ACC/63C9F04D/5EDE7EF0" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7EF0" Ref="U11"  Part="1" 
F 0 "U11" H 5850 -1533 50  0000 C CNN
F 1 "74AC244" H 5850 -1624 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5875 -1925 50  0001 C CNN
F 3 "" H 5875 -1925 50  0001 C CNN
	1    5850 -2300
	1    0    0    -1  
$EndComp
Connection ~ 5300 -2500
Wire Wire Line
	5300 -2600 5300 -2500
Wire Wire Line
	5350 -2600 5300 -2600
Text Label 5000 -2200 0    50   ~ 0
IR2
Text Label 5000 -2300 0    50   ~ 0
IR1
Text Label 5000 -2400 0    50   ~ 0
IR0
Text Label 5000 -2700 0    50   ~ 0
WADDR1
Text Label 5000 -2800 0    50   ~ 0
WADDR0
Connection ~ 5300 -2100
Wire Wire Line
	5300 -2500 5300 -2100
Wire Wire Line
	5300 -2100 5300 -2050
Wire Wire Line
	5350 -2100 5300 -2100
Wire Wire Line
	5350 -2500 5300 -2500
$Comp
L power:GND #PWR?
U 1 1 5EDE7EB2
P 5300 -2050
AR Path="/61F95ACC/63C9F04D/5EDE7EB2" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5EDE7EB2" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 5300 -2300 50  0001 C CNN
F 1 "GND" H 5150 -2050 50  0000 C CNN
F 2 "" H 5300 -2050 50  0001 C CNN
F 3 "" H 5300 -2050 50  0001 C CNN
	1    5300 -2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 -2700 5000 -2700
Wire Wire Line
	5350 -2800 5000 -2800
Text Label 4800 -1900 0    50   ~ 0
~USE_WADDR
Text Label 4800 -1800 0    50   ~ 0
~USE_IR
Text Label 6550 -2200 2    50   ~ 0
SEL2
Text Label 6550 -2300 2    50   ~ 0
SEL1
Text Label 6550 -2400 2    50   ~ 0
SEL0
Text Label 6550 -2600 2    50   ~ 0
SEL2
Text Label 6550 -2700 2    50   ~ 0
SEL1
Text Label 6550 -2800 2    50   ~ 0
SEL0
Wire Wire Line
	4500 -2400 5350 -2400
Wire Wire Line
	4500 -2300 5350 -2300
Wire Wire Line
	4500 -2200 5350 -2200
Wire Wire Line
	4650 -1900 5350 -1900
Wire Wire Line
	4550 -1800 5350 -1800
Wire Wire Line
	6350 -2800 6600 -2800
Wire Wire Line
	6350 -2700 6600 -2700
Wire Wire Line
	6350 -2600 6600 -2600
Wire Wire Line
	6350 -2400 6600 -2400
Wire Wire Line
	6350 -2300 6600 -2300
Wire Wire Line
	6350 -2200 6600 -2200
Wire Wire Line
	6350 -2500 6550 -2500
Wire Wire Line
	6350 -2100 6550 -2100
$Comp
L alexios:74LVC1G74 U?
U 2 1 60C41486
P 1300 -2800
AR Path="/6005A9A5/60C41486" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60C41486" Ref="U18"  Part="2" 
F 0 "U18" H 1300 -3100 50  0000 C CNN
F 1 "74LVC1G74" H 1300 -3200 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 1750 -2800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 1750 -2800 50  0001 C CNN
	2    1300 -2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60C42060
P 950 -2700
AR Path="/60C42060" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60C42060" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60C42060" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 950 -2950 50  0001 C CNN
F 1 "GND" H 955 -2873 50  0000 C CNN
F 2 "" H 950 -2700 50  0001 C CNN
F 3 "" H 950 -2700 50  0001 C CNN
	1    950  -2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60C42066
P 950 -2900
AR Path="/60C42066" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60C42066" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60C42066" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 950 -3050 50  0001 C CNN
F 1 "+5V" H 965 -2727 50  0000 C CNN
F 2 "" H 950 -2900 50  0001 C CNN
F 3 "" H 950 -2900 50  0001 C CNN
	1    950  -2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60C4206C
P 950 -2800
AR Path="/5CC0D65F/60C4206C" Ref="C?"  Part="1" 
AR Path="/60C4206C" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60C4206C" Ref="C?"  Part="1" 
AR Path="/61F95ACC/60C4206C" Ref="C18"  Part="1" 
F 0 "C18" H 859 -2754 50  0000 R CNN
F 1 "100nF" H 859 -2845 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 -2800 50  0001 C CNN
F 3 "~" H 950 -2800 50  0001 C CNN
	1    950  -2800
	1    0    0    -1  
$EndComp
Connection ~ 950  -2700
Connection ~ 950  -2900
$Comp
L power:GND #PWR?
U 1 1 60C73288
P 950 -1950
AR Path="/60C73288" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60C73288" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60C73288" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 950 -2200 50  0001 C CNN
F 1 "GND" H 955 -2123 50  0000 C CNN
F 2 "" H 950 -1950 50  0001 C CNN
F 3 "" H 950 -1950 50  0001 C CNN
	1    950  -1950
	1    0    0    -1  
$EndComp
Connection ~ 10150 -7050
Connection ~ 10150 -7250
$Comp
L Device:C_Small C?
U 1 1 5F7692DC
P 10150 -7150
AR Path="/5CC0D65F/5F7692DC" Ref="C?"  Part="1" 
AR Path="/5F7692DC" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F7692DC" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F7692DC" Ref="C8"  Part="1" 
F 0 "C8" H 10059 -7104 50  0000 R CNN
F 1 "100nF" H 10059 -7195 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 -7150 50  0001 C CNN
F 3 "~" H 10150 -7150 50  0001 C CNN
	1    10150 -7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F7692D6
P 10150 -7250
AR Path="/5F7692D6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F7692D6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F7692D6" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 10150 -7400 50  0001 C CNN
F 1 "+5V" H 10165 -7077 50  0000 C CNN
F 2 "" H 10150 -7250 50  0001 C CNN
F 3 "" H 10150 -7250 50  0001 C CNN
	1    10150 -7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7692D0
P 10150 -7050
AR Path="/5F7692D0" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F7692D0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F7692D0" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 10150 -7300 50  0001 C CNN
F 1 "GND" H 10155 -7223 50  0000 C CNN
F 2 "" H 10150 -7050 50  0001 C CNN
F 3 "" H 10150 -7050 50  0001 C CNN
	1    10150 -7050
	1    0    0    -1  
$EndComp
$Comp
L alexios:27C256 U?
U 2 1 5F7651E5
P 10500 -7150
AR Path="/61F95ACC/63C9F04D/5F7651E5" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F7651E5" Ref="U9"  Part="2" 
F 0 "U9" H 10680 -7104 50  0000 L CNN
F 1 "27C256" H 10680 -7195 50  0000 L CNN
F 2 "alexios:DIP-28_W15.24mm" H 10475 -8300 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/doc0014-1280163.pdf" H 10500 -7125 50  0001 C CNN
F 4 "556-AT27C256R-45PU; €1.69" H 10525 -8400 50  0001 C CNN "Mouser"
	2    10500 -7150
	1    0    0    -1  
$EndComp
Connection ~ 10150 -5250
Connection ~ 10150 -5050
$Comp
L Device:C_Small C?
U 1 1 5F7BC80A
P 10150 -5150
AR Path="/5CC0D65F/5F7BC80A" Ref="C?"  Part="1" 
AR Path="/5F7BC80A" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F7BC80A" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F7BC80A" Ref="C14"  Part="1" 
F 0 "C14" H 10059 -5104 50  0000 R CNN
F 1 "100nF" H 10059 -5195 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 -5150 50  0001 C CNN
F 3 "~" H 10150 -5150 50  0001 C CNN
	1    10150 -5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F7BC804
P 10150 -5250
AR Path="/5F7BC804" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F7BC804" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F7BC804" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 10150 -5400 50  0001 C CNN
F 1 "+5V" H 10165 -5077 50  0000 C CNN
F 2 "" H 10150 -5250 50  0001 C CNN
F 3 "" H 10150 -5250 50  0001 C CNN
	1    10150 -5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F7BC7FE
P 10150 -5050
AR Path="/5F7BC7FE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F7BC7FE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F7BC7FE" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 10150 -5300 50  0001 C CNN
F 1 "GND" H 10155 -5223 50  0000 C CNN
F 2 "" H 10150 -5050 50  0001 C CNN
F 3 "" H 10150 -5050 50  0001 C CNN
	1    10150 -5050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U14
U 2 1 5F7B8E91
P 10500 -4750
F 0 "U14" H 10680 -4304 50  0000 L CNN
F 1 "74HC245" H 10680 -4395 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10500 -4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 10500 -4700 50  0001 C CNN
	2    10500 -4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 -6700 8700 -6250
Text HLabel 3400 -3650 0    50   Input ~ 0
IR[0..2]
Wire Bus Line
	3400 -3650 4300 -3650
Entry Bus Bus
	4300 -3650 4400 -3550
Wire Wire Line
	4300 -4050 4300 -6650
Text Notes -3400 7800 0    100  ~ 20
MBU Enable
Text Label -3400 8950 0    50   ~ 0
~IOMBR
Wire Wire Line
	-3050 8850 -3100 8850
Wire Wire Line
	-3100 8850 -3100 8750
Wire Wire Line
	-3050 8750 -3100 8750
Connection ~ -3100 8750
Wire Wire Line
	-3100 8750 -3100 8550
$Comp
L power:+5V #PWR066
U 1 1 6121EEB0
P -3100 8550
F 0 "#PWR066" H -3100 8400 50  0001 C CNN
F 1 "+5V" H -3085 8723 50  0000 C CNN
F 2 "" H -3100 8550 50  0001 C CNN
F 3 "" H -3100 8550 50  0001 C CNN
	1    -3100 8550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60C7328E
P 950 -2150
AR Path="/60C7328E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60C7328E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60C7328E" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 950 -2300 50  0001 C CNN
F 1 "+5V" H 965 -1977 50  0000 C CNN
F 2 "" H 950 -2150 50  0001 C CNN
F 3 "" H 950 -2150 50  0001 C CNN
	1    950  -2150
	1    0    0    -1  
$EndComp
Connection ~ 950  -2150
Connection ~ 950  -1950
$Comp
L alexios:74AHC1G125 U?
U 2 1 60C71DB9
P 1300 -2050
AR Path="/6005A9A5/60C71DB9" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60C71DB9" Ref="U20"  Part="2" 
F 0 "U20" H 1480 -2004 50  0000 L CNN
F 1 "74AHC1G125" H 1480 -2095 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1475 -1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1475 -1800 50  0001 C CNN
	2    1300 -2050
	1    0    0    -1  
$EndComp
Connection ~ 7050 -3050
Text HLabel -4200 3250 0    50   Input ~ 0
~SYSDEV
Wire Wire Line
	8250 -7000 9550 -7000
Wire Wire Line
	7850 -7000 7800 -7000
Wire Wire Line
	8500 -7150 8450 -7150
Entry Wire Line
	9350 -2650 9250 -2750
Entry Wire Line
	9350 -2750 9250 -2850
Entry Wire Line
	9350 -2850 9250 -2950
Entry Wire Line
	9350 -2950 9250 -3050
Entry Wire Line
	9350 -2250 9250 -2350
Entry Wire Line
	9350 -2350 9250 -2450
Entry Wire Line
	9350 -2450 9250 -2550
Entry Wire Line
	9350 -2550 9250 -2650
Text Label 8250 -1800 0    50   ~ 0
DB[0..7]
Text HLabel 8750 -1800 2    50   BiDi ~ 0
DB[0..7]
Wire Bus Line
	8250 -1800 8750 -1800
Text HLabel 8750 -2000 2    50   BiDi ~ 0
IBUS[0..7]
$Comp
L power:GND #PWR?
U 1 1 61C3A7B4
P 8250 -2350
AR Path="/61C3A7B4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/61C3A7B4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/61C3A7B4" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 8250 -2600 50  0001 C CNN
F 1 "GND" H 8255 -2523 50  0000 C CNN
F 2 "" H 8250 -2350 50  0001 C CNN
F 3 "" H 8250 -2350 50  0001 C CNN
	1    8250 -2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61C3A7BA
P 8250 -2550
AR Path="/61C3A7BA" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/61C3A7BA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/61C3A7BA" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 8250 -2700 50  0001 C CNN
F 1 "+5V" H 8265 -2377 50  0000 C CNN
F 2 "" H 8250 -2550 50  0001 C CNN
F 3 "" H 8250 -2550 50  0001 C CNN
	1    8250 -2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61C3A7C0
P 8250 -2450
AR Path="/5CC0D65F/61C3A7C0" Ref="C?"  Part="1" 
AR Path="/61C3A7C0" Ref="C?"  Part="1" 
AR Path="/5F3EA987/61C3A7C0" Ref="C?"  Part="1" 
AR Path="/61F95ACC/61C3A7C0" Ref="C19"  Part="1" 
F 0 "C19" H 8159 -2404 50  0000 R CNN
F 1 "100nF" H 8159 -2495 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8250 -2450 50  0001 C CNN
F 3 "~" H 8250 -2450 50  0001 C CNN
	1    8250 -2450
	1    0    0    -1  
$EndComp
Text Label 9250 -2450 1    50   ~ 0
AEXT[0..7]
Wire Wire Line
	-2000 8950 -2150 8950
$Comp
L Device:C_Small C?
U 1 1 60C73294
P 950 -2050
AR Path="/5CC0D65F/60C73294" Ref="C?"  Part="1" 
AR Path="/60C73294" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60C73294" Ref="C?"  Part="1" 
AR Path="/61F95ACC/60C73294" Ref="C20"  Part="1" 
F 0 "C20" H 850 -1900 50  0000 R CNN
F 1 "100nF" H 859 -2095 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 -2050 50  0001 C CNN
F 3 "~" H 950 -2050 50  0001 C CNN
	1    950  -2050
	1    0    0    -1  
$EndComp
Text Label -2000 8950 2    50   ~ 0
~DIS
Wire Wire Line
	-3400 8950 -3050 8950
Wire Wire Line
	8250 -6400 8500 -6400
Wire Wire Line
	9450 -6450 9650 -6450
Wire Wire Line
	8700 -6700 9300 -6700
Connection ~ 8700 -6700
Text Label 9650 -6450 2    50   ~ 0
~WMBR
Text Notes 8850 -5850 0    50   ~ 0
ORing with WSTB may be\na bad idea.
Wire Wire Line
	7050 -3050 7050 -2600
Text Label 6700 -3300 3    50   ~ 0
SEL[0..2]
Wire Wire Line
	7100 -2850 6800 -2850
Text Label 6800 -2850 0    50   ~ 0
T34
Text Label -3850 2050 2    50   ~ 0
T34
Wire Wire Line
	-4200 2050 -3850 2050
Text HLabel -4200 2050 0    50   Input ~ 0
T34
$Comp
L Jumper:Jumper_3_Bridged12 JP?
U 1 1 5E258EC5
P 8500 -6150
AR Path="/61F95ACC/63C9F04D/5E258EC5" Ref="JP?"  Part="1" 
AR Path="/61F95ACC/5E258EC5" Ref="JP12"  Part="1" 
F 0 "JP12" V 8500 -6083 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H 8500 -6037 50  0001 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 8500 -6150 50  0001 C CNN
F 3 "~" H 8500 -6150 50  0001 C CNN
	1    8500 -6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 -6150 8750 -6150
Wire Wire Line
	8500 -5900 8250 -5900
Text Label 8250 -5900 0    50   ~ 0
T34
Text HLabel 6050 -1500 2    50   Output ~ 0
~WRITE-AR
Wire Wire Line
	4100 -1500 6050 -1500
Wire Wire Line
	4300 -4050 4100 -4050
Text Label 5600 -1500 2    50   ~ 0
~WRITE-AR
Wire Wire Line
	-2350 6300 -1700 6300
Wire Wire Line
	4000 -6950 5000 -6950
Wire Wire Line
	3100 -5400 4000 -5400
Wire Wire Line
	4000 -5400 4000 -6950
Wire Wire Line
	3900 -7050 5000 -7050
Wire Wire Line
	3100 -5500 3900 -5500
Wire Wire Line
	3900 -5500 3900 -7050
$Comp
L alexios:74HC138 U?
U 1 1 5EDE7D3C
P 2600 -5500
AR Path="/5F3EA987/5EDE7D3C" Ref="U?"  Part="1" 
AR Path="/5EDE7D3C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7D3C" Ref="U12"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5EDE7D3C" Ref="U?"  Part="1" 
F 0 "U12" H 2600 -4833 50  0000 C CNN
F 1 "74HC138" H 2600 -4924 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 -5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 -5500 50  0001 C CNN
	1    2600 -5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 -3850 2050 -3850
Text Label -3750 6300 0    50   ~ 0
WADDR3
Wire Wire Line
	-3350 6300 -3750 6300
Wire Wire Line
	-3350 6200 -3750 6200
Text Label -3750 6200 0    50   ~ 0
WADDR2
NoConn ~ -2350 6900
NoConn ~ -2350 6200
Text Label 6550 -7350 2    50   ~ 0
~RMBR0
Text Label 6550 -7250 2    50   ~ 0
~WMBR0
$Comp
L alexios:74LVC1G74 U?
U 1 1 60083AB7
P -2600 8800
AR Path="/6005A9A5/60083AB7" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60083AB7" Ref="U18"  Part="1" 
F 0 "U18" H -2600 9217 50  0000 C CNN
F 1 "74LVC1G74" H -2600 9126 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H -2150 8800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H -2150 8800 50  0001 C CNN
	1    -2600 8800
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D5
U 1 1 5F7130AB
P -1200 8650
F 0 "D5" H -1207 8486 50  0000 C CNN
F 1 "LED_ALT" H -1207 8486 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1200 8650 50  0001 C CNN
F 3 "~" H -1200 8650 50  0001 C CNN
	1    -1200 8650
	-1   0    0    1   
$EndComp
Wire Wire Line
	-1050 8650 -1000 8650
Wire Wire Line
	-1000 8650 -1000 8700
$Comp
L power:GND #PWR?
U 1 1 5F82AB65
P -1000 8700
AR Path="/5F82AB65" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F82AB65" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F82AB65" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H -1000 8450 50  0001 C CNN
F 1 "GND" H -995 8527 50  0000 C CNN
F 2 "" H -1000 8700 50  0001 C CNN
F 3 "" H -1000 8700 50  0001 C CNN
	1    -1000 8700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R23
U 1 1 5F7130B1
P -1500 8650
F 0 "R23" V -1696 8650 50  0000 C CNN
F 1 "680Ω" V -1605 8650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1500 8650 50  0001 C CNN
F 3 "~" H -1500 8650 50  0001 C CNN
	1    -1500 8650
	0    -1   1    0   
$EndComp
Text Notes -3350 8050 0    50   ~ 0
The MBU is disabled after reset and enabled\nwhen it's first written to.
$Comp
L power:+5V #PWR0145
U 1 1 5E459A7C
P -3400 6750
F 0 "#PWR0145" H -3400 6600 50  0001 C CNN
F 1 "+5V" H -3385 6923 50  0000 C CNN
F 2 "" H -3400 6750 50  0001 C CNN
F 3 "" H -3400 6750 50  0001 C CNN
	1    -3400 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3350 6900 -3400 6900
Wire Wire Line
	-3400 6800 -3350 6800
Text Notes 5900 -5700 0    50   ~ 0
Note: 27C32 is\nenough, but\nvery rare\nthese days.
Text Label 4600 -6350 0    50   ~ 0
IDXEN
Wire Wire Line
	5000 -6150 4900 -6150
Wire Wire Line
	4900 -6150 4900 -6050
Connection ~ 4900 -5650
Wire Wire Line
	5000 -6050 4900 -6050
Connection ~ 4900 -6050
Wire Wire Line
	4900 -6050 4900 -5950
Wire Wire Line
	5000 -5950 4900 -5950
Connection ~ 4900 -5950
Wire Wire Line
	4900 -5950 4900 -5650
Wire Wire Line
	3700 -6350 5000 -6350
Text HLabel 3700 -6350 0    50   Input ~ 0
IDXEN
Text Label 4400 -2650 1    50   ~ 0
IR[0..2]
Wire Wire Line
	2100 -5100 1250 -5100
Text HLabel 1250 -5100 0    50   Input ~ 0
T34
Wire Wire Line
	-4200 1950 -3850 1950
Wire Wire Line
	2050 -3850 2050 -3800
$Comp
L power:GND #PWR0146
U 1 1 5E8B792F
P 2050 -3800
F 0 "#PWR0146" H 2050 -4050 50  0001 C CNN
F 1 "GND" H 2055 -3973 50  0000 C CNN
F 2 "" H 2050 -3800 50  0001 C CNN
F 3 "" H 2050 -3800 50  0001 C CNN
	1    2050 -3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3350 7000 -3400 7000
Wire Wire Line
	-3400 7000 -3400 7050
$Comp
L power:GND #PWR0147
U 1 1 5E8B7ED4
P -3400 7050
F 0 "#PWR0147" H -3400 6800 50  0001 C CNN
F 1 "GND" H -3395 6877 50  0000 C CNN
F 2 "" H -3400 7050 50  0001 C CNN
F 3 "" H -3400 7050 50  0001 C CNN
	1    -3400 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3400 6900 -3400 7000
Connection ~ -3400 7000
Text HLabel -4200 1950 0    50   Input ~ 0
CLK3
Text Label -3850 1950 2    50   ~ 0
CLK3
NoConn ~ 3100 -5300
NoConn ~ 3100 -4050
Text Notes 9500 -4600 0    100  ~ 20
IBus Transceiver
$Comp
L power:GND #PWR061
U 1 1 5EA872CC
P 7050 -2600
F 0 "#PWR061" H 7050 -2850 50  0001 C CNN
F 1 "GND" H 7055 -2773 50  0000 C CNN
F 2 "" H 7050 -2600 50  0001 C CNN
F 3 "" H 7050 -2600 50  0001 C CNN
	1    7050 -2600
	1    0    0    -1  
$EndComp
Text Notes 6750 -2100 0    50   ~ 10
Note
Text Notes 6700 -1800 0    50   ~ 0
Signals IBUS[8..15] are intentionally\nnot driven here! They are handled by\nthe flag unit.
Connection ~ 8250 -2550
Connection ~ 8250 -2350
$Comp
L alexios:74HC541 U19
U 2 1 61C1A65A
P 8600 -2450
F 0 "U19" H 8780 -2404 50  0000 L CNN
F 1 "74HC541" H 8780 -2495 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 8600 -2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8600 -2450 50  0001 C CNN
	2    8600 -2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 5E861E45
P 9250 9750
F 0 "U?" H 9250 10517 50  0000 C CNN
F 1 "74HC670" H 9250 10426 50  0000 C CNN
F 2 "" H 9550 9900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 9550 9900 50  0001 C CNN
	1    9250 9750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 5E8627B4
P 11150 9750
F 0 "U?" H 11150 10517 50  0000 C CNN
F 1 "74HC670" H 11150 10426 50  0000 C CNN
F 2 "" H 11450 9900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 11450 9900 50  0001 C CNN
	1    11150 9750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 5E8646A7
P 9250 11300
F 0 "U?" H 9250 12067 50  0000 C CNN
F 1 "74HC670" H 9250 11976 50  0000 C CNN
F 2 "" H 9550 11450 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 9550 11450 50  0001 C CNN
	1    9250 11300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 5E8646AD
P 11150 11300
F 0 "U?" H 11150 12067 50  0000 C CNN
F 1 "74HC670" H 11150 11976 50  0000 C CNN
F 2 "" H 11450 11450 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 11450 11450 50  0001 C CNN
	1    11150 11300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 10350 8450 10350
Text Label 8450 10350 0    50   ~ 0
~REN0
Wire Wire Line
	8750 11900 8450 11900
Text Label 8450 11900 0    50   ~ 0
~REN0
Wire Wire Line
	10650 10350 10350 10350
Text Label 10350 10350 0    50   ~ 0
~REN1
Wire Wire Line
	10650 11900 10350 11900
Text Label 10350 11900 0    50   ~ 0
~REN1
Wire Wire Line
	10650 10150 10350 10150
Wire Wire Line
	10650 10250 10350 10250
Text Label 10350 10150 0    50   ~ 0
RA0
Text Label 10350 10250 0    50   ~ 0
RA1
Wire Wire Line
	8750 10150 8450 10150
Wire Wire Line
	8750 10250 8450 10250
Text Label 8450 10150 0    50   ~ 0
RA0
Text Label 8450 10250 0    50   ~ 0
RA1
Wire Wire Line
	8750 11700 8450 11700
Wire Wire Line
	8750 11800 8450 11800
Text Label 8450 11800 0    50   ~ 0
RA1
Text Label 8450 11700 0    50   ~ 0
RA0
Wire Wire Line
	10650 11700 10350 11700
Wire Wire Line
	10650 11800 10350 11800
Text Label 10350 11800 0    50   ~ 0
RA1
Text Label 10350 11700 0    50   ~ 0
RA0
Wire Wire Line
	8750 9750 8450 9750
Wire Wire Line
	8750 9850 8450 9850
Wire Wire Line
	8750 9950 8450 9950
Text Label 8450 9750 0    50   ~ 0
WA0
Text Label 8450 9850 0    50   ~ 0
WA1
Text Label 8450 9950 0    50   ~ 0
~WEN0
Wire Wire Line
	8750 11300 8450 11300
Wire Wire Line
	8750 11400 8450 11400
Wire Wire Line
	8750 11500 8450 11500
Text Label 8450 11300 0    50   ~ 0
WA0
Text Label 8450 11400 0    50   ~ 0
WA1
Text Label 8450 11500 0    50   ~ 0
~WEN0
Wire Wire Line
	10650 9750 10350 9750
Wire Wire Line
	10650 9850 10350 9850
Wire Wire Line
	10650 9950 10350 9950
Text Label 10350 9750 0    50   ~ 0
WA0
Text Label 10350 9850 0    50   ~ 0
WA1
Text Label 10350 9950 0    50   ~ 0
~WEN1
Wire Wire Line
	10650 11300 10350 11300
Wire Wire Line
	10650 11400 10350 11400
Wire Wire Line
	10650 11500 10350 11500
Text Label 10350 11300 0    50   ~ 0
WA0
Text Label 10350 11400 0    50   ~ 0
WA1
Text Label 10350 11500 0    50   ~ 0
~WEN1
Wire Wire Line
	9750 9250 10100 9250
Wire Wire Line
	9750 9350 10100 9350
Wire Wire Line
	9750 9450 10100 9450
Wire Wire Line
	9750 9550 10100 9550
Wire Wire Line
	11650 9250 12000 9250
Wire Wire Line
	11650 9350 12000 9350
Wire Wire Line
	11650 9450 12000 9450
Wire Wire Line
	11650 9550 12000 9550
Wire Wire Line
	9750 10800 10100 10800
Wire Wire Line
	9750 10900 10100 10900
Wire Wire Line
	9750 11000 10100 11000
Wire Wire Line
	9750 11100 10100 11100
Wire Wire Line
	11650 10800 12000 10800
Wire Wire Line
	11650 10900 12000 10900
Wire Wire Line
	11650 11000 12000 11000
Wire Wire Line
	11650 11100 12000 11100
Wire Wire Line
	8750 9250 8450 9250
Wire Wire Line
	8750 9350 8450 9350
Wire Wire Line
	8750 9450 8450 9450
Wire Wire Line
	8750 9550 8450 9550
Wire Wire Line
	8750 10800 8450 10800
Wire Wire Line
	8750 10900 8450 10900
Wire Wire Line
	8750 11000 8450 11000
Wire Wire Line
	8750 11100 8450 11100
Text Label 8450 9250 0    50   ~ 0
IBUS0
Text Label 8450 9350 0    50   ~ 0
IBUS1
Text Label 8450 9450 0    50   ~ 0
IBUS2
Text Label 8450 9550 0    50   ~ 0
IBUS3
Text Label 8450 10800 0    50   ~ 0
IBUS4
Text Label 8450 10900 0    50   ~ 0
IBUS5
Text Label 8450 11000 0    50   ~ 0
IBUS6
Text Label 8450 11100 0    50   ~ 0
IBUS7
Wire Wire Line
	10650 9250 10350 9250
Wire Wire Line
	10650 9350 10350 9350
Wire Wire Line
	10650 9450 10350 9450
Wire Wire Line
	10650 9550 10350 9550
Text Label 10350 9250 0    50   ~ 0
IBUS0
Text Label 10350 9350 0    50   ~ 0
IBUS1
Text Label 10350 9450 0    50   ~ 0
IBUS2
Text Label 10350 9550 0    50   ~ 0
IBUS3
Wire Wire Line
	10650 10800 10350 10800
Wire Wire Line
	10650 10900 10350 10900
Wire Wire Line
	10650 11000 10350 11000
Wire Wire Line
	10650 11100 10350 11100
Text Label 10350 10800 0    50   ~ 0
IBUS4
Text Label 10350 10900 0    50   ~ 0
IBUS5
Text Label 10350 11000 0    50   ~ 0
IBUS6
Text Label 10350 11100 0    50   ~ 0
IBUS7
$Comp
L alexios:74LVC1G32 U?
U 1 1 5FC8CDDB
P 950 11600
F 0 "U?" H 1100 11500 50  0000 L CNN
F 1 "74LVC1G32" H 1100 11400 50  0000 L CNN
F 2 "" H 1060 11580 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1060 11580 50  0001 C CNN
	1    950  11600
	1    0    0    -1  
$EndComp
Text Notes 1800 10350 0    50   ~ 0
MBRs are written by:\n\n1. ~WRITE_MBP~ (address 0 always selected)\n2. ~WRITE_MBP+FLAGS~ (address 0 always selected)\n3. I/O Space writes (address is in AB[2:0])\n\nLogic here: select address 0 unless ~IOWMBR~\nasserted.
Text Notes 5300 12650 0    50   ~ 0
MBRs are read by:\n\n1. ~READ_MBP~ (address 0 always selected)\n2. ~READ_MBP+FLAGS~ (address 0 always selected)\n3. ~WRITE_AR_MBx~ (address in IR[2:0])\n    if IDXEN is low, address is 3 (011)\n    if IDXEN is high, address is IR[1:0] (range 0-3 only)\n4. I/O Space reads (address is in AB[1:0])\n\nValue should always be &00 or &80 if ~DIS~ is\nasserted.
Text Notes 5300 13400 0    50   ~ 0
~DIS~\n\n0\n1\n1\n1\n
Text Notes 5450 13400 0    50   ~ 0
~RMBP~\n\nX\n0\n1\n1\n
Wire Wire Line
	-3350 3700 -3750 3700
Wire Wire Line
	-3350 3800 -3750 3800
Wire Wire Line
	-3350 3900 -3750 3900
Wire Wire Line
	-3350 4400 -3750 4400
Text Label -3750 3700 0    50   ~ 0
RADDR1
Text Label -3750 3800 0    50   ~ 0
RADDR2
Text Label -3750 3900 0    50   ~ 0
RADDR3
Text Label -3750 4400 0    50   ~ 0
RADDR4
Text Notes -2800 4350 1    50   ~ 10
RADDR=01XXX
$Comp
L alexios:74HC138 U?
U 1 1 6022A4DB
P -2850 5350
AR Path="/5F3EA987/6022A4DB" Ref="U?"  Part="1" 
AR Path="/6022A4DB" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6022A4DB" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/6022A4DB" Ref="U?"  Part="1" 
F 0 "U?" H -2850 6017 50  0000 C CNN
F 1 "74HC138" H -2850 5926 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2850 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2850 5350 50  0001 C CNN
	1    -2850 5350
	1    0    0    -1  
$EndComp
Text Notes -2800 5600 1    50   ~ 10
WADDR=01XXX
Wire Wire Line
	-3350 5650 -3750 5650
Text Label -3750 5650 0    50   ~ 0
WADDR4
NoConn ~ -2350 3700
NoConn ~ -2350 3800
NoConn ~ -2350 3900
NoConn ~ -2350 4000
Text Label -1900 4300 2    50   ~ 0
~RMBP
Text Label -1900 5550 2    50   ~ 0
~WMBP
Wire Wire Line
	-2350 5550 -1900 5550
NoConn ~ -2350 4400
Wire Wire Line
	-2350 4300 -1900 4300
Wire Wire Line
	-3350 5750 -3400 5750
Wire Wire Line
	-3400 5750 -3400 5800
$Comp
L power:GND #PWR?
U 1 1 6022A507
P -3400 5800
F 0 "#PWR?" H -3400 5550 50  0001 C CNN
F 1 "GND" H -3395 5627 50  0000 C CNN
F 2 "" H -3400 5800 50  0001 C CNN
F 3 "" H -3400 5800 50  0001 C CNN
	1    -3400 5800
	1    0    0    -1  
$EndComp
Text HLabel -3800 4500 0    50   Input ~ 0
T34
Wire Wire Line
	-3800 4500 -3350 4500
Text Label -3750 4500 0    50   ~ 0
~T34
NoConn ~ -2350 4200
Text Notes -2200 3800 0    50   ~ 0
Asserted if CU addresses\nread_mbp (01100) or\nread_mbp_flags (01101),\nprovided the MBU has been\nprogrammed.
Text Notes -2200 5400 0    50   ~ 0
Asserted if CU addresses\nwrite_mbp (01100) or\nwrite_mbp_flags (01101).
NoConn ~ -2350 4100
Text Notes -2100 4400 0    50   ~ 0
RADDR=0110x
$Comp
L alexios:74HC138 U?
U 1 1 60A07F64
P -2850 4100
AR Path="/5F3EA987/60A07F64" Ref="U?"  Part="1" 
AR Path="/60A07F64" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60A07F64" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/60A07F64" Ref="U?"  Part="1" 
F 0 "U?" H -2850 4767 50  0000 C CNN
F 1 "74HC138" H -2850 4676 50  0000 C CNN
F 2 "alexios:SOIC-16" H -2850 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H -2850 4100 50  0001 C CNN
	1    -2850 4100
	1    0    0    -1  
$EndComp
Text Notes 5700 13400 0    50   ~ 0
~IOMBR~\n\nX\nX\n0\n1\n
Text Notes 6050 13400 0    50   ~ 0
~WA~\n\n000\n000\nAB[2:0]\nIR[1:0]\n
Text Notes 6450 13400 0    50   ~ 0
~Why~\n\nMBR init, gate disabled\nReading MB0, gate disabled\nI/O space read (IN)\nMBx:AR Indexing\n
$Comp
L alexios:74LVC2G157 U?
U 1 1 611B9660
P 900 9350
F 0 "U?" H 900 9717 50  0000 C CNN
F 1 "74LVC2G157" H 900 9626 50  0000 C CNN
F 2 "" H 800 9475 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 800 9475 50  0001 C CNN
	1    900  9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  9250 50   9250
Text Label 50   9250 0    50   ~ 0
AB0
Wire Wire Line
	1250 9250 1500 9250
Text Label 1500 9250 2    50   ~ 0
WA0
Wire Wire Line
	550  9450 50   9450
Text Label 50   9450 0    50   ~ 0
~IOMBR
NoConn ~ 1250 9550
Wire Wire Line
	550  9350 500  9350
$Comp
L power:GND #PWR?
U 1 1 6147B6A7
P 500 9600
F 0 "#PWR?" H 500 9350 50  0001 C CNN
F 1 "GND" H 505 9427 50  0000 C CNN
F 2 "" H 500 9600 50  0001 C CNN
F 3 "" H 500 9600 50  0001 C CNN
	1    500  9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	500  9350 500  9550
Wire Wire Line
	550  9550 500  9550
Connection ~ 500  9550
Wire Wire Line
	500  9550 500  9600
$Comp
L alexios:74LVC2G157 U?
U 1 1 6167666F
P 900 10150
F 0 "U?" H 900 10517 50  0000 C CNN
F 1 "74LVC2G157" H 900 10426 50  0000 C CNN
F 2 "" H 800 10275 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 800 10275 50  0001 C CNN
	1    900  10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  10050 50   10050
Text Label 50   10050 0    50   ~ 0
AB1
Wire Wire Line
	1250 10050 1500 10050
Text Label 1500 10050 2    50   ~ 0
WA1
Wire Wire Line
	550  10250 50   10250
Text Label 50   10250 0    50   ~ 0
~IOMBR
NoConn ~ 1250 10350
Wire Wire Line
	550  10150 500  10150
$Comp
L power:GND #PWR?
U 1 1 6167667D
P 500 10400
F 0 "#PWR?" H 500 10150 50  0001 C CNN
F 1 "GND" H 505 10227 50  0000 C CNN
F 2 "" H 500 10400 50  0001 C CNN
F 3 "" H 500 10400 50  0001 C CNN
	1    500  10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	500  10150 500  10350
Wire Wire Line
	550  10350 500  10350
Connection ~ 500  10350
Wire Wire Line
	500  10350 500  10400
$Comp
L alexios:74LVC2G157 U?
U 1 1 616C1C8D
P 900 10950
F 0 "U?" H 900 11317 50  0000 C CNN
F 1 "74LVC2G157" H 900 11226 50  0000 C CNN
F 2 "" H 800 11075 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 800 11075 50  0001 C CNN
	1    900  10950
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  10850 50   10850
Text Label 50   10850 0    50   ~ 0
AB2
Wire Wire Line
	550  11050 350  11050
Text Label 50   11050 0    50   ~ 0
~IOMBR
Wire Wire Line
	550  10950 500  10950
$Comp
L power:GND #PWR?
U 1 1 616C1C9B
P 500 11200
F 0 "#PWR?" H 500 10950 50  0001 C CNN
F 1 "GND" H 505 11027 50  0000 C CNN
F 2 "" H 500 11200 50  0001 C CNN
F 3 "" H 500 11200 50  0001 C CNN
	1    500  11200
	1    0    0    -1  
$EndComp
Wire Wire Line
	500  10950 500  11150
Wire Wire Line
	550  11150 500  11150
Connection ~ 500  11150
Wire Wire Line
	500  11150 500  11200
Text Notes 700  11350 0    50   ~ 0
tpd≅1–4ns
Text Label 5100 9350 0    50   ~ 0
IR0
Text Label 6400 9250 2    50   ~ 0
CUR0
Wire Wire Line
	5450 9550 5400 9550
$Comp
L power:GND #PWR?
U 1 1 60FCE661
P 5400 9600
F 0 "#PWR?" H 5400 9350 50  0001 C CNN
F 1 "GND" H 5405 9427 50  0000 C CNN
F 2 "" H 5400 9600 50  0001 C CNN
F 3 "" H 5400 9600 50  0001 C CNN
	1    5400 9600
	1    0    0    -1  
$EndComp
NoConn ~ 6150 9550
Wire Wire Line
	6150 9250 6400 9250
$Comp
L alexios:74LVC2G157 U?
U 1 1 60C94058
P 5800 9350
F 0 "U?" H 5800 9717 50  0000 C CNN
F 1 "74LVC2G157" H 5800 9626 50  0000 C CNN
F 2 "" H 5700 9475 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5700 9475 50  0001 C CNN
	1    5800 9350
	1    0    0    -1  
$EndComp
Text Label 5100 10100 0    50   ~ 0
IR1
Wire Wire Line
	5450 10100 5100 10100
Text Label 6400 10000 2    50   ~ 0
CUR1
Wire Wire Line
	5450 10300 5400 10300
$Comp
L power:GND #PWR?
U 1 1 618CB8BB
P 5400 10300
F 0 "#PWR?" H 5400 10050 50  0001 C CNN
F 1 "GND" V 5405 10172 50  0000 R CNN
F 2 "" H 5400 10300 50  0001 C CNN
F 3 "" H 5400 10300 50  0001 C CNN
	1    5400 10300
	0    1    1    0   
$EndComp
NoConn ~ 6150 10300
Wire Wire Line
	6150 10000 6400 10000
$Comp
L alexios:74LVC2G157 U?
U 1 1 618CB8C3
P 5800 10100
F 0 "U?" H 5800 10467 50  0000 C CNN
F 1 "74LVC2G157" H 5800 10376 50  0000 C CNN
F 2 "" H 5700 10225 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5700 10225 50  0001 C CNN
	1    5800 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 9350 6700 9350
Wire Wire Line
	7800 9250 8050 9250
Text Label 8050 9250 2    50   ~ 0
RA0
Wire Wire Line
	7100 9450 6700 9450
NoConn ~ 7800 9550
$Comp
L alexios:74LVC2G157 U?
U 1 1 619AEF6A
P 7450 9350
F 0 "U?" H 7450 9717 50  0000 C CNN
F 1 "74LVC2G157" H 7450 9626 50  0000 C CNN
F 2 "" H 7350 9475 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 7350 9475 50  0001 C CNN
	1    7450 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 9550 6700 9550
Text Label 6700 9550 0    50   ~ 0
~RG
Wire Wire Line
	6700 9250 7100 9250
Wire Wire Line
	7100 10100 6700 10100
Wire Wire Line
	7800 10000 8050 10000
Text Label 8050 10000 2    50   ~ 0
RA1
Wire Wire Line
	7100 10200 6700 10200
NoConn ~ 7800 10300
$Comp
L alexios:74LVC2G157 U?
U 1 1 61AE4D22
P 7450 10100
F 0 "U?" H 7450 10467 50  0000 C CNN
F 1 "74LVC2G157" H 7450 10376 50  0000 C CNN
F 2 "" H 7350 10225 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 7350 10225 50  0001 C CNN
	1    7450 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 10300 6700 10300
Text Label 6700 10300 0    50   ~ 0
~RG
Wire Wire Line
	6700 10000 7100 10000
Wire Wire Line
	7800 10750 8050 10750
Text Label 8050 10750 2    50   ~ 0
~REN0
Wire Wire Line
	7100 10950 6700 10950
Wire Wire Line
	7100 11050 6700 11050
$Comp
L alexios:74LVC2G157 U?
U 1 1 61B30001
P 7450 10850
F 0 "U?" H 7450 11217 50  0000 C CNN
F 1 "74LVC2G157" H 7450 11126 50  0000 C CNN
F 2 "" H 7350 10975 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 7350 10975 50  0001 C CNN
	1    7450 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 11050 8050 11050
Text Notes 7850 10850 0    50   ~ 0
≡RA2
Text Label 8050 11050 2    50   ~ 0
~REN1
Text Notes 7850 11150 0    50   ~ 0
≡~RA2~
Text Label 10100 9250 2    50   ~ 0
RD0
Text Label 10100 9350 2    50   ~ 0
RD1
Text Label 10100 9450 2    50   ~ 0
RD2
Text Label 10100 9550 2    50   ~ 0
RD3
Text Label 12000 9250 2    50   ~ 0
RD0
Text Label 12000 9350 2    50   ~ 0
RD1
Text Label 12000 9450 2    50   ~ 0
RD2
Text Label 12000 9550 2    50   ~ 0
RD3
Text Label 10100 10800 2    50   ~ 0
RD4
Text Label 10100 10900 2    50   ~ 0
RD5
Text Label 10100 11000 2    50   ~ 0
RD6
Text Label 10100 11100 2    50   ~ 0
RD7
Text Label 12000 10800 2    50   ~ 0
RD4
Text Label 12000 10900 2    50   ~ 0
RD5
Text Label 12000 11000 2    50   ~ 0
RD6
Text Label 12000 11100 2    50   ~ 0
RD7
Text Label -2000 8650 2    50   ~ 0
~EN
Wire Wire Line
	-2150 8650 -1950 8650
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 631AB2E9
P -1800 8650
F 0 "JP?" H -1800 8763 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H -1800 8764 50  0001 C CNN
F 2 "" H -1800 8650 50  0001 C CNN
F 3 "~" H -1800 8650 50  0001 C CNN
	1    -1800 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 8650 -1600 8650
Wire Wire Line
	-1400 8650 -1350 8650
Wire Wire Line
	-3150 10050 -2300 10050
Wire Wire Line
	-3150 9950 -3150 10050
$Comp
L Device:R_Small R?
U 1 1 60083AD2
P -3150 9850
AR Path="/60083AD2" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60083AD2" Ref="R?"  Part="1" 
AR Path="/5D54E677/60083AD2" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/60083AD2" Ref="R?"  Part="1" 
AR Path="/5DEAC282/60083AD2" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/60083AD2" Ref="R?"  Part="1" 
AR Path="/5D46B22D/60083AD2" Ref="R?"  Part="1" 
AR Path="/61F95ACC/60083AD2" Ref="R9"  Part="1" 
AR Path="/6005A9A5/60083AD2" Ref="R?"  Part="1" 
F 0 "R9" H -3209 9804 50  0000 R CNN
F 1 "4.7kΩ" H -3209 9895 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -3150 9850 50  0001 C CNN
F 3 "~" H -3150 9850 50  0001 C CNN
	1    -3150 9850
	-1   0    0    1   
$EndComp
Text HLabel -3600 10050 0    50   Input ~ 0
~FPRAM~∕ROM
Text Label -2300 10050 2    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	4100 -4050 4100 -1500
Wire Wire Line
	14800 12050 15100 12050
Wire Wire Line
	14800 11950 15100 11950
Wire Wire Line
	14800 11850 15100 11850
Wire Wire Line
	14800 11750 15100 11750
Wire Wire Line
	14800 11650 15100 11650
Wire Wire Line
	14800 11550 15100 11550
Wire Wire Line
	14800 11450 15100 11450
Wire Wire Line
	14800 11350 15100 11350
Text Label 14850 12050 0    50   ~ 0
AEXT7
Text Label 14850 11950 0    50   ~ 0
AEXT6
Text Label 14850 11850 0    50   ~ 0
AEXT5
Text Label 14850 11750 0    50   ~ 0
AEXT4
Text Label 14850 11650 0    50   ~ 0
AEXT3
Text Label 14850 11550 0    50   ~ 0
AEXT2
Text Label 14850 11450 0    50   ~ 0
AEXT1
Text Label 14850 11350 0    50   ~ 0
AEXT0
$Comp
L power:GND #PWR?
U 1 1 643A0C45
P 15050 10300
F 0 "#PWR?" H 15050 10050 50  0001 C CNN
F 1 "GND" H 15055 10127 50  0000 C CNN
F 2 "" H 15050 10300 50  0001 C CNN
F 3 "" H 15050 10300 50  0001 C CNN
	1    15050 10300
	1    0    0    -1  
$EndComp
Wire Wire Line
	15050 10250 15050 10300
Wire Wire Line
	15100 10250 15050 10250
Wire Wire Line
	15100 10150 14850 10150
Text Label 14850 10150 0    50   ~ 0
~RMBP
$Comp
L alexios:74HC541 U?
U 1 1 642AEC87
P 15600 9750
F 0 "U?" H 15950 9400 50  0000 L CNN
F 1 "74HC541" H 15950 9300 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 15600 9750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 15600 9750 50  0001 C CNN
	1    15600 9750
	1    0    0    -1  
$EndComp
Text Label 16500 10550 1    50   ~ 0
IBUS[0..15]
Entry Wire Line
	14700 10050 14800 9950
Entry Wire Line
	14700 9750 14800 9650
Entry Wire Line
	14700 9850 14800 9750
Entry Wire Line
	14700 9950 14800 9850
Entry Wire Line
	14700 9350 14800 9250
Entry Wire Line
	14700 9450 14800 9350
Entry Wire Line
	14700 9550 14800 9450
Entry Wire Line
	14700 9650 14800 9550
Entry Wire Line
	14700 12150 14800 12050
Entry Wire Line
	14700 11850 14800 11750
Entry Wire Line
	14700 11950 14800 11850
Entry Wire Line
	14700 12050 14800 11950
Entry Wire Line
	14700 11450 14800 11350
Entry Wire Line
	14700 11550 14800 11450
Entry Wire Line
	14700 11650 14800 11550
Entry Wire Line
	14700 11750 14800 11650
Text Label 14700 10700 1    50   ~ 0
AEXT[0..7]
Text Label 12350 11000 0    50   ~ 0
~EN
Wire Wire Line
	12800 11000 12350 11000
Text Label 12350 10900 0    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	12800 10900 12350 10900
Text Label 12350 10800 0    50   ~ 0
RD7
Wire Wire Line
	12800 10800 12350 10800
Wire Wire Line
	12750 11100 12750 11150
Wire Wire Line
	12800 11100 12750 11100
$Comp
L power:GND #PWR?
U 1 1 6363AFF6
P 12750 11150
F 0 "#PWR?" H 12750 10900 50  0001 C CNN
F 1 "GND" H 12755 10977 50  0000 C CNN
F 2 "" H 12750 11150 50  0001 C CNN
F 3 "" H 12750 11150 50  0001 C CNN
	1    12750 11150
	1    0    0    -1  
$EndComp
Text Label 13700 10800 0    50   ~ 0
AEXT7
Entry Wire Line
	14700 10900 14600 10800
Wire Wire Line
	13500 10800 14600 10800
$Comp
L alexios:74LVC2G157 U?
U 1 1 634B2C99
P 13150 10900
F 0 "U?" H 13150 11267 50  0000 C CNN
F 1 "74LVC2G157" H 13150 11176 50  0000 C CNN
F 2 "" H 13050 11025 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 13050 11025 50  0001 C CNN
	1    13150 10900
	1    0    0    -1  
$EndComp
Text Label 12350 10150 0    50   ~ 0
~EN
Connection ~ 12600 10250
Wire Wire Line
	12600 9950 12600 10250
Wire Wire Line
	12650 9950 12600 9950
NoConn ~ 13650 9950
Wire Wire Line
	13950 10450 13950 10400
Wire Wire Line
	12600 10250 12600 10300
Wire Wire Line
	12650 10250 12600 10250
$Comp
L power:GND #PWR?
U 1 1 62F393C5
P 12600 10300
F 0 "#PWR?" H 12600 10050 50  0001 C CNN
F 1 "GND" H 12605 10127 50  0000 C CNN
F 2 "" H 12600 10300 50  0001 C CNN
F 3 "" H 12600 10300 50  0001 C CNN
	1    12600 10300
	1    0    0    -1  
$EndComp
Text Label 12350 9850 0    50   ~ 0
RD6
Text Label 12350 9750 0    50   ~ 0
RD5
Text Label 12350 9650 0    50   ~ 0
RD4
Text Label 12350 9550 0    50   ~ 0
RD3
Text Label 12350 9450 0    50   ~ 0
RD2
Text Label 12350 9350 0    50   ~ 0
RD1
Text Label 12350 9250 0    50   ~ 0
RD0
Wire Wire Line
	12650 10150 12350 10150
Wire Wire Line
	12650 9850 12350 9850
Wire Wire Line
	12650 9750 12350 9750
Wire Wire Line
	12650 9650 12350 9650
Wire Wire Line
	12650 9550 12350 9550
Wire Wire Line
	12650 9450 12350 9450
Wire Wire Line
	12650 9350 12350 9350
Wire Wire Line
	12650 9250 12350 9250
$Comp
L alexios:74AC541 U?
U 1 1 62129F66
P 13150 9750
F 0 "U?" H 13150 10517 50  0000 C CNN
F 1 "74AC541" H 13150 10426 50  0000 C CNN
F 2 "" H 13150 9750 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 13150 9750 50  0001 C CNN
	1    13150 9750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U19
U 1 1 61720F4D
P 15600 11850
F 0 "U19" H 15950 11500 50  0000 L CNN
F 1 "74HC541" H 15950 11400 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 15600 11850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 15600 11850 50  0001 C CNN
	1    15600 11850
	1    0    0    -1  
$EndComp
Wire Wire Line
	15100 12350 14850 12350
Text Label 14850 12350 0    50   ~ 0
~R
Wire Wire Line
	15100 12250 14850 12250
Text Label 14850 12250 0    50   ~ 0
~IOMBR
Text Notes 14950 12550 0    50   ~ 0
IN (i.e. register read) transactions only!
Wire Wire Line
	14450 10400 14550 10400
Connection ~ 14450 10400
Wire Wire Line
	14450 10350 14450 10400
Wire Wire Line
	14350 10400 14450 10400
Connection ~ 14350 10400
Wire Wire Line
	14350 10350 14350 10400
Wire Wire Line
	14250 10400 14350 10400
Connection ~ 14250 10400
Wire Wire Line
	14250 10350 14250 10400
Connection ~ 14150 10400
Wire Wire Line
	14150 10350 14150 10400
Wire Wire Line
	14050 10400 14150 10400
Connection ~ 14050 10400
Wire Wire Line
	14050 10350 14050 10400
Wire Wire Line
	13950 10400 14050 10400
Wire Wire Line
	13950 10350 13950 10400
Wire Wire Line
	14550 10400 14550 10350
$Comp
L Device:R_Small R22
U 1 1 5E17FD33
P 14550 10250
F 0 "R22" V 14600 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14600 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14550 10250 50  0001 C CNN
F 3 "~" H 14550 10250 50  0001 C CNN
	1    14550 10250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R21
U 1 1 5E17FCA3
P 14450 10250
F 0 "R21" V 14500 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14500 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14450 10250 50  0001 C CNN
F 3 "~" H 14450 10250 50  0001 C CNN
	1    14450 10250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 5E17FC15
P 14350 10250
F 0 "R20" V 14400 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14400 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14350 10250 50  0001 C CNN
F 3 "~" H 14350 10250 50  0001 C CNN
	1    14350 10250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R19
U 1 1 5E17FB89
P 14250 10250
F 0 "R19" V 14300 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14300 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14250 10250 50  0001 C CNN
F 3 "~" H 14250 10250 50  0001 C CNN
	1    14250 10250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 5E17FAFF
P 14150 10250
F 0 "R18" V 14200 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14200 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14150 10250 50  0001 C CNN
F 3 "~" H 14150 10250 50  0001 C CNN
	1    14150 10250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5E17F9AD
P 14050 10250
F 0 "R17" V 14100 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14100 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14050 10250 50  0001 C CNN
F 3 "~" H 14050 10250 50  0001 C CNN
	1    14050 10250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R16
U 1 1 5E17E585
P 13950 10250
F 0 "R16" V 14000 10000 50  0000 L CNN
F 1 "4.7kΩ" H 14000 10300 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 13950 10250 50  0001 C CNN
F 3 "~" H 13950 10250 50  0001 C CNN
	1    13950 10250
	-1   0    0    1   
$EndComp
Wire Wire Line
	16100 11350 16400 11350
Wire Wire Line
	16100 11450 16400 11450
Wire Wire Line
	16100 11550 16400 11550
Wire Wire Line
	16100 11650 16400 11650
Wire Wire Line
	16100 11750 16400 11750
Wire Wire Line
	16100 11850 16400 11850
Wire Wire Line
	16100 11950 16400 11950
Wire Wire Line
	16100 12050 16400 12050
Entry Wire Line
	16500 11450 16400 11350
Entry Wire Line
	16500 11550 16400 11450
Entry Wire Line
	16500 11650 16400 11550
Entry Wire Line
	16500 11750 16400 11650
Entry Wire Line
	16500 11850 16400 11750
Entry Wire Line
	16500 11950 16400 11850
Entry Wire Line
	16500 12050 16400 11950
Entry Wire Line
	16500 12150 16400 12050
Text Label 16150 11350 0    50   ~ 0
DB0
Text Label 16150 11450 0    50   ~ 0
DB1
Text Label 16150 11550 0    50   ~ 0
DB2
Text Label 16150 11650 0    50   ~ 0
DB3
Text Label 16150 11750 0    50   ~ 0
DB4
Text Label 16150 11850 0    50   ~ 0
DB5
Text Label 16150 11950 0    50   ~ 0
DB6
Text Label 16150 12050 0    50   ~ 0
DB7
Wire Wire Line
	13650 9250 14550 9250
Wire Wire Line
	13650 9350 14450 9350
Wire Wire Line
	13650 9450 14350 9450
Wire Wire Line
	13650 9550 14250 9550
Wire Wire Line
	13650 9650 14150 9650
Wire Wire Line
	13650 9750 14050 9750
Wire Wire Line
	13650 9850 13950 9850
Wire Wire Line
	14550 9250 14600 9250
Connection ~ 14550 9250
Wire Wire Line
	14450 9350 14600 9350
Connection ~ 14450 9350
Wire Wire Line
	14350 9450 14600 9450
Connection ~ 14350 9450
Wire Wire Line
	14250 9550 14600 9550
Connection ~ 14250 9550
Wire Wire Line
	14150 9650 14600 9650
Connection ~ 14150 9650
Wire Wire Line
	14050 9750 14600 9750
Connection ~ 14050 9750
Wire Wire Line
	13950 9850 14600 9850
Connection ~ 13950 9850
Wire Wire Line
	14550 10150 14550 9250
Wire Wire Line
	14450 10150 14450 9350
Wire Wire Line
	14350 10150 14350 9450
Wire Wire Line
	14250 10150 14250 9550
Wire Wire Line
	14150 10150 14150 9650
Wire Wire Line
	14050 10150 14050 9750
Wire Wire Line
	13950 10150 13950 9850
$Comp
L power:GND #PWR057
U 1 1 60B7BF84
P 13950 10450
F 0 "#PWR057" H 13950 10200 50  0001 C CNN
F 1 "GND" H 13955 10277 50  0000 C CNN
F 2 "" H 13950 10450 50  0001 C CNN
F 3 "" H 13950 10450 50  0001 C CNN
	1    13950 10450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14800 9950 15100 9950
Wire Wire Line
	14800 9850 15100 9850
Wire Wire Line
	14800 9750 15100 9750
Wire Wire Line
	14800 9650 15100 9650
Wire Wire Line
	14800 9550 15100 9550
Wire Wire Line
	14800 9450 15100 9450
Wire Wire Line
	14800 9350 15100 9350
Wire Wire Line
	14800 9250 15100 9250
Entry Wire Line
	16500 10050 16400 9950
Entry Wire Line
	16500 9950 16400 9850
Entry Wire Line
	16500 9850 16400 9750
Entry Wire Line
	16500 9750 16400 9650
Entry Wire Line
	16500 9650 16400 9550
Entry Wire Line
	16500 9550 16400 9450
Entry Wire Line
	16500 9450 16400 9350
Entry Wire Line
	16500 9350 16400 9250
Entry Wire Line
	14700 9750 14600 9650
Entry Wire Line
	14700 9850 14600 9750
Entry Wire Line
	14700 9950 14600 9850
Entry Wire Line
	14700 9350 14600 9250
Entry Wire Line
	14700 9450 14600 9350
Entry Wire Line
	14700 9550 14600 9450
Entry Wire Line
	14700 9650 14600 9550
Wire Wire Line
	16100 9950 16400 9950
Wire Wire Line
	16100 9850 16400 9850
Wire Wire Line
	16100 9750 16400 9750
Wire Wire Line
	16100 9650 16400 9650
Wire Wire Line
	16100 9550 16400 9550
Wire Wire Line
	16100 9450 16400 9450
Wire Wire Line
	16100 9350 16400 9350
Wire Wire Line
	16100 9250 16400 9250
Text Label 16350 9950 2    50   ~ 0
IBUS7
Text Label 16350 9850 2    50   ~ 0
IBUS6
Text Label 16350 9750 2    50   ~ 0
IBUS5
Text Label 16350 9650 2    50   ~ 0
IBUS4
Text Label 16350 9550 2    50   ~ 0
IBUS3
Text Label 16350 9450 2    50   ~ 0
IBUS2
Text Label 16350 9350 2    50   ~ 0
IBUS1
Text Label 16350 9250 2    50   ~ 0
IBUS0
Text Label 14850 9950 0    50   ~ 0
AEXT7
Text Label 14850 9850 0    50   ~ 0
AEXT6
Text Label 14850 9750 0    50   ~ 0
AEXT5
Text Label 14850 9650 0    50   ~ 0
AEXT4
Text Label 14850 9550 0    50   ~ 0
AEXT3
Text Label 14850 9450 0    50   ~ 0
AEXT2
Text Label 14850 9350 0    50   ~ 0
AEXT1
Text Label 14850 9250 0    50   ~ 0
AEXT0
Text Label 13700 9850 0    50   ~ 0
AEXT6
Text Label 13700 9750 0    50   ~ 0
AEXT5
Text Label 13700 9650 0    50   ~ 0
AEXT4
Text Label 13700 9550 0    50   ~ 0
AEXT3
Text Label 13700 9450 0    50   ~ 0
AEXT2
Text Label 13700 9350 0    50   ~ 0
AEXT1
Text Label 13700 9250 0    50   ~ 0
AEXT0
Text Notes -2000 2300 2    50   ~ 0
AB=&008–&00F
Wire Wire Line
	-3350 4300 -3400 4300
Wire Wire Line
	-3400 4300 -3400 4250
$Comp
L power:+5V #PWR?
U 1 1 6467B62E
P -3400 4250
F 0 "#PWR?" H -3400 4100 50  0001 C CNN
F 1 "+5V" H -3385 4423 50  0000 C CNN
F 2 "" H -3400 4250 50  0001 C CNN
F 3 "" H -3400 4250 50  0001 C CNN
	1    -3400 4250
	1    0    0    -1  
$EndComp
Connection ~ 13950 10400
Wire Wire Line
	14150 10400 14250 10400
Wire Wire Line
	-3350 4950 -3750 4950
Wire Wire Line
	-3350 5050 -3750 5050
Wire Wire Line
	-3350 5150 -3750 5150
Text Label -3750 4950 0    50   ~ 0
WADDR1
Text Label -3750 5050 0    50   ~ 0
WADDR2
Text Label -3750 5150 0    50   ~ 0
WADDR3
Wire Wire Line
	-3350 5550 -3400 5550
Wire Wire Line
	-3400 5550 -3400 5500
$Comp
L power:+5V #PWR?
U 1 1 64826DD2
P -3400 5500
F 0 "#PWR?" H -3400 5350 50  0001 C CNN
F 1 "+5V" H -3385 5673 50  0000 C CNN
F 2 "" H -3400 5500 50  0001 C CNN
F 3 "" H -3400 5500 50  0001 C CNN
	1    -3400 5500
	1    0    0    -1  
$EndComp
NoConn ~ -2350 4950
NoConn ~ -2350 5050
NoConn ~ -2350 5150
NoConn ~ -2350 5250
NoConn ~ -2350 5350
NoConn ~ -2350 5450
NoConn ~ -2350 5650
Wire Wire Line
	-3400 6750 -3400 6800
Text Notes 850  11750 2    50   ~ 0
tpd≅4ns max
$Comp
L power:+5V #PWR?
U 1 1 60083AD8
P -3150 9700
AR Path="/6005A9A5/60083AD8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60083AD8" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H -3150 9550 50  0001 C CNN
F 1 "+5V" H -3250 9700 50  0000 C CNN
F 2 "" H -3150 9700 50  0001 C CNN
F 3 "" H -3150 9700 50  0001 C CNN
	1    -3150 9700
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3150 9700 -3150 9750
Wire Wire Line
	-3250 10050 -3150 10050
Connection ~ -3150 10050
Wire Wire Line
	-3600 10050 -3550 10050
$Comp
L Device:D_ALT D?
U 1 1 6553D07B
P -3400 10050
F 0 "D?" H -3400 10174 50  0000 C CNN
F 1 "D_ALT" H -3400 10175 50  0001 C CNN
F 2 "" H -3400 10050 50  0001 C CNN
F 3 "~" H -3400 10050 50  0001 C CNN
	1    -3400 10050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G0832 U?
U 1 1 65546336
P 2600 10750
F 0 "U?" H 2625 11064 50  0000 C CNN
F 1 "74LVC1G0832" H 2625 10973 50  0000 C CNN
F 2 "" H 2600 10750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 2600 10750 50  0001 C CNN
	1    2600 10750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 10850 2250 10850
Text Label 50   11900 0    50   ~ 0
~WBMP
Text Label 1250 11600 0    50   ~ 0
~IOWMBR
$Comp
L alexios:74LVC1G0832 U?
U 1 1 655473D5
P 2600 11250
F 0 "U?" H 2625 10969 50  0000 C CNN
F 1 "74LVC1G0832" H 2625 11060 50  0000 C CNN
F 2 "" H 2600 11250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 2600 11250 50  0001 C CNN
	1    2600 11250
	1    0    0    1   
$EndComp
Wire Wire Line
	1250 11150 2250 11150
Wire Wire Line
	1750 11350 1750 10650
Wire Wire Line
	1750 10650 2250 10650
Wire Wire Line
	1850 11250 1850 10750
Wire Wire Line
	1850 10750 2250 10750
Text Label 2250 10750 2    50   ~ 0
~WBMP
Text Label 2250 11250 2    50   ~ 0
~WBMP
Wire Wire Line
	1850 11250 2250 11250
Wire Wire Line
	1750 11350 2250 11350
Wire Wire Line
	1850 11900 1850 11250
Wire Wire Line
	50   11900 1850 11900
Connection ~ 1850 11250
Wire Wire Line
	1750 11600 1750 11350
Wire Wire Line
	1250 11600 1750 11600
Connection ~ 1750 11350
Text Notes 2400 11500 0    50   ~ 0
tpd≅1.2–4ns
Text Notes 2000 12000 0    50   ~ 0
Timing: ~WEN0~ & ~WEN1~ are latch enables and must be asserted\n>10ns after WA0 & WA1 change. The WA0 & WA1 muxes change on\n~IOMBR~ which happens early during T3. ~IOWMBR~ strobes in\nsync with the ~W~ strobe, which comes during T4, at least 62.5ns\nafter T3.
Text Label 3300 11250 2    50   ~ 0
~WEN1
Text Label 3300 10750 2    50   ~ 0
~WEN0
Wire Wire Line
	3000 10750 3300 10750
Wire Wire Line
	3000 11250 3300 11250
Text Label 2250 11350 2    50   ~ 0
~IOWMBR
Text Label 2250 10650 2    50   ~ 0
~IOWMBR
Wire Wire Line
	350  11050 350  11550
Wire Wire Line
	350  11550 750  11550
Connection ~ 350  11050
Wire Wire Line
	350  11050 50   11050
Wire Wire Line
	750  11650 50   11650
Text Label 50   11650 0    50   ~ 0
~W
Text Label 700  11550 2    50   ~ 0
~IOMBR
Text Label 5100 9250 0    50   ~ 0
WADDR0
Text Label 5100 10000 0    50   ~ 0
WADDR1
Text Label 5100 10200 0    50   ~ 0
USE-IR
Wire Wire Line
	5450 9450 5000 9450
Wire Wire Line
	5000 10200 5450 10200
Text Label 5100 9450 0    50   ~ 0
USE-IR
Text Label 4100 9700 0    50   ~ 0
WADDR0
Text Label 4100 9800 0    50   ~ 0
WADDR1
$Comp
L alexios:74LVC1G11 U?
U 1 1 6725B255
P 4750 9750
F 0 "U?" H 4700 9500 50  0000 C CNN
F 1 "74LVC1G11" H 4700 9409 50  0000 C CNN
F 2 "" H 4650 9675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 4650 9675 50  0001 C CNN
	1    4750 9750
	1    0    0    -1  
$EndComp
Text Label 4100 9900 0    50   ~ 0
IDXEN
Wire Wire Line
	5100 10000 5450 10000
Wire Wire Line
	4100 9900 4450 9900
Wire Wire Line
	5100 9250 5450 9250
Wire Wire Line
	5000 9450 5000 9800
Wire Wire Line
	5450 9350 5100 9350
Wire Wire Line
	4100 9700 4450 9700
Wire Wire Line
	4100 9800 4450 9800
Wire Wire Line
	4950 9800 5000 9800
Connection ~ 5000 9800
Wire Wire Line
	5000 9800 5000 10200
Wire Wire Line
	4800 9100 4500 9100
Wire Wire Line
	4000 9100 3650 9100
Text Label 4800 9100 2    50   ~ 0
~RG
Text Label 3650 9100 0    50   ~ 0
~RMBP
Text Label 6700 11050 0    50   ~ 0
~RG
$Comp
L alexios:74LVC1G04 U?
U 1 1 6807A17E
P 4300 9100
F 0 "U?" H 4250 9367 50  0000 C CNN
F 1 "74LVC1G04" H 4250 9276 50  0000 C CNN
F 2 "" H 4300 9100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 4300 9100 50  0001 C CNN
	1    4300 9100
	1    0    0    -1  
$EndComp
Text Label 6700 10950 0    50   ~ 0
~WAR
Text Label 6700 10200 0    50   ~ 0
~WAR
Text Label 6700 9450 0    50   ~ 0
~WAR
Wire Wire Line
	7100 10850 6700 10850
Text Label 6700 10850 0    50   ~ 0
AB2
Wire Wire Line
	5450 10850 5400 10850
Text Label 6400 10750 2    50   ~ 0
CUR2
Wire Wire Line
	5450 11050 5400 11050
$Comp
L power:GND #PWR?
U 1 1 68653169
P 5400 11100
F 0 "#PWR?" H 5400 10850 50  0001 C CNN
F 1 "GND" H 5405 10927 50  0000 C CNN
F 2 "" H 5400 11100 50  0001 C CNN
F 3 "" H 5400 11100 50  0001 C CNN
	1    5400 11100
	1    0    0    -1  
$EndComp
NoConn ~ 6150 11050
Wire Wire Line
	6150 10750 6400 10750
$Comp
L alexios:74LVC2G157 U?
U 1 1 68653171
P 5800 10850
F 0 "U?" H 5800 11217 50  0000 C CNN
F 1 "74LVC2G157" H 5800 11126 50  0000 C CNN
F 2 "" H 5700 10975 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5700 10975 50  0001 C CNN
	1    5800 10850
	1    0    0    -1  
$EndComp
Text Label 5100 10750 0    50   ~ 0
WADDR2
Text Label 5100 10950 0    50   ~ 0
USE-IR
Wire Wire Line
	5000 10950 5450 10950
Wire Wire Line
	5100 10750 5450 10750
Wire Wire Line
	5000 10200 5000 10950
Connection ~ 5000 10200
Wire Wire Line
	5400 11050 5400 11100
Wire Wire Line
	5400 11050 5400 10850
Connection ~ 5400 11050
Wire Wire Line
	6700 10750 7100 10750
Text Label 6700 10750 0    50   ~ 0
CUR2
Text Label 6700 10000 0    50   ~ 0
CUR1
Text Label 6700 10100 0    50   ~ 0
AB1
Text Label 6700 9350 0    50   ~ 0
AB0
Text Label 6700 9250 0    50   ~ 0
CUR0
Wire Wire Line
	5400 9550 5400 9600
Wire Bus Line
	4400 -3550 4400 -2300
Wire Bus Line
	-3750 2250 -3750 3050
Wire Bus Line
	1700 -6050 1700 -5300
Wire Bus Line
	1700 -4800 1700 -3300
Wire Bus Line
	16500 9350 16500 10550
Wire Bus Line
	16500 11450 16500 12400
Wire Bus Line
	6700 -4150 6700 -2300
Wire Bus Line
	9250 -4150 9250 -2350
Wire Bus Line
	14700 9350 14700 12400
$EndSCHEMATC
