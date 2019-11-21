EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 16
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
L alexios:74AHC1G32 U?
U 1 1 5D4A42A5
P 2250 2350
AR Path="/5D4A42A5" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A42A5" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A42A5" Ref="U?"  Part="1" 
F 0 "U?" H 2200 2617 50  0000 C CNN
F 1 "74AHC1G32" H 2200 2526 50  0000 C CNN
F 2 "" H 2260 2330 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2260 2330 50  0001 C CNN
	1    2250 2350
	1    0    0    -1  
$EndComp
Text Label 1100 2300 0    50   ~ 0
~WS
Text Label 1100 2400 0    50   ~ 0
~T34
Text HLabel 1000 2300 0    50   3State ~ 0
~WS
Text HLabel 1000 2400 0    50   Input ~ 0
~T34
Wire Wire Line
	1000 2400 1950 2400
Text Label 1100 2550 0    50   ~ 0
CLK2
$Comp
L alexios:74AUC1G74 U?
U 1 1 5D4A42B1
P 3600 2500
AR Path="/5D4A42B1" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A42B1" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A42B1" Ref="U?"  Part="1" 
F 0 "U?" H 3600 2917 50  0000 C CNN
F 1 "74AUC1G74" H 3600 2826 50  0000 C CNN
F 2 "" H 4050 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4050 2500 50  0001 C CNN
	1    3600 2500
	1    0    0    -1  
$EndComp
Text Label 3000 2350 2    50   ~ 0
~WS-in-T34
Text Label 3000 2550 2    50   ~ 0
CLK2
Text Label 1100 2650 0    50   ~ 0
~RESET
Text Label 3000 2650 2    50   ~ 0
~RESET
Wire Wire Line
	3150 2450 3100 2450
Wire Wire Line
	3100 2450 3100 2750
$Comp
L power:GND #PWR?
U 1 1 5D4A42BD
P 3100 2750
AR Path="/5D4A42BD" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A42BD" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A42BD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3100 2500 50  0001 C CNN
F 1 "GND" H 3105 2577 50  0000 C CNN
F 2 "" H 3100 2750 50  0001 C CNN
F 3 "" H 3100 2750 50  0001 C CNN
	1    3100 2750
	1    0    0    -1  
$EndComp
Text Label 4400 2350 2    50   ~ 0
WAITING
Text Label 4400 2650 2    50   ~ 0
~WAITING
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D4A42C5
P 4850 3200
AR Path="/5D4A42C5" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A42C5" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A42C5" Ref="U?"  Part="1" 
F 0 "U?" H 4800 3464 50  0000 C CNN
F 1 "74LVC1G11" H 4800 3373 50  0000 C CNN
F 2 "" H 4750 3125 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4750 3125 50  0001 C CNN
	1    4850 3200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 5D4A42CB
P 4200 6400
AR Path="/5D4A42CB" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A42CB" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A42CB" Ref="U?"  Part="2" 
F 0 "U?" H 4280 6296 50  0000 L CNN
F 1 "74LVC1G11" H 4280 6205 50  0000 L CNN
F 2 "" H 4100 6325 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4100 6325 50  0001 C CNN
	2    4200 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A42D1
P 3750 6550
AR Path="/5CC0D65F/5D4A42D1" Ref="C?"  Part="1" 
AR Path="/5D4A42D1" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A42D1" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A42D1" Ref="C?"  Part="1" 
F 0 "C?" H 3659 6596 50  0000 R CNN
F 1 "100nF" H 3659 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3750 6550 50  0001 C CNN
F 3 "~" H 3750 6550 50  0001 C CNN
	1    3750 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A42D7
P 3750 6450
AR Path="/5D4A42D7" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A42D7" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A42D7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3750 6300 50  0001 C CNN
F 1 "+5V" H 3765 6623 50  0000 C CNN
F 2 "" H 3750 6450 50  0001 C CNN
F 3 "" H 3750 6450 50  0001 C CNN
	1    3750 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A42DD
P 3750 6650
AR Path="/5D4A42DD" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A42DD" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A42DD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3750 6400 50  0001 C CNN
F 1 "GND" H 3755 6477 50  0000 C CNN
F 2 "" H 3750 6650 50  0001 C CNN
F 3 "" H 3750 6650 50  0001 C CNN
	1    3750 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2650 4500 3150
Wire Wire Line
	4500 3150 4550 3150
Wire Wire Line
	4050 2650 4500 2650
Text Label 1100 3250 0    50   ~ 0
~IO
Text HLabel 1000 2550 0    50   Input ~ 0
CLK2
Text HLabel 1000 2650 0    50   Input ~ 0
~RESET
Text HLabel 1000 3250 0    50   Input ~ 0
~IO
Text HLabel 1000 3350 0    50   Input ~ 0
~MEM
Text Label 5400 3250 2    50   ~ 0
~BUSEN
Text Label 4400 3250 2    50   ~ 0
~IO
Text Label 1100 3350 0    50   ~ 0
~MEM
Text Label 4400 3350 2    50   ~ 0
~MEM
Wire Wire Line
	2450 2350 3100 2350
