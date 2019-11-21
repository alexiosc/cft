EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 30
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
L alexios:74HC573 U?
U 2 1 5F6441DB
P 3300 6800
AR Path="/5F4B0011/5F6441DB" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F6441DB" Ref="U402"  Part="2" 
F 0 "U402" H 3330 7246 50  0000 L CNN
F 1 "74HC573" H 3330 7155 50  0000 L CNN
F 2 "" H 3300 6800 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 3300 6800 50  0001 C CNN
	2    3300 6800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 2 1 5F6441E1
P 3300 7550
AR Path="/5F4B0011/5F6441E1" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F6441E1" Ref="U403"  Part="2" 
F 0 "U403" H 3330 7996 50  0000 L CNN
F 1 "74HC573" H 3330 7905 50  0000 L CNN
F 2 "" H 3300 7550 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 3300 7550 50  0001 C CNN
	2    3300 7550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F6441E7
P 2800 6300
AR Path="/5F4B0011/5F6441E7" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441E7" Ref="#PWR0403"  Part="1" 
F 0 "#PWR0403" H 2800 6150 50  0001 C CNN
F 1 "+5V" H 2815 6473 50  0000 C CNN
F 2 "" H 2800 6300 50  0001 C CNN
F 3 "" H 2800 6300 50  0001 C CNN
	1    2800 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6441ED
P 2800 6500
AR Path="/5F6441ED" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6441ED" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441ED" Ref="#PWR0404"  Part="1" 
F 0 "#PWR0404" H 2800 6250 50  0001 C CNN
F 1 "GND" H 2805 6327 50  0000 C CNN
F 2 "" H 2800 6500 50  0001 C CNN
F 3 "" H 2800 6500 50  0001 C CNN
	1    2800 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F6441F3
P 2800 6400
AR Path="/5CC0D65F/5F6441F3" Ref="C?"  Part="1" 
AR Path="/5F6441F3" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F6441F3" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F6441F3" Ref="C402"  Part="1" 
F 0 "C402" H 2709 6446 50  0000 R CNN
F 1 "100nF" H 2709 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2800 6400 50  0001 C CNN
F 3 "~" H 2800 6400 50  0001 C CNN
	1    2800 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F6441F9
P 2800 7050
AR Path="/5F4B0011/5F6441F9" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441F9" Ref="#PWR0405"  Part="1" 
F 0 "#PWR0405" H 2800 6900 50  0001 C CNN
F 1 "+5V" H 2815 7223 50  0000 C CNN
F 2 "" H 2800 7050 50  0001 C CNN
F 3 "" H 2800 7050 50  0001 C CNN
	1    2800 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6441FF
P 2800 7250
AR Path="/5F6441FF" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6441FF" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6441FF" Ref="#PWR0406"  Part="1" 
F 0 "#PWR0406" H 2800 7000 50  0001 C CNN
F 1 "GND" H 2805 7077 50  0000 C CNN
F 2 "" H 2800 7250 50  0001 C CNN
F 3 "" H 2800 7250 50  0001 C CNN
	1    2800 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F644205
P 2800 7150
AR Path="/5CC0D65F/5F644205" Ref="C?"  Part="1" 
AR Path="/5F644205" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F644205" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F644205" Ref="C403"  Part="1" 
F 0 "C403" H 2709 7196 50  0000 R CNN
F 1 "100nF" H 2709 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2800 7150 50  0001 C CNN
F 3 "~" H 2800 7150 50  0001 C CNN
	1    2800 7150
	1    0    0    -1  
$EndComp
Connection ~ 2800 6500
Connection ~ 2800 6300
Connection ~ 2800 7250
Connection ~ 2800 7050
$Comp
L power:+5V #PWR?
U 1 1 5F64420F
P 4150 6300
AR Path="/5F4B0011/5F64420F" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64420F" Ref="#PWR0407"  Part="1" 
F 0 "#PWR0407" H 4150 6150 50  0001 C CNN
F 1 "+5V" H 4165 6473 50  0000 C CNN
F 2 "" H 4150 6300 50  0001 C CNN
F 3 "" H 4150 6300 50  0001 C CNN
	1    4150 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F644215
