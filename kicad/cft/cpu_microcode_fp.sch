EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 32 35
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6700 -2700 0    50   ~ 0
Microcode ROMs are wired as a 512K×24 bit\ntable, so all address lines are the same but\ndata out lines differ.
Text HLabel 1100 3450 0    50   Input ~ 0
RADDR0
Text HLabel 1100 3550 0    50   Input ~ 0
RADDR1
Text HLabel 1100 3650 0    50   Input ~ 0
RADDR2
Text HLabel 1100 3750 0    50   Input ~ 0
RADDR3
Text HLabel 1100 3850 0    50   Input ~ 0
RADDR4
Text HLabel 1100 3950 0    50   Input ~ 0
WADDR0
Text HLabel 1100 4050 0    50   Input ~ 0
WADDR1
Text HLabel 1100 4150 0    50   Input ~ 0
WADDR2
Text HLabel 1100 4250 0    50   Input ~ 0
WADDR3
Text HLabel 1100 4350 0    50   Input ~ 0
WADDR4
Text HLabel 1100 4450 0    50   Input ~ 0
COND0
Text HLabel 1100 4550 0    50   Input ~ 0
COND1
Text HLabel 1100 4650 0    50   Input ~ 0
COND2
Text HLabel 1100 4750 0    50   Input ~ 0
COND3
Text HLabel 1100 4850 0    50   Input ~ 0
COND4
Text HLabel 1100 4950 0    50   Input ~ 0
ACTION0
Text HLabel 1100 5050 0    50   Input ~ 0
ACTION1
Text HLabel 1100 5150 0    50   Input ~ 0
ACTION2
Text HLabel 1100 5250 0    50   Input ~ 0
ACTION3
Text HLabel 1100 5350 0    50   Input ~ 0
~MEM
Text HLabel 1100 5450 0    50   Input ~ 0
~IO
Text HLabel 1100 5550 0    50   Input ~ 0
~R
Text HLabel 1100 5650 0    50   Input ~ 0
~WEN
Text HLabel 1100 5750 0    50   Input ~ 0
~END
Text Notes 7050 7000 0    197  ~ 39
µCode Front Panel Buffers
Text Notes 3250 -2950 0    50   ~ 0
2019 Design Update: both micro-Address Vector and\nmicro-Control Vector have changed significantly in this\nversion. Fields are much more vertical now.
Text Notes 3250 -3250 0    63   ~ 13
2019 Design Update
$Comp
L alexios:74ACT16244 U?
U 1 1 5D9354F4
P 5700 1950
AR Path="/5DEAC282/5D9354F4" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9354F4" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9354F4" Ref="U2005"  Part="1" 
F 0 "U2005" H 5700 2717 50  0000 C CNN
F 1 "74ACT16244" H 5700 2626 50  0000 C CNN
F 2 "" H 5575 2325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/74ac16244.pdf" H 5575 2325 50  0001 C CNN
	1    5700 1950
	1    0    0    -1  
$EndComp
Text Label 7450 1750 0    50   ~ 0
~MEM
Text Label 7450 1850 0    50   ~ 0
~IO
Text Label 7450 1950 0    50   ~ 0
~R
Text Label 7450 2050 0    50   ~ 0
~WEN
Text Label 7450 2150 0    50   ~ 0
~END
Text Label 4750 1450 0    50   ~ 0
RADDR0
Text Label 4750 1550 0    50   ~ 0
RADDR1
Text Label 4750 1650 0    50   ~ 0
RADDR2
Text Label 4750 1750 0    50   ~ 0
RADDR3
Text Label 4750 1850 0    50   ~ 0
RADDR4
Text Label 4750 1950 0    50   ~ 0
WADDR0
Text Label 4750 2050 0    50   ~ 0
WADDR1
Text Label 4750 2150 0    50   ~ 0
WADDR2
Text Label 4750 2250 0    50   ~ 0
WADDR3
Text Label 4750 2350 0    50   ~ 0
WADDR4
Text Label 4750 2450 0    50   ~ 0
COND0
Text Label 4750 2550 0    50   ~ 0
COND1
Text Label 4750 2650 0    50   ~ 0
COND2
Text Label 4750 2750 0    50   ~ 0
COND3
Text Label 4750 2850 0    50   ~ 0
COND4
Text Label 4750 2950 0    50   ~ 0
ACTION0
Text Label 7450 1450 0    50   ~ 0
ACTION1
Text Label 7450 1550 0    50   ~ 0
ACTION2
Text Label 7450 1650 0    50   ~ 0
ACTION3
$Comp
L alexios:74ACT16244 U?
U 1 1 5D935512
P 8400 1950
AR Path="/5DEAC282/5D935512" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935512" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935512" Ref="U2006"  Part="1" 
F 0 "U2006" H 8400 2717 50  0000 C CNN
F 1 "74ACT16244" H 8400 2626 50  0000 C CNN
F 2 "" H 8275 2325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/74ac16244.pdf" H 8275 2325 50  0001 C CNN
	1    8400 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1450 6250 1450
