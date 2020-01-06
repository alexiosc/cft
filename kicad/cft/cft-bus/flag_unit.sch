EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 8
Title "Flag Unit"
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 7450 2050 0    50   ~ 0
F14
Text Label 7450 5800 0    50   ~ 0
FI
Text Label 7450 5600 0    50   ~ 0
FV
Text Label 7450 5500 0    50   ~ 0
FL
Text Label 7450 5400 0    50   ~ 0
FZ
Text Label 7450 5300 0    50   ~ 0
FN
Text Label 7450 5200 0    50   ~ 0
FPF9
Text Label 7450 5100 0    50   ~ 0
FPF8
Wire Wire Line
	7800 5700 7450 5700
Wire Wire Line
	7800 5200 7450 5200
Wire Wire Line
	7800 5100 7450 5100
Text Label 7450 2150 0    50   ~ 0
FI
Text Label 7450 1950 0    50   ~ 0
FV
Text Label 7450 1850 0    50   ~ 0
FL
Text Label 7450 1750 0    50   ~ 0
FZ
Text Label 7450 1650 0    50   ~ 0
FN
Wire Wire Line
	7800 1950 7050 1950
Text Label 7450 1550 0    50   ~ 0
F9
Text Label 7450 1450 0    50   ~ 0
F8
Wire Wire Line
	7800 2150 6950 2150
Wire Wire Line
	7800 2050 7450 2050
Wire Wire Line
	7800 1850 7150 1850
Wire Wire Line
	7800 1750 7250 1750
Wire Wire Line
	7800 1550 7450 1550
Wire Wire Line
	7800 1450 7450 1450
Text Label 7450 2350 0    50   ~ 0
~FLAGOE
Text Label 9900 6550 2    50   ~ 0
FPD[0..7]
Text Label 9250 6350 1    50   ~ 0
FPD[0..7]
Text Label 9900 2950 2    50   ~ 0
IBUS[8..15]
Text Label 9250 2750 1    50   ~ 0
IBUS[8..15]
Text HLabel 10000 6550 2    50   3State ~ 0
FPD[0..7]
Text HLabel 10000 2950 2    50   3State ~ 0
IBUS[8..15]
Wire Bus Line
	9350 6550 10000 6550
Wire Bus Line
	9350 2950 10000 2950
Entry Bus Bus
	9250 6450 9350 6550
Entry Bus Bus
	9250 2850 9350 2950
Entry Wire Line
	9150 2150 9250 2250
Entry Wire Line
	9150 2050 9250 2150
Entry Wire Line
	9150 1950 9250 2050
Entry Wire Line
	9150 1850 9250 1950
Entry Wire Line
	9150 1750 9250 1850
Entry Wire Line
	9150 1650 9250 1750
Entry Wire Line
	9150 1550 9250 1650
Entry Wire Line
	9150 1450 9250 1550
Entry Wire Line
	9150 5800 9250 5900
Entry Wire Line
	9150 5700 9250 5800
Entry Wire Line
	9150 5600 9250 5700
Entry Wire Line
	9150 5500 9250 5600
Entry Wire Line
	9150 5400 9250 5500
Entry Wire Line
	9150 5300 9250 5400
Entry Wire Line
	9150 5200 9250 5300
Entry Wire Line
	9150 5100 9250 5200
Text HLabel 7450 6000 0    50   Input ~ 0
~FPFLAGS
Text Label 7450 6000 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	7800 6000 7450 6000
$Comp
L power:GND #PWR?
U 1 1 5D676F48
P 7800 6100
AR Path="/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5D676F48" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 7800 5850 50  0001 C CNN
F 1 "GND" H 7805 5927 50  0000 C CNN
F 2 "" H 7800 6100 50  0001 C CNN
F 3 "" H 7800 6100 50  0001 C CNN
	1    7800 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D676F4E
P 7800 2450
AR Path="/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5D676F4E" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 7800 2200 50  0001 C CNN
F 1 "GND" H 7805 2277 50  0000 C CNN
F 2 "" H 7800 2450 50  0001 C CNN
F 3 "" H 7800 2450 50  0001 C CNN
	1    7800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5800 9150 5800
Wire Wire Line
	8800 5700 9150 5700
