EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7150 2550 7500 2550
Wire Wire Line
	7150 2450 7500 2450
Wire Wire Line
	7150 2350 7500 2350
Wire Wire Line
	7150 2250 7500 2250
Wire Wire Line
	7150 2150 7500 2150
Wire Wire Line
	7150 2050 7500 2050
Wire Wire Line
	7150 1950 7500 1950
Text Label 7500 2550 2    50   ~ 0
MCA7
Text Label 7500 2450 2    50   ~ 0
MCA6
Text Label 7500 2350 2    50   ~ 0
MCA5
Text Label 7500 2250 2    50   ~ 0
MCA4
Text Label 7500 2150 2    50   ~ 0
MCA3
Text Label 7500 2050 2    50   ~ 0
MCA2
Text Label 7500 1950 2    50   ~ 0
MCA1
Text Label 7500 1850 2    50   ~ 0
MCA0
Wire Wire Line
	7150 1850 7500 1850
Wire Wire Line
	2450 2350 1950 2350
Wire Wire Line
	2950 1250 3150 1250
Wire Wire Line
	3150 1250 3350 1250
Connection ~ 3150 1250
$Comp
L power:+5V #PWR?
U 1 1 6079614B
P 3350 1150
AR Path="/6079614B" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079614B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 1000 50  0001 C CNN
F 1 "+5V" H 3365 1323 50  0000 C CNN
F 2 "" H 3350 1150 50  0001 C CNN
F 3 "" H 3350 1150 50  0001 C CNN
	1    3350 1150
	1    0    0    -1  
$EndComp
Entry Wire Line
	4400 1850 4500 1750
Entry Wire Line
	4400 1950 4500 1850
Entry Wire Line
	4400 2050 4500 1950
Entry Wire Line
	4400 2150 4500 2050
Entry Wire Line
	4400 2250 4500 2150
Entry Wire Line
	4400 2350 4500 2250
Entry Wire Line
	4400 2450 4500 2350
Entry Wire Line
	4400 2550 4500 2450
Entry Wire Line
	5700 1850 5600 1750
Entry Wire Line
	5700 1950 5600 1850
Entry Wire Line
	5700 2050 5600 1950
Entry Wire Line
	5700 2150 5600 2050
Entry Wire Line
	5700 2250 5600 2150
Entry Wire Line
	5700 2350 5600 2250
Entry Wire Line
	5700 2450 5600 2350
Entry Wire Line
	5700 2550 5600 2450
Wire Wire Line
	3950 2550 4400 2550
Wire Wire Line
	3950 2450 4400 2450
Wire Wire Line
	3950 2350 4400 2350
Wire Wire Line
	3950 2250 4400 2250
Wire Wire Line
	3950 2150 4400 2150
Wire Wire Line
	3950 2050 4400 2050
Wire Wire Line
	3950 1950 4400 1950
Wire Wire Line
	3950 1850 4400 1850
$Comp
L alexios:74AC573 U?
U 1 1 6079616A
P 6650 2350
AR Path="/6079616A" Ref="U?"  Part="1" 
AR Path="/60757845/6079616A" Ref="U2"  Part="1" 
F 0 "U2" H 6650 3117 50  0000 C CNN
F 1 "74AC573" H 6650 3026 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 6650 2350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 6650 2350 50  0001 C CNN
F 4 "Yes" H 1350 600 50  0001 C CNN "Verified"
	1    6650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2150 1100 2150
Wire Wire Line
	2450 2250 1100 2250
Text Label 1250 2150 0    50   ~ 0
~WR
Text Label 1250 2250 0    50   ~ 0
~RD
Text Label 1950 2350 0    50   ~ 0
ALE
Text Label 4550 4850 2    50   ~ 0
~SCANEN
$Comp
L alexios:74LVC1G04 U?
U 1 1 607961F4
P 5600 3150
AR Path="/607961F4" Ref="U?"  Part="1" 
AR Path="/60757845/607961F4" Ref="U?"  Part="1" 
F 0 "U?" V 5596 3280 50  0000 L CNN
F 1 "74LVC1G04" V 5505 3280 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5600 3150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 5600 3150 50  0001 C CNN
	1    5600 3150
	0    1    -1   0   
$EndComp
Text Label 2150 7000 2    50   ~ 0
MISO
Text Label 2150 7200 2    50   ~ 0
SCK
Text Label 2150 7300 2    50   ~ 0
~DFPRESET
Text Label 1950 2750 0    50   ~ 0
~µCRESET
Text Label 2150 7100 2    50   ~ 0
MOSI
Wire Wire Line
	3950 2850 4200 2850
Text Label 4200 2850 2    50   ~ 0
SCK
Text Label 4550 4550 2    50   ~ 0
~IOINT
Text Label 4650 3650 2    50   ~ 0
CLRWS
Text Label 4300 4250 2    50   ~ 0
~R
Text Label 4300 4350 2    50   ~ 0
~W
Wire Wire Line
	2450 3850 1950 3850
Text Label 1950 3850 0    50   ~ 0
RXD
Text Label 1250 4050 0    50   ~ 0
~FPIRQ
Wire Wire Line
	3950 2750 4200 2750
Text Label 4300 4050 2    50   ~ 0
~MEM
Text Label 4300 4150 2    50   ~ 0
~IO
Text Label 4200 2750 2    50   ~ 0
~CLR
Text Label 1750 2950 0    50   ~ 0
SWA0
Text Label 1750 3050 0    50   ~ 0
SWA1
Text Label 1750 3150 0    50   ~ 0
SWA2
Text Label 1750 3250 0    50   ~ 0
SWA3
Text Label 1750 3350 0    50   ~ 0
SWD0
Text Label 1750 3450 0    50   ~ 0
SWD1
Text Label 1750 3550 0    50   ~ 0
SWD2
Text Label 1750 3650 0    50   ~ 0
SWD3
Text Label 4550 5150 2    50   ~ 0
STEP∕~RUN
Text Label 4550 5250 2    50   ~ 0
~µSTEP
Text Label 4550 4650 2    50   ~ 0
~WAIT
Text Label 4650 3950 2    50   ~ 0
~DBOE
Text Label 4650 3850 2    50   ~ 0
~ABOE
Text Label 4650 3750 2    50   ~ 0
~IBOE
Text Label 4550 4950 2    50   ~ 0
~PANELEN
Wire Wire Line
	1700 7300 2150 7300
Wire Wire Line
	1700 7100 2150 7100
Wire Wire Line
	1700 7200 2150 7200
Wire Wire Line
	1700 7000 2150 7000
$Comp
L Device:C_Small C?
U 1 1 60796337
P 1400 5650
AR Path="/60796337" Ref="C?"  Part="1" 
AR Path="/60757845/60796337" Ref="C?"  Part="1" 
F 0 "C?" H 1450 5900 50  0000 R CNN
F 1 "100nF" H 1550 5400 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 5650 50  0001 C CNN
F 3 "~" H 1400 5650 50  0001 C CNN
	1    1400 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6079633D
P 1200 5850
AR Path="/6079633D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079633D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1200 5600 50  0001 C CNN
F 1 "GND" H 1205 5677 50  0000 C CNN
F 2 "" H 1200 5850 50  0001 C CNN
F 3 "" H 1200 5850 50  0001 C CNN
	1    1200 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5500 1400 5500
Wire Wire Line
	1200 5500 1200 5450
Wire Wire Line
	1400 5550 1400 5500
Connection ~ 1400 5500
Wire Wire Line
	1400 5750 1400 5800
Wire Wire Line
	1400 5800 1500 5800
Wire Wire Line
	1200 5800 1200 5850
Connection ~ 1400 5800
$Comp
L Device:C_Small C?
U 1 1 6079634B
P 1200 5650
AR Path="/6079634B" Ref="C?"  Part="1" 
AR Path="/60757845/6079634B" Ref="C?"  Part="1" 
F 0 "C?" H 1100 5900 50  0000 R CNN
F 1 "1µF" H 1100 5650 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 5650 50  0001 C CNN
F 3 "~" H 1200 5650 50  0001 C CNN
	1    1200 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5500 1200 5550
Wire Wire Line
	1200 5800 1200 5750
Connection ~ 1200 5500
Wire Wire Line
	1200 5500 1400 5500
Connection ~ 1200 5800
Wire Wire Line
	1200 5800 1400 5800
$Comp
L power:+5V #PWR?
U 1 1 60796357
P 2350 5450
AR Path="/60796357" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796357" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 5300 50  0001 C CNN
F 1 "+5V" H 2365 5623 50  0000 C CNN
F 2 "" H 2350 5450 50  0001 C CNN
F 3 "" H 2350 5450 50  0001 C CNN
	1    2350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5500 2350 5450
NoConn ~ 3050 5500
Wire Wire Line
	2300 5650 2750 5650
Wire Wire Line
	2300 5500 2350 5500
