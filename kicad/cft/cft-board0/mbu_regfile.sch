EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 19
Title "MBU 8×8 Register File"
Date ""
Rev "2023"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 "mbu.v"
$EndDescr
$Comp
L alexios:74HC670 U?
U 1 1 6890B0EC
P 3250 2100
AR Path="/61F95ACC/6890B0EC" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B0EC" Ref="U701"  Part="1" 
F 0 "U701" H 3250 2867 50  0000 C CNN
F 1 "74HC670" H 3250 2776 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3550 2250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 3550 2250 50  0001 C CNN
	1    3250 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 6890B0F2
P 5750 2100
AR Path="/61F95ACC/6890B0F2" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B0F2" Ref="U702"  Part="1" 
F 0 "U702" H 5750 2867 50  0000 C CNN
F 1 "74HC670" H 5750 2776 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6050 2250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 6050 2250 50  0001 C CNN
	1    5750 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 6890B0F8
P 3250 3650
AR Path="/61F95ACC/6890B0F8" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B0F8" Ref="U705"  Part="1" 
F 0 "U705" H 3250 4417 50  0000 C CNN
F 1 "74HC670" H 3250 4326 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3550 3800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 3550 3800 50  0001 C CNN
	1    3250 3650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 1 1 6890B0FE
P 5750 3650
AR Path="/61F95ACC/6890B0FE" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B0FE" Ref="U706"  Part="1" 
F 0 "U706" H 5750 4417 50  0000 C CNN
F 1 "74HC670" H 5750 4326 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6050 3800 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 6050 3800 50  0001 C CNN
	1    5750 3650
	1    0    0    -1  
$EndComp
Text Label 2450 2700 0    50   ~ 0
~REN0
Text Label 2450 4250 0    50   ~ 0
~REN0
Text Label 4950 2700 0    50   ~ 0
~REN1
Text Label 4950 4250 0    50   ~ 0
~REN1
Text Label 4950 2500 0    50   ~ 0
RA0
Text Label 4950 2600 0    50   ~ 0
RA1
Text Label 2450 2500 0    50   ~ 0
RA0
Text Label 2450 2600 0    50   ~ 0
RA1
Text Label 2450 4150 0    50   ~ 0
RA1
Text Label 2450 4050 0    50   ~ 0
RA0
Text Label 4950 4150 0    50   ~ 0
RA1
Text Label 4950 4050 0    50   ~ 0
RA0
Text Label 2450 2100 0    50   ~ 0
WA0
Text Label 2450 2200 0    50   ~ 0
WA1
Text Label 2450 2300 0    50   ~ 0
~WEN0
Text Label 2450 3650 0    50   ~ 0
WA0
Text Label 2450 3750 0    50   ~ 0
WA1
Text Label 2450 3850 0    50   ~ 0
~WEN0
Text Label 4950 2100 0    50   ~ 0
WA0
Text Label 4950 2200 0    50   ~ 0
WA1
Text Label 4950 2300 0    50   ~ 0
~WEN1
Text Label 4950 3650 0    50   ~ 0
WA0
Text Label 4950 3750 0    50   ~ 0
WA1
Text Label 4950 3850 0    50   ~ 0
~WEN1
Wire Wire Line
	5250 1600 4950 1600
Wire Wire Line
	5250 1700 4950 1700
Wire Wire Line
	5250 1800 4950 1800
Wire Wire Line
	5250 1900 4950 1900
Wire Wire Line
	5250 3150 4950 3150
Wire Wire Line
	5250 3250 4950 3250
Wire Wire Line
	5250 3350 4950 3350
Wire Wire Line
	5250 3450 4950 3450
Text Label 4100 1600 2    50   ~ 0
RD0
Text Label 4100 1700 2    50   ~ 0
RD1
Text Label 4100 1800 2    50   ~ 0
RD2
Text Label 4100 1900 2    50   ~ 0
RD3
Text Label 6600 1600 2    50   ~ 0
RD0
Text Label 6600 1700 2    50   ~ 0
RD1
Text Label 6600 1800 2    50   ~ 0
RD2
Text Label 6600 1900 2    50   ~ 0
RD3
Text Label 4100 3150 2    50   ~ 0
RD4
Text Label 4100 3250 2    50   ~ 0
RD5
Text Label 4100 3350 2    50   ~ 0
RD6
Text Label 4100 3450 2    50   ~ 0
RD7
Text Label 6600 3150 2    50   ~ 0
RD4
Text Label 6600 3250 2    50   ~ 0
RD5
Text Label 6600 3350 2    50   ~ 0
RD6
Text Label 6600 3450 2    50   ~ 0
RD7
Wire Wire Line
	3750 1600 4150 1600