Wire Wire Line
	1000 2650 1600 2650
Wire Wire Line
	1000 2550 3150 2550
Wire Wire Line
	1000 3250 4550 3250
Wire Wire Line
	1000 3350 4550 3350
$Comp
L alexios:74LVC1G27 U?
U 1 1 5D4A42F4
P 4850 1750
AR Path="/5D4A42F4" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A42F4" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A42F4" Ref="U?"  Part="1" 
F 0 "U?" H 4825 2064 50  0000 C CNN
F 1 "74LVC1G27" H 4825 1973 50  0000 C CNN
F 2 "" H 4850 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4850 1750 50  0001 C CNN
	1    4850 1750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G27 U?
U 2 1 5D4A42FA
P 2800 6500
AR Path="/5D4A42FA" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A42FA" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A42FA" Ref="U?"  Part="2" 
F 0 "U?" H 2880 6496 50  0000 L CNN
F 1 "74LVC1G27" H 2880 6405 50  0000 L CNN
F 2 "" H 2800 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2800 6500 50  0001 C CNN
	2    2800 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1850 4500 1850
Wire Wire Line
	4500 1850 4500 2350
Wire Wire Line
	4050 2350 4500 2350
Wire Wire Line
	1000 1750 4550 1750
Text Label 1100 1750 0    50   ~ 0
CLK4
Wire Wire Line
	4550 1650 1000 1650
Text Label 1100 1650 0    50   ~ 0
~WEN
Text HLabel 1000 1650 0    50   Input ~ 0
~WEN
Text HLabel 1000 1750 0    50   Input ~ 0
CLK4
Wire Wire Line
	5100 1750 5250 1750
Text Label 5650 1750 2    50   ~ 0
WCLK
Wire Notes Line style solid
	5000 1800 5100 1800
Wire Notes Line style solid
	5100 1800 5100 1900
Wire Notes Line style solid
	5100 1900 5250 1900
Wire Notes Line style solid
	5250 1900 5250 1800
Wire Notes Line style solid
	5250 1800 5300 1800
$Comp
L alexios:74HC74 U?
U 1 1 5D4A4310
P 6100 1500
AR Path="/5D4A4310" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A4310" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A4310" Ref="U?"  Part="1" 
F 0 "U?" H 6400 1900 50  0000 C CNN
F 1 "74HC74" H 6400 1800 50  0000 C CNN
F 2 "" H 6050 1500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6050 1500 50  0001 C CNN
	1    6100 1500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 5D4A4316
P 8000 1500
AR Path="/5D4A4316" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A4316" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A4316" Ref="U?"  Part="2" 
F 0 "U?" H 8300 1900 50  0000 C CNN
F 1 "74HC74" H 8300 1800 50  0000 C CNN
F 2 "" H 7950 1500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7950 1500 50  0001 C CNN
	2    8000 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A431C
P 2350 6550
AR Path="/5CC0D65F/5D4A431C" Ref="C?"  Part="1" 
AR Path="/5D4A431C" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A431C" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A431C" Ref="C?"  Part="1" 
F 0 "C?" H 2259 6596 50  0000 R CNN
F 1 "100nF" H 2259 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 6550 50  0001 C CNN
F 3 "~" H 2350 6550 50  0001 C CNN
	1    2350 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A4322
P 2350 6650
AR Path="/5D4A4322" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4322" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4322" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 6400 50  0001 C CNN
F 1 "GND" H 2355 6477 50  0000 C CNN
F 2 "" H 2350 6650 50  0001 C CNN
F 3 "" H 2350 6650 50  0001 C CNN
	1    2350 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A4328
P 2350 6450
AR Path="/5D4A4328" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4328" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4328" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 6300 50  0001 C CNN
F 1 "+5V" H 2365 6623 50  0000 C CNN
F 2 "" H 2350 6450 50  0001 C CNN
F 3 "" H 2350 6450 50  0001 C CNN
	1    2350 6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 7 1 5D4A432E
P 5550 6950
AR Path="/5D4A432E" Ref="U?"  Part="7" 
AR Path="/5D30488D/5D4A432E" Ref="U?"  Part="7" 
AR Path="/5D44ECB5/5D4A432E" Ref="U?"  Part="7" 
F 0 "U?" H 5730 6696 50  0000 L CNN
F 1 "74AC04" H 5730 6605 50  0000 L CNN
F 2 "" H 5550 6950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5550 6950 50  0001 C CNN
	7    5550 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A4334
