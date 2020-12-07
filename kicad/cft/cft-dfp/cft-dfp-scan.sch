EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 14
Title "Front Panel Light Scanner"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 "dfp_scan.v"
$EndDescr
$Comp
L alexios:74HC138 U?
U 1 1 624FF3FA
P 5350 1500
AR Path="/624FF3FA" Ref="U?"  Part="1" 
AR Path="/6233F88C/624FF3FA" Ref="U1203"  Part="1" 
F 0 "U1203" H 5350 2167 50  0000 C CNN
F 1 "74HC138" H 5350 2076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5350 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5350 1500 50  0001 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 624FF400
P 5350 2750
AR Path="/624FF400" Ref="U?"  Part="1" 
AR Path="/6233F88C/624FF400" Ref="U1204"  Part="1" 
F 0 "U1204" H 5350 3417 50  0000 C CNN
F 1 "74HC138" H 5350 3326 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5350 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5350 2750 50  0001 C CNN
	1    5350 2750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 624FF406
P 5350 4000
AR Path="/624FF406" Ref="U?"  Part="1" 
AR Path="/6233F88C/624FF406" Ref="U1205"  Part="1" 
F 0 "U1205" H 5350 4667 50  0000 C CNN
F 1 "74HC138" H 5350 4576 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5350 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5350 4000 50  0001 C CNN
F 4 "Yes" H 5350 4000 50  0001 C CNN "Verified"
	1    5350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624FF429
P 4850 1700
AR Path="/624FF429" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/624FF429" Ref="#PWR01216"  Part="1" 
F 0 "#PWR01216" H 4850 1550 50  0001 C CNN
F 1 "+5V" H 4865 1873 50  0000 C CNN
F 2 "" H 4850 1700 50  0001 C CNN
F 3 "" H 4850 1700 50  0001 C CNN
	1    4850 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624FF42F
P 4850 2950
AR Path="/624FF42F" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/624FF42F" Ref="#PWR01218"  Part="1" 
F 0 "#PWR01218" H 4850 2800 50  0001 C CNN
F 1 "+5V" H 4865 3123 50  0000 C CNN
F 2 "" H 4850 2950 50  0001 C CNN
F 3 "" H 4850 2950 50  0001 C CNN
	1    4850 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624FF435
P 4850 4200
AR Path="/624FF435" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/624FF435" Ref="#PWR01220"  Part="1" 
F 0 "#PWR01220" H 4850 4050 50  0001 C CNN
F 1 "+5V" H 4865 4373 50  0000 C CNN
F 2 "" H 4850 4200 50  0001 C CNN
F 3 "" H 4850 4200 50  0001 C CNN
	1    4850 4200
	1    0    0    -1  
$EndComp
Text Label 6200 2350 2    50   ~ 0
~FPOE1
Text Label 6200 3600 2    50   ~ 0
~FPOE2
Text Label 6200 4850 2    50   ~ 0
~FPOE3
Text Label 6200 2450 2    50   ~ 0
~FPOE5
Text Label 6200 3700 2    50   ~ 0
~FPOE6
Text Label 6200 4950 2    50   ~ 0
~FPOE7
Text Label 6200 2550 2    50   ~ 0
~FPOE9
Text Label 6200 3800 2    50   ~ 0
~FPOE10
Text Label 6200 5050 2    50   ~ 0
~FPOE11
Text Label 6200 2650 2    50   ~ 0
~FPOE13
Text Label 6200 3900 2    50   ~ 0
~FPOE14
Text Label 6200 5150 2    50   ~ 0
~FPOE15
Text Label 6200 2750 2    50   ~ 0
~FPOE17
Text Label 6200 4000 2    50   ~ 0
~FPOE18
Text Label 6200 5250 2    50   ~ 0
~FPOE19
Text Label 6200 2850 2    50   ~ 0
~FPOE21
Text Label 6200 4100 2    50   ~ 0
~FPOE22
Text Label 6200 5350 2    50   ~ 0
~FPOE23
Entry Wire Line
	6250 1100 6350 1200
Entry Wire Line
	6250 1200 6350 1300
Entry Wire Line
	6250 1300 6350 1400
Entry Wire Line
	6250 1400 6350 1500
Entry Wire Line
	6250 1500 6350 1600
Entry Wire Line
	6250 1600 6350 1700
Entry Wire Line
	6250 1700 6350 1800
Entry Wire Line
	6250 1800 6350 1900
Entry Wire Line
	6250 2350 6350 2450
Entry Wire Line
	6250 2450 6350 2550
Entry Wire Line
	6250 2550 6350 2650
Entry Wire Line
	6250 2650 6350 2750
Entry Wire Line
	6250 2750 6350 2850
Entry Wire Line
	6250 2850 6350 2950
Entry Wire Line
	6250 2950 6350 3050
Entry Wire Line
	6250 3050 6350 3150
Entry Wire Line
	6250 3600 6350 3700
Entry Wire Line
	6250 3700 6350 3800
Entry Wire Line
	6250 3800 6350 3900
Entry Wire Line
	6250 3900 6350 4000
Entry Wire Line
	6250 4000 6350 4100
Entry Wire Line
	6250 4100 6350 4200
Entry Wire Line
	6250 4200 6350 4300
Entry Wire Line
	6250 4300 6350 4400
Entry Bus Bus
	6350 6150 6450 6250
Wire Bus Line
	6450 6250 7200 6250
Text Label 7100 6250 2    50   ~ 0
~FPOE[0..31]
Entry Bus Bus
	2250 800  2350 700 
Wire Wire Line
	4550 1300 4850 1300
Wire Wire Line
	4550 1200 4850 1200
Wire Wire Line
	4550 1100 4850 1100
Entry Wire Line
	4450 1200 4550 1300
Entry Wire Line
	4450 1100 4550 1200
Entry Wire Line
	4450 1000 4550 1100
Entry Bus Bus
	4350 700  4450 800 
Entry Wire Line
	4450 2450 4550 2550
Entry Wire Line
	4450 2350 4550 2450
Entry Wire Line
	4450 2250 4550 2350
Entry Wire Line
	4450 3700 4550 3800
Entry Wire Line
	4450 3600 4550 3700
Entry Wire Line
	4450 3500 4550 3600
Entry Wire Line
	4450 4950 4550 5050
Entry Wire Line
	4450 4850 4550 4950
Entry Wire Line
	4450 4750 4550 4850
Entry Bus Bus
	2150 700  2250 800 
Text HLabel 1150 700  0    50   Input ~ 0
FPA[0..7]
Text Label 1250 700  0    50   ~ 0
FPA[0..7]
Text HLabel 7200 6250 2    50   Output ~ 0
~FPOE[0..31]
Entry Wire Line
	6250 5550 6350 5650