Wire Wire Line
	8800 5600 9150 5600
Wire Wire Line
	8800 5500 9150 5500
Wire Wire Line
	8800 5400 9150 5400
Wire Wire Line
	8800 5300 9150 5300
Wire Wire Line
	8800 5200 9150 5200
Wire Wire Line
	8800 5100 9150 5100
$Comp
L alexios:74HC541 U?
U 1 1 5D676F64
P 8300 5600
AR Path="/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F64" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5D676F64" Ref="U7"  Part="1" 
F 0 "U7" H 8300 6367 50  0000 C CNN
F 1 "74HC541" H 8300 6276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8300 5600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 5600 50  0001 C CNN
	1    8300 5600
	1    0    0    -1  
$EndComp
Text Label 9150 2150 2    50   ~ 0
IBUS15
Text Label 9150 2050 2    50   ~ 0
IBUS14
Text Label 9150 1950 2    50   ~ 0
IBUS13
Text Label 9150 1850 2    50   ~ 0
IBUS12
Text Label 9150 1750 2    50   ~ 0
IBUS11
Text Label 9150 1650 2    50   ~ 0
IBUS10
Text Label 9150 1550 2    50   ~ 0
IBUS9
Text Label 9150 1450 2    50   ~ 0
IBUS8
Wire Wire Line
	8800 2150 9150 2150
Wire Wire Line
	8800 2050 9150 2050
Wire Wire Line
	8800 1950 9150 1950
Wire Wire Line
	8800 1850 9150 1850
Wire Wire Line
	8800 1750 9150 1750
Wire Wire Line
	8800 1650 9150 1650
Wire Wire Line
	8800 1550 9150 1550
Wire Wire Line
	8800 1450 9150 1450
$Comp
L alexios:74HC541 U?
U 1 1 5D676F7A
P 8300 1950
AR Path="/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5D676F7A" Ref="U4"  Part="1" 
F 0 "U4" H 8300 2717 50  0000 C CNN
F 1 "74HC541" H 8300 2626 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8300 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 1950 50  0001 C CNN
	1    8300 1950
	1    0    0    -1  
$EndComp
Text Label 6150 3300 0    50   ~ 0
~FLAGWE
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D676FD3
P 5500 3300
AR Path="/5D676FD3" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FD3" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FD3" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5D676FD3" Ref="U6"  Part="1" 
F 0 "U6" H 5425 3567 50  0000 C CNN
F 1 "74LVC1G08" H 5425 3476 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5150 3300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 3300 50  0001 C CNN
	1    5500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2300 5200 2300
Wire Wire Line
	2100 2400 5200 2400
Text Label 5200 2300 2    50   ~ 0
~READ-MBP+FLAGS
Text Label 5200 2400 2    50   ~ 0
~READ-FLAGS
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D676FDD
P 5500 2350
AR Path="/5D676FDD" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676FDD" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676FDD" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5D676FDD" Ref="U5"  Part="1" 
F 0 "U5" H 5425 2617 50  0000 C CNN
F 1 "74LVC1G08" H 5425 2526 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5150 2350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 2350 50  0001 C CNN
	1    5500 2350
	1    0    0    -1  
$EndComp
Text Label 5950 2350 2    50   ~ 0
~FLAGOE
Text Label 5200 3350 2    50   ~ 0
~WRITE-FLAGS
Text Label 5200 3250 2    50   ~ 0
~WRITE-MBP+FLAGS
Wire Wire Line
	2100 3350 5200 3350
Wire Wire Line
	2100 3250 5200 3250
Wire Wire Line
	7800 1650 7350 1650
Wire Wire Line
	7350 5300 7800 5300
Wire Wire Line
	7250 5400 7800 5400
Wire Wire Line
	7150 5500 7800 5500
Wire Wire Line
	7050 5600 7800 5600
Wire Wire Line
	6950 5800 7800 5800