Wire Wire Line
	6200 1550 6350 1550
Wire Wire Line
	6200 1650 6450 1650
Wire Wire Line
	6200 1750 6550 1750
Wire Wire Line
	6200 1850 6650 1850
Wire Wire Line
	6200 1950 6750 1950
Wire Wire Line
	6200 2050 6850 2050
Wire Wire Line
	6200 2150 6950 2150
Text Label 7200 1450 2    50   ~ 0
FPD0
Text Label 7200 1550 2    50   ~ 0
FPD1
Text Label 7200 1650 2    50   ~ 0
FPD2
Text Label 7200 1750 2    50   ~ 0
FPD3
Text Label 7200 1850 2    50   ~ 0
FPD4
Text Label 7200 1950 2    50   ~ 0
FPD5
Text Label 7200 2050 2    50   ~ 0
FPD6
Text Label 7200 2150 2    50   ~ 0
FPD7
Wire Wire Line
	6200 2250 6250 2250
Wire Wire Line
	6250 2250 6250 1450
Connection ~ 6250 1450
Wire Wire Line
	6250 1450 7200 1450
Wire Wire Line
	6200 2350 6350 2350
Wire Wire Line
	6350 2350 6350 1550
Connection ~ 6350 1550
Wire Wire Line
	6350 1550 7200 1550
Wire Wire Line
	6200 2450 6450 2450
Wire Wire Line
	6450 2450 6450 1650
Connection ~ 6450 1650
Wire Wire Line
	6450 1650 7200 1650
Wire Wire Line
	6200 2550 6550 2550
Wire Wire Line
	6550 2550 6550 1750
Connection ~ 6550 1750
Wire Wire Line
	6550 1750 7200 1750
Wire Wire Line
	6200 2650 6650 2650
Wire Wire Line
	6650 2650 6650 1850
Connection ~ 6650 1850
Wire Wire Line
	6650 1850 7200 1850
Wire Wire Line
	6200 2750 6750 2750
Wire Wire Line
	6750 2750 6750 1950
Connection ~ 6750 1950
Wire Wire Line
	6750 1950 7200 1950
Wire Wire Line
	6200 2850 6850 2850
Wire Wire Line
	6850 2850 6850 2050
Connection ~ 6850 2050
Wire Wire Line
	6850 2050 7200 2050
Wire Wire Line
	6200 2950 6950 2950
Wire Wire Line
	6950 2950 6950 2150
Connection ~ 6950 2150
Wire Wire Line
	6950 2150 7200 2150
Wire Wire Line
	8900 1450 8950 1450
Wire Wire Line
	8900 1550 9050 1550
Wire Wire Line
	8900 1650 9150 1650
Text Label 9900 1450 2    50   ~ 0
FPD0
Text Label 9900 1550 2    50   ~ 0
FPD1
Text Label 9900 1650 2    50   ~ 0
FPD2
Text Label 9900 1750 2    50   ~ 0
FPD3
Text Label 9900 1850 2    50   ~ 0
FPD4
Text Label 9900 1950 2    50   ~ 0
FPD5
Text Label 9900 2050 2    50   ~ 0
FPD6
Text Label 9900 2150 2    50   ~ 0
FPD7
Wire Wire Line
	8900 2250 8950 2250
Wire Wire Line
	8950 2250 8950 1450
Connection ~ 8950 1450
Wire Wire Line
	8950 1450 9900 1450
Wire Wire Line
	8900 2350 9050 2350
Wire Wire Line
	9050 2350 9050 1550
Connection ~ 9050 1550
Wire Wire Line
	9050 1550 9900 1550
Wire Wire Line
	8900 2450 9150 2450
Wire Wire Line
	9150 2450 9150 1650
Connection ~ 9150 1650
Wire Wire Line
	9150 1650 9900 1650
Wire Wire Line
	7900 3250 7800 3250
Wire Wire Line
	5200 1450 4750 1450
Wire Wire Line
	5200 1550 4750 1550
Wire Wire Line
	5200 1650 4750 1650
Wire Wire Line
	5200 1750 4750 1750
Wire Wire Line
	5200 1850 4750 1850
Wire Wire Line
	5200 1950 4750 1950
Wire Wire Line
	5200 2050 4750 2050
Wire Wire Line
	5200 2150 4750 2150
Wire Wire Line
	5200 2250 4750 2250
Wire Wire Line
	5200 2350 4750 2350
Wire Wire Line
	5200 2450 4750 2450
Wire Wire Line
	5200 2550 4750 2550
Wire Wire Line
	5200 2650 4750 2650
Wire Wire Line
	5200 2750 4750 2750
Wire Wire Line
	5200 2850 4750 2850
Wire Wire Line
	5200 2950 4750 2950
