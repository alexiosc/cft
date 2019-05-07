EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 21 23
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC253 U?
U 1 1 5F2B0B59
P 4550 2400
AR Path="/5F2B0B59" Ref="U?"  Part="1" 
AR Path="/5F26E13A/5F2B0B59" Ref="U?"  Part="1" 
F 0 "U?" H 4550 3367 50  0000 C CNN
F 1 "74HC253" H 4550 3276 50  0000 C CNN
F 2 "" H 4850 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS253" H 4850 3000 50  0001 C CNN
	1    4550 2400
	1    0    0    -1  
$EndComp
Text Notes 7950 2350 0    50   ~ 0
000 RBL: Roll Bit Left (RBL)\n001 RBR: Roll Bit Right \n010 RNL: Roll Nybble Left\n011 RNR: Roll Nybble Right\n000 NOT: Bitwise Inversion\n101 NOT: Bitwise Inversion\n110 CS1: Constant Store 1\n111 CS2: Constant Store 2
Text Notes 7950 1600 0    50   ~ 0
UOP[0..3]: Unary Operation Code
Text Notes 7000 1600 0    50   ~ 0
RUNIT[3..0]
Text Notes 7150 2350 0    50   ~ 0
1100\n1100\n1100\n1100\n1101\n1101\n1110\n1111
Text Notes 7500 1600 0    50   ~ 0
IR[2:0]
Text Notes 7550 2350 0    50   ~ 0
0X0\n0X1\n1X0\n1X1\nXXX\nXXX\nXXX\nXXX
Wire Notes Line width 12 style solid
	9250 2400 6950 2400
Wire Notes Line width 12 style solid
	6950 2400 6950 1450
Wire Notes Line width 12 style solid
	6950 1450 9250 1450
Wire Notes Line
	7850 1450 7850 2400
Wire Notes Line style solid
	6950 1650 9250 1650
Wire Notes Line width 12 style solid
	9250 1450 9250 2400
Text Notes 6950 3650 0    50   ~ 0
~UOE~ is asserted when RUNIT[3..0] is 11XX, so we only\nhave to decode RUNIT[1:0].\n\nUOP₂ = RUNIT₀ + RUNIT₁\nIf UOP₂ = 0:\n    UOP₀ = RUNIT₀\n    UOP₁ = RUNIT₁\nIf UOP₂ = 1:\n    UOP₀ = IR₀\n    UOP₁ = IR₂\n\nPartial decoding of the roll instructions is okay because the SBL unit and\nMicrocode have already ensured at least one bit in the field is set, so we\njust need to find out which one(s).\n
Wire Wire Line
	4050 1900 3950 1900
Wire Wire Line
	3950 1900 3950 2000
$Comp
L power:GND #PWR?
U 1 1 5F2B0B8C
P 3950 3250
AR Path="/5F2B0B8C" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0B8C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3950 3000 50  0001 C CNN
F 1 "GND" H 3955 3077 50  0000 C CNN
F 2 "" H 3950 3250 50  0001 C CNN
F 3 "" H 3950 3250 50  0001 C CNN
	1    3950 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2900 3950 2900
Connection ~ 3950 2900
Wire Wire Line
	3950 2900 3950 3200
Wire Wire Line
	4050 2000 3950 2000
Connection ~ 3950 2000
Wire Wire Line
	3950 2000 3950 2200
Wire Wire Line
	4050 2600 3950 2600
Connection ~ 3950 2600
Wire Wire Line
	3950 2600 3950 2700
Wire Wire Line
	4050 2700 3950 2700
Connection ~ 3950 2700
Wire Wire Line
	3950 2700 3950 2900
Wire Wire Line
	4050 3200 3950 3200
Connection ~ 3950 3200
Wire Wire Line
	3950 3200 3950 3250
Text Label 3900 3100 2    50   ~ 0
UOP2
Wire Wire Line
	3600 3100 3650 3100
Text Label 5050 1700 0    50   ~ 0
UOP0
Text Label 5050 2400 0    50   ~ 0
UOP1
Entry Bus Bus
	5500 2900 5400 2800
Text Label 5900 2900 2    50   ~ 0
UOP[0..2]
Wire Bus Line
	5500 2900 5950 2900
Wire Wire Line
	3650 3100 3650 3550
Connection ~ 3650 3100
Wire Wire Line
	3650 3100 4050 3100
Entry Wire Line
	5300 1700 5400 1800
