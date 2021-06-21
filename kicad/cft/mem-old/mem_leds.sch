EESchema Schematic File Version 4
LIBS:mem-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 15 15
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7250 5800 0    50   ~ 0
1.2kΩ for I=2mA, Vf=2.65V.
Wire Notes Line style solid
	6950 5550 7150 5750
Wire Wire Line
	4200 1500 4750 1500
Wire Wire Line
	4200 1700 4750 1700
Wire Wire Line
	4200 2100 4750 2100
Wire Wire Line
	4200 3300 4750 3300
Wire Wire Line
	4200 3500 4750 3500
Wire Wire Line
	4750 2300 4200 2300
Wire Wire Line
	4750 2700 4200 2700
Text Label 4200 1500 0    50   ~ 0
~CS0
Text Label 4200 1700 0    50   ~ 0
~CS1
Text Label 4200 2100 0    50   ~ 0
~CS2
Text Label 4200 2300 0    50   ~ 0
~CS3
Text Label 4200 2700 0    50   ~ 0
~CS4
Text Label 4200 2900 0    50   ~ 0
~CS5
Text Label 4200 3300 0    50   ~ 0
~CS6
Text Label 4200 3500 0    50   ~ 0
~CS7
Wire Wire Line
	4200 3900 4750 3900
Wire Wire Line
	4200 4100 4750 4100
Wire Wire Line
	4200 4500 4750 4500
Wire Wire Line
	4750 4700 4200 4700
Text Label 4200 3900 0    50   ~ 0
~CS8
Text Label 4200 4100 0    50   ~ 0
~CS9
Text Label 4200 4500 0    50   ~ 0
~CS10
Text Label 4200 4700 0    50   ~ 0
~CS11
Wire Wire Line
	4750 2900 4200 2900
Wire Wire Line
	5050 1500 5200 1500
Wire Wire Line
	5050 1700 5200 1700
Wire Wire Line
	5200 1500 5200 1700
Wire Wire Line
	5050 2100 5200 2100
Wire Wire Line
	5050 2300 5200 2300
Wire Wire Line
	5200 2100 5200 2300
Wire Wire Line
	5050 2700 5200 2700
Wire Wire Line
	5050 2900 5200 2900
Wire Wire Line
	5200 2700 5200 2900
Wire Wire Line
	5050 3300 5200 3300
Wire Wire Line
	5050 3500 5200 3500
Wire Wire Line
	5200 3300 5200 3500
Wire Wire Line
	5050 3900 5200 3900
Wire Wire Line
	5050 4100 5200 4100
Wire Wire Line
	5200 3900 5200 4100
Wire Wire Line
	5050 4500 5200 4500
Wire Wire Line
	5050 4700 5200 4700
Wire Wire Line
	5200 4500 5200 4700
Text HLabel 4200 1500 0    50   Input ~ 0
~CS0
Text HLabel 4200 1700 0    50   Input ~ 0
~CS1
Text HLabel 4200 2100 0    50   Input ~ 0
~CS2
Text HLabel 4200 2300 0    50   Input ~ 0
~CS3
Text HLabel 4200 2700 0    50   Input ~ 0
~CS4
Text HLabel 4200 2900 0    50   Input ~ 0
~CS5
Text HLabel 4200 3300 0    50   Input ~ 0
~CS6
Text HLabel 4200 3500 0    50   Input ~ 0
~CS7
Text HLabel 4200 3900 0    50   Input ~ 0
~CS8
Text HLabel 4200 4100 0    50   Input ~ 0
~CS9
Text HLabel 4200 4500 0    50   Input ~ 0
~CS10
Text HLabel 4200 4700 0    50   Input ~ 0
~CS11
Text HLabel 4200 5300 0    50   Input ~ 0
~ROMCS
Text Label 4200 5300 0    50   ~ 0
~ROMCS
Wire Wire Line
	4200 5300 4750 5300
Wire Wire Line
	5200 1700 5400 1700
Wire Wire Line
	5400 1700 5400 1600
Connection ~ 5400 1700
$Comp
L Device:C_Small C?
U 1 1 5DDCAB0E
P 5850 1600
AR Path="/5DDCAB0E" Ref="C?"  Part="1" 
AR Path="/64C48268/5DDCAB0E" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DDCAB0E" Ref="C59"  Part="1" 
F 0 "C59" V 5750 1450 50  0000 L CNN
F 1 "1µF" V 5650 1550 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 1600 50  0001 C CNN
F 3 "~" H 5850 1600 50  0001 C CNN
	1    5850 1600
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 1600 5700 1600
Wire Wire Line
	5700 1600 5700 1500
Connection ~ 5700 1600
Wire Wire Line
	5700 1600 5750 1600
Wire Wire Line
	5400 1600 5450 1600
Wire Wire Line
	5950 1600 6000 1600
Wire Wire Line
	6000 1600 6000 1700
Wire Wire Line
	5400 1700 6000 1700
Wire Wire Line
	6000 1700 6200 1700
Connection ~ 6000 1700
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DDDA064
P 6500 1700
AR Path="/5DDDA064" Ref="U?"  Part="1" 
AR Path="/64C48268/5DDDA064" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DDDA064" Ref="U31"  Part="1" 
F 0 "U31" H 6450 1967 50  0000 C CNN
F 1 "74LVC1G17" H 6450 1876 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 1700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 1700 50  0001 C CNN
	1    6500 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DDDAA83
P 6800 1700
AR Path="/5DDDAA83" Ref="R?"  Part="1" 
AR Path="/64C48268/5DDDAA83" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DDDAA83" Ref="R2"  Part="1" 
F 0 "R2" V 6900 1700 50  0000 C CNN
F 1 "100Ω" V 7000 1700 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 1700 50  0001 C CNN
F 3 "~" H 6800 1700 50  0001 C CNN
	1    6800 1700
	0    1    1    0   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DD7A577
