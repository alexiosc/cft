EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 9
Title "ALU Address Decoders"
Date "2019-11-17"
Rev ""
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 "alu_decoder.v"
$EndDescr
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE11
P 7900 4350
AR Path="/5DC89E19/5E1CEE11" Ref="U?"  Part="1" 
AR Path="/5E1CEE11" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE11" Ref="U42"  Part="1" 
F 0 "U42" H 7900 5017 50  0000 C CNN
F 1 "74HC138" H 7900 4926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7900 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7900 4350 50  0001 C CNN
	1    7900 4350
	1    0    0    -1  
$EndComp
Text Notes 7950 4600 1    50   ~ 10
WADDR=1x0xx
Wire Wire Line
	7400 4050 7050 4050
Wire Wire Line
	7400 4150 7050 4150
Wire Wire Line
	7400 4550 7050 4550
Wire Wire Line
	7400 4650 7050 4650
Entry Wire Line
	6950 4450 7050 4550
Entry Wire Line
	6950 4550 7050 4650
Wire Wire Line
	7400 3950 7050 3950
Text Label 7100 3950 0    50   ~ 0
WADDR0
Text Label 7100 4050 0    50   ~ 0
WADDR1
Text Label 7100 4150 0    50   ~ 0
WADDR3
Text Label 7100 4650 0    50   ~ 0
WADDR2
Text Label 7100 4550 0    50   ~ 0
WADDR4
Text Label 7100 4750 0    50   ~ 0
T34
NoConn ~ 8400 4050
NoConn ~ 8400 4150
NoConn ~ 8400 4250
NoConn ~ 8400 4550
NoConn ~ 8400 4650
Wire Wire Line
	8400 4350 9450 4350
Text Label 8500 4350 0    50   ~ 0
~WRITE-ALU-B
NoConn ~ 8400 3950
NoConn ~ 8400 4450
Text Label 4650 2150 2    50   ~ 0
~ROMOE
Text Notes 3550 3150 0    50   ~ 0
NOTE: Use 74AC!
NoConn ~ 4350 2650
NoConn ~ 4350 2550
NoConn ~ 4350 2450
NoConn ~ 4350 2350
NoConn ~ 4350 2250
Wire Wire Line
	3300 2350 3300 2400
Connection ~ 3300 2350
Wire Wire Line
	3350 2350 3300 2350
Wire Wire Line
	3300 2250 3300 2350
Wire Wire Line
	3300 2150 3300 2250
Connection ~ 3300 2250
Wire Wire Line
	3300 2250 3350 2250
$Comp
L power:GND #PWR?
U 1 1 5E1CEE43
P 3300 2400
AR Path="/5DC89E19/5E1CEE43" Ref="#PWR?"  Part="1" 
AR Path="/5E1CEE43" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5E1CEE43" Ref="#PWR0207"  Part="1" 
F 0 "#PWR0207" H 3300 2150 50  0001 C CNN
F 1 "GND" H 3305 2227 50  0000 C CNN
F 2 "" H 3300 2400 50  0001 C CNN
F 3 "" H 3300 2400 50  0001 C CNN
	1    3300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2150 3300 2150
Text Notes 3900 2800 1    50   ~ 10
RADDR=10xxx
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE4B
P 3850 2550
AR Path="/5DC89E19/5E1CEE4B" Ref="U?"  Part="1" 
AR Path="/5E1CEE4B" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE4B" Ref="U39"  Part="1" 
F 0 "U39" H 3850 3217 50  0000 C CNN
F 1 "74AC138" H 3850 3126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3850 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 2550 50  0001 C CNN
	1    3850 2550
	1    0    0    -1  
$EndComp
NoConn ~ 4350 2750
NoConn ~ 4350 2850
Entry Wire Line
	2900 2750 3000 2850
Entry Wire Line
	2900 2650 3000 2750
Text Label 3050 2950 0    50   ~ 0
T34
Text Label 3050 2850 0    50   ~ 0
RADDR3
Text Label 3050 2750 0    50   ~ 0
RADDR4
Wire Wire Line
	3350 2850 3000 2850
