EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 23
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
L alexios:74HC574 U?
U 1 1 5CC2001C
P 3750 1750
AR Path="/5CC0D65F/5CC2001C" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC2001C" Ref="U1401"  Part="1" 
F 0 "U1401" H 3750 2517 50  0000 C CNN
F 1 "74HC574" H 3750 2426 50  0000 C CNN
F 2 "" H 3750 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3750 1750 50  0001 C CNN
	1    3750 1750
	1    0    0    -1  
$EndComp
Entry Wire Line
	4550 2050 4450 1950
Entry Wire Line
	4550 1950 4450 1850
Entry Wire Line
	4550 1850 4450 1750
Entry Wire Line
	4550 1750 4450 1650
Entry Wire Line
	4550 1650 4450 1550
Entry Wire Line
	4550 1550 4450 1450
Entry Wire Line
	4550 1450 4450 1350
Entry Wire Line
	4550 1350 4450 1250
Wire Wire Line
	4250 1250 4450 1250
Wire Wire Line
	4250 1350 4450 1350
Wire Wire Line
	4250 1450 4450 1450
Wire Wire Line
	4250 1550 4450 1550
Wire Wire Line
	4250 1650 4450 1650
Wire Wire Line
	4250 1750 4450 1750
Wire Wire Line
	4250 1850 4450 1850
Wire Wire Line
	4250 1950 4450 1950
Entry Wire Line
	4550 3700 4450 3600
Entry Wire Line
	4550 3600 4450 3500
Entry Wire Line
	4550 3500 4450 3400
Entry Wire Line
	4550 3400 4450 3300
Entry Wire Line
	4550 3300 4450 3200
Entry Wire Line
	4550 3200 4450 3100
Entry Wire Line
	4550 3100 4450 3000
Entry Wire Line
	4550 3000 4450 2900
Wire Wire Line
	4250 2900 4450 2900
Wire Wire Line
	4250 3000 4450 3000
Wire Wire Line
	4250 3100 4450 3100
Wire Wire Line
	4250 3200 4450 3200
Wire Wire Line
	4250 3300 4450 3300
Wire Wire Line
	4250 3400 4450 3400
Wire Wire Line
	4250 3500 4450 3500
Wire Wire Line
	4250 3600 4450 3600
Text Label 4250 1250 0    50   ~ 0
AR0
Text Label 4250 1350 0    50   ~ 0
AR1
Text Label 4250 1450 0    50   ~ 0
AR2
Text Label 4250 1550 0    50   ~ 0
AR3
Text Label 4250 1650 0    50   ~ 0
AR4
Text Label 4250 1750 0    50   ~ 0
AR5
Text Label 4250 1850 0    50   ~ 0
AR6
Text Label 4250 1950 0    50   ~ 0
AR7
Text Label 4250 2900 0    50   ~ 0
AR8
Text Label 4250 3000 0    50   ~ 0
AR9
Text Label 4250 3100 0    50   ~ 0
AR10
Text Label 4250 3200 0    50   ~ 0
AR11
Text Label 4250 3300 0    50   ~ 0
AR12
Text Label 4250 3400 0    50   ~ 0
AR13
Text Label 4250 3500 0    50   ~ 0
AR14
Text Label 4250 3600 0    50   ~ 0
AR15
Entry Wire Line
	4650 1250 4550 1350
Entry Wire Line
	4650 1350 4550 1450
Entry Wire Line
	4650 1450 4550 1550
Entry Wire Line
	4650 1550 4550 1650
Entry Wire Line
	4650 1650 4550 1750
Entry Wire Line
	4650 1750 4550 1850
Entry Wire Line
	4650 1850 4550 1950
Entry Wire Line
	4650 1950 4550 2050
Entry Wire Line
	4650 2900 4550 3000
Entry Wire Line
	4650 3000 4550 3100
Entry Wire Line
	4650 3100 4550 3200
Entry Wire Line
	4650 3200 4550 3300
Entry Wire Line
	4650 3300 4550 3400
Entry Wire Line
	4650 3400 4550 3500
Entry Wire Line
	4650 3500 4550 3600
Entry Wire Line
	4650 3600 4550 3700
Wire Wire Line
	4650 1250 4850 1250
Wire Wire Line
	4650 1350 4850 1350
Wire Wire Line
	4650 1450 4850 1450
Wire Wire Line
	4650 1550 4850 1550
Wire Wire Line
	4650 1650 4850 1650
Wire Wire Line
	4650 1750 4850 1750
Wire Wire Line
	4650 1850 4850 1850
Wire Wire Line
	4650 1950 4850 1950
