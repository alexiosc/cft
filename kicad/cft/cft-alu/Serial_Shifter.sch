EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 9
Title "17-bit Shift/Rotate Unit"
Date "2019-11-17"
Rev ""
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2700 2350 2700 2450
Wire Wire Line
	1150 2450 1250 2450
Text Label 1700 2250 2    50   ~ 0
CLK2
Wire Wire Line
	2700 2800 2700 2900
Wire Wire Line
	1150 2900 1250 2900
Text Label 1700 2700 2    50   ~ 0
CLK4
Wire Wire Line
	3350 2750 3400 2750
Wire Wire Line
	2700 2800 2800 2800
Wire Wire Line
	2700 2350 2800 2350
Wire Wire Line
	3350 2300 3400 2300
Wire Wire Line
	3400 2300 3400 2450
$Comp
L alexios:74AC191 U?
U 1 1 6A1AE719
P 5250 2000
AR Path="/5CE09726/6A1AE719" Ref="U?"  Part="1" 
AR Path="/6A313729/6A1AE719" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE719" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE719" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/6A1AE719" Ref="U?"  Part="1" 
F 0 "U?" H 5250 1325 50  0000 C CNN
F 1 "74AC191" H 5250 1234 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5225 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 5225 2000 50  0001 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6A1AE71F
P 4750 2200
AR Path="/5CE09726/6A1AE71F" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/6A1AE71F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE71F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE71F" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/6A1AE71F" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 4750 2050 50  0001 C CNN
F 1 "+5V" V 4765 2328 50  0000 L CNN
F 2 "" H 4750 2200 50  0001 C CNN
F 3 "" H 4750 2200 50  0001 C CNN
	1    4750 2200
	0    -1   -1   0   
$EndComp
Text Label 4750 2500 2    50   ~ 0
x4CLK
Text HLabel 1150 2450 0    50   Input ~ 0
CLK2
Text HLabel 1150 2900 0    50   Input ~ 0
CLK4
Connection ~ 1250 2450
Text HLabel 1150 1000 0    50   Input ~ 0
DIST[0..3]
NoConn ~ 5750 1600
NoConn ~ 5750 1700
NoConn ~ 5750 1800
NoConn ~ 5750 1900
Text Label 4750 1600 2    50   ~ 0
DIST0
Text Label 4750 1700 2    50   ~ 0
DIST1
Text Label 4750 1800 2    50   ~ 0
DIST2
Text Label 4750 1900 2    50   ~ 0
DIST3
Text Label 1200 5000 0    50   ~ 0
~LEFT
Text Label 3700 4700 0    50   ~ 0
~LOGIC~∕ARITH
Text Label 5500 3300 2    50   ~ 0
MSB
Text Label 5500 4000 2    50   ~ 0
LSB
$Comp
L power:GND #PWR?
U 1 1 6A1AE749
P 4250 4500
AR Path="/5CE09726/6A1AE749" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/6A1AE749" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE749" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE749" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/6A1AE749" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 4250 4250 50  0001 C CNN
F 1 "GND" H 4100 4500 50  0000 C CNN
F 2 "" H 4250 4500 50  0001 C CNN
F 3 "" H 4250 4500 50  0001 C CNN
	1    4250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4500 4350 4500
Wire Wire Line
	4350 3800 4250 3800
Wire Wire Line
	4250 3800 4250 4000
Connection ~ 4250 4500
Wire Wire Line
	4250 3300 4250 3800
Connection ~ 4250 3800
Wire Wire Line
	4350 4000 4250 4000
Connection ~ 4250 4000
Wire Wire Line
	4250 4000 4250 4100
Text Label 3700 4800 0    50   ~ 0
~SHIFT~∕ROTATE
Wire Wire Line
	4350 4700 1150 4700
Wire Wire Line
	4350 3400 4050 3400
Text Label 3650 3400 0    50   ~ 0
B15
Wire Wire Line
	4350 3500 4150 3500
Wire Wire Line
	4350 4100 4250 4100
Connection ~ 4250 4100
Wire Wire Line
	4250 4100 4250 4500
Wire Wire Line
	4350 4200 4150 4200
Text HLabel 1150 4800 0    50   Input ~ 0
~SHIFT~∕ROTATE
Text HLabel 1150 4700 0    50   Input ~ 0
~LOGIC~∕ARITH
Wire Wire Line
	8650 2900 8350 2900
Wire Wire Line
	8650 3000 8350 3000
Wire Wire Line
	8650 3100 8350 3100
Wire Wire Line
	8650 3200 8350 3200
Wire Wire Line
	8650 3300 8350 3300
Wire Wire Line
	8650 3400 8350 3400
Wire Wire Line
	8650 3500 8350 3500
Wire Wire Line
	8650 3600 8400 3600
Text HLabel 1150 5000 0    50   Input ~ 0
~LEFT~∕RIGHT
Wire Wire Line
	1750 5200 1700 5200
Text Label 6500 2300 2    50   ~ 0
TC
Wire Wire Line
	4750 1600 4500 1600
Wire Wire Line
	4750 1700 4500 1700
Wire Wire Line
	4750 1800 4500 1800
Wire Wire Line
	4750 1900 4500 1900
Entry Wire Line
	4500 1600 4400 1500
Entry Wire Line
	4500 1700 4400 1600
Entry Wire Line
	4500 1800 4400 1700
Entry Wire Line
	4500 1900 4400 1800
Wire Bus Line
	1150 1000 4300 1000
Entry Bus Bus
	4300 1000 4400 1100
Text HLabel 1150 850  0    50   Input ~ 0
B[0..15]
Wire Bus Line
	1150 850  6000 850 
Entry Bus Bus
	6000 850  6100 950 
Entry Wire Line
	6100 1400 6200 1500
Entry Wire Line
	6100 1500 6200 1600
Entry Wire Line
	6100 1600 6200 1700
Entry Wire Line
	6100 1700 6200 1800
Entry Wire Line
	6100 1800 6200 1900
Entry Wire Line
	6100 1900 6200 2000
Entry Wire Line
	6100 2000 6200 2100
Entry Wire Line
	6100 2800 6200 2900
Entry Wire Line
	6100 2900 6200 3000
Entry Wire Line
	6100 3000 6200 3100
Entry Wire Line
	6100 3100 6200 3200
Entry Wire Line
	6100 3200 6200 3300
Entry Wire Line
	6100 3300 6200 3400
Entry Wire Line
	6100 3400 6200 3500
Text Label 6500 3800 2    50   ~ 0
TC
Text Label 8650 2900 2    50   ~ 0
B9
Text Label 8650 3000 2    50   ~ 0
B10
Text Label 8650 3100 2    50   ~ 0
B11
Text Label 8650 3200 2    50   ~ 0
B12
Text Label 8650 3300 2    50   ~ 0
B13
Text Label 8650 3400 2    50   ~ 0
B14
Text Label 8650 3500 2    50   ~ 0
B15
Text Label 8400 3600 0    50   ~ 0
MSB
Text Label 6500 2400 2    50   ~ 0
~LEFT
Text Label 6500 3900 2    50   ~ 0
~LEFT
NoConn ~ 5750 2100
Text HLabel 1150 1450 0    50   Input ~ 0
~START
Wire Wire Line
	1150 1450 1850 1450
Text HLabel 1150 1350 0    50   Input ~ 0
~RESET
$Comp
L power:+5V #PWR?
U 1 1 6A1AE7A5
P 1850 1650
AR Path="/5CE09726/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/6A1AE7A5" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 1850 1500 50  0001 C CNN
F 1 "+5V" V 1865 1778 50  0000 L CNN
F 2 "" H 1850 1650 50  0001 C CNN
F 3 "" H 1850 1650 50  0001 C CNN
	1    1850 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 1350 1850 1350
Text Label 1850 1350 2    50   ~ 0
~RESET
Text Label 3250 1350 2    50   ~ 0
~START-SYNC
NoConn ~ 2750 1650
Wire Wire Line
	1250 1550 1250 2250
Wire Wire Line
	1250 1550 1850 1550
Wire Wire Line
	4750 2400 4500 2400
Wire Wire Line
	4500 2400 4500 2850
Wire Wire Line
	5900 2850 5900 2300
