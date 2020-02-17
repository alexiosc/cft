EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 11
Title "Addressing Modes"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "agl.v, ail.v"
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5F3ED3E1
P 950 7300
AR Path="/5CC0D65F/5F3ED3E1" Ref="C?"  Part="1" 
AR Path="/5F3ED3E1" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F3ED3E1" Ref="C15"  Part="1" 
F 0 "C15" H 859 7346 50  0000 R CNN
F 1 "100nF" H 859 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7300 50  0001 C CNN
F 3 "~" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F3ED3E7
P 950 7200
AR Path="/5F3ED3E7" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F3ED3E7" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 950 7050 50  0001 C CNN
F 1 "+5V" H 965 7373 50  0000 C CNN
F 2 "" H 950 7200 50  0001 C CNN
F 3 "" H 950 7200 50  0001 C CNN
	1    950  7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3ED3EE
P 950 7400
AR Path="/5F3ED3EE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F3ED3EE" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 950 7150 50  0001 C CNN
F 1 "GND" H 955 7227 50  0000 C CNN
F 2 "" H 950 7400 50  0001 C CNN
F 3 "" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U18
U 2 1 5F3FEF6F
P 2650 7300
F 0 "U18" H 2830 7346 50  0000 L CNN
F 1 "74HC541" H 2830 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2650 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 2650 7300 50  0001 C CNN
	2    2650 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U19
U 2 1 5F40011F
P 4000 7300
F 0 "U19" H 4180 7346 50  0000 L CNN
F 1 "74HC541" H 4180 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4000 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4000 7300 50  0001 C CNN
	2    4000 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U20
U 2 1 5F4009C5
P 1300 7300
F 0 "U20" H 1480 7346 50  0000 L CNN
F 1 "74HC574" H 1480 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1000 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1000 7250 50  0001 C CNN
	2    1300 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4036ED
P 2300 7300
AR Path="/5CC0D65F/5F4036ED" Ref="C?"  Part="1" 
AR Path="/5F4036ED" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F4036ED" Ref="C16"  Part="1" 
F 0 "C16" H 2209 7346 50  0000 R CNN
F 1 "100nF" H 2209 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 7300 50  0001 C CNN
F 3 "~" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F4036F3
P 2300 7200
AR Path="/5F4036F3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F4036F3" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 2300 7050 50  0001 C CNN
F 1 "+5V" H 2315 7373 50  0000 C CNN
F 2 "" H 2300 7200 50  0001 C CNN
F 3 "" H 2300 7200 50  0001 C CNN
	1    2300 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F4036F9
P 2300 7400
AR Path="/5F4036F9" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F4036F9" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 2300 7150 50  0001 C CNN
F 1 "GND" H 2305 7227 50  0000 C CNN
F 2 "" H 2300 7400 50  0001 C CNN
F 3 "" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F403F53
P 3650 7300
AR Path="/5CC0D65F/5F403F53" Ref="C?"  Part="1" 
AR Path="/5F403F53" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F403F53" Ref="C17"  Part="1" 
F 0 "C17" H 3559 7346 50  0000 R CNN
F 1 "100nF" H 3559 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 7300 50  0001 C CNN
F 3 "~" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F403F59
P 3650 7200
AR Path="/5F403F59" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F403F59" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 3650 7050 50  0001 C CNN
F 1 "+5V" H 3665 7373 50  0000 C CNN
F 2 "" H 3650 7200 50  0001 C CNN
F 3 "" H 3650 7200 50  0001 C CNN
	1    3650 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F403F5F
P 3650 7400
AR Path="/5F403F5F" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F403F5F" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 3650 7150 50  0001 C CNN
F 1 "GND" H 3655 7227 50  0000 C CNN
F 2 "" H 3650 7400 50  0001 C CNN
F 3 "" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
Connection ~ 950  7400
Connection ~ 950  7200
Connection ~ 3650 7400
Connection ~ 3650 7200
Connection ~ 2300 7400
Connection ~ 2300 7200
Wire Wire Line
	4300 3300 4300 2700
