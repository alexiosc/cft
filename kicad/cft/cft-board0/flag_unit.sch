EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
Title "Flag Unit"
Date ""
Rev "2023"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "flag_unit.v"
$EndDescr
Text Label 7250 2050 0    50   ~ 0
RSVD14
Text Label 7250 5500 0    50   ~ 0
FI
Text Label 7250 5300 0    50   ~ 0
FV
Text Label 7250 5200 0    50   ~ 0
FL
Text Label 7250 5100 0    50   ~ 0
FZ
Text Label 7250 5000 0    50   ~ 0
FN
Text Label 7250 4900 0    50   ~ 0
FPRSVD9
Text Label 7250 4800 0    50   ~ 0
FPRSVD8
Text Label 7250 2150 0    50   ~ 0
FI
Text Label 7250 1950 0    50   ~ 0
FV
Text Label 7250 1850 0    50   ~ 0
FL
Text Label 7250 1750 0    50   ~ 0
FZ
Text Label 7250 1650 0    50   ~ 0
FN
Wire Wire Line
	7600 1950 6850 1950
Text Label 7250 1550 0    50   ~ 0
RSVD9
Text Label 7250 1450 0    50   ~ 0
RSVD8
Wire Wire Line
	7600 2150 6750 2150
Wire Wire Line
	7600 1850 6950 1850
Wire Wire Line
	7600 1750 7050 1750
Text Label 7250 2350 0    50   ~ 0
~READ-FL
Text Label 9700 6250 2    50   ~ 0
FPD[0..7]
Text Label 9050 6050 1    50   ~ 0
FPD[0..7]
Text Label 9700 2950 2    50   ~ 0
IBUS[8..15]
Text Label 9050 2750 1    50   ~ 0
IBUS[8..15]
Text HLabel 9800 6250 2    50   3State ~ 0
FPD[0..7]
Text HLabel 9800 2950 2    50   3State ~ 0
IBUS[8..15]
Wire Bus Line
	9150 6250 9800 6250
Wire Bus Line
	9150 2950 9800 2950
Entry Bus Bus
	9050 6150 9150 6250
Entry Bus Bus
	9050 2850 9150 2950
Entry Wire Line
	8950 2150 9050 2250
Entry Wire Line
	8950 2050 9050 2150
Entry Wire Line
	8950 1950 9050 2050
Entry Wire Line
	8950 1850 9050 1950
Entry Wire Line
	8950 1750 9050 1850
Entry Wire Line
	8950 1650 9050 1750
Entry Wire Line
	8950 1550 9050 1650
Entry Wire Line
	8950 1450 9050 1550
Entry Wire Line
	8950 5500 9050 5600
Entry Wire Line
	8950 5400 9050 5500
Entry Wire Line
	8950 5300 9050 5400
Entry Wire Line
	8950 5200 9050 5300
Entry Wire Line
	8950 5100 9050 5200
Entry Wire Line
	8950 5000 9050 5100
Entry Wire Line
	8950 4900 9050 5000
Entry Wire Line
	8950 4800 9050 4900
Text HLabel 1900 5700 0    50   Input ~ 0
~FPFLAGS
Text Label 7250 5700 0    50   ~ 0
~FPFLAGS
$Comp
L power:GND #PWR?
U 1 1 5D676F48
P 7600 5800
AR Path="/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F48" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F48" Ref="#PWR01210"  Part="1" 
F 0 "#PWR01210" H 7600 5550 50  0001 C CNN
F 1 "GND" H 7605 5627 50  0000 C CNN
F 2 "" H 7600 5800 50  0001 C CNN
F 3 "" H 7600 5800 50  0001 C CNN
	1    7600 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D676F4E
P 7600 2450
AR Path="/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D676F4E" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5D676F4E" Ref="#PWR01204"  Part="1" 
F 0 "#PWR01204" H 7600 2200 50  0001 C CNN
F 1 "GND" H 7605 2277 50  0000 C CNN
F 2 "" H 7600 2450 50  0001 C CNN
F 3 "" H 7600 2450 50  0001 C CNN
	1    7600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5500 8950 5500
Wire Wire Line
	8600 5400 8950 5400
Wire Wire Line
	8600 5300 8950 5300
Wire Wire Line
	8600 5200 8950 5200
Wire Wire Line
	8600 5100 8950 5100
Wire Wire Line
	8600 5000 8950 5000
Wire Wire Line
	8600 4900 8950 4900
Wire Wire Line
	8600 4800 8950 4800
$Comp
L alexios:74HC541 U?
U 1 1 5D676F64
P 8100 5300
AR Path="/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F64" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F64" Ref="U1202"  Part="1" 
F 0 "U1202" H 8100 6067 50  0000 C CNN
F 1 "74HC541" H 8100 5976 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8100 5300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8100 5300 50  0001 C CNN
	1    8100 5300
	1    0    0    -1  
