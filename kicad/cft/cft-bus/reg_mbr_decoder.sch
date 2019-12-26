EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 14
Title "MBR Address Decoding"
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC138 U?
U 1 1 63D535CD
P 13650 3350
AR Path="/5F3EA987/63D535CD" Ref="U?"  Part="1" 
AR Path="/63D535CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D535CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535CD" Ref="U48"  Part="1" 
F 0 "U48" H 13650 4017 50  0000 C CNN
F 1 "74HC138" H 13650 3926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 13650 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 13650 3350 50  0001 C CNN
	1    13650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 2950 12850 2950
Wire Wire Line
	13150 3050 12850 3050
Wire Wire Line
	13150 3150 12850 3150
Wire Wire Line
	13150 3550 12850 3550
Wire Wire Line
	13150 3650 12850 3650
Text Label 12850 2950 0    50   ~ 0
RADDR0
Text Label 12850 3050 0    50   ~ 0
RADDR1
Text Label 12850 3150 0    50   ~ 0
RADDR2
Text Label 12850 3550 0    50   ~ 0
RADDR3
Text Label 12850 3650 0    50   ~ 0
RADDR4
Text Notes 13700 3600 1    50   ~ 10
RADDR=01XXX
$Comp
L alexios:74HC138 U?
U 1 1 63D535ED
P 13650 5850
AR Path="/5F3EA987/63D535ED" Ref="U?"  Part="1" 
AR Path="/63D535ED" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D535ED" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535ED" Ref="U43"  Part="1" 
F 0 "U43" H 13650 6517 50  0000 C CNN
F 1 "74HC138" H 13650 6426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 13650 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 13650 5850 50  0001 C CNN
	1    13650 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 6050 12850 6050
Wire Wire Line
	13150 6150 12850 6150
Wire Wire Line
	13150 6250 12850 6250
Text Label 12850 6050 0    50   ~ 0
WADDR2
Text Label 12850 6150 0    50   ~ 0
WADDR3
Text Label 12850 6250 0    50   ~ 0
WADDR4
Wire Wire Line
	13150 5650 13100 5650
Wire Wire Line
	13100 5650 13100 5550
$Comp
L power:+5V #PWR?
U 1 1 63D535FB
P 13100 5400
AR Path="/61F95ACC/63D535FB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D535FB" Ref="#PWR074"  Part="1" 
F 0 "#PWR074" H 13100 5250 50  0001 C CNN
F 1 "+5V" H 13200 5550 50  0000 C CNN
F 2 "" H 13100 5400 50  0001 C CNN
F 3 "" H 13100 5400 50  0001 C CNN
	1    13100 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 5450 13100 5450
Connection ~ 13100 5450
Wire Wire Line
	13100 5450 13100 5400
Wire Wire Line
	13150 5550 13100 5550
Connection ~ 13100 5550
Wire Wire Line
	13100 5550 13100 5450
NoConn ~ 14150 5450
NoConn ~ 14150 5550
NoConn ~ 14150 5650
NoConn ~ 14150 5750
NoConn ~ 14150 5850
NoConn ~ 14150 5950
NoConn ~ 14150 6050
Wire Wire Line
	15400 3700 16100 3700
Wire Wire Line
	16800 3600 16800 4100
Wire Wire Line
	16700 3900 16700 4200
Wire Wire Line
	16800 4100 16850 4100
Wire Wire Line
	16700 4200 16850 4200
Wire Wire Line
	16600 3600 16800 3600
Wire Wire Line
	16600 3900 16700 3900
$Comp
L alexios:74LVC1G0832 U?
U 1 1 63D53615
P 17200 4200
AR Path="/5F3EA987/63D53615" Ref="U?"  Part="1" 
AR Path="/63D53615" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D53615" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53615" Ref="U45"  Part="1" 
F 0 "U45" H 17225 4514 50  0000 C CNN
F 1 "74LVC1G0832" H 17225 4423 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 17200 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g0832.pdf" H 17200 4200 50  0001 C CNN
	1    17200 4200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 63D5361B
P 16400 3850
AR Path="/5F3EA987/63D5361B" Ref="U?"  Part="1" 
AR Path="/63D5361B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D5361B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5361B" Ref="U42"  Part="1" 
F 0 "U42" H 16450 3650 50  0000 C CNN
F 1 "74LVC1G11" H 16200 3550 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 16300 3775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 16300 3775 50  0001 C CNN
	1    16400 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 1 1 63D53621
P 16400 3550
AR Path="/5F3EA987/63D53621" Ref="U?"  Part="1" 
AR Path="/63D53621" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D53621" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53621" Ref="U41"  Part="1" 
F 0 "U41" H 16450 3750 50  0000 C CNN
F 1 "74LVC1G11" H 16600 3650 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 16300 3475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 16300 3475 50  0001 C CNN
	1    16400 3550
	1    0    0    -1  
