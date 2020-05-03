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
P 950 6550
AR Path="/5CC0D65F/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD30D3D" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD30D3D" Ref="C41"  Part="1" 
F 0 "C41" H 859 6596 50  0000 R CNN
F 1 "100nF" H 859 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6550 50  0001 C CNN
F 3 "~" H 950 6550 50  0001 C CNN
	1    950  6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD30D43
P 950 6650
AR Path="/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD30D43" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD30D43" Ref="#PWR0209"  Part="1" 
F 0 "#PWR0209" H 950 6400 50  0001 C CNN
F 1 "GND" H 955 6477 50  0000 C CNN
F 2 "" H 950 6650 50  0001 C CNN
F 3 "" H 950 6650 50  0001 C CNN
	1    950  6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD30D49
P 950 6450
AR Path="/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD30D49" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD30D49" Ref="#PWR0210"  Part="1" 
F 0 "#PWR0210" H 950 6300 50  0001 C CNN
F 1 "+5V" H 965 6623 50  0000 C CNN
F 2 "" H 950 6450 50  0001 C CNN
F 3 "" H 950 6450 50  0001 C CNN
	1    950  6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5DD31892
P 1300 6550
AR Path="/5DC89E19/5DD31892" Ref="U?"  Part="1" 
AR Path="/5DD31892" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD31892" Ref="U39"  Part="2" 
F 0 "U39" H 1480 6596 50  0000 L CNN
F 1 "74AC138" H 1480 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 6550 50  0001 C CNN
	2    1300 6550
	1    0    0    -1  
$EndComp
Connection ~ 950  6450
Connection ~ 950  6650
$Comp
L Device:C_Small C?
U 1 1 5DD377BE
P 2300 6550
AR Path="/5CC0D65F/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD377BE" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD377BE" Ref="C42"  Part="1" 
F 0 "C42" H 2209 6596 50  0000 R CNN
F 1 "100nF" H 2209 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 6550 50  0001 C CNN
F 3 "~" H 2300 6550 50  0001 C CNN
	1    2300 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD377C4
P 2300 6650
AR Path="/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD377C4" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD377C4" Ref="#PWR0211"  Part="1" 
F 0 "#PWR0211" H 2300 6400 50  0001 C CNN
F 1 "GND" H 2305 6477 50  0000 C CNN
F 2 "" H 2300 6650 50  0001 C CNN
F 3 "" H 2300 6650 50  0001 C CNN
	1    2300 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD377CA
P 2300 6450
AR Path="/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD377CA" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD377CA" Ref="#PWR0212"  Part="1" 
F 0 "#PWR0212" H 2300 6300 50  0001 C CNN
F 1 "+5V" H 2315 6623 50  0000 C CNN
F 2 "" H 2300 6450 50  0001 C CNN
F 3 "" H 2300 6450 50  0001 C CNN
	1    2300 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3B114
P 3700 6550
AR Path="/5CC0D65F/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD3B114" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD3B114" Ref="C43"  Part="1" 
F 0 "C43" H 3609 6596 50  0000 R CNN
F 1 "100nF" H 3609 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 6550 50  0001 C CNN
F 3 "~" H 3700 6550 50  0001 C CNN
	1    3700 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3B11A
P 3700 6650
AR Path="/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B11A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B11A" Ref="#PWR0213"  Part="1" 
F 0 "#PWR0213" H 3700 6400 50  0001 C CNN
F 1 "GND" H 3705 6477 50  0000 C CNN
F 2 "" H 3700 6650 50  0001 C CNN
F 3 "" H 3700 6650 50  0001 C CNN
	1    3700 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3B120
P 3700 6450
AR Path="/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B120" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B120" Ref="#PWR0214"  Part="1" 
F 0 "#PWR0214" H 3700 6300 50  0001 C CNN
F 1 "+5V" H 3715 6623 50  0000 C CNN
F 2 "" H 3700 6450 50  0001 C CNN
F 3 "" H 3700 6450 50  0001 C CNN
	1    3700 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DD3B12E
