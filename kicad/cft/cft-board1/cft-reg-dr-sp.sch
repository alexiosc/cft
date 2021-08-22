EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 20
Title "Stack Pointer (SP)"
Date ""
Rev "2023"
Comp ""
Comment1 "REG"
Comment2 ""
Comment3 ""
Comment4 "reg_sp.v"
$EndDescr
Wire Wire Line
	1100 2400 1250 2400
Text HLabel 1100 2400 0    50   Input ~ 0
~FPH
Wire Wire Line
	1100 2250 1150 2250
Text HLabel 1100 2250 0    50   Input ~ 0
~FPL
Text Label 1550 2400 2    50   ~ 0
~FPH
Text Label 1550 2250 2    50   ~ 0
~FPL
$Comp
L power:GND #PWR?
U 1 1 5D9BFF6F
P 10450 4650
AR Path="/5CE16E65/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF6F" Ref="#PWR01118"  Part="1" 
AR Path="/5D9746D0/5D9BFF6F" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF6F" Ref="#PWR?"  Part="1" 
F 0 "#PWR01118" H 10450 4400 50  0001 C CNN
F 1 "GND" H 10455 4477 50  0000 C CNN
F 2 "" H 10450 4650 50  0001 C CNN
F 3 "" H 10450 4650 50  0001 C CNN
	1    10450 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9BFF75
P 10450 3950
AR Path="/5CE16E65/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF75" Ref="#PWR01114"  Part="1" 
AR Path="/5D9746D0/5D9BFF75" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF75" Ref="#PWR?"  Part="1" 
F 0 "#PWR01114" H 10450 3700 50  0001 C CNN
F 1 "GND" H 10455 3777 50  0000 C CNN
F 2 "" H 10450 3950 50  0001 C CNN
F 3 "" H 10450 3950 50  0001 C CNN
	1    10450 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9BFF7B
P 10450 3250
AR Path="/5CE16E65/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF7B" Ref="#PWR01109"  Part="1" 
AR Path="/5D9746D0/5D9BFF7B" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF7B" Ref="#PWR?"  Part="1" 
F 0 "#PWR01109" H 10450 3000 50  0001 C CNN
F 1 "GND" H 10455 3077 50  0000 C CNN
F 2 "" H 10450 3250 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9BFF81
P 10450 2550
AR Path="/5CE16E65/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF81" Ref="#PWR01105"  Part="1" 
AR Path="/5D9746D0/5D9BFF81" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF81" Ref="#PWR?"  Part="1" 
F 0 "#PWR01105" H 10450 2300 50  0001 C CNN
F 1 "GND" H 10455 2377 50  0000 C CNN
F 2 "" H 10450 2550 50  0001 C CNN
F 3 "" H 10450 2550 50  0001 C CNN
	1    10450 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9BFF87
P 10450 2350
AR Path="/5CE16E65/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF87" Ref="#PWR01103"  Part="1" 
AR Path="/5D9746D0/5D9BFF87" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF87" Ref="#PWR?"  Part="1" 
F 0 "#PWR01103" H 10450 2200 50  0001 C CNN
F 1 "+5V" H 10465 2523 50  0000 C CNN
F 2 "" H 10450 2350 50  0001 C CNN
F 3 "" H 10450 2350 50  0001 C CNN
	1    10450 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9BFF8D
P 10450 3050
AR Path="/5CE16E65/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF8D" Ref="#PWR01107"  Part="1" 
AR Path="/5D9746D0/5D9BFF8D" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF8D" Ref="#PWR?"  Part="1" 
F 0 "#PWR01107" H 10450 2900 50  0001 C CNN
F 1 "+5V" H 10465 3223 50  0000 C CNN
F 2 "" H 10450 3050 50  0001 C CNN
F 3 "" H 10450 3050 50  0001 C CNN
	1    10450 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9BFF93
P 10450 3750
AR Path="/5CE16E65/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF93" Ref="#PWR01112"  Part="1" 
AR Path="/5D9746D0/5D9BFF93" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF93" Ref="#PWR?"  Part="1" 
F 0 "#PWR01112" H 10450 3600 50  0001 C CNN
F 1 "+5V" H 10465 3923 50  0000 C CNN
F 2 "" H 10450 3750 50  0001 C CNN
F 3 "" H 10450 3750 50  0001 C CNN
	1    10450 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9BFF99
