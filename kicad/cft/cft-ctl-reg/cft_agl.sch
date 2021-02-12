EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 17
Title "Addressing Modes"
Date ""
Rev "2023"
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
AR Path="/5F3EA987/5F3ED3E1" Ref="C504"  Part="1" 
F 0 "C504" H 859 7346 50  0000 R CNN
F 1 "100nF" H 859 7255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7300 50  0001 C CNN
F 3 "~" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F3ED3E7
P 950 7200
AR Path="/5F3ED3E7" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F3ED3E7" Ref="#PWR0511"  Part="1" 
F 0 "#PWR0511" H 950 7050 50  0001 C CNN
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
AR Path="/5F3EA987/5F3ED3EE" Ref="#PWR0514"  Part="1" 
F 0 "#PWR0514" H 950 7150 50  0001 C CNN
F 1 "GND" H 955 7227 50  0000 C CNN
F 2 "" H 950 7400 50  0001 C CNN
F 3 "" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U501
U 2 1 5F3FEF6F
P 2650 7300
F 0 "U501" H 2830 7346 50  0000 L CNN
F 1 "74HC541" H 2830 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2650 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 2650 7300 50  0001 C CNN
	2    2650 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U503
U 2 1 5F40011F
P 4000 7300
F 0 "U503" H 4180 7346 50  0000 L CNN
F 1 "74HC541" H 4180 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4000 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4000 7300 50  0001 C CNN
	2    4000 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U502
U 2 1 5F4009C5
P 1300 7300
F 0 "U502" H 1480 7346 50  0000 L CNN
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
AR Path="/5F3EA987/5F4036ED" Ref="C505"  Part="1" 
F 0 "C505" H 2392 7346 50  0000 L CNN
F 1 "100nF" H 2392 7255 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7300 50  0001 C CNN
F 3 "~" H 2300 7300 50  0001 C CNN
	1    2300 7300
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F4036F3
P 2300 7200
AR Path="/5F4036F3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F4036F3" Ref="#PWR0512"  Part="1" 
F 0 "#PWR0512" H 2300 7050 50  0001 C CNN
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
AR Path="/5F3EA987/5F4036F9" Ref="#PWR0515"  Part="1" 
F 0 "#PWR0515" H 2300 7150 50  0001 C CNN
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
AR Path="/5F3EA987/5F403F53" Ref="C506"  Part="1" 
F 0 "C506" H 3559 7346 50  0000 R CNN
F 1 "100nF" H 3559 7255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7300 50  0001 C CNN
F 3 "~" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F403F59
P 3650 7200
AR Path="/5F403F59" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F403F59" Ref="#PWR0513"  Part="1" 
F 0 "#PWR0513" H 3650 7050 50  0001 C CNN
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
AR Path="/5F3EA987/5F403F5F" Ref="#PWR0516"  Part="1" 
F 0 "#PWR0516" H 3650 7150 50  0001 C CNN
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
L alexios:74HC541 U501
U 1 1 5CD29724
P 6550 1450
F 0 "U501" H 6550 2217 50  0000 C CNN
F 1 "74HC541" H 6550 2126 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6550 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6550 1450 50  0001 C CNN
	1    6550 1450
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
L power:GND #PWR0503
U 1 1 5CD29700
P 6000 3550
F 0 "#PWR0503" H 6000 3300 50  0001 C CNN
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
L power:GND #PWR0501
U 1 1 5CD296F8
P 6000 2000
F 0 "#PWR0501" H 6000 1750 50  0001 C CNN
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
L alexios:74HC574 U502
U 1 1 5CD296E9
P 3600 3000
F 0 "U502" H 3600 3767 50  0000 C CNN
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
L power:+5V #PWR0502
U 1 1 5E58812D
P 3050 2450
F 0 "#PWR0502" H 3050 2300 50  0001 C CNN
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
Text Notes 3350 4450 2    100  ~ 20
Auto-Index Address Decoding
Wire Notes Line width 20 style solid
	850  4550 3850 4550
Wire Notes Line width 20 style solid
	3850 4550 3850 5350
Wire Notes Line style solid
	850  4700 3850 4700
Wire Notes Line width 20 style solid
	850  5350 3850 5350
Wire Notes Line width 20 style solid
	850  4550 850  5350
Wire Notes Line
	2100 4550 2100 5350