Wire Wire Line
	3750 1700 4150 1700
Wire Wire Line
	3750 1800 4150 1800
Wire Wire Line
	3750 1900 4150 1900
Wire Wire Line
	3750 3150 4150 3150
Wire Wire Line
	3750 3250 4150 3250
Wire Wire Line
	3750 3350 4150 3350
Wire Wire Line
	3750 3450 4150 3450
Wire Wire Line
	6250 1600 6650 1600
Wire Wire Line
	6250 1700 6650 1700
Wire Wire Line
	6250 1800 6650 1800
Wire Wire Line
	6250 1900 6650 1900
Wire Wire Line
	6250 3150 6650 3150
Wire Wire Line
	6250 3250 6650 3250
Wire Wire Line
	6250 3350 6650 3350
Wire Wire Line
	6250 3450 6650 3450
Entry Wire Line
	4250 1500 4150 1600
Entry Wire Line
	4250 1600 4150 1700
Entry Wire Line
	4250 1700 4150 1800
Entry Wire Line
	4250 1800 4150 1900
Entry Wire Line
	4250 3050 4150 3150
Entry Wire Line
	4250 3150 4150 3250
Entry Wire Line
	4250 3250 4150 3350
Entry Wire Line
	4250 3350 4150 3450
Entry Wire Line
	6750 1500 6650 1600
Entry Wire Line
	6750 1600 6650 1700
Entry Wire Line
	6750 1700 6650 1800
Entry Wire Line
	6750 1800 6650 1900
Entry Wire Line
	6750 3050 6650 3150
Entry Wire Line
	6750 3150 6650 3250
Entry Wire Line
	6750 3250 6650 3350
Entry Wire Line
	6750 3350 6650 3450
Entry Bus Bus
	4250 1250 4350 1150
Entry Bus Bus
	6650 1150 6750 1250
Wire Bus Line
	6650 1150 4350 1150
Text Label 4250 2400 1    50   ~ 0
RD[0..7]
Text Label 6750 2400 1    50   ~ 0
RD[0..7]
Text Label 1300 1600 0    50   ~ 0
D0
Text Label 1300 1700 0    50   ~ 0
D1
Text Label 1300 1800 0    50   ~ 0
D2
Text Label 1300 1900 0    50   ~ 0
D3
Text Label 1300 3150 0    50   ~ 0
D4
Text Label 1300 3250 0    50   ~ 0
D5
Text Label 1300 3350 0    50   ~ 0
D6
Text Label 1300 3450 0    50   ~ 0
D7
Wire Wire Line
	1250 1600 2750 1600
Wire Wire Line
	1250 1700 2750 1700
Wire Wire Line
	1250 1800 2750 1800
Wire Wire Line
	1250 1900 2750 1900
Wire Wire Line
	1250 3150 2750 3150
Wire Wire Line
	1250 3250 2750 3250
Wire Wire Line
	1250 3350 2750 3350
Wire Wire Line
	1250 3450 2750 3450
Text HLabel 1250 1600 0    50   Input ~ 0
D0
Text HLabel 1250 1700 0    50   Input ~ 0
D1
Text HLabel 1250 1800 0    50   Input ~ 0
D2
Text HLabel 1250 1900 0    50   Input ~ 0
D3
Text HLabel 1250 3150 0    50   Input ~ 0
D4
Text HLabel 1250 3250 0    50   Input ~ 0
D5
Text HLabel 1250 3350 0    50   Input ~ 0
D6
Text HLabel 1250 3450 0    50   Input ~ 0
D7
Text HLabel 1250 4600 0    50   Input ~ 0
WA0
Text HLabel 1250 4700 0    50   Input ~ 0
WA1
Text HLabel 1250 4800 0    50   Input ~ 0
~WEN0
Text HLabel 1250 4900 0    50   Input ~ 0
~WEN1
Text HLabel 1250 5000 0    50   Input ~ 0
RA0
Text HLabel 1250 5100 0    50   Input ~ 0
RA1
Text HLabel 1250 5200 0    50   Input ~ 0
~REN0
Text HLabel 1250 5300 0    50   Input ~ 0
~REN1
Text HLabel 1250 5400 0    50   Input ~ 0
~EN
Wire Wire Line
	1250 4600 1900 4600