Connection ~ 5600 3400
Wire Wire Line
	5600 1850 6050 1850
Wire Wire Line
	5600 3400 5600 1850
Wire Wire Line
	5600 3400 6050 3400
Wire Wire Line
	5600 4050 5600 3400
Entry Wire Line
	7450 3200 7550 3100
Entry Wire Line
	7450 3100 7550 3000
Entry Wire Line
	7450 3000 7550 2900
Entry Wire Line
	7450 2900 7550 2800
Entry Wire Line
	7450 2800 7550 2700
Entry Wire Line
	7450 2700 7550 2600
Entry Wire Line
	7450 2600 7550 2500
Entry Wire Line
	7450 2500 7550 2400
Entry Bus Bus
	7550 2150 7650 2050
Entry Bus Bus
	7550 1950 7650 2050
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
	5450 1750 5550 1650
Entry Wire Line
	5450 1650 5550 1550
Entry Wire Line
	5450 1550 5550 1450
Entry Wire Line
	5450 1450 5550 1350
Entry Wire Line
	5450 1350 5550 1250
Entry Wire Line
	5450 1250 5550 1150
Entry Wire Line
	5450 1150 5550 1050
Entry Wire Line
	5450 1050 5550 950 
Entry Bus Bus
	5350 2050 5450 1950
Entry Bus Bus
	5350 2050 5450 2150
Text HLabel 1200 3400 0    50   Input ~ 0
~END
Text Label 1350 3400 0    50   ~ 0
~END
Wire Wire Line
	1200 3400 3100 3400
Text HLabel 1200 2400 0    50   Input ~ 0
PC[10..15]
Text Label 1350 2400 0    50   ~ 0
PC[10..15]
Text HLabel 1200 2050 0    50   Input ~ 0
IR[0..11]
Text HLabel 8950 2050 2    50   3State ~ 0
IBUS[0..15]
Text Label 7800 2050 0    50   ~ 0
IBUS[0..15]
Text Label 3700 2050 0    50   ~ 0
IR[0..11]
Text Label 5650 3200 0    50   ~ 0
PAGE5
Text Label 5650 3100 0    50   ~ 0
PAGE4
Text Label 5650 3000 0    50   ~ 0
PAGE3
Text Label 5650 2900 0    50   ~ 0
PAGE2
Text Label 5650 2800 0    50   ~ 0
PAGE1
Text Label 5650 2700 0    50   ~ 0
PAGE0
Text Label 5650 2600 0    50   ~ 0
IR9
Text Label 5650 2500 0    50   ~ 0
IR8
Text Label 5650 1650 0    50   ~ 0
IR7
Text Label 5650 1550 0    50   ~ 0
IR6
Text Label 5650 1450 0    50   ~ 0
IR5
Text Label 5650 1350 0    50   ~ 0
IR4
Text Label 5650 1250 0    50   ~ 0
IR3
Text Label 5650 1150 0    50   ~ 0
IR2
Text Label 5650 1050 0    50   ~ 0
IR1
Text Label 5650 950  0    50   ~ 0
IR0
Entry Wire Line
	5450 2500 5550 2600
Entry Wire Line
	5450 2400 5550 2500
Wire Wire Line
	6050 2600 5550 2600
Wire Wire Line
	6050 2500 5550 2500
Wire Wire Line
	6050 1650 5550 1650
Wire Wire Line
	6050 1550 5550 1550
Wire Wire Line
	6050 1450 5550 1450
Wire Wire Line
	6050 1350 5550 1350
Wire Wire Line
	6050 1250 5550 1250
Wire Wire Line
	6050 1150 5550 1150
Wire Wire Line
	6050 1050 5550 1050
Wire Wire Line
	6050 950  5550 950 
Entry Wire Line
	7450 1650 7550 1750
Entry Wire Line
	7450 1550 7550 1650
Entry Wire Line
	7450 1450 7550 1550