Entry Wire Line
	6250 5450 6350 5550
Entry Wire Line
	6250 5350 6350 5450
Entry Wire Line
	6250 5250 6350 5350
Entry Wire Line
	6250 5150 6350 5250
Entry Wire Line
	6250 5050 6350 5150
Entry Wire Line
	6250 4950 6350 5050
Entry Wire Line
	6250 4850 6350 4950
Wire Wire Line
	4350 3050 4850 3050
$Comp
L power:GND #PWR01221
U 1 1 62DDFB7C
P 4850 4400
F 0 "#PWR01221" H 4850 4150 50  0001 C CNN
F 1 "GND" H 4855 4227 50  0000 C CNN
F 2 "" H 4850 4400 50  0001 C CNN
F 3 "" H 4850 4400 50  0001 C CNN
	1    4850 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 62DEA5A1
P 5250 7400
AR Path="/62DEA5A1" Ref="U?"  Part="1" 
AR Path="/6233F88C/62DEA5A1" Ref="U1206"  Part="2" 
F 0 "U1206" H 5430 7446 50  0000 L CNN
F 1 "74HC138" H 5430 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5250 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5250 7400 50  0001 C CNN
	2    5250 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62ECDEB3
P 900 6650
AR Path="/62ECDEB3" Ref="C?"  Part="1" 
AR Path="/6233F88C/62ECDEB3" Ref="C1201"  Part="1" 
F 0 "C1201" H 809 6696 50  0000 R CNN
F 1 "100nF" H 809 6605 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 6650 50  0001 C CNN
F 3 "~" H 900 6650 50  0001 C CNN
	1    900  6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01201
U 1 1 62ED49B6
P 900 6550
F 0 "#PWR01201" H 900 6400 50  0001 C CNN
F 1 "+5V" H 915 6723 50  0000 C CNN
F 2 "" H 900 6550 50  0001 C CNN
F 3 "" H 900 6550 50  0001 C CNN
	1    900  6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01202
U 1 1 62ED540F
P 900 6750
F 0 "#PWR01202" H 900 6500 50  0001 C CNN
F 1 "GND" H 905 6577 50  0000 C CNN
F 2 "" H 900 6750 50  0001 C CNN
F 3 "" H 900 6750 50  0001 C CNN
	1    900  6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62ED6833
P 2150 6650
AR Path="/62ED6833" Ref="C?"  Part="1" 
AR Path="/6233F88C/62ED6833" Ref="C1203"  Part="1" 
F 0 "C1203" H 2059 6696 50  0000 R CNN
F 1 "100nF" H 2059 6605 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2150 6650 50  0001 C CNN
F 3 "~" H 2150 6650 50  0001 C CNN
	1    2150 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01205
U 1 1 62ED6839
P 2150 6550
F 0 "#PWR01205" H 2150 6400 50  0001 C CNN
F 1 "+5V" H 2165 6723 50  0000 C CNN
F 2 "" H 2150 6550 50  0001 C CNN
F 3 "" H 2150 6550 50  0001 C CNN
	1    2150 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01206
U 1 1 62ED683F
P 2150 6750
F 0 "#PWR01206" H 2150 6500 50  0001 C CNN
F 1 "GND" H 2155 6577 50  0000 C CNN
F 2 "" H 2150 6750 50  0001 C CNN
F 3 "" H 2150 6750 50  0001 C CNN
	1    2150 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62ED9CF3
P 4900 7400
AR Path="/62ED9CF3" Ref="C?"  Part="1" 
AR Path="/6233F88C/62ED9CF3" Ref="C1206"  Part="1" 
F 0 "C1206" H 4809 7446 50  0000 R CNN
F 1 "100nF" H 4809 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 7400 50  0001 C CNN
F 3 "~" H 4900 7400 50  0001 C CNN
	1    4900 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01224
U 1 1 62ED9CF9
P 4900 7300
F 0 "#PWR01224" H 4900 7150 50  0001 C CNN
F 1 "+5V" H 4915 7473 50  0000 C CNN
F 2 "" H 4900 7300 50  0001 C CNN
F 3 "" H 4900 7300 50  0001 C CNN
	1    4900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01225
U 1 1 62ED9CFF
P 4900 7500
F 0 "#PWR01225" H 4900 7250 50  0001 C CNN
F 1 "GND" H 4905 7327 50  0000 C CNN
F 2 "" H 4900 7500 50  0001 C CNN
F 3 "" H 4900 7500 50  0001 C CNN
	1    4900 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62EDD3ED
P 900 7400
AR Path="/62EDD3ED" Ref="C?"  Part="1" 
AR Path="/6233F88C/62EDD3ED" Ref="C1202"  Part="1" 
F 0 "C1202" H 809 7446 50  0000 R CNN
F 1 "100nF" H 809 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 900 7400 50  0001 C CNN
F 3 "~" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01203
U 1 1 62EDD3F3
P 900 7300
F 0 "#PWR01203" H 900 7150 50  0001 C CNN
F 1 "+5V" H 915 7473 50  0000 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01204
U 1 1 62EDD3F9
P 900 7500
F 0 "#PWR01204" H 900 7250 50  0001 C CNN
F 1 "GND" H 905 7327 50  0000 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
Connection ~ 4900 7300
Connection ~ 4900 7500
$Comp
L alexios:74HC138 U?
U 2 1 62EF736E
P 2500 7400
AR Path="/62EF736E" Ref="U?"  Part="1" 
AR Path="/6233F88C/62EF736E" Ref="U1204"  Part="2" 
F 0 "U1204" H 2680 7446 50  0000 L CNN
F 1 "74HC138" H 2680 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2500 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2500 7400 50  0001 C CNN
	2    2500 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62EF7374
P 2150 7400
AR Path="/62EF7374" Ref="C?"  Part="1" 
AR Path="/6233F88C/62EF7374" Ref="C1204"  Part="1" 
F 0 "C1204" H 2059 7446 50  0000 R CNN
F 1 "100nF" H 2059 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2150 7400 50  0001 C CNN
F 3 "~" H 2150 7400 50  0001 C CNN
	1    2150 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01207
U 1 1 62EF737A
P 2150 7300
F 0 "#PWR01207" H 2150 7150 50  0001 C CNN
F 1 "+5V" H 2165 7473 50  0000 C CNN
F 2 "" H 2150 7300 50  0001 C CNN
F 3 "" H 2150 7300 50  0001 C CNN
	1    2150 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01208
U 1 1 62EF7380
P 2150 7500
F 0 "#PWR01208" H 2150 7250 50  0001 C CNN
F 1 "GND" H 2155 7327 50  0000 C CNN
F 2 "" H 2150 7500 50  0001 C CNN
F 3 "" H 2150 7500 50  0001 C CNN
	1    2150 7500
	1    0    0    -1  
