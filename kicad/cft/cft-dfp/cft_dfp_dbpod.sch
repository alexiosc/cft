EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 13
Title ""
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
U 1 1 5D7935BA
P 1000 7100
AR Path="/5D78E680/5D7935BA" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D7935BA" Ref="#PWR0701"  Part="1" 
AR Path="/5D42FF4D/5D7935BA" Ref="#PWR0801"  Part="1" 
F 0 "#PWR0701" H 1000 6950 50  0001 C CNN
F 1 "+5V" H 1015 7273 50  0000 C CNN
F 2 "" H 1000 7100 50  0001 C CNN
F 3 "" H 1000 7100 50  0001 C CNN
	1    1000 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 679AA9D4
P 1000 7200
AR Path="/5D78E680/679AA9D4" Ref="C?"  Part="1" 
AR Path="/5D363063/679AA9D4" Ref="C701"  Part="1" 
AR Path="/5D42FF4D/679AA9D4" Ref="C801"  Part="1" 
F 0 "C701" H 909 7246 50  0000 R CNN
F 1 "100nF" H 909 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7200 50  0001 C CNN
F 3 "~" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601CFD75
P 2450 7300
AR Path="/5D78E680/601CFD75" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/601CFD75" Ref="#PWR0704"  Part="1" 
AR Path="/5D42FF4D/601CFD75" Ref="#PWR0804"  Part="1" 
F 0 "#PWR0704" H 2450 7050 50  0001 C CNN
F 1 "GND" H 2455 7127 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 679AA9D7
P 2450 7100
AR Path="/5D78E680/679AA9D7" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9D7" Ref="#PWR0703"  Part="1" 
AR Path="/5D42FF4D/679AA9D7" Ref="#PWR0803"  Part="1" 
F 0 "#PWR0703" H 2450 6950 50  0001 C CNN
F 1 "+5V" H 2465 7273 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CFD77
P 2450 7200
AR Path="/5D78E680/601CFD77" Ref="C?"  Part="1" 
AR Path="/5D363063/601CFD77" Ref="C702"  Part="1" 
AR Path="/5D42FF4D/601CFD77" Ref="C802"  Part="1" 
F 0 "C702" H 2359 7246 50  0000 R CNN
F 1 "100nF" H 2359 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7200 50  0001 C CNN
F 3 "~" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D409EE8
P 2800 7200
AR Path="/5D409EE8" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D409EE8" Ref="U?"  Part="2" 
AR Path="/5D363063/5D409EE8" Ref="U702"  Part="2" 
AR Path="/5D42FF4D/5D409EE8" Ref="U802"  Part="2" 
F 0 "U702" H 2979 7246 50  0000 L CNN
F 1 "74HC574" H 2979 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2500 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2500 7150 50  0001 C CNN
	2    2800 7200
	1    0    0    -1  
$EndComp
Connection ~ 2450 7300
Connection ~ 2450 7100
$Comp
L power:GND #PWR?
U 1 1 5D40D065
P 3900 7300
AR Path="/5D78E680/5D40D065" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D40D065" Ref="#PWR0706"  Part="1" 
AR Path="/5D42FF4D/5D40D065" Ref="#PWR0806"  Part="1" 
F 0 "#PWR0706" H 3900 7050 50  0001 C CNN
F 1 "GND" H 3905 7127 50  0000 C CNN
F 2 "" H 3900 7300 50  0001 C CNN
F 3 "" H 3900 7300 50  0001 C CNN
	1    3900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D40D06B
P 3900 7100
AR Path="/5D78E680/5D40D06B" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D40D06B" Ref="#PWR0705"  Part="1" 
AR Path="/5D42FF4D/5D40D06B" Ref="#PWR0805"  Part="1" 
F 0 "#PWR0705" H 3900 6950 50  0001 C CNN
F 1 "+5V" H 3915 7273 50  0000 C CNN
F 2 "" H 3900 7100 50  0001 C CNN
F 3 "" H 3900 7100 50  0001 C CNN
	1    3900 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CFD7B