Wire Wire Line
	1250 4800 2100 4800
Wire Wire Line
	1250 4900 4550 4900
Wire Wire Line
	1250 5000 2200 5000
Wire Wire Line
	1250 5100 2300 5100
Wire Wire Line
	1250 5200 2400 5200
Text HLabel 1250 5500 0    50   Input ~ 0
ROM
Wire Wire Line
	2400 4250 2400 5200
Wire Wire Line
	2400 4250 2750 4250
Wire Wire Line
	2400 2700 2400 4250
Wire Wire Line
	2400 2700 2750 2700
Connection ~ 2400 4250
Wire Wire Line
	2300 2600 2300 4150
Wire Wire Line
	2300 2600 2750 2600
Connection ~ 2300 5100
Wire Wire Line
	2300 5100 4750 5100
Wire Wire Line
	2300 4150 2750 4150
Connection ~ 2300 4150
Wire Wire Line
	2300 4150 2300 5100
Wire Wire Line
	2200 2500 2200 4050
Wire Wire Line
	2200 2500 2750 2500
Connection ~ 2200 5000
Wire Wire Line
	2200 5000 4650 5000
Wire Wire Line
	2200 4050 2750 4050
Connection ~ 2200 4050
Wire Wire Line
	2200 4050 2200 5000
Wire Wire Line
	2100 3850 2100 4800
Wire Wire Line
	2100 3850 2750 3850
Wire Wire Line
	2000 3750 2000 4700
Wire Wire Line
	2000 3750 2750 3750
Connection ~ 2000 4700
Wire Wire Line
	2000 4700 4450 4700
Wire Wire Line
	1900 3650 2750 3650
Wire Wire Line
	1250 4700 2000 4700
Wire Wire Line
	1900 3650 1900 4600
Connection ~ 1900 4600
Wire Wire Line
	1900 4600 4350 4600
Wire Wire Line
	1900 3650 1900 2100
Wire Wire Line
	1900 2100 2750 2100
Connection ~ 1900 3650
Wire Wire Line
	2000 2200 2000 3750
Wire Wire Line
	2000 2200 2750 2200
Connection ~ 2000 3750
Wire Wire Line
	2100 2300 2100 3850
Wire Wire Line
	2100 2300 2750 2300
Connection ~ 2100 3850
Wire Wire Line
	4850 2700 5250 2700
Wire Wire Line
	4650 2500 5250 2500
Wire Wire Line
	4750 2600 5250 2600
Wire Wire Line
	4550 2300 5250 2300
Wire Wire Line
	4450 2200 5250 2200
Wire Wire Line
	4350 2100 5250 2100
Text Label 2450 1600 0    50   ~ 0
D0
Text Label 2450 1700 0    50   ~ 0
D1
Text Label 2450 1800 0    50   ~ 0
D2
Text Label 2450 1900 0    50   ~ 0
D3
Text Label 2450 3150 0    50   ~ 0
D4
Text Label 2450 3250 0    50   ~ 0
D5
Text Label 2450 3350 0    50   ~ 0
D6
Text Label 2450 3450 0    50   ~ 0
D7
Text Label 4950 1600 0    50   ~ 0
D0
Text Label 4950 1700 0    50   ~ 0
D1
Text Label 4950 1800 0    50   ~ 0
D2
Text Label 4950 1900 0    50   ~ 0
D3
Text Label 4950 3150 0    50   ~ 0
D4
Text Label 4950 3250 0    50   ~ 0
D5
Text Label 4950 3350 0    50   ~ 0
D6
Text Label 4950 3450 0    50   ~ 0
D7
Wire Wire Line
	1250 5300 4850 5300
Wire Wire Line
	4850 2700 4850 4250
Wire Wire Line
	4850 4250 5250 4250
Connection ~ 4850 4250
Wire Wire Line
	4850 4250 4850 5300
Wire Wire Line
	4750 2600 4750 4150
Wire Wire Line
	4650 2500 4650 4050
Wire Wire Line
	4550 2300 4550 3850
Wire Wire Line
	4550 3850 5250 3850
Connection ~ 4550 3850
Wire Wire Line
	4550 3850 4550 4900
Wire Wire Line
	4350 2100 4350 3650
Wire Wire Line
	4450 2200 4450 3750