P 10450 4450
AR Path="/5CE16E65/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9BFF99" Ref="#PWR01116"  Part="1" 
AR Path="/5D9746D0/5D9BFF99" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFF99" Ref="#PWR?"  Part="1" 
F 0 "#PWR01116" H 10450 4300 50  0001 C CNN
F 1 "+5V" H 10465 4623 50  0000 C CNN
F 2 "" H 10450 4450 50  0001 C CNN
F 3 "" H 10450 4450 50  0001 C CNN
	1    10450 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9BFFA6
P 10450 3850
AR Path="/5CC0D65F/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9BFFA6" Ref="C1106"  Part="1" 
AR Path="/5D9746D0/5D9BFFA6" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFFA6" Ref="C?"  Part="1" 
F 0 "C1106" H 10359 3896 50  0000 R CNN
F 1 "100nF" H 10359 3805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 3850 50  0001 C CNN
F 3 "~" H 10450 3850 50  0001 C CNN
	1    10450 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9BFFAD
P 10450 3150
AR Path="/5CC0D65F/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9BFFAD" Ref="C1104"  Part="1" 
AR Path="/5D9746D0/5D9BFFAD" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFFAD" Ref="C?"  Part="1" 
F 0 "C1104" H 10359 3196 50  0000 R CNN
F 1 "100nF" H 10359 3105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 3150 50  0001 C CNN
F 3 "~" H 10450 3150 50  0001 C CNN
	1    10450 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9BFFB4
P 10450 2450
AR Path="/5CC0D65F/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9BFFB4" Ref="C1102"  Part="1" 
AR Path="/5D9746D0/5D9BFFB4" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9BFFB4" Ref="C?"  Part="1" 
F 0 "C1102" H 10359 2496 50  0000 R CNN
F 1 "100nF" H 10359 2405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 2450 50  0001 C CNN
F 3 "~" H 10450 2450 50  0001 C CNN
	1    10450 2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D9BFFBB
P 10800 4550
AR Path="/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9BFFBB" Ref="U1107"  Part="2" 
AR Path="/5D9746D0/5D9BFFBB" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9BFFBB" Ref="U?"  Part="2" 
F 0 "U1107" H 10650 4300 50  0000 L CNN
F 1 "74HCT541" H 10650 4200 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10800 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 4550 50  0001 C CNN
	2    10800 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D9BFFC2
P 10800 3850
AR Path="/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9BFFC2" Ref="U1105"  Part="2" 
AR Path="/5D9746D0/5D9BFFC2" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9BFFC2" Ref="U?"  Part="2" 
F 0 "U1105" H 10650 3600 50  0000 L CNN
F 1 "74HCT541" H 10650 3500 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10800 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 3850 50  0001 C CNN
	2    10800 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HCT541 U?
U 2 1 5D9BFFC9
P 10800 2450
AR Path="/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9BFFC9" Ref="U1102"  Part="2" 
AR Path="/5D9746D0/5D9BFFC9" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9BFFC9" Ref="U?"  Part="2" 
F 0 "U1102" H 10650 2200 50  0000 L CNN
F 1 "74HCT541" H 10650 2100 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10800 2450 50  0001 C CNN
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
Text Label 1550 1050 2    50   ~ 0
~WRITE
Text HLabel 1100 1050 0    50   Input ~ 0
~WRITE
Entry Bus Bus
	1600 650  1700 750 
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
Entry Wire Line
	6350 2800 6250 2900
Entry Wire Line
	6350 2700 6250 2800
Entry Wire Line
	6350 2600 6250 2700
Entry Wire Line
	6350 2500 6250 2600
Entry Wire Line
	6350 1650 6250 1750
Entry Wire Line
	6350 1550 6250 1650
Entry Wire Line
	6350 1450 6250 1550
Entry Wire Line
	6350 1350 6250 1450
Entry Wire Line
	6350 1250 6250 1350
Entry Wire Line
	6350 1150 6250 1250
Entry Wire Line
	6350 1050 6250 1150
Entry Wire Line
	6350 950  6250 1050
Entry Bus Bus
	6250 650  6350 750 
