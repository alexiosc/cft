EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 12
Title "Timers, Interrupts & Clock "
Date "2019-11-17"
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:CFT-2019-Bus P?
U 1 1 5D36087B
P 3150 1600
AR Path="/5D34E810/5D36087B" Ref="P?"  Part="1" 
AR Path="/5D36B851/5D36087B" Ref="P?"  Part="1" 
AR Path="/5F1DB2E8/5D36087B" Ref="P?"  Part="1" 
AR Path="/5D36087B" Ref="P?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D36087B" Ref="P?"  Part="1" 
AR Path="/5DD5525C/5D36087B" Ref="P1"  Part="1" 
F 0 "P1" H 3150 1767 50  0000 C CNN
F 1 "CFT-2019-Bus" H 3150 1676 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 3100 700 50  0001 C CNN
F 3 "" H 3100 700 50  0001 C CNN
	1    3150 1600
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2019-Bus P?
U 2 1 5D360881
P 5900 1600
AR Path="/5D34E810/5D360881" Ref="P?"  Part="2" 
AR Path="/5D36B851/5D360881" Ref="P?"  Part="2" 
AR Path="/5F1DB2E8/5D360881" Ref="P?"  Part="2" 
AR Path="/5D360881" Ref="P?"  Part="2" 
AR Path="/5DD3D79F/5D34E810/5D360881" Ref="P?"  Part="2" 
AR Path="/5DD5525C/5D360881" Ref="P1"  Part="2" 
F 0 "P1" H 5900 1767 50  0000 C CNN
F 1 "CFT-2019-Bus" H 5900 1676 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 5850 700 50  0001 C CNN
F 3 "" H 5850 700 50  0001 C CNN
	2    5900 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1750 2150 1750
Wire Wire Line
	2550 1950 2150 1950
Wire Wire Line
	2550 2050 2150 2050
Wire Wire Line
	2550 2150 2150 2150
Wire Wire Line
	2550 2250 2150 2250
Wire Wire Line
	2550 2350 2150 2350
Wire Wire Line
	2550 2450 2150 2450
Wire Wire Line
	2550 2550 2150 2550
Wire Wire Line
	2550 2650 2150 2650
Wire Wire Line
	3750 1750 4150 1750
Wire Wire Line
	3750 1850 4150 1850
Wire Wire Line
	3750 1950 4150 1950
Wire Wire Line
	3750 2050 4150 2050
Wire Wire Line
	3750 2150 4150 2150
Wire Wire Line
	3750 2250 4150 2250
Wire Wire Line
	3750 2350 4150 2350
Wire Wire Line
	3750 2450 4150 2450
Wire Wire Line
	3750 2550 4150 2550
Wire Wire Line
	3750 2650 4150 2650
Wire Wire Line
	3750 2750 4250 2750
Wire Wire Line
	3750 2850 4250 2850
Wire Wire Line
	3750 2950 4250 2950
Wire Wire Line
	3750 3050 4250 3050
Wire Wire Line
	3750 3150 4250 3150
Wire Wire Line
	3750 3250 4250 3250
Wire Wire Line
	3750 3350 4250 3350
Wire Wire Line
	3750 3450 4250 3450
Wire Wire Line
	4800 1750 5300 1750
Wire Wire Line
	4800 1850 5300 1850
Wire Wire Line
	4800 1950 5300 1950
Wire Wire Line
	4800 2050 5300 2050
Wire Wire Line
	4800 2150 5300 2150
Wire Wire Line
	4800 2250 5300 2250
Wire Wire Line
	4800 2350 5300 2350
Wire Wire Line
	4800 2450 5300 2450
Wire Wire Line
	4800 2550 5300 2550
Wire Wire Line
	4800 2650 5300 2650
Wire Wire Line
	4800 2750 5300 2750
Wire Wire Line
	4800 2850 5300 2850
Wire Wire Line
	4800 2950 5300 2950
Wire Wire Line
	4800 3050 5300 3050
Wire Wire Line
	4800 3150 5300 3150
Wire Wire Line
	4800 3250 5300 3250
Wire Wire Line
	4900 3450 5300 3450
Wire Wire Line
	4900 3550 5300 3550
Wire Wire Line
	4900 3650 5300 3650
Wire Wire Line
	4900 3750 5300 3750
Wire Wire Line
	4900 3850 5300 3850
Wire Wire Line
	4900 3950 5300 3950
Wire Wire Line
	4900 4050 5300 4050
Wire Wire Line
	4900 4150 5300 4150
Wire Wire Line
	6500 2450 6850 2450
Wire Wire Line
	6500 2550 6850 2550
Wire Wire Line
	6500 1950 7250 1950