Wire Wire Line
	4350 3650 5250 3650
Connection ~ 4350 3650
Wire Wire Line
	4350 3650 4350 4600
Wire Wire Line
	4450 3750 5250 3750
Connection ~ 4450 3750
Wire Wire Line
	4450 3750 4450 4700
Wire Wire Line
	4650 4050 5250 4050
Connection ~ 4650 4050
Wire Wire Line
	4650 4050 4650 5000
Wire Wire Line
	4750 4150 5250 4150
Connection ~ 4750 4150
Wire Wire Line
	4750 4150 4750 5100
Wire Wire Line
	7050 3250 7650 3250
Wire Wire Line
	7050 5500 7050 3250
Wire Wire Line
	1250 5500 7050 5500
Connection ~ 6950 3350
Wire Wire Line
	6950 2500 7500 2500
Wire Wire Line
	6950 2500 6950 3350
Wire Wire Line
	6950 3350 7650 3350
Wire Wire Line
	6950 3350 6950 5400
Text HLabel 9950 3150 2    50   Output ~ 0
AEXT7
Text HLabel 9950 2200 2    50   Output ~ 0
AEXT6
Text HLabel 9950 2100 2    50   Output ~ 0
AEXT5
Text HLabel 9950 2000 2    50   Output ~ 0
AEXT4
Text HLabel 9950 1900 2    50   Output ~ 0
AEXT3
Text HLabel 9950 1800 2    50   Output ~ 0
AEXT2
Text HLabel 9950 1700 2    50   Output ~ 0
AEXT1
Text HLabel 9950 1600 2    50   Output ~ 0
AEXT0
Wire Wire Line
	8800 2200 9950 2200
Wire Wire Line
	8900 2100 9950 2100
Wire Wire Line
	9000 2000 9950 2000
Wire Wire Line
	9100 1900 9950 1900
Wire Wire Line
	9200 1800 9950 1800
Wire Wire Line
	9300 1700 9950 1700
Wire Wire Line
	9400 1600 9950 1600
Wire Wire Line
	1250 5400 6950 5400
Entry Wire Line
	6750 3050 6850 3150
Entry Wire Line
	6750 2100 6850 2200
Entry Wire Line
	6750 2000 6850 2100
Entry Wire Line
	6750 1900 6850 2000
Entry Wire Line
	6750 1800 6850 1900
Entry Wire Line
	6750 1700 6850 1800
Entry Wire Line
	6750 1600 6850 1700
Entry Wire Line
	6750 1500 6850 1600
Text Label 9900 3150 2    50   ~ 0
AEXT7
Text Label 9900 2200 2    50   ~ 0
AEXT6
Text Label 9900 2100 2    50   ~ 0
AEXT5
Text Label 9900 2000 2    50   ~ 0
AEXT4
Text Label 9900 1900 2    50   ~ 0
AEXT3
Text Label 9900 1800 2    50   ~ 0
AEXT2
Text Label 9900 1700 2    50   ~ 0
AEXT1
Text Label 9900 1600 2    50   ~ 0
AEXT0
Wire Wire Line
	8350 3150 9950 3150
Text Label 8550 1600 0    50   ~ 0
AEXT0
Text Label 8550 1700 0    50   ~ 0
AEXT1
Text Label 8550 1800 0    50   ~ 0
AEXT2
Text Label 8550 1900 0    50   ~ 0
AEXT3
Text Label 8550 2000 0    50   ~ 0
AEXT4
Text Label 8550 2100 0    50   ~ 0
AEXT5
Text Label 8550 2200 0    50   ~ 0
AEXT6
$Comp
L power:GND #PWR?
U 1 1 6890B205
P 9400 2700
AR Path="/61F95ACC/6890B205" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B205" Ref="#PWR0702"  Part="1" 
F 0 "#PWR0702" H 9400 2450 50  0001 C CNN
F 1 "GND" H 9405 2527 50  0000 C CNN
F 2 "" H 9400 2700 50  0001 C CNN
F 3 "" H 9400 2700 50  0001 C CNN
	1    9400 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2300 8800 2200
Wire Wire Line
	8900 2300 8900 2100
Wire Wire Line
	9000 2300 9000 2000
Wire Wire Line
	9100 2300 9100 1900
Wire Wire Line
	9200 2300 9200 1800
Wire Wire Line
	9300 2300 9300 1700
Wire Wire Line
	9400 2300 9400 1600