Text Label 1250 4150 0    50   ~ 0
MFD0
Text Label 1250 4250 0    50   ~ 0
MFD1
Text Label 4000 1850 0    50   ~ 0
MCD0
Text Label 4000 1950 0    50   ~ 0
MCD1
Text Label 4000 2050 0    50   ~ 0
MCD2
Text Label 4000 2150 0    50   ~ 0
MCD3
Text Label 4000 2250 0    50   ~ 0
MCD4
Text Label 4000 2350 0    50   ~ 0
MCD5
Text Label 4000 2450 0    50   ~ 0
MCD6
Text Label 4000 2550 0    50   ~ 0
MCD7
Wire Wire Line
	2950 1250 2950 1600
Wire Wire Line
	3150 1250 3150 1600
Entry Wire Line
	7500 1850 7600 1950
Entry Wire Line
	7500 1950 7600 2050
Entry Wire Line
	7500 2050 7600 2150
Entry Wire Line
	7500 2150 7600 2250
Entry Wire Line
	7500 2250 7600 2350
Entry Wire Line
	7500 2350 7600 2450
Entry Wire Line
	7500 2450 7600 2550
Entry Wire Line
	7500 2550 7600 2650
Text Notes 3850 1350 0    100  ~ 20
DFP Microcontroller
Text Label 2400 5650 0    50   ~ 0
µCCLK
Text Label 7600 3150 1    50   ~ 0
MCA[0..7]
Entry Wire Line
	1700 3350 1600 3450
Entry Wire Line
	1700 3450 1600 3550
Entry Wire Line
	1700 3550 1600 3650
Entry Wire Line
	1700 3650 1600 3750
Text Label 1600 3100 1    50   ~ 0
SWA[0..3]
Text Label 1600 3850 1    50   ~ 0
SWD[0..3]
Text Notes 5350 5175 0    50   ~ 0
(= ~LED-RUN)
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 6650 3950
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U3"  Part="1" 
F 0 "U3" H 6650 4717 50  0000 C CNN
F 1 "74HC590" H 6650 4626 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6950 4300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6950 4300 50  0001 C CNN
	1    6650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3450 7500 3450
Wire Wire Line
	7150 3550 7500 3550
Wire Wire Line
	7150 3650 7500 3650
Text Label 7200 3550 0    50   ~ 0
MCA1
Text Label 7200 3650 0    50   ~ 0
MCA2
Text Label 7200 3750 0    50   ~ 0
MCA3
Text Label 7200 3850 0    50   ~ 0
MCA4
Text Label 5700 4350 0    50   ~ 0
~SCANEN
$Comp
L power:GND #PWR?
U 1 1 60796430
P 6150 3450
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6150 3200 50  0001 C CNN
F 1 "GND" V 6155 3322 50  0000 R CNN
F 2 "" H 6150 3450 50  0001 C CNN
F 3 "" H 6150 3450 50  0001 C CNN
	1    6150 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 3650 6100 3650
Text Label 5700 3650 0    50   ~ 0
SCANCLK
Wire Wire Line
	6100 3650 6100 3750
Wire Wire Line
	6100 3750 6150 3750
Connection ~ 6100 3650
Text Label 5700 3950 0    50   ~ 0
~SCANCLR
Wire Wire Line
	5700 3950 6150 3950
NoConn ~ 7150 4350
Wire Wire Line
	7150 3850 7500 3850
Wire Wire Line
	7150 3750 7500 3750
Text Label 7200 3450 0    50   ~ 0
MCA0
Wire Wire Line
	5700 3650 6100 3650
Wire Wire Line
	3950 4850 5600 4850
Wire Wire Line
	5600 3450 5600 4350
Wire Wire Line
	5600 4350 6150 4350
Wire Wire Line
	5600 2950 5600 2850
Wire Wire Line
	5600 2850 6150 2850
Text Label 5600 1850 3    50   ~ 0
MCD[0..7]
Entry Bus Bus
	5500 1500 5600 1600
Wire Bus Line
	5500 1500 4600 1500
Entry Bus Bus
	4600 1500 4500 1600
Text Label 6100 1850 2    50   ~ 0
MCD0
Text Label 6100 1950 2    50   ~ 0
MCD1
Text Label 6100 2050 2    50   ~ 0
MCD2
Text Label 6100 2150 2    50   ~ 0
MCD3
Text Label 6100 2250 2    50   ~ 0
MCD4
Text Label 6100 2350 2    50   ~ 0
MCD5
Text Label 6100 2450 2    50   ~ 0
MCD6
Text Label 6100 2550 2    50   ~ 0
MCD7
Wire Wire Line
	5700 2550 6150 2550
Wire Wire Line
	5700 2450 6150 2450
Wire Wire Line
	5700 2350 6150 2350
Wire Wire Line
	5700 2250 6150 2250
Wire Wire Line
	5700 2150 6150 2150
Wire Wire Line
	5700 2050 6150 2050
Wire Wire Line
	5700 1950 6150 1950
Wire Wire Line
	5700 1850 6150 1850
Wire Wire Line
	7950 4150 7700 4150
Wire Wire Line
	7950 4050 7700 4050
Wire Wire Line
	7950 3950 7700 3950
Text Label 7700 4150 0    50   ~ 0
MCA7
Text Label 7700 4050 0    50   ~ 0
MCA6
Text Label 7700 3950 0    50   ~ 0
MCA5
Connection ~ 5600 4350
Wire Wire Line
	5600 4350 5600 4850
Entry Bus Bus
	5600 1600 5700 1500
Text Label 7450 1500 2    50   ~ 0
MCD[0..7]
Text Notes 6100 1350 0    100  ~ 20
Address Latch
$Comp
L power:+5V #PWR?
U 1 1 6079657B
P 850 6950
AR Path="/6079657B" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079657B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 6800 50  0001 C CNN
F 1 "+5V" H 865 7123 50  0000 C CNN
F 2 "" H 850 6950 50  0001 C CNN
F 3 "" H 850 6950 50  0001 C CNN
	1    850  6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60796581
P 850 7350
AR Path="/60796581" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796581" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 7100 50  0001 C CNN
F 1 "GND" H 855 7177 50  0000 C CNN
F 2 "" H 850 7350 50  0001 C CNN
F 3 "" H 850 7350 50  0001 C CNN
	1    850  7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:AVR-ISP-6 J?
U 1 1 6079658C
P 1300 7150
AR Path="/6079658C" Ref="J?"  Part="1" 
AR Path="/60757845/6079658C" Ref="J?"  Part="1" 
F 0 "J?" H 1300 7617 50  0000 C CNN
F 1 "AVR-ISP-6" H 1300 7526 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Horizontal" V 1050 7150 50  0001 C CNN
F 3 " ~" H 25  6600 50  0001 C CNN
	1    1300 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  6950 850  7000
Wire Wire Line
	850  7000 900  7000
Wire Wire Line
	900  7300 850  7300
Wire Wire Line
	850  7300 850  7350
Text Notes 1200 6600 0    100  ~ 20
ISP
$Comp
L power:+5V #PWR?
U 1 1 607965C2
P 1200 5450
AR Path="/607965C2" Ref="#PWR?"  Part="1" 
AR Path="/60757845/607965C2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1200 5300 50  0001 C CNN
F 1 "+5V" H 1215 5623 50  0000 C CNN
F 2 "" H 1200 5450 50  0001 C CNN
F 3 "" H 1200 5450 50  0001 C CNN
	1    1200 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 607965C8
P 3400 5500
AR Path="/607965C8" Ref="#PWR?"  Part="1" 
AR Path="/60757845/607965C8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3400 5250 50  0001 C CNN
F 1 "GND" H 3405 5327 50  0000 C CNN
F 2 "" H 3400 5500 50  0001 C CNN
F 3 "" H 3400 5500 50  0001 C CNN
	1    3400 5500
	1    0    0    -1  
$EndComp
Text Label 1250 2450 0    50   ~ 0
~FPHALT
$Comp
L alexios:CXO X?
U 1 1 607966FC
P 1800 5600
AR Path="/607966FC" Ref="X?"  Part="1" 
AR Path="/60757845/607966FC" Ref="X1"  Part="1" 
F 0 "X1" H 1900 5967 50  0000 C CNN
F 1 "CXO" H 1900 5876 50  0000 C CNN
F 2 "alexios:Crystal_SMD_7050-4Pin_7.0x5.0mm" H 1950 5200 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/741/LFSPXO022296Bulk-985375.pdf" H 1900 5550 50  0001 C CNN
F 4 "449-LFSPXO019275REEL" H 1800 5600 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H 1800 5600 50  0001 C CNN "Verified"
	1    1800 5600
	1    0    0    -1  
$EndComp
NoConn ~ 7150 4150
NoConn ~ 7150 4050
NoConn ~ 7150 3950
Text Label 1950 3950 0    50   ~ 0
TXD
Wire Wire Line
	2450 3950 1950 3950
Wire Wire Line
	3350 1250 3350 1600
