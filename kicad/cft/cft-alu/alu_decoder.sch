EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 9
Title "ALU Decoding & Control"
Date "2019-11-17"
Rev ""
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 "alu_decoder.v"
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5DD30D3D
P 1100 7200
AR Path="/5CC0D65F/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD30D3D" Ref="C41"  Part="1" 
F 0 "C41" H 1009 7246 50  0000 R CNN
F 1 "100nF" H 1009 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1100 7200 50  0001 C CNN
F 3 "~" H 1100 7200 50  0001 C CNN
	1    1100 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD30D43
P 1100 7300
AR Path="/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD30D43" Ref="#PWR0209"  Part="1" 
F 0 "#PWR0209" H 1100 7050 50  0001 C CNN
F 1 "GND" H 1105 7127 50  0000 C CNN
F 2 "" H 1100 7300 50  0001 C CNN
F 3 "" H 1100 7300 50  0001 C CNN
	1    1100 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD30D49
P 1100 7100
AR Path="/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD30D49" Ref="#PWR0210"  Part="1" 
F 0 "#PWR0210" H 1100 6950 50  0001 C CNN
F 1 "+5V" H 1115 7273 50  0000 C CNN
F 2 "" H 1100 7100 50  0001 C CNN
F 3 "" H 1100 7100 50  0001 C CNN
	1    1100 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5DD31892
P 1450 7200
AR Path="/5DC89E19/5DD31892" Ref="U?"  Part="1" 
AR Path="/5DD31892" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD31892" Ref="U39"  Part="2" 
F 0 "U39" H 1630 7246 50  0000 L CNN
F 1 "74AC138" H 1630 7155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1450 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1450 7200 50  0001 C CNN
	2    1450 7200
	1    0    0    -1  
$EndComp
Connection ~ 1100 7100
Connection ~ 1100 7300
$Comp
L Device:C_Small C?
U 1 1 5DD377BE
P 2450 7200
AR Path="/5CC0D65F/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD377BE" Ref="C42"  Part="1" 
F 0 "C42" H 2359 7246 50  0000 R CNN
F 1 "100nF" H 2359 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7200 50  0001 C CNN
F 3 "~" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD377C4
P 2450 7300
AR Path="/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD377C4" Ref="#PWR0211"  Part="1" 
F 0 "#PWR0211" H 2450 7050 50  0001 C CNN
F 1 "GND" H 2455 7127 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD377CA
P 2450 7100
AR Path="/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD377CA" Ref="#PWR0212"  Part="1" 
F 0 "#PWR0212" H 2450 6950 50  0001 C CNN
F 1 "+5V" H 2465 7273 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3B114
P 3850 7200
AR Path="/5CC0D65F/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD3B114" Ref="C43"  Part="1" 
F 0 "C43" H 3759 7246 50  0000 R CNN
F 1 "100nF" H 3759 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 7200 50  0001 C CNN
F 3 "~" H 3850 7200 50  0001 C CNN
	1    3850 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3B11A
P 3850 7300
AR Path="/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B11A" Ref="#PWR0213"  Part="1" 
F 0 "#PWR0213" H 3850 7050 50  0001 C CNN
F 1 "GND" H 3855 7127 50  0000 C CNN
F 2 "" H 3850 7300 50  0001 C CNN
F 3 "" H 3850 7300 50  0001 C CNN
	1    3850 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3B120
P 3850 7100
AR Path="/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B120" Ref="#PWR0214"  Part="1" 
F 0 "#PWR0214" H 3850 6950 50  0001 C CNN
F 1 "+5V" H 3865 7273 50  0000 C CNN
F 2 "" H 3850 7100 50  0001 C CNN
F 3 "" H 3850 7100 50  0001 C CNN
	1    3850 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3B12E
P 5200 7200
AR Path="/5CC0D65F/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD3B12E" Ref="C44"  Part="1" 
F 0 "C44" H 5109 7246 50  0000 R CNN
F 1 "100nF" H 5109 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5200 7200 50  0001 C CNN
F 3 "~" H 5200 7200 50  0001 C CNN
	1    5200 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3B134
