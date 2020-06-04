EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
Title "Program Counter (PC)"
Date ""
Rev "2021"
Comp ""
Comment1 "REG"
Comment2 ""
Comment3 ""
Comment4 "reg_pc.v"
$EndDescr
Wire Wire Line
	1100 1900 1550 1900
Text HLabel 1100 1900 0    50   Input ~ 0
~FPH
Wire Wire Line
	1100 1750 1550 1750
Text HLabel 1100 1750 0    50   Input ~ 0
~FPL
Text Label 1550 1900 2    50   ~ 0
~FPH
Text Label 1550 1750 2    50   ~ 0
~FPL
$Comp
L power:GND #PWR?
U 1 1 5DE45C40
P 10450 4650
AR Path="/5CE16E65/5DE45C40" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C40" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C40" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C40" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C40" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C40" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C40" Ref="#PWR042"  Part="1" 
AR Path="/5D9746C5/5DE45C40" Ref="#PWR?"  Part="1" 
F 0 "#PWR042" H 10450 4400 50  0001 C CNN
F 1 "GND" H 10455 4477 50  0000 C CNN
F 2 "" H 10450 4650 50  0001 C CNN
F 3 "" H 10450 4650 50  0001 C CNN
	1    10450 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE45C41
P 10450 3950
AR Path="/5CE16E65/5DE45C41" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C41" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C41" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C41" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C41" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C41" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C41" Ref="#PWR040"  Part="1" 
AR Path="/5D9746C5/5DE45C41" Ref="#PWR?"  Part="1" 
F 0 "#PWR040" H 10450 3700 50  0001 C CNN
F 1 "GND" H 10455 3777 50  0000 C CNN
F 2 "" H 10450 3950 50  0001 C CNN
F 3 "" H 10450 3950 50  0001 C CNN
	1    10450 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D96D3EB
P 10450 3250
AR Path="/5CE16E65/5D96D3EB" Ref="#PWR?"  Part="1" 
AR Path="/5D96D3EB" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D96D3EB" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D96D3EB" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D96D3EB" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D96D3EB" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D96D3EB" Ref="#PWR038"  Part="1" 
AR Path="/5D9746C5/5D96D3EB" Ref="#PWR?"  Part="1" 
F 0 "#PWR038" H 10450 3000 50  0001 C CNN
F 1 "GND" H 10455 3077 50  0000 C CNN
F 2 "" H 10450 3250 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE45C43
P 10450 2550
AR Path="/5CE16E65/5DE45C43" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C43" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C43" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C43" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C43" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C43" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C43" Ref="#PWR036"  Part="1" 
AR Path="/5D9746C5/5DE45C43" Ref="#PWR?"  Part="1" 
F 0 "#PWR036" H 10450 2300 50  0001 C CNN
F 1 "GND" H 10455 2377 50  0000 C CNN
F 2 "" H 10450 2550 50  0001 C CNN
F 3 "" H 10450 2550 50  0001 C CNN
	1    10450 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE45C44
P 10450 2350
AR Path="/5CE16E65/5DE45C44" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C44" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C44" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C44" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C44" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C44" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C44" Ref="#PWR035"  Part="1" 
AR Path="/5D9746C5/5DE45C44" Ref="#PWR?"  Part="1" 
F 0 "#PWR035" H 10450 2200 50  0001 C CNN
F 1 "+5V" H 10465 2523 50  0000 C CNN
F 2 "" H 10450 2350 50  0001 C CNN
F 3 "" H 10450 2350 50  0001 C CNN
	1    10450 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE45C45
P 10450 3050
AR Path="/5CE16E65/5DE45C45" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C45" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C45" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C45" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C45" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C45" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C45" Ref="#PWR037"  Part="1" 
AR Path="/5D9746C5/5DE45C45" Ref="#PWR?"  Part="1" 
F 0 "#PWR037" H 10450 2900 50  0001 C CNN
F 1 "+5V" H 10465 3223 50  0000 C CNN
F 2 "" H 10450 3050 50  0001 C CNN
F 3 "" H 10450 3050 50  0001 C CNN
	1    10450 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D96D403
P 10450 3750
AR Path="/5CE16E65/5D96D403" Ref="#PWR?"  Part="1" 
AR Path="/5D96D403" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D96D403" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D96D403" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D96D403" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D96D403" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D96D403" Ref="#PWR039"  Part="1" 
AR Path="/5D9746C5/5D96D403" Ref="#PWR?"  Part="1" 
F 0 "#PWR039" H 10450 3600 50  0001 C CNN
F 1 "+5V" H 10465 3923 50  0000 C CNN
F 2 "" H 10450 3750 50  0001 C CNN
F 3 "" H 10450 3750 50  0001 C CNN
	1    10450 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D96D409
P 10450 4450
AR Path="/5CE16E65/5D96D409" Ref="#PWR?"  Part="1" 
AR Path="/5D96D409" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D96D409" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D96D409" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D96D409" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D96D409" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D96D409" Ref="#PWR041"  Part="1" 
AR Path="/5D9746C5/5D96D409" Ref="#PWR?"  Part="1" 
F 0 "#PWR041" H 10450 4300 50  0001 C CNN
F 1 "+5V" H 10465 4623 50  0000 C CNN
F 2 "" H 10450 4450 50  0001 C CNN
F 3 "" H 10450 4450 50  0001 C CNN
	1    10450 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D40F
P 10450 4550
AR Path="/5CC0D65F/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D40F" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D40F" Ref="C16"  Part="1" 
AR Path="/5D9746C5/5D96D40F" Ref="C?"  Part="1" 
F 0 "C16" H 10359 4596 50  0000 R CNN
F 1 "100nF" H 10359 4505 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 4550 50  0001 C CNN
F 3 "~" H 10450 4550 50  0001 C CNN
	1    10450 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D416
P 10450 3850
AR Path="/5CC0D65F/5D96D416" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D416" Ref="C?"  Part="1" 
AR Path="/5D96D416" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D416" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D416" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D416" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D416" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D416" Ref="C15"  Part="1" 
AR Path="/5D9746C5/5D96D416" Ref="C?"  Part="1" 
F 0 "C15" H 10359 3896 50  0000 R CNN
F 1 "100nF" H 10359 3805 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 3850 50  0001 C CNN
F 3 "~" H 10450 3850 50  0001 C CNN
	1    10450 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D41D
