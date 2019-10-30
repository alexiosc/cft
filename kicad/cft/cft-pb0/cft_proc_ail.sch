EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 14
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
L alexios:74LVC1G74 U?
U 1 1 5CD3EF2C
P 7350 4300
AR Path="/5CD3EF2C" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF2C" Ref="U302"  Part="1" 
F 0 "U302" H 7350 4717 50  0000 C CNN
F 1 "74LVC1G74" H 7350 4626 50  0000 C CNN
F 2 "Housings_SSOP:TSSOP-8_3x3mm_Pitch0.65mm" H 7900 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 7900 4350 50  0001 C CNN
	1    7350 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5CD3EF32
P 5750 4350
AR Path="/5CD3EF32" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF32" Ref="U301"  Part="1" 
F 0 "U301" H 5750 5017 50  0000 C CNN
F 1 "74HC138" H 5750 4926 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 5750 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5750 4350 50  0001 C CNN
	1    5750 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CD3EF38
P 6850 3650
AR Path="/5CD3EF38" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD3EF38" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF38" Ref="R302"  Part="1" 
F 0 "R302" H 6792 3696 50  0000 R CNN
F 1 "10kΩ" H 6792 3605 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6850 3650 50  0001 C CNN
F 3 "~" H 6850 3650 50  0001 C CNN
	1    6850 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CD3EF3E
P 6850 3550
AR Path="/5CD3EF3E" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF3E" Ref="#PWR0306"  Part="1" 
F 0 "#PWR0306" H 6850 3400 50  0001 C CNN
F 1 "+5V" H 6865 3723 50  0000 C CNN
F 2 "" H 6850 3550 50  0001 C CNN
F 3 "" H 6850 3550 50  0001 C CNN
	1    6850 3550
	1    0    0    -1  
$EndComp
Text Label 5000 4050 2    50   ~ 0
IBUS10
Text Label 5000 4150 2    50   ~ 0
IBUS11
Wire Wire Line
	4650 4050 5250 4050
Wire Wire Line
	4650 4150 5250 4150
Text Notes 5000 4150 0    50   ~ 0
=I
Text Notes 5000 4050 0    50   ~ 0
=R
Wire Wire Line
	5250 4650 4650 4650
Wire Wire Line
	5250 4750 4650 4750
Text Label 5000 4650 2    50   ~ 0
IBUS8
Text Label 5000 4750 2    50   ~ 0
IBUS9
Wire Wire Line
	6250 4650 6350 4650
Wire Wire Line
	6350 4650 6350 4250
Wire Wire Line
	6350 4250 6900 4250
Text Label 6800 4250 2    50   ~ 0
~IR-AINDEX
Wire Wire Line
	6900 4150 6350 4150
Text Label 6800 4150 2    50   ~ 0
~RESET
Wire Wire Line
	6900 4350 6550 4350
Wire Wire Line
	6550 4350 6550 4950
Text Label 6800 4350 2    50   ~ 0
~WIR
Wire Wire Line
	6850 3750 6850 4450
Wire Wire Line
	6850 4450 6900 4450
$Comp
L Device:R_Small R?
U 1 1 5CD3EF5B
P 7900 4150
AR Path="/5CD3EF5B" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD3EF5B" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF5B" Ref="R303"  Part="1" 
F 0 "R303" V 7704 4150 50  0000 C CNN
F 1 "30Ω" V 7795 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7900 4150 50  0001 C CNN
F 3 "~" H 7900 4150 50  0001 C CNN
	1    7900 4150
	0    1    1    0   
$EndComp
Text HLabel 8150 4150 2    50   Output ~ 0
~AINDEX
$Comp
L Device:R_Small R?
U 1 1 5CD3EF62
P 5250 4450
AR Path="/5CD3EF62" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD3EF62" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF62" Ref="R301"  Part="1" 
F 0 "R301" H 5192 4496 50  0000 R CNN
F 1 "10kΩ" H 5192 4405 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5250 4450 50  0001 C CNN
F 3 "~" H 5250 4450 50  0001 C CNN
	1    5250 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CD3EF68
P 5250 4350
AR Path="/5CD3EF68" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF68" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 5250 4200 50  0001 C CNN
F 1 "+5V" H 5192 4387 50  0000 R CNN
F 2 "" H 5250 4350 50  0001 C CNN
F 3 "" H 5250 4350 50  0001 C CNN
	1    5250 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4150 8150 4150
Text Label 5000 4950 2    50   ~ 0
~WIR
Wire Bus Line
	4550 3750 4100 3750
Entry Wire Line
	4550 3950 4650 4050
Entry Wire Line
	4550 4050 4650 4150