P 3900 7200
AR Path="/5D78E680/601CFD7B" Ref="C?"  Part="1" 
AR Path="/5D363063/601CFD7B" Ref="C703"  Part="1" 
AR Path="/5D42FF4D/601CFD7B" Ref="C803"  Part="1" 
F 0 "C703" H 3809 7246 50  0000 R CNN
F 1 "100nF" H 3809 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 7200 50  0001 C CNN
F 3 "~" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 601CFD7C
P 4250 7200
AR Path="/601CFD7C" Ref="U?"  Part="1" 
AR Path="/5D78E680/601CFD7C" Ref="U?"  Part="2" 
AR Path="/5D363063/601CFD7C" Ref="U703"  Part="2" 
AR Path="/5D42FF4D/601CFD7C" Ref="U803"  Part="2" 
F 0 "U703" H 4429 7246 50  0000 L CNN
F 1 "74HC574" H 4429 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3950 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3950 7150 50  0001 C CNN
	2    4250 7200
	1    0    0    -1  
$EndComp
Connection ~ 3900 7300
Connection ~ 3900 7100
$Comp
L power:GND #PWR?
U 1 1 5D41016F
P 5350 7300
AR Path="/5D78E680/5D41016F" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D41016F" Ref="#PWR0708"  Part="1" 
AR Path="/5D42FF4D/5D41016F" Ref="#PWR0808"  Part="1" 
F 0 "#PWR0708" H 5350 7050 50  0001 C CNN
F 1 "GND" H 5355 7127 50  0000 C CNN
F 2 "" H 5350 7300 50  0001 C CNN
F 3 "" H 5350 7300 50  0001 C CNN
	1    5350 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D410175
P 5350 7100
AR Path="/5D78E680/5D410175" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D410175" Ref="#PWR0707"  Part="1" 
AR Path="/5D42FF4D/5D410175" Ref="#PWR0807"  Part="1" 
F 0 "#PWR0707" H 5350 6950 50  0001 C CNN
F 1 "+5V" H 5365 7273 50  0000 C CNN
F 2 "" H 5350 7100 50  0001 C CNN
F 3 "" H 5350 7100 50  0001 C CNN
	1    5350 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D41017B
P 5350 7200
AR Path="/5D78E680/5D41017B" Ref="C?"  Part="1" 
AR Path="/5D363063/5D41017B" Ref="C704"  Part="1" 
AR Path="/5D42FF4D/5D41017B" Ref="C804"  Part="1" 
F 0 "C704" H 5259 7246 50  0000 R CNN
F 1 "100nF" H 5259 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 7200 50  0001 C CNN
F 3 "~" H 5350 7200 50  0001 C CNN
	1    5350 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 679AA9D2
P 5700 7200
AR Path="/679AA9D2" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9D2" Ref="U?"  Part="2" 
AR Path="/5D363063/679AA9D2" Ref="U704"  Part="2" 
AR Path="/5D42FF4D/679AA9D2" Ref="U804"  Part="2" 
F 0 "U704" H 5879 7246 50  0000 L CNN
F 1 "74HC574" H 5879 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5400 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5400 7150 50  0001 C CNN
	2    5700 7200
	1    0    0    -1  
$EndComp
Connection ~ 5350 7100
Wire Wire Line
	5650 4550 6300 4550
Wire Wire Line
	5650 4450 6300 4450
Wire Wire Line
	5650 4350 6300 4350
Wire Wire Line
	5650 4250 6300 4250
Wire Wire Line
	5650 4150 6300 4150
Wire Wire Line
	5650 4050 6300 4050
Wire Wire Line
	5650 3950 6300 3950
Wire Wire Line
	5650 3850 6300 3850
Wire Wire Line
	5650 3100 6300 3100
Wire Wire Line
	5650 3000 6300 3000
Wire Wire Line
	5650 2900 6300 2900
Wire Wire Line
	5650 2800 6300 2800
Wire Wire Line
	5650 2700 6300 2700
Wire Wire Line
	5650 2600 6300 2600
Wire Wire Line
	5650 2500 6300 2500
Wire Wire Line
	5650 2400 6300 2400
