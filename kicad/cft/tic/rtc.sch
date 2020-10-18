EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 13
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
L alexios:M48T02-70PC1 U?
U 1 1 5FD1801A
P 6800 3650
AR Path="/5FD1801A" Ref="U?"  Part="1" 
AR Path="/5FD01D67/5FD1801A" Ref="U?"  Part="1" 
F 0 "U?" H 6800 4417 50  0000 C CNN
F 1 "M48T02-70PC1" H 6800 4326 50  0000 C CNN
F 2 "alexios:eDIP-24_W15.24mm" H 6325 2475 50  0001 L CNN
F 3 "https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf" H 6800 3650 50  0001 C CNN
F 4 "Yes" H 6325 2400 50  0001 L CNN "Verified"
F 5 "511-M48T0270PC1; €11.81" H 6325 2325 50  0001 L CNN "Mouser"
	1    6800 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FD18020
P 4000 7050
AR Path="/5FD18020" Ref="C?"  Part="1" 
AR Path="/5FD01D67/5FD18020" Ref="C?"  Part="1" 
F 0 "C?" H 3909 7096 50  0000 R CNN
F 1 "100nF" H 3909 7005 50  0000 R CNN
F 2 "" H 4000 7050 50  0001 C CNN
F 3 "~" H 4000 7050 50  0001 C CNN
	1    4000 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6900 4000 6950
Wire Wire Line
	4000 7150 4000 7200
$Comp
L power:GND #PWR?
U 1 1 5FD18028
P 4000 7200
AR Path="/5FD18028" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD18028" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4000 6950 50  0001 C CNN
F 1 "GND" H 4005 7027 50  0000 C CNN
F 2 "" H 4000 7200 50  0001 C CNN
F 3 "" H 4000 7200 50  0001 C CNN
	1    4000 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:M48T02-70PC1 U?
U 2 1 5FD18030
P 4350 7050
AR Path="/5FD18030" Ref="U?"  Part="2" 
AR Path="/5FD01D67/5FD18030" Ref="U?"  Part="2" 
F 0 "U?" H 4555 7096 50  0000 L CNN
F 1 "M48T02-70PC1" H 4555 7005 50  0000 L CNN
F 2 "alexios:eDIP-24_W15.24mm" H 3875 5875 50  0001 L CNN
F 3 "https://uk.mouser.com/datasheet/2/389/m48t02-1849963.pdf" H 4350 7050 50  0001 C CNN
F 4 "Yes" H 3875 5800 50  0001 L CNN "Verified"
F 5 "511-M48T0270PC1; €11.81" H 3875 5725 50  0001 L CNN "Mouser"
	2    4350 7050
	1    0    0    -1  
$EndComp
Connection ~ 4000 7150
Connection ~ 4000 6950
Text Label 3200 4650 0    50   ~ 0
~RTCR
Text Label 3200 4550 0    50   ~ 0
~RTCW
Wire Wire Line
	6300 4350 6050 4350
Text Label 3200 4750 0    50   ~ 0
~RTCCS
Text Label 5750 3150 0    50   ~ 0
RTCA0
Text Label 5750 3250 0    50   ~ 0
RTCA1
Text Label 5750 3350 0    50   ~ 0
RTCA2
Text Label 5750 3450 0    50   ~ 0
RTCA3
Text Label 5750 3550 0    50   ~ 0
RTCA4
Text Label 5750 3650 0    50   ~ 0
RTCA5
Text Label 5750 3750 0    50   ~ 0
RTCA6
Text Label 5750 3850 0    50   ~ 0
RTCA7
Wire Wire Line
	6300 3950 6250 3950
Wire Wire Line
	6250 3950 6250 4050
Wire Wire Line
	6250 4150 6300 4150
Wire Wire Line
	6300 4050 6250 4050
Connection ~ 6250 4050
Wire Wire Line
	6250 4050 6250 4150
Wire Wire Line
	6250 4150 6150 4150
