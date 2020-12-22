EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 15
Title "Right Expansion Slot"
Date "2019-11-17"
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2700 1800 2300 1800
Wire Wire Line
	2700 2000 2300 2000
Wire Wire Line
	2700 2100 2300 2100
Wire Wire Line
	2700 2200 2300 2200
Wire Wire Line
	2700 2300 2300 2300
Wire Wire Line
	2700 2400 2300 2400
Wire Wire Line
	2700 2500 2300 2500
Wire Wire Line
	2700 2600 2300 2600
Wire Wire Line
	2700 2700 2300 2700
Wire Wire Line
	3900 1800 4300 1800
Wire Wire Line
	3900 1900 4300 1900
Wire Wire Line
	3900 2000 4300 2000
Wire Wire Line
	3900 2100 4300 2100
Wire Wire Line
	3900 2200 4300 2200
Wire Wire Line
	3900 2500 4300 2500
Wire Wire Line
	3900 2600 4300 2600
Wire Wire Line
	3900 2700 4300 2700
Wire Wire Line
	3900 2800 4400 2800
Wire Wire Line
	3900 2900 4400 2900
Wire Wire Line
	3900 3000 4400 3000
Wire Wire Line
	3900 3100 4400 3100
Wire Wire Line
	3900 3200 4400 3200
Wire Wire Line
	3900 3300 4400 3300
Wire Wire Line
	3900 3400 4400 3400
Wire Wire Line
	3900 3500 4400 3500
Wire Wire Line
	5050 3500 5450 3500
Wire Wire Line
	5050 3600 5450 3600
Wire Wire Line
	5050 3700 5450 3700
Wire Wire Line
	5050 3800 5450 3800
Wire Wire Line
	5050 3900 5450 3900
Wire Wire Line
	5050 4000 5450 4000
Wire Wire Line
	5050 4100 5450 4100
Wire Wire Line
	5050 4200 5450 4200
Wire Wire Line
	6650 2000 7000 2000
Text Label 2300 1800 0    50   ~ 0
~RESET
Text Label 2300 2000 0    50   ~ 0
CLK1
Text Label 2300 2100 0    50   ~ 0
CLK2
Text Label 2300 2200 0    50   ~ 0
CLK3
Text Label 2300 2300 0    50   ~ 0
CLK4
Text Label 2300 2400 0    50   ~ 0
WSTB
Text Label 2300 2500 0    50   ~ 0
T34
Text Label 2300 2600 0    50   ~ 0
~IRQ
Text Label 2300 2700 0    50   ~ 0
~IRQS
Text Label 4300 1800 2    50   ~ 0
~RSTHOLD
Text Label 4300 1900 2    50   ~ 0
~SYSDEV
Text Label 4300 2000 2    50   ~ 0
~IODEV1xx
Text Label 4300 2100 2    50   ~ 0
~IODEV2xx
Text Label 4300 2200 2    50   ~ 0
~IODEV3xx
Text Label 4300 2500 2    50   ~ 0
~R
Text Label 4300 2600 2    50   ~ 0
~W
Text Label 4300 2700 2    50   ~ 0
~WS
Text Label 4300 2800 2    50   ~ 0
~IRQ0
Text Label 4300 2900 2    50   ~ 0
~IRQ1
Text Label 4300 3000 2    50   ~ 0
~IRQ2
Text Label 4300 3100 2    50   ~ 0
~IRQ3
Text Label 4300 3200 2    50   ~ 0
~IRQ4
Text Label 4300 3300 2    50   ~ 0
~IRQ5
Text Label 4300 3400 2    50   ~ 0
~IRQ6
Text Label 4300 3500 2    50   ~ 0
~IRQ7
Text Label 5050 3500 0    50   ~ 0
FPD0
Text Label 5050 3600 0    50   ~ 0
FPD1
Text Label 5050 3700 0    50   ~ 0
FPD2
Text Label 5050 3800 0    50   ~ 0
FPD3
Text Label 5050 3900 0    50   ~ 0
FPD4
Text Label 5050 4000 0    50   ~ 0
FPD5
Text Label 5050 4100 0    50   ~ 0
FPD6
Text Label 5050 4200 0    50   ~ 0
FPD7
Text Label 7000 2000 2    50   ~ 0
~HALT
Wire Wire Line
	2700 2800 2300 2800