P 4150 6500
AR Path="/5F644215" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F644215" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644215" Ref="#PWR0408"  Part="1" 
F 0 "#PWR0408" H 4150 6250 50  0001 C CNN
F 1 "GND" H 4155 6327 50  0000 C CNN
F 2 "" H 4150 6500 50  0001 C CNN
F 3 "" H 4150 6500 50  0001 C CNN
	1    4150 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64421B
P 4150 6400
AR Path="/5CC0D65F/5F64421B" Ref="C?"  Part="1" 
AR Path="/5F64421B" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F64421B" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F64421B" Ref="C404"  Part="1" 
F 0 "C404" H 4059 6446 50  0000 R CNN
F 1 "100nF" H 4059 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4150 6400 50  0001 C CNN
F 3 "~" H 4150 6400 50  0001 C CNN
	1    4150 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F644221
P 4150 7050
AR Path="/5F4B0011/5F644221" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644221" Ref="#PWR0409"  Part="1" 
F 0 "#PWR0409" H 4150 6900 50  0001 C CNN
F 1 "+5V" H 4165 7223 50  0000 C CNN
F 2 "" H 4150 7050 50  0001 C CNN
F 3 "" H 4150 7050 50  0001 C CNN
	1    4150 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F644227
P 4150 7250
AR Path="/5F644227" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F644227" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644227" Ref="#PWR0410"  Part="1" 
F 0 "#PWR0410" H 4150 7000 50  0001 C CNN
F 1 "GND" H 4155 7077 50  0000 C CNN
F 2 "" H 4150 7250 50  0001 C CNN
F 3 "" H 4150 7250 50  0001 C CNN
	1    4150 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64422D
P 4150 7150
AR Path="/5CC0D65F/5F64422D" Ref="C?"  Part="1" 
AR Path="/5F64422D" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F64422D" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F64422D" Ref="C405"  Part="1" 
F 0 "C405" H 4059 7196 50  0000 R CNN
F 1 "100nF" H 4059 7105 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4150 7150 50  0001 C CNN
F 3 "~" H 4150 7150 50  0001 C CNN
	1    4150 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F644233
P 7450 2350
AR Path="/5F4B0011/5F644233" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644233" Ref="U407"  Part="1" 
F 0 "U407" H 7450 3117 50  0000 C CNN
F 1 "74HC541" H 7450 3026 50  0000 C CNN
F 2 "" H 7450 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 7450 2350 50  0001 C CNN
	1    7450 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F644239
P 7450 3950
AR Path="/5F4B0011/5F644239" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644239" Ref="U408"  Part="1" 
F 0 "U408" H 7450 4717 50  0000 C CNN
F 1 "74HC541" H 7450 4626 50  0000 C CNN
F 2 "" H 7450 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 7450 3950 50  0001 C CNN
	1    7450 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5F64423F
P 4500 6400
AR Path="/5F4B0011/5F64423F" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F64423F" Ref="U405"  Part="2" 
F 0 "U405" H 4680 6446 50  0000 L CNN
F 1 "74HC541" H 4680 6355 50  0000 L CNN
F 2 "" H 4500 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4500 6400 50  0001 C CNN
	2    4500 6400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 5F644245
P 4500 7150
AR Path="/5F4B0011/5F644245" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F644245" Ref="U406"  Part="2" 
F 0 "U406" H 4680 7196 50  0000 L CNN
F 1 "74HC541" H 4680 7105 50  0000 L CNN
F 2 "" H 4500 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4500 7150 50  0001 C CNN
	2    4500 7150
	1    0    0    -1  
$EndComp
Connection ~ 4150 6500
Connection ~ 4150 6300
Connection ~ 4150 7250
Connection ~ 4150 7050
Text Label 4250 2850 3    50   ~ 0
IBUS[0..15]
Wire Wire Line
	4900 1850 4350 1850
Wire Wire Line
	4900 1950 4350 1950
Wire Wire Line
	4900 2050 4350 2050
Wire Wire Line
	4900 2150 4350 2150
Wire Wire Line
	4900 2250 4350 2250
Wire Wire Line
	4900 2350 4350 2350
Wire Wire Line
	4900 2450 4350 2450
Wire Wire Line
	4900 2550 4350 2550