$EndComp
Text Label 15400 3800 0    50   ~ 0
IR9
Text Label 15400 3700 0    50   ~ 0
IR8
Wire Wire Line
	16100 3800 15400 3800
Text Label 15400 3900 0    50   ~ 0
IR10
Wire Wire Line
	16100 3900 15400 3900
Text Label 15400 4000 0    50   ~ 0
IR11
Wire Wire Line
	16100 4000 15400 4000
Text Label 15400 3600 0    50   ~ 0
WADDR1
Wire Wire Line
	15400 3600 16100 3600
Text Label 15400 3500 0    50   ~ 0
WADDR0
Wire Wire Line
	15400 3500 16100 3500
Wire Wire Line
	17600 4200 17650 4200
Wire Wire Line
	17650 4200 17650 4300
Wire Wire Line
	17650 4300 17700 4300
$Comp
L alexios:74LVC1G08 U?
U 1 1 63D53635
P 18000 4350
AR Path="/61F95ACC/63D53635" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53635" Ref="U46"  Part="1" 
F 0 "U46" H 17925 4617 50  0000 C CNN
F 1 "74LVC1G08" H 17925 4526 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 17650 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 17650 4350 50  0001 C CNN
	1    18000 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	17700 4400 15400 4400
Wire Wire Line
	5050 3200 6700 3200
$Comp
L alexios:74LVC1G04 U?
U 1 1 63D53640
P 7000 3200
AR Path="/61F95ACC/63D53640" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53640" Ref="U13"  Part="1" 
F 0 "U13" H 6950 3025 50  0000 C CNN
F 1 "74LVC1G04" H 6950 2934 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7000 3200 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D5364E" Ref="U44"  Part="1" 
F 0 "U44" H 8350 3517 50  0000 C CNN
F 1 "74AC157" H 8350 3426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8350 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8350 2650 50  0001 C CNN
	1    8350 2650
	1    0    0    -1  
$EndComp
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
AR Path="/61F95ACC/63C9F04D/63D5365F" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 7800 2550 50  0001 C CNN
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
Text Notes 13700 6100 1    50   ~ 10
WADDR=001XX
$Comp
L alexios:74HC138 U?
U 1 1 63D53670
P 13650 4600
AR Path="/5F3EA987/63D53670" Ref="U?"  Part="1" 
AR Path="/63D53670" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63D53670" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D53670" Ref="U51"  Part="1" 
F 0 "U51" H 13650 5267 50  0000 C CNN
F 1 "74HC138" H 13650 5176 50  0000 C CNN
F 2 "alexios:SOIC-16" H 13650 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 13650 4600 50  0001 C CNN
	1    13650 4600
	1    0    0    -1  
$EndComp
Text Notes 13700 4850 1    50   ~ 10
WADDR=01XXX
Wire Wire Line
	13150 4200 12850 4200
Wire Wire Line
	13150 4300 12850 4300
Wire Wire Line
	13150 4400 12850 4400
Wire Wire Line
	13150 4800 12850 4800
Wire Wire Line
	13150 4900 12850 4900
Text Label 12850 4200 0    50   ~ 0
WADDR0
Text Label 12850 4300 0    50   ~ 0
WADDR1
Text Label 12850 4400 0    50   ~ 0
WADDR2
Text Label 12850 4800 0    50   ~ 0
WADDR3
Text Label 12850 4900 0    50   ~ 0
WADDR4
$Comp
L alexios:74LVC1G08 U?
U 1 1 63D5368A
P 5400 4950
AR Path="/61F95ACC/63D5368A" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D5368A" Ref="U50"  Part="1" 
F 0 "U50" H 5325 5217 50  0000 C CNN
F 1 "74LVC1G08" H 5325 5126 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5050 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5050 4950 50  0001 C CNN
	1    5400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4800 5050 4900
Wire Wire Line
	5050 4900 5100 4900
Text Label 5900 4950 2    50   ~ 0
~WMBR
Wire Wire Line
	5550 4950 10200 4950
Text Label 5850 3200 0    50   ~ 0
~READ-MBP+FL
Text Label 15400 4400 0    50   ~ 0
~READ_MBn
Text Label 15400 4300 0    50   ~ 0
~WRITE_MBx_AR
Wire Wire Line
	14150 6150 14900 6150
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
AR Path="/61F95ACC/63C9F04D/63D536B6" Ref="U47"  Part="1" 
F 0 "U47" H 5325 3967 50  0000 C CNN
F 1 "74LVC1G08" H 5325 3876 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5050 3700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5050 3700 50  0001 C CNN
	1    5400 3700
	1    0    0    -1  
