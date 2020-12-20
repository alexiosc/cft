EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 17
Title "Microcontroller and DFP Bus"
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
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
	2400 2350 1900 2350
Wire Wire Line
	2900 1250 3100 1250
Wire Wire Line
	3100 1250 3300 1250
Connection ~ 3100 1250
$Comp
L power:+5V #PWR?
U 1 1 6079614B
P 3300 1150
AR Path="/6079614B" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079614B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3300 1000 50  0001 C CNN
F 1 "+5V" H 3315 1323 50  0000 C CNN
F 2 "" H 3300 1150 50  0001 C CNN
F 3 "" H 3300 1150 50  0001 C CNN
	1    3300 1150
	1    0    0    -1  
$EndComp
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
	2400 2150 1050 2150
Wire Wire Line
	2400 2250 1050 2250
Text Label 1200 2150 0    50   ~ 0
~WR
Text Label 1200 2250 0    50   ~ 0
~RD
Text Label 1900 2350 0    50   ~ 0
ALE
Text Label 4500 4850 2    50   ~ 0
~SCANEN
$Comp
L alexios:74LVC1G04 U?
U 1 1 607961F4
P 5600 3150
AR Path="/607961F4" Ref="U?"  Part="1" 
AR Path="/60757845/607961F4" Ref="U?"  Part="1" 
F 0 "U?" V 5750 3250 50  0000 L CNN
F 1 "74LVC1G14" V 5650 3250 50  0000 L CNN
F 2 "" H 5600 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5600 3150 50  0001 C CNN
	1    5600 3150
	0    1    -1   0   
$EndComp
Text Label 2150 7000 2    50   ~ 0
MISO
Text Label 2150 7200 2    50   ~ 0
SCK
Text Label 2150 7300 2    50   ~ 0
~DFPRESET
Text Label 1900 2750 0    50   ~ 0
~µCRESET
Text Label 2150 7100 2    50   ~ 0
MOSI
Wire Wire Line
	3900 2850 4400 2850
Text Label 4400 2850 2    50   ~ 0
SCK
Text Label 4600 3650 2    50   ~ 0
CLRWS
Text Label 4250 4250 2    50   ~ 0
~µCR
Text Label 4250 4350 2    50   ~ 0
~µCW
Wire Wire Line
	2400 3850 1900 3850
Text Label 1900 3850 0    50   ~ 0
RXD
Text Label 1200 4050 0    50   ~ 0
~FPIRQ
Wire Wire Line
	3900 2750 4400 2750
Text Label 4400 2750 2    50   ~ 0
~CLR
Text Label 1700 2950 0    50   ~ 0
SWA0
Text Label 1700 3050 0    50   ~ 0
SWA1
Text Label 1700 3150 0    50   ~ 0
SWA2
Text Label 1700 3250 0    50   ~ 0
SWA3
Text Label 1700 3350 0    50   ~ 0
SWD0
Text Label 1700 3450 0    50   ~ 0
SWD1
Text Label 1700 3550 0    50   ~ 0
SWD2
Text Label 1700 3650 0    50   ~ 0
SWD3
Text Label 4500 5150 2    50   ~ 0
STEP∕~RUN
Text Label 4500 5250 2    50   ~ 0
~µSTEP
Text Label 4500 4650 2    50   ~ 0
~WAIT
Text Label 4600 3950 2    50   ~ 0
~DBOE
Text Label 4600 3850 2    50   ~ 0
~ABOE
Text Label 4600 3750 2    50   ~ 0
~IBOE
Text Label 4500 4950 2    50   ~ 0
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
NoConn ~ 3000 5500
Wire Wire Line
	2300 5650 2700 5650
Wire Wire Line
	2300 5500 2350 5500
Text Label 1200 4150 0    50   ~ 0
MFD0
Text Label 1200 4250 0    50   ~ 0
MFD1
Text Label 3950 1850 0    50   ~ 0
MCD0
Text Label 3950 1950 0    50   ~ 0
MCD1
Text Label 3950 2050 0    50   ~ 0
MCD2
Text Label 3950 2150 0    50   ~ 0
MCD3
Text Label 3950 2250 0    50   ~ 0
MCD4
Text Label 3950 2350 0    50   ~ 0
MCD5
Text Label 3950 2450 0    50   ~ 0
MCD6
Text Label 3950 2550 0    50   ~ 0
MCD7
Wire Wire Line
	2900 1250 2900 1600
Wire Wire Line
	3100 1250 3100 1600
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
Text Label 2350 5650 0    50   ~ 0
µCCLK
Text Label 7600 3150 1    50   ~ 0
MCA[0..7]
Entry Wire Line
	1650 3350 1550 3450
Entry Wire Line
	1650 3450 1550 3550
Entry Wire Line
	1650 3550 1550 3650
Entry Wire Line
	1650 3650 1550 3750
Text Label 1550 3100 1    50   ~ 0
SWA[0..3]
Text Label 1550 3850 1    50   ~ 0
SWD[0..3]
Text Notes 5250 5200 0    50   ~ 0
(= ~LED-RUN)
$Comp
L alexios:74HC590 U?
U 1 1 60796422
P 6650 4450
AR Path="/60796422" Ref="U?"  Part="1" 
AR Path="/6233F88C/60796422" Ref="U?"  Part="1" 
AR Path="/60757845/60796422" Ref="U3"  Part="1" 
F 0 "U3" H 6650 5217 50  0000 C CNN
F 1 "74HC590" H 6650 5126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6950 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6950 4800 50  0001 C CNN
	1    6650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3950 7500 3950
Wire Wire Line
	7150 4050 7500 4050
Wire Wire Line
	7150 4150 7500 4150
Text Label 7200 4050 0    50   ~ 0
MCA1
Text Label 7200 4150 0    50   ~ 0
MCA2
Text Label 7200 4250 0    50   ~ 0
MCA3
Text Label 7200 4350 0    50   ~ 0
MCA4
Text Label 5700 4850 0    50   ~ 0
~SCANEN
$Comp
L power:GND #PWR?
U 1 1 60796430
P 6150 3950
AR Path="/60796430" Ref="#PWR?"  Part="1" 
AR Path="/6233F88C/60796430" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796430" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6150 3700 50  0001 C CNN
F 1 "GND" V 6155 3822 50  0000 R CNN
F 2 "" H 6150 3950 50  0001 C CNN
F 3 "" H 6150 3950 50  0001 C CNN
	1    6150 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 4150 6100 4150
Wire Wire Line
	6100 4150 6100 4250
Wire Wire Line
	6100 4250 6150 4250
Text Label 5700 4450 0    50   ~ 0
~SCANCLR
Wire Wire Line
	5700 4450 6150 4450
NoConn ~ 7150 4850
Wire Wire Line
	7150 4350 7500 4350
Wire Wire Line
	7150 4250 7500 4250
Text Label 7200 3950 0    50   ~ 0
MCA0
Wire Wire Line
	5600 4850 6150 4850
Wire Wire Line
	5600 2950 5600 2850
Wire Wire Line
	5600 2850 6150 2850
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
P 3350 5500
AR Path="/607965C8" Ref="#PWR?"  Part="1" 
AR Path="/60757845/607965C8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3350 5250 50  0001 C CNN
F 1 "GND" H 3355 5327 50  0000 C CNN
F 2 "" H 3350 5500 50  0001 C CNN
F 3 "" H 3350 5500 50  0001 C CNN
	1    3350 5500
	1    0    0    -1  
$EndComp
Text Label 1200 2450 0    50   ~ 0
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
NoConn ~ 7150 4650
NoConn ~ 7150 4550
NoConn ~ 7150 4450
Text Label 1900 3950 0    50   ~ 0
TXD
Wire Wire Line
	2400 3950 1900 3950
Wire Wire Line
	3300 1250 3300 1600
Connection ~ 3300 1250
Text Notes 900  3750 0    50   ~ 0
Pulled up\ninternally
Text Label 1200 4350 0    50   ~ 0
~CVOE
Wire Wire Line
	2400 2050 2350 2050
NoConn ~ 2350 2050
NoConn ~ 3900 2950
Text Label 2150 3850 0    50   ~ 0
MOSI
Text Label 2150 3950 0    50   ~ 0
MISO
$Comp
L alexios:ATmega64-16AU U?
U 1 1 607968E0
P 3200 3550
AR Path="/607968E0" Ref="U?"  Part="1" 
AR Path="/60757845/607968E0" Ref="U1"  Part="1" 
F 0 "U1" H 3600 5600 50  0000 C CNN
F 1 "ATmega64-16AU" H 3650 5500 50  0000 C CNN
F 2 "alexios:TQFP-64" H 1225 5225 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2490-8-bit-avr-microcontroller-atmega64-l_datasheet.pdf" H 2950 3550 50  0001 C CNN
F 4 "556-ATMEGA64L-8AU" H 3200 3550 50  0001 C CNN "BOM-Mouser"
F 5 "Yes" H 3200 3550 50  0001 C CNN "Verified"
	1    3200 3550
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
Entry Wire Line
	7600 4250 7500 4350