Text Label 2050 1450 0    50   ~ 0
UPC0
Text Label 2050 1550 0    50   ~ 0
UPC1
Text Label 2050 1650 0    50   ~ 0
UPC2
Text Label 2050 1750 0    50   ~ 0
UPC3
Text Label 7450 2350 0    50   ~ 0
~IRQSµC
Text Label 7450 2450 0    50   ~ 0
~RSTHOLD
Text Label 2050 1850 0    50   ~ 0
IDX0
Text Label 2050 1950 0    50   ~ 0
IDX1
Text Label 7450 2250 0    50   ~ 0
IR15
Text Label 2050 2150 0    50   ~ 0
IN-RSVD
Text Label 2050 2050 0    50   ~ 0
COND
Wire Wire Line
	7900 1450 7450 1450
Wire Wire Line
	7900 1550 7450 1550
Wire Wire Line
	7900 1650 7450 1650
Wire Wire Line
	7900 1750 7450 1750
Wire Wire Line
	7900 1850 7450 1850
Wire Wire Line
	7900 1950 7450 1950
Wire Wire Line
	7900 2050 7450 2050
Wire Wire Line
	7900 2150 7450 2150
Wire Wire Line
	7900 2250 7450 2250
Wire Wire Line
	7900 2350 7450 2350
Wire Wire Line
	7900 2450 7450 2450
Wire Wire Line
	7900 2950 7800 2950
Wire Wire Line
	2500 1450 2050 1450
Wire Wire Line
	2500 1550 2050 1550
Wire Wire Line
	2500 1650 2050 1650
Wire Wire Line
	2500 1750 2050 1750
Wire Wire Line
	2500 1850 2050 1850
Wire Wire Line
	2500 1950 2050 1950
Wire Wire Line
	2500 2050 2050 2050
Wire Wire Line
	2500 2150 2050 2150
Wire Wire Line
	7800 2550 7900 2550
Wire Wire Line
	7900 2650 7800 2650
Wire Wire Line
	7800 2650 7800 2550
Connection ~ 7800 2650
Wire Wire Line
	7900 2750 7800 2750
Wire Wire Line
	7800 2750 7800 2650
Connection ~ 7800 2750
Wire Wire Line
	7900 2850 7800 2850
Wire Wire Line
	7800 2950 7800 2850
Wire Wire Line
	7800 2850 7800 2750
Connection ~ 7800 2850
Text Label 4500 1450 2    50   ~ 0
FPD0
Text Label 4500 1550 2    50   ~ 0
FPD1
Text Label 4500 1650 2    50   ~ 0
FPD2
Text Label 4500 1750 2    50   ~ 0
FPD3
Text Label 4500 1850 2    50   ~ 0
FPD4
Text Label 4500 1950 2    50   ~ 0
FPD5
Text Label 4500 2050 2    50   ~ 0
FPD6
Text Label 4500 2150 2    50   ~ 0
FPD7
$Comp
L alexios:74ACT16244 U?
U 2 1 5D93561D
P 8400 4900
AR Path="/5DEAC282/5D93561D" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5D93561D" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5D82AC00/5D93561D" Ref="U2006"  Part="2" 
F 0 "U2006" H 8400 5667 50  0000 C CNN
F 1 "74ACT16244" H 8400 5576 50  0000 C CNN
F 2 "" H 8275 5275 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/74ac16244.pdf" H 8275 5275 50  0001 C CNN
	2    8400 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D935623
P 7900 4500
AR Path="/5CC0D65F/5D935623" Ref="C?"  Part="1" 
AR Path="/5D935623" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D935623" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935623" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935623" Ref="C2015"  Part="1" 
F 0 "C2015" H 7809 4546 50  0000 R CNN
F 1 "100nF" H 7809 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7900 4500 50  0001 C CNN
F 3 "~" H 7900 4500 50  0001 C CNN
	1    7900 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D935629
P 7900 4700
AR Path="/5DEAC282/5D935629" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935629" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935629" Ref="#PWR02033"  Part="1" 
F 0 "#PWR02033" H 7900 4450 50  0001 C CNN
F 1 "GND" H 7905 4527 50  0000 C CNN
F 2 "" H 7900 4700 50  0001 C CNN
F 3 "" H 7900 4700 50  0001 C CNN
	1    7900 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D93562F
P 7900 4400
AR Path="/5DEAC282/5D93562F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D93562F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D93562F" Ref="#PWR02032"  Part="1" 
F 0 "#PWR02032" H 7900 4250 50  0001 C CNN
F 1 "+5V" H 7915 4573 50  0000 C CNN
F 2 "" H 7900 4400 50  0001 C CNN
F 3 "" H 7900 4400 50  0001 C CNN
	1    7900 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4700 7900 4600
$Comp
L Device:C_Small C?
U 1 1 5D935636
P 8900 4500
AR Path="/5CC0D65F/5D935636" Ref="C?"  Part="1" 
AR Path="/5D935636" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D935636" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935636" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935636" Ref="C2017"  Part="1" 
F 0 "C2017" H 8809 4546 50  0000 R CNN
F 1 "100nF" H 8809 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8900 4500 50  0001 C CNN
F 3 "~" H 8900 4500 50  0001 C CNN
	1    8900 4500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D93563C
