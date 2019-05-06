EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L alexios:ATmega64-16AU U?
U 1 1 5CCED7E0
P 4750 3350
F 0 "U?" H 5150 5400 50  0000 C CNN
F 1 "ATmega64-16AU" H 5200 5300 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_14x14mm_P0.8mm" H 2775 5025 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2490-8-bit-avr-microcontroller-atmega64-l_datasheet.pdf" H 4500 3350 50  0001 C CNN
	1    4750 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5CCF43EC
P 4400 5400
F 0 "Y?" H 4050 5500 50  0000 C CNN
F 1 "?MHz" H 4100 5400 50  0000 C CNN
F 2 "" H 4400 5400 50  0001 C CNN
F 3 "~" H 4400 5400 50  0001 C CNN
	1    4400 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5300 4250 5400
Wire Wire Line
	4550 5300 4550 5400
Connection ~ 4250 5400
Wire Wire Line
	4250 5400 4250 5450
Connection ~ 4550 5400
Wire Wire Line
	4550 5400 4550 5450
$Comp
L Device:C_Small C?
U 1 1 5CCF604D
P 4250 5550
F 0 "C?" H 4150 5550 50  0000 R CNN
F 1 "22pF" H 4150 5450 50  0000 R CNN
F 2 "" H 4250 5550 50  0001 C CNN
F 3 "~" H 4250 5550 50  0001 C CNN
	1    4250 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5650 4250 5700
Wire Wire Line
	4250 5700 4550 5700
Wire Wire Line
	4900 5700 4900 5300
Wire Wire Line
	4550 5650 4550 5700
Connection ~ 4550 5700
Wire Wire Line
	4550 5700 4900 5700
$Comp
L power:GND #PWR?
U 1 1 5CCF744E
P 4900 5700
F 0 "#PWR?" H 4900 5450 50  0001 C CNN
F 1 "GND" H 4905 5527 50  0000 C CNN
F 2 "" H 4900 5700 50  0001 C CNN
F 3 "" H 4900 5700 50  0001 C CNN
	1    4900 5700
	1    0    0    -1  
$EndComp
Connection ~ 4900 5700
$Comp
L Device:C_Small C?
U 1 1 5CCF7A7B
P 4550 5550
F 0 "C?" H 4642 5596 50  0000 L CNN
F 1 "22pF" H 4642 5505 50  0000 L CNN
F 2 "" H 4550 5550 50  0001 C CNN
F 3 "~" H 4550 5550 50  0001 C CNN
	1    4550 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CB8CAD9
P 4000 1250
F 0 "C?" H 3909 1296 50  0000 R CNN
F 1 "100nF" H 3909 1205 50  0000 R CNN
F 2 "" H 4000 1250 50  0001 C CNN
F 3 "~" H 4000 1250 50  0001 C CNN
	1    4000 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CB8D474
P 3600 1250
F 0 "C?" H 3508 1296 50  0000 R CNN
F 1 "1uF" H 3508 1205 50  0000 R CNN
F 2 "" H 3600 1250 50  0001 C CNN
F 3 "~" H 3600 1250 50  0001 C CNN
	1    3600 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1350 3600 1400
Wire Wire Line
	4000 1400 4000 1350
Wire Wire Line
	3600 1150 3600 1100
Wire Wire Line
	3600 1100 3800 1100
Wire Wire Line
	4000 1100 4000 1150
Wire Wire Line
	4450 1100 4450 1400
Wire Wire Line
	4450 1100 4650 1100
Wire Wire Line
	4650 1100 4650 1400
Wire Wire Line
	4650 1100 4850 1100
Wire Wire Line
	4850 1100 4850 1400
Connection ~ 4650 1100
$Comp
L power:GND #PWR?
U 1 1 5CB8FAEB
P 3800 1400
F 0 "#PWR?" H 3800 1150 50  0001 C CNN
F 1 "GND" H 3805 1227 50  0000 C CNN
F 2 "" H 3800 1400 50  0001 C CNN
F 3 "" H 3800 1400 50  0001 C CNN
	1    3800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1400 3800 1400
Wire Wire Line
	3800 1400 4000 1400
Connection ~ 3800 1400
$Comp
L power:+5V #PWR?
U 1 1 5CB9129C
P 4850 1100
F 0 "#PWR?" H 4850 950 50  0001 C CNN
F 1 "+5V" H 4865 1273 50  0000 C CNN
F 2 "" H 4850 1100 50  0001 C CNN
F 3 "" H 4850 1100 50  0001 C CNN
	1    4850 1100
	1    0    0    -1  
$EndComp
Connection ~ 4850 1100
$Comp
L power:+5V #PWR?
U 1 1 5CB92A3D
P 3800 1100
F 0 "#PWR?" H 3800 950 50  0001 C CNN
F 1 "+5V" H 3815 1273 50  0000 C CNN
F 2 "" H 3800 1100 50  0001 C CNN
F 3 "" H 3800 1100 50  0001 C CNN
	1    3800 1100
	1    0    0    -1  
$EndComp
Connection ~ 3800 1100
Wire Wire Line
	3800 1100 4000 1100
$Comp
L alexios:74HC541 U?
U 1 1 5CB99264
P 7900 2150
F 0 "U?" H 7900 2917 50  0000 C CNN
F 1 "74HC541" H 7900 2826 50  0000 C CNN
F 2 "" H 7900 2150 50  0001 C CNN
F 3 "" H 7900 2150 50  0001 C CNN
	1    7900 2150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5CB9F216
P 7900 3650
F 0 "U?" H 7900 4417 50  0000 C CNN
F 1 "74HC541" H 7900 4326 50  0000 C CNN
F 2 "" H 7900 3650 50  0001 C CNN
F 3 "" H 7900 3650 50  0001 C CNN
	1    7900 3650
	1    0    0    -1  
$EndComp
Text Notes 1350 2350 0    50   ~ 0
DFP Read Sources:\n\n* 2 IBUS, 16 bit\n* 2 DBUS, 16 bit\n* 2 ABUS, 16 bit\n* 1 AEXT, 8 bit\n* 2 PC, 16\n* 2 AC, 16\n* 2 DR, 16\n* 3 UCV, 24 bits (3 addrs)\n* 3 µCAV, 19 bits (3 addrs, uCB separate)\n* Flags (
$EndSCHEMATC