Connection ~ 8800 2200
Connection ~ 8900 2100
Connection ~ 9000 2000
Connection ~ 9100 1900
Connection ~ 9200 1800
Connection ~ 9300 1700
Connection ~ 9400 1600
Wire Wire Line
	8500 2200 8800 2200
Wire Wire Line
	8500 2100 8900 2100
Wire Wire Line
	8500 2000 9000 2000
Wire Wire Line
	8500 1900 9100 1900
Wire Wire Line
	8500 1800 9200 1800
Wire Wire Line
	8500 1700 9300 1700
Wire Wire Line
	8500 1600 9400 1600
$Comp
L alexios:74AC541 U?
U 1 1 6890B1A8
P 8000 2100
AR Path="/61F95ACC/6890B1A8" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B1A8" Ref="U703"  Part="1" 
F 0 "U703" H 8000 2867 50  0000 C CNN
F 1 "74AC541" H 8000 2776 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8000 2100 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 8000 2100 50  0001 C CNN
	1    8000 2100
	1    0    0    -1  
$EndComp
Text Label 7200 1600 0    50   ~ 0
RD0
Text Label 7200 1700 0    50   ~ 0
RD1
Text Label 7200 1800 0    50   ~ 0
RD2
Text Label 7200 1900 0    50   ~ 0
RD3
Text Label 7200 2000 0    50   ~ 0
RD4
Text Label 7200 2100 0    50   ~ 0
RD5
Text Label 7200 2200 0    50   ~ 0
RD6
$Comp
L power:GND #PWR?
U 1 1 6890B193
P 7450 2650
AR Path="/61F95ACC/6890B193" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B193" Ref="#PWR0701"  Part="1" 
F 0 "#PWR0701" H 7450 2400 50  0001 C CNN
F 1 "GND" H 7455 2477 50  0000 C CNN
F 2 "" H 7450 2650 50  0001 C CNN
F 3 "" H 7450 2650 50  0001 C CNN
	1    7450 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2600 7450 2600
Wire Wire Line
	7450 2600 7450 2650
NoConn ~ 8500 2300
Wire Wire Line
	7500 2300 7450 2300
Wire Wire Line
	7450 2300 7450 2600
Connection ~ 7450 2600
Text Label 7200 2500 0    50   ~ 0
~EN
$Comp
L alexios:74LVC2G157 U?
U 1 1 6890B185
P 8000 3250
AR Path="/61F95ACC/6890B185" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B185" Ref="U704"  Part="1" 
F 0 "U704" H 8000 3617 50  0000 C CNN
F 1 "74LVC2G157" H 8000 3526 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 7900 3375 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 7900 3375 50  0001 C CNN
	1    8000 3250
	1    0    0    -1  
$EndComp
Text Label 8550 3150 0    50   ~ 0
AEXT7
$Comp
L power:GND #PWR?
U 1 1 6890B17C
P 7600 3500
AR Path="/61F95ACC/6890B17C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6890B17C" Ref="#PWR0703"  Part="1" 
F 0 "#PWR0703" H 7600 3250 50  0001 C CNN
F 1 "GND" H 7605 3327 50  0000 C CNN
F 2 "" H 7600 3500 50  0001 C CNN
F 3 "" H 7600 3500 50  0001 C CNN
	1    7600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3450 7600 3450
Wire Wire Line
	7600 3450 7600 3500
Text Label 7200 3150 0    50   ~ 0
RD7
Text Label 7200 3250 0    50   ~ 0
ROM
Text Label 7200 3350 0    50   ~ 0
~EN
Wire Wire Line
	7500 1600 6850 1600
Wire Wire Line
	7500 1700 6850 1700
Wire Wire Line
	7500 1800 6850 1800
Wire Wire Line
	7500 1900 6850 1900
Wire Wire Line
	7500 2000 6850 2000
Wire Wire Line
	7500 2100 6850 2100
Wire Wire Line
	7500 2200 6850 2200
Wire Wire Line
	7650 3150 6850 3150
$Comp
L power:GND #PWR?
U 1 1 6C0B47D9
P 1000 6600
AR Path="/6C0B47D9" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0B47D9" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0B47D9" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0B47D9" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0B47D9" Ref="#PWR0709"  Part="1" 
F 0 "#PWR0709" H 1000 6350 50  0001 C CNN
F 1 "GND" H 1005 6427 50  0000 C CNN
F 2 "" H 1000 6600 50  0001 C CNN
F 3 "" H 1000 6600 50  0001 C CNN
	1    1000 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C0B47DF