$EndComp
Text Label 8950 2150 2    50   ~ 0
IBUS15
Text Label 8950 2050 2    50   ~ 0
IBUS14
Text Label 8950 1950 2    50   ~ 0
IBUS13
Text Label 8950 1850 2    50   ~ 0
IBUS12
Text Label 8950 1750 2    50   ~ 0
IBUS11
Text Label 8950 1650 2    50   ~ 0
IBUS10
Text Label 8950 1550 2    50   ~ 0
IBUS9
Text Label 8950 1450 2    50   ~ 0
IBUS8
Wire Wire Line
	8600 2150 8950 2150
Wire Wire Line
	8600 1950 8950 1950
Wire Wire Line
	8600 1850 8950 1850
Wire Wire Line
	8600 1750 8950 1750
Wire Wire Line
	8600 1650 8950 1650
Wire Wire Line
	8600 1550 8950 1550
Wire Wire Line
	8600 1450 8950 1450
$Comp
L alexios:74HC541 U?
U 1 1 5D676F7A
P 8100 1950
AR Path="/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D676F7A" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/5D676F7A" Ref="U1201"  Part="1" 
F 0 "U1201" H 8100 2717 50  0000 C CNN
F 1 "74HC541" H 8100 2626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8100 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8100 1950 50  0001 C CNN
	1    8100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 1650 7150 1650
Wire Wire Line
	7150 5000 7600 5000
Wire Wire Line
	7050 5100 7600 5100
Wire Wire Line
	6950 5200 7600 5200
Wire Wire Line
	6850 5300 7600 5300
Wire Wire Line
	6750 5500 7600 5500
Wire Wire Line
	6750 5500 1900 5500
Text HLabel 1900 5500 0    50   Input ~ 0
FI
Text HLabel 1900 5300 0    50   Input ~ 0
FV
Text HLabel 1900 5200 0    50   Input ~ 0
FL
Text HLabel 1900 5100 0    50   Input ~ 0
FZ
Text HLabel 1900 5000 0    50   Input ~ 0
FN
Text Label 6750 2900 1    50   ~ 0
FI
Text Label 6850 2900 1    50   ~ 0
FV
Text Label 6950 2900 1    50   ~ 0
FL
Text Label 7050 2900 1    50   ~ 0
FZ
Text Label 7150 2900 1    50   ~ 0
FN
Text Label 2000 5000 0    50   ~ 0
FN
Text Label 2000 5100 0    50   ~ 0
FZ
Text Label 2000 5200 0    50   ~ 0
FL
Text Label 2000 5300 0    50   ~ 0
FV
Text Label 2000 5500 0    50   ~ 0
FI
Text Label 7250 5400 0    50   ~ 0
FPRSVD14
Text Label 8650 4800 0    50   ~ 0
FPD0
Text Label 8650 4900 0    50   ~ 0
FPD1
Text Label 8650 5000 0    50   ~ 0
FPD2
Text Label 8650 5100 0    50   ~ 0
FPD3
Text Label 8650 5200 0    50   ~ 0
FPD4
Text Label 8650 5300 0    50   ~ 0
FPD5
Text Label 8650 5400 0    50   ~ 0
FPD6
Text Label 8650 5500 0    50   ~ 0
FPD7
$Comp
L power:+5V #PWR?
U 1 1 5DDC2767
P 9550 1800
AR Path="/5F4B0011/5DDC2767" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC2767" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC2767" Ref="#PWR01201"  Part="1" 
F 0 "#PWR01201" H 9550 1650 50  0001 C CNN
F 1 "+5V" H 9565 1973 50  0000 C CNN
F 2 "" H 9550 1800 50  0001 C CNN
F 3 "" H 9550 1800 50  0001 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDC276D
P 9550 2000
AR Path="/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC276D" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC276D" Ref="#PWR01202"  Part="1" 
F 0 "#PWR01202" H 9550 1750 50  0001 C CNN
F 1 "GND" H 9555 1827 50  0000 C CNN
F 2 "" H 9550 2000 50  0001 C CNN
F 3 "" H 9550 2000 50  0001 C CNN
	1    9550 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DDC2773
P 9550 1900
AR Path="/5CC0D65F/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5F63066B/5DDC2773" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5DDC2773" Ref="C1201"  Part="1" 
F 0 "C1201" H 9459 1946 50  0000 R CNN
F 1 "100nF" H 9459 1855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 1900 50  0001 C CNN
F 3 "~" H 9550 1900 50  0001 C CNN
	1    9550 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5DDC2779