Text Label 6250 4550 2    50   ~ 0
DB15
Text Label 6250 4450 2    50   ~ 0
DB14
Text Label 6250 4350 2    50   ~ 0
DB13
Text Label 6250 4250 2    50   ~ 0
DB12
Text Label 6250 4150 2    50   ~ 0
DB11
Text Label 6250 4050 2    50   ~ 0
DB10
Text Label 6250 3950 2    50   ~ 0
DB9
Text Label 6250 3850 2    50   ~ 0
DB8
Text Label 6250 3100 2    50   ~ 0
DB7
Text Label 6250 3000 2    50   ~ 0
DB6
Text Label 6250 2900 2    50   ~ 0
DB5
Text Label 6250 2800 2    50   ~ 0
DB4
Text Label 6250 2700 2    50   ~ 0
DB3
Text Label 6250 2600 2    50   ~ 0
DB2
Text Label 6250 2500 2    50   ~ 0
DB1
Text Label 6250 2400 2    50   ~ 0
DB0
Text Label 5100 4550 0    50   ~ 0
DB15
Text Label 5100 4450 0    50   ~ 0
DB14
Text Label 5100 4350 0    50   ~ 0
DB13
Text Label 5100 4250 0    50   ~ 0
DB12
Text Label 5100 4150 0    50   ~ 0
DB11
Text Label 5100 4050 0    50   ~ 0
DB10
Text Label 5100 3950 0    50   ~ 0
DB9
Text Label 5100 3850 0    50   ~ 0
DB8
Text Label 5100 3100 0    50   ~ 0
DB7
Text Label 5100 3000 0    50   ~ 0
DB6
Text Label 5100 2900 0    50   ~ 0
DB5
Text Label 5100 2800 0    50   ~ 0
DB4
Text Label 5100 2700 0    50   ~ 0
DB3
Text Label 5100 2600 0    50   ~ 0
DB2
Text Label 5100 2500 0    50   ~ 0
DB1
Text Label 5100 2400 0    50   ~ 0
DB0
Wire Wire Line
	5050 4550 5450 4550
Wire Wire Line
	5050 4450 5450 4450
Wire Wire Line
	5050 4350 5450 4350
Wire Wire Line
	5050 4250 5450 4250
Wire Wire Line
	5050 4150 5450 4150
Wire Wire Line
	5050 4050 5450 4050
Wire Wire Line
	5050 3950 5450 3950
Wire Wire Line
	5050 3850 5450 3850
Wire Wire Line
	5050 3100 5450 3100
Wire Wire Line
	5050 3000 5450 3000
Wire Wire Line
	5050 2900 5450 2900
Wire Wire Line
	5050 2800 5450 2800
Wire Wire Line
	5050 2700 5450 2700
Wire Wire Line
	5050 2600 5450 2600
Wire Wire Line
	5050 2500 5450 2500
Wire Wire Line
	5050 2400 5450 2400
Wire Wire Line
	5750 4750 5750 5300
Text Label 4000 4750 2    50   ~ 0
CPH
Wire Wire Line
	5950 4850 6300 4850
Connection ~ 5750 4750
Wire Wire Line
	5750 4750 6300 4750
Wire Bus Line
	3650 5150 7700 5150
Entry Wire Line
	5650 3850 5550 3750
Entry Wire Line
	5650 4550 5550 4450
Entry Wire Line
	5650 4450 5550 4350
Entry Wire Line
	5650 4350 5550 4250
Entry Wire Line
	5650 4250 5550 4150
Entry Wire Line
	5650 4150 5550 4050
Entry Wire Line
	5650 4050 5550 3950
Entry Wire Line
	5650 3950 5550 3850
Entry Wire Line
	5650 2400 5550 2300
Entry Wire Line
	5650 3100 5550 3000
Entry Wire Line
	5650 3000 5550 2900
Entry Wire Line
	5650 2900 5550 2800
Entry Wire Line
	5650 2800 5550 2700
Entry Wire Line
	5650 2700 5550 2600
Entry Wire Line
	5650 2600 5550 2500
Entry Wire Line
	5650 2500 5550 2400
Wire Wire Line
	5850 3400 6300 3400
Wire Wire Line
	5750 3300 5750 4750
Text Label 6250 4850 2    50   ~ 0
~RH
Text Label 2650 5500 0    50   ~ 0
~RH
Text HLabel 2550 5500 0    50   3State ~ 0
~RH
Wire Wire Line
	3750 3400 3750 4850
Text HLabel 2550 4750 0    50   Input ~ 0
CPH
Text Label 2650 4750 0    50   ~ 0
CPH
Wire Wire Line
	4050 4750 2550 4750