P 4900 1500
AR Path="/5DD7A577" Ref="D?"  Part="1" 
AR Path="/64C48268/5DD7A577" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DD7A577" Ref="D1"  Part="1" 
F 0 "D1" H 4800 1450 50  0000 R CNN
F 1 "1N4148" H 4800 1550 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 1500 50  0001 C CNN
F 3 "~" H 4900 1500 50  0001 C CNN
	1    4900 1500
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEB21CA
P 4900 1700
AR Path="/5DEB21CA" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEB21CA" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEB21CA" Ref="D2"  Part="1" 
F 0 "D2" H 4800 1650 50  0000 R CNN
F 1 "1N4148" H 4800 1750 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 1700 50  0001 C CNN
F 3 "~" H 4900 1700 50  0001 C CNN
	1    4900 1700
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEB31FC
P 4900 2100
AR Path="/5DEB31FC" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEB31FC" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEB31FC" Ref="D4"  Part="1" 
F 0 "D4" H 4800 2050 50  0000 R CNN
F 1 "1N4148" H 4800 2150 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 2100 50  0001 C CNN
F 3 "~" H 4900 2100 50  0001 C CNN
	1    4900 2100
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEB3202
P 4900 2300
AR Path="/5DEB3202" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEB3202" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEB3202" Ref="D5"  Part="1" 
F 0 "D5" H 4800 2250 50  0000 R CNN
F 1 "1N4148" H 4800 2350 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 2300 50  0001 C CNN
F 3 "~" H 4900 2300 50  0001 C CNN
	1    4900 2300
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEB7E50
P 4900 2700
AR Path="/5DEB7E50" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEB7E50" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEB7E50" Ref="D7"  Part="1" 
F 0 "D7" H 4800 2650 50  0000 R CNN
F 1 "1N4148" H 4800 2750 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 2700 50  0001 C CNN
F 3 "~" H 4900 2700 50  0001 C CNN
	1    4900 2700
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEB7E56
P 4900 2900
AR Path="/5DEB7E56" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEB7E56" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEB7E56" Ref="D8"  Part="1" 
F 0 "D8" H 4800 2850 50  0000 R CNN
F 1 "1N4148" H 4800 2950 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 2900 50  0001 C CNN
F 3 "~" H 4900 2900 50  0001 C CNN
	1    4900 2900
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEBB958
P 4900 3300
AR Path="/5DEBB958" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEBB958" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEBB958" Ref="D10"  Part="1" 
F 0 "D10" H 4800 3250 50  0000 R CNN
F 1 "1N4148" H 4800 3350 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 3300 50  0001 C CNN
F 3 "~" H 4900 3300 50  0001 C CNN
	1    4900 3300
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEBB95E
P 4900 3500
AR Path="/5DEBB95E" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEBB95E" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEBB95E" Ref="D11"  Part="1" 
F 0 "D11" H 4800 3450 50  0000 R CNN
F 1 "1N4148" H 4800 3550 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 3500 50  0001 C CNN
F 3 "~" H 4900 3500 50  0001 C CNN
	1    4900 3500
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEBF4A6
P 4900 3900
AR Path="/5DEBF4A6" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEBF4A6" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEBF4A6" Ref="D13"  Part="1" 
F 0 "D13" H 4800 3850 50  0000 R CNN
F 1 "1N4148" H 4800 3950 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 3900 50  0001 C CNN
F 3 "~" H 4900 3900 50  0001 C CNN
	1    4900 3900
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEBF4AC
P 4900 4100
AR Path="/5DEBF4AC" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEBF4AC" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEBF4AC" Ref="D14"  Part="1" 
F 0 "D14" H 4800 4050 50  0000 R CNN
F 1 "1N4148" H 4800 4150 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 4100 50  0001 C CNN
F 3 "~" H 4900 4100 50  0001 C CNN
	1    4900 4100
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEC3B1A
P 4900 4500
AR Path="/5DEC3B1A" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEC3B1A" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEC3B1A" Ref="D16"  Part="1" 
F 0 "D16" H 4800 4450 50  0000 R CNN
F 1 "1N4148" H 4800 4550 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 4500 50  0001 C CNN
F 3 "~" H 4900 4500 50  0001 C CNN
	1    4900 4500
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEC3B20
P 4900 4700
AR Path="/5DEC3B20" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEC3B20" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEC3B20" Ref="D17"  Part="1" 
F 0 "D17" H 4800 4650 50  0000 R CNN
F 1 "1N4148" H 4800 4750 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 4700 50  0001 C CNN
F 3 "~" H 4900 4700 50  0001 C CNN
	1    4900 4700
	1    0    0    1   
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 5DEC777E
P 4900 5300
AR Path="/5DEC777E" Ref="D?"  Part="1" 
AR Path="/64C48268/5DEC777E" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DEC777E" Ref="D19"  Part="1" 
F 0 "D19" H 4800 5250 50  0000 R CNN
F 1 "1N4148" H 4800 5350 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" H 4900 5300 50  0001 C CNN
F 3 "~" H 4900 5300 50  0001 C CNN
	1    4900 5300
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DDC7965
P 5550 1600
AR Path="/5DDC7965" Ref="R?"  Part="1" 
AR Path="/64C48268/5DDC7965" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DDC7965" Ref="R1"  Part="1" 
F 0 "R1" V 5654 1600 50  0000 R CNN
F 1 "100kΩ" V 5745 1600 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 1600 50  0001 C CNN
F 3 "~" H 5550 1600 50  0001 C CNN
	1    5550 1600
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 5DED5F34
P 5700 1500
F 0 "#PWR0122" H 5700 1350 50  0001 C CNN
F 1 "+5V" H 5715 1673 50  0000 C CNN
F 2 "" H 5700 1500 50  0001 C CNN
F 3 "" H 5700 1500 50  0001 C CNN
	1    5700 1500
	1    0    0    -1  
$EndComp
Connection ~ 5200 1700
Wire Wire Line
	5200 2300 5400 2300
Wire Wire Line
	5400 2300 5400 2200
