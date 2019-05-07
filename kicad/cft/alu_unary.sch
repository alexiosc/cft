EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 19 23
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 3600 3750 0    100  ~ 20
µ01
$Comp
L alexios:29F040 U?
U 1 1 608A74F2
P 6000 2950
AR Path="/5DEAC282/608A74F2" Ref="U?"  Part="1" 
AR Path="/608A74F2" Ref="U?"  Part="1" 
AR Path="/608889E2/608A74F2" Ref="U?"  Part="1" 
F 0 "U?" H 5975 4067 50  0000 C CNN
F 1 "29F040" H 5975 3976 50  0000 C CNN
F 2 "" H 6000 2950 50  0001 C CNN
F 3 "" H 6000 2950 50  0001 C CNN
	1    6000 2950
	1    0    0    -1  
$EndComp
Text Notes 5900 3750 0    100  ~ 20
µ01
$Comp
L alexios:29F040 U?
U 1 1 608A74F9
P 8300 2950
AR Path="/5DEAC282/608A74F9" Ref="U?"  Part="1" 
AR Path="/608A74F9" Ref="U?"  Part="1" 
AR Path="/608889E2/608A74F9" Ref="U?"  Part="1" 
F 0 "U?" H 8275 4067 50  0000 C CNN
F 1 "29F040" H 8275 3976 50  0000 C CNN
F 2 "" H 8300 2950 50  0001 C CNN
F 3 "" H 8300 2950 50  0001 C CNN
	1    8300 2950
	1    0    0    -1  
$EndComp
Text Notes 8200 3750 0    100  ~ 20
µ01
$Comp
L Device:C_Small C?
U 1 1 608A7500
P 7600 5150
AR Path="/5CC0D65F/608A7500" Ref="C?"  Part="1" 
AR Path="/608A7500" Ref="C?"  Part="1" 
AR Path="/60413270/608A7500" Ref="C?"  Part="1" 
AR Path="/608889E2/608A7500" Ref="C?"  Part="1" 
F 0 "C?" H 7509 5196 50  0000 R CNN
F 1 "1µF" H 7509 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7600 5150 50  0001 C CNN
F 3 "~" H 7600 5150 50  0001 C CNN
	1    7600 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 608A7506
P 5300 5150
AR Path="/5CC0D65F/608A7506" Ref="C?"  Part="1" 
AR Path="/608A7506" Ref="C?"  Part="1" 
AR Path="/60413270/608A7506" Ref="C?"  Part="1" 
AR Path="/608889E2/608A7506" Ref="C?"  Part="1" 
F 0 "C?" H 5209 5196 50  0000 R CNN
F 1 "1µF" H 5209 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 5150 50  0001 C CNN
F 3 "~" H 5300 5150 50  0001 C CNN
	1    5300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 5050 8000 5050
$Comp
L power:+5V #PWR?
U 1 1 608A750D
P 7800 5050
AR Path="/608A750D" Ref="#PWR?"  Part="1" 
AR Path="/60413270/608A750D" Ref="#PWR?"  Part="1" 
AR Path="/608889E2/608A750D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 4900 50  0001 C CNN
F 1 "+5V" H 7815 5223 50  0000 C CNN
F 2 "" H 7800 5050 50  0001 C CNN
F 3 "" H 7800 5050 50  0001 C CNN
	1    7800 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 5250 8000 5250
$Comp
L power:GND #PWR?
U 1 1 608A7514
P 7800 5250
AR Path="/608A7514" Ref="#PWR?"  Part="1" 
AR Path="/60413270/608A7514" Ref="#PWR?"  Part="1" 
AR Path="/608889E2/608A7514" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 5000 50  0001 C CNN
F 1 "GND" H 7805 5077 50  0000 C CNN
F 2 "" H 7800 5250 50  0001 C CNN
F 3 "" H 7800 5250 50  0001 C CNN
	1    7800 5250
	1    0    0    -1  
$EndComp
Connection ~ 7800 5250
Wire Wire Line
	7600 5250 7800 5250
Connection ~ 7800 5050
Wire Wire Line
	7600 5050 7800 5050
