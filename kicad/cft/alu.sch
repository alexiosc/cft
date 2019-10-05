EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 16 35
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5700 1050 1150 750 
U 5E018EB3
F0 "16-bit Adder" 50
F1 "alu_add.sch" 50
F2 "CIN" T L 5700 1200 50 
F3 "~OE" T L 5700 1350 50 
F4 "B[0..15]" I L 5700 1650 50 
F5 "A[0..15]" I L 5700 1500 50 
F6 "COUT" O R 6850 1650 50 
F7 "Y[0..15]" T R 6850 1350 50 
F8 "FV" O R 6850 1500 50 
$EndSheet
$Sheet
S 5700 2000 1150 600 
U 5E07FB0D
F0 "Bitwise AND" 50
F1 "alu_and.sch" 50
F2 "~OE" T L 5700 2150 50 
F3 "Y[0..15]" T R 6850 2300 50 
F4 "A[0..15]" I L 5700 2300 50 
F5 "B[0..15]" I L 5700 2450 50 
$EndSheet
$Sheet
S 5700 2800 1150 600 
U 5E52B121
F0 "Bitwise OR" 50
F1 "alu_or.sch" 50
F2 "~OE" T L 5700 2950 50 
F3 "Y[0..15]" T R 6850 3100 50 
F4 "A[0..15]" I L 5700 3100 50 
F5 "B[0..15]" I L 5700 3250 50 
$EndSheet
$Sheet
S 5700 3600 1150 600 
U 5E5E01B2
F0 "Exclusive OR" 50
F1 "alu_xor.sch" 50
F2 "~OE" T L 5700 3750 50 
F3 "Y[0..15]" T R 6850 3900 50 
F4 "A[0..15]" I L 5700 3900 50 
F5 "B[0..15]" I L 5700 4050 50 
$EndSheet
Wire Bus Line
	6850 1350 7450 1350
Wire Bus Line
	6850 2300 7450 2300
Wire Bus Line
	6850 3100 7450 3100
Wire Bus Line
	6850 3900 7450 3900
$Sheet
S 5700 4400 1150 450 
U 89DA1FAA
F0 "Bit Inverter (NOT)" 50
F1 "alu_not.sch" 50
F2 "Y[0..15]" T R 6850 4700 50 
F3 "A[0..15]" I L 5700 4700 50 
F4 "~OE" I L 5700 4550 50 
$EndSheet
Entry Bus Bus
	7450 4700 7550 4600
Entry Bus Bus
	7450 3900 7550 3800
Entry Bus Bus
	7450 3100 7550 3000
Entry Bus Bus
	7450 2300 7550 2200
Wire Bus Line
	6850 4700 7450 4700
Entry Bus Bus
	7450 1350 7550 1250
Entry Bus Bus
	7550 750  7450 650 
Text HLabel 1200 1650 0    50   3State ~ 0
IBUS[0..15]
Text Label 6950 4700 0    50   ~ 0
IBUS[0..15]
Text Label 6950 3900 0    50   ~ 0
IBUS[0..15]
Text Label 6950 3100 0    50   ~ 0
IBUS[0..15]
Text Label 6950 2300 0    50   ~ 0
IBUS[0..15]
Text Label 6950 1350 0    50   ~ 0
IBUS[0..15]
Text Label 5650 2150 2    50   ~ 0
~READ-ALU-AND
Text Label 5650 2950 2    50   ~ 0
~READ-ALU-OR
Text Label 5650 3750 2    50   ~ 0
~READ-ALU-XOR
Text Label 3800 1500 0    50   ~ 0
A[0..15]
Text Label 3800 1650 0    50   ~ 0
B[0..15]
Entry Bus Bus
	4700 1650 4800 1750
Entry Bus Bus
	4950 2200 5050 2300
Entry Bus Bus
	4950 3000 5050 3100
Entry Bus Bus
	4950 3800 5050 3900
Entry Bus Bus
	4950 4600 5050 4700
Text Label 5650 4550 2    50   ~ 0
~READ-ALU-NOT
Entry Bus Bus
	4800 2200 4900 2300