$EndComp
Text HLabel 10200 3700 2    50   Output ~ 0
~RMBR
Text HLabel 10200 4950 2    50   Output ~ 0
~WMBR
Entry Wire Line
	12750 2850 12850 2950
Entry Wire Line
	12750 2950 12850 3050
Entry Wire Line
	12750 3050 12850 3150
Entry Wire Line
	12750 3450 12850 3550
Entry Wire Line
	12750 3550 12850 3650
Entry Wire Line
	12750 4100 12850 4200
Entry Wire Line
	12750 4200 12850 4300
Entry Wire Line
	12750 4300 12850 4400
Entry Wire Line
	12750 4700 12850 4800
Entry Wire Line
	12750 4800 12850 4900
Entry Bus Bus
	12650 2700 12750 2800
Entry Bus Bus
	12650 3950 12750 4050
Wire Bus Line
	12650 3950 12300 3950
Wire Bus Line
	12650 2700 12300 2700
Text HLabel 12300 2700 0    50   Input ~ 0
RADDR[0..4]
Text HLabel 12300 3950 0    50   Input ~ 0
WADDR[0..4]
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
$Comp
L power:GND #PWR?
U 1 1 63D653E6
P 850 7500
AR Path="/63D653E6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/63D653E6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63D653E6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D653E6" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 850 7250 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D653EC" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 850 7150 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D653F2" Ref="C35"  Part="1" 
F 0 "C35" H 759 7446 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D653FA" Ref="U51"  Part="2" 
F 0 "U51" H 1380 7446 50  0000 L CNN
F 1 "74HC138" H 1380 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1200 7400 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6A612" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 850 6550 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6A618" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 850 6450 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6A61E" Ref="C31"  Part="1" 
F 0 "C31" H 759 6746 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D6A626" Ref="U48"  Part="2" 
F 0 "U48" H 1380 6746 50  0000 L CNN
F 1 "74HC138" H 1380 6655 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1200 6700 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6D9C4" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 850 5850 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6D9CA" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 850 5750 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6D9D0" Ref="C30"  Part="1" 
F 0 "C30" H 759 6046 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D6D9D8" Ref="U43"  Part="2" 
F 0 "U43" H 1380 6046 50  0000 L CNN
F 1 "74HC138" H 1380 5955 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1200 6000 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D6F6F0" Ref="U42"  Part="2" 
F 0 "U42" H 2780 6446 50  0000 L CNN
F 1 "74LVC1G11" H 2780 6355 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2600 6475 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 2600 6475 50  0001 C CNN
	2    2700 6550
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 2 1 63D7012C
P 4100 7300
AR Path="/61F95ACC/63D7012C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/63D7012C" Ref="U47"  Part="2" 
F 0 "U47" H 4180 7246 50  0000 L CNN
F 1 "74LVC1G08" H 4180 7155 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3750 7300 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D70A4F" Ref="U45"  Part="2" 
F 0 "U45" H 5580 6746 50  0000 L CNN
F 1 "74LVC1G0832" H 5580 6655 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 5400 6700 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D70E1B" Ref="U44"  Part="2" 
F 0 "U44" H 8350 5667 50  0000 C CNN
F 1 "74AC157" H 8350 5576 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8350 4800 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D89FCD" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 2250 6550 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D89FD3" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 2250 6450 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D89FD9" Ref="C32"  Part="1" 
F 0 "C32" H 2159 6746 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D8F83F" Ref="U52"  Part="2" 
F 0 "U52" H 2780 7146 50  0000 L CNN
F 1 "74LVC1G11" H 2780 7055 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2600 7175 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D8F845" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 2250 7250 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D8F84B" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 2250 7150 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D8F851" Ref="C36"  Part="1" 
F 0 "C36" H 2159 7446 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D9A19F" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 3650 7250 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D9A1A5" Ref="#PWR095"  Part="1" 
F 0 "#PWR095" H 3650 7150 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D9A1AB" Ref="C37"  Part="1" 
F 0 "C37" H 3559 7446 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D9C288" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 5050 6550 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D9C28E" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 5050 6450 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D9C294" Ref="C34"  Part="1" 
F 0 "C34" H 4959 6746 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D9E25B" Ref="#PWR080"  Part="1" 
F 0 "#PWR080" H 6650 4150 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D9E261" Ref="#PWR078"  Part="1" 
F 0 "#PWR078" H 6650 4050 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63D9E267" Ref="C28"  Part="1" 
F 0 "C28" H 6559 4346 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63DA0131" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 8000 4150 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DA0137" Ref="#PWR079"  Part="1" 
F 0 "#PWR079" H 8000 4050 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DA013D" Ref="C29"  Part="1" 
F 0 "C29" H 7909 4346 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63DA6897" Ref="U46"  Part="2" 
F 0 "U46" H 4180 6546 50  0000 L CNN
F 1 "74LVC1G08" H 4180 6455 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3750 6600 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DA689D" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 3650 6550 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DA68A3" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 3650 6450 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DA68A9" Ref="C33"  Part="1" 
F 0 "C33" H 3559 6746 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63DAFBA2" Ref="U50"  Part="2" 
F 0 "U50" H 5580 7246 50  0000 L CNN
F 1 "74LVC1G08" H 5580 7155 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5150 7300 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DAFBA8" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 5050 7250 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DAFBAE" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 5050 7150 50  0001 C CNN
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
AR Path="/61F95ACC/63C9F04D/63DAFBB4" Ref="C38"  Part="1" 
F 0 "C38" H 4959 7446 50  0000 R CNN
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
AR Path="/61F95ACC/63C9F04D/63D70679" Ref="U49"  Part="2" 
F 0 "U49" H 7180 4346 50  0000 L CNN
F 1 "74LVC1G04" H 7180 4255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 7000 4300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 7000 4300 50  0001 C CNN
	2    7000 4300
	1    0    0    -1  
