EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 18 20
Title "Shift and Rotate Unit"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74AC191 U?
U 1 1 6A1AE719
P 5250 2000
AR Path="/5CE09726/6A1AE719" Ref="U?"  Part="1" 
AR Path="/6A313729/6A1AE719" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE719" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE719" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/6A1AE719" Ref="U603"  Part="1" 
F 0 "U603" H 5250 1325 50  0000 C CNN
F 1 "74AC191" H 5250 1234 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 5225 2000 50  0001 C CNN
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
AR Path="/5DF75CDE/6A1AE71F" Ref="#PWR0602"  Part="1" 
F 0 "#PWR0602" H 4750 2050 50  0001 C CNN
F 1 "+5V" V 4765 2328 50  0000 L CNN
F 2 "" H 4750 2200 50  0001 C CNN
F 3 "" H 4750 2200 50  0001 C CNN
	1    4750 2200
	0    -1   -1   0   
$EndComp
Text Label 4750 2500 2    50   ~ 0
x4CLK
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
Text HLabel 1150 4400 0    50   Input ~ 0
~SHIFT~∕ROTATE
Text HLabel 1150 4300 0    50   Input ~ 0
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
	8650 3600 8450 3600
Text HLabel 1150 4500 0    50   Input ~ 0
~LEFT~∕RIGHT
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
NoConn ~ 5750 2100
Text HLabel 1150 1450 0    50   Input ~ 0
~START
Wire Wire Line
	1150 1450 1850 1450
$Comp
L power:+5V #PWR?
U 1 1 6A1AE7A5
P 1850 1650
AR Path="/5CE09726/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/6A1AE7A5" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/6A1AE7A5" Ref="#PWR0601"  Part="1" 
F 0 "#PWR0601" H 1850 1500 50  0001 C CNN
F 1 "+5V" V 1865 1778 50  0000 L CNN
F 2 "" H 1850 1650 50  0001 C CNN
F 3 "" H 1850 1650 50  0001 C CNN
	1    1850 1650
	0    -1   -1   0   
$EndComp
Text Label 3250 1350 2    50   ~ 0
~START-SYNC
NoConn ~ 2750 1650
Wire Wire Line
	1150 1550 1850 1550
Wire Wire Line
	4750 2400 4500 2400
Wire Wire Line
	4500 2400 4500 2850
Wire Wire Line
	5900 2850 5900 2600
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
Text Label 8450 2300 0    50   ~ 0
~ENR
Text Label 8450 3800 0    50   ~ 0
~ENR
Wire Wire Line
	8450 3800 8650 3800
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
Text Label 7900 2100 3    50   ~ 0
IBUS[0..15]
Text Label 1300 850  0    50   ~ 0
B[0..15]
Text Label 1850 1450 2    50   ~ 0
~START
Text Label 1850 1550 2    50   ~ 0
CLK3
Text Label 1300 1000 0    50   ~ 0
DIST[0..3]
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
Text Notes 4550 1300 0    100  ~ 20
Repetition Counter
Text Notes 5350 5000 0    100  ~ 20
MSB and LSB Selector
Text Notes 5900 5625 0    50   ~ 0
MSB\n\n 0\n B₁₅\n FL\n B₀
Text Notes 6100 5625 0    50   ~ 0
LSB\n\n 0\n 0\n FL\n B₁₅
Text Notes 6350 5625 0    50   ~ 0
Operation\n\nBitwise Shift\nArithmetic Shift\nBitwise Rotate <L,AC>\nBitwise Rotate AC
Wire Notes Line width 20 style solid
	5400 5100 7250 5100
Wire Notes Line width 20 style solid
	7250 5100 7250 5675
Wire Notes Line width 20 style solid
	7250 5675 5400 5675
Wire Notes Line width 20 style solid
	5400 5675 5400 5100
Wire Notes Line style solid
	5400 5250 7250 5250
Wire Notes Line
	6300 5100 6300 5675
Wire Notes Line
	5850 5100 5850 5675