P 1000 6400
AR Path="/6C0B47DF" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0B47DF" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0B47DF" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0B47DF" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0B47DF" Ref="#PWR0706"  Part="1" 
F 0 "#PWR0706" H 1000 6250 50  0001 C CNN
F 1 "+5V" H 1015 6573 50  0000 C CNN
F 2 "" H 1000 6400 50  0001 C CNN
F 3 "" H 1000 6400 50  0001 C CNN
	1    1000 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C0B47E5
P 1000 6500
AR Path="/5CC0D65F/6C0B47E5" Ref="C?"  Part="1" 
AR Path="/6C0B47E5" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C0B47E5" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C0B47E5" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0B47E5" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0B47E5" Ref="C701"  Part="1" 
F 0 "C701" H 909 6546 50  0000 R CNN
F 1 "100nF" H 909 6455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 6500 50  0001 C CNN
F 3 "~" H 1000 6500 50  0001 C CNN
	1    1000 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C0BBC9D
P 1000 7300
AR Path="/6C0BBC9D" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0BBC9D" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0BBC9D" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0BBC9D" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0BBC9D" Ref="#PWR0715"  Part="1" 
F 0 "#PWR0715" H 1000 7050 50  0001 C CNN
F 1 "GND" H 1005 7127 50  0000 C CNN
F 2 "" H 1000 7300 50  0001 C CNN
F 3 "" H 1000 7300 50  0001 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C0BBCA3
P 1000 7100
AR Path="/6C0BBCA3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0BBCA3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0BBCA3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0BBCA3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0BBCA3" Ref="#PWR0712"  Part="1" 
F 0 "#PWR0712" H 1000 6950 50  0001 C CNN
F 1 "+5V" H 1015 7273 50  0000 C CNN
F 2 "" H 1000 7100 50  0001 C CNN
F 3 "" H 1000 7100 50  0001 C CNN
	1    1000 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C0BBCA9
P 1000 7200
AR Path="/5CC0D65F/6C0BBCA9" Ref="C?"  Part="1" 
AR Path="/6C0BBCA9" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C0BBCA9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C0BBCA9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0BBCA9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0BBCA9" Ref="C704"  Part="1" 
F 0 "C704" H 909 7246 50  0000 R CNN
F 1 "100nF" H 909 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1000 7200 50  0001 C CNN
F 3 "~" H 1000 7200 50  0001 C CNN
	1    1000 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 2 1 6C0C214F
P 1350 7600
AR Path="/61F95ACC/6C0C214F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C214F" Ref="U705"  Part="2" 
F 0 "U705" H 1530 8046 50  0000 L CNN
F 1 "74HC670" H 1530 7955 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1650 7750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 1650 7750 50  0001 C CNN
	2    1350 7600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 2 1 6C0C2641
P 1350 6900
AR Path="/61F95ACC/6C0C2641" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C2641" Ref="U701"  Part="2" 
F 0 "U701" H 1530 7346 50  0000 L CNN
F 1 "74HC670" H 1530 7255 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1650 7050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 1650 7050 50  0001 C CNN
	2    1350 6900
	1    0    0    -1  
$EndComp
Connection ~ 1000 6400
Connection ~ 1000 6600
Connection ~ 1000 7100
Connection ~ 1000 7300
$Comp
L power:GND #PWR?
U 1 1 6C0C6E18
P 2450 7300
AR Path="/6C0C6E18" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0C6E18" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0C6E18" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0C6E18" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E18" Ref="#PWR0716"  Part="1" 
F 0 "#PWR0716" H 2450 7050 50  0001 C CNN
F 1 "GND" H 2455 7127 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 6C0CE280
P 4250 6500
AR Path="/61F95ACC/6C0CE280" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0CE280" Ref="U703"  Part="2" 
F 0 "U703" H 4430 6546 50  0000 L CNN
F 1 "74AC541" H 4430 6455 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4250 6500 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 4250 6500 50  0001 C CNN
	2    4250 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC2G157 U?
U 2 1 6C0CE793
P 4250 7200
AR Path="/61F95ACC/6C0CE793" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0CE793" Ref="U704"  Part="2" 
F 0 "U704" H 4430 7246 50  0000 L CNN
F 1 "74LVC2G157" H 4430 7155 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4150 7325 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 4150 7325 50  0001 C CNN
	2    4250 7200
	1    0    0    -1  
