EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 12
Title "Page 0 & Indexed Addressing"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "agl.v"
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5F3ED3E1
P 1500 7150
AR Path="/5CC0D65F/5F3ED3E1" Ref="C?"  Part="1" 
AR Path="/5F3ED3E1" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F3ED3E1" Ref="C15"  Part="1" 
F 0 "C15" H 1409 7196 50  0000 R CNN
F 1 "100nF" H 1409 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1500 7150 50  0001 C CNN
F 3 "~" H 1500 7150 50  0001 C CNN
	1    1500 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F3ED3E7
P 1500 7050
AR Path="/5F3ED3E7" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F3ED3E7" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 1500 6900 50  0001 C CNN
F 1 "+5V" H 1515 7223 50  0000 C CNN
F 2 "" H 1500 7050 50  0001 C CNN
F 3 "" H 1500 7050 50  0001 C CNN
	1    1500 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3ED3EE
P 1500 7250
AR Path="/5F3ED3EE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F3ED3EE" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 1500 7000 50  0001 C CNN
F 1 "GND" H 1505 7077 50  0000 C CNN
F 2 "" H 1500 7250 50  0001 C CNN
F 3 "" H 1500 7250 50  0001 C CNN
	1    1500 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U18
U 2 1 5F3FEF6F
P 3200 7150
F 0 "U18" H 3380 7196 50  0000 L CNN
F 1 "74HC541" H 3380 7105 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3200 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 3200 7150 50  0001 C CNN
	2    3200 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U19
U 2 1 5F40011F
P 4550 7150
F 0 "U19" H 4730 7196 50  0000 L CNN
F 1 "74HC541" H 4730 7105 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4550 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4550 7150 50  0001 C CNN
	2    4550 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U20
U 2 1 5F4009C5
P 1850 7150
F 0 "U20" H 2030 7196 50  0000 L CNN
F 1 "74HC574" H 2030 7105 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1550 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1550 7100 50  0001 C CNN
	2    1850 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4036ED
P 2850 7150
AR Path="/5CC0D65F/5F4036ED" Ref="C?"  Part="1" 
AR Path="/5F4036ED" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F4036ED" Ref="C16"  Part="1" 
F 0 "C16" H 2759 7196 50  0000 R CNN
F 1 "100nF" H 2759 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2850 7150 50  0001 C CNN
F 3 "~" H 2850 7150 50  0001 C CNN
	1    2850 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F4036F3
P 2850 7050
AR Path="/5F4036F3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F4036F3" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 2850 6900 50  0001 C CNN
F 1 "+5V" H 2865 7223 50  0000 C CNN
F 2 "" H 2850 7050 50  0001 C CNN
F 3 "" H 2850 7050 50  0001 C CNN
	1    2850 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F4036F9
P 2850 7250
AR Path="/5F4036F9" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F4036F9" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 2850 7000 50  0001 C CNN
F 1 "GND" H 2855 7077 50  0000 C CNN
F 2 "" H 2850 7250 50  0001 C CNN
F 3 "" H 2850 7250 50  0001 C CNN
	1    2850 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F403F53
P 4200 7150
AR Path="/5CC0D65F/5F403F53" Ref="C?"  Part="1" 
AR Path="/5F403F53" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F403F53" Ref="C17"  Part="1" 
F 0 "C17" H 4109 7196 50  0000 R CNN
F 1 "100nF" H 4109 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 7150 50  0001 C CNN
F 3 "~" H 4200 7150 50  0001 C CNN
	1    4200 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F403F59
P 4200 7050
AR Path="/5F403F59" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F403F59" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 4200 6900 50  0001 C CNN
F 1 "+5V" H 4215 7223 50  0000 C CNN
F 2 "" H 4200 7050 50  0001 C CNN
F 3 "" H 4200 7050 50  0001 C CNN
	1    4200 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F403F5F