Connection ~ 3350 1250
Text Notes 950  3750 0    50   ~ 0
Pulled up\ninternally
Text Label 1250 4350 0    50   ~ 0
~CVOE
$Comp
L Connector:TestPoint TP?
U 1 1 607968B3
P 2450 2550
AR Path="/607968B3" Ref="TP?"  Part="1" 
AR Path="/60757845/607968B3" Ref="TP?"  Part="1" 
F 0 "TP?" V 2450 2738 50  0000 L CNN
F 1 "TestPoint" V 2554 2622 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 2650 2550 50  0001 C CNN
F 3 "~" H 2650 2550 50  0001 C CNN
	1    2450 2550
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 607968B9
P 4200 3050
AR Path="/607968B9" Ref="TP?"  Part="1" 
AR Path="/60757845/607968B9" Ref="TP?"  Part="1" 
F 0 "TP?" V 4200 3238 50  0000 L CNN
F 1 "TestPoint" V 4304 3122 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 4400 3050 50  0001 C CNN
F 3 "~" H 4400 3050 50  0001 C CNN
	1    4200 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 2050 2400 2050
NoConn ~ 2400 2050
NoConn ~ 3950 2950
Text Label 2200 3850 0    50   ~ 0
MOSI
Text Label 2200 3950 0    50   ~ 0
MISO
Wire Wire Line
	3950 3050 4200 3050
$Comp
L alexios:ATmega64-16AU U?
U 1 1 607968E0
P 3250 3550
AR Path="/607968E0" Ref="U?"  Part="1" 
AR Path="/60757845/607968E0" Ref="U1"  Part="1" 
F 0 "U1" H 3650 5600 50  0000 C CNN
F 1 "ATmega64-16AU" H 3700 5500 50  0000 C CNN
F 2 "alexios:TQFP-64" H 1275 5225 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2490-8-bit-avr-microcontroller-atmega64-l_datasheet.pdf" H 3000 3550 50  0001 C CNN
F 4 "556-ATMEGA64L-8AU" H 3250 3550 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H 3250 3550 50  0001 C CNN "Verified"
	1    3250 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	7800 1850 7700 1750
Entry Wire Line
	7800 1950 7700 1850
Entry Wire Line
	7800 2050 7700 1950
Entry Wire Line
	7800 2150 7700 2050
Entry Wire Line
	7800 2250 7700 2150
Entry Wire Line
	7800 2350 7700 2250
Entry Wire Line
	7800 2450 7700 2350
Entry Wire Line
	7800 2550 7700 2450
Entry Bus Bus
	7600 1500 7700 1600
Text Label 8150 1850 2    50   ~ 0
MCD0
Wire Bus Line
	5700 1500 7600 1500
Text Label 7950 2750 0    50   ~ 0
~RD
Text Label 7950 2850 0    50   ~ 0
SCANEN
Wire Wire Line
	7800 2550 8250 2550
Wire Wire Line
	7800 2450 8250 2450
Wire Wire Line
	7800 2350 8250 2350
Wire Wire Line
	7800 2250 8250 2250
Wire Wire Line
	7800 2150 8250 2150
Wire Wire Line
	7800 2050 8250 2050
Wire Wire Line
	7800 1950 8250 1950
Wire Wire Line
	7800 1850 8250 1850
Wire Wire Line
	7950 2850 8250 2850
Wire Wire Line
	8250 2750 7950 2750
Text Label 9950 2550 2    50   ~ 0
FPD7
Text Label 9950 2450 2    50   ~ 0
FPD6
Text Label 9950 2350 2    50   ~ 0
FPD5
Text Label 9950 2250 2    50   ~ 0
FPD4
Text Label 9950 2150 2    50   ~ 0
FPD3
Text Label 9950 2050 2    50   ~ 0
FPD2
Text Label 9950 1950 2    50   ~ 0
FPD1
Text Label 9950 1850 2    50   ~ 0
FPD0
Wire Wire Line
	10000 1850 9550 1850
Wire Wire Line
	10000 1950 9550 1950
Wire Wire Line
	10000 2050 9550 2050
Wire Wire Line
	10000 2150 9550 2150
Wire Wire Line
	10000 2250 9550 2250
Wire Wire Line
	10000 2350 9550 2350
Wire Wire Line
	10000 2450 9550 2450
Wire Wire Line
	10000 2550 9550 2550
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60CC9B5D
P 9450 2250
AR Path="/60CC9B5D" Ref="RN?"  Part="1" 
AR Path="/60757845/60CC9B5D" Ref="RN?"  Part="1" 
F 0 "RN?" H 9550 2300 50  0001 L CNN
F 1 "30Ω" H 9650 1850 50  0001 C CNN
F 2 "" H 9450 2330 50  0001 C CNN
F 3 "~" V 9450 2250 50  0001 C CNN
	1    9450 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 60CC9B57
P 9450 1850
AR Path="/60CC9B57" Ref="RN?"  Part="1" 
AR Path="/60757845/60CC9B57" Ref="RN?"  Part="1" 
F 0 "RN?" H 9350 2000 50  0000 L CNN
F 1 "30Ω" H 9600 1900 50  0000 C CNN
F 2 "" H 9450 1930 50  0001 C CNN
F 3 "~" V 9450 1850 50  0001 C CNN
	1    9450 1850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60CC9B51
P 9450 1950
AR Path="/60CC9B51" Ref="RN?"  Part="2" 
AR Path="/60757845/60CC9B51" Ref="RN?"  Part="2" 
F 0 "RN?" H 9550 2000 50  0001 L CNN
F 1 "30Ω" H 9425 2056 50  0001 C CNN
F 2 "" H 9450 2030 50  0001 C CNN
F 3 "~" V 9450 1950 50  0001 C CNN
	2    9450 1950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60CC9B4B
P 9450 2050
AR Path="/60CC9B4B" Ref="RN?"  Part="3" 
AR Path="/60757845/60CC9B4B" Ref="RN?"  Part="3" 
F 0 "RN?" H 9550 2100 50  0001 L CNN
F 1 "30Ω" H 9425 2156 50  0001 C CNN
F 2 "" H 9450 2130 50  0001 C CNN
F 3 "~" V 9450 2050 50  0001 C CNN
	3    9450 2050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60CC9B45
P 9450 2150
AR Path="/60CC9B45" Ref="RN?"  Part="4" 
AR Path="/60757845/60CC9B45" Ref="RN?"  Part="4" 
F 0 "RN?" H 9550 2200 50  0001 L CNN
F 1 "30Ω" H 9425 2256 50  0001 C CNN
F 2 "" H 9450 2230 50  0001 C CNN
F 3 "~" V 9450 2150 50  0001 C CNN
	4    9450 2150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 60CC9B3F
P 9450 2350
AR Path="/60CC9B3F" Ref="RN?"  Part="2" 
AR Path="/60757845/60CC9B3F" Ref="RN?"  Part="2" 
F 0 "RN?" H 9550 2400 50  0001 L CNN
F 1 "30Ω" H 9425 2456 50  0001 C CNN
F 2 "" H 9450 2430 50  0001 C CNN
F 3 "~" V 9450 2350 50  0001 C CNN
	2    9450 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 60CC9B39
P 9450 2450
AR Path="/60CC9B39" Ref="RN?"  Part="3" 
AR Path="/60757845/60CC9B39" Ref="RN?"  Part="3" 
F 0 "RN?" H 9550 2500 50  0001 L CNN
F 1 "30Ω" H 9425 2556 50  0001 C CNN
F 2 "" H 9450 2530 50  0001 C CNN
F 3 "~" V 9450 2450 50  0001 C CNN
	3    9450 2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 60CC9B33
P 9450 2550
AR Path="/60CC9B33" Ref="RN?"  Part="4" 
AR Path="/60757845/60CC9B33" Ref="RN?"  Part="4" 
F 0 "RN?" H 9350 2400 50  0000 L CNN
F 1 "30Ω" H 9650 2500 50  0000 C CNN
F 2 "" H 9450 2630 50  0001 C CNN
F 3 "~" V 9450 2550 50  0001 C CNN
	4    9450 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2550 9300 2550
Wire Wire Line
	9250 2450 9300 2450
Wire Wire Line
	9250 2350 9300 2350
Wire Wire Line
	9250 2250 9300 2250
Wire Wire Line
	9250 2150 9300 2150
Wire Wire Line
	9250 2050 9300 2050
Wire Wire Line
	9250 1950 9300 1950
Wire Wire Line
	9250 1850 9300 1850
$Comp
L alexios:74HC245 U4
U 1 1 60AE5F32
P 8750 2350
F 0 "U4" H 8750 3117 50  0000 C CNN
F 1 "74HC245" H 8750 3026 50  0000 C CNN
F 2 "" H 8750 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 8750 2400 50  0001 C CNN
	1    8750 2350
	1    0    0    -1  
$EndComp
Text Label 8150 1950 2    50   ~ 0
MCD1
Text Label 8150 2050 2    50   ~ 0
MCD2
Text Label 8150 2150 2    50   ~ 0
MCD3
Text Label 8150 2250 2    50   ~ 0
MCD4
Text Label 8150 2350 2    50   ~ 0
MCD5
Text Label 8150 2450 2    50   ~ 0
MCD6
Text Label 8150 2550 2    50   ~ 0
MCD7
Wire Wire Line
	5700 2750 6150 2750