Entry Wire Line
	5300 2400 5400 2500
Entry Bus Bus
	5400 3000 5500 2900
Wire Bus Line
	5400 3000 5400 3450
Entry Wire Line
	5300 3550 5400 3450
Text Label 5050 3550 0    50   ~ 0
UOP2
Text HLabel 5950 2900 2    50   Output ~ 0
UOP[0..2]
Text Label 2750 3050 0    50   ~ 0
RUNIT0
Text Label 2750 3150 0    50   ~ 0
RUNIT1
Wire Wire Line
	4050 2200 3950 2200
Connection ~ 3950 2200
Wire Wire Line
	3950 2200 3950 2600
Text Label 3900 1700 2    50   ~ 0
IR0
Text Label 3900 2400 2    50   ~ 0
IR2
Text Label 3900 1800 2    50   ~ 0
RUNIT0
Text Label 3900 2500 2    50   ~ 0
RUNIT1
Wire Wire Line
	2700 1800 4050 1800
Text Label 2750 1800 0    50   ~ 0
RUNIT0
Text Label 2750 2500 0    50   ~ 0
RUNIT1
Wire Wire Line
	3650 3550 5300 3550
Wire Wire Line
	5050 1700 5300 1700
Wire Wire Line
	5050 2400 5300 2400
Wire Wire Line
	2700 2500 4050 2500
Entry Wire Line
	2600 3250 2700 3150
Entry Wire Line
	2600 3150 2700 3050
Entry Wire Line
	2600 2600 2700 2500
Entry Wire Line
	2600 1900 2700 1800
Text Label 2600 3750 1    50   ~ 0
RUNIT[0..3]
Wire Wire Line
	2400 1700 4050 1700
Text HLabel 2400 2400 0    50   Input ~ 0
IR2
Text HLabel 2400 1700 0    50   Input ~ 0
IR0
Wire Wire Line
	2400 2400 4050 2400
Text Label 2750 1700 0    50   ~ 0
IR0
Text Label 2750 2400 0    50   ~ 0
IR2
$Comp
L alexios:74AHC1G32 U?
U 1 1 5F2B0BEF
P 3400 3100
AR Path="/5F2B0BEF" Ref="U?"  Part="1" 
AR Path="/5F26E13A/5F2B0BEF" Ref="U?"  Part="1" 
F 0 "U?" H 3350 3367 50  0000 C CNN
F 1 "74AHC1G32" H 3350 3276 50  0000 C CNN
F 2 "" H 3410 3080 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3410 3080 50  0001 C CNN
	1    3400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3050 3100 3050
Wire Wire Line
	2700 3150 3100 3150
$Comp
L alexios:74AHC1G32 U?
U 2 1 5F2B0BF7
P 1400 7050
AR Path="/5F2B0BF7" Ref="U?"  Part="2" 
AR Path="/5F26E13A/5F2B0BF7" Ref="U?"  Part="2" 
F 0 "U?" H 1530 6846 50  0000 L CNN
F 1 "74AHC1G32" H 1530 6755 50  0000 L CNN
F 2 "" H 1410 7030 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1410 7030 50  0001 C CNN
	2    1400 7050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC253 U?
U 2 1 5F2B0BFD
P 2850 7900
AR Path="/5F2B0BFD" Ref="U?"  Part="2" 
AR Path="/5F26E13A/5F2B0BFD" Ref="U?"  Part="2" 
F 0 "U?" H 3030 8546 50  0000 L CNN
F 1 "74HC253" H 3030 8455 50  0000 L CNN
F 2 "" H 3150 8500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS253" H 3150 8500 50  0001 C CNN
	2    2850 7900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5F2B0C03
P 4250 7300
AR Path="/5F2B0C03" Ref="U?"  Part="2" 
AR Path="/5F26E13A/5F2B0C03" Ref="U?"  Part="2" 
F 0 "U?" H 4430 7346 50  0000 L CNN
F 1 "74HC138" H 4430 7255 50  0000 L CNN
F 2 "" H 4250 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4250 7300 50  0001 C CNN
	2    4250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F2B0C09
P 3900 7300
AR Path="/5CC0D65F/5F2B0C09" Ref="C?"  Part="1" 
AR Path="/5F2B0C09" Ref="C?"  Part="1" 
AR Path="/5F26E13A/5F2B0C09" Ref="C?"  Part="1" 
F 0 "C?" H 3809 7346 50  0000 R CNN
F 1 "100nF" H 3809 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3900 7300 50  0001 C CNN
F 3 "~" H 3900 7300 50  0001 C CNN
	1    3900 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F2B0C0F