P 4200 7250
AR Path="/5F403F5F" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F403F5F" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 4200 7000 50  0001 C CNN
F 1 "GND" H 4205 7077 50  0000 C CNN
F 2 "" H 4200 7250 50  0001 C CNN
F 3 "" H 4200 7250 50  0001 C CNN
	1    4200 7250
	1    0    0    -1  
$EndComp
Connection ~ 1500 7250
Connection ~ 1500 7050
Connection ~ 4200 7250
Connection ~ 4200 7050
Connection ~ 2850 7250
Connection ~ 2850 7050
Wire Wire Line
	4900 3200 5600 3200
Connection ~ 4900 3200
Wire Wire Line
	4900 3300 4900 3200
$Comp
L Device:R_Network06 RN1
U 1 1 5CD297BA
P 4700 3500
F 0 "RN1" H 4321 3454 50  0000 R CNN
F 1 "10kΩ" H 4321 3545 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP7" V 5075 3500 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4700 3500 50  0001 C CNN
	1    4700 3500
	1    0    0    1   
$EndComp
Wire Wire Line
	4800 3100 4800 3300
Wire Wire Line
	4800 3100 5600 3100
Connection ~ 4800 3100
Wire Wire Line
	4700 3000 5600 3000
Connection ~ 4700 3000
Wire Wire Line
	4100 3000 4700 3000
Wire Wire Line
	4700 3300 4700 3000
Wire Wire Line
	4600 2900 5600 2900
Connection ~ 4600 2900
Wire Wire Line
	4100 2900 4600 2900
Wire Wire Line
	4600 3300 4600 2900
Wire Wire Line
	4500 2800 5600 2800
Connection ~ 4500 2800
Wire Wire Line
	4500 3300 4500 2800
Wire Wire Line
	4400 2700 5600 2700
Connection ~ 4400 2700
Wire Wire Line
	4400 3300 4400 2700
$Comp
L power:GND #PWR043
U 1 1 5CD297A3
P 4400 3700
F 0 "#PWR043" H 4400 3450 50  0001 C CNN
F 1 "GND" H 4405 3527 50  0000 C CNN
F 2 "" H 4400 3700 50  0001 C CNN
F 3 "" H 4400 3700 50  0001 C CNN
	1    4400 3700
	1    0    0    -1  
$EndComp
Text Label 1350 4050 0    50   ~ 0
~READ-AGL
Connection ~ 5150 3400
Wire Wire Line
	5150 1850 5600 1850
Wire Wire Line
	5150 3400 5150 1850
Wire Wire Line
	5150 3400 5600 3400
Wire Wire Line
	5150 4050 5150 3400
Wire Wire Line
	1200 4050 5150 4050
Entry Wire Line
	7000 3200 7100 3100
Entry Wire Line
	7000 3100 7100 3000
Entry Wire Line
	7000 3000 7100 2900
Entry Wire Line
	7000 2900 7100 2800
Entry Wire Line
	7000 2800 7100 2700
Entry Wire Line
	7000 2700 7100 2600
Entry Wire Line
	7000 2600 7100 2500
Entry Wire Line
	7000 2500 7100 2400
Entry Bus Bus
	7100 2150 7200 2050
Entry Bus Bus
	7100 1950 7200 2050
Text Label 2450 3100 3    50   ~ 0
IR10
Text Label 2450 2150 3    50   ~ 0
IR10
Entry Wire Line
	2350 2050 2450 2150
Wire Wire Line
	2450 3500 3100 3500
Wire Wire Line
	3100 2700 2850 2700
Wire Wire Line
	3100 2800 2850 2800
Wire Wire Line
	3100 2900 2850 2900
Wire Wire Line
	3100 3000 2850 3000
Wire Wire Line
	3100 3100 2850 3100
Wire Wire Line
	3100 3200 2850 3200
Text Label 2900 2700 0    50   ~ 0
PC10
Text Label 2900 2800 0    50   ~ 0
PC11
Text Label 2900 2900 0    50   ~ 0
PC12
Text Label 2900 3000 0    50   ~ 0
PC13
Text Label 2900 3100 0    50   ~ 0
PC14
Text Label 2900 3200 0    50   ~ 0
PC15
Entry Wire Line
	2750 2600 2850 2700