$EndComp
Text Notes 6950 6200 0    50   ~ 0
MBn registers are accessed when:\n\n1. Write access when WADDR=00001 is selected (~WRITE-MBP+FLAGS~).\n2. Write access when WADDR=00011 is selected (~WRITE-MBn~).\n3. Read access when RADDR=00001 is selected (~READ-MBP+FLAGS~).\n4. Read access when RADDR=00011 is selected (~READ-MBn~).\n5. Read access when WADDR=001xx (~WRITE-AR:MBn~). Note, even though\nwe respond on WADDR, this is a READ operation.\n\nThe register to use is usually identified by IR₀₋₂, except in cases 1 and 3\n(which always use MB0 aka MBP), and case 5 where one of the first four\nregisters is selected by WADDR₀₋₁ unless WADDR=00111 (~WRITE-AR:MBZ~)\nand IR₁₁₋₈=1111 (I=1, R=1, Operand 3XX₁₆).
Wire Wire Line
	4850 3650 4850 4100
Wire Wire Line
	4850 4100 5100 4100
Wire Wire Line
	4950 4900 4950 4200
Wire Wire Line
	4950 4200 5100 4200
Text HLabel 5100 4100 2    50   Output ~ 0
~READ-FLAGS
Text HLabel 5100 4200 2    50   Output ~ 0
~WRITE-FLAGS
Wire Wire Line
	13150 1700 12800 1700
Wire Wire Line
	13150 1800 12800 1800
Wire Wire Line
	13150 1900 12800 1900
Wire Wire Line
	13150 2300 12800 2300
Wire Wire Line
	13150 2400 12800 2400
Wire Wire Line
	13150 2500 12800 2500
Text Label 12800 2500 0    50   ~ 0
~SYSDEV
$Comp
L alexios:74HC138 U?
U 1 1 5E15D334
P 13650 2100
AR Path="/5F3EA987/5E15D334" Ref="U?"  Part="1" 
AR Path="/5E15D334" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E15D334" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E15D334" Ref="U?"  Part="1" 
F 0 "U?" H 13650 2750 50  0000 C CNN
F 1 "74HC138" H 13650 2650 50  0000 C CNN
F 2 "alexios:SOIC-16" H 13650 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 13650 2100 50  0001 C CNN
	1    13650 2100
	1    0    0    -1  
$EndComp
Text Label 12800 2300 0    50   ~ 0
AB3
Text Label 12800 1700 0    50   ~ 0
AB4
Text Label 12800 1800 0    50   ~ 0
AB5
Text Label 12800 1900 0    50   ~ 0
AB6
Text Label 12800 2400 0    50   ~ 0
AB7
Text Notes 13700 2500 1    50   ~ 10
IOADDR=00:00001xxx
$Comp
L alexios:74LVC1G32 U?
U 1 1 5E1BB508
P 16300 2200
F 0 "U?" H 16350 2467 50  0000 C CNN
F 1 "74LVC1G32" H 16350 2376 50  0000 C CNN
F 2 "" H 16410 2180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 16410 2180 50  0001 C CNN
	1    16300 2200
	1    0    0    -1  
$EndComp
NoConn ~ 14150 1800
NoConn ~ 14150 1900
NoConn ~ 14150 2000
NoConn ~ 14150 2100
NoConn ~ 14150 2200
NoConn ~ 14150 2300
NoConn ~ 14150 2400
Text Notes -3650 1950 0    198  ~ 0
Remap to I/O space for simplicity!
Text Notes -3650 5150 0    50   ~ 0
Sources of MBR selection:\n\n* I/O Space reads & writes: AB selects register.\n* RADDR=001xx: RADDR[1:0] selects one of first four registers.\n* [RW]ADDR=0110x: always register 0.\n* [WR]ADDR=01111: IR[2:0] selects register.
Text Notes 7700 3350 0    50   ~ 0
When ~G~ is high, all outputs are forced LOW.
$Comp
L alexios:74AC244 U?
U 1 1 5E23D98D
P 21650 3750
F 0 "U?" H 21650 4517 50  0000 C CNN
F 1 "74AC244" H 21650 4426 50  0000 C CNN
F 2 "" H 21675 4125 50  0001 C CNN
F 3 "" H 21675 4125 50  0001 C CNN
	1    21650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	21150 3650 21100 3650
