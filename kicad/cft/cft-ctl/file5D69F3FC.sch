EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 38 38
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1600 7150 2    50   ~ 0
RSVD8
Text Label 1600 7300 2    50   ~ 0
RSVD9
Wire Wire Line
	1050 7300 1600 7300
Wire Wire Line
	1050 7150 1600 7150
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5D6B2443
P 900 7150
AR Path="/5D6B2443" Ref="JP?"  Part="1" 
AR Path="/5D65F6EF/5D6B2443" Ref="JP?"  Part="1" 
F 0 "JP?" H 1100 7200 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 900 7264 50  0001 C CNN
F 2 "" H 900 7150 50  0001 C CNN
F 3 "~" H 900 7150 50  0001 C CNN
	1    900  7150
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5D6B2449
P 900 7300
AR Path="/5D6B2449" Ref="JP?"  Part="1" 
AR Path="/5D65F6EF/5D6B2449" Ref="JP?"  Part="1" 
F 0 "JP?" H 1100 7350 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 900 7414 50  0001 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "~" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D6B244F
P 700 7050
AR Path="/5D6B244F" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B244F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 700 6900 50  0001 C CNN
F 1 "+5V" H 715 7223 50  0000 C CNN
F 2 "" H 700 7050 50  0001 C CNN
F 3 "" H 700 7050 50  0001 C CNN
	1    700  7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  7300 750  7300
Wire Wire Line
	750  7150 700  7150
Text Label 7450 1700 0    50   ~ 0
RSVD14
Text Label 7450 5350 0    50   ~ 0
RSVD14
Text Label 7450 5450 0    50   ~ 0
FI
Text Label 7450 5250 0    50   ~ 0
FV
Text Label 7450 5150 0    50   ~ 0
FL
Text Label 7450 5050 0    50   ~ 0
FZ
Text Label 7450 4950 0    50   ~ 0
FN
Text Label 7450 4850 0    50   ~ 0
RSVD9
Text Label 7450 4750 0    50   ~ 0
RSVD8
Wire Wire Line
	7800 5350 7450 5350
Wire Wire Line
	7800 4850 7450 4850
Wire Wire Line
	7800 4750 7450 4750
Text Label 7450 1800 0    50   ~ 0
FI
Text Label 7450 1600 0    50   ~ 0
FV
Text Label 7450 1500 0    50   ~ 0
FL
Text Label 7450 1400 0    50   ~ 0
FZ
Text Label 7450 1300 0    50   ~ 0
FN
Wire Wire Line
	7800 1600 7050 1600
Text Label 7450 1200 0    50   ~ 0
RSVD9
Text Label 7450 1100 0    50   ~ 0
RSVD8
Wire Wire Line
	7800 1800 6950 1800
Wire Wire Line
	7800 1700 7450 1700
Wire Wire Line
	7800 1500 7150 1500
Wire Wire Line
	7800 1400 7250 1400
Wire Wire Line
	7800 1200 7450 1200
Wire Wire Line
	7800 1100 7450 1100
Text Label 7450 2000 0    50   ~ 0
~FLAGOE
Text Label 9900 6200 2    50   ~ 0
FPO[0..7]
Text Label 9250 6000 1    50   ~ 0
FPO[0..7]
Text Label 9900 2600 2    50   ~ 0
IBUS[8..15]
Text Label 9250 2400 1    50   ~ 0
IBUS[8..15]
Text HLabel 10000 6200 2    50   3State ~ 0
FPO[0..7]
Text HLabel 10000 2600 2    50   3State ~ 0
IBUS[8..15]
Wire Bus Line
	9350 6200 10000 6200
Wire Bus Line
	9350 2600 10000 2600
Entry Bus Bus
	9250 6100 9350 6200
Entry Bus Bus
	9250 2500 9350 2600
Entry Wire Line
	9150 1800 9250 1900
Entry Wire Line
	9150 1700 9250 1800
Entry Wire Line
	9150 1600 9250 1700
Entry Wire Line
	9150 1500 9250 1600
Entry Wire Line
	9150 1400 9250 1500
Entry Wire Line
	9150 1300 9250 1400
Entry Wire Line
	9150 1200 9250 1300
Entry Wire Line
	9150 1100 9250 1200
Entry Wire Line
	9150 5450 9250 5550
Entry Wire Line
	9150 5350 9250 5450
Entry Wire Line
	9150 5250 9250 5350
Entry Wire Line
	9150 5150 9250 5250
