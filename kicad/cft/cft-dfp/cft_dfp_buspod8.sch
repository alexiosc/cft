EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 12
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Entry Wire Line
	3850 2550 3750 2450
Entry Wire Line
	3850 2650 3750 2550
Entry Wire Line
	3850 2750 3750 2650
Entry Wire Line
	3850 2850 3750 2750
Entry Wire Line
	3850 2950 3750 2850
Entry Wire Line
	3850 3050 3750 2950
Wire Wire Line
	4250 2950 3850 2950
Wire Wire Line
	4250 2850 3850 2850
Wire Wire Line
	4250 2750 3850 2750
Wire Wire Line
	4250 2650 3850 2650
Wire Wire Line
	4250 2550 3850 2550
Wire Wire Line
	4250 2450 3850 2450
Wire Wire Line
	4250 2350 3850 2350
Wire Wire Line
	5250 2350 5650 2350
Wire Wire Line
	5250 2450 5650 2450
Wire Wire Line
	5250 2550 5650 2550
Wire Wire Line
	5250 2650 5650 2650
Wire Wire Line
	5250 2750 5650 2750
Wire Wire Line
	5250 2850 5650 2850
Wire Wire Line
	5250 2950 5650 2950
Wire Wire Line
	5250 3050 5650 3050
Entry Wire Line
	3850 2450 3750 2350
Entry Wire Line
	3850 2350 3750 2250
Wire Wire Line
	3850 3050 4250 3050
Entry Wire Line
	7850 2850 7950 2950
Entry Wire Line
	7850 2750 7950 2850
Entry Wire Line
	7850 2650 7950 2750
Entry Wire Line
	7850 2550 7950 2650
Entry Wire Line
	7850 2450 7950 2550
Entry Wire Line
	7850 2350 7950 2450
Entry Wire Line
	7850 2950 7950 3050
Entry Wire Line
	7850 3050 7950 3150
Entry Wire Line
	5850 2350 5750 2250
Entry Wire Line
	5850 2450 5750 2350
Entry Wire Line
	5850 2550 5750 2450
Entry Wire Line
	5850 2650 5750 2550
Entry Wire Line
	5850 2750 5750 2650
Entry Wire Line
	5850 2850 5750 2750
Entry Wire Line
	5850 2950 5750 2850
Entry Wire Line
	5850 3050 5750 2950
Entry Wire Line
	5650 2450 5750 2350
Entry Wire Line
	5650 2550 5750 2450
Entry Wire Line
	5650 2650 5750 2550
Entry Wire Line
	5650 2750 5750 2650
Entry Wire Line
	5650 2850 5750 2750
Entry Wire Line
	5650 2950 5750 2850
Entry Wire Line
	5650 3050 5750 2950
Entry Wire Line
	5650 2350 5750 2250
$Comp
L alexios:74HC574 U?
U 1 1 5D7E812A
P 4750 2850
AR Path="/5D7E812A" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D7E812A" Ref="U?"  Part="1" 
AR Path="/5D7E2B0A/5D7E812A" Ref="U?"  Part="1" 
F 0 "U?" H 4750 3617 50  0000 C CNN
F 1 "74HC574" H 4750 3526 50  0000 C CNN
F 2 "alexios:SOIC-16W" H 4450 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4450 2800 50  0001 C CNN
	1    4750 2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D7E8138
P 6950 2850
AR Path="/5D7E8138" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D7E8138" Ref="U?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8138" Ref="U?"  Part="1" 
F 0 "U?" H 6950 3617 50  0000 C CNN
F 1 "74HC574" H 6950 3526 50  0000 C CNN
F 2 "alexios:SOIC-16W" H 6650 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6650 2800 50  0001 C CNN
	1    6950 2850
	1    0    0    -1  
$EndComp
Text Label 2850 3350 0    50   ~ 0
~OE
Wire Wire Line
	4250 3250 2750 3250
Wire Wire Line
	6450 3350 6050 3350