Wire Wire Line
	2700 2900 2300 2900
Wire Wire Line
	2700 3000 2300 3000
Wire Wire Line
	2700 3100 2300 3100
Wire Wire Line
	2700 3200 2300 3200
Wire Wire Line
	2700 3300 2300 3300
Wire Wire Line
	2700 3400 2300 3400
Wire Wire Line
	2700 3500 2300 3500
Text Label 2300 2800 0    50   ~ 0
AB0
Text Label 2300 2900 0    50   ~ 0
AB1
Text Label 2300 3000 0    50   ~ 0
AB2
Text Label 2300 3100 0    50   ~ 0
AB3
Text Label 2300 3200 0    50   ~ 0
AB4
Text Label 2300 3300 0    50   ~ 0
AB5
Text Label 2300 3400 0    50   ~ 0
AB6
Text Label 2300 3500 0    50   ~ 0
AB7
Entry Wire Line
	2200 2900 2300 2800
Entry Wire Line
	2200 3000 2300 2900
Entry Wire Line
	2200 3100 2300 3000
Entry Wire Line
	2200 3200 2300 3100
Entry Wire Line
	2200 3300 2300 3200
Entry Wire Line
	2200 3400 2300 3300
Entry Wire Line
	2200 3500 2300 3400
Entry Wire Line
	2200 3600 2300 3500
Wire Bus Line
	1500 5500 4300 5500
Text Label 1600 5500 0    50   ~ 0
DB[0..15]
Text HLabel 1500 5500 0    50   UnSpc ~ 0
DB[0..15]
Wire Wire Line
	3900 3600 4300 3600
Wire Wire Line
	3900 3700 4300 3700
Wire Wire Line
	3900 3800 4300 3800
Wire Wire Line
	3900 3900 4300 3900
Wire Wire Line
	3900 4000 4300 4000
Wire Wire Line
	3900 4100 4300 4100
Wire Wire Line
	3900 4200 4300 4200
Wire Wire Line
	3900 4300 4300 4300
Wire Wire Line
	3900 4400 4300 4400
Wire Wire Line
	3900 4500 4300 4500
Wire Wire Line
	3900 4600 4300 4600
Wire Wire Line
	3900 4700 4300 4700
Wire Wire Line
	3900 4800 4300 4800
Wire Wire Line
	3900 4900 4300 4900
Wire Wire Line
	3900 5000 4300 5000
Wire Wire Line
	3900 5100 4300 5100
Text Label 4300 3600 2    50   ~ 0
DB0
Text Label 4300 3700 2    50   ~ 0
DB1
Text Label 4300 3800 2    50   ~ 0
DB2
Text Label 4300 3900 2    50   ~ 0
DB3
Text Label 4300 4000 2    50   ~ 0
DB4
Text Label 4300 4100 2    50   ~ 0
DB5
Text Label 4300 4200 2    50   ~ 0
DB6
Text Label 4300 4300 2    50   ~ 0
DB7
Text Label 4300 4400 2    50   ~ 0
DB8
Text Label 4300 4500 2    50   ~ 0
DB9
Text Label 4300 4600 2    50   ~ 0
DB10
Text Label 4300 4700 2    50   ~ 0
DB11
Text Label 4300 4800 2    50   ~ 0
DB12
Text Label 4300 4900 2    50   ~ 0
DB13
Text Label 4300 5000 2    50   ~ 0
DB14
Text Label 4300 5100 2    50   ~ 0
DB15
Entry Wire Line
	4400 3700 4300 3600
Entry Wire Line
	4400 3800 4300 3700
Entry Wire Line
	4400 3900 4300 3800
Entry Wire Line
	4400 4000 4300 3900
Entry Wire Line
	4400 4100 4300 4000
Entry Wire Line
	4400 4200 4300 4100
Entry Wire Line
	4400 4300 4300 4200
Entry Wire Line
	4400 4400 4300 4300
Entry Wire Line
	4400 4500 4300 4400
Entry Wire Line
	4400 4600 4300 4500
Entry Wire Line
	4400 4700 4300 4600
Entry Wire Line
	4400 4800 4300 4700
Entry Wire Line
	4400 4900 4300 4800
