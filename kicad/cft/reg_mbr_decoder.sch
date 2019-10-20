EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 35 35
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
L alexios:74HC138 U?
U 1 1 63D535CD
P 3700 3850
AR Path="/5F3EA987/63D535CD" Ref="U?"  Part="1" 
AR Path="/63D535CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D535CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535CD" Ref="U?"  Part="1" 
F 0 "U?" H 3700 3275 50  0000 C CNN
F 1 "74HC138" H 3700 3184 50  0000 C CNN
F 2 "" H 3700 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3700 3850 50  0001 C CNN
	1    3700 3850
	1    0    0    -1  
$EndComp
Text Label 4300 3550 0    50   ~ 0
~READ-MBP+FL
Text Label 4300 3750 0    50   ~ 0
~READ-MBn
Wire Wire Line
	3200 3450 2900 3450
Wire Wire Line
	3200 3550 2900 3550
Wire Wire Line
	3200 3650 2900 3650
Wire Wire Line
	3200 4150 2900 4150
Wire Wire Line
	3200 4250 2900 4250
Text Label 2900 3450 0    50   ~ 0
RADDR0
Text Label 2900 3550 0    50   ~ 0
RADDR1
Text Label 2900 3650 0    50   ~ 0
RADDR2
Text Label 2900 4150 0    50   ~ 0
RADDR3
Text Label 2900 4250 0    50   ~ 0
RADDR4
Wire Wire Line
	4200 3550 5050 3550
Text Notes 3750 4100 1    50   ~ 10
RADDR=00XXX
$Comp
L power:+5V #PWR?
U 1 1 63D535E1
P 3200 4050
AR Path="/61F95ACC/63D535E1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535E1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 3900 50  0001 C CNN
F 1 "+5V" H 3215 4223 50  0000 C CNN
F 2 "" H 3200 4050 50  0001 C CNN
F 3 "" H 3200 4050 50  0001 C CNN
	1    3200 4050
	1    0    0    -1  
$EndComp
NoConn ~ 4200 3450
NoConn ~ 4200 3650
NoConn ~ 4200 3850
NoConn ~ 4200 3950
NoConn ~ 4200 4050
NoConn ~ 4200 4150
$Comp
L alexios:74HC138 U?
U 1 1 63D535ED
P 3700 2600
AR Path="/5F3EA987/63D535ED" Ref="U?"  Part="1" 
AR Path="/63D535ED" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D535ED" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535ED" Ref="U?"  Part="1" 
F 0 "U?" H 3700 3267 50  0000 C CNN
F 1 "74HC138" H 3700 3176 50  0000 C CNN
F 2 "" H 3700 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3700 2600 50  0001 C CNN
	1    3700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2800 2900 2800
Wire Wire Line
	3200 2900 2900 2900
Wire Wire Line
	3200 3000 2900 3000
Text Label 2900 2800 0    50   ~ 0
WADDR2
Text Label 2900 2900 0    50   ~ 0
WADDR3
Text Label 2900 3000 0    50   ~ 0
WADDR4
Wire Wire Line
	3200 2400 3150 2400
Wire Wire Line
	3150 2400 3150 2300
$Comp
L power:+5V #PWR?
U 1 1 63D535FB
P 3150 2150
AR Path="/61F95ACC/63D535FB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 2000 50  0001 C CNN
F 1 "+5V" H 3165 2323 50  0000 C CNN
F 2 "" H 3150 2150 50  0001 C CNN
F 3 "" H 3150 2150 50  0001 C CNN
	1    3150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2200 3150 2200
Connection ~ 3150 2200
Wire Wire Line
	3150 2200 3150 2150
Wire Wire Line
	3200 2300 3150 2300
Connection ~ 3150 2300
Wire Wire Line
	3150 2300 3150 2200
NoConn ~ 4200 2200
NoConn ~ 4200 2300
NoConn ~ 4200 2400
NoConn ~ 4200 2500
NoConn ~ 4200 2600
NoConn ~ 4200 2700
NoConn ~ 4200 2800
Wire Wire Line
	4800 2300 5100 2300
Wire Wire Line
	5800 2200 5800 2700
Wire Wire Line
	5700 2500 5700 2800
Wire Wire Line
	5800 2700 5850 2700
Wire Wire Line
	5700 2800 5850 2800
Wire Wire Line
	5600 2200 5800 2200
Wire Wire Line
	5600 2500 5700 2500
$Comp
L alexios:74LVC1G0832 U?
U 1 1 63D53615
P 6200 2800
AR Path="/5F3EA987/63D53615" Ref="U?"  Part="1" 
AR Path="/63D53615" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D53615" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53615" Ref="U?"  Part="1" 
F 0 "U?" H 6225 3114 50  0000 C CNN
F 1 "74LVC1G0832" H 6225 3023 50  0000 C CNN
F 2 "" H 6200 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 6200 2800 50  0001 C CNN
	1    6200 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 63D5361B