P 5200 7250
AR Path="/5CC0D65F/5D4A4334" Ref="C?"  Part="1" 
AR Path="/5D4A4334" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A4334" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A4334" Ref="C?"  Part="1" 
F 0 "C?" H 5109 7296 50  0000 R CNN
F 1 "100nF" H 5109 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5200 7250 50  0001 C CNN
F 3 "~" H 5200 7250 50  0001 C CNN
	1    5200 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A433A
P 5200 7350
AR Path="/5D4A433A" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A433A" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A433A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5200 7100 50  0001 C CNN
F 1 "GND" H 5205 7177 50  0000 C CNN
F 2 "" H 5200 7350 50  0001 C CNN
F 3 "" H 5200 7350 50  0001 C CNN
	1    5200 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A4340
P 5200 7150
AR Path="/5D4A4340" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4340" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4340" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5200 7000 50  0001 C CNN
F 1 "+5V" H 5215 7323 50  0000 C CNN
F 2 "" H 5200 7150 50  0001 C CNN
F 3 "" H 5200 7150 50  0001 C CNN
	1    5200 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 1 1 5D4A4346
P 4850 3650
AR Path="/5D4A4346" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A4346" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A4346" Ref="U?"  Part="1" 
F 0 "U?" H 4775 3475 50  0000 C CNN
F 1 "74AHC1G08" H 4775 3384 50  0000 C CNN
F 2 "" H 4500 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4500 3650 50  0001 C CNN
	1    4850 3650
	1    0    0    -1  
$EndComp
Text Label 4150 3600 0    50   ~ 0
~RESET
Wire Wire Line
	4550 3700 4500 3700
$Comp
L power:+5V #PWR?
U 1 1 5D4A434E
P 6150 1100
AR Path="/5D4A434E" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A434E" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A434E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6150 950 50  0001 C CNN
F 1 "+5V" H 6165 1273 50  0000 C CNN
F 2 "" H 6150 1100 50  0001 C CNN
F 3 "" H 6150 1100 50  0001 C CNN
	1    6150 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1400 5650 1100
Wire Wire Line
	5650 1100 6150 1100
Wire Wire Line
	1600 3600 1600 2650
Wire Wire Line
	1600 3600 4550 3600
Connection ~ 1600 2650
Wire Wire Line
	1600 2650 3150 2650
Text Label 1600 3100 1    50   ~ 0
~RESET
Wire Wire Line
	5000 3650 6150 3650
Text Label 5150 3650 0    50   ~ 0
~WCLR-OR-RESET
Wire Wire Line
	4500 3700 4500 4800
Wire Wire Line
	5500 5100 5050 5100
Wire Wire Line
	5600 5000 5750 5000
Connection ~ 5600 5000
Wire Wire Line
	5600 5200 7000 5200
Wire Wire Line
	5600 5000 5600 5200
Wire Wire Line
	5050 5000 5600 5000
Connection ~ 5550 4550
Wire Wire Line
	5550 4900 5050 4900
Wire Wire Line
	5550 4550 5550 4900
Wire Wire Line
	5550 4350 5550 4550
Wire Wire Line
	7000 3900 5400 3900
Wire Wire Line
	5400 4800 5400 3900
Wire Wire Line
	5050 4800 5400 4800
Wire Wire Line
	7000 5000 6950 5000
Wire Wire Line
	7000 4550 7000 5000
Wire Wire Line
	5550 4550 7000 4550
Wire Wire Line
	5750 4350 5550 4350
Wire Wire Line
	7000 4350 6950 4350
Wire Wire Line
	7000 3900 7000 4350
Connection ~ 4500 4800
$Comp
L power:GND #PWR?
U 1 1 5D4A4372
P 4500 5350
AR Path="/5D4A4372" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4372" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4372" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4500 5100 50  0001 C CNN
F 1 "GND" H 4505 5177 50  0000 C CNN
F 2 "" H 4500 5350 50  0001 C CNN
F 3 "" H 4500 5350 50  0001 C CNN
	1    4500 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4500 5100 4500 5150
Connection ~ 4500 5100
Wire Wire Line
	4550 5100 4500 5100
Wire Wire Line
	4500 5000 4500 5100
Connection ~ 4500 5000
Wire Wire Line
	4550 5000 4500 5000
Wire Wire Line
	4500 4900 4500 5000
Connection ~ 4500 4900
Wire Wire Line
	4550 4900 4500 4900
Wire Wire Line
	4500 4800 4500 4900
Wire Wire Line
	4550 4800 4500 4800
$Comp
L Device:R_Small R?
U 1 1 5D4A4383
P 4500 5250
AR Path="/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5F63066B/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5D30488D/5D4A4383" Ref="R?"  Part="1" 
AR Path="/5D44ECB5/5D4A4383" Ref="R?"  Part="1" 
F 0 "R?" H 4441 5296 50  0000 R CNN
F 1 "10kΩ" H 4441 5205 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4500 5250 50  0001 C CNN
F 3 "~" H 4500 5250 50  0001 C CNN
	1    4500 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5D4A4389