P 10450 3150
AR Path="/5CC0D65F/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D41D" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D41D" Ref="C14"  Part="1" 
AR Path="/5D9746C5/5D96D41D" Ref="C?"  Part="1" 
F 0 "C14" H 10359 3196 50  0000 R CNN
F 1 "100nF" H 10359 3105 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 3150 50  0001 C CNN
F 3 "~" H 10450 3150 50  0001 C CNN
	1    10450 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D424
P 10450 2450
AR Path="/5CC0D65F/5D96D424" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D424" Ref="C?"  Part="1" 
AR Path="/5D96D424" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D424" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D424" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D424" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D424" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D424" Ref="C13"  Part="1" 
AR Path="/5D9746C5/5D96D424" Ref="C?"  Part="1" 
F 0 "C13" H 10359 2496 50  0000 R CNN
F 1 "100nF" H 10359 2405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 2450 50  0001 C CNN
F 3 "~" H 10450 2450 50  0001 C CNN
	1    10450 2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D96D42B
P 10800 4550
AR Path="/5D96D42B" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D96D42B" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D96D42B" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D96D42B" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D96D42B" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D96D42B" Ref="U12"  Part="2" 
AR Path="/5D9746C5/5D96D42B" Ref="U?"  Part="2" 
F 0 "U12" H 10650 4300 50  0000 L CNN
F 1 "74HCT541" H 10650 4200 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10800 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 4550 50  0001 C CNN
	2    10800 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5DE45C4D
P 10800 3850
AR Path="/5DE45C4D" Ref="U?"  Part="2" 
AR Path="/5D54E677/5DE45C4D" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5DE45C4D" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5DE45C4D" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5DE45C4D" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5DE45C4D" Ref="U11"  Part="2" 
AR Path="/5D9746C5/5DE45C4D" Ref="U?"  Part="2" 
F 0 "U11" H 10650 3600 50  0000 L CNN
F 1 "74HCT541" H 10650 3500 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10800 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 3850 50  0001 C CNN
	2    10800 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5DE45C4E
P 10800 2450
AR Path="/5DE45C4E" Ref="U?"  Part="2" 
AR Path="/5D54E677/5DE45C4E" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5DE45C4E" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5DE45C4E" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5DE45C4E" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5DE45C4E" Ref="U9"  Part="2" 
AR Path="/5D9746C5/5DE45C4E" Ref="U?"  Part="2" 
F 0 "U9" H 10650 2200 50  0000 L CNN
F 1 "74HCT541" H 10650 2100 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10800 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 2450 50  0001 C CNN
	2    10800 2450
	1    0    0    -1  
$EndComp
Text HLabel 1100 1500 0    50   Input ~ 0
~READ
Text HLabel 1100 1200 0    50   Input ~ 0
~INC
Text Label 1550 1200 2    50   ~ 0
~INC
Wire Wire Line
	1100 1200 1550 1200
Wire Wire Line
	1100 1500 1550 1500
Text Label 1550 1500 2    50   ~ 0
~READ
Wire Wire Line
	1100 1050 1550 1050
Entry Bus Bus
	1600 650  1700 750 
Text Label 1550 900  2    50   ~ 0
RESET
Wire Wire Line
	1100 900  1550 900 
Text HLabel 1100 900  0    50   Input ~ 0
RESET
Text Label 6350 2300 1    50   ~ 0
IBUS[0..15]
Entry Wire Line
	6350 3200 6250 3300
Entry Wire Line
	6350 3100 6250 3200
Entry Wire Line
	6350 3000 6250 3100
Entry Wire Line
	6350 2900 6250 3000
Wire Wire Line
	6250 3300 5900 3300
Wire Wire Line
	6250 3200 5900 3200
Wire Wire Line
	6250 3100 5900 3100
Wire Wire Line
	5900 3000 6250 3000
Entry Wire Line
	6350 2800 6250 2900
Entry Wire Line
	6350 2700 6250 2800
Entry Wire Line
	6350 2600 6250 2700
Entry Wire Line
	6350 2500 6250 2600
Wire Wire Line
	6250 2900 5900 2900
Entry Wire Line
	6350 1650 6250 1750
Entry Wire Line
	6350 1550 6250 1650
Entry Wire Line
	6350 1450 6250 1550
Entry Wire Line
	6350 1350 6250 1450
Wire Wire Line
	6250 1750 5900 1750
Wire Wire Line
	6250 1650 5900 1650
Wire Wire Line
	6250 1550 5900 1550
Wire Wire Line
	5900 1450 6250 1450
Entry Wire Line
	6350 1250 6250 1350
Entry Wire Line
	6350 1150 6250 1250
Entry Wire Line
	6350 1050 6250 1150
Entry Wire Line
	6350 950  6250 1050
Wire Wire Line
	6250 1350 5900 1350
Wire Wire Line
	6250 1250 5900 1250
Wire Wire Line
	6250 1150 5900 1150
Wire Wire Line
	5900 1050 6250 1050
Entry Bus Bus
	6250 650  6350 750 
Text Label 5100 7050 0    50   ~ 0
AC[0..15]
Entry Wire Line
	6400 4900 6500 4800
Entry Wire Line
	6400 4800 6500 4700
Entry Wire Line
	6400 4700 6500 4600
Entry Wire Line
	6400 4600 6500 4500
Entry Wire Line
	6400 4500 6500 4400
Entry Wire Line
	6400 4400 6500 4300
Entry Wire Line
	6400 4300 6500 4200
Entry Wire Line
	6400 4200 6500 4100
Text Label 4650 5100 0    50   ~ 0
~FPL
Wire Wire Line
	4650 6650 4900 6650
Text Label 4650 6650 0    50   ~ 0
~FPH
Text Label 4650 3500 0    50   ~ 0
~READ
Wire Wire Line
	4650 1950 4900 1950
Text Label 4650 1950 0    50   ~ 0
~READ
Entry Wire Line
	4200 6450 4100 6550
Entry Wire Line
	4200 6350 4100 6450
Entry Wire Line
	4200 6250 4100 6350