Entry Wire Line
	2750 2700 2850 2800
Entry Wire Line
	2750 2800 2850 2900
Entry Wire Line
	2750 2900 2850 3000
Entry Wire Line
	2750 3000 2850 3100
Entry Wire Line
	2750 3100 2850 3200
Entry Bus Bus
	2650 2400 2750 2500
Wire Bus Line
	2650 2400 1200 2400
Entry Wire Line
	5000 1750 5100 1650
Entry Wire Line
	5000 1650 5100 1550
Entry Wire Line
	5000 1550 5100 1450
Entry Wire Line
	5000 1450 5100 1350
Entry Wire Line
	5000 1350 5100 1250
Entry Wire Line
	5000 1250 5100 1150
Entry Wire Line
	5000 1150 5100 1050
Entry Wire Line
	5000 1050 5100 950 
Entry Bus Bus
	4900 2050 5000 1950
Entry Bus Bus
	4900 2050 5000 2150
Text HLabel 1200 3400 0    50   Input ~ 0
~END
Text Label 1750 3400 0    50   ~ 0
~END
Wire Wire Line
	1200 3400 3100 3400
Text HLabel 1200 2400 0    50   Input ~ 0
PC[10..15]
Text Label 1750 2400 0    50   ~ 0
PC[10..15]
Text HLabel 1200 2050 0    50   Input ~ 0
IR[0..11]
Text HLabel 9650 2050 2    50   3State ~ 0
IBUS[0..15]
Text Label 7350 2050 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7200 2050 9650 2050
Text Label 3700 2050 0    50   ~ 0
IR[0..10]
Text Label 5200 3200 0    50   ~ 0
PAGE5
Text Label 5200 3100 0    50   ~ 0
PAGE4
Text Label 5200 3000 0    50   ~ 0
PAGE3
Text Label 5200 2900 0    50   ~ 0
PAGE2
Text Label 5200 2800 0    50   ~ 0
PAGE1
Text Label 5200 2700 0    50   ~ 0
PAGE0
Text Label 5200 2600 0    50   ~ 0
IR9
Text Label 5200 2500 0    50   ~ 0
IR8
Text Label 5200 1650 0    50   ~ 0
IR7
Text Label 5200 1550 0    50   ~ 0
IR6
Text Label 5200 1450 0    50   ~ 0
IR5
Text Label 5200 1350 0    50   ~ 0
IR4
Text Label 5200 1250 0    50   ~ 0
IR3
Text Label 5200 1150 0    50   ~ 0
IR2
Text Label 5200 1050 0    50   ~ 0
IR1
Text Label 5200 950  0    50   ~ 0
IR0
Entry Wire Line
	5000 2500 5100 2600
Entry Wire Line
	5000 2400 5100 2500
Wire Wire Line
	5600 2600 5100 2600
Wire Wire Line
	5600 2500 5100 2500
Wire Wire Line
	5600 1650 5100 1650
Wire Wire Line
	5600 1550 5100 1550
Wire Wire Line
	5600 1450 5100 1450
Wire Wire Line
	5600 1350 5100 1350
Wire Wire Line
	5600 1250 5100 1250
Wire Wire Line
	5600 1150 5100 1150
Wire Wire Line
	5600 1050 5100 1050
Wire Wire Line
	5600 950  5100 950 
Entry Wire Line
	7000 1650 7100 1750
Entry Wire Line
	7000 1550 7100 1650
Entry Wire Line
	7000 1450 7100 1550
Entry Wire Line
	7000 1350 7100 1450
Entry Wire Line
	7000 1250 7100 1350
Entry Wire Line
	7000 1150 7100 1250
Entry Wire Line
	7000 1050 7100 1150
Entry Wire Line
	7000 950  7100 1050