Connection ~ 6250 4150
$Comp
L power:+5V #PWR?
U 1 1 5FD1804C
P 4000 6900
AR Path="/5F67D4B5/5FD1804C" Ref="#PWR?"  Part="1" 
AR Path="/5FD1804C" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5FD1804C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5FD1804C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FD1804C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5FD1804C" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD1804C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4000 6750 50  0001 C CNN
F 1 "+5V" H 3942 6937 50  0000 R CNN
F 2 "" H 4000 6900 50  0001 C CNN
F 3 "" H 4000 6900 50  0001 C CNN
	1    4000 6900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD18052
P 6150 4050
AR Path="/5F67D4B5/5FD18052" Ref="#PWR?"  Part="1" 
AR Path="/5FD18052" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5FD18052" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5FD18052" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FD18052" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5FD18052" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD18052" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6150 3900 50  0001 C CNN
F 1 "+5V" H 6092 4087 50  0000 R CNN
F 2 "" H 6150 4050 50  0001 C CNN
F 3 "" H 6150 4050 50  0001 C CNN
	1    6150 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4050 6150 4150
Wire Wire Line
	5700 3150 6300 3150
Wire Wire Line
	5700 3250 6300 3250
Wire Wire Line
	5700 3350 6300 3350
Wire Wire Line
	5700 3450 6300 3450
Wire Wire Line
	5700 3550 6300 3550
Wire Wire Line
	5700 3650 6300 3650
Wire Wire Line
	5700 3750 6300 3750
Wire Wire Line
	5700 3850 6300 3850
$Comp
L alexios:74HC574 U?
U 1 1 5FD18062
P 5200 3650
AR Path="/5FD18062" Ref="U?"  Part="1" 
AR Path="/5FD01D67/5FD18062" Ref="U?"  Part="1" 
F 0 "U?" H 5200 4417 50  0000 C CNN
F 1 "74HC574" H 5200 4326 50  0000 C CNN
F 2 "" H 4900 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 4900 3600 50  0001 C CNN
F 4 "Yes" H 5050 2700 50  0001 C CNN "Verified"
	1    5200 3650
	1    0    0    -1  
$EndComp
Entry Wire Line
	4400 3050 4500 3150
Entry Wire Line
	4400 3150 4500 3250
Entry Wire Line
	4400 3250 4500 3350
Entry Wire Line
	4400 3350 4500 3450
Entry Wire Line
	4400 3450 4500 3550
Entry Wire Line
	4400 3550 4500 3650
Entry Wire Line
	4400 3650 4500 3750
Entry Wire Line
	4400 3750 4500 3850
Wire Wire Line
	4700 4150 4650 4150
Wire Wire Line
	4650 4150 4650 4200
$Comp
L power:GND #PWR?
U 1 1 5FD18072
P 4650 4200
AR Path="/5FD18072" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD18072" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4650 3950 50  0001 C CNN
F 1 "GND" H 4655 4027 50  0000 C CNN
F 2 "" H 4650 4200 50  0001 C CNN
F 3 "" H 4650 4200 50  0001 C CNN
	1    4650 4200
	1    0    0    -1  
$EndComp
Text Label 3200 4050 0    50   ~ 0
~RTCAW
Text Label 7500 3150 2    50   ~ 0
DB0
Text Label 7500 3250 2    50   ~ 0
DB1
Text Label 7500 3350 2    50   ~ 0
DB2
Text Label 7500 3450 2    50   ~ 0
DB3
Text Label 7500 3550 2    50   ~ 0
DB4
Text Label 7500 3650 2    50   ~ 0
DB5
Text Label 7500 3750 2    50   ~ 0
DB6
Text Label 7500 3850 2    50   ~ 0
DB7
$Comp
L power:GND #PWR?
U 1 1 5FD18081
P 6250 6100
AR Path="/5FD18081" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD18081" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD18081" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6250 5850 50  0001 C CNN
F 1 "GND" H 6255 5927 50  0000 C CNN
F 2 "" H 6250 6100 50  0001 C CNN
F 3 "" H 6250 6100 50  0001 C CNN
	1    6250 6100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5FD18087