P 4850 4900
AR Path="/5D4A4389" Ref="J?"  Part="1" 
AR Path="/5D30488D/5D4A4389" Ref="J?"  Part="1" 
AR Path="/5D44ECB5/5D4A4389" Ref="J?"  Part="1" 
F 0 "J?" H 4900 5125 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 4900 5126 50  0001 C CNN
F 2 "" H 4850 4900 50  0001 C CNN
F 3 "~" H 4850 4900 50  0001 C CNN
	1    4850 4900
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 6 1 5D4A438F
P 6050 5000
AR Path="/5D4A438F" Ref="U?"  Part="6" 
AR Path="/5D30488D/5D4A438F" Ref="U?"  Part="6" 
AR Path="/5D44ECB5/5D4A438F" Ref="U?"  Part="6" 
F 0 "U?" H 6050 5317 50  0000 C CNN
F 1 "74AC04" H 6050 5226 50  0000 C CNN
F 2 "" H 6050 5000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6050 5000 50  0001 C CNN
	6    6050 5000
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 3 1 5D4A4395
P 6650 5000
AR Path="/5D4A4395" Ref="U?"  Part="3" 
AR Path="/5D30488D/5D4A4395" Ref="U?"  Part="3" 
AR Path="/5D44ECB5/5D4A4395" Ref="U?"  Part="3" 
F 0 "U?" H 6650 5317 50  0000 C CNN
F 1 "74AC04" H 6650 5226 50  0000 C CNN
F 2 "" H 6650 5000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6650 5000 50  0001 C CNN
	3    6650 5000
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 1 1 5D4A439B
P 6650 4350
AR Path="/5D4A439B" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A439B" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A439B" Ref="U?"  Part="1" 
F 0 "U?" H 6650 4667 50  0000 C CNN
F 1 "74AC04" H 6650 4576 50  0000 C CNN
F 2 "" H 6650 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6650 4350 50  0001 C CNN
	1    6650 4350
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 2 1 5D4A43A1
P 6050 4350
AR Path="/5D4A43A1" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A43A1" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A43A1" Ref="U?"  Part="2" 
F 0 "U?" H 6050 4667 50  0000 C CNN
F 1 "74AC04" H 6050 4576 50  0000 C CNN
F 2 "" H 6050 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6050 4350 50  0001 C CNN
	2    6050 4350
	-1   0    0    -1  
$EndComp
Text Label 6150 2850 1    50   ~ 0
~WCLR-OR-RESET
Wire Wire Line
	6600 1750 7000 1750
Wire Wire Line
	7000 1750 7000 3900
Connection ~ 7000 3900
Text Label 6600 1750 0    50   ~ 0
~WCLR
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A43AC
P 6600 1400
AR Path="/5F67D4B5/5D4A43AC" Ref="TP?"  Part="1" 
AR Path="/5D4A43AC" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A43AC" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A43AC" Ref="TP?"  Part="1" 
F 0 "TP?" V 6600 1600 50  0000 L CNN
F 1 "TestPoint" H 6658 1427 50  0001 L CNN
F 2 "" H 6800 1400 50  0001 C CNN
F 3 "~" H 6800 1400 50  0001 C CNN
	1    6600 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A43B2
P 5250 1650
AR Path="/5F67D4B5/5D4A43B2" Ref="TP?"  Part="1" 
AR Path="/5D4A43B2" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A43B2" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A43B2" Ref="TP?"  Part="1" 
F 0 "TP?" H 5308 1722 50  0000 L CNN
F 1 "TestPoint" H 5308 1677 50  0001 L CNN
F 2 "" H 5450 1650 50  0001 C CNN
F 3 "~" H 5450 1650 50  0001 C CNN
	1    5250 1650
	1    0    0    -1  
$EndComp
Connection ~ 5250 1750
Wire Wire Line
	5250 1750 5650 1750
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A43BA
P 4500 2350
AR Path="/5F67D4B5/5D4A43BA" Ref="TP?"  Part="1" 
AR Path="/5D4A43BA" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A43BA" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A43BA" Ref="TP?"  Part="1" 
F 0 "TP?" V 4500 2538 50  0000 L CNN
F 1 "TestPoint" H 4558 2377 50  0001 L CNN
F 2 "" H 4700 2350 50  0001 C CNN
F 3 "~" H 4700 2350 50  0001 C CNN
	1    4500 2350
	0    1    1    0   
$EndComp
Connection ~ 3100 2350
Wire Wire Line
	3100 2350 3150 2350
Wire Wire Line
	3100 2200 3100 2350
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A43C3
P 3100 2200
AR Path="/5F67D4B5/5D4A43C3" Ref="TP?"  Part="1" 
AR Path="/5D4A43C3" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A43C3" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A43C3" Ref="TP?"  Part="1" 
F 0 "TP?" H 3150 2350 50  0000 L CNN
F 1 "TestPoint" H 3158 2227 50  0001 L CNN
F 2 "" H 3300 2200 50  0001 C CNN
F 3 "~" H 3300 2200 50  0001 C CNN
	1    3100 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A43C9
