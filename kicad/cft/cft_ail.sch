EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 24
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
L alexios:74LVC1G74 U?
U 1 1 5CD3EF2C
P 6050 4000
AR Path="/5CD3EF2C" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF2C" Ref="U201"  Part="1" 
F 0 "U201" H 6050 4417 50  0000 C CNN
F 1 "74LVC1G74" H 6050 4326 50  0000 C CNN
F 2 "Housings_SSOP:TSSOP-8_3x3mm_Pitch0.65mm" H 6600 4050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 6600 4050 50  0001 C CNN
	1    6050 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5CD3EF32
P 4450 4050
AR Path="/5CD3EF32" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF32" Ref="U202"  Part="1" 
F 0 "U202" H 4450 4717 50  0000 C CNN
F 1 "74HC138" H 4450 4626 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 4450 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4450 4050 50  0001 C CNN
	1    4450 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5CD3EF38
P 5550 3350
AR Path="/5CD3EF38" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD3EF38" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF38" Ref="R201"  Part="1" 
F 0 "R201" H 5492 3396 50  0000 R CNN
F 1 "10kΩ" H 5492 3305 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5550 3350 50  0001 C CNN
F 3 "~" H 5550 3350 50  0001 C CNN
	1    5550 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CD3EF3E
P 5550 3250
AR Path="/5CD3EF3E" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF3E" Ref="#PWR0201"  Part="1" 
F 0 "#PWR0201" H 5550 3100 50  0001 C CNN
F 1 "+5V" H 5565 3423 50  0000 C CNN
F 2 "" H 5550 3250 50  0001 C CNN
F 3 "" H 5550 3250 50  0001 C CNN
	1    5550 3250
	1    0    0    -1  
$EndComp
Text Label 3700 3750 2    50   ~ 0
IBUS10
Text Label 3700 3850 2    50   ~ 0
IBUS11
Wire Wire Line
	3350 3750 3950 3750
Wire Wire Line
	3350 3850 3950 3850
Text Notes 3700 3850 0    50   ~ 0
=I
Text Notes 3700 3750 0    50   ~ 0
=R
Wire Wire Line
	3950 4350 3350 4350
Wire Wire Line
	3950 4450 3350 4450
Text Label 3700 4350 2    50   ~ 0
IBUS8
Text Label 3700 4450 2    50   ~ 0
IBUS9
Wire Wire Line
	4950 4350 5050 4350
Wire Wire Line
	5050 4350 5050 3950
Wire Wire Line
	5050 3950 5600 3950
Text Label 5500 3950 2    50   ~ 0
~IR-AINDEX
Wire Wire Line
	5600 3850 5050 3850
Text Label 5500 3850 2    50   ~ 0
~RESET
Wire Wire Line
	5600 4050 5250 4050
Wire Wire Line
	5250 4050 5250 4650
Text Label 5500 4050 2    50   ~ 0
~WIR
Wire Wire Line
	5550 3450 5550 4150
Wire Wire Line
	5550 4150 5600 4150
$Comp
L Device:R_Small R?
U 1 1 5CD3EF5B
P 6600 3850
AR Path="/5CD3EF5B" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD3EF5B" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF5B" Ref="R202"  Part="1" 
F 0 "R202" V 6404 3850 50  0000 C CNN
F 1 "30Ω" V 6495 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6600 3850 50  0001 C CNN
F 3 "~" H 6600 3850 50  0001 C CNN
	1    6600 3850
	0    1    1    0   
$EndComp
Text HLabel 6850 3850 2    50   Output ~ 0
~AINDEX
$Comp
L Device:R_Small R?
U 1 1 5CD3EF62
P 3950 4150
AR Path="/5CD3EF62" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD3EF62" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF62" Ref="R203"  Part="1" 
F 0 "R203" H 3892 4196 50  0000 R CNN
F 1 "10kΩ" H 3892 4105 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3950 4150 50  0001 C CNN
F 3 "~" H 3950 4150 50  0001 C CNN
	1    3950 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CD3EF68
P 3950 4050
AR Path="/5CD3EF68" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD3EF68" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0202" H 3950 3900 50  0001 C CNN
F 1 "+5V" H 3892 4087 50  0000 R CNN
F 2 "" H 3950 4050 50  0001 C CNN
F 3 "" H 3950 4050 50  0001 C CNN
	1    3950 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3850 6850 3850
Text Label 3700 4650 2    50   ~ 0
~WIR
Wire Bus Line
	3250 3450 2800 3450
Entry Wire Line
	3250 3650 3350 3750
Entry Wire Line
	3250 3750 3350 3850
Entry Wire Line
	3250 4250 3350 4350
Entry Wire Line
	3250 4350 3350 4450
Text Label 3250 3450 2    50   ~ 0
IBUS[0..15]
Text HLabel 2800 4650 0    50   Input ~ 0
~WIR
Text HLabel 2800 3450 0    50   Input ~ 0
IBUS[0..15]
Wire Wire Line
	2800 4650 5250 4650
