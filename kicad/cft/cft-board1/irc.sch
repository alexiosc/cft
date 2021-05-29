EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 19
Title ""
Date ""
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6050 6600 2    50   3State ~ 0
FPD[0..7]
Text Label 3300 1800 2    50   ~ 0
IEN7
Text Label 3300 1700 2    50   ~ 0
IEN6
Text Label 3300 1600 2    50   ~ 0
IEN5
Text Label 3300 1500 2    50   ~ 0
IEN4
Text Label 3300 1400 2    50   ~ 0
IEN3
Text Label 3300 1300 2    50   ~ 0
IEN2
Text Label 3300 1200 2    50   ~ 0
IEN1
Text Label 3300 1100 2    50   ~ 0
IEN0
Wire Wire Line
	3300 1800 3050 1800
Wire Wire Line
	3300 1700 3050 1700
Wire Wire Line
	3300 1600 3050 1600
Wire Wire Line
	3300 1500 3050 1500
Wire Wire Line
	3300 1400 3050 1400
Wire Wire Line
	3300 1300 3050 1300
Wire Wire Line
	3300 1200 3050 1200
Wire Wire Line
	3300 1100 3050 1100
$Comp
L alexios:74HC541 U?
U 1 1 5F173A15
P 4650 4600
AR Path="/5F173A15" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173A15" Ref="U12"  Part="1" 
AR Path="/60BB0546/5F173A15" Ref="U1204"  Part="1" 
F 0 "U1204" H 4650 5367 50  0000 C CNN
F 1 "74HC541" H 4650 5276 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 4600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 4600 50  0001 C CNN
	1    4650 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F173A07
P 4100 5150
AR Path="/5F173A07" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173A07" Ref="#PWR032"  Part="1" 
AR Path="/60BB0546/5F173A07" Ref="#PWR01207"  Part="1" 
F 0 "#PWR01207" H 4100 4900 50  0001 C CNN
F 1 "GND" H 4105 4977 50  0000 C CNN
F 2 "" H 4100 5150 50  0001 C CNN
F 3 "" H 4100 5150 50  0001 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5100 4100 5100
Wire Wire Line
	4100 5100 4100 5150
Wire Wire Line
	4150 4100 3900 4100
Wire Wire Line
	4150 4200 3900 4200
Wire Wire Line
	4150 4300 3900 4300
Wire Wire Line
	4150 4400 3900 4400
Wire Wire Line
	4150 4500 3900 4500
Wire Wire Line
	4150 4600 3900 4600
Wire Wire Line
	4150 4700 3900 4700
Wire Wire Line
	4150 4800 3900 4800
Text Label 3900 4100 0    50   ~ 0
IRF0
Text Label 3900 4200 0    50   ~ 0
IRF1
Text Label 3900 4300 0    50   ~ 0
IRF2
Text Label 3900 4400 0    50   ~ 0
IRF3
Text Label 3900 4500 0    50   ~ 0
IRF4
Text Label 3900 4600 0    50   ~ 0
IRF5
Text Label 3900 4700 0    50   ~ 0
IRF6
Text Label 3900 4800 0    50   ~ 0
IRF7
Text HLabel 1050 1900 0    50   Input ~ 0
~RESET
$Comp
L alexios:74HC541 U?
U 1 1 5F173A3D
P 2550 4550
AR Path="/5F173A3D" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F173A3D" Ref="U11"  Part="1" 
AR Path="/60BB0546/5F173A3D" Ref="U1203"  Part="1" 
F 0 "U1203" H 2550 5317 50  0000 C CNN
F 1 "74HC541" H 2550 5226 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2550 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 2550 4550 50  0001 C CNN
	1    2550 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F173A37
P 2000 5100
AR Path="/5F173A37" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173A37" Ref="#PWR031"  Part="1" 
AR Path="/60BB0546/5F173A37" Ref="#PWR01206"  Part="1" 
F 0 "#PWR01206" H 2000 4850 50  0001 C CNN
F 1 "GND" H 2005 4927 50  0000 C CNN
F 2 "" H 2000 5100 50  0001 C CNN
F 3 "" H 2000 5100 50  0001 C CNN
	1    2000 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5050 2000 5050
Wire Wire Line
	2000 5050 2000 5100
Text Label 1850 4950 0    50   ~ 0
~RIER
Wire Wire Line
	2000 6700 2000 6750
Wire Wire Line
	2050 6700 2000 6700
$Comp
L power:GND #PWR?
U 1 1 5F1739EB
P 2000 6750
AR Path="/5F1739EB" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F1739EB" Ref="#PWR044"  Part="1" 
AR Path="/60BB0546/5F1739EB" Ref="#PWR01219"  Part="1" 
F 0 "#PWR01219" H 2000 6500 50  0001 C CNN
F 1 "GND" H 2005 6577 50  0000 C CNN
F 2 "" H 2000 6750 50  0001 C CNN
F 3 "" H 2000 6750 50  0001 C CNN
	1    2000 6750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 5F1739E5
P 2550 6200
AR Path="/5F1739E5" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F1739E5" Ref="U14"  Part="1" 
AR Path="/60BB0546/5F1739E5" Ref="U1206"  Part="1" 
F 0 "U1206" H 2550 6967 50  0000 C CNN
F 1 "74HC541" H 2550 6876 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2550 6200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 2550 6200 50  0001 C CNN
	1    2550 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F1739C7
P 2000 5650
AR Path="/5F1739C7" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F1739C7" Ref="#PWR036"  Part="1" 
AR Path="/60BB0546/5F1739C7" Ref="#PWR01211"  Part="1" 
F 0 "#PWR01211" H 2000 5500 50  0001 C CNN
F 1 "+5V" H 2015 5823 50  0000 C CNN
F 2 "" H 2000 5650 50  0001 C CNN
F 3 "" H 2000 5650 50  0001 C CNN
	1    2000 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6000 2050 6000
Wire Wire Line
	2050 5900 2000 5900
Connection ~ 2000 5900
Wire Wire Line
	2000 5900 2000 6000
Wire Wire Line
	2050 6300 2000 6300
Wire Wire Line
	2000 6300 2000 6400
Wire Wire Line
	2050 6400 2000 6400
Wire Wire Line
	3050 3250 3250 3250
Wire Wire Line
	3050 3150 3250 3150
Wire Wire Line
	3050 3050 3250 3050
Wire Wire Line
	3050 2950 3250 2950
Wire Wire Line
	3050 2850 3250 2850
Wire Wire Line
	3050 2750 3250 2750
Wire Wire Line
	3050 2650 3250 2650
Wire Wire Line
	3050 2550 3250 2550
$Comp
L alexios:74HC541 U?
U 1 1 5F17390A
P 2550 3050
AR Path="/5F17390A" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F17390A" Ref="U10"  Part="1" 
AR Path="/60BB0546/5F17390A" Ref="U1202"  Part="1" 
F 0 "U1202" H 2550 3817 50  0000 C CNN
F 1 "74HC541" H 2550 3726 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2550 3050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 2550 3050 50  0001 C CNN
	1    2550 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F173904
