EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 35
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
L power:+5V #PWR?
U 1 1 5CD45D1C
P 1050 6950
AR Path="/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CD45D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD45D1C" Ref="#PWR02001"  Part="1" 
F 0 "#PWR02001" H 1050 6800 50  0001 C CNN
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
AR Path="/5CD3AC27/5CD45D3B" Ref="C2002"  Part="1" 
F 0 "C2002" H 2259 7096 50  0000 R CNN
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
AR Path="/5CD3AC27/5CD45D4D" Ref="C2001"  Part="1" 
F 0 "C2001" H 959 7096 50  0000 R CNN
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
AR Path="/5CD3AC27/5D0D3E5C" Ref="#PWR02003"  Part="1" 
F 0 "#PWR02003" H 2350 6800 50  0001 C CNN
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
AR Path="/5CD3AC27/5D0D46EB" Ref="#PWR02002"  Part="1" 
F 0 "#PWR02002" H 1050 6900 50  0001 C CNN
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
AR Path="/5CD3AC27/5D0D4ACB" Ref="#PWR02004"  Part="1" 
F 0 "#PWR02004" H 2350 6900 50  0001 C CNN
F 1 "GND" H 2355 6977 50  0000 C CNN
F 2 "" H 2350 7150 50  0001 C CNN
F 3 "" H 2350 7150 50  0001 C CNN
	1    2350 7150
	1    0    0    -1  
$EndComp
Text Notes 7150 6950 0    197  ~ 39
Auto-Index Logic (AIL)
$Comp
L alexios:74HC74 U2003
U 2 1 5E8C97A6
P 6450 4800
F 0 "U2003" H 6450 4475 50  0000 C CNN
F 1 "74HC74" H 6450 4384 50  0000 C CNN
F 2 "" H 6400 4800 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6400 4800 50  0001 C CNN
	2    6450 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02012
U 1 1 5E93E046
P 6000 3650
F 0 "#PWR02012" H 6000 3500 50  0001 C CNN
F 1 "+5V" H 6015 3823 50  0000 C CNN
F 2 "" H 6000 3650 50  0001 C CNN
F 3 "" H 6000 3650 50  0001 C CNN
	1    6000 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3150 3850 3150
Wire Wire Line
	3850 3150 3850 3250
Wire Wire Line
	3900 3250 3850 3250
Connection ~ 3850 3250
Wire Wire Line
	3850 3250 3850 3350
Wire Wire Line
	3900 3350 3850 3350
Wire Wire Line
	3850 3350 3850 3400
Connection ~ 3850 3350
$Comp
L power:GND #PWR02009
U 1 1 5E9C8812
P 3850 3400
F 0 "#PWR02009" H 3850 3150 50  0001 C CNN
F 1 "GND" H 3855 3227 50  0000 C CNN
F 2 "" H 3850 3400 50  0001 C CNN
F 3 "" H 3850 3400 50  0001 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
NoConn ~ 4900 3150
NoConn ~ 4900 3250
Wire Wire Line
	3900 2150 3450 2150
Wire Wire Line
	3900 2250 3450 2250
Wire Wire Line
	3900 2350 3450 2350
Wire Wire Line
	3900 2450 3450 2450
Text Label 3500 2150 0    50   ~ 0
IBUS8
Text Label 3500 2250 0    50   ~ 0
IBUS9
Text Label 3500 2350 0    50   ~ 0
IBUS10
Text Label 3500 2450 0    50   ~ 0
IBUS11
Wire Wire Line
	3900 2750 3850 2750
Wire Wire Line
	3850 2750 3850 3150
Connection ~ 3850 3150
Wire Wire Line
	3900 2650 3850 2650
Wire Wire Line
	3850 2650 3850 2750
Connection ~ 3850 2750
Wire Wire Line
	3900 2850 3750 2850
Wire Wire Line
	3900 2950 3750 2950
$Comp
L power:+5V #PWR02007
U 1 1 5E9ECCE2
P 3750 2850
F 0 "#PWR02007" H 3750 2700 50  0001 C CNN
F 1 "+5V" V 3765 2978 50  0000 L CNN
F 2 "" H 3750 2850 50  0001 C CNN
F 3 "" H 3750 2850 50  0001 C CNN
	1    3750 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR02008
U 1 1 5E9ECF49
P 3750 2950
F 0 "#PWR02008" H 3750 2800 50  0001 C CNN
F 1 "+5V" V 3765 3078 50  0000 L CNN
F 2 "" H 3750 2950 50  0001 C CNN
F 3 "" H 3750 2950 50  0001 C CNN
	1    3750 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 3350 5100 3350