P 5400 2450
AR Path="/5F3EA987/63D5361B" Ref="U?"  Part="1" 
AR Path="/63D5361B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D5361B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5361B" Ref="U?"  Part="1" 
F 0 "U?" H 5450 2250 50  0000 C CNN
F 1 "74LVC1G11" H 5200 2150 50  0000 L CNN
F 2 "" H 5300 2375 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 5300 2375 50  0001 C CNN
	1    5400 2450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 63D53621
P 5400 2150
AR Path="/5F3EA987/63D53621" Ref="U?"  Part="1" 
AR Path="/63D53621" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D53621" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53621" Ref="U?"  Part="1" 
F 0 "U?" H 5450 2350 50  0000 C CNN
F 1 "74LVC1G11" H 5600 2250 50  0000 C CNN
F 2 "" H 5300 2075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 5300 2075 50  0001 C CNN
	1    5400 2150
	1    0    0    -1  
$EndComp
Text Label 4800 2400 0    50   ~ 0
IR9
Text Label 4800 2300 0    50   ~ 0
IR8
Wire Wire Line
	5100 2400 4800 2400
Text Label 4800 2500 0    50   ~ 0
IR10
Wire Wire Line
	5100 2500 4800 2500
Text Label 4800 2600 0    50   ~ 0
IR11
Wire Wire Line
	5100 2600 4800 2600
Text Label 4800 2200 0    50   ~ 0
WADDR1
Wire Wire Line
	4800 2200 5100 2200
Text Label 4800 2100 0    50   ~ 0
WADDR0
Wire Wire Line
	4800 2100 5100 2100
Wire Wire Line
	6600 2800 6650 2800
Wire Wire Line
	6650 2800 6650 2900
Wire Wire Line
	6650 2900 6700 2900
$Comp
L alexios:74LVC1G08 U?
U 1 1 63D53635
P 7000 2950
AR Path="/61F95ACC/63D53635" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53635" Ref="U?"  Part="1" 
F 0 "U?" H 6925 3217 50  0000 C CNN
F 1 "74LVC1G08" H 6925 3126 50  0000 C CNN
F 2 "" H 6650 2950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 6650 2950 50  0001 C CNN
	1    7000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3000 4950 3000
Wire Wire Line
	4200 3750 4950 3750
Wire Wire Line
	4950 3750 4950 3000
Wire Wire Line
	5050 3550 5050 3200
Wire Wire Line
	5050 3200 6700 3200
$Comp
L alexios:74LVC1G04 U?
U 1 1 63D53640
P 7000 3200
AR Path="/61F95ACC/63D53640" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53640" Ref="U?"  Part="1" 
F 0 "U?" H 6950 3025 50  0000 C CNN
F 1 "74LVC1G04" H 6950 2934 50  0000 C CNN
F 2 "" H 7000 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 7000 3200 50  0001 C CNN
	1    7000 3200
	1    0    0    -1  
$EndComp
Text Label 7350 2950 0    50   ~ 0
~USE-IR
Text Label 7350 2250 0    50   ~ 0
IR2
Text Label 7350 2150 0    50   ~ 0
IR1
Text Label 7350 2050 0    50   ~ 0
IR0
Wire Wire Line
	7200 3200 7300 3200
Wire Wire Line
	7300 3200 7300 3050
Text Label 7350 3050 0    50   ~ 0
READ_MBn
Wire Wire Line
	7300 3050 7850 3050
$Comp
L alexios:74AC157 U?
U 1 1 63D5364E
P 8350 2650
AR Path="/5F3EA987/63D5364E" Ref="U?"  Part="1" 
AR Path="/63D5364E" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D5364E" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5364E" Ref="U?"  Part="1" 
F 0 "U?" H 8350 3517 50  0000 C CNN
F 1 "74AC157" H 8350 3426 50  0000 C CNN
F 2 "" H 8350 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8350 2650 50  0001 C CNN
	1    8350 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2150 9100 2150
Wire Wire Line
	8850 2250 9200 2250
Wire Wire Line
	7800 2350 7850 2350
Wire Wire Line
	7350 2050 7850 2050
Wire Wire Line
	7350 2150 7850 2150
Wire Wire Line
	7800 2800 7850 2800
Connection ~ 7800 2800
Wire Wire Line
	7800 2700 7800 2800
NoConn ~ 8850 2350
Wire Wire Line
	7800 2350 7800 2700
Connection ~ 7800 2700
$Comp
L power:GND #PWR?
U 1 1 63D5365F
P 7800 2800
AR Path="/5F3EA987/63D5365F" Ref="#PWR?"  Part="1" 
AR Path="/63D5365F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D5365F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5365F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 2550 50  0001 C CNN
F 1 "GND" H 7650 2800 50  0000 C CNN
F 2 "" H 7800 2800 50  0001 C CNN
F 3 "" H 7800 2800 50  0001 C CNN
	1    7800 2800
	1    0    0    -1  