$EndComp
Connection ~ 2450 7300
Connection ~ 2450 7100
Connection ~ 2450 6600
Connection ~ 2450 6400
$Comp
L alexios:74HC670 U?
U 2 1 6C0C6E30
P 2800 6900
AR Path="/61F95ACC/6C0C6E30" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E30" Ref="U702"  Part="2" 
F 0 "U702" H 2980 7346 50  0000 L CNN
F 1 "74HC670" H 2980 7255 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3100 7050 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 3100 7050 50  0001 C CNN
	2    2800 6900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U?
U 2 1 6C0C6E2A
P 2800 7600
AR Path="/61F95ACC/6C0C6E2A" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E2A" Ref="U706"  Part="2" 
F 0 "U706" H 2980 8046 50  0000 L CNN
F 1 "74HC670" H 2980 7955 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3100 7750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 3100 7750 50  0001 C CNN
	2    2800 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C0C6E24
P 2450 7200
AR Path="/5CC0D65F/6C0C6E24" Ref="C?"  Part="1" 
AR Path="/6C0C6E24" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C0C6E24" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C0C6E24" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0C6E24" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E24" Ref="C705"  Part="1" 
F 0 "C705" H 2359 7246 50  0000 R CNN
F 1 "100nF" H 2359 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7200 50  0001 C CNN
F 3 "~" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C0C6E1E
P 2450 7100
AR Path="/6C0C6E1E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0C6E1E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0C6E1E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0C6E1E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E1E" Ref="#PWR0713"  Part="1" 
F 0 "#PWR0713" H 2450 6950 50  0001 C CNN
F 1 "+5V" H 2465 7273 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C0C6E12
P 2450 6500
AR Path="/5CC0D65F/6C0C6E12" Ref="C?"  Part="1" 
AR Path="/6C0C6E12" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C0C6E12" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C0C6E12" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0C6E12" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E12" Ref="C702"  Part="1" 
F 0 "C702" H 2359 6546 50  0000 R CNN
F 1 "100nF" H 2359 6455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 6500 50  0001 C CNN
F 3 "~" H 2450 6500 50  0001 C CNN
	1    2450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C0C6E0C
P 2450 6400
AR Path="/6C0C6E0C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0C6E0C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0C6E0C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0C6E0C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E0C" Ref="#PWR0707"  Part="1" 
F 0 "#PWR0707" H 2450 6250 50  0001 C CNN
F 1 "+5V" H 2465 6573 50  0000 C CNN
F 2 "" H 2450 6400 50  0001 C CNN
F 3 "" H 2450 6400 50  0001 C CNN
	1    2450 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C0C6E06
P 2450 6600
AR Path="/6C0C6E06" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0C6E06" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0C6E06" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0C6E06" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0C6E06" Ref="#PWR0710"  Part="1" 
F 0 "#PWR0710" H 2450 6350 50  0001 C CNN
F 1 "GND" H 2455 6427 50  0000 C CNN
F 2 "" H 2450 6600 50  0001 C CNN
F 3 "" H 2450 6600 50  0001 C CNN
	1    2450 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C0EABAE
P 3900 7300
AR Path="/6C0EABAE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0EABAE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0EABAE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0EABAE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0EABAE" Ref="#PWR0717"  Part="1" 
F 0 "#PWR0717" H 3900 7050 50  0001 C CNN
F 1 "GND" H 3905 7127 50  0000 C CNN
F 2 "" H 3900 7300 50  0001 C CNN
F 3 "" H 3900 7300 50  0001 C CNN
	1    3900 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C0EABC4
P 3900 7200
AR Path="/5CC0D65F/6C0EABC4" Ref="C?"  Part="1" 
AR Path="/6C0EABC4" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C0EABC4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C0EABC4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0EABC4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0EABC4" Ref="C706"  Part="1" 
F 0 "C706" H 3809 7246 50  0000 R CNN
F 1 "100nF" H 3809 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 7200 50  0001 C CNN
F 3 "~" H 3900 7200 50  0001 C CNN
	1    3900 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C0EABCA
P 3900 7100
AR Path="/6C0EABCA" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0EABCA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0EABCA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0EABCA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0EABCA" Ref="#PWR0714"  Part="1" 
F 0 "#PWR0714" H 3900 6950 50  0001 C CNN
F 1 "+5V" H 3915 7273 50  0000 C CNN
F 2 "" H 3900 7100 50  0001 C CNN
F 3 "" H 3900 7100 50  0001 C CNN
	1    3900 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6C0EABD0