Wire Wire Line
	21100 3650 21100 3750
$Comp
L power:GND #PWR?
U 1 1 5E245966
P 21100 3950
F 0 "#PWR?" H 21100 3700 50  0001 C CNN
F 1 "GND" H 20950 3900 50  0000 C CNN
F 2 "" H 21100 3950 50  0001 C CNN
F 3 "" H 21100 3950 50  0001 C CNN
	1    21100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	21150 3750 21100 3750
Connection ~ 21100 3750
Wire Wire Line
	21100 3750 21100 3850
Wire Wire Line
	21150 3850 21100 3850
Connection ~ 21100 3850
Wire Wire Line
	21100 3850 21100 3950
Wire Wire Line
	21150 3950 21100 3950
Connection ~ 21100 3950
Wire Wire Line
	8850 2250 9550 2250
Wire Wire Line
	8850 2150 9550 2150
Wire Wire Line
	8850 2050 9550 2050
Text Label 9650 2800 1    50   ~ 0
SEL[0..2]
Text HLabel 10200 3250 2    50   Output ~ 0
SEL[0..2]
Wire Bus Line
	9750 3250 10200 3250
Entry Bus Bus
	9650 3150 9750 3250
Entry Wire Line
	9550 2250 9650 2350
Entry Wire Line
	9550 2150 9650 2250
Entry Wire Line
	9550 2050 9650 2150
Text Label 9550 2250 2    50   ~ 0
SEL2
Text Label 9550 2150 2    50   ~ 0
SEL1
Text Label 9550 2050 2    50   ~ 0
SEL0
Wire Wire Line
	22150 1900 22600 1900
Wire Wire Line
	22150 1800 22600 1800
Wire Wire Line
	22150 1700 22600 1700
Text Label 22700 2900 1    50   ~ 0
SEL[0..2]
Text HLabel 23500 5500 2    50   Output ~ 0
SEL[0..2]
Entry Bus Bus
	22700 5400 22800 5500
Entry Wire Line
	22600 1900 22700 2000
Entry Wire Line
	22600 1800 22700 1900
Entry Wire Line
	22600 1700 22700 1800
Text Label 22600 1900 2    50   ~ 0
SEL2
Text Label 22600 1800 2    50   ~ 0
SEL1
Text Label 22600 1700 2    50   ~ 0
SEL0
Wire Wire Line
	22150 3350 22600 3350
Wire Wire Line
	22150 3250 22600 3250
Entry Wire Line
	22600 3350 22700 3450
Entry Wire Line
	22600 3250 22700 3350
Text Label 22600 3450 2    50   ~ 0
SEL2
Text Label 22600 3350 2    50   ~ 0
SEL1
Text Label 22600 3250 2    50   ~ 0
SEL0
Wire Wire Line
	22150 3450 22600 3450
Entry Wire Line
	22600 3450 22700 3550
Entry Wire Line
	22600 3350 22700 3450
Text Label 22600 3450 2    50   ~ 0
SEL2
Wire Wire Line
	22150 3750 22600 3750
Wire Wire Line
	22150 3650 22600 3650
Entry Wire Line
	22600 3750 22700 3850
Entry Wire Line
	22600 3650 22700 3750
Text Label 22600 3850 2    50   ~ 0
SEL2
Text Label 22600 3750 2    50   ~ 0
SEL1
Text Label 22600 3650 2    50   ~ 0
SEL0
Wire Wire Line
	22150 3850 22600 3850
Entry Wire Line
	22600 3850 22700 3950
Entry Wire Line
	22600 3750 22700 3850
Text Label 22600 3850 2    50   ~ 0
SEL2
NoConn ~ 22150 3550
NoConn ~ 22150 3950
NoConn ~ 22150 2000
NoConn ~ 22150 2400
Wire Wire Line
	22150 2300 22600 2300
Wire Wire Line
	22150 2200 22600 2200
Wire Wire Line
	22150 2100 22600 2100
Entry Wire Line
	22600 2300 22700 2400
Entry Wire Line
	22600 2200 22700 2300
Entry Wire Line
	22600 2100 22700 2200