P 8900 4700
AR Path="/5DEAC282/5D93563C" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D93563C" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D93563C" Ref="#PWR02037"  Part="1" 
F 0 "#PWR02037" H 8900 4450 50  0001 C CNN
F 1 "GND" H 8905 4527 50  0000 C CNN
F 2 "" H 8900 4700 50  0001 C CNN
F 3 "" H 8900 4700 50  0001 C CNN
	1    8900 4700
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D935642
P 8900 4400
AR Path="/5DEAC282/5D935642" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935642" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935642" Ref="#PWR02036"  Part="1" 
F 0 "#PWR02036" H 8900 4250 50  0001 C CNN
F 1 "+5V" H 8915 4573 50  0000 C CNN
F 2 "" H 8900 4400 50  0001 C CNN
F 3 "" H 8900 4400 50  0001 C CNN
	1    8900 4400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 4700 8900 4600
$Comp
L Device:C_Small C?
U 1 1 5D935649
P 7900 5300
AR Path="/5CC0D65F/5D935649" Ref="C?"  Part="1" 
AR Path="/5D935649" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D935649" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935649" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935649" Ref="C2016"  Part="1" 
F 0 "C2016" H 7809 5346 50  0000 R CNN
F 1 "100nF" H 7809 5255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7900 5300 50  0001 C CNN
F 3 "~" H 7900 5300 50  0001 C CNN
	1    7900 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D93564F
P 7900 5500
AR Path="/5DEAC282/5D93564F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D93564F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D93564F" Ref="#PWR02035"  Part="1" 
F 0 "#PWR02035" H 7900 5250 50  0001 C CNN
F 1 "GND" H 7905 5327 50  0000 C CNN
F 2 "" H 7900 5500 50  0001 C CNN
F 3 "" H 7900 5500 50  0001 C CNN
	1    7900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D935655
P 7900 5200
AR Path="/5DEAC282/5D935655" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935655" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935655" Ref="#PWR02034"  Part="1" 
F 0 "#PWR02034" H 7900 5050 50  0001 C CNN
F 1 "+5V" H 7915 5373 50  0000 C CNN
F 2 "" H 7900 5200 50  0001 C CNN
F 3 "" H 7900 5200 50  0001 C CNN
	1    7900 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5500 7900 5400
$Comp
L Device:C_Small C?
U 1 1 5D93565C
P 8900 5300
AR Path="/5CC0D65F/5D93565C" Ref="C?"  Part="1" 
AR Path="/5D93565C" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D93565C" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D93565C" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D93565C" Ref="C2018"  Part="1" 
F 0 "C2018" H 8809 5346 50  0000 R CNN
F 1 "100nF" H 8809 5255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8900 5300 50  0001 C CNN
F 3 "~" H 8900 5300 50  0001 C CNN
	1    8900 5300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D935662
P 8900 5500
AR Path="/5DEAC282/5D935662" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935662" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935662" Ref="#PWR02039"  Part="1" 
F 0 "#PWR02039" H 8900 5250 50  0001 C CNN
F 1 "GND" H 8905 5327 50  0000 C CNN
F 2 "" H 8900 5500 50  0001 C CNN
F 3 "" H 8900 5500 50  0001 C CNN
	1    8900 5500
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D935668
P 8900 5200
AR Path="/5DEAC282/5D935668" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935668" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935668" Ref="#PWR02038"  Part="1" 
F 0 "#PWR02038" H 8900 5050 50  0001 C CNN
F 1 "+5V" H 8915 5373 50  0000 C CNN
F 2 "" H 8900 5200 50  0001 C CNN
F 3 "" H 8900 5200 50  0001 C CNN
	1    8900 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 5500 8900 5400
Connection ~ 7900 4700
Connection ~ 7900 5400
Connection ~ 7900 5200
Connection ~ 7900 5500
Connection ~ 8900 5500
Connection ~ 8900 5200
Connection ~ 8900 5400
Connection ~ 8900 4700
Connection ~ 7900 4600
Connection ~ 8900 4400
Connection ~ 8900 4600
Connection ~ 7900 4400
Connection ~ 5200 4400
Connection ~ 6200 4600
Connection ~ 6200 4400
Connection ~ 5200 4600
Connection ~ 6200 4700
Connection ~ 6200 5400
Connection ~ 6200 5200
Connection ~ 6200 5500
Connection ~ 5200 5500
Connection ~ 5200 5200
Connection ~ 5200 5400
Connection ~ 5200 4700
Wire Wire Line
	6200 5500 6200 5400
$Comp
L power:+5V #PWR?
U 1 1 5D935688
P 6200 5200
AR Path="/5DEAC282/5D935688" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935688" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935688" Ref="#PWR02028"  Part="1" 
F 0 "#PWR02028" H 6200 5050 50  0001 C CNN
F 1 "+5V" H 6215 5373 50  0000 C CNN
F 2 "" H 6200 5200 50  0001 C CNN
F 3 "" H 6200 5200 50  0001 C CNN
	1    6200 5200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D93568E