Entry Wire Line
	7600 4150 7500 4250
Entry Wire Line
	7600 4050 7500 4150
Entry Wire Line
	7600 3950 7500 4050
Entry Wire Line
	7600 3850 7500 3950
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 615F27B0
P 9350 3650
AR Path="/615F27B0" Ref="RN?"  Part="2" 
AR Path="/60757845/615F27B0" Ref="RN?"  Part="2" 
F 0 "RN?" H 9450 3700 50  0001 L CNN
F 1 "30Ω" H 9325 3756 50  0001 C CNN
F 2 "" H 9350 3730 50  0001 C CNN
F 3 "~" V 9350 3650 50  0001 C CNN
	2    9350 3650
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 615F27B6
P 9450 3650
AR Path="/615F27B6" Ref="RN?"  Part="3" 
AR Path="/60757845/615F27B6" Ref="RN?"  Part="3" 
F 0 "RN?" H 9550 3700 50  0001 L CNN
F 1 "30Ω" H 9425 3756 50  0001 C CNN
F 2 "" H 9450 3730 50  0001 C CNN
F 3 "~" V 9450 3650 50  0001 C CNN
	3    9450 3650
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 615F27BC
P 9550 3650
AR Path="/615F27BC" Ref="RN?"  Part="4" 
AR Path="/60757845/615F27BC" Ref="RN?"  Part="4" 
F 0 "RN?" H 9650 3700 50  0001 L CNN
F 1 "30Ω" H 9525 3756 50  0001 C CNN
F 2 "" H 9550 3730 50  0001 C CNN
F 3 "~" V 9550 3650 50  0001 C CNN
	4    9550 3650
	0    1    -1   0   
$EndComp
Text HLabel 1050 2450 0    50   Output ~ 0
~FPHALT
Text Notes 5600 5700 2    100  ~ 20
Control Interface & TTYD
$Comp
L Device:R_Small R?
U 1 1 61A9832D
P 4450 6400
AR Path="/61A9832D" Ref="R?"  Part="1" 
AR Path="/60757845/61A9832D" Ref="R?"  Part="1" 
F 0 "R?" V 4554 6400 50  0000 C CNN
F 1 "30Ω" V 4645 6400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4450 6400 50  0001 C CNN
F 3 "~" H 4450 6400 50  0001 C CNN
	1    4450 6400
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61A98336
P 1650 1450
AR Path="/61A98336" Ref="C?"  Part="1" 
AR Path="/60757845/61A98336" Ref="C?"  Part="1" 
F 0 "C?" H 1559 1496 50  0000 R CNN
F 1 "100nF" H 1559 1405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 1450 50  0001 C CNN
F 3 "~" H 1650 1450 50  0001 C CNN
	1    1650 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1300 1650 1350
$Comp
L Device:R_Small R?
U 1 1 61A98345
P 1800 1100
AR Path="/61A98345" Ref="R?"  Part="1" 
AR Path="/60757845/61A98345" Ref="R?"  Part="1" 
F 0 "R?" H 1858 1054 50  0000 L CNN
F 1 "4.7kΩ" H 1858 1145 50  0000 L CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1800 1100 50  0001 C CNN
F 3 "~" H 1800 1100 50  0001 C CNN
	1    1800 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 1200 1800 1300
$Comp
L power:+5V #PWR?
U 1 1 61A9834E
P 1800 950
AR Path="/61A9834E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9834E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1800 800 50  0001 C CNN
F 1 "+5V" H 1815 1123 50  0000 C CNN
F 2 "" H 1800 950 50  0001 C CNN
F 3 "" H 1800 950 50  0001 C CNN
	1    1800 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:D_ALT D?
U 1 1 61A98354
P 1400 1100
AR Path="/61A98354" Ref="D?"  Part="1" 
AR Path="/60757845/61A98354" Ref="D?"  Part="1" 
F 0 "D?" V 1354 1020 50  0000 R CNN
F 1 "D_ALT" V 1445 1020 50  0000 R CNN
F 2 "" H 1400 1100 50  0001 C CNN
F 3 "~" H 1400 1100 50  0001 C CNN
	1    1400 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 6300 3550 6300
Wire Wire Line
	3900 6500 3550 6500
Text Label 3550 6300 0    50   ~ 0
~uCRESET
Text Label 3550 6500 0    50   ~ 0
TXD
$Comp
L Device:R_Small R?
U 1 1 61A98368
P 4300 6150
AR Path="/61A98368" Ref="R?"  Part="1" 
AR Path="/60757845/61A98368" Ref="R?"  Part="1" 
F 0 "R?" H 4241 6104 50  0000 R CNN
F 1 "10kΩ" H 4241 6195 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 6150 50  0001 C CNN
F 3 "~" H 4300 6150 50  0001 C CNN
	1    4300 6150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A9836E
P 4300 6050
AR Path="/61A9836E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9836E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 5900 50  0001 C CNN
F 1 "+5V" H 4315 6223 50  0000 C CNN
F 2 "" H 4300 6050 50  0001 C CNN
F 3 "" H 4300 6050 50  0001 C CNN
	1    4300 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6300 4300 6300
Wire Wire Line
	4300 6300 4300 6400
Wire Wire Line
	4300 6500 4200 6500
Wire Wire Line
	4300 6250 4300 6300
Connection ~ 4300 6300
Wire Wire Line
	4300 6400 4350 6400
Connection ~ 4300 6400
Wire Wire Line
	4300 6400 4300 6500
$Comp
L Device:D_Schottky_ALT D?
U 1 1 61A98389
P 4050 6500
AR Path="/61A98389" Ref="D?"  Part="1" 
AR Path="/60757845/61A98389" Ref="D?"  Part="1" 
F 0 "D?" H 3950 6600 50  0000 R CNN
F 1 "?" H 4150 6400 50  0000 C CNN
F 2 "" H 4050 6500 50  0001 C CNN
F 3 "~" H 4050 6500 50  0001 C CNN
	1    4050 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1150 3300 1250
Connection ~ 2900 1250
Connection ~ 2750 1250
Wire Wire Line
	2750 1250 2900 1250
Wire Wire Line
	2000 1300 2000 1250
Wire Wire Line
	2000 1500 2000 1550
$Comp
L Device:C_Small C?
U 1 1 60796610
P 2000 1400
AR Path="/60796610" Ref="C?"  Part="1" 
AR Path="/60757845/60796610" Ref="C?"  Part="1" 
F 0 "C?" H 2050 1750 50  0000 R CNN
F 1 "1µF" H 2000 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 1400 50  0001 C CNN
F 3 "~" H 2000 1400 50  0001 C CNN
	1    2000 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1250 2250 1250
Wire Wire Line
	2000 1550 2250 1550
$Comp
L power:GND #PWR?
U 1 1 60796608
P 2000 1550
AR Path="/60796608" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796608" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2000 1300 50  0001 C CNN
F 1 "GND" H 2000 1350 50  0000 C CNN
F 2 "" H 2000 1550 50  0001 C CNN
F 3 "" H 2000 1550 50  0001 C CNN
	1    2000 1550
	1    0    0    -1  
$EndComp
Connection ~ 2000 1550
$Comp
L Device:C_Small C?
U 1 1 60796601
P 2250 1400
AR Path="/60796601" Ref="C?"  Part="1" 
AR Path="/60757845/60796601" Ref="C?"  Part="1" 
F 0 "C?" H 2300 1750 50  0000 R CNN
F 1 "1µF" H 2250 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2250 1400 50  0001 C CNN
F 3 "~" H 2250 1400 50  0001 C CNN
	1    2250 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 607965FB
P 2500 1400
AR Path="/607965FB" Ref="C?"  Part="1" 
AR Path="/60757845/607965FB" Ref="C?"  Part="1" 
F 0 "C?" H 2550 1750 50  0000 R CNN
F 1 "100nF" H 2500 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2500 1400 50  0001 C CNN
F 3 "~" H 2500 1400 50  0001 C CNN
	1    2500 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 607965F5
P 2750 1400
AR Path="/607965F5" Ref="C?"  Part="1" 
AR Path="/60757845/607965F5" Ref="C?"  Part="1" 
F 0 "C?" H 2800 1750 50  0000 R CNN
F 1 "100nF" H 2800 1650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 1400 50  0001 C CNN
F 3 "~" H 2750 1400 50  0001 C CNN
	1    2750 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1300 2750 1250
Connection ~ 2500 1550
Wire Wire Line
	2750 1550 2500 1550
Wire Wire Line
	2750 1500 2750 1550
Wire Wire Line
	2250 1250 2500 1250
Wire Wire Line
	2250 1550 2500 1550
Connection ~ 2250 1550
Connection ~ 2250 1250
Wire Wire Line
	2500 1500 2500 1550
Wire Wire Line
	2500 1250 2750 1250
Connection ~ 2500 1250
Wire Wire Line
	2500 1300 2500 1250
Wire Wire Line
	2250 1300 2250 1250
Wire Wire Line
	2250 1500 2250 1550