$Comp
L Device:C_Small C?
U 1 1 608A751E
P 8000 5150
AR Path="/5CC0D65F/608A751E" Ref="C?"  Part="1" 
AR Path="/608A751E" Ref="C?"  Part="1" 
AR Path="/60413270/608A751E" Ref="C?"  Part="1" 
AR Path="/608889E2/608A751E" Ref="C?"  Part="1" 
F 0 "C?" H 7909 5196 50  0000 R CNN
F 1 "100nF" H 7909 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8000 5150 50  0001 C CNN
F 3 "~" H 8000 5150 50  0001 C CNN
	1    8000 5150
	1    0    0    -1  
$EndComp
Connection ~ 8000 5050
Connection ~ 8000 5250
$Comp
L alexios:29F040 U?
U 2 1 608A7526
P 8350 5900
AR Path="/5DEAC282/608A7526" Ref="U?"  Part="1" 
AR Path="/608A7526" Ref="U?"  Part="2" 
AR Path="/60413270/608A7526" Ref="U?"  Part="2" 
AR Path="/608889E2/608A7526" Ref="U?"  Part="2" 
F 0 "U?" H 8530 6696 50  0000 L CNN
F 1 "29F040" H 8530 6605 50  0000 L CNN
F 2 "" H 8350 5900 50  0001 C CNN
F 3 "" H 8350 5900 50  0001 C CNN
	2    8350 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5050 5700 5050
$Comp
L power:+5V #PWR?
U 1 1 608A752D
P 5500 5050
AR Path="/608A752D" Ref="#PWR?"  Part="1" 
AR Path="/60413270/608A752D" Ref="#PWR?"  Part="1" 
AR Path="/608889E2/608A752D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5500 4900 50  0001 C CNN
F 1 "+5V" H 5515 5223 50  0000 C CNN
F 2 "" H 5500 5050 50  0001 C CNN
F 3 "" H 5500 5050 50  0001 C CNN
	1    5500 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5250 5700 5250
$Comp
L power:GND #PWR?
U 1 1 608A7534
P 5500 5250
AR Path="/608A7534" Ref="#PWR?"  Part="1" 
AR Path="/60413270/608A7534" Ref="#PWR?"  Part="1" 
AR Path="/608889E2/608A7534" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5500 5000 50  0001 C CNN
F 1 "GND" H 5505 5077 50  0000 C CNN
F 2 "" H 5500 5250 50  0001 C CNN
F 3 "" H 5500 5250 50  0001 C CNN
	1    5500 5250
	1    0    0    -1  
$EndComp
Connection ~ 5500 5250
Wire Wire Line
	5300 5250 5500 5250
Connection ~ 5500 5050
Wire Wire Line
	5300 5050 5500 5050
$Comp
L Device:C_Small C?
U 1 1 608A753E
P 5700 5150
AR Path="/5CC0D65F/608A753E" Ref="C?"  Part="1" 
AR Path="/608A753E" Ref="C?"  Part="1" 
AR Path="/60413270/608A753E" Ref="C?"  Part="1" 
AR Path="/608889E2/608A753E" Ref="C?"  Part="1" 
F 0 "C?" H 5609 5196 50  0000 R CNN
F 1 "100nF" H 5609 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5700 5150 50  0001 C CNN
F 3 "~" H 5700 5150 50  0001 C CNN
	1    5700 5150
	1    0    0    -1  
$EndComp
Connection ~ 5700 5050
Connection ~ 5700 5250
$Comp
L alexios:29F040 U?
U 2 1 608A7546
P 6050 5900
AR Path="/5DEAC282/608A7546" Ref="U?"  Part="1" 
AR Path="/608A7546" Ref="U?"  Part="2" 
AR Path="/60413270/608A7546" Ref="U?"  Part="2" 
AR Path="/608889E2/608A7546" Ref="U?"  Part="2" 
F 0 "U?" H 6230 6696 50  0000 L CNN
F 1 "29F040" H 6230 6605 50  0000 L CNN
F 2 "" H 6050 5900 50  0001 C CNN
F 3 "" H 6050 5900 50  0001 C CNN
	2    6050 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5050 3400 5050
$Comp
L power:+5V #PWR?
U 1 1 608A754D
P 3200 5050
AR Path="/608A754D" Ref="#PWR?"  Part="1" 
AR Path="/60413270/608A754D" Ref="#PWR?"  Part="1" 
AR Path="/608889E2/608A754D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 4900 50  0001 C CNN
F 1 "+5V" H 3215 5223 50  0000 C CNN
F 2 "" H 3200 5050 50  0001 C CNN
F 3 "" H 3200 5050 50  0001 C CNN
	1    3200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5250 3400 5250