Text Notes 1000 5750 0    50   ~ 0
When I and R are set, operands 300–33F generate addresses\nrelative to the bank register MBn, where n is taken from IR₂–IR₀.\nThis is implemented by the Address Generation Logic (AGL),\nnot here.
Text Notes 950  5500 2    50   ~ 0
*
Text Notes 2350 5300 0    50   ~ 0
Meaning\n\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers/Page Zero values\nNormal Registers *\nAuto-increment Registers *\nAuto-decrement Registers *\nStack Pointers *
Text Notes 1450 5300 0    50   ~ 0
Binary Pattern\n\n1 1 00xxxxxxxx\n1 1 01xxxxxxxx\n1 1 10xxxxxxxx\n1 1 1100xxxxxx\n1 1 1101xxxxxx\n1 1 1110xxxxxx\n1 1 1111xxxxxx
Text Notes 900  5300 0    50   ~ 0
IR Value\n\nI R 000–0FF\nI R 100–1FF\nI R 200–2FF\nI R 300–33F\nI R 340–37F\nI R 380–3BF\nI R 3C0–3FF
Text Notes 2150 5300 0    50   ~ 0
IDX\n\n00\n00\n00\n00\n01\n10\n11
Text Notes 800  1000 0    98   ~ 20
Page Zero Address Generation Logic (AGL)
Text Notes 1050 6150 0    63   ~ 13
Auto-Indexing Logic (AIL)
Text Label 1350 4050 0    50   ~ 0
~READ-AGL
Wire Bus Line
	7650 2050 8950 2050
Text Notes 2950 3500 0    50   ~ 0
(R)
$Comp
L Device:R_Small R501
U 1 1 61212E27
P 4300 3400
F 0 "R501" H 4275 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4000 3400 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 3400 50  0001 C CNN
F 3 "~" H 4300 3400 50  0001 C CNN
	1    4300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3500 4300 3650
$Comp
L Device:R_Small R502
U 1 1 61228AC4
P 4500 3400
F 0 "R502" H 4475 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4250 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4500 3400 50  0001 C CNN
F 3 "~" H 4500 3400 50  0001 C CNN
	1    4500 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R503
U 1 1 61228EC4
P 4700 3400
F 0 "R503" H 4675 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4450 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 3400 50  0001 C CNN
F 3 "~" H 4700 3400 50  0001 C CNN
	1    4700 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R504
U 1 1 6122919F
P 4900 3400
F 0 "R504" H 4875 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4650 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 3400 50  0001 C CNN
F 3 "~" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R505
U 1 1 61229459
P 5100 3400
F 0 "R505" H 5075 3250 50  0000 R CNN
F 1 "4.7kΩ" H 4850 3550 50  0001 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 3400 50  0001 C CNN
F 3 "~" H 5100 3400 50  0001 C CNN
	1    5100 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R506
U 1 1 61229788
P 5300 3400
F 0 "R506" H 5275 3250 50  0000 R CNN
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
Connection ~ 4500 2800
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
L power:GND #PWR0504
U 1 1 5CD297A3
P 4300 3650
F 0 "#PWR0504" H 4300 3400 50  0001 C CNN
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
Text Notes 1050 6550 0    50   ~ 0
The Auto-Index Unit decodes the instruction operand and indicates to the Control Unit which (if any) auto-index\naddressing mode should be used. IDX is usually 00 (no indexing), unless the instruction has fields I and R set,\nand the operand is in the range &300–&3FF, i.e. IR8 and IR9 are set. In this case, the vector IR[6..7] sets\nIDX[0..1].
Text HLabel 6700 4650 2    50   Output ~ 0
IDX0
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
Wire Wire Line
	1200 4050 5600 4050
Text HLabel 1200 4050 0    50   Input ~ 0
~READ-AGL
Text Notes 1400 4150 0    50   ~ 0
This is decoded by the flag unit.
Connection ~ 2300 7400
Connection ~ 2300 7200
$Comp
L alexios:74HC541 U503
U 1 1 5CD2971E
P 6550 3000
F 0 "U503" H 6550 3767 50  0000 C CNN
F 1 "74HC541" H 6550 3676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6550 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6550 3000 50  0001 C CNN
	1    6550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2700 6050 2700
Wire Wire Line
	4500 2800 6050 2800
Wire Wire Line
	6050 2600 5550 2600
Wire Wire Line
	6050 2500 5550 2500
Entry Wire Line
	5450 2400 5550 2500
Entry Wire Line
	5450 2500 5550 2600