Text HLabel 10000 3300 2    50   Output ~ 0
~FLAGWE
Text Label 6950 4400 1    50   ~ 0
FI
Text Label 7050 4400 1    50   ~ 0
FV
Text Label 7150 4400 1    50   ~ 0
FL
Text Label 7250 4400 1    50   ~ 0
FZ
Text Label 7350 4400 1    50   ~ 0
FN
Text Label 7450 5700 0    50   ~ 0
FPF14
Text Notes 4750 1800 0    50   ~ 0
Some flags respond to ~FLAGWE~ assertions by\nsampling the appropriate bit of the IBUS and\nmodifying their values.\n\nThe only flags that can currently be set this way\nare FI, FL and FV (FI is here, FL & FV are on the\nALU board). FZ and FN are controlled by the\ncurrent value of the AC.
Text Label 8850 5100 0    50   ~ 0
FPD0
Text Label 8850 5200 0    50   ~ 0
FPD1
Text Label 8850 5300 0    50   ~ 0
FPD2
Text Label 8850 5400 0    50   ~ 0
FPD3
Text Label 8850 5500 0    50   ~ 0
FPD4
Text Label 8850 5600 0    50   ~ 0
FPD5
Text Label 8850 5700 0    50   ~ 0
FPD6
Text Label 8850 5800 0    50   ~ 0
FPD7
Text Notes 3900 6650 0    50   ~ 0
These solder jumpers can be used to change the meanings\nof the unused LEDs on the flag section of the front panel.\nThey should be bridged (ground, LED off) until this is required.
$Comp
L Jumper:SolderJumper_3_Bridged123 JP2
U 1 1 5E0D2D96
P 4550 8850
F 0 "JP2" V 4400 8600 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 4505 8917 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4550 8850 50  0001 C CNN
F 3 "~" H 4550 8850 50  0001 C CNN
	1    4550 8850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 8850 5050 8850
Text Label 5050 8850 2    50   ~ 0
FPF8
$Comp
L power:GND #PWR021
U 1 1 5E0E6829
P 4550 9050
F 0 "#PWR021" H 4550 8800 50  0001 C CNN
F 1 "GND" H 4555 8877 50  0000 C CNN
F 2 "" H 4550 9050 50  0001 C CNN
F 3 "" H 4550 9050 50  0001 C CNN
	1    4550 9050
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged123 JP4
U 1 1 5E0F938B
P 4550 9600
F 0 "JP4" V 4400 9500 50  0000 R CNN
F 1 "SolderJumper_3_Bridged123" V 4505 9667 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4550 9600 50  0001 C CNN
F 3 "~" H 4550 9600 50  0001 C CNN
	1    4550 9600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 9600 5050 9600
Text Label 5050 9600 2    50   ~ 0
FPF9
Text Label 3300 9350 0    50   ~ 0
RSVD9
$Comp
L power:GND #PWR024
U 1 1 5E0F9395
P 4550 9800
F 0 "#PWR024" H 4550 9550 50  0001 C CNN
F 1 "GND" H 4555 9627 50  0000 C CNN
F 2 "" H 4550 9800 50  0001 C CNN
F 3 "" H 4550 9800 50  0001 C CNN
	1    4550 9800
	1    0    0    -1  
$EndComp
Text HLabel 2100 3250 0    50   Input ~ 0
~WRITE-MBP+FLAGS
Text HLabel 2100 3350 0    50   Input ~ 0
~WRITE-FLAGS
Text Label 2200 3250 0    50   ~ 0
~WRITE-MBP+FLAGS
Text Label 2200 3350 0    50   ~ 0
~WRITE-FLAGS
Text HLabel 2100 2300 0    50   Input ~ 0
~READ-MBP+FLAGS
Text HLabel 2100 2400 0    50   Input ~ 0
~READ-FLAGS
Text Label 2200 2300 0    50   ~ 0
~READ-MBP+FLAGS
Text Label 2200 2400 0    50   ~ 0
~READ-FLAGS
Text Label 9500 3300 0    50   ~ 0
~FLAGWE
Wire Notes Line width 20 style solid
	4650 850  6850 850 
Wire Notes Line width 20 style solid
	4650 1900 4650 850 
Wire Notes Line width 20 style solid
	6850 1900 4650 1900
Wire Notes Line width 20 style solid
	6850 850  6850 1900
Text Notes 4750 1050 0    63   ~ 13
Writing to Flags
Text Notes 2200 2850 0    50   ~ 0
These signals are decoded in the MBU.
Wire Wire Line
	7350 1650 7350 3850