Text Label 6950 3200 2    50   ~ 0
IBUS15
Text Label 6950 3100 2    50   ~ 0
IBUS14
Text Label 6950 3000 2    50   ~ 0
IBUS13
Text Label 6950 2900 2    50   ~ 0
IBUS12
Text Label 6950 2800 2    50   ~ 0
IBUS11
Text Label 6950 2700 2    50   ~ 0
IBUS10
Text Label 6950 2600 2    50   ~ 0
IBUS9
Text Label 6950 2500 2    50   ~ 0
IBUS8
Text Label 6950 1650 2    50   ~ 0
IBUS7
Text Label 6950 1550 2    50   ~ 0
IBUS6
Text Label 6950 1450 2    50   ~ 0
IBUS5
Text Label 6950 1350 2    50   ~ 0
IBUS4
Text Label 6950 1250 2    50   ~ 0
IBUS3
Text Label 6950 1150 2    50   ~ 0
IBUS2
Text Label 6950 1050 2    50   ~ 0
IBUS1
Text Label 6950 950  2    50   ~ 0
IBUS0
$Comp
L alexios:74HC541 U18
U 1 1 5CD29724
P 6100 1450
F 0 "U18" H 6100 2217 50  0000 C CNN
F 1 "74HC541" H 6100 2126 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6100 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6100 1450 50  0001 C CNN
	1    6100 1450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U19
U 1 1 5CD2971E
P 6100 3000
F 0 "U19" H 6100 3767 50  0000 C CNN
F 1 "74HC541" H 6100 3676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6100 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6100 3000 50  0001 C CNN
	1    6100 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3200 7000 3200
Wire Wire Line
	6600 3100 7000 3100
Wire Wire Line
	6600 3000 7000 3000
Wire Wire Line
	6600 2900 7000 2900
Wire Wire Line
	6600 2800 7000 2800
Wire Wire Line
	6600 2700 7000 2700
Wire Wire Line
	6600 2600 7000 2600
Wire Wire Line
	6600 2500 7000 2500
Wire Wire Line
	6600 1650 7000 1650
Wire Wire Line
	6600 1550 7000 1550
Wire Wire Line
	6600 1450 7000 1450
Wire Wire Line
	6600 1350 7000 1350
Wire Wire Line
	6600 1250 7000 1250
Wire Wire Line
	6600 1150 7000 1150
Wire Wire Line
	6600 1050 7000 1050
Wire Wire Line
	6600 950  7000 950 
Wire Wire Line
	4100 3200 4900 3200
Wire Wire Line
	4100 3100 4800 3100
Wire Wire Line
	4100 2800 4500 2800
Wire Wire Line
	4100 2700 4400 2700
Text Label 5200 3400 0    50   ~ 0
~READ-AGL
Wire Wire Line
	5550 3500 5550 3550
Wire Wire Line
	5600 3500 5550 3500
$Comp
L power:GND #PWR042
U 1 1 5CD29700
P 5550 3550
F 0 "#PWR042" H 5550 3300 50  0001 C CNN
F 1 "GND" H 5555 3377 50  0000 C CNN
F 2 "" H 5550 3550 50  0001 C CNN
F 3 "" H 5550 3550 50  0001 C CNN
	1    5550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1950 5550 2000
Wire Wire Line
	5600 1950 5550 1950
$Comp
L power:GND #PWR040
U 1 1 5CD296F8
P 5550 2000
F 0 "#PWR040" H 5550 1750 50  0001 C CNN
F 1 "GND" H 5555 1827 50  0000 C CNN
F 2 "" H 5550 2000 50  0001 C CNN
F 3 "" H 5550 2000 50  0001 C CNN
	1    5550 2000
	1    0    0    -1  
$EndComp
Text Label 2900 3400 0    50   ~ 0
~END
Text Label 2850 3500 0    50   ~ 0
IR10
Text Label 1350 2050 0    50   ~ 0
IR[0..11]
$Comp
L alexios:74HC574 U20
U 1 1 5CD296E9
P 3600 3000
F 0 "U20" H 3600 3767 50  0000 C CNN
F 1 "74HC574" H 3600 3676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 3300 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3300 2950 50  0001 C CNN
	1    3600 3000
	1    0    0    -1  