Text Label 5700 2850 0    50   ~ 0
SCANEN
Text Label 5700 2750 0    50   ~ 0
ALE
Entry Wire Line
	10000 1850 10100 1750
Entry Wire Line
	10000 1950 10100 1850
Entry Wire Line
	10000 2050 10100 1950
Entry Wire Line
	10000 2150 10100 2050
Entry Wire Line
	10000 2250 10100 2150
Entry Wire Line
	10000 2350 10100 2250
Entry Wire Line
	10000 2450 10100 2350
Entry Wire Line
	10000 2550 10100 2450
Entry Bus Bus
	10200 1500 10100 1600
Wire Bus Line
	10650 1500 10200 1500
Text Label 10250 1500 0    50   ~ 0
FPD[0..7]
Text HLabel 10650 1500 2    50   BiDi ~ 0
FPD[0..7]
Entry Bus Bus
	7600 4350 7700 4450
Entry Wire Line
	7700 4150 7600 4250
Entry Wire Line
	7700 4050 7600 4150
Entry Wire Line
	7700 3950 7600 4050
Entry Wire Line
	7500 3850 7600 3950
Entry Wire Line
	7500 3750 7600 3850
Entry Wire Line
	7500 3650 7600 3750
Entry Wire Line
	7500 3550 7600 3650
Entry Wire Line
	7500 3450 7600 3550
Text Label 8700 3950 1    50   ~ 0
MCA[0..7]
Wire Wire Line
	10000 3450 9550 3450
Wire Wire Line
	10000 3550 9550 3550
Wire Wire Line
	10000 3650 9550 3650
Wire Wire Line
	10000 3750 9550 3750
Wire Wire Line
	10000 3850 9550 3850
Wire Wire Line
	10000 3950 9550 3950
Wire Wire Line
	10000 4050 9550 4050
Wire Wire Line
	10000 4150 9550 4150
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C6F
P 9450 3850
AR Path="/610F1C6F" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C6F" Ref="RN?"  Part="1" 
F 0 "RN?" H 9550 3900 50  0001 L CNN
F 1 "30Ω" H 9650 3450 50  0001 C CNN
F 2 "" H 9450 3930 50  0001 C CNN
F 3 "~" V 9450 3850 50  0001 C CNN
	1    9450 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C75
P 9450 3450
AR Path="/610F1C75" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C75" Ref="RN?"  Part="1" 
F 0 "RN?" H 9350 3600 50  0000 L CNN
F 1 "30Ω" H 9600 3500 50  0000 C CNN
F 2 "" H 9450 3530 50  0001 C CNN
F 3 "~" V 9450 3450 50  0001 C CNN
	1    9450 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C7B
P 9450 3550
AR Path="/610F1C7B" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C7B" Ref="RN?"  Part="2" 
F 0 "RN?" H 9550 3600 50  0001 L CNN
F 1 "30Ω" H 9425 3656 50  0001 C CNN
F 2 "" H 9450 3630 50  0001 C CNN
F 3 "~" V 9450 3550 50  0001 C CNN
	2    9450 3550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C81
P 9450 3650
AR Path="/610F1C81" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C81" Ref="RN?"  Part="3" 
F 0 "RN?" H 9550 3700 50  0001 L CNN
F 1 "30Ω" H 9425 3756 50  0001 C CNN
F 2 "" H 9450 3730 50  0001 C CNN
F 3 "~" V 9450 3650 50  0001 C CNN
	3    9450 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C87
P 9450 3750
AR Path="/610F1C87" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C87" Ref="RN?"  Part="4" 
F 0 "RN?" H 9550 3800 50  0001 L CNN
F 1 "30Ω" H 9425 3856 50  0001 C CNN
F 2 "" H 9450 3830 50  0001 C CNN
F 3 "~" V 9450 3750 50  0001 C CNN
	4    9450 3750
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C8D
P 9450 3950
AR Path="/610F1C8D" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C8D" Ref="RN?"  Part="2" 
F 0 "RN?" H 9550 4000 50  0001 L CNN
F 1 "30Ω" H 9425 4056 50  0001 C CNN
F 2 "" H 9450 4030 50  0001 C CNN
F 3 "~" V 9450 3950 50  0001 C CNN
	2    9450 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C93
P 9450 4050
AR Path="/610F1C93" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C93" Ref="RN?"  Part="3" 
F 0 "RN?" H 9550 4100 50  0001 L CNN
F 1 "30Ω" H 9425 4156 50  0001 C CNN
F 2 "" H 9450 4130 50  0001 C CNN
F 3 "~" V 9450 4050 50  0001 C CNN
	3    9450 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C99
P 9450 4150
AR Path="/610F1C99" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C99" Ref="RN?"  Part="4" 
F 0 "RN?" H 9350 4000 50  0000 L CNN
F 1 "30Ω" H 9650 4100 50  0000 C CNN
F 2 "" H 9450 4230 50  0001 C CNN
F 3 "~" V 9450 4150 50  0001 C CNN
	4    9450 4150
	1    0    0    -1  
$EndComp
Entry Wire Line
	10000 3450 10100 3350
Entry Wire Line
	10000 3550 10100 3450
Entry Wire Line
	10000 3650 10100 3550
Entry Wire Line
	10000 3750 10100 3650
Entry Wire Line
	10000 3850 10100 3750
Entry Wire Line
	10000 3950 10100 3850
Entry Wire Line
	10000 4050 10100 3950
Entry Wire Line
	10000 4150 10100 4050
Entry Bus Bus
	10200 3100 10100 3200
Wire Bus Line
	10650 3100 10200 3100
Text Label 10250 3100 0    50   ~ 0
FPA[0..7]
Text HLabel 10650 3100 2    50   BiDi ~ 0
FPA[0..7]
Text Label 9750 3450 0    50   ~ 0
FPA0
Text Label 9750 3550 0    50   ~ 0
FPA1
Text Label 9750 3650 0    50   ~ 0
FPA2
Text Label 9750 3750 0    50   ~ 0
FPA3
Text Label 9750 3850 0    50   ~ 0
FPA4
Text Label 9750 3950 0    50   ~ 0
FPA5
Text Label 9750 4050 0    50   ~ 0
FPA6
Text Label 9750 4150 0    50   ~ 0
FPA7
Entry Wire Line
	8800 4150 8700 4250
Entry Wire Line
	8800 4050 8700 4150
Entry Wire Line
	8800 3950 8700 4050
Entry Wire Line
	8800 3850 8700 3950
Entry Wire Line
	8800 3750 8700 3850
Entry Wire Line
	8800 3650 8700 3750
Entry Wire Line
	8800 3550 8700 3650
Entry Wire Line
	8800 3450 8700 3550
Entry Bus Bus
	8600 4450 8700 4350
Text Label 8900 3450 0    50   ~ 0
MCA7
Text Label 8900 3550 0    50   ~ 0
MCA6
Text Label 8900 3650 0    50   ~ 0
MCA5
Text Label 8900 3750 0    50   ~ 0
MCA4
Text Label 8900 3850 0    50   ~ 0
MCA3
Text Label 8900 3950 0    50   ~ 0
MCA2
Text Label 8900 4050 0    50   ~ 0
MCA1
Text Label 8900 4150 0    50   ~ 0
MCA0
Wire Wire Line
	8800 3450 9300 3450
Wire Wire Line
	8800 3550 9300 3550
Wire Wire Line
	8800 3650 9300 3650
Wire Wire Line
	8800 3750 9300 3750
Wire Wire Line
	8800 3850 9300 3850
Wire Wire Line
	8800 3950 9300 3950
Wire Wire Line
	8800 4050 9300 4050
Wire Wire Line
	8800 4150 9300 4150
Wire Bus Line
	7700 4450 8600 4450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 615F27AA
P 8100 3950
AR Path="/615F27AA" Ref="RN?"  Part="1" 
AR Path="/60757845/615F27AA" Ref="RN?"  Part="1" 
F 0 "RN?" H 8000 4150 50  0000 L CNN
F 1 "30Ω" H 8100 4050 50  0000 C CNN
F 2 "" H 8100 4030 50  0001 C CNN
F 3 "~" V 8100 3950 50  0001 C CNN
	1    8100 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 615F27B0
P 8100 4050
AR Path="/615F27B0" Ref="RN?"  Part="2" 
AR Path="/60757845/615F27B0" Ref="RN?"  Part="2" 
F 0 "RN?" H 8200 4100 50  0001 L CNN
F 1 "30Ω" H 8075 4156 50  0001 C CNN
F 2 "" H 8100 4130 50  0001 C CNN
F 3 "~" V 8100 4050 50  0001 C CNN
	2    8100 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 615F27B6
P 8100 4150
AR Path="/615F27B6" Ref="RN?"  Part="3" 
AR Path="/60757845/615F27B6" Ref="RN?"  Part="3" 
F 0 "RN?" H 8200 4200 50  0001 L CNN
F 1 "30Ω" H 8075 4256 50  0001 C CNN
F 2 "" H 8100 4230 50  0001 C CNN
F 3 "~" V 8100 4150 50  0001 C CNN
	3    8100 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 615F27BC