P 6800 5550
AR Path="/5FD18087" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5FD18087" Ref="U?"  Part="1" 
AR Path="/5FD01D67/5FD18087" Ref="U?"  Part="1" 
F 0 "U?" H 6800 6317 50  0000 C CNN
F 1 "74HC574" H 6800 6226 50  0000 C CNN
F 2 "" H 6800 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 6800 5550 50  0001 C CNN
	1    6800 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD1808D
P 6250 4950
AR Path="/5FD1808D" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5FD1808D" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD1808D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6250 4800 50  0001 C CNN
F 1 "+5V" H 6265 5123 50  0000 C CNN
F 2 "" H 6250 4950 50  0001 C CNN
F 3 "" H 6250 4950 50  0001 C CNN
	1    6250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 5350 6300 5350
Wire Wire Line
	6300 5250 6250 5250
Connection ~ 6250 5250
Wire Wire Line
	6250 5250 6250 5350
Wire Wire Line
	6300 5650 6250 5650
Wire Wire Line
	6250 5650 6250 5750
Wire Wire Line
	6300 5750 6250 5750
Text Label 7500 5750 2    50   ~ 0
DB15
Text Label 7500 5650 2    50   ~ 0
DB14
Text Label 7500 5550 2    50   ~ 0
DB13
Text Label 7500 5450 2    50   ~ 0
DB12
Text Label 7500 5350 2    50   ~ 0
DB11
Text Label 7500 5250 2    50   ~ 0
DB10
Text Label 7500 5150 2    50   ~ 0
DB9
Text Label 7500 5050 2    50   ~ 0
DB8
Wire Wire Line
	7300 5050 7500 5050
Wire Wire Line
	7300 5150 7500 5150
Wire Wire Line
	7300 5250 7500 5250
Wire Wire Line
	7300 5350 7500 5350
Wire Wire Line
	7300 5450 7500 5450
Wire Wire Line
	7300 5550 7500 5550
Wire Wire Line
	7300 5650 7500 5650
Wire Wire Line
	7300 5750 7500 5750
Wire Wire Line
	6250 4950 6250 5050
Entry Wire Line
	7500 5750 7600 5650
Entry Wire Line
	7500 5650 7600 5550
Entry Wire Line
	7500 5550 7600 5450
Entry Wire Line
	7500 5450 7600 5350
Entry Wire Line
	7500 5350 7600 5250
Entry Wire Line
	7500 5250 7600 5150
Entry Wire Line
	7500 5150 7600 5050
Entry Wire Line
	7500 5050 7600 4950
Wire Wire Line
	7300 3150 7500 3150
Wire Wire Line
	7300 3250 7500 3250
Wire Wire Line
	7300 3350 7500 3350
Wire Wire Line
	7300 3450 7500 3450
Wire Wire Line
	7300 3550 7500 3550
Wire Wire Line
	7300 3650 7500 3650
Wire Wire Line
	7300 3750 7500 3750
Wire Wire Line
	7300 3850 7500 3850
Entry Wire Line
	7500 3150 7600 3250
Entry Wire Line
	7500 3250 7600 3350
Entry Wire Line
	7500 3350 7600 3450
Entry Wire Line
	7500 3450 7600 3550
Entry Wire Line
	7500 3550 7600 3650
Entry Wire Line
	7500 3650 7600 3750
Entry Wire Line
	7500 3750 7600 3850
Entry Wire Line
	7500 3850 7600 3950
Wire Wire Line
	6300 5050 6250 5050
Connection ~ 6250 5050
Wire Wire Line
	6250 5050 6250 5150
Wire Wire Line
	6300 5150 6250 5150
Connection ~ 6250 5150
Wire Wire Line
	6250 5150 6250 5250
Wire Wire Line
	6300 5450 6250 5450
Wire Wire Line
	6250 5450 6250 5550
Connection ~ 6250 5650
Wire Wire Line
	6300 5550 6250 5550