Text Notes 5650 5625 0    50   ~ 0
~L~/A\n\n 0\n 1\n 0\n 1
Text Notes 5450 5625 0    50   ~ 0
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
L alexios:74AC541 U?
U 1 1 5D0A8249
P 7000 1900
AR Path="/6A313729/5D0A8249" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D0A8249" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D0A8249" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/5D0A8249" Ref="U604"  Part="1" 
F 0 "U604" H 7000 2667 50  0000 C CNN
F 1 "74AC541" H 7000 2576 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7000 1900 50  0001 C CNN
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
AR Path="/5DF75CDE/5D0A905B" Ref="U605"  Part="1" 
F 0 "U605" H 7000 4167 50  0000 C CNN
F 1 "74AC541" H 7000 4076 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7000 3400 50  0001 C CNN
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
AR Path="/5DF75CDE/5D0ABB14" Ref="U606"  Part="1" 
F 0 "U606" H 9150 2667 50  0000 C CNN
F 1 "74AC541" H 9150 2576 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9150 1900 50  0001 C CNN
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
AR Path="/5DF75CDE/5D0ABB1A" Ref="U607"  Part="1" 
F 0 "U607" H 9150 4167 50  0000 C CNN
F 1 "74AC541" H 9150 4076 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 9150 3400 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 9150 3400 50  0001 C CNN
	1    9150 3400
	1    0    0    -1  
$EndComp
Text Label 6350 1400 0    50   ~ 0
LSB
Wire Wire Line
	6350 1400 6500 1400
Text Label 4750 2850 0    50   ~ 0
TC
$Comp
L alexios:74AC541 U?
U 2 1 5D859A89
P 2800 6350
AR Path="/6A313729/5D859A89" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D859A89" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D859A89" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D859A89" Ref="U604"  Part="2" 
F 0 "U604" H 2980 6396 50  0000 L CNN
F 1 "74AC541" H 2980 6305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2800 6350 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 2800 6350 50  0001 C CNN
	2    2800 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 5D85AD1E
P 4100 6350
AR Path="/6A313729/5D85AD1E" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/5D85AD1E" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/5D85AD1E" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/5D85AD1E" Ref="U605"  Part="2" 
F 0 "U605" H 4280 6396 50  0000 L CNN
F 1 "74AC541" H 4280 6305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4100 6350 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 4100 6350 50  0001 C CNN
	2    4100 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D88ED05
P 1950 5250
AR Path="/5CC0D65F/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D88ED05" Ref="C?"  Part="1" 
AR Path="/6A313729/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D88ED05" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D88ED05" Ref="C601"  Part="1" 
F 0 "C601" H 1850 5250 50  0000 R CNN
F 1 "100nF" H 1900 5150 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1950 5250 50  0001 C CNN
F 3 "~" H 1950 5250 50  0001 C CNN
	1    1950 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D88ED0B
P 1950 5150
AR Path="/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D88ED0B" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D88ED0B" Ref="#PWR0607"  Part="1" 
F 0 "#PWR0607" H 1950 5000 50  0001 C CNN
F 1 "+5V" H 1965 5323 50  0000 C CNN
F 2 "" H 1950 5150 50  0001 C CNN
F 3 "" H 1950 5150 50  0001 C CNN
	1    1950 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D88ED12
P 1950 5350
AR Path="/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D88ED12" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D88ED12" Ref="#PWR0613"  Part="1" 
F 0 "#PWR0613" H 1950 5100 50  0001 C CNN
F 1 "GND" H 1955 5177 50  0000 C CNN
F 2 "" H 1950 5350 50  0001 C CNN
F 3 "" H 1950 5350 50  0001 C CNN
	1    1950 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D8A6EF3
P 1150 6350
AR Path="/5CC0D65F/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/6A313729/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D8A6EF3" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D8A6EF3" Ref="C602"  Part="1" 
F 0 "C602" H 1059 6396 50  0000 R CNN
F 1 "100nF" H 1059 6305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 6350 50  0001 C CNN
F 3 "~" H 1150 6350 50  0001 C CNN
	1    1150 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D8A6EF9
P 1150 6250
AR Path="/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D8A6EF9" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D8A6EF9" Ref="#PWR0608"  Part="1" 
F 0 "#PWR0608" H 1150 6100 50  0001 C CNN
F 1 "+5V" H 1165 6423 50  0000 C CNN
F 2 "" H 1150 6250 50  0001 C CNN
F 3 "" H 1150 6250 50  0001 C CNN
	1    1150 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8A6EFF