P 6150 3650
AR Path="/5F67D4B5/5D4A43C9" Ref="TP?"  Part="1" 
AR Path="/5D4A43C9" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A43C9" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A43C9" Ref="TP?"  Part="1" 
F 0 "TP?" V 6150 3838 50  0000 L CNN
F 1 "TestPoint" H 6208 3677 50  0001 L CNN
F 2 "" H 6350 3650 50  0001 C CNN
F 3 "~" H 6350 3650 50  0001 C CNN
	1    6150 3650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A43CF
P 8050 1100
AR Path="/5D4A43CF" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A43CF" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A43CF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8050 950 50  0001 C CNN
F 1 "+5V" H 8065 1273 50  0000 C CNN
F 2 "" H 8050 1100 50  0001 C CNN
F 3 "" H 8050 1100 50  0001 C CNN
	1    8050 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1100 7500 1100
Wire Wire Line
	7500 1100 7500 1400
Wire Wire Line
	7500 1400 7550 1400
Wire Wire Line
	5250 1650 5250 1750
Wire Wire Line
	7350 1750 7550 1750
Text Label 7350 1750 0    50   ~ 0
WCLK
Wire Wire Line
	6150 2100 8050 2100
Wire Wire Line
	8050 2100 8050 2050
Text Label 8000 2100 2    50   ~ 0
~WCLR-OR-RESET
$Comp
L alexios:74AHC1G125 U?
U 1 1 5D4A43DE
P 9800 1750
AR Path="/5D4A43DE" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A43DE" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A43DE" Ref="U?"  Part="1" 
F 0 "U?" H 9850 1575 50  0000 C CNN
F 1 "74AHC1G125" H 9850 1484 50  0000 C CNN
F 2 "" H 9950 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9950 2000 50  0001 C CNN
	1    9800 1750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G125 U?
U 2 1 5D4A43E4
P 4100 7250
AR Path="/5D4A43E4" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A43E4" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A43E4" Ref="U?"  Part="2" 
F 0 "U?" H 4280 7296 50  0000 L CNN
F 1 "74AHC1G125" H 4280 7205 50  0000 L CNN
F 2 "" H 4250 7500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4250 7500 50  0001 C CNN
	2    4100 7250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged12 JP?
U 1 1 5D4A43EA
P 10400 1750
AR Path="/5D4A43EA" Ref="JP?"  Part="1" 
AR Path="/5D30488D/5D4A43EA" Ref="JP?"  Part="1" 
AR Path="/5D44ECB5/5D4A43EA" Ref="JP?"  Part="1" 
F 0 "JP?" H 10400 1863 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 10400 1864 50  0001 C CNN
F 2 "" H 10400 1750 50  0001 C CNN
F 3 "~" H 10400 1750 50  0001 C CNN
	1    10400 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D4A43F0
P 10400 2000
AR Path="/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5F63066B/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5D30488D/5D4A43F0" Ref="R?"  Part="1" 
AR Path="/5D44ECB5/5D4A43F0" Ref="R?"  Part="1" 
F 0 "R?" H 10341 2046 50  0000 R CNN
F 1 "30Ω" H 10341 1955 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10400 2000 50  0001 C CNN
F 3 "~" H 10400 2000 50  0001 C CNN
	1    10400 2000
	1    0    0    -1  
$EndComp
Text Label 10450 2200 0    50   ~ 0
~W
Wire Wire Line
	10100 1750 10200 1750
Wire Wire Line
	9850 1250 9850 1550
$Comp
L alexios:74AHC1G04 U?
U 1 1 5D4A43F9
P 9850 1050
AR Path="/5D4A43F9" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A43F9" Ref="U?"  Part="1" 
AR Path="/5D44ECB5/5D4A43F9" Ref="U?"  Part="1" 
F 0 "U?" V 9750 900 50  0000 R CNN
F 1 "74AHC1G04" V 9850 900 50  0000 R CNN
F 2 "" H 9850 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9850 1050 50  0001 C CNN
	1    9850 1050
	0    1    1    0   
$EndComp
Text Label 1100 700  0    50   ~ 0
~HALT
Text HLabel 1000 700  0    50   Input ~ 0
~HALT
Wire Wire Line
	1000 2300 1950 2300
Text Notes 2900 2000 2    50   ~ 0
~WS~ is pulled up by the µPC circuit.
Wire Notes Line
	1550 2050 1550 2250
Text Label 9850 1500 1    50   ~ 0
~RUN
Wire Wire Line
	8500 1750 9600 1750
Wire Notes Line style solid
	8550 1800 8650 1800
Wire Notes Line style solid
	8650 1800 8650 1900
Wire Notes Line style solid
	8650 1900 8700 1900