Entry Wire Line
	9150 5050 9250 5150
Entry Wire Line
	9150 4950 9250 5050
Entry Wire Line
	9150 4850 9250 4950
Entry Wire Line
	9150 4750 9250 4850
Text HLabel 7450 5650 0    50   Input ~ 0
~FPFLAGS
Text Label 7450 5650 0    50   ~ 0
~FPFLAGS
Wire Wire Line
	7800 5650 7450 5650
$Comp
L power:GND #PWR?
U 1 1 5D6B248F
P 7800 5750
AR Path="/5D6B248F" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B248F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 5500 50  0001 C CNN
F 1 "GND" H 7805 5577 50  0000 C CNN
F 2 "" H 7800 5750 50  0001 C CNN
F 3 "" H 7800 5750 50  0001 C CNN
	1    7800 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6B2495
P 7800 2100
AR Path="/5D6B2495" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B2495" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 1850 50  0001 C CNN
F 1 "GND" H 7805 1927 50  0000 C CNN
F 2 "" H 7800 2100 50  0001 C CNN
F 3 "" H 7800 2100 50  0001 C CNN
	1    7800 2100
	1    0    0    -1  
$EndComp
Text Label 9150 5450 2    50   ~ 0
FPO7
Text Label 9150 5350 2    50   ~ 0
FPO6
Text Label 9150 5250 2    50   ~ 0
FPO5
Text Label 9150 5150 2    50   ~ 0
FPO4
Text Label 9150 5050 2    50   ~ 0
FPO3
Text Label 9150 4950 2    50   ~ 0
FPO2
Text Label 9150 4850 2    50   ~ 0
FPO1
Text Label 9150 4750 2    50   ~ 0
FPO0
Wire Wire Line
	8800 5450 9150 5450
Wire Wire Line
	8800 5350 9150 5350
Wire Wire Line
	8800 5250 9150 5250
Wire Wire Line
	8800 5150 9150 5150
Wire Wire Line
	8800 5050 9150 5050
Wire Wire Line
	8800 4950 9150 4950
Wire Wire Line
	8800 4850 9150 4850
Wire Wire Line
	8800 4750 9150 4750
$Comp
L alexios:74HC541 U?
U 1 1 5D6B24AB
P 8300 5250
AR Path="/5D6B24AB" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B24AB" Ref="U?"  Part="1" 
F 0 "U?" H 8300 6017 50  0000 C CNN
F 1 "74HC541" H 8300 5926 50  0000 C CNN
F 2 "" H 8300 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 5250 50  0001 C CNN
	1    8300 5250
	1    0    0    -1  
$EndComp
Text Label 9150 1800 2    50   ~ 0
IBUS15
Text Label 9150 1700 2    50   ~ 0
IBUS14
Text Label 9150 1600 2    50   ~ 0
IBUS13
Text Label 9150 1500 2    50   ~ 0
IBUS12
Text Label 9150 1400 2    50   ~ 0
IBUS11
Text Label 9150 1300 2    50   ~ 0
IBUS10
Text Label 9150 1200 2    50   ~ 0
IBUS9
Text Label 9150 1100 2    50   ~ 0
IBUS8
Wire Wire Line
	8800 1800 9150 1800
Wire Wire Line
	8800 1700 9150 1700
Wire Wire Line
	8800 1600 9150 1600
Wire Wire Line
	8800 1500 9150 1500
Wire Wire Line
	8800 1400 9150 1400
Wire Wire Line
	8800 1300 9150 1300
Wire Wire Line
	8800 1200 9150 1200
Wire Wire Line
	8800 1100 9150 1100
$Comp
L alexios:74HC541 U?
U 1 1 5D6B24C1
P 8300 1600
AR Path="/5D6B24C1" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B24C1" Ref="U?"  Part="1" 
F 0 "U?" H 8300 2367 50  0000 C CNN
F 1 "74HC541" H 8300 2276 50  0000 C CNN
F 2 "" H 8300 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8300 1600 50  0001 C CNN
	1    8300 1600
	1    0    0    -1  
$EndComp
Text Label 2900 3000 1    50   ~ 0
WADDR[0..4]
Text Label 2900 4250 1    50   ~ 0
RADDR[0..4]
Text Label 2900 5450 1    50   ~ 0
ACTION[0..3]
Text Label 2200 4650 0    50   ~ 0
ACTION[0..3]
Text Label 2200 3400 0    50   ~ 0
RADDR[0..4]
Text Label 2200 2150 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	2100 4650 2800 4650
Wire Bus Line
	2100 3400 2800 3400