Wire Wire Line
	4650 2900 4850 2900
Wire Wire Line
	4650 3000 4850 3000
Wire Wire Line
	4650 3100 4850 3100
Wire Wire Line
	4650 3200 4850 3200
Wire Wire Line
	4650 3300 4850 3300
Wire Wire Line
	4650 3400 4850 3400
Wire Wire Line
	4650 3500 4850 3500
Wire Wire Line
	4650 3600 4850 3600
$Comp
L power:GND #PWR?
U 1 1 5CC20078
P 4850 2250
AR Path="/5CC0D65F/5CC20078" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5CC20078" Ref="#PWR01402"  Part="1" 
F 0 "#PWR01402" H 4850 2000 50  0001 C CNN
F 1 "GND" H 4855 2077 50  0000 C CNN
F 2 "" H 4850 2250 50  0001 C CNN
F 3 "" H 4850 2250 50  0001 C CNN
	1    4850 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC2007E
P 4850 3900
AR Path="/5CC0D65F/5CC2007E" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5CC2007E" Ref="#PWR01404"  Part="1" 
F 0 "#PWR01404" H 4850 3650 50  0001 C CNN
F 1 "GND" H 4855 3727 50  0000 C CNN
F 2 "" H 4850 3900 50  0001 C CNN
F 3 "" H 4850 3900 50  0001 C CNN
	1    4850 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC20084
P 3250 2250
AR Path="/5CC0D65F/5CC20084" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5CC20084" Ref="#PWR01401"  Part="1" 
F 0 "#PWR01401" H 3250 2000 50  0001 C CNN
F 1 "GND" H 3255 2077 50  0000 C CNN
F 2 "" H 3250 2250 50  0001 C CNN
F 3 "" H 3250 2250 50  0001 C CNN
	1    3250 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CC2008A
P 3250 3900
AR Path="/5CC0D65F/5CC2008A" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5CC2008A" Ref="#PWR01403"  Part="1" 
F 0 "#PWR01403" H 3250 3650 50  0001 C CNN
F 1 "GND" H 3255 3727 50  0000 C CNN
F 2 "" H 3250 3900 50  0001 C CNN
F 3 "" H 3250 3900 50  0001 C CNN
	1    3250 3900
	1    0    0    -1  
$EndComp
Text Label 4850 1250 2    50   ~ 0
AR0
Text Label 4850 1350 2    50   ~ 0
AR1
Text Label 4850 1450 2    50   ~ 0
AR2
Text Label 4850 1550 2    50   ~ 0
AR3
Text Label 4850 1650 2    50   ~ 0
AR4
Text Label 4850 1750 2    50   ~ 0
AR5
Text Label 4850 1850 2    50   ~ 0
AR6
Text Label 4850 1950 2    50   ~ 0
AR7
Text Label 4850 2900 2    50   ~ 0
AR8
Text Label 4850 3000 2    50   ~ 0
AR9
Text Label 4850 3100 2    50   ~ 0
AR10
Text Label 4850 3200 2    50   ~ 0
AR11
Text Label 4850 3300 2    50   ~ 0
AR12
Text Label 4850 3400 2    50   ~ 0
AR13
Text Label 4850 3500 2    50   ~ 0
AR14
Text Label 4850 3600 2    50   ~ 0
AR15
Wire Wire Line
	5850 1250 6100 1250
Wire Wire Line
	5850 1350 6100 1350
Wire Wire Line
	5850 1450 6100 1450
Wire Wire Line
	5850 1550 6100 1550
Wire Wire Line
	5850 1650 6100 1650
Wire Wire Line
	5850 1750 6100 1750
Wire Wire Line
	5850 1850 6100 1850
Wire Wire Line
	5850 1950 6100 1950
Wire Wire Line
	5850 2900 6100 2900
Wire Wire Line
	5850 3000 6100 3000
Wire Wire Line
	5850 3100 6100 3100
Wire Wire Line
	5850 3200 6100 3200
Wire Wire Line
	5850 3300 6100 3300
Wire Wire Line
	5850 3400 6100 3400
Wire Wire Line
	5850 3500 6100 3500
Wire Wire Line
	5850 3600 6100 3600
Wire Wire Line
	2900 2900 3250 2900
Wire Wire Line
	2900 3000 3250 3000
Wire Wire Line
	2900 3100 3250 3100
Wire Wire Line
	2900 3200 3250 3200
Wire Wire Line
	2900 3300 3250 3300
Wire Wire Line
	2900 3400 3250 3400
Wire Wire Line
	2900 3500 3250 3500
Wire Wire Line
	2900 3600 3250 3600