Entry Wire Line
	7450 1350 7550 1450
Entry Wire Line
	7450 1250 7550 1350
Entry Wire Line
	7450 1150 7550 1250
Entry Wire Line
	7450 1050 7550 1150
Entry Wire Line
	7450 950  7550 1050
Text Label 7400 3200 2    50   ~ 0
IBUS15
Text Label 7400 3100 2    50   ~ 0
IBUS14
Text Label 7400 3000 2    50   ~ 0
IBUS13
Text Label 7400 2900 2    50   ~ 0
IBUS12
Text Label 7400 2800 2    50   ~ 0
IBUS11
Text Label 7400 2700 2    50   ~ 0
IBUS10
Text Label 7400 2600 2    50   ~ 0
IBUS9
Text Label 7400 2500 2    50   ~ 0
IBUS8
Text Label 7400 1650 2    50   ~ 0
IBUS7
Text Label 7400 1550 2    50   ~ 0
IBUS6
Text Label 7400 1450 2    50   ~ 0
IBUS5
Text Label 7400 1350 2    50   ~ 0
IBUS4
Text Label 7400 1250 2    50   ~ 0
IBUS3
Text Label 7400 1150 2    50   ~ 0
IBUS2
Text Label 7400 1050 2    50   ~ 0
IBUS1
Text Label 7400 950  2    50   ~ 0
IBUS0
$Comp
L alexios:74HC541 U18
U 1 1 5CD29724
P 6550 1450
F 0 "U18" H 6550 2217 50  0000 C CNN
F 1 "74HC541" H 6550 2126 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6550 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6550 1450 50  0001 C CNN
	1    6550 1450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U19
U 1 1 5CD2971E
P 6550 3000
F 0 "U19" H 6550 3767 50  0000 C CNN
F 1 "74HC541" H 6550 3676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6550 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6550 3000 50  0001 C CNN
	1    6550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3200 7450 3200
Wire Wire Line
	7050 3100 7450 3100
Wire Wire Line
	7050 3000 7450 3000
Wire Wire Line
	7050 2900 7450 2900
Wire Wire Line
	7050 2800 7450 2800
Wire Wire Line
	7050 2700 7450 2700
Wire Wire Line
	7050 2600 7450 2600
Wire Wire Line
	7050 2500 7450 2500
Wire Wire Line
	7050 1650 7450 1650
Wire Wire Line
	7050 1550 7450 1550
Wire Wire Line
	7050 1450 7450 1450
Wire Wire Line
	7050 1350 7450 1350
Wire Wire Line
	7050 1250 7450 1250
Wire Wire Line
	7050 1150 7450 1150
Wire Wire Line
	7050 1050 7450 1050
Wire Wire Line
	7050 950  7450 950 
Text Label 5650 3400 0    50   ~ 0
~READ-AGL
Wire Wire Line
	6000 3500 6000 3550
Wire Wire Line
	6050 3500 6000 3500
$Comp
L power:GND #PWR042
U 1 1 5CD29700
P 6000 3550
F 0 "#PWR042" H 6000 3300 50  0001 C CNN
F 1 "GND" H 6005 3377 50  0000 C CNN
F 2 "" H 6000 3550 50  0001 C CNN
F 3 "" H 6000 3550 50  0001 C CNN
	1    6000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1950 6000 2000
Wire Wire Line
	6050 1950 6000 1950
$Comp
L power:GND #PWR040
U 1 1 5CD296F8
P 6000 2000
F 0 "#PWR040" H 6000 1750 50  0001 C CNN
F 1 "GND" H 6005 1827 50  0000 C CNN
F 2 "" H 6000 2000 50  0001 C CNN
F 3 "" H 6000 2000 50  0001 C CNN
	1    6000 2000
	1    0    0    -1  