Text Label 2150 1750 0    50   ~ 0
~RESET
Text Label 2150 1950 0    50   ~ 0
CLK1
Text Label 2150 2050 0    50   ~ 0
CLK2
Text Label 2150 2150 0    50   ~ 0
CLK3
Text Label 2150 2250 0    50   ~ 0
CLK4
Text Label 2150 2350 0    50   ~ 0
WSTB
Text Label 2150 2450 0    50   ~ 0
T34
Text Label 2150 2550 0    50   ~ 0
~IRQ
Text Label 2150 2650 0    50   ~ 0
~IRQS
Text Label 4150 1750 2    50   ~ 0
~RSTHOLD
Text Label 4150 1850 2    50   ~ 0
~SYSDEV
Text Label 4150 1950 2    50   ~ 0
~IODEV1xx
Text Label 4150 2050 2    50   ~ 0
~IODEV2xx
Text Label 4150 2150 2    50   ~ 0
~IODEV3xx
Text Label 4150 2250 2    50   ~ 0
~MEM
Text Label 4150 2350 2    50   ~ 0
~IO
Text Label 4150 2450 2    50   ~ 0
~R
Text Label 4150 2550 2    50   ~ 0
~W
Text Label 4150 2650 2    50   ~ 0
~WS
Text Label 4150 2750 2    50   ~ 0
~IRQ0
Text Label 4150 2850 2    50   ~ 0
~IRQ1
Text Label 4150 2950 2    50   ~ 0
~IRQ2
Text Label 4150 3050 2    50   ~ 0
~IRQ3
Text Label 4150 3150 2    50   ~ 0
~IRQ4
Text Label 4150 3250 2    50   ~ 0
~IRQ5
Text Label 4150 3350 2    50   ~ 0
~IRQ6
Text Label 4150 3450 2    50   ~ 0
~IRQ7
Text Label 4800 1750 0    50   ~ 0
IBUS0
Text Label 4800 1850 0    50   ~ 0
IBUS1
Text Label 4800 1950 0    50   ~ 0
IBUS2
Text Label 4800 2050 0    50   ~ 0
IBUS3
Text Label 4800 2150 0    50   ~ 0
IBUS4
Text Label 4800 2250 0    50   ~ 0
IBUS5
Text Label 4800 2350 0    50   ~ 0
IBUS6
Text Label 4800 2450 0    50   ~ 0
IBUS7
Text Label 4800 2550 0    50   ~ 0
IBUS8
Text Label 4800 2650 0    50   ~ 0
IBUS9
Text Label 4800 2750 0    50   ~ 0
IBUS10
Text Label 4800 2850 0    50   ~ 0
IBUS11
Text Label 4800 2950 0    50   ~ 0
IBUS12
Text Label 4800 3050 0    50   ~ 0
IBUS13
Text Label 4800 3150 0    50   ~ 0
IBUS14
Text Label 4800 3250 0    50   ~ 0
IBUS15
Text Label 4900 3450 0    50   ~ 0
FPD0
Text Label 4900 3550 0    50   ~ 0
FPD1
Text Label 4900 3650 0    50   ~ 0
FPD2
Text Label 4900 3750 0    50   ~ 0
FPD3
Text Label 4900 3850 0    50   ~ 0
FPD4
Text Label 4900 3950 0    50   ~ 0
FPD5
Text Label 4900 4050 0    50   ~ 0
FPD6
Text Label 4900 4150 0    50   ~ 0
FPD7
Text Label 6800 2450 2    50   ~ 0
~ENDEXT
Text Label 6800 2550 2    50   ~ 0
~SKIPEXT
Text Label 7200 1950 2    50   ~ 0
~HALT
Text Label 6900 4150 2    50   ~ 0
ACTION3
Text Label 6900 4050 2    50   ~ 0
ACTION2
Text Label 6900 3950 2    50   ~ 0
ACTION1
Text Label 6900 3850 2    50   ~ 0
ACTION0
Text Label 7000 3750 2    50   ~ 0
WADDR4
Text Label 7000 3650 2    50   ~ 0
WADDR3
Text Label 7000 3550 2    50   ~ 0
WADDR2
Text Label 7000 3450 2    50   ~ 0
WADDR1
Text Label 7000 3350 2    50   ~ 0
WADDR0
Text Label 7100 3250 2    50   ~ 0
RADDR4
Text Label 7100 3150 2    50   ~ 0
RADDR3
Text Label 7100 3050 2    50   ~ 0
RADDR2
Text Label 7100 2950 2    50   ~ 0
RADDR1
Text Label 7100 2850 2    50   ~ 0
RADDR0
Wire Wire Line
	6500 4150 6900 4150
Wire Wire Line
	6500 4050 6900 4050
Wire Wire Line
	6500 3950 6900 3950
Wire Wire Line
	6500 3850 6900 3850
Wire Wire Line
	6500 3750 7000 3750
Wire Wire Line
	6500 3650 7000 3650
Wire Wire Line
	6500 3550 7000 3550
Wire Wire Line
	6500 3450 7000 3450
Wire Wire Line
	6500 3350 7000 3350
Wire Wire Line
	6500 3250 7100 3250
Wire Wire Line
	6500 3150 7100 3150
Wire Wire Line
	6500 3050 7100 3050
Wire Wire Line
	6500 2950 7100 2950
Wire Wire Line
	6500 2850 7100 2850
Wire Wire Line
	2550 2750 2150 2750