P 9900 1900
AR Path="/5F4B0011/5DDC2779" Ref="U?"  Part="2" 
AR Path="/5F63066B/5DDC2779" Ref="U?"  Part="2" 
AR Path="/5D69F3FD/5DDC2779" Ref="U1201"  Part="2" 
F 0 "U1201" H 10080 1946 50  0000 L CNN
F 1 "74HC541" H 10080 1855 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9900 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 9900 1900 50  0001 C CNN
	2    9900 1900
	1    0    0    -1  
$EndComp
Connection ~ 9550 2000
Connection ~ 9550 1800
$Comp
L power:+5V #PWR?
U 1 1 5DDC83A1
P 9550 5150
AR Path="/5F4B0011/5DDC83A1" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC83A1" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC83A1" Ref="#PWR01207"  Part="1" 
F 0 "#PWR01207" H 9550 5000 50  0001 C CNN
F 1 "+5V" H 9565 5323 50  0000 C CNN
F 2 "" H 9550 5150 50  0001 C CNN
F 3 "" H 9550 5150 50  0001 C CNN
	1    9550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DDC83A7
P 9550 5350
AR Path="/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5DDC83A7" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/5DDC83A7" Ref="#PWR01208"  Part="1" 
F 0 "#PWR01208" H 9550 5100 50  0001 C CNN
F 1 "GND" H 9555 5177 50  0000 C CNN
F 2 "" H 9550 5350 50  0001 C CNN
F 3 "" H 9550 5350 50  0001 C CNN
	1    9550 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DDC83AD
P 9550 5250
AR Path="/5CC0D65F/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5F63066B/5DDC83AD" Ref="C?"  Part="1" 
AR Path="/5D69F3FD/5DDC83AD" Ref="C1202"  Part="1" 
F 0 "C1202" H 9459 5296 50  0000 R CNN
F 1 "100nF" H 9459 5205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 5250 50  0001 C CNN
F 3 "~" H 9550 5250 50  0001 C CNN
	1    9550 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5DDC83B3
P 9900 5250
AR Path="/5F4B0011/5DDC83B3" Ref="U?"  Part="2" 
AR Path="/5F63066B/5DDC83B3" Ref="U?"  Part="2" 
AR Path="/5D69F3FD/5DDC83B3" Ref="U1202"  Part="2" 
F 0 "U1202" H 10080 5296 50  0000 L CNN
F 1 "74HC541" H 10080 5205 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9900 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 9900 5250 50  0001 C CNN
	2    9900 5250
	1    0    0    -1  
$EndComp
Connection ~ 9550 5350
Connection ~ 9550 5150
Text Notes 7500 4400 0    98   ~ 20
Front Panel Buffer
Wire Wire Line
	8600 2050 8950 2050
Text Notes 7650 2950 0    98   ~ 20
IBus Buffer
Connection ~ 6850 5300
Connection ~ 6950 5200
Connection ~ 7050 5100
Connection ~ 7150 5000
Wire Wire Line
	6850 1950 6850 5300
Wire Wire Line
	6950 1850 6950 5200
Wire Wire Line
	7050 1750 7050 5100
Wire Wire Line
	7150 1650 7150 5000
Text Notes 1350 1950 0    50   ~ 0
The flag unit collects the values of all the flags in the processor and puts them on the IBus. This is used by the\ncontrol unit to store flags onto the stack, which is necessary to implement subrouines and interrupts.\n\nIt can also read some of these flags and update them. Not all flags can be updated this way. The Link (L)\nflag/register, Interrupt flag (I), and Overflow (V) flag can be written to this way. The Negative (N) and\nZero (Z) flags are read-only because they depend directly on the value of the AC. They are automatically\nrestored when the AC is popped from the stack.\n\nSince all flags are implemented in their respective units, this unit simply provides a ~FLAGWE~ strobe which\nindividual flags can use to set themselves from the appropriate IBUS signal.
Text Notes 1350 1000 0    98   ~ 20
The Flag Unit
Connection ~ 6750 5500
Wire Wire Line
	6750 2150 6750 5500
Text Notes 4000 6700 0    50   ~ 0
These solder jumpers can be used to change the meanings\nof the unused LEDs on the flag section of the front panel.\nThey should be fully bridged (ground, LED off) until this is required.\n\nThe bridge between pads 2 and 3 can be cut to change a bit on the\nIBus but not on the front panel.\n\nTo change it for both, cut the bridge between pads 1 and 2.
Connection ~ 6650 4900
Connection ~ 6650 5400
Wire Wire Line
	6650 4800 6650 4900
Wire Wire Line
	6650 4900 6650 5400
Wire Wire Line
	6650 5400 6650 5750