$EndComp
Connection ~ 2150 7300
Connection ~ 2150 7500
$Comp
L alexios:74HC138 U?
U 2 1 62EFBBE4
P 3800 7400
AR Path="/62EFBBE4" Ref="U?"  Part="1" 
AR Path="/6233F88C/62EFBBE4" Ref="U1205"  Part="2" 
F 0 "U1205" H 3980 7446 50  0000 L CNN
F 1 "74HC138" H 3980 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 3800 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3800 7400 50  0001 C CNN
	2    3800 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 62EFBBEA
P 3450 7400
AR Path="/62EFBBEA" Ref="C?"  Part="1" 
AR Path="/6233F88C/62EFBBEA" Ref="C1205"  Part="1" 
F 0 "C1205" H 3359 7446 50  0000 R CNN
F 1 "100nF" H 3359 7355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 7400 50  0001 C CNN
F 3 "~" H 3450 7400 50  0001 C CNN
	1    3450 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01214
U 1 1 62EFBBF0
P 3450 7300
F 0 "#PWR01214" H 3450 7150 50  0001 C CNN
F 1 "+5V" H 3465 7473 50  0000 C CNN
F 2 "" H 3450 7300 50  0001 C CNN
F 3 "" H 3450 7300 50  0001 C CNN
	1    3450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01215
U 1 1 62EFBBF6
P 3450 7500
F 0 "#PWR01215" H 3450 7250 50  0001 C CNN
F 1 "GND" H 3455 7327 50  0000 C CNN
F 2 "" H 3450 7500 50  0001 C CNN
F 3 "" H 3450 7500 50  0001 C CNN
	1    3450 7500
	1    0    0    -1  
$EndComp
Connection ~ 3450 7300
Connection ~ 3450 7500
Text Notes 6650 1600 0    50   ~ 0
~FPOE20~ triggers a counter reset.
Wire Wire Line
	2350 1200 2650 1200
Entry Wire Line
	2250 1000 2350 1100
Entry Wire Line
	2250 1100 2350 1200
Wire Wire Line
	2350 1100 2650 1100
Wire Bus Line
	1150 700  2150 700 
Wire Bus Line
	2350 700  4350 700 
Entry Wire Line
	4150 1500 4250 1600
Entry Wire Line
	4150 1600 4250 1700
Entry Wire Line
	4150 1700 4250 1800
Entry Wire Line
	4150 1800 4250 1900
Wire Wire Line
	4350 4300 4850 4300
Wire Wire Line
	4850 1800 4350 1800
Entry Wire Line
	4250 2950 4350 3050
Entry Wire Line
	4350 5550 4250 5450
Entry Wire Line
	4350 4300 4250 4200
Text Label 4250 4150 1    50   ~ 0
~LMOE[0..3]
Text Label 4450 4150 1    50   ~ 0
~FPOE[0..31]
Text Label 3750 1600 0    50   ~ 0
~LMOE1
Text Label 3750 1700 0    50   ~ 0
~LMOE2
Text Label 3750 1800 0    50   ~ 0
~LMOE3
Text Label 3750 1500 0    50   ~ 0
~LMOE0
Text Label 4550 1800 0    50   ~ 0
~LMOE0
Text Label 4550 3050 0    50   ~ 0
~LMOE1
Text Label 4550 4300 0    50   ~ 0
~LMOE2
Text Label 2650 1100 2    50   ~ 0
FPA0
Text Label 2650 1200 2    50   ~ 0
FPA1
Text Label 4600 1100 0    50   ~ 0
FPA2
Text Label 4600 1200 0    50   ~ 0
FPA3
Text Label 4600 1300 0    50   ~ 0
FPA4
Wire Wire Line
	4550 2550 4850 2550
Wire Wire Line
	4550 2450 4850 2450
Wire Wire Line
	4550 2350 4850 2350
Text Label 4600 2350 0    50   ~ 0
FPA2
Text Label 4600 2450 0    50   ~ 0
FPA3
Text Label 4600 2550 0    50   ~ 0
FPA4
Wire Wire Line
	4550 3800 4850 3800
Wire Wire Line
	4550 3700 4850 3700
Wire Wire Line
	4550 3600 4850 3600
Text Label 4600 3600 0    50   ~ 0
FPA2
Text Label 4600 3700 0    50   ~ 0
FPA3
Text Label 4600 3800 0    50   ~ 0
FPA4
Text Notes 6650 5250 0    50   ~ 0
Module D, Row 5 (µCA low)
Text Notes 6650 5150 0    50   ~ 0
Module D, Row 4 (TBD)
Text Notes 6650 5050 0    50   ~ 0
Module D, Row 3 (for expansion)
Text Notes 6650 4950 0    50   ~ 0
Module D, Row 2 (IRQs enabled)
Text Notes 6650 4850 0    50   ~ 0
Module D, Row 1 (IRQs active)
Text Notes 6650 4000 0    50   ~ 0
Module C, Row 5 (IR low)
Text Notes 6650 3900 0    50   ~ 0
Module C, Row 4 (MFD low)
Text Notes 6650 3800 0    50   ~ 0
Module C, Row 3 (AC low)
Text Notes 6650 3700 0    50   ~ 0
Module C, Row 2 (PC low)
Text Notes 6650 3600 0    50   ~ 0
Module C, Row 1 (µCV low)
Text Notes 6650 2800 0    50   ~ 0
Module B, Row 5 (IR high)
Text Notes 6650 2700 0    50   ~ 0
Module B, Row 4 (MFD high)
Text Notes 6650 2600 0    50   ~ 0
Module B, Row 3 (AC high)
Text Notes 6650 2500 0    50   ~ 0
Module B, Row 2 (PC high)
Text Notes 6650 2400 0    50   ~ 0
Module B, Row 1 (µCV medium)
Text Notes 6650 1500 0    50   ~ 0
Module A, Row 5 (state)
Text Notes 6650 1400 0    50   ~ 0
Module A, Row 4 (TBD)
Text Notes 6650 1300 0    50   ~ 0
Module A, Row 3 (flags)
Text Notes 6650 1200 0    50   ~ 0
Module A, Row 2 (AEXT)
Text Notes 6650 1100 0    50   ~ 0
Module A, Row 1 (µCV high)
Wire Wire Line
	2350 2500 2650 2500
Entry Wire Line
	2250 2300 2350 2400
Entry Wire Line
	2250 2400 2350 2500
Wire Wire Line
	2350 2400 2650 2400
Wire Wire Line
	2350 2600 2650 2600
Entry Wire Line
	2250 2500 2350 2600
Text Label 2450 2400 0    50   ~ 0
FPA2
Text Label 2450 2500 0    50   ~ 0
FPA3
Text Label 2450 2600 0    50   ~ 0
FPA4
Wire Wire Line
	3650 1500 4150 1500