$EndComp
Text Label 7350 2500 0    50   ~ 0
WADDR0
Text Label 7350 2600 0    50   ~ 0
WADDR1
Text Label 9550 2050 2    50   ~ 0
SEL0
Text Label 9550 2150 2    50   ~ 0
SEL1
Text Label 9550 2250 2    50   ~ 0
SEL2
Wire Wire Line
	7850 2700 7800 2700
Wire Wire Line
	7350 2250 7850 2250
Wire Wire Line
	7150 2950 7850 2950
Wire Wire Line
	7350 2600 7850 2600
Wire Wire Line
	7350 2500 7850 2500
Text Notes 3750 2850 1    50   ~ 10
WADDR=001XX
$Comp
L alexios:74HC138 U?
U 1 1 63D53670
P 3700 5100
AR Path="/5F3EA987/63D53670" Ref="U?"  Part="1" 
AR Path="/63D53670" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D53670" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53670" Ref="U?"  Part="1" 
F 0 "U?" H 3700 4525 50  0000 C CNN
F 1 "74HC138" H 3700 4434 50  0000 C CNN
F 2 "" H 3700 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3700 5100 50  0001 C CNN
	1    3700 5100
	1    0    0    -1  
$EndComp
Text Notes 3750 5350 1    50   ~ 10
WADDR=00XXX
Wire Wire Line
	3200 4700 2900 4700
Wire Wire Line
	3200 4800 2900 4800
Wire Wire Line
	3200 4900 2900 4900
Wire Wire Line
	3200 5400 2900 5400
Wire Wire Line
	3200 5500 2900 5500
$Comp
L power:+5V #PWR?
U 1 1 63D5367C
P 3200 5300
AR Path="/61F95ACC/63D5367C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5367C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 5150 50  0001 C CNN
F 1 "+5V" H 3215 5473 50  0000 C CNN
F 2 "" H 3200 5300 50  0001 C CNN
F 3 "" H 3200 5300 50  0001 C CNN
	1    3200 5300
	1    0    0    -1  
$EndComp
Text Label 2900 4700 0    50   ~ 0
WADDR0
Text Label 2900 4800 0    50   ~ 0
WADDR1
Text Label 2900 4900 0    50   ~ 0
WADDR2
Text Label 2900 5400 0    50   ~ 0
WADDR3
Text Label 2900 5500 0    50   ~ 0
WADDR4
Text Label 4300 4800 0    50   ~ 0
~WRITE-MBP+FL
Text Label 4300 5000 0    50   ~ 0
~WRITE-MBn
Wire Wire Line
	4200 4800 5050 4800
$Comp
L alexios:74LVC1G08 U?
U 1 1 63D5368A
P 5400 4950
AR Path="/61F95ACC/63D5368A" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5368A" Ref="U?"  Part="1" 
F 0 "U?" H 5325 5217 50  0000 C CNN
F 1 "74LVC1G08" H 5325 5126 50  0000 C CNN
F 2 "" H 5050 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5050 4950 50  0001 C CNN
	1    5400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4800 5050 4900
Wire Wire Line
	5050 4900 5100 4900
Wire Wire Line
	4200 5000 5100 5000
$Comp
L Device:R_Network03 RN?
U 1 1 63D53693
P 9100 2550
AR Path="/61F95ACC/63D53693" Ref="RN?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53693" Ref="RN?"  Part="1" 
F 0 "RN?" H 9288 2504 50  0000 L CNN
F 1 "1kΩ" H 9288 2595 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP4" V 9375 2550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9100 2550 50  0001 C CNN
	1    9100 2550
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D53699
P 9000 2750
AR Path="/61F95ACC/63D53699" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53699" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9000 2500 50  0001 C CNN
F 1 "GND" V 9005 2622 50  0000 R CNN
F 2 "" H 9000 2750 50  0001 C CNN
F 3 "" H 9000 2750 50  0001 C CNN
	1    9000 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9000 2350 9000 2050
Wire Wire Line
	8850 2050 9000 2050
Connection ~ 9000 2050
Wire Wire Line
	9000 2050 9550 2050
Wire Wire Line
	9100 2350 9100 2150
Connection ~ 9100 2150
Wire Wire Line
	9100 2150 9550 2150
Wire Wire Line
	9200 2350 9200 2250
Connection ~ 9200 2250
Wire Wire Line
	9200 2250 9550 2250
Text Label 5900 4950 2    50   ~ 0
~WMBR
Wire Wire Line
	5550 4950 10200 4950