$EndComp
Text Label 2900 3400 0    50   ~ 0
~END
Text Label 2750 3500 0    50   ~ 0
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
Text Label 5650 1850 0    50   ~ 0
~READ-AGL
Text Notes 800  1800 0    50   ~ 0
Ths AGL generates a memory address from an instruction's operand field (IR[0..9]) plus a six-bit page, to\nform a 16-bit address which is put on the IBUS for access by other units. With R=0 (the R field is in IR10),\nthe page is taken from this instruction's address (PC at the start of the fetch state, i.e. the raising edge of\n~END~). With R=1, the flip-flop's outputs are at high impedance and the pull-down resistors force the page\nto 000000.\n\nNote: the AGL only forms 16-bit addresses. The MBU extends them to 24 bits using the 8-bit value of the\nMemory Bank Register selected by the Control Unit.
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
Text Notes 4300 4850 2    100  ~ 20
Auto-Index Address Decoding
Wire Notes Line width 20 style solid
	1800 4950 4800 4950
Wire Notes Line width 20 style solid
	4800 4950 4800 5750
Wire Notes Line style solid
	1800 5100 4800 5100
Wire Notes Line width 20 style solid
	1800 5750 4800 5750
Wire Notes Line width 20 style solid
	1800 4950 1800 5750
Wire Notes Line
	3050 4950 3050 5750
Text Notes 1950 6150 0    50   ~ 0
When I and R are set, operands 300–33F generate addresses\nrelative to the bank register MBn, where n is taken from IR₂–IR₀.\nThis is implemented by the Address Generation Logic (AGL),\nnot here.
Text Notes 1900 5900 2    50   ~ 0
*
Text Notes 3300 5700 0    50   ~ 0
Meaning\n\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers *\nAuto-increment Registers *\nAuto-decrement Registers *\nStack Pointers *
Text Notes 2400 5700 0    50   ~ 0
Binary Pattern\n\n1 1 00xxxxxxxx\n1 1 01xxxxxxxx\n1 1 10xxxxxxxx\n1 1 1100xxxxxx\n1 1 1101xxxxxx\n1 1 1110xxxxxx\n1 1 1111xxxxxx
Text Notes 1850 5700 0    50   ~ 0
IR Value\n\nI R 000–0FF\nI R 100–1FF\nI R 200–2FF\nI R 300–33F\nI R 340–37F\nI R 380–3BF\nI R 3C0–3FF
Text Notes 3100 5700 0    50   ~ 0
IDX\n\n00\n00\n00\n00\n01\n10\n11
$Comp
L power:+5V #PWR?
U 1 1 60D21D04
P 6000 7200
AR Path="/60D21D04" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D04" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D04" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D04" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 6000 7050 50  0001 C CNN
F 1 "+5V" H 6015 7373 50  0000 C CNN
F 2 "" H 6000 7200 50  0001 C CNN
F 3 "" H 6000 7200 50  0001 C CNN
	1    6000 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60D21D0A
P 10200 6400
AR Path="/5CC0D65F/60D21D0A" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/60D21D0A" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60D21D0A" Ref="C19"  Part="1" 
F 0 "C19" H 10109 6446 50  0000 R CNN
F 1 "100nF" H 10109 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10200 6400 50  0001 C CNN
F 3 "~" H 10200 6400 50  0001 C CNN
	1    10200 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60D21D10
P 6000 7300
AR Path="/5CC0D65F/60D21D10" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/60D21D10" Ref="C?"  Part="1" 
AR Path="/5F3EA987/60D21D10" Ref="C18"  Part="1" 
F 0 "C18" H 5909 7346 50  0000 R CNN
F 1 "100nF" H 5909 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6000 7300 50  0001 C CNN
F 3 "~" H 6000 7300 50  0001 C CNN
	1    6000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60D21D16
P 10200 6300
AR Path="/60D21D16" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D16" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D16" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D16" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 10200 6150 50  0001 C CNN
F 1 "+5V" H 10215 6473 50  0000 C CNN
F 2 "" H 10200 6300 50  0001 C CNN
F 3 "" H 10200 6300 50  0001 C CNN
	1    10200 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D21D1C