Wire Wire Line
	3650 1600 4150 1600
Wire Wire Line
	3650 1700 4150 1700
Wire Wire Line
	3650 1800 4150 1800
Entry Wire Line
	4050 2400 4150 2500
Entry Wire Line
	4050 2500 4150 2600
Entry Wire Line
	4050 2600 4150 2700
Entry Wire Line
	4050 2700 4150 2800
Entry Wire Line
	4050 2800 4150 2900
NoConn ~ 3650 2900
NoConn ~ 3650 3000
NoConn ~ 3650 3100
Wire Wire Line
	3650 2400 4050 2400
Wire Wire Line
	3650 2500 4050 2500
Wire Wire Line
	3650 2600 4050 2600
Wire Wire Line
	3650 2700 4050 2700
Wire Wire Line
	3650 2800 4050 2800
Text Label 3750 2400 0    50   ~ 0
~ROW1
Text Label 3750 2500 0    50   ~ 0
~ROW2
Text Label 3750 2600 0    50   ~ 0
~ROW3
Text Label 3750 2700 0    50   ~ 0
~ROW4
Text Label 3750 2800 0    50   ~ 0
~ROW5
Text Label 4150 3700 1    50   ~ 0
~ROW[1..5]
Entry Bus Bus
	4150 6250 4250 6350
Text Label 7100 6350 2    50   ~ 0
~ROW[1..5]
Text HLabel 7200 6350 2    50   Output ~ 0
~ROW[1..5]
Text Label 4600 5050 0    50   ~ 0
FPA4
Text Label 4600 4950 0    50   ~ 0
FPA3
Text Label 4600 4850 0    50   ~ 0
FPA2
Wire Wire Line
	4550 4850 4850 4850
Wire Wire Line
	4550 4950 4850 4950
Wire Wire Line
	4550 5050 4850 5050
Text Label 4550 5550 0    50   ~ 0
~LMOE3
Wire Wire Line
	4350 5550 4850 5550
$Comp
L power:GND #PWR01223
U 1 1 62DDFEE8
P 4850 5650
F 0 "#PWR01223" H 4850 5400 50  0001 C CNN
F 1 "GND" H 4855 5477 50  0000 C CNN
F 2 "" H 4850 5650 50  0001 C CNN
F 3 "" H 4850 5650 50  0001 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 624FF43B
P 4850 5400
AR Path="/624FF43B" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/624FF43B" Ref="#PWR01222"  Part="1" 
F 0 "#PWR01222" H 4850 5250 50  0001 C CNN
F 1 "+5V" H 4865 5573 50  0000 C CNN
F 2 "" H 4850 5400 50  0001 C CNN
F 3 "" H 4850 5400 50  0001 C CNN
	1    4850 5400
	1    0    0    -1  
$EndComp
Text Label 6200 4200 2    50   ~ 0
~FPOE26
Text Label 6200 5450 2    50   ~ 0
~FPOE27
Text Label 6200 3050 2    50   ~ 0
~FPOE29
Text Label 6200 4300 2    50   ~ 0
~FPOE30
Text Label 6200 5550 2    50   ~ 0
~FPOE31
$Comp
L alexios:74HC138 U?
U 1 1 624FF40C
P 5350 5250
AR Path="/624FF40C" Ref="U?"  Part="1" 
AR Path="/6233F88C/624FF40C" Ref="U1206"  Part="1" 
F 0 "U1206" H 5350 5917 50  0000 C CNN
F 1 "74HC138" H 5350 5826 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5350 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5350 5250 50  0001 C CNN
	1    5350 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5E660FE9
P 3150 1500
AR Path="/5E660FE9" Ref="U?"  Part="1" 
AR Path="/6233F88C/5E660FE9" Ref="U1201"  Part="1" 
F 0 "U1201" H 3150 2167 50  0000 C CNN
F 1 "74HC138" H 3150 2076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3150 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3150 1500 50  0001 C CNN
	1    3150 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01209
U 1 1 5E670DB6
P 2600 1650
F 0 "#PWR01209" H 2600 1500 50  0001 C CNN
F 1 "+5V" H 2615 1823 50  0000 C CNN
F 2 "" H 2600 1650 50  0001 C CNN
F 3 "" H 2600 1650 50  0001 C CNN
	1    2600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1650 2600 1700
Wire Wire Line
	2600 1700 2650 1700
$Comp
L power:GND #PWR01210
U 1 1 5E6791E0
P 2600 1950
F 0 "#PWR01210" H 2600 1700 50  0001 C CNN
F 1 "GND" H 2605 1777 50  0000 C CNN
F 2 "" H 2600 1950 50  0001 C CNN
F 3 "" H 2600 1950 50  0001 C CNN
	1    2600 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01213
U 1 1 5E67A6FE
P 2650 1300
F 0 "#PWR01213" H 2650 1150 50  0001 C CNN
F 1 "+5V" V 2665 1428 50  0000 L CNN
F 2 "" H 2650 1300 50  0001 C CNN
F 3 "" H 2650 1300 50  0001 C CNN
	1    2650 1300
	0    -1   -1   0   
$EndComp
Entry Wire Line
	4250 1900 4350 1800
NoConn ~ 3650 1100
NoConn ~ 3650 1200
NoConn ~ 3650 1300
NoConn ~ 3650 1400
Wire Wire Line
	7200 5950 6450 5950
Entry Wire Line
	6350 5850 6450 5950
Text HLabel 7200 5950 2    50   Input ~ 0
~SCANCLR
Text Notes 10250 5050 0    50   ~ 0
xxxxxx11\n
Text Notes 9700 5050 0    50   ~ 0
xxxxxx10
Text Notes 9150 5050 0    50   ~ 0
xxxxxx01
Text Notes 8400 5050 0    50   ~ 0
FPA=xxxxxx00
Text Notes 8500 4100 0    60   ~ 12
Module A
Wire Notes Line style solid rgb(255, 255, 0)
	8500 4950 8500 4150
Wire Notes Line style solid rgb(255, 255, 0)
	9000 4950 8500 4950
Wire Notes Line style solid rgb(255, 255, 0)
	9000 4150 9000 4950