Text Label 4100 5500 1    50   ~ 0
Q[0..15]
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
U 1 1 5D9C0036
P 5400 6250
AR Path="/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C0036" Ref="U1107"  Part="1" 
AR Path="/5D9746D0/5D9C0036" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C0036" Ref="U?"  Part="1" 
F 0 "U1107" H 5400 7017 50  0000 C CNN
F 1 "74HCT541" H 5400 6926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5400 6250 50  0001 C CNN
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
$Comp
L alexios:74HCT541 U?
U 1 1 5D9C005E
P 5400 3100
AR Path="/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C005E" Ref="U1104"  Part="1" 
AR Path="/5D9746D0/5D9C005E" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C005E" Ref="U?"  Part="1" 
F 0 "U1104" H 5400 3867 50  0000 C CNN
F 1 "74HCT541" H 5400 3776 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5400 3100 50  0001 C CNN
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
Text Label 4100 2250 1    50   ~ 0
Q[0..15]
Wire Wire Line
	2500 5000 2050 5000
Wire Wire Line
	2500 6600 2050 6600
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
Wire Wire Line
	3650 3300 3650 3850
Wire Wire Line
	3500 3300 3650 3300
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
U 1 1 5D9C00A8
P 5400 1550
AR Path="/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C00A8" Ref="U1102"  Part="1" 
AR Path="/5D9746D0/5D9C00A8" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00A8" Ref="U?"  Part="1" 
F 0 "U1102" H 5400 2317 50  0000 C CNN
F 1 "74HCT541" H 5400 2226 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5400 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 5400 1550 50  0001 C CNN
	1    5400 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C00AF
P 9550 4650
AR Path="/5CE16E65/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C00AF" Ref="#PWR01117"  Part="1" 
AR Path="/5D9746D0/5D9C00AF" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00AF" Ref="#PWR?"  Part="1" 
F 0 "#PWR01117" H 9550 4400 50  0001 C CNN
F 1 "GND" H 9555 4477 50  0000 C CNN
F 2 "" H 9550 4650 50  0001 C CNN
F 3 "" H 9550 4650 50  0001 C CNN
	1    9550 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C00B5
P 9550 3950
AR Path="/5CE16E65/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C00B5" Ref="#PWR01113"  Part="1" 
AR Path="/5D9746D0/5D9C00B5" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR01113" H 9550 3700 50  0001 C CNN
F 1 "GND" H 9555 3777 50  0000 C CNN
F 2 "" H 9550 3950 50  0001 C CNN
F 3 "" H 9550 3950 50  0001 C CNN
	1    9550 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C00BB
P 9550 3250
AR Path="/5CE16E65/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C00BB" Ref="#PWR01108"  Part="1" 
AR Path="/5D9746D0/5D9C00BB" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR01108" H 9550 3000 50  0001 C CNN
F 1 "GND" H 9555 3077 50  0000 C CNN
F 2 "" H 9550 3250 50  0001 C CNN
F 3 "" H 9550 3250 50  0001 C CNN
	1    9550 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9C00C1
P 9550 4450
AR Path="/5CE16E65/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C00C1" Ref="#PWR01115"  Part="1" 
AR Path="/5D9746D0/5D9C00C1" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00C1" Ref="#PWR?"  Part="1" 
F 0 "#PWR01115" H 9550 4300 50  0001 C CNN
F 1 "+5V" H 9565 4623 50  0000 C CNN
F 2 "" H 9550 4450 50  0001 C CNN
F 3 "" H 9550 4450 50  0001 C CNN
	1    9550 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9C00C7
P 9550 3750
AR Path="/5CE16E65/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C00C7" Ref="#PWR01111"  Part="1" 
AR Path="/5D9746D0/5D9C00C7" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00C7" Ref="#PWR?"  Part="1" 
F 0 "#PWR01111" H 9550 3600 50  0001 C CNN
F 1 "+5V" H 9565 3923 50  0000 C CNN
F 2 "" H 9550 3750 50  0001 C CNN
F 3 "" H 9550 3750 50  0001 C CNN
	1    9550 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9C00CD
P 9550 3050
AR Path="/5CE16E65/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C00CD" Ref="#PWR01106"  Part="1" 
AR Path="/5D9746D0/5D9C00CD" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00CD" Ref="#PWR?"  Part="1" 
F 0 "#PWR01106" H 9550 2900 50  0001 C CNN
F 1 "+5V" H 9565 3223 50  0000 C CNN
F 2 "" H 9550 3050 50  0001 C CNN
F 3 "" H 9550 3050 50  0001 C CNN
	1    9550 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D9C00D3