Connection ~ 5400 2300
$Comp
L Device:C_Small C?
U 1 1 5DEDF571
P 5850 2200
AR Path="/5DEDF571" Ref="C?"  Part="1" 
AR Path="/64C48268/5DEDF571" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DEDF571" Ref="C60"  Part="1" 
F 0 "C60" V 5750 2050 50  0000 L CNN
F 1 "1µF" V 5650 2150 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 2200 50  0001 C CNN
F 3 "~" H 5850 2200 50  0001 C CNN
	1    5850 2200
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 2200 5700 2200
Wire Wire Line
	5700 2200 5700 2100
Connection ~ 5700 2200
Wire Wire Line
	5700 2200 5750 2200
Wire Wire Line
	5400 2200 5450 2200
Wire Wire Line
	5950 2200 6000 2200
Wire Wire Line
	6000 2200 6000 2300
Wire Wire Line
	5400 2300 6000 2300
Wire Wire Line
	6000 2300 6200 2300
Connection ~ 6000 2300
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DEDF581
P 6500 2300
AR Path="/5DEDF581" Ref="U?"  Part="1" 
AR Path="/64C48268/5DEDF581" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DEDF581" Ref="U32"  Part="1" 
F 0 "U32" H 6450 2567 50  0000 C CNN
F 1 "74LVC1G17" H 6450 2476 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 2300 50  0001 C CNN
	1    6500 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEDF58F
P 5550 2200
AR Path="/5DEDF58F" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEDF58F" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEDF58F" Ref="R3"  Part="1" 
F 0 "R3" V 5654 2200 50  0000 R CNN
F 1 "100kΩ" V 5745 2200 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 2200 50  0001 C CNN
F 3 "~" H 5550 2200 50  0001 C CNN
	1    5550 2200
	0    1    -1   0   
$EndComp
Wire Wire Line
	6900 2300 7000 2300
$Comp
L power:+5V #PWR0124
U 1 1 5DEDF59C
P 5700 2100
F 0 "#PWR0124" H 5700 1950 50  0001 C CNN
F 1 "+5V" H 5715 2273 50  0000 C CNN
F 2 "" H 5700 2100 50  0001 C CNN
F 3 "" H 5700 2100 50  0001 C CNN
	1    5700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2900 5400 2900
Wire Wire Line
	5400 2900 5400 2800
Connection ~ 5400 2900
$Comp
L Device:C_Small C?
U 1 1 5DEE232F
P 5850 2800
AR Path="/5DEE232F" Ref="C?"  Part="1" 
AR Path="/64C48268/5DEE232F" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DEE232F" Ref="C61"  Part="1" 
F 0 "C61" V 5750 2650 50  0000 L CNN
F 1 "1µF" V 5650 2750 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 2800 50  0001 C CNN
F 3 "~" H 5850 2800 50  0001 C CNN
	1    5850 2800
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 2800 5700 2800
Wire Wire Line
	5700 2800 5700 2700
Connection ~ 5700 2800
Wire Wire Line
	5700 2800 5750 2800
Wire Wire Line
	5400 2800 5450 2800
Wire Wire Line
	5950 2800 6000 2800
Wire Wire Line
	6000 2800 6000 2900
Wire Wire Line
	5400 2900 6000 2900
Wire Wire Line
	6000 2900 6200 2900
Connection ~ 6000 2900
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DEE233F
P 6500 2900
AR Path="/5DEE233F" Ref="U?"  Part="1" 
AR Path="/64C48268/5DEE233F" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DEE233F" Ref="U33"  Part="1" 
F 0 "U33" H 6450 3167 50  0000 C CNN
F 1 "74LVC1G17" H 6450 3076 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 2900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 2900 50  0001 C CNN
	1    6500 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEE234D
P 5550 2800
AR Path="/5DEE234D" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEE234D" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEE234D" Ref="R5"  Part="1" 
F 0 "R5" V 5654 2800 50  0000 R CNN
F 1 "100kΩ" V 5745 2800 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 2800 50  0001 C CNN
F 3 "~" H 5550 2800 50  0001 C CNN
	1    5550 2800
	0    1    -1   0   
$EndComp
Wire Wire Line
	6900 2900 7000 2900
$Comp
L power:+5V #PWR0126
U 1 1 5DEE235A
P 5700 2700
F 0 "#PWR0126" H 5700 2550 50  0001 C CNN
F 1 "+5V" H 5715 2873 50  0000 C CNN
F 2 "" H 5700 2700 50  0001 C CNN
F 3 "" H 5700 2700 50  0001 C CNN
	1    5700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3500 5400 3500
Wire Wire Line
	5400 3500 5400 3400
Connection ~ 5400 3500
$Comp
L Device:C_Small C?
U 1 1 5DEE52EC
P 5850 3400
AR Path="/5DEE52EC" Ref="C?"  Part="1" 
AR Path="/64C48268/5DEE52EC" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DEE52EC" Ref="C62"  Part="1" 
F 0 "C62" V 5750 3250 50  0000 L CNN
F 1 "1µF" V 5650 3350 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 3400 50  0001 C CNN
F 3 "~" H 5850 3400 50  0001 C CNN
	1    5850 3400
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 3400 5700 3400
Wire Wire Line
	5700 3400 5700 3300
Connection ~ 5700 3400
Wire Wire Line
	5700 3400 5750 3400
Wire Wire Line
	5400 3400 5450 3400
Wire Wire Line
	5950 3400 6000 3400
Wire Wire Line
	6000 3400 6000 3500
Wire Wire Line
	5400 3500 6000 3500
Wire Wire Line
	6000 3500 6200 3500
Connection ~ 6000 3500
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DEE52FC
P 6500 3500
AR Path="/5DEE52FC" Ref="U?"  Part="1" 
AR Path="/64C48268/5DEE52FC" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DEE52FC" Ref="U34"  Part="1" 
F 0 "U34" H 6450 3767 50  0000 C CNN
F 1 "74LVC1G17" H 6450 3676 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 3500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 3500 50  0001 C CNN
	1    6500 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEE530A