P 8100 4250
AR Path="/615F27BC" Ref="RN?"  Part="4" 
AR Path="/60757845/615F27BC" Ref="RN?"  Part="4" 
F 0 "RN?" H 8200 4300 50  0001 L CNN
F 1 "30Ω" H 8075 4356 50  0001 C CNN
F 2 "" H 8100 4330 50  0001 C CNN
F 3 "~" V 8100 4250 50  0001 C CNN
	4    8100 4250
	1    0    0    1   
$EndComp
Wire Wire Line
	8200 3950 8350 3950
Wire Wire Line
	8200 4050 8350 4050
Wire Wire Line
	8200 4150 8350 4150
Wire Wire Line
	8200 4250 8350 4250
Wire Wire Line
	8350 4250 8350 4150
Connection ~ 8350 3950
Wire Wire Line
	8350 3950 8350 3900
Connection ~ 8350 4050
Wire Wire Line
	8350 4050 8350 3950
Connection ~ 8350 4150
Wire Wire Line
	8350 4150 8350 4050
$Comp
L power:+5V #PWR?
U 1 1 6175C221
P 8350 3900
F 0 "#PWR?" H 8350 3750 50  0001 C CNN
F 1 "+5V" H 8365 4073 50  0000 C CNN
F 2 "" H 8350 3900 50  0001 C CNN
F 3 "" H 8350 3900 50  0001 C CNN
	1    8350 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4250 7900 4250
NoConn ~ 7900 4250
Text HLabel 1100 2450 0    50   Output ~ 0
~FPHALT
Text Notes 4650 6200 2    100  ~ 20
Control Interface & TTYD
$Comp
L Device:R_Small R?
U 1 1 61A9832D
P 3500 6900
AR Path="/61A9832D" Ref="R?"  Part="1" 
AR Path="/60757845/61A9832D" Ref="R?"  Part="1" 
F 0 "R?" V 3604 6900 50  0000 C CNN
F 1 "30Ω" V 3695 6900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3500 6900 50  0001 C CNN
F 3 "~" H 3500 6900 50  0001 C CNN
	1    3500 6900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61A98336
P 1700 1450
AR Path="/61A98336" Ref="C?"  Part="1" 
AR Path="/60757845/61A98336" Ref="C?"  Part="1" 
F 0 "C?" H 1609 1496 50  0000 R CNN
F 1 "100nF" H 1609 1405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1700 1450 50  0001 C CNN
F 3 "~" H 1700 1450 50  0001 C CNN
	1    1700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1300 1700 1350
$Comp
L Device:R_Small R?
U 1 1 61A98345
P 1850 1100
AR Path="/61A98345" Ref="R?"  Part="1" 
AR Path="/60757845/61A98345" Ref="R?"  Part="1" 
F 0 "R?" H 1908 1054 50  0000 L CNN
F 1 "4.7kΩ" H 1908 1145 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 1100 50  0001 C CNN
F 3 "~" H 1850 1100 50  0001 C CNN
	1    1850 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 1200 1850 1300
$Comp
L power:+5V #PWR?
U 1 1 61A9834E
P 1850 950
AR Path="/61A9834E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9834E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1850 800 50  0001 C CNN
F 1 "+5V" H 1865 1123 50  0000 C CNN
F 2 "" H 1850 950 50  0001 C CNN
F 3 "" H 1850 950 50  0001 C CNN
	1    1850 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 61A98354
P 1450 1100
AR Path="/61A98354" Ref="D?"  Part="1" 
AR Path="/60757845/61A98354" Ref="D?"  Part="1" 
F 0 "D?" V 1404 1020 50  0000 R CNN
F 1 "D_ALT" V 1495 1020 50  0000 R CNN
F 2 "" H 1450 1100 50  0001 C CNN
F 3 "~" H 1450 1100 50  0001 C CNN
	1    1450 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 6800 2600 6800
Wire Wire Line
	2950 7000 2600 7000
Text Label 2600 6800 0    50   ~ 0
~uCRESET
Text Label 2600 7000 0    50   ~ 0
TXD
$Comp
L Device:R_Small R?
U 1 1 61A98368
P 3350 6650
AR Path="/61A98368" Ref="R?"  Part="1" 
AR Path="/60757845/61A98368" Ref="R?"  Part="1" 
F 0 "R?" H 3291 6604 50  0000 R CNN
F 1 "10kΩ" H 3291 6695 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 6650 50  0001 C CNN
F 3 "~" H 3350 6650 50  0001 C CNN
	1    3350 6650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A9836E
P 3350 6550
AR Path="/61A9836E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9836E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 6400 50  0001 C CNN
F 1 "+5V" H 3365 6723 50  0000 C CNN
F 2 "" H 3350 6550 50  0001 C CNN
F 3 "" H 3350 6550 50  0001 C CNN
	1    3350 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6800 3350 6800
Wire Wire Line
	3350 6800 3350 6900
Wire Wire Line
	3350 7000 3250 7000
Wire Wire Line
	3350 6750 3350 6800
Connection ~ 3350 6800
Wire Wire Line
	3350 6900 3400 6900
Connection ~ 3350 6900
Wire Wire Line
	3350 6900 3350 7000
$Comp
L Device:D_Schottky_ALT D?
U 1 1 61A98389
P 3100 7000
AR Path="/61A98389" Ref="D?"  Part="1" 
AR Path="/60757845/61A98389" Ref="D?"  Part="1" 
F 0 "D?" H 3000 7100 50  0000 R CNN
F 1 "?" H 3200 6900 50  0000 C CNN
F 2 "" H 3100 7000 50  0001 C CNN
F 3 "~" H 3100 7000 50  0001 C CNN
	1    3100 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1150 3350 1250
Connection ~ 2950 1250
Connection ~ 2800 1250
Wire Wire Line
	2800 1250 2950 1250
Wire Wire Line
	2050 1300 2050 1250
Wire Wire Line
	2050 1500 2050 1550
$Comp
L Device:C_Small C?
U 1 1 60796610
P 2050 1400
AR Path="/60796610" Ref="C?"  Part="1" 
AR Path="/60757845/60796610" Ref="C?"  Part="1" 
F 0 "C?" H 2100 1750 50  0000 R CNN
F 1 "1µF" H 2050 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 1400 50  0001 C CNN
F 3 "~" H 2050 1400 50  0001 C CNN
	1    2050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1250 2300 1250
Wire Wire Line
	2050 1550 2300 1550
$Comp
L power:GND #PWR?
U 1 1 60796608
P 2050 1550
AR Path="/60796608" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796608" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2050 1300 50  0001 C CNN
F 1 "GND" H 2050 1350 50  0000 C CNN
F 2 "" H 2050 1550 50  0001 C CNN
F 3 "" H 2050 1550 50  0001 C CNN
	1    2050 1550
	1    0    0    -1  
$EndComp
Connection ~ 2050 1550
$Comp
L Device:C_Small C?
U 1 1 60796601
P 2300 1400
AR Path="/60796601" Ref="C?"  Part="1" 
AR Path="/60757845/60796601" Ref="C?"  Part="1" 
F 0 "C?" H 2350 1750 50  0000 R CNN
F 1 "1µF" H 2300 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 1400 50  0001 C CNN
F 3 "~" H 2300 1400 50  0001 C CNN
	1    2300 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 607965FB
P 2550 1400
AR Path="/607965FB" Ref="C?"  Part="1" 
AR Path="/60757845/607965FB" Ref="C?"  Part="1" 
F 0 "C?" H 2600 1750 50  0000 R CNN
F 1 "100nF" H 2550 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 1400 50  0001 C CNN
F 3 "~" H 2550 1400 50  0001 C CNN
	1    2550 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 607965F5
P 2800 1400
AR Path="/607965F5" Ref="C?"  Part="1" 
AR Path="/60757845/607965F5" Ref="C?"  Part="1" 
F 0 "C?" H 2850 1750 50  0000 R CNN
F 1 "100nF" H 2850 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2800 1400 50  0001 C CNN
F 3 "~" H 2800 1400 50  0001 C CNN
	1    2800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1300 2800 1250
Connection ~ 2550 1550
Wire Wire Line
	2800 1550 2550 1550
Wire Wire Line
	2800 1500 2800 1550
Wire Wire Line
	2300 1250 2550 1250
Wire Wire Line
	2300 1550 2550 1550
Connection ~ 2300 1550
Connection ~ 2300 1250
Wire Wire Line
	2550 1500 2550 1550
Wire Wire Line
	2550 1250 2800 1250
Connection ~ 2550 1250
Wire Wire Line
	2550 1300 2550 1250
Wire Wire Line
	2300 1300 2300 1250
Wire Wire Line
	2300 1500 2300 1550
Text Notes 2000 950  0    50   ~ 0
Decoupling for each power pin.
Wire Wire Line
	1850 1300 1850 2750