P 6200 5500
AR Path="/5DEAC282/5D93568E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D93568E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D93568E" Ref="#PWR02029"  Part="1" 
F 0 "#PWR02029" H 6200 5250 50  0001 C CNN
F 1 "GND" H 6205 5327 50  0000 C CNN
F 2 "" H 6200 5500 50  0001 C CNN
F 3 "" H 6200 5500 50  0001 C CNN
	1    6200 5500
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D935694
P 6200 5300
AR Path="/5CC0D65F/5D935694" Ref="C?"  Part="1" 
AR Path="/5D935694" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D935694" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D935694" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D935694" Ref="C2013"  Part="1" 
F 0 "C2013" H 6109 5346 50  0000 R CNN
F 1 "100nF" H 6109 5255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6200 5300 50  0001 C CNN
F 3 "~" H 6200 5300 50  0001 C CNN
	1    6200 5300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 5500 5200 5400
$Comp
L power:+5V #PWR?
U 1 1 5D93569B
P 5200 5200
AR Path="/5DEAC282/5D93569B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D93569B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D93569B" Ref="#PWR02024"  Part="1" 
F 0 "#PWR02024" H 5200 5050 50  0001 C CNN
F 1 "+5V" H 5215 5373 50  0000 C CNN
F 2 "" H 5200 5200 50  0001 C CNN
F 3 "" H 5200 5200 50  0001 C CNN
	1    5200 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9356A1
P 5200 5500
AR Path="/5DEAC282/5D9356A1" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356A1" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356A1" Ref="#PWR02025"  Part="1" 
F 0 "#PWR02025" H 5200 5250 50  0001 C CNN
F 1 "GND" H 5205 5327 50  0000 C CNN
F 2 "" H 5200 5500 50  0001 C CNN
F 3 "" H 5200 5500 50  0001 C CNN
	1    5200 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9356A7
P 5200 5300
AR Path="/5CC0D65F/5D9356A7" Ref="C?"  Part="1" 
AR Path="/5D9356A7" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D9356A7" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356A7" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356A7" Ref="C2011"  Part="1" 
F 0 "C2011" H 5109 5346 50  0000 R CNN
F 1 "100nF" H 5109 5255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5200 5300 50  0001 C CNN
F 3 "~" H 5200 5300 50  0001 C CNN
	1    5200 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4700 6200 4600
$Comp
L power:+5V #PWR?
U 1 1 5D9356AE
P 6200 4400
AR Path="/5DEAC282/5D9356AE" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356AE" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356AE" Ref="#PWR02026"  Part="1" 
F 0 "#PWR02026" H 6200 4250 50  0001 C CNN
F 1 "+5V" H 6215 4573 50  0000 C CNN
F 2 "" H 6200 4400 50  0001 C CNN
F 3 "" H 6200 4400 50  0001 C CNN
	1    6200 4400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9356B4
P 6200 4700
AR Path="/5DEAC282/5D9356B4" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356B4" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356B4" Ref="#PWR02027"  Part="1" 
F 0 "#PWR02027" H 6200 4450 50  0001 C CNN
F 1 "GND" H 6205 4527 50  0000 C CNN
F 2 "" H 6200 4700 50  0001 C CNN
F 3 "" H 6200 4700 50  0001 C CNN
	1    6200 4700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9356BA
P 6200 4500
AR Path="/5CC0D65F/5D9356BA" Ref="C?"  Part="1" 
AR Path="/5D9356BA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D9356BA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356BA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356BA" Ref="C2012"  Part="1" 
F 0 "C2012" H 6109 4546 50  0000 R CNN
F 1 "100nF" H 6109 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6200 4500 50  0001 C CNN
F 3 "~" H 6200 4500 50  0001 C CNN
	1    6200 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 4700 5200 4600
$Comp
L power:+5V #PWR?
U 1 1 5D9356C1
P 5200 4400
AR Path="/5DEAC282/5D9356C1" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356C1" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356C1" Ref="#PWR02022"  Part="1" 
F 0 "#PWR02022" H 5200 4250 50  0001 C CNN
F 1 "+5V" H 5215 4573 50  0000 C CNN
F 2 "" H 5200 4400 50  0001 C CNN
F 3 "" H 5200 4400 50  0001 C CNN
	1    5200 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9356C7
P 5200 4700
AR Path="/5DEAC282/5D9356C7" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356C7" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356C7" Ref="#PWR02023"  Part="1" 
F 0 "#PWR02023" H 5200 4450 50  0001 C CNN
F 1 "GND" H 5205 4527 50  0000 C CNN
F 2 "" H 5200 4700 50  0001 C CNN
F 3 "" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9356CD
P 5200 4500
AR Path="/5CC0D65F/5D9356CD" Ref="C?"  Part="1" 
AR Path="/5D9356CD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D9356CD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D9356CD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5D9356CD" Ref="C2010"  Part="1" 
F 0 "C2010" H 5109 4546 50  0000 R CNN
F 1 "100nF" H 5109 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5200 4500 50  0001 C CNN
F 3 "~" H 5200 4500 50  0001 C CNN
	1    5200 4500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74ACT16244 U?