P 5550 3400
AR Path="/5DEE530A" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEE530A" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEE530A" Ref="R7"  Part="1" 
F 0 "R7" V 5654 3400 50  0000 R CNN
F 1 "100kΩ" V 5745 3400 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 3400 50  0001 C CNN
F 3 "~" H 5550 3400 50  0001 C CNN
	1    5550 3400
	0    1    -1   0   
$EndComp
Wire Wire Line
	6900 3500 7000 3500
$Comp
L power:+5V #PWR0128
U 1 1 5DEE5317
P 5700 3300
F 0 "#PWR0128" H 5700 3150 50  0001 C CNN
F 1 "+5V" H 5715 3473 50  0000 C CNN
F 2 "" H 5700 3300 50  0001 C CNN
F 3 "" H 5700 3300 50  0001 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4100 5400 4100
Wire Wire Line
	5400 4100 5400 4000
Connection ~ 5400 4100
$Comp
L Device:C_Small C?
U 1 1 5DEE8E3C
P 5850 4000
AR Path="/5DEE8E3C" Ref="C?"  Part="1" 
AR Path="/64C48268/5DEE8E3C" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DEE8E3C" Ref="C63"  Part="1" 
F 0 "C63" V 5750 3850 50  0000 L CNN
F 1 "1µF" V 5650 3950 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 4000 50  0001 C CNN
F 3 "~" H 5850 4000 50  0001 C CNN
	1    5850 4000
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 4000 5700 4000
Wire Wire Line
	5700 4000 5700 3900
Connection ~ 5700 4000
Wire Wire Line
	5700 4000 5750 4000
Wire Wire Line
	5400 4000 5450 4000
Wire Wire Line
	5950 4000 6000 4000
Wire Wire Line
	6000 4000 6000 4100
Wire Wire Line
	5400 4100 6000 4100
Wire Wire Line
	6000 4100 6200 4100
Connection ~ 6000 4100
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DEE8E4C
P 6500 4100
AR Path="/5DEE8E4C" Ref="U?"  Part="1" 
AR Path="/64C48268/5DEE8E4C" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DEE8E4C" Ref="U35"  Part="1" 
F 0 "U35" H 6450 4367 50  0000 C CNN
F 1 "74LVC1G17" H 6450 4276 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 4100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 4100 50  0001 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEE8E5A
P 5550 4000
AR Path="/5DEE8E5A" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEE8E5A" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEE8E5A" Ref="R9"  Part="1" 
F 0 "R9" V 5654 4000 50  0000 R CNN
F 1 "100kΩ" V 5745 4000 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 4000 50  0001 C CNN
F 3 "~" H 5550 4000 50  0001 C CNN
	1    5550 4000
	0    1    -1   0   
$EndComp
Wire Wire Line
	6900 4100 7000 4100
$Comp
L power:+5V #PWR0130
U 1 1 5DEE8E67
P 5700 3900
F 0 "#PWR0130" H 5700 3750 50  0001 C CNN
F 1 "+5V" H 5715 4073 50  0000 C CNN
F 2 "" H 5700 3900 50  0001 C CNN
F 3 "" H 5700 3900 50  0001 C CNN
	1    5700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4700 5400 4700
Wire Wire Line
	5400 4700 5400 4600
Connection ~ 5400 4700
$Comp
L Device:C_Small C?
U 1 1 5DEECB05
P 5850 4600
AR Path="/5DEECB05" Ref="C?"  Part="1" 
AR Path="/64C48268/5DEECB05" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DEECB05" Ref="C64"  Part="1" 
F 0 "C64" V 5750 4450 50  0000 L CNN
F 1 "1µF" V 5650 4550 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 4600 50  0001 C CNN
F 3 "~" H 5850 4600 50  0001 C CNN
	1    5850 4600
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 4600 5700 4600
Wire Wire Line
	5700 4600 5700 4500
Connection ~ 5700 4600
Wire Wire Line
	5700 4600 5750 4600
Wire Wire Line
	5400 4600 5450 4600
Wire Wire Line
	5950 4600 6000 4600
Wire Wire Line
	6000 4600 6000 4700
Wire Wire Line
	5400 4700 6000 4700
Wire Wire Line
	6000 4700 6200 4700
Connection ~ 6000 4700
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DEECB15
P 6500 4700
AR Path="/5DEECB15" Ref="U?"  Part="1" 
AR Path="/64C48268/5DEECB15" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DEECB15" Ref="U36"  Part="1" 
F 0 "U36" H 6450 4967 50  0000 C CNN
F 1 "74LVC1G17" H 6450 4876 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 4700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 4700 50  0001 C CNN
	1    6500 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEECB23
P 5550 4600
AR Path="/5DEECB23" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEECB23" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEECB23" Ref="R11"  Part="1" 
F 0 "R11" V 5654 4600 50  0000 R CNN
F 1 "100kΩ" V 5745 4600 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 4600 50  0001 C CNN
F 3 "~" H 5550 4600 50  0001 C CNN
	1    5550 4600
	0    1    -1   0   
$EndComp
Wire Wire Line
	6900 4700 7000 4700
$Comp
L power:+5V #PWR0132
U 1 1 5DEECB30
P 5700 4500
F 0 "#PWR0132" H 5700 4350 50  0001 C CNN
F 1 "+5V" H 5715 4673 50  0000 C CNN
F 2 "" H 5700 4500 50  0001 C CNN
F 3 "" H 5700 4500 50  0001 C CNN
	1    5700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5300 5400 5200
Connection ~ 5400 5300
$Comp
L Device:C_Small C?
U 1 1 5DEFB254
P 5850 5200
AR Path="/5DEFB254" Ref="C?"  Part="1" 
AR Path="/64C48268/5DEFB254" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5DEFB254" Ref="C65"  Part="1" 
F 0 "C65" V 5750 5050 50  0000 L CNN
F 1 "1µF" V 5650 5150 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 5200 50  0001 C CNN
F 3 "~" H 5850 5200 50  0001 C CNN
	1    5850 5200
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 5200 5700 5200
Wire Wire Line
	5700 5200 5700 5100