$EndComp
Text HLabel 1200 4050 0    50   Input ~ 0
~READ_AGL
Text Label 5200 1850 0    50   ~ 0
~READ-AGL
Text Notes 4050 1650 2    50   ~ 0
Selects between Page 0 and Local addressing modes.
NoConn ~ 4100 2500
NoConn ~ 4100 2600
$Comp
L power:+5V #PWR0137
U 1 1 5E58812D
P 3050 2450
F 0 "#PWR0137" H 3050 2300 50  0001 C CNN
F 1 "+5V" H 3065 2623 50  0000 C CNN
F 2 "" H 3050 2450 50  0001 C CNN
F 3 "" H 3050 2450 50  0001 C CNN
	1    3050 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2450 3050 2500
Wire Wire Line
	3050 2600 3100 2600
Wire Wire Line
	3100 2500 3050 2500
Connection ~ 3050 2500
Wire Wire Line
	3050 2500 3050 2600
Wire Wire Line
	2450 3500 2450 2150
Text Notes 3850 4650 2    100  ~ 20
Auto-Index Address Decoding
Wire Notes Line width 20 style solid
	1350 4750 4350 4750
Wire Notes Line width 20 style solid
	4350 4750 4350 5550
Wire Notes Line style solid
	1350 4900 4350 4900
Wire Notes Line width 20 style solid
	1350 5550 4350 5550
Wire Notes Line width 20 style solid
	1350 4750 1350 5550
Wire Notes Line
	2600 4750 2600 5550
Text Notes 1500 5950 0    50   ~ 0
When I and R are set, operands 300–33F generate addresses\nrelative to the bank register MBn, where n is taken from IR₂–IR₀.\nThis is implemented by the Address Generation Logic (AGL),\nnot here.
Text Notes 1450 5700 2    50   ~ 0
*
Text Notes 2850 5500 0    50   ~ 0
Meaning\n\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers *\nAuto-increment Registers *\nAuto-decrement Registers *\nStack Pointers *
Text Notes 1950 5500 0    50   ~ 0
Binary Pattern\n\n1 1 00xxxxxxxx\n1 1 01xxxxxxxx\n1 1 10xxxxxxxx\n1 1 1100xxxxxx\n1 1 1101xxxxxx\n1 1 1110xxxxxx\n1 1 1111xxxxxx
Text Notes 1400 5500 0    50   ~ 0
IR Value\n\nI R 000–0FF\nI R 100–1FF\nI R 200–2FF\nI R 300–33F\nI R 340–37F\nI R 380–3BF\nI R 3C0–3FF
Text Notes 2650 5500 0    50   ~ 0
IDX\n\n00\n00\n00\n00\n01\n10\n11
Text Notes 6550 5750 0    50   ~ 0
IR[11..8] = 1111
Connection ~ 6850 5550
Text Label 7300 5450 2    50   ~ 0
IR7
Text Label 5150 4400 0    50   ~ 0
IR6
Wire Wire Line
	6750 5450 7400 5450
Wire Wire Line
	7400 5550 6850 5550
Wire Wire Line
	6850 5650 6850 5550
NoConn ~ 6550 5550
NoConn ~ 6550 5450
NoConn ~ 6550 5350
NoConn ~ 6550 5250
NoConn ~ 6550 5150
NoConn ~ 6550 5050
NoConn ~ 6550 4950
Wire Wire Line
	6550 5650 6850 5650
Wire Wire Line
	5450 5750 5450 5800
Connection ~ 5450 5750
Wire Wire Line
	5550 5750 5450 5750
$Comp
L power:GND #PWR?
U 1 1 60D17A3D
P 5450 5800
AR Path="/5CD3AC27/60D17A3D" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D17A3D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5450 5550 50  0001 C CNN
F 1 "GND" H 5455 5627 50  0000 C CNN
F 2 "" H 5450 5800 50  0001 C CNN
F 3 "" H 5450 5800 50  0001 C CNN
	1    5450 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5650 5450 5750
Wire Wire Line
	5550 5650 5450 5650