Connection ~ 6250 5550
Wire Wire Line
	6250 5550 6250 5650
Wire Wire Line
	6150 5950 6300 5950
Wire Wire Line
	6150 4450 6300 4450
Wire Wire Line
	6150 4450 6150 4650
Connection ~ 6250 5750
Wire Wire Line
	6250 5750 6250 6100
Wire Wire Line
	6300 6050 6050 6050
Wire Wire Line
	6050 4350 6050 4750
Connection ~ 6050 4750
Connection ~ 6150 4650
Wire Wire Line
	6050 4750 6050 6050
Wire Wire Line
	6150 4650 6150 5950
$Comp
L alexios:74HC541 U?
U 2 1 5FD180DA
P 5950 7050
AR Path="/5FD180DA" Ref="U?"  Part="2" 
AR Path="/5F160E7C/5FD180DA" Ref="U?"  Part="1" 
AR Path="/5FD01D67/5FD180DA" Ref="U?"  Part="2" 
F 0 "U?" H 6130 7096 50  0000 L CNN
F 1 "74HC541" H 6130 7005 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5950 7050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5950 7050 50  0001 C CNN
	2    5950 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FD180E0
P 2700 7050
AR Path="/5FD180E0" Ref="C?"  Part="1" 
AR Path="/5FD01D67/5FD180E0" Ref="C?"  Part="1" 
F 0 "C?" H 2609 7096 50  0000 R CNN
F 1 "100nF" H 2609 7005 50  0000 R CNN
F 2 "" H 2700 7050 50  0001 C CNN
F 3 "~" H 2700 7050 50  0001 C CNN
	1    2700 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6900 2700 6950
Wire Wire Line
	2700 7150 2700 7200
$Comp
L power:GND #PWR?
U 1 1 5FD180E8
P 2700 7200
AR Path="/5FD180E8" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD180E8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 6950 50  0001 C CNN
F 1 "GND" H 2705 7027 50  0000 C CNN
F 2 "" H 2700 7200 50  0001 C CNN
F 3 "" H 2700 7200 50  0001 C CNN
	1    2700 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD180EE
P 2700 6900
AR Path="/5F67D4B5/5FD180EE" Ref="#PWR?"  Part="1" 
AR Path="/5FD180EE" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5FD180EE" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5FD180EE" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FD180EE" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5FD180EE" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD180EE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 6750 50  0001 C CNN
F 1 "+5V" H 2642 6937 50  0000 R CNN
F 2 "" H 2700 6900 50  0001 C CNN
F 3 "" H 2700 6900 50  0001 C CNN
	1    2700 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FD180F4
P 5600 7050
AR Path="/5FD180F4" Ref="C?"  Part="1" 
AR Path="/5FD01D67/5FD180F4" Ref="C?"  Part="1" 
F 0 "C?" H 5509 7096 50  0000 R CNN
F 1 "100nF" H 5509 7005 50  0000 R CNN
F 2 "" H 5600 7050 50  0001 C CNN
F 3 "~" H 5600 7050 50  0001 C CNN
	1    5600 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 6900 5600 6950
Wire Wire Line
	5600 7150 5600 7200
$Comp
L power:GND #PWR?
U 1 1 5FD180FC
P 5600 7200
AR Path="/5FD180FC" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD180FC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 6950 50  0001 C CNN
F 1 "GND" H 5605 7027 50  0000 C CNN
F 2 "" H 5600 7200 50  0001 C CNN
F 3 "" H 5600 7200 50  0001 C CNN
	1    5600 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FD18102
P 5600 6900
AR Path="/5F67D4B5/5FD18102" Ref="#PWR?"  Part="1" 
AR Path="/5FD18102" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5FD18102" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5FD18102" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5FD18102" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5FD18102" Ref="#PWR?"  Part="1" 
AR Path="/5FD01D67/5FD18102" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 6750 50  0001 C CNN
F 1 "+5V" H 5542 6937 50  0000 R CNN
F 2 "" H 5600 6900 50  0001 C CNN
F 3 "" H 5600 6900 50  0001 C CNN
	1    5600 6900
	1    0    0    -1  