Wire Notes Line style solid rgb(255, 255, 0)
	8500 4150 9000 4150
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4875 8925 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4875 8900 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4875 8925 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4850 8925 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4875 8875 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4875 8850 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4875 8875 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4850 8875 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4875 8825 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4875 8800 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4875 8825 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4850 8825 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4875 8775 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4875 8750 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4875 8775 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4850 8775 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4875 8725 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4875 8700 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4875 8725 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4850 8725 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4875 8675 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4875 8650 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4875 8675 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4850 8675 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8625 4875 8625 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4875 8600 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4875 8625 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4850 8625 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8575 4875 8575 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4875 8550 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4875 8575 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4850 8575 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4725 8925 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4725 8900 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4725 8925 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4700 8925 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4725 8875 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4725 8850 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4725 8875 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4700 8875 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4725 8825 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4725 8800 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4725 8825 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4700 8825 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4725 8775 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4725 8750 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4725 8775 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4700 8775 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4725 8725 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4725 8700 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4725 8725 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4700 8725 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4725 8675 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4725 8650 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4725 8675 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4700 8675 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8625 4725 8625 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4725 8600 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4725 8625 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4700 8625 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8575 4725 8575 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4725 8550 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4725 8575 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4700 8575 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4425 8925 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4425 8900 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4425 8925 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4400 8925 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4425 8875 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4425 8850 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4425 8875 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4400 8875 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4425 8825 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4425 8800 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4425 8825 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4400 8825 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4425 8775 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4425 8750 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4425 8775 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4400 8775 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4425 8725 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4425 8700 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4425 8725 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4400 8725 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4425 8675 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4425 8650 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4425 8675 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4400 8675 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8625 4425 8625 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4425 8600 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4425 8625 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4400 8625 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8575 4425 8575 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4425 8550 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4425 8575 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4400 8575 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4575 8925 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4575 8900 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4575 8925 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4550 8925 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4575 8875 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4575 8850 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4575 8875 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4550 8875 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4575 8825 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4575 8800 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4575 8825 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4550 8825 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4575 8775 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4575 8750 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4575 8775 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4550 8775 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4575 8725 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4575 8700 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4575 8725 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4550 8725 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4575 8675 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4575 8650 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4575 8675 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4550 8675 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8625 4575 8625 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4575 8600 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4575 8625 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4550 8625 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8575 4575 8575 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4575 8550 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4575 8575 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4550 8575 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	8925 4275 8925 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4275 8900 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4275 8925 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8900 4250 8925 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8875 4275 8875 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4275 8850 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4275 8875 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8850 4250 8875 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8825 4275 8825 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4275 8800 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4275 8825 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8800 4250 8825 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8775 4275 8775 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4275 8750 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4275 8775 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8750 4250 8775 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8725 4275 8725 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4275 8700 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4275 8725 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8700 4250 8725 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8675 4275 8675 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4275 8650 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4275 8675 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8650 4250 8675 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8625 4275 8625 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4275 8600 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4275 8625 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8600 4250 8625 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8575 4275 8575 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4275 8550 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4275 8575 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	8550 4250 8575 4250
Text Notes 9050 4100 0    60   ~ 12
Module B
Wire Notes Line style solid rgb(255, 255, 0)
	9050 4950 9050 4150
Wire Notes Line style solid rgb(255, 255, 0)
	9550 4950 9050 4950
Wire Notes Line style solid rgb(255, 255, 0)
	9550 4150 9550 4950
Wire Notes Line style solid rgb(255, 255, 0)
	9050 4150 9550 4150
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4875 9475 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4875 9450 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4875 9475 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4850 9475 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4875 9425 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4875 9400 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4875 9425 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4850 9425 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4875 9375 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4875 9350 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4875 9375 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4850 9375 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4875 9325 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4875 9300 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4875 9325 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4850 9325 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4875 9275 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4875 9250 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4875 9275 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4850 9275 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4875 9225 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4875 9200 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4875 9225 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4850 9225 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9175 4875 9175 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4875 9150 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4875 9175 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4850 9175 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9125 4875 9125 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4875 9100 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4875 9125 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4850 9125 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4725 9475 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4725 9450 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4725 9475 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4700 9475 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4725 9425 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4725 9400 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4725 9425 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4700 9425 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4725 9375 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4725 9350 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4725 9375 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4700 9375 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4725 9325 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4725 9300 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4725 9325 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4700 9325 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4725 9275 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4725 9250 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4725 9275 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4700 9275 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4725 9225 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4725 9200 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4725 9225 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4700 9225 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9175 4725 9175 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4725 9150 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4725 9175 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4700 9175 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9125 4725 9125 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4725 9100 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4725 9125 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4700 9125 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4425 9475 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4425 9450 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4425 9475 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4400 9475 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4425 9425 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4425 9400 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4425 9425 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4400 9425 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4425 9375 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4425 9350 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4425 9375 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4400 9375 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4425 9325 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4425 9300 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4425 9325 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4400 9325 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4425 9275 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4425 9250 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4425 9275 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4400 9275 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4425 9225 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4425 9200 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4425 9225 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4400 9225 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9175 4425 9175 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4425 9150 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4425 9175 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4400 9175 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9125 4425 9125 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4425 9100 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4425 9125 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4400 9125 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4575 9475 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4575 9450 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4575 9475 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4550 9475 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4575 9425 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4575 9400 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4575 9425 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4550 9425 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4575 9375 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4575 9350 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4575 9375 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4550 9375 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4575 9325 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4575 9300 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4575 9325 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4550 9325 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4575 9275 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4575 9250 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4575 9275 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4550 9275 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4575 9225 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4575 9200 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4575 9225 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4550 9225 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9175 4575 9175 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4575 9150 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4575 9175 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4550 9175 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9125 4575 9125 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4575 9100 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4575 9125 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4550 9125 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9475 4275 9475 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4275 9450 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4275 9475 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9450 4250 9475 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9425 4275 9425 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4275 9400 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4275 9425 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9400 4250 9425 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9375 4275 9375 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4275 9350 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4275 9375 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9350 4250 9375 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9325 4275 9325 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4275 9300 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4275 9325 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9300 4250 9325 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9275 4275 9275 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4275 9250 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4275 9275 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9250 4250 9275 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9225 4275 9225 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4275 9200 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4275 9225 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9200 4250 9225 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9175 4275 9175 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4275 9150 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4275 9175 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9150 4250 9175 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9125 4275 9125 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4275 9100 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4275 9125 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9100 4250 9125 4250
Text Notes 9600 4100 0    60   ~ 12
Module C
Wire Notes Line style solid rgb(255, 255, 0)
	9600 4950 9600 4150
Wire Notes Line style solid rgb(255, 255, 0)
	10100 4950 9600 4950
Wire Notes Line style solid rgb(255, 255, 0)
	10100 4150 10100 4950