P 2500 7300
AR Path="/5CC0D65F/5F2B0C0F" Ref="C?"  Part="1" 
AR Path="/5F2B0C0F" Ref="C?"  Part="1" 
AR Path="/5F26E13A/5F2B0C0F" Ref="C?"  Part="1" 
F 0 "C?" H 2409 7346 50  0000 R CNN
F 1 "100nF" H 2409 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7300 50  0001 C CNN
F 3 "~" H 2500 7300 50  0001 C CNN
	1    2500 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F2B0C15
P 1000 7300
AR Path="/5CC0D65F/5F2B0C15" Ref="C?"  Part="1" 
AR Path="/5F2B0C15" Ref="C?"  Part="1" 
AR Path="/5F26E13A/5F2B0C15" Ref="C?"  Part="1" 
F 0 "C?" H 909 7346 50  0000 R CNN
F 1 "100nF" H 909 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1000 7300 50  0001 C CNN
F 3 "~" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F2B0C1B
P 1000 7400
AR Path="/5F2B0C1B" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0C1B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1000 7150 50  0001 C CNN
F 1 "GND" H 1005 7227 50  0000 C CNN
F 2 "" H 1000 7400 50  0001 C CNN
F 3 "" H 1000 7400 50  0001 C CNN
	1    1000 7400
	1    0    0    -1  
$EndComp
Connection ~ 1000 7400
$Comp
L power:GND #PWR?
U 1 1 5F2B0C22
P 2500 7400
AR Path="/5F2B0C22" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0C22" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 7150 50  0001 C CNN
F 1 "GND" H 2505 7227 50  0000 C CNN
F 2 "" H 2500 7400 50  0001 C CNN
F 3 "" H 2500 7400 50  0001 C CNN
	1    2500 7400
	1    0    0    -1  
$EndComp
Connection ~ 2500 7400
$Comp
L power:GND #PWR?
U 1 1 5F2B0C29
P 3900 7400
AR Path="/5F2B0C29" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0C29" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3900 7150 50  0001 C CNN
F 1 "GND" H 3905 7227 50  0000 C CNN
F 2 "" H 3900 7400 50  0001 C CNN
F 3 "" H 3900 7400 50  0001 C CNN
	1    3900 7400
	1    0    0    -1  
$EndComp
Connection ~ 3900 7400
$Comp
L power:+5V #PWR?
U 1 1 5F2B0C30
P 3900 7200
AR Path="/5F2B0C30" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0C30" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3900 7050 50  0001 C CNN
F 1 "+5V" H 3915 7373 50  0000 C CNN
F 2 "" H 3900 7200 50  0001 C CNN
F 3 "" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
Connection ~ 3900 7200
$Comp
L power:+5V #PWR?
U 1 1 5F2B0C37
P 2500 7200
AR Path="/5F2B0C37" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0C37" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2500 7050 50  0001 C CNN
F 1 "+5V" H 2515 7373 50  0000 C CNN
F 2 "" H 2500 7200 50  0001 C CNN
F 3 "" H 2500 7200 50  0001 C CNN
	1    2500 7200
	1    0    0    -1  
$EndComp
Connection ~ 2500 7200
$Comp
L power:+5V #PWR?
U 1 1 5F2B0C3E
P 1000 7200
AR Path="/5F2B0C3E" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0C3E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1000 7050 50  0001 C CNN
F 1 "+5V" H 1015 7373 50  0000 C CNN
F 2 "" H 1000 7200 50  0001 C CNN
F 3 "" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
Connection ~ 1000 7200
Text Notes 7150 7000 0    197  ~ 39
ALU Operation Decoder
Text Notes 6950 1250 0    100  ~ 20
Unary Operation & Constant Store Decoder
NoConn ~ 5050 4800
NoConn ~ 5050 4900
NoConn ~ 5050 5000
NoConn ~ 5050 5100
NoConn ~ 5050 5200
NoConn ~ 5050 5300
Text Notes 6900 4750 0    100  ~ 20
Binary/Unary Operation Decoder
Wire Wire Line
	5050 5500 5100 5500
Wire Wire Line
	5050 5400 5100 5400