Wire Wire Line
	5900 2300 5750 2300
Wire Wire Line
	5900 2300 6500 2300
Connection ~ 5900 2300
Wire Wire Line
	5900 2850 5900 3800
Wire Wire Line
	5900 3800 6500 3800
Connection ~ 5900 2850
Wire Wire Line
	9950 1400 9650 1400
Wire Wire Line
	9950 1500 9650 1500
Wire Wire Line
	9950 1600 9650 1600
Wire Wire Line
	9950 1700 9650 1700
Wire Wire Line
	9950 1800 9650 1800
Wire Wire Line
	9950 1900 9650 1900
Wire Wire Line
	9950 2000 9650 2000
Wire Wire Line
	9950 2100 9650 2100
Text Label 8650 2300 2    50   ~ 0
TC
Text Label 8650 3800 2    50   ~ 0
TC
Text Label 8650 2400 2    50   ~ 0
~RIGHT
Text Label 8650 3900 2    50   ~ 0
~RIGHT
Wire Wire Line
	8000 2300 8650 2300
Wire Wire Line
	8000 3800 8650 3800
Wire Wire Line
	8000 2300 8000 3800
Connection ~ 8000 3800
Wire Wire Line
	8000 3800 8000 4200
Connection ~ 5900 3800
Wire Wire Line
	6000 2400 6500 2400
Wire Wire Line
	6000 3900 6500 3900
Wire Wire Line
	1700 5200 1700 5000
Wire Wire Line
	8100 2400 8650 2400
Wire Wire Line
	1700 5000 1150 5000
Wire Wire Line
	8100 3900 8650 3900
Wire Wire Line
	8100 3900 8100 2400
Entry Wire Line
	9950 1400 10050 1500
Entry Wire Line
	9950 1500 10050 1600
Entry Wire Line
	9950 1600 10050 1700
Entry Wire Line
	9950 1700 10050 1800
Entry Wire Line
	9950 1800 10050 1900
Entry Wire Line
	9950 1900 10050 2000
Entry Wire Line
	9950 2000 10050 2100
Entry Wire Line
	9950 2100 10050 2200
Entry Wire Line
	9950 2900 10050 3000
Entry Wire Line
	9950 3000 10050 3100
Entry Wire Line
	9950 3100 10050 3200
Entry Wire Line
	9950 3200 10050 3300
Entry Wire Line
	9950 3300 10050 3400
Entry Wire Line
	9950 3400 10050 3500
Entry Wire Line
	9950 3500 10050 3600
Entry Wire Line
	9950 3600 10050 3700
Entry Wire Line
	7800 3600 7900 3500
Entry Wire Line
	7800 3500 7900 3400
Entry Wire Line
	7800 3400 7900 3300
Entry Wire Line
	7800 3300 7900 3200
Entry Wire Line
	7800 3200 7900 3100
Entry Wire Line
	7800 3100 7900 3000
Entry Wire Line
	7800 3000 7900 2900
Entry Wire Line
	7800 2900 7900 2800
Text Label 9650 1400 0    50   ~ 0
IBUS0
Text Label 9650 1500 0    50   ~ 0
IBUS1
Text Label 9650 1600 0    50   ~ 0
IBUS2
Text Label 9650 1700 0    50   ~ 0
IBUS3
Text Label 9650 1800 0    50   ~ 0
IBUS4
Text Label 9650 1900 0    50   ~ 0
IBUS5
Text Label 9650 2000 0    50   ~ 0
IBUS6
Text Label 9650 2100 0    50   ~ 0
IBUS7
Text Label 9650 3600 0    50   ~ 0
IBUS15
Text Label 9650 3500 0    50   ~ 0
IBUS14
Text Label 9650 3400 0    50   ~ 0
IBUS13
Text Label 9650 3300 0    50   ~ 0
IBUS12
Text Label 9650 3200 0    50   ~ 0
IBUS11
Text Label 9650 3100 0    50   ~ 0
IBUS10
Text Label 9650 3000 0    50   ~ 0
IBUS9
Text Label 9650 2900 0    50   ~ 0
IBUS8
Wire Wire Line
	9950 3600 9650 3600
Wire Wire Line
	9950 3500 9650 3500
Wire Wire Line
	9950 3400 9650 3400
Wire Wire Line
	9950 3300 9650 3300
Wire Wire Line
	9950 3200 9650 3200
Wire Wire Line
	9950 3100 9650 3100
Wire Wire Line
	9950 3000 9650 3000
Wire Wire Line
	9950 2900 9650 2900
Text Label 7500 3600 0    50   ~ 0
IBUS15
Text Label 7500 3500 0    50   ~ 0
IBUS14
Text Label 7500 3400 0    50   ~ 0
IBUS13
Text Label 7500 3300 0    50   ~ 0
IBUS12
Text Label 7500 3200 0    50   ~ 0
IBUS11
Text Label 7500 3100 0    50   ~ 0
IBUS10
Text Label 7500 3000 0    50   ~ 0
IBUS9
Text Label 7500 2900 0    50   ~ 0
IBUS8
Wire Wire Line
	7800 3600 7500 3600
Wire Wire Line
	7800 3500 7500 3500
Wire Wire Line
	7800 3400 7500 3400
Wire Wire Line
	7800 3300 7500 3300
Wire Wire Line
	7800 3200 7500 3200
Wire Wire Line
	7800 3100 7500 3100
Wire Wire Line
	7800 3000 7500 3000
Wire Wire Line
	7800 2900 7500 2900
Wire Bus Line
	8000 1000 9950 1000
Entry Bus Bus
	9950 1000 10050 1100
Entry Bus Bus
	7900 1100 8000 1000
Entry Bus Bus
	10050 3800 10150 3900
Wire Bus Line
	10150 3900 10650 3900
Text Label 10650 3900 2    50   ~ 0
IBUS[0..15]
Text HLabel 10650 3900 2    50   BiDi ~ 0
IBUS[0..15]
Wire Wire Line
	4500 2850 5900 2850
Wire Wire Line
	2750 1350 4300 1350
Wire Wire Line
	4300 1350 4300 2100
Wire Wire Line
	4300 2100 4750 2100
Wire Wire Line
	6500 1500 6200 1500
Wire Wire Line
	6500 1600 6200 1600
Wire Wire Line
	6500 1700 6200 1700
Wire Wire Line
	6500 1800 6200 1800
Wire Wire Line
	6500 1900 6200 1900
Wire Wire Line
	6500 2000 6200 2000
Wire Wire Line
	6500 2100 6200 2100
Wire Wire Line
	6500 2900 6200 2900
Wire Wire Line
	6500 3000 6200 3000
Wire Wire Line
	6500 3100 6200 3100
Wire Wire Line
	6500 3200 6200 3200
Wire Wire Line
	6500 3300 6200 3300
Wire Wire Line
	6500 3400 6200 3400
Wire Wire Line
	6500 3500 6200 3500
Wire Wire Line
	6500 3600 6200 3600
Entry Wire Line
	8250 2200 8350 2100
Entry Wire Line
	8250 2100 8350 2000
Entry Wire Line
	8250 2000 8350 1900
Entry Wire Line
	8250 1900 8350 1800
Entry Wire Line
	8250 1800 8350 1700
Entry Wire Line
	8250 1700 8350 1600
Entry Wire Line
	8250 1600 8350 1500
Entry Wire Line
	8250 3600 8350 3500
Entry Wire Line
	8250 3500 8350 3400
Entry Wire Line
	8250 3400 8350 3300
Entry Wire Line
	8250 3300 8350 3200
Entry Wire Line
	8250 3200 8350 3100
Entry Wire Line
	8250 3100 8350 3000
Entry Wire Line
	8250 3000 8350 2900
Entry Bus Bus
	6100 4000 6200 4100
Wire Bus Line
	6200 4100 8150 4100
Entry Bus Bus
	8150 4100 8250 4000
Text Label 8650 2100 2    50   ~ 0
B8
Text Label 8650 2000 2    50   ~ 0
B7
Text Label 8650 1900 2    50   ~ 0
B6
Text Label 8650 1800 2    50   ~ 0
B5
Text Label 8650 1700 2    50   ~ 0
B4
Text Label 8650 1600 2    50   ~ 0
B3
Text Label 8650 1500 2    50   ~ 0
B2
Text Label 8650 1400 2    50   ~ 0
B1
Wire Wire Line
	8650 2100 8350 2100