Entry Wire Line
	4400 5000 4300 4900
Entry Wire Line
	4400 5100 4300 5000
Entry Wire Line
	4400 5200 4300 5100
Entry Bus Bus
	4300 5500 4400 5400
Entry Wire Line
	5050 3500 4950 3600
Entry Wire Line
	5050 3600 4950 3700
Entry Wire Line
	5050 3700 4950 3800
Entry Wire Line
	5050 3800 4950 3900
Entry Wire Line
	5050 3900 4950 4000
Entry Wire Line
	5050 4000 4950 4100
Entry Wire Line
	5050 4100 4950 4200
Entry Wire Line
	5050 4200 4950 4300
Wire Bus Line
	1500 5800 4850 5800
Entry Bus Bus
	4850 5800 4950 5700
Text HLabel 1500 5800 0    50   UnSpc ~ 0
FPD[0..7]
Text Label 1600 5800 0    50   ~ 0
FPD[0..7]
Text HLabel 2300 1800 0    50   UnSpc ~ 0
~RESET
Text HLabel 2300 2000 0    50   UnSpc ~ 0
CLK1
Text HLabel 2300 2100 0    50   UnSpc ~ 0
CLK2
Text HLabel 2300 2200 0    50   UnSpc ~ 0
CLK3
Text HLabel 2300 2300 0    50   UnSpc ~ 0
CLK4
Text HLabel 2300 2500 0    50   UnSpc ~ 0
T34
Text HLabel 2300 2600 0    50   UnSpc ~ 0
~IRQ
Text HLabel 2300 2700 0    50   UnSpc ~ 0
~IRQS
Entry Wire Line
	4400 2800 4500 2900
Entry Wire Line
	4400 2900 4500 3000
Entry Wire Line
	4400 3000 4500 3100
Entry Wire Line
	4400 3100 4500 3200
Entry Wire Line
	4400 3200 4500 3300
Entry Wire Line
	4400 3300 4500 3400
Entry Wire Line
	4400 3400 4500 3500
Entry Wire Line
	4400 3500 4500 3600
Entry Bus Bus
	4400 5600 4500 5500
Wire Bus Line
	4400 5600 1500 5600
Text Label 1600 5600 0    50   ~ 0
~IRQ[0..7]
Text HLabel 1500 5600 0    50   UnSpc ~ 0
~IRQ[0..7]
Text HLabel 4300 1800 2    50   UnSpc ~ 0
~RSTHOLD
Text HLabel 4300 1900 2    50   UnSpc ~ 0
~SYSDEV
Text HLabel 4300 2000 2    50   UnSpc ~ 0
~IODEV1xx
Text HLabel 4300 2100 2    50   UnSpc ~ 0
~IODEV2xx
Text HLabel 4300 2200 2    50   UnSpc ~ 0
~IODEV3xx
Text HLabel 4300 2500 2    50   UnSpc ~ 0
~R
Text HLabel 4300 2600 2    50   UnSpc ~ 0
~W
Text HLabel 4300 2700 2    50   UnSpc ~ 0
~WS
Text HLabel 7000 2000 2    50   UnSpc ~ 0
~HALT
Wire Wire Line
	8500 1850 8950 1850
Wire Wire Line
	8500 1950 8950 1950
Wire Wire Line
	8500 2050 8950 2050
Wire Wire Line
	8500 2150 8950 2150
Wire Wire Line
	8500 2250 8950 2250
Wire Wire Line
	8500 2350 8950 2350
Wire Wire Line
	8500 2450 8950 2450
Wire Wire Line
	8500 2550 8950 2550
Wire Wire Line
	8500 2650 8950 2650
Wire Wire Line
	8500 2750 8950 2750
Wire Wire Line
	8500 2850 8950 2850
Wire Wire Line
	8500 2950 8950 2950
Wire Wire Line
	8500 3050 8950 3050
Wire Wire Line
	8500 3150 8950 3150
Wire Wire Line
	8500 3250 8950 3250
Wire Wire Line
	8500 3350 8950 3350
Wire Wire Line
	8500 3450 8950 3450
Wire Wire Line
	8500 3550 8950 3550
Wire Wire Line
	8500 3650 8950 3650
Wire Wire Line
	8500 3750 8950 3750
Wire Wire Line
	9950 1850 10400 1850