Wire Wire Line
	2550 2850 2150 2850
Wire Wire Line
	2550 2950 2150 2950
Wire Wire Line
	2550 3050 2150 3050
Wire Wire Line
	2550 3150 2150 3150
Wire Wire Line
	2550 3250 2150 3250
Wire Wire Line
	2550 3350 2150 3350
Wire Wire Line
	2550 3450 2150 3450
Wire Wire Line
	2550 3550 2150 3550
Wire Wire Line
	2550 3650 2150 3650
Wire Wire Line
	2550 3750 2150 3750
Wire Wire Line
	2550 3850 2150 3850
Wire Wire Line
	2550 3950 2150 3950
Wire Wire Line
	2550 4050 2150 4050
Wire Wire Line
	2550 4150 2150 4150
Wire Wire Line
	2550 4250 2150 4250
Wire Wire Line
	2550 4350 2150 4350
Wire Wire Line
	2550 4450 2150 4450
Wire Wire Line
	2550 4550 2150 4550
Wire Wire Line
	2550 4650 2150 4650
Wire Wire Line
	2550 4750 2150 4750
Wire Wire Line
	2550 4850 2150 4850
Wire Wire Line
	2550 4950 2150 4950
Wire Wire Line
	2550 5050 2150 5050
Text Label 2150 2750 0    50   ~ 0
AB0
Text Label 2150 2850 0    50   ~ 0
AB1
Text Label 2150 2950 0    50   ~ 0
AB2
Text Label 2150 3050 0    50   ~ 0
AB3
Text Label 2150 3150 0    50   ~ 0
AB4
Text Label 2150 3250 0    50   ~ 0
AB5
Text Label 2150 3350 0    50   ~ 0
AB6
Text Label 2150 3450 0    50   ~ 0
AB7
Text Label 2150 3550 0    50   ~ 0
AB8
Text Label 2150 3650 0    50   ~ 0
AB9
Text Label 2150 3750 0    50   ~ 0
AB10
Text Label 2150 3850 0    50   ~ 0
AB11
Text Label 2150 3950 0    50   ~ 0
AB12
Text Label 2150 4050 0    50   ~ 0
AB13
Text Label 2150 4150 0    50   ~ 0
AB14
Text Label 2150 4250 0    50   ~ 0
AB15
Text Label 2150 4350 0    50   ~ 0
AB16
Text Label 2150 4450 0    50   ~ 0
AB17
Text Label 2150 4550 0    50   ~ 0
AB18
Text Label 2150 4650 0    50   ~ 0
AB19
Text Label 2150 4750 0    50   ~ 0
AB20
Text Label 2150 4850 0    50   ~ 0
AB21
Text Label 2150 4950 0    50   ~ 0
AB22
Text Label 2150 5050 0    50   ~ 0
AB23
Wire Bus Line
	1950 5350 1350 5350
Wire Bus Line
	1350 5450 4150 5450
Text Label 1450 5450 0    50   ~ 0
DB[0..15]
Text HLabel 1350 5350 0    50   UnSpc ~ 0
AB[0..23]
Text HLabel 1350 5450 0    50   UnSpc ~ 0
DB[0..15]
Wire Wire Line
	3750 3550 4150 3550
Wire Wire Line
	3750 3650 4150 3650
Wire Wire Line
	3750 3750 4150 3750
Wire Wire Line
	3750 3850 4150 3850
Wire Wire Line
	3750 3950 4150 3950
Wire Wire Line
	3750 4050 4150 4050
Wire Wire Line
	3750 4150 4150 4150
Wire Wire Line
	3750 4250 4150 4250
Wire Wire Line
	3750 4350 4150 4350
Wire Wire Line
	3750 4450 4150 4450
Wire Wire Line
	3750 4550 4150 4550
Wire Wire Line
	3750 4650 4150 4650
Wire Wire Line
	3750 4750 4150 4750
Wire Wire Line
	3750 4850 4150 4850
Wire Wire Line
	3750 4950 4150 4950
Wire Wire Line
	3750 5050 4150 5050
Text Label 4150 3550 2    50   ~ 0
DB0
Text Label 4150 3650 2    50   ~ 0
DB1
Text Label 4150 3750 2    50   ~ 0
DB2
Text Label 4150 3850 2    50   ~ 0
DB3
Text Label 4150 3950 2    50   ~ 0
DB4
Text Label 4150 4050 2    50   ~ 0
DB5
Text Label 4150 4150 2    50   ~ 0
DB6
Text Label 4150 4250 2    50   ~ 0
DB7
Text Label 4150 4350 2    50   ~ 0
DB8
Text Label 4150 4450 2    50   ~ 0
DB9
Text Label 4150 4550 2    50   ~ 0
DB10
Text Label 4150 4650 2    50   ~ 0
DB11
Text Label 4150 4750 2    50   ~ 0
DB12
Text Label 4150 4850 2    50   ~ 0
DB13
Text Label 4150 4950 2    50   ~ 0
DB14
Text Label 4150 5050 2    50   ~ 0
DB15
Entry Wire Line
	4250 3650 4150 3550