P 6000 7400
AR Path="/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D1C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D1C" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 6000 7150 50  0001 C CNN
F 1 "GND" H 6005 7227 50  0000 C CNN
F 2 "" H 6000 7400 50  0001 C CNN
F 3 "" H 6000 7400 50  0001 C CNN
	1    6000 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60D21D22
P 10200 6500
AR Path="/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/60D21D22" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D21D22" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 10200 6250 50  0001 C CNN
F 1 "GND" H 10205 6327 50  0000 C CNN
F 2 "" H 10200 6500 50  0001 C CNN
F 3 "" H 10200 6500 50  0001 C CNN
	1    10200 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 5 1 60D21D28
P 10400 5850
AR Path="/5CD3AC27/60D21D28" Ref="U?"  Part="5" 
AR Path="/5F3EA987/60D21D28" Ref="U24"  Part="5" 
F 0 "U24" H 10730 5346 50  0000 L CNN
F 1 "74HC08" H 10730 5255 50  0000 L CNN
F 2 "alexios:SOIC-14" H 10600 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10600 5400 50  0001 C CNN
	5    10400 5850
	1    0    0    -1  
$EndComp
Connection ~ 10200 6300
Connection ~ 10200 6500
$Comp
L alexios:74HC238 U?
U 2 1 60D21D31
P 6350 7300
AR Path="/5CD3AC27/60D21D31" Ref="U?"  Part="2" 
AR Path="/5F3EA987/60D21D31" Ref="U25"  Part="2" 
F 0 "U25" H 6529 7346 50  0000 L CNN
F 1 "74HC238" H 6529 7255 50  0000 L CNN
F 2 "alexios:SOIC-16" H 6350 7300 50  0001 C CNN
F 3 "" H 6350 7300 50  0001 C CNN
F 4 "Yes" H 6275 6475 50  0001 C CNN "Verified"
	2    6350 7300
	1    0    0    -1  
$EndComp
Connection ~ 6000 7200
Connection ~ 6000 7400
Text Notes 800  1000 0    98   ~ 20
Page Zero Address Generation Logic (AGL)
Text Notes 5900 4200 0    98   ~ 20
Auto-Indexing Logic (AIL)
Text Notes 8000 5300 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
Text Label 1350 4050 0    50   ~ 0
~READ-AGL
Wire Bus Line
	7650 2050 8950 2050
Text Notes 2950 3500 0    50   ~ 0
(R)
$Comp
L Device:R_Small R9
U 1 1 61212E27
P 4300 3400
F 0 "R9" H 4275 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4000 3400 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 3400 50  0001 C CNN
F 3 "~" H 4300 3400 50  0001 C CNN
	1    4300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3500 4300 3650
$Comp
L Device:R_Small R10
U 1 1 61228AC4
P 4500 3400
F 0 "R10" H 4475 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4250 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4500 3400 50  0001 C CNN
F 3 "~" H 4500 3400 50  0001 C CNN
	1    4500 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R11
U 1 1 61228EC4
P 4700 3400
F 0 "R11" H 4675 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4450 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 3400 50  0001 C CNN
F 3 "~" H 4700 3400 50  0001 C CNN
	1    4700 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R12
U 1 1 6122919F
P 4900 3400
F 0 "R12" H 4875 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4650 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 3400 50  0001 C CNN
F 3 "~" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R23
U 1 1 61229459
P 5100 3400
F 0 "R23" H 5075 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4850 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 3400 50  0001 C CNN
F 3 "~" H 5100 3400 50  0001 C CNN
	1    5100 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R51
U 1 1 61229788
P 5300 3400
F 0 "R51" H 5275 3250 50  0000 R CNN
F 1 "4.7kΩ" H 5050 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 3400 50  0001 C CNN
F 3 "~" H 5300 3400 50  0001 C CNN
	1    5300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3300 4500 2800
Wire Wire Line
	4700 3300 4700 2900