Wire Wire Line
	7250 1750 7250 3950
Wire Wire Line
	7150 1850 7150 4050
Wire Wire Line
	7050 1950 7050 4150
Wire Wire Line
	6950 2150 6950 4250
Text Label 2200 4250 0    50   ~ 0
FI
Text Label 2200 4150 0    50   ~ 0
FV
Text Label 2200 4050 0    50   ~ 0
FL
Text Label 2200 3950 0    50   ~ 0
FZ
Text Label 2200 3850 0    50   ~ 0
FN
Text HLabel 2100 3850 0    50   Input ~ 0
FN
Text HLabel 2100 3950 0    50   Input ~ 0
FZ
Text HLabel 2100 4050 0    50   Input ~ 0
FL
Text HLabel 2100 4150 0    50   Input ~ 0
FV
Text HLabel 2100 4250 0    50   Input ~ 0
FI
Wire Wire Line
	7350 3850 2100 3850
Wire Wire Line
	7250 3950 2100 3950
Wire Wire Line
	7150 4050 2100 4050
Wire Wire Line
	7050 4150 2100 4150
Wire Wire Line
	6950 4250 2100 4250
Connection ~ 6950 4250
Wire Wire Line
	6950 4250 6950 5800
Connection ~ 7050 4150
Wire Wire Line
	7050 4150 7050 5600
Connection ~ 7150 4050
Wire Wire Line
	7150 4050 7150 5500
Connection ~ 7250 3950
Wire Wire Line
	7250 3950 7250 5400
Connection ~ 7350 3850
Wire Wire Line
	7350 3850 7350 5300
Wire Wire Line
	5650 2350 7800 2350
Text Label 6600 4250 0    50   ~ 0
FI
Text Label 6600 4150 0    50   ~ 0
FV
Text Label 6600 4050 0    50   ~ 0
FL
Text Label 6600 3950 0    50   ~ 0
FZ
Text Label 6600 3850 0    50   ~ 0
FN
Text Notes 7850 1050 0    100  ~ 20
Flag Output
Text Notes 7550 4650 0    100  ~ 20
Front Panel Buffer
Text Notes 9500 2200 0    50   ~ 0
Only the most significant 8 bits\nof the IBus are driven here.\nThe least significant 8 bits come\nfrom the MBU (which responds\non the same IBus addresses) and\ncontain the value of MBP.
Wire Notes Line width 20 style solid
	9400 1400 10950 1400
Wire Notes Line width 20 style solid
	9400 2300 9400 1400
Wire Notes Line width 20 style solid
	10950 2300 9400 2300
Wire Notes Line width 20 style solid
	10950 1400 10950 2300
Text Notes 9500 1600 0    63   ~ 13
Note
$Comp
L Jumper:SolderJumper_3_Bridged123 JP1
U 1 1 5E458A52
P 3800 8850
F 0 "JP1" V 3650 9000 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 3755 8917 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 3800 8850 50  0001 C CNN
F 3 "~" H 3800 8850 50  0001 C CNN
	1    3800 8850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 8850 4250 8850
Wire Wire Line
	3800 8600 3300 8600
Text Label 3300 8600 0    50   ~ 0
RSVD8
$Comp
L power:GND #PWR019
U 1 1 5E458A5C
P 3800 9050
F 0 "#PWR019" H 3800 8800 50  0001 C CNN
F 1 "GND" H 3805 8877 50  0000 C CNN
F 2 "" H 3800 9050 50  0001 C CNN
F 3 "" H 3800 9050 50  0001 C CNN
	1    3800 9050
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged123 JP3
U 1 1 5E472E1A
P 3800 9600
F 0 "JP3" V 3800 9700 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 3755 9667 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 3800 9600 50  0001 C CNN
F 3 "~" H 3800 9600 50  0001 C CNN
	1    3800 9600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 9600 4250 9600
Wire Wire Line
	3800 9350 3300 9350
$Comp
L power:GND #PWR022
U 1 1 5E472E23
P 3800 9800
F 0 "#PWR022" H 3800 9550 50  0001 C CNN
F 1 "GND" H 3805 9627 50  0000 C CNN
F 2 "" H 3800 9800 50  0001 C CNN
F 3 "" H 3800 9800 50  0001 C CNN
	1    3800 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 8650 4550 8600