P 5200 7300
AR Path="/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B134" Ref="#PWR0215"  Part="1" 
F 0 "#PWR0215" H 5200 7050 50  0001 C CNN
F 1 "GND" H 5205 7127 50  0000 C CNN
F 2 "" H 5200 7300 50  0001 C CNN
F 3 "" H 5200 7300 50  0001 C CNN
	1    5200 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3B13A
P 5200 7100
AR Path="/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B13A" Ref="#PWR0216"  Part="1" 
F 0 "#PWR0216" H 5200 6950 50  0001 C CNN
F 1 "+5V" H 5215 7273 50  0000 C CNN
F 2 "" H 5200 7100 50  0001 C CNN
F 3 "" H 5200 7100 50  0001 C CNN
	1    5200 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5DD3D389
P 2800 7200
AR Path="/5DC89E19/5DD3D389" Ref="U?"  Part="1" 
AR Path="/5DD3D389" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3D389" Ref="U40"  Part="2" 
F 0 "U40" H 2980 7246 50  0000 L CNN
F 1 "74HC138" H 2980 7155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2800 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2800 7200 50  0001 C CNN
	2    2800 7200
	1    0    0    -1  
$EndComp
Connection ~ 2450 7100
Connection ~ 2450 7300
$Comp
L alexios:74HC138 U?
U 2 1 5DD3E064
P 4200 7200
AR Path="/5DC89E19/5DD3E064" Ref="U?"  Part="1" 
AR Path="/5DD3E064" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3E064" Ref="U41"  Part="2" 
F 0 "U41" H 4380 7246 50  0000 L CNN
F 1 "74HC138" H 4380 7155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4200 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4200 7200 50  0001 C CNN
	2    4200 7200
	1    0    0    -1  
$EndComp
Connection ~ 3850 7100
Connection ~ 3850 7300
$Comp
L alexios:74HC138 U?
U 2 1 5DD3EDFA
P 5550 7200
AR Path="/5DC89E19/5DD3EDFA" Ref="U?"  Part="1" 
AR Path="/5DD3EDFA" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3EDFA" Ref="U42"  Part="2" 
F 0 "U42" H 5730 7246 50  0000 L CNN
F 1 "74HC138" H 5730 7155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5550 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5550 7200 50  0001 C CNN
	2    5550 7200
	1    0    0    -1  
$EndComp
Connection ~ 5200 7100
Connection ~ 5200 7300
Text Notes 3500 3000 0    50   ~ 0
This decoder responds to RADDR=11000. It's used to retrieve\nthe result of an SRU (shift/rotate) operation after the SRU has\nfinished cranking. The microcode could also theoretically use\nthe B port as a very temporary scratch register of limited\nutility—since every ALU operation clobbers it.
Text HLabel 4850 3700 2    50   Output ~ 0
~READ-ALU-Y
Text HLabel 4850 3800 2    50   Output ~ 0
~READ-ALU-B
NoConn ~ 3700 3600
Text Label 3750 3700 0    50   ~ 0
~READ-ALU-Y
Wire Wire Line
	3700 3800 4850 3800
NoConn ~ 9350 2000
Text Label 7750 2300 0    50   ~ 0
T34
Wire Wire Line
	7750 2300 8350 2300
Entry Wire Line
	2250 2400 2350 2300
Wire Wire Line
	2000 2200 2000 4100
Wire Wire Line
	1200 2200 2000 2200
Wire Wire Line
	8300 2100 8350 2100
Wire Wire Line
	8300 2050 8300 2100
$Comp
L power:+5V #PWR0219
U 1 1 5E85E279
P 8300 2050
F 0 "#PWR0219" H 8300 1900 50  0001 C CNN
F 1 "+5V" H 8315 2223 50  0000 C CNN
F 2 "" H 8300 2050 50  0001 C CNN
F 3 "" H 8300 2050 50  0001 C CNN
	1    8300 2050
	1    0    0    -1  