Wire Wire Line
	4900 3300 4900 3000
Wire Wire Line
	5100 3300 5100 3100
Wire Wire Line
	5300 3300 5300 3200
Connection ~ 4300 2700
Wire Wire Line
	4300 2700 6050 2700
Connection ~ 4500 2800
Wire Wire Line
	4500 2800 6050 2800
Connection ~ 4700 2900
Wire Wire Line
	4700 2900 6050 2900
Connection ~ 4900 3000
Wire Wire Line
	4900 3000 6050 3000
Connection ~ 5100 3100
Wire Wire Line
	5100 3100 6050 3100
Connection ~ 5300 3200
Wire Wire Line
	5300 3200 6050 3200
Wire Wire Line
	4100 2700 4300 2700
Wire Wire Line
	4100 2900 4700 2900
Wire Wire Line
	4100 3100 5100 3100
Wire Wire Line
	4100 3200 5300 3200
Wire Wire Line
	4100 2800 4500 2800
Wire Wire Line
	4100 3000 4900 3000
$Comp
L power:GND #PWR043
U 1 1 5CD297A3
P 4300 3650
F 0 "#PWR043" H 4300 3400 50  0001 C CNN
F 1 "GND" H 4305 3477 50  0000 C CNN
F 2 "" H 4300 3650 50  0001 C CNN
F 3 "" H 4300 3650 50  0001 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3650 5100 3650
Wire Wire Line
	5300 3500 5300 3650
Connection ~ 4300 3650
Wire Wire Line
	4500 3500 4500 3650
Connection ~ 4500 3650
Wire Wire Line
	4500 3650 4300 3650
Wire Wire Line
	4700 3500 4700 3650
Connection ~ 4700 3650
Wire Wire Line
	4700 3650 4500 3650
Wire Wire Line
	4900 3500 4900 3650
Connection ~ 4900 3650
Wire Wire Line
	4900 3650 4700 3650
Wire Wire Line
	5100 3500 5100 3650
Connection ~ 5100 3650
Wire Wire Line
	5100 3650 4900 3650
Text Notes 7900 2750 0    63   ~ 13
Note: Pull Down Resistors on PAGE
Text Notes 7900 3050 0    50   ~ 0
PAGE changes at the rising edge of ~END~, the end of an instruction. This\nis the fist cycle of the 500ns instruction fetch, where the AGL is never\nused. This gives PAGE ample time to settle.
Wire Notes Line width 24 style solid
	7800 2550 7800 3150
Wire Notes Line width 24 style solid
	7800 2550 10850 2550
Wire Notes Line width 24 style solid
	10850 3150 10850 2550
Wire Notes Line width 24 style solid
	10850 3150 7800 3150
Text Notes 5900 4600 0    50   ~ 0
The Auto-Index Unit decodes the instruction operand and indicates to the Control Unit which (if any) auto-index\naddressing mode should be used. IDX is usually 00 (no indexing), unless the instruction has fields I and R set,\nand the operand is in the range &300–&3FF, i.e. IR8 and IR9 are set. In that case, the vector IR[6..7] sets\nIDX[0..1].
Text HLabel 8950 6300 2    50   Output ~ 0
IDX1
Text HLabel 8950 5850 2    50   Output ~ 0
IDX0
Text Notes 5800 5850 0    50   ~ 0
(R)
Text Notes 5850 6250 0    50   ~ 0
(I)
Entry Wire Line
	5450 6150 5550 6250
Entry Wire Line
	5450 5750 5550 5850
Entry Wire Line
	5450 5650 5550 5750
Entry Wire Line
	5450 5550 5550 5650
Entry Wire Line
	5450 5100 5550 5200
Entry Wire Line
	5450 5000 5550 5100