Text Label 22600 2300 2    50   ~ 0
SEL2
Text Label 22600 2200 2    50   ~ 0
SEL1
Text Label 22600 2100 2    50   ~ 0
SEL0
Wire Wire Line
	22150 4700 22600 4700
Entry Wire Line
	22700 4800 22600 4700
Entry Wire Line
	22700 5000 22600 4900
Entry Wire Line
	22700 5200 22600 5100
Text Label 22600 5100 2    50   ~ 0
SEL2
Text Label 22600 4900 2    50   ~ 0
SEL1
Text Label 22600 4700 2    50   ~ 0
SEL0
$Comp
L Device:R_Small R?
U 1 1 5E2B1E06
P 22050 4700
F 0 "R?" V 22000 4800 50  0000 L CNN
F 1 "4.7kΩ" V 21950 4650 50  0000 C CNN
F 2 "" H 22050 4700 50  0001 C CNN
F 3 "~" H 22050 4700 50  0001 C CNN
	1    22050 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E2B6863
P 22050 4900
F 0 "R?" V 22000 5000 50  0000 L CNN
F 1 "4.7kΩ" V 21950 4850 50  0000 C CNN
F 2 "" H 22050 4900 50  0001 C CNN
F 3 "~" H 22050 4900 50  0001 C CNN
	1    22050 4900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E2B68CB
P 22050 5100
F 0 "R?" V 22000 5200 50  0000 L CNN
F 1 "4.7kΩ" V 21950 5050 50  0000 C CNN
F 2 "" H 22050 5100 50  0001 C CNN
F 3 "~" H 22050 5100 50  0001 C CNN
	1    22050 5100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2F0DA2
P 21850 5200
F 0 "#PWR?" H 21850 4950 50  0001 C CNN
F 1 "GND" H 21855 5027 50  0000 C CNN
F 2 "" H 21850 5200 50  0001 C CNN
F 3 "" H 21850 5200 50  0001 C CNN
	1    21850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	21150 4250 20700 4250
$Comp
L power:GND #PWR?
U 1 1 5E33C687
P 21050 2400
F 0 "#PWR?" H 21050 2150 50  0001 C CNN
F 1 "GND" H 20972 2363 50  0000 R CNN
F 2 "" H 21050 2400 50  0001 C CNN
F 3 "" H 21050 2400 50  0001 C CNN
	1    21050 2400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC244 U?
U 1 1 5E23D811
P 21650 2200
F 0 "U?" H 21650 2967 50  0000 C CNN
F 1 "74AC244" H 21650 2876 50  0000 C CNN
F 2 "" H 21675 2575 50  0001 C CNN
F 3 "" H 21675 2575 50  0001 C CNN
	1    21650 2200
	1    0    0    -1  
$EndComp
Text Label 20700 1900 0    50   ~ 0
IR2
Text Label 20700 1800 0    50   ~ 0
IR1
Text Label 20700 1700 0    50   ~ 0
IR0
Wire Wire Line
	20700 1700 21150 1700
Wire Wire Line
	20700 1800 21150 1800
Wire Wire Line
	20700 1900 21150 1900
Wire Wire Line
	21150 2100 20700 2100
Wire Wire Line
	21150 2200 20700 2200
Text Label 20700 2100 0    50   ~ 0
WADDR0
Text Label 20700 2200 0    50   ~ 0
WADDR1
Wire Wire Line
	21150 2000 21050 2000
Wire Wire Line
	21050 2000 21050 2300
Wire Wire Line
	21150 2300 21050 2300
Connection ~ 21050 2300
Wire Wire Line
	21050 2300 21050 2400
Wire Wire Line
	21150 2400 21050 2400
Connection ~ 21050 2400
Wire Wire Line
	20700 3250 21150 3250
Wire Wire Line
	20700 3350 21150 3350
Wire Wire Line
	20700 3450 21150 3450
Text Label 20700 3250 0    50   ~ 0
AB0
Text Label 20700 3350 0    50   ~ 0
AB1
Text Label 20700 3450 0    50   ~ 0
AB2
Wire Wire Line
	21150 4150 20700 4150
Wire Wire Line
	21150 2700 20700 2700
Wire Wire Line
	21150 2600 20700 2600
Wire Bus Line
	22800 5500 23500 5500
Text Label 20700 2600 0    50   ~ 0
~USE-IR
Text Label 20700 2700 0    50   ~ 0
~USE-WADDR
Text Label 20700 4150 0    50   ~ 0
~IOMBR
Text Label 20700 4250 0    50   ~ 0
~USE-MBP
Wire Wire Line
	22150 4900 22600 4900
Wire Wire Line
	22150 5100 22600 5100
Wire Wire Line
	21950 4700 21850 4700
Wire Wire Line
	21850 4700 21850 4900
Wire Wire Line
	21950 4900 21850 4900
Connection ~ 21850 4900
Wire Wire Line
	21850 4900 21850 5100