Text Label 5850 3200 0    50   ~ 0
~READ-MBP+FL
Text Label 4950 3000 0    50   ~ 0
~READ_MPn
Text Label 4950 2900 0    50   ~ 0
~WRITE_AR_MB
Wire Wire Line
	4200 2900 5850 2900
Connection ~ 5050 3550
Wire Wire Line
	5050 3650 5050 3550
Connection ~ 4950 3750
Wire Wire Line
	4950 3750 5100 3750
Wire Wire Line
	5100 3650 5050 3650
Wire Wire Line
	5550 3700 10200 3700
Text Label 5900 3700 2    50   ~ 0
~RMBR
$Comp
L alexios:74LVC1G08 U?
U 1 1 63D536B6
P 5400 3700
AR Path="/61F95ACC/63D536B6" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D536B6" Ref="U?"  Part="1" 
F 0 "U?" H 5325 3967 50  0000 C CNN
F 1 "74LVC1G08" H 5325 3876 50  0000 C CNN
F 2 "" H 5050 3700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5050 3700 50  0001 C CNN
	1    5400 3700
	1    0    0    -1  
$EndComp
Text HLabel 10200 3700 2    50   Output ~ 0
~RMBR
Text HLabel 10200 4950 2    50   Output ~ 0
~WMBR
Entry Wire Line
	2800 3350 2900 3450
Entry Wire Line
	2800 3450 2900 3550
Entry Wire Line
	2800 3550 2900 3650
Entry Wire Line
	2800 4050 2900 4150
Entry Wire Line
	2800 4150 2900 4250
Entry Wire Line
	2800 4600 2900 4700
Entry Wire Line
	2800 4700 2900 4800
Entry Wire Line
	2800 4800 2900 4900
Entry Wire Line
	2800 5300 2900 5400
Entry Wire Line
	2800 5400 2900 5500
Entry Bus Bus
	2700 3200 2800 3300
Entry Bus Bus
	2700 4450 2800 4550
Wire Bus Line
	2700 4450 2350 4450
Wire Bus Line
	2700 3200 2350 3200
Text HLabel 2350 3200 0    50   Input ~ 0
RADDR[0..4]
Text HLabel 2350 4450 0    50   Input ~ 0
WADDR[0..4]
Entry Wire Line
	4700 2200 4800 2300
Entry Wire Line
	4700 2300 4800 2400
Entry Wire Line
	4700 2400 4800 2500
Entry Wire Line
	4700 2500 4800 2600
Entry Bus Bus
	4600 1700 4700 1800
Wire Bus Line
	4600 1700 2350 1700
Entry Bus Bus
	4700 1800 4800 1700
Wire Bus Line
	4800 1700 7150 1700
Entry Bus Bus
	7150 1700 7250 1800
Entry Wire Line
	7250 1950 7350 2050
Entry Wire Line
	7250 2050 7350 2150
Entry Wire Line
	7250 2150 7350 2250
Text HLabel 2350 1700 0    50   Input ~ 0
IR[0..11]
Entry Wire Line
	9550 2050 9650 2150
Entry Wire Line
	9550 2150 9650 2250
Entry Wire Line
	9550 2250 9650 2350
Entry Bus Bus
	9650 3150 9750 3250
Wire Bus Line
	9750 3250 10200 3250
Text HLabel 10200 3250 2    50   Output ~ 0
SEL[0..2]
Text Label 9650 2800 1    50   ~ 0
SEL[0..2]
Text Label 4700 2300 1    50   ~ 0
IR[0..11]
$Comp
L power:GND #PWR?
U 1 1 63D653E6
P 850 7500
AR Path="/63D653E6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D653E6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D653E6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D653E6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 7250 50  0001 C CNN
F 1 "GND" H 855 7327 50  0000 C CNN
F 2 "" H 850 7500 50  0001 C CNN
F 3 "" H 850 7500 50  0001 C CNN
	1    850  7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D653EC
P 850 7300
AR Path="/63D653EC" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D653EC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D653EC" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D653EC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 7150 50  0001 C CNN
F 1 "+5V" H 865 7473 50  0000 C CNN
F 2 "" H 850 7300 50  0001 C CNN
F 3 "" H 850 7300 50  0001 C CNN
	1    850  7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D653F2
P 850 7400
AR Path="/5CC0D65F/63D653F2" Ref="C?"  Part="1" 
AR Path="/63D653F2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D653F2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D653F2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D653F2" Ref="C?"  Part="1" 
F 0 "C?" H 759 7446 50  0000 R CNN
F 1 "100nF" H 759 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 850 7400 50  0001 C CNN
F 3 "~" H 850 7400 50  0001 C CNN
	1    850  7400
	1    0    0    -1  