Wire Wire Line
	8650 2000 8350 2000
Wire Wire Line
	8650 1900 8350 1900
Wire Wire Line
	8650 1800 8350 1800
Wire Wire Line
	8650 1700 8350 1700
Wire Wire Line
	8650 1600 8350 1600
Wire Wire Line
	8650 1500 8350 1500
Wire Wire Line
	8650 1400 8350 1400
Entry Wire Line
	8250 1500 8350 1400
Entry Wire Line
	6100 3500 6200 3600
Text Notes 6550 800  0    100  ~ 20
Left Rotator
Text Notes 8650 800  0    100  ~ 20
Right Rotator
Wire Wire Line
	5350 4000 5500 4000
Text Label 7900 2250 3    50   ~ 0
IBUS[0..15]
Text Label 1300 850  0    50   ~ 0
B[0..15]
Text Label 1850 1450 2    50   ~ 0
~START
Text Label 1850 1550 2    50   ~ 0
CLK2
Text Label 1300 1000 0    50   ~ 0
DIST[0..3]
Wire Wire Line
	1250 2450 2700 2450
Wire Wire Line
	1250 2250 1700 2250
Connection ~ 1250 2250
Wire Wire Line
	1250 2250 1250 2450
Wire Wire Line
	1250 2900 1250 2700
Connection ~ 1250 2900
Wire Wire Line
	1250 2700 1700 2700
Wire Wire Line
	1250 2900 2700 2900
Text HLabel 10650 4700 2    50   Output ~ 0
FLOUT-SRU
Text Label 10550 4700 2    50   ~ 0
FLOUT
$Comp
L alexios:74AUC1G74 U?
U 1 1 6A1AE895
P 2300 1500
AR Path="/5CE09726/6A1AE895" Ref="U?"  Part="1" 
AR Path="/6A313729/6A1AE895" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE895" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE895" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/6A1AE895" Ref="U?"  Part="1" 
F 0 "U?" H 2300 1917 50  0000 C CNN
F 1 "74AUC1G74" H 2300 1826 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2750 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2750 1500 50  0001 C CNN
	1    2300 1500
	1    0    0    -1  
$EndComp
Text Label 6500 4800 2    50   ~ 0
B0
Text Label 6500 1500 2    50   ~ 0
B0
Text Label 6500 1600 2    50   ~ 0
B1
Text Label 6500 1700 2    50   ~ 0
B2
Text Label 6500 1800 2    50   ~ 0
B3
Text Label 6500 1900 2    50   ~ 0
B4
Text Label 6500 2000 2    50   ~ 0
B5
Text Label 6500 2100 2    50   ~ 0
B6
Text Label 6500 2900 2    50   ~ 0
B7
Text Label 6500 3000 2    50   ~ 0
B8
Text Label 6500 3100 2    50   ~ 0
B9
Text Label 6500 3200 2    50   ~ 0
B10
Text Label 6500 3300 2    50   ~ 0
B11
Text Label 6500 3400 2    50   ~ 0
B12
Text Label 6500 3500 2    50   ~ 0
B13
Text Label 6500 3600 2    50   ~ 0
B14
Wire Wire Line
	6600 4700 6200 4700
Text Label 6500 4700 2    50   ~ 0
B15
$Comp
L power:GND #PWR?
U 1 1 6A1AE8B3
P 6600 5000
AR Path="/5CE09726/6A1AE8B3" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/6A1AE8B3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE8B3" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE8B3" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/6A1AE8B3" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 6600 4750 50  0001 C CNN
F 1 "GND" H 6450 4950 50  0000 C CNN
F 2 "" H 6600 5000 50  0001 C CNN
F 3 "" H 6600 5000 50  0001 C CNN
	1    6600 5000
	1    0    0    -1  
$EndComp
NoConn ~ 7300 5000
Text Label 6500 4900 2    50   ~ 0
~LEFT
Entry Wire Line
	6100 4600 6200 4700
Wire Wire Line
	1150 4800 4350 4800
Text Label 3650 3500 0    50   ~ 0
FLFAST
Wire Wire Line
	4350 3300 4250 3300
Text Notes 4550 1300 0    100  ~ 20
Repetition Counter
Connection ~ 8100 3900
Text Label 2350 5000 0    50   ~ 0
~LEFT
Text Label 2350 5200 0    50   ~ 0
~RIGHT
Text Notes 3700 2350 0    50   ~ 0
16 MHz clock
Text Notes 3700 5400 0    100  ~ 20
MSB and LSB Selector
Text Notes 4250 6025 0    50   ~ 0
MSB\n\n 0\n B₁₅\n FL\n B₀
Text Notes 4450 6025 0    50   ~ 0
LSB\n\n 0\n 0\n FL\n B₁₅
Text Notes 4700 6025 0    50   ~ 0
Operation\n\nBitwise Shift\nArithmetic Shift\nBitwise Rotate <L,AC>\nBitwise Rotate AC
Wire Notes Line width 20 style solid
	3750 5500 5600 5500
Wire Notes Line width 20 style solid
	5600 5500 5600 6075
Wire Notes Line width 20 style solid
	5600 6075 3750 6075
Wire Notes Line width 20 style solid
	3750 6075 3750 5500
Wire Notes Line style solid
	3750 5650 5600 5650
Wire Notes Line
	4650 5500 4650 6075
Wire Notes Line
	4200 5500 4200 6075
Text Notes 4000 6025 0    50   ~ 0
~L~/A\n\n 0\n 1\n 0\n 1
Text Notes 3800 6025 0    50   ~ 0
~S~/R\n\n 0\n 0\n 1\n 1
Wire Wire Line
	7800 1400 7500 1400
Wire Wire Line
	7800 1500 7500 1500
Wire Wire Line
	7800 1600 7500 1600
Wire Wire Line
	7800 1700 7500 1700
Wire Wire Line
	7800 1800 7500 1800
Wire Wire Line
	7800 1900 7500 1900
Wire Wire Line
	7800 2000 7500 2000
Wire Wire Line
	7800 2100 7500 2100
Text Label 7500 1400 0    50   ~ 0
IBUS0
Text Label 7500 1500 0    50   ~ 0
IBUS1
Text Label 7500 1600 0    50   ~ 0
IBUS2
Text Label 7500 1700 0    50   ~ 0
IBUS3
Text Label 7500 1800 0    50   ~ 0
IBUS4
Text Label 7500 1900 0    50   ~ 0
IBUS5
Text Label 7500 2000 0    50   ~ 0
IBUS6
Text Label 7500 2100 0    50   ~ 0
IBUS7
Text Label 4750 2400 2    50   ~ 0
TC
$Comp
L alexios:74AC253 U?
U 1 1 5D078841
P 4850 4000
AR Path="/6A313729/5D078841" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D078841" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D078841" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D078841" Ref="U?"  Part="1" 
F 0 "U?" H 5300 3650 50  0000 C CNN
F 1 "74AC253" H 5400 3550 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5150 4600 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/74act253-288382.pdf" H 5150 4600 50  0001 C CNN
	1    4850 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5D0A8249
P 7000 1900
AR Path="/6A313729/5D0A8249" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D0A8249" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D0A8249" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D0A8249" Ref="U?"  Part="1" 
F 0 "U?" H 7000 2667 50  0000 C CNN
F 1 "74AC541" H 7000 2576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7000 1900 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 7000 1900 50  0001 C CNN
	1    7000 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5D0A905B
P 7000 3400
AR Path="/6A313729/5D0A905B" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D0A905B" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D0A905B" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D0A905B" Ref="U?"  Part="1" 
F 0 "U?" H 7000 4167 50  0000 C CNN
F 1 "74AC541" H 7000 4076 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7000 3400 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 7000 3400 50  0001 C CNN
	1    7000 3400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5D0ABB14
P 9150 1900
AR Path="/6A313729/5D0ABB14" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D0ABB14" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D0ABB14" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D0ABB14" Ref="U?"  Part="1" 
F 0 "U?" H 9150 2667 50  0000 C CNN
F 1 "74AC541" H 9150 2576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 9150 1900 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 9150 1900 50  0001 C CNN
	1    9150 1900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 1 1 5D0ABB1A