P 3900 6500
AR Path="/5CC0D65F/6C0EABD0" Ref="C?"  Part="1" 
AR Path="/6C0EABD0" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6C0EABD0" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6C0EABD0" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0EABD0" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0EABD0" Ref="C703"  Part="1" 
F 0 "C703" H 3809 6546 50  0000 R CNN
F 1 "100nF" H 3809 6455 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3900 6500 50  0001 C CNN
F 3 "~" H 3900 6500 50  0001 C CNN
	1    3900 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6C0EABD6
P 3900 6400
AR Path="/6C0EABD6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0EABD6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0EABD6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0EABD6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0EABD6" Ref="#PWR0708"  Part="1" 
F 0 "#PWR0708" H 3900 6250 50  0001 C CNN
F 1 "+5V" H 3915 6573 50  0000 C CNN
F 2 "" H 3900 6400 50  0001 C CNN
F 3 "" H 3900 6400 50  0001 C CNN
	1    3900 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6C0EABDC
P 3900 6600
AR Path="/6C0EABDC" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6C0EABDC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6C0EABDC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6AF25BF3/6C0EABDC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6888FBA2/6C0EABDC" Ref="#PWR0711"  Part="1" 
F 0 "#PWR0711" H 3900 6350 50  0001 C CNN
F 1 "GND" H 3905 6427 50  0000 C CNN
F 2 "" H 3900 6600 50  0001 C CNN
F 3 "" H 3900 6600 50  0001 C CNN
	1    3900 6600
	1    0    0    -1  
$EndComp
Connection ~ 3900 6600
Connection ~ 3900 6400
Connection ~ 3900 7300
Connection ~ 3900 7100
Text Label 1350 4600 0    50   ~ 0
WA0
Text Label 1350 4700 0    50   ~ 0
WA1
Text Label 1350 4800 0    50   ~ 0
~WEN0
Text Label 1350 4900 0    50   ~ 0
~WEN1
Text Label 1350 5000 0    50   ~ 0
RA0
Text Label 1350 5100 0    50   ~ 0
RA1
Text Label 1350 5200 0    50   ~ 0
~REN0
Text Label 1350 5300 0    50   ~ 0
~REN1
Text Label 1350 5400 0    50   ~ 0
~EN
Text Label 1350 5500 0    50   ~ 0
ROM
Text Label 3900 4600 0    50   ~ 0
WA0
Text Label 3900 4700 0    50   ~ 0
WA1
Text Label 3900 4900 0    50   ~ 0
~WEN1
Text Label 3900 5000 0    50   ~ 0
RA0
Text Label 3900 5100 0    50   ~ 0
RA1
Text Label 3900 5300 0    50   ~ 0
~REN1
Text Label 3900 5400 0    50   ~ 0
~EN
Text Label 3900 5500 0    50   ~ 0
ROM
Text Label 7050 4900 1    50   ~ 0
ROM
Text Label 6950 4900 1    50   ~ 0
~EN
Text Notes 7700 1000 0    100  ~ 20
Tri-Stating
Text Notes 5350 1000 0    100  ~ 20
Registers 4–7
Text Notes 2750 1000 0    100  ~ 20
Registers 0–3\n
Text Notes 8150 6350 0    50   ~ 0
The Register file is made of of 2×2 array of 4×4-bit\n74HC670 register files. They can be read from and\nwritten to simultaneously, though this doesn't happen\non the CFT.\n\nA buffer allows the output of the register file to be\ntri-stated. Pull-down resistors and a multiplexer\nallow the register files to be disabled until needed.\n\nIn that case, AEXT will be hardwired to either &00\nor &80, depending on the state of the RAM/ROM\nswitch on the front panel.
NoConn ~ 8350 3450
NoConn ~ 8700 2300
$Comp
L Device:R_Network08 RN701
U 1 1 63261A91
P 9000 2500
F 0 "RN701" H 8520 2454 50  0000 R CNN
F 1 "10kΩ" H 8520 2545 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9475 2500 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9000 2500 50  0001 C CNN
	1    9000 2500
	-1   0    0    1   
$EndComp
Wire Bus Line
	6750 1250 6750 3350
Wire Bus Line
	4250 1250 4250 3350
$EndSCHEMATC