P 2000 3600
AR Path="/5F173904" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173904" Ref="#PWR027"  Part="1" 
AR Path="/60BB0546/5F173904" Ref="#PWR01202"  Part="1" 
F 0 "#PWR01202" H 2000 3350 50  0001 C CNN
F 1 "GND" H 2005 3427 50  0000 C CNN
F 2 "" H 2000 3600 50  0001 C CNN
F 3 "" H 2000 3600 50  0001 C CNN
	1    2000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3550 2000 3550
Wire Wire Line
	2000 3550 2000 3600
Text Label 1850 3450 0    50   ~ 0
~RISR
Wire Wire Line
	2050 2550 1850 2550
Wire Wire Line
	2050 2650 1850 2650
Wire Wire Line
	2050 2750 1850 2750
Wire Wire Line
	2050 2950 1850 2950
Wire Wire Line
	2050 3050 1850 3050
Wire Wire Line
	2050 3150 1850 3150
Text Label 1850 2550 0    50   ~ 0
IRF0
Text Label 1850 2650 0    50   ~ 0
IRF1
Text Label 1850 2750 0    50   ~ 0
IRF2
Text Label 1850 2950 0    50   ~ 0
IRF4
Text Label 1850 3050 0    50   ~ 0
IRF5
Text Label 1850 3150 0    50   ~ 0
IRF6
Text Label 3250 2550 2    50   ~ 0
DB0
Text Label 3250 2650 2    50   ~ 0
DB1
Text Label 3250 2750 2    50   ~ 0
DB2
Text Label 3250 2850 2    50   ~ 0
DB3
Text Label 3250 2950 2    50   ~ 0
DB4
Text Label 3250 3050 2    50   ~ 0
DB5
Text Label 3250 3150 2    50   ~ 0
DB6
Text Label 3250 3250 2    50   ~ 0
DB7
Text Label 1850 1100 0    50   ~ 0
AB3
Text Label 1850 1500 0    50   ~ 0
AB2
Text Label 1850 1400 0    50   ~ 0
AB1
Wire Wire Line
	2050 1100 1850 1100
Wire Wire Line
	2050 1500 1850 1500
Wire Wire Line
	2050 1400 1850 1400
Text Label 1850 1700 0    50   ~ 0
~WIER
Text Label 1850 1900 0    50   ~ 0
~RESET
$Comp
L alexios:74HC259 U?
U 1 1 5F1738C6
P 2550 1500
AR Path="/5F1738C6" Ref="U?"  Part="1" 
AR Path="/5F160E7C/5F1738C6" Ref="U9"  Part="1" 
AR Path="/60BB0546/5F1738C6" Ref="U1201"  Part="1" 
F 0 "U1201" H 2550 2167 50  0000 C CNN
F 1 "74HC259" H 2550 2076 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 2550 1500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT259.pdf" H 2550 1500 50  0001 C CNN
	1    2550 1500
	1    0    0    -1  
$EndComp
Text Label 5400 4800 2    50   ~ 0
FPD7
Text Label 5400 4700 2    50   ~ 0
FPD6
Text Label 5400 4600 2    50   ~ 0
FPD5
Text Label 5400 4500 2    50   ~ 0
FPD4
Text Label 5400 4400 2    50   ~ 0
FPD3
Text Label 5400 4300 2    50   ~ 0
FPD2
Text Label 5400 4200 2    50   ~ 0
FPD1
Text Label 5400 4100 2    50   ~ 0
FPD0
Wire Wire Line
	5150 4100 5450 4100
Wire Wire Line
	5150 4200 5450 4200
Wire Wire Line
	5150 4300 5450 4300
Wire Wire Line
	5150 4400 5450 4400
Wire Wire Line
	5150 4500 5450 4500
Wire Wire Line
	5150 4600 5450 4600
Wire Wire Line
	5150 4700 5450 4700
Wire Wire Line
	5150 4800 5450 4800
Entry Wire Line
	5450 4100 5550 4200
Entry Wire Line
	5450 4200 5550 4300
Entry Wire Line
	5450 4300 5550 4400
Entry Wire Line
	5450 4400 5550 4500
Entry Wire Line
	5450 4500 5550 4600
Entry Wire Line
	5450 4600 5550 4700
Entry Wire Line
	5450 4700 5550 4800
Entry Wire Line
	5450 4800 5550 4900
Text Label 3250 4350 2    50   ~ 0
DB7
Text Label 3250 4550 2    50   ~ 0
DB6
Text Label 3250 4650 2    50   ~ 0
DB5
Text Label 3250 4750 2    50   ~ 0
DB4
Text Label 3250 4450 2    50   ~ 0
DB3
Text Label 3250 4250 2    50   ~ 0
DB2
Text Label 3250 4150 2    50   ~ 0
DB1
Text Label 3250 4050 2    50   ~ 0
DB0
Wire Wire Line
	3050 4050 3250 4050
Wire Wire Line
	3050 4150 3250 4150
Wire Wire Line
	3050 4250 3250 4250
Wire Wire Line
	3050 4450 3250 4450
Wire Wire Line
	3050 4750 3250 4750
Wire Wire Line
	3050 4650 3250 4650
Wire Wire Line
	3050 4550 3250 4550
Wire Wire Line
	3050 4350 3250 4350
Text Label 3250 6400 2    50   ~ 0
DB15
Text Label 3250 6300 2    50   ~ 0
DB14
Text Label 3250 6200 2    50   ~ 0
DB13
Text Label 3250 6100 2    50   ~ 0
DB12
Text Label 3250 6000 2    50   ~ 0
DB11
Text Label 3250 5900 2    50   ~ 0
DB10
Text Label 3250 5800 2    50   ~ 0
DB9
Text Label 3250 5700 2    50   ~ 0
DB8
Wire Wire Line
	3050 5700 3250 5700
Wire Wire Line
	3050 5800 3250 5800
Wire Wire Line
	3050 5900 3250 5900
Wire Wire Line
	3050 6000 3250 6000
Wire Wire Line
	3050 6100 3250 6100
Wire Wire Line
	3050 6200 3250 6200
Wire Wire Line
	3050 6300 3250 6300
Wire Wire Line
	3050 6400 3250 6400
Wire Wire Line
	1850 1700 2050 1700
Wire Wire Line
	1050 1900 2050 1900
Wire Wire Line
	2050 3450 1850 3450
Text Label 3900 5000 0    50   ~ 0
~FPIRF
Wire Wire Line
	3850 5000 4150 5000
Text HLabel 3850 5000 0    50   Input ~ 0
~FPIRF
$Sheet
S 6550 1350 1150 600 
U 5FC1EA75
F0 "sheet5FC1EA73" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 6550 1650 50 
F3 "IRF" O R 7700 1450 50 
F4 "CLK2" I L 6550 1450 50 
F5 "CLK3" I L 6550 1550 50 
F6 "~IRQ" T R 7700 1850 50 
F7 "~IRQn" I L 6550 1750 50 
$EndSheet
Wire Wire Line
	6250 1450 6550 1450
Wire Wire Line
	6250 1550 6550 1550