$Comp
L alexios:74HC238 U?
U 1 1 60D17A46
P 6050 5350
AR Path="/5CD3AC27/60D17A46" Ref="U?"  Part="1" 
AR Path="/5F3EA987/60D17A46" Ref="U?"  Part="1" 
F 0 "U?" H 6050 6017 50  0000 C CNN
F 1 "74HC238" H 6050 5926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6050 5350 50  0001 C CNN
F 3 "" H 6050 5350 50  0001 C CNN
F 4 "Yes" H 5975 4525 50  0001 C CNN "Verified"
	1    6050 5350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 2 1 60D17A4C
P 7500 5100
AR Path="/5CD3AC27/60D17A4C" Ref="U?"  Part="2" 
AR Path="/5F3EA987/60D17A4C" Ref="U?"  Part="2" 
F 0 "U?" H 7625 4975 50  0000 C CNN
F 1 "74HC08" H 7625 4884 50  0000 C CNN
F 2 "alexios:SOIC-14" H 7700 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7700 4650 50  0001 C CNN
	2    7500 5100
	1    0    0    -1  
$EndComp
Text Label 5150 5550 0    50   ~ 0
IR11
Text Label 5150 5150 0    50   ~ 0
IR10
Text Label 5150 5050 0    50   ~ 0
IR9
Text Label 5150 4950 0    50   ~ 0
IR8
Wire Wire Line
	5550 5550 5100 5550
Wire Wire Line
	5550 5150 5100 5150
Wire Wire Line
	5550 5050 5100 5050
Wire Wire Line
	5550 4950 5100 4950
Wire Wire Line
	7850 5500 8500 5500
Text Label 8450 5500 2    50   ~ 0
IDX1
Wire Wire Line
	6750 4500 6750 5450
Text Label 5150 4500 0    50   ~ 0
IR7
Wire Wire Line
	5100 4500 6750 4500
Wire Wire Line
	6850 5550 6850 5100
Wire Wire Line
	6850 5100 7400 5100
Wire Wire Line
	5100 4400 6850 4400
Wire Wire Line
	6850 4400 6850 5000
Text Label 7300 5000 2    50   ~ 0
IR6
Wire Wire Line
	6850 5000 7400 5000
Text Label 8450 5050 2    50   ~ 0
IDX0
Wire Wire Line
	7850 5050 8500 5050
$Comp
L alexios:74HC08 U?
U 1 1 60D17A6C
P 7500 4650
AR Path="/5CD3AC27/60D17A6C" Ref="U?"  Part="1" 
AR Path="/5F3EA987/60D17A6C" Ref="U?"  Part="1" 
F 0 "U?" H 7625 4525 50  0000 C CNN
F 1 "74HC08" H 7625 4434 50  0000 C CNN
F 2 "alexios:SOIC-14" H 7700 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7700 4200 50  0001 C CNN
	1    7500 4650
	1    0    0    -1  
$EndComp
Entry Wire Line
	8500 5500 8600 5600
Entry Wire Line
	8500 5050 8600 5150
Wire Bus Line
	8700 5850 9650 5850
Entry Bus Bus
	8600 5750 8700 5850
Text HLabel 9650 5850 2    50   Input ~ 0
IDX[0..1]
$Comp
L power:+5V #PWR?
U 1 1 60D21D04
P 9850 -2400
AR Path="/60D21D04" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D04" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D04" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D04" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9850 -2550 50  0001 C CNN
F 1 "+5V" H 9865 -2227 50  0000 C CNN
F 2 "" H 9850 -2400 50  0001 C CNN
F 3 "" H 9850 -2400 50  0001 C CNN
	1    9850 -2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60D21D0A
P 11150 -2300
AR Path="/5CC0D65F/60D21D0A" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/60D21D0A" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60D21D0A" Ref="C?"  Part="1" 
F 0 "C?" H 11059 -2254 50  0000 R CNN
F 1 "100nF" H 11059 -2345 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 11150 -2300 50  0001 C CNN
F 3 "~" H 11150 -2300 50  0001 C CNN
	1    11150 -2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60D21D10