Wire Notes Line style solid rgb(255, 255, 0)
	9600 4150 10100 4150
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4875 10025 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4875 10000 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4875 10025 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4850 10025 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4875 9975 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4875 9950 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4875 9975 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4850 9975 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4875 9925 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4875 9900 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4875 9925 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4850 9925 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4875 9875 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4875 9850 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4875 9875 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4850 9875 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4875 9825 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4875 9800 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4875 9825 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4850 9825 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4875 9775 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4875 9750 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4875 9775 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4850 9775 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9725 4875 9725 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4875 9700 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4875 9725 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4850 9725 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9675 4875 9675 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4875 9650 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4875 9675 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4850 9675 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4725 10025 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4725 10000 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4725 10025 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4700 10025 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4725 9975 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4725 9950 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4725 9975 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4700 9975 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4725 9925 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4725 9900 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4725 9925 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4700 9925 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4725 9875 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4725 9850 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4725 9875 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4700 9875 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4725 9825 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4725 9800 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4725 9825 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4700 9825 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4725 9775 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4725 9750 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4725 9775 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4700 9775 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9725 4725 9725 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4725 9700 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4725 9725 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4700 9725 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9675 4725 9675 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4725 9650 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4725 9675 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4700 9675 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4425 10025 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4425 10000 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4425 10025 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4400 10025 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4425 9975 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4425 9950 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4425 9975 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4400 9975 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4425 9925 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4425 9900 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4425 9925 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4400 9925 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4425 9875 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4425 9850 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4425 9875 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4400 9875 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4425 9825 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4425 9800 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4425 9825 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4400 9825 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4425 9775 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4425 9750 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4425 9775 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4400 9775 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9725 4425 9725 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4425 9700 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4425 9725 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4400 9725 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9675 4425 9675 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4425 9650 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4425 9675 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4400 9675 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4575 10025 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4575 10000 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4575 10025 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4550 10025 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4575 9975 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4575 9950 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4575 9975 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4550 9975 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4575 9925 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4575 9900 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4575 9925 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4550 9925 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4575 9875 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4575 9850 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4575 9875 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4550 9875 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4575 9825 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4575 9800 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4575 9825 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4550 9825 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4575 9775 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4575 9750 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4575 9775 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4550 9775 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9725 4575 9725 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4575 9700 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4575 9725 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4550 9725 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9675 4575 9675 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4575 9650 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4575 9675 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4550 9675 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10025 4275 10025 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4275 10000 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4275 10025 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10000 4250 10025 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9975 4275 9975 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4275 9950 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4275 9975 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9950 4250 9975 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9925 4275 9925 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4275 9900 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4275 9925 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9900 4250 9925 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9875 4275 9875 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4275 9850 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4275 9875 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9850 4250 9875 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9825 4275 9825 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4275 9800 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4275 9825 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9800 4250 9825 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9775 4275 9775 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4275 9750 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4275 9775 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9750 4250 9775 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9725 4275 9725 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4275 9700 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4275 9725 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9700 4250 9725 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9675 4275 9675 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4275 9650 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4275 9675 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	9650 4250 9675 4250
Text Notes 10150 4100 0    60   ~ 12
Module D
Wire Notes Line style solid rgb(255, 255, 0)
	10150 4950 10150 4150
Wire Notes Line style solid rgb(255, 255, 0)
	10650 4950 10150 4950
Wire Notes Line style solid rgb(255, 255, 0)
	10650 4150 10650 4950
Wire Notes Line style solid rgb(255, 255, 0)
	10150 4150 10650 4150
Text Notes 10700 4900 0    50   ~ 0
Row 5
Text Notes 10700 4750 0    50   ~ 0
Row 4
Text Notes 10700 4600 0    50   ~ 0
Row 3
Text Notes 10700 4450 0    50   ~ 0
Row 2
Text Notes 10700 4300 0    50   ~ 0
Row 1
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4875 10575 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4875 10550 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4875 10575 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4850 10575 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4875 10525 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4875 10500 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4875 10525 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4850 10525 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4875 10475 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4875 10450 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4875 10475 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4850 10475 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4875 10425 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4875 10400 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4875 10425 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4850 10425 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4875 10375 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4875 10350 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4875 10375 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4850 10375 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4875 10325 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4875 10300 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4875 10325 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4850 10325 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10275 4875 10275 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4875 10250 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4875 10275 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4850 10275 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10225 4875 10225 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4875 10200 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4875 10225 4875
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4850 10225 4850
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4725 10575 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4725 10550 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4725 10575 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4700 10575 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4725 10525 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4725 10500 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4725 10525 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4700 10525 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4725 10475 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4725 10450 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4725 10475 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4700 10475 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4725 10425 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4725 10400 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4725 10425 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4700 10425 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4725 10375 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4725 10350 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4725 10375 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4700 10375 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4725 10325 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4725 10300 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4725 10325 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4700 10325 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10275 4725 10275 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4725 10250 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4725 10275 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4700 10275 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10225 4725 10225 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4725 10200 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4725 10225 4725
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4700 10225 4700
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4425 10575 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4425 10550 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4425 10575 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4400 10575 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4425 10525 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4425 10500 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4425 10525 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4400 10525 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4425 10475 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4425 10450 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4425 10475 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4400 10475 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4425 10425 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4425 10400 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4425 10425 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4400 10425 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4425 10375 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4425 10350 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4425 10375 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4400 10375 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4425 10325 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4425 10300 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4425 10325 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4400 10325 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10275 4425 10275 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4425 10250 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4425 10275 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4400 10275 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10225 4425 10225 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4425 10200 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4425 10225 4425
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4400 10225 4400
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4575 10575 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4575 10550 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4575 10575 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4550 10575 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4575 10525 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4575 10500 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4575 10525 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4550 10525 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4575 10475 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4575 10450 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4575 10475 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4550 10475 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4575 10425 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4575 10400 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4575 10425 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4550 10425 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4575 10375 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4575 10350 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4575 10375 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4550 10375 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4575 10325 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4575 10300 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4575 10325 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4550 10325 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10275 4575 10275 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4575 10250 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4575 10275 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4550 10275 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10225 4575 10225 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4575 10200 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4575 10225 4575
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4550 10225 4550
Wire Notes Line width 10 rgb(253, 26, 0)
	10575 4275 10575 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4275 10550 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4275 10575 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10550 4250 10575 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10525 4275 10525 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4275 10500 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4275 10525 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10500 4250 10525 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10475 4275 10475 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4275 10450 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4275 10475 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10450 4250 10475 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10425 4275 10425 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4275 10400 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4275 10425 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10400 4250 10425 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10375 4275 10375 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4275 10350 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4275 10375 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10350 4250 10375 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10325 4275 10325 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4275 10300 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4275 10325 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10300 4250 10325 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10275 4275 10275 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4275 10250 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4275 10275 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10250 4250 10275 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10225 4275 10225 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4275 10200 4250
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4275 10225 4275
Wire Notes Line width 10 rgb(253, 26, 0)
	10200 4250 10225 4250