P 1150 6450
AR Path="/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D8A6EFF" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D8A6EFF" Ref="#PWR0614"  Part="1" 
F 0 "#PWR0614" H 1150 6200 50  0001 C CNN
F 1 "GND" H 1155 6277 50  0000 C CNN
F 2 "" H 1150 6450 50  0001 C CNN
F 3 "" H 1150 6450 50  0001 C CNN
	1    1150 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D941583
P 1150 7100
AR Path="/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D941583" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D941583" Ref="#PWR0609"  Part="1" 
F 0 "#PWR0609" H 1150 6950 50  0001 C CNN
F 1 "+5V" H 1165 7273 50  0000 C CNN
F 2 "" H 1150 7100 50  0001 C CNN
F 3 "" H 1150 7100 50  0001 C CNN
	1    1150 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D941589
P 1150 7300
AR Path="/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D941589" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D941589" Ref="#PWR0615"  Part="1" 
F 0 "#PWR0615" H 1150 7050 50  0001 C CNN
F 1 "GND" H 1155 7127 50  0000 C CNN
F 2 "" H 1150 7300 50  0001 C CNN
F 3 "" H 1150 7300 50  0001 C CNN
	1    1150 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D94D46E
P 2450 6250
AR Path="/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D94D46E" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D94D46E" Ref="#PWR0610"  Part="1" 
F 0 "#PWR0610" H 2450 6100 50  0001 C CNN
F 1 "+5V" H 2465 6423 50  0000 C CNN
F 2 "" H 2450 6250 50  0001 C CNN
F 3 "" H 2450 6250 50  0001 C CNN
	1    2450 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D94D474
P 2450 6450
AR Path="/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D94D474" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5D94D474" Ref="#PWR0616"  Part="1" 
F 0 "#PWR0616" H 2450 6200 50  0001 C CNN
F 1 "GND" H 2455 6277 50  0000 C CNN
F 2 "" H 2450 6450 50  0001 C CNN
F 3 "" H 2450 6450 50  0001 C CNN
	1    2450 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9648DE
P 1150 7200
AR Path="/5CC0D65F/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D9648DE" Ref="C?"  Part="1" 
AR Path="/6A313729/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D9648DE" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D9648DE" Ref="C603"  Part="1" 
F 0 "C603" H 1059 7246 50  0000 R CNN
F 1 "100nF" H 1059 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1150 7200 50  0001 C CNN
F 3 "~" H 1150 7200 50  0001 C CNN
	1    1150 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D96FFA9
P 2450 6350
AR Path="/5CC0D65F/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5EF76914/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/6A313729/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D96FFA9" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5D96FFA9" Ref="C604"  Part="1" 
F 0 "C604" H 2359 6396 50  0000 R CNN
F 1 "100nF" H 2359 6305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 6350 50  0001 C CNN
F 3 "~" H 2450 6350 50  0001 C CNN
	1    2450 6350
	1    0    0    -1  
$EndComp
Connection ~ 1150 7100
Connection ~ 1150 7300
Connection ~ 2450 6250
Connection ~ 2450 6450
$Comp
L power:+5V #PWR?
U 1 1 5DA3CE6A
P 3750 6250
AR Path="/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA3CE6A" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA3CE6A" Ref="#PWR0611"  Part="1" 
F 0 "#PWR0611" H 3750 6100 50  0001 C CNN
F 1 "+5V" H 3765 6423 50  0000 C CNN
F 2 "" H 3750 6250 50  0001 C CNN
F 3 "" H 3750 6250 50  0001 C CNN
	1    3750 6250
	1    0    0    -1  
$EndComp
Text Label 6100 2750 1    50   ~ 0
B[0..15]
Text Label 8250 2800 1    50   ~ 0
B[0..15]
Text HLabel 1150 4100 0    50   Input ~ 0
FLFAST
Text Notes 1500 3000 0    100  ~ 20
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
Text Notes 8600 5250 0    63   ~ 13
Assumption
Text Notes 8600 5600 0    50   ~ 0
The IBus isn't used while the SRU is running, and remains\ntri-stated by the rest of the processor. We master it and\nuse it to feed back to the ALU B port.
$Comp
L power:GND #PWR?
U 1 1 5DA3CE70
P 3750 6450
AR Path="/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA3CE70" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/5DA3CE70" Ref="#PWR0617"  Part="1" 
F 0 "#PWR0617" H 3750 6200 50  0001 C CNN
F 1 "GND" H 3755 6277 50  0000 C CNN
F 2 "" H 3750 6450 50  0001 C CNN
F 3 "" H 3750 6450 50  0001 C CNN
	1    3750 6450
	1    0    0    -1  