P 5050 6550
AR Path="/5CC0D65F/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5DD3B12E" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5DD3B12E" Ref="C44"  Part="1" 
F 0 "C44" H 4959 6596 50  0000 R CNN
F 1 "100nF" H 4959 6505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 6550 50  0001 C CNN
F 3 "~" H 5050 6550 50  0001 C CNN
	1    5050 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD3B134
P 5050 6650
AR Path="/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B134" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B134" Ref="#PWR0215"  Part="1" 
F 0 "#PWR0215" H 5050 6400 50  0001 C CNN
F 1 "GND" H 5055 6477 50  0000 C CNN
F 2 "" H 5050 6650 50  0001 C CNN
F 3 "" H 5050 6650 50  0001 C CNN
	1    5050 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD3B13A
P 5050 6450
AR Path="/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5DD3B13A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5DD3B13A" Ref="#PWR0216"  Part="1" 
F 0 "#PWR0216" H 5050 6300 50  0001 C CNN
F 1 "+5V" H 5065 6623 50  0000 C CNN
F 2 "" H 5050 6450 50  0001 C CNN
F 3 "" H 5050 6450 50  0001 C CNN
	1    5050 6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5DD3D389
P 2650 6550
AR Path="/5DC89E19/5DD3D389" Ref="U?"  Part="1" 
AR Path="/5DD3D389" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3D389" Ref="U40"  Part="2" 
F 0 "U40" H 2830 6596 50  0000 L CNN
F 1 "74HC138" H 2830 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2650 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2650 6550 50  0001 C CNN
	2    2650 6550
	1    0    0    -1  
$EndComp
Connection ~ 2300 6450
Connection ~ 2300 6650
$Comp
L alexios:74HC138 U?
U 2 1 5DD3E064
P 4050 6550
AR Path="/5DC89E19/5DD3E064" Ref="U?"  Part="1" 
AR Path="/5DD3E064" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3E064" Ref="U41"  Part="2" 
F 0 "U41" H 4230 6596 50  0000 L CNN
F 1 "74HC138" H 4230 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4050 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4050 6550 50  0001 C CNN
	2    4050 6550
	1    0    0    -1  
$EndComp
Connection ~ 3700 6450
Connection ~ 3700 6650
$Comp
L alexios:74HC138 U?
U 2 1 5DD3EDFA
P 5400 6550
AR Path="/5DC89E19/5DD3EDFA" Ref="U?"  Part="1" 
AR Path="/5DD3EDFA" Ref="U?"  Part="1" 
AR Path="/5E1C970B/5DD3EDFA" Ref="U42"  Part="2" 
F 0 "U42" H 5580 6596 50  0000 L CNN
F 1 "74HC138" H 5580 6505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5400 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5400 6550 50  0001 C CNN
	2    5400 6550
	1    0    0    -1  
$EndComp
Connection ~ 5050 6450
Connection ~ 5050 6650
$Comp
L alexios:74LVC1G07 U49
U 1 1 5FB003C0
P 9600 3300
F 0 "U49" H 9650 3567 50  0000 C CNN
F 1 "74LVC1G07" H 9650 3476 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9700 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9700 3300 50  0001 C CNN
	1    9600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3300 10250 3300
Text Label 10250 3300 2    50   ~ 0
~WS
Wire Wire Line
	8250 4300 8200 4300
Wire Wire Line
	8250 3300 8150 3300
Wire Wire Line
	8150 3300 8150 3400
Wire Wire Line
	8250 3400 8150 3400
Connection ~ 8150 3400
Wire Wire Line
	8150 3400 8150 3500
Wire Wire Line
	8250 3500 8150 3500
Connection ~ 8150 3500
Wire Wire Line
	8150 3500 8150 3600
Wire Wire Line
	8250 3600 8150 3600
Connection ~ 8150 3600
$Comp
L power:GND #PWR015
U 1 1 5EB185E8
P 8150 3650
F 0 "#PWR015" H 8150 3400 50  0001 C CNN
F 1 "GND" H 8000 3650 50  0000 C CNN
F 2 "" H 8150 3650 50  0001 C CNN
F 3 "" H 8150 3650 50  0001 C CNN
	1    8150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3600 8150 3650