Wire Wire Line
	4550 8600 4250 8600
Wire Wire Line
	4250 8600 4250 8850
Wire Wire Line
	4550 9400 4550 9350
Wire Wire Line
	4550 9350 4250 9350
Wire Wire Line
	4250 9350 4250 9600
Wire Wire Line
	3800 8600 3800 8650
Wire Wire Line
	3800 9350 3800 9400
Text Label 3950 8850 0    50   ~ 0
F8
Text Label 3950 9600 0    50   ~ 0
F9
$Comp
L Jumper:SolderJumper_3_Bridged123 JP6
U 1 1 5E4BF464
P 4550 10350
F 0 "JP6" V 4400 10250 50  0000 R CNN
F 1 "SolderJumper_3_Bridged123" V 4505 10417 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 4550 10350 50  0001 C CNN
F 3 "~" H 4550 10350 50  0001 C CNN
	1    4550 10350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 10350 5050 10350
Text Label 5050 10350 2    50   ~ 0
FPF14
Text Label 3300 10100 0    50   ~ 0
RSVD14
$Comp
L power:GND #PWR027
U 1 1 5E4BF46D
P 4550 10550
F 0 "#PWR027" H 4550 10300 50  0001 C CNN
F 1 "GND" H 4555 10377 50  0000 C CNN
F 2 "" H 4550 10550 50  0001 C CNN
F 3 "" H 4550 10550 50  0001 C CNN
	1    4550 10550
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged123 JP5
U 1 1 5E4BF473
P 3800 10350
F 0 "JP5" V 3800 10450 50  0000 L CNN
F 1 "SolderJumper_3_Bridged123" V 3755 10417 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 3800 10350 50  0001 C CNN
F 3 "~" H 3800 10350 50  0001 C CNN
	1    3800 10350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 10350 4250 10350
Wire Wire Line
	3800 10100 3300 10100
$Comp
L power:GND #PWR025
U 1 1 5E4BF47B
P 3800 10550
F 0 "#PWR025" H 3800 10300 50  0001 C CNN
F 1 "GND" H 3805 10377 50  0000 C CNN
F 2 "" H 3800 10550 50  0001 C CNN
F 3 "" H 3800 10550 50  0001 C CNN
	1    3800 10550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 10150 4550 10100
Wire Wire Line
	4550 10100 4250 10100
Wire Wire Line
	4250 10100 4250 10350
Wire Wire Line
	3800 10100 3800 10150
Text Label 3950 10350 0    50   ~ 0
F14
$Comp
L Device:R_Small R4
U 1 1 5E4CC2F9
P 4250 10450
F 0 "R4" H 4309 10496 50  0000 L CNN
F 1 "4.7kΩ" H 4309 10405 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 10450 50  0001 C CNN
F 3 "~" H 4250 10450 50  0001 C CNN
	1    4250 10450
	-1   0    0    -1  
$EndComp
Connection ~ 4250 10350
$Comp
L power:GND #PWR026
U 1 1 5E4CD7D9
P 4250 10550
F 0 "#PWR026" H 4250 10300 50  0001 C CNN
F 1 "GND" H 4255 10377 50  0000 C CNN
F 2 "" H 4250 10550 50  0001 C CNN
F 3 "" H 4250 10550 50  0001 C CNN
	1    4250 10550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5E4D2862
P 4250 9700
F 0 "R3" H 4309 9746 50  0000 L CNN
F 1 "4.7kΩ" H 4309 9655 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 9700 50  0001 C CNN
F 3 "~" H 4250 9700 50  0001 C CNN
	1    4250 9700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5E4D2868
P 4250 9800
F 0 "#PWR023" H 4250 9550 50  0001 C CNN
F 1 "GND" H 4255 9627 50  0000 C CNN
F 2 "" H 4250 9800 50  0001 C CNN
F 3 "" H 4250 9800 50  0001 C CNN
	1    4250 9800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5E4D5E9F