$EndComp
Connection ~ 850  7500
Connection ~ 850  7300
$Comp
L alexios:74HC138 U?
U 2 1 63D653FA
P 1200 7400
AR Path="/5F3EA987/63D653FA" Ref="U?"  Part="1" 
AR Path="/63D653FA" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D653FA" Ref="U?"  Part="2" 
AR Path="/61F95ACC/63C9F04D/63D653FA" Ref="U?"  Part="2" 
F 0 "U?" H 1380 7446 50  0000 L CNN
F 1 "74HC138" H 1380 7355 50  0000 L CNN
F 2 "" H 1200 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1200 7400 50  0001 C CNN
	2    1200 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D6A612
P 850 6800
AR Path="/63D6A612" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D6A612" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D6A612" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6A612" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 6550 50  0001 C CNN
F 1 "GND" H 855 6627 50  0000 C CNN
F 2 "" H 850 6800 50  0001 C CNN
F 3 "" H 850 6800 50  0001 C CNN
	1    850  6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D6A618
P 850 6600
AR Path="/63D6A618" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D6A618" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D6A618" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6A618" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 6450 50  0001 C CNN
F 1 "+5V" H 865 6773 50  0000 C CNN
F 2 "" H 850 6600 50  0001 C CNN
F 3 "" H 850 6600 50  0001 C CNN
	1    850  6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D6A61E
P 850 6700
AR Path="/5CC0D65F/63D6A61E" Ref="C?"  Part="1" 
AR Path="/63D6A61E" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D6A61E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D6A61E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6A61E" Ref="C?"  Part="1" 
F 0 "C?" H 759 6746 50  0000 R CNN
F 1 "100nF" H 759 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 850 6700 50  0001 C CNN
F 3 "~" H 850 6700 50  0001 C CNN
	1    850  6700
	1    0    0    -1  
$EndComp
Connection ~ 850  6800
Connection ~ 850  6600
$Comp
L alexios:74HC138 U?
U 2 1 63D6A626
P 1200 6700
AR Path="/5F3EA987/63D6A626" Ref="U?"  Part="1" 
AR Path="/63D6A626" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D6A626" Ref="U?"  Part="2" 
AR Path="/61F95ACC/63C9F04D/63D6A626" Ref="U?"  Part="2" 
F 0 "U?" H 1380 6746 50  0000 L CNN
F 1 "74HC138" H 1380 6655 50  0000 L CNN
F 2 "" H 1200 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1200 6700 50  0001 C CNN
	2    1200 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D6D9C4
P 850 6100
AR Path="/63D6D9C4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D6D9C4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D6D9C4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6D9C4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 5850 50  0001 C CNN
F 1 "GND" H 855 5927 50  0000 C CNN
F 2 "" H 850 6100 50  0001 C CNN
F 3 "" H 850 6100 50  0001 C CNN
	1    850  6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D6D9CA
P 850 5900
AR Path="/63D6D9CA" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D6D9CA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D6D9CA" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6D9CA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 5750 50  0001 C CNN
F 1 "+5V" H 865 6073 50  0000 C CNN
F 2 "" H 850 5900 50  0001 C CNN
F 3 "" H 850 5900 50  0001 C CNN
	1    850  5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D6D9D0
P 850 6000
AR Path="/5CC0D65F/63D6D9D0" Ref="C?"  Part="1" 
AR Path="/63D6D9D0" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D6D9D0" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D6D9D0" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6D9D0" Ref="C?"  Part="1" 
F 0 "C?" H 759 6046 50  0000 R CNN
F 1 "100nF" H 759 5955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 850 6000 50  0001 C CNN
F 3 "~" H 850 6000 50  0001 C CNN
	1    850  6000
	1    0    0    -1  
$EndComp
Connection ~ 850  6100
Connection ~ 850  5900
$Comp
L alexios:74HC138 U?
U 2 1 63D6D9D8
P 1200 6000
AR Path="/5F3EA987/63D6D9D8" Ref="U?"  Part="1" 
AR Path="/63D6D9D8" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D6D9D8" Ref="U?"  Part="2" 
AR Path="/61F95ACC/63C9F04D/63D6D9D8" Ref="U?"  Part="2" 
F 0 "U?" H 1380 6046 50  0000 L CNN
F 1 "74HC138" H 1380 5955 50  0000 L CNN
F 2 "" H 1200 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1200 6000 50  0001 C CNN
	2    1200 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 63D6F6F0
P 2700 6550
AR Path="/5F3EA987/63D6F6F0" Ref="U?"  Part="1" 
AR Path="/63D6F6F0" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D6F6F0" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D6F6F0" Ref="U?"  Part="2" 
F 0 "U?" H 2780 6446 50  0000 L CNN
F 1 "74LVC1G11" H 2780 6355 50  0000 L CNN
F 2 "" H 2600 6475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 2600 6475 50  0001 C CNN
	2    2700 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 2 1 63D7012C