Wire Wire Line
	21950 5100 21850 5100
Connection ~ 21850 5100
Wire Wire Line
	21850 5100 21850 5200
Wire Wire Line
	5050 3200 5050 3650
$Comp
L power:GND #PWR?
U 1 1 5E4854AC
P 13150 3750
F 0 "#PWR?" H 13150 3500 50  0001 C CNN
F 1 "GND" H 13155 3577 50  0000 C CNN
F 2 "" H 13150 3750 50  0001 C CNN
F 3 "" H 13150 3750 50  0001 C CNN
	1    13150 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E48D624
P 13150 5000
F 0 "#PWR?" H 13150 4750 50  0001 C CNN
F 1 "GND" H 13000 4900 50  0000 C CNN
F 2 "" H 13150 5000 50  0001 C CNN
F 3 "" H 13150 5000 50  0001 C CNN
	1    13150 5000
	1    0    0    -1  
$EndComp
NoConn ~ 14150 2950
NoConn ~ 14150 3050
NoConn ~ 14150 3150
NoConn ~ 14150 3250
NoConn ~ 14150 4200
NoConn ~ 14150 4300
NoConn ~ 14150 4400
NoConn ~ 14150 4500
Wire Wire Line
	14150 3350 14900 3350
Wire Wire Line
	14150 3450 14900 3450
Wire Wire Line
	14150 3550 14900 3550
Wire Wire Line
	14150 3650 14900 3650
Wire Wire Line
	14150 4600 14900 4600
Wire Wire Line
	14150 4700 14900 4700
Wire Wire Line
	14150 4800 14900 4800
Wire Wire Line
	14150 4900 14900 4900
Text Label 14900 3350 2    50   ~ 0
~READ-MBP
Text Label 14900 3450 2    50   ~ 0
~READ-MBP+FLAGS
Text Label 14900 3550 2    50   ~ 0
~READ-FLAGS
Text Label 14900 3650 2    50   ~ 0
~READ-MBn
Text Label 14900 4600 2    50   ~ 0
~WRITE-MBP
Text Label 14900 4700 2    50   ~ 0
~WRITE-MBP+FLAGS
Text Label 14900 4800 2    50   ~ 0
~WRITE-FLAGS
Text Label 14900 4900 2    50   ~ 0
~WRITE-MBn
Text Label 14900 6150 2    50   ~ 0
~WRITE-MBx-AR
Entry Wire Line
	12750 5950 12850 6050
Entry Wire Line
	12750 6050 12850 6150
Entry Wire Line
	12750 6150 12850 6250
Wire Wire Line
	18150 4350 18500 4350
Text Label 18500 4350 2    50   ~ 0
~USE-IR
Wire Wire Line
	16850 4300 15400 4300
$Comp
L alexios:74LVC1G08 U?
U 1 1 5E5E8BA8
P 16400 4800
AR Path="/61F95ACC/5E5E8BA8" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E5E8BA8" Ref="U?"  Part="1" 
F 0 "U?" H 16325 5067 50  0000 C CNN
F 1 "74LVC1G08" H 16325 4976 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 16050 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 16050 4800 50  0001 C CNN
	1    16400 4800
	1    0    0    -1  
$EndComp
Text Label 15400 4850 0    50   ~ 0
~READ-MBP+FLAGS
Text Label 15400 4750 0    50   ~ 0
~READ-MBP
Wire Wire Line
	16100 4850 15400 4850
Wire Wire Line
	16100 4750 15400 4750
Wire Wire Line
	18500 4800 16550 4800
Text Label 18500 4800 2    50   ~ 0
~USE-MBP
Wire Wire Line
	16100 2500 15400 2500
Text Label 15400 2500 0    50   ~ 0
~WRITE-MBx-AR
Wire Wire Line
	16100 2400 15400 2400
Text Label 15400 2400 0    50   ~ 0
~WRITE-MBn
Wire Wire Line
	17400 2100 16650 2100
Text Label 16650 2100 0    50   ~ 0
~WRITE-MBP+FLAGS
Wire Wire Line
	17400 2000 16650 2000
Text Label 16650 2000 0    50   ~ 0
~WRITE-MBP
Wire Wire Line
	17400 1450 16650 1450
Wire Wire Line
	17400 1550 16650 1550
Wire Wire Line
	17400 1650 16650 1650
Wire Wire Line
	17400 1750 16600 1750