Connection ~ 5700 5200
Wire Wire Line
	5700 5200 5750 5200
Wire Wire Line
	5400 5200 5450 5200
Wire Wire Line
	5950 5200 6000 5200
Wire Wire Line
	6000 5200 6000 5300
Wire Wire Line
	5400 5300 6000 5300
Wire Wire Line
	6000 5300 6200 5300
Connection ~ 6000 5300
$Comp
L alexios:74LVC1G17 U?
U 1 1 5DEFB264
P 6500 5300
AR Path="/5DEFB264" Ref="U?"  Part="1" 
AR Path="/64C48268/5DEFB264" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5DEFB264" Ref="U37"  Part="1" 
F 0 "U37" H 6450 5567 50  0000 C CNN
F 1 "74LVC1G17" H 6450 5476 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6500 5300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 6500 5300 50  0001 C CNN
	1    6500 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEFB26A
P 6800 5300
AR Path="/5DEFB26A" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEFB26A" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEFB26A" Ref="R14"  Part="1" 
F 0 "R14" V 6900 5300 50  0000 C CNN
F 1 "150Ω" V 7000 5300 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 5300 50  0001 C CNN
F 3 "~" H 6800 5300 50  0001 C CNN
	1    6800 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DEFB272
P 5550 5200
AR Path="/5DEFB272" Ref="R?"  Part="1" 
AR Path="/64C48268/5DEFB272" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DEFB272" Ref="R13"  Part="1" 
F 0 "R13" V 5654 5200 50  0000 R CNN
F 1 "100kΩ" V 5745 5200 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 5200 50  0001 C CNN
F 3 "~" H 5550 5200 50  0001 C CNN
	1    5550 5200
	0    1    -1   0   
$EndComp
Wire Wire Line
	6900 5300 7000 5300
$Comp
L power:+5V #PWR0134
U 1 1 5DEFB27F
P 5700 5100
F 0 "#PWR0134" H 5700 4950 50  0001 C CNN
F 1 "+5V" H 5715 5273 50  0000 C CNN
F 2 "" H 5700 5100 50  0001 C CNN
F 3 "" H 5700 5100 50  0001 C CNN
	1    5700 5100
	1    0    0    -1  
$EndComp
Connection ~ 5200 2300
Connection ~ 5200 2900
Connection ~ 5200 3500
Connection ~ 5200 4100
Connection ~ 5200 4700
Wire Wire Line
	5050 5300 5400 5300
Wire Wire Line
	7350 1700 7350 1650
$Comp
L power:+5V #PWR0123
U 1 1 5DED6885
P 7350 1650
F 0 "#PWR0123" H 7350 1500 50  0001 C CNN
F 1 "+5V" H 7365 1823 50  0000 C CNN
F 2 "" H 7350 1650 50  0001 C CNN
F 3 "" H 7350 1650 50  0001 C CNN
	1    7350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1700 7000 1700
Wire Wire Line
	7300 1700 7350 1700
$Comp
L Device:LED_ALT D?
U 1 1 5DDDB86D
P 7150 1700
AR Path="/5DDDB86D" Ref="D?"  Part="1" 
AR Path="/64C48268/5DDDB86D" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DDDB86D" Ref="D3"  Part="1" 
F 0 "D3" H 7250 1800 50  0000 L CNN
F 1 "LED_ALT" H 7143 1536 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 1700 50  0001 C CNN
F 3 "~" H 7150 1700 50  0001 C CNN
F 4 "Green" H 7250 1900 50  0000 L CNN "Colour"
	1    7150 1700
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0135
U 1 1 5DEFB285
P 7350 5250
F 0 "#PWR0135" H 7350 5100 50  0001 C CNN
F 1 "+5V" H 7365 5423 50  0000 C CNN
F 2 "" H 7350 5250 50  0001 C CNN
F 3 "" H 7350 5250 50  0001 C CNN
	1    7350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 5300 7350 5250
Wire Wire Line
	7300 5300 7350 5300
$Comp
L power:+5V #PWR0133
U 1 1 5DEECB36
P 7350 4650
F 0 "#PWR0133" H 7350 4500 50  0001 C CNN
F 1 "+5V" H 7365 4823 50  0000 C CNN
F 2 "" H 7350 4650 50  0001 C CNN
F 3 "" H 7350 4650 50  0001 C CNN
	1    7350 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4700 7350 4650
Wire Wire Line
	7300 4700 7350 4700
$Comp
L power:+5V #PWR0131
U 1 1 5DEE8E6D
P 7350 4050
F 0 "#PWR0131" H 7350 3900 50  0001 C CNN
F 1 "+5V" H 7365 4223 50  0000 C CNN
F 2 "" H 7350 4050 50  0001 C CNN
F 3 "" H 7350 4050 50  0001 C CNN
	1    7350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4100 7350 4050
Wire Wire Line
	7300 4100 7350 4100
$Comp
L power:+5V #PWR0129
U 1 1 5DEE531D
P 7350 3450
F 0 "#PWR0129" H 7350 3300 50  0001 C CNN
F 1 "+5V" H 7365 3623 50  0000 C CNN
F 2 "" H 7350 3450 50  0001 C CNN
F 3 "" H 7350 3450 50  0001 C CNN
	1    7350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3500 7350 3450
Wire Wire Line
	7300 3500 7350 3500
$Comp
L power:+5V #PWR0127
U 1 1 5DEE2360
P 7350 2850
F 0 "#PWR0127" H 7350 2700 50  0001 C CNN
F 1 "+5V" H 7365 3023 50  0000 C CNN
F 2 "" H 7350 2850 50  0001 C CNN
F 3 "" H 7350 2850 50  0001 C CNN
	1    7350 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2900 7350 2850
Wire Wire Line
	7300 2900 7350 2900