Text Label 6250 1450 0    50   ~ 0
CLK2
Text Label 6250 1550 0    50   ~ 0
CLK3
Wire Wire Line
	7700 1450 8100 1450
$Sheet
S 6550 2150 1150 600 
U 5FD4BB81
F0 "sheet5FD4BB79" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 6550 2450 50 
F3 "IRF" O R 7700 2250 50 
F4 "CLK2" I L 6550 2250 50 
F5 "CLK3" I L 6550 2350 50 
F6 "~IRQ" T R 7700 2650 50 
F7 "~IRQn" I L 6550 2550 50 
$EndSheet
Wire Wire Line
	6250 2250 6550 2250
Wire Wire Line
	6250 2350 6550 2350
Text Label 6250 2250 0    50   ~ 0
CLK2
Text Label 6250 2350 0    50   ~ 0
CLK3
Wire Wire Line
	6550 2550 6250 2550
Wire Wire Line
	7700 2250 8100 2250
Wire Wire Line
	6250 3050 6550 3050
Wire Wire Line
	6250 3150 6550 3150
Text Label 6250 3050 0    50   ~ 0
CLK2
Text Label 6250 3150 0    50   ~ 0
CLK3
Wire Wire Line
	6550 3350 6250 3350
Wire Wire Line
	7700 3050 8100 3050
Wire Wire Line
	6250 3850 6550 3850
Wire Wire Line
	6250 3950 6550 3950
Text Label 6250 3850 0    50   ~ 0
CLK2
Text Label 6250 3950 0    50   ~ 0
CLK3
Wire Wire Line
	6550 4150 6250 4150
Wire Wire Line
	7700 3850 8100 3850
$Sheet
S 8850 1350 1150 600 
U 5FD81CE5
F0 "sheet5FD81CDA" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 8850 1650 50 
F3 "IRF" O R 10000 1450 50 
F4 "CLK2" I L 8850 1450 50 
F5 "CLK3" I L 8850 1550 50 
F6 "~IRQ" T R 10000 1850 50 
F7 "~IRQn" I L 8850 1750 50 
$EndSheet
$Sheet
S 8850 2150 1150 600 
U 5FD81CF9
F0 "sheet5FD81CDB" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 8850 2450 50 
F3 "IRF" O R 10000 2250 50 
F4 "CLK2" I L 8850 2250 50 
F5 "CLK3" I L 8850 2350 50 
F6 "~IRQ" T R 10000 2650 50 
F7 "~IRQn" I L 8850 2550 50 
$EndSheet
$Sheet
S 8850 2950 1150 600 
U 5FD81D0D
F0 "sheet5FD81CDC" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 8850 3250 50 
F3 "IRF" O R 10000 3050 50 
F4 "CLK2" I L 8850 3050 50 
F5 "CLK3" I L 8850 3150 50 
F6 "~IRQ" T R 10000 3450 50 
F7 "~IRQn" I L 8850 3350 50 
$EndSheet
$Sheet
S 8850 3750 1150 600 
U 5FD81D21
F0 "sheet5FD81CDD" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 8850 4050 50 
F3 "IRF" O R 10000 3850 50 
F4 "CLK2" I L 8850 3850 50 
F5 "CLK3" I L 8850 3950 50 
F6 "~IRQ" T R 10000 4250 50 
F7 "~IRQn" I L 8850 4150 50 
$EndSheet
Entry Wire Line
	8100 1450 8200 1550
Entry Wire Line
	8100 2250 8200 2350
Entry Wire Line
	8100 3050 8200 3150
Entry Wire Line
	8100 3850 8200 3950
Text Label 8000 1850 2    50   ~ 0
~IRQ
Text Label 8000 2650 2    50   ~ 0
~IRQ
Text Label 8000 3450 2    50   ~ 0
~IRQ
Text Label 8000 4250 2    50   ~ 0
~IRQ
Text Label 8000 1450 2    50   ~ 0
IRF0
Text Label 8000 2250 2    50   ~ 0
IRF1
Text Label 8000 3050 2    50   ~ 0
IRF2
Text Label 8000 3850 2    50   ~ 0
IRF3
Text Label 6250 2450 0    50   ~ 0
IEN1
Text Label 6250 3250 0    50   ~ 0
IEN2
Text Label 6250 4050 0    50   ~ 0
IEN3
Text Label 6250 2550 0    50   ~ 0
~IRQ1
Text Label 6250 3350 0    50   ~ 0
~IRQ2
Text Label 6250 4150 0    50   ~ 0
~IRQ3
Wire Wire Line
	6550 4050 6250 4050
Wire Wire Line
	6550 3250 6250 3250
Wire Wire Line
	6550 2450 6250 2450
Wire Wire Line
	8550 1450 8850 1450
Wire Wire Line
	8550 1550 8850 1550
Text Label 8550 1450 0    50   ~ 0
CLK2
Text Label 8550 1550 0    50   ~ 0
CLK3
Wire Wire Line
	8550 2250 8850 2250
Wire Wire Line
	8550 2350 8850 2350
Text Label 8550 2250 0    50   ~ 0
CLK2
Text Label 8550 2350 0    50   ~ 0
CLK3
Wire Wire Line
	8850 2550 8550 2550
Wire Wire Line
	8550 3050 8850 3050
Wire Wire Line
	8550 3150 8850 3150
Text Label 8550 3050 0    50   ~ 0
CLK2
Text Label 8550 3150 0    50   ~ 0
CLK3
Wire Wire Line
	8850 3350 8550 3350
Wire Wire Line
	8550 3850 8850 3850
Wire Wire Line
	8550 3950 8850 3950
Text Label 8550 3850 0    50   ~ 0
CLK2
Text Label 8550 3950 0    50   ~ 0
CLK3
Text Label 8550 2450 0    50   ~ 0
IEN5
Text Label 8550 3250 0    50   ~ 0
IEN6
Text Label 8550 4050 0    50   ~ 0
IEN7
Text Label 8550 2550 0    50   ~ 0
~IRQ5
Text Label 8550 3350 0    50   ~ 0
~IRQ6
Wire Wire Line
	8850 4050 8550 4050
Wire Wire Line
	8850 3250 8550 3250
Wire Wire Line
	8850 2450 8550 2450
Text Label 8200 2150 1    50   ~ 0
IRF[0..7]
Wire Wire Line
	8050 1850 8050 2650
Wire Wire Line
	7700 1850 8050 1850
Wire Wire Line
	7700 2650 8050 2650
Connection ~ 8050 2650
Wire Wire Line
	8050 2650 8050 3450
Wire Wire Line
	7700 3450 8050 3450
Connection ~ 8050 3450
Wire Wire Line
	8050 3450 8050 4250
Wire Wire Line
	7700 4250 8050 4250
Connection ~ 8050 4250
Wire Wire Line
	8050 4250 8050 4550
Wire Wire Line
	8050 4550 10350 4550
Wire Bus Line
	8300 1200 8200 1100
Wire Bus Line
	8200 1100 6250 1100
Wire Bus Line
	6250 1100 6150 1200
Wire Bus Line
	6050 1150 6200 1000
Wire Bus Line
	8400 1150 8250 1000