Wire Wire Line
	5100 3350 5100 3800
Wire Wire Line
	5100 4800 5200 4800
Wire Wire Line
	5200 3800 5100 3800
Connection ~ 5100 3800
Wire Wire Line
	5100 3800 5100 4800
Wire Wire Line
	5200 3700 3450 3700
Text Label 3450 4700 0    50   ~ 0
IBUS7
Text Label 3500 3700 0    50   ~ 0
IBUS6
Wire Wire Line
	5650 3750 6000 3750
$Comp
L alexios:74HC74 U2003
U 1 1 5E8ED262
P 6450 3800
F 0 "U2003" H 6450 4217 50  0000 C CNN
F 1 "74HC74" H 6450 4126 50  0000 C CNN
F 2 "" H 6400 3800 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6400 3800 50  0001 C CNN
	1    6450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4700 3450 4700
Wire Wire Line
	5650 4750 6000 4750
$Comp
L power:+5V #PWR02013
U 1 1 5EA38ED7
P 6000 4650
F 0 "#PWR02013" H 6000 4500 50  0001 C CNN
F 1 "+5V" H 6015 4823 50  0000 C CNN
F 2 "" H 6000 4650 50  0001 C CNN
F 3 "" H 6000 4650 50  0001 C CNN
	1    6000 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3950 5750 3950
Text Label 3500 1550 0    50   ~ 0
~RESET
Wire Wire Line
	5750 3950 5750 4950
Wire Wire Line
	5750 4950 6000 4950
Connection ~ 5750 3950
Text HLabel 3100 4250 0    50   Input ~ 0
~WRITE-IR
Text Label 3450 4250 0    50   ~ 0
~WRITE-IR
Wire Wire Line
	5850 4250 5850 3850
Wire Wire Line
	5850 3850 6000 3850
Wire Wire Line
	5850 4250 5850 4850
Wire Wire Line
	5850 4850 6000 4850
Connection ~ 5850 4250
NoConn ~ 6900 3950
NoConn ~ 6900 4950
Text Label 7000 3650 0    50   ~ 0
IDX0
Text HLabel 8000 3200 2    50   Output ~ 0
IDX[0..1]
Entry Wire Line
	3350 2050 3450 2150
Entry Wire Line
	3350 2150 3450 2250
Entry Wire Line
	3350 2250 3450 2350
Entry Wire Line
	3350 2350 3450 2450
Entry Wire Line
	3350 3600 3450 3700
Entry Wire Line
	3350 4600 3450 4700
Wire Wire Line
	3100 4250 5850 4250
Entry Bus Bus
	3250 1750 3350 1850
Wire Bus Line
	3250 1750 3100 1750
Text HLabel 3100 1750 0    50   Input ~ 0
IBUS[7..11]
Wire Wire Line
	6900 3650 7250 3650
$Comp
L alexios:74HC08 U2002
U 1 1 5EAA464D
P 5300 3350
F 0 "U2002" H 5425 3225 50  0000 C CNN
F 1 "74HC08" H 5425 3134 50  0000 C CNN
F 2 "" H 5500 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5500 2900 50  0001 C CNN
	1    5300 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U2002
U 2 1 5EAA54C5
P 5300 4350
F 0 "U2002" H 5425 4225 50  0000 C CNN
F 1 "74HC08" H 5425 4134 50  0000 C CNN
F 2 "" H 5500 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5500 3900 50  0001 C CNN
	2    5300 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U2002
U 3 1 5EAA6C78
P 4700 6650
F 0 "U2002" H 4825 6525 50  0000 C CNN
F 1 "74HC08" H 4825 6434 50  0000 C CNN
F 2 "" H 4900 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4900 6200 50  0001 C CNN
	3    4700 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U2002
U 4 1 5EAA77B4
P 5600 6650
F 0 "U2002" H 5725 6075 50  0000 C CNN
F 1 "74HC08" H 5725 5984 50  0000 C CNN
F 2 "" H 5800 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5800 6200 50  0001 C CNN
	4    5600 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U2002
U 5 1 5EAA92F4
P 2550 6500
F 0 "U2002" H 2880 5996 50  0000 L CNN
F 1 "74HC08" H 2880 5905 50  0000 L CNN
F 2 "" H 2750 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2750 6050 50  0001 C CNN
	5    2550 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC85 U2001
U 2 1 5EAAA637
P 1400 7350
F 0 "U2001" H 1580 7696 50  0000 L CNN
F 1 "74HC85" H 1580 7605 50  0000 L CNN
F 2 "" H 1400 7375 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 1400 7375 50  0001 C CNN
	2    1400 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U2003