Text Notes 1950 950  0    50   ~ 0
Decoupling for each power pin.
Wire Wire Line
	1800 1300 1800 2750
Wire Wire Line
	1800 2750 2400 2750
$Comp
L alexios:momentary_switch SW1
U 1 1 61CAFDFF
P 1250 1500
F 0 "SW1" V 1250 1653 50  0000 L CNN
F 1 "momentary_switch" H 1250 1440 50  0001 C CNN
F 2 "" H 1250 1700 50  0001 C CNN
F 3 "" H 1250 1700 50  0001 C CNN
	1    1250 1500
	0    -1   1    0   
$EndComp
Wire Wire Line
	1250 1300 800  1300
Connection ~ 1250 1300
Connection ~ 1800 1300
Connection ~ 1650 1300
Wire Wire Line
	1650 1300 1800 1300
Wire Wire Line
	1250 1300 1400 1300
Wire Wire Line
	1400 1250 1400 1300
Connection ~ 1400 1300
Wire Wire Line
	1400 1300 1650 1300
Text Label 800  1300 0    50   ~ 0
~DFPRESET
Text HLabel 4700 3150 2    50   Output ~ 0
~FPRAM~∕ROM
Wire Wire Line
	3900 3150 4400 3150
Text HLabel 4700 3250 2    50   Output ~ 0
FPCLKEN-IN
Text HLabel 4700 3350 2    50   Output ~ 0
FPµSTEP-IN
Wire Wire Line
	3900 3450 4400 3450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 620F2114
P 2100 2950
AR Path="/620F2114" Ref="RN?"  Part="1" 
AR Path="/60757845/620F2114" Ref="RN?"  Part="1" 
F 0 "RN?" H 2000 3050 50  0000 L CNN
F 1 "30Ω" H 2300 2600 50  0000 C CNN
F 2 "" H 2100 3030 50  0001 C CNN
F 3 "~" V 2100 2950 50  0001 C CNN
	1    2100 2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 620F211A
P 2100 3050
AR Path="/620F211A" Ref="RN?"  Part="2" 
AR Path="/60757845/620F211A" Ref="RN?"  Part="2" 
F 0 "RN?" H 2200 3100 50  0001 L CNN
F 1 "30Ω" H 2075 3156 50  0001 C CNN
F 2 "" H 2100 3130 50  0001 C CNN
F 3 "~" V 2100 3050 50  0001 C CNN
	2    2100 3050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 620F2120
P 2100 3150
AR Path="/620F2120" Ref="RN?"  Part="3" 
AR Path="/60757845/620F2120" Ref="RN?"  Part="3" 
F 0 "RN?" H 2200 3200 50  0001 L CNN
F 1 "30Ω" H 2075 3256 50  0001 C CNN
F 2 "" H 2100 3230 50  0001 C CNN
F 3 "~" V 2100 3150 50  0001 C CNN
	3    2100 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 620F2126
P 2100 3250
AR Path="/620F2126" Ref="RN?"  Part="4" 
AR Path="/60757845/620F2126" Ref="RN?"  Part="4" 
F 0 "RN?" H 2200 3300 50  0001 L CNN
F 1 "30Ω" H 2075 3356 50  0001 C CNN
F 2 "" H 2100 3330 50  0001 C CNN
F 3 "~" V 2100 3250 50  0001 C CNN
	4    2100 3250
	1    0    0    1   
$EndComp
Wire Wire Line
	4650 3150 4700 3150
Wire Wire Line
	4650 3250 4700 3250
Wire Wire Line
	4650 3350 4700 3350
Wire Wire Line
	4650 3450 4700 3450
Text HLabel 4700 3450 2    50   Output ~ 0
BUSCP
Wire Wire Line
	3900 3250 4400 3250
Wire Wire Line
	3900 3350 4400 3350
Text Label 4000 3250 0    50   ~ 0
µCCLKEN
Text Label 4000 3350 0    50   ~ 0
µUCSTEP
Text Label 4000 3450 0    50   ~ 0
µCBUSCP
Wire Wire Line
	3900 3650 4700 3650
Wire Wire Line
	3900 3750 4700 3750
Wire Wire Line
	3900 3850 4700 3850
Wire Wire Line
	3900 3950 4700 3950
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 623E1F1D
P 4550 4050
AR Path="/623E1F1D" Ref="RN?"  Part="1" 
AR Path="/60757845/623E1F1D" Ref="RN?"  Part="1" 
F 0 "RN?" H 4650 3650 50  0000 L CNN
F 1 "30Ω" H 4300 3700 50  0000 C CNN
F 2 "" H 4550 4130 50  0001 C CNN
F 3 "~" V 4550 4050 50  0001 C CNN
	1    4550 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 623E1F23
P 4550 4150
AR Path="/623E1F23" Ref="RN?"  Part="2" 
AR Path="/60757845/623E1F23" Ref="RN?"  Part="2" 
F 0 "RN?" H 4650 4200 50  0001 L CNN
F 1 "30Ω" H 4525 4256 50  0001 C CNN
F 2 "" H 4550 4230 50  0001 C CNN
F 3 "~" V 4550 4150 50  0001 C CNN
	2    4550 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 623E1F29
P 4550 4250
AR Path="/623E1F29" Ref="RN?"  Part="3" 
AR Path="/60757845/623E1F29" Ref="RN?"  Part="3" 
F 0 "RN?" H 4650 4300 50  0001 L CNN
F 1 "30Ω" H 4525 4356 50  0001 C CNN
F 2 "" H 4550 4330 50  0001 C CNN
F 3 "~" V 4550 4250 50  0001 C CNN
	3    4550 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 623E1F2F
P 4550 4350
AR Path="/623E1F2F" Ref="RN?"  Part="4" 
AR Path="/60757845/623E1F2F" Ref="RN?"  Part="4" 
F 0 "RN?" H 4650 4400 50  0001 L CNN
F 1 "30Ω" H 4525 4456 50  0001 C CNN
F 2 "" H 4550 4430 50  0001 C CNN
F 3 "~" V 4550 4350 50  0001 C CNN
	4    4550 4350
	1    0    0    1   
$EndComp
Wire Wire Line
	3900 4050 4400 4050
Wire Wire Line
	3900 4150 4400 4150
Wire Wire Line
	3900 4250 4400 4250
Wire Wire Line
	3900 4350 4400 4350
Wire Wire Line
	4650 4050 4700 4050
Wire Wire Line
	4650 4150 4700 4150
Wire Wire Line
	4650 4250 4700 4250
Wire Wire Line
	4650 4350 4700 4350
Text HLabel 4700 4050 2    50   3State ~ 0
~MEM
Text HLabel 4700 4150 2    50   3State ~ 0
~IO
Text HLabel 4700 4250 2    50   3State ~ 0
~R
Text HLabel 4700 4350 2    50   3State ~ 0
~W
Text HLabel 4700 3650 2    50   Output ~ 0
CLRWS
Text HLabel 4700 3750 2    50   Output ~ 0
~IBOE
Text HLabel 4700 3850 2    50   Output ~ 0
~ABOE
Text HLabel 4700 3950 2    50   Output ~ 0
~DBOE
Text HLabel 4700 4550 2    50   Input ~ 0
~IOINT
Text HLabel 4700 4650 2    50   Input ~ 0
~WAIT
Wire Wire Line
	3900 4650 4700 4650
Wire Wire Line
	3900 4750 3950 4750
$Comp
L Device:R_Small R?
U 1 1 6274D6EC
P 4050 4750
AR Path="/6274D6EC" Ref="R?"  Part="1" 
AR Path="/60757845/6274D6EC" Ref="R?"  Part="1" 
F 0 "R?" V 4100 4600 50  0000 C CNN
F 1 "30Ω" V 4100 4400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 4750 50  0001 C CNN
F 3 "~" H 4050 4750 50  0001 C CNN
	1    4050 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 4750 4700 4750
Wire Wire Line
	3900 5050 4700 5050
Text HLabel 4700 5150 2    50   Output ~ 0
STEP∕~RUN
Wire Wire Line
	3900 5150 4700 5150
Text HLabel 4700 5250 2    50   Output ~ 0
~µSTEP
Wire Wire Line
	3900 5250 4700 5250
Text Notes 3900 6150 2    50   ~ 0
The wired AND gate disables\nthe transmitter during µCU\nprogramming.
Text Notes 5550 6700 0    50   ~ 0
~CTS
Text Notes 5550 6800 0    50   ~ 0
GND
Text Notes 5550 6600 0    50   ~ 0
Vcc
Text Notes 5550 6500 0    50   ~ 0
TXD
Text Notes 5550 6400 0    50   ~ 0
RXD
Text Notes 5550 6300 0    50   ~ 0
~RTS
NoConn ~ 5250 6600
NoConn ~ 5250 6300
NoConn ~ 5250 6700
$Comp
L power:GND #PWR?
U 1 1 61A98322
P 5250 6800
AR Path="/61A98322" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A98322" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5250 6550 50  0001 C CNN
F 1 "GND" H 5255 6627 50  0000 C CNN
F 2 "" H 5250 6800 50  0001 C CNN
F 3 "" H 5250 6800 50  0001 C CNN
	1    5250 6800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5250 6500 5100 6500
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 61A9831B
P 5450 6600
AR Path="/61A9831B" Ref="J?"  Part="1" 
AR Path="/60757845/61A9831B" Ref="J?"  Part="1" 
F 0 "J?" H 5368 6167 50  0000 C CNN
F 1 "Conn_01x06" H 5530 6501 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 5450 6600 50  0001 C CNN
F 3 "~" H 5450 6600 50  0001 C CNN
	1    5450 6600
	1    0    0    1   