P 9150 3400
AR Path="/6A313729/5D0ABB1A" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D0ABB1A" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D0ABB1A" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D0ABB1A" Ref="U?"  Part="1" 
F 0 "U?" H 9150 4167 50  0000 C CNN
F 1 "74AC541" H 9150 4076 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 9150 3400 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 9150 3400 50  0001 C CNN
	1    9150 3400
	1    0    0    -1  
$EndComp
Entry Wire Line
	6100 4700 6200 4800
Wire Wire Line
	6200 4800 6600 4800
$Comp
L alexios:74LVC2G157 U?
U 1 1 5D182161
P 6950 4800
AR Path="/6A313729/5D182161" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D182161" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D182161" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D182161" Ref="U?"  Part="1" 
F 0 "U?" H 6950 5167 50  0000 C CNN
F 1 "74LVC2G157" H 6950 5076 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 6850 4925 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 6850 4925 50  0001 C CNN
	1    6950 4800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 1 1 5D1EFB24
P 1900 2250
AR Path="/6A313729/5D1EFB24" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D1EFB24" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D1EFB24" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D1EFB24" Ref="U?"  Part="1" 
AR Path="/5D1EFB24" Ref="U?"  Part="1" 
F 0 "U?" H 1975 2517 50  0000 C CNN
F 1 "74HC04" H 1975 2426 50  0000 C CNN
F 2 "alexios:SOIC-14" H 1900 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1900 2450 50  0001 C CNN
	1    1900 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 2 1 5D1F0919
P 2450 2250
AR Path="/6A313729/5D1F0919" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D1F0919" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D1F0919" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D1F0919" Ref="U?"  Part="2" 
AR Path="/5D1F0919" Ref="U?"  Part="2" 
F 0 "U?" H 2525 2517 50  0000 C CNN
F 1 "74HC04" H 2525 2426 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2450 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2450 2450 50  0001 C CNN
	2    2450 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 3 1 5D1F284E
P 1900 2700
AR Path="/6A313729/5D1F284E" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/5D1F284E" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/5D1F284E" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/5D1F284E" Ref="U?"  Part="3" 
AR Path="/5D1F284E" Ref="U?"  Part="3" 
F 0 "U?" H 2050 2850 50  0000 C CNN
F 1 "74HC04" H 1975 2876 50  0001 C CNN
F 2 "alexios:SOIC-14" H 1900 2900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 1900 2900 50  0001 C CNN
	3    1900 2700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 4 1 5D1F2854
P 2450 2700
AR Path="/6A313729/5D1F2854" Ref="U?"  Part="4" 
AR Path="/5DC89E19/5D0A147D/5D1F2854" Ref="U?"  Part="4" 
AR Path="/5DC89E19/5D396E91/5D1F2854" Ref="U?"  Part="4" 
AR Path="/5DF75CDE/5D1F2854" Ref="U?"  Part="4" 
AR Path="/5D1F2854" Ref="U?"  Part="4" 
F 0 "U?" H 2550 2850 50  0000 C CNN
F 1 "74HC04" H 2525 2876 50  0001 C CNN
F 2 "alexios:SOIC-14" H 2450 2900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2450 2900 50  0001 C CNN
	4    2450 2700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC86 U?
U 3 1 6A1AE713
P 3650 2500
AR Path="/5CE09726/6A1AE713" Ref="U?"  Part="3" 
AR Path="/6A313729/6A1AE713" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/6A1AE713" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/6A1AE713" Ref="U?"  Part="3" 
AR Path="/5DF75CDE/6A1AE713" Ref="U?"  Part="3" 
F 0 "U?" H 3675 2682 50  0000 C CNN
F 1 "74AC86" H 3675 2773 50  0000 C CNN
F 2 "alexios:SOIC-14" H 3175 2100 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3175 2100 50  0001 C CNN
	3    3650 2500
	1    0    0    1   
$EndComp
$Comp
L alexios:74AC86 U?
U 2 1 6A1AE6FB
P 3050 2750
AR Path="/5CE09726/6A1AE6FB" Ref="U?"  Part="2" 
AR Path="/6A313729/6A1AE6FB" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/6A1AE6FB" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/6A1AE6FB" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/6A1AE6FB" Ref="U?"  Part="2" 
F 0 "U?" H 3075 3025 50  0000 C CNN
F 1 "74AC86" H 3075 2934 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2575 2350 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 2575 2350 50  0001 C CNN
	2    3050 2750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC86 U?
U 1 1 6A1AE6E6
P 3050 2300
AR Path="/5CE09726/6A1AE6E6" Ref="U?"  Part="1" 
AR Path="/6A313729/6A1AE6E6" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE6E6" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE6E6" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/6A1AE6E6" Ref="U?"  Part="1" 
F 0 "U?" H 3075 2575 50  0000 C CNN
F 1 "74AC86" H 3075 2484 50  0000 C CNN
F 2 "alexios:SOIC-14" H 2575 1900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 2575 1900 50  0001 C CNN
	1    3050 2300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U?
U 1 1 5D23FF09
P 2050 5200
AR Path="/6A313729/5D23FF09" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D23FF09" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D23FF09" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D23FF09" Ref="U?"  Part="1" 
F 0 "U?" H 2200 5100 50  0000 C CNN
F 1 "74LVC1G04" H 2200 5000 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2050 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 2050 5200 50  0001 C CNN
	1    2050 5200
	1    0    0    -1  
$EndComp
Text Label 6550 5500 2    50   ~ 0
x4CLK
Text Label 6550 5400 2    50   ~ 0
TC
Text Label 6550 5600 2    50   ~ 0
~START_SYNC
$Comp
L alexios:74LVC1G0832 U?
U 1 1 5D2B045A
P 6950 5500
AR Path="/6A313729/5D2B045A" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D2B045A" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D2B045A" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D2B045A" Ref="U?"  Part="1" 
F 0 "U?" H 6950 5700 50  0000 C CNN
F 1 "74LVC1G0832" H 6950 5800 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6950 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 6950 5500 50  0001 C CNN
	1    6950 5500
	1    0    0    1   
$EndComp
Wire Wire Line
	6000 2400 6000 3900
Text Label 7550 5500 0    50   ~ 0
SHIFTCLK
Text Label 6250 1400 0    50   ~ 0
LSB
Wire Wire Line
	6250 1400 6500 1400
Wire Wire Line
	5350 3300 5500 3300
Wire Wire Line
	6000 5000 6000 4900
Wire Wire Line
	1700 5000 6000 5000
Connection ~ 6000 3900
Wire Wire Line
	2250 5200 8100 5200
Wire Wire Line
	4400 2500 4400 2950
Wire Wire Line
	4400 2950 5800 2950
Connection ~ 4400 2500
Wire Wire Line
	4400 2500 4750 2500
Wire Wire Line
	4300 2100 4300 3050
Wire Wire Line
	4300 3050 5700 3050
Wire Wire Line
	5700 3050 5700 5600
Connection ~ 4300 2100
Text Label 5700 4800 1    50   ~ 0
~START_SYNC
Text Label 5800 4800 1    50   ~ 0
x4CLK
Text Label 5900 4800 1    50   ~ 0
TC
Wire Wire Line
	6000 4900 6600 4900
Connection ~ 6000 4900
Wire Wire Line
	6000 4900 6000 3900
Text Label 6000 4800 1    50   ~ 0
~LEFT
Text Label 4750 2950 0    50   ~ 0
x4CLK
Text Label 4750 2850 0    50   ~ 0
TC
Text Label 4750 3050 0    50   ~ 0
~START-SYNC
Text Label 7550 4700 0    50   ~ 0
FLOUT
Text Label 10550 5500 2    50   ~ 0
SHIFTCLK
Wire Wire Line
	5900 5400 6600 5400
Wire Wire Line
	5700 5600 6600 5600
Wire Wire Line
	5800 5500 6600 5500
Wire Wire Line
	7350 5500 8450 5500