U 3 1 5EAAA8C5
P 4000 7050
F 0 "U2003" H 4000 7467 50  0000 C CNN
F 1 "74HC74" H 4000 7376 50  0000 C CNN
F 2 "" H 3950 7050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 3950 7050 50  0001 C CNN
	3    4000 7050
	1    0    0    -1  
$EndComp
Connection ~ 1050 6950
Connection ~ 1050 7150
$Comp
L Device:C_Small C?
U 1 1 5EABEA5A
P 3650 7050
AR Path="/5CC0D65F/5EABEA5A" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5EABEA5A" Ref="C2003"  Part="1" 
F 0 "C2003" H 3559 7096 50  0000 R CNN
F 1 "100nF" H 3559 7005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 7050 50  0001 C CNN
F 3 "~" H 3650 7050 50  0001 C CNN
	1    3650 7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EABEA60
P 3650 6950
AR Path="/5EABEA60" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5EABEA60" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5EABEA60" Ref="#PWR02005"  Part="1" 
F 0 "#PWR02005" H 3650 6800 50  0001 C CNN
F 1 "+5V" H 3665 7123 50  0000 C CNN
F 2 "" H 3650 6950 50  0001 C CNN
F 3 "" H 3650 6950 50  0001 C CNN
	1    3650 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EABEA66
P 3650 7150
AR Path="/5EABEA66" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5EABEA66" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5EABEA66" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5EABEA66" Ref="#PWR02006"  Part="1" 
F 0 "#PWR02006" H 3650 6900 50  0001 C CNN
F 1 "GND" H 3655 6977 50  0000 C CNN
F 2 "" H 3650 7150 50  0001 C CNN
F 3 "" H 3650 7150 50  0001 C CNN
	1    3650 7150
	1    0    0    -1  
$EndComp
Connection ~ 3650 6950
Connection ~ 3650 7150
Connection ~ 2350 6950
Connection ~ 2350 7150
$Comp
L power:+5V #PWR?
U 1 1 5EAD68BA
P 4550 6950
AR Path="/5EAD68BA" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5EAD68BA" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5EAD68BA" Ref="#PWR02010"  Part="1" 
F 0 "#PWR02010" H 4550 6800 50  0001 C CNN
F 1 "+5V" H 4565 7123 50  0000 C CNN
F 2 "" H 4550 6950 50  0001 C CNN
F 3 "" H 4550 6950 50  0001 C CNN
	1    4550 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6950 4550 7000
Wire Wire Line
	4550 7100 4600 7100
Wire Wire Line
	4600 7000 4550 7000
Connection ~ 4550 7000
Wire Wire Line
	4550 7000 4550 7100
$Comp
L power:+5V #PWR?
U 1 1 5EADE319
P 5450 6950
AR Path="/5EADE319" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5EADE319" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5EADE319" Ref="#PWR02011"  Part="1" 
F 0 "#PWR02011" H 5450 6800 50  0001 C CNN
F 1 "+5V" H 5465 7123 50  0000 C CNN
F 2 "" H 5450 6950 50  0001 C CNN
F 3 "" H 5450 6950 50  0001 C CNN
	1    5450 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 6950 5450 7000
Wire Wire Line
	5450 7100 5500 7100
Wire Wire Line
	5500 7000 5450 7000
Connection ~ 5450 7000
Wire Wire Line
	5450 7000 5450 7100
NoConn ~ 5050 7050
NoConn ~ 5950 7050
Entry Wire Line
	7250 4650 7350 4550
Entry Wire Line
	7250 3650 7350 3550
Text Label 7000 4650 0    50   ~ 0
IDX1
Wire Wire Line
	6900 4650 7250 4650
Entry Bus Bus
	7450 3200 7350 3300
Wire Bus Line
	7450 3200 8000 3200
Text Label 7350 3950 3    50   ~ 0
IDX[0..1]
Text Label 7550 3200 0    50   ~ 0
IDX[0..1]
Wire Wire Line
	5750 1550 3100 1550
Text HLabel 3100 1550 0    50   Input ~ 0
~RESET
Wire Wire Line
	5750 1550 5750 3950
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
$Comp
L alexios:74HC85 U2001
U 1 1 5EA0725C
P 4400 2550
F 0 "U2001" H 4400 3217 50  0000 C CNN
F 1 "74HC85" H 4400 3126 50  0000 C CNN
F 2 "" H 4400 2575 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS85" H 4400 2575 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
Text Notes 9000 1950 0    50   ~ 0
IDX\n\n00\n00\n00\n00\n01\n10\n11
Wire Bus Line
	7350 3300 7350 4550
Wire Bus Line
	3350 1850 3350 4600
$EndSCHEMATC