P 4100 7300
AR Path="/61F95ACC/63D7012C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D7012C" Ref="U?"  Part="2" 
F 0 "U?" H 4180 7246 50  0000 L CNN
F 1 "74LVC1G08" H 4180 7155 50  0000 L CNN
F 2 "" H 3750 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3750 7300 50  0001 C CNN
	2    4100 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G0832 U?
U 2 1 63D70A4F
P 5400 6700
AR Path="/5F3EA987/63D70A4F" Ref="U?"  Part="1" 
AR Path="/63D70A4F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D70A4F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D70A4F" Ref="U?"  Part="2" 
F 0 "U?" H 5580 6746 50  0000 L CNN
F 1 "74LVC1G0832" H 5580 6655 50  0000 L CNN
F 2 "" H 5400 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 5400 6700 50  0001 C CNN
	2    5400 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC157 U?
U 2 1 63D70E1B
P 8350 4800
AR Path="/5F3EA987/63D70E1B" Ref="U?"  Part="1" 
AR Path="/63D70E1B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D70E1B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D70E1B" Ref="U?"  Part="2" 
F 0 "U?" H 8350 5667 50  0000 C CNN
F 1 "74AC157" H 8350 5576 50  0000 C CNN
F 2 "" H 8350 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8350 4800 50  0001 C CNN
	2    8350 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D89FCD
P 2250 6800
AR Path="/63D89FCD" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D89FCD" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D89FCD" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D89FCD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 6550 50  0001 C CNN
F 1 "GND" H 2255 6627 50  0000 C CNN
F 2 "" H 2250 6800 50  0001 C CNN
F 3 "" H 2250 6800 50  0001 C CNN
	1    2250 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D89FD3
P 2250 6600
AR Path="/63D89FD3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D89FD3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D89FD3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D89FD3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 6450 50  0001 C CNN
F 1 "+5V" H 2265 6773 50  0000 C CNN
F 2 "" H 2250 6600 50  0001 C CNN
F 3 "" H 2250 6600 50  0001 C CNN
	1    2250 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D89FD9
P 2250 6700
AR Path="/5CC0D65F/63D89FD9" Ref="C?"  Part="1" 
AR Path="/63D89FD9" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D89FD9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D89FD9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D89FD9" Ref="C?"  Part="1" 
F 0 "C?" H 2159 6746 50  0000 R CNN
F 1 "100nF" H 2159 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2250 6700 50  0001 C CNN
F 3 "~" H 2250 6700 50  0001 C CNN
	1    2250 6700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 63D8F83F
P 2700 7250
AR Path="/5F3EA987/63D8F83F" Ref="U?"  Part="1" 
AR Path="/63D8F83F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D8F83F" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D8F83F" Ref="U?"  Part="2" 
F 0 "U?" H 2780 7146 50  0000 L CNN
F 1 "74LVC1G11" H 2780 7055 50  0000 L CNN
F 2 "" H 2600 7175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 2600 7175 50  0001 C CNN
	2    2700 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D8F845
P 2250 7500
AR Path="/63D8F845" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D8F845" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D8F845" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D8F845" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 7250 50  0001 C CNN
F 1 "GND" H 2255 7327 50  0000 C CNN
F 2 "" H 2250 7500 50  0001 C CNN
F 3 "" H 2250 7500 50  0001 C CNN
	1    2250 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D8F84B
P 2250 7300
AR Path="/63D8F84B" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D8F84B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D8F84B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D8F84B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 7150 50  0001 C CNN
F 1 "+5V" H 2265 7473 50  0000 C CNN
F 2 "" H 2250 7300 50  0001 C CNN
F 3 "" H 2250 7300 50  0001 C CNN
	1    2250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D8F851
P 2250 7400
AR Path="/5CC0D65F/63D8F851" Ref="C?"  Part="1" 
AR Path="/63D8F851" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D8F851" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D8F851" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D8F851" Ref="C?"  Part="1" 
F 0 "C?" H 2159 7446 50  0000 R CNN
F 1 "100nF" H 2159 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2250 7400 50  0001 C CNN
F 3 "~" H 2250 7400 50  0001 C CNN
	1    2250 7400
	1    0    0    -1  
$EndComp
Connection ~ 2250 7500
Connection ~ 2250 7300
$Comp
L power:GND #PWR?
U 1 1 63D9A19F
P 3650 7500
AR Path="/63D9A19F" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D9A19F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D9A19F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9A19F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 7250 50  0001 C CNN
F 1 "GND" H 3655 7327 50  0000 C CNN
F 2 "" H 3650 7500 50  0001 C CNN
F 3 "" H 3650 7500 50  0001 C CNN
	1    3650 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D9A1A5
P 3650 7300
AR Path="/63D9A1A5" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D9A1A5" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D9A1A5" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9A1A5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 7150 50  0001 C CNN
F 1 "+5V" H 3665 7473 50  0000 C CNN
F 2 "" H 3650 7300 50  0001 C CNN
F 3 "" H 3650 7300 50  0001 C CNN
	1    3650 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D9A1AB