Text Label 4000 4850 2    50   ~ 0
~OE
Text Label 4000 3400 2    50   ~ 0
~OE
Text Label 4000 3300 2    50   ~ 0
CPL
Text HLabel 2550 5400 0    50   Input ~ 0
~RL
Text Label 2650 5400 0    50   ~ 0
~RL
Wire Wire Line
	5950 5500 2550 5500
Wire Wire Line
	5950 4850 5950 5500
Wire Wire Line
	5850 5400 2550 5400
Wire Wire Line
	5850 3400 5850 5400
Text Label 2650 5300 0    50   ~ 0
BUSCP
Wire Wire Line
	5750 3300 6300 3300
Wire Wire Line
	5750 5300 2550 5300
Text Label 7350 4550 0    50   ~ 0
FPD7
Text Label 7350 4450 0    50   ~ 0
FPD6
Text Label 7350 4350 0    50   ~ 0
FPD5
Text Label 7350 4250 0    50   ~ 0
FPD4
Text Label 7350 4150 0    50   ~ 0
FPD3
Text Label 7350 4050 0    50   ~ 0
FPD2
Text Label 7350 3950 0    50   ~ 0
FPD1
Text Label 7350 3850 0    50   ~ 0
FPD0
Wire Wire Line
	7700 4550 7300 4550
Wire Wire Line
	7300 3850 7700 3850
Wire Wire Line
	7300 3950 7700 3950
Wire Wire Line
	7300 4050 7700 4050
Wire Wire Line
	7300 4150 7700 4150
Wire Wire Line
	7300 4250 7700 4250
Wire Wire Line
	7300 4350 7700 4350
Wire Wire Line
	7300 4450 7700 4450
Text Label 7350 3100 0    50   ~ 0
FPD7
Text Label 7350 3000 0    50   ~ 0
FPD6
Text Label 7350 2900 0    50   ~ 0
FPD5
Text Label 7350 2800 0    50   ~ 0
FPD4
Text Label 7350 2700 0    50   ~ 0
FPD3
Text Label 7350 2600 0    50   ~ 0
FPD2
Text Label 7350 2500 0    50   ~ 0
FPD1
Text Label 7350 2400 0    50   ~ 0
FPD0
Wire Wire Line
	7700 3100 7300 3100
Wire Wire Line
	7300 2400 7700 2400
Wire Wire Line
	7300 2500 7700 2500
Wire Wire Line
	7300 2600 7700 2600
Wire Wire Line
	7300 2700 7700 2700
Wire Wire Line
	7300 2800 7700 2800
Wire Wire Line
	7300 2900 7700 2900
Wire Wire Line
	7300 3000 7700 3000
Entry Wire Line
	3650 3850 3550 3750
Entry Wire Line
	3650 3950 3550 3850
Entry Wire Line
	3650 4550 3550 4450
Entry Wire Line
	3650 4450 3550 4350
Entry Wire Line
	3650 4350 3550 4250
Entry Wire Line
	3650 4250 3550 4150
Entry Wire Line
	3650 4150 3550 4050
Entry Wire Line
	3650 4050 3550 3950
Text HLabel 2550 3300 0    50   Input ~ 0
CPL
Text HLabel 2550 3400 0    50   Input ~ 0
~OE
Wire Wire Line
	3750 3400 2550 3400
Connection ~ 3750 3400
Text HLabel 2550 1950 0    50   3State ~ 0
FPD[0..7]
Text Label 2650 1950 0    50   ~ 0
FPD[0..7]
Wire Bus Line
	3450 1950 2550 1950
Entry Bus Bus
	3450 1950 3550 2050
Entry Bus Bus
	7700 5150 7800 5050
Entry Bus Bus
	3550 5050 3650 5150
Text HLabel 9250 1950 2    50   BiDi ~ 0
DB[0..15]
Wire Bus Line
	5650 1950 9250 1950
Entry Bus Bus
	5550 2050 5650 1950
Text Label 2650 3300 0    50   ~ 0
CPL
Text Label 6250 4750 2    50   ~ 0
BUSCP
Text Label 6250 3300 2    50   ~ 0
BUSCP
Text Label 6250 3400 2    50   ~ 0
~RL
Wire Wire Line
	4050 3300 2550 3300
Wire Wire Line
	4050 4850 3750 4850