Entry Wire Line
	4550 4550 4650 4650
Entry Wire Line
	4550 4650 4650 4750
Text Label 4550 3750 2    50   ~ 0
IBUS[0..15]
Text HLabel 4100 4950 0    50   Input ~ 0
~WIR
Text HLabel 4100 3750 0    50   Input ~ 0
IBUS[0..15]
Wire Wire Line
	4100 4950 6550 4950
Wire Wire Line
	6350 4150 6350 3550
Wire Wire Line
	6350 3550 4100 3550
Text HLabel 4100 3550 0    50   Input ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 5CD45D1C
P 5250 5300
AR Path="/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD45D1C" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 5250 5150 50  0001 C CNN
F 1 "+5V" H 5265 5473 50  0000 C CNN
F 2 "" H 5250 5300 50  0001 C CNN
F 3 "" H 5250 5300 50  0001 C CNN
	1    5250 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD45D3B
P 6900 5400
AR Path="/5CC0D65F/5CD45D3B" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CD45D3B" Ref="C302"  Part="1" 
F 0 "C302" H 6809 5446 50  0000 R CNN
F 1 "100nF" H 6809 5355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6900 5400 50  0001 C CNN
F 3 "~" H 6900 5400 50  0001 C CNN
	1    6900 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD45D4D
P 5250 5400
AR Path="/5CC0D65F/5CD45D4D" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CD45D4D" Ref="C301"  Part="1" 
F 0 "C301" H 5159 5446 50  0000 R CNN
F 1 "100nF" H 5159 5355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5250 5400 50  0001 C CNN
F 3 "~" H 5250 5400 50  0001 C CNN
	1    5250 5400
	1    0    0    -1  
$EndComp
Text Label 5000 3950 2    50   ~ 0
IBUS7
Entry Wire Line
	4550 3850 4650 3950
Wire Wire Line
	4650 3950 5250 3950
$Comp
L alexios:74HC138 U?
U 2 1 5D0CEDEF
P 5600 5400
AR Path="/5D0CEDEF" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5D0CEDEF" Ref="U301"  Part="2" 
F 0 "U301" H 5780 5446 50  0000 L CNN
F 1 "74HC138" H 5780 5355 50  0000 L CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 5600 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5600 5400 50  0001 C CNN
	2    5600 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U?
U 2 1 5D0D0AB2
P 7250 5400
AR Path="/5D0D0AB2" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5D0D0AB2" Ref="U302"  Part="2" 
F 0 "U302" H 7430 5446 50  0000 L CNN
F 1 "74LVC1G74" H 7430 5355 50  0000 L CNN
F 2 "Housings_SSOP:TSSOP-8_3x3mm_Pitch0.65mm" H 7800 5450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 7800 5450 50  0001 C CNN
	2    7250 5400
	1    0    0    -1  
$EndComp
Connection ~ 5250 5300
$Comp
L power:+5V #PWR?
U 1 1 5D0D3E5C
P 6900 5300
AR Path="/5D0D3E5C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D3E5C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D3E5C" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 6900 5150 50  0001 C CNN
F 1 "+5V" H 6915 5473 50  0000 C CNN
F 2 "" H 6900 5300 50  0001 C CNN
F 3 "" H 6900 5300 50  0001 C CNN
	1    6900 5300
	1    0    0    -1  
$EndComp
Connection ~ 6900 5300
$Comp
L power:GND #PWR?
U 1 1 5D0D46EB
P 5250 5500
AR Path="/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D46EB" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 5250 5250 50  0001 C CNN
F 1 "GND" H 5255 5327 50  0000 C CNN
F 2 "" H 5250 5500 50  0001 C CNN
F 3 "" H 5250 5500 50  0001 C CNN
	1    5250 5500
	1    0    0    -1  
$EndComp
Connection ~ 5250 5500
$Comp
L power:GND #PWR?
U 1 1 5D0D4ACB
P 6900 5500
AR Path="/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D4ACB" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 6900 5250 50  0001 C CNN
F 1 "GND" H 6905 5327 50  0000 C CNN
F 2 "" H 6900 5500 50  0001 C CNN
F 3 "" H 6900 5500 50  0001 C CNN
	1    6900 5500
	1    0    0    -1  
$EndComp
Connection ~ 6900 5500
NoConn ~ 7800 4450
NoConn ~ 6250 3950
NoConn ~ 6250 4050
NoConn ~ 6250 4150
NoConn ~ 6250 4250
NoConn ~ 6250 4350
NoConn ~ 6250 4450
NoConn ~ 6250 4550
Wire Bus Line
	4550 3750 4550 4650
$EndSCHEMATC