U 2 1 5D9356D3
P 5700 4900
AR Path="/5DEAC282/5D9356D3" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5D9356D3" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5D82AC00/5D9356D3" Ref="U2005"  Part="2" 
F 0 "U2005" H 5700 5667 50  0000 C CNN
F 1 "74ACT16244" H 5700 5576 50  0000 C CNN
F 2 "" H 5575 5275 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/74ac16244.pdf" H 5575 5275 50  0001 C CNN
	2    5700 4900
	1    0    0    -1  
$EndComp
Entry Wire Line
	9900 1450 10000 1550
Entry Wire Line
	9900 1550 10000 1650
Entry Wire Line
	9900 1650 10000 1750
Entry Wire Line
	9900 1750 10000 1850
Entry Wire Line
	9900 1850 10000 1950
Entry Wire Line
	9900 1950 10000 2050
Entry Wire Line
	9900 2050 10000 2150
Entry Wire Line
	9900 2150 10000 2250
Entry Bus Bus
	10000 2350 10100 2450
Wire Bus Line
	10100 2450 10650 2450
Text HLabel 10650 2450 2    50   Input ~ 0
FPD[0..7]
Text Label 10550 2450 2    50   ~ 0
FPD[0..7]
Text Label 7200 3350 0    50   ~ 0
~FPµA2
Wire Wire Line
	7200 3350 7900 3350
$Comp
L power:GND #PWR02030
U 1 1 5D9EAE2C
P 7800 2950
F 0 "#PWR02030" H 7800 2700 50  0001 C CNN
F 1 "GND" H 7650 2950 50  0000 C CNN
F 2 "" H 7800 2950 50  0001 C CNN
F 3 "" H 7800 2950 50  0001 C CNN
	1    7800 2950
	1    0    0    -1  
$EndComp
Connection ~ 7800 2950
Wire Wire Line
	8900 1850 9900 1850
Wire Wire Line
	8900 1950 9900 1950
Wire Wire Line
	8900 2050 9900 2050
Wire Wire Line
	8900 2150 9900 2150
NoConn ~ 8900 2650
NoConn ~ 8900 2750
NoConn ~ 8900 2850
NoConn ~ 8900 2950
$Comp
L power:GND #PWR02031
U 1 1 5DA21D2C
P 7800 3500
F 0 "#PWR02031" H 7800 3250 50  0001 C CNN
F 1 "GND" H 7805 3327 50  0000 C CNN
F 2 "" H 7800 3500 50  0001 C CNN
F 3 "" H 7800 3500 50  0001 C CNN
	1    7800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3450 7800 3450
Wire Wire Line
	7800 3450 7800 3500
Text Label 4750 3150 0    50   ~ 0
~FPµĊ0
Text Label 4750 3350 0    50   ~ 0
~FPµĊ1
Text Label 7200 3150 0    50   ~ 0
~FPµĊ2
Wire Wire Line
	8900 1750 9900 1750
NoConn ~ 8900 2550
Text HLabel 1100 5950 0    50   Input ~ 0
~FPµA0
Text HLabel 1100 6050 0    50   Input ~ 0
~FPµA1
Text HLabel 1100 6150 0    50   Input ~ 0
~FPµA2
Text HLabel 1100 6350 0    50   Input ~ 0
~FPµC0
Text HLabel 1100 6450 0    50   Input ~ 0
~FPµC1
Text HLabel 1100 6550 0    50   Input ~ 0
~FPµC2
Wire Wire Line
	1100 5950 1550 5950
Wire Wire Line
	1100 6050 1550 6050
Wire Wire Line
	1100 6150 1550 6150
Wire Wire Line
	1100 6350 1550 6350
Wire Wire Line
	1100 6450 1550 6450
Wire Wire Line
	1100 6550 1550 6550
Text Label 2050 2350 0    50   ~ 0
~FPµA0
Text Label 1550 5950 2    50   ~ 0
~FPµA0
Text Label 1550 6050 2    50   ~ 0
~FPµA1
Text Label 1550 6350 2    50   ~ 0
~FPµĊ0
Text Label 1550 6450 2    50   ~ 0
~FPµĊ1
Text Label 1550 6550 2    50   ~ 0
~FPµĊ2
Text Label 1550 6150 2    50   ~ 0
~FPµA2
Text Label 1550 3450 2    50   ~ 0
RADDR0
Text Label 1550 3550 2    50   ~ 0
RADDR1
Text Label 1550 3650 2    50   ~ 0
RADDR2
Text Label 1550 3750 2    50   ~ 0
RADDR3
Text Label 1550 3850 2    50   ~ 0
RADDR4
Text Label 1550 3950 2    50   ~ 0
WADDR0
Text Label 1550 4050 2    50   ~ 0
WADDR1
Text Label 1550 4150 2    50   ~ 0
WADDR2
Text Label 1550 4250 2    50   ~ 0
WADDR3
Text Label 1550 4350 2    50   ~ 0
WADDR4
Text Label 1550 4450 2    50   ~ 0
COND0
Text Label 1550 4550 2    50   ~ 0
COND1
Text Label 1550 4650 2    50   ~ 0
COND2
Text Label 1550 4750 2    50   ~ 0
COND3
Text Label 1550 4850 2    50   ~ 0
COND4
Text Label 1550 4950 2    50   ~ 0
ACTION0
Wire Wire Line
	1100 3450 1550 3450