Wire Bus Line
	6200 1000 8250 1000
Wire Wire Line
	10000 1450 10400 1450
Wire Wire Line
	10000 2250 10400 2250
Wire Wire Line
	10000 3050 10400 3050
Wire Wire Line
	10000 3850 10400 3850
Entry Wire Line
	10400 1450 10500 1550
Entry Wire Line
	10400 2250 10500 2350
Entry Wire Line
	10400 3050 10500 3150
Entry Wire Line
	10400 3850 10500 3950
Text Label 10300 1850 2    50   ~ 0
~IRQ
Text Label 10300 2650 2    50   ~ 0
~IRQ
Text Label 10300 3450 2    50   ~ 0
~IRQ
Text Label 10300 4250 2    50   ~ 0
~IRQ
Text Label 10300 1450 2    50   ~ 0
IRF4
Text Label 10300 2250 2    50   ~ 0
IRF5
Text Label 10300 3050 2    50   ~ 0
IRF6
Text Label 10300 3850 2    50   ~ 0
IRF7
Text Label 10500 2150 1    50   ~ 0
IRF[0..7]
Wire Wire Line
	10350 1850 10350 2650
Wire Wire Line
	10000 1850 10350 1850
Wire Wire Line
	10000 2650 10350 2650
Connection ~ 10350 2650
Wire Wire Line
	10350 2650 10350 3450
Wire Wire Line
	10000 3450 10350 3450
Connection ~ 10350 3450
Wire Wire Line
	10350 3450 10350 4250
Wire Wire Line
	10000 4250 10350 4250
Connection ~ 10350 4250
Wire Wire Line
	10350 4250 10350 4550
Text Notes 7050 1700 0    100  ~ 20
0
Text Notes 7050 2550 0    100  ~ 20
1
Text Notes 7050 3300 0    100  ~ 20
2
Text Notes 7050 4150 0    100  ~ 20
3
Text Notes 9350 1700 0    100  ~ 20
4
Text Notes 9350 2550 0    100  ~ 20
5
Text Notes 9350 3300 0    100  ~ 20
6
Text Notes 9350 4150 0    100  ~ 20
7
Wire Bus Line
	8200 4600 8300 4700
Wire Bus Line
	8300 4700 10400 4700
Wire Bus Line
	10400 4700 10500 4600
Connection ~ 10350 4550
Text HLabel 10850 4550 2    50   3State ~ 0
~IRQ
Wire Wire Line
	4500 1150 4800 1150
Wire Wire Line
	4500 1250 4800 1250
Wire Wire Line
	4500 1350 4800 1350
Wire Wire Line
	4500 1450 4800 1450
Wire Wire Line
	4500 1550 4800 1550
Wire Wire Line
	4500 1650 4800 1650
Wire Wire Line
	4500 1750 4800 1750
Wire Wire Line
	4500 1850 4800 1850
Text Label 4500 1150 0    50   ~ 0
~IRQ0
Text Label 4500 1250 0    50   ~ 0
~IRQ1
Text Label 4500 1350 0    50   ~ 0
~IRQ2
Text Label 4500 1450 0    50   ~ 0
~IRQ3
Text Label 4500 1550 0    50   ~ 0
~IRQ4
Text Label 4500 1650 0    50   ~ 0
~IRQ5
Text Label 4500 1750 0    50   ~ 0
~IRQ6
Text Label 4500 1850 0    50   ~ 0
~IRQ7
$Comp
L power:+5V #PWR?
U 1 1 5F173A6B
P 5450 1100
AR Path="/5F173A6B" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/5F173A6B" Ref="#PWR026"  Part="1" 
AR Path="/60BB0546/5F173A6B" Ref="#PWR01201"  Part="1" 
F 0 "#PWR01201" H 5450 950 50  0001 C CNN
F 1 "+5V" H 5465 1273 50  0000 C CNN
F 2 "" H 5450 1100 50  0001 C CNN
F 3 "" H 5450 1100 50  0001 C CNN
	1    5450 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5450 1100 5450 1150
Text Label 9550 4700 2    50   ~ 0
IRF[0..7]
Text Label 1850 4350 0    50   ~ 0
IEN7
Text Label 1850 4550 0    50   ~ 0
IEN6
Text Label 1850 4650 0    50   ~ 0
IEN5
Text Label 1850 4750 0    50   ~ 0
IEN4
Text Label 1850 4450 0    50   ~ 0
IEN3
Text Label 1850 4250 0    50   ~ 0
IEN2
Text Label 1850 4150 0    50   ~ 0
IEN1
Text Label 1850 4050 0    50   ~ 0
IEN0
Wire Wire Line
	1850 4050 2050 4050
Wire Wire Line
	1850 4150 2050 4150
Wire Wire Line
	1850 4250 2050 4250
Wire Wire Line
	1850 4450 2050 4450
Wire Wire Line
	1850 4750 2050 4750
Wire Wire Line
	1850 4650 2050 4650
Wire Wire Line
	1850 4550 2050 4550
Wire Wire Line
	1850 4350 2050 4350
Wire Wire Line
	2000 6000 2000 6100
Wire Wire Line
	2000 6200 2050 6200
Connection ~ 2000 6000
Wire Wire Line
	2050 6100 2000 6100
Connection ~ 2000 6100
Wire Wire Line
	2000 6100 2000 6200
Wire Wire Line
	1850 4950 2050 4950
Wire Wire Line
	2050 5700 2000 5700
Wire Wire Line
	2000 5650 2000 5700
Wire Wire Line
	2050 5800 2000 5800
Text Notes 9750 5650 0    50   ~ 0
MSB patterns for IRC\nautodetection:\n\nISR: MSB = 00111110\nIER: MSB = 00111101
Wire Notes Line width 12 style solid
	9650 5150 9650 5750
Wire Notes Line width 12 style solid
	9650 5750 10700 5750
Wire Notes Line width 12 style solid
	10700 5750 10700 5150
Wire Notes Line width 12 style solid
	10700 5150 9650 5150
$Comp
L power:GND #PWR?
U 1 1 60E758A3
P 4100 6650
AR Path="/60E758A3" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/60E758A3" Ref="#PWR043"  Part="1" 
AR Path="/60BB0546/60E758A3" Ref="#PWR01218"  Part="1" 
F 0 "#PWR01218" H 4100 6400 50  0001 C CNN
F 1 "GND" H 4105 6477 50  0000 C CNN
F 2 "" H 4100 6650 50  0001 C CNN
F 3 "" H 4100 6650 50  0001 C CNN
	1    4100 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6600 4100 6600
Wire Wire Line
	4100 6600 4100 6650
Text HLabel 3850 6500 0    50   Input ~ 0
~FPIEN
Wire Wire Line
	4150 6500 3850 6500
Text Label 3900 5900 0    50   ~ 0
IEN7
Text Label 3900 6100 0    50   ~ 0
IEN6
Text Label 3900 6200 0    50   ~ 0
IEN5
Text Label 3900 6300 0    50   ~ 0
IEN4
Text Label 3900 6000 0    50   ~ 0
IEN3
Text Label 3900 5800 0    50   ~ 0
IEN2
Text Label 3900 5700 0    50   ~ 0
IEN1
Text Label 3900 5600 0    50   ~ 0
IEN0
Text Label 3900 6500 0    50   ~ 0
~FPIEN
Wire Wire Line
	3900 5900 4150 5900