$EndComp
Connection ~ 3750 6450
Connection ~ 3750 6250
$Comp
L Device:C_Small C?
U 1 1 5DA3CE64
P 3750 6350
AR Path="/5CC0D65F/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5EF76914/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/6A313729/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DA3CE64" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/5DA3CE64" Ref="C605"  Part="1" 
F 0 "C605" H 3659 6396 50  0000 R CNN
F 1 "100nF" H 3659 6305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 6350 50  0001 C CNN
F 3 "~" H 3750 6350 50  0001 C CNN
	1    3750 6350
	1    0    0    -1  
$EndComp
Text Label 5900 2750 1    50   ~ 0
TC
Text Label 6350 2300 0    50   ~ 0
~ENL
Text Label 6350 3800 0    50   ~ 0
~ENL
Wire Wire Line
	6350 2300 6500 2300
Wire Wire Line
	6350 3800 6500 3800
Text HLabel 3350 3900 2    50   Output ~ 0
BCP
Text HLabel 1150 1550 0    50   Input ~ 0
CLK3
Wire Wire Line
	5750 2300 5900 2300
Wire Wire Line
	5900 2300 5900 2400
$Comp
L Device:R_Small R601
U 1 1 5EE5CF78
P 5900 2500
F 0 "R601" H 5841 2454 50  0000 R CNN
F 1 "0Ω" H 5841 2545 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5900 2500 50  0001 C CNN
F 3 "~" H 5900 2500 50  0001 C CNN
	1    5900 2500
	1    0    0    1   
$EndComp
Text Label 2950 2500 0    50   ~ 0
x4CLK
Wire Wire Line
	1700 2250 1150 2250
Wire Wire Line
	1700 2350 1150 2350
Text HLabel 1150 2250 0    50   Input ~ 0
CLK2
Text HLabel 1150 2350 0    50   Input ~ 0
CLK4
Text Label 1200 2250 0    50   ~ 0
CLK2
Text Label 1200 2350 0    50   ~ 0
CLK4
Wire Notes Line width 20 style solid
	8500 5050 11000 5050
Wire Notes Line width 20 style solid
	11000 5050 11000 5700
Wire Notes Line width 20 style solid
	11000 5700 8500 5700
Wire Notes Line width 20 style solid
	8500 5700 8500 5050
Text Notes 2900 1700 0    100  ~ 20
State Machine
Text Notes 6950 6650 0    50   ~ 0
The Shift and Rotate Unit performs 16- and 17-bit rolls as well as arithmetic and bitwise shifts for\nbit distances 0–15. It does this serially, one bit at a time to reduce chip count. To speed things up,\nit runs on a quadruppled clock, performing 16 million operations per second. In practice, the\nControl Unit has to wait several cycles for the SRU to complete its operation. The SRU operates on\nthe ALU's B Register, which it uses as a scratch register, updating it on every step.
$Sheet
S 1700 2100 1150 600 
U 5EF12B5A
F0 "Clock Quadruppler" 50
F1 "clock_quadruppler.sch" 50
F2 "CLK4" I L 1700 2350 50 
F3 "CLK2" I L 1700 2250 50 
F4 "x4CLK" O R 2850 2500 50 
F5 "16MHz" I L 1700 2550 50 
$EndSheet
Wire Wire Line
	1700 2550 1150 2550
Text HLabel 1150 2550 0    50   Input ~ 0
16MHz
Text Label 1200 2550 0    50   ~ 0
16MHz
$Comp
L alexios:ATF16V8B U?
U 1 1 6126E868
P 2350 4150
AR Path="/5E1C970B/6126E868" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/6126E868" Ref="U601"  Part="1" 
F 0 "U601" H 2350 4900 50  0000 C CNN
F 1 "ATF16V8B" H 2350 4800 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2350 4150 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2350 4150 50  0001 C CNN
F 4 "ALUSRU00" V 2350 4150 50  0000 C CNB "Signature"
F 5 "alu-sru.jed" H 2350 3500 50  0000 C CNN "Image Filename"
	1    2350 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3700 1350 3700