P 9900 4650
AR Path="/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9C00D3" Ref="U1108"  Part="2" 
AR Path="/5D9746D0/5D9C00D3" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9C00D3" Ref="U?"  Part="2" 
F 0 "U1108" H 9750 4500 50  0000 L CNN
F 1 "74HC193" H 9750 4400 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9900 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 4650 50  0001 C CNN
	2    9900 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9C00DA
P 9550 4550
AR Path="/5CC0D65F/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9C00DA" Ref="C1107"  Part="1" 
AR Path="/5D9746D0/5D9C00DA" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00DA" Ref="C?"  Part="1" 
F 0 "C1107" H 9459 4596 50  0000 R CNN
F 1 "100nF" H 9459 4505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 4550 50  0001 C CNN
F 3 "~" H 9550 4550 50  0001 C CNN
	1    9550 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D9C00E1
P 9900 3950
AR Path="/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9C00E1" Ref="U1106"  Part="2" 
AR Path="/5D9746D0/5D9C00E1" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9C00E1" Ref="U?"  Part="2" 
F 0 "U1106" H 9750 3800 50  0000 L CNN
F 1 "74HC193" H 9750 3700 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9900 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 3950 50  0001 C CNN
	2    9900 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9C00E8
P 9550 3850
AR Path="/5CC0D65F/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9C00E8" Ref="C1105"  Part="1" 
AR Path="/5D9746D0/5D9C00E8" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00E8" Ref="C?"  Part="1" 
F 0 "C1105" H 9459 3896 50  0000 R CNN
F 1 "100nF" H 9459 3805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3850 50  0001 C CNN
F 3 "~" H 9550 3850 50  0001 C CNN
	1    9550 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 2 1 5D9C00EF
P 9900 3250
AR Path="/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9C00EF" Ref="U1103"  Part="2" 
AR Path="/5D9746D0/5D9C00EF" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9C00EF" Ref="U?"  Part="2" 
F 0 "U1103" H 9750 3100 50  0000 L CNN
F 1 "74HC193" H 9750 3000 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9900 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 3250 50  0001 C CNN
	2    9900 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9C00F6
P 9550 3150
AR Path="/5CC0D65F/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9C00F6" Ref="C1103"  Part="1" 
AR Path="/5D9746D0/5D9C00F6" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00F6" Ref="C?"  Part="1" 
F 0 "C1103" H 9459 3196 50  0000 R CNN
F 1 "100nF" H 9459 3105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3150 50  0001 C CNN
F 3 "~" H 9550 3150 50  0001 C CNN
	1    9550 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC193 U?
U 1 1 5D9C00FD
P 3000 1450
AR Path="/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C00FD" Ref="U1101"  Part="1" 
AR Path="/5D9746D0/5D9C00FD" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C00FD" Ref="U?"  Part="1" 
F 0 "U1101" H 3000 2117 50  0000 C CNN
F 1 "74HC193" H 3000 2026 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3000 1450 50  0001 C CNN
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
U 1 1 5D9C0116
P 3000 6200
AR Path="/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C0116" Ref="U1108"  Part="1" 
AR Path="/5D9746D0/5D9C0116" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C0116" Ref="U?"  Part="1" 
F 0 "U1108" H 3000 6867 50  0000 C CNN
F 1 "74HC193" H 3000 6776 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3000 6200 50  0001 C CNN
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
U 1 1 5D9C012D
P 3000 4600
AR Path="/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C012D" Ref="U1106"  Part="1" 
AR Path="/5D9746D0/5D9C012D" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C012D" Ref="U?"  Part="1" 
F 0 "U1106" H 3000 5267 50  0000 C CNN
F 1 "74HC193" H 3000 5176 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3000 4600 50  0001 C CNN
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
U 1 1 5D9C0144
P 3000 3000
AR Path="/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5CE16E65/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C0144" Ref="U1103"  Part="1" 
AR Path="/5D9746D0/5D9C0144" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C0144" Ref="U?"  Part="1" 
F 0 "U1103" H 3000 3667 50  0000 C CNN
F 1 "74HC193" H 3000 3576 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3000 3000 50  0001 C CNN
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
Text HLabel 1100 1350 0    50   Input ~ 0
~DEC
Text Label 1550 1350 2    50   ~ 0
~DEC
Wire Wire Line
	1100 1350 1550 1350
Wire Wire Line
	2250 1850 2500 1850