Wire Wire Line
	9950 1950 10400 1950
Wire Wire Line
	9950 2050 10400 2050
Wire Wire Line
	9950 2150 10400 2150
Wire Wire Line
	9950 2250 10400 2250
Wire Wire Line
	9950 2350 10400 2350
Wire Wire Line
	9950 2450 10400 2450
Wire Wire Line
	9950 2550 10400 2550
Wire Wire Line
	9950 2650 10400 2650
Wire Wire Line
	9950 2750 10400 2750
Wire Wire Line
	9950 2850 10400 2850
Wire Wire Line
	9950 2950 10400 2950
Wire Wire Line
	9950 3050 10400 3050
Wire Wire Line
	9950 3150 10400 3150
Wire Wire Line
	9950 3250 10400 3250
Wire Wire Line
	9950 3350 10400 3350
Wire Wire Line
	9950 3450 10400 3450
Wire Wire Line
	9950 3550 10400 3550
Wire Wire Line
	9950 3650 10400 3650
Wire Wire Line
	9950 3750 10400 3750
Text Label 8550 1850 0    50   ~ 0
C1
Text Label 8550 1950 0    50   ~ 0
C2
Text Label 8550 2050 0    50   ~ 0
C3
Text Label 8550 2150 0    50   ~ 0
C4
Text Label 8550 2250 0    50   ~ 0
C5
Text Label 8550 2350 0    50   ~ 0
C6
Text Label 8550 2450 0    50   ~ 0
C7
Text Label 8550 2550 0    50   ~ 0
C8
Text Label 8550 2650 0    50   ~ 0
C9
Text Label 8550 2750 0    50   ~ 0
C10
Text Label 8550 2850 0    50   ~ 0
C11
Text Label 8550 2950 0    50   ~ 0
C12
Text Label 8550 3050 0    50   ~ 0
C13
Text Label 8550 3150 0    50   ~ 0
C14
Text Label 8550 3250 0    50   ~ 0
C15
Text Label 8550 3350 0    50   ~ 0
C16
Text Label 8550 3450 0    50   ~ 0
C17
Text Label 8550 3550 0    50   ~ 0
C18
Text Label 8550 3650 0    50   ~ 0
C19
Text Label 8550 3750 0    50   ~ 0
C20
Text Label 10350 1850 2    50   ~ 0
C21
Text Label 10350 1950 2    50   ~ 0
C22
Text Label 10350 2050 2    50   ~ 0
C23
Text Label 10350 2150 2    50   ~ 0
C24
Text Label 10350 2250 2    50   ~ 0
C25
Text Label 10350 2350 2    50   ~ 0
C26
Text Label 10350 2450 2    50   ~ 0
C27
Text Label 10350 2550 2    50   ~ 0
C28
Text Label 10350 2650 2    50   ~ 0
C29
Text Label 10350 2750 2    50   ~ 0
C30
Text Label 10350 2850 2    50   ~ 0
C31
Text Label 10350 2950 2    50   ~ 0
C32
Text Label 10350 3050 2    50   ~ 0
C33
Text Label 10350 3150 2    50   ~ 0
C34
Text Label 10350 3250 2    50   ~ 0
C35
Text Label 10350 3350 2    50   ~ 0
C36
Text Label 10350 3450 2    50   ~ 0
C37
Text Label 10350 3550 2    50   ~ 0
C38
Text Label 10350 3650 2    50   ~ 0
C39
Text Label 10350 3750 2    50   ~ 0
C40
Text HLabel 8500 1850 0    50   UnSpc ~ 0
C1
Text HLabel 8500 1950 0    50   UnSpc ~ 0
C2
Text HLabel 8500 2050 0    50   UnSpc ~ 0
C3
Text HLabel 8500 2150 0    50   UnSpc ~ 0
C4
Text HLabel 8500 2250 0    50   UnSpc ~ 0
C5
Text HLabel 8500 2350 0    50   UnSpc ~ 0
C6
Text HLabel 8500 2450 0    50   UnSpc ~ 0
C7
Text HLabel 8500 2550 0    50   UnSpc ~ 0
C8
Text HLabel 8500 2650 0    50   UnSpc ~ 0
C9
Text HLabel 8500 2750 0    50   UnSpc ~ 0
C10
Text HLabel 8500 2850 0    50   UnSpc ~ 0
C11
Text HLabel 8500 2950 0    50   UnSpc ~ 0
C12
Text HLabel 8500 3050 0    50   UnSpc ~ 0
C13
Text HLabel 8500 3150 0    50   UnSpc ~ 0
C14
Text HLabel 8500 3250 0    50   UnSpc ~ 0
C15
Text HLabel 8500 3350 0    50   UnSpc ~ 0
C16
Text HLabel 8500 3450 0    50   UnSpc ~ 0
C17
Text HLabel 8500 3550 0    50   UnSpc ~ 0
C18
Text HLabel 8500 3650 0    50   UnSpc ~ 0
C19
Text HLabel 8500 3750 0    50   UnSpc ~ 0
C20
Text HLabel 10400 1850 2    50   UnSpc ~ 0
C21
Text HLabel 10400 1950 2    50   UnSpc ~ 0
C22
Text HLabel 10400 2050 2    50   UnSpc ~ 0
C23
Text HLabel 10400 2150 2    50   UnSpc ~ 0
C24
Text HLabel 10400 2250 2    50   UnSpc ~ 0
C25
Text HLabel 10400 2350 2    50   UnSpc ~ 0
C26
Text HLabel 10400 2450 2    50   UnSpc ~ 0
C27
Text HLabel 10400 2550 2    50   UnSpc ~ 0
C28
Text HLabel 10400 2650 2    50   UnSpc ~ 0
C29
Text HLabel 10400 2750 2    50   UnSpc ~ 0
C30
Text HLabel 10400 2850 2    50   UnSpc ~ 0
C31
Text HLabel 10400 2950 2    50   UnSpc ~ 0
C32
Text HLabel 10400 3050 2    50   UnSpc ~ 0
C33
Text HLabel 10400 3150 2    50   UnSpc ~ 0
C34
Text HLabel 10400 3250 2    50   UnSpc ~ 0
C35
Text HLabel 10400 3350 2    50   UnSpc ~ 0
C36
Text HLabel 10400 3450 2    50   UnSpc ~ 0
C37
Text HLabel 10400 3550 2    50   UnSpc ~ 0
C38
Text HLabel 10400 3650 2    50   UnSpc ~ 0
C39
Text HLabel 10400 3750 2    50   UnSpc ~ 0
C40
$Comp
L alexios:CFT-2019-Bus P?
U 4 1 63F88C53
P 9450 4350
AR Path="/5D34E810/63F88C53" Ref="P?"  Part="4" 
AR Path="/5D36B851/63F88C53" Ref="P?"  Part="4" 
AR Path="/5F1DB2E8/63F88C53" Ref="P?"  Part="4" 
AR Path="/63F88C53" Ref="P?"  Part="4" 
AR Path="/60A64590/63F88C53" Ref="P?"  Part="4" 
AR Path="/5FE640D1/5FE9C29E/63F88C53" Ref="P7"  Part="4" 
F 0 "P7" H 9450 4517 50  0000 C CNN
F 1 "CFT-2019-Bus" H 9450 4426 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge-P2-Connector" H 9400 3450 50  0001 C CNN
F 3 "" H 9400 3450 50  0001 C CNN
	4    9450 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63F88C59