$EndComp
Connection ~ 5600 7150
Connection ~ 5600 6950
$Comp
L alexios:74HC574 U?
U 2 1 5FD1810B
P 3050 7050
AR Path="/5FD1810B" Ref="U?"  Part="2" 
AR Path="/5FD01D67/5FD1810B" Ref="U?"  Part="2" 
F 0 "U?" H 3230 7096 50  0000 L CNN
F 1 "74HC574" H 3230 7005 50  0000 L CNN
F 2 "" H 2750 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 2750 7000 50  0001 C CNN
F 4 "Yes" H 2900 6100 50  0001 C CNN "Verified"
	2    3050 7050
	1    0    0    -1  
$EndComp
Connection ~ 2700 7150
Connection ~ 2700 6950
Text Label 4500 3150 0    50   ~ 0
DB0
Text Label 4500 3250 0    50   ~ 0
DB1
Text Label 4500 3350 0    50   ~ 0
DB2
Text Label 4500 3450 0    50   ~ 0
DB3
Text Label 4500 3550 0    50   ~ 0
DB4
Text Label 4500 3650 0    50   ~ 0
DB5
Text Label 4500 3750 0    50   ~ 0
DB6
Text Label 4500 3850 0    50   ~ 0
DB7
Wire Wire Line
	4700 3150 4500 3150
Wire Wire Line
	4700 3250 4500 3250
Wire Wire Line
	4700 3350 4500 3350
Wire Wire Line
	4700 3450 4500 3450
Wire Wire Line
	4700 3550 4500 3550
Wire Wire Line
	4700 3650 4500 3650
Wire Wire Line
	4700 3750 4500 3750
Wire Wire Line
	4700 3850 4500 3850
Wire Bus Line
	4500 2700 7500 2700
Wire Bus Line
	7500 2700 7600 2800
Wire Bus Line
	4400 2800 4300 2700
Wire Bus Line
	4300 2700 3100 2700
Entry Bus Bus
	4400 2800 4500 2700
Text Label 3550 2700 0    50   ~ 0
DB[0..15]
Text Label 5850 2700 0    50   ~ 0
DB[0..15]
Text Label 7600 4550 1    50   ~ 0
DB[0..15]
Text HLabel 3100 2700 0    50   BiDi ~ 0
~DB[0..15]
Wire Wire Line
	3100 4050 4700 4050
Text HLabel 3100 4050 0    50   Input ~ 0
~RTCAW
Wire Wire Line
	3100 4550 6300 4550
Wire Wire Line
	3100 4650 6150 4650
Wire Wire Line
	3100 4750 6050 4750
Text HLabel 3100 4550 0    50   Input ~ 0
~RTCW
Text HLabel 3100 4650 0    50   Input ~ 0
~RTCR
Text HLabel 3100 4750 0    50   Input ~ 0
~RTCCS
Text Notes 2750 1200 0    100  ~ 20
Real Time Clock (RTC)
Text Notes 2750 2400 0    50   ~ 0
This uses a 5V ST M48T02 Timekeeper® SRAM. The device contains a 2,040×8 bit SRAM backed up\nby an integrated battery. The top 8 addresses access a real-time clock with BCD registers.\n\nSince this device is mapped to IO space, and to save precious addresses, it uses an indexed scheme.\nAn 8-bit address must first be written to the address register, and then data at this address read or\nwritten using the data register. This is slow, but this is also a slow device.\n\nTo save one IC, this interface will only access the top 256 bytes of the device, including the\nReal-Time Clock.\n\nThis is an 8-bit device. The MSB of all writes is ignored. The MSB of reads is always\nbinary 11110000 to aid in detecting the presence of the device.\n\n
Wire Bus Line
	4400 2800 4400 3750
Wire Bus Line
	7600 2800 7600 5650
$EndSCHEMATC