Wire Wire Line
	3350 2750 3000 2750
Entry Bus Bus
	2800 2400 2900 2500
Text Label 2300 2400 0    50   ~ 0
RADDR[0..4]
Text HLabel 2200 2400 0    50   Input ~ 0
RADDR[0..4]
Wire Bus Line
	2800 2400 2200 2400
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE72
P 3850 4350
AR Path="/5DC89E19/5E1CEE72" Ref="U?"  Part="1" 
AR Path="/5E1CEE72" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE72" Ref="U41"  Part="1" 
F 0 "U41" H 3850 5017 50  0000 C CNN
F 1 "74HC138" H 3850 4926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3850 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3850 4350 50  0001 C CNN
	1    3850 4350
	1    0    0    -1  
$EndComp
Text Notes 3900 4600 1    50   ~ 10
RADDR=1x0xx
Wire Wire Line
	3350 4050 3000 4050
Wire Wire Line
	3350 4150 3000 4150
Wire Wire Line
	3350 4550 3000 4550
Wire Wire Line
	3350 4650 3000 4650
Entry Wire Line
	2900 3850 3000 3950
Entry Wire Line
	2900 3950 3000 4050
Entry Wire Line
	2900 4050 3000 4150
Entry Wire Line
	2900 4450 3000 4550
Entry Wire Line
	2900 4550 3000 4650
Wire Wire Line
	3350 3950 3000 3950
Text Label 3050 3950 0    50   ~ 0
RADDR0
Text Label 3050 4050 0    50   ~ 0
RADDR1
Text Label 3050 4150 0    50   ~ 0
RADDR3
Text Label 3050 4650 0    50   ~ 0
RADDR2
Text Label 3050 4550 0    50   ~ 0
RADDR4
Text Notes 7950 2800 1    50   ~ 10
ACTION=0xxx
Wire Wire Line
	7400 2250 7050 2250
Wire Wire Line
	7400 2350 7050 2350
Wire Wire Line
	7400 2850 7050 2850
Entry Wire Line
	6950 2050 7050 2150
Entry Wire Line
	6950 2150 7050 2250
Entry Wire Line
	6950 2250 7050 2350
Entry Wire Line
	6950 2750 7050 2850
Text Label 6350 1900 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	6850 1900 6250 1900
Wire Wire Line
	7400 2150 7050 2150
Text Label 7100 2150 0    50   ~ 0
ACTION0
Text Label 7100 2850 0    50   ~ 0
ACTION3
Wire Wire Line
	8400 2850 9450 2850
Text Label 8950 2850 2    50   ~ 0
~ACTION-SRU
NoConn ~ 8400 2150
Text Label 7100 2350 0    50   ~ 0
ACTION2
Text Label 7100 2250 0    50   ~ 0
ACTION1
$Comp
L power:GND #PWR?
U 1 1 5E1CEEB5
P 7350 3000
AR Path="/5E1CEEB5" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5E1CEEB5" Ref="#PWR0208"  Part="1" 
F 0 "#PWR0208" H 7350 2750 50  0001 C CNN
F 1 "GND" H 7355 2827 50  0000 C CNN
F 2 "" H 7350 3000 50  0001 C CNN
F 3 "" H 7350 3000 50  0001 C CNN
	1    7350 3000
	1    0    0    -1  
$EndComp
Entry Wire Line
	6950 4050 7050 4150
Entry Wire Line
	6950 3950 7050 4050
Entry Wire Line
	6950 3850 7050 3950
Wire Bus Line
	6850 3700 6250 3700
Text HLabel 6250 3700 0    50   Input ~ 0
WADDR[0..4]
Text Label 6350 3700 0    50   ~ 0
WADDR[0..4]
Entry Bus Bus
	6850 3700 6950 3800
Wire Wire Line
	7400 2950 7350 2950
Wire Wire Line
	7350 2950 7350 3000