Text Label 2250 1850 0    50   ~ 0
~DEC
Text Label 2250 3100 0    50   ~ 0
~WRITE
Wire Wire Line
	2250 3100 2500 3100
Wire Wire Line
	3500 5000 3550 5000
Wire Wire Line
	3550 5000 3550 5300
Wire Wire Line
	3550 5300 2050 5300
Wire Wire Line
	2050 5300 2050 6600
Wire Wire Line
	3500 3400 3550 3400
Wire Wire Line
	3550 3400 3550 3750
Wire Wire Line
	3550 3750 2050 3750
Wire Wire Line
	2050 3750 2050 5000
Wire Wire Line
	2500 3400 2050 3400
Wire Wire Line
	2050 3400 2050 2150
Wire Wire Line
	2050 2150 3550 2150
Wire Wire Line
	3550 2150 3550 1850
Wire Wire Line
	3550 1850 3500 1850
Text Label 3500 1050 0    50   ~ 0
Q0
Text Label 3500 1150 0    50   ~ 0
Q1
Text Label 3500 1250 0    50   ~ 0
Q2
Text Label 3500 1350 0    50   ~ 0
Q3
Text Label 3500 2600 0    50   ~ 0
Q4
Text Label 3500 2700 0    50   ~ 0
Q5
Text Label 3500 2800 0    50   ~ 0
Q6
Text Label 3500 2900 0    50   ~ 0
Q7
Text Label 3500 4200 0    50   ~ 0
Q8
Text Label 3500 4300 0    50   ~ 0
Q9
Text Label 3500 4400 0    50   ~ 0
Q10
Text Label 3500 4500 0    50   ~ 0
Q11
Text Label 3500 5800 0    50   ~ 0
Q12
Text Label 3500 5900 0    50   ~ 0
Q13
Text Label 3500 6000 0    50   ~ 0
Q14
Text Label 3500 6100 0    50   ~ 0
Q15
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
$Comp
L alexios:74HCT541 U?
U 1 1 5D9C01AD
P 5400 4700
AR Path="/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D54E677/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D62E1DC/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D79EA4B/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D892D5E/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D9672D4/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D967A8B/5D9C01AD" Ref="U1105"  Part="1" 
AR Path="/5D9746D0/5D9C01AD" Ref="U?"  Part="1" 
AR Path="/5D9BD2A8/5D9C01AD" Ref="U?"  Part="1" 
F 0 "U1105" H 5400 5467 50  0000 C CNN
F 1 "74HCT541" H 5400 5376 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5400 4700 50  0001 C CNN
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
U 2 1 5D9C029D
P 10800 3150
AR Path="/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9C029D" Ref="U1104"  Part="2" 
AR Path="/5D9746D0/5D9C029D" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9C029D" Ref="U?"  Part="2" 
F 0 "U1104" H 10650 2900 50  0000 L CNN
F 1 "74HCT541" H 10650 2800 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10800 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HCT541" H 10800 3150 50  0001 C CNN
	2    10800 3150
	1    0    0    -1  
$EndComp
Connection ~ 9550 2550
Connection ~ 9550 2350
$Comp
L alexios:74HC193 U?
U 2 1 5D9C02A6
P 9900 2550
AR Path="/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5CE16E65/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D54E677/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D62E1DC/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D79EA4B/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D892D5E/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D9672D4/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D967A8B/5D9C02A6" Ref="U1101"  Part="2" 
AR Path="/5D9746D0/5D9C02A6" Ref="U?"  Part="2" 
AR Path="/5D9BD2A8/5D9C02A6" Ref="U?"  Part="2" 
F 0 "U1101" H 9750 2400 50  0000 L CNN
F 1 "74HC193" H 9750 2300 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9900 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC193" H 9900 2550 50  0001 C CNN
	2    9900 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9C02AD
P 9550 2350
AR Path="/5CE16E65/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C02AD" Ref="#PWR01102"  Part="1" 
AR Path="/5D9746D0/5D9C02AD" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02AD" Ref="#PWR?"  Part="1" 
F 0 "#PWR01102" H 9550 2200 50  0001 C CNN
F 1 "+5V" H 9565 2523 50  0000 C CNN
F 2 "" H 9550 2350 50  0001 C CNN
F 3 "" H 9550 2350 50  0001 C CNN
	1    9550 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C02B3
