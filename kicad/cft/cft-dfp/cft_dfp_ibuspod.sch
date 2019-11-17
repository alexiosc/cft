EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 13
Title "IBus Pod (16-bit I/O)"
Date "2019-11-17"
Rev "1945"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 679AA9D3
P 1000 7100
AR Path="/5D78E680/679AA9D3" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9D3" Ref="#PWR0701"  Part="1" 
AR Path="/5D42FF4D/679AA9D3" Ref="#PWR0801"  Part="1" 
F 0 "#PWR0801" H 1000 6950 50  0001 C CNN
F 1 "+5V" H 1015 7273 50  0000 C CNN
F 2 "" H 1000 7100 50  0001 C CNN
F 3 "" H 1000 7100 50  0001 C CNN
	1    1000 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D7935C0
P 1000 7200
AR Path="/5D78E680/5D7935C0" Ref="C?"  Part="1" 
AR Path="/5D363063/5D7935C0" Ref="C701"  Part="1" 
AR Path="/5D42FF4D/5D7935C0" Ref="C801"  Part="1" 
F 0 "C801" H 909 7246 50  0000 R CNN
F 1 "100nF" H 909 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7200 50  0001 C CNN
F 3 "~" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 679AA9D6
P 2450 7300
AR Path="/5D78E680/679AA9D6" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9D6" Ref="#PWR0704"  Part="1" 
AR Path="/5D42FF4D/679AA9D6" Ref="#PWR0804"  Part="1" 
F 0 "#PWR0804" H 2450 7050 50  0001 C CNN
F 1 "GND" H 2455 7127 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 601CFD76
P 2450 7100
AR Path="/5D78E680/601CFD76" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/601CFD76" Ref="#PWR0703"  Part="1" 
AR Path="/5D42FF4D/601CFD76" Ref="#PWR0803"  Part="1" 
F 0 "#PWR0803" H 2450 6950 50  0001 C CNN
F 1 "+5V" H 2465 7273 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 679AA9D8
P 2450 7200
AR Path="/5D78E680/679AA9D8" Ref="C?"  Part="1" 
AR Path="/5D363063/679AA9D8" Ref="C702"  Part="1" 
AR Path="/5D42FF4D/679AA9D8" Ref="C802"  Part="1" 
F 0 "C802" H 2359 7246 50  0000 R CNN
F 1 "100nF" H 2359 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7200 50  0001 C CNN
F 3 "~" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 679AA9CC
P 2800 7200
AR Path="/679AA9CC" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9CC" Ref="U?"  Part="2" 
AR Path="/5D363063/679AA9CC" Ref="U702"  Part="2" 
AR Path="/5D42FF4D/679AA9CC" Ref="U802"  Part="2" 
F 0 "U802" H 2979 7246 50  0000 L CNN
F 1 "74HC574" H 2979 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2500 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2500 7150 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    2800 7200
	1    0    0    -1  
$EndComp
Connection ~ 2450 7300
Connection ~ 2450 7100
$Comp
L power:GND #PWR?
U 1 1 679AA9CD
P 3900 7300
AR Path="/5D78E680/679AA9CD" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9CD" Ref="#PWR0706"  Part="1" 
AR Path="/5D42FF4D/679AA9CD" Ref="#PWR0806"  Part="1" 
F 0 "#PWR0806" H 3900 7050 50  0001 C CNN
F 1 "GND" H 3905 7127 50  0000 C CNN
F 2 "" H 3900 7300 50  0001 C CNN
F 3 "" H 3900 7300 50  0001 C CNN
	1    3900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 679AA9CE
P 3900 7100
AR Path="/5D78E680/679AA9CE" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9CE" Ref="#PWR0705"  Part="1" 
AR Path="/5D42FF4D/679AA9CE" Ref="#PWR0805"  Part="1" 
F 0 "#PWR0805" H 3900 6950 50  0001 C CNN
F 1 "+5V" H 3915 7273 50  0000 C CNN
F 2 "" H 3900 7100 50  0001 C CNN
F 3 "" H 3900 7100 50  0001 C CNN
	1    3900 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 679AA9D9