Entry Wire Line
	4250 3750 4150 3650
Entry Wire Line
	4250 3850 4150 3750
Entry Wire Line
	4250 3950 4150 3850
Entry Wire Line
	4250 4050 4150 3950
Entry Wire Line
	4250 4150 4150 4050
Entry Wire Line
	4250 4250 4150 4150
Entry Wire Line
	4250 4350 4150 4250
Entry Wire Line
	4250 4450 4150 4350
Entry Wire Line
	4250 4550 4150 4450
Entry Wire Line
	4250 4650 4150 4550
Entry Wire Line
	4250 4750 4150 4650
Entry Wire Line
	4250 4850 4150 4750
Entry Wire Line
	4250 4950 4150 4850
Entry Wire Line
	4250 5050 4150 4950
Entry Wire Line
	4250 5150 4150 5050
Entry Bus Bus
	4150 5450 4250 5350
Entry Wire Line
	4900 3450 4800 3550
Entry Wire Line
	4900 3550 4800 3650
Entry Wire Line
	4900 3650 4800 3750
Entry Wire Line
	4900 3750 4800 3850
Entry Wire Line
	4900 3850 4800 3950
Entry Wire Line
	4900 3950 4800 4050
Entry Wire Line
	4900 4050 4800 4150
Entry Wire Line
	4900 4150 4800 4250
Wire Bus Line
	1350 5750 4700 5750
Entry Bus Bus
	4700 5750 4800 5650
Text HLabel 1350 5750 0    50   UnSpc ~ 0
FPD[0..7]
Text Label 1450 5750 0    50   ~ 0
FPD[0..7]
Entry Wire Line
	4700 3350 4800 3250
Entry Wire Line
	4700 3250 4800 3150
Entry Wire Line
	4700 3150 4800 3050
Entry Wire Line
	4700 3050 4800 2950
Entry Wire Line
	4700 2950 4800 2850
Entry Wire Line
	4700 2850 4800 2750
Entry Wire Line
	4700 2750 4800 2650
Entry Wire Line
	4700 2650 4800 2550
Entry Wire Line
	4700 2550 4800 2450
Entry Wire Line
	4700 2450 4800 2350
Entry Wire Line
	4700 2350 4800 2250
Entry Wire Line
	4700 2250 4800 2150
Entry Wire Line
	4700 2150 4800 2050
Entry Wire Line
	4700 2050 4800 1950
Entry Wire Line
	4700 1950 4800 1850
Entry Wire Line
	4700 1850 4800 1750
Entry Bus Bus
	4600 5650 4700 5550
Wire Bus Line
	4600 5650 1350 5650
Text Label 1450 5650 0    50   ~ 0
IBUS[0..15]
Text HLabel 1350 5650 0    50   UnSpc ~ 0
IBUS[0..15]
Text HLabel 2150 1750 0    50   UnSpc ~ 0
~RESET
Text HLabel 2150 1950 0    50   UnSpc ~ 0
CLK1
Text HLabel 2150 2050 0    50   UnSpc ~ 0
CLK2
Text HLabel 2150 2150 0    50   UnSpc ~ 0
CLK3
Text HLabel 2150 2250 0    50   UnSpc ~ 0
CLK4
Text HLabel 2150 2450 0    50   UnSpc ~ 0
T34
Text HLabel 2150 2550 0    50   UnSpc ~ 0
~IRQ
Text HLabel 2150 2650 0    50   UnSpc ~ 0
~IRQS
Entry Wire Line
	4250 2750 4350 2850
Entry Wire Line
	4250 2850 4350 2950
Entry Wire Line
	4250 2950 4350 3050
Entry Wire Line
	4250 3050 4350 3150
Entry Wire Line
	4250 3150 4350 3250
Entry Wire Line
	4250 3250 4350 3350
Entry Wire Line
	4250 3350 4350 3450
Entry Wire Line
	4250 3450 4350 3550
Entry Bus Bus
	4250 5550 4350 5450
Wire Bus Line
	4250 5550 1350 5550
Text Label 1450 5550 0    50   ~ 0
~IRQ[0..7]
Text HLabel 1350 5550 0    50   UnSpc ~ 0
~IRQ[0..7]
Text HLabel 4150 1750 2    50   UnSpc ~ 0
~RSTHOLD
Text HLabel 4150 1850 2    50   UnSpc ~ 0
~SYSDEV
Text HLabel 4150 1950 2    50   UnSpc ~ 0
~IODEV1xx
Text HLabel 4150 2050 2    50   UnSpc ~ 0
~IODEV2xx
Text HLabel 4150 2150 2    50   UnSpc ~ 0
~IODEV3xx
Text Label 4150 2250 2    50   ~ 0
~MEM
Text HLabel 4150 2250 2    50   UnSpc ~ 0
~MEM
Text HLabel 4150 2350 2    50   UnSpc ~ 0
~IO
Text HLabel 4150 2450 2    50   UnSpc ~ 0
~R
Text HLabel 4150 2550 2    50   UnSpc ~ 0
~W
Text HLabel 4150 2650 2    50   UnSpc ~ 0
~WS
Text HLabel 6850 2450 2    50   UnSpc ~ 0
~ENDEXT
Text HLabel 6850 2550 2    50   UnSpc ~ 0
~SKIPEXT
Text HLabel 7250 1950 2    50   UnSpc ~ 0
~HALT
Entry Wire Line
	7100 2850 7200 2950