Wire Wire Line
	2900 1250 3250 1250
Wire Wire Line
	2900 1350 3250 1350
Wire Wire Line
	2900 1450 3250 1450
Wire Wire Line
	2900 1550 3250 1550
Wire Wire Line
	2900 1650 3250 1650
Wire Wire Line
	2900 1750 3250 1750
Wire Wire Line
	2900 1850 3250 1850
Wire Wire Line
	2900 1950 3250 1950
Text Label 3250 1250 2    50   ~ 0
IBUS0
Text Label 3250 1350 2    50   ~ 0
IBUS1
Text Label 3250 1450 2    50   ~ 0
IBUS2
Text Label 3250 1550 2    50   ~ 0
IBUS3
Text Label 3250 1650 2    50   ~ 0
IBUS4
Text Label 3250 1750 2    50   ~ 0
IBUS5
Text Label 3250 1850 2    50   ~ 0
IBUS6
Text Label 3250 1950 2    50   ~ 0
IBUS7
Text Label 3250 2900 2    50   ~ 0
IBUS8
Text Label 3250 3000 2    50   ~ 0
IBUS9
Text Label 3250 3100 2    50   ~ 0
IBUS10
Text Label 3250 3200 2    50   ~ 0
IBUS11
Text Label 3250 3300 2    50   ~ 0
IBUS12
Text Label 3250 3400 2    50   ~ 0
IBUS13
Text Label 3250 3500 2    50   ~ 0
IBUS14
Text Label 3250 3600 2    50   ~ 0
IBUS15
Entry Wire Line
	2800 1250 2900 1350
Entry Wire Line
	2800 1350 2900 1450
Entry Wire Line
	2800 1450 2900 1550
Entry Wire Line
	2800 1550 2900 1650
Entry Wire Line
	2800 1650 2900 1750
Entry Wire Line
	2800 1750 2900 1850
Entry Wire Line
	2800 1150 2900 1250
Entry Wire Line
	2800 2900 2900 3000
Entry Wire Line
	2800 3000 2900 3100
Entry Wire Line
	2800 3100 2900 3200
Entry Wire Line
	2800 3200 2900 3300
Entry Wire Line
	2800 3300 2900 3400
Entry Wire Line
	2800 3400 2900 3500
Entry Wire Line
	2800 2800 2900 2900
Entry Wire Line
	2800 3500 2900 3600
Entry Wire Line
	2800 1850 2900 1950
Wire Wire Line
	1650 2450 1350 2450
Wire Wire Line
	1650 2550 1350 2550
Text Label 1450 2550 0    50   ~ 0
~IO
Wire Wire Line
	4850 2150 4200 2150
Text Label 4850 2150 2    50   ~ 0
~ABEN
Text Label 4850 3800 2    50   ~ 0
~ABEN
Wire Wire Line
	4200 3800 4200 4200
Wire Wire Line
	4200 4200 2350 4200
Wire Wire Line
	4200 3800 4850 3800
Wire Wire Line
	4200 2150 4200 2500
Wire Wire Line
	4200 2500 2350 2500
Connection ~ 2350 2500
Wire Wire Line
	2350 2500 2100 2500
Text Label 2100 2500 0    50   ~ 0
~ABEN
Wire Bus Line
	6300 5650 7400 5650
Entry Wire Line
	6100 1250 6200 1350
Entry Wire Line
	6100 1350 6200 1450
Entry Wire Line
	6100 1450 6200 1550
Entry Wire Line
	6100 1550 6200 1650
Entry Wire Line
	6100 1650 6200 1750
Entry Wire Line
	6100 1750 6200 1850
Entry Wire Line
	6100 1850 6200 1950
Entry Wire Line
	6100 1950 6200 2050
Entry Wire Line
	6100 2900 6200 3000
Entry Wire Line
	6100 3000 6200 3100
Entry Wire Line
	6100 3100 6200 3200
Entry Wire Line
	6100 3200 6200 3300
Entry Wire Line
	6100 3300 6200 3400
Entry Wire Line
	6100 3400 6200 3500
Entry Wire Line
	6100 3500 6200 3600
Entry Wire Line
	6100 3600 6200 3700