$Comp
L power:GND #PWR?
U 1 1 608A7554
P 3200 5250
AR Path="/608A7554" Ref="#PWR?"  Part="1" 
AR Path="/60413270/608A7554" Ref="#PWR?"  Part="1" 
AR Path="/608889E2/608A7554" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 5000 50  0001 C CNN
F 1 "GND" H 3205 5077 50  0000 C CNN
F 2 "" H 3200 5250 50  0001 C CNN
F 3 "" H 3200 5250 50  0001 C CNN
	1    3200 5250
	1    0    0    -1  
$EndComp
Connection ~ 3200 5250
Wire Wire Line
	3000 5250 3200 5250
Connection ~ 3200 5050
Wire Wire Line
	3000 5050 3200 5050
$Comp
L Device:C_Small C?
U 1 1 608A755E
P 3000 5150
AR Path="/5CC0D65F/608A755E" Ref="C?"  Part="1" 
AR Path="/608A755E" Ref="C?"  Part="1" 
AR Path="/60413270/608A755E" Ref="C?"  Part="1" 
AR Path="/608889E2/608A755E" Ref="C?"  Part="1" 
F 0 "C?" H 2909 5196 50  0000 R CNN
F 1 "1µF" H 2909 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3000 5150 50  0001 C CNN
F 3 "~" H 3000 5150 50  0001 C CNN
	1    3000 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 608A7564
P 3400 5150
AR Path="/5CC0D65F/608A7564" Ref="C?"  Part="1" 
AR Path="/608A7564" Ref="C?"  Part="1" 
AR Path="/60413270/608A7564" Ref="C?"  Part="1" 
AR Path="/608889E2/608A7564" Ref="C?"  Part="1" 
F 0 "C?" H 3309 5196 50  0000 R CNN
F 1 "100nF" H 3309 5105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3400 5150 50  0001 C CNN
F 3 "~" H 3400 5150 50  0001 C CNN
	1    3400 5150
	1    0    0    -1  
$EndComp
Connection ~ 3400 5050
Connection ~ 3400 5250
$Comp
L alexios:29F040 U?
U 2 1 608A756C
P 3750 5900
AR Path="/5DEAC282/608A756C" Ref="U?"  Part="1" 
AR Path="/608A756C" Ref="U?"  Part="2" 
AR Path="/60413270/608A756C" Ref="U?"  Part="2" 
AR Path="/608889E2/608A756C" Ref="U?"  Part="2" 
F 0 "U?" H 3930 6696 50  0000 L CNN
F 1 "29F040" H 3930 6605 50  0000 L CNN
F 2 "" H 3750 5900 50  0001 C CNN
F 3 "" H 3750 5900 50  0001 C CNN
	2    3750 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2100 2700 2100
Wire Wire Line
	3050 2200 2700 2200
Wire Wire Line
	3050 2300 2700 2300
Wire Wire Line
	3050 2400 2700 2400
Wire Wire Line
	3050 2500 2700 2500
Wire Wire Line
	3050 2600 2700 2600
Wire Wire Line
	3050 2700 2700 2700
Wire Wire Line
	3050 2800 2700 2800
Wire Wire Line
	3050 2900 2700 2900
Wire Wire Line
	3050 3000 2700 3000
Wire Wire Line
	3050 3100 2700 3100
Wire Wire Line
	3050 3200 2700 3200
Wire Wire Line
	3050 3300 2700 3300
Wire Wire Line
	3050 3600 2700 3600
Wire Wire Line
	3050 3700 2700 3700
Wire Wire Line
	3050 3800 2700 3800
Text Label 2850 2100 0    50   ~ 0
A0
Text Label 2850 2200 0    50   ~ 0
A1
Text Label 2850 2300 0    50   ~ 0
A2
Text Label 2850 2400 0    50   ~ 0
A3
Text Label 2850 2500 0    50   ~ 0
A4
Text Label 2850 2600 0    50   ~ 0
A5
Text Label 2850 2700 0    50   ~ 0
A6
Text Label 2850 2800 0    50   ~ 0
A7
Text Label 2850 2900 0    50   ~ 0
A8
Text Label 2850 3000 0    50   ~ 0
A9
Text Label 2850 3100 0    50   ~ 0
A13
Text Label 2850 3200 0    50   ~ 0
A14
Text Label 2850 3300 0    50   ~ 0
A15
Text Label 2850 3400 0    50   ~ 0
FL
Text Label 2850 3500 0    50   ~ 0
~IRQS
Text Label 2850 3600 0    50   ~ 0
UOP0
Text Label 2850 3700 0    50   ~ 0
UOP1
Text Label 2850 3800 0    50   ~ 0
UOP2
Wire Wire Line
	3050 3900 3000 3900