Text Label 5650 1500 2    50   ~ 0
A[0..15]
Text Label 5650 2300 2    50   ~ 0
A[0..15]
Text Label 5500 3100 2    50   ~ 0
A[0..15]
Text Label 5650 3900 2    50   ~ 0
A[0..15]
Text Label 5650 4700 2    50   ~ 0
A[0..15]
Wire Bus Line
	5050 2300 5700 2300
Wire Bus Line
	5050 4700 5700 4700
Wire Bus Line
	5050 3100 5700 3100
Text Label 5650 1650 2    50   ~ 0
B[0..15]
Text Label 5650 2450 2    50   ~ 0
B[0..15]
Text Label 5500 3250 2    50   ~ 0
B[0..15]
Text Label 5650 4050 2    50   ~ 0
B[0..15]
$Comp
L alexios:74HC138 U2601
U 1 1 5CFB457F
P 2850 3150
F 0 "U2601" H 2850 3817 50  0000 C CNN
F 1 "74HC138" H 2850 3726 50  0000 C CNN
F 2 "" H 2850 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2850 3150 50  0001 C CNN
	1    2850 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2750 2000 2750
Wire Wire Line
	2350 2850 2000 2850
Wire Wire Line
	2350 2950 2000 2950
Wire Wire Line
	2350 3350 2000 3350
Wire Wire Line
	2350 3450 2000 3450
Text Label 2050 2750 0    50   ~ 0
RADDR0
Text Label 2050 2850 0    50   ~ 0
RADDR1
Text Label 2050 2950 0    50   ~ 0
RADDR2
Text Label 2050 3350 0    50   ~ 0
RADDR4
Text Label 2050 3450 0    50   ~ 0
RADDR3
Text Label 2050 3550 0    50   ~ 0
~RUEN
Entry Wire Line
	1900 2650 2000 2750
Entry Wire Line
	1900 2750 2000 2850
Entry Wire Line
	1900 2850 2000 2950
Entry Wire Line
	1900 3250 2000 3350
Entry Wire Line
	1900 3350 2000 3450
Entry Bus Bus
	1800 2500 1900 2600
Wire Wire Line
	1200 3550 2350 3550
Text HLabel 1200 3550 0    50   Input ~ 0
~RUEN
Text Label 3350 2750 0    50   ~ 0
~READ-ALU-ADD
Text Label 3350 2850 0    50   ~ 0
~READ-ALU-AND
Text Label 3350 2950 0    50   ~ 0
~READ-ALU-OR
Text Label 3350 3050 0    50   ~ 0
~READ-ALU-XOR
Text Label 3350 3150 0    50   ~ 0
~READ-ALU-NOT
NoConn ~ 3350 3350
NoConn ~ 3350 3450
Wire Bus Line
	5050 4050 5700 4050
Wire Bus Line
	5050 3900 5700 3900
Wire Bus Line
	2600 1350 1200 1350
Entry Bus Bus
	2300 650  2200 750 
Wire Bus Line
	2200 1550 2200 750 
Text Label 2950 650  0    50   ~ 0
IBUS[0..15]
Text Label 6100 650  0    50   ~ 0
IBUS[0..15]
Text Label 7550 2150 1    50   ~ 0
IBUS[0..15]
Text Label 4950 2150 1    50   ~ 0
A[0..15]
Text Label 4800 2150 1    50   ~ 0
B[0..15]
Entry Bus Bus
	2200 1550 2100 1650
Text Label 1300 1650 0    50   ~ 0
IBUS[0..15]
Text Label 1300 1350 0    50   ~ 0
AC[0..15]
Text Label 1650 1200 2    50   ~ 0
CLK4
Text HLabel 1200 1200 0    50   Input ~ 0
CLK4
Text HLabel 1200 1350 0    50   Input ~ 0
AC[0..15]
Text Label 1300 5250 0    50   ~ 0
FL
Wire Bus Line
	4900 2300 5050 2450
Wire Bus Line
	5050 2450 5700 2450
Entry Bus Bus
	4800 3000 4900 3100
Wire Bus Line
	4900 3100 5050 3250
Entry Bus Bus
	4800 3800 4900 3900
Wire Bus Line
	4900 3900 5050 4050