Wire Wire Line
	1900 3900 1350 3900
Wire Wire Line
	1900 4200 1350 4200
Wire Wire Line
	1900 4300 1150 4300
Wire Wire Line
	1900 4600 1350 4600
Wire Wire Line
	3350 3800 2800 3800
Wire Wire Line
	3350 3900 2800 3900
Wire Wire Line
	3300 4000 2800 4000
Wire Wire Line
	3300 4100 2800 4100
Wire Wire Line
	3300 4200 2800 4200
Wire Wire Line
	3300 4300 2800 4300
Text Label 1350 4200 0    50   ~ 0
TC
Text Label 1350 4300 0    50   ~ 0
~LOGIC~∕ARITH
Text Label 1350 4400 0    50   ~ 0
~SHIFT~∕ROTATE
Text Label 1350 4500 0    50   ~ 0
~LEFT~∕RIGHT
Text Label 1350 4600 0    50   ~ 0
B0
Text Label 1350 4900 0    50   ~ 0
B15
Wire Wire Line
	1350 4900 2850 4900
Wire Wire Line
	2850 4900 2850 4400
Wire Wire Line
	2850 4400 2800 4400
Text Label 3300 4300 2    50   ~ 0
~ENL
Text Label 3300 4200 2    50   ~ 0
~ENR
Text Label 3300 4100 2    50   ~ 0
MSB
Text Label 3300 4000 2    50   ~ 0
LSB
Text Label 3300 3900 2    50   ~ 0
BCP
Text Label 3300 3800 2    50   ~ 0
FLOUT-SRU
Text HLabel 1150 1350 0    50   Input ~ 0
~RSTHOLD
Text Label 1850 1350 2    50   ~ 0
~RSTHOLD
$Comp
L alexios:74AC74 U602
U 1 1 6136E5DF
P 2300 1500
F 0 "U602" H 2300 1917 50  0000 C CNN
F 1 "74AC74" H 2300 1826 50  0000 C CNN
F 2 "" H 2250 1650 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 2250 1650 50  0001 C CNN
	1    2300 1500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC74 U602
U 2 1 6136F28C
P 6300 7250
F 0 "U602" H 6300 7667 50  0000 C CNN
F 1 "74AC74" H 6300 7576 50  0000 C CNN
F 2 "" H 6250 7400 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 6250 7400 50  0001 C CNN
	2    6300 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC74 U602
U 3 1 6137E883
P 1500 6350
F 0 "U602" H 1680 6396 50  0000 L CNN
F 1 "74AC74" H 1680 6305 50  0000 L CNN
F 2 "" H 1450 6500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 1450 6500 50  0001 C CNN
	3    1500 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U?
U 2 1 613917D6
P 2300 5250
AR Path="/5E1C970B/613917D6" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/613917D6" Ref="U601"  Part="2" 
F 0 "U601" H 2480 5296 50  0000 L CNN
F 1 "ATF16V8B" H 2480 5205 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2300 5250 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 2300 5250 50  0001 C CNN
F 4 "ALUSRU00" V 2300 5250 50  0001 C CNB "Signature"
F 5 "alu-sru.jed" H 2300 4600 50  0001 C CNN "Image Filename"
	2    2300 5250
	1    0    0    -1  
$EndComp
Connection ~ 1950 5350
Connection ~ 1950 5150
Connection ~ 1150 6250
Connection ~ 1150 6450
$Comp
L alexios:74AC191 U?
U 2 1 613A40A3
P 1500 7450
AR Path="/5CE09726/613A40A3" Ref="U?"  Part="1" 
AR Path="/6A313729/613A40A3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/613A40A3" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/613A40A3" Ref="U?"  Part="1" 
AR Path="/5DF75CDE/613A40A3" Ref="U603"  Part="2" 
F 0 "U603" H 1680 7746 50  0000 L CNN
F 1 "74AC191" H 1680 7655 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1475 7450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 1475 7450 50  0001 C CNN
	2    1500 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 7400 5800 7400