P 9850 -2300
AR Path="/5CC0D65F/60D21D10" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/60D21D10" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60D21D10" Ref="C?"  Part="1" 
F 0 "C?" H 9759 -2254 50  0000 R CNN
F 1 "100nF" H 9759 -2345 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 -2300 50  0001 C CNN
F 3 "~" H 9850 -2300 50  0001 C CNN
	1    9850 -2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60D21D16
P 11150 -2400
AR Path="/60D21D16" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D16" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D16" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D16" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 11150 -2550 50  0001 C CNN
F 1 "+5V" H 11165 -2227 50  0000 C CNN
F 2 "" H 11150 -2400 50  0001 C CNN
F 3 "" H 11150 -2400 50  0001 C CNN
	1    11150 -2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D21D1C
P 9850 -2200
AR Path="/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D1C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9850 -2450 50  0001 C CNN
F 1 "GND" H 9855 -2373 50  0000 C CNN
F 2 "" H 9850 -2200 50  0001 C CNN
F 3 "" H 9850 -2200 50  0001 C CNN
	1    9850 -2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D21D22
P 11150 -2200
AR Path="/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D22" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 11150 -2450 50  0001 C CNN
F 1 "GND" H 11155 -2373 50  0000 C CNN
F 2 "" H 11150 -2200 50  0001 C CNN
F 3 "" H 11150 -2200 50  0001 C CNN
	1    11150 -2200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 5 1 60D21D28
P 11350 -2850
AR Path="/5CD3AC27/60D21D28" Ref="U?"  Part="5" 
AR Path="/5F3EA987/60D21D28" Ref="U?"  Part="5" 
F 0 "U?" H 11680 -3354 50  0000 L CNN
F 1 "74HC08" H 11680 -3445 50  0000 L CNN
F 2 "alexios:SOIC-14" H 11550 -3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 11550 -3300 50  0001 C CNN
	5    11350 -2850
	1    0    0    -1  
$EndComp
Connection ~ 11150 -2400
Connection ~ 11150 -2200
$Comp
L alexios:74HC238 U?
U 2 1 60D21D31
P 10200 -2300
AR Path="/5CD3AC27/60D21D31" Ref="U?"  Part="2" 
AR Path="/5F3EA987/60D21D31" Ref="U?"  Part="2" 
F 0 "U?" H 10379 -2254 50  0000 L CNN
F 1 "74HC238" H 10379 -2345 50  0000 L CNN
F 2 "alexios:SOIC-16" H 10200 -2300 50  0001 C CNN
F 3 "" H 10200 -2300 50  0001 C CNN
F 4 "Yes" H 10125 -3125 50  0001 C CNN "Verified"
	2    10200 -2300
	1    0    0    -1  
$EndComp
Connection ~ 9850 -2400
Connection ~ 9850 -2200
Entry Wire Line
	5000 4300 5100 4400
Entry Wire Line
	5000 4400 5100 4500
Entry Wire Line
	5000 4850 5100 4950
Entry Wire Line
	5000 4950 5100 5050
Entry Wire Line
	5000 5050 5100 5150
Entry Wire Line
	5000 5450 5100 5550
Text Notes 1450 1300 0    98   ~ 20
Page Zero Address Generation Logic (AGL)
Text Notes 5650 4250 0    98   ~ 20
Auto-Indexing Logic (AIL)
Wire Bus Line
	8600 5150 8600 5750
Wire Bus Line
	1200 2050 4900 2050
Wire Bus Line
	2750 2500 2750 3100
Wire Bus Line
	7100 1050 7100 1950
Wire Bus Line
	5000 2150 5000 5450
Wire Bus Line
	5000 1050 5000 1950
Wire Bus Line
	7100 2150 7100 3100
Text Notes 5350 5550 0    50   ~ 0
(I)
Text Notes 5350 5150 0    50   ~ 0
(R)
Text Notes 6050 6400 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
$EndSCHEMATC