Entry Wire Line
	4200 6150 4100 6250
Entry Wire Line
	4200 6050 4100 6150
Entry Wire Line
	4200 5850 4100 5950
Entry Wire Line
	4200 5950 4100 6050
Entry Wire Line
	4200 5750 4100 5850
$Comp
L alexios:74HCT541 U?
U 1 1 5DE45C4F
P 5400 6250
AR Path="/5DE45C4F" Ref="U?"  Part="1" 
AR Path="/5D54E677/5DE45C4F" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5DE45C4F" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5DE45C4F" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5DE45C4F" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5DE45C4F" Ref="U12"  Part="1" 
AR Path="/5D9746C5/5DE45C4F" Ref="U?"  Part="1" 
F 0 "U12" H 5400 7017 50  0000 C CNN
F 1 "74HCT541" H 5400 6926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5400 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5400 6250 50  0001 C CNN
	1    5400 6250
	1    0    0    -1  
$EndComp
Entry Wire Line
	4200 4900 4100 5000
Entry Wire Line
	4200 4800 4100 4900
Entry Wire Line
	4200 4700 4100 4800
Entry Wire Line
	4200 4600 4100 4700
Entry Wire Line
	4200 4500 4100 4600
Entry Wire Line
	4200 4300 4100 4400
Entry Wire Line
	4200 4400 4100 4500
Entry Wire Line
	4200 4200 4100 4300
Wire Bus Line
	4200 7050 6550 7050
Entry Wire Line
	4200 3300 4100 3400
Entry Wire Line
	4200 3200 4100 3300
Entry Wire Line
	4200 3100 4100 3200
Entry Wire Line
	4200 3000 4100 3100
Entry Wire Line
	4200 2900 4100 3000
Entry Wire Line
	4200 2700 4100 2800
Entry Wire Line
	4200 2800 4100 2900
Entry Wire Line
	4200 2600 4100 2700
Wire Wire Line
	4900 3300 4200 3300
Wire Wire Line
	4900 3200 4200 3200
Wire Wire Line
	4900 3100 4200 3100
Wire Wire Line
	4900 3000 4200 3000
Wire Wire Line
	4900 2900 4200 2900
$Comp
L alexios:74HCT541 U?
U 1 1 5DE45C50
P 5400 3100
AR Path="/5DE45C50" Ref="U?"  Part="1" 
AR Path="/5D54E677/5DE45C50" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5DE45C50" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5DE45C50" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5DE45C50" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5DE45C50" Ref="U10"  Part="1" 
AR Path="/5D9746C5/5DE45C50" Ref="U?"  Part="1" 
F 0 "U10" H 5400 3867 50  0000 C CNN
F 1 "74HCT541" H 5400 3776 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5400 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5400 3100 50  0001 C CNN
	1    5400 3100
	1    0    0    -1  
$EndComp
Entry Wire Line
	4200 1750 4100 1850
Entry Wire Line
	4200 1650 4100 1750
Entry Wire Line
	4200 1550 4100 1650
Entry Wire Line
	4200 1450 4100 1550
Entry Wire Line
	4200 1350 4100 1450
Entry Wire Line
	4200 1150 4100 1250
Entry Wire Line
	4200 1250 4100 1350
Entry Wire Line
	4200 1050 4100 1150
Wire Wire Line
	4900 1750 4200 1750
Wire Wire Line
	4900 1650 4200 1650
Wire Wire Line
	4900 1550 4200 1550
Wire Wire Line
	4900 1450 4200 1450
Wire Wire Line
	4900 1350 4200 1350
Wire Wire Line
	4900 1250 4200 1250
Wire Wire Line
	4900 1150 4200 1150
Wire Wire Line
	4900 1050 4200 1050
Entry Bus Bus
	4100 6950 4200 7050
Text Label 4100 2250 1    50   ~ 0
PC[0..15]
Wire Wire Line
	2150 6500 2500 6500
Wire Wire Line
	2150 5400 2150 6500
Wire Wire Line
	2150 4900 2500 4900
Wire Wire Line
	2150 3850 2150 4900
Wire Wire Line
	2150 3300 2500 3300
Wire Wire Line
	2150 2250 2150 3300
Wire Wire Line
	3650 2250 2150 2250
Wire Wire Line
	3650 1750 3650 2250
Wire Wire Line
	3500 1750 3650 1750
Wire Wire Line
	2250 6700 2500 6700
Text Label 2250 6700 0    50   ~ 0
RESET
Wire Wire Line
	2250 5100 2500 5100
Text Label 2250 5100 0    50   ~ 0
RESET
Wire Wire Line
	2250 3500 2500 3500
Text Label 2250 3500 0    50   ~ 0
RESET
Text Label 2250 6300 0    50   ~ 0
~WRITE
Wire Wire Line
	2250 6300 2500 6300
Text Label 2250 4700 0    50   ~ 0
~WRITE
Wire Wire Line
	2250 4700 2500 4700
Text Label 2250 1550 0    50   ~ 0
~WRITE
Wire Wire Line
	2250 1750 2500 1750
Wire Wire Line
	2250 1950 2500 1950
Text Label 2250 1950 0    50   ~ 0
RESET
Text Label 2250 1750 0    50   ~ 0
~INC
Wire Wire Line
	2250 1550 2500 1550
Wire Wire Line
	3650 5400 2150 5400
Wire Wire Line
	3650 4900 3650 5400
Wire Wire Line
	3500 4900 3650 4900
Wire Wire Line
	3650 3850 2150 3850