Wire Wire Line
	3900 6100 4150 6100
Wire Wire Line
	3900 6200 4150 6200
Wire Wire Line
	3900 6300 4150 6300
Wire Wire Line
	3900 6000 4150 6000
Wire Wire Line
	3900 5800 4150 5800
Wire Wire Line
	3900 5700 4150 5700
Wire Wire Line
	3900 5600 4150 5600
Text Label 5400 5900 2    50   ~ 0
FPD7
Text Label 5400 6100 2    50   ~ 0
FPD6
Text Label 5400 6200 2    50   ~ 0
FPD5
Text Label 5400 6300 2    50   ~ 0
FPD4
Text Label 5400 6000 2    50   ~ 0
FPD3
Text Label 5400 5800 2    50   ~ 0
FPD2
Text Label 5400 5700 2    50   ~ 0
FPD1
Text Label 5400 5600 2    50   ~ 0
FPD0
Wire Wire Line
	5150 5600 5450 5600
Wire Wire Line
	5150 5700 5450 5700
Wire Wire Line
	5150 5800 5450 5800
Wire Wire Line
	5150 6000 5450 6000
Wire Wire Line
	5150 6300 5450 6300
Wire Wire Line
	5150 6200 5450 6200
Wire Wire Line
	5150 6100 5450 6100
Wire Wire Line
	5150 5900 5450 5900
Entry Wire Line
	5450 5600 5550 5700
Entry Wire Line
	5450 5700 5550 5800
Entry Wire Line
	5450 5800 5550 5900
Entry Wire Line
	5450 5900 5550 6000
Entry Wire Line
	5450 6000 5550 6100
Entry Wire Line
	5450 6100 5550 6200
Entry Wire Line
	5450 6200 5550 6300
Entry Wire Line
	5450 6300 5550 6400
Wire Bus Line
	5550 6500 5650 6600
Wire Bus Line
	5650 6600 6050 6600
Text Label 5550 5050 3    50   ~ 0
FPD[0..7]
Entry Wire Line
	3250 6400 3350 6300
Entry Wire Line
	3250 6300 3350 6200
Entry Wire Line
	3250 6200 3350 6100
Entry Wire Line
	3250 6100 3350 6000
Entry Wire Line
	3250 6000 3350 5900
Entry Wire Line
	3250 5900 3350 5800
Entry Wire Line
	3250 5800 3350 5700
Entry Wire Line
	3250 5700 3350 5600
Entry Wire Line
	3250 4750 3350 4650
Entry Wire Line
	3250 4650 3350 4550
Entry Wire Line
	3250 4550 3350 4450
Entry Wire Line
	3250 4450 3350 4350
Entry Wire Line
	3250 4350 3350 4250
Entry Wire Line
	3250 4250 3350 4150
Entry Wire Line
	3250 4150 3350 4050
Entry Wire Line
	3250 4050 3350 3950
Entry Wire Line
	3250 2550 3350 2650
Entry Wire Line
	3250 2650 3350 2750
Entry Wire Line
	3250 2750 3350 2850
Entry Wire Line
	3250 2850 3350 2950
Entry Wire Line
	3250 2950 3350 3050
Entry Wire Line
	3250 3050 3350 3150
Entry Wire Line
	3250 3150 3350 3250
Entry Wire Line
	3250 3250 3350 3350
Text Notes 4400 800  0    100  ~ 20
~IRQn~ Pull-Ups
Text Notes 2200 750  0    100  ~ 20
Registers
Wire Bus Line
	3350 3650 3450 3550
Wire Bus Line
	3450 3550 3800 3550
Wire Bus Line
	3350 3450 3450 3550
Text HLabel 3800 3550 2    50   BiDi ~ 0
DB[0..15]
Text Notes 2600 1750 1    63   ~ 13
IER Write
Text Notes 2600 3300 1    63   ~ 13
ISR Lo Read
Text Notes 2600 4800 1    63   ~ 13
IER Lo Read
Text Notes 2600 6600 1    63   ~ 13
ISR/IER Hi Read
Text Notes 7350 800  0    100  ~ 20
Interrupt State Machines
$Comp
L alexios:74HC259 U?
U 2 1 614E60B0
P 6500 6000
AR Path="/614E60B0" Ref="U?"  Part="1" 
AR Path="/5F160E7C/614E60B0" Ref="U9"  Part="2" 
AR Path="/60BB0546/614E60B0" Ref="U1201"  Part="2" 
F 0 "U1201" H 6680 6046 50  0000 L CNN
F 1 "74HC259" H 6680 5955 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6500 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT259.pdf" H 6500 6000 50  0001 C CNN
	2    6500 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 614E7947
P 6500 5200
AR Path="/614E7947" Ref="U?"  Part="1" 
AR Path="/5F160E7C/614E7947" Ref="U10"  Part="2" 
AR Path="/60BB0546/614E7947" Ref="U1202"  Part="2" 
F 0 "U1202" H 6680 5246 50  0000 L CNN
F 1 "74HC541" H 6680 5155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6500 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6500 5200 50  0001 C CNN
	2    6500 5200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 614E81FB
P 7750 5200
AR Path="/614E81FB" Ref="U?"  Part="1" 
AR Path="/5F160E7C/614E81FB" Ref="U11"  Part="2" 
AR Path="/60BB0546/614E81FB" Ref="U1203"  Part="2" 
F 0 "U1203" H 7930 5246 50  0000 L CNN
F 1 "74HC541" H 7930 5155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7750 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7750 5200 50  0001 C CNN
	2    7750 5200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 614E9056
P 9000 5200
AR Path="/614E9056" Ref="U?"  Part="1" 
AR Path="/5F160E7C/614E9056" Ref="U12"  Part="2" 
AR Path="/60BB0546/614E9056" Ref="U1204"  Part="2" 
F 0 "U1204" H 9180 5246 50  0000 L CNN
F 1 "74HC541" H 9180 5155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9000 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9000 5200 50  0001 C CNN
	2    9000 5200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 614E978C
P 7750 6000
AR Path="/614E978C" Ref="U?"  Part="1" 
AR Path="/5F160E7C/614E978C" Ref="U13"  Part="2" 
AR Path="/60BB0546/614E978C" Ref="U1205"  Part="2" 
F 0 "U1205" H 7930 6046 50  0000 L CNN
F 1 "74HC541" H 7930 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7750 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7750 6000 50  0001 C CNN
	2    7750 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 614EA0D5
P 9000 6000
AR Path="/614EA0D5" Ref="U?"  Part="1" 
AR Path="/5F160E7C/614EA0D5" Ref="U14"  Part="2" 
AR Path="/60BB0546/614EA0D5" Ref="U1206"  Part="2" 
F 0 "U1206" H 9180 6046 50  0000 L CNN
F 1 "74HC541" H 9180 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9000 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9000 6000 50  0001 C CNN
	2    9000 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61575E50