Text Label 2650 3400 0    50   ~ 0
~OE
Wire Wire Line
	4050 3400 3750 3400
$Comp
L alexios:74HC574 U?
U 1 1 679AA9DE
P 6800 4350
AR Path="/679AA9DE" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9DE" Ref="U?"  Part="1" 
AR Path="/5D363063/679AA9DE" Ref="U704"  Part="1" 
AR Path="/5D42FF4D/679AA9DE" Ref="U804"  Part="1" 
F 0 "U704" H 6800 5117 50  0000 C CNN
F 1 "74HC574" H 6800 5026 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6500 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6500 4300 50  0001 C CNN
	1    6800 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 679AA9DD
P 6800 2900
AR Path="/679AA9DD" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9DD" Ref="U?"  Part="1" 
AR Path="/5D363063/679AA9DD" Ref="U703"  Part="1" 
AR Path="/5D42FF4D/679AA9DD" Ref="U803"  Part="1" 
F 0 "U703" H 6800 3667 50  0000 C CNN
F 1 "74HC574" H 6800 3576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6500 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6500 2850 50  0001 C CNN
	1    6800 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 679AA9DC
P 4550 4350
AR Path="/679AA9DC" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9DC" Ref="U?"  Part="1" 
AR Path="/5D363063/679AA9DC" Ref="U702"  Part="1" 
AR Path="/5D42FF4D/679AA9DC" Ref="U802"  Part="1" 
F 0 "U702" H 4550 5117 50  0000 C CNN
F 1 "74HC574" H 4550 5026 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4250 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4250 4300 50  0001 C CNN
	1    4550 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 601CFD7D
P 4550 2900
AR Path="/601CFD7D" Ref="U?"  Part="1" 
AR Path="/5D78E680/601CFD7D" Ref="U?"  Part="1" 
AR Path="/5D363063/601CFD7D" Ref="U701"  Part="1" 
AR Path="/5D42FF4D/601CFD7D" Ref="U801"  Part="1" 
F 0 "U701" H 4550 3667 50  0000 C CNN
F 1 "74HC574" H 4550 3576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4250 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4250 2850 50  0001 C CNN
	1    4550 2900
	1    0    0    -1  
$EndComp
Entry Wire Line
	5450 3850 5550 3750
Entry Wire Line
	5450 2400 5550 2300
Entry Wire Line
	7700 4550 7800 4650
Entry Wire Line
	7700 4450 7800 4550
Entry Wire Line
	7700 3850 7800 3950
Entry Wire Line
	7700 3950 7800 4050
Entry Wire Line
	7700 4050 7800 4150
Entry Wire Line
	7700 4150 7800 4250
Entry Wire Line
	7700 4250 7800 4350
Entry Wire Line
	7700 4350 7800 4450
Entry Wire Line
	5450 3100 5550 3000
Entry Wire Line
	5450 3000 5550 2900
Entry Wire Line
	5450 2900 5550 2800
Entry Wire Line
	5450 2800 5550 2700
Entry Wire Line
	5450 2700 5550 2600
Entry Wire Line
	5450 2600 5550 2500
Entry Wire Line
	5450 2500 5550 2400
Entry Wire Line
	5650 3100 5550 3000
Entry Wire Line
	5650 3000 5550 2900
Entry Wire Line
	5650 2900 5550 2800
Entry Wire Line
	5650 2800 5550 2700
Entry Wire Line
	5650 2700 5550 2600
Entry Wire Line
	5650 2600 5550 2500
Entry Wire Line
	5650 2500 5550 2400
Entry Wire Line
	5650 2400 5550 2300
Entry Wire Line
	7700 3100 7800 3200
Entry Wire Line
	7700 3000 7800 3100
Entry Wire Line
	7700 2400 7800 2500
Entry Wire Line
	7700 2500 7800 2600
Entry Wire Line
	7700 2600 7800 2700
Entry Wire Line
	7700 2700 7800 2800
Entry Wire Line
	7700 2800 7800 2900
Entry Wire Line
	7700 2900 7800 3000
Wire Wire Line
	3650 3100 4050 3100
Entry Wire Line
	3650 2400 3550 2300
Entry Wire Line
	3650 2500 3550 2400
Entry Wire Line
	5450 4550 5550 4450
Entry Wire Line
	5450 4450 5550 4350