Wire Wire Line
	1100 3550 1550 3550
Wire Wire Line
	1100 3650 1550 3650
Wire Wire Line
	1100 3750 1550 3750
Wire Wire Line
	1100 3850 1550 3850
Wire Wire Line
	1100 3950 1550 3950
Wire Wire Line
	1100 4050 1550 4050
Wire Wire Line
	1100 4150 1550 4150
Wire Wire Line
	1100 4250 1550 4250
Wire Wire Line
	1100 4350 1550 4350
Wire Wire Line
	1100 4450 1550 4450
Wire Wire Line
	1100 4550 1550 4550
Wire Wire Line
	1100 4650 1550 4650
Wire Wire Line
	1100 4750 1550 4750
Wire Wire Line
	1100 4850 1550 4850
Wire Wire Line
	1100 4950 1550 4950
Text Label 1550 5350 2    50   ~ 0
~MEM
Text Label 1550 5450 2    50   ~ 0
~IO
Text Label 1550 5550 2    50   ~ 0
~R
Text Label 1550 5650 2    50   ~ 0
~WEN
Text Label 1550 5750 2    50   ~ 0
~END
Text Label 1550 5050 2    50   ~ 0
ACTION1
Text Label 1550 5150 2    50   ~ 0
ACTION2
Text Label 1550 5250 2    50   ~ 0
ACTION3
Wire Wire Line
	1100 5050 1550 5050
Wire Wire Line
	1100 5150 1550 5150
Wire Wire Line
	1100 5250 1550 5250
Wire Wire Line
	1100 5350 1550 5350
Wire Wire Line
	1100 5450 1550 5450
Wire Wire Line
	1100 5550 1550 5550
Wire Wire Line
	1100 5650 1550 5650
Wire Wire Line
	1100 5750 1550 5750
Text Label 1550 2250 2    50   ~ 0
IR7
Text Label 1550 2050 2    50   ~ 0
COND
Text Label 1550 2150 2    50   ~ 0
IN-RSVD
Text Label 1550 3050 2    50   ~ 0
IR15
Text Label 1550 2950 2    50   ~ 0
IR14
Text Label 1550 2850 2    50   ~ 0
IR13
Text Label 1550 2750 2    50   ~ 0
IR12
Text Label 1550 2650 2    50   ~ 0
IR11
Text Label 1550 2550 2    50   ~ 0
IR10
Text Label 1550 2450 2    50   ~ 0
IR9
Text Label 1550 2350 2    50   ~ 0
IR8
Text Label 1550 1950 2    50   ~ 0
IDX1
Text Label 1550 1850 2    50   ~ 0
IDX0
Text Label 1550 3250 2    50   ~ 0
~RSTHOLD
Text Label 1550 3150 2    50   ~ 0
~IRQSµC
Text Label 1550 1750 2    50   ~ 0
UPC3
Text Label 1550 1650 2    50   ~ 0
UPC2
Text Label 1550 1550 2    50   ~ 0
UPC1
Text Label 1550 1450 2    50   ~ 0
UPC0
Text HLabel 1100 1450 0    50   Input ~ 0
UPC0
Text HLabel 1100 1550 0    50   Input ~ 0
UPC1
Text HLabel 1100 1650 0    50   Input ~ 0
UPC2
Text HLabel 1100 1750 0    50   Input ~ 0
UPC3
Text HLabel 1100 1850 0    50   Input ~ 0
IDX0
Text HLabel 1100 1950 0    50   Input ~ 0
IDX1
Text HLabel 1100 2050 0    50   Input ~ 0
COND
Text HLabel 1100 2150 0    50   Input ~ 0
IN-RSVD
Text HLabel 1100 2250 0    50   Input ~ 0
IR7
Text HLabel 1100 2350 0    50   Input ~ 0
IR8
Text HLabel 1100 2450 0    50   Input ~ 0
IR9
Text HLabel 1100 2550 0    50   Input ~ 0
IR10
Text HLabel 1100 2650 0    50   Input ~ 0
IR11
Text HLabel 1100 2750 0    50   Input ~ 0
IR12
Text HLabel 1100 2850 0    50   Input ~ 0
IR13
Text HLabel 1100 2950 0    50   Input ~ 0
IR14
Text HLabel 1100 3050 0    50   Input ~ 0
IR15
Text HLabel 1100 3150 0    50   Input ~ 0
~IRQSµC
Text HLabel 1100 3250 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	1100 1450 1550 1450
Wire Wire Line
	1100 1550 1550 1550