P 6150 6000
AR Path="/61575E50" Ref="C?"  Part="1" 
AR Path="/5F160E7C/61575E50" Ref="C13"  Part="1" 
AR Path="/60BB0546/61575E50" Ref="C1204"  Part="1" 
F 0 "C1204" H 6059 6046 50  0000 R CNN
F 1 "100nF" H 6059 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 6000 50  0001 C CNN
F 3 "~" H 6150 6000 50  0001 C CNN
	1    6150 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 5850 6150 5900
Wire Wire Line
	6150 6100 6150 6150
$Comp
L power:GND #PWR?
U 1 1 61575E5E
P 6150 6150
AR Path="/61575E5E" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61575E5E" Ref="#PWR040"  Part="1" 
AR Path="/60BB0546/61575E5E" Ref="#PWR01215"  Part="1" 
F 0 "#PWR01215" H 6150 5900 50  0001 C CNN
F 1 "GND" H 6155 5977 50  0000 C CNN
F 2 "" H 6150 6150 50  0001 C CNN
F 3 "" H 6150 6150 50  0001 C CNN
	1    6150 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61591FAB
P 6150 5200
AR Path="/61591FAB" Ref="C?"  Part="1" 
AR Path="/5F160E7C/61591FAB" Ref="C10"  Part="1" 
AR Path="/60BB0546/61591FAB" Ref="C1201"  Part="1" 
F 0 "C1201" H 6059 5246 50  0000 R CNN
F 1 "100nF" H 6059 5155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 5200 50  0001 C CNN
F 3 "~" H 6150 5200 50  0001 C CNN
	1    6150 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 5050 6150 5100
Wire Wire Line
	6150 5300 6150 5350
$Comp
L power:GND #PWR?
U 1 1 61591FB9
P 6150 5350
AR Path="/61591FB9" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61591FB9" Ref="#PWR033"  Part="1" 
AR Path="/60BB0546/61591FB9" Ref="#PWR01208"  Part="1" 
F 0 "#PWR01208" H 6150 5100 50  0001 C CNN
F 1 "GND" H 6155 5177 50  0000 C CNN
F 2 "" H 6150 5350 50  0001 C CNN
F 3 "" H 6150 5350 50  0001 C CNN
	1    6150 5350
	1    0    0    -1  
$EndComp
Connection ~ 6150 5100
Connection ~ 6150 5300
$Comp
L Device:C_Small C?
U 1 1 615CBD52
P 7400 5200
AR Path="/615CBD52" Ref="C?"  Part="1" 
AR Path="/5F160E7C/615CBD52" Ref="C11"  Part="1" 
AR Path="/60BB0546/615CBD52" Ref="C1202"  Part="1" 
F 0 "C1202" H 7309 5246 50  0000 R CNN
F 1 "100nF" H 7309 5155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7400 5200 50  0001 C CNN
F 3 "~" H 7400 5200 50  0001 C CNN
	1    7400 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5050 7400 5100
Wire Wire Line
	7400 5300 7400 5350
$Comp
L power:GND #PWR?
U 1 1 615CBD60
P 7400 5350
AR Path="/615CBD60" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/615CBD60" Ref="#PWR034"  Part="1" 
AR Path="/60BB0546/615CBD60" Ref="#PWR01209"  Part="1" 
F 0 "#PWR01209" H 7400 5100 50  0001 C CNN
F 1 "GND" H 7405 5177 50  0000 C CNN
F 2 "" H 7400 5350 50  0001 C CNN
F 3 "" H 7400 5350 50  0001 C CNN
	1    7400 5350
	1    0    0    -1  
$EndComp
Connection ~ 7400 5100
Connection ~ 7400 5300
$Comp
L Device:C_Small C?
U 1 1 6161F947
P 8650 5200
AR Path="/6161F947" Ref="C?"  Part="1" 
AR Path="/5F160E7C/6161F947" Ref="C12"  Part="1" 
AR Path="/60BB0546/6161F947" Ref="C1203"  Part="1" 
F 0 "C1203" H 8559 5246 50  0000 R CNN
F 1 "100nF" H 8559 5155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 5200 50  0001 C CNN
F 3 "~" H 8650 5200 50  0001 C CNN
	1    8650 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5050 8650 5100
Wire Wire Line
	8650 5300 8650 5350
$Comp
L power:GND #PWR?
U 1 1 6161F955
P 8650 5350
AR Path="/6161F955" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/6161F955" Ref="#PWR035"  Part="1" 
AR Path="/60BB0546/6161F955" Ref="#PWR01210"  Part="1" 
F 0 "#PWR01210" H 8650 5100 50  0001 C CNN
F 1 "GND" H 8655 5177 50  0000 C CNN
F 2 "" H 8650 5350 50  0001 C CNN
F 3 "" H 8650 5350 50  0001 C CNN
	1    8650 5350
	1    0    0    -1  
$EndComp
Connection ~ 8650 5100
Connection ~ 8650 5300
Connection ~ 6150 5900
Connection ~ 6150 6100
$Comp
L Device:C_Small C?
U 1 1 616922C9
P 7400 6000
AR Path="/616922C9" Ref="C?"  Part="1" 
AR Path="/5F160E7C/616922C9" Ref="C14"  Part="1" 
AR Path="/60BB0546/616922C9" Ref="C1205"  Part="1" 
F 0 "C1205" H 7309 6046 50  0000 R CNN
F 1 "100nF" H 7309 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7400 6000 50  0001 C CNN
F 3 "~" H 7400 6000 50  0001 C CNN
	1    7400 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5850 7400 5900
Wire Wire Line
	7400 6100 7400 6150
$Comp
L power:GND #PWR?
U 1 1 616922D7
P 7400 6150
AR Path="/616922D7" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/616922D7" Ref="#PWR041"  Part="1" 
AR Path="/60BB0546/616922D7" Ref="#PWR01216"  Part="1" 
F 0 "#PWR01216" H 7400 5900 50  0001 C CNN
F 1 "GND" H 7405 5977 50  0000 C CNN
F 2 "" H 7400 6150 50  0001 C CNN
F 3 "" H 7400 6150 50  0001 C CNN
	1    7400 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 616AE149
P 8650 6000
AR Path="/616AE149" Ref="C?"  Part="1" 
AR Path="/5F160E7C/616AE149" Ref="C15"  Part="1" 
AR Path="/60BB0546/616AE149" Ref="C1206"  Part="1" 
F 0 "C1206" H 8559 6046 50  0000 R CNN
F 1 "100nF" H 8559 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 6000 50  0001 C CNN
F 3 "~" H 8650 6000 50  0001 C CNN
	1    8650 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5850 8650 5900
Wire Wire Line
	8650 6100 8650 6150
$Comp
L power:GND #PWR?
U 1 1 616AE157
P 8650 6150
AR Path="/616AE157" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/616AE157" Ref="#PWR042"  Part="1" 
AR Path="/60BB0546/616AE157" Ref="#PWR01217"  Part="1" 
F 0 "#PWR01217" H 8650 5900 50  0001 C CNN
F 1 "GND" H 8655 5977 50  0000 C CNN
F 2 "" H 8650 6150 50  0001 C CNN
F 3 "" H 8650 6150 50  0001 C CNN
	1    8650 6150
	1    0    0    -1  
