EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 34
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
L power:GND #PWR?
U 1 1 5CD95C70
P 4750 5250
AR Path="/5CD95C70" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5CD95C70" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CD95C70" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5CD95C70" Ref="#PWR0307"  Part="1" 
F 0 "#PWR0307" H 4750 5000 50  0001 C CNN
F 1 "GND" H 4755 5077 50  0000 C CNN
F 2 "" H 4750 5250 50  0001 C CNN
F 3 "" H 4750 5250 50  0001 C CNN
	1    4750 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC688 U?
U 1 1 5CD95C7C
P 5400 4200
AR Path="/5CD95C7C" Ref="U?"  Part="1" 
AR Path="/5CD91C88/5CD95C7C" Ref="U302"  Part="1" 
F 0 "U302" H 5400 5367 50  0000 C CNN
F 1 "74HC688" H 5400 5276 50  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 5400 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 5400 4200 50  0001 C CNN
	1    5400 4200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 1 1 5CD95C82
P 6950 3000
AR Path="/5CD95C82" Ref="U?"  Part="1" 
AR Path="/5CD91C88/5CD95C82" Ref="U301"  Part="1" 
F 0 "U301" H 6950 3667 50  0000 C CNN
F 1 "74HC138" H 6950 3576 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 6950 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 6950 3000 50  0001 C CNN
	1    6950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CD95C8E
P 6450 3000
AR Path="/5CD95C8E" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CD95C8E" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5CD95C8E" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 6450 2850 50  0001 C CNN
F 1 "+5V" H 6392 3037 50  0000 R CNN
F 2 "" H 6450 3000 50  0001 C CNN
F 3 "" H 6450 3000 50  0001 C CNN
	1    6450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3800 4750 3800
Wire Wire Line
	4750 3800 4750 3900
Wire Wire Line
	4900 4900 4750 4900
Connection ~ 4750 4900
Wire Wire Line
	4750 4900 4750 5250
Wire Wire Line
	4900 4800 4750 4800
Connection ~ 4750 4800
Wire Wire Line
	4750 4800 4750 4900
Wire Wire Line
	4900 4700 4750 4700
Connection ~ 4750 4700
Wire Wire Line
	4750 4700 4750 4800
Wire Wire Line
	4750 4600 4900 4600
Connection ~ 4750 4600
Wire Wire Line
	4750 4600 4750 4700
Wire Wire Line
	4900 4500 4750 4500
Connection ~ 4750 4500
Wire Wire Line
	4750 4500 4750 4600
Wire Wire Line
	4900 4400 4750 4400
Connection ~ 4750 4400
Wire Wire Line
	4750 4400 4750 4500
Wire Wire Line
	4900 4300 4750 4300
Connection ~ 4750 4300
Wire Wire Line
	4750 4300 4750 4400
Wire Wire Line
	4900 4200 4750 4200
Connection ~ 4750 4200
Wire Wire Line
	4750 4200 4750 4300
Wire Wire Line
	4900 3900 4750 3900
Connection ~ 4750 3900
Wire Wire Line
	4750 3900 4750 4000
Wire Wire Line
	4900 4000 4750 4000
Connection ~ 4750 4000
Wire Wire Line
	4750 4000 4750 4200
Wire Wire Line
	4900 3300 4650 3300
Wire Wire Line
	4900 3400 4650 3400
Wire Wire Line
	4900 3500 4650 3500
Wire Wire Line
	4900 3600 4650 3600
Wire Wire Line
	4900 3700 4650 3700
Wire Wire Line
	6450 2600 4650 2600
Wire Wire Line
	6450 2700 4650 2700
Wire Wire Line
	6450 2800 4650 2800
Wire Wire Line
	5900 3300 6450 3300
Text Label 6450 2600 2    50   ~ 0
AR8
Text Label 6450 2700 2    50   ~ 0
AR9
Text Label 6450 2800 2    50   ~ 0
AR10
Text Label 4900 3300 2    50   ~ 0
AR11
Text Label 4900 3400 2    50   ~ 0
AR12
Text Label 4900 3500 2    50   ~ 0
AR13
Text Label 4900 3600 2    50   ~ 0
AR14
Text Label 4900 3700 2    50   ~ 0
AR15
Wire Bus Line
	4450 2300 3450 2300
Entry Wire Line
	4550 2500 4650 2600
Entry Wire Line
	4550 2600 4650 2700
Entry Wire Line
	4550 2700 4650 2800
Entry Wire Line
	4550 3200 4650 3300
Entry Wire Line
	4550 3300 4650 3400
Entry Wire Line
	4550 3400 4650 3500
Entry Wire Line
	4550 3500 4650 3600
Entry Wire Line
	4550 3600 4650 3700
Text Label 4900 2600 2    50   ~ 0
AR8
Text Label 4900 2700 2    50   ~ 0
AR9
Text Label 4900 2800 2    50   ~ 0
AR10
Wire Wire Line
	7450 2600 7800 2600
Wire Wire Line
	7450 2700 7800 2700
Wire Wire Line
	7450 2800 7800 2800
Wire Wire Line
	7450 2900 7800 2900
Text HLabel 7800 2600 2    50   Output ~ 0
~SYSDEV
Text HLabel 7800 2700 2    50   Output ~ 0
~IODEV1XX
Text HLabel 7800 2800 2    50   Output ~ 0
~IODEV2XX
Text HLabel 7800 2900 2    50   Output ~ 0
~IODEV3XX
Text HLabel 3450 2300 0    50   Input ~ 0
AR[8..15]
Text HLabel 3450 5100 0    50   Input ~ 0
~IO
$Comp
L power:+5V #PWR?
U 1 1 5CE276EB
P 6750 4800
AR Path="/5CE276EB" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CE276EB" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CE276EB" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5CE276EB" Ref="#PWR0305"  Part="1" 
F 0 "#PWR0305" H 6750 4650 50  0001 C CNN
F 1 "+5V" H 6765 4973 50  0000 C CNN
F 2 "" H 6750 4800 50  0001 C CNN
F 3 "" H 6750 4800 50  0001 C CNN
	1    6750 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CE276F7