$Comp
L power:+5V #PWR0125
U 1 1 5DEDF5A2
P 7350 2250
F 0 "#PWR0125" H 7350 2100 50  0001 C CNN
F 1 "+5V" H 7365 2423 50  0000 C CNN
F 2 "" H 7350 2250 50  0001 C CNN
F 3 "" H 7350 2250 50  0001 C CNN
	1    7350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2300 7350 2250
Wire Wire Line
	7300 2300 7350 2300
$Comp
L Device:R_Small R?
U 1 1 5DFBE80E
P 6800 2300
AR Path="/5DFBE80E" Ref="R?"  Part="1" 
AR Path="/64C48268/5DFBE80E" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DFBE80E" Ref="R4"  Part="1" 
F 0 "R4" V 6900 2300 50  0000 C CNN
F 1 "100Ω" V 7000 2300 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 2300 50  0001 C CNN
F 3 "~" H 6800 2300 50  0001 C CNN
	1    6800 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DFC2BFE
P 6800 2900
AR Path="/5DFC2BFE" Ref="R?"  Part="1" 
AR Path="/64C48268/5DFC2BFE" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DFC2BFE" Ref="R6"  Part="1" 
F 0 "R6" V 6900 2900 50  0000 C CNN
F 1 "100Ω" V 7000 2900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 2900 50  0001 C CNN
F 3 "~" H 6800 2900 50  0001 C CNN
	1    6800 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DFC2C04
P 6800 3500
AR Path="/5DFC2C04" Ref="R?"  Part="1" 
AR Path="/64C48268/5DFC2C04" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DFC2C04" Ref="R8"  Part="1" 
F 0 "R8" V 6900 3500 50  0000 C CNN
F 1 "100Ω" V 7000 3500 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 3500 50  0001 C CNN
F 3 "~" H 6800 3500 50  0001 C CNN
	1    6800 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DFC6F08
P 6800 4100
AR Path="/5DFC6F08" Ref="R?"  Part="1" 
AR Path="/64C48268/5DFC6F08" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DFC6F08" Ref="R10"  Part="1" 
F 0 "R10" V 6900 4100 50  0000 C CNN
F 1 "100Ω" V 7000 4100 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 4100 50  0001 C CNN
F 3 "~" H 6800 4100 50  0001 C CNN
	1    6800 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5DFC6F0E
P 6800 4700
AR Path="/5DFC6F0E" Ref="R?"  Part="1" 
AR Path="/64C48268/5DFC6F0E" Ref="R?"  Part="1" 
AR Path="/5DD740F6/5DFC6F0E" Ref="R12"  Part="1" 
F 0 "R12" V 6900 4700 50  0000 C CNN
F 1 "100Ω" V 7000 4700 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6800 4700 50  0001 C CNN
F 3 "~" H 6800 4700 50  0001 C CNN
	1    6800 4700
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFD0B6A
P 7150 2300
AR Path="/5DFD0B6A" Ref="D?"  Part="1" 
AR Path="/64C48268/5DFD0B6A" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DFD0B6A" Ref="D6"  Part="1" 
F 0 "D6" H 7250 2400 50  0000 L CNN
F 1 "LED_ALT" H 7143 2136 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 2300 50  0001 C CNN
F 3 "~" H 7150 2300 50  0001 C CNN
F 4 "Green" H 7250 2500 50  0000 L CNN "Colour"
	1    7150 2300
	1    0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFD22B9
P 7150 2900
AR Path="/5DFD22B9" Ref="D?"  Part="1" 
AR Path="/64C48268/5DFD22B9" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DFD22B9" Ref="D9"  Part="1" 
F 0 "D9" H 7250 3000 50  0000 L CNN
F 1 "LED_ALT" H 7143 2736 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 2900 50  0001 C CNN
F 3 "~" H 7150 2900 50  0001 C CNN
F 4 "Green" H 7250 3100 50  0000 L CNN "Colour"
	1    7150 2900
	1    0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFD22C0
P 7150 3500
AR Path="/5DFD22C0" Ref="D?"  Part="1" 
AR Path="/64C48268/5DFD22C0" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DFD22C0" Ref="D12"  Part="1" 
F 0 "D12" H 7250 3600 50  0000 L CNN
F 1 "LED_ALT" H 7143 3336 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 3500 50  0001 C CNN
F 3 "~" H 7150 3500 50  0001 C CNN
F 4 "Green" H 7250 3700 50  0000 L CNN "Colour"
	1    7150 3500
	1    0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFD6DBD
P 7150 4100
AR Path="/5DFD6DBD" Ref="D?"  Part="1" 
AR Path="/64C48268/5DFD6DBD" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DFD6DBD" Ref="D15"  Part="1" 
F 0 "D15" H 7250 4200 50  0000 L CNN
F 1 "LED_ALT" H 7143 3936 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 4100 50  0001 C CNN
F 3 "~" H 7150 4100 50  0001 C CNN
F 4 "Green" H 7250 4300 50  0000 L CNN "Colour"
	1    7150 4100
	1    0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFD6DC4
P 7150 4700
AR Path="/5DFD6DC4" Ref="D?"  Part="1" 
AR Path="/64C48268/5DFD6DC4" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DFD6DC4" Ref="D18"  Part="1" 
F 0 "D18" H 7250 4800 50  0000 L CNN
F 1 "LED_ALT" H 7143 4536 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 4700 50  0001 C CNN
F 3 "~" H 7150 4700 50  0001 C CNN
F 4 "Green" H 7250 4900 50  0000 L CNN "Colour"
	1    7150 4700
	1    0    0    1   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 5DFDA9D1
P 7150 5300
AR Path="/5DFDA9D1" Ref="D?"  Part="1" 
AR Path="/64C48268/5DFDA9D1" Ref="D?"  Part="1" 
AR Path="/5DD740F6/5DFDA9D1" Ref="D20"  Part="1" 
F 0 "D20" H 7250 5400 50  0000 L CNN
F 1 "LED_ALT" H 7143 5136 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 5300 50  0001 C CNN
F 3 "~" H 7150 5300 50  0001 C CNN
F 4 "Red" H 7250 5500 50  0000 L CNN "Colour"
	1    7150 5300
	1    0    0    1   