P 9550 2550
AR Path="/5CE16E65/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D54E677/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D62E1DC/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D79EA4B/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D892D5E/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D9672D4/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C02B3" Ref="#PWR01104"  Part="1" 
AR Path="/5D9746D0/5D9C02B3" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR01104" H 9550 2300 50  0001 C CNN
F 1 "GND" H 9555 2377 50  0000 C CNN
F 2 "" H 9550 2550 50  0001 C CNN
F 3 "" H 9550 2550 50  0001 C CNN
	1    9550 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9C02B9
P 9550 2450
AR Path="/5CC0D65F/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D54E677/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5D9C02B9" Ref="C1101"  Part="1" 
AR Path="/5D9746D0/5D9C02B9" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02B9" Ref="C?"  Part="1" 
F 0 "C1101" H 9459 2496 50  0000 R CNN
F 1 "100nF" H 9459 2405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2450 50  0001 C CNN
F 3 "~" H 9550 2450 50  0001 C CNN
	1    9550 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C02C0
P 4900 6750
AR Path="/5D9672D4/5D9C02C0" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C02C0" Ref="#PWR01120"  Part="1" 
AR Path="/5D9746D0/5D9C02C0" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02C0" Ref="#PWR?"  Part="1" 
F 0 "#PWR01120" H 4900 6500 50  0001 C CNN
F 1 "GND" H 4905 6577 50  0000 C CNN
F 2 "" H 4900 6750 50  0001 C CNN
F 3 "" H 4900 6750 50  0001 C CNN
	1    4900 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C02C6
P 4900 5200
AR Path="/5D9672D4/5D9C02C6" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C02C6" Ref="#PWR01119"  Part="1" 
AR Path="/5D9746D0/5D9C02C6" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02C6" Ref="#PWR?"  Part="1" 
F 0 "#PWR01119" H 4900 4950 50  0001 C CNN
F 1 "GND" H 4905 5027 50  0000 C CNN
F 2 "" H 4900 5200 50  0001 C CNN
F 3 "" H 4900 5200 50  0001 C CNN
	1    4900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C02CC
P 4900 3600
AR Path="/5D9672D4/5D9C02CC" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C02CC" Ref="#PWR01110"  Part="1" 
AR Path="/5D9746D0/5D9C02CC" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR01110" H 4900 3350 50  0001 C CNN
F 1 "GND" H 4905 3427 50  0000 C CNN
F 2 "" H 4900 3600 50  0001 C CNN
F 3 "" H 4900 3600 50  0001 C CNN
	1    4900 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C02D2
P 4900 2050
AR Path="/5D9672D4/5D9C02D2" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/5D9C02D2" Ref="#PWR01101"  Part="1" 
AR Path="/5D9746D0/5D9C02D2" Ref="#PWR?"  Part="1" 
AR Path="/5D9BD2A8/5D9C02D2" Ref="#PWR?"  Part="1" 
F 0 "#PWR01101" H 4900 1800 50  0001 C CNN
F 1 "GND" H 4905 1877 50  0000 C CNN
F 2 "" H 4900 2050 50  0001 C CNN
F 3 "" H 4900 2050 50  0001 C CNN
	1    4900 2050
	1    0    0    -1  
$EndComp
Text Label 6500 3800 1    50   ~ 0
FPD[0..7]
NoConn ~ 3500 6500
NoConn ~ 3500 6600
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
Wire Wire Line
	4200 1050 4900 1050
Wire Wire Line
	4200 1150 4900 1150
Wire Wire Line
	4200 1250 4900 1250
Wire Wire Line
	4200 1350 4900 1350
Wire Wire Line
	4200 1450 4900 1450
Wire Wire Line
	4200 1550 4900 1550
Wire Wire Line
	4200 1650 4900 1650
Wire Wire Line
	4200 1750 4900 1750
Text Label 4300 1050 0    50   ~ 0
Q0
Text Label 4300 1150 0    50   ~ 0
Q1
Text Label 4300 1250 0    50   ~ 0
Q2
Text Label 4300 1350 0    50   ~ 0
Q3
Text Label 4300 1450 0    50   ~ 0
Q4
Text Label 4300 1550 0    50   ~ 0
Q5
Text Label 4300 1650 0    50   ~ 0
Q6
Text Label 4300 1750 0    50   ~ 0
Q7
Wire Wire Line
	4200 2600 4900 2600
Wire Wire Line
	4200 2700 4900 2700