Wire Bus Line
	2100 2150 2800 2150
Entry Bus Bus
	2800 4650 2900 4750
Entry Bus Bus
	2800 3400 2900 3500
Entry Bus Bus
	2800 2150 2900 2250
Entry Wire Line
	2900 5500 3000 5600
Entry Wire Line
	2900 5000 3000 5100
Entry Wire Line
	2900 4900 3000 5000
Entry Wire Line
	2900 4800 3000 4900
Entry Wire Line
	2900 4350 3000 4450
Entry Wire Line
	2900 4250 3000 4350
Entry Wire Line
	2900 3750 3000 3850
Entry Wire Line
	2900 3650 3000 3750
Entry Wire Line
	2900 3550 3000 3650
Entry Wire Line
	2900 3100 3000 3200
Entry Wire Line
	2900 3000 3000 3100
Entry Wire Line
	2900 2500 3000 2600
Entry Wire Line
	2900 2400 3000 2500
Entry Wire Line
	2900 2300 3000 2400
$Comp
L alexios:74HC138 U?
U 1 1 5D6B24E1
P 3850 5300
AR Path="/5F3EA987/5D6B24E1" Ref="U?"  Part="1" 
AR Path="/5D6B24E1" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D6B24E1" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B24E1" Ref="U?"  Part="1" 
F 0 "U?" H 3850 5967 50  0000 C CNN
F 1 "74HC138" H 3850 5876 50  0000 C CNN
F 2 "" H 3850 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 5300 50  0001 C CNN
	1    3850 5300
	1    0    0    -1  
$EndComp
Text Label 3000 4900 0    50   ~ 0
ACTION0
Text Label 3000 5000 0    50   ~ 0
ACTION1
Text Label 3000 5100 0    50   ~ 0
ACTION2
Text Label 3000 5600 0    50   ~ 0
ACTION3
$Comp
L power:+5V #PWR?
U 1 1 5D6B24EB
P 3350 5500
AR Path="/5D6B24EB" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B24EB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 5350 50  0001 C CNN
F 1 "+5V" H 3365 5673 50  0000 C CNN
F 2 "" H 3350 5500 50  0001 C CNN
F 3 "" H 3350 5500 50  0001 C CNN
	1    3350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D6B24F1
P 3350 5700
AR Path="/5D6B24F1" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B24F1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 5450 50  0001 C CNN
F 1 "GND" H 3355 5527 50  0000 C CNN
F 2 "" H 3350 5700 50  0001 C CNN
F 3 "" H 3350 5700 50  0001 C CNN
	1    3350 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5000 6150 5000
Wire Wire Line
	4350 5100 6150 5100
Wire Wire Line
	4350 5200 6150 5200
Wire Wire Line
	4350 5300 6150 5300
Wire Wire Line
	4350 5400 6150 5400
Text Label 5200 5000 2    50   ~ 0
~ACTION-CPL
Text Label 5200 5100 2    50   ~ 0
~ACTION-CLL
Text Label 5200 5200 2    50   ~ 0
~ACTION-STI
Text Label 5200 5300 2    50   ~ 0
~ACTION-CLI
Text Label 5200 5400 2    50   ~ 0
~ACTION-CLA
NoConn ~ 4350 4900
NoConn ~ 4350 5500
NoConn ~ 4350 5600
Text Notes 4500 5800 0    50   ~ 0
~ACTION-CLA~ is needed by\nthe AC register, but it saves\none chip if we decode it\nhere, so why not?
Text Notes 3900 5550 1    50   ~ 10
ACTION=0xxx
Text HLabel 6150 5000 2    50   Output ~ 0
~ACTION-CPL
Text HLabel 6150 5100 2    50   Output ~ 0
~ACTION-CLL
Text HLabel 6150 5200 2    50   Output ~ 0
~ACTION-STI
Text HLabel 6150 5300 2    50   Output ~ 0
~ACTION-CLI
Text HLabel 6150 5400 2    50   Output ~ 0
~ACTION-CLA
Wire Wire Line
	3350 5600 3000 5600
Wire Wire Line
	3350 5100 3000 5100
Wire Wire Line
	3350 5000 3000 5000
Wire Wire Line
	3350 4900 3000 4900
Wire Wire Line
	3350 2400 3000 2400
Wire Wire Line
	3350 2500 3000 2500
Wire Wire Line
	3000 2600 3350 2600