Text Label 2250 6100 0    50   ~ 0
IBUS15
Text Label 2250 6000 0    50   ~ 0
IBUS14
Text Label 2250 5900 0    50   ~ 0
IBUS13
Text Label 2250 5800 0    50   ~ 0
IBUS12
Text Label 2250 4500 0    50   ~ 0
IBUS11
Text Label 2250 4400 0    50   ~ 0
IBUS10
Text Label 2250 4300 0    50   ~ 0
IBUS9
Text Label 2250 4200 0    50   ~ 0
IBUS8
Text Label 2250 2900 0    50   ~ 0
IBUS7
Text Label 2250 2800 0    50   ~ 0
IBUS6
Text Label 2250 2700 0    50   ~ 0
IBUS5
Text Label 2250 2600 0    50   ~ 0
IBUS4
Text Label 2250 1350 0    50   ~ 0
IBUS3
Text Label 2250 1250 0    50   ~ 0
IBUS2
Text Label 2250 1150 0    50   ~ 0
IBUS1
Text Label 2250 1050 0    50   ~ 0
IBUS0
$Comp
L alexios:74HCT541 U?
U 1 1 5D96D528
P 5400 1550
AR Path="/5D96D528" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D96D528" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D96D528" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D96D528" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D96D528" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D96D528" Ref="U9"  Part="1" 
AR Path="/5D9746C5/5D96D528" Ref="U?"  Part="1" 
F 0 "U9" H 5400 2317 50  0000 C CNN
F 1 "74HCT541" H 5400 2226 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5400 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5400 1550 50  0001 C CNN
	1    5400 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D96D52F
P 9550 4650
AR Path="/5CE16E65/5D96D52F" Ref="#PWR?"  Part="1" 
AR Path="/5D96D52F" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D96D52F" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D96D52F" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D96D52F" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D96D52F" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D96D52F" Ref="#PWR034"  Part="1" 
AR Path="/5D9746C5/5D96D52F" Ref="#PWR?"  Part="1" 
F 0 "#PWR034" H 9550 4400 50  0001 C CNN
F 1 "GND" H 9555 4477 50  0000 C CNN
F 2 "" H 9550 4650 50  0001 C CNN
F 3 "" H 9550 4650 50  0001 C CNN
	1    9550 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE45C53
P 9550 3950
AR Path="/5CE16E65/5DE45C53" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C53" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C53" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C53" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C53" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C53" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C53" Ref="#PWR032"  Part="1" 
AR Path="/5D9746C5/5DE45C53" Ref="#PWR?"  Part="1" 
F 0 "#PWR032" H 9550 3700 50  0001 C CNN
F 1 "GND" H 9555 3777 50  0000 C CNN
F 2 "" H 9550 3950 50  0001 C CNN
F 3 "" H 9550 3950 50  0001 C CNN
	1    9550 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE45C54
P 9550 3250
AR Path="/5CE16E65/5DE45C54" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C54" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C54" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C54" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C54" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C54" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C54" Ref="#PWR030"  Part="1" 
AR Path="/5D9746C5/5DE45C54" Ref="#PWR?"  Part="1" 
F 0 "#PWR030" H 9550 3000 50  0001 C CNN
F 1 "GND" H 9555 3077 50  0000 C CNN
F 2 "" H 9550 3250 50  0001 C CNN
F 3 "" H 9550 3250 50  0001 C CNN
	1    9550 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE45C55
P 9550 4450
AR Path="/5CE16E65/5DE45C55" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C55" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C55" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C55" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C55" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C55" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C55" Ref="#PWR033"  Part="1" 
AR Path="/5D9746C5/5DE45C55" Ref="#PWR?"  Part="1" 
F 0 "#PWR033" H 9550 4300 50  0001 C CNN
F 1 "+5V" H 9565 4623 50  0000 C CNN
F 2 "" H 9550 4450 50  0001 C CNN
F 3 "" H 9550 4450 50  0001 C CNN
	1    9550 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE45C56
P 9550 3750
AR Path="/5CE16E65/5DE45C56" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C56" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C56" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C56" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C56" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C56" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C56" Ref="#PWR031"  Part="1" 
AR Path="/5D9746C5/5DE45C56" Ref="#PWR?"  Part="1" 
F 0 "#PWR031" H 9550 3600 50  0001 C CNN
F 1 "+5V" H 9565 3923 50  0000 C CNN
F 2 "" H 9550 3750 50  0001 C CNN
F 3 "" H 9550 3750 50  0001 C CNN
	1    9550 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE45C57
P 9550 3050
AR Path="/5CE16E65/5DE45C57" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C57" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C57" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C57" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C57" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C57" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C57" Ref="#PWR029"  Part="1" 
AR Path="/5D9746C5/5DE45C57" Ref="#PWR?"  Part="1" 
F 0 "#PWR029" H 9550 2900 50  0001 C CNN
F 1 "+5V" H 9565 3223 50  0000 C CNN
F 2 "" H 9550 3050 50  0001 C CNN
F 3 "" H 9550 3050 50  0001 C CNN
	1    9550 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D96D553
P 9900 4650
AR Path="/5D96D553" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D96D553" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D96D553" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D96D553" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D96D553" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D96D553" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D96D553" Ref="U8"  Part="2" 
AR Path="/5D9746C5/5D96D553" Ref="U?"  Part="2" 
F 0 "U8" H 9750 4500 50  0000 L CNN
F 1 "74HC193" H 9750 4400 50  0000 L CNN
F 2 "alexios:SOIC-16" H 9900 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 4650 50  0001 C CNN
	2    9900 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D55A
P 9550 4550
AR Path="/5CC0D65F/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D55A" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D55A" Ref="C12"  Part="1" 
AR Path="/5D9746C5/5D96D55A" Ref="C?"  Part="1" 
F 0 "C12" H 9459 4596 50  0000 R CNN
F 1 "100nF" H 9459 4505 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 4550 50  0001 C CNN
F 3 "~" H 9550 4550 50  0001 C CNN
	1    9550 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5DE45C5A
P 9900 3950
AR Path="/5DE45C5A" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5DE45C5A" Ref="U?"  Part="2" 
AR Path="/5D54E677/5DE45C5A" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5DE45C5A" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5DE45C5A" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5DE45C5A" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5DE45C5A" Ref="U7"  Part="2" 
AR Path="/5D9746C5/5DE45C5A" Ref="U?"  Part="2" 
F 0 "U7" H 9750 3800 50  0000 L CNN
F 1 "74HC193" H 9750 3700 50  0000 L CNN
F 2 "alexios:SOIC-16" H 9900 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 3950 50  0001 C CNN
	2    9900 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D568
