EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 13
Title "Auto-Index Logic"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "ail.v"
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5CD45D1C
P 1050 6950
AR Path="/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD45D1C" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 1050 6800 50  0001 C CNN
F 1 "+5V" H 1065 7123 50  0000 C CNN
F 2 "" H 1050 6950 50  0001 C CNN
F 3 "" H 1050 6950 50  0001 C CNN
	1    1050 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD45D3B
P 2350 7050
AR Path="/5CC0D65F/5CD45D3B" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CD45D3B" Ref="C19"  Part="1" 
F 0 "C19" H 2259 7096 50  0000 R CNN
F 1 "100nF" H 2259 7005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 7050 50  0001 C CNN
F 3 "~" H 2350 7050 50  0001 C CNN
	1    2350 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CD45D4D
P 1050 7050
AR Path="/5CC0D65F/5CD45D4D" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CD45D4D" Ref="C18"  Part="1" 
F 0 "C18" H 959 7096 50  0000 R CNN
F 1 "100nF" H 959 7005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7050 50  0001 C CNN
F 3 "~" H 1050 7050 50  0001 C CNN
	1    1050 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D0D3E5C
P 2350 6950
AR Path="/5D0D3E5C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D3E5C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D3E5C" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 2350 6800 50  0001 C CNN
F 1 "+5V" H 2365 7123 50  0000 C CNN
F 2 "" H 2350 6950 50  0001 C CNN
F 3 "" H 2350 6950 50  0001 C CNN
	1    2350 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D0D46EB
P 1050 7150
AR Path="/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D46EB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D46EB" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 1050 6900 50  0001 C CNN
F 1 "GND" H 1055 6977 50  0000 C CNN
F 2 "" H 1050 7150 50  0001 C CNN
F 3 "" H 1050 7150 50  0001 C CNN
	1    1050 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D0D4ACB
P 2350 7150
AR Path="/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0D4ACB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0D4ACB" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 2350 6900 50  0001 C CNN
F 1 "GND" H 2355 6977 50  0000 C CNN
F 2 "" H 2350 7150 50  0001 C CNN
F 3 "" H 2350 7150 50  0001 C CNN
	1    2350 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U22
U 5 1 5EAA92F4
P 2550 6500
F 0 "U22" H 2880 5996 50  0000 L CNN
F 1 "74HC08" H 2880 5905 50  0000 L CNN
F 2 "alexios:SOIC-14" H 2750 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2750 6050 50  0001 C CNN
	5    2550 6500
	1    0    0    -1  
$EndComp
Connection ~ 2350 6950
Connection ~ 2350 7150
Text Notes 10200 1100 2    100  ~ 20
Auto-Index Address Decoding
Wire Notes Line width 20 style solid
	7700 1200 10700 1200
Wire Notes Line width 20 style solid
	10700 1200 10700 2000
Wire Notes Line style solid
	7700 1350 10700 1350
Wire Notes Line width 20 style solid
	7700 2000 10700 2000
Wire Notes Line width 20 style solid
	7700 1200 7700 2000
Wire Notes Line
	8950 1200 8950 2000
Text Notes 7850 2400 0    50   ~ 0
When I and R are set, operands 300–33F generate addresses\nrelative to the bank register MBn, where n is taken from IR₂–IR₀.\nThis is implemented by the Address Generation Logic (AGL),\nnot here.
Text Notes 7800 2150 2    50   ~ 0
*
Text Notes 9200 1950 0    50   ~ 0
Meaning\n\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers *\nAuto-increment Registers *\nAuto-decrement Registers *\nStack Pointers *
Text Notes 8300 1950 0    50   ~ 0
Binary Pattern\n\n1 1 00xxxxxxxx\n1 1 01xxxxxxxx\n1 1 10xxxxxxxx\n1 1 1100xxxxxx\n1 1 1101xxxxxx\n1 1 1110xxxxxx\n1 1 1111xxxxxx
Text Notes 7750 1950 0    50   ~ 0
IR Value\n\nI R 000–0FF\nI R 100–1FF\nI R 200–2FF\nI R 300–33F\nI R 340–37F\nI R 380–3BF\nI R 3C0–3FF
Text Notes 9000 1950 0    50   ~ 0
IDX\n\n00\n00\n00\n00\n01\n10\n11
$Comp
L alexios:74HC238 U23
U 2 1 5DD11854
P 1400 7050
F 0 "U23" H 1579 7096 50  0000 L CNN
F 1 "74HC238" H 1579 7005 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1400 7050 50  0001 C CNN
F 3 "" H 1400 7050 50  0001 C CNN
F 4 "Yes" H 1325 6225 50  0001 C CNN "Verified"
	2    1400 7050
	1    0    0    -1  