P 4250 8950
F 0 "R2" H 4309 8996 50  0000 L CNN
F 1 "4.7kΩ" H 4309 8905 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 8950 50  0001 C CNN
F 3 "~" H 4250 8950 50  0001 C CNN
	1    4250 8950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5E4D5EA5
P 4250 9050
F 0 "#PWR020" H 4250 8800 50  0001 C CNN
F 1 "GND" H 4255 8877 50  0000 C CNN
F 2 "" H 4250 9050 50  0001 C CNN
F 3 "" H 4250 9050 50  0001 C CNN
	1    4250 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3300 10000 3300
$Comp
L Device:C_Small C?
U 1 1 5E4432BE
P 1050 7200
AR Path="/5CC0D65F/5E4432BE" Ref="C?"  Part="1" 
AR Path="/5E4432BE" Ref="C?"  Part="1" 
AR Path="/5D30488D/5E4432BE" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5E4432BE" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E4432BE" Ref="C?"  Part="1" 
AR Path="/5DF0FECB/5E4432BE" Ref="C45"  Part="1" 
F 0 "C45" H 959 7246 50  0000 R CNN
F 1 "100nF" H 959 7155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7200 50  0001 C CNN
F 3 "~" H 1050 7200 50  0001 C CNN
	1    1050 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4432C5
P 1050 7300
AR Path="/5E4432C5" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E4432C5" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E4432C5" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E4432C5" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E4432C5" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 1050 7050 50  0001 C CNN
F 1 "GND" H 1055 7127 50  0000 C CNN
F 2 "" H 1050 7300 50  0001 C CNN
F 3 "" H 1050 7300 50  0001 C CNN
	1    1050 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4432CB
P 1050 7100
AR Path="/5E4432CB" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E4432CB" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E4432CB" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E4432CB" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E4432CB" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 1050 6950 50  0001 C CNN
F 1 "+5V" H 1065 7273 50  0000 C CNN
F 2 "" H 1050 7100 50  0001 C CNN
F 3 "" H 1050 7100 50  0001 C CNN
	1    1050 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 2 1 5E445753
P 1500 7100
AR Path="/5E445753" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E445753" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E445753" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5E445753" Ref="U5"  Part="2" 
F 0 "U5" H 1580 7046 50  0000 L CNN
F 1 "74LVC1G08" H 1580 6955 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1150 7100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 1150 7100 50  0001 C CNN
	2    1500 7100
	1    0    0    -1  
$EndComp
Connection ~ 1050 7300
Connection ~ 1050 7100
$Comp
L Device:C_Small C?
U 1 1 5E445909
P 2500 7200
AR Path="/5CC0D65F/5E445909" Ref="C?"  Part="1" 
AR Path="/5E445909" Ref="C?"  Part="1" 
AR Path="/5D30488D/5E445909" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5E445909" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E445909" Ref="C?"  Part="1" 
AR Path="/5DF0FECB/5E445909" Ref="C46"  Part="1" 
F 0 "C46" H 2409 7246 50  0000 R CNN
F 1 "100nF" H 2409 7155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7200 50  0001 C CNN
F 3 "~" H 2500 7200 50  0001 C CNN
	1    2500 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E445910
P 2500 7300
AR Path="/5E445910" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E445910" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E445910" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E445910" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E445910" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2500 7050 50  0001 C CNN
F 1 "GND" H 2505 7127 50  0000 C CNN
F 2 "" H 2500 7300 50  0001 C CNN
F 3 "" H 2500 7300 50  0001 C CNN
	1    2500 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E445916
P 2500 7100
AR Path="/5E445916" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E445916" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E445916" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E445916" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E445916" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 2500 6950 50  0001 C CNN
F 1 "+5V" H 2515 7273 50  0000 C CNN
F 2 "" H 2500 7100 50  0001 C CNN
F 3 "" H 2500 7100 50  0001 C CNN
	1    2500 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 2 1 5E44591C
P 2950 7100
AR Path="/5E44591C" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E44591C" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E44591C" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5E44591C" Ref="U6"  Part="2" 
F 0 "U6" H 3030 7046 50  0000 L CNN
F 1 "74LVC1G08" H 3030 6955 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2600 7100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2600 7100 50  0001 C CNN
	2    2950 7100
	1    0    0    -1  