$Comp
L alexios:74LVC1G11 U504
U 1 1 6C4E335D
P 6150 4600
F 0 "U504" H 6100 4864 50  0000 C CNN
F 1 "74LVC1G11" H 6100 4773 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6050 4525 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 6050 4525 50  0001 C CNN
	1    6150 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U505
U 1 1 6C4E3863
P 6150 5200
F 0 "U505" H 6100 5464 50  0000 C CNN
F 1 "74LVC1G11" H 6100 5373 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6050 5125 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 6050 5125 50  0001 C CNN
	1    6150 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4550 5550 4550
Wire Wire Line
	5850 5150 5550 5150
Text Label 5850 4550 2    50   ~ 0
IR6
Text Label 5850 4650 2    50   ~ 0
IR8
Text Label 5850 4750 2    50   ~ 0
IR9
Text Label 5850 5150 2    50   ~ 0
IR7
Wire Wire Line
	6350 4650 6700 4650
Text Label 6600 4650 2    50   ~ 0
IDX0
Text HLabel 6700 5250 2    50   Output ~ 0
IDX1
Wire Wire Line
	6350 5250 6700 5250
Text Label 6600 5250 2    50   ~ 0
IDX1
Text Label 5850 5250 2    50   ~ 0
IR8
Text Label 5850 5350 2    50   ~ 0
IR9
Text Label 5850 5700 2    50   ~ 0
IR8
Text Label 5850 5800 2    50   ~ 0
IR9
Entry Wire Line
	5450 4450 5550 4550
Entry Wire Line
	5450 4550 5550 4650
Entry Wire Line
	5450 4650 5550 4750
Entry Wire Line
	5450 5050 5550 5150
Wire Notes Line width 24 style solid
	10500 4250 7700 4250
Wire Notes Line width 24 style solid
	10500 4250 10500 3550
Wire Notes Line width 24 style solid
	7700 3550 10500 3550
Wire Notes Line width 24 style solid
	7700 3550 7700 4250
Text Notes 7800 3800 0    63   ~ 13
Note: IDX Registration
Text Notes 7800 4150 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
$Comp
L power:+5V #PWR?
U 1 1 6C5B5C2E
P 8050 4550
AR Path="/6C5B5C2E" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5B5C2E" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5B5C2E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5B5C2E" Ref="#PWR0505"  Part="1" 
F 0 "#PWR0505" H 8050 4400 50  0001 C CNN
F 1 "+5V" H 8065 4723 50  0000 C CNN
F 2 "" H 8050 4550 50  0001 C CNN
F 3 "" H 8050 4550 50  0001 C CNN
	1    8050 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C5B5C34
P 8050 4650
AR Path="/5CC0D65F/6C5B5C34" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/6C5B5C34" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C5B5C34" Ref="C501"  Part="1" 
F 0 "C501" H 7959 4696 50  0000 R CNN
F 1 "100nF" H 7959 4605 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 4650 50  0001 C CNN
F 3 "~" H 8050 4650 50  0001 C CNN
	1    8050 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C5B5C3A
P 8050 4750
AR Path="/6C5B5C3A" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/6C5B5C3A" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5B5C3A" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5B5C3A" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5B5C3A" Ref="#PWR0506"  Part="1" 
F 0 "#PWR0506" H 8050 4500 50  0001 C CNN
F 1 "GND" H 8055 4577 50  0000 C CNN
F 2 "" H 8050 4750 50  0001 C CNN
F 3 "" H 8050 4750 50  0001 C CNN
	1    8050 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C5BB090
P 8050 5250
AR Path="/6C5BB090" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5BB090" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5BB090" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5BB090" Ref="#PWR0507"  Part="1" 
F 0 "#PWR0507" H 8050 5100 50  0001 C CNN
F 1 "+5V" H 8065 5423 50  0000 C CNN
F 2 "" H 8050 5250 50  0001 C CNN
F 3 "" H 8050 5250 50  0001 C CNN
	1    8050 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C5BB096
P 8050 5350
AR Path="/5CC0D65F/6C5BB096" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/6C5BB096" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C5BB096" Ref="C502"  Part="1" 
F 0 "C502" H 7959 5396 50  0000 R CNN
F 1 "100nF" H 7959 5305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 5350 50  0001 C CNN
F 3 "~" H 8050 5350 50  0001 C CNN
	1    8050 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C5BB09C