Text Label 5850 1250 0    50   ~ 0
AB0
Text Label 5850 1350 0    50   ~ 0
AB1
Text Label 5850 1450 0    50   ~ 0
AB2
Text Label 5850 1550 0    50   ~ 0
AB3
Text Label 5850 1650 0    50   ~ 0
AB4
Text Label 5850 1750 0    50   ~ 0
AB5
Text Label 5850 1850 0    50   ~ 0
AB6
Text Label 5850 1950 0    50   ~ 0
AB7
Text Label 5850 2900 0    50   ~ 0
AB8
Text Label 5850 3000 0    50   ~ 0
AB9
Text Label 5850 3100 0    50   ~ 0
AB10
Text Label 5850 3200 0    50   ~ 0
AB11
Text Label 5850 3300 0    50   ~ 0
AB12
Text Label 5850 3400 0    50   ~ 0
AB13
Text Label 5850 3500 0    50   ~ 0
AB14
Text Label 5850 3600 0    50   ~ 0
AB15
Text HLabel 1350 2450 0    50   3State ~ 0
~MEM
Text HLabel 1350 2550 0    50   3State ~ 0
~IO
Text HLabel 7400 5950 2    50   Output ~ 0
AR[8..15]
Text HLabel 7400 5650 2    50   Output ~ 0
AB[0..23]
Text HLabel 1350 900  0    50   3State ~ 0
IBUS[0..15]
$Comp
L alexios:74HC541 U?
U 1 1 5CC20114
P 5350 1750
AR Path="/5CC0D65F/5CC20114" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC20114" Ref="U1402"  Part="1" 
F 0 "U1402" H 5350 2517 50  0000 C CNN
F 1 "74HC541" H 5350 2426 50  0000 C CNN
F 2 "" H 5350 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5350 1750 50  0001 C CNN
	1    5350 1750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5CC2011A
P 5350 3400
AR Path="/5CC0D65F/5CC2011A" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC2011A" Ref="U1405"  Part="1" 
F 0 "U1405" H 5350 4167 50  0000 C CNN
F 1 "74HC541" H 5350 4076 50  0000 C CNN
F 2 "" H 5350 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5350 3400 50  0001 C CNN
	1    5350 3400
	1    0    0    -1  
$EndComp
Wire Bus Line
	1350 900  2700 900 
Entry Bus Bus
	2700 900  2800 1000
Wire Wire Line
	3250 2150 2450 2150
Wire Wire Line
	2450 3800 3250 3800
Connection ~ 2450 2150
Wire Wire Line
	2450 2150 1350 2150
Text Label 1450 2150 0    50   ~ 0
~WAR
$Comp
L alexios:74AHC1G08 U?
U 1 1 5CC20189
P 1950 2500
AR Path="/5CC0D65F/5CC20189" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC20189" Ref="U1403"  Part="1" 
F 0 "U1403" H 1875 2767 50  0000 C CNN
F 1 "74AHC1G08" H 1875 2676 50  0000 C CNN
F 2 "" H 1600 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1600 2500 50  0001 C CNN
	1    1950 2500
	1    0    0    -1  
$EndComp
Text Label 1450 2450 0    50   ~ 0
~MEM
Text HLabel 1350 2150 0    50   Input ~ 0
~WAR
Text Label 3050 2150 0    50   ~ 0
~WAR
Text Label 3050 3800 0    50   ~ 0
~WAR
Text Label 3650 2500 0    50   ~ 0
~ABEN
Text Label 3650 4200 0    50   ~ 0
~ABEN
Entry Bus Bus
	6200 5550 6300 5650
Text Label 6500 5650 0    50   ~ 0
AB[0..23]
Text Label 6200 2750 1    50   ~ 0
AB[0..15]
Wire Bus Line
	7400 5950 4650 5950
Entry Bus Bus
	4550 5850 4650 5950
Text Label 4550 2750 1    50   ~ 0
AR[0..15]
Text Label 2350 3350 1    50   ~ 0
~ABEN
Text Label 2450 3350 1    50   ~ 0
~WAR
Text Label 1450 900  0    50   ~ 0
IBUS[0..15]
Text Label 2800 2900 1    50   ~ 0
IBUS[0..15]
Text Notes 7100 7000 0    197  ~ 39
Address Register (AR)
$Comp
L alexios:74HC574 U?
U 1 1 5CC20022
P 3750 3400
AR Path="/5CC0D65F/5CC20022" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5CC20022" Ref="U1404"  Part="1" 
F 0 "U1404" H 3750 4167 50  0000 C CNN
F 1 "74HC574" H 3750 4076 50  0000 C CNN
F 2 "" H 3750 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3750 3400 50  0001 C CNN
	1    3750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D1B3A76
P 4850 5600
AR Path="/5CC0D65F/5D1B3A76" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D1B3A76" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4850 5350 50  0001 C CNN
F 1 "GND" H 4855 5427 50  0000 C CNN
F 2 "" H 4850 5600 50  0001 C CNN
F 3 "" H 4850 5600 50  0001 C CNN
	1    4850 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D1B3A7C