Entry Wire Line
	7100 2950 7200 3050
Entry Wire Line
	7100 3050 7200 3150
Entry Wire Line
	7100 3150 7200 3250
Entry Wire Line
	7100 3250 7200 3350
Entry Wire Line
	7000 3350 7100 3450
Entry Wire Line
	7000 3450 7100 3550
Entry Wire Line
	7000 3550 7100 3650
Entry Wire Line
	7000 3650 7100 3750
Entry Wire Line
	7000 3750 7100 3850
Entry Wire Line
	6900 3850 7000 3950
Entry Wire Line
	6900 3950 7000 4050
Entry Wire Line
	6900 4050 7000 4150
Entry Wire Line
	6900 4150 7000 4250
Entry Bus Bus
	6900 5850 7000 5750
Entry Bus Bus
	7000 5950 7100 5850
Entry Bus Bus
	7100 6050 7200 5950
Wire Bus Line
	6900 5850 1350 5850
Wire Bus Line
	7000 5950 1350 5950
Wire Bus Line
	7100 6050 1350 6050
Text Label 1450 5850 0    50   ~ 0
ACTION[0..3]
Text Label 1450 5950 0    50   ~ 0
WADDR[0..4]
Text Label 1450 6050 0    50   ~ 0
RADDR[0..4]
Text HLabel 1350 5850 0    50   UnSpc ~ 0
ACTION[0..3]
Text HLabel 1350 5950 0    50   UnSpc ~ 0
WADDR[0..4]
Text HLabel 1350 6050 0    50   UnSpc ~ 0
RADDR[0..4]
$Comp
L alexios:CFT-2019-Bus P?
U 4 1 5D360875
P 9350 4650
AR Path="/5D34E810/5D360875" Ref="P?"  Part="4" 
AR Path="/5D36B851/5D360875" Ref="P?"  Part="4" 
AR Path="/5F1DB2E8/5D360875" Ref="P?"  Part="4" 
AR Path="/5D360875" Ref="P?"  Part="4" 
AR Path="/5DD3D79F/5D34E810/5D360875" Ref="P?"  Part="4" 
AR Path="/5DD5525C/5D360875" Ref="P1"  Part="4" 
F 0 "P1" H 9350 4817 50  0000 C CNN
F 1 "CFT-2019-Bus" H 9350 4726 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 9300 3750 50  0001 C CNN
F 3 "" H 9300 3750 50  0001 C CNN
	4    9350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D360863
P 8900 5300
AR Path="/5F67D4B5/5D360863" Ref="#PWR?"  Part="1" 
AR Path="/5D360863" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5D360863" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D360863" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D360863" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D360863" Ref="#PWR?"  Part="1" 
AR Path="/5DD5525C/5D360863" Ref="#PWR0192"  Part="1" 
F 0 "#PWR0192" H 8900 5050 50  0001 C CNN
F 1 "GND" H 8822 5263 50  0000 R CNN
F 2 "" H 8900 5300 50  0001 C CNN
F 3 "" H 8900 5300 50  0001 C CNN
	1    8900 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D360855
P 9800 4800
AR Path="/5F67D4B5/5D360855" Ref="#PWR?"  Part="1" 
AR Path="/5D360855" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5D360855" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D360855" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D360855" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D360855" Ref="#PWR?"  Part="1" 
AR Path="/5DD5525C/5D360855" Ref="#PWR0193"  Part="1" 
F 0 "#PWR0193" H 9800 4650 50  0001 C CNN
F 1 "+5V" H 9815 4973 50  0000 C CNN
F 2 "" H 9800 4800 50  0001 C CNN
F 3 "" H 9800 4800 50  0001 C CNN
	1    9800 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D36084F
P 9800 5300
AR Path="/5F67D4B5/5D36084F" Ref="#PWR?"  Part="1" 
AR Path="/5D36084F" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5D36084F" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D36084F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D36084F" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D36084F" Ref="#PWR?"  Part="1" 
AR Path="/5DD5525C/5D36084F" Ref="#PWR0194"  Part="1" 
F 0 "#PWR0194" H 9800 5050 50  0001 C CNN
F 1 "GND" H 9805 5127 50  0000 C CNN
F 2 "" H 9800 5300 50  0001 C CNN
F 3 "" H 9800 5300 50  0001 C CNN
	1    9800 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1800 8800 1800
Wire Wire Line
	8350 1900 8800 1900
Wire Wire Line
	8350 2000 8800 2000
Wire Wire Line
	8350 2100 8800 2100
Wire Wire Line
	8350 2200 8800 2200