$EndComp
Text Notes 10000 2200 0    50   ~ 0
0111
Text Notes 10000 2100 0    50   ~ 0
0110
Text Notes 10000 1900 0    50   ~ 0
0100
Text Notes 10000 1800 0    50   ~ 0
0011
Text Notes 10000 2000 0    50   ~ 0
0101
Text Notes 10000 1500 0    50   ~ 0
0000
Text Notes 10000 1700 0    50   ~ 0
0010
Text Notes 10000 1600 0    50   ~ 0
0001
Text Notes 4200 4200 2    50   ~ 0
Base\n~Y4~\n\nFinal
Text Notes 4250 4200 0    50   ~ 0
1X0XX\nX1X00\n----\n11000
Text Notes 2500 1050 0    50   ~ 0
This decoder drives the IBus with the ALU result for all ALU\noperations except shifts and rotates. It responds to any\nRADDR like 10xxx, so activates for 8 RADDR addresses.
Text Notes 3900 1700 0    50   ~ 0
RADDR = 10xxx\n(8 addresses)
Text Label 9900 2100 2    50   ~ 0
~ACTION-110
Text HLabel 10400 2100 2    50   Output ~ 0
~ACTION-110
Wire Wire Line
	9350 2100 10400 2100
NoConn ~ 9350 1900
NoConn ~ 9350 1800
Text HLabel 10400 1700 2    50   Output ~ 0
~ACTION-CLL
Text HLabel 10400 1600 2    50   Output ~ 0
~ACTION-CPL
Text Label 9450 1700 0    50   ~ 0
~ACTION-CLL
Text Label 9450 1600 0    50   ~ 0
~ACTION-CPL
Wire Wire Line
	9350 1700 10400 1700
Wire Wire Line
	9350 1600 10400 1600
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE97
P 8850 1900
AR Path="/5DC89E19/5E1CEE97" Ref="U?"  Part="1" 
AR Path="/5E1CEE97" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE97" Ref="U40"  Part="1" 
F 0 "U40" H 8850 2567 50  0000 C CNN
F 1 "74HC138" H 8850 2476 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8850 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 8850 1900 50  0001 C CNN
	1    8850 1900
	1    0    0    -1  
$EndComp
NoConn ~ 3700 3400
NoConn ~ 3700 3500
NoConn ~ 3700 3900
NoConn ~ 3700 4000
Wire Wire Line
	3700 3700 4850 3700
Text Label 3750 3800 0    50   ~ 0
~READ-ALU-B
NoConn ~ 3700 3300
Text HLabel 10400 2200 2    50   Output ~ 0
~ACTION-SRU
Text HLabel 4750 5200 2    50   Output ~ 0
~WRITE-ALU-B
Text HLabel 7200 1250 0    50   Input ~ 0
ACTION[0..4]
Text Label 2250 3050 1    50   ~ 0
RADDR[0..4]
Text Label 1300 2200 0    50   ~ 0
T34
Text Label 2400 4100 0    50   ~ 0
T34
Wire Wire Line
	2000 4100 2700 4100
Text HLabel 1200 2200 0    50   Input ~ 0
T34
Text HLabel 4850 1500 2    50   Output ~ 0
~ALU-OP
Text Notes 4250 5700 2    50   ~ 0
Base\n~Y4~\n\nFinal
Text Notes 4300 5700 0    50   ~ 0
1X0XX\nX1X00\n----\n11000
Entry Bus Bus
	7800 1250 7900 1350
Entry Bus Bus
	2150 4550 2250 4650
Text Label 1300 4550 0    50   ~ 0
WADDR[0..4]
Text HLabel 1200 4550 0    50   Input ~ 0
WADDR[0..4]
Wire Bus Line
	2150 4550 1200 4550
Entry Wire Line
	2250 4700 2350 4800
Entry Wire Line
	2250 4800 2350 4900
Entry Wire Line
	2250 4900 2350 5000
Text Label 8050 1600 0    50   ~ 0
ACTION1
Text Label 8050 1700 0    50   ~ 0
ACTION2
NoConn ~ 9350 1500
Text Label 9900 2200 2    50   ~ 0
~ACTION-SRU
Wire Wire Line
	9350 2200 10400 2200