Wire Wire Line
	4900 3450 4350 3450
Wire Wire Line
	4900 3550 4350 3550
Wire Wire Line
	4900 3650 4350 3650
Wire Wire Line
	4900 3750 4350 3750
Wire Wire Line
	4900 3850 4350 3850
Wire Wire Line
	4900 3950 4350 3950
Wire Wire Line
	4900 4050 4350 4050
Wire Wire Line
	4900 4150 4350 4150
Wire Wire Line
	4900 4450 4850 4450
$Comp
L alexios:74HC573 U?
U 1 1 5F644261
P 5400 3950
AR Path="/5F4B0011/5F644261" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644261" Ref="U403"  Part="1" 
F 0 "U403" H 5400 4717 50  0000 C CNN
F 1 "74HC573" H 5400 4626 50  0000 C CNN
F 2 "" H 5400 3950 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 5400 3950 50  0001 C CNN
	1    5400 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC573 U?
U 1 1 5F644267
P 5400 2350
AR Path="/5F4B0011/5F644267" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644267" Ref="U402"  Part="1" 
F 0 "U402" H 5400 3117 50  0000 C CNN
F 1 "74HC573" H 5400 3026 50  0000 C CNN
F 2 "" H 5400 2350 50  0001 C CNN
F 3 "74xx/74hc573.pdf" H 5400 2350 50  0001 C CNN
	1    5400 2350
	1    0    0    -1  
$EndComp
Entry Wire Line
	4250 1750 4350 1850
Entry Wire Line
	4250 1850 4350 1950
Entry Wire Line
	4250 1950 4350 2050
Entry Wire Line
	4250 2050 4350 2150
Entry Wire Line
	4250 2150 4350 2250
Entry Wire Line
	4250 2250 4350 2350
Entry Wire Line
	4250 2350 4350 2450
Entry Wire Line
	4250 2450 4350 2550
Entry Wire Line
	4250 3350 4350 3450
Entry Wire Line
	4250 3450 4350 3550
Entry Wire Line
	4250 3550 4350 3650
Entry Wire Line
	4250 3650 4350 3750
Entry Wire Line
	4250 3750 4350 3850
Entry Wire Line
	4250 3850 4350 3950
Entry Wire Line
	4250 3950 4350 4050
Entry Wire Line
	4250 4050 4350 4150
Text Label 4400 1850 0    50   ~ 0
IBUS0
Text Label 4400 1950 0    50   ~ 0
IBUS1
Text Label 4400 2050 0    50   ~ 0
IBUS2
Text Label 4400 2150 0    50   ~ 0
IBUS3
Text Label 4400 2250 0    50   ~ 0
IBUS4
Text Label 4400 2350 0    50   ~ 0
IBUS5
Text Label 4400 2450 0    50   ~ 0
IBUS6
Text Label 4400 2550 0    50   ~ 0
IBUS7
Text Label 4400 3450 0    50   ~ 0
IBUS8
Text Label 4400 3550 0    50   ~ 0
IBUS9
Text Label 4400 3650 0    50   ~ 0
IBUS10
Text Label 4400 3750 0    50   ~ 0
IBUS11
Text Label 4400 3850 0    50   ~ 0
IBUS12
Text Label 4400 3950 0    50   ~ 0
IBUS13
Text Label 4400 4050 0    50   ~ 0
IBUS14
Text Label 4400 4150 0    50   ~ 0
IBUS15
Wire Wire Line
	5900 1850 6200 1850
Wire Wire Line
	5900 1950 6200 1950
Wire Wire Line
	5900 2050 6200 2050
Wire Wire Line
	5900 2150 6200 2150
Wire Wire Line
	5900 2250 6200 2250
Wire Wire Line
	5900 2350 6200 2350
Wire Wire Line
	5900 2450 6200 2450
Wire Wire Line
	5900 2550 6200 2550
Wire Wire Line
	5900 3450 6200 3450
Wire Wire Line
	5900 3550 6200 3550
Wire Wire Line
	5900 3650 6200 3650
Wire Wire Line
	5900 3750 6200 3750
Wire Wire Line
	5900 3850 6200 3850
Wire Wire Line
	5900 3950 6200 3950
Wire Wire Line
	5900 4050 6200 4050