P 9550 3850
AR Path="/5CC0D65F/5D96D568" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D568" Ref="C?"  Part="1" 
AR Path="/5D96D568" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D568" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D568" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D568" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D568" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D568" Ref="C11"  Part="1" 
AR Path="/5D9746C5/5D96D568" Ref="C?"  Part="1" 
F 0 "C11" H 9459 3896 50  0000 R CNN
F 1 "100nF" H 9459 3805 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3850 50  0001 C CNN
F 3 "~" H 9550 3850 50  0001 C CNN
	1    9550 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D96D56F
P 9900 3250
AR Path="/5D96D56F" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D96D56F" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D96D56F" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D96D56F" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D96D56F" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D96D56F" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D96D56F" Ref="U6"  Part="2" 
AR Path="/5D9746C5/5D96D56F" Ref="U?"  Part="2" 
F 0 "U6" H 9750 3100 50  0000 L CNN
F 1 "74HC193" H 9750 3000 50  0000 L CNN
F 2 "alexios:SOIC-16" H 9900 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 3250 50  0001 C CNN
	2    9900 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D576
P 9550 3150
AR Path="/5CC0D65F/5D96D576" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D576" Ref="C?"  Part="1" 
AR Path="/5D96D576" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D576" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D576" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D576" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D576" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D576" Ref="C10"  Part="1" 
AR Path="/5D9746C5/5D96D576" Ref="C?"  Part="1" 
F 0 "C10" H 9459 3196 50  0000 R CNN
F 1 "100nF" H 9459 3105 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3150 50  0001 C CNN
F 3 "~" H 9550 3150 50  0001 C CNN
	1    9550 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 1 1 5DE45C5E
P 3000 1450
AR Path="/5DE45C5E" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5DE45C5E" Ref="U?"  Part="1" 
AR Path="/5D54E677/5DE45C5E" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5DE45C5E" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5DE45C5E" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5DE45C5E" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5DE45C5E" Ref="U5"  Part="1" 
AR Path="/5D9746C5/5DE45C5E" Ref="U?"  Part="1" 
F 0 "U5" H 3000 2117 50  0000 C CNN
F 1 "74HC193" H 3000 2026 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3000 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3000 1450 50  0001 C CNN
	1    3000 1450
	1    0    0    -1  
$EndComp
Text Label 1700 2300 1    50   ~ 0
IBUS[0..15]
Text HLabel 1100 650  0    50   Input ~ 0
IBUS[0..15]
Entry Wire Line
	4000 6100 4100 6200
Entry Wire Line
	4000 6000 4100 6100
Entry Wire Line
	4000 5900 4100 6000
Entry Wire Line
	4000 5800 4100 5900
Entry Wire Line
	1700 6000 1800 6100
Entry Wire Line
	1700 5900 1800 6000
Entry Wire Line
	1700 5800 1800 5900
Entry Wire Line
	1700 5700 1800 5800
Wire Wire Line
	3500 6100 4000 6100
Wire Wire Line
	3500 6000 4000 6000
Wire Wire Line
	3500 5900 4000 5900
Wire Wire Line
	3500 5800 4000 5800
Wire Wire Line
	1800 6100 2500 6100
Wire Wire Line
	1800 6000 2500 6000
Wire Wire Line
	1800 5900 2500 5900
Wire Wire Line
	2500 5800 1800 5800
$Comp
L alexios:74HC193 U?
U 1 1 5DE45C5F
P 3000 6200
AR Path="/5DE45C5F" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5DE45C5F" Ref="U?"  Part="1" 
AR Path="/5D54E677/5DE45C5F" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5DE45C5F" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5DE45C5F" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5DE45C5F" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5DE45C5F" Ref="U8"  Part="1" 
AR Path="/5D9746C5/5DE45C5F" Ref="U?"  Part="1" 
F 0 "U8" H 3000 6867 50  0000 C CNN
F 1 "74HC193" H 3000 6776 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3000 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3000 6200 50  0001 C CNN
	1    3000 6200
	1    0    0    -1  
$EndComp
Entry Wire Line
	4000 4500 4100 4600
Entry Wire Line
	4000 4400 4100 4500
Entry Wire Line
	4000 4300 4100 4400
Entry Wire Line
	4000 4200 4100 4300
Entry Wire Line
	1700 4400 1800 4500
Entry Wire Line
	1700 4300 1800 4400
Entry Wire Line
	1700 4200 1800 4300
Entry Wire Line
	1700 4100 1800 4200
Wire Wire Line
	3500 4500 4000 4500
Wire Wire Line
	3500 4400 4000 4400
Wire Wire Line
	3500 4300 4000 4300
Wire Wire Line
	3500 4200 4000 4200
Wire Wire Line
	1800 4500 2500 4500
Wire Wire Line
	1800 4400 2500 4400
Wire Wire Line
	1800 4300 2500 4300
Wire Wire Line
	2500 4200 1800 4200
$Comp
L alexios:74HC193 U?
U 1 1 5DE45C60
P 3000 4600
AR Path="/5DE45C60" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5DE45C60" Ref="U?"  Part="1" 
AR Path="/5D54E677/5DE45C60" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5DE45C60" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5DE45C60" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5DE45C60" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5DE45C60" Ref="U7"  Part="1" 
AR Path="/5D9746C5/5DE45C60" Ref="U?"  Part="1" 
F 0 "U7" H 3000 5267 50  0000 C CNN
F 1 "74HC193" H 3000 5176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3000 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3000 4600 50  0001 C CNN
	1    3000 4600
	1    0    0    -1  
$EndComp
Entry Wire Line
	4000 2900 4100 3000
Entry Wire Line
	4000 2800 4100 2900
Entry Wire Line
	4000 2700 4100 2800
Entry Wire Line
	4000 2600 4100 2700
Entry Wire Line
	1700 2800 1800 2900
Entry Wire Line
	1700 2700 1800 2800
Entry Wire Line
	1700 2600 1800 2700
Entry Wire Line
	1700 2500 1800 2600
Wire Wire Line
	3500 2900 4000 2900
Wire Wire Line
	3500 2800 4000 2800
Wire Wire Line
	3500 2700 4000 2700
Wire Wire Line
	3500 2600 4000 2600
Wire Wire Line
	1800 2900 2500 2900
Wire Wire Line
	1800 2800 2500 2800
Wire Wire Line
	1800 2700 2500 2700
Wire Wire Line
	2500 2600 1800 2600