Wire Wire Line
	1850 2750 2450 2750
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 1300 1500
F 0 "SW1" V 1300 1653 50  0000 L CNN
F 1 "momentary_switch" H 1300 1440 50  0001 C CNN
F 2 "" H 1300 1700 50  0001 C CNN
F 3 "" H 1300 1700 50  0001 C CNN
	1    1300 1500
	0    -1   1    0   
$EndComp
Wire Wire Line
	1300 1300 850  1300
Connection ~ 1300 1300
Connection ~ 1850 1300
Connection ~ 1700 1300
Wire Wire Line
	1700 1300 1850 1300
Wire Wire Line
	1300 1300 1450 1300
Wire Wire Line
	1450 1250 1450 1300
Connection ~ 1450 1300
Wire Wire Line
	1450 1300 1700 1300
Text Label 850  1300 0    50   ~ 0
~DFPRESET
Text HLabel 4850 3150 2    50   Output ~ 0
~FPRAM~∕ROM
Wire Wire Line
	3950 3150 4450 3150
Text HLabel 4850 3250 2    50   Output ~ 0
FPCLKEN-IN
Text HLabel 4850 3350 2    50   Output ~ 0
FPµSTEP-IN
Wire Wire Line
	3950 3450 4450 3450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 620F2114
P 2150 2950
AR Path="/620F2114" Ref="RN?"  Part="1" 
AR Path="/60757845/620F2114" Ref="RN?"  Part="1" 
F 0 "RN?" H 2050 3050 50  0000 L CNN
F 1 "30Ω" H 2350 2600 50  0000 C CNN
F 2 "" H 2150 3030 50  0001 C CNN
F 3 "~" V 2150 2950 50  0001 C CNN
	1    2150 2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 620F211A
P 2150 3050
AR Path="/620F211A" Ref="RN?"  Part="2" 
AR Path="/60757845/620F211A" Ref="RN?"  Part="2" 
F 0 "RN?" H 2250 3100 50  0001 L CNN
F 1 "30Ω" H 2125 3156 50  0001 C CNN
F 2 "" H 2150 3130 50  0001 C CNN
F 3 "~" V 2150 3050 50  0001 C CNN
	2    2150 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 620F2120
P 2150 3150
AR Path="/620F2120" Ref="RN?"  Part="3" 
AR Path="/60757845/620F2120" Ref="RN?"  Part="3" 
F 0 "RN?" H 2250 3200 50  0001 L CNN
F 1 "30Ω" H 2125 3256 50  0001 C CNN
F 2 "" H 2150 3230 50  0001 C CNN
F 3 "~" V 2150 3150 50  0001 C CNN
	3    2150 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 620F2126
P 2150 3250
AR Path="/620F2126" Ref="RN?"  Part="4" 
AR Path="/60757845/620F2126" Ref="RN?"  Part="4" 
F 0 "RN?" H 2250 3300 50  0001 L CNN
F 1 "30Ω" H 2125 3356 50  0001 C CNN
F 2 "" H 2150 3330 50  0001 C CNN
F 3 "~" V 2150 3250 50  0001 C CNN
	4    2150 3250
	1    0    0    1   
$EndComp
Wire Wire Line
	4700 3150 4850 3150
Wire Wire Line
	4700 3250 4850 3250
Wire Wire Line
	4700 3350 4850 3350
Wire Wire Line
	4700 3450 4850 3450
Text HLabel 4850 3450 2    50   Output ~ 0
BUSCP
Wire Wire Line
	3950 3250 4450 3250
Wire Wire Line
	3950 3350 4450 3350
Text Label 4050 3150 0    50   ~ 0
~µCRAM
Text Label 4050 3250 0    50   ~ 0
µCCLKEN
Text Label 4050 3350 0    50   ~ 0
µUCSTEP
Text Label 4050 3450 0    50   ~ 0
µCBUSCP
Wire Wire Line
	3950 3650 4850 3650
Wire Wire Line
	3950 3750 4850 3750
Wire Wire Line
	3950 3850 4850 3850
Wire Wire Line
	3950 3950 4850 3950
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 4600 4050
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN?"  Part="1" 
F 0 "RN?" H 4700 3650 50  0000 L CNN
F 1 "30Ω" H 4350 3700 50  0000 C CNN
F 2 "" H 4600 4130 50  0001 C CNN
F 3 "~" V 4600 4050 50  0001 C CNN
	1    4600 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 4600 4150
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN?"  Part="2" 
F 0 "RN?" H 4700 4200 50  0001 L CNN
F 1 "30Ω" H 4575 4256 50  0001 C CNN
F 2 "" H 4600 4230 50  0001 C CNN
F 3 "~" V 4600 4150 50  0001 C CNN
	2    4600 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 4600 4250
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN?"  Part="3" 
F 0 "RN?" H 4700 4300 50  0001 L CNN
F 1 "30Ω" H 4575 4356 50  0001 C CNN
F 2 "" H 4600 4330 50  0001 C CNN
F 3 "~" V 4600 4250 50  0001 C CNN
	3    4600 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 4600 4350
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN?"  Part="4" 
F 0 "RN?" H 4700 4400 50  0001 L CNN
F 1 "30Ω" H 4575 4456 50  0001 C CNN
F 2 "" H 4600 4430 50  0001 C CNN
F 3 "~" V 4600 4350 50  0001 C CNN
	4    4600 4350
	1    0    0    1   
$EndComp
Wire Wire Line
	3950 4050 4450 4050
Wire Wire Line
	3950 4150 4450 4150
Wire Wire Line
	3950 4250 4450 4250
Wire Wire Line
	3950 4350 4450 4350
Wire Wire Line
	4700 4050 4850 4050
Wire Wire Line
	4700 4150 4850 4150
Wire Wire Line
	4700 4250 4850 4250
Wire Wire Line
	4700 4350 4850 4350
Text HLabel 4850 4050 2    50   3State ~ 0
~MEM
Text HLabel 4850 4150 2    50   3State ~ 0
~IO
Text HLabel 4850 4250 2    50   3State ~ 0
~R
Text HLabel 4850 4350 2    50   3State ~ 0
~W
Text HLabel 4850 3650 2    50   Output ~ 0
CLRWS
Text HLabel 4850 3750 2    50   Output ~ 0
~IBOE
Text HLabel 4850 3850 2    50   Output ~ 0
~ABOE
Text HLabel 4850 3950 2    50   Output ~ 0
~DBOE
Text HLabel 4850 4550 2    50   Input ~ 0
~IOINT
Wire Wire Line
	3950 4550 4850 4550
Text HLabel 4850 4650 2    50   Output ~ 0
~WAIT
Wire Wire Line
	3950 4650 4850 4650
Wire Wire Line
	3950 4750 4000 4750
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 4100 4750
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R?"  Part="1" 
F 0 "R?" V 4150 4600 50  0000 C CNN
F 1 "30Ω" V 4150 4400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 4750 50  0001 C CNN
F 3 "~" H 4100 4750 50  0001 C CNN
	1    4100 4750
	0    -1   -1   0   
$EndComp
Text HLabel 4850 4750 2    50   Output ~ 0
~LTSON
Wire Wire Line
	4200 4750 4850 4750
Wire Wire Line
	3950 4950 4850 4950
Text HLabel 4850 4950 2    50   Output ~ 0
~PANELEN
Wire Wire Line
	3950 5050 4850 5050
Text HLabel 4850 5150 2    50   Output ~ 0
STEP∕~RUN
Wire Wire Line
	3950 5150 4850 5150
Text HLabel 4850 5250 2    50   Output ~ 0
~µSTEP
Wire Wire Line
	3950 5250 4850 5250
Text Notes 2600 7550 0    50   ~ 0
The wired AND gate disables\nthe transmitter during µCU\nprogramming.
Text Notes 4600 7200 0    50   ~ 0
~CTS
Text Notes 4600 7300 0    50   ~ 0
GND
Text Notes 4600 7100 0    50   ~ 0
Vcc
Text Notes 4600 7000 0    50   ~ 0
TXD
Text Notes 4600 6900 0    50   ~ 0
RXD
Text Notes 4600 6800 0    50   ~ 0
~RTS
NoConn ~ 4300 7100
NoConn ~ 4300 6800
NoConn ~ 4300 7200
$Comp
L power:GND #PWR?
U 1 1 61A98322
P 4300 7300
AR Path="/61A98322" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A98322" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 7050 50  0001 C CNN
F 1 "GND" H 4305 7127 50  0000 C CNN
F 2 "" H 4300 7300 50  0001 C CNN
F 3 "" H 4300 7300 50  0001 C CNN
	1    4300 7300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 7000 4150 7000
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 61A9831B
P 4500 7100
AR Path="/61A9831B" Ref="J?"  Part="1" 
AR Path="/60757845/61A9831B" Ref="J?"  Part="1" 
F 0 "J?" H 4418 6667 50  0000 C CNN
F 1 "Conn_01x06" H 4580 7001 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 4500 7100 50  0001 C CNN
F 3 "~" H 4500 7100 50  0001 C CNN
	1    4500 7100
	1    0    0    1   