Wire Wire Line
	4200 2800 4900 2800
Wire Wire Line
	4200 2900 4900 2900
Wire Wire Line
	4200 3000 4900 3000
Wire Wire Line
	4200 3100 4900 3100
Wire Wire Line
	4200 3200 4900 3200
Wire Wire Line
	4200 3300 4900 3300
Wire Wire Line
	4200 4200 4900 4200
Wire Wire Line
	4200 4300 4900 4300
Wire Wire Line
	4200 4400 4900 4400
Wire Wire Line
	4200 4500 4900 4500
Wire Wire Line
	4200 4600 4900 4600
Wire Wire Line
	4200 4700 4900 4700
Wire Wire Line
	4200 4800 4900 4800
Wire Wire Line
	4200 4900 4900 4900
Text Label 4300 4200 0    50   ~ 0
Q0
Text Label 4300 4300 0    50   ~ 0
Q1
Text Label 4300 4400 0    50   ~ 0
Q2
Text Label 4300 4500 0    50   ~ 0
Q3
Text Label 4300 4600 0    50   ~ 0
Q4
Text Label 4300 4700 0    50   ~ 0
Q5
Text Label 4300 4800 0    50   ~ 0
Q6
Text Label 4300 4900 0    50   ~ 0
Q7
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
Wire Wire Line
	6250 1750 5900 1750
Wire Wire Line
	6250 1650 5900 1650
Wire Wire Line
	6250 1550 5900 1550
Wire Wire Line
	5900 1450 6250 1450
Wire Wire Line
	6250 1350 5900 1350
Wire Wire Line
	6250 1250 5900 1250
Wire Wire Line
	6250 1150 5900 1150
Wire Wire Line
	5900 1050 6250 1050
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
Wire Wire Line
	6250 3300 5900 3300
Wire Wire Line
	6250 3200 5900 3200
Wire Wire Line
	6250 3100 5900 3100
Wire Wire Line
	5900 3000 6250 3000
Wire Wire Line
	6250 2900 5900 2900
Wire Wire Line
	6250 2800 5900 2800
Wire Wire Line
	6250 2700 5900 2700
Wire Wire Line
	5900 2600 6250 2600
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
Text Label 4300 2600 0    50   ~ 0
Q8
Text Label 4300 2700 0    50   ~ 0
Q9
Text Label 4300 2800 0    50   ~ 0
Q10
Text Label 4300 2900 0    50   ~ 0
Q11
Text Label 4300 3000 0    50   ~ 0
Q12
Text Label 4300 3100 0    50   ~ 0
Q13
Text Label 4300 3200 0    50   ~ 0
Q14
Text Label 4300 3300 0    50   ~ 0
Q15
Wire Wire Line
	4200 5750 4900 5750
Wire Wire Line
	4200 5850 4900 5850
Wire Wire Line
	4200 5950 4900 5950
Wire Wire Line
	4200 6050 4900 6050
Wire Wire Line
	4200 6150 4900 6150
Wire Wire Line
	4200 6250 4900 6250
Wire Wire Line
	4200 6350 4900 6350
Wire Wire Line
	4200 6450 4900 6450
Text Label 4300 5750 0    50   ~ 0
Q8
Text Label 4300 5850 0    50   ~ 0
Q9
Text Label 4300 5950 0    50   ~ 0
Q10
Text Label 4300 6050 0    50   ~ 0
Q11
Text Label 4300 6150 0    50   ~ 0
Q12
Text Label 4300 6250 0    50   ~ 0
Q13
Text Label 4300 6350 0    50   ~ 0
Q14
Text Label 4300 6450 0    50   ~ 0
Q15
$Comp
L Device:C_Small C?
U 1 1 5E24BF44
P 10450 4550
AR Path="/5CC0D65F/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5CE16E65/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D54E677/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D62E1DC/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D79EA4B/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D892D5E/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D9672D4/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D967A8B/5E24BF44" Ref="C1108"  Part="1" 
AR Path="/5D9746D0/5E24BF44" Ref="C?"  Part="1" 
AR Path="/5D9BD2A8/5E24BF44" Ref="C?"  Part="1" 
F 0 "C1108" H 10359 4596 50  0000 R CNN
F 1 "100nF" H 10359 4505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 4550 50  0001 C CNN
F 3 "~" H 10450 4550 50  0001 C CNN
	1    10450 4550
	1    0    0    -1  