Wire Bus Line
	4800 1600 4950 1750
Entry Bus Bus
	4700 1500 4800 1600
Text Notes 7200 6950 0    197  ~ 39
Arithmetic/Logic Unit
Text Label 1300 2500 0    50   ~ 0
RADDR[0..4]
Text HLabel 1200 2500 0    50   Input ~ 0
RADDR[0..4]
Wire Bus Line
	1800 2500 1200 2500
Wire Wire Line
	2400 1500 2600 1500
$Comp
L alexios:74LVC1G08 U2209
U 2 1 5D2E632C
P 2800 7250
F 0 "U2209" H 2880 7196 50  0000 L CNN
F 1 "74LVC1G08" H 2880 7105 50  0000 L CNN
F 2 "" H 2450 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2450 7250 50  0001 C CNN
	2    2800 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U2601
U 2 1 5D2E73E6
P 1400 7350
F 0 "U2601" H 1580 7396 50  0000 L CNN
F 1 "74HC138" H 1580 7305 50  0000 L CNN
F 2 "" H 1400 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1400 7350 50  0001 C CNN
	2    1400 7350
	1    0    0    -1  
$EndComp
Wire Bus Line
	2300 650  7450 650 
Text HLabel 9750 5100 2    50   Output ~ 0
FLCP
Text HLabel 9750 5600 2    50   Output ~ 0
FLOUT
Wire Wire Line
	6850 1650 8000 1650
$Comp
L Device:C_Small C?
U 1 1 5D31C83B
P 1050 7350
AR Path="/5CC0D65F/5D31C83B" Ref="C?"  Part="1" 
AR Path="/5D31C83B" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D31C83B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D31C83B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D31C83B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D31C83B" Ref="C2601"  Part="1" 
F 0 "C2601" H 959 7396 50  0000 R CNN
F 1 "100nF" H 959 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7350 50  0001 C CNN
F 3 "~" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D31C841
P 1050 7450
AR Path="/5D31C841" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D31C841" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D31C841" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D31C841" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D31C841" Ref="#PWR02602"  Part="1" 
F 0 "#PWR02602" H 1050 7200 50  0001 C CNN
F 1 "GND" H 1055 7277 50  0000 C CNN
F 2 "" H 1050 7450 50  0001 C CNN
F 3 "" H 1050 7450 50  0001 C CNN
	1    1050 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D31C848
P 1050 7250
AR Path="/5D31C848" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D31C848" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D31C848" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D31C848" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D31C848" Ref="#PWR02601"  Part="1" 
F 0 "#PWR02601" H 1050 7100 50  0001 C CNN
F 1 "+5V" H 1065 7423 50  0000 C CNN
F 2 "" H 1050 7250 50  0001 C CNN
F 3 "" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D31D8AA
P 2350 7350
AR Path="/5CC0D65F/5D31D8AA" Ref="C?"  Part="1" 
AR Path="/5D31D8AA" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D31D8AA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D31D8AA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D31D8AA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D31D8AA" Ref="C2602"  Part="1" 
F 0 "C2602" H 2259 7396 50  0000 R CNN
F 1 "100nF" H 2259 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 7350 50  0001 C CNN
F 3 "~" H 2350 7350 50  0001 C CNN
	1    2350 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D31D8B0
P 2350 7450
AR Path="/5D31D8B0" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D31D8B0" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D31D8B0" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D31D8B0" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D31D8B0" Ref="#PWR02604"  Part="1" 
F 0 "#PWR02604" H 2350 7200 50  0001 C CNN
F 1 "GND" H 2355 7277 50  0000 C CNN
F 2 "" H 2350 7450 50  0001 C CNN
F 3 "" H 2350 7450 50  0001 C CNN
	1    2350 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D31D8B6
P 2350 7250
AR Path="/5D31D8B6" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D31D8B6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D31D8B6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D31D8B6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D31D8B6" Ref="#PWR02603"  Part="1" 
F 0 "#PWR02603" H 2350 7100 50  0001 C CNN
F 1 "+5V" H 2365 7423 50  0000 C CNN
F 2 "" H 2350 7250 50  0001 C CNN
F 3 "" H 2350 7250 50  0001 C CNN
	1    2350 7250
	1    0    0    -1  