Wire Wire Line
	8350 2300 8800 2300
Wire Wire Line
	8350 2400 8800 2400
Wire Wire Line
	8350 2500 8800 2500
Wire Wire Line
	8350 2600 8800 2600
Wire Wire Line
	8350 2700 8800 2700
Wire Wire Line
	8350 2800 8800 2800
Wire Wire Line
	8350 2900 8800 2900
Wire Wire Line
	8350 3000 8800 3000
Wire Wire Line
	8350 3100 8800 3100
Wire Wire Line
	8350 3200 8800 3200
Wire Wire Line
	8350 3300 8800 3300
Wire Wire Line
	8350 3400 8800 3400
Wire Wire Line
	8350 3500 8800 3500
Wire Wire Line
	8350 3600 8800 3600
Wire Wire Line
	8350 3700 8800 3700
$Comp
L alexios:CFT-2019-Bus P?
U 3 1 5D3608F9
P 9300 1650
AR Path="/5D34E810/5D3608F9" Ref="P?"  Part="3" 
AR Path="/5D36B851/5D3608F9" Ref="P?"  Part="3" 
AR Path="/5F1DB2E8/5D3608F9" Ref="P?"  Part="3" 
AR Path="/5D3608F9" Ref="P?"  Part="3" 
AR Path="/5DD3D79F/5D34E810/5D3608F9" Ref="P?"  Part="3" 
AR Path="/5DD5525C/5D3608F9" Ref="P1"  Part="3" 
F 0 "P1" H 9300 1817 50  0000 C CNN
F 1 "CFT-2019-Bus" H 9300 1726 50  0000 C CNN
F 2 "alexios:CFT-2019-Card-Edge" H 9250 750 50  0001 C CNN
F 3 "" H 9250 750 50  0001 C CNN
	3    9300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1800 10250 1800
Wire Wire Line
	9800 1900 10250 1900
Wire Wire Line
	9800 2000 10250 2000
Wire Wire Line
	9800 2100 10250 2100
Wire Wire Line
	9800 2200 10250 2200
Wire Wire Line
	9800 2300 10250 2300
Wire Wire Line
	9800 2400 10250 2400
Wire Wire Line
	9800 2500 10250 2500
Wire Wire Line
	9800 2600 10250 2600
Wire Wire Line
	9800 2700 10250 2700
Wire Wire Line
	9800 2800 10250 2800
Wire Wire Line
	9800 2900 10250 2900
Wire Wire Line
	9800 3000 10250 3000
Wire Wire Line
	9800 3100 10250 3100
Wire Wire Line
	9800 3200 10250 3200
Wire Wire Line
	9800 3300 10250 3300
Wire Wire Line
	9800 3400 10250 3400
Wire Wire Line
	9800 3500 10250 3500
Wire Wire Line
	9800 3600 10250 3600
Wire Wire Line
	9800 3700 10250 3700
Text Label 8400 1800 0    50   ~ 0
C1
Text Label 8400 1900 0    50   ~ 0
C2
Text Label 8400 2000 0    50   ~ 0
C3
Text Label 8400 2100 0    50   ~ 0
C4
Text Label 8400 2200 0    50   ~ 0
C5
Text Label 8400 2300 0    50   ~ 0
C6
Text Label 8400 2400 0    50   ~ 0
C7
Text Label 8400 2500 0    50   ~ 0
C8
Text Label 8400 2600 0    50   ~ 0
C9
Text Label 8400 2700 0    50   ~ 0
C10
Text Label 8400 2800 0    50   ~ 0
C11
Text Label 8400 2900 0    50   ~ 0
C12
Text Label 8400 3000 0    50   ~ 0
C13
Text Label 8400 3100 0    50   ~ 0
C14
Text Label 8400 3200 0    50   ~ 0
C15
Text Label 8400 3300 0    50   ~ 0
C16
Text Label 8400 3400 0    50   ~ 0
C17
Text Label 8400 3500 0    50   ~ 0
C18
Text Label 8400 3600 0    50   ~ 0
C19
Text Label 8400 3700 0    50   ~ 0
C20
Text Label 10200 1800 2    50   ~ 0
C21
Text Label 10200 1900 2    50   ~ 0
C22
Text Label 10200 2000 2    50   ~ 0
C23
Text Label 10200 2100 2    50   ~ 0
C24
Text Label 10200 2200 2    50   ~ 0
C25
Text Label 10200 2300 2    50   ~ 0
C26
Text Label 10200 2400 2    50   ~ 0
C27
Text Label 10200 2500 2    50   ~ 0
C28
Text Label 10200 2600 2    50   ~ 0
C29
Text Label 10200 2700 2    50   ~ 0
C30
Text Label 10200 2800 2    50   ~ 0
C31
Text Label 10200 2900 2    50   ~ 0
C32
Text Label 10200 3000 2    50   ~ 0
C33
Text Label 10200 3100 2    50   ~ 0
C34
Text Label 10200 3200 2    50   ~ 0
C35
Text Label 10200 3300 2    50   ~ 0
C36
Text Label 10200 3400 2    50   ~ 0
C37
Text Label 10200 3500 2    50   ~ 0
C38
Text Label 10200 3600 2    50   ~ 0
C39
Text Label 10200 3700 2    50   ~ 0
C40
Wire Wire Line
	6500 2050 7200 2050