P 9000 4500
AR Path="/5F67D4B5/63F88C59" Ref="#PWR?"  Part="1" 
AR Path="/63F88C59" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/63F88C59" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/63F88C59" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/63F88C59" Ref="#PWR?"  Part="1" 
AR Path="/60A64590/63F88C59" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/63F88C59" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 9000 4350 50  0001 C CNN
F 1 "+5V" H 9050 4650 50  0000 R CNN
F 2 "" H 9000 4500 50  0001 C CNN
F 3 "" H 9000 4500 50  0001 C CNN
	1    9000 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63F88C5F
P 9000 5050
AR Path="/5F67D4B5/63F88C5F" Ref="#PWR?"  Part="1" 
AR Path="/63F88C5F" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/63F88C5F" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/63F88C5F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/63F88C5F" Ref="#PWR?"  Part="1" 
AR Path="/60A64590/63F88C5F" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/63F88C5F" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 9000 4800 50  0001 C CNN
F 1 "GND" H 8922 5013 50  0000 R CNN
F 2 "" H 9000 5050 50  0001 C CNN
F 3 "" H 9000 5050 50  0001 C CNN
	1    9000 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63F88C66
P 9900 4500
AR Path="/5F67D4B5/63F88C66" Ref="#PWR?"  Part="1" 
AR Path="/63F88C66" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/63F88C66" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/63F88C66" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/63F88C66" Ref="#PWR?"  Part="1" 
AR Path="/60A64590/63F88C66" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/63F88C66" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 9900 4350 50  0001 C CNN
F 1 "+5V" H 9915 4673 50  0000 C CNN
F 2 "" H 9900 4500 50  0001 C CNN
F 3 "" H 9900 4500 50  0001 C CNN
	1    9900 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63F88C6C