Wire Wire Line
	3000 3900 3000 4350
Wire Wire Line
	3000 4350 3600 4350
Wire Wire Line
	3600 4350 3600 4300
Wire Wire Line
	8350 4550 8350 4300
Wire Wire Line
	2250 4550 3750 4550
Text HLabel 2250 4550 0    50   Input ~ 0
~BOE
Wire Wire Line
	6050 4300 6050 4550
Text Label 3600 4550 2    50   ~ 0
~BOE
Text Label 5900 4550 2    50   ~ 0
~BOE
Text Label 8200 4550 2    50   ~ 0
~BOE
Wire Wire Line
	5900 4300 5900 4350
Wire Wire Line
	5300 4350 5300 3900
Wire Wire Line
	5300 3900 5350 3900
Wire Wire Line
	8200 4300 8200 4350
Wire Wire Line
	8200 4350 7600 4350
Wire Wire Line
	7600 4350 7600 3900
Wire Wire Line
	7600 3900 7650 3900
$Comp
L power:GND #PWR?
U 1 1 608A75A6
P 3000 4350
F 0 "#PWR?" H 3000 4100 50  0001 C CNN
F 1 "GND" H 2922 4313 50  0000 R CNN
F 2 "" H 3000 4350 50  0001 C CNN
F 3 "" H 3000 4350 50  0001 C CNN
	1    3000 4350
	1    0    0    -1  
$EndComp
Connection ~ 3000 4350
Wire Wire Line
	5900 4350 5300 4350
$Comp
L power:GND #PWR?
U 1 1 608A75AE
P 5300 4350
F 0 "#PWR?" H 5300 4100 50  0001 C CNN
F 1 "GND" H 5222 4313 50  0000 R CNN
F 2 "" H 5300 4350 50  0001 C CNN
F 3 "" H 5300 4350 50  0001 C CNN
	1    5300 4350
	1    0    0    -1  
$EndComp
Connection ~ 5300 4350
$Comp
L power:GND #PWR?
U 1 1 608A75B5
P 7600 4350
F 0 "#PWR?" H 7600 4100 50  0001 C CNN
F 1 "GND" H 7522 4313 50  0000 R CNN
F 2 "" H 7600 4350 50  0001 C CNN
F 3 "" H 7600 4350 50  0001 C CNN
	1    7600 4350
	1    0    0    -1  
$EndComp
Connection ~ 7600 4350
Wire Wire Line
	5350 3500 5150 3500
Wire Wire Line
	5350 3600 5150 3600
Wire Wire Line
	5350 3700 5150 3700
Wire Wire Line
	5350 3800 5150 3800
Text Label 5150 3500 0    50   ~ 0
~IRQS
Text Label 5150 3600 0    50   ~ 0
UOP0
Text Label 5150 3700 0    50   ~ 0
UOP1
Text Label 5150 3800 0    50   ~ 0
UOP2
Wire Wire Line
	5000 2100 5350 2100
Wire Wire Line
	5000 2200 5350 2200
Wire Wire Line
	5000 2300 5350 2300
Wire Wire Line
	5000 2400 5350 2400
Wire Wire Line
	5000 2500 5350 2500
Wire Wire Line
	5000 2600 5350 2600
Wire Wire Line
	5000 2700 5350 2700
Wire Wire Line
	5000 2800 5350 2800
Wire Wire Line
	5000 2900 5350 2900
Wire Wire Line
	5000 3000 5350 3000
Wire Wire Line
	5000 3100 5350 3100
Wire Wire Line
	5000 3200 5350 3200
Wire Wire Line
	5000 3300 5350 3300
Wire Wire Line
	5000 3400 5350 3400
Wire Wire Line
	7300 2100 7650 2100
Wire Wire Line
	7300 2200 7650 2200
Wire Wire Line
	7300 2300 7650 2300