P 3250 5600
AR Path="/5CC0D65F/5D1B3A7C" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D1B3A7C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3250 5350 50  0001 C CNN
F 1 "GND" H 3255 5427 50  0000 C CNN
F 2 "" H 3250 5600 50  0001 C CNN
F 3 "" H 3250 5600 50  0001 C CNN
	1    3250 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4600 6100 4600
Wire Wire Line
	5850 4700 6100 4700
Wire Wire Line
	5850 4800 6100 4800
Wire Wire Line
	5850 4900 6100 4900
Wire Wire Line
	5850 5000 6100 5000
Wire Wire Line
	5850 5100 6100 5100
Wire Wire Line
	5850 5200 6100 5200
Wire Wire Line
	5850 5300 6100 5300
Wire Wire Line
	2750 4600 3250 4600
Wire Wire Line
	2750 4700 3250 4700
Wire Wire Line
	2750 4800 3250 4800
Wire Wire Line
	2750 4900 3250 4900
Wire Wire Line
	2750 5000 3250 5000
Wire Wire Line
	2750 5100 3250 5100
Wire Wire Line
	2750 5200 3250 5200
Wire Wire Line
	2750 5300 3250 5300
Entry Wire Line
	2650 4600 2750 4700
Entry Wire Line
	2650 4700 2750 4800
Entry Wire Line
	2650 4800 2750 4900
Entry Wire Line
	2650 4900 2750 5000
Entry Wire Line
	2650 5000 2750 5100
Entry Wire Line
	2650 5100 2750 5200
Entry Wire Line
	2650 4500 2750 4600
Entry Wire Line
	2650 5200 2750 5300
Text Label 4850 5500 2    50   ~ 0
~ABEN
Wire Wire Line
	4200 5500 4200 5900
Wire Wire Line
	4200 5900 2350 5900
Wire Wire Line
	4200 5500 4850 5500
Entry Wire Line
	6100 4600 6200 4700
Entry Wire Line
	6100 4700 6200 4800
Entry Wire Line
	6100 4800 6200 4900
Entry Wire Line
	6100 4900 6200 5000
Entry Wire Line
	6100 5000 6200 5100
Entry Wire Line
	6100 5100 6200 5200
Entry Wire Line
	6100 5200 6200 5300
Entry Wire Line
	6100 5300 6200 5400
$Comp
L alexios:74HC541 U?
U 1 1 5D1B3ABE
P 5350 5100
AR Path="/5CC0D65F/5D1B3ABE" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5D1B3ABE" Ref="U?"  Part="1" 
F 0 "U?" H 5350 5867 50  0000 C CNN
F 1 "74HC541" H 5350 5776 50  0000 C CNN
F 2 "" H 5350 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 5350 5100 50  0001 C CNN
	1    5350 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5500 3250 5500
Text Label 3050 5500 0    50   ~ 0
~WAR
Text Label 3650 5900 0    50   ~ 0
~ABEN
Text Label 6200 4350 1    50   ~ 0
AB[0..15]
Text Label 4550 4350 1    50   ~ 0
AR[0..15]
$Comp
L alexios:74HC574 U?
U 1 1 5D1B3ACB
P 3750 5100
AR Path="/5CC0D65F/5D1B3ACB" Ref="U?"  Part="1" 
AR Path="/5CC06F10/5D1B3ACB" Ref="U?"  Part="1" 
F 0 "U?" H 3750 5867 50  0000 C CNN
F 1 "74HC574" H 3750 5776 50  0000 C CNN
F 2 "" H 3750 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3750 5100 50  0001 C CNN
	1    3750 5100
	1    0    0    -1  
$EndComp
Text Label 3250 4600 2    50   ~ 0
AEXT0
Text Label 3250 4700 2    50   ~ 0
AEXT1
Text Label 3250 4800 2    50   ~ 0
AEXT2
Text Label 3250 4900 2    50   ~ 0
AEXT3
Text Label 3250 5000 2    50   ~ 0
AEXT4
Text Label 3250 5100 2    50   ~ 0
AEXT5
Text Label 3250 5200 2    50   ~ 0
AEXT6
Text Label 3250 5300 2    50   ~ 0
AEXT7
Entry Bus Bus
	2550 1500 2650 1600
Wire Bus Line
	2550 1500 1350 1500
Wire Wire Line
	2450 3800 2450 5500
Connection ~ 2450 3800
Wire Wire Line
	2350 4200 2350 5900
Connection ~ 2350 4200
Wire Wire Line
	2350 2500 2350 4200
Wire Wire Line
	2450 2150 2450 3800