Text Label 6400 3350 2    50   ~ 0
~R
Text Label 6400 3250 2    50   ~ 0
BUSCP
Text Label 2850 3250 0    50   ~ 0
CP
$Comp
L power:GND #PWR?
U 1 1 5D7E8153
P 1200 7250
AR Path="/5D78E680/5D7E8153" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8153" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1200 7000 50  0001 C CNN
F 1 "GND" H 1205 7077 50  0000 C CNN
F 2 "" H 1200 7250 50  0001 C CNN
F 3 "" H 1200 7250 50  0001 C CNN
	1    1200 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D7E8159
P 1200 7050
AR Path="/5D78E680/5D7E8159" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8159" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1200 6900 50  0001 C CNN
F 1 "+5V" H 1215 7223 50  0000 C CNN
F 2 "" H 1200 7050 50  0001 C CNN
F 3 "" H 1200 7050 50  0001 C CNN
	1    1200 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7E815F
P 1200 7150
AR Path="/5D78E680/5D7E815F" Ref="C?"  Part="1" 
AR Path="/5D7E2B0A/5D7E815F" Ref="C?"  Part="1" 
F 0 "C?" H 1109 7196 50  0000 R CNN
F 1 "100nF" H 1109 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 7150 50  0001 C CNN
F 3 "~" H 1200 7150 50  0001 C CNN
	1    1200 7150
	1    0    0    -1  
$EndComp
Entry Bus Bus
	5750 2000 5850 1900
Wire Bus Line
	5850 1900 9450 1900
Text HLabel 9450 1900 2    50   BiDi ~ 0
BUS[0..7]
Entry Bus Bus
	7850 3600 7950 3500
Wire Bus Line
	3850 3600 7850 3600
Text Label 5300 2350 0    50   ~ 0
BUS0
Text Label 5300 2450 0    50   ~ 0
BUS1
Text Label 5300 2550 0    50   ~ 0
BUS2
Text Label 5300 2650 0    50   ~ 0
BUS3
Text Label 5300 2750 0    50   ~ 0
BUS4
Text Label 5300 2850 0    50   ~ 0
BUS5
Text Label 5300 2950 0    50   ~ 0
BUS6
Text Label 5300 3050 0    50   ~ 0
BUS7
Text Label 6400 2350 2    50   ~ 0
BUS0
Text Label 6400 2450 2    50   ~ 0
BUS1
Text Label 6400 2550 2    50   ~ 0
BUS2
Text Label 6400 2650 2    50   ~ 0
BUS3
Text Label 6400 2750 2    50   ~ 0
BUS4
Text Label 6400 2850 2    50   ~ 0
BUS5
Text Label 6400 2950 2    50   ~ 0
BUS6
Text Label 6400 3050 2    50   ~ 0
BUS7
Wire Wire Line
	5850 2350 6450 2350
Wire Wire Line
	5850 2450 6450 2450
Wire Wire Line
	5850 2550 6450 2550
Wire Wire Line
	5850 2650 6450 2650
Wire Wire Line
	5850 2750 6450 2750
Wire Wire Line
	5850 2850 6450 2850
Wire Wire Line
	5850 2950 6450 2950
Wire Wire Line
	5850 3050 6450 3050
Entry Bus Bus
	3650 1900 3750 2000
Wire Bus Line
	3650 1900 2750 1900
Text Label 2850 1900 0    50   ~ 0
FP[0..7]
Text HLabel 2750 1900 0    50   3State ~ 0
FP[0..7]
Text HLabel 2750 3350 0    50   Input ~ 0
~OE
Text HLabel 2750 3250 0    50   Input ~ 0
CP
Text Label 4200 2350 2    50   ~ 0
FP0
Text Label 4200 2450 2    50   ~ 0
FP1
Text Label 4200 2550 2    50   ~ 0
FP2
Text Label 4200 2650 2    50   ~ 0
FP3
Text Label 4200 2750 2    50   ~ 0
FP4
Text Label 4200 2850 2    50   ~ 0
FP5
Text Label 4200 2950 2    50   ~ 0
FP6
Text Label 4200 3050 2    50   ~ 0
FP7
Wire Wire Line
	7450 2950 7850 2950