Wire Wire Line
	7300 2400 7650 2400
Wire Wire Line
	7300 2500 7650 2500
Wire Wire Line
	7300 2600 7650 2600
Wire Wire Line
	7300 2700 7650 2700
Wire Wire Line
	7300 2800 7650 2800
Wire Wire Line
	7300 2900 7650 2900
Wire Wire Line
	7300 3000 7650 3000
Wire Wire Line
	7300 3100 7650 3100
Wire Wire Line
	7300 3200 7650 3200
Wire Wire Line
	7450 3300 7650 3300
Text Label 5150 2100 0    50   ~ 0
A2
Text Label 5150 2200 0    50   ~ 0
A3
Text Label 5150 2300 0    50   ~ 0
A4
Text Label 5150 2400 0    50   ~ 0
A5
Text Label 5150 2500 0    50   ~ 0
A6
Text Label 5150 2600 0    50   ~ 0
A7
Text Label 5150 2700 0    50   ~ 0
A8
Text Label 5150 2800 0    50   ~ 0
A9
Text Label 5150 2900 0    50   ~ 0
A10
Text Label 5150 3000 0    50   ~ 0
A11
Text Label 5150 3100 0    50   ~ 0
A12
Text Label 5150 3200 0    50   ~ 0
A13
Text Label 5150 3300 0    50   ~ 0
A14
Text Label 5150 3400 0    50   ~ 0
A15
Text Label 7450 2100 0    50   ~ 0
A0
Text Label 7450 2200 0    50   ~ 0
A1
Text Label 7450 2300 0    50   ~ 0
A2
Text Label 7450 2400 0    50   ~ 0
A3
Text Label 7450 2500 0    50   ~ 0
A8
Text Label 7450 2600 0    50   ~ 0
A9
Text Label 7450 2700 0    50   ~ 0
A10
Text Label 7450 2800 0    50   ~ 0
A11
Text Label 7450 2900 0    50   ~ 0
A12
Text Label 7450 3000 0    50   ~ 0
A13
Text Label 7450 3100 0    50   ~ 0
A14
Text Label 7450 3200 0    50   ~ 0
A15
Text Label 7450 3300 0    50   ~ 0
FL
Wire Wire Line
	7650 3400 7450 3400
Text Label 7450 3400 0    50   ~ 0
~IRQS
Wire Wire Line
	7650 3800 7600 3800
Wire Wire Line
	7600 3800 7600 3900
Connection ~ 7600 3900
Wire Wire Line
	4300 2100 4650 2100
Wire Wire Line
	4300 2200 4650 2200
Wire Wire Line
	4300 2300 4650 2300
Wire Wire Line
	4300 2400 4650 2400
Wire Wire Line
	4300 2500 4650 2500
Wire Wire Line
	4300 2600 4650 2600
Wire Wire Line
	6600 2100 6950 2100
Wire Wire Line
	6600 2200 6950 2200
Wire Wire Line
	6600 2300 6950 2300
Wire Wire Line
	6600 2400 6950 2400
Wire Wire Line
	6600 2500 6950 2500
Wire Wire Line
	6600 2600 6950 2600
Wire Wire Line
	8900 2100 9250 2100
Wire Wire Line
	8900 2200 9250 2200
Wire Wire Line
	8900 2300 9250 2300
Wire Wire Line
	8900 2400 9250 2400
Wire Wire Line
	3750 4550 6050 4550
Connection ~ 3750 4550
Wire Wire Line
	6050 4550 8350 4550
Connection ~ 6050 4550
Text Label 4300 2100 0    50   ~ 0
IBUS0
Text Label 4300 2200 0    50   ~ 0
IBUS1
Text Label 4300 2300 0    50   ~ 0
IBUS2
Text Label 4300 2400 0    50   ~ 0
IBUS3
Text Label 4300 2500 0    50   ~ 0
IBUS4
Text Label 4300 2600 0    50   ~ 0
IBUS5
NoConn ~ 4300 2700
NoConn ~ 4300 2800
Text Label 6600 2100 0    50   ~ 0
IBUS6
Text Label 6600 2200 0    50   ~ 0
IBUS7
Text Label 6600 2300 0    50   ~ 0
IBUS8
Text Label 6600 2400 0    50   ~ 0
IBUS9
Text Label 6600 2500 0    50   ~ 0
IBUS10
Text Label 6600 2600 0    50   ~ 0
IBUS11
NoConn ~ 6600 2700
NoConn ~ 6600 2800
Text Label 8900 2100 0    50   ~ 0
IBUS12
Text Label 8900 2200 0    50   ~ 0
IBUS13
Text Label 8900 2300 0    50   ~ 0
IBUS14
Text Label 8900 2400 0    50   ~ 0
IBUS15
Text Label 8900 2500 0    50   ~ 0
ROLL16
Text Label 8900 2600 0    50   ~ 0
ISROLL
NoConn ~ 8900 2700
NoConn ~ 8900 2800
Wire Wire Line
	3900 4300 3900 4350