$Comp
L alexios:74HC08 U?
U 1 1 60D17A6C
P 7950 5450
AR Path="/5CD3AC27/60D17A6C" Ref="U?"  Part="1" 
AR Path="/5F3EA987/60D17A6C" Ref="U24"  Part="1" 
F 0 "U24" H 8075 5325 50  0000 C CNN
F 1 "74HC08" H 8075 5234 50  0000 C CNN
F 2 "alexios:SOIC-14" H 8150 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8150 5000 50  0001 C CNN
	1    7950 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5850 8950 5850
Text Label 8900 5850 2    50   ~ 0
IDX0
Wire Wire Line
	7450 5800 7850 5800
Text Label 7750 5800 2    50   ~ 0
IR6
Wire Wire Line
	7450 5100 7450 5800
Wire Wire Line
	5550 5100 7450 5100
Wire Wire Line
	7450 5900 7850 5900
Wire Wire Line
	7450 6350 7450 5900
Wire Wire Line
	5550 5200 7350 5200
Text Label 5600 5200 0    50   ~ 0
IR7
Wire Wire Line
	7350 5200 7350 6250
Text Label 8900 6300 2    50   ~ 0
IDX1
Wire Wire Line
	8300 6300 8950 6300
Wire Wire Line
	6000 5650 5550 5650
Wire Wire Line
	6000 5750 5550 5750
Wire Wire Line
	6000 5850 5550 5850
Wire Wire Line
	6000 6250 5550 6250
Text Label 5600 5650 0    50   ~ 0
IR8
Text Label 5600 5750 0    50   ~ 0
IR9
Text Label 5600 5850 0    50   ~ 0
IR10
Text Label 5650 6250 0    50   ~ 0
IR11
$Comp
L alexios:74HC08 U?
U 2 1 60D17A4C
P 7950 5900
AR Path="/5CD3AC27/60D17A4C" Ref="U?"  Part="2" 
AR Path="/5F3EA987/60D17A4C" Ref="U24"  Part="2" 
F 0 "U24" H 8075 5775 50  0000 C CNN
F 1 "74HC08" H 8075 5684 50  0000 C CNN
F 2 "alexios:SOIC-14" H 8150 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8150 5450 50  0001 C CNN
	2    7950 5900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC238 U?
U 1 1 60D17A46
P 6500 6050
AR Path="/5CD3AC27/60D17A46" Ref="U?"  Part="1" 
AR Path="/5F3EA987/60D17A46" Ref="U25"  Part="1" 
F 0 "U25" H 6500 6717 50  0000 C CNN
F 1 "74HC238" H 6500 6626 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6500 6050 50  0001 C CNN
F 3 "" H 6500 6050 50  0001 C CNN
F 4 "Yes" H 6425 5225 50  0001 C CNN "Verified"
	1    6500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6350 5950 6350
Wire Wire Line
	5950 6350 5950 6450
$Comp
L power:GND #PWR?
U 1 1 60D17A3D
P 5950 6500
AR Path="/5CD3AC27/60D17A3D" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/60D17A3D" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 5950 6250 50  0001 C CNN
F 1 "GND" H 5955 6327 50  0000 C CNN
F 2 "" H 5950 6500 50  0001 C CNN
F 3 "" H 5950 6500 50  0001 C CNN
	1    5950 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6450 5950 6450
Connection ~ 5950 6450
Wire Wire Line
	5950 6450 5950 6500
Wire Wire Line
	7000 6350 7450 6350
NoConn ~ 7000 5650
NoConn ~ 7000 5750
NoConn ~ 7000 5850
NoConn ~ 7000 5950
NoConn ~ 7000 6050
NoConn ~ 7000 6150
NoConn ~ 7000 6250
Wire Wire Line
	7850 6350 7450 6350
Wire Wire Line
	7350 6250 7850 6250
Text Label 5600 5100 0    50   ~ 0
IR6
Text Label 7750 6250 2    50   ~ 0
IR7
Connection ~ 7450 6350
Text Notes 7050 6450 0    50   ~ 0
IR[11..8] = 1111
Text Notes 8000 4950 0    63   ~ 13
Note: IDX Registration
Wire Notes Line width 24 style solid
	7900 4700 7900 5400