Wire Wire Line
	3350 3100 3000 3100
Wire Wire Line
	3350 3200 3000 3200
Wire Wire Line
	3350 3650 3000 3650
Wire Wire Line
	3350 3750 3000 3750
Wire Wire Line
	3000 3850 3350 3850
Wire Wire Line
	3350 4450 3000 4450
Wire Wire Line
	3350 4350 3000 4350
Text Label 5950 2950 2    50   ~ 0
~FLAGWE
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D6B251A
P 5500 2950
AR Path="/5D6B251A" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B251A" Ref="U?"  Part="1" 
F 0 "U?" H 5425 3217 50  0000 C CNN
F 1 "74LVC1G08" H 5425 3126 50  0000 C CNN
F 2 "" H 5150 2950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 2950 50  0001 C CNN
	1    5500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4150 5200 4150
Wire Wire Line
	4350 4250 5200 4250
Text Label 5200 4150 2    50   ~ 0
~READ-MBP+FLAGS
Text Label 5200 4250 2    50   ~ 0
~READ-FLAGS
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D6B2524
P 5500 4200
AR Path="/5D6B2524" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B2524" Ref="U?"  Part="1" 
F 0 "U?" H 5425 4467 50  0000 C CNN
F 1 "74LVC1G08" H 5425 4376 50  0000 C CNN
F 2 "" H 5150 4200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 4200 50  0001 C CNN
	1    5500 4200
	1    0    0    -1  
$EndComp
Text Label 5950 4200 2    50   ~ 0
~FLAGOE
NoConn ~ 4350 4350
NoConn ~ 4350 4050
NoConn ~ 4350 3950
NoConn ~ 4350 3850
NoConn ~ 4350 3750
NoConn ~ 4350 3650
NoConn ~ 4350 3100
NoConn ~ 4350 2800
NoConn ~ 4350 2700
NoConn ~ 4350 2600
NoConn ~ 4350 2500
NoConn ~ 4350 2400
Text Label 3000 4450 0    50   ~ 0
RADDR4
Text Label 3000 4350 0    50   ~ 0
RADDR3
Text Label 3000 3850 0    50   ~ 0
RADDR2
Text Label 3000 3750 0    50   ~ 0
RADDR1
Text Label 3000 3650 0    50   ~ 0
RADDR0
$Comp
L power:+5V #PWR?
U 1 1 5D6B253C
P 3350 4250
AR Path="/5D6B253C" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B253C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 4100 50  0001 C CNN
F 1 "+5V" H 3365 4423 50  0000 C CNN
F 2 "" H 3350 4250 50  0001 C CNN
F 3 "" H 3350 4250 50  0001 C CNN
	1    3350 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5D6B2542
P 3850 4050
AR Path="/5F3EA987/5D6B2542" Ref="U?"  Part="1" 
AR Path="/5D6B2542" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D6B2542" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B2542" Ref="U?"  Part="1" 
F 0 "U?" H 3850 4717 50  0000 C CNN
F 1 "74HC138" H 3850 4626 50  0000 C CNN
F 2 "" H 3850 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 4050 50  0001 C CNN
	1    3850 4050
	1    0    0    -1  
$EndComp
Text Notes 3900 4300 1    50   ~ 10
RADDR=001xx
Text Label 5200 3000 2    50   ~ 0
~WRITE-FLAGS
Text Label 5200 2900 2    50   ~ 0
~WRITE-MBP+FLAGS
Wire Wire Line
	4350 3000 5200 3000
Wire Wire Line
	4350 2900 5200 2900
$Comp
L power:+5V #PWR?
U 1 1 5D6B254D
P 3350 3000
AR Path="/5D6B254D" Ref="#PWR?"  Part="1" 
AR Path="/5D65F6EF/5D6B254D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 2850 50  0001 C CNN
F 1 "+5V" H 3365 3173 50  0000 C CNN
F 2 "" H 3350 3000 50  0001 C CNN
F 3 "" H 3350 3000 50  0001 C CNN
	1    3350 3000
	1    0    0    -1  
$EndComp
Text Label 3000 2600 0    50   ~ 0
WADDR2
Text Label 3000 2500 0    50   ~ 0
WADDR1
Text Label 3000 2400 0    50   ~ 0
WADDR0
$Comp
L alexios:74HC138 U?
U 1 1 5D6B2556
P 3850 2800
AR Path="/5F3EA987/5D6B2556" Ref="U?"  Part="1" 
AR Path="/5D6B2556" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5D6B2556" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/5D6B2556" Ref="U?"  Part="1" 
F 0 "U?" H 3850 3467 50  0000 C CNN
F 1 "74HC138" H 3850 3376 50  0000 C CNN
F 2 "" H 3850 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 2800 50  0001 C CNN
	1    3850 2800
	1    0    0    -1  