Text HLabel 1350 1500 0    50   Input ~ 0
AEXT[0..7]
Wire Wire Line
	4250 4600 4450 4600
Wire Wire Line
	4250 4700 4450 4700
Wire Wire Line
	4250 4800 4450 4800
Wire Wire Line
	4250 4900 4450 4900
Wire Wire Line
	4250 5000 4450 5000
Wire Wire Line
	4250 5100 4450 5100
Wire Wire Line
	4250 5200 4450 5200
Wire Wire Line
	4250 5300 4450 5300
Entry Wire Line
	4450 4600 4550 4700
Entry Wire Line
	4450 4700 4550 4800
Entry Wire Line
	4450 4800 4550 4900
Entry Wire Line
	4450 4900 4550 5000
Entry Wire Line
	4450 5000 4550 5100
Entry Wire Line
	4450 5100 4550 5200
Entry Wire Line
	4450 5200 4550 5300
Entry Wire Line
	4450 5300 4550 5400
Text Label 4250 4600 0    50   ~ 0
AR16
Text Label 4250 4700 0    50   ~ 0
AR17
Text Label 4250 4800 0    50   ~ 0
AR18
Text Label 4250 4900 0    50   ~ 0
AR19
Text Label 4250 5000 0    50   ~ 0
AR20
Text Label 4250 5100 0    50   ~ 0
AR21
Text Label 4250 5200 0    50   ~ 0
AR22
Text Label 4250 5300 0    50   ~ 0
AR23
Wire Wire Line
	4850 4600 4650 4600
Wire Wire Line
	4850 4700 4650 4700
Wire Wire Line
	4850 4800 4650 4800
Wire Wire Line
	4850 4900 4650 4900
Wire Wire Line
	4850 5000 4650 5000
Wire Wire Line
	4850 5100 4650 5100
Wire Wire Line
	4850 5200 4650 5200
Wire Wire Line
	4850 5300 4650 5300
Entry Wire Line
	4650 4600 4550 4700
Entry Wire Line
	4650 4700 4550 4800
Entry Wire Line
	4650 4800 4550 4900
Entry Wire Line
	4650 4900 4550 5000
Entry Wire Line
	4650 5000 4550 5100
Entry Wire Line
	4650 5100 4550 5200
Entry Wire Line
	4650 5200 4550 5300
Entry Wire Line
	4650 5300 4550 5400
Text Label 4850 4600 2    50   ~ 0
AR16
Text Label 4850 4700 2    50   ~ 0
AR17
Text Label 4850 4800 2    50   ~ 0
AR18
Text Label 4850 4900 2    50   ~ 0
AR19
Text Label 4850 5000 2    50   ~ 0
AR20
Text Label 4850 5100 2    50   ~ 0
AR21
Text Label 4850 5200 2    50   ~ 0
AR22
Text Label 4850 5300 2    50   ~ 0
AR23
Text Label 5850 4600 0    50   ~ 0
AB16
Text Label 5850 4700 0    50   ~ 0
AB17
Text Label 5850 4800 0    50   ~ 0
AB18
Text Label 5850 4900 0    50   ~ 0
AB19
Text Label 5850 5000 0    50   ~ 0
AB20
Text Label 5850 5100 0    50   ~ 0
AB21
Text Label 5850 5200 0    50   ~ 0
AB22
Text Label 5850 5300 0    50   ~ 0
AB23
Text Label 1450 1500 0    50   ~ 0
AEXT[0..7]
Text Notes 6300 4750 0    50   ~ 0
2019 Design Update: the AR is now 24 bits wide. It reads its least significant\n16 bits from the IBUS. The most significant 8 bits come from the AEXT bus,\nwhich is driven by one of the eight MBx memory bank registers.
Text Label 6500 5950 0    50   ~ 0
AR[0..15]
Text Notes 7450 6100 0    50   ~ 0
This is used by the I/O address decoder.
$Comp
L alexios:74HC541 U?
U 2 1 5D344130
P 1250 7400
AR Path="/5CC0D65F/5D344130" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344130" Ref="U?"  Part="2" 
F 0 "U?" H 1430 7446 50  0000 L CNN
F 1 "74HC541" H 1430 7355 50  0000 L CNN
F 2 "" H 1250 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 1250 7400 50  0001 C CNN
	2    1250 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D344136
P 2650 6700
AR Path="/5CC0D65F/5D344136" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344136" Ref="U?"  Part="2" 
F 0 "U?" H 2830 6746 50  0000 L CNN
F 1 "74HC574" H 2830 6655 50  0000 L CNN
F 2 "" H 2650 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2650 6700 50  0001 C CNN
	2    2650 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D34413C