P 8050 5450
AR Path="/6C5BB09C" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/6C5BB09C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5BB09C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5BB09C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5BB09C" Ref="#PWR0508"  Part="1" 
F 0 "#PWR0508" H 8050 5200 50  0001 C CNN
F 1 "GND" H 8055 5277 50  0000 C CNN
F 2 "" H 8050 5450 50  0001 C CNN
F 3 "" H 8050 5450 50  0001 C CNN
	1    8050 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C5BF79C
P 8050 5950
AR Path="/6C5BF79C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5BF79C" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5BF79C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5BF79C" Ref="#PWR0509"  Part="1" 
F 0 "#PWR0509" H 8050 5800 50  0001 C CNN
F 1 "+5V" H 8065 6123 50  0000 C CNN
F 2 "" H 8050 5950 50  0001 C CNN
F 3 "" H 8050 5950 50  0001 C CNN
	1    8050 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C5BF7A2
P 8050 6050
AR Path="/5CC0D65F/6C5BF7A2" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/6C5BF7A2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C5BF7A2" Ref="C503"  Part="1" 
F 0 "C503" H 7959 6096 50  0000 R CNN
F 1 "100nF" H 7959 6005 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 6050 50  0001 C CNN
F 3 "~" H 8050 6050 50  0001 C CNN
	1    8050 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C5BF7A8
P 8050 6150
AR Path="/6C5BF7A8" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/6C5BF7A8" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/6C5BF7A8" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/6C5BF7A8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C5BF7A8" Ref="#PWR0510"  Part="1" 
F 0 "#PWR0510" H 8050 5900 50  0001 C CNN
F 1 "GND" H 8055 5977 50  0000 C CNN
F 2 "" H 8050 6150 50  0001 C CNN
F 3 "" H 8050 6150 50  0001 C CNN
	1    8050 6150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U504
U 2 1 6C5C41E2
P 8500 4500
F 0 "U504" H 8580 4396 50  0000 L CNN
F 1 "74LVC1G11" H 8580 4305 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 8400 4425 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 8400 4425 50  0001 C CNN
	2    8500 4500
	1    0    0    -1  
$EndComp
Connection ~ 8050 4750
Connection ~ 8050 4550
$Comp
L alexios:74LVC1G11 U505
U 2 1 6C5C4899
P 8500 5200
F 0 "U505" H 8580 5096 50  0000 L CNN
F 1 "74LVC1G11" H 8580 5005 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 8400 5125 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 8400 5125 50  0001 C CNN
	2    8500 5200
	1    0    0    -1  
$EndComp
Connection ~ 8050 5450
Connection ~ 8050 5250
Wire Wire Line
	6300 5750 6700 5750
Text Label 6350 5750 0    50   ~ 0
~IDXEN
Text HLabel 6700 5750 2    50   Output ~ 0
~IDXEN
$Comp
L alexios:74LVC1G00 U506
U 1 1 6C6E8007
P 6150 5750
F 0 "U506" H 6075 6017 50  0000 C CNN
F 1 "74LVC1G00" H 6075 5926 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5800 5750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 5800 5750 50  0001 C CNN
	1    6150 5750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G00 U506
U 2 1 6C6F3855
P 8500 5950
F 0 "U506" H 8580 5896 50  0000 L CNN
F 1 "74LVC1G00" H 8580 5805 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8150 5950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G00.pdf" H 8150 5950 50  0001 C CNN
	2    8500 5950
	1    0    0    -1  
$EndComp
Connection ~ 8050 6150
Connection ~ 8050 5950
Wire Wire Line
	5550 4750 5850 4750
Wire Wire Line
	5550 4650 5850 4650
Entry Wire Line
	5450 5150 5550 5250
Entry Wire Line
	5450 5250 5550 5350
Wire Wire Line
	5550 5250 5850 5250
Wire Wire Line
	5550 5350 5850 5350
Entry Wire Line
	5450 5600 5550 5700
Entry Wire Line
	5450 5700 5550 5800
Wire Wire Line
	5550 5700 5850 5700
Wire Wire Line
	5550 5800 5850 5800
Wire Bus Line
	1200 2050 5350 2050
Wire Bus Line
	2750 2500 2750 3100
Wire Bus Line
	5450 2150 5450 5700
Wire Bus Line
	7550 1050 7550 1950
Wire Bus Line
	5450 1050 5450 1950
Wire Bus Line
	7550 2150 7550 3100
$EndSCHEMATC