Text Label 8050 2200 0    50   ~ 0
ACTION3
Text Label 8050 1500 0    50   ~ 0
ACTION0
Wire Wire Line
	8350 1500 8000 1500
Wire Bus Line
	7800 1250 7200 1250
Text Label 7300 1250 0    50   ~ 0
ACTION[0..3]
Entry Wire Line
	7900 2100 8000 2200
Entry Wire Line
	7900 1600 8000 1700
Entry Wire Line
	7900 1500 8000 1600
Entry Wire Line
	7900 1400 8000 1500
Wire Wire Line
	8350 2200 8000 2200
Wire Wire Line
	8350 1700 8000 1700
Wire Wire Line
	8350 1600 8000 1600
Text Notes 8900 2150 1    50   ~ 10
ACTION=0xxx
Text Label 2400 3900 0    50   ~ 0
RADDR4
Text Label 2400 4000 0    50   ~ 0
RADDR2
Text Label 2400 3500 0    50   ~ 0
RADDR3
Text Label 2400 3400 0    50   ~ 0
RADDR1
Text Label 2400 3300 0    50   ~ 0
RADDR0
Wire Wire Line
	2700 3300 2350 3300
Entry Wire Line
	2250 3900 2350 4000
Entry Wire Line
	2250 3800 2350 3900
Entry Wire Line
	2250 3400 2350 3500
Entry Wire Line
	2250 3300 2350 3400
Entry Wire Line
	2250 3200 2350 3300
Wire Wire Line
	2700 4000 2350 4000
Wire Wire Line
	2700 3900 2350 3900
Wire Wire Line
	2700 3500 2350 3500
Wire Wire Line
	2700 3400 2350 3400
Text Notes 3250 3950 1    50   ~ 10
RADDR=1x0xx
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE72
P 3200 3700
AR Path="/5DC89E19/5E1CEE72" Ref="U?"  Part="1" 
AR Path="/5E1CEE72" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE72" Ref="U41"  Part="1" 
F 0 "U41" H 3200 4367 50  0000 C CNN
F 1 "74HC138" H 3200 4276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3200 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3200 3700 50  0001 C CNN
	1    3200 3700
	1    0    0    -1  
$EndComp
Text HLabel 1200 1750 0    50   Input ~ 0
RADDR[0..4]
Text Label 1300 1750 0    50   ~ 0
RADDR[0..4]
Entry Bus Bus
	2150 1750 2250 1850
Wire Wire Line
	2700 2100 2350 2100
Wire Wire Line
	2700 2300 2350 2300
Text Label 2400 2100 0    50   ~ 0
RADDR4
Text Label 2400 2300 0    50   ~ 0
RADDR3
Text Label 2400 2200 0    50   ~ 0
T34
Entry Wire Line
	2250 2000 2350 2100
NoConn ~ 3700 2200
NoConn ~ 3700 2100
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE4B
P 3200 1900
AR Path="/5DC89E19/5E1CEE4B" Ref="U?"  Part="1" 
AR Path="/5E1CEE4B" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE4B" Ref="U39"  Part="1" 
F 0 "U39" H 3200 2567 50  0000 C CNN
F 1 "74AC138" H 3200 2476 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3200 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3200 1900 50  0001 C CNN
	1    3200 1900
	1    0    0    -1  
$EndComp
Text Notes 3250 2150 1    50   ~ 10
RADDR=10xxx
Wire Wire Line
	2700 1500 2650 1500
$Comp
L power:GND #PWR?
U 1 1 5E1CEE43
P 2650 1750
AR Path="/5DC89E19/5E1CEE43" Ref="#PWR?"  Part="1" 
AR Path="/5E1CEE43" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5E1CEE43" Ref="#PWR0207"  Part="1" 
F 0 "#PWR0207" H 2650 1500 50  0001 C CNN
F 1 "GND" H 2655 1577 50  0000 C CNN
F 2 "" H 2650 1750 50  0001 C CNN
F 3 "" H 2650 1750 50  0001 C CNN
	1    2650 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1600 2700 1600