Wire Notes Line width 24 style solid
	7900 4700 10700 4700
Wire Notes Line width 24 style solid
	10700 5400 10700 4700
Wire Notes Line width 24 style solid
	10700 5400 7900 5400
Text Label 7050 6350 0    50   ~ 0
~IDXEN
Text Notes 7900 1000 0    63   ~ 13
Addressing Modes are only partly implemented here
Text Notes 7900 1600 0    50   ~ 0
Addressing modes are implemented here, the Control Unit, and Memory\nBank Unit. The AGL and AIL decodes the instruction field and operand\ninto inputs to the Control Unit and a 16-bit address. The Control Unit\ninterprets them to implement Direct, Indirect and Auto-Indexed modes.\nIt also tells the MBU which memory bank register to use to extend the\naddress to 24 bits.
Wire Notes Line width 24 style solid
	7800 800  7800 1700
Wire Notes Line width 24 style solid
	7800 800  10850 800 
Wire Notes Line width 24 style solid
	10850 1700 10850 800 
Wire Notes Line width 24 style solid
	10850 1700 7800 1700
$Comp
L alexios:74HC08 U?
U 3 1 5EE44F45
P 9950 5400
AR Path="/5CD3AC27/5EE44F45" Ref="U?"  Part="1" 
AR Path="/5F3EA987/5EE44F45" Ref="U24"  Part="3" 
F 0 "U24" H 10075 5275 50  0000 C CNN
F 1 "74HC08" H 10075 5184 50  0000 C CNN
F 2 "alexios:SOIC-14" H 10150 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10150 4950 50  0001 C CNN
	3    9950 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC08 U?
U 4 1 5EE45013
P 10600 5400
AR Path="/5CD3AC27/5EE45013" Ref="U?"  Part="1" 
AR Path="/5F3EA987/5EE45013" Ref="U24"  Part="4" 
F 0 "U24" H 10725 5275 50  0000 C CNN
F 1 "74HC08" H 10725 5184 50  0000 C CNN
F 2 "alexios:SOIC-14" H 10800 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10800 4950 50  0001 C CNN
	4    10600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5750 9800 5750
Wire Wire Line
	9800 5750 9800 5850
$Comp
L power:GND #PWR0183
U 1 1 5EE49357
P 9800 5900
F 0 "#PWR0183" H 9800 5650 50  0001 C CNN
F 1 "GND" H 9805 5727 50  0000 C CNN
F 2 "" H 9800 5900 50  0001 C CNN
F 3 "" H 9800 5900 50  0001 C CNN
	1    9800 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5850 9800 5850
Connection ~ 9800 5850
Wire Wire Line
	9800 5850 9800 5900
Wire Wire Line
	10500 5750 10450 5750
Wire Wire Line
	10450 5750 10450 5850
$Comp
L power:GND #PWR0186
U 1 1 5EE4ED6F
P 10450 5900
F 0 "#PWR0186" H 10450 5650 50  0001 C CNN
F 1 "GND" H 10455 5727 50  0000 C CNN
F 2 "" H 10450 5900 50  0001 C CNN
F 3 "" H 10450 5900 50  0001 C CNN
	1    10450 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5850 10450 5850
Connection ~ 10450 5850
Wire Wire Line
	10450 5850 10450 5900
NoConn ~ 10300 5800
NoConn ~ 10950 5800
Wire Wire Line
	1200 4050 5600 4050
Text HLabel 1200 4050 0    50   Input ~ 0
~READ-AGL
Text Notes 1400 4150 0    50   ~ 0
This is decoded by the flag unit.
Wire Bus Line
	1200 2050 5350 2050
Wire Bus Line
	2750 2500 2750 3100
Wire Bus Line
	5450 2150 5450 6150
Wire Bus Line
	7550 1050 7550 1950
Wire Bus Line
	5450 1050 5450 1950
Wire Bus Line
	7550 2150 7550 3100
$EndSCHEMATC