Wire Notes Line style solid
	8700 1900 8700 1800
Wire Notes Line style solid
	8700 1800 8850 1800
Text Notes 9650 1850 2    50   ~ 0
Narrow Write strobe
Text Label 8550 1750 0    50   ~ 0
~WRITE-STROBE
Text Label 10100 1550 0    50   ~ 0
WCLK
Text Label 9850 700  2    50   ~ 0
~HALT
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A440F
P 8500 1400
AR Path="/5F67D4B5/5D4A440F" Ref="TP?"  Part="1" 
AR Path="/5D4A440F" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A440F" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A440F" Ref="TP?"  Part="1" 
F 0 "TP?" V 8500 1588 50  0000 L CNN
F 1 "TestPoint" H 8558 1427 50  0001 L CNN
F 2 "" H 8700 1400 50  0001 C CNN
F 3 "~" H 8700 1400 50  0001 C CNN
	1    8500 1400
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A4415
P 3750 7250
AR Path="/5CC0D65F/5D4A4415" Ref="C?"  Part="1" 
AR Path="/5D4A4415" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A4415" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A4415" Ref="C?"  Part="1" 
F 0 "C?" H 3659 7296 50  0000 R CNN
F 1 "100nF" H 3659 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3750 7250 50  0001 C CNN
F 3 "~" H 3750 7250 50  0001 C CNN
	1    3750 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A441B
P 3750 7350
AR Path="/5D4A441B" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A441B" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A441B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3750 7100 50  0001 C CNN
F 1 "GND" H 3755 7177 50  0000 C CNN
F 2 "" H 3750 7350 50  0001 C CNN
F 3 "" H 3750 7350 50  0001 C CNN
	1    3750 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A4421
P 3750 7150
AR Path="/5D4A4421" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4421" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4421" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3750 7000 50  0001 C CNN
F 1 "+5V" H 3765 7323 50  0000 C CNN
F 2 "" H 3750 7150 50  0001 C CNN
F 3 "" H 3750 7150 50  0001 C CNN
	1    3750 7150
	1    0    0    -1  
$EndComp
Text Label 7000 2850 1    50   ~ 0
~WCLR
$Comp
L alexios:74AC04 U?
U 4 1 5D4A4428
P 6050 5650
AR Path="/5D4A4428" Ref="U?"  Part="4" 
AR Path="/5D30488D/5D4A4428" Ref="U?"  Part="4" 
AR Path="/5D44ECB5/5D4A4428" Ref="U?"  Part="4" 
F 0 "U?" H 6050 5967 50  0000 C CNN
F 1 "74AC04" H 6050 5876 50  0000 C CNN
F 2 "" H 6050 5650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6050 5650 50  0001 C CNN
	4    6050 5650
	-1   0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 5 1 5D4A442E
P 6650 5650
AR Path="/5D4A442E" Ref="U?"  Part="5" 
AR Path="/5D30488D/5D4A442E" Ref="U?"  Part="5" 
AR Path="/5D44ECB5/5D4A442E" Ref="U?"  Part="5" 
F 0 "U?" H 6650 5967 50  0000 C CNN
F 1 "74AC04" H 6650 5876 50  0000 C CNN
F 2 "" H 6650 5650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6650 5650 50  0001 C CNN
	5    6650 5650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7000 5200 7000 5650
Wire Wire Line
	7000 5650 6950 5650
Wire Wire Line
	5750 5650 5500 5650
Wire Wire Line
	5500 5650 5500 5100
Text Label 7000 4650 3    50   ~ 0
~WCLR1
Text Label 7000 5300 3    50   ~ 0
~WCLR2
Text Label 5050 4800 0    50   ~ 0
~WCLR
Wire Wire Line
	6150 2050 6150 2100
Connection ~ 6150 2100
Wire Wire Line
	6150 2100 6150 3650
Text Label 5050 4900 0    50   ~ 0
~WCLR1
Text Label 5050 5000 0    50   ~ 0
~WCLR2
Text Label 5050 5100 0    50   ~ 0
WCLR3
Text Notes 7250 5550 0    50   ~ 0
Configurable delay line using pairs of NOT gates:\n\nHC: 0ns, 14ns, 28ns, 42ns.\nAHC: 0ns, 9ns, 18ns, 27ns.\nAC: 0ns, 7.5ns, 15ns, 22.5ns.\n\nThe appropriate 74 family member must be selected and a\njumper placed in the appropriate place to obtain a\nsuitable delay of the write pulse near the end of  the\nT34 clock phase.
Text Notes 7300 3050 0    50   ~ 0
Both Flip Flops are configured identically. One only creates\nthe pair's clear pulse. The other drives the ~W~ bus signal.\nThis is done so their driving power and propagation delay\nis unimpaired and the clear pulse is more predictable.
Wire Wire Line
	9850 700  9850 750 
Wire Wire Line
	5050 3250 10700 3250