Wire Wire Line
	6500 2150 7200 2150
Wire Wire Line
	6500 2250 7200 2250
Wire Wire Line
	6500 2350 7200 2350
Wire Wire Line
	6500 2650 6850 2650
Wire Wire Line
	6500 2750 6850 2750
Text Label 7200 2050 2    50   ~ 0
RSVD1
Text Label 7200 2150 2    50   ~ 0
RSVD2
Text Label 7200 2250 2    50   ~ 0
RSVD3
Text Label 7200 2350 2    50   ~ 0
RSVD4
Entry Wire Line
	7200 2050 7300 2150
Entry Wire Line
	7200 2150 7300 2250
Entry Wire Line
	7200 2250 7300 2350
Entry Wire Line
	7200 2350 7300 2450
Entry Bus Bus
	7200 6150 7300 6050
Wire Bus Line
	7200 6150 1350 6150
Text HLabel 1350 6150 0    50   UnSpc ~ 0
RSVD[1..4]
Text Label 1450 6150 0    50   ~ 0
RSVD[1..4]
$Comp
L Device:CP_Small C?
U 1 1 5D8FC46B
P 8900 5000
AR Path="/5D8FC46B" Ref="C?"  Part="1" 
AR Path="/5D34E810/5D8FC46B" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8FC46B" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D8FC46B" Ref="C?"  Part="1" 
AR Path="/5DD5525C/5D8FC46B" Ref="C56"  Part="1" 
F 0 "C56" H 8812 5046 50  0000 R CNN
F 1 "47µF" H 8812 4955 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8900 5000 50  0001 C CNN
F 3 "~" H 8900 5000 50  0001 C CNN
	1    8900 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C?
U 1 1 5D908E0A
P 9800 5000
AR Path="/5D908E0A" Ref="C?"  Part="1" 
AR Path="/5D34E810/5D908E0A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D908E0A" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D908E0A" Ref="C?"  Part="1" 
AR Path="/5DD5525C/5D908E0A" Ref="C57"  Part="1" 
F 0 "C57" H 9888 5046 50  0000 L CNN
F 1 "47µF" H 9888 4955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9800 5000 50  0001 C CNN
F 3 "~" H 9800 5000 50  0001 C CNN
	1    9800 5000
	1    0    0    -1  
$EndComp
Text HLabel 8350 1800 0    50   UnSpc ~ 0
C1
Text HLabel 8350 1900 0    50   UnSpc ~ 0
C2
Text HLabel 8350 2000 0    50   UnSpc ~ 0
C3
Text HLabel 8350 2100 0    50   UnSpc ~ 0
C4
Text HLabel 8350 2200 0    50   UnSpc ~ 0
C5
Text HLabel 8350 2300 0    50   UnSpc ~ 0
C6
Text HLabel 8350 2400 0    50   UnSpc ~ 0
C7
Text HLabel 8350 2500 0    50   UnSpc ~ 0
C8
Text HLabel 8350 2600 0    50   UnSpc ~ 0
C9
Text HLabel 8350 2700 0    50   UnSpc ~ 0
C10
Text HLabel 8350 2800 0    50   UnSpc ~ 0
C11
Text HLabel 8350 2900 0    50   UnSpc ~ 0
C12
Text HLabel 8350 3000 0    50   UnSpc ~ 0
C13
Text HLabel 8350 3100 0    50   UnSpc ~ 0
C14
Text HLabel 8350 3200 0    50   UnSpc ~ 0
C15
Text HLabel 8350 3300 0    50   UnSpc ~ 0
C16
Text HLabel 8350 3400 0    50   UnSpc ~ 0
C17
Text HLabel 8350 3500 0    50   UnSpc ~ 0
C18
Text HLabel 8350 3600 0    50   UnSpc ~ 0
C19
Text HLabel 8350 3700 0    50   UnSpc ~ 0
C20
Text HLabel 10250 1800 2    50   UnSpc ~ 0
C21
Text HLabel 10250 1900 2    50   UnSpc ~ 0
C22
Text HLabel 10250 2000 2    50   UnSpc ~ 0
C23
Text HLabel 10250 2100 2    50   UnSpc ~ 0
C24
Text HLabel 10250 2200 2    50   UnSpc ~ 0
C25
Text HLabel 10250 2300 2    50   UnSpc ~ 0
C26
Text HLabel 10250 2400 2    50   UnSpc ~ 0
C27
Text HLabel 10250 2500 2    50   UnSpc ~ 0
C28
Text HLabel 10250 2600 2    50   UnSpc ~ 0
C29
Text HLabel 10250 2700 2    50   UnSpc ~ 0
C30
Text HLabel 10250 2800 2    50   UnSpc ~ 0
C31
Text HLabel 10250 2900 2    50   UnSpc ~ 0
C32
Text HLabel 10250 3000 2    50   UnSpc ~ 0
C33
Text HLabel 10250 3100 2    50   UnSpc ~ 0
C34
Text HLabel 10250 3200 2    50   UnSpc ~ 0
C35
Text HLabel 10250 3300 2    50   UnSpc ~ 0
C36
Text HLabel 10250 3400 2    50   UnSpc ~ 0
C37
Text HLabel 10250 3500 2    50   UnSpc ~ 0
C38
Text HLabel 10250 3600 2    50   UnSpc ~ 0
C39
Text HLabel 10250 3700 2    50   UnSpc ~ 0
C40
Wire Wire Line
	8950 4900 8900 4900