$EndComp
Connection ~ 8650 5900
Connection ~ 8650 6100
Connection ~ 7400 5900
Connection ~ 7400 6100
$Comp
L power:+5V #PWR?
U 1 1 61714F2E
P 6150 5050
AR Path="/61714F2E" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61714F2E" Ref="#PWR028"  Part="1" 
AR Path="/60BB0546/61714F2E" Ref="#PWR01203"  Part="1" 
F 0 "#PWR01203" H 6150 4900 50  0001 C CNN
F 1 "+5V" H 6165 5223 50  0000 C CNN
F 2 "" H 6150 5050 50  0001 C CNN
F 3 "" H 6150 5050 50  0001 C CNN
	1    6150 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61730BBE
P 6150 5850
AR Path="/61730BBE" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61730BBE" Ref="#PWR037"  Part="1" 
AR Path="/60BB0546/61730BBE" Ref="#PWR01212"  Part="1" 
F 0 "#PWR01212" H 6150 5700 50  0001 C CNN
F 1 "+5V" H 6165 6023 50  0000 C CNN
F 2 "" H 6150 5850 50  0001 C CNN
F 3 "" H 6150 5850 50  0001 C CNN
	1    6150 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6174C902
P 7400 5050
AR Path="/6174C902" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/6174C902" Ref="#PWR029"  Part="1" 
AR Path="/60BB0546/6174C902" Ref="#PWR01204"  Part="1" 
F 0 "#PWR01204" H 7400 4900 50  0001 C CNN
F 1 "+5V" H 7415 5223 50  0000 C CNN
F 2 "" H 7400 5050 50  0001 C CNN
F 3 "" H 7400 5050 50  0001 C CNN
	1    7400 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61768569
P 7400 5850
AR Path="/61768569" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61768569" Ref="#PWR038"  Part="1" 
AR Path="/60BB0546/61768569" Ref="#PWR01213"  Part="1" 
F 0 "#PWR01213" H 7400 5700 50  0001 C CNN
F 1 "+5V" H 7415 6023 50  0000 C CNN
F 2 "" H 7400 5850 50  0001 C CNN
F 3 "" H 7400 5850 50  0001 C CNN
	1    7400 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61784274
P 8650 5050
AR Path="/61784274" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61784274" Ref="#PWR030"  Part="1" 
AR Path="/60BB0546/61784274" Ref="#PWR01205"  Part="1" 
F 0 "#PWR01205" H 8650 4900 50  0001 C CNN
F 1 "+5V" H 8665 5223 50  0000 C CNN
F 2 "" H 8650 5050 50  0001 C CNN
F 3 "" H 8650 5050 50  0001 C CNN
	1    8650 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6179FDD8
P 8650 5850
AR Path="/6179FDD8" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/6179FDD8" Ref="#PWR039"  Part="1" 
AR Path="/60BB0546/6179FDD8" Ref="#PWR01214"  Part="1" 
F 0 "#PWR01214" H 8650 5700 50  0001 C CNN
F 1 "+5V" H 8665 6023 50  0000 C CNN
F 2 "" H 8650 5850 50  0001 C CNN
F 3 "" H 8650 5850 50  0001 C CNN
	1    8650 5850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 618C97DD
P 4650 6100
AR Path="/618C97DD" Ref="U?"  Part="1" 
AR Path="/5F160E7C/618C97DD" Ref="U13"  Part="1" 
AR Path="/60BB0546/618C97DD" Ref="U1205"  Part="1" 
F 0 "U1205" H 4650 6867 50  0000 C CNN
F 1 "74HC541" H 4650 6776 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 6100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 6100 50  0001 C CNN
	1    4650 6100
	1    0    0    -1  
$EndComp
Text Notes 3250 2350 0    50   ~ 0
OUT IER xxxxxxxx:xxxxaaab aaa = 3bits, IRQ#, b=1 to enable\nIN IER  → 00111101:eeeeeee (e = IRQs enabled, DB0 = IRQ0)\nIN ISR  → 00111110:ssssssss (s = IRQs received)
Wire Bus Line
	6050 1150 6050 4050
Wire Bus Line
	6150 1200 6150 4050
Wire Bus Line
	8300 1200 8300 4050
Wire Wire Line
	8850 1650 8550 1650
Text Label 8550 1750 0    50   ~ 0
~IRQ4
Text Label 8550 1650 0    50   ~ 0
IEN4
Wire Wire Line
	8850 1750 8550 1750
Wire Bus Line
	8400 1150 8400 4050
Text Label 8400 2150 1    50   ~ 0
IEN[0..7]
Text Label 8300 2150 1    50   ~ 0
~IRQ[0..7]
Text Label 6050 2400 1    50   ~ 0
IEN[0..7]
Text Label 3900 900  0    50   ~ 0
~IRQ[0..7]
Text HLabel 3800 900  0    50   3State ~ 0
~IRQ[0..7]
Entry Wire Line
	4400 1050 4500 1150
Entry Wire Line
	4400 1150 4500 1250
Entry Wire Line
	4400 1250 4500 1350
Entry Wire Line
	4400 1350 4500 1450
Entry Wire Line
	4400 1450 4500 1550
Entry Wire Line
	4400 1550 4500 1650
Entry Wire Line
	4400 1650 4500 1750
Entry Wire Line
	4400 1750 4500 1850
Entry Bus Bus
	4300 900  4400 1000
Wire Bus Line
	4300 900  3800 900 
Wire Wire Line
	1350 750  1050 750 
Wire Wire Line
	1350 850  1050 850 
Text Label 1350 750  2    50   ~ 0
CLK2
Text Label 1350 850  2    50   ~ 0
CLK3
Text HLabel 1050 750  0    50   Input ~ 0
CLK2
Text HLabel 1050 850  0    50   Input ~ 0
CLK3
Wire Wire Line
	6550 1650 6250 1650
Text Label 6250 1750 0    50   ~ 0
~IRQ0
Text Label 6250 1650 0    50   ~ 0
IEN0
Wire Wire Line
	6550 1750 6250 1750
$Sheet
S 6550 2950 1150 600 
U 5FD6EACB
F0 "sheet5FD6EAC2" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 6550 3250 50 
F3 "IRF" O R 7700 3050 50 
F4 "CLK2" I L 6550 3050 50 
F5 "CLK3" I L 6550 3150 50 
F6 "~IRQ" T R 7700 3450 50 
F7 "~IRQn" I L 6550 3350 50 
$EndSheet
$Sheet
S 6550 3750 1150 600 
U 5FD6EADF
F0 "sheet5FD6EAC3" 50
F1 "irq_ff.sch" 50
F2 "IEN" I L 6550 4050 50 
F3 "IRF" O R 7700 3850 50 
F4 "CLK2" I L 6550 3850 50 
F5 "CLK3" I L 6550 3950 50 
F6 "~IRQ" T R 7700 4250 50 
F7 "~IRQn" I L 6550 4150 50 
$EndSheet
Text Label 8550 4150 0    50   ~ 0
~IRQ7
Wire Wire Line
	8850 4150 8550 4150