Wire Wire Line
	10400 2100 10400 2200
Wire Wire Line
	10400 2200 10700 2200
$Comp
L power:+5V #PWR?
U 1 1 5D4A4447
P 900 7200
AR Path="/5D4A4447" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4447" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4447" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 900 7050 50  0001 C CNN
F 1 "+5V" H 915 7373 50  0000 C CNN
F 2 "" H 900 7200 50  0001 C CNN
F 3 "" H 900 7200 50  0001 C CNN
	1    900  7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A444D
P 900 7400
AR Path="/5D4A444D" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A444D" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A444D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 900 7150 50  0001 C CNN
F 1 "GND" H 905 7227 50  0000 C CNN
F 2 "" H 900 7400 50  0001 C CNN
F 3 "" H 900 7400 50  0001 C CNN
	1    900  7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A4453
P 900 7300
AR Path="/5CC0D65F/5D4A4453" Ref="C?"  Part="1" 
AR Path="/5D4A4453" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A4453" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A4453" Ref="C?"  Part="1" 
F 0 "C?" H 809 7346 50  0000 R CNN
F 1 "100nF" H 809 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 900 7300 50  0001 C CNN
F 3 "~" H 900 7300 50  0001 C CNN
	1    900  7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 3 1 5D4A4459
P 1250 7300
AR Path="/5D4A4459" Ref="U?"  Part="3" 
AR Path="/5D30488D/5D4A4459" Ref="U?"  Part="3" 
AR Path="/5D44ECB5/5D4A4459" Ref="U?"  Part="3" 
F 0 "U?" H 1430 7346 50  0000 L CNN
F 1 "74HC74" H 1430 7255 50  0000 L CNN
F 2 "" H 1200 7300 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1200 7300 50  0001 C CNN
	3    1250 7300
	1    0    0    -1  
$EndComp
Text HLabel 10700 3250 2    50   Output ~ 0
~BUSEN
Text Notes 10100 1400 0    50   ~ 0
The solder jumper\nbypasses the delay\ncircuit and allows\nsomething else to be\ninstalled as a patch.
$Comp
L Connector:TestPoint TP?
U 1 1 5D4A4461
P 10600 1750
AR Path="/5F67D4B5/5D4A4461" Ref="TP?"  Part="1" 
AR Path="/5D4A4461" Ref="TP?"  Part="1" 
AR Path="/5D30488D/5D4A4461" Ref="TP?"  Part="1" 
AR Path="/5D44ECB5/5D4A4461" Ref="TP?"  Part="1" 
F 0 "TP?" V 10600 1938 50  0000 L CNN
F 1 "TestPoint" H 10658 1777 50  0001 L CNN
F 2 "" H 10800 1750 50  0001 C CNN
F 3 "~" H 10800 1750 50  0001 C CNN
	1    10600 1750
	0    1    1    0   
$EndComp
Text HLabel 10700 2200 2    50   3State ~ 0
~W
$Comp
L alexios:74AHC1G08 U?
U 2 1 5D4A4468
P 5650 6450
AR Path="/5D4A4468" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A4468" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A4468" Ref="U?"  Part="2" 
F 0 "U?" H 5730 6396 50  0000 L CNN
F 1 "74AHC1G08" H 5730 6305 50  0000 L CNN
F 2 "" H 5300 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5300 6450 50  0001 C CNN
	2    5650 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A446E
P 5200 6550
AR Path="/5CC0D65F/5D4A446E" Ref="C?"  Part="1" 
AR Path="/5D4A446E" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A446E" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A446E" Ref="C?"  Part="1" 
F 0 "C?" H 5109 6596 50  0000 R CNN
F 1 "100nF" H 5109 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5200 6550 50  0001 C CNN
F 3 "~" H 5200 6550 50  0001 C CNN
	1    5200 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A4474
P 5200 6650
F 0 "#PWR?" H 5200 6400 50  0001 C CNN
F 1 "GND" H 5205 6477 50  0000 C CNN
F 2 "" H 5200 6650 50  0001 C CNN
F 3 "" H 5200 6650 50  0001 C CNN
	1    5200 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A447A
P 5200 6450
F 0 "#PWR?" H 5200 6300 50  0001 C CNN
F 1 "+5V" H 5215 6623 50  0000 C CNN
F 2 "" H 5200 6450 50  0001 C CNN
F 3 "" H 5200 6450 50  0001 C CNN
	1    5200 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A4480
P 950 6450
AR Path="/5D4A4480" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4480" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4480" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 6300 50  0001 C CNN
F 1 "+5V" H 965 6623 50  0000 C CNN
F 2 "" H 950 6450 50  0001 C CNN
F 3 "" H 950 6450 50  0001 C CNN
	1    950  6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A4486