$EndComp
$Comp
L alexios:SolderJumper_3_Bridged12 JP?
U 1 1 62B114C6
P 4700 6400
F 0 "JP?" V 4450 6400 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 4700 6510 50  0001 C CNN
F 2 "" H 4700 6400 50  0001 C CNN
F 3 "~" H 4700 6400 50  0001 C CNN
	1    4700 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 6400 4600 6400
Wire Wire Line
	4700 6250 4700 6200
Wire Wire Line
	4700 6200 4950 6200
Wire Wire Line
	5100 6200 5100 6400
Wire Wire Line
	5100 6400 5250 6400
Wire Wire Line
	4950 6250 4950 6200
Connection ~ 4950 6200
Wire Wire Line
	4950 6200 5100 6200
Wire Wire Line
	4700 6550 4700 6600
Wire Wire Line
	4700 6600 4950 6600
Wire Wire Line
	5100 6600 5100 6500
Wire Wire Line
	4950 6550 4950 6600
Connection ~ 4950 6600
Wire Wire Line
	4950 6600 5100 6600
$Comp
L alexios:SolderJumper_3_Bridged23 JP?
U 1 1 62B45C36
P 4950 6400
F 0 "JP?" V 4700 6400 50  0000 C CNN
F 1 "SolderJumper_3_Bridged23" H 4950 6510 50  0001 C CNN
F 2 "" H 4950 6400 50  0001 C CNN
F 3 "~" H 4950 6400 50  0001 C CNN
	1    4950 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 6400 4800 6400
Wire Wire Line
	4800 6400 4800 6700
Text Label 3550 6700 0    50   ~ 0
RXD
$Comp
L Device:D_Schottky_ALT D?
U 1 1 61A98383
P 4050 6300
AR Path="/61A98383" Ref="D?"  Part="1" 
AR Path="/60757845/61A98383" Ref="D?"  Part="1" 
F 0 "D?" H 4050 6517 50  0000 C CNN
F 1 "?" H 4050 6426 50  0000 C CNN
F 2 "" H 4050 6300 50  0001 C CNN
F 3 "~" H 4050 6300 50  0001 C CNN
	1    4050 6300
	1    0    0    -1  