Entry Bus Bus
	6850 1900 6950 2000
Text Notes 9000 4850 0    50   ~ 0
1X0XX\nX1X00\n----\n11000
Text Notes 8950 4850 2    50   ~ 0
Base\n~Y4~\n\nFinal
Wire Wire Line
	4350 2150 5250 2150
Text HLabel 5250 2150 2    50   Output ~ 0
~ROMOE
Text HLabel 2200 2950 0    50   Input ~ 0
T34
Wire Wire Line
	2800 4750 3350 4750
Wire Wire Line
	2200 2950 2800 2950
Connection ~ 2800 2950
Wire Wire Line
	2800 2950 3350 2950
Wire Wire Line
	2800 2950 2800 4750
Text Label 3050 4750 0    50   ~ 0
T34
Text Label 2800 3700 1    50   ~ 0
~RUEN
Text Label 2300 2950 0    50   ~ 0
T34
Text Label 2900 3700 1    50   ~ 0
RADDR[0..4]
Text HLabel 6250 1900 0    50   Input ~ 0
ACTION[0..4]
Text HLabel 9450 4350 2    50   Output ~ 0
~WRITE-ALU-B
Text HLabel 9450 2850 2    50   Output ~ 0
~ACTION-SRU
NoConn ~ 4350 3950
Text Label 4400 4350 0    50   ~ 0
~READ-ALU-B
Text HLabel 5250 4350 2    50   Output ~ 0
~READ-ALU-B
Wire Wire Line
	4350 4350 5250 4350
NoConn ~ 4350 4650
NoConn ~ 4350 4550
NoConn ~ 4350 4450
NoConn ~ 4350 4250
NoConn ~ 4350 4150
NoConn ~ 4350 4050
$Comp
L alexios:74HC138 U?
U 1 1 5E1CEE97
P 7900 2550
AR Path="/5DC89E19/5E1CEE97" Ref="U?"  Part="1" 
AR Path="/5E1CEE97" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5E1CEE97" Ref="U40"  Part="1" 
F 0 "U40" H 7900 3217 50  0000 C CNN
F 1 "74HC138" H 7900 3126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7900 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7900 2550 50  0001 C CNN
	1    7900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2250 9450 2250
Wire Wire Line
	8400 2350 9450 2350
Text Label 8500 2250 0    50   ~ 0
~ACTION-CPL
Text Label 8500 2350 0    50   ~ 0
~ACTION-CLL
Text HLabel 9450 2250 2    50   Output ~ 0
~ACTION-CPL
Text HLabel 9450 2350 2    50   Output ~ 0
~ACTION-CLL
NoConn ~ 8400 2450
NoConn ~ 8400 2550
Wire Wire Line
	8400 2650 9450 2650
Wire Wire Line
	8400 2750 9450 2750
Text HLabel 9450 2650 2    50   Output ~ 0
~ACTION-101
Text HLabel 9450 2750 2    50   Output ~ 0
~ACTION-110
Text Label 8950 2750 2    50   ~ 0
~ACTION-110
Text Label 8950 2650 2    50   ~ 0
~ACTION-101
$Comp
L Device:C_Small C?
U 1 1 5DD30D3D
P 1050 7350
AR Path="/5CC0D65F/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD30D3D" Ref="C41"  Part="1" 
F 0 "C41" H 959 7396 50  0000 R CNN
F 1 "100nF" H 959 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 7350 50  0001 C CNN
F 3 "~" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD30D43
P 1050 7450
AR Path="/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD30D43" Ref="#PWR0209"  Part="1" 
F 0 "#PWR0209" H 1050 7200 50  0001 C CNN
F 1 "GND" H 1055 7277 50  0000 C CNN
F 2 "" H 1050 7450 50  0001 C CNN
F 3 "" H 1050 7450 50  0001 C CNN
	1    1050 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD30D49