P 3650 7400
AR Path="/5CC0D65F/63D9A1AB" Ref="C?"  Part="1" 
AR Path="/63D9A1AB" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D9A1AB" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D9A1AB" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9A1AB" Ref="C?"  Part="1" 
F 0 "C?" H 3559 7446 50  0000 R CNN
F 1 "100nF" H 3559 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 7400 50  0001 C CNN
F 3 "~" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D9C288
P 5050 6800
AR Path="/63D9C288" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D9C288" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D9C288" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9C288" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 6550 50  0001 C CNN
F 1 "GND" H 5055 6627 50  0000 C CNN
F 2 "" H 5050 6800 50  0001 C CNN
F 3 "" H 5050 6800 50  0001 C CNN
	1    5050 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D9C28E
P 5050 6600
AR Path="/63D9C28E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D9C28E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D9C28E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9C28E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 6450 50  0001 C CNN
F 1 "+5V" H 5065 6773 50  0000 C CNN
F 2 "" H 5050 6600 50  0001 C CNN
F 3 "" H 5050 6600 50  0001 C CNN
	1    5050 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D9C294
P 5050 6700
AR Path="/5CC0D65F/63D9C294" Ref="C?"  Part="1" 
AR Path="/63D9C294" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D9C294" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D9C294" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9C294" Ref="C?"  Part="1" 
F 0 "C?" H 4959 6746 50  0000 R CNN
F 1 "100nF" H 4959 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5050 6700 50  0001 C CNN
F 3 "~" H 5050 6700 50  0001 C CNN
	1    5050 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63D9E25B
P 6650 4400
AR Path="/63D9E25B" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D9E25B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D9E25B" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9E25B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6650 4150 50  0001 C CNN
F 1 "GND" H 6655 4227 50  0000 C CNN
F 2 "" H 6650 4400 50  0001 C CNN
F 3 "" H 6650 4400 50  0001 C CNN
	1    6650 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63D9E261
P 6650 4200
AR Path="/63D9E261" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D9E261" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D9E261" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9E261" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6650 4050 50  0001 C CNN
F 1 "+5V" H 6665 4373 50  0000 C CNN
F 2 "" H 6650 4200 50  0001 C CNN
F 3 "" H 6650 4200 50  0001 C CNN
	1    6650 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63D9E267
P 6650 4300
AR Path="/5CC0D65F/63D9E267" Ref="C?"  Part="1" 
AR Path="/63D9E267" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63D9E267" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63D9E267" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D9E267" Ref="C?"  Part="1" 
F 0 "C?" H 6559 4346 50  0000 R CNN
F 1 "100nF" H 6559 4255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6650 4300 50  0001 C CNN
F 3 "~" H 6650 4300 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63DA0131
P 8000 4400
AR Path="/63DA0131" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63DA0131" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63DA0131" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA0131" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8000 4150 50  0001 C CNN
F 1 "GND" H 8005 4227 50  0000 C CNN
F 2 "" H 8000 4400 50  0001 C CNN
F 3 "" H 8000 4400 50  0001 C CNN
	1    8000 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63DA0137
P 8000 4200
AR Path="/63DA0137" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63DA0137" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63DA0137" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA0137" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8000 4050 50  0001 C CNN
F 1 "+5V" H 8015 4373 50  0000 C CNN
F 2 "" H 8000 4200 50  0001 C CNN
F 3 "" H 8000 4200 50  0001 C CNN
	1    8000 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63DA013D
P 8000 4300
AR Path="/5CC0D65F/63DA013D" Ref="C?"  Part="1" 
AR Path="/63DA013D" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63DA013D" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63DA013D" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA013D" Ref="C?"  Part="1" 
F 0 "C?" H 7909 4346 50  0000 R CNN
F 1 "100nF" H 7909 4255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8000 4300 50  0001 C CNN
F 3 "~" H 8000 4300 50  0001 C CNN
	1    8000 4300
	1    0    0    -1  
$EndComp
Connection ~ 2250 6800
Connection ~ 2250 6600
Connection ~ 3650 7500
Connection ~ 3650 7300
$Comp
L alexios:74LVC1G08 U?
U 2 1 63DA6897
P 4100 6600
AR Path="/61F95ACC/63DA6897" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA6897" Ref="U?"  Part="2" 
F 0 "U?" H 4180 6546 50  0000 L CNN
F 1 "74LVC1G08" H 4180 6455 50  0000 L CNN
F 2 "" H 3750 6600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3750 6600 50  0001 C CNN
	2    4100 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63DA689D
P 3650 6800
AR Path="/63DA689D" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63DA689D" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63DA689D" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA689D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 6550 50  0001 C CNN
F 1 "GND" H 3655 6627 50  0000 C CNN
F 2 "" H 3650 6800 50  0001 C CNN
F 3 "" H 3650 6800 50  0001 C CNN
	1    3650 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63DA68A3