$EndComp
Connection ~ 1050 7250
Connection ~ 1050 7450
Connection ~ 2350 7450
Connection ~ 2350 7250
Text Notes 2900 3350 1    50   ~ 10
RADDR=10xxx
$Sheet
S 5700 5250 1150 2100
U 5D396E91
F0 "sheet5D396E82" 50
F1 "Serial_Shifter.sch" 50
F2 "CLK2" I L 5700 5550 50 
F3 "CLK4" I L 5700 5700 50 
F4 "DIST[0..3]" I L 5700 6200 50 
F5 "~SHIFT~∕ROTATE" I L 5700 6650 50 
F6 "~LOGIC~∕ARITH" I L 5700 6500 50 
F7 "~LEFT~∕RIGHT" I L 5700 6350 50 
F8 "B[0..15]" I L 5700 5850 50 
F9 "~RESET" I L 5700 5400 50 
F10 "IBUS[0..15]" B R 6850 5550 50 
F11 "FLOUT" O R 6850 5700 50 
F12 "FL" I L 5700 6000 50 
F13 "BCP" O R 6850 5850 50 
F14 "~START" I L 5700 6800 50 
$EndSheet
Entry Bus Bus
	4800 5750 4900 5850
Wire Bus Line
	4900 5850 5700 5850
Text Label 5150 5850 0    50   ~ 0
B[0..15]
Text Label 3350 3250 0    50   ~ 0
~READ-ALU-B
Wire Wire Line
	5700 6800 1200 6800
Text HLabel 1200 6800 0    50   Input ~ 0
~ACTION-SRU
Wire Wire Line
	5700 6650 3150 6650
Wire Wire Line
	5700 6500 3150 6500
Wire Wire Line
	5700 6350 3150 6350
Wire Bus Line
	5700 6200 3900 6200
Entry Bus Bus
	3900 6200 3800 6100
Wire Wire Line
	3700 5650 3150 5650
Wire Wire Line
	3700 5750 3150 5750
Wire Wire Line
	3700 5950 3150 5950
Text Label 3700 5650 2    50   ~ 0
DIST0
Text Label 3700 5750 2    50   ~ 0
DIST1
Text Label 3700 5850 2    50   ~ 0
DIST2
Text Label 3700 5950 2    50   ~ 0
DIST3
Text Label 3200 5650 0    50   ~ 0
IR0
Text Label 3200 5750 0    50   ~ 0
IR1
Text Label 3200 5850 0    50   ~ 0
IR2
Text Label 3200 5950 0    50   ~ 0
IR3
Entry Wire Line
	3800 5750 3700 5650
Entry Wire Line
	3800 5850 3700 5750
Entry Wire Line
	3800 5950 3700 5850
Entry Wire Line
	3800 6050 3700 5950
Wire Wire Line
	3700 5850 3150 5850
Text Label 3250 6350 0    50   ~ 0
IR4
Text Label 3250 6500 0    50   ~ 0
IR5
Text Label 3250 6650 0    50   ~ 0
IR6
Text Label 5500 6200 2    50   ~ 0
DIST[0..3]
Text Label 5500 6350 2    50   ~ 0
IR4
Text Label 5500 6500 2    50   ~ 0
IR5
Text Label 5500 6650 2    50   ~ 0
IR6
Wire Wire Line
	5150 5400 5700 5400
Text Label 1300 6800 0    50   ~ 0
~ACTION-SRU
Text Label 5500 6800 2    50   ~ 0
~ACTION-SRU
Wire Wire Line
	5700 5700 5150 5700
Wire Wire Line
	5700 5550 5150 5550
Text Label 5150 5700 0    50   ~ 0
CLK4
Wire Wire Line
	6850 5850 7800 5850
Wire Wire Line
	7800 5850 7800 5050
Wire Wire Line
	7800 5050 4650 5050
Wire Wire Line
	4650 5050 4650 2250
$Comp
L alexios:74LVC1G08 U2603
U 1 1 5D2D7C39
P 3050 2300
F 0 "U2603" H 2975 2033 50  0000 C CNN
F 1 "74LVC1G08" H 2975 2124 50  0000 C CNN
F 2 "" H 2700 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2700 2300 50  0001 C CNN
	1    3050 2300
	-1   0    0    1   