$Comp
L alexios:74AUC1G74 U?
U 2 1 5D854F77
P 5800 7450
AR Path="/5CE09726/5D854F77" Ref="U?"  Part="1" 
AR Path="/6A313729/5D854F77" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D854F77" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D854F77" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D854F77" Ref="U?"  Part="2" 
F 0 "U?" H 5700 7800 50  0000 L CNN
F 1 "74AUC1G74" H 5600 7700 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 6250 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6250 7450 50  0001 C CNN
	2    5800 7450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC04 U?
U 7 1 5D85540D
P 3100 6550
AR Path="/6A313729/5D85540D" Ref="U?"  Part="7" 
AR Path="/5DC89E19/5D0A147D/5D85540D" Ref="U?"  Part="7" 
AR Path="/5DC89E19/5D396E91/5D85540D" Ref="U?"  Part="7" 
AR Path="/5DF75CDE/5D85540D" Ref="U?"  Part="7" 
AR Path="/5D85540D" Ref="U?"  Part="7" 
F 0 "U?" H 3050 6800 50  0000 L CNN
F 1 "74HC04" H 2950 6700 50  0000 L CNN
F 2 "alexios:SOIC-14" H 3100 6750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 3100 6750 50  0001 C CNN
	7    3100 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC86 U?
U 5 1 5D855EC9
P 1300 7350
AR Path="/5CE09726/5D855EC9" Ref="U?"  Part="1" 
AR Path="/6A313729/5D855EC9" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D0A147D/5D855EC9" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D396E91/5D855EC9" Ref="U?"  Part="5" 
AR Path="/5DF75CDE/5D855EC9" Ref="U?"  Part="5" 
F 0 "U?" H 1300 7600 50  0000 C CNN
F 1 "74AC86" H 1300 7500 50  0000 C CNN
F 2 "alexios:SOIC-14" H 825 6950 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 825 6950 50  0001 C CNN
	5    1300 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC191 U?
U 2 1 5D85699B
P 1300 6900
AR Path="/5CE09726/5D85699B" Ref="U?"  Part="1" 
AR Path="/6A313729/5D85699B" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D85699B" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D85699B" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D85699B" Ref="U?"  Part="2" 
F 0 "U?" H 1250 7500 50  0000 L CNN
F 1 "74AC191" H 1150 7400 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1275 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 1275 6900 50  0001 C CNN
	2    1300 6900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U?
U 2 1 5D8588CB
P 3100 7450
AR Path="/6A313729/5D8588CB" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D8588CB" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D8588CB" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D8588CB" Ref="U?"  Part="2" 
F 0 "U?" H 3100 7800 50  0000 C CNN
F 1 "74LVC1G04" H 3100 7700 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3100 7450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 3100 7450 50  0001 C CNN
	2    3100 7450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G0832 U?
U 2 1 5D858D00
P 4900 7450
AR Path="/6A313729/5D858D00" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D858D00" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D858D00" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D858D00" Ref="U?"  Part="2" 
F 0 "U?" H 4800 7800 50  0000 L CNN
F 1 "74LVC1G0832" H 4750 7700 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4900 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 4900 7450 50  0001 C CNN
	2    4900 7450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5D859329
P 2200 6650
AR Path="/6A313729/5D859329" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D859329" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D859329" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D859329" Ref="U?"  Part="2" 
F 0 "U?" H 2150 7000 50  0000 L CNN
F 1 "74AC541" H 2050 6900 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2200 6650 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 2200 6650 50  0001 C CNN
	2    2200 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5D859A89
P 4900 6650
AR Path="/6A313729/5D859A89" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D859A89" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D859A89" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D859A89" Ref="U?"  Part="2" 
F 0 "U?" H 4800 7000 50  0000 L CNN
F 1 "74AC541" H 4750 6900 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4900 6650 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 4900 6650 50  0001 C CNN
	2    4900 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5D85A16E
P 4000 6650
AR Path="/6A313729/5D85A16E" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D85A16E" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D85A16E" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D85A16E" Ref="U?"  Part="2" 
F 0 "U?" H 3900 7000 50  0000 L CNN
F 1 "74AC541" H 3850 6900 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4000 6650 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 4000 6650 50  0001 C CNN
	2    4000 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5D85AD1E
P 5800 6650
AR Path="/6A313729/5D85AD1E" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D85AD1E" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D85AD1E" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D85AD1E" Ref="U?"  Part="2" 
F 0 "U?" H 5700 7000 50  0000 L CNN
F 1 "74AC541" H 5650 6900 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5800 6650 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 5800 6650 50  0001 C CNN
	2    5800 6650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC2G157 U?
U 2 1 5D883250
P 4000 7450
AR Path="/6A313729/5D883250" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D883250" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D883250" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D883250" Ref="U?"  Part="2" 
F 0 "U?" H 3900 7800 50  0000 L CNN
F 1 "74LVC2G157" H 3800 7700 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3900 7575 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 3900 7575 50  0001 C CNN
	2    4000 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D88ED05
P 950 6650
AR Path="/5CC0D65F/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D88ED05" Ref="C?"  Part="1" 
AR Path="/6A313729/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D88ED05" Ref="C?"  Part="1" 
F 0 "C?" H 850 6650 50  0000 R CNN
F 1 "100nF" H 900 6550 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6650 50  0001 C CNN
F 3 "~" H 950 6650 50  0001 C CNN
	1    950  6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D88ED0B
P 950 6550
AR Path="/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D88ED0B" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 950 6400 50  0001 C CNN
F 1 "+5V" H 965 6723 50  0000 C CNN
F 2 "" H 950 6550 50  0001 C CNN
F 3 "" H 950 6550 50  0001 C CNN
	1    950  6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D88ED12
P 950 6750
AR Path="/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D88ED12" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 950 6500 50  0001 C CNN
F 1 "GND" H 955 6577 50  0000 C CNN
F 2 "" H 950 6750 50  0001 C CNN
F 3 "" H 950 6750 50  0001 C CNN
	1    950  6750
	1    0    0    -1  
$EndComp
Connection ~ 950  6550
Connection ~ 950  6750
$Comp
L Device:C_Small C?
U 1 1 5D8A6EF3
P 1850 6650
AR Path="/5CC0D65F/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/6A313729/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D8A6EF3" Ref="C?"  Part="1" 
F 0 "C?" H 1750 6550 50  0000 R CNN
F 1 "100nF" H 1750 6450 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 6650 50  0001 C CNN
F 3 "~" H 1850 6650 50  0001 C CNN
	1    1850 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D8A6EF9
P 1850 6550
AR Path="/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D8A6EF9" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 1850 6400 50  0001 C CNN
F 1 "+5V" H 1865 6723 50  0000 C CNN
F 2 "" H 1850 6550 50  0001 C CNN
F 3 "" H 1850 6550 50  0001 C CNN
	1    1850 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8A6EFF
P 1850 6750
AR Path="/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D8A6EFF" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 1850 6500 50  0001 C CNN
F 1 "GND" H 1855 6577 50  0000 C CNN
F 2 "" H 1850 6750 50  0001 C CNN
F 3 "" H 1850 6750 50  0001 C CNN
	1    1850 6750
	1    0    0    -1  
$EndComp
Connection ~ 1850 6550
Connection ~ 1850 6750
$Comp
L power:+5V #PWR?
U 1 1 5D935C2E
P 2750 6550
AR Path="/5D935C2E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D935C2E" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D935C2E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D935C2E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D935C2E" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D935C2E" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 2750 6400 50  0001 C CNN
F 1 "+5V" H 2765 6723 50  0000 C CNN
F 2 "" H 2750 6550 50  0001 C CNN
F 3 "" H 2750 6550 50  0001 C CNN
	1    2750 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D935C34
P 2750 6750
AR Path="/5D935C34" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D935C34" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D935C34" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D935C34" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D935C34" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D935C34" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2750 6500 50  0001 C CNN
F 1 "GND" H 2755 6577 50  0000 C CNN
F 2 "" H 2750 6750 50  0001 C CNN
F 3 "" H 2750 6750 50  0001 C CNN
	1    2750 6750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D941583
P 3650 6550
AR Path="/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D941583" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 3650 6400 50  0001 C CNN
F 1 "+5V" H 3665 6723 50  0000 C CNN
F 2 "" H 3650 6550 50  0001 C CNN
F 3 "" H 3650 6550 50  0001 C CNN
	1    3650 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D941589