$Comp
L alexios:74HC193 U?
U 1 1 5D96D5C4
P 3000 3000
AR Path="/5D96D5C4" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D96D5C4" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D96D5C4" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D96D5C4" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D96D5C4" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D96D5C4" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D96D5C4" Ref="U6"  Part="1" 
AR Path="/5D9746C5/5D96D5C4" Ref="U?"  Part="1" 
F 0 "U6" H 3000 3667 50  0000 C CNN
F 1 "74HC193" H 3000 3576 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3000 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 3000 3000 50  0001 C CNN
	1    3000 3000
	1    0    0    -1  
$EndComp
Entry Wire Line
	4000 1350 4100 1450
Entry Wire Line
	4000 1250 4100 1350
Entry Wire Line
	4000 1150 4100 1250
Entry Wire Line
	4000 1050 4100 1150
Entry Wire Line
	1700 1250 1800 1350
Entry Wire Line
	1700 1150 1800 1250
Entry Wire Line
	1700 1050 1800 1150
Entry Wire Line
	1700 950  1800 1050
Wire Wire Line
	3500 1350 4000 1350
Wire Wire Line
	3500 1250 4000 1250
Wire Wire Line
	3500 1150 4000 1150
Wire Wire Line
	3500 1050 4000 1050
Wire Wire Line
	1800 1350 2500 1350
Wire Wire Line
	1800 1250 2500 1250
Wire Wire Line
	1800 1150 2500 1150
Wire Wire Line
	2500 1050 1800 1050
Wire Wire Line
	2250 1850 2500 1850
Text Label 2250 1850 0    50   ~ 0
~DEC
Text Label 2250 3100 0    50   ~ 0
~WRITE
Wire Wire Line
	2250 3100 2500 3100
Text Label 3500 1050 0    50   ~ 0
PC0
Text Label 3500 1150 0    50   ~ 0
PC1
Text Label 3500 1250 0    50   ~ 0
PC2
Text Label 3500 1350 0    50   ~ 0
PC3
Text Label 3500 2600 0    50   ~ 0
PC4
Text Label 3500 2700 0    50   ~ 0
PC5
Text Label 3500 2800 0    50   ~ 0
PC6
Text Label 3500 2900 0    50   ~ 0
PC7
Text Label 3500 4200 0    50   ~ 0
PC8
Text Label 3500 4300 0    50   ~ 0
PC9
Text Label 3500 4400 0    50   ~ 0
PC10
Text Label 3500 4500 0    50   ~ 0
PC11
Text Label 3500 5800 0    50   ~ 0
PC12
Text Label 3500 5900 0    50   ~ 0
PC13
Text Label 3500 6000 0    50   ~ 0
PC14
Text Label 3500 6100 0    50   ~ 0
PC15
Connection ~ 9550 3050
Connection ~ 9550 3250
Connection ~ 9550 3750
Connection ~ 9550 3950
Connection ~ 9550 4450
Connection ~ 9550 4650
Connection ~ 10450 2350
Connection ~ 10450 2550
Connection ~ 10450 3050
Connection ~ 10450 3250
Connection ~ 10450 3750
Connection ~ 10450 3950
Connection ~ 10450 4450
Connection ~ 10450 4650
$Comp
L alexios:74HCT541 U?
U 1 1 5D96D62D
P 5400 4700
AR Path="/5D96D62D" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D96D62D" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D96D62D" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D96D62D" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D96D62D" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D96D62D" Ref="U11"  Part="1" 
AR Path="/5D9746C5/5D96D62D" Ref="U?"  Part="1" 
F 0 "U11" H 5400 5467 50  0000 C CNN
F 1 "74HCT541" H 5400 5376 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5400 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5400 4700 50  0001 C CNN
	1    5400 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3500 4900 3500
Wire Wire Line
	4650 5100 4900 5100
Entry Bus Bus
	6500 750  6600 650 
Wire Bus Line
	6600 650  8700 650 
Text Label 6800 650  0    50   ~ 0
FPD[0..7]
Text HLabel 8700 650  2    50   3State ~ 0
FPD[0..7]
Entry Bus Bus
	6550 7050 6650 6950
Text Label 6500 2300 1    50   ~ 0
FPD[0..7]
Entry Wire Line
	6400 6450 6500 6350
Entry Wire Line
	6400 6350 6500 6250
Entry Wire Line
	6400 6250 6500 6150
Entry Wire Line
	6400 6150 6500 6050
Entry Wire Line
	6400 6050 6500 5950
Entry Wire Line
	6400 5950 6500 5850
Entry Wire Line
	6400 5850 6500 5750
Entry Wire Line
	6400 5750 6500 5650
$Comp
L alexios:74HCT541 U?
U 2 1 5DE45C63
P 10800 3150
AR Path="/5DE45C63" Ref="U?"  Part="2" 
AR Path="/5D54E677/5DE45C63" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5DE45C63" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5DE45C63" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5DE45C63" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5DE45C63" Ref="U10"  Part="2" 
AR Path="/5D9746C5/5DE45C63" Ref="U?"  Part="2" 
F 0 "U10" H 10650 2900 50  0000 L CNN
F 1 "74HCT541" H 10650 2800 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10800 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 3150 50  0001 C CNN
	2    10800 3150
	1    0    0    -1  
$EndComp
Connection ~ 9550 2550
Connection ~ 9550 2350
$Comp
L alexios:74HC193 U?
U 2 1 5DE45C64
P 9900 2550
AR Path="/5DE45C64" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5DE45C64" Ref="U?"  Part="2" 
AR Path="/5D54E677/5DE45C64" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5DE45C64" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5DE45C64" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5DE45C64" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5DE45C64" Ref="U5"  Part="2" 
AR Path="/5D9746C5/5DE45C64" Ref="U?"  Part="2" 
F 0 "U5" H 9750 2400 50  0000 L CNN
F 1 "74HC193" H 9750 2300 50  0000 L CNN
F 2 "alexios:SOIC-16" H 9900 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 2550 50  0001 C CNN
	2    9900 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE45C65