$EndComp
Connection ~ 10450 4450
Connection ~ 10450 4650
$Comp
L power:GND #PWR0143
U 1 1 6423CDC1
P 2450 2000
F 0 "#PWR0143" H 2450 1750 50  0001 C CNN
F 1 "GND" H 2300 2050 50  0000 C CNN
F 2 "" H 2450 2000 50  0001 C CNN
F 3 "" H 2450 2000 50  0001 C CNN
	1    2450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1950 2450 1950
Wire Wire Line
	2450 1950 2450 2000
$Comp
L power:GND #PWR0144
U 1 1 6424FFC8
P 2450 3550
F 0 "#PWR0144" H 2450 3300 50  0001 C CNN
F 1 "GND" H 2300 3600 50  0000 C CNN
F 2 "" H 2450 3550 50  0001 C CNN
F 3 "" H 2450 3550 50  0001 C CNN
	1    2450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3500 2450 3500
Wire Wire Line
	2450 3500 2450 3550
$Comp
L power:GND #PWR0145
U 1 1 642594D3
P 2450 5150
F 0 "#PWR0145" H 2450 4900 50  0001 C CNN
F 1 "GND" H 2300 5200 50  0000 C CNN
F 2 "" H 2450 5150 50  0001 C CNN
F 3 "" H 2450 5150 50  0001 C CNN
	1    2450 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5100 2450 5100
Wire Wire Line
	2450 5100 2450 5150
$Comp
L power:GND #PWR0146
U 1 1 64262A57
P 2450 6750
F 0 "#PWR0146" H 2450 6500 50  0001 C CNN
F 1 "GND" H 2300 6800 50  0000 C CNN
F 2 "" H 2450 6750 50  0001 C CNN
F 3 "" H 2450 6750 50  0001 C CNN
	1    2450 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6700 2450 6700
Wire Wire Line
	2450 6700 2450 6750
$Comp
L Device:R_Small R?
U 1 1 61D74B13
P 1150 2050
AR Path="/60BB0546/61D74B13" Ref="R?"  Part="1" 
AR Path="/5D9672D4/61D74B13" Ref="R?"  Part="1" 
AR Path="/5D967A8B/61D74B13" Ref="R1101"  Part="1" 
F 0 "R1101" H 1209 2004 50  0000 L CNN
F 1 "10kΩ" H 1209 2095 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 2050 50  0001 C CNN
F 3 "~" H 1150 2050 50  0001 C CNN
	1    1150 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 61D74B19
P 1250 2050
AR Path="/60BB0546/61D74B19" Ref="R?"  Part="1" 
AR Path="/5D9672D4/61D74B19" Ref="R?"  Part="1" 
AR Path="/5D967A8B/61D74B19" Ref="R1102"  Part="1" 
F 0 "R1102" H 1191 2004 50  0000 R CNN
F 1 "10kΩ" H 1191 2095 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1250 2050 50  0001 C CNN
F 3 "~" H 1250 2050 50  0001 C CNN
	1    1250 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 1950 1150 1900
Wire Wire Line
	1150 1900 1200 1900
Wire Wire Line
	1250 1900 1250 1950
$Comp
L power:+5V #PWR?
U 1 1 61D74B22
P 1200 1850
AR Path="/5D9672D4/61D74B22" Ref="#PWR?"  Part="1" 
AR Path="/5D967A8B/61D74B22" Ref="#PWR0180"  Part="1" 
F 0 "#PWR0180" H 1200 1700 50  0001 C CNN
F 1 "+5V" H 1215 2023 50  0000 C CNN
F 2 "" H 1200 1850 50  0001 C CNN
F 3 "" H 1200 1850 50  0001 C CNN
	1    1200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 1850 1200 1900
Connection ~ 1200 1900
Wire Wire Line
	1200 1900 1250 1900
Wire Wire Line
	1150 2150 1150 2250
Connection ~ 1150 2250
Wire Wire Line
	1150 2250 1550 2250
Wire Wire Line
	1250 2150 1250 2400
Connection ~ 1250 2400
Wire Wire Line
	1250 2400 1550 2400
Wire Bus Line
	1100 650  6250 650 
Wire Bus Line
	6500 750  6500 6350
Wire Bus Line
	1700 750  1700 6000
Wire Bus Line
	6350 750  6350 3200
Wire Bus Line
	4100 1150 4100 6550
$EndSCHEMATC