$EndComp
Text Label 3400 2250 0    50   ~ 0
BCP
Text Label 7000 5850 0    50   ~ 0
BCP
Text Label 5500 5050 2    50   ~ 0
BCP
Text Label 4650 3700 1    50   ~ 0
BCP
Text Label 5150 5400 0    50   ~ 0
~RESET
Text Label 5150 5550 0    50   ~ 0
CLK2
Text Label 5150 6000 0    50   ~ 0
FL
Text HLabel 1200 1050 0    50   Input ~ 0
CLK2
Wire Wire Line
	1650 1050 1200 1050
Text Label 5650 1200 2    50   ~ 0
FL
Text Label 5650 1350 2    50   ~ 0
~READ-ALU-ADD
Wire Wire Line
	9750 5100 9200 5100
Text Label 3850 1200 0    50   ~ 0
~READ-ALU-B
Entry Bus Bus
	2200 1550 2300 1650
Wire Bus Line
	1200 1650 2100 1650
Wire Bus Line
	2300 1650 2600 1650
Entry Wire Line
	3150 5950 3050 5850
Entry Wire Line
	3150 5850 3050 5750
Entry Wire Line
	3150 5750 3050 5650
Entry Wire Line
	3150 5650 3050 5550
Entry Wire Line
	3050 6550 3150 6650
Entry Wire Line
	3050 6400 3150 6500
Entry Wire Line
	3150 6350 3050 6250
Entry Bus Bus
	2950 5400 3050 5500
Text Label 1300 5400 0    50   ~ 0
IR[0..6]
Wire Bus Line
	1200 5400 2950 5400
Text HLabel 1200 5400 0    50   Input ~ 0
IR[0..6]
Text Label 1650 1050 2    50   ~ 0
CLK2
Wire Wire Line
	1200 1200 2600 1200
Text HLabel 1200 900  0    50   Input ~ 0
~RESET
Wire Wire Line
	1200 900  1650 900 
Text Label 1650 900  2    50   ~ 0
~RESET
$Comp
L alexios:74LVC2G157 U2604
U 1 1 5D8C718E
P 8950 5700
F 0 "U2604" H 8950 6067 50  0000 C CNN
F 1 "74LVC2G157" H 8950 5976 50  0000 C CNN
F 2 "" H 8850 5825 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 8850 5825 50  0001 C CNN
	1    8950 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 5600 9750 5600
Text Label 9350 5600 0    50   ~ 0
FLOUT
NoConn ~ 9300 5900
Wire Wire Line
	8000 1650 8000 5600
Wire Wire Line
	8000 5600 8600 5600
Wire Wire Line
	6850 5700 8600 5700
$Comp
L power:GND #PWR02605
U 1 1 5D8FFD85
P 8600 5900
F 0 "#PWR02605" H 8600 5650 50  0001 C CNN
F 1 "GND" H 8605 5727 50  0000 C CNN
F 2 "" H 8600 5900 50  0001 C CNN
F 3 "" H 8600 5900 50  0001 C CNN
	1    8600 5900
	1    0    0    -1  
$EndComp
Entry Bus Bus
	7450 5550 7550 5450
Wire Bus Line
	6850 5550 7450 5550
Text Label 6950 5550 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	4550 6000 5700 6000
Wire Wire Line
	1200 5250 4550 5250
Wire Wire Line
	4550 1200 5700 1200
Text Label 4550 3700 1    50   ~ 0
FL
Entry Bus Bus
	7450 1350 7550 1450
Entry Bus Bus
	7450 2300 7550 2400
Entry Bus Bus
	7450 3100 7550 3200
Entry Bus Bus
	7450 3900 7550 4000
Entry Bus Bus
	7450 4700 7550 4800
Wire Bus Line
	7550 5450 7550 4800
Wire Bus Line
	7550 4600 7550 4000
Wire Bus Line
	7550 3800 7550 3200
Wire Bus Line
	7550 3000 7550 2400
Wire Bus Line
	7550 2200 7550 1450