$EndComp
Connection ~ 2500 7300
Connection ~ 2500 7100
$Comp
L Device:C_Small C?
U 1 1 5E44F860
P 3950 7200
AR Path="/5CC0D65F/5E44F860" Ref="C?"  Part="1" 
AR Path="/5E44F860" Ref="C?"  Part="1" 
AR Path="/5D30488D/5E44F860" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5E44F860" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E44F860" Ref="C?"  Part="1" 
AR Path="/5DF0FECB/5E44F860" Ref="C47"  Part="1" 
F 0 "C47" H 3859 7246 50  0000 R CNN
F 1 "100nF" H 3859 7155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3950 7200 50  0001 C CNN
F 3 "~" H 3950 7200 50  0001 C CNN
	1    3950 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E44F867
P 3950 7300
AR Path="/5E44F867" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E44F867" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E44F867" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E44F867" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E44F867" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 3950 7050 50  0001 C CNN
F 1 "GND" H 3955 7127 50  0000 C CNN
F 2 "" H 3950 7300 50  0001 C CNN
F 3 "" H 3950 7300 50  0001 C CNN
	1    3950 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E44F86D
P 3950 7100
AR Path="/5E44F86D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E44F86D" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E44F86D" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E44F86D" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E44F86D" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 3950 6950 50  0001 C CNN
F 1 "+5V" H 3965 7273 50  0000 C CNN
F 2 "" H 3950 7100 50  0001 C CNN
F 3 "" H 3950 7100 50  0001 C CNN
	1    3950 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E451E6A
P 5400 7200
AR Path="/5CC0D65F/5E451E6A" Ref="C?"  Part="1" 
AR Path="/5E451E6A" Ref="C?"  Part="1" 
AR Path="/5D30488D/5E451E6A" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5E451E6A" Ref="C?"  Part="1" 
AR Path="/5D46B22D/5E451E6A" Ref="C?"  Part="1" 
AR Path="/5DF0FECB/5E451E6A" Ref="C48"  Part="1" 
F 0 "C48" H 5309 7246 50  0000 R CNN
F 1 "100nF" H 5309 7155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 7200 50  0001 C CNN
F 3 "~" H 5400 7200 50  0001 C CNN
	1    5400 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E451E71
P 5400 7300
AR Path="/5E451E71" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E451E71" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E451E71" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E451E71" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E451E71" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 5400 7050 50  0001 C CNN
F 1 "GND" H 5405 7127 50  0000 C CNN
F 2 "" H 5400 7300 50  0001 C CNN
F 3 "" H 5400 7300 50  0001 C CNN
	1    5400 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E451E77
P 5400 7100
AR Path="/5E451E77" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5E451E77" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5E451E77" Ref="#PWR?"  Part="1" 
AR Path="/5D46B22D/5E451E77" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FECB/5E451E77" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 5400 6950 50  0001 C CNN
F 1 "+5V" H 5415 7273 50  0000 C CNN
F 2 "" H 5400 7100 50  0001 C CNN
F 3 "" H 5400 7100 50  0001 C CNN
	1    5400 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5E4566AD
P 4300 7200
AR Path="/5E4566AD" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E4566AD" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E4566AD" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5E4566AD" Ref="U4"  Part="2" 
F 0 "U4" H 4479 7246 50  0000 L CNN
F 1 "74HC541" H 4479 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4300 7200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4300 7200 50  0001 C CNN
	2    4300 7200
	1    0    0    -1  
$EndComp
Connection ~ 3950 7300
Connection ~ 3950 7100
$Comp
L alexios:74HC541 U?
U 2 1 5E45742B
P 5750 7200
AR Path="/5E45742B" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5E45742B" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5E45742B" Ref="U?"  Part="1" 
AR Path="/5DF0FECB/5E45742B" Ref="U7"  Part="2" 
F 0 "U7" H 5929 7246 50  0000 L CNN
F 1 "74HC541" H 5929 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5750 7200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5750 7200 50  0001 C CNN
	2    5750 7200
	1    0    0    -1  
$EndComp
Connection ~ 5400 7300
Connection ~ 5400 7100
Wire Bus Line
	9250 5200 9250 6450
Wire Bus Line
	9250 1550 9250 2850
$EndSCHEMATC