P 3650 6750
AR Path="/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D941589" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 3650 6500 50  0001 C CNN
F 1 "GND" H 3655 6577 50  0000 C CNN
F 2 "" H 3650 6750 50  0001 C CNN
F 3 "" H 3650 6750 50  0001 C CNN
	1    3650 6750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D94D46E
P 4550 6550
AR Path="/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D94D46E" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 4550 6400 50  0001 C CNN
F 1 "+5V" H 4565 6723 50  0000 C CNN
F 2 "" H 4550 6550 50  0001 C CNN
F 3 "" H 4550 6550 50  0001 C CNN
	1    4550 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D94D474
P 4550 6750
AR Path="/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D94D474" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 4550 6500 50  0001 C CNN
F 1 "GND" H 4555 6577 50  0000 C CNN
F 2 "" H 4550 6750 50  0001 C CNN
F 3 "" H 4550 6750 50  0001 C CNN
	1    4550 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D959194
P 2750 6650
AR Path="/5CC0D65F/5D959194" Ref="C?"  Part="1" 
AR Path="/5D959194" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D959194" Ref="C?"  Part="1" 
AR Path="/6A313729/5D959194" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D959194" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D959194" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D959194" Ref="C?"  Part="1" 
F 0 "C?" H 2650 6550 50  0000 R CNN
F 1 "100nF" H 2650 6450 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 6650 50  0001 C CNN
F 3 "~" H 2750 6650 50  0001 C CNN
	1    2750 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9648DE
P 3650 6650
AR Path="/5CC0D65F/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D9648DE" Ref="C?"  Part="1" 
AR Path="/6A313729/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D9648DE" Ref="C?"  Part="1" 
F 0 "C?" H 3550 6550 50  0000 R CNN
F 1 "100nF" H 3550 6450 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 6650 50  0001 C CNN
F 3 "~" H 3650 6650 50  0001 C CNN
	1    3650 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96FFA9
P 4550 6650
AR Path="/5CC0D65F/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/6A313729/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D96FFA9" Ref="C?"  Part="1" 
F 0 "C?" H 4450 6550 50  0000 R CNN
F 1 "100nF" H 4450 6450 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 6650 50  0001 C CNN
F 3 "~" H 4550 6650 50  0001 C CNN
	1    4550 6650
	1    0    0    -1  
$EndComp
Connection ~ 2750 6550
Connection ~ 2750 6750
Connection ~ 3650 6550
Connection ~ 3650 6750
Connection ~ 4550 6550
Connection ~ 4550 6750
$Comp
L Device:C_Small C?
U 1 1 5D9EF8EE
P 950 7450
AR Path="/5CC0D65F/5D9EF8EE" Ref="C?"  Part="1" 
AR Path="/5D9EF8EE" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D9EF8EE" Ref="C?"  Part="1" 
AR Path="/6A313729/5D9EF8EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9EF8EE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9EF8EE" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D9EF8EE" Ref="C?"  Part="1" 
F 0 "C?" H 859 7496 50  0000 R CNN
F 1 "100nF" H 859 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7450 50  0001 C CNN
F 3 "~" H 950 7450 50  0001 C CNN
	1    950  7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9EF8F4
P 950 7350
AR Path="/5D9EF8F4" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D9EF8F4" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D9EF8F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9EF8F4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9EF8F4" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D9EF8F4" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 950 7200 50  0001 C CNN
F 1 "+5V" H 965 7523 50  0000 C CNN
F 2 "" H 950 7350 50  0001 C CNN
F 3 "" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9EF8FA
P 950 7550
AR Path="/5D9EF8FA" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D9EF8FA" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D9EF8FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9EF8FA" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9EF8FA" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D9EF8FA" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 950 7300 50  0001 C CNN
F 1 "GND" H 955 7377 50  0000 C CNN
F 2 "" H 950 7550 50  0001 C CNN
F 3 "" H 950 7550 50  0001 C CNN
	1    950  7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9FA61C
P 1850 7450
AR Path="/5CC0D65F/5D9FA61C" Ref="C?"  Part="1" 
AR Path="/5D9FA61C" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D9FA61C" Ref="C?"  Part="1" 
AR Path="/6A313729/5D9FA61C" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9FA61C" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9FA61C" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D9FA61C" Ref="C?"  Part="1" 
F 0 "C?" H 1759 7496 50  0000 R CNN
F 1 "100nF" H 1759 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 7450 50  0001 C CNN
F 3 "~" H 1850 7450 50  0001 C CNN
	1    1850 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9FA622
P 1850 7350
AR Path="/5D9FA622" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D9FA622" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D9FA622" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9FA622" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9FA622" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D9FA622" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 1850 7200 50  0001 C CNN
F 1 "+5V" H 1865 7523 50  0000 C CNN
F 2 "" H 1850 7350 50  0001 C CNN
F 3 "" H 1850 7350 50  0001 C CNN
	1    1850 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9FA628
P 1850 7550
AR Path="/5D9FA628" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D9FA628" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D9FA628" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9FA628" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9FA628" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D9FA628" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 1850 7300 50  0001 C CNN
F 1 "GND" H 1855 7377 50  0000 C CNN
F 2 "" H 1850 7550 50  0001 C CNN
F 3 "" H 1850 7550 50  0001 C CNN
	1    1850 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DA05823
P 2750 7450
AR Path="/5CC0D65F/5DA05823" Ref="C?"  Part="1" 
AR Path="/5DA05823" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DA05823" Ref="C?"  Part="1" 
AR Path="/6A313729/5DA05823" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA05823" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA05823" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DA05823" Ref="C?"  Part="1" 
F 0 "C?" H 2659 7496 50  0000 R CNN
F 1 "100nF" H 2659 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 7450 50  0001 C CNN
F 3 "~" H 2750 7450 50  0001 C CNN
	1    2750 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DA05829
P 2750 7350
AR Path="/5DA05829" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA05829" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA05829" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA05829" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA05829" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA05829" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 2750 7200 50  0001 C CNN
F 1 "+5V" H 2765 7523 50  0000 C CNN
F 2 "" H 2750 7350 50  0001 C CNN
F 3 "" H 2750 7350 50  0001 C CNN
	1    2750 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA0582F
P 2750 7550
AR Path="/5DA0582F" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA0582F" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA0582F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA0582F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA0582F" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA0582F" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 2750 7300 50  0001 C CNN
F 1 "GND" H 2755 7377 50  0000 C CNN
F 2 "" H 2750 7550 50  0001 C CNN
F 3 "" H 2750 7550 50  0001 C CNN
	1    2750 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DA108F0
P 3650 7450
AR Path="/5CC0D65F/5DA108F0" Ref="C?"  Part="1" 
AR Path="/5DA108F0" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DA108F0" Ref="C?"  Part="1" 
AR Path="/6A313729/5DA108F0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA108F0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA108F0" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DA108F0" Ref="C?"  Part="1" 
F 0 "C?" H 3559 7496 50  0000 R CNN
F 1 "100nF" H 3559 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7450 50  0001 C CNN
F 3 "~" H 3650 7450 50  0001 C CNN
	1    3650 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DA108F6
P 3650 7350
AR Path="/5DA108F6" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA108F6" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA108F6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA108F6" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA108F6" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA108F6" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 3650 7200 50  0001 C CNN
F 1 "+5V" H 3665 7523 50  0000 C CNN
F 2 "" H 3650 7350 50  0001 C CNN
F 3 "" H 3650 7350 50  0001 C CNN
	1    3650 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA108FC
P 3650 7550
AR Path="/5DA108FC" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA108FC" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA108FC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA108FC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA108FC" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA108FC" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 3650 7300 50  0001 C CNN
F 1 "GND" H 3655 7377 50  0000 C CNN
F 2 "" H 3650 7550 50  0001 C CNN
F 3 "" H 3650 7550 50  0001 C CNN
	1    3650 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DA1B925