Wire Bus Line
	7550 750  7550 1250
Text Label 8550 5800 2    50   ~ 0
~READ-ALU-ADD
Wire Wire Line
	8600 5800 7900 5800
$Comp
L alexios:74LVC1G08 U2605
U 1 1 5D94DBE2
P 9050 5100
F 0 "U2605" H 8975 5367 50  0000 C CNN
F 1 "74LVC1G08" H 8975 5276 50  0000 C CNN
F 2 "" H 8700 5100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 8700 5100 50  0001 C CNN
	1    9050 5100
	1    0    0    -1  
$EndComp
Connection ~ 7800 5050
Text Label 8700 5050 2    50   ~ 0
BCP
Wire Wire Line
	8750 5150 7900 5150
Wire Wire Line
	4450 2750 4450 1350
Wire Wire Line
	3350 2750 4450 2750
Wire Wire Line
	4450 1350 5700 1350
Text Label 7000 5700 0    50   ~ 0
FLOUT-SRU
Text Label 8550 5700 2    50   ~ 0
FLOUT-SRU
Text Label 6950 1650 0    50   ~ 0
FLOUT-ADD
Text Label 8550 5600 2    50   ~ 0
FLOUT-ADD
Text Label 8700 5150 2    50   ~ 0
~READ-ALU-ADD
Text Notes 8450 4700 0    79   ~ 16
Link Register Output\n(ADD and SBU ops)
Wire Wire Line
	4450 2750 4450 5150
Connection ~ 4450 2750
Connection ~ 7900 5150
Wire Wire Line
	7900 5150 7900 5800
Text Label 4450 3700 1    50   ~ 0
~READ-ALU-ADD
Text Label 5350 5150 0    50   ~ 0
~READ-ALU-ADD
Wire Wire Line
	4150 3250 4150 1200
Wire Wire Line
	3350 3250 4150 3250
Wire Wire Line
	3750 1200 4150 1200
Wire Wire Line
	4350 2850 4350 2150
Wire Wire Line
	3350 2850 4350 2850
Wire Wire Line
	4350 2150 5700 2150
Wire Wire Line
	4350 3050 4350 3750
Wire Wire Line
	3350 3050 4350 3050
Wire Wire Line
	4350 3750 5700 3750
Connection ~ 4550 5250
Wire Wire Line
	4550 5250 4550 6000
Wire Wire Line
	4550 1200 4550 5250
Wire Wire Line
	4250 3150 4250 4550
Wire Wire Line
	4250 4550 5700 4550
Wire Wire Line
	3350 3150 4250 3150
Text Label 4350 3700 1    50   ~ 0
~READ-ALU-XOR
Text Label 4150 2650 1    50   ~ 0
~READ-B
Text Label 4550 2650 1    50   ~ 0
FL
Text Label 4650 2650 1    50   ~ 0
BCP
Text Label 4650 4450 1    50   ~ 0
BCP
Text Label 4550 4450 1    50   ~ 0
FL
Text Label 4250 4450 1    50   ~ 0
~READ-ALU-NOT
$Sheet
S 2600 1050 1150 750 
U 5CF5A95E
F0 "ALU A & B Port Registers" 50
F1 "alu_reg.sch" 50
F2 "IBUS[0..15]" B L 2600 1650 50 
F3 "B[0..15]" T R 3750 1650 50 
F4 "A[0..15]" T R 3750 1500 50 
F5 "AC[0..15]" I L 2600 1350 50 
F6 "BCP" I L 2600 1500 50 
F7 "ACP" I L 2600 1200 50 
F8 "~BOE" I R 3750 1200 50 
$EndSheet
Text Notes 6800 4550 2    79   ~ 16
NOT
Text Notes 6800 3750 2    79   ~ 16
XOR
Text Notes 6800 2950 2    79   ~ 16
OR
Text Notes 6800 2150 2    79   ~ 16
AND
Text Notes 6800 1200 2    79   ~ 16
ADD
Text Notes 6800 5400 2    79   ~ 16
SRU
$Comp
L alexios:74HC138 U2602
U 1 1 5DA9723E
P 2850 4550
F 0 "U2602" H 2850 5217 50  0000 C CNN
F 1 "74HC138" H 2850 5126 50  0000 C CNN
F 2 "" H 2850 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2850 4550 50  0001 C CNN
	1    2850 4550
	1    0    0    -1  