P 9900 5050
AR Path="/5F67D4B5/63F88C6C" Ref="#PWR?"  Part="1" 
AR Path="/63F88C6C" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/63F88C6C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/63F88C6C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/63F88C6C" Ref="#PWR?"  Part="1" 
AR Path="/60A64590/63F88C6C" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/63F88C6C" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 9900 4800 50  0001 C CNN
F 1 "GND" H 9905 4877 50  0000 C CNN
F 2 "" H 9900 5050 50  0001 C CNN
F 3 "" H 9900 5050 50  0001 C CNN
	1    9900 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 63F88C74
P 9000 4700
AR Path="/63F88C74" Ref="C?"  Part="1" 
AR Path="/5D34E810/63F88C74" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/63F88C74" Ref="C?"  Part="1" 
AR Path="/5D36B851/63F88C74" Ref="C?"  Part="1" 
AR Path="/60A64590/63F88C74" Ref="C?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/63F88C74" Ref="C52"  Part="1" 
F 0 "C52" H 8912 4746 50  0000 R CNN
F 1 "47µF" H 8912 4655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9000 4700 50  0001 C CNN
F 3 "~" H 9000 4700 50  0001 C CNN
	1    9000 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 63F88C7A
P 9900 4700
AR Path="/63F88C7A" Ref="C?"  Part="1" 
AR Path="/5D34E810/63F88C7A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/63F88C7A" Ref="C?"  Part="1" 
AR Path="/5D36B851/63F88C7A" Ref="C?"  Part="1" 
AR Path="/60A64590/63F88C7A" Ref="C?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/63F88C7A" Ref="C53"  Part="1" 
F 0 "C53" H 9988 4746 50  0000 L CNN
F 1 "47µF" H 9988 4655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9900 4700 50  0001 C CNN
F 3 "~" H 9900 4700 50  0001 C CNN
	1    9900 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 4600 9000 4600
Wire Wire Line
	9050 4800 9000 4800
Wire Wire Line
	9850 4800 9900 4800
Connection ~ 9000 4500
Wire Wire Line
	9000 4500 9050 4500
Wire Wire Line
	9850 4600 9900 4600
$Comp
L alexios:CFT-2019-Bus P?
U 3 1 6087C194
P 9450 1700
AR Path="/5D34E810/6087C194" Ref="P?"  Part="3" 
AR Path="/5D36B851/6087C194" Ref="P?"  Part="3" 
AR Path="/6087C194" Ref="P?"  Part="3" 
AR Path="/60A64590/6087C194" Ref="P?"  Part="3" 
AR Path="/5FE640D1/5FE9C29E/6087C194" Ref="P7"  Part="3" 
F 0 "P7" H 9450 1867 50  0000 C CNN
F 1 "CFT-2019-Bus" H 9450 1776 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge-P2-Connector" H 9400 800 50  0001 C CNN
F 3 "" H 9400 800 50  0001 C CNN
	3    9450 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P?
U 2 1 6087C17A
P 6050 1650
AR Path="/5D34E810/6087C17A" Ref="P?"  Part="2" 
AR Path="/5D36B851/6087C17A" Ref="P?"  Part="2" 
AR Path="/6087C17A" Ref="P?"  Part="2" 
AR Path="/60A64590/6087C17A" Ref="P?"  Part="2" 
AR Path="/5FE640D1/5FE9C29E/6087C17A" Ref="P7"  Part="2" 
F 0 "P7" H 6050 1817 50  0000 C CNN
F 1 "CFT-2019-Bus" H 6050 1726 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge-P2-Connector" H 6000 750 50  0001 C CNN
F 3 "" H 6000 750 50  0001 C CNN
	2    6050 1650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E675F81