$EndComp
$Comp
L alexios:SolderJumper_3_Bridged12 JP?
U 1 1 62B114C6
P 3750 6900
F 0 "JP?" V 3500 6900 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 3750 7010 50  0001 C CNN
F 2 "" H 3750 6900 50  0001 C CNN
F 3 "~" H 3750 6900 50  0001 C CNN
	1    3750 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 6900 3650 6900
Wire Wire Line
	3750 6750 3750 6700
Wire Wire Line
	3750 6700 4000 6700
Wire Wire Line
	4150 6700 4150 6900
Wire Wire Line
	4150 6900 4300 6900
Wire Wire Line
	4000 6750 4000 6700
Connection ~ 4000 6700
Wire Wire Line
	4000 6700 4150 6700
Wire Wire Line
	3750 7050 3750 7100
Wire Wire Line
	3750 7100 4000 7100
Wire Wire Line
	4150 7100 4150 7000
Wire Wire Line
	4000 7050 4000 7100
Connection ~ 4000 7100
Wire Wire Line
	4000 7100 4150 7100
$Comp
L alexios:SolderJumper_3_Bridged23 JP?
U 1 1 62B45C36
P 4000 6900
F 0 "JP?" V 3750 6900 50  0000 C CNN
F 1 "SolderJumper_3_Bridged23" H 4000 7010 50  0001 C CNN
F 2 "" H 4000 6900 50  0001 C CNN
F 3 "~" H 4000 6900 50  0001 C CNN
	1    4000 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 6900 3850 6900
Wire Wire Line
	3850 6900 3850 7200
Wire Wire Line
	3850 7200 2600 7200
Text Label 2600 7200 0    50   ~ 0
RXD
$Comp
L Device:D_Schottky_ALT D?
U 1 1 61A98383
P 3100 6800
AR Path="/61A98383" Ref="D?"  Part="1" 
AR Path="/60757845/61A98383" Ref="D?"  Part="1" 
F 0 "D?" H 3100 7017 50  0000 C CNN
F 1 "?" H 3100 6926 50  0000 C CNN
F 2 "" H 3100 6800 50  0001 C CNN
F 3 "~" H 3100 6800 50  0001 C CNN
	1    3100 6800
	1    0    0    -1  
$EndComp
Text Notes 3700 6550 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
Wire Wire Line
	2750 5500 2750 5650
Entry Bus Bus
	1500 2650 1600 2750
Wire Bus Line
	1500 2650 1100 2650
Text HLabel 1100 2650 0    50   Output ~ 0
SWA[0..3]
Entry Wire Line
	1600 3150 1700 3250
Entry Wire Line
	1600 3050 1700 3150
Entry Wire Line
	1600 2950 1700 3050
Entry Wire Line
	1700 2950 1600 2850
Wire Wire Line
	1700 2950 2000 2950
Wire Wire Line
	1700 3050 2000 3050
Wire Wire Line
	1700 3150 2000 3150
Wire Wire Line
	1700 3250 2000 3250
Wire Wire Line
	2250 2950 2450 2950
Wire Wire Line
	2250 3050 2450 3050
Wire Wire Line
	2250 3150 2450 3150
Wire Wire Line
	2250 3250 2450 3250
Entry Bus Bus
	1500 3950 1600 3850
Wire Bus Line
	1500 3950 1100 3950
Text HLabel 1100 3950 0    50   Output ~ 0
SWD[0..3]
Wire Wire Line
	2450 3350 1700 3350
Wire Wire Line
	2450 3450 1700 3450
Wire Wire Line
	2450 3550 1700 3550
Wire Wire Line
	2450 3650 1700 3650
Wire Wire Line
	1100 4350 2450 4350
Text HLabel 1100 4350 0    50   Output ~ 0
~CVOE
Wire Wire Line
	2300 4450 2450 4450
Wire Wire Line
	2300 4550 2450 4550
Wire Wire Line
	1100 4450 2050 4450
Wire Wire Line
	1100 4550 2050 4550
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63C465B1
P 4600 3150
AR Path="/63C465B1" Ref="RN?"  Part="1" 
AR Path="/60757845/63C465B1" Ref="RN?"  Part="1" 
F 0 "RN?" H 4650 3250 50  0000 L CNN
F 1 "30Ω" H 4350 2800 50  0000 C CNN
F 2 "" H 4600 3230 50  0001 C CNN
F 3 "~" V 4600 3150 50  0001 C CNN
	1    4600 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63C465B7
P 4600 3250
AR Path="/63C465B7" Ref="RN?"  Part="2" 
AR Path="/60757845/63C465B7" Ref="RN?"  Part="2" 
F 0 "RN?" H 4700 3300 50  0001 L CNN
F 1 "30Ω" H 4575 3356 50  0001 C CNN
F 2 "" H 4600 3330 50  0001 C CNN
F 3 "~" V 4600 3250 50  0001 C CNN
	2    4600 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63C465BD
P 4600 3350
AR Path="/63C465BD" Ref="RN?"  Part="3" 
AR Path="/60757845/63C465BD" Ref="RN?"  Part="3" 
F 0 "RN?" H 4700 3400 50  0001 L CNN
F 1 "30Ω" H 4575 3456 50  0001 C CNN
F 2 "" H 4600 3430 50  0001 C CNN
F 3 "~" V 4600 3350 50  0001 C CNN
	3    4600 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63C465C3
P 4600 3450
AR Path="/63C465C3" Ref="RN?"  Part="4" 
AR Path="/60757845/63C465C3" Ref="RN?"  Part="4" 
F 0 "RN?" H 4700 3500 50  0001 L CNN
F 1 "30Ω" H 4575 3556 50  0001 C CNN
F 2 "" H 4600 3530 50  0001 C CNN
F 3 "~" V 4600 3450 50  0001 C CNN
	4    4600 3450
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 63C79DDA
P 2200 2450
AR Path="/63C79DDA" Ref="R?"  Part="1" 
AR Path="/60757845/63C79DDA" Ref="R?"  Part="1" 
F 0 "R?" V 2250 2650 50  0000 C CNN
F 1 "30Ω" V 2150 2650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 2450 50  0001 C CNN
F 3 "~" H 2200 2450 50  0001 C CNN
	1    2200 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 2450 2450 2450
Wire Wire Line
	1100 2450 2100 2450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63D14E09
P 1800 4050
AR Path="/63D14E09" Ref="RN?"  Part="1" 
AR Path="/60757845/63D14E09" Ref="RN?"  Part="1" 
F 0 "RN?" H 1775 4247 50  0000 C CNN
F 1 "30Ω" H 1775 4156 50  0000 C CNN
F 2 "" H 1800 4130 50  0001 C CNN
F 3 "~" V 1800 4050 50  0001 C CNN
	1    1800 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63D14E15
P 2200 4450
AR Path="/63D14E15" Ref="RN?"  Part="3" 
AR Path="/60757845/63D14E15" Ref="RN?"  Part="3" 
F 0 "RN?" H 2300 4500 50  0001 L CNN
F 1 "30Ω" H 2175 4556 50  0001 C CNN
F 2 "" H 2200 4530 50  0001 C CNN
F 3 "~" V 2200 4450 50  0001 C CNN
	3    2200 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63D14E1B
P 2200 4550
AR Path="/63D14E1B" Ref="RN?"  Part="4" 
AR Path="/60757845/63D14E1B" Ref="RN?"  Part="4" 
F 0 "RN?" H 2300 4600 50  0001 L CNN
F 1 "30Ω" H 2175 4656 50  0001 C CNN
F 2 "" H 2200 4630 50  0001 C CNN
F 3 "~" V 2200 4550 50  0001 C CNN
	4    2200 4550
	1    0    0    1   
$EndComp
Text HLabel 1100 4050 0    50   Output ~ 0
~FPIRQ
Wire Wire Line
	1900 4050 2450 4050
Wire Wire Line
	1100 4050 1650 4050
Wire Wire Line
	2300 4650 2350 4650
NoConn ~ 2350 4650
Wire Wire Line
	2050 4650 2000 4650
NoConn ~ 2000 4650
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63D14E0F
P 2200 4650
AR Path="/63D14E0F" Ref="RN?"  Part="2" 
AR Path="/60757845/63D14E0F" Ref="RN?"  Part="2" 
F 0 "RN?" H 1700 4650 50  0000 L CNN
F 1 "30Ω" H 2200 4550 50  0000 C CNN
F 2 "" H 2200 4730 50  0001 C CNN
F 3 "~" V 2200 4650 50  0001 C CNN
	2    2200 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60796633
P 4800 2000
AR Path="/60796633" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796633" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4800 1850 50  0001 C CNN
F 1 "+5V" H 4815 2173 50  0000 C CNN
F 2 "" H 4800 2000 50  0001 C CNN
F 3 "" H 4800 2000 50  0001 C CNN
	1    4800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2000 5050 2000
Connection ~ 4800 2000
Connection ~ 5300 2300
Wire Wire Line
	5300 2300 5300 2350