Connection ~ 2650 1600
Wire Wire Line
	2650 1500 2650 1600
Wire Wire Line
	2650 1600 2650 1700
Wire Wire Line
	2700 1700 2650 1700
Connection ~ 2650 1700
Wire Wire Line
	2650 1700 2650 1750
NoConn ~ 3700 1600
NoConn ~ 3700 1700
NoConn ~ 3700 1800
NoConn ~ 3700 1900
NoConn ~ 3700 2000
Text Notes 2900 2500 0    50   ~ 0
NOTE: Use 74AC!
Text Label 3750 1500 0    50   ~ 0
~ALU-OP
NoConn ~ 3700 5300
NoConn ~ 3700 4800
Text Label 3800 5200 0    50   ~ 0
~WRITE-ALU-B
Wire Wire Line
	3700 5200 4750 5200
NoConn ~ 3700 5500
NoConn ~ 3700 5400
NoConn ~ 3700 5100
NoConn ~ 3700 5000
NoConn ~ 3700 4900
Text Label 2400 5600 0    50   ~ 0
T34
Text Label 2400 5400 0    50   ~ 0
WADDR4
Text Label 2400 5500 0    50   ~ 0
WADDR2
Text Label 2400 5000 0    50   ~ 0
WADDR3
Text Label 2400 4900 0    50   ~ 0
WADDR1
Text Label 2400 4800 0    50   ~ 0
WADDR0
Wire Wire Line
	2700 4800 2350 4800
Entry Wire Line
	2250 5400 2350 5500
Entry Wire Line
	2250 5300 2350 5400
Wire Wire Line
	2700 5500 2350 5500
Wire Wire Line
	2700 5400 2350 5400
Wire Wire Line
	2700 5000 2350 5000
Wire Wire Line
	2700 4900 2350 4900
Text Notes 3250 5450 1    50   ~ 10
WADDR=1x0xx
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE11
P 3200 5200
AR Path="/5DC89E19/5E1CEE11" Ref="U?"  Part="1" 
AR Path="/5E1CEE11" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE11" Ref="U42"  Part="1" 
F 0 "U42" H 3200 5867 50  0000 C CNN
F 1 "74HC138" H 3200 5776 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3200 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3200 5200 50  0001 C CNN
	1    3200 5200
	1    0    0    -1  
$EndComp
Wire Bus Line
	1200 1750 2150 1750
Text Label 2000 3050 1    50   ~ 0
T34
Connection ~ 2000 2200
Wire Wire Line
	2000 2200 2700 2200
Wire Wire Line
	2000 4100 2000 5600
Connection ~ 2000 4100
Wire Wire Line
	2000 5600 2700 5600
Wire Wire Line
	6250 2250 6800 2250
Wire Wire Line
	4700 2250 5750 2250
Text Label 4900 2250 0    50   ~ 0
~ALU-OP
Wire Wire Line
	4700 1500 4850 1500
Wire Wire Line
	3700 1500 4700 1500
Connection ~ 4700 1500
Wire Wire Line
	4700 1500 4700 2250
$Comp
L alexios:74LVC1G04 U48
U 1 1 5EB73147
P 6050 2250
F 0 "U48" H 6000 2517 50  0000 C CNN
F 1 "74LVC1G04" H 6000 2426 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6050 2250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6050 2250 50  0001 C CNN
	1    6050 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U48
U 2 1 5F03048C
P 6700 2750
F 0 "U48" H 6880 2796 50  0000 L CNN
F 1 "74LVC1G04" H 6880 2705 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6700 2750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 6700 2750 50  0001 C CNN
	2    6700 2750
	1    0    0    -1  
$EndComp
Text HLabel 6800 2250 2    50   Output ~ 0
ACP
Text Label 6700 2250 2    50   ~ 0
ACP
Wire Bus Line
	7900 1350 7900 2100
Wire Bus Line
	2250 4650 2250 5400
Wire Bus Line
	2250 1850 2250 3900
$EndSCHEMATC