Wire Wire Line
	3750 4300 3750 4550
$Comp
L power:+5V #PWR?
U 1 1 608A762D
P 4050 4350
F 0 "#PWR?" H 4050 4200 50  0001 C CNN
F 1 "+5V" H 4065 4523 50  0000 C CNN
F 2 "" H 4050 4350 50  0001 C CNN
F 3 "" H 4050 4350 50  0001 C CNN
	1    4050 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4350 4050 4350
$Comp
L alexios:29F040 U?
U 1 1 608A7634
P 3700 2950
AR Path="/5DEAC282/608A7634" Ref="U?"  Part="1" 
AR Path="/608A7634" Ref="U?"  Part="1" 
AR Path="/608889E2/608A7634" Ref="U?"  Part="1" 
F 0 "U?" H 3675 4067 50  0000 C CNN
F 1 "29F040" H 3675 3976 50  0000 C CNN
F 2 "" H 3700 2950 50  0001 C CNN
F 3 "" H 3700 2950 50  0001 C CNN
	1    3700 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 608A763A
P 6350 4350
F 0 "#PWR?" H 6350 4200 50  0001 C CNN
F 1 "+5V" H 6365 4523 50  0000 C CNN
F 2 "" H 6350 4350 50  0001 C CNN
F 3 "" H 6350 4350 50  0001 C CNN
	1    6350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4350 6350 4350
$Comp
L power:+5V #PWR?
U 1 1 608A7641
P 8650 4350
F 0 "#PWR?" H 8650 4200 50  0001 C CNN
F 1 "+5V" H 8665 4523 50  0000 C CNN
F 2 "" H 8650 4350 50  0001 C CNN
F 3 "" H 8650 4350 50  0001 C CNN
	1    8650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4350 8650 4350
Wire Wire Line
	8500 4300 8500 4350
Wire Wire Line
	6200 4300 6200 4350
Entry Wire Line
	2600 2000 2700 2100
Entry Wire Line
	2600 2100 2700 2200
Entry Wire Line
	2600 2200 2700 2300
Entry Wire Line
	2600 2300 2700 2400
Entry Wire Line
	2600 2400 2700 2500
Entry Wire Line
	2600 2500 2700 2600
Entry Wire Line
	2600 2600 2700 2700
Entry Wire Line
	2600 2700 2700 2800
Entry Wire Line
	2600 2800 2700 2900
Entry Wire Line
	2600 2900 2700 3000
Entry Wire Line
	2600 3000 2700 3100
Entry Wire Line
	2600 3100 2700 3200
Entry Wire Line
	2600 3200 2700 3300
Entry Wire Line
	4900 2000 5000 2100
Entry Wire Line
	4900 2100 5000 2200
Entry Wire Line
	4900 2200 5000 2300
Entry Wire Line
	4900 2300 5000 2400
Entry Wire Line
	4900 2400 5000 2500
Entry Wire Line
	4900 2500 5000 2600
Entry Wire Line
	4900 2600 5000 2700
Entry Wire Line
	4900 2700 5000 2800
Entry Wire Line
	4900 2800 5000 2900
Entry Wire Line
	4900 2900 5000 3000
Entry Wire Line
	4900 3000 5000 3100
Entry Wire Line
	4900 3100 5000 3200
Entry Wire Line
	4900 3200 5000 3300
Entry Wire Line
	4900 3300 5000 3400
Entry Wire Line
	7200 2000 7300 2100
Entry Wire Line
	7200 2100 7300 2200
Entry Wire Line
	7200 2200 7300 2300
Entry Wire Line
	7200 2300 7300 2400
Entry Wire Line
	7200 2400 7300 2500
Entry Wire Line
	7200 2500 7300 2600