P 4550 7450
AR Path="/5CC0D65F/5DA1B925" Ref="C?"  Part="1" 
AR Path="/5DA1B925" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DA1B925" Ref="C?"  Part="1" 
AR Path="/6A313729/5DA1B925" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA1B925" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA1B925" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DA1B925" Ref="C?"  Part="1" 
F 0 "C?" H 4459 7496 50  0000 R CNN
F 1 "100nF" H 4459 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 7450 50  0001 C CNN
F 3 "~" H 4550 7450 50  0001 C CNN
	1    4550 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DA1B92B
P 4550 7350
AR Path="/5DA1B92B" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA1B92B" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA1B92B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA1B92B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA1B92B" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA1B92B" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 4550 7200 50  0001 C CNN
F 1 "+5V" H 4565 7523 50  0000 C CNN
F 2 "" H 4550 7350 50  0001 C CNN
F 3 "" H 4550 7350 50  0001 C CNN
	1    4550 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA1B931
P 4550 7550
AR Path="/5DA1B931" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA1B931" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA1B931" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA1B931" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA1B931" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA1B931" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 4550 7300 50  0001 C CNN
F 1 "GND" H 4555 7377 50  0000 C CNN
F 2 "" H 4550 7550 50  0001 C CNN
F 3 "" H 4550 7550 50  0001 C CNN
	1    4550 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DA26793
P 5450 7450
AR Path="/5CC0D65F/5DA26793" Ref="C?"  Part="1" 
AR Path="/5DA26793" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DA26793" Ref="C?"  Part="1" 
AR Path="/6A313729/5DA26793" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA26793" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA26793" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DA26793" Ref="C?"  Part="1" 
F 0 "C?" H 5359 7496 50  0000 R CNN
F 1 "100nF" H 5359 7405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 7450 50  0001 C CNN
F 3 "~" H 5450 7450 50  0001 C CNN
	1    5450 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DA26799
P 5450 7350
AR Path="/5DA26799" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA26799" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA26799" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA26799" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA26799" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA26799" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 5450 7200 50  0001 C CNN
F 1 "+5V" H 5465 7523 50  0000 C CNN
F 2 "" H 5450 7350 50  0001 C CNN
F 3 "" H 5450 7350 50  0001 C CNN
	1    5450 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA2679F
P 5450 7550
AR Path="/5DA2679F" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA2679F" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA2679F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA2679F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA2679F" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA2679F" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 5450 7300 50  0001 C CNN
F 1 "GND" H 5455 7377 50  0000 C CNN
F 2 "" H 5450 7550 50  0001 C CNN
F 3 "" H 5450 7550 50  0001 C CNN
	1    5450 7550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DA3CE6A
P 5450 6550
AR Path="/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA3CE6A" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 5450 6400 50  0001 C CNN
F 1 "+5V" H 5465 6723 50  0000 C CNN
F 2 "" H 5450 6550 50  0001 C CNN
F 3 "" H 5450 6550 50  0001 C CNN
	1    5450 6550
	1    0    0    -1  
$EndComp
Connection ~ 950  7350
Connection ~ 950  7550
$Comp
L alexios:74AC253 U?
U 2 1 5D85728B
P 2200 8050
AR Path="/6A313729/5D85728B" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D85728B" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D85728B" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D85728B" Ref="U?"  Part="2" 
F 0 "U?" H 2150 9000 50  0000 L CNN
F 1 "74AC253" H 2050 8900 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2500 8650 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/74act253-288382.pdf" H 2500 8650 50  0001 C CNN
	2    2200 8050
	1    0    0    -1  
$EndComp
Connection ~ 1850 7350
Connection ~ 1850 7550
Connection ~ 2750 7550
Connection ~ 2750 7350
Connection ~ 3650 7550
Connection ~ 3650 7350
Connection ~ 4550 7350
Connection ~ 4550 7550
Connection ~ 5450 7550
Connection ~ 5450 7350
Text Label 6100 2750 1    50   ~ 0
B[0..15]
Text Label 8250 2800 1    50   ~ 0
B[0..15]
Wire Wire Line
	950  3500 4150 3500
Text Label 1050 3500 0    50   ~ 0
FLFAST
Text HLabel 950  3500 0    50   Input ~ 0
FLFAST
Connection ~ 4150 3500
Wire Wire Line
	8100 3900 8100 5200
Wire Wire Line
	7300 4700 10650 4700
NoConn ~ 10100 6300
Wire Wire Line
	9500 6300 9550 6300
Wire Wire Line
	9500 6250 9500 6300
$Comp
L power:+5V #PWR?
U 1 1 5D602F9F
P 9500 6250
AR Path="/6A313729/5D602F9F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D602F9F" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D602F9F" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D602F9F" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 9500 6100 50  0001 C CNN
F 1 "+5V" H 9515 6423 50  0000 C CNN
F 2 "" H 9500 6250 50  0001 C CNN
F 3 "" H 9500 6250 50  0001 C CNN
	1    9500 6250
	1    0    0    -1  
$EndComp
NoConn ~ 10850 6300
$Comp
L alexios:74AC04 U?
U 6 1 5D5F1690
P 9750 6300
AR Path="/5CE09726/5D5F1690" Ref="U?"  Part="6" 
AR Path="/6A313729/5D5F1690" Ref="U?"  Part="6" 
AR Path="/5DC89E19/5D0A147D/5D5F1690" Ref="U?"  Part="6" 
AR Path="/5DC89E19/5D396E91/5D5F1690" Ref="U?"  Part="6" 
AR Path="/5DF75CDE/5D5F1690" Ref="U?"  Part="6" 
AR Path="/5D5F1690" Ref="U?"  Part="6" 
F 0 "U?" H 9825 6567 50  0000 C CNN
F 1 "74HC04" H 9825 6476 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9750 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 9750 6300 50  0001 C CNN
	6    9750 6300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC04 U?
U 5 1 6A1AE772
P 10500 6300
AR Path="/5CE09726/6A1AE772" Ref="U?"  Part="6" 
AR Path="/6A313729/6A1AE772" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D0A147D/6A1AE772" Ref="U?"  Part="5" 
AR Path="/5DC89E19/5D396E91/6A1AE772" Ref="U?"  Part="5" 
AR Path="/5DF75CDE/6A1AE772" Ref="U?"  Part="5" 
AR Path="/6A1AE772" Ref="U?"  Part="5" 
F 0 "U?" H 10575 6567 50  0000 C CNN
F 1 "74HC04" H 10575 6476 50  0000 C CNN
F 2 "alexios:SOIC-14" H 10500 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 10500 6300 50  0001 C CNN
	5    10500 6300
	1    0    0    -1  
$EndComp
Text Notes 1900 3400 0    100  ~ 20
Clock Quadruppler
Entry Wire Line
	7800 2100 7900 2000
Entry Wire Line
	7800 2000 7900 1900
Entry Wire Line
	7800 1900 7900 1800
Entry Wire Line
	7800 1800 7900 1700
Entry Wire Line
	7800 1700 7900 1600
Entry Wire Line
	7800 1600 7900 1500
Entry Wire Line
	7800 1500 7900 1400
Entry Wire Line
	7800 1400 7900 1300
Connection ~ 1700 5000
Text Notes 1900 3100 0    50   ~ 0
Inverters are used as delays and\nare purposefully HC family.
$Comp
L alexios:74AC86 U?
U 4 1 5DD00E89
P 9050 6300
AR Path="/5CE09726/5DD00E89" Ref="U?"  Part="3" 
AR Path="/6A313729/5DD00E89" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D0A147D/5DD00E89" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D396E91/5DD00E89" Ref="U?"  Part="4" 
AR Path="/5DF75CDE/5DD00E89" Ref="U?"  Part="4" 
F 0 "U?" H 9075 6575 50  0000 C CNN
F 1 "74AC86" H 9075 6484 50  0000 C CNN
F 2 "alexios:SOIC-14" H 8575 5900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 8575 5900 50  0001 C CNN
	4    9050 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 6250 8750 6250
Wire Wire Line
	8750 6250 8750 6350
Wire Wire Line
	8800 6350 8750 6350
NoConn ~ 9350 6300
$Comp
L power:+5V #PWR?
U 1 1 5DD46F8C
P 8750 6250
AR Path="/5DC89E19/5D396E91/5DD46F8C" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DD46F8C" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 8750 6100 50  0001 C CNN
F 1 "+5V" H 8765 6423 50  0000 C CNN
F 2 "" H 8750 6250 50  0001 C CNN
F 3 "" H 8750 6250 50  0001 C CNN
	1    8750 6250
	1    0    0    -1  