$EndComp
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E423D0B
P 8550 1600
AR Path="/5E423D0B" Ref="U?"  Part="1" 
AR Path="/64C48268/5E423D0B" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E423D0B" Ref="U31"  Part="2" 
F 0 "U31" H 8730 1546 50  0000 L CNN
F 1 "74LVC1G17" H 8730 1455 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8550 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 8550 1600 50  0001 C CNN
	2    8550 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E427681
P 8200 1700
AR Path="/5E94D03A/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E427681" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E427681" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E427681" Ref="C?"  Part="1" 
AR Path="/5E427681" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E427681" Ref="C66"  Part="1" 
F 0 "C66" H 8109 1746 50  0000 R CNN
F 1 "100nF" H 8109 1655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 1700 50  0001 C CNN
F 3 "~" H 8200 1700 50  0001 C CNN
	1    8200 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E427687
P 8200 1600
AR Path="/5E427687" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E427687" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 8200 1450 50  0001 C CNN
F 1 "+5V" H 8215 1773 50  0000 C CNN
F 2 "" H 8200 1600 50  0001 C CNN
F 3 "" H 8200 1600 50  0001 C CNN
	1    8200 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E42768E
P 8200 1800
AR Path="/5E42768E" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E42768E" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 8200 1550 50  0001 C CNN
F 1 "GND" H 8205 1627 50  0000 C CNN
F 2 "" H 8200 1800 50  0001 C CNN
F 3 "" H 8200 1800 50  0001 C CNN
	1    8200 1800
	1    0    0    -1  
$EndComp
Connection ~ 8200 1600
Connection ~ 8200 1800
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E45EF44
P 9750 2200
AR Path="/5E45EF44" Ref="U?"  Part="1" 
AR Path="/64C48268/5E45EF44" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E45EF44" Ref="U32"  Part="2" 
F 0 "U32" H 9930 2146 50  0000 L CNN
F 1 "74LVC1G17" H 9930 2055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9750 2200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 9750 2200 50  0001 C CNN
	2    9750 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E45EF50
P 9400 2200
AR Path="/5E45EF50" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E45EF50" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 9400 2050 50  0001 C CNN
F 1 "+5V" H 9415 2373 50  0000 C CNN
F 2 "" H 9400 2200 50  0001 C CNN
F 3 "" H 9400 2200 50  0001 C CNN
	1    9400 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E45EF56
P 9400 2400
AR Path="/5E45EF56" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E45EF56" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 9400 2150 50  0001 C CNN
F 1 "GND" H 9405 2227 50  0000 C CNN
F 2 "" H 9400 2400 50  0001 C CNN
F 3 "" H 9400 2400 50  0001 C CNN
	1    9400 2400
	1    0    0    -1  
$EndComp
Connection ~ 9400 2200
Connection ~ 9400 2400
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E46A046
P 8550 2800
AR Path="/5E46A046" Ref="U?"  Part="1" 
AR Path="/64C48268/5E46A046" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E46A046" Ref="U33"  Part="2" 
F 0 "U33" H 8730 2746 50  0000 L CNN
F 1 "74LVC1G17" H 8730 2655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8550 2800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 8550 2800 50  0001 C CNN
	2    8550 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E46A04C
P 8200 2900
AR Path="/5E94D03A/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5E46A04C" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E46A04C" Ref="C68"  Part="1" 
F 0 "C68" H 8109 2946 50  0000 R CNN
F 1 "100nF" H 8109 2855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 2900 50  0001 C CNN
F 3 "~" H 8200 2900 50  0001 C CNN
	1    8200 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E46A052
P 8200 2800
AR Path="/5E46A052" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E46A052" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 8200 2650 50  0001 C CNN
F 1 "+5V" H 8215 2973 50  0000 C CNN
F 2 "" H 8200 2800 50  0001 C CNN
F 3 "" H 8200 2800 50  0001 C CNN
	1    8200 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E46A058
P 8200 3000
AR Path="/5E46A058" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E46A058" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 8200 2750 50  0001 C CNN
F 1 "GND" H 8205 2827 50  0000 C CNN
F 2 "" H 8200 3000 50  0001 C CNN
F 3 "" H 8200 3000 50  0001 C CNN
	1    8200 3000
	1    0    0    -1  
$EndComp
Connection ~ 8200 2800
Connection ~ 8200 3000
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E46A060
P 9750 3400
AR Path="/5E46A060" Ref="U?"  Part="1" 
AR Path="/64C48268/5E46A060" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E46A060" Ref="U34"  Part="2" 
F 0 "U34" H 9930 3346 50  0000 L CNN
F 1 "74LVC1G17" H 9930 3255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9750 3400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 9750 3400 50  0001 C CNN
	2    9750 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E46A066
P 9400 3500
AR Path="/5E94D03A/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E46A066" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E46A066" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E46A066" Ref="C?"  Part="1" 
AR Path="/5E46A066" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E46A066" Ref="C69"  Part="1" 
F 0 "C69" H 9309 3546 50  0000 R CNN
F 1 "100nF" H 9309 3455 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9400 3500 50  0001 C CNN
F 3 "~" H 9400 3500 50  0001 C CNN
	1    9400 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E46A06C
P 9400 3400
AR Path="/5E46A06C" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E46A06C" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 9400 3250 50  0001 C CNN
F 1 "+5V" H 9415 3573 50  0000 C CNN
F 2 "" H 9400 3400 50  0001 C CNN
F 3 "" H 9400 3400 50  0001 C CNN
	1    9400 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E46A072
P 9400 3600
AR Path="/5E46A072" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E46A072" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 9400 3350 50  0001 C CNN
F 1 "GND" H 9405 3427 50  0000 C CNN
F 2 "" H 9400 3600 50  0001 C CNN
F 3 "" H 9400 3600 50  0001 C CNN
	1    9400 3600
	1    0    0    -1  