P 9000 4500
F 0 "#FLG02" H 9000 4575 50  0001 C CNN
F 1 "PWR_FLAG" V 9000 4900 50  0001 C CNN
F 2 "" H 9000 4500 50  0001 C CNN
F 3 "~" H 9000 4500 50  0001 C CNN
	1    9000 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 2800 7000 2800
Text Label 6900 2800 2    50   ~ 0
~WAITING
Text HLabel 7000 2800 2    50   UnSpc ~ 0
~WAITING
Wire Wire Line
	9000 4900 9050 4900
Wire Wire Line
	9000 4500 9000 4600
Connection ~ 9000 4600
Wire Wire Line
	9000 4800 9000 4900
Connection ~ 9000 4800
Connection ~ 9000 4900
Wire Wire Line
	9000 4900 9000 5000
Wire Wire Line
	9050 5000 9000 5000
Connection ~ 9000 5000
Wire Wire Line
	9000 5000 9000 5050
Wire Wire Line
	9900 5050 9900 5000
Wire Wire Line
	9850 4500 9900 4500
Connection ~ 9900 4500
Wire Wire Line
	9900 4600 9900 4500
Connection ~ 9900 4600
Connection ~ 9900 4800
Wire Wire Line
	9850 4900 9900 4900
Connection ~ 9900 4900
Wire Wire Line
	9900 4900 9900 4800
Wire Wire Line
	9850 5000 9900 5000
Connection ~ 9900 5000
Wire Wire Line
	9900 5000 9900 4950
NoConn ~ 2300 2400
$Comp
L alexios:CFT-2019-Bus P?
U 1 1 6087C174
P 3300 1650
AR Path="/5D34E810/6087C174" Ref="P?"  Part="1" 
AR Path="/5D36B851/6087C174" Ref="P?"  Part="1" 
AR Path="/6087C174" Ref="P?"  Part="1" 
AR Path="/60A64590/6087C174" Ref="P?"  Part="1" 
AR Path="/5FE640D1/5FE9C29E/6087C174" Ref="P7"  Part="1" 
F 0 "P7" H 3300 1817 50  0000 C CNN
F 1 "CFT-2019-Bus" H 3300 1726 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge-P2-Connector" H 3250 750 50  0001 C CNN
F 3 "" H 3250 750 50  0001 C CNN
	1    3300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3600 2500 3600
Wire Wire Line
	2700 3700 2500 3700
Wire Wire Line
	2700 3800 2500 3800
Wire Wire Line
	2700 3900 2500 3900
Wire Wire Line
	2700 4000 2500 4000
Wire Wire Line
	2700 4100 2500 4100
Wire Wire Line
	2700 4200 2500 4200
Wire Wire Line
	2700 4300 2500 4300
Wire Wire Line
	2700 4400 2500 4400
Wire Wire Line
	2700 4500 2500 4500
Wire Wire Line
	2700 4600 2500 4600
Wire Wire Line
	2700 4700 2500 4700
Wire Wire Line
	2700 4800 2500 4800
Wire Wire Line
	2700 4900 2500 4900
Wire Wire Line
	2700 5000 2500 5000
Wire Wire Line
	2700 5100 2500 5100
NoConn ~ 2500 3600
NoConn ~ 2500 3700
NoConn ~ 2500 3800
NoConn ~ 2500 3900
NoConn ~ 2500 4000
NoConn ~ 2500 4100
NoConn ~ 2500 4200
NoConn ~ 2500 4300
NoConn ~ 2500 4400
NoConn ~ 2500 4500
NoConn ~ 2500 4600
NoConn ~ 2500 4700
NoConn ~ 2500 4800
NoConn ~ 2500 4900
NoConn ~ 2500 5000
NoConn ~ 2500 5100
Entry Bus Bus
	2100 3800 2200 3700
Wire Bus Line
	2100 3800 1500 3800
Text Label 1600 3800 0    50   ~ 0
AB[0..23]
Text HLabel 1500 3800 0    50   UnSpc ~ 0
AB[0..23]
Wire Wire Line
	5450 1800 5250 1800