Entry Wire Line
	7200 2600 7300 2700
Entry Wire Line
	7200 2700 7300 2800
Entry Wire Line
	7200 2800 7300 2900
Entry Wire Line
	7200 2900 7300 3000
Entry Wire Line
	7200 3000 7300 3100
Entry Wire Line
	7200 3100 7300 3200
Entry Wire Line
	4650 2600 4750 2700
Entry Wire Line
	4650 2500 4750 2600
Entry Wire Line
	4650 2400 4750 2500
Entry Wire Line
	4650 2300 4750 2400
Entry Wire Line
	4650 2200 4750 2300
Entry Wire Line
	4650 2100 4750 2200
Wire Wire Line
	8900 2500 9800 2500
Wire Wire Line
	8900 2600 9800 2600
Text HLabel 9800 2500 2    50   Output ~ 0
ROLL16
Text HLabel 9800 2600 2    50   Output ~ 0
ISROLL
Entry Wire Line
	9350 2000 9250 2100
Entry Wire Line
	9350 2100 9250 2200
Entry Wire Line
	9350 2200 9250 2300
Entry Wire Line
	9350 2300 9250 2400
Entry Wire Line
	6950 2600 7050 2700
Entry Wire Line
	6950 2500 7050 2600
Entry Wire Line
	6950 2400 7050 2500
Entry Wire Line
	6950 2300 7050 2400
Entry Wire Line
	6950 2200 7050 2300
Entry Wire Line
	6950 2100 7050 2200
Entry Bus Bus
	7100 1650 7200 1750
Entry Bus Bus
	4800 1650 4900 1750
Entry Bus Bus
	2500 1650 2600 1750
Entry Bus Bus
	4750 4650 4850 4750
Entry Bus Bus
	7050 4650 7150 4750
Entry Bus Bus
	9350 4650 9450 4750
Text HLabel 9800 4750 2    50   3State ~ 0
IBUS[0..15]
Text HLabel 2200 1650 0    50   Input ~ 0
A[0..15]
Text Label 2600 1650 0    50   ~ 0
A[0..15]
Text Label 2600 3150 1    50   ~ 0
A[0..15]
Text Label 4900 3200 1    50   ~ 0
A[0..15]
Text Label 7200 3050 1    50   ~ 0
A[0..15]
Text Label 7050 3900 1    50   ~ 0
IBUS[0..15]
Text Label 4750 3900 1    50   ~ 0
IBUS[0..15]
Text Label 5750 4750 0    50   ~ 0
IBUS[0..15]
Text Label 8050 4750 0    50   ~ 0
IBUS[0..15]
Text Label 9350 3950 1    50   ~ 0
IBUS[0..15]
Wire Wire Line
	2200 3400 3050 3400
Text HLabel 2200 3400 0    50   Input ~ 0
FL
Wire Wire Line
	2200 3500 3050 3500
Text HLabel 2200 3500 0    50   Input ~ 0
~IRQS
Entry Wire Line
	2700 3600 2600 3700
Entry Wire Line
	2700 3700 2600 3800
Entry Wire Line
	2700 3800 2600 3900
Wire Wire Line
	7650 3500 7450 3500
Wire Wire Line
	7650 3600 7450 3600
Wire Wire Line
	7650 3700 7450 3700
Text Label 7450 3500 0    50   ~ 0
UOP0
Text Label 7450 3600 0    50   ~ 0
UOP1
Text Label 7450 3700 0    50   ~ 0
UOP2
Entry Bus Bus
	2500 4350 2600 4250
Wire Bus Line
	2500 4350 2250 4350
Text HLabel 2250 4350 0    50   Input ~ 0
UOP[0..2]
Text Label 2600 4150 1    50   ~ 0
UOP[0..2]
Text Notes 7150 6950 0    197  ~ 39
ALU Unary Ops
Wire Bus Line
	2200 1650 7100 1650
Wire Bus Line
	4850 4750 9800 4750
Wire Bus Line
	2600 3700 2600 4250
Wire Bus Line
	9350 2000 9350 4650
Wire Bus Line
	4750 2200 4750 4650
Wire Bus Line
	7050 2200 7050 4650
Wire Bus Line
	2600 1750 2600 3200
Wire Bus Line
	4900 1750 4900 3300
Wire Bus Line
	7200 1750 7200 3100
$EndSCHEMATC