P 950 6650
AR Path="/5D4A4486" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A4486" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A4486" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 6400 50  0001 C CNN
F 1 "GND" H 955 6477 50  0000 C CNN
F 2 "" H 950 6650 50  0001 C CNN
F 3 "" H 950 6650 50  0001 C CNN
	1    950  6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A448C
P 950 6550
AR Path="/5CC0D65F/5D4A448C" Ref="C?"  Part="1" 
AR Path="/5D4A448C" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A448C" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A448C" Ref="C?"  Part="1" 
F 0 "C?" H 859 6596 50  0000 R CNN
F 1 "100nF" H 859 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 6550 50  0001 C CNN
F 3 "~" H 950 6550 50  0001 C CNN
	1    950  6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AUC1G74 U?
U 2 1 5D4A4492
P 1300 6550
AR Path="/5D4A4492" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A4492" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A4492" Ref="U?"  Part="2" 
F 0 "U?" H 1480 6596 50  0000 L CNN
F 1 "74AUC1G74" H 1480 6505 50  0000 L CNN
F 2 "" H 1750 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1750 6550 50  0001 C CNN
	2    1300 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G32 U?
U 2 1 5D4A4498
P 1350 5550
AR Path="/5D4A4498" Ref="U?"  Part="2" 
AR Path="/5D30488D/5D4A4498" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A4498" Ref="U?"  Part="2" 
F 0 "U?" H 1480 5346 50  0000 L CNN
F 1 "74AHC1G32" H 1480 5255 50  0000 L CNN
F 2 "" H 1360 5530 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1360 5530 50  0001 C CNN
	2    1350 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A449E
P 950 5700
AR Path="/5D4A449E" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A449E" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A449E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 5550 50  0001 C CNN
F 1 "+5V" H 965 5873 50  0000 C CNN
F 2 "" H 950 5700 50  0001 C CNN
F 3 "" H 950 5700 50  0001 C CNN
	1    950  5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A44A4
P 950 5900
AR Path="/5D4A44A4" Ref="#PWR?"  Part="1" 
AR Path="/5D30488D/5D4A44A4" Ref="#PWR?"  Part="1" 
AR Path="/5D44ECB5/5D4A44A4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 5650 50  0001 C CNN
F 1 "GND" H 955 5727 50  0000 C CNN
F 2 "" H 950 5900 50  0001 C CNN
F 3 "" H 950 5900 50  0001 C CNN
	1    950  5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A44AA
P 950 5800
AR Path="/5CC0D65F/5D4A44AA" Ref="C?"  Part="1" 
AR Path="/5D4A44AA" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A44AA" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A44AA" Ref="C?"  Part="1" 
F 0 "C?" H 859 5846 50  0000 R CNN
F 1 "100nF" H 859 5755 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 5800 50  0001 C CNN
F 3 "~" H 950 5800 50  0001 C CNN
	1    950  5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G04 U?
U 2 1 5D4A44B0
P 2700 7250
AR Path="/5D4A44B0" Ref="U?"  Part="1" 
AR Path="/5D30488D/5D4A44B0" Ref="U?"  Part="2" 
AR Path="/5D44ECB5/5D4A44B0" Ref="U?"  Part="2" 
F 0 "U?" H 2880 7296 50  0000 L CNN
F 1 "74AHC1G04" H 2880 7205 50  0000 L CNN
F 2 "" H 2700 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2700 7250 50  0001 C CNN
	2    2700 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4A44B6
P 2350 7250
AR Path="/5CC0D65F/5D4A44B6" Ref="C?"  Part="1" 
AR Path="/5D4A44B6" Ref="C?"  Part="1" 
AR Path="/5D30488D/5D4A44B6" Ref="C?"  Part="1" 
AR Path="/5D44ECB5/5D4A44B6" Ref="C?"  Part="1" 
F 0 "C?" H 2259 7296 50  0000 R CNN
F 1 "100nF" H 2259 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 7250 50  0001 C CNN
F 3 "~" H 2350 7250 50  0001 C CNN
	1    2350 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D4A44BC
P 2350 7350
F 0 "#PWR?" H 2350 7100 50  0001 C CNN
F 1 "GND" H 2355 7177 50  0000 C CNN
F 2 "" H 2350 7350 50  0001 C CNN
F 3 "" H 2350 7350 50  0001 C CNN
	1    2350 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4A44C2
P 2350 7150
F 0 "#PWR?" H 2350 7000 50  0001 C CNN
F 1 "+5V" H 2365 7323 50  0000 C CNN
F 2 "" H 2350 7150 50  0001 C CNN
F 3 "" H 2350 7150 50  0001 C CNN
	1    2350 7150
	1    0    0    -1  
$EndComp
Text Notes 2000 1500 0    100  ~ 20
Wait State Handling
Text Notes 7300 2450 0    100  ~ 20
Write Pulse Generator
Text Notes 7250 4500 0    100  ~ 20
Write Pulse Width
Wire Wire Line
	1000 700  9850 700 
$EndSCHEMATC