P 1050 7250
AR Path="/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD30D49" Ref="#PWR0210"  Part="1" 
F 0 "#PWR0210" H 1050 7100 50  0001 C CNN
F 1 "+5V" H 1065 7423 50  0000 C CNN
F 2 "" H 1050 7250 50  0001 C CNN
F 3 "" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5DD31892
P 1400 7350
AR Path="/5DC89E19/5DD31892" Ref="U?"  Part="1" 
AR Path="/5DD31892" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD31892" Ref="U39"  Part="2" 
F 0 "U39" H 1580 7396 50  0000 L CNN
F 1 "74AC138" H 1580 7305 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1400 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 7350 50  0001 C CNN
	2    1400 7350
	1    0    0    -1  
$EndComp
Connection ~ 1050 7250
Connection ~ 1050 7450
$Comp
L Device:C_Small C?
U 1 1 5DD377BE
P 2400 7350
AR Path="/5CC0D65F/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD377BE" Ref="C42"  Part="1" 
F 0 "C42" H 2309 7396 50  0000 R CNN
F 1 "100nF" H 2309 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7350 50  0001 C CNN
F 3 "~" H 2400 7350 50  0001 C CNN
	1    2400 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD377C4
P 2400 7450
AR Path="/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD377C4" Ref="#PWR0211"  Part="1" 
F 0 "#PWR0211" H 2400 7200 50  0001 C CNN
F 1 "GND" H 2405 7277 50  0000 C CNN
F 2 "" H 2400 7450 50  0001 C CNN
F 3 "" H 2400 7450 50  0001 C CNN
	1    2400 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD377CA
P 2400 7250
AR Path="/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD377CA" Ref="#PWR0212"  Part="1" 
F 0 "#PWR0212" H 2400 7100 50  0001 C CNN
F 1 "+5V" H 2415 7423 50  0000 C CNN
F 2 "" H 2400 7250 50  0001 C CNN
F 3 "" H 2400 7250 50  0001 C CNN
	1    2400 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3B114
P 3800 7350
AR Path="/5CC0D65F/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD3B114" Ref="C43"  Part="1" 
F 0 "C43" H 3709 7396 50  0000 R CNN
F 1 "100nF" H 3709 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3800 7350 50  0001 C CNN
F 3 "~" H 3800 7350 50  0001 C CNN
	1    3800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3B11A
P 3800 7450
AR Path="/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B11A" Ref="#PWR0213"  Part="1" 
F 0 "#PWR0213" H 3800 7200 50  0001 C CNN
F 1 "GND" H 3805 7277 50  0000 C CNN
F 2 "" H 3800 7450 50  0001 C CNN
F 3 "" H 3800 7450 50  0001 C CNN
	1    3800 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3B120
P 3800 7250
AR Path="/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B120" Ref="#PWR0214"  Part="1" 
F 0 "#PWR0214" H 3800 7100 50  0001 C CNN
F 1 "+5V" H 3815 7423 50  0000 C CNN
F 2 "" H 3800 7250 50  0001 C CNN
F 3 "" H 3800 7250 50  0001 C CNN
	1    3800 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3B12E
P 5150 7350
AR Path="/5CC0D65F/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD3B12E" Ref="C44"  Part="1" 
F 0 "C44" H 5059 7396 50  0000 R CNN
F 1 "100nF" H 5059 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 7350 50  0001 C CNN
F 3 "~" H 5150 7350 50  0001 C CNN
	1    5150 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3B134
P 5150 7450
AR Path="/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B134" Ref="#PWR0215"  Part="1" 
F 0 "#PWR0215" H 5150 7200 50  0001 C CNN
F 1 "GND" H 5155 7277 50  0000 C CNN
F 2 "" H 5150 7450 50  0001 C CNN
F 3 "" H 5150 7450 50  0001 C CNN
	1    5150 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3B13A
P 5150 7250
AR Path="/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B13A" Ref="#PWR0216"  Part="1" 
F 0 "#PWR0216" H 5150 7100 50  0001 C CNN
F 1 "+5V" H 5165 7423 50  0000 C CNN
F 2 "" H 5150 7250 50  0001 C CNN
F 3 "" H 5150 7250 50  0001 C CNN
	1    5150 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5DD3D389