Wire Wire Line
	1100 1650 1550 1650
Wire Wire Line
	1100 1750 1550 1750
Wire Wire Line
	1100 1850 1550 1850
Wire Wire Line
	1100 1950 1550 1950
Wire Wire Line
	1100 2050 1550 2050
Wire Wire Line
	1100 2150 1550 2150
Wire Wire Line
	1100 2250 1550 2250
Wire Wire Line
	1100 2350 1550 2350
Wire Wire Line
	1100 2450 1550 2450
Wire Wire Line
	1100 2550 1550 2550
Wire Wire Line
	1100 2650 1550 2650
Wire Wire Line
	1100 2750 1550 2750
Wire Wire Line
	1100 2850 1550 2850
Wire Wire Line
	1100 2950 1550 2950
Wire Wire Line
	1100 3050 1550 3050
Wire Wire Line
	1100 3150 1550 3150
Wire Wire Line
	1100 3250 1550 3250
Wire Wire Line
	5200 4600 4800 4600
Wire Wire Line
	5200 4400 4800 4400
$Comp
L Device:C_Small C?
U 1 1 5DFCE7B9
P 4800 4500
AR Path="/5CC0D65F/5DFCE7B9" Ref="C?"  Part="1" 
AR Path="/5DFCE7B9" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DFCE7B9" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5DFCE7B9" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5DFCE7B9" Ref="C2009"  Part="1" 
F 0 "C2009" H 4709 4546 50  0000 R CNN
F 1 "10µF" H 4709 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4800 4500 50  0001 C CNN
F 3 "~" H 4800 4500 50  0001 C CNN
	1    4800 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4600 7500 4600
Wire Wire Line
	7900 4400 7500 4400
$Comp
L Device:C_Small C?
U 1 1 5DFE4560
P 7500 4500
AR Path="/5CC0D65F/5DFE4560" Ref="C?"  Part="1" 
AR Path="/5DFE4560" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DFE4560" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5DFE4560" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5DFE4560" Ref="C2014"  Part="1" 
F 0 "C2014" H 7409 4546 50  0000 R CNN
F 1 "10µF" H 7409 4455 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7500 4500 50  0001 C CNN
F 3 "~" H 7500 4500 50  0001 C CNN
	1    7500 4500
	1    0    0    -1  
$EndComp
Text Notes 1900 3350 0    50   ~ 0
Only one front panel buffer needed for µAV, µAddr Low.\nThe high bits come from the IR and the 2019 version of the\nfront panel doesn't display the redundant information anymore.\nThis saves one WideBus® buffer and enough cash for a\nmuch-needed coffee. Those things are *expensive*.\n(WideBus® buffers, not coffee)
Wire Wire Line
	3500 1450 4500 1450
Wire Wire Line
	3500 1550 4500 1550
Wire Wire Line
	3500 1650 4500 1650
Wire Wire Line
	3500 1750 4500 1750
Wire Wire Line
	3500 1850 4500 1850
Wire Wire Line
	3500 1950 4500 1950
Wire Wire Line
	3500 2050 4500 2050
Wire Wire Line
	3500 2150 4500 2150
$Comp
L alexios:74HC541 U?
U 1 1 5E0A9015
P 3000 1950
F 0 "U?" H 3000 2717 50  0000 C CNN
F 1 "74HC541" H 3000 2626 50  0000 C CNN
F 2 "" H 3000 1950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 3000 1950 50  0001 C CNN
	1    3000 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2350 2500 2350
$Comp
L power:GND #PWR?
U 1 1 5E0C6AD6
P 2500 2450
F 0 "#PWR?" H 2500 2200 50  0001 C CNN
F 1 "GND" H 2505 2277 50  0000 C CNN
F 2 "" H 2500 2450 50  0001 C CNN
F 3 "" H 2500 2450 50  0001 C CNN
	1    2500 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3150 5200 3150
Wire Wire Line
	4750 3350 5200 3350
$Comp
L power:GND #PWR?
U 1 1 5E0D547B
P 5150 3500
F 0 "#PWR?" H 5150 3250 50  0001 C CNN
F 1 "GND" H 5155 3327 50  0000 C CNN
F 2 "" H 5150 3500 50  0001 C CNN
F 3 "" H 5150 3500 50  0001 C CNN
	1    5150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3250 5150 3250
Wire Wire Line
	5150 3250 5150 3450
Wire Wire Line
	5200 3450 5150 3450
Connection ~ 5150 3450
Wire Wire Line
	5150 3450 5150 3500
Wire Wire Line
	7200 3150 7900 3150
Wire Wire Line
	7800 3250 7800 3450
Wire Bus Line
	10000 1550 10000 2350
Connection ~ 7800 3450
Text Notes 1900 2800 0    50   ~ 10
EXPLANATION
$EndSCHEMATC