Wire Wire Line
	5900 4150 6200 4150
Text Label 5950 1850 0    50   ~ 0
IR0
Text Label 5950 1950 0    50   ~ 0
IR1
Text Label 5950 2050 0    50   ~ 0
IR2
Text Label 5950 2150 0    50   ~ 0
IR3
Text Label 5950 2250 0    50   ~ 0
IR4
Text Label 5950 2350 0    50   ~ 0
IR5
Text Label 5950 2450 0    50   ~ 0
IR6
Text Label 5950 2550 0    50   ~ 0
IR7
Text Label 5950 3450 0    50   ~ 0
IR8
Text Label 5950 3550 0    50   ~ 0
IR9
Text Label 5950 3650 0    50   ~ 0
IR10
Text Label 5950 3750 0    50   ~ 0
IR11
Text Label 5950 3850 0    50   ~ 0
IR12
Text Label 5950 3950 0    50   ~ 0
IR13
Text Label 5950 4050 0    50   ~ 0
IR14
Text Label 5950 4150 0    50   ~ 0
IR15
Text Label 6700 1850 0    50   ~ 0
IR0
Text Label 6700 1950 0    50   ~ 0
IR1
Text Label 6700 2050 0    50   ~ 0
IR2
Text Label 6700 2150 0    50   ~ 0
IR3
Text Label 6700 2250 0    50   ~ 0
IR4
Text Label 6700 2350 0    50   ~ 0
IR5
Text Label 6700 2450 0    50   ~ 0
IR6
Text Label 6700 2550 0    50   ~ 0
IR7
Text Label 6700 3450 0    50   ~ 0
IR8
Text Label 6700 3550 0    50   ~ 0
IR9
Text Label 6300 3200 1    50   ~ 0
IR[0..15]
Wire Wire Line
	7950 1850 8250 1850
Wire Wire Line
	7950 1950 8250 1950
Wire Wire Line
	7950 2050 8250 2050
Wire Wire Line
	7950 2150 8250 2150
Wire Wire Line
	7950 2250 8250 2250
Wire Wire Line
	7950 2350 8250 2350
Wire Wire Line
	7950 2450 8250 2450
Wire Wire Line
	7950 2550 8250 2550
Text Label 8000 1850 0    50   ~ 0
FP0
Text Label 8000 1950 0    50   ~ 0
FP1
Text Label 8000 2050 0    50   ~ 0
FP2
Text Label 8000 2150 0    50   ~ 0
FP3
Text Label 8000 2250 0    50   ~ 0
FP4
Text Label 8000 2350 0    50   ~ 0
FP5
Text Label 8000 2450 0    50   ~ 0
FP6
Text Label 8000 2550 0    50   ~ 0
FP7
Entry Wire Line
	8250 1850 8350 1950
Entry Wire Line
	8250 1950 8350 2050
Entry Wire Line
	8250 2050 8350 2150
Entry Wire Line
	8250 2150 8350 2250
Entry Wire Line
	8250 2250 8350 2350
Entry Wire Line
	8250 2350 8350 2450
Entry Wire Line
	8250 2450 8350 2550
Entry Wire Line
	8250 2550 8350 2650
Wire Wire Line
	7950 3450 8250 3450
Wire Wire Line
	7950 3550 8250 3550
Wire Wire Line
	7950 3650 8250 3650
Wire Wire Line
	7950 3750 8250 3750
Wire Wire Line
	7950 3850 8250 3850
Wire Wire Line
	7950 3950 8250 3950
Wire Wire Line
	7950 4050 8250 4050
Wire Wire Line
	7950 4150 8250 4150
Text Label 8000 3450 0    50   ~ 0
FP0
Text Label 8000 3550 0    50   ~ 0
FP1
Text Label 8000 3650 0    50   ~ 0
FP2
Text Label 8000 3750 0    50   ~ 0
FP3
Text Label 8000 3850 0    50   ~ 0
FP4
Text Label 8000 3950 0    50   ~ 0
FP5
Text Label 8000 4050 0    50   ~ 0
FP6
Text Label 8000 4150 0    50   ~ 0
FP7
Entry Wire Line
	8250 3450 8350 3550
Entry Wire Line
	8250 3550 8350 3650