$EndComp
Text Label 3000 3100 0    50   ~ 0
WADDR3
Text Label 3000 3200 0    50   ~ 0
WADDR4
Text Notes 3900 3050 1    50   ~ 10
WADDR=001xx
Text HLabel 2100 2150 0    50   Input ~ 0
WADDR[0..4]
Text HLabel 2100 3400 0    50   Input ~ 0
RADDR[0..4]
Text HLabel 2100 4650 0    50   Input ~ 0
ACTION[0..3]
Wire Wire Line
	7800 1300 7350 1300
Wire Wire Line
	7350 4950 7800 4950
Wire Wire Line
	7250 5050 7800 5050
Wire Wire Line
	7150 5150 7800 5150
Wire Wire Line
	7050 5250 7800 5250
Wire Wire Line
	6950 5450 7800 5450
Text Label 1600 7450 2    50   ~ 0
RSVD14
Wire Wire Line
	1050 7450 1600 7450
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5D6B256A
P 900 7450
AR Path="/5D6B256A" Ref="JP?"  Part="1" 
AR Path="/5D65F6EF/5D6B256A" Ref="JP?"  Part="1" 
F 0 "JP?" H 1100 7500 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 900 7564 50  0001 C CNN
F 2 "" H 900 7450 50  0001 C CNN
F 3 "~" H 900 7450 50  0001 C CNN
	1    900  7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  7450 750  7450
Wire Wire Line
	6950 1700 6950 1800
Wire Wire Line
	6950 1700 2100 1700
Wire Wire Line
	7050 1600 2100 1600
Wire Wire Line
	7150 1500 2100 1500
Wire Wire Line
	7250 1400 2100 1400
Wire Wire Line
	7350 1300 3300 1300
Text HLabel 2100 1700 0    50   Input ~ 0
FI
Text HLabel 2100 1600 0    50   Input ~ 0
FV
Text HLabel 2100 1500 0    50   Input ~ 0
FL
Text HLabel 2100 1400 0    50   Input ~ 0
FZ
Text HLabel 2100 1300 0    50   Input ~ 0
FN
Text HLabel 10000 2950 2    50   Output ~ 0
~FLAGWE
Connection ~ 6950 1800
Connection ~ 7050 1600
Connection ~ 7150 1500
Connection ~ 7250 1400
Connection ~ 7350 1300
Wire Wire Line
	7350 1300 7350 4950
Wire Wire Line
	7250 1400 7250 5050
Wire Wire Line
	7150 1500 7150 5150
Wire Wire Line
	7050 1600 7050 5250
Wire Wire Line
	6950 1800 6950 5450
Wire Wire Line
	5650 2950 10000 2950
Wire Wire Line
	5650 4200 6850 4200
Wire Wire Line
	6850 2000 7800 2000
Text Label 6850 4050 1    50   ~ 0
~FLAGOE
Text Label 6950 4050 1    50   ~ 0
FI
Text Label 7050 4050 1    50   ~ 0
FV
Text Label 7150 4050 1    50   ~ 0
FL
Text Label 7250 4050 1    50   ~ 0
FZ
Text Label 7350 4050 1    50   ~ 0
FN
Wire Wire Line
	6850 2000 6850 4200
Text Label 2200 1300 0    50   ~ 0
FN
Text Label 2200 1400 0    50   ~ 0
FZ
Text Label 2200 1500 0    50   ~ 0
FL
Text Label 2200 1600 0    50   ~ 0
FV
Text Label 2200 1700 0    50   ~ 0
FI
Wire Wire Line
	700  7050 700  7150
Connection ~ 700  7150
Wire Wire Line
	700  7150 700  7300
Connection ~ 700  7300
Wire Wire Line
	700  7300 700  7450
Text Notes 7100 6950 0    197  ~ 39
Flag Unit
Wire Wire Line
	2300 1300 2100 1300
Wire Bus Line
	2900 4750 2900 5500
Wire Bus Line
	2900 3500 2900 4350
Wire Bus Line
	2900 2250 2900 3100
Wire Bus Line
	9250 4850 9250 6100
Wire Bus Line
	9250 1200 9250 2500
$EndSCHEMATC