$EndComp
Connection ~ 1050 6950
Connection ~ 1050 7150
Text HLabel 3850 2650 0    50   Input ~ 0
IR[6..11]
Wire Bus Line
	4000 2650 3850 2650
Entry Bus Bus
	4000 2650 4100 2750
Text Notes 5650 4500 0    50   ~ 0
IR[11..8] = 1111
Connection ~ 5950 4300
Text Label 6400 4200 2    50   ~ 0
IR7
Text Label 4250 3150 0    50   ~ 0
IR6
Wire Wire Line
	5850 4200 6500 4200
Wire Wire Line
	6500 4300 5950 4300
Wire Wire Line
	5950 4400 5950 4300
Entry Wire Line
	4100 3050 4200 3150
NoConn ~ 5650 4300
NoConn ~ 5650 4200
NoConn ~ 5650 4100
NoConn ~ 5650 4000
NoConn ~ 5650 3900
NoConn ~ 5650 3800
NoConn ~ 5650 3700
Wire Wire Line
	5650 4400 5950 4400
Wire Wire Line
	4550 4500 4550 4550
Connection ~ 4550 4500
Wire Wire Line
	4650 4500 4550 4500
$Comp
L power:GND #PWR050
U 1 1 5DC82FC0
P 4550 4550
F 0 "#PWR050" H 4550 4300 50  0001 C CNN
F 1 "GND" H 4555 4377 50  0000 C CNN
F 2 "" H 4550 4550 50  0001 C CNN
F 3 "" H 4550 4550 50  0001 C CNN
	1    4550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4400 4550 4500
Wire Wire Line
	4650 4400 4550 4400
$Comp
L alexios:74HC238 U23
U 1 1 5DC7460B
P 5150 4100
F 0 "U23" H 5150 4767 50  0000 C CNN
F 1 "74HC238" H 5150 4676 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5150 4100 50  0001 C CNN
F 3 "" H 5150 4100 50  0001 C CNN
F 4 "Yes" H 5075 3275 50  0001 C CNN "Verified"
	1    5150 4100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U22
U 2 1 5EAA54C5
P 6600 3850
F 0 "U22" H 6725 3725 50  0000 C CNN
F 1 "74HC08" H 6725 3634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6800 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6800 3400 50  0001 C CNN
	2    6600 3850
	1    0    0    -1  
$EndComp
Entry Wire Line
	4100 4200 4200 4300
Entry Wire Line
	4100 3800 4200 3900
Entry Wire Line
	4100 3700 4200 3800
Entry Wire Line
	4100 3600 4200 3700
Text Label 4250 4300 0    50   ~ 0
IR11
Text Label 4250 3900 0    50   ~ 0
IR10
Text Label 4250 3800 0    50   ~ 0
IR9
Text Label 4250 3700 0    50   ~ 0
IR8
Wire Wire Line
	4650 4300 4200 4300
Wire Wire Line
	4650 3900 4200 3900
Wire Wire Line
	4650 3800 4200 3800
Wire Wire Line
	4650 3700 4200 3700
Wire Wire Line
	6950 4250 7600 4250
Text Label 7550 4250 2    50   ~ 0
IDX1
Wire Wire Line
	5850 3250 5850 4200
Text Label 4250 3250 0    50   ~ 0
IR7
Wire Wire Line
	4200 3250 5850 3250
Entry Wire Line
	4100 3150 4200 3250
Wire Wire Line
	5950 4300 5950 3850
Wire Wire Line
	5950 3850 6500 3850
Wire Wire Line
	4200 3150 5950 3150
Wire Wire Line
	5950 3150 5950 3750
Text Label 6400 3750 2    50   ~ 0
IR6
Wire Wire Line
	5950 3750 6500 3750
Text Label 7550 3800 2    50   ~ 0
IDX0
Wire Wire Line
	6950 3800 7600 3800
$Comp
L alexios:74HC08 U22
U 1 1 5EAA464D
P 6600 3400
F 0 "U22" H 6725 3275 50  0000 C CNN
F 1 "74HC08" H 6725 3184 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6800 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6800 2950 50  0001 C CNN
	1    6600 3400
	1    0    0    -1  
$EndComp
Wire Bus Line
	4100 2750 4100 4200
Wire Bus Line
	7700 3900 7700 4500
Entry Wire Line
	7600 4250 7700 4350
Entry Wire Line
	7600 3800 7700 3900
Wire Bus Line
	7800 4600 8550 4600
Entry Bus Bus
	7700 4500 7800 4600
Text HLabel 8550 4600 2    50   Input ~ 0
IDX[0..1]
$EndSCHEMATC