P 9550 2350
AR Path="/5CE16E65/5DE45C65" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C65" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C65" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C65" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C65" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C65" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C65" Ref="#PWR027"  Part="1" 
AR Path="/5D9746C5/5DE45C65" Ref="#PWR?"  Part="1" 
F 0 "#PWR027" H 9550 2200 50  0001 C CNN
F 1 "+5V" H 9565 2523 50  0000 C CNN
F 2 "" H 9550 2350 50  0001 C CNN
F 3 "" H 9550 2350 50  0001 C CNN
	1    9550 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE45C66
P 9550 2550
AR Path="/5CE16E65/5DE45C66" Ref="#PWR?"  Part="1" 
AR Path="/5DE45C66" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5DE45C66" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5DE45C66" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5DE45C66" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5DE45C66" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5DE45C66" Ref="#PWR028"  Part="1" 
AR Path="/5D9746C5/5DE45C66" Ref="#PWR?"  Part="1" 
F 0 "#PWR028" H 9550 2300 50  0001 C CNN
F 1 "GND" H 9555 2377 50  0000 C CNN
F 2 "" H 9550 2550 50  0001 C CNN
F 3 "" H 9550 2550 50  0001 C CNN
	1    9550 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96D739
P 9550 2450
AR Path="/5CC0D65F/5D96D739" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D96D739" Ref="C?"  Part="1" 
AR Path="/5D96D739" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D96D739" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D96D739" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D96D739" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D96D739" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D96D739" Ref="C9"  Part="1" 
AR Path="/5D9746C5/5D96D739" Ref="C?"  Part="1" 
F 0 "C9" H 9459 2496 50  0000 R CNN
F 1 "100nF" H 9459 2405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2450 50  0001 C CNN
F 3 "~" H 9550 2450 50  0001 C CNN
	1    9550 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5D96D740
P 4900 6750
AR Path="/5D9672D4/5D96D740" Ref="#PWR026"  Part="1" 
AR Path="/5D9746C5/5D96D740" Ref="#PWR?"  Part="1" 
F 0 "#PWR026" H 4900 6500 50  0001 C CNN
F 1 "GND" H 4905 6577 50  0000 C CNN
F 2 "" H 4900 6750 50  0001 C CNN
F 3 "" H 4900 6750 50  0001 C CNN
	1    4900 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5D96D746
P 4900 5200
AR Path="/5D9672D4/5D96D746" Ref="#PWR025"  Part="1" 
AR Path="/5D9746C5/5D96D746" Ref="#PWR?"  Part="1" 
F 0 "#PWR025" H 4900 4950 50  0001 C CNN
F 1 "GND" H 4905 5027 50  0000 C CNN
F 2 "" H 4900 5200 50  0001 C CNN
F 3 "" H 4900 5200 50  0001 C CNN
	1    4900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5D96D74C
P 4900 3600
AR Path="/5D9672D4/5D96D74C" Ref="#PWR024"  Part="1" 
AR Path="/5D9746C5/5D96D74C" Ref="#PWR?"  Part="1" 
F 0 "#PWR024" H 4900 3350 50  0001 C CNN
F 1 "GND" H 4905 3427 50  0000 C CNN
F 2 "" H 4900 3600 50  0001 C CNN
F 3 "" H 4900 3600 50  0001 C CNN
	1    4900 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5D96D752
P 4900 2050
AR Path="/5D9672D4/5D96D752" Ref="#PWR023"  Part="1" 
AR Path="/5D9746C5/5D96D752" Ref="#PWR?"  Part="1" 
F 0 "#PWR023" H 4900 1800 50  0001 C CNN
F 1 "GND" H 4905 1877 50  0000 C CNN
F 2 "" H 4900 2050 50  0001 C CNN
F 3 "" H 4900 2050 50  0001 C CNN
	1    4900 2050
	1    0    0    -1  
$EndComp
Entry Bus Bus
	6650 1050 6750 950 
Wire Bus Line
	6750 950  8700 950 
Text Label 6650 2300 1    50   ~ 0
PC[0..15]
Text Label 6500 3800 1    50   ~ 0
FPD[0..7]
Text Label 6650 3800 1    50   ~ 0
PC[0..15]
Text Label 6800 950  0    50   ~ 0
PC[0..15]
Text HLabel 8700 950  2    50   Output ~ 0
PC[10..15]
Wire Wire Line
	5900 4200 6400 4200
Wire Wire Line
	5900 4300 6400 4300
Wire Wire Line
	5900 4400 6400 4400
Wire Wire Line
	5900 4500 6400 4500
Wire Wire Line
	5900 4600 6400 4600
Wire Wire Line
	5900 4700 6400 4700
Wire Wire Line
	5900 4800 6400 4800
Wire Wire Line
	5900 4900 6400 4900
Wire Wire Line
	4900 2800 4200 2800
Wire Wire Line
	4900 2700 4200 2700
Wire Wire Line
	4900 2600 4200 2600
Wire Wire Line
	6250 2800 5900 2800
Wire Wire Line
	6250 2700 5900 2700
Wire Wire Line
	5900 2600 6250 2600
Wire Wire Line
	5900 5750 6400 5750
Wire Wire Line
	5900 5850 6400 5850
Wire Wire Line
	5900 5950 6400 5950
Wire Wire Line
	5900 6050 6400 6050
Wire Wire Line
	5900 6150 6400 6150
Wire Wire Line
	5900 6250 6400 6250
Wire Wire Line
	5900 6350 6400 6350
Wire Wire Line
	5900 6450 6400 6450