P 1300 6700
AR Path="/5CC0D65F/5D34413C" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D34413C" Ref="U?"  Part="2" 
F 0 "U?" H 1480 6746 50  0000 L CNN
F 1 "74HC574" H 1480 6655 50  0000 L CNN
F 2 "" H 1300 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1300 6700 50  0001 C CNN
	2    1300 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D344142
P 950 6700
AR Path="/5CC0D65F/5D344142" Ref="C?"  Part="1" 
AR Path="/5D344142" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D344142" Ref="C?"  Part="1" 
F 0 "C?" H 859 6746 50  0000 R CNN
F 1 "100nF" H 859 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 6700 50  0001 C CNN
F 3 "~" H 950 6700 50  0001 C CNN
	1    950  6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D344148
P 950 6800
AR Path="/5D344148" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D344148" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344148" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 6550 50  0001 C CNN
F 1 "GND" H 955 6627 50  0000 C CNN
F 2 "" H 950 6800 50  0001 C CNN
F 3 "" H 950 6800 50  0001 C CNN
	1    950  6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34414E
P 2300 6700
AR Path="/5CC0D65F/5D34414E" Ref="C?"  Part="1" 
AR Path="/5D34414E" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D34414E" Ref="C?"  Part="1" 
F 0 "C?" H 2209 6746 50  0000 R CNN
F 1 "100nF" H 2209 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 6700 50  0001 C CNN
F 3 "~" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D344154
P 2300 6800
AR Path="/5D344154" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D344154" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344154" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2300 6550 50  0001 C CNN
F 1 "GND" H 2305 6627 50  0000 C CNN
F 2 "" H 2300 6800 50  0001 C CNN
F 3 "" H 2300 6800 50  0001 C CNN
	1    2300 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34415A
P 900 7400
AR Path="/5CC0D65F/5D34415A" Ref="C?"  Part="1" 
AR Path="/5D34415A" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D34415A" Ref="C?"  Part="1" 
F 0 "C?" H 809 7446 50  0000 R CNN
F 1 "100nF" H 809 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 900 7400 50  0001 C CNN
F 3 "~" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D344160
P 900 7500
AR Path="/5D344160" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D344160" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344160" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 900 7250 50  0001 C CNN
F 1 "GND" H 905 7327 50  0000 C CNN
F 2 "" H 900 7500 50  0001 C CNN
F 3 "" H 900 7500 50  0001 C CNN
	1    900  7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D344166
P 2300 7400
AR Path="/5CC0D65F/5D344166" Ref="C?"  Part="1" 
AR Path="/5D344166" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D344166" Ref="C?"  Part="1" 
F 0 "C?" H 2209 7446 50  0000 R CNN
F 1 "100nF" H 2209 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2300 7400 50  0001 C CNN
F 3 "~" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D34416C
P 2300 7500
AR Path="/5D34416C" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D34416C" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D34416C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2300 7250 50  0001 C CNN
F 1 "GND" H 2305 7327 50  0000 C CNN
F 2 "" H 2300 7500 50  0001 C CNN
F 3 "" H 2300 7500 50  0001 C CNN
	1    2300 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D344172
P 950 6600
AR Path="/5CC0D65F/5D344172" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344172" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 6450 50  0001 C CNN
F 1 "+5V" H 965 6773 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D344178
P 2300 6600
AR Path="/5CC0D65F/5D344178" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344178" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2300 6450 50  0001 C CNN
F 1 "+5V" H 2315 6773 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D34417E
P 900 7300
AR Path="/5CC0D65F/5D34417E" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D34417E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 900 7150 50  0001 C CNN
F 1 "+5V" H 915 7473 50  0000 C CNN
F 2 "" H 900 7300 50  0001 C CNN
F 3 "" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
Connection ~ 2300 6800
Connection ~ 2300 6600
Connection ~ 900  7500
Connection ~ 900  7300
$Comp
L power:+5V #PWR?
U 1 1 5D344188
P 2300 7300
AR Path="/5CC0D65F/5D344188" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D344188" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2300 7150 50  0001 C CNN
F 1 "+5V" H 2315 7473 50  0000 C CNN
F 2 "" H 2300 7300 50  0001 C CNN
F 3 "" H 2300 7300 50  0001 C CNN
	1    2300 7300
	1    0    0    -1  
$EndComp
Connection ~ 2300 7300
Connection ~ 2300 7500
$Comp
L alexios:74HC541 U?
U 2 1 5D344190
P 2650 7400
AR Path="/5CC0D65F/5D344190" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344190" Ref="U?"  Part="2" 
F 0 "U?" H 2830 7446 50  0000 L CNN
F 1 "74HC541" H 2830 7355 50  0000 L CNN
F 2 "" H 2650 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 2650 7400 50  0001 C CNN
	2    2650 7400
	1    0    0    -1  