Wire Wire Line
	5450 1900 5250 1900
Wire Wire Line
	5450 2000 5250 2000
Wire Wire Line
	5450 2100 5250 2100
Wire Wire Line
	5450 2200 5250 2200
Wire Wire Line
	5450 2300 5250 2300
Wire Wire Line
	5450 2400 5250 2400
Wire Wire Line
	5450 2500 5250 2500
Wire Wire Line
	5450 2600 5250 2600
Wire Wire Line
	5450 2700 5250 2700
Wire Wire Line
	5450 2800 5250 2800
Wire Wire Line
	5450 2900 5250 2900
Wire Wire Line
	5450 3000 5250 3000
Wire Wire Line
	5450 3100 5250 3100
Wire Wire Line
	5450 3200 5250 3200
Wire Wire Line
	5450 3300 5250 3300
NoConn ~ 5250 1800
NoConn ~ 5250 1900
NoConn ~ 5250 2000
NoConn ~ 5250 2100
NoConn ~ 5250 2200
NoConn ~ 5250 2300
NoConn ~ 5250 2400
NoConn ~ 5250 2500
NoConn ~ 5250 2600
NoConn ~ 5250 2700
NoConn ~ 5250 2800
NoConn ~ 5250 2900
NoConn ~ 5250 3000
NoConn ~ 5250 3100
NoConn ~ 5250 3200
NoConn ~ 5250 3300
Wire Wire Line
	6650 2900 6850 2900
Wire Wire Line
	6650 3000 6850 3000
Wire Wire Line
	6650 3100 6850 3100
Wire Wire Line
	6650 3200 6850 3200
Wire Wire Line
	6650 3300 6850 3300
Wire Wire Line
	6650 3400 6850 3400
Wire Wire Line
	6650 3500 6850 3500
Wire Wire Line
	6650 3600 6850 3600
Wire Wire Line
	6650 3700 6850 3700
Wire Wire Line
	6650 3800 6850 3800
Wire Wire Line
	6650 3900 6850 3900
Wire Wire Line
	6650 4000 6850 4000
Wire Wire Line
	6650 4100 6850 4100
Wire Wire Line
	6650 4200 6850 4200
Wire Wire Line
	6650 2600 6850 2600
Wire Wire Line
	6650 2700 6850 2700
NoConn ~ 6850 2900
NoConn ~ 6850 3000
NoConn ~ 6850 3100
NoConn ~ 6850 3200
NoConn ~ 6850 3300
NoConn ~ 6850 3400
NoConn ~ 6850 3500
NoConn ~ 6850 3600
NoConn ~ 6850 3700
NoConn ~ 6850 3800
NoConn ~ 6850 3900
NoConn ~ 6850 4000
NoConn ~ 6850 4100
NoConn ~ 6850 4200
NoConn ~ 6850 2600
NoConn ~ 6850 2700
Wire Wire Line
	6650 2400 6850 2400
Wire Wire Line
	6650 2500 6850 2500
NoConn ~ 6850 2400
NoConn ~ 6850 2500
Wire Wire Line
	6650 2200 6850 2200
Wire Wire Line
	6650 2300 6850 2300
NoConn ~ 6850 2200
NoConn ~ 6850 2300
Wire Wire Line
	6650 2100 6850 2100
NoConn ~ 6850 2100
Wire Wire Line
	3900 2300 4100 2300
NoConn ~ 4100 2300
Wire Wire Line
	3900 2400 4100 2400
NoConn ~ 4100 2400
Wire Bus Line
	4500 2900 4500 5500
Wire Bus Line
	4950 3600 4950 5700
Wire Bus Line
	2200 2900 2200 3700
Wire Bus Line
	4400 3700 4400 5400
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6C038D98
P 9900 4950
F 0 "#FLG0102" H 9900 5025 50  0001 C CNN
F 1 "PWR_FLAG" V 9900 5078 50  0001 L CNN
F 2 "" H 9900 4950 50  0001 C CNN
F 3 "~" H 9900 4950 50  0001 C CNN
	1    9900 4950
	0    1    1    0   
$EndComp
Connection ~ 9900 4950
Wire Wire Line
	9900 4950 9900 4900
$EndSCHEMATC