Wire Wire Line
	4800 2300 5050 2300
Wire Wire Line
	5050 2300 5300 2300
Connection ~ 5050 2300
Wire Wire Line
	5050 2000 5300 2000
Connection ~ 5050 2000
Wire Wire Line
	5300 2000 5300 2050
Wire Wire Line
	5300 2300 5300 2250
$Comp
L Device:C_Small C?
U 1 1 60796664
P 5300 2150
AR Path="/60796664" Ref="C?"  Part="1" 
AR Path="/60757845/60796664" Ref="C?"  Part="1" 
F 0 "C?" H 5300 2500 50  0000 C CNN
F 1 "100nF" H 5350 2400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 2150 50  0001 C CNN
F 3 "~" H 5300 2150 50  0001 C CNN
	1    5300 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6079662D
P 5050 2150
AR Path="/6079662D" Ref="C?"  Part="1" 
AR Path="/60757845/6079662D" Ref="C?"  Part="1" 
F 0 "C?" H 5050 2500 50  0000 C CNN
F 1 "100nF" H 5050 2400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 2150 50  0001 C CNN
F 3 "~" H 5050 2150 50  0001 C CNN
	1    5050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2050 4800 2000
Wire Wire Line
	4800 2250 4800 2300
$Comp
L Device:C_Small C?
U 1 1 60796625
P 4800 2150
AR Path="/60796625" Ref="C?"  Part="1" 
AR Path="/60757845/60796625" Ref="C?"  Part="1" 
F 0 "C?" H 4709 2196 50  0000 R CNN
F 1 "1µF" H 4709 2105 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4800 2150 50  0001 C CNN
F 3 "~" H 4800 2150 50  0001 C CNN
	1    4800 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6079661D
P 5300 2350
AR Path="/6079661D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079661D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5300 2100 50  0001 C CNN
F 1 "GND" H 5305 2177 50  0000 C CNN
F 2 "" H 5300 2350 50  0001 C CNN
F 3 "" H 5300 2350 50  0001 C CNN
	1    5300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2050 5050 2000
Wire Wire Line
	5050 2250 5050 2300
$Comp
L alexios:74AC573 U?
U 2 1 6403DE58
P 8000 1300
AR Path="/6403DE58" Ref="U?"  Part="1" 
AR Path="/60757845/6403DE58" Ref="U2"  Part="2" 
F 0 "U2" H 8030 1746 50  0000 L CNN
F 1 "74AC573" H 8030 1655 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 8000 1300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT573.pdf" H 8000 1300 50  0001 C CNN
F 4 "Yes" H 2700 -450 50  0001 C CNN "Verified"
	2    8000 1300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 2 1 6403E919
P 9150 1250
AR Path="/6403E919" Ref="U?"  Part="1" 
AR Path="/6233F88C/6403E919" Ref="U?"  Part="1" 
AR Path="/60757845/6403E919" Ref="U3"  Part="2" 
F 0 "U3" H 9330 1646 50  0000 L CNN
F 1 "74HC590" H 9330 1555 50  0000 L CNN
F 2 "alexios:SOIC-16" H 9450 1600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 9450 1600 50  0001 C CNN
	2    9150 1250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC245 U4
U 2 1 6403F195
P 10500 1300
F 0 "U4" H 10680 1746 50  0000 L CNN
F 1 "74HC245" H 10680 1655 50  0000 L CNN
F 2 "" H 10500 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 10500 1350 50  0001 C CNN
	2    10500 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64073B3C
P 7500 1000
AR Path="/64073B3C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B3C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 750 50  0001 C CNN
F 1 "GND" H 7505 827 50  0000 C CNN
F 2 "" H 7500 1000 50  0001 C CNN
F 3 "" H 7500 1000 50  0001 C CNN
	1    7500 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64073B42
P 7500 800
AR Path="/64073B42" Ref="#PWR?"  Part="1" 
AR Path="/60757845/64073B42" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 650 50  0001 C CNN
F 1 "+5V" H 7515 973 50  0000 C CNN
F 2 "" H 7500 800 50  0001 C CNN
F 3 "" H 7500 800 50  0001 C CNN
	1    7500 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 64073B48
P 7500 900
AR Path="/64073B48" Ref="C?"  Part="1" 
AR Path="/60757845/64073B48" Ref="C?"  Part="1" 
F 0 "C?" H 7409 946 50  0000 R CNN
F 1 "100nF" H 7409 855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7500 900 50  0001 C CNN
F 3 "~" H 7500 900 50  0001 C CNN
	1    7500 900 
	1    0    0    -1  
$EndComp
Connection ~ 7500 800 
Connection ~ 7500 1000
$Comp
L power:GND #PWR?
U 1 1 641091B9
P 8800 1000
AR Path="/641091B9" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091B9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8800 750 50  0001 C CNN
F 1 "GND" H 8805 827 50  0000 C CNN
F 2 "" H 8800 1000 50  0001 C CNN
F 3 "" H 8800 1000 50  0001 C CNN
	1    8800 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 641091BF
P 8800 800
AR Path="/641091BF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/641091BF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8800 650 50  0001 C CNN
F 1 "+5V" H 8815 973 50  0000 C CNN
F 2 "" H 8800 800 50  0001 C CNN
F 3 "" H 8800 800 50  0001 C CNN
	1    8800 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 641091C5
P 8800 900
AR Path="/641091C5" Ref="C?"  Part="1" 
AR Path="/60757845/641091C5" Ref="C?"  Part="1" 
F 0 "C?" H 8709 946 50  0000 R CNN
F 1 "100nF" H 8709 855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8800 900 50  0001 C CNN
F 3 "~" H 8800 900 50  0001 C CNN
	1    8800 900 
	1    0    0    -1  
$EndComp
Connection ~ 8800 800 
Connection ~ 8800 1000
$Comp
L power:GND #PWR?
U 1 1 6416E280
P 10150 1000
AR Path="/6416E280" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E280" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 750 50  0001 C CNN
F 1 "GND" H 10155 827 50  0000 C CNN
F 2 "" H 10150 1000 50  0001 C CNN
F 3 "" H 10150 1000 50  0001 C CNN
	1    10150 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6416E286
P 10150 800
AR Path="/6416E286" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6416E286" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10150 650 50  0001 C CNN
F 1 "+5V" H 10165 973 50  0000 C CNN
F 2 "" H 10150 800 50  0001 C CNN
F 3 "" H 10150 800 50  0001 C CNN
	1    10150 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6416E28C
P 10150 900
AR Path="/6416E28C" Ref="C?"  Part="1" 
AR Path="/60757845/6416E28C" Ref="C?"  Part="1" 
F 0 "C?" H 10059 946 50  0000 R CNN
F 1 "100nF" H 10059 855 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 900 50  0001 C CNN
F 3 "~" H 10150 900 50  0001 C CNN
	1    10150 900 
	1    0    0    -1  
$EndComp
Connection ~ 10150 1000
Connection ~ 10150 800 
Text Label 4550 5050 2    50   ~ 0
~LED-STOP
Text HLabel 4850 5050 2    50   Output ~ 0
~LED-STOP
Wire Wire Line
	1100 4150 2450 4150
Wire Wire Line
	1100 4250 2450 4250
Text HLabel 1100 4150 0    50   Output ~ 0
MFD0
Text HLabel 1100 4250 0    50   Output ~ 0
MFD1
Text Label 1250 4550 0    50   ~ 0
~FPRSTHOLD
Text HLabel 1100 4550 0    50   Output ~ 0
~FPRSTHOLD
Text Label 1250 4450 0    50   ~ 0
~FPRESET
Text HLabel 1100 4450 0    50   Output ~ 0
~FPRESET
$Comp
L power:GND #PWR?
U 1 1 61A9833F
P 1700 1750
AR Path="/61A9833F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9833F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1700 1500 50  0001 C CNN
F 1 "GND" H 1705 1577 50  0000 C CNN
F 2 "" H 1700 1750 50  0001 C CNN
F 3 "" H 1700 1750 50  0001 C CNN
	1    1700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1700 1700 1750
Wire Wire Line
	1300 1700 1700 1700
Connection ~ 1700 1700
Wire Wire Line
	1700 1550 1700 1700
Wire Wire Line
	1450 950  1850 950 
Wire Wire Line
	1850 950  1850 1000
Connection ~ 1850 950 
Text HLabel 1100 2150 0    50   Output ~ 0
~WR
Text HLabel 1100 2250 0    50   Output ~ 0
~RD
Wire Bus Line
	1600 2750 1600 3150
Wire Bus Line
	1600 3450 1600 3850
Wire Bus Line
	8700 3550 8700 4350
Wire Bus Line
	10100 3200 10100 4050
Wire Bus Line
	10100 1600 10100 2450
Wire Bus Line
	7700 1600 7700 2450
Wire Bus Line
	5600 1600 5600 2450
Wire Bus Line
	4500 1600 4500 2450
Wire Bus Line
	7600 1950 7600 4350
$EndSCHEMATC