Wire Wire Line
	8950 5100 8900 5100
Wire Wire Line
	8900 5100 8900 5200
Wire Wire Line
	8900 5200 8950 5200
Connection ~ 8900 5200
Wire Wire Line
	9750 5200 9800 5200
Wire Wire Line
	9750 5100 9800 5100
Wire Wire Line
	9800 5100 9800 5200
Wire Wire Line
	8900 4900 8900 4800
Wire Wire Line
	8900 4800 8950 4800
Wire Wire Line
	9750 4800 9800 4800
Wire Wire Line
	9800 4900 9800 4800
Wire Wire Line
	9750 4900 9800 4900
Text Label 6750 2650 2    50   ~ 0
~RUEN
Text Label 6750 2750 2    50   ~ 0
~WUEN
Text HLabel 6850 2650 2    50   UnSpc ~ 0
~RUEN
Text HLabel 6850 2750 2    50   UnSpc ~ 0
~WUEN
Text Label 1450 5350 0    50   ~ 0
AB[0..23]
Entry Bus Bus
	1950 5350 2050 5250
Entry Wire Line
	2050 5150 2150 5050
Entry Wire Line
	2050 5050 2150 4950
Entry Wire Line
	2050 4950 2150 4850
Entry Wire Line
	2050 4850 2150 4750
Entry Wire Line
	2050 4750 2150 4650
Entry Wire Line
	2050 4650 2150 4550
Entry Wire Line
	2050 4550 2150 4450
Entry Wire Line
	2050 4450 2150 4350
Entry Wire Line
	2050 4350 2150 4250
Entry Wire Line
	2050 4250 2150 4150
Entry Wire Line
	2050 4150 2150 4050
Entry Wire Line
	2050 4050 2150 3950
Entry Wire Line
	2050 3950 2150 3850
Entry Wire Line
	2050 3850 2150 3750
Entry Wire Line
	2050 3750 2150 3650
Entry Wire Line
	2050 3650 2150 3550
Entry Wire Line
	2050 3550 2150 3450
Entry Wire Line
	2050 3450 2150 3350
Entry Wire Line
	2050 3350 2150 3250
Entry Wire Line
	2050 3250 2150 3150
Entry Wire Line
	2050 3150 2150 3050
Entry Wire Line
	2050 3050 2150 2950
Entry Wire Line
	2050 2950 2150 2850
Entry Wire Line
	2050 2850 2150 2750
$Comp
L power:+5V #PWR?
U 1 1 5D360869
P 8900 4800
AR Path="/5F67D4B5/5D360869" Ref="#PWR?"  Part="1" 
AR Path="/5D360869" Ref="#PWR?"  Part="1" 
AR Path="/5D34E810/5D360869" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D360869" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D360869" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5D34E810/5D360869" Ref="#PWR?"  Part="1" 
AR Path="/5DD5525C/5D360869" Ref="#PWR0195"  Part="1" 
F 0 "#PWR0195" H 8900 4650 50  0001 C CNN
F 1 "+5V" H 8842 4837 50  0000 R CNN
F 2 "" H 8900 4800 50  0001 C CNN
F 3 "" H 8900 4800 50  0001 C CNN
	1    8900 4800
	1    0    0    -1  
$EndComp
Connection ~ 8900 4900
Connection ~ 8900 5100
Wire Wire Line
	8900 5200 8900 5300
Wire Wire Line
	8950 5300 8900 5300
Connection ~ 8900 5300
Connection ~ 8900 4800
Connection ~ 9800 4800
Connection ~ 9800 4900
Connection ~ 9800 5100
Wire Wire Line
	9750 5300 9800 5300
Wire Wire Line
	9800 5200 9800 5300
Connection ~ 9800 5200
Connection ~ 9800 5300
Text HLabel 2150 2350 0    50   UnSpc ~ 0
WSTB
Wire Bus Line
	7200 2950 7200 5950
Wire Bus Line
	7100 3450 7100 5850
Wire Bus Line
	7000 3950 7000 5750
Wire Bus Line
	7300 2150 7300 6050
Wire Bus Line
	4800 3550 4800 5650
Wire Bus Line
	4350 2850 4350 5450
Wire Bus Line
	4250 3650 4250 5350
Wire Bus Line
	4700 1850 4700 5550
Wire Bus Line
	2050 2850 2050 5250
$EndSCHEMATC