P 3900 7200
AR Path="/5D78E680/679AA9D9" Ref="C?"  Part="1" 
AR Path="/5D363063/679AA9D9" Ref="C703"  Part="1" 
AR Path="/5D42FF4D/679AA9D9" Ref="C803"  Part="1" 
F 0 "C803" H 3809 7246 50  0000 R CNN
F 1 "100nF" H 3809 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 7200 50  0001 C CNN
F 3 "~" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 679AA9DA
P 4250 7200
AR Path="/679AA9DA" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9DA" Ref="U?"  Part="2" 
AR Path="/5D363063/679AA9DA" Ref="U703"  Part="2" 
AR Path="/5D42FF4D/679AA9DA" Ref="U803"  Part="2" 
F 0 "U803" H 4429 7246 50  0000 L CNN
F 1 "74HC574" H 4429 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3950 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3950 7150 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    4250 7200
	1    0    0    -1  
$EndComp
Connection ~ 3900 7300
Connection ~ 3900 7100
$Comp
L power:GND #PWR?
U 1 1 679AA9CF
P 5350 7300
AR Path="/5D78E680/679AA9CF" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9CF" Ref="#PWR0708"  Part="1" 
AR Path="/5D42FF4D/679AA9CF" Ref="#PWR0808"  Part="1" 
F 0 "#PWR0808" H 5350 7050 50  0001 C CNN
F 1 "GND" H 5355 7127 50  0000 C CNN
F 2 "" H 5350 7300 50  0001 C CNN
F 3 "" H 5350 7300 50  0001 C CNN
	1    5350 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 679AA9D0
P 5350 7100
AR Path="/5D78E680/679AA9D0" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/679AA9D0" Ref="#PWR0707"  Part="1" 
AR Path="/5D42FF4D/679AA9D0" Ref="#PWR0807"  Part="1" 
F 0 "#PWR0807" H 5350 6950 50  0001 C CNN
F 1 "+5V" H 5365 7273 50  0000 C CNN
F 2 "" H 5350 7100 50  0001 C CNN
F 3 "" H 5350 7100 50  0001 C CNN
	1    5350 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 679AA9D1
P 5350 7200
AR Path="/5D78E680/679AA9D1" Ref="C?"  Part="1" 
AR Path="/5D363063/679AA9D1" Ref="C704"  Part="1" 
AR Path="/5D42FF4D/679AA9D1" Ref="C804"  Part="1" 
F 0 "C804" H 5259 7246 50  0000 R CNN
F 1 "100nF" H 5259 7155 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 7200 50  0001 C CNN
F 3 "~" H 5350 7200 50  0001 C CNN
	1    5350 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D410182
P 5700 7200
AR Path="/5D410182" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D410182" Ref="U?"  Part="2" 
AR Path="/5D363063/5D410182" Ref="U704"  Part="2" 
AR Path="/5D42FF4D/5D410182" Ref="U804"  Part="2" 
F 0 "U804" H 5879 7246 50  0000 L CNN
F 1 "74HC574" H 5879 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5400 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5400 7150 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    5700 7200
	1    0    0    -1  