Wire Wire Line
	5800 7400 5800 7300
$Comp
L power:+5V #PWR0157
U 1 1 6140AAC6
P 5800 7000
F 0 "#PWR0157" H 5800 6850 50  0001 C CNN
F 1 "+5V" H 5815 7173 50  0000 C CNN
F 2 "" H 5800 7000 50  0001 C CNN
F 3 "" H 5800 7000 50  0001 C CNN
	1    5800 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 7100 5800 7100
Connection ~ 5800 7100
Wire Wire Line
	5800 7100 5800 7000
Wire Wire Line
	5850 7200 5800 7200
Connection ~ 5800 7200
Wire Wire Line
	5800 7200 5800 7100
Wire Wire Line
	5850 7300 5800 7300
Connection ~ 5800 7300
Wire Wire Line
	5800 7300 5800 7200
NoConn ~ 6750 7100
NoConn ~ 6750 7400
Wire Wire Line
	1150 4400 1900 4400
Wire Wire Line
	1150 4500 1900 4500
Wire Wire Line
	1150 4100 1900 4100
Text HLabel 1150 4000 0    50   Input ~ 0
~WRITE-ALU-B
Wire Wire Line
	1150 4000 1900 4000
Wire Wire Line
	1350 3800 1900 3800
Text Label 1350 3700 0    50   ~ 0
x4CLK
Text Label 1350 3800 0    50   ~ 0
~RSTHOLD
Text Label 1350 3900 0    50   ~ 0
~START-SYNC
Text Label 1350 4000 0    50   ~ 0
~WRITE-ALU-B
Text Label 1350 4100 0    50   ~ 0
FLFAST
Wire Wire Line
	1150 1350 1850 1350
Text HLabel 3350 3800 2    50   Output ~ 0
FLOUT-SRU
Wire Wire Line
	6500 2400 6450 2400
Wire Wire Line
	6450 2400 6450 2450
$Comp
L power:GND #PWR0158
U 1 1 615961B1
P 6450 2450
F 0 "#PWR0158" H 6450 2200 50  0001 C CNN
F 1 "GND" H 6455 2277 50  0000 C CNN
F 2 "" H 6450 2450 50  0001 C CNN
F 3 "" H 6450 2450 50  0001 C CNN
	1    6450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3900 6450 3900
Wire Wire Line
	6450 3900 6450 3950
$Comp
L power:GND #PWR0159
U 1 1 615A192F
P 6450 3950
F 0 "#PWR0159" H 6450 3700 50  0001 C CNN
F 1 "GND" H 6350 4000 50  0000 C CNN
F 2 "" H 6450 3950 50  0001 C CNN
F 3 "" H 6450 3950 50  0001 C CNN
	1    6450 3950
	1    0    0    -1  
$EndComp
Text Label 8450 3600 0    50   ~ 0
MSB
Wire Wire Line
	8650 2300 8450 2300
Wire Wire Line
	8650 3900 8600 3900
Wire Wire Line
	8600 3900 8600 3950
$Comp
L power:GND #PWR0160
U 1 1 6160265E
P 8600 3950
F 0 "#PWR0160" H 8600 3700 50  0001 C CNN
F 1 "GND" H 8500 4000 50  0000 C CNN
F 2 "" H 8600 3950 50  0001 C CNN
F 3 "" H 8600 3950 50  0001 C CNN
	1    8600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2400 8600 2400
Wire Wire Line
	8600 2400 8600 2450
$Comp
L power:GND #PWR0161
U 1 1 6160C9A5
P 8600 2450
F 0 "#PWR0161" H 8600 2200 50  0001 C CNN
F 1 "GND" H 8605 2277 50  0000 C CNN
F 2 "" H 8600 2450 50  0001 C CNN
F 3 "" H 8600 2450 50  0001 C CNN
	1    8600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2500 4750 2500
$Comp
L alexios:74AC541 U?
U 2 1 616917BF
P 2800 7200
AR Path="/6A313729/616917BF" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/616917BF" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/616917BF" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/616917BF" Ref="U606"  Part="2" 
F 0 "U606" H 2980 7246 50  0000 L CNN
F 1 "74AC541" H 2980 7155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 2800 7200 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 2800 7200 50  0001 C CNN
	2    2800 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC541 U?