Wire Wire Line
	8250 4100 7500 4100
Text Label 7550 4100 0    50   ~ 0
CLK3
$Comp
L alexios:74HC161 U50
U 1 1 5EB26D9B
P 8750 3800
F 0 "U50" H 8750 4567 50  0000 C CNN
F 1 "74HC161" H 8750 4476 50  0000 C CNN
F 2 "alexios:SOIC-16" H 9050 4050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 9050 4050 50  0001 C CNN
	1    8750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3400 9400 3400
Wire Wire Line
	9250 3300 9400 3300
$Comp
L alexios:74LVC1G04 U51
U 1 1 5FB4799E
P 8650 4600
F 0 "U51" H 8600 4775 50  0000 C CNN
F 1 "74LVC1G04" H 8600 4866 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8650 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 8650 4600 50  0001 C CNN
	1    8650 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4600 8450 4600
Wire Wire Line
	8200 4300 8200 4600
Wire Wire Line
	8950 4600 9400 4600
Wire Wire Line
	9400 3400 9400 4600
NoConn ~ 9250 3500
NoConn ~ 9250 3600
NoConn ~ 9250 3800
Text Label 7550 3800 0    50   ~ 0
~RSTHOLD
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
Wire Wire Line
	6800 3900 8150 3900
Wire Wire Line
	8150 3900 8150 4000
Wire Wire Line
	8150 4000 8250 4000
Connection ~ 8150 3900
Wire Wire Line
	8150 3900 8250 3900
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
Wire Wire Line
	3700 1500 4700 1500
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
	4700 1500 4700 2250
Connection ~ 4700 1500
Wire Wire Line
	4700 1500 4850 1500
Text Label 4900 2250 0    50   ~ 0
~ALU-OP
Text Label 7550 3900 0    50   ~ 0
WSEN
Wire Wire Line
	4700 2250 5750 2250
Wire Wire Line
	6250 2250 6800 2250
Wire Wire Line
	6800 2250 6800 3900
Text Label 6350 2250 0    50   ~ 0
WSEN
$Comp
L power:+5V #PWR?
U 1 1 5EC18A60
P 3650 7150
AR Path="/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC18A60" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC18A60" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 3650 7000 50  0001 C CNN
F 1 "+5V" H 3665 7323 50  0000 C CNN
F 2 "" H 3650 7150 50  0001 C CNN
F 3 "" H 3650 7150 50  0001 C CNN
	1    3650 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC18A5A
P 3650 7350
AR Path="/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC18A5A" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC18A5A" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 3650 7100 50  0001 C CNN
F 1 "GND" H 3655 7177 50  0000 C CNN
F 2 "" H 3650 7350 50  0001 C CNN
F 3 "" H 3650 7350 50  0001 C CNN
	1    3650 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EC18A54
P 3650 7250
AR Path="/5CC0D65F/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5EC18A54" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5EC18A54" Ref="C54"  Part="1" 
F 0 "C54" H 3559 7296 50  0000 R CNN
F 1 "100nF" H 3559 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7250 50  0001 C CNN
F 3 "~" H 3650 7250 50  0001 C CNN
	1    3650 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EC15497
P 5000 7150
AR Path="/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC15497" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC15497" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 5000 7000 50  0001 C CNN
F 1 "+5V" H 5015 7323 50  0000 C CNN
F 2 "" H 5000 7150 50  0001 C CNN
F 3 "" H 5000 7150 50  0001 C CNN
	1    5000 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC15491
P 5000 7350
AR Path="/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC15491" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC15491" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 5000 7100 50  0001 C CNN
F 1 "GND" H 5005 7177 50  0000 C CNN
F 2 "" H 5000 7350 50  0001 C CNN
F 3 "" H 5000 7350 50  0001 C CNN
	1    5000 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EC1548B