$EndComp
Text Notes 4650 6050 0    50   ~ 0
DTE/DCE cable config\n(aka I'm an idiot and always\nget the pinout wrong)
Wire Wire Line
	2700 5500 2700 5650
Entry Bus Bus
	1450 2650 1550 2750
Wire Bus Line
	1450 2650 1050 2650
Text HLabel 1050 2650 0    50   Output ~ 0
SWA[0..3]
Entry Wire Line
	1550 3150 1650 3250
Entry Wire Line
	1550 3050 1650 3150
Entry Wire Line
	1550 2950 1650 3050
Entry Wire Line
	1650 2950 1550 2850
Wire Wire Line
	1650 2950 1950 2950
Wire Wire Line
	1650 3050 1950 3050
Wire Wire Line
	1650 3150 1950 3150
Wire Wire Line
	1650 3250 1950 3250
Wire Wire Line
	2200 2950 2400 2950
Wire Wire Line
	2200 3050 2400 3050
Wire Wire Line
	2200 3150 2400 3150
Wire Wire Line
	2200 3250 2400 3250
Entry Bus Bus
	1450 3950 1550 3850
Wire Bus Line
	1450 3950 1050 3950
Text HLabel 1050 3950 0    50   Output ~ 0
SWD[0..3]
Wire Wire Line
	2400 3350 1650 3350
Wire Wire Line
	2400 3450 1650 3450
Wire Wire Line
	2400 3550 1650 3550
Wire Wire Line
	2400 3650 1650 3650
Wire Wire Line
	1050 4350 2400 4350
Text HLabel 1050 4350 0    50   Output ~ 0
~CVOE
Wire Wire Line
	2250 4450 2400 4450
Wire Wire Line
	2250 4550 2400 4550
Wire Wire Line
	1050 4450 2000 4450
Wire Wire Line
	1050 4550 2000 4550
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63C465B1
P 4550 3150
AR Path="/63C465B1" Ref="RN?"  Part="1" 
AR Path="/60757845/63C465B1" Ref="RN?"  Part="1" 
F 0 "RN?" H 4500 3250 50  0000 L CNN
F 1 "30Ω" H 4300 2800 50  0000 C CNN
F 2 "" H 4550 3230 50  0001 C CNN
F 3 "~" V 4550 3150 50  0001 C CNN
	1    4550 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63C465B7
P 4550 3250
AR Path="/63C465B7" Ref="RN?"  Part="2" 
AR Path="/60757845/63C465B7" Ref="RN?"  Part="2" 
F 0 "RN?" H 4650 3300 50  0001 L CNN
F 1 "30Ω" H 4525 3356 50  0001 C CNN
F 2 "" H 4550 3330 50  0001 C CNN
F 3 "~" V 4550 3250 50  0001 C CNN
	2    4550 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63C465BD
P 4550 3350
AR Path="/63C465BD" Ref="RN?"  Part="3" 
AR Path="/60757845/63C465BD" Ref="RN?"  Part="3" 
F 0 "RN?" H 4650 3400 50  0001 L CNN
F 1 "30Ω" H 4525 3456 50  0001 C CNN
F 2 "" H 4550 3430 50  0001 C CNN
F 3 "~" V 4550 3350 50  0001 C CNN
	3    4550 3350
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63C465C3
P 4550 3450
AR Path="/63C465C3" Ref="RN?"  Part="4" 
AR Path="/60757845/63C465C3" Ref="RN?"  Part="4" 
F 0 "RN?" H 4650 3500 50  0001 L CNN
F 1 "30Ω" H 4525 3556 50  0001 C CNN
F 2 "" H 4550 3530 50  0001 C CNN
F 3 "~" V 4550 3450 50  0001 C CNN
	4    4550 3450
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 63C79DDA
P 2150 2450
AR Path="/63C79DDA" Ref="R?"  Part="1" 
AR Path="/60757845/63C79DDA" Ref="R?"  Part="1" 
F 0 "R?" V 2200 2650 50  0000 C CNN
F 1 "30Ω" V 2100 2650 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2150 2450 50  0001 C CNN
F 3 "~" H 2150 2450 50  0001 C CNN
	1    2150 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 2450 2400 2450
Wire Wire Line
	1050 2450 2050 2450
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 63D14E09
P 1750 4050
AR Path="/63D14E09" Ref="RN?"  Part="1" 
AR Path="/60757845/63D14E09" Ref="RN?"  Part="1" 
F 0 "RN?" H 1725 4247 50  0000 C CNN
F 1 "30Ω" H 1725 4156 50  0000 C CNN
F 2 "" H 1750 4130 50  0001 C CNN
F 3 "~" V 1750 4050 50  0001 C CNN
	1    1750 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 63D14E15
P 2150 4450
AR Path="/63D14E15" Ref="RN?"  Part="3" 
AR Path="/60757845/63D14E15" Ref="RN?"  Part="3" 
F 0 "RN?" H 2250 4500 50  0001 L CNN
F 1 "30Ω" H 2125 4556 50  0001 C CNN
F 2 "" H 2150 4530 50  0001 C CNN
F 3 "~" V 2150 4450 50  0001 C CNN
	3    2150 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 63D14E1B
P 2150 4550
AR Path="/63D14E1B" Ref="RN?"  Part="4" 
AR Path="/60757845/63D14E1B" Ref="RN?"  Part="4" 
F 0 "RN?" H 2250 4600 50  0001 L CNN
F 1 "30Ω" H 2125 4656 50  0001 C CNN
F 2 "" H 2150 4630 50  0001 C CNN
F 3 "~" V 2150 4550 50  0001 C CNN
	4    2150 4550
	1    0    0    1   
$EndComp
Text HLabel 1050 4050 0    50   Output ~ 0
~FPIRQ
Wire Wire Line
	1850 4050 2400 4050
Wire Wire Line
	1050 4050 1600 4050
Wire Wire Line
	2250 4650 2300 4650
NoConn ~ 2300 4650
Wire Wire Line
	2000 4650 1950 4650
NoConn ~ 1950 4650
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 63D14E0F
P 2150 4650
AR Path="/63D14E0F" Ref="RN?"  Part="2" 
AR Path="/60757845/63D14E0F" Ref="RN?"  Part="2" 
F 0 "RN?" H 1650 4650 50  0000 L CNN
F 1 "30Ω" H 2150 4550 50  0000 C CNN
F 2 "" H 2150 4730 50  0001 C CNN
F 3 "~" V 2150 4650 50  0001 C CNN
	2    2150 4650
	1    0    0    -1  
$EndComp
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
Text Label 4500 5050 2    50   ~ 0
~LED-STOP
Text HLabel 4700 5050 2    50   Output ~ 0
~LED-STOP
Wire Wire Line
	1050 4150 2400 4150
Wire Wire Line
	1050 4250 2400 4250
Text HLabel 1050 4150 0    50   Output ~ 0
MFD0
Text HLabel 1050 4250 0    50   Output ~ 0
MFD1
Text Label 1200 4550 0    50   ~ 0
~FPRSTHOLD
Text HLabel 1050 4550 0    50   Output ~ 0
~FPRSTHOLD
Text Label 1200 4450 0    50   ~ 0
~FPRESET
Text HLabel 1050 4450 0    50   Output ~ 0
~FPRESET
$Comp
L power:GND #PWR?
U 1 1 61A9833F
P 1650 1750
AR Path="/61A9833F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61A9833F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1650 1500 50  0001 C CNN
F 1 "GND" H 1655 1577 50  0000 C CNN
F 2 "" H 1650 1750 50  0001 C CNN
F 3 "" H 1650 1750 50  0001 C CNN
	1    1650 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1700 1650 1750
Wire Wire Line
	1250 1700 1650 1700
Connection ~ 1650 1700
Wire Wire Line
	1650 1550 1650 1700
Wire Wire Line
	1400 950  1800 950 
Wire Wire Line
	1800 950  1800 1000
Connection ~ 1800 950 
Text HLabel 1050 2150 0    50   Output ~ 0
~WR
Text HLabel 1050 2250 0    50   Output ~ 0
~RD
Text Label 4250 4150 2    50   ~ 0
~µCIO
Text Label 4250 4050 2    50   ~ 0
~µCMEM
Wire Wire Line
	7700 3950 8150 3950
Wire Wire Line
	7700 4050 8150 4050
Wire Wire Line
	7700 4150 8150 4150
Wire Wire Line
	7700 4250 8150 4250
Wire Wire Line
	7700 4350 8150 4350
Wire Wire Line
	7700 4450 8150 4450
Wire Wire Line
	7700 4550 8150 4550
Wire Wire Line
	7700 4650 8150 4650
Text Label 7800 3950 0    50   ~ 0
MCA0
Text Label 7800 4050 0    50   ~ 0
MCA1
Text Label 7800 4150 0    50   ~ 0
MCA2
Text Label 7800 4250 0    50   ~ 0
MCA3
Text Label 7800 4350 0    50   ~ 0
MCA4
Text Label 7800 4450 0    50   ~ 0
MCA5
Text Label 7800 4550 0    50   ~ 0
MCA6
Text Label 7800 4650 0    50   ~ 0
MCA7
Entry Wire Line
	7700 4650 7600 4550
Entry Wire Line
	7700 4550 7600 4450
Entry Wire Line
	7700 4450 7600 4350
Entry Wire Line
	7700 4350 7600 4250
Entry Wire Line
	7700 4250 7600 4150
Entry Wire Line
	7700 4150 7600 4050
Entry Wire Line
	7700 4050 7600 3950
Entry Wire Line
	7700 3950 7600 3850
Text Label 9750 4650 0    50   ~ 0
FPA7
Text Label 9750 4550 0    50   ~ 0
FPA6
Text Label 9750 4450 0    50   ~ 0
FPA5
Text Label 9750 4350 0    50   ~ 0
FPA4
Text Label 9750 4250 0    50   ~ 0
FPA3
Text Label 9750 4150 0    50   ~ 0
FPA2
Text Label 9750 4050 0    50   ~ 0
FPA1
Text Label 9750 3950 0    50   ~ 0
FPA0
Text HLabel 10650 3600 2    50   BiDi ~ 0
FPA[0..7]
Text Label 10250 3600 0    50   ~ 0
FPA[0..7]
Wire Bus Line
	10650 3600 10200 3600
Entry Bus Bus
	10200 3600 10100 3700
Entry Wire Line
	10000 4650 10100 4550
Entry Wire Line
	10000 4550 10100 4450
Entry Wire Line
	10000 4450 10100 4350
Entry Wire Line
	10000 4350 10100 4250
Entry Wire Line
	10000 4250 10100 4150
Entry Wire Line
	10000 4150 10100 4050
Entry Wire Line
	10000 4050 10100 3950
Entry Wire Line
	10000 3950 10100 3850
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C99
P 8300 4650
AR Path="/610F1C99" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C99" Ref="RN?"  Part="4" 
F 0 "RN?" H 8200 4500 50  0000 L CNN
F 1 "30Ω" H 8500 4600 50  0000 C CNN
F 2 "" H 8300 4730 50  0001 C CNN
F 3 "~" V 8300 4650 50  0001 C CNN
	4    8300 4650
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C93
P 8300 4550
AR Path="/610F1C93" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C93" Ref="RN?"  Part="3" 
F 0 "RN?" H 8400 4600 50  0001 L CNN
F 1 "30Ω" H 8275 4656 50  0001 C CNN
F 2 "" H 8300 4630 50  0001 C CNN
F 3 "~" V 8300 4550 50  0001 C CNN
	3    8300 4550
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C8D
P 8300 4450
AR Path="/610F1C8D" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C8D" Ref="RN?"  Part="2" 
F 0 "RN?" H 8400 4500 50  0001 L CNN
F 1 "30Ω" H 8275 4556 50  0001 C CNN
F 2 "" H 8300 4530 50  0001 C CNN
F 3 "~" V 8300 4450 50  0001 C CNN
	2    8300 4450
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 610F1C87
P 8300 4250
AR Path="/610F1C87" Ref="RN?"  Part="4" 
AR Path="/60757845/610F1C87" Ref="RN?"  Part="4" 
F 0 "RN?" H 8400 4300 50  0001 L CNN
F 1 "30Ω" H 8275 4356 50  0001 C CNN
F 2 "" H 8300 4330 50  0001 C CNN
F 3 "~" V 8300 4250 50  0001 C CNN
	4    8300 4250
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 610F1C81
P 8300 4150
AR Path="/610F1C81" Ref="RN?"  Part="3" 
AR Path="/60757845/610F1C81" Ref="RN?"  Part="3" 
F 0 "RN?" H 8400 4200 50  0001 L CNN
F 1 "30Ω" H 8275 4256 50  0001 C CNN
F 2 "" H 8300 4230 50  0001 C CNN
F 3 "~" V 8300 4150 50  0001 C CNN
	3    8300 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 610F1C7B
P 8300 4050
AR Path="/610F1C7B" Ref="RN?"  Part="2" 
AR Path="/60757845/610F1C7B" Ref="RN?"  Part="2" 
F 0 "RN?" H 8400 4100 50  0001 L CNN
F 1 "30Ω" H 8275 4156 50  0001 C CNN
F 2 "" H 8300 4130 50  0001 C CNN
F 3 "~" V 8300 4050 50  0001 C CNN
	2    8300 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C75
P 8300 3950
AR Path="/610F1C75" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C75" Ref="RN?"  Part="1" 
F 0 "RN?" H 8000 4050 50  0000 L CNN
F 1 "30Ω" H 8450 4000 50  0000 C CNN
F 2 "" H 8300 4030 50  0001 C CNN
F 3 "~" V 8300 3950 50  0001 C CNN
	1    8300 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 610F1C6F
P 8300 4350
AR Path="/610F1C6F" Ref="RN?"  Part="1" 
AR Path="/60757845/610F1C6F" Ref="RN?"  Part="1" 
F 0 "RN?" H 8400 4400 50  0001 L CNN
F 1 "30Ω" H 8500 3950 50  0001 C CNN
F 2 "" H 8300 4430 50  0001 C CNN
F 3 "~" V 8300 4350 50  0001 C CNN
	1    8300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4650 9550 4650
Wire Wire Line
	10000 4550 9450 4550
Wire Wire Line
	10000 4450 9350 4450
Wire Wire Line
	10000 4350 9250 4350
Wire Wire Line
	10000 4250 9150 4250
Wire Wire Line
	10000 4150 9050 4150
Wire Wire Line
	10000 4050 8950 4050
Wire Wire Line
	10000 3950 8850 3950
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 615F27AA
P 9250 3650
AR Path="/615F27AA" Ref="RN?"  Part="1" 
AR Path="/60757845/615F27AA" Ref="RN?"  Part="1" 
F 0 "RN?" V 9300 3250 50  0000 R CNN
F 1 "10kΩ" V 9200 3250 50  0000 R CNN
F 2 "" H 9250 3730 50  0001 C CNN
F 3 "~" V 9250 3650 50  0001 C CNN
	1    9250 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9350 3800 9350 4450
Connection ~ 9350 4450
Wire Wire Line
	9350 4450 8400 4450
Wire Wire Line
	9450 3800 9450 4550
Connection ~ 9450 4550
Wire Wire Line
	9450 4550 8400 4550
Wire Wire Line
	9550 3800 9550 4650
Connection ~ 9550 4650
Wire Wire Line
	9550 4650 8400 4650
Wire Wire Line
	9250 3550 9250 3500
Wire Wire Line
	9250 3500 9350 3500
Wire Wire Line
	9350 3550 9350 3500
Connection ~ 9350 3500
Wire Wire Line
	9350 3500 9450 3500
Wire Wire Line
	9450 3550 9450 3500
Connection ~ 9450 3500
Wire Wire Line
	9450 3500 9550 3500
Wire Wire Line
	9550 3550 9550 3500
Connection ~ 9550 3500
$Comp
L power:+5V #PWR?
U 1 1 60145FEC
P 9550 3450
F 0 "#PWR?" H 9550 3300 50  0001 C CNN
F 1 "+5V" H 9650 3550 50  0000 C CNN
F 2 "" H 9550 3450 50  0001 C CNN
F 3 "" H 9550 3450 50  0001 C CNN
	1    9550 3450
	1    0    0    -1  
$EndComp
Text Notes 6100 6500 0    50   ~ 0
Socket this and try frequencies that\naren't harmonics of the CPU clock, 4 MHz to\navoid strobe effects on the front panel lights.\n\nThe panel will update at 1/21 the crystal frequency.
$Comp
L power:+5V #PWR?
U 1 1 601CE92A
P 7350 5400
AR Path="/601CE92A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE92A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7350 5250 50  0001 C CNN
F 1 "+5V" H 7365 5573 50  0000 C CNN
F 2 "" H 7350 5400 50  0001 C CNN
F 3 "" H 7350 5400 50  0001 C CNN
	1    7350 5400
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 601CE930
P 7150 5600
AR Path="/601CE930" Ref="C?"  Part="1" 
AR Path="/60757845/601CE930" Ref="C?"  Part="1" 
F 0 "C?" H 7200 5850 50  0000 R CNN
F 1 "100nF" H 7300 5350 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 5600 50  0001 C CNN
F 3 "~" H 7150 5600 50  0001 C CNN
	1    7150 5600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601CE936
P 7350 5800
AR Path="/601CE936" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE936" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7350 5550 50  0001 C CNN
F 1 "GND" H 7355 5627 50  0000 C CNN
F 2 "" H 7350 5800 50  0001 C CNN
F 3 "" H 7350 5800 50  0001 C CNN
	1    7350 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7050 5450 7150 5450
Wire Wire Line
	7350 5450 7350 5400
Wire Wire Line
	7150 5500 7150 5450
Connection ~ 7150 5450
$Comp
L Device:C_Small C?
U 1 1 601CE940
P 7350 5600
AR Path="/601CE940" Ref="C?"  Part="1" 
AR Path="/60757845/601CE940" Ref="C?"  Part="1" 
F 0 "C?" H 7250 5850 50  0000 R CNN
F 1 "1µF" H 7250 5600 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 5600 50  0001 C CNN
F 3 "~" H 7350 5600 50  0001 C CNN
	1    7350 5600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7350 5450 7350 5500
Connection ~ 7350 5450
Wire Wire Line
	7350 5450 7150 5450
$Comp
L alexios:CXO_DIP8 X?
U 1 1 601CE949
P 6750 5550
AR Path="/601CE949" Ref="X?"  Part="1" 
AR Path="/60757845/601CE949" Ref="X?"  Part="1" 
F 0 "X?" H 6850 5917 50  0000 C CNN
F 1 "33 MHz?" H 6850 5826 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 6900 5150 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 6850 5500 50  0001 C CNN
	1    6750 5550
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 601CE94F
P 6200 5400
AR Path="/601CE94F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/601CE94F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6200 5250 50  0001 C CNN
F 1 "+5V" H 6215 5573 50  0000 C CNN
F 2 "" H 6200 5400 50  0001 C CNN
F 3 "" H 6200 5400 50  0001 C CNN
	1    6200 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6250 5450 6200 5450
Wire Wire Line
	6200 5450 6200 5400
Wire Wire Line
	7350 5700 7350 5750
Wire Wire Line
	7350 5750 7150 5750
Connection ~ 7350 5750
Wire Wire Line
	7350 5750 7350 5800
Wire Wire Line
	7150 5700 7150 5750
Connection ~ 7150 5750
Wire Wire Line
	7150 5750 7050 5750
Text Label 6100 5400 1    50   ~ 0
SCANCLK
Wire Wire Line
	6100 5600 6250 5600
Connection ~ 6100 4250
Wire Wire Line
	6100 4250 6100 5600
Connection ~ 5600 4850
Text Notes 8250 1400 0    100  ~ 20
Data Bus Buffer
Text Notes 8000 3300 0    100  ~ 20
Address Bus
Text Notes 6100 3550 0    100  ~ 20
Front Panel\nScanner Counter
Wire Wire Line
	2400 2550 1050 2550
Text HLabel 1050 2550 0    50   Output ~ 0
~LCLKEN
Text Label 1200 2550 0    50   ~ 0
~LCKLKEN
$Comp
L Device:LED_ALT D?
U 1 1 604918F8
P 5000 2900
AR Path="/604918F8" Ref="D?"  Part="1" 
AR Path="/64C48268/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/607965DD/604918F8" Ref="D?"  Part="1" 
AR Path="/60A2F394/604918F8" Ref="D?"  Part="1" 
AR Path="/60757845/604918F8" Ref="D?"  Part="1" 
F 0 "D?" H 4993 2737 50  0000 C CNN
F 1 "LED_ALT" H 4993 2736 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 2900 50  0001 C CNN
F 3 "~" H 5000 2900 50  0001 C CNN
	1    5000 2900
	-1   0    0    1   
$EndComp
Text Notes 4650 7750 2    50   ~ 0
RX
Wire Wire Line
	5600 3450 5600 4850
Wire Wire Line
	3550 6700 4800 6700
$Comp
L Device:R_Small R?
U 1 1 608B26E9
P 4750 2900
AR Path="/608B26E9" Ref="R?"  Part="1" 
AR Path="/64C48268/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/607965DD/608B26E9" Ref="R?"  Part="1" 
AR Path="/60A2F394/608B26E9" Ref="R?"  Part="1" 
AR Path="/60757845/608B26E9" Ref="R?"  Part="1" 
F 0 "R?" V 4946 2900 50  0000 C CNN
F 1 "680Ω" V 4855 2900 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 2900 50  0001 C CNN
F 3 "~" H 4750 2900 50  0001 C CNN
	1    4750 2900
	0    -1   -1   0   
$EndComp
Text Label 4400 3050 2    50   ~ 0
ACT-LED
$Comp
L power:GND #PWR?
U 1 1 6085DCB4
P 5150 2900
F 0 "#PWR?" H 5150 2650 50  0001 C CNN
F 1 "GND" H 5300 2850 50  0000 C CNN
F 2 "" H 5150 2900 50  0001 C CNN
F 3 "" H 5150 2900 50  0001 C CNN
	1    5150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4850 5600 4850
Text HLabel 4700 4950 2    50   Output ~ 0
~PANELEN
Text HLabel 4700 4750 2    50   Output ~ 0
~LTSON
Wire Wire Line
	3900 4950 4700 4950
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 601187D3
P -650 2700
AR Path="/601187D3" Ref="RN?"  Part="1" 
AR Path="/60757845/601187D3" Ref="RN?"  Part="1" 
F 0 "RN?" H -750 2800 50  0000 L CNN
F 1 "10kΩ" H -450 2350 50  0000 C CNN
F 2 "" H -650 2780 50  0001 C CNN
F 3 "~" V -650 2700 50  0001 C CNN
	1    -650 2700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 601187D9
P -650 2800
AR Path="/601187D9" Ref="RN?"  Part="2" 
AR Path="/60757845/601187D9" Ref="RN?"  Part="2" 
F 0 "RN?" H -550 2850 50  0001 L CNN
F 1 "30Ω" H -675 2906 50  0001 C CNN
F 2 "" H -650 2880 50  0001 C CNN
F 3 "~" V -650 2800 50  0001 C CNN
	2    -650 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 601187DF
P -650 2900
AR Path="/601187DF" Ref="RN?"  Part="3" 
AR Path="/60757845/601187DF" Ref="RN?"  Part="3" 
F 0 "RN?" H -550 2950 50  0001 L CNN
F 1 "30Ω" H -675 3006 50  0001 C CNN
F 2 "" H -650 2980 50  0001 C CNN
F 3 "~" V -650 2900 50  0001 C CNN
	3    -650 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 601187E5
P -650 3000
AR Path="/601187E5" Ref="RN?"  Part="4" 
AR Path="/60757845/601187E5" Ref="RN?"  Part="4" 
F 0 "RN?" H -550 3050 50  0001 L CNN
F 1 "30Ω" H -675 3106 50  0001 C CNN
F 2 "" H -650 3080 50  0001 C CNN
F 3 "~" V -650 3000 50  0001 C CNN
	4    -650 3000
	1    0    0    1   
$EndComp
Wire Wire Line
	-550 2700 -450 2700
Wire Wire Line
	-450 2700 -450 2600
Wire Wire Line
	-550 3000 -450 3000
Wire Wire Line
	-450 3000 -450 2900
Connection ~ -450 2700
Wire Wire Line
	-550 2800 -450 2800
Connection ~ -450 2800
Wire Wire Line
	-450 2800 -450 2700
Wire Wire Line
	-550 2900 -450 2900
Connection ~ -450 2900
Wire Wire Line
	-450 2900 -450 2800
$Comp
L power:+5V #PWR?
U 1 1 601BB232
P -450 2600
F 0 "#PWR?" H -450 2450 50  0001 C CNN
F 1 "+5V" H -435 2773 50  0000 C CNN
F 2 "" H -450 2600 50  0001 C CNN
F 3 "" H -450 2600 50  0001 C CNN
	1    -450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-800 2700 -1200 2700
Wire Wire Line
	-800 2800 -1200 2800
Wire Wire Line
	-800 2900 -1200 2900
Wire Wire Line
	-800 3000 -1200 3000
Text Label -1200 2700 0    50   ~ 0
~WR
Text Label -1200 2800 0    50   ~ 0
~RD
Text Label -1200 2900 0    50   ~ 0
ALE
Text Label -1200 3000 0    50   ~ 0
~LCKLKEN
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6024C551
P -650 3500
AR Path="/6024C551" Ref="RN?"  Part="1" 
AR Path="/60757845/6024C551" Ref="RN?"  Part="1" 
F 0 "RN?" H -750 3600 50  0000 L CNN
F 1 "10kΩ" H -450 3150 50  0000 C CNN
F 2 "" H -650 3580 50  0001 C CNN
F 3 "~" V -650 3500 50  0001 C CNN
	1    -650 3500
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6024C557
P -650 3600
AR Path="/6024C557" Ref="RN?"  Part="2" 
AR Path="/60757845/6024C557" Ref="RN?"  Part="2" 
F 0 "RN?" H -550 3650 50  0001 L CNN
F 1 "30Ω" H -675 3706 50  0001 C CNN
F 2 "" H -650 3680 50  0001 C CNN
F 3 "~" V -650 3600 50  0001 C CNN
	2    -650 3600
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6024C55D
P -650 3700
AR Path="/6024C55D" Ref="RN?"  Part="3" 
AR Path="/60757845/6024C55D" Ref="RN?"  Part="3" 
F 0 "RN?" H -550 3750 50  0001 L CNN
F 1 "30Ω" H -675 3806 50  0001 C CNN
F 2 "" H -650 3780 50  0001 C CNN
F 3 "~" V -650 3700 50  0001 C CNN
	3    -650 3700
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6024C563
P -650 3800
AR Path="/6024C563" Ref="RN?"  Part="4" 
AR Path="/60757845/6024C563" Ref="RN?"  Part="4" 
F 0 "RN?" H -550 3850 50  0001 L CNN
F 1 "30Ω" H -675 3906 50  0001 C CNN
F 2 "" H -650 3880 50  0001 C CNN
F 3 "~" V -650 3800 50  0001 C CNN
	4    -650 3800
	1    0    0    1   
$EndComp
Wire Wire Line
	-550 3500 -450 3500
Wire Wire Line
	-450 3500 -450 3400
Wire Wire Line
	-550 3800 -450 3800
Wire Wire Line
	-450 3800 -450 3700
Connection ~ -450 3500
Wire Wire Line
	-550 3600 -450 3600
Connection ~ -450 3600
Wire Wire Line
	-450 3600 -450 3500
Wire Wire Line
	-550 3700 -450 3700
Connection ~ -450 3700
Wire Wire Line
	-450 3700 -450 3600
$Comp
L power:+5V #PWR?
U 1 1 6024C574
P -450 3400
F 0 "#PWR?" H -450 3250 50  0001 C CNN
F 1 "+5V" H -435 3573 50  0000 C CNN
F 2 "" H -450 3400 50  0001 C CNN
F 3 "" H -450 3400 50  0001 C CNN
	1    -450 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	-800 3500 -1200 3500
Wire Wire Line
	-800 3600 -1200 3600
Wire Wire Line
	-800 3700 -1200 3700
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 6026C92F
P -650 4300
AR Path="/6026C92F" Ref="RN?"  Part="1" 
AR Path="/60757845/6026C92F" Ref="RN?"  Part="1" 
F 0 "RN?" H -750 4400 50  0000 L CNN
F 1 "10kΩ" H -450 3950 50  0000 C CNN
F 2 "" H -650 4380 50  0001 C CNN
F 3 "~" V -650 4300 50  0001 C CNN
	1    -650 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 6026C935
P -650 4400
AR Path="/6026C935" Ref="RN?"  Part="2" 
AR Path="/60757845/6026C935" Ref="RN?"  Part="2" 
F 0 "RN?" H -550 4450 50  0001 L CNN
F 1 "30Ω" H -675 4506 50  0001 C CNN
F 2 "" H -650 4480 50  0001 C CNN
F 3 "~" V -650 4400 50  0001 C CNN
	2    -650 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 6026C93B
P -650 4500
AR Path="/6026C93B" Ref="RN?"  Part="3" 
AR Path="/60757845/6026C93B" Ref="RN?"  Part="3" 
F 0 "RN?" H -550 4550 50  0001 L CNN
F 1 "30Ω" H -675 4606 50  0001 C CNN
F 2 "" H -650 4580 50  0001 C CNN
F 3 "~" V -650 4500 50  0001 C CNN
	3    -650 4500
	1    0    0    -1  
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 6026C941
P -650 4600
AR Path="/6026C941" Ref="RN?"  Part="4" 
AR Path="/60757845/6026C941" Ref="RN?"  Part="4" 
F 0 "RN?" H -550 4650 50  0001 L CNN
F 1 "30Ω" H -675 4706 50  0001 C CNN
F 2 "" H -650 4680 50  0001 C CNN
F 3 "~" V -650 4600 50  0001 C CNN
	4    -650 4600
	1    0    0    1   
$EndComp
Wire Wire Line
	-550 4300 -450 4300
Wire Wire Line
	-450 4300 -450 4200
Wire Wire Line
	-550 4600 -450 4600
Wire Wire Line
	-450 4600 -450 4500
Connection ~ -450 4300
Wire Wire Line
	-550 4400 -450 4400
Connection ~ -450 4400
Wire Wire Line
	-450 4400 -450 4300
Wire Wire Line
	-550 4500 -450 4500
Connection ~ -450 4500
Wire Wire Line
	-450 4500 -450 4400
$Comp
L power:+5V #PWR?
U 1 1 6026C952
P -450 4200
F 0 "#PWR?" H -450 4050 50  0001 C CNN
F 1 "+5V" H -435 4373 50  0000 C CNN
F 2 "" H -450 4200 50  0001 C CNN
F 3 "" H -450 4200 50  0001 C CNN
	1    -450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	-800 4300 -1200 4300
Wire Wire Line
	-800 4500 -1200 4500
Wire Wire Line
	-800 4600 -1200 4600
Text Label -1200 3500 0    50   ~ 0
MFD0
Text Label -1200 3600 0    50   ~ 0
MFD1
Text Label -1200 4300 0    50   ~ 0
~CLR
Text Label -1200 4600 0    50   ~ 0
CLRWS
Text Notes -1350 2200 0    50   ~ 0
Consider single resistors here
NoConn ~ -1200 3700
Wire Wire Line
	-800 3800 -1200 3800
NoConn ~ -1200 3800
$Sheet
S 12450 5050 500  400 
U 611019EB
F0 "sheet611019E7" 50
F1 "cft_boardled.sch" 50
F2 "~LED1" I L 12450 5200 50 
F3 "~LED2" I L 12450 5300 50 
$EndSheet
Wire Wire Line
	12450 5300 12150 5300
$Sheet
S 12450 5700 500  400 
U 611243B5
F0 "sheet611243B1" 50
F1 "cft_boardled.sch" 50
F2 "~LED1" I L 12450 5850 50 
F3 "~LED2" I L 12450 5950 50 
$EndSheet
Wire Wire Line
	12450 5850 12150 5850
Wire Wire Line
	12450 5950 12150 5950
Wire Wire Line
	12450 5200 12150 5200
Wire Wire Line
	3900 4550 4700 4550
Text Label 4500 4550 2    50   ~ 0
~IOINT
Text Label 12150 5200 0    50   ~ 0
~IOINT
$Sheet
S 12450 6400 500  400 
U 5FED7B4A
F0 "sheet5FED7B46" 50
F1 "cft_boardled.sch" 50
F2 "LED1" I L 12450 6550 50 
F3 "LED2" I L 12450 6650 50 
$EndSheet
Wire Wire Line
	12450 6550 12200 6550
Wire Wire Line
	12450 6650 12200 6650
Text Label 12200 6650 0    50   ~ 0
TXD
Text Label 12200 6550 0    50   ~ 0
RXD
Wire Wire Line
	4450 3050 4450 2900
Wire Wire Line
	4450 2900 4650 2900
Wire Wire Line
	3900 3050 4450 3050
Wire Wire Line
	-800 4400 -1200 4400
Text Label 4000 3150 0    50   ~ 0
~µCRAM
Text Label -1200 4400 0    50   ~ 0
~µCRAM
Text Label -1200 5000 0    50   ~ 0
µCBUSCP
Text Label -1200 4500 0    50   ~ 0
µCCLKEN
Text Notes -2350 750  2    63   ~ 13
SIGNALS TO CHECK
Text Notes -3250 1400 0    63   ~ 0
Ensure these signals are pulled up/down during MCU reset:\n\n* ~WR~\n* ~RD~\n* ALE\n* ~LCLKEN~\n* ~FPHALT~ (likely open drain)\n* 
Text Label -1200 4900 0    50   ~ 0
µUCSTEP
Text Label -1200 5100 0    50   ~ 0
CLRWS
Text Label -1200 5300 0    50   ~ 0
~SCANEN
Text Label -1200 5400 0    50   ~ 0
~PANELEN
Text Label -1200 5500 0    50   ~ 0
~LED-STOP
Text Label -1200 5600 0    50   ~ 0
STEP∕~RUN
Text Label -1200 5700 0    50   ~ 0
~µSTEP
Wire Wire Line
	9250 3800 9250 4350
Connection ~ 9250 4350
Wire Wire Line
	9250 4350 8400 4350
$Comp
L alexios:R_Pack04_Split RN?
U 2 1 613FD64E
P 8950 3650
AR Path="/613FD64E" Ref="RN?"  Part="2" 
AR Path="/60757845/613FD64E" Ref="RN?"  Part="2" 
F 0 "RN?" H 9050 3700 50  0001 L CNN
F 1 "30Ω" H 8925 3756 50  0001 C CNN
F 2 "" H 8950 3730 50  0001 C CNN
F 3 "~" V 8950 3650 50  0001 C CNN
	2    8950 3650
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 3 1 613FD654
P 9050 3650
AR Path="/613FD654" Ref="RN?"  Part="3" 
AR Path="/60757845/613FD654" Ref="RN?"  Part="3" 
F 0 "RN?" H 9150 3700 50  0001 L CNN
F 1 "30Ω" H 9025 3756 50  0001 C CNN
F 2 "" H 9050 3730 50  0001 C CNN
F 3 "~" V 9050 3650 50  0001 C CNN
	3    9050 3650
	0    -1   -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 4 1 613FD65A
P 9150 3650
AR Path="/613FD65A" Ref="RN?"  Part="4" 
AR Path="/60757845/613FD65A" Ref="RN?"  Part="4" 
F 0 "RN?" H 9250 3700 50  0001 L CNN
F 1 "30Ω" H 9125 3756 50  0001 C CNN
F 2 "" H 9150 3730 50  0001 C CNN
F 3 "~" V 9150 3650 50  0001 C CNN
	4    9150 3650
	0    1    -1   0   
$EndComp
$Comp
L alexios:R_Pack04_Split RN?
U 1 1 613FD660
P 8850 3650
AR Path="/613FD660" Ref="RN?"  Part="1" 
AR Path="/60757845/613FD660" Ref="RN?"  Part="1" 
F 0 "RN?" V 8900 3750 50  0000 L CNN
F 1 "10kΩ" V 8800 3750 50  0000 L CNN
F 2 "" H 8850 3730 50  0001 C CNN
F 3 "~" V 8850 3650 50  0001 C CNN
	1    8850 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 3550 8850 3500
Wire Wire Line
	8850 3500 8950 3500
Wire Wire Line
	8950 3550 8950 3500
Connection ~ 8950 3500
Wire Wire Line
	8950 3500 9050 3500
Wire Wire Line
	9050 3550 9050 3500
Connection ~ 9050 3500
Wire Wire Line
	9050 3500 9150 3500
Wire Wire Line
	9150 3550 9150 3500
Wire Wire Line
	9150 3800 9150 4250
Connection ~ 9150 4250
Wire Wire Line
	9150 4250 8400 4250
Wire Wire Line
	9050 3800 9050 4150
Connection ~ 9050 4150
Wire Wire Line
	9050 4150 8400 4150
Wire Wire Line
	8950 3800 8950 4050
Connection ~ 8950 4050
Wire Wire Line
	8950 4050 8400 4050
Wire Wire Line
	8850 3800 8850 3950
Connection ~ 8850 3950
Wire Wire Line
	8850 3950 8400 3950
Wire Wire Line
	9150 3500 9250 3500
Connection ~ 9150 3500
Connection ~ 9250 3500
Wire Wire Line
	9550 3450 9550 3500
Text Notes 3800 1350 0    100  ~ 20
DFP Microcontroller
Text Label 5600 1850 3    50   ~ 0
MCD[0..7]
Wire Wire Line
	3900 2550 4350 2550
Wire Wire Line
	3900 2450 4350 2450
Wire Wire Line
	3900 2350 4350 2350
Wire Wire Line
	3900 2250 4350 2250
Wire Wire Line
	3900 2150 4350 2150
Wire Wire Line
	3900 2050 4350 2050
Wire Wire Line
	3900 1950 4350 1950
Wire Wire Line
	3900 1850 4350 1850
Entry Wire Line
	4350 2550 4450 2450
Entry Wire Line
	4350 2450 4450 2350
Entry Wire Line
	4350 2350 4450 2250
Entry Wire Line
	4350 2250 4450 2150
Entry Wire Line
	4350 2150 4450 2050
Entry Wire Line
	4350 2050 4450 1950
Entry Wire Line
	4350 1950 4450 1850
Entry Wire Line
	4350 1850 4450 1750
Entry Bus Bus
	5500 1500 5600 1600
Wire Bus Line
	5500 1500 4550 1500
Entry Bus Bus
	4550 1500 4450 1600
Wire Bus Line
	10100 3700 10100 4550
Wire Bus Line
	1550 2750 1550 3150
Wire Bus Line
	10100 1600 10100 2450
Wire Bus Line
	7700 1600 7700 2450
Wire Bus Line
	1550 3450 1550 3850
Wire Bus Line
	7600 1950 7600 4550
Wire Bus Line
	5600 1600 5600 2450
Wire Bus Line
	4450 1600 4450 2450
$Comp
L power:GND #PWR?
U 1 1 6079661D
P 5250 2350
AR Path="/6079661D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/6079661D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5250 2100 50  0001 C CNN
F 1 "GND" H 5255 2177 50  0000 C CNN
F 2 "" H 5250 2350 50  0001 C CNN
F 3 "" H 5250 2350 50  0001 C CNN
	1    5250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2250 5000 2300
Wire Wire Line
	5000 2050 5000 2000
$Comp
L Device:C_Small C?
U 1 1 60796625
P 4750 2150
AR Path="/60796625" Ref="C?"  Part="1" 
AR Path="/60757845/60796625" Ref="C?"  Part="1" 
F 0 "C?" H 4659 2196 50  0000 R CNN
F 1 "1µF" H 4659 2105 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4750 2150 50  0001 C CNN
F 3 "~" H 4750 2150 50  0001 C CNN
	1    4750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2250 4750 2300
Wire Wire Line
	4750 2050 4750 2000
$Comp
L Device:C_Small C?
U 1 1 6079662D
P 5000 2150
AR Path="/6079662D" Ref="C?"  Part="1" 
AR Path="/60757845/6079662D" Ref="C?"  Part="1" 
F 0 "C?" H 5000 2500 50  0000 C CNN
F 1 "100nF" H 5000 2400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5000 2150 50  0001 C CNN
F 3 "~" H 5000 2150 50  0001 C CNN
	1    5000 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60796664
P 5250 2150
AR Path="/60796664" Ref="C?"  Part="1" 
AR Path="/60757845/60796664" Ref="C?"  Part="1" 
F 0 "C?" H 5250 2500 50  0000 C CNN
F 1 "100nF" H 5300 2400 50  0000 C CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 2150 50  0001 C CNN
F 3 "~" H 5250 2150 50  0001 C CNN
	1    5250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2300 5250 2250
Wire Wire Line
	5250 2000 5250 2050
Connection ~ 5000 2000
Wire Wire Line
	5000 2000 5250 2000
Connection ~ 5000 2300
Wire Wire Line
	5000 2300 5250 2300
Wire Wire Line
	4750 2300 5000 2300
Wire Wire Line
	5250 2300 5250 2350
Connection ~ 5250 2300
Connection ~ 4750 2000
Wire Wire Line
	4750 2000 5000 2000
$Comp
L power:+5V #PWR?
U 1 1 60796633
P 4750 2000
AR Path="/60796633" Ref="#PWR?"  Part="1" 
AR Path="/60757845/60796633" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4750 1850 50  0001 C CNN
F 1 "+5V" H 4765 2173 50  0000 C CNN
F 2 "" H 4750 2000 50  0001 C CNN
F 3 "" H 4750 2000 50  0001 C CNN
	1    4750 2000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