$Comp
L alexios:ATF16V8B U?
U 1 1 61662F3D
P -2000 600
AR Path="/5E1C970B/61662F3D" Ref="U?"  Part="1" 
AR Path="/5D121AA3/61662F3D" Ref="U?"  Part="1" 
AR Path="/60BB0546/61662F3D" Ref="U1210"  Part="1" 
F 0 "U1210" H -2000 1350 50  0000 C CNN
F 1 "ATF16V8B" H -2000 1250 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -2000 600 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -2000 600 50  0001 C CNN
F 4 "IRCDEC00" V -2000 600 50  0000 C CNB "Signature"
F 5 "irc-decode.jed" H -2000 -50 50  0000 C CNN "Image Filename"
	1    -2000 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1550 850  -1150 850 
Wire Wire Line
	-1550 150  -1150 150 
Wire Wire Line
	-1550 650  -1150 650 
Wire Wire Line
	-1550 750  -1150 750 
Wire Wire Line
	-2900 650  -2450 650 
Wire Wire Line
	-2900 750  -2450 750 
Wire Wire Line
	-2900 850  -2450 850 
Wire Wire Line
	-2850 150  -2450 150 
Wire Wire Line
	-2850 250  -2450 250 
Wire Wire Line
	-2850 350  -2450 350 
Wire Wire Line
	-2850 450  -2450 450 
Text Label -2850 650  0    50   ~ 0
~SYSDEV
Text Label -2850 750  0    50   ~ 0
~R
Text Label -2850 850  0    50   ~ 0
~W
Text Label -2850 150  0    50   ~ 0
AB3
Text Label -2850 250  0    50   ~ 0
AB4
Text Label -2850 350  0    50   ~ 0
AB5
Text Label -2850 450  0    50   ~ 0
AB6
Text Label -2850 550  0    50   ~ 0
AB7
Wire Wire Line
	-2850 550  -2450 550 
Text Label -1150 850  2    50   ~ 0
~HIEN
Text Label -1150 150  2    50   ~ 0
~RISR
Text Label -1150 650  2    50   ~ 0
~WIER
Text Label -1150 750  2    50   ~ 0
~RIER
$Comp
L power:GND #PWR?
U 1 1 61A09A13
P 2000 6400
AR Path="/61A09A13" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/61A09A13" Ref="#PWR?"  Part="1" 
AR Path="/60BB0546/61A09A13" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 2000 6150 50  0001 C CNN
F 1 "GND" H 1850 6400 50  0000 C CNN
F 2 "" H 2000 6400 50  0001 C CNN
F 3 "" H 2000 6400 50  0001 C CNN
	1    2000 6400
	1    0    0    -1  
$EndComp
Connection ~ 2000 6400
Text Label 1850 6600 0    50   ~ 0
~HIEN
Wire Wire Line
	1850 6600 2050 6600
Connection ~ 2000 5700
Wire Wire Line
	2000 5700 2000 5800
Connection ~ 2000 5800
Wire Wire Line
	2000 5800 2000 5900
$Comp
L Device:R_Network08 RN801
U 1 1 61AE8602
P 5000 1550
F 0 "RN801" V 4383 1550 50  0000 C CNN
F 1 "10kΩ" V 4474 1550 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5475 1550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5000 1550 50  0001 C CNN
	1    5000 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 1150 5450 1150
Wire Wire Line
	2050 1300 1850 1300
Text Label 1850 1300 0    50   ~ 0
AB0
Text HLabel -2950 -550 0    50   Input ~ 0
AB[0..15]
Wire Bus Line
	-2950 -550 -2350 -550
Text Label -2350 -550 2    50   ~ 0
AB[0..15]
$Comp
L alexios:ATF16V8B U?
U 2 1 60BEE894
P -2000 2250
AR Path="/5E1C970B/60BEE894" Ref="U?"  Part="1" 
AR Path="/5D121AA3/60BEE894" Ref="U?"  Part="1" 
AR Path="/60BB0546/60BEE894" Ref="U1210"  Part="2" 
F 0 "U1210" H -1820 2296 50  0000 L CNN
F 1 "ATF16V8B" H -1820 2205 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H -2000 2250 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H -2000 2250 50  0001 C CNN
F 4 "IRCDEC00" V -2000 2250 50  0001 C CNB "Signature"
F 5 "irc-decode.jed" H -2000 1600 50  0001 C CNN "Image Filename"
	2    -2000 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60BF05BC
P -2350 2250
AR Path="/60BF05BC" Ref="C?"  Part="1" 
AR Path="/5F160E7C/60BF05BC" Ref="C?"  Part="1" 
AR Path="/60BB0546/60BF05BC" Ref="C1210"  Part="1" 
F 0 "C1210" H -2441 2296 50  0000 R CNN
F 1 "100nF" H -2441 2205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -2350 2250 50  0001 C CNN
F 3 "~" H -2350 2250 50  0001 C CNN
	1    -2350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2350 2100 -2350 2150
Wire Wire Line
	-2350 2350 -2350 2400
$Comp
L power:GND #PWR?
U 1 1 60BF05C4
P -2350 2400
AR Path="/60BF05C4" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/60BF05C4" Ref="#PWR?"  Part="1" 
AR Path="/60BB0546/60BF05C4" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H -2350 2150 50  0001 C CNN
F 1 "GND" H -2345 2227 50  0000 C CNN
F 2 "" H -2350 2400 50  0001 C CNN
F 3 "" H -2350 2400 50  0001 C CNN
	1    -2350 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60BF05CC
P -2350 2100
AR Path="/60BF05CC" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/60BF05CC" Ref="#PWR?"  Part="1" 
AR Path="/60BB0546/60BF05CC" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H -2350 1950 50  0001 C CNN
F 1 "+5V" H -2335 2273 50  0000 C CNN
F 2 "" H -2350 2100 50  0001 C CNN
F 3 "" H -2350 2100 50  0001 C CNN
	1    -2350 2100
	1    0    0    -1  
$EndComp
Connection ~ -2350 2150
Connection ~ -2350 2350
Text HLabel -2900 650  0    50   Input ~ 0
~SYSDEV
Text HLabel -2900 750  0    50   Input ~ 0
~R
Text HLabel -2900 850  0    50   Input ~ 0
~W
Text Label 1850 3250 0    50   ~ 0
IRF7
Wire Wire Line
	2050 3250 1850 3250
Text Label 1850 2850 0    50   ~ 0
IRF3
Wire Wire Line
	2050 2850 1850 2850
Wire Bus Line
	10500 1550 10500 4600
Wire Bus Line
	8200 1550 8200 4600
Wire Bus Line
	4400 1000 4400 1750
Wire Bus Line
	3350 2650 3350 3450
Wire Bus Line
	3350 3650 3350 6300
Wire Bus Line
	5550 4200 5550 6500
Wire Wire Line
	10350 4550 10850 4550
$EndSCHEMATC