Wire Wire Line
	7450 2850 7850 2850
Wire Wire Line
	7450 2750 7850 2750
Wire Wire Line
	7450 2650 7850 2650
Wire Wire Line
	7450 2550 7850 2550
Wire Wire Line
	7450 2450 7850 2450
Wire Wire Line
	7450 2350 7850 2350
Wire Wire Line
	7850 3050 7450 3050
Text Label 7500 2350 0    50   ~ 0
FP0
Text Label 7500 2450 0    50   ~ 0
FP1
Text Label 7500 2550 0    50   ~ 0
FP2
Text Label 7500 2650 0    50   ~ 0
FP3
Text Label 7500 2750 0    50   ~ 0
FP4
Text Label 7500 2850 0    50   ~ 0
FP5
Text Label 7500 2950 0    50   ~ 0
FP6
Text Label 7500 3050 0    50   ~ 0
FP7
Wire Wire Line
	5950 3700 2750 3700
Wire Wire Line
	5950 3250 6450 3250
Text Label 2850 3700 0    50   ~ 0
BUSCP
Wire Wire Line
	6050 3350 6050 3800
Wire Wire Line
	6050 3800 2750 3800
Text Label 2850 3800 0    50   ~ 0
~R
Text HLabel 2750 3700 0    50   Input ~ 0
BUSCP
Text HLabel 2750 3800 0    50   Input ~ 0
~R
Text Label 4200 3250 2    50   ~ 0
CP
Text Label 4200 3350 2    50   ~ 0
~OE
$Comp
L alexios:74HC574 U?
U 2 1 5D7E81FB
P 1550 7150
AR Path="/5D7E81FB" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D7E81FB" Ref="U?"  Part="2" 
AR Path="/5D7E2B0A/5D7E81FB" Ref="U?"  Part="2" 
F 0 "U?" H 1729 7196 50  0000 L CNN
F 1 "74HC574" H 1729 7105 50  0000 L CNN
F 2 "alexios:SOIC-16W" H 1250 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1250 7100 50  0001 C CNN
	2    1550 7150
	1    0    0    -1  
$EndComp
Connection ~ 1200 7250
Connection ~ 1200 7050
$Comp
L power:GND #PWR?
U 1 1 5D7E8204
P 2650 7250
AR Path="/5D78E680/5D7E8204" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8204" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2650 7000 50  0001 C CNN
F 1 "GND" H 2655 7077 50  0000 C CNN
F 2 "" H 2650 7250 50  0001 C CNN
F 3 "" H 2650 7250 50  0001 C CNN
	1    2650 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D7E820A
P 2650 7050
AR Path="/5D78E680/5D7E820A" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E820A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2650 6900 50  0001 C CNN
F 1 "+5V" H 2665 7223 50  0000 C CNN
F 2 "" H 2650 7050 50  0001 C CNN
F 3 "" H 2650 7050 50  0001 C CNN
	1    2650 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7E8210
P 2650 7150
AR Path="/5D78E680/5D7E8210" Ref="C?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8210" Ref="C?"  Part="1" 
F 0 "C?" H 2559 7196 50  0000 R CNN
F 1 "100nF" H 2559 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 7150 50  0001 C CNN
F 3 "~" H 2650 7150 50  0001 C CNN
	1    2650 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D7E8217
P 3000 7150
AR Path="/5D7E8217" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D7E8217" Ref="U?"  Part="2" 
AR Path="/5D7E2B0A/5D7E8217" Ref="U?"  Part="2" 
F 0 "U?" H 3179 7196 50  0000 L CNN
F 1 "74HC574" H 3179 7105 50  0000 L CNN
F 2 "alexios:SOIC-16W" H 2700 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2700 7100 50  0001 C CNN
	2    3000 7150
	1    0    0    -1  