$EndComp
Text Notes 2900 4800 1    50   ~ 10
WADDR=10xxx
Wire Wire Line
	2350 4250 2000 4250
Wire Wire Line
	2350 4350 2000 4350
Wire Wire Line
	2350 4750 2000 4750
Wire Wire Line
	2350 4850 2000 4850
Entry Wire Line
	1900 4050 2000 4150
Entry Wire Line
	1900 4150 2000 4250
Entry Wire Line
	1900 4250 2000 4350
Entry Wire Line
	1900 4650 2000 4750
Entry Wire Line
	1900 4750 2000 4850
Entry Bus Bus
	1800 3900 1900 4000
Text Label 1300 3900 0    50   ~ 0
WADDR[0..4]
Text HLabel 1200 3900 0    50   Input ~ 0
WADDR[0..4]
Wire Bus Line
	1800 3900 1200 3900
Wire Wire Line
	2350 4150 2000 4150
Text Label 2050 4150 0    50   ~ 0
WADDR0
Text Label 2050 4250 0    50   ~ 0
WADDR1
Text Label 2050 4350 0    50   ~ 0
WADDR2
Text Label 2050 4850 0    50   ~ 0
WADDR3
Text Label 2050 4750 0    50   ~ 0
WADDR4
Wire Wire Line
	1200 4950 2350 4950
Text HLabel 1200 4950 0    50   Input ~ 0
~WUEN
Text Label 1300 4950 0    50   ~ 0
~WUEN
NoConn ~ 3350 4150
NoConn ~ 3350 4250
NoConn ~ 3350 4350
NoConn ~ 3350 4450
NoConn ~ 3350 4550
NoConn ~ 3350 4750
NoConn ~ 3350 4850
Wire Wire Line
	4050 4650 4050 2350
Wire Wire Line
	4050 2350 3350 2350
Wire Wire Line
	3350 4650 4050 4650
Wire Wire Line
	3350 2250 4650 2250
Wire Wire Line
	2400 2300 2900 2300
Wire Wire Line
	2400 1500 2400 2300
Text Label 3450 4650 0    50   ~ 0
~WRITE-ALU-B
Text Label 3400 2350 0    50   ~ 0
~WRITE-ALU-B
Wire Wire Line
	3350 2950 5700 2950
Wire Bus Line
	5050 3250 5700 3250
Text Label 9350 5100 0    50   ~ 0
FLCP
Wire Wire Line
	7800 5050 8750 5050
Wire Wire Line
	4450 5150 7900 5150
Wire Wire Line
	6850 1500 9750 1500
Text HLabel 9750 1500 2    50   Output ~ 0
FV
Text Label 6950 1500 0    50   ~ 0
FV
Text Label 9100 1500 0    50   ~ 0
FV
Text Label 9100 1650 0    50   ~ 0
~READ-ALU-ADD
Wire Wire Line
	9100 1650 9750 1650
Text HLabel 9750 1650 2    50   Output ~ 0
FVCP
Text HLabel 1200 5250 0    50   Input ~ 0
FLFAST
Wire Notes Line rgb(255, 0, 0)
	8300 1200 10600 1200
Wire Notes Line rgb(255, 0, 0)
	10600 1200 10600 6350
Wire Notes Line rgb(255, 0, 0)
	10600 6350 8300 6350
Wire Notes Line rgb(255, 0, 0)
	8300 6350 8300 1200
Text Notes 8300 1150 0    100  ~ 20
Redo these!
Wire Bus Line
	3750 1500 5700 1500
Wire Bus Line
	3750 1650 5700 1650
Wire Bus Line
	1900 4000 1900 4750
Wire Bus Line
	3800 5750 3800 6100
Wire Bus Line
	1900 2600 1900 3350
Wire Bus Line
	4800 1750 4800 5750
Wire Bus Line
	4950 1750 4950 4600
Wire Bus Line
	3050 5500 3050 6550
$EndSCHEMATC