$EndComp
Connection ~ 9400 3400
Connection ~ 9400 3600
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E4707B6
P 8550 4000
AR Path="/5E4707B6" Ref="U?"  Part="1" 
AR Path="/64C48268/5E4707B6" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E4707B6" Ref="U35"  Part="2" 
F 0 "U35" H 8730 3946 50  0000 L CNN
F 1 "74LVC1G17" H 8730 3855 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8550 4000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 8550 4000 50  0001 C CNN
	2    8550 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4707BC
P 8200 4100
AR Path="/5E94D03A/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5E4707BC" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E4707BC" Ref="C70"  Part="1" 
F 0 "C70" H 8109 4146 50  0000 R CNN
F 1 "100nF" H 8109 4055 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 4100 50  0001 C CNN
F 3 "~" H 8200 4100 50  0001 C CNN
	1    8200 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4707C2
P 8200 4000
AR Path="/5E4707C2" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E4707C2" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 8200 3850 50  0001 C CNN
F 1 "+5V" H 8215 4173 50  0000 C CNN
F 2 "" H 8200 4000 50  0001 C CNN
F 3 "" H 8200 4000 50  0001 C CNN
	1    8200 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4707C8
P 8200 4200
AR Path="/5E4707C8" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E4707C8" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 8200 3950 50  0001 C CNN
F 1 "GND" H 8205 4027 50  0000 C CNN
F 2 "" H 8200 4200 50  0001 C CNN
F 3 "" H 8200 4200 50  0001 C CNN
	1    8200 4200
	1    0    0    -1  
$EndComp
Connection ~ 8200 4000
Connection ~ 8200 4200
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E4707D0
P 9750 4600
AR Path="/5E4707D0" Ref="U?"  Part="1" 
AR Path="/64C48268/5E4707D0" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E4707D0" Ref="U36"  Part="2" 
F 0 "U36" H 9930 4546 50  0000 L CNN
F 1 "74LVC1G17" H 9930 4455 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9750 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 9750 4600 50  0001 C CNN
	2    9750 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4707D6
P 9400 4700
AR Path="/5E94D03A/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5E4707D6" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E4707D6" Ref="C71"  Part="1" 
F 0 "C71" H 9309 4746 50  0000 R CNN
F 1 "100nF" H 9309 4655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9400 4700 50  0001 C CNN
F 3 "~" H 9400 4700 50  0001 C CNN
	1    9400 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4707DC
P 9400 4600
AR Path="/5E4707DC" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E4707DC" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 9400 4450 50  0001 C CNN
F 1 "+5V" H 9415 4773 50  0000 C CNN
F 2 "" H 9400 4600 50  0001 C CNN
F 3 "" H 9400 4600 50  0001 C CNN
	1    9400 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4707E2
P 9400 4800
AR Path="/5E4707E2" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E4707E2" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 9400 4550 50  0001 C CNN
F 1 "GND" H 9405 4627 50  0000 C CNN
F 2 "" H 9400 4800 50  0001 C CNN
F 3 "" H 9400 4800 50  0001 C CNN
	1    9400 4800
	1    0    0    -1  
$EndComp
Connection ~ 9400 4600
Connection ~ 9400 4800
$Comp
L alexios:74LVC1G17 U?
U 2 1 5E474F02
P 8550 5200
AR Path="/5E474F02" Ref="U?"  Part="1" 
AR Path="/64C48268/5E474F02" Ref="U?"  Part="1" 
AR Path="/5DD740F6/5E474F02" Ref="U37"  Part="2" 
F 0 "U37" H 8730 5146 50  0000 L CNN
F 1 "74LVC1G17" H 8730 5055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8550 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G17.pdf" H 8550 5200 50  0001 C CNN
	2    8550 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E474F08
P 8200 5300
AR Path="/5E94D03A/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E474F08" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E474F08" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E474F08" Ref="C?"  Part="1" 
AR Path="/5E474F08" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E474F08" Ref="C72"  Part="1" 
F 0 "C72" H 8109 5346 50  0000 R CNN
F 1 "100nF" H 8109 5255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 5300 50  0001 C CNN
F 3 "~" H 8200 5300 50  0001 C CNN
	1    8200 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E474F0E
P 8200 5200
AR Path="/5E474F0E" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E474F0E" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 8200 5050 50  0001 C CNN
F 1 "+5V" H 8215 5373 50  0000 C CNN
F 2 "" H 8200 5200 50  0001 C CNN
F 3 "" H 8200 5200 50  0001 C CNN
	1    8200 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E474F14
P 8200 5400
AR Path="/5E474F14" Ref="#PWR?"  Part="1" 
AR Path="/5DD740F6/5E474F14" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 8200 5150 50  0001 C CNN
F 1 "GND" H 8205 5227 50  0000 C CNN
F 2 "" H 8200 5400 50  0001 C CNN
F 3 "" H 8200 5400 50  0001 C CNN
	1    8200 5400
	1    0    0    -1  
$EndComp
Connection ~ 8200 5200
Connection ~ 8200 5400
Text Notes 7250 6000 0    50   ~ 0
Vf=2.1V (red 0805 LEDs), I=20mA: R=145Ω (use 150Ω)\nVf=3.2V (green 0805 LEDs), I=20mA: R=90Ω (use 100Ω)
$Comp
L Device:C_Small C?
U 1 1 5E45EF4A
P 9400 2300
AR Path="/5E94D03A/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC68F14/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC75B87/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC75B97/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC8475C/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC8476C/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC8477C/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5EC8478C/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECB980E/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECB981E/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECCD509/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECCD519/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECCD529/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECCD539/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5E45EF4A" Ref="C?"  Part="1" 
AR Path="/5DD740F6/5E45EF4A" Ref="C67"  Part="1" 
F 0 "C67" H 9309 2346 50  0000 R CNN
F 1 "100nF" H 9309 2255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9400 2300 50  0001 C CNN
F 3 "~" H 9400 2300 50  0001 C CNN
	1    9400 2300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