Wire Wire Line
	5050 3850 5050 3250
Wire Wire Line
	5050 3250 2800 3250
Text HLabel 2800 3250 0    50   Input ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 5CD45D1C
P 4050 7000
AR Path="/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD45D1C" Ref="#PWR0203"  Part="1" 
F 0 "#PWR0203" H 4050 6850 50  0001 C CNN
F 1 "+5V" H 4065 7173 50  0000 C CNN
F 2 "" H 4050 7000 50  0001 C CNN
F 3 "" H 4050 7000 50  0001 C CNN
	1    4050 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD45D3B
P 5700 7100
AR Path="/5CC0D65F/5CD45D3B" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CD45D3B" Ref="C202"  Part="1" 
F 0 "C202" H 5609 7146 50  0000 R CNN
F 1 "100nF" H 5609 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5700 7100 50  0001 C CNN
F 3 "~" H 5700 7100 50  0001 C CNN
	1    5700 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD45D4D
P 4050 7100
AR Path="/5CC0D65F/5CD45D4D" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CD45D4D" Ref="C201"  Part="1" 
F 0 "C201" H 3959 7146 50  0000 R CNN
F 1 "100nF" H 3959 7055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 7100 50  0001 C CNN
F 3 "~" H 4050 7100 50  0001 C CNN
	1    4050 7100
	1    0    0    -1  
$EndComp
Text Label 3700 3650 2    50   ~ 0
IBUS7
Entry Wire Line
	3250 3550 3350 3650
Wire Wire Line
	3350 3650 3950 3650
$Comp
L alexios:74HC138 U?
U 2 1 5D0CEDEF
P 4400 7100
AR Path="/5D0CEDEF" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5D0CEDEF" Ref="U202"  Part="2" 
F 0 "U202" H 4580 7146 50  0000 L CNN
F 1 "74HC138" H 4580 7055 50  0000 L CNN
F 2 "Package_SO:SOIC-16W_5.3x10.2mm_P1.27mm" H 4400 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4400 7100 50  0001 C CNN
	2    4400 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G74 U?
U 2 1 5D0D0AB2
P 6050 7100
AR Path="/5D0D0AB2" Ref="U?"  Part="1" 
AR Path="/5CD3AC27/5D0D0AB2" Ref="U201"  Part="2" 
F 0 "U201" H 6230 7146 50  0000 L CNN
F 1 "74LVC1G74" H 6230 7055 50  0000 L CNN
F 2 "Housings_SSOP:TSSOP-8_3x3mm_Pitch0.65mm" H 6600 7150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 6600 7150 50  0001 C CNN
	2    6050 7100
	1    0    0    -1  
$EndComp
Connection ~ 4050 7000
$Comp
L power:+5V #PWR?
U 1 1 5D0D3E5C
P 5700 7000
AR Path="/5D0D3E5C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D3E5C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D3E5C" Ref="#PWR0204"  Part="1" 
F 0 "#PWR0204" H 5700 6850 50  0001 C CNN
F 1 "+5V" H 5715 7173 50  0000 C CNN
F 2 "" H 5700 7000 50  0001 C CNN
F 3 "" H 5700 7000 50  0001 C CNN
	1    5700 7000
	1    0    0    -1  
$EndComp
Connection ~ 5700 7000
$Comp
L power:GND #PWR?
U 1 1 5D0D46EB
P 4050 7200
AR Path="/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D46EB" Ref="#PWR0205"  Part="1" 
F 0 "#PWR0205" H 4050 6950 50  0001 C CNN
F 1 "GND" H 4055 7027 50  0000 C CNN
F 2 "" H 4050 7200 50  0001 C CNN
F 3 "" H 4050 7200 50  0001 C CNN
	1    4050 7200
	1    0    0    -1  
$EndComp
Connection ~ 4050 7200
$Comp
L power:GND #PWR?
U 1 1 5D0D4ACB
P 5700 7200
AR Path="/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D4ACB" Ref="#PWR0206"  Part="1" 
F 0 "#PWR0206" H 5700 6950 50  0001 C CNN
F 1 "GND" H 5705 7027 50  0000 C CNN
F 2 "" H 5700 7200 50  0001 C CNN
F 3 "" H 5700 7200 50  0001 C CNN
	1    5700 7200
	1    0    0    -1  
$EndComp
Connection ~ 5700 7200
NoConn ~ 6500 4150
NoConn ~ 4950 3650
NoConn ~ 4950 3750
NoConn ~ 4950 3850
NoConn ~ 4950 3950
NoConn ~ 4950 4050
NoConn ~ 4950 4150
NoConn ~ 4950 4250
Text Notes 7150 6950 0    197  ~ 39
Auto-Index Logic (AIL)
Wire Bus Line
	3250 3450 3250 4350
$EndSCHEMATC