$EndComp
Connection ~ 8750 6250
Text HLabel 10650 5500 2    50   Output ~ 0
BCP-SRU
Text Notes 8350 4200 0    50   ~ 10
Assumption
Text Notes 8350 4550 0    50   ~ 0
The IBus isn't used while the SRU is running, and remains\ntri-stated by the rest of the processor. Currently, the SRU\ninstruction just does nothing for a few processor cycles to\nmake sure.
Text Notes 1600 5800 0    50   ~ 0
This can theoretically cause glitches,\nbut probably not due to the way the\nControl Unit and instruction set are\ndesigned.
$Comp
L Connector:TestPoint TP?
U 1 1 5DCF40D7
P 3400 2300
F 0 "TP?" H 3400 2550 50  0000 C CNN
F 1 "TestPoint" H 3458 2327 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 3600 2300 50  0001 C CNN
F 3 "~" H 3600 2300 50  0001 C CNN
	1    3400 2300
	1    0    0    -1  
$EndComp
Connection ~ 3400 2300
$Comp
L Connector:TestPoint TP?
U 1 1 5DCF509A
P 3400 2750
F 0 "TP?" H 3400 3000 50  0000 C CNN
F 1 "TestPoint" H 3458 2777 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 3600 2750 50  0001 C CNN
F 3 "~" H 3600 2750 50  0001 C CNN
	1    3400 2750
	-1   0    0    1   
$EndComp
Connection ~ 3400 2750
$Comp
L Connector:TestPoint TP?
U 1 1 5DCF567D
P 10000 5500
F 0 "TP?" H 10000 5750 50  0000 C CNN
F 1 "TestPoint" H 10058 5527 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 10200 5500 50  0001 C CNN
F 3 "~" H 10200 5500 50  0001 C CNN
	1    10000 5500
	1    0    0    -1  
$EndComp
Connection ~ 10000 5500
Wire Wire Line
	10000 5500 10650 5500
$Comp
L power:GND #PWR0156
U 1 1 5DD25E1C
P 10300 6300
F 0 "#PWR0156" H 10300 6050 50  0001 C CNN
F 1 "GND" H 10305 6127 50  0000 C CNN
F 2 "" H 10300 6300 50  0001 C CNN
F 3 "" H 10300 6300 50  0001 C CNN
	1    10300 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3800 5900 4200
Wire Wire Line
	8000 4200 5900 4200
Connection ~ 5900 4200
Wire Wire Line
	5900 4200 5900 5400
Text Label 6500 4200 2    50   ~ 0
TC
Wire Wire Line
	3400 2750 3400 2550
Text Label 4000 2500 0    50   ~ 0
x4CLK
Connection ~ 3950 2500
Wire Wire Line
	3950 2500 4400 2500
$Comp
L Connector:TestPoint TP?
U 1 1 5DCF82BB
P 3950 2500
F 0 "TP?" H 3950 2750 50  0000 C CNN
F 1 "TestPoint" H 4008 2527 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4150 2500 50  0001 C CNN
F 3 "~" H 4150 2500 50  0001 C CNN
	1    3950 2500
	-1   0    0    1   
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 1 1 5E022810
P 9350 5200
F 0 "U?" H 9275 5467 50  0000 C CNN
F 1 "74LVC1G08" H 9275 5376 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9000 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 9000 5200 50  0001 C CNN
	1    9350 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5200 9800 5200
$Comp
L Connector:TestPoint TP?
U 1 1 5E02E561
P 9800 5200
F 0 "TP?" H 9800 5450 50  0000 C CNN
F 1 "TestPoint" H 9858 5227 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 10000 5200 50  0001 C CNN
F 3 "~" H 10000 5200 50  0001 C CNN
	1    9800 5200
	1    0    0    -1  
$EndComp
Connection ~ 9800 5200
Wire Wire Line
	9800 5200 10650 5200
Text HLabel 10650 5200 2    50   Output ~ 0
FLCP-SRU
Connection ~ 8450 5500
Wire Wire Line
	8450 5500 10000 5500
Wire Wire Line
	9050 5150 8450 5150
Wire Wire Line
	8450 5250 8450 5500
Wire Wire Line
	8450 5250 9050 5250
Text Label 8450 5250 0    50   ~ 0
SHIFTCLK
Text Label 8450 5150 0    50   ~ 0
~SHIFT~∕ROTATE
Wire Wire Line
	4150 3500 4150 4200
Wire Wire Line
	4350 4300 4050 4300
Wire Wire Line
	4350 3600 3650 3600
Text Label 3650 3600 0    50   ~ 0
B0
Wire Wire Line
	4050 3400 4050 4300
Connection ~ 4050 3400
Wire Wire Line
	4050 3400 3650 3400
$Comp
L alexios:74LVC1G08 U?
U 2 1 5DE87F78
P 8425 6075
F 0 "U?" H 8350 6342 50  0000 C CNN
F 1 "74LVC1G08" H 8350 6251 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8075 6075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 8075 6075 50  0001 C CNN
	2    8425 6075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA3CE70
P 5450 6750
AR Path="/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA3CE70" Ref="#PWR0157"  Part="1" 
F 0 "#PWR0157" H 5450 6500 50  0001 C CNN
F 1 "GND" H 5455 6577 50  0000 C CNN
F 2 "" H 5450 6750 50  0001 C CNN
F 3 "" H 5450 6750 50  0001 C CNN
	1    5450 6750
	1    0    0    -1  
$EndComp
Connection ~ 5450 6750
Connection ~ 5450 6550
$Comp
L Device:C_Small C?
U 1 1 5DA3CE64
P 5450 6650
AR Path="/5CC0D65F/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/6A313729/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DA3CE64" Ref="C?"  Part="1" 
F 0 "C?" H 5359 6696 50  0000 R CNN
F 1 "100nF" H 5359 6605 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 6650 50  0001 C CNN
F 3 "~" H 5450 6650 50  0001 C CNN
	1    5450 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DE93CAC
P 7975 6075
AR Path="/5DE93CAC" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DE93CAC" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DE93CAC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DE93CAC" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DE93CAC" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DE93CAC" Ref="#PWR0158"  Part="1" 
F 0 "#PWR0158" H 7975 5925 50  0001 C CNN
F 1 "+5V" H 7990 6248 50  0000 C CNN
F 2 "" H 7975 6075 50  0001 C CNN
F 3 "" H 7975 6075 50  0001 C CNN
	1    7975 6075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DE93CB2
P 7975 6275
AR Path="/5DE93CB2" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DE93CB2" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DE93CB2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DE93CB2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DE93CB2" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DE93CB2" Ref="#PWR0159"  Part="1" 
F 0 "#PWR0159" H 7975 6025 50  0001 C CNN
F 1 "GND" H 7980 6102 50  0000 C CNN
F 2 "" H 7975 6275 50  0001 C CNN
F 3 "" H 7975 6275 50  0001 C CNN
	1    7975 6275
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DE93CBA
P 7975 6175
AR Path="/5CC0D65F/5DE93CBA" Ref="C?"  Part="1" 
AR Path="/5DE93CBA" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DE93CBA" Ref="C?"  Part="1" 
AR Path="/6A313729/5DE93CBA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DE93CBA" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DE93CBA" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DE93CBA" Ref="C?"  Part="1" 
F 0 "C?" H 7884 6221 50  0000 R CNN
F 1 "100nF" H 7884 6130 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7975 6175 50  0001 C CNN
F 3 "~" H 7975 6175 50  0001 C CNN
	1    7975 6175
	1    0    0    -1  
$EndComp
Connection ~ 7975 6275
Connection ~ 7975 6075
Wire Wire Line
	5800 2950 5800 5500
Wire Bus Line
	4400 1100 4400 1800
Wire Bus Line
	8250 1500 8250 4000
Wire Bus Line
	6100 950  6100 4700
Wire Bus Line
	10050 1100 10050 3800
Wire Bus Line
	7900 1100 7900 3500
Text Notes 2900 1700 0    100  ~ 20
State Machine
$EndSCHEMATC