P 5000 7250
AR Path="/5CC0D65F/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5EC1548B" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5EC1548B" Ref="C55"  Part="1" 
F 0 "C55" H 4909 7296 50  0000 R CNN
F 1 "100nF" H 4909 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 7250 50  0001 C CNN
F 3 "~" H 5000 7250 50  0001 C CNN
	1    5000 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G07 U49
U 2 1 5EC091AD
P 5350 7150
F 0 "U49" H 5530 7096 50  0000 L CNN
F 1 "74LVC1G07" H 5530 7005 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5450 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5450 7150 50  0001 C CNN
	2    5350 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U51
U 2 1 5EC04FC3
P 4000 7250
F 0 "U51" H 4180 7296 50  0000 L CNN
F 1 "74LVC1G04" H 4180 7205 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4000 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 4000 7250 50  0001 C CNN
	2    4000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EC1C08E
P 2300 7150
AR Path="/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC1C08E" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC1C08E" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 2300 7000 50  0001 C CNN
F 1 "+5V" H 2315 7323 50  0000 C CNN
F 2 "" H 2300 7150 50  0001 C CNN
F 3 "" H 2300 7150 50  0001 C CNN
	1    2300 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC1C088
P 2300 7350
AR Path="/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC1C088" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC1C088" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 2300 7100 50  0001 C CNN
F 1 "GND" H 2305 7177 50  0000 C CNN
F 2 "" H 2300 7350 50  0001 C CNN
F 3 "" H 2300 7350 50  0001 C CNN
	1    2300 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EC1C082
P 2300 7250
AR Path="/5CC0D65F/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5EC1C082" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5EC1C082" Ref="C53"  Part="1" 
F 0 "C53" H 2209 7296 50  0000 R CNN
F 1 "100nF" H 2209 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7250 50  0001 C CNN
F 3 "~" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
Connection ~ 950  7350
Connection ~ 950  7150
$Comp
L power:+5V #PWR?
U 1 1 5EC0C8D9
P 950 7150
AR Path="/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC0C8D9" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC0C8D9" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 950 7000 50  0001 C CNN
F 1 "+5V" H 965 7323 50  0000 C CNN
F 2 "" H 950 7150 50  0001 C CNN
F 3 "" H 950 7150 50  0001 C CNN
	1    950  7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC0C8D3
P 950 7350
AR Path="/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC0C8D3" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/5EC0C8D3" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 950 7100 50  0001 C CNN
F 1 "GND" H 955 7177 50  0000 C CNN
F 2 "" H 950 7350 50  0001 C CNN
F 3 "" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EC0C8CD
P 950 7250
AR Path="/5CC0D65F/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5EC0C8CD" Ref="C?"  Part="1" 
AR Path="/5E1C970B/5EC0C8CD" Ref="C52"  Part="1" 
F 0 "C52" H 859 7296 50  0000 R CNN
F 1 "100nF" H 859 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7250 50  0001 C CNN
F 3 "~" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC161 U50
U 2 1 5EC0428D
P 2650 7650
F 0 "U50" H 2830 8096 50  0000 L CNN
F 1 "74HC161" H 2830 8005 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2950 7900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC161.pdf" H 2950 7900 50  0001 C CNN
	2    2650 7650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U48
U 2 1 5EC03D4A
P 1300 7250
F 0 "U48" H 1480 7296 50  0000 L CNN
F 1 "74LVC1G04" H 1480 7205 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1300 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 1300 7250 50  0001 C CNN
	2    1300 7250
	1    0    0    -1  
$EndComp
Connection ~ 2300 7150
Connection ~ 2300 7350
Connection ~ 3650 7150
Connection ~ 3650 7350
Connection ~ 5000 7150
Connection ~ 5000 7350
Text HLabel 7500 4100 0    50   Input ~ 0
CLK3
Text HLabel 7500 3800 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	7500 3800 8250 3800
Wire Bus Line
	7900 1350 7900 2100
Wire Bus Line
	2250 4650 2250 5400
Wire Bus Line
	2250 1850 2250 3900
$EndSCHEMATC