P 6750 5000
AR Path="/5CE276F7" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5CE276F7" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5CE276F7" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5CE276F7" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5CE276F7" Ref="#PWR0306"  Part="1" 
F 0 "#PWR0306" H 6750 4750 50  0001 C CNN
F 1 "GND" H 6755 4827 50  0000 C CNN
F 2 "" H 6750 5000 50  0001 C CNN
F 3 "" H 6750 5000 50  0001 C CNN
	1    6750 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CE276FD
P 6750 4050
AR Path="/5CC0D65F/5CE276FD" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CE276FD" Ref="C?"  Part="1" 
AR Path="/5CD91C88/5CE276FD" Ref="C301"  Part="1" 
F 0 "C301" H 6659 4096 50  0000 R CNN
F 1 "100nF" H 6659 4005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6750 4050 50  0001 C CNN
F 3 "~" H 6750 4050 50  0001 C CNN
	1    6750 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CE27703
P 6750 4900
AR Path="/5CC0D65F/5CE27703" Ref="C?"  Part="1" 
AR Path="/5CD3AC27/5CE27703" Ref="C?"  Part="1" 
AR Path="/5CD91C88/5CE27703" Ref="C302"  Part="1" 
F 0 "C302" H 6659 4946 50  0000 R CNN
F 1 "100nF" H 6659 4855 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6750 4900 50  0001 C CNN
F 3 "~" H 6750 4900 50  0001 C CNN
	1    6750 4900
	1    0    0    -1  
$EndComp
Text Label 3550 2300 0    50   ~ 0
AR[8..15]
NoConn ~ 7450 3000
NoConn ~ 7450 3100
NoConn ~ 7450 3200
NoConn ~ 7450 3300
$Comp
L alexios:74HC688 U?
U 2 1 5D0E0726
P 7100 4900
AR Path="/5D0E0726" Ref="U?"  Part="1" 
AR Path="/5CD91C88/5D0E0726" Ref="U302"  Part="2" 
F 0 "U302" H 7280 4946 50  0000 L CNN
F 1 "74HC688" H 7280 4855 50  0000 L CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 7100 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 7100 4900 50  0001 C CNN
	2    7100 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 5D0E0DF3
P 7100 4050
AR Path="/5D0E0DF3" Ref="U?"  Part="1" 
AR Path="/5CD91C88/5D0E0DF3" Ref="U301"  Part="2" 
F 0 "U301" H 7280 4096 50  0000 L CNN
F 1 "74HC138" H 7280 4005 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 7100 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7100 4050 50  0001 C CNN
	2    7100 4050
	1    0    0    -1  
$EndComp
Connection ~ 6750 4800
$Comp
L power:+5V #PWR?
U 1 1 5D0E5293
P 6750 3950
AR Path="/5D0E5293" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0E5293" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0E5293" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5D0E5293" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 6750 3800 50  0001 C CNN
F 1 "+5V" H 6765 4123 50  0000 C CNN
F 2 "" H 6750 3950 50  0001 C CNN
F 3 "" H 6750 3950 50  0001 C CNN
	1    6750 3950
	1    0    0    -1  
$EndComp
Connection ~ 6750 3950
Connection ~ 6750 5000
$Comp
L power:GND #PWR?
U 1 1 5D0E5CD4
P 6750 4150
AR Path="/5D0E5CD4" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0E5CD4" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0E5CD4" Ref="#PWR?"  Part="1" 
AR Path="/5CD3AC27/5D0E5CD4" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5D0E5CD4" Ref="#PWR0304"  Part="1" 
F 0 "#PWR0304" H 6750 3900 50  0001 C CNN
F 1 "GND" H 6755 3977 50  0000 C CNN
F 2 "" H 6750 4150 50  0001 C CNN
F 3 "" H 6750 4150 50  0001 C CNN
	1    6750 4150
	1    0    0    -1  
$EndComp
Connection ~ 6750 4150
$Comp
L Device:R_Small R?
U 1 1 5CD95C88
P 6450 3100
AR Path="/5CD95C88" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5CD95C88" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5CD95C88" Ref="R?"  Part="1" 
AR Path="/5CD91C88/5CD95C88" Ref="R301"  Part="1" 
F 0 "R301" H 6392 3146 50  0000 R CNN
F 1 "10kΩ" H 6392 3055 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6450 3100 50  0001 C CNN
F 3 "~" H 6450 3100 50  0001 C CNN
	1    6450 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D0FCD87
P 6450 3400
AR Path="/5D0FCD87" Ref="#PWR?"  Part="1" 
AR Path="/5CBF1647/5D0FCD87" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D0FCD87" Ref="#PWR?"  Part="1" 
AR Path="/5CD91C88/5D0FCD87" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 6450 3150 50  0001 C CNN
F 1 "GND" H 6455 3227 50  0000 C CNN
F 2 "" H 6450 3400 50  0001 C CNN
F 3 "" H 6450 3400 50  0001 C CNN
	1    6450 3400
	1    0    0    -1  
$EndComp
Text Notes 7100 7000 0    197  ~ 39
I/O Address Decoder
Entry Bus Bus
	4450 2300 4550 2400
Wire Wire Line
	3450 5100 4900 5100
Wire Bus Line
	4550 2400 4550 3600
$EndSCHEMATC