U 2 1 616917C5
P 4100 7200
AR Path="/6A313729/616917C5" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D0A147D/616917C5" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D396E91/616917C5" Ref="U?"  Part="2" 
AR Path="/5DF75CDE/616917C5" Ref="U607"  Part="2" 
F 0 "U607" H 4280 7246 50  0000 L CNN
F 1 "74AC541" H 4280 7155 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4100 7200 50  0001 C CNN
F 3 "https://www.mouser.com/ds/2/149/74AC541-74146.pdf" H 4100 7200 50  0001 C CNN
	2    4100 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 616917CB
P 2450 7100
AR Path="/616917CB" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/616917CB" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/616917CB" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/616917CB" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/616917CB" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/616917CB" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 2450 6950 50  0001 C CNN
F 1 "+5V" H 2465 7273 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616917D1
P 2450 7300
AR Path="/616917D1" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/616917D1" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/616917D1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/616917D1" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/616917D1" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/616917D1" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 2450 7050 50  0001 C CNN
F 1 "GND" H 2455 7127 50  0000 C CNN
F 2 "" H 2450 7300 50  0001 C CNN
F 3 "" H 2450 7300 50  0001 C CNN
	1    2450 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 616917D7
P 2450 7200
AR Path="/5CC0D65F/616917D7" Ref="C?"  Part="1" 
AR Path="/616917D7" Ref="C?"  Part="1" 
AR Path="/5EF76914/616917D7" Ref="C?"  Part="1" 
AR Path="/6A313729/616917D7" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/616917D7" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/616917D7" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/616917D7" Ref="C606"  Part="1" 
F 0 "C606" H 2359 7246 50  0000 R CNN
F 1 "100nF" H 2359 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 7200 50  0001 C CNN
F 3 "~" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
Connection ~ 2450 7100
Connection ~ 2450 7300
$Comp
L power:+5V #PWR?
U 1 1 616917DF
P 3750 7100
AR Path="/616917DF" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/616917DF" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/616917DF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/616917DF" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/616917DF" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/616917DF" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 3750 6950 50  0001 C CNN
F 1 "+5V" H 3765 7273 50  0000 C CNN
F 2 "" H 3750 7100 50  0001 C CNN
F 3 "" H 3750 7100 50  0001 C CNN
	1    3750 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 616917E5
P 3750 7300
AR Path="/616917E5" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/616917E5" Ref="#PWR?"  Part="1" 
AR Path="/6A313729/616917E5" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/616917E5" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D396E91/616917E5" Ref="#PWR?"  Part="1" 
AR Path="/5DF75CDE/616917E5" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 3750 7050 50  0001 C CNN
F 1 "GND" H 3755 7127 50  0000 C CNN
F 2 "" H 3750 7300 50  0001 C CNN
F 3 "" H 3750 7300 50  0001 C CNN
	1    3750 7300
	1    0    0    -1  
$EndComp
Connection ~ 3750 7300
Connection ~ 3750 7100
$Comp
L Device:C_Small C?
U 1 1 616917ED
P 3750 7200
AR Path="/5CC0D65F/616917ED" Ref="C?"  Part="1" 
AR Path="/616917ED" Ref="C?"  Part="1" 
AR Path="/5EF76914/616917ED" Ref="C?"  Part="1" 
AR Path="/6A313729/616917ED" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/616917ED" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D396E91/616917ED" Ref="C?"  Part="1" 
AR Path="/5DF75CDE/616917ED" Ref="C607"  Part="1" 
F 0 "C607" H 3659 7246 50  0000 R CNN
F 1 "100nF" H 3659 7155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 7200 50  0001 C CNN
F 3 "~" H 3750 7200 50  0001 C CNN
	1    3750 7200
	1    0    0    -1  
$EndComp
Wire Bus Line
	4400 1100 4400 1800
Wire Bus Line
	8250 1500 8250 4000
Wire Bus Line
	7900 1100 7900 3500
Wire Bus Line
	10050 1100 10050 3800
Wire Bus Line
	6100 950  6100 4000
$EndSCHEMATC