$Comp
L Device:R_Small R?
U 1 1 5F2B0BE1
P 5200 5500
AR Path="/5F2B0BE1" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F2B0BE1" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F2B0BE1" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F2B0BE1" Ref="R?"  Part="1" 
AR Path="/5F26E13A/5F2B0BE1" Ref="R?"  Part="1" 
F 0 "R?" V 5096 5500 50  0000 C CNN
F 1 "30Ω" V 5005 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5200 5500 50  0001 C CNN
F 3 "~" H 5200 5500 50  0001 C CNN
	1    5200 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F2B0BDB
P 5200 5400
AR Path="/5F2B0BDB" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F2B0BDB" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5F2B0BDB" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5F2B0BDB" Ref="R?"  Part="1" 
AR Path="/5F26E13A/5F2B0BDB" Ref="R?"  Part="1" 
F 0 "R?" V 5396 5400 50  0000 C CNN
F 1 "30Ω" V 5305 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5200 5400 50  0001 C CNN
F 3 "~" H 5200 5400 50  0001 C CNN
	1    5200 5400
	0    -1   -1   0   
$EndComp
Text Label 2750 5000 0    50   ~ 0
~RSTHOLD
Text Label 2750 5400 0    50   ~ 0
~RESET
Text Label 2750 5500 0    50   ~ 0
~T34
Text HLabel 2400 5500 0    50   Input ~ 0
~T34
Text HLabel 2400 5400 0    50   Input ~ 0
~RESET
Text HLabel 2400 5000 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	2700 4900 4050 4900
Wire Wire Line
	2700 4800 4050 4800
Entry Bus Bus
	2600 4150 2500 4050
Entry Wire Line
	2700 4900 2600 4800
Entry Wire Line
	2700 4800 2600 4700
Text HLabel 5950 5500 2    50   Output ~ 0
~UOE
Text HLabel 5950 5400 2    50   Output ~ 0
~BOE
Wire Wire Line
	5300 5500 5950 5500
Wire Wire Line
	5300 5400 5950 5400
Text Label 5700 5500 2    50   ~ 0
~UOE
Text Label 5700 5400 2    50   ~ 0
~BOE
$Comp
L power:GND #PWR?
U 1 1 5F2B0B70
P 4000 5650
AR Path="/5F2B0B70" Ref="#PWR?"  Part="1" 
AR Path="/5F26E13A/5F2B0B70" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4000 5400 50  0001 C CNN
F 1 "GND" H 4005 5477 50  0000 C CNN
F 2 "" H 4000 5650 50  0001 C CNN
F 3 "" H 4000 5650 50  0001 C CNN
	1    4000 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5600 4000 5650
Wire Wire Line
	4050 5600 4000 5600
Text Label 4000 5500 2    50   ~ 0
~T34
Text Label 4000 5400 2    50   ~ 0
~RESET
Text Label 4050 5000 2    50   ~ 0
~RSTHOLD
Text Label 2750 4900 0    50   ~ 0
RUNIT3
Text Label 2750 4800 0    50   ~ 0
RUNIT2
Wire Wire Line
	4050 5500 2400 5500
Wire Wire Line
	4050 5400 2400 5400
$Comp
L alexios:74HC138 U?
U 1 1 5F2B0B61
P 4550 5200
AR Path="/5F2B0B61" Ref="U?"  Part="1" 
AR Path="/5F26E13A/5F2B0B61" Ref="U?"  Part="1" 
F 0 "U?" H 4550 5867 50  0000 C CNN
F 1 "74HC138" H 4550 5776 50  0000 C CNN
F 2 "" H 4550 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4550 5200 50  0001 C CNN
	1    4550 5200
	1    0    0    -1  
$EndComp
Text Notes 6950 5600 0    50   ~ 0
RUNIT[0..3] Partial Decoding for the ALU\n\n0XXX: ALU not selected for reading\n10XX: ALU binary operations\n11XX: ALU unary operations & constant store\n\nThe ALU is active on the bus when selected,\nin the latter half of the processor cycle, and\nif we're not resetting.
Text HLabel 2400 4050 0    50   Input ~ 0
RUNIT[0..3]
Wire Bus Line
	2500 4050 2400 4050
Entry Bus Bus
	2500 4050 2600 3950
Text Label 2600 4650 1    50   ~ 0
RUNIT[0..3]
Wire Wire Line
	2400 5000 4050 5000
Wire Bus Line
	5400 1800 5400 2800
Wire Bus Line
	2600 4150 2600 4800
Wire Bus Line
	2600 1900 2600 3950
$EndSCHEMATC