$EndComp
Connection ~ 950  6800
Connection ~ 950  6600
$Comp
L alexios:74HC574 U?
U 2 1 5D344198
P 4050 6700
AR Path="/5CC0D65F/5D344198" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D344198" Ref="U?"  Part="2" 
F 0 "U?" H 4230 6746 50  0000 L CNN
F 1 "74HC574" H 4230 6655 50  0000 L CNN
F 2 "" H 4050 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4050 6700 50  0001 C CNN
	2    4050 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34419E
P 3700 6700
AR Path="/5CC0D65F/5D34419E" Ref="C?"  Part="1" 
AR Path="/5D34419E" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D34419E" Ref="C?"  Part="1" 
F 0 "C?" H 3609 6746 50  0000 R CNN
F 1 "100nF" H 3609 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3700 6700 50  0001 C CNN
F 3 "~" H 3700 6700 50  0001 C CNN
	1    3700 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D3441A4
P 3700 6800
AR Path="/5D3441A4" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D3441A4" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441A4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3700 6550 50  0001 C CNN
F 1 "GND" H 3705 6627 50  0000 C CNN
F 2 "" H 3700 6800 50  0001 C CNN
F 3 "" H 3700 6800 50  0001 C CNN
	1    3700 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D3441AA
P 3700 6600
AR Path="/5CC0D65F/5D3441AA" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441AA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3700 6450 50  0001 C CNN
F 1 "+5V" H 3715 6773 50  0000 C CNN
F 2 "" H 3700 6600 50  0001 C CNN
F 3 "" H 3700 6600 50  0001 C CNN
	1    3700 6600
	1    0    0    -1  
$EndComp
Connection ~ 3700 6800
Connection ~ 3700 6600
$Comp
L Device:C_Small C?
U 1 1 5D3441B2
P 3700 7400
AR Path="/5CC0D65F/5D3441B2" Ref="C?"  Part="1" 
AR Path="/5D3441B2" Ref="C?"  Part="1" 
AR Path="/5CC06F10/5D3441B2" Ref="C?"  Part="1" 
F 0 "C?" H 3609 7446 50  0000 R CNN
F 1 "100nF" H 3609 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3700 7400 50  0001 C CNN
F 3 "~" H 3700 7400 50  0001 C CNN
	1    3700 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D3441B8
P 3700 7500
AR Path="/5D3441B8" Ref="#PWR?"  Part="1" 
AR Path="/5CC0D65F/5D3441B8" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441B8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3700 7250 50  0001 C CNN
F 1 "GND" H 3705 7327 50  0000 C CNN
F 2 "" H 3700 7500 50  0001 C CNN
F 3 "" H 3700 7500 50  0001 C CNN
	1    3700 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D3441BE
P 3700 7300
AR Path="/5CC0D65F/5D3441BE" Ref="#PWR?"  Part="1" 
AR Path="/5CC06F10/5D3441BE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3700 7150 50  0001 C CNN
F 1 "+5V" H 3715 7473 50  0000 C CNN
F 2 "" H 3700 7300 50  0001 C CNN
F 3 "" H 3700 7300 50  0001 C CNN
	1    3700 7300
	1    0    0    -1  
$EndComp
Connection ~ 3700 7300
Connection ~ 3700 7500
$Comp
L alexios:74HC541 U?
U 2 1 5D3441C6
P 4050 7400
AR Path="/5CC0D65F/5D3441C6" Ref="U?"  Part="2" 
AR Path="/5CC06F10/5D3441C6" Ref="U?"  Part="2" 
F 0 "U?" H 4230 7446 50  0000 L CNN
F 1 "74HC541" H 4230 7355 50  0000 L CNN
F 2 "" H 4050 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 4050 7400 50  0001 C CNN
	2    4050 7400
	1    0    0    -1  
$EndComp
Text Notes 6300 4450 0    63   ~ 13
2019 Design Update
Wire Notes Line
	9600 6150 2950 6150
Wire Notes Line
	2950 6150 2950 4250
Wire Notes Line
	2950 4250 9600 4250
Wire Notes Line
	9600 4250 9600 6150
Wire Bus Line
	2650 1600 2650 5200
Wire Bus Line
	2800 1000 2800 3500
Wire Bus Line
	6200 1350 6200 5550
Wire Bus Line
	4550 1350 4550 5850
$EndSCHEMATC