Text Label 16650 1450 0    50   ~ 0
~READ-MBP
Text Label 16650 1550 0    50   ~ 0
~READ-MBP+FLAGS
Text Label 16650 1650 0    50   ~ 0
~READ-MBn
Text Label 16650 1750 0    50   ~ 0
~IN-MBR
$Comp
L alexios:74LVC1G08 U?
U 1 1 5E6B05F4
P 16400 2450
AR Path="/61F95ACC/5E6B05F4" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E6B05F4" Ref="U?"  Part="1" 
F 0 "U?" H 16325 2275 50  0000 C CNN
F 1 "74LVC1G08" H 16325 2184 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 16050 2450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 16050 2450 50  0001 C CNN
	1    16400 2450
	1    0    0    -1  
$EndComp
Text Label 18500 2150 2    50   ~ 0
~WMBR
Wire Wire Line
	18000 1600 18500 1600
Text Label 18500 1600 2    50   ~ 0
~RMBR
Wire Wire Line
	16600 2200 17400 2200
Wire Wire Line
	16100 2150 15400 2150
Wire Wire Line
	16100 2250 15400 2250
Text Label 15400 2150 0    50   ~ 0
~W
Text Label 15400 2250 0    50   ~ 0
~IOMBR
Text Notes 14050 2550 0    50   ~ 0
&008–&00F
$Comp
L alexios:74LVC1G32 U?
U 1 1 5E1BC971
P 16300 1750
F 0 "U?" H 16350 2017 50  0000 C CNN
F 1 "74LVC1G32" H 16350 1926 50  0000 C CNN
F 2 "" H 16410 1730 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 16410 1730 50  0001 C CNN
	1    16300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 1700 14900 1700
Text Label 14900 1700 2    50   ~ 0
~IOMBR
Wire Wire Line
	16100 1700 15400 1700
Wire Wire Line
	16100 1800 15400 1800
Text Label 15400 1800 0    50   ~ 0
~IOMBR
Text Label 15400 1700 0    50   ~ 0
~R
Wire Wire Line
	16550 2450 16600 2450
Wire Wire Line
	16600 2300 17400 2300
Wire Wire Line
	16600 2300 16600 2450
Text Label 16650 2200 0    50   ~ 0
~OUT-MBR
Wire Wire Line
	18000 2150 18500 2150
$Comp
L alexios:74HC138 U?
U 1 1 5E9676E5
P 17700 6350
AR Path="/5F3EA987/5E9676E5" Ref="U?"  Part="1" 
AR Path="/5E9676E5" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E9676E5" Ref="U?"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5E9676E5" Ref="U?"  Part="1" 
F 0 "U?" H 17700 7017 50  0000 C CNN
F 1 "74HC138" H 17700 6926 50  0000 C CNN
F 2 "alexios:SOIC-16" H 17700 6350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 17700 6350 50  0001 C CNN
	1    17700 6350
	1    0    0    -1  
$EndComp
Text Label 16500 6650 0    50   ~ 0
~WRITE_MBx_AR
Wire Wire Line
	17200 6650 16500 6650
Wire Wire Line
	16500 5950 17200 5950
Text Label 16500 6050 0    50   ~ 0
IR9
Text Label 16500 5950 0    50   ~ 0
IR8
Wire Wire Line
	17200 6050 16500 6050
Text Label 16500 6150 0    50   ~ 0
IR10
Wire Wire Line
	17200 6150 16500 6150
Text Label 16500 6550 0    50   ~ 0
IR11
Wire Wire Line
	17200 6550 16500 6550
Wire Wire Line
	17200 6750 17150 6750
Wire Wire Line
	17150 6750 17150 6800
$Comp
L power:GND #PWR?
U 1 1 5E9C8C77
P 17150 6800
F 0 "#PWR?" H 17150 6550 50  0001 C CNN
F 1 "GND" H 17155 6627 50  0000 C CNN
F 2 "" H 17150 6800 50  0001 C CNN
F 3 "" H 17150 6800 50  0001 C CNN
	1    17150 6800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC21 U?
U 2 1 5E64ADF8
P 17700 2150
F 0 "U?" H 17700 1901 50  0000 C CNN
F 1 "74AC21" H 17700 1810 50  0000 C CNN
F 2 "" H 17700 2150 50  0001 C CNN
F 3 "" H 17700 2150 50  0001 C CNN
	2    17700 2150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC21 U?
U 1 1 5E64A96A
P 17700 1600
F 0 "U?" H 17700 1975 50  0000 C CNN
F 1 "74AC21" H 17700 1884 50  0000 C CNN
F 2 "" H 17700 1600 50  0001 C CNN
F 3 "" H 17700 1600 50  0001 C CNN
	1    17700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	21150 3550 21100 3550
Wire Wire Line
	21100 3550 21100 3650
Wire Bus Line
	7250 1800 7250 2150
Wire Bus Line
	9650 2150 9650 3150
Wire Bus Line
	12750 2800 12750 3550
Wire Bus Line
	12750 4050 12750 6150
Wire Bus Line
	22700 1800 22700 5400
Connection ~ 21100 3650
$EndSCHEMATC