$Comp
L power:GND #PWR01209
U 1 1 61E0C769
P 6650 5750
F 0 "#PWR01209" H 6650 5500 50  0001 C CNN
F 1 "GND" H 6655 5577 50  0000 C CNN
F 2 "" H 6650 5750 50  0001 C CNN
F 3 "" H 6650 5750 50  0001 C CNN
	1    6650 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1550 6150 2050
Connection ~ 6150 1550
Wire Wire Line
	6150 2050 6150 2100
Connection ~ 6150 2050
$Comp
L power:GND #PWR01203
U 1 1 61DEC249
P 6150 2100
F 0 "#PWR01203" H 6150 1850 50  0001 C CNN
F 1 "GND" H 6155 1927 50  0000 C CNN
F 2 "" H 6150 2100 50  0001 C CNN
F 3 "" H 6150 2100 50  0001 C CNN
	1    6150 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1450 6150 1550
Wire Wire Line
	6650 4800 7600 4800
Wire Wire Line
	6650 4900 7600 4900
Wire Wire Line
	6650 5400 7600 5400
Wire Wire Line
	6150 1450 7600 1450
Wire Wire Line
	6150 2050 7600 2050
Wire Wire Line
	6150 1550 7600 1550
Text Notes 6150 1150 0    50   ~ 0
These traces are named, but connected to ground directly.\nThe traces on the board are long so they can be cut and the\nsignals repurposed (e.g. tied to Vcc).
Text Label 2000 2350 0    50   ~ 0
~READ-FL
Text HLabel 1950 2350 0    50   Input ~ 0
~READ-FL
Wire Wire Line
	1950 2350 7600 2350
$Comp
L Device:R_Small R?
U 1 1 609A7128
P 2500 4750
AR Path="/61F95ACC/609A7128" Ref="R?"  Part="1" 
AR Path="/5F63066B/609A7128" Ref="R?"  Part="1" 
AR Path="/5D69F3FD/609A7128" Ref="R1201"  Part="1" 
F 0 "R1201" H 2559 4796 50  0000 L CNN
F 1 "4.7kΩ" H 2559 4705 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2500 4750 50  0001 C CNN
F 3 "~" H 2500 4750 50  0001 C CNN
	1    2500 4750
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609A712E
P 2500 4650
AR Path="/61F95ACC/609A712E" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/609A712E" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/609A712E" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 2500 4500 50  0001 C CNN
F 1 "+5V" H 2515 4823 50  0000 C CNN
F 2 "" H 2500 4650 50  0001 C CNN
F 3 "" H 2500 4650 50  0001 C CNN
	1    2500 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609C9CF9
P 3250 6200
AR Path="/61F95ACC/609C9CF9" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/609C9CF9" Ref="#PWR?"  Part="1" 
AR Path="/5D69F3FD/609C9CF9" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 3250 5950 50  0001 C CNN
F 1 "GND" H 3255 6027 50  0000 C CNN
F 2 "" H 3250 6200 50  0001 C CNN
F 3 "" H 3250 6200 50  0001 C CNN
	1    3250 6200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1900 5100 3050 5100
Wire Wire Line
	1900 5000 2950 5000
Wire Wire Line
	1900 5200 3150 5200
Wire Wire Line
	1900 5300 3250 5300
Wire Wire Line
	2950 5800 2950 5000
Connection ~ 2950 5000
Wire Wire Line
	2950 5000 7150 5000
Wire Wire Line
	3050 5800 3050 5100
Connection ~ 3050 5100
Wire Wire Line
	3050 5100 7050 5100
Wire Wire Line
	3150 5800 3150 5200
Connection ~ 3150 5200
Wire Wire Line
	3150 5200 6950 5200
Wire Wire Line
	3250 5800 3250 5300
Connection ~ 3250 5300
Wire Wire Line
	3250 5300 6850 5300
$Comp
L Device:R_Network04 RN?
U 1 1 609C9CFF
P 3050 6000
AR Path="/61F95ACC/6888FBA2/609C9CFF" Ref="RN?"  Part="1" 
AR Path="/61F95ACC/609C9CFF" Ref="RN?"  Part="1" 
AR Path="/5D69F3FD/609C9CFF" Ref="RN1201"  Part="1" 
F 0 "RN1201" H 2770 5954 50  0000 R CNN
F 1 "10kΩ" H 2770 6045 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP5" V 3525 6000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3050 6000 50  0001 C CNN
	1    3050 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 5700 2500 5700
Wire Wire Line
	2500 4850 2500 5700
Wire Bus Line
	9050 4900 9050 6150
Wire Bus Line
	9050 1550 9050 2850
Connection ~ 2500 5700
Wire Wire Line
	2500 5700 7600 5700
$EndSCHEMATC