P 3650 6600
AR Path="/63DA68A3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63DA68A3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63DA68A3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA68A3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 6450 50  0001 C CNN
F 1 "+5V" H 3665 6773 50  0000 C CNN
F 2 "" H 3650 6600 50  0001 C CNN
F 3 "" H 3650 6600 50  0001 C CNN
	1    3650 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63DA68A9
P 3650 6700
AR Path="/5CC0D65F/63DA68A9" Ref="C?"  Part="1" 
AR Path="/63DA68A9" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63DA68A9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63DA68A9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DA68A9" Ref="C?"  Part="1" 
F 0 "C?" H 3559 6746 50  0000 R CNN
F 1 "100nF" H 3559 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3650 6700 50  0001 C CNN
F 3 "~" H 3650 6700 50  0001 C CNN
	1    3650 6700
	1    0    0    -1  
$EndComp
Connection ~ 3650 6800
Connection ~ 3650 6600
$Comp
L alexios:74LVC1G08 U?
U 2 1 63DAFBA2
P 5500 7300
AR Path="/61F95ACC/63DAFBA2" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DAFBA2" Ref="U?"  Part="2" 
F 0 "U?" H 5580 7246 50  0000 L CNN
F 1 "74LVC1G08" H 5580 7155 50  0000 L CNN
F 2 "" H 5150 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5150 7300 50  0001 C CNN
	2    5500 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63DAFBA8
P 5050 7500
AR Path="/63DAFBA8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63DAFBA8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63DAFBA8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DAFBA8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 7250 50  0001 C CNN
F 1 "GND" H 5055 7327 50  0000 C CNN
F 2 "" H 5050 7500 50  0001 C CNN
F 3 "" H 5050 7500 50  0001 C CNN
	1    5050 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63DAFBAE
P 5050 7300
AR Path="/63DAFBAE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63DAFBAE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63DAFBAE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DAFBAE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 7150 50  0001 C CNN
F 1 "+5V" H 5065 7473 50  0000 C CNN
F 2 "" H 5050 7300 50  0001 C CNN
F 3 "" H 5050 7300 50  0001 C CNN
	1    5050 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 63DAFBB4
P 5050 7400
AR Path="/5CC0D65F/63DAFBB4" Ref="C?"  Part="1" 
AR Path="/63DAFBB4" Ref="C?"  Part="1" 
AR Path="/5F3EA987/63DAFBB4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63DAFBB4" Ref="C?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63DAFBB4" Ref="C?"  Part="1" 
F 0 "C?" H 4959 7446 50  0000 R CNN
F 1 "100nF" H 4959 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5050 7400 50  0001 C CNN
F 3 "~" H 5050 7400 50  0001 C CNN
	1    5050 7400
	1    0    0    -1  
$EndComp
Connection ~ 5050 7500
Connection ~ 5050 7300
Connection ~ 5050 6600
Connection ~ 5050 6800
Connection ~ 6650 4200
Connection ~ 6650 4400
Connection ~ 8000 4200
Connection ~ 8000 4400
$Comp
L alexios:74LVC1G04 U?
U 2 1 63D70679
P 7000 4300
AR Path="/61F95ACC/63D70679" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D70679" Ref="U?"  Part="2" 
F 0 "U?" H 7180 4346 50  0000 L CNN
F 1 "74LVC1G04" H 7180 4255 50  0000 L CNN
F 2 "" H 7000 4300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 7000 4300 50  0001 C CNN
	2    7000 4300
	1    0    0    -1  
$EndComp
Text Notes 6950 6200 0    50   ~ 0
MBn registers are accessed when:\n\n1. Write access when WADDR=00001 is selected (~WRITE-MBP+FLAGS~).\n2. Write access when WADDR=00011 is selected (~WRITE-MBn~).\n3. Read access when RADDR=00001 is selected (~READ-MBP+FLAGS~).\n4. Read access when RADDR=00011 is selected (~READ-MBn~).\n5. Read access when WADDR=001xx (~WRITE-AR:MBn~). Note, even though\nwe respond on WADDR, this is a READ operation.\n\nThe register to use is usually identified by IR₀₋₂, except in cases 1 and 3\n(which always use MB0 aka MBP), and case 5 where one of the first four\nregisters is selected by WADDR₀₋₁ unless WADDR=00111 (~WRITE-AR:MBZ~)\nand IR₁₁₋₈=1111 (I=1, R=1, Operand 3XX₁₆).
Wire Bus Line
	7250 1800 7250 2150
Wire Bus Line
	9650 2150 9650 3150
Wire Bus Line
	2800 3300 2800 4150
Wire Bus Line
	2800 4550 2800 5400
Wire Bus Line
	4700 1800 4700 2500
$EndSCHEMATC