$EndComp
Connection ~ 5350 7300
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
IBUS15
Text Label 6250 4450 2    50   ~ 0
IBUS14
Text Label 6250 4350 2    50   ~ 0
IBUS13
Text Label 6250 4250 2    50   ~ 0
IBUS12
Text Label 6250 4150 2    50   ~ 0
IBUS11
Text Label 6250 4050 2    50   ~ 0
IBUS10
Text Label 6250 3950 2    50   ~ 0
IBUS9
Text Label 6250 3850 2    50   ~ 0
IBUS8
Text Label 6250 3100 2    50   ~ 0
IBUS7
Text Label 6250 3000 2    50   ~ 0
IBUS6
Text Label 6250 2900 2    50   ~ 0
IBUS5
Text Label 6250 2800 2    50   ~ 0
IBUS4
Text Label 6250 2700 2    50   ~ 0
IBUS3
Text Label 6250 2600 2    50   ~ 0
IBUS2
Text Label 6250 2500 2    50   ~ 0
IBUS1
Text Label 6250 2400 2    50   ~ 0
IBUS0
Text Label 5100 4550 0    50   ~ 0
IBUS15
Text Label 5100 4450 0    50   ~ 0
IBUS14
Text Label 5100 4350 0    50   ~ 0
IBUS13
Text Label 5100 4250 0    50   ~ 0
IBUS12
Text Label 5100 4150 0    50   ~ 0
IBUS11
Text Label 5100 4050 0    50   ~ 0
IBUS10
Text Label 5100 3950 0    50   ~ 0
IBUS9
Text Label 5100 3850 0    50   ~ 0
IBUS8
Text Label 5100 3100 0    50   ~ 0
IBUS7
Text Label 5100 3000 0    50   ~ 0
IBUS6
Text Label 5100 2900 0    50   ~ 0
IBUS5
Text Label 5100 2800 0    50   ~ 0
IBUS4
Text Label 5100 2700 0    50   ~ 0
IBUS3
Text Label 5100 2600 0    50   ~ 0
IBUS2
Text Label 5100 2500 0    50   ~ 0
IBUS1
Text Label 5100 2400 0    50   ~ 0
IBUS0
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
IBUS[0..15]
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
U 1 1 601CFD80
P 6800 4350
AR Path="/601CFD80" Ref="U?"  Part="1" 
AR Path="/5D78E680/601CFD80" Ref="U?"  Part="1" 
AR Path="/5D363063/601CFD80" Ref="U704"  Part="1" 
AR Path="/5D42FF4D/601CFD80" Ref="U804"  Part="1" 
F 0 "U804" H 6800 5117 50  0000 C CNN
F 1 "74HC574" H 6800 5026 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6500 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6500 4300 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    6800 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 601CFD7F
P 6800 2900
AR Path="/601CFD7F" Ref="U?"  Part="1" 
AR Path="/5D78E680/601CFD7F" Ref="U?"  Part="1" 
AR Path="/5D363063/601CFD7F" Ref="U703"  Part="1" 
AR Path="/5D42FF4D/601CFD7F" Ref="U803"  Part="1" 
F 0 "U803" H 6800 3667 50  0000 C CNN
F 1 "74HC574" H 6800 3576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6500 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6500 2850 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    6800 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 601CFD7E
P 4550 4350
AR Path="/601CFD7E" Ref="U?"  Part="1" 
AR Path="/5D78E680/601CFD7E" Ref="U?"  Part="1" 
AR Path="/5D363063/601CFD7E" Ref="U702"  Part="1" 
AR Path="/5D42FF4D/601CFD7E" Ref="U802"  Part="1" 
F 0 "U802" H 4550 5117 50  0000 C CNN
F 1 "74HC574" H 4550 5026 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4250 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4250 4300 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	1    4550 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 679AA9DB
P 4550 2900
AR Path="/679AA9DB" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9DB" Ref="U?"  Part="1" 
AR Path="/5D363063/679AA9DB" Ref="U701"  Part="1" 
AR Path="/5D42FF4D/679AA9DB" Ref="U801"  Part="1" 
F 0 "U801" H 4550 3667 50  0000 C CNN
F 1 "74HC574" H 4550 3576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4250 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4250 2850 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
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
U 2 1 679AA9D5
P 1350 7200
AR Path="/679AA9D5" Ref="U?"  Part="1" 
AR Path="/5D78E680/679AA9D5" Ref="U?"  Part="2" 
AR Path="/5D363063/679AA9D5" Ref="U701"  Part="2" 
AR Path="/5D42FF4D/679AA9D5" Ref="U801"  Part="2" 
F 0 "U801" H 1529 7246 50  0000 L CNN
F 1 "74HC574" H 1529 7155 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1050 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1050 7150 50  0001 C CNN
F 4 "Yes" H 0   0   50  0001 C CNN "Verified"
	2    1350 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63AF66ED
P 1000 7300
AR Path="/5D78E680/63AF66ED" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/63AF66ED" Ref="#PWR0137"  Part="1" 
AR Path="/5D42FF4D/63AF66ED" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 1000 7050 50  0001 C CNN
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
Wire Bus Line
	5550 2050 5550 4450
Wire Bus Line
	3550 2050 3550 5050
Wire Bus Line
	7800 2500 7800 5050
$EndSCHEMATC