Entry Wire Line
	8250 3650 8350 3750
Entry Wire Line
	8250 3750 8350 3850
Entry Wire Line
	8250 3850 8350 3950
Entry Wire Line
	8250 3950 8350 4050
Entry Wire Line
	8250 4050 8350 4150
Entry Wire Line
	8250 4150 8350 4250
Text Label 8350 3200 1    50   ~ 0
FPO[0..7]
$Comp
L power:GND #PWR?
U 1 1 5F6442FF
P 6900 4700
AR Path="/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F6442FF" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F6442FF" Ref="#PWR0414"  Part="1" 
F 0 "#PWR0414" H 6900 4450 50  0001 C CNN
F 1 "GND" H 6905 4527 50  0000 C CNN
F 2 "" H 6900 4700 50  0001 C CNN
F 3 "" H 6900 4700 50  0001 C CNN
	1    6900 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F644305
P 6900 4600
AR Path="/5F644305" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F644305" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F644305" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F644305" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5F644305" Ref="R?"  Part="1" 
AR Path="/5F63066B/5F644305" Ref="R404"  Part="1" 
F 0 "R404" H 6842 4646 50  0000 R CNN
F 1 "10kΩ" H 6842 4555 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6900 4600 50  0001 C CNN
F 3 "~" H 6900 4600 50  0001 C CNN
	1    6900 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F64430B
P 6900 3100
AR Path="/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64430B" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64430B" Ref="#PWR0413"  Part="1" 
F 0 "#PWR0413" H 6900 2850 50  0001 C CNN
F 1 "GND" H 6905 2927 50  0000 C CNN
F 2 "" H 6900 3100 50  0001 C CNN
F 3 "" H 6900 3100 50  0001 C CNN
	1    6900 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F644311
P 6900 3000
AR Path="/5F644311" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F644311" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F644311" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F644311" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5F644311" Ref="R?"  Part="1" 
AR Path="/5F63066B/5F644311" Ref="R403"  Part="1" 
F 0 "R403" H 6842 3046 50  0000 R CNN
F 1 "10kΩ" H 6842 2955 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6900 3000 50  0001 C CNN
F 3 "~" H 6900 3000 50  0001 C CNN
	1    6900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2850 6900 2850
Wire Wire Line
	6900 2850 6900 2900
Wire Wire Line
	6950 4450 6900 4450
Wire Wire Line
	6900 4450 6900 4500
Text Label 6700 2750 0    50   ~ 0
~FPIRL
Text Label 6700 4350 0    50   ~ 0
~FPIRH
$Comp
L power:GND #PWR?
U 1 1 5F64431F
P 4900 3100
AR Path="/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64431F" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64431F" Ref="#PWR0412"  Part="1" 
F 0 "#PWR0412" H 4900 2850 50  0001 C CNN
F 1 "GND" H 4905 2927 50  0000 C CNN
F 2 "" H 4900 3100 50  0001 C CNN
F 3 "" H 4900 3100 50  0001 C CNN
	1    4900 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F644325
P 4900 3000
AR Path="/5F644325" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F644325" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F644325" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F644325" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5F644325" Ref="R?"  Part="1" 
AR Path="/5F63066B/5F644325" Ref="R402"  Part="1" 
F 0 "R402" H 4842 3046 50  0000 R CNN
F 1 "10kΩ" H 4842 2955 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4900 3000 50  0001 C CNN
F 3 "~" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2850 4900 2900
$Comp
L power:GND #PWR?
U 1 1 5F64432C
P 4850 4700
AR Path="/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F64432C" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F64432C" Ref="#PWR0411"  Part="1" 
F 0 "#PWR0411" H 4850 4450 50  0001 C CNN
F 1 "GND" H 4855 4527 50  0000 C CNN
F 2 "" H 4850 4700 50  0001 C CNN
F 3 "" H 4850 4700 50  0001 C CNN
	1    4850 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F644332
P 4850 4600
AR Path="/5F644332" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5F644332" Ref="R?"  Part="1" 
AR Path="/5D54E677/5F644332" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5F644332" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5F644332" Ref="R?"  Part="1" 
AR Path="/5F63066B/5F644332" Ref="R401"  Part="1" 
F 0 "R401" H 4792 4646 50  0000 R CNN
F 1 "10kΩ" H 4792 4555 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4850 4600 50  0001 C CNN
F 3 "~" H 4850 4600 50  0001 C CNN
	1    4850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4450 4850 4500