$EndComp
Connection ~ 2650 7250
Connection ~ 2650 7050
$Comp
L power:GND #PWR?
U 1 1 5D7E8220
P 4100 7250
AR Path="/5D78E680/5D7E8220" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8220" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 7000 50  0001 C CNN
F 1 "GND" H 4105 7077 50  0000 C CNN
F 2 "" H 4100 7250 50  0001 C CNN
F 3 "" H 4100 7250 50  0001 C CNN
	1    4100 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D7E8226
P 4100 7050
AR Path="/5D78E680/5D7E8226" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8226" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 6900 50  0001 C CNN
F 1 "+5V" H 4115 7223 50  0000 C CNN
F 2 "" H 4100 7050 50  0001 C CNN
F 3 "" H 4100 7050 50  0001 C CNN
	1    4100 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7E822C
P 4100 7150
AR Path="/5D78E680/5D7E822C" Ref="C?"  Part="1" 
AR Path="/5D7E2B0A/5D7E822C" Ref="C?"  Part="1" 
F 0 "C?" H 4009 7196 50  0000 R CNN
F 1 "100nF" H 4009 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 7150 50  0001 C CNN
F 3 "~" H 4100 7150 50  0001 C CNN
	1    4100 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D7E8233
P 4450 7150
AR Path="/5D7E8233" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D7E8233" Ref="U?"  Part="2" 
AR Path="/5D7E2B0A/5D7E8233" Ref="U?"  Part="2" 
F 0 "U?" H 4629 7196 50  0000 L CNN
F 1 "74HC574" H 4629 7105 50  0000 L CNN
F 2 "alexios:SOIC-16W" H 4150 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4150 7100 50  0001 C CNN
	2    4450 7150
	1    0    0    -1  
$EndComp
Connection ~ 4100 7250
Connection ~ 4100 7050
$Comp
L power:GND #PWR?
U 1 1 5D7E823C
P 5550 7250
AR Path="/5D78E680/5D7E823C" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E823C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 7000 50  0001 C CNN
F 1 "GND" H 5555 7077 50  0000 C CNN
F 2 "" H 5550 7250 50  0001 C CNN
F 3 "" H 5550 7250 50  0001 C CNN
	1    5550 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D7E8242
P 5550 7050
AR Path="/5D78E680/5D7E8242" Ref="#PWR?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8242" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5550 6900 50  0001 C CNN
F 1 "+5V" H 5565 7223 50  0000 C CNN
F 2 "" H 5550 7050 50  0001 C CNN
F 3 "" H 5550 7050 50  0001 C CNN
	1    5550 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7E8248
P 5550 7150
AR Path="/5D78E680/5D7E8248" Ref="C?"  Part="1" 
AR Path="/5D7E2B0A/5D7E8248" Ref="C?"  Part="1" 
F 0 "C?" H 5459 7196 50  0000 R CNN
F 1 "100nF" H 5459 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 7150 50  0001 C CNN
F 3 "~" H 5550 7150 50  0001 C CNN
	1    5550 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D7E824F
P 5900 7150
AR Path="/5D7E824F" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D7E824F" Ref="U?"  Part="2" 
AR Path="/5D7E2B0A/5D7E824F" Ref="U?"  Part="2" 
F 0 "U?" H 6079 7196 50  0000 L CNN
F 1 "74HC574" H 6079 7105 50  0000 L CNN
F 2 "alexios:SOIC-16W" H 5600 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5600 7100 50  0001 C CNN
	2    5900 7150
	1    0    0    -1  
$EndComp
Connection ~ 5550 7250
Connection ~ 5550 7050
Wire Wire Line
	2750 3350 4250 3350
Wire Wire Line
	5950 3250 5950 3700
Entry Bus Bus
	3850 3600 3750 3500
Wire Bus Line
	3750 2000 3750 3500
Wire Bus Line
	7950 2450 7950 3500
Wire Bus Line
	5750 2000 5750 2950
$EndSCHEMATC