P 2750 7350
AR Path="/5DC89E19/5DD3D389" Ref="U?"  Part="1" 
AR Path="/5DD3D389" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3D389" Ref="U40"  Part="2" 
F 0 "U40" H 2930 7396 50  0000 L CNN
F 1 "74HC138" H 2930 7305 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2750 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2750 7350 50  0001 C CNN
	2    2750 7350
	1    0    0    -1  
$EndComp
Connection ~ 2400 7250
Connection ~ 2400 7450
$Comp
L alexios:74HC138 U?
U 2 1 5DD3E064
P 4150 7350
AR Path="/5DC89E19/5DD3E064" Ref="U?"  Part="1" 
AR Path="/5DD3E064" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3E064" Ref="U41"  Part="2" 
F 0 "U41" H 4330 7396 50  0000 L CNN
F 1 "74HC138" H 4330 7305 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4150 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4150 7350 50  0001 C CNN
	2    4150 7350
	1    0    0    -1  
$EndComp
Connection ~ 3800 7250
Connection ~ 3800 7450
$Comp
L alexios:74HC138 U?
U 2 1 5DD3EDFA
P 5500 7350
AR Path="/5DC89E19/5DD3EDFA" Ref="U?"  Part="1" 
AR Path="/5DD3EDFA" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3EDFA" Ref="U42"  Part="2" 
F 0 "U42" H 5680 7396 50  0000 L CNN
F 1 "74HC138" H 5680 7305 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5500 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5500 7350 50  0001 C CNN
	2    5500 7350
	1    0    0    -1  
$EndComp
Connection ~ 5150 7250
Connection ~ 5150 7450
Wire Wire Line
	2800 5000 7050 5000
Wire Wire Line
	7050 5000 7050 4750
Wire Wire Line
	2800 4750 2800 5000
Connection ~ 2800 4750
Wire Wire Line
	7050 4750 7400 4750
Text Notes 4550 2350 0    50   ~ 0
RADDR = 10xxx\n(8 addresses)
Text Notes 3150 1700 0    50   ~ 0
This decoder drives the IBus with the ALU result for all ALU\noperations except shifts and rotates. It responds to any\nRADDR like 10xxx, so activates for 8 RADDR addresses.
Text Notes 3150 5550 0    50   ~ 0
This decoder responds to RADDR=11000. It's used to retrieve\nthe result of an SRU (shift/rotate) operation after the SRU has\nfinished cranking. The microcode could also theoretically use\nthe B port as a very temporary scratch register of limited\nutility—since every ALU operation clobbers it.
Text Notes 4900 4850 0    50   ~ 0
1X0XX\nX1X00\n----\n11000
Text Notes 4850 4850 2    50   ~ 0
Base\n~Y4~\n\nFinal
Text Notes 9050 2250 0    50   ~ 0
0001
Text Notes 9050 2350 0    50   ~ 0
0010
Text Notes 9050 2150 0    50   ~ 0
0000
Text Notes 9050 2650 0    50   ~ 0
0101
Text Notes 9050 2450 0    50   ~ 0
0011
Text Notes 9050 2550 0    50   ~ 0
0100
Text Notes 9050 2750 0    50   ~ 0
0110
Text Notes 9050 2850 0    50   ~ 0
0111
$Comp
L power:+5V #PWR0219
U 1 1 5E85E279
P 7350 2700
F 0 "#PWR0219" H 7350 2550 50  0001 C CNN
F 1 "+5V" H 7365 2873 50  0000 C CNN
F 2 "" H 7350 2700 50  0001 C CNN
F 3 "" H 7350 2700 50  0001 C CNN
	1    7350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2700 7350 2750
Wire Wire Line
	7350 2750 7400 2750
Wire Bus Line
	6950 2000 6950 2750
Wire Bus Line
	6950 3800 6950 4550
Wire Bus Line
	2900 2500 2900 4550
$EndSCHEMATC