Wire Bus Line
	2950 1550 4150 1550
Entry Bus Bus
	4150 1550 4250 1650
Text Label 3000 1550 0    50   ~ 0
IBUS[0..15]
Text HLabel 2950 1550 0    50   3State ~ 0
IBUS[0..15]
Entry Bus Bus
	8350 4450 8450 4550
Wire Bus Line
	8450 4550 9050 4550
Text Label 8950 4550 2    50   ~ 0
FPO[0..7]
Text HLabel 9050 4550 2    50   3State ~ 0
FPO[0..7]
Entry Bus Bus
	6300 4900 6400 5000
Text Label 8950 5000 2    50   ~ 0
IR[0..15]
Text HLabel 9050 5000 2    50   BiDi ~ 0
IR[0..15]
Entry Wire Line
	6200 1850 6300 1950
Entry Wire Line
	6200 1950 6300 2050
Entry Wire Line
	6200 2050 6300 2150
Entry Wire Line
	6200 2150 6300 2250
Entry Wire Line
	6200 2250 6300 2350
Entry Wire Line
	6200 2350 6300 2450
Entry Wire Line
	6200 2450 6300 2550
Entry Wire Line
	6200 2550 6300 2650
Entry Wire Line
	6200 3450 6300 3550
Entry Wire Line
	6200 3550 6300 3650
Entry Wire Line
	6200 3650 6300 3750
Entry Wire Line
	6200 3750 6300 3850
Entry Wire Line
	6200 3850 6300 3950
Entry Wire Line
	6200 3950 6300 4050
Entry Wire Line
	6200 4050 6300 4150
Entry Wire Line
	6200 4150 6300 4250
Entry Wire Line
	6300 1950 6400 1850
Entry Wire Line
	6300 2050 6400 1950
Entry Wire Line
	6300 2150 6400 2050
Entry Wire Line
	6300 2250 6400 2150
Entry Wire Line
	6300 2350 6400 2250
Entry Wire Line
	6300 2450 6400 2350
Entry Wire Line
	6300 2550 6400 2450
Entry Wire Line
	6300 2650 6400 2550
Entry Wire Line
	6300 3550 6400 3450
Entry Wire Line
	6300 3650 6400 3550
Entry Wire Line
	6300 3750 6400 3650
Entry Wire Line
	6300 3850 6400 3750
Entry Wire Line
	6300 3950 6400 3850
Entry Wire Line
	6300 4050 6400 3950
Entry Wire Line
	6300 4150 6400 4050
Entry Wire Line
	6300 4250 6400 4150
$Comp
L alexios:74AHC1G04 U?
U 1 1 5F644365
P 3800 2750
AR Path="/5F4B0011/5F644365" Ref="U?"  Part="1" 
AR Path="/5F63066B/5F644365" Ref="U404"  Part="1" 
F 0 "U404" H 3775 3017 50  0000 C CNN
F 1 "74AHC1G04" H 3775 2926 50  0000 C CNN
F 2 "" H 3800 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3800 2750 50  0001 C CNN
	1    3800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2750 4100 2750
Wire Wire Line
	4100 4350 4100 2750
Wire Wire Line
	4100 4350 4900 4350
Connection ~ 4100 2750
Wire Wire Line
	4100 2750 4900 2750
Text Label 4400 2750 0    50   ~ 0
LATCH-IR
Text Label 4400 4350 0    50   ~ 0
LATCH-IR
Wire Wire Line
	3500 2750 2900 2750
Text Label 3000 2750 0    50   ~ 0
~WRITE-IR
Text HLabel 2900 2750 0    50   Input ~ 0
~WRITE-IR
$Comp
L alexios:74AHC1G04 U?
U 2 1 5F644375
P 1700 6400
AR Path="/5F4B0011/5F644375" Ref="U?"  Part="2" 
AR Path="/5F63066B/5F644375" Ref="U401"  Part="2" 
F 0 "U401" H 1880 6446 50  0000 L CNN
F 1 "74AHC1G04" H 1880 6355 50  0000 L CNN
F 2 "" H 1700 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1700 6400 50  0001 C CNN
	2    1700 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64437B