Text Label 1550 1050 2    50   ~ 0
~WRITE
Text HLabel 1100 1050 0    50   Input ~ 0
~WRITE
Text Label 4350 1050 0    50   ~ 0
PC0
Text Label 4350 1150 0    50   ~ 0
PC1
Text Label 4350 1250 0    50   ~ 0
PC2
Text Label 4350 1350 0    50   ~ 0
PC3
Text Label 4350 1450 0    50   ~ 0
PC4
Text Label 4350 1550 0    50   ~ 0
PC5
Text Label 4350 1650 0    50   ~ 0
PC6
Text Label 4350 1750 0    50   ~ 0
PC7
Text Label 5950 1050 0    50   ~ 0
IBUS0
Text Label 5950 1150 0    50   ~ 0
IBUS1
Text Label 5950 1250 0    50   ~ 0
IBUS2
Text Label 5950 1350 0    50   ~ 0
IBUS3
Text Label 5950 1450 0    50   ~ 0
IBUS4
Text Label 5950 1550 0    50   ~ 0
IBUS5
Text Label 5950 1650 0    50   ~ 0
IBUS6
Text Label 5950 1750 0    50   ~ 0
IBUS7
Text Label 5950 2600 0    50   ~ 0
IBUS8
Text Label 5950 2700 0    50   ~ 0
IBUS9
Text Label 5950 2800 0    50   ~ 0
IBUS10
Text Label 5950 2900 0    50   ~ 0
IBUS11
Text Label 5950 3000 0    50   ~ 0
IBUS12
Text Label 5950 3100 0    50   ~ 0
IBUS13
Text Label 5950 3200 0    50   ~ 0
IBUS14
Text Label 5950 3300 0    50   ~ 0
IBUS15
Text Label 5950 4200 0    50   ~ 0
FPD0
Text Label 5950 4300 0    50   ~ 0
FPD1
Text Label 5950 4400 0    50   ~ 0
FPD2
Text Label 5950 4500 0    50   ~ 0
FPD3
Text Label 5950 4600 0    50   ~ 0
FPD4
Text Label 5950 4700 0    50   ~ 0
FPD5
Text Label 5950 4800 0    50   ~ 0
FPD6
Text Label 5950 4900 0    50   ~ 0
FPD7
Text Label 5950 5750 0    50   ~ 0
FPD0
Text Label 5950 5850 0    50   ~ 0
FPD1
Text Label 5950 5950 0    50   ~ 0
FPD2
Text Label 5950 6050 0    50   ~ 0
FPD3
Text Label 5950 6150 0    50   ~ 0
FPD4
Text Label 5950 6250 0    50   ~ 0
FPD5
Text Label 5950 6350 0    50   ~ 0
FPD6
Text Label 5950 6450 0    50   ~ 0
FPD7
Text Notes 9150 1200 2    50   ~ 0
Note: only bits 10–15 are output this way.\nThey are used by the AGL to form Page-Local addresses.
NoConn ~ 3500 6500
NoConn ~ 3500 6600
Wire Bus Line
	6650 1050 6650 6950
Wire Wire Line
	3500 3400 3550 3400
Wire Wire Line
	3500 3300 3650 3300
Wire Wire Line
	3650 3300 3650 3850
NoConn ~ 3500 5000
NoConn ~ 3550 3400
NoConn ~ 3500 1850
$Comp
L power:+5V #PWR020
U 1 1 5DE1126E
P 2500 3400
F 0 "#PWR020" H 2500 3250 50  0001 C CNN
F 1 "+5V" V 2515 3528 50  0000 L CNN
F 2 "" H 2500 3400 50  0001 C CNN
F 3 "" H 2500 3400 50  0001 C CNN
	1    2500 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 5DE11D9D
P 2500 5000
F 0 "#PWR021" H 2500 4850 50  0001 C CNN
F 1 "+5V" V 2515 5128 50  0000 L CNN
F 2 "" H 2500 5000 50  0001 C CNN
F 3 "" H 2500 5000 50  0001 C CNN
	1    2500 5000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR022
U 1 1 5DE12D7E
P 2500 6600
F 0 "#PWR022" H 2500 6450 50  0001 C CNN
F 1 "+5V" V 2515 6728 50  0000 L CNN
F 2 "" H 2500 6600 50  0001 C CNN
F 3 "" H 2500 6600 50  0001 C CNN
	1    2500 6600
	0    -1   -1   0   
$EndComp
Text Label 4350 2600 0    50   ~ 0
PC8
Text Label 4350 2700 0    50   ~ 0
PC9
Text Label 4350 2800 0    50   ~ 0
PC10
Text Label 4350 2900 0    50   ~ 0
PC11
Text Label 4350 3000 0    50   ~ 0
PC12
Text Label 4350 3100 0    50   ~ 0
PC13
Text Label 4350 3200 0    50   ~ 0
PC14
Text Label 4350 3300 0    50   ~ 0
PC15
Wire Wire Line
	4900 6450 4200 6450
Wire Wire Line
	4900 6350 4200 6350
Wire Wire Line
	4900 6250 4200 6250
Wire Wire Line
	4900 6150 4200 6150
Wire Wire Line
	4900 6050 4200 6050
Wire Wire Line
	4900 4900 4200 4900
Wire Wire Line
	4900 4800 4200 4800
Wire Wire Line
	4900 4700 4200 4700
Wire Wire Line
	4900 4600 4200 4600
Wire Wire Line
	4900 4500 4200 4500
Wire Wire Line
	4900 4400 4200 4400
Wire Wire Line
	4900 4300 4200 4300
Wire Wire Line
	4900 4200 4200 4200
Wire Wire Line
	4900 5950 4200 5950
Wire Wire Line
	4900 5850 4200 5850
Wire Wire Line
	4900 5750 4200 5750
Text Label 4350 4200 0    50   ~ 0
PC0
Text Label 4350 4300 0    50   ~ 0
PC1
Text Label 4350 4400 0    50   ~ 0
PC2
Text Label 4350 4500 0    50   ~ 0
PC3
Text Label 4350 4600 0    50   ~ 0
PC4
Text Label 4350 4700 0    50   ~ 0
PC5
Text Label 4350 4800 0    50   ~ 0
PC6
Text Label 4350 4900 0    50   ~ 0
PC7
Text Label 4350 5750 0    50   ~ 0
PC8
Text Label 4350 5850 0    50   ~ 0
PC9
Text Label 4350 5950 0    50   ~ 0
PC10
Text Label 4350 6050 0    50   ~ 0
PC11
Text Label 4350 6150 0    50   ~ 0
PC12
Text Label 4350 6250 0    50   ~ 0
PC13
Text Label 4350 6350 0    50   ~ 0
PC14
Text Label 4350 6450 0    50   ~ 0
PC15
NoConn ~ 2250 1850
Wire Bus Line
	1100 650  6250 650 
Wire Bus Line
	6500 750  6500 6350
Wire Bus Line
	1700 750  1700 6000
Wire Bus Line
	6350 750  6350 3200
Wire Bus Line
	4100 1150 4100 6950
$EndSCHEMATC