Text Notes 8550 3900 0    100  ~ 20
Front Panel Light Modules
Text Notes 8550 3450 0    50   ~ 0
The front panel scanner synchronises two groups of\nsignals: the front panel output enables on various\nprocessor boards (using the ~FPOExx~ enables), and\nthe enables of the 8-bit latches on the front panel\nboards.\n\nThe front panel boards are organised in four modules\ntimes five rows. The module is enabled for writing by\nthe two-bit address FPA₀₋₁ and a specific row on that\nmodule is enabled for latching using ~ROW₁₋₅~.\n\nThese are in phase with the ~FPOExx~ enables, so the\nsame row on each module will always receive data from\nthe same processor board output buffer.\n\nThe addresses are scanned in increasing order,\nmodulo 21: ~FPOE20~ enables nothing, but is used to\nreset the count.\n\nAddresses over 20 are never reached by the autonomic\ncounter, but they may be put on the bus by the MCU to\nenable future units for debugging output (which however\nwon't appear on the front panel).\n\nAddresses are decoded across modules first, then down\nby row numbers: so the enables are interleaved across\n'138 decoders. (each decoder is responsible for one\nfront panel module)
$Comp
L alexios:74HC138 U?
U 2 1 5D448D60
P 2500 6650
AR Path="/5D448D60" Ref="U?"  Part="1" 
AR Path="/6233F88C/5D448D60" Ref="U1203"  Part="2" 
F 0 "U1203" H 2680 6696 50  0000 L CNN
F 1 "74HC138" H 2680 6605 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2500 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2500 6650 50  0001 C CNN
	2    2500 6650
	1    0    0    -1  
$EndComp
Connection ~ 2150 6550
Connection ~ 2150 6750
$Comp
L alexios:74HC138 U?
U 2 1 5D502AA8
P 1250 6650
AR Path="/5D502AA8" Ref="U?"  Part="1" 
AR Path="/6233F88C/5D502AA8" Ref="U1201"  Part="2" 
F 0 "U1201" H 1430 6696 50  0000 L CNN
F 1 "74HC138" H 1430 6605 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1250 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1250 6650 50  0001 C CNN
	2    1250 6650
	1    0    0    -1  
$EndComp
Connection ~ 900  6550
Connection ~ 900  6750
Text Notes 6450 900  0    50   ~ 10
FPA
Text Notes 6600 1100 2    50   ~ 10
00
Text Notes 6600 2400 2    50   ~ 10
01
Text Notes 6600 3600 2    50   ~ 10
02
Text Notes 6600 4850 2    50   ~ 10
03
Text Notes 6600 1200 2    50   ~ 10
04
Text Notes 6600 2500 2    50   ~ 10
05
Text Notes 6600 3700 2    50   ~ 10
06\n
Text Notes 6600 4950 2    50   ~ 10
07\n
Text Notes 6600 1300 2    50   ~ 10
08
Text Notes 6600 2600 2    50   ~ 10
09
Text Notes 6600 3800 2    50   ~ 10
0A
Text Notes 6600 5050 2    50   ~ 10
0B\n
Text Notes 6600 1400 2    50   ~ 10
0C
Text Notes 6600 2700 2    50   ~ 10
0D
Text Notes 6600 3900 2    50   ~ 10
0E
Text Notes 6600 5150 2    50   ~ 10
0F
Text Notes 6600 1500 2    50   ~ 10
10
Text Notes 6600 2800 2    50   ~ 10
11
Text Notes 6600 4000 2    50   ~ 10
12
Text Notes 6600 5250 2    50   ~ 10
13
Text Notes 6600 1600 2    50   ~ 10
14
Text Notes 6600 2900 2    50   ~ 10
15
Text Notes 6600 4100 2    50   ~ 10
16
Text Notes 6600 5350 2    50   ~ 10
17
Text Notes 6600 1700 2    50   ~ 10
18
Text Notes 6600 3000 2    50   ~ 10
19
Text Notes 6600 4200 2    50   ~ 10
1A
Text Notes 6600 5450 2    50   ~ 10
1B
Text Notes 6600 1800 2    50   ~ 10
1C
Text Notes 6600 3100 2    50   ~ 10
1D
Text Notes 6600 4300 2    50   ~ 10
1E
Text Notes 6600 5550 2    50   ~ 10
1F
Wire Bus Line
	4250 6350 7200 6350
Text Notes 6650 900  0    50   ~ 0
Front Panel Coords & Meaning
Text Notes 6850 5800 0    50   ~ 0
~FPOE20~ resets the autonomic counter after\nit's scanned 20 modules
Text Label 7100 5950 2    50   ~ 0
~FPOE20
Text Label 6200 1800 2    50   ~ 0
~FPOE28
Text Label 6200 1700 2    50   ~ 0
~FPOE24
Text Label 6200 1600 2    50   ~ 0
~FPOE20
Text Label 6200 1500 2    50   ~ 0
~FPOE16
Text Label 6200 1400 2    50   ~ 0
~FPOE12
Text Label 6200 1300 2    50   ~ 0
~FPOE8
Text Label 6200 1200 2    50   ~ 0
~FPOE4
Text Label 6200 1100 2    50   ~ 0
~FPOE0
Wire Wire Line
	5850 1100 6250 1100
Wire Wire Line
	5850 1800 6250 1800
Wire Wire Line
	5850 1700 6250 1700
Wire Wire Line
	5850 1600 6250 1600
Wire Wire Line
	5850 1500 6250 1500
Wire Wire Line
	5850 1400 6250 1400
Wire Wire Line
	5850 1300 6250 1300
Wire Wire Line
	5850 1200 6250 1200
Wire Wire Line
	5850 2350 6250 2350
Text Label 6200 2950 2    50   ~ 0
~FPOE25
Wire Wire Line
	5850 2450 6250 2450
Wire Wire Line
	5850 2550 6250 2550
Wire Wire Line
	5850 2750 6250 2750
Wire Wire Line
	5850 2850 6250 2850
Wire Wire Line
	5850 2650 6250 2650
Wire Wire Line
	5850 2950 6250 2950
Wire Wire Line
	5850 3050 6250 3050
Wire Wire Line
	5850 3600 6250 3600
Wire Wire Line
	5850 3700 6250 3700
Wire Wire Line
	5850 3800 6250 3800
Wire Wire Line
	5850 3900 6250 3900
Wire Wire Line
	5850 4000 6250 4000
Wire Wire Line
	5850 4100 6250 4100
Wire Wire Line
	5850 4200 6250 4200
Wire Wire Line
	5850 4300 6250 4300
Wire Wire Line
	5850 4850 6250 4850
Wire Wire Line
	5850 4950 6250 4950
Wire Wire Line
	5850 5050 6250 5050
Wire Wire Line
	5850 5150 6250 5150
Wire Wire Line
	5850 5250 6250 5250
Wire Wire Line
	5850 5350 6250 5350
Wire Wire Line
	5850 5450 6250 5450
Wire Wire Line
	5850 5550 6250 5550
$Comp
L power:GND #PWR0135
U 1 1 63A3A1CC
P 4850 3150
F 0 "#PWR0135" H 4850 2900 50  0001 C CNN
F 1 "GND" H 4855 2977 50  0000 C CNN
F 2 "" H 4850 3150 50  0001 C CNN
F 3 "" H 4850 3150 50  0001 C CNN
	1    4850 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01217
U 1 1 62DDF4E6
P 4850 1900
F 0 "#PWR01217" H 4850 1650 50  0001 C CNN
F 1 "GND" H 4855 1727 50  0000 C CNN
F 2 "" H 4850 1900 50  0001 C CNN
F 3 "" H 4850 1900 50  0001 C CNN
	1    4850 1900
	1    0    0    -1  
$EndComp
Text Label 2650 1800 2    50   ~ 0
~PANELEN
Wire Wire Line
	1150 1800 2650 1800
Text Label 1250 1800 0    50   ~ 0
~PANELEN
Text HLabel 1150 1800 0    50   Input ~ 0
~PANELEN
Entry Wire Line
	2250 3000 2350 3100
Entry Wire Line
	2250 3100 2350 3200
Wire Wire Line
	2350 3100 2650 3100
Wire Wire Line
	2350 3200 2650 3200
Text Label 2450 3200 0    50   ~ 0
FPA7
Text Label 2450 3100 0    50   ~ 0
FPA6
Text Notes 2500 4050 0    50   ~ 0
ROW₁ to ROW₅ are decoded strobes\nfor the front panel modules. The\nappropriate module is enabled for\nwriting using address FA₀–FA₁ and\nthe desired 8-bit register on that\nmodule is clocked using the ROW\nstrobes.
Text Notes 750  1600 0    50   ~ 0
When ~PANELEN~ is de-asserted,\nthe MCU can control the front panel\nlights directly.\n\n~PANELEN~ should ALWAYS be\nde-asserted when writing to MCU\naddresses &00–&03F.
$Comp
L alexios:74HC138 U?
U 1 1 5E2960BD
P 3150 2800
AR Path="/5E2960BD" Ref="U?"  Part="1" 
AR Path="/6233F88C/5E2960BD" Ref="U1202"  Part="1" 
F 0 "U1202" H 3150 3467 50  0000 C CNN
F 1 "74HC138" H 3150 3376 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3150 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3150 2800 50  0001 C CNN
	1    3150 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5E296CDE
P 1250 7400
AR Path="/5E296CDE" Ref="U?"  Part="1" 
AR Path="/6233F88C/5E296CDE" Ref="U1202"  Part="2" 
F 0 "U1202" H 1430 7446 50  0000 L CNN
F 1 "74HC138" H 1430 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1250 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1250 7400 50  0001 C CNN
	2    1250 7400
	1    0    0    -1  
$EndComp
Connection ~ 900  7300
Connection ~ 900  7500
Wire Wire Line
	4850 5400 4850 5450
Wire Wire Line
	2650 1900 2600 1900
Wire Wire Line
	1600 4750 1150 4750
Wire Wire Line
	1600 4850 1150 4850
Text HLabel 1150 4750 0    50   Input ~ 0
~WR
Text HLabel 1150 4850 0    50   Input ~ 0
~SCANEN
Text Label 1250 4750 0    50   ~ 0
~WR
Text Label 1250 4850 0    50   ~ 0
~SCANEN
Wire Notes Line width 24 style solid
	650  6100 650  4150
Text Notes 750  5250 0    63   ~ 13
Erratum, rev. A (1930)
$Comp
L alexios:74LVC1G00 U1207
U 1 1 5FBBC9C6
P 1900 4800
F 0 "U1207" H 1825 5067 50  0000 C CNN
F 1 "74LVC1G00" H 1825 4976 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1550 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 1550 4800 50  0001 C CNN
	1    1900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3000 2400 3000
Wire Wire Line
	2400 3000 2300 2900
Wire Wire Line
	2300 2900 2100 2900
Text Label 2450 3000 0    50   ~ 0
FPGATE
Text Label 2150 4800 0    50   ~ 0
FPGATE
Wire Notes Line width 24 style solid
	650  4150 3950 4150
Wire Wire Line
	2600 1950 2600 1900
Wire Wire Line
	2100 2900 2100 4250
Wire Wire Line
	2500 4250 2100 4250
Wire Wire Line
	2500 4800 2500 4250
Wire Wire Line
	2050 4800 2500 4800
$Comp
L alexios:74LVC1G00 U1207
U 2 1 601121D9
P 3300 4700
F 0 "U1207" H 3380 4646 50  0000 L CNN
F 1 "74LVC1G00" H 3380 4555 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2950 4700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 2950 4700 50  0001 C CNN
	2    3300 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6011422E
P 2850 4800
AR Path="/6011422E" Ref="C?"  Part="1" 
AR Path="/6233F88C/6011422E" Ref="C1"  Part="1" 
F 0 "C1" H 2759 4846 50  0000 R CNN
F 1 "100nF" H 2759 4755 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2850 4800 50  0001 C CNN
F 3 "~" H 2850 4800 50  0001 C CNN
	1    2850 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 60114234
P 2850 4700
F 0 "#PWR01" H 2850 4550 50  0001 C CNN
F 1 "+5V" H 2865 4873 50  0000 C CNN
F 2 "" H 2850 4700 50  0001 C CNN
F 3 "" H 2850 4700 50  0001 C CNN
	1    2850 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6011423A
P 2850 4900
F 0 "#PWR02" H 2850 4650 50  0001 C CNN
F 1 "GND" H 2855 4727 50  0000 C CNN
F 2 "" H 2850 4900 50  0001 C CNN
F 3 "" H 2850 4900 50  0001 C CNN
	1    2850 4900
	1    0    0    -1  
$EndComp
Connection ~ 2850 4900
Connection ~ 2850 4700
Text Notes 750  6000 0    50   ~ 0
In XMem mode, the Atmega writes to its address bus all the time, but the '138\ndecoder in Rev. A of the board isn't gated, so the front panel shows the inner\nworkings of the Atmega instead of the CFT!\n\nU1202 should be gated such that it strobes ~ROWx~ when either ~SCANEN~\nor the Atmega's ~WR~ signal is asserted.\n\nNote: this removes the (unused) ‘snoop-update’ mode of the FP.
Wire Notes Line width 24 style solid
	3950 4150 3950 6100
Wire Notes Line width 24 style solid
	3950 6100 650  6100
Wire Bus Line
	4150 2500 4150 6250
Wire Bus Line
	4250 1600 4250 5450
Wire Bus Line
	2250 800  2250 3100
Wire Bus Line
	4450 800  4450 4950
Wire Bus Line
	6350 1200 6350 6150
$EndSCHEMATC