P 1350 6400
AR Path="/5CC0D65F/5F64437B" Ref="C?"  Part="1" 
AR Path="/5F64437B" Ref="C?"  Part="1" 
AR Path="/5F4B0011/5F64437B" Ref="C?"  Part="1" 
AR Path="/5F63066B/5F64437B" Ref="C401"  Part="1" 
F 0 "C401" H 1259 6446 50  0000 R CNN
F 1 "100nF" H 1259 6355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 6400 50  0001 C CNN
F 3 "~" H 1350 6400 50  0001 C CNN
	1    1350 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F644381
P 1350 6300
AR Path="/5F4B0011/5F644381" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644381" Ref="#PWR0401"  Part="1" 
F 0 "#PWR0401" H 1350 6150 50  0001 C CNN
F 1 "+5V" H 1365 6473 50  0000 C CNN
F 2 "" H 1350 6300 50  0001 C CNN
F 3 "" H 1350 6300 50  0001 C CNN
	1    1350 6300
	1    0    0    -1  
$EndComp
Connection ~ 1350 6300
$Comp
L power:GND #PWR?
U 1 1 5F644388
P 1350 6500
AR Path="/5F644388" Ref="#PWR?"  Part="1" 
AR Path="/5F4B0011/5F644388" Ref="#PWR?"  Part="1" 
AR Path="/5F63066B/5F644388" Ref="#PWR0402"  Part="1" 
F 0 "#PWR0402" H 1350 6250 50  0001 C CNN
F 1 "GND" H 1355 6327 50  0000 C CNN
F 2 "" H 1350 6500 50  0001 C CNN
F 3 "" H 1350 6500 50  0001 C CNN
	1    1350 6500
	1    0    0    -1  
$EndComp
Connection ~ 1350 6500
Text Label 3350 1200 2    50   ~ 0
~FPIRL
Text Label 3350 1300 2    50   ~ 0
~FPIRH
Text HLabel 2950 1200 0    50   Input ~ 0
~FPIRL
Text HLabel 2950 1300 0    50   Input ~ 0
~FPIRH
Text Notes 7100 7000 0    197  ~ 39
Instruction Register (IR)
Text Label 6700 4150 0    50   ~ 0
IR15
Text Label 6700 4050 0    50   ~ 0
IR14
Text Label 6700 3950 0    50   ~ 0
IR13
Text Label 6700 3850 0    50   ~ 0
IR12
Text Label 6700 3750 0    50   ~ 0
IR11
Text Label 6700 3650 0    50   ~ 0
IR10
Wire Bus Line
	6400 5000 9050 5000
Wire Wire Line
	6500 1300 6500 4350
Wire Wire Line
	6500 4350 6950 4350
Wire Wire Line
	2950 1300 6500 1300
Wire Wire Line
	6600 1200 6600 2750
Wire Wire Line
	6600 2750 6950 2750
Wire Wire Line
	2950 1200 6600 1200
Wire Wire Line
	6950 3450 6400 3450
Wire Wire Line
	6950 3550 6400 3550
Wire Wire Line
	6950 3650 6400 3650
Wire Wire Line
	6950 3750 6400 3750
Wire Wire Line
	6950 3850 6400 3850
Wire Wire Line
	6950 3950 6400 3950
Wire Wire Line
	6950 4050 6400 4050
Wire Wire Line
	6950 4150 6400 4150
Wire Wire Line
	6950 1850 6400 1850
Wire Wire Line
	6950 1950 6400 1950
Wire Wire Line
	6950 2050 6400 2050
Wire Wire Line
	6950 2150 6400 2150
Wire Wire Line
	6950 2250 6400 2250
Wire Wire Line
	6950 2350 6400 2350
Wire Wire Line
	6950 2450 6400 2450
Wire Wire Line
	6950 2550 6400 2550
Wire Bus Line
	6300 1950 6300 4900
Wire Bus Line
	8350 1950 8350 4450
Wire Bus Line
	4250 1650 4250 4050
$EndSCHEMATC