Entry Wire Line
	5450 4350 5550 4250
Entry Wire Line
	5450 4250 5550 4150
Entry Wire Line
	5450 4150 5550 4050
Entry Wire Line
	5450 4050 5550 3950
Entry Wire Line
	5450 3950 5550 3850
Entry Wire Line
	5650 4550 5550 4450
Entry Wire Line
	5650 4450 5550 4350
Entry Wire Line
	5650 4350 5550 4250
Entry Wire Line
	5650 4250 5550 4150
Entry Wire Line
	5650 4150 5550 4050
Entry Wire Line
	5650 4050 5550 3950
Entry Wire Line
	5650 3950 5550 3850
Entry Wire Line
	5650 3850 5550 3750
Wire Wire Line
	4050 2400 3650 2400
Wire Wire Line
	4050 2500 3650 2500
Wire Wire Line
	4050 2600 3650 2600
Wire Wire Line
	4050 2700 3650 2700
Wire Wire Line
	4050 2800 3650 2800
Wire Wire Line
	4050 2900 3650 2900
Wire Wire Line
	4050 3000 3650 3000
Entry Wire Line
	3650 3100 3550 3000
Entry Wire Line
	3650 3000 3550 2900
Entry Wire Line
	3650 2900 3550 2800
Entry Wire Line
	3650 2800 3550 2700
Entry Wire Line
	3650 2700 3550 2600
Entry Wire Line
	3650 2600 3550 2500
Connection ~ 1000 7100
$Comp
L alexios:74HC574 U?
U 2 1 601CFD74
P 1350 7200
AR Path="/601CFD74" Ref="U?"  Part="1" 
AR Path="/5D78E680/601CFD74" Ref="U?"  Part="2" 
AR Path="/5D363063/601CFD74" Ref="U701"  Part="2" 
AR Path="/5D42FF4D/601CFD74" Ref="U801"  Part="2" 
F 0 "U701" H 1529 7246 50  0000 L CNN
F 1 "74HC574" H 1529 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1050 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1050 7150 50  0001 C CNN
	2    1350 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 679AA9DF
P 1000 7300
AR Path="/5D78E680/679AA9DF" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9DF" Ref="#PWR0137"  Part="1" 
AR Path="/5D42FF4D/679AA9DF" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0137" H 1000 7050 50  0001 C CNN
F 1 "GND" H 1005 7127 50  0000 C CNN
F 2 "" H 1000 7300 50  0001 C CNN
F 3 "" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
Connection ~ 1000 7300
Text Label 4050 2400 2    50   ~ 0
FPD0
Text Label 4050 2500 2    50   ~ 0
FPD1
Text Label 4050 2600 2    50   ~ 0
FPD2
Text Label 4050 2700 2    50   ~ 0
FPD3
Text Label 4050 2800 2    50   ~ 0
FPD4
Text Label 4050 2900 2    50   ~ 0
FPD5
Text Label 4050 3000 2    50   ~ 0
FPD6
Text Label 4050 3100 2    50   ~ 0
FPD7
Text Label 4000 4550 2    50   ~ 0
FPD7
Text Label 4000 4450 2    50   ~ 0
FPD6
Text Label 4000 4350 2    50   ~ 0
FPD5
Text Label 4000 4250 2    50   ~ 0
FPD4
Text Label 4000 4150 2    50   ~ 0
FPD3
Text Label 4000 4050 2    50   ~ 0
FPD2
Text Label 4000 3950 2    50   ~ 0
FPD1
Text Label 4000 3850 2    50   ~ 0
FPD0
Wire Wire Line
	3650 4550 4050 4550
Wire Wire Line
	4050 3850 3650 3850
Wire Wire Line
	4050 3950 3650 3950
Wire Wire Line
	4050 4050 3650 4050
Wire Wire Line
	4050 4150 3650 4150
Wire Wire Line
	4050 4250 3650 4250
Wire Wire Line
	4050 4350 3650 4350
Wire Wire Line
	4050 4450 3650 4450
Text HLabel 2550 5300 0    50   Input ~ 0
BUSCP
Connection ~ 5350 7300
Wire Bus Line
	5550 2050 5550 4450
Wire Bus Line
	3550 2050 3550 5050
Wire Bus Line
	7800 2500 7800 5050
$EndSCHEMATC
