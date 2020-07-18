EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L alexios:74HC74 U?
U 1 1 60AF299A
P 6700 5050
F 0 "U?" H 6700 5467 50  0000 C CNN
F 1 "74HC74" H 6700 5376 50  0000 C CNN
F 2 "" H 6650 5200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 6650 5200 50  0001 C CNN
	1    6700 5050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 1 1 60AF29A0
P 6700 5750
F 0 "U?" H 6700 5425 50  0000 C CNN
F 1 "74HC74" H 6700 5334 50  0000 C CNN
F 2 "" H 6650 5900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 6650 5900 50  0001 C CNN
	1    6700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 5000 4650 5000
Text Label 5550 5000 0    50   ~ 0
~SEL
Wire Wire Line
	6250 5100 6000 5100
Text Label 5550 5100 0    50   ~ 0
CLK3
Wire Wire Line
	7150 4900 7250 4900
Wire Wire Line
	7250 4900 7250 5400
Wire Wire Line
	7250 5400 6200 5400
Wire Wire Line
	6200 5400 6200 5700
Wire Wire Line
	6200 5700 6250 5700
NoConn ~ 7150 5200
NoConn ~ 7150 5900
Wire Wire Line
	6000 5100 6000 5800
Wire Wire Line
	6000 5800 6250 5800
Connection ~ 6000 5100
Wire Wire Line
	6000 5100 5450 5100
Wire Wire Line
	6250 4900 6100 4900
Text Label 5550 4900 0    50   ~ 0
~RESET
Wire Wire Line
	6100 4900 6100 5600
Connection ~ 6100 4900
Wire Wire Line
	6100 5600 6250 5600
$Comp
L power:+5V #PWR?
U 1 1 60AF29BB
P 6250 5200
F 0 "#PWR?" H 6250 5050 50  0001 C CNN
F 1 "+5V" V 6200 5100 50  0000 L CNN
F 2 "" H 6250 5200 50  0001 C CNN
F 3 "" H 6250 5200 50  0001 C CNN
	1    6250 5200
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60AF29C1
P 6250 5900
F 0 "#PWR?" H 6250 5750 50  0001 C CNN
F 1 "+5V" V 6200 5800 50  0000 L CNN
F 2 "" H 6250 5900 50  0001 C CNN
F 3 "" H 6250 5900 50  0001 C CNN
	1    6250 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 5150 8300 5250
Connection ~ 8300 5150
Wire Wire Line
	8300 5050 8300 5150
Connection ~ 7700 5150
Wire Wire Line
	7700 5250 7750 5250
Wire Wire Line
	7700 5150 7700 5250
$Comp
L alexios:74LVC1G07 U?
U 1 1 60AF29CE
P 7950 5250
AR Path="/600C0F8F/60AF29CE" Ref="U?"  Part="1" 
AR Path="/60AF29CE" Ref="U?"  Part="1" 
F 0 "U?" H 7850 5150 50  0000 R CNN
F 1 "74LVC1G07" H 8050 5150 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8050 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 8050 5250 50  0001 C CNN
	1    7950 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 5250 8300 5250
Wire Wire Line
	8050 5050 8300 5050
Wire Wire Line
	7700 5050 7750 5050
Wire Wire Line
	7550 5150 7700 5150
Wire Wire Line
	7700 5150 7700 5050
$Comp
L Device:D_Schottky_ALT D?
U 1 1 60AF29DA
P 7900 5050
AR Path="/600C0F8F/60AF29DA" Ref="D?"  Part="1" 
AR Path="/60AF29DA" Ref="D?"  Part="1" 
F 0 "D?" H 7900 5266 50  0000 C CNN
F 1 "CUS520" H 7900 5175 50  0000 C CNN
F 2 "alexios:SOD-323" H 7900 5050 50  0001 C CNN
F 3 "~" H 7900 5050 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 7900 5050 50  0001 C CNN "Mouser"
	1    7900 5050
	1    0    0    -1  
$EndComp
Text Label 8500 5150 2    50   ~ 0
~WS
$Comp
L Jumper:SolderJumper_3_Open JP?
U 1 1 60AF29E1
P 7400 5150
F 0 "JP?" V 7500 4900 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 7355 5217 50  0001 L CNN
F 2 "" H 7400 5150 50  0001 C CNN
F 3 "~" H 7400 5150 50  0001 C CNN
	1    7400 5150
	0    -1   1    0   
$EndComp
Wire Wire Line
	7250 4900 7400 4900
Wire Wire Line
	7400 4900 7400 4950
Connection ~ 7250 4900
Wire Wire Line
	7150 5600 7400 5600
Wire Wire Line
	7400 5600 7400 5350
Text Notes 7600 5800 0    50   ~ 0
Open\n1–2\n2–3
Text Notes 7900 5800 0    50   ~ 0
No Wait States\n1 Wait State\n2 Wait States
Wire Notes Line width 18 style solid
	7550 5525 8550 5525
Wire Notes Line width 18 style solid
	8550 5525 8550 5850
Wire Notes Line width 18 style solid
	8550 5850 7550 5850
Wire Notes Line width 18 style solid
	7550 5850 7550 5525
Text Notes 2350 1650 0    100  ~ 20
Address Decoder
$Comp
L alexios:74HC138 U?
U 1 1 60AF29F4
P 3050 3150
AR Path="/5F3EA987/60AF29F4" Ref="U?"  Part="1" 
AR Path="/60AF29F4" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60AF29F4" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/60AF29F4" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/60AF29F4" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/60AF29F4" Ref="U?"  Part="1" 
F 0 "U?" H 3050 3817 50  0000 C CNN
F 1 "74HC138" H 3050 3726 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3050 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 3050 3150 50  0001 C CNN
	1    3050 3150
	1    0    0    -1  
$EndComp
Text Label 2250 3550 0    50   ~ 0
~SYSDEV
Text Label 2250 3450 0    50   ~ 0
AB7
Text Notes 3100 3400 1    50   ~ 10
IO=&010–01F
Text Label 2250 2850 0    50   ~ 0
AB5
Text Label 2250 3350 0    50   ~ 0
AB4
Text Label 2250 2750 0    50   ~ 0
AB6
$Comp
L power:GND #PWR?
U 1 1 60AF2A05
P 2500 3000
F 0 "#PWR?" H 2500 2750 50  0001 C CNN
F 1 "GND" H 2505 2827 50  0000 C CNN
F 2 "" H 2500 3000 50  0001 C CNN
F 3 "" H 2500 3000 50  0001 C CNN
	1    2500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2950 2500 2950
Wire Wire Line
	2500 2950 2500 3000
Wire Wire Line
	3550 2750 3650 2750
Wire Wire Line
	3650 2750 3650 3450
Wire Wire Line
	3650 3450 4600 3450
NoConn ~ 3550 2850
NoConn ~ 3550 2950
NoConn ~ 3550 3050
NoConn ~ 3550 3150
NoConn ~ 3550 3250
NoConn ~ 3550 3350
NoConn ~ 3550 3450
Text Label 4300 3550 0    50   ~ 0
~SYSDEV
$Comp
L power:+5V #PWR?
U 1 1 60AF2A19
P 4550 3300
F 0 "#PWR?" H 4550 3150 50  0001 C CNN
F 1 "+5V" H 4650 3400 50  0000 C CNN
F 2 "" H 4550 3300 50  0001 C CNN
F 3 "" H 4550 3300 50  0001 C CNN
	1    4550 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3300 4550 3350
Wire Wire Line
	4550 3350 4600 3350
$Comp
L alexios:74HC138 U?
U 1 1 60AF2A23
P 5100 3150
AR Path="/5F3EA987/60AF2A23" Ref="U?"  Part="1" 
AR Path="/60AF2A23" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60AF2A23" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/60AF2A23" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/60AF2A23" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/60AF2A23" Ref="U?"  Part="1" 
F 0 "U?" H 5100 3817 50  0000 C CNN
F 1 "74HC138" H 5100 3726 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5100 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5100 3150 50  0001 C CNN
	1    5100 3150
	1    0    0    -1  
$EndComp
Text Label 4300 2750 0    50   ~ 0
AB2
Text Label 4300 2850 0    50   ~ 0
AB3
Text Label 4300 2950 0    50   ~ 0
AB4
NoConn ~ 5600 2750
NoConn ~ 5600 2850
NoConn ~ 5600 2950
NoConn ~ 5600 3050
Text Label 5850 3150 2    50   ~ 0
~IO10
Text Label 5850 3250 2    50   ~ 0
~IO14
Text Label 5850 3350 2    50   ~ 0
~IO18
Text Label 5850 3450 2    50   ~ 0
~IO1C
Wire Wire Line
	5600 3150 6450 3150
Text Notes 6900 2100 0    50   ~ 0
Address\n\n010–013: IRC\n014–017: TMR0\n018–01C: TMR1\n01D–01F: I2C
Wire Notes Line width 18 style solid
	6850 1575 7550 1575
Wire Notes Line width 18 style solid
	7550 1575 7550 2150
Wire Notes Line width 18 style solid
	7550 2150 6850 2150
Wire Notes Line width 18 style solid
	6850 2150 6850 1575
$Comp
L alexios:74LVC1G11 U?
U 1 1 60AF2A65
P 4450 4950
F 0 "U?" H 4400 5214 50  0000 C CNN
F 1 "74LVC1G11" H 4400 5123 50  0000 C CNN
F 2 "" H 4350 4875 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 4350 4875 50  0001 C CNN
	1    4450 4950
	1    0    0    -1  
$EndComp
Text Label 3450 5100 0    50   ~ 0
~IO1C
Text Label 3450 5000 0    50   ~ 0
~IO18
Text Label 3450 4900 0    50   ~ 0
~IO14
Wire Wire Line
	3800 5100 3450 5100
Wire Wire Line
	3800 5000 3450 5000
Wire Wire Line
	3800 4900 3450 4900
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 60AF2A71
P 3950 4900
F 0 "JP?" H 3750 4950 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3950 5014 50  0001 C CNN
F 2 "" H 3950 4900 50  0001 C CNN
F 3 "~" H 3950 4900 50  0001 C CNN
	1    3950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4900 4150 4900
Wire Wire Line
	4100 5000 4150 5000
Wire Wire Line
	4100 5100 4150 5100
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 60AF2A7A
P 3950 5000
F 0 "JP?" H 3750 5050 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3950 5114 50  0001 C CNN
F 2 "" H 3950 5000 50  0001 C CNN
F 3 "~" H 3950 5000 50  0001 C CNN
	1    3950 5000
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 60AF2A80
P 3950 5100
F 0 "JP?" H 3750 5150 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3950 5214 50  0001 C CNN
F 2 "" H 3950 5100 50  0001 C CNN
F 3 "~" H 3950 5100 50  0001 C CNN
	1    3950 5100
	1    0    0    -1  
$EndComp
Text HLabel 1800 2050 0    50   Input ~ 0
AB1
Text HLabel 1800 2150 0    50   Input ~ 0
AB2
Text HLabel 1800 2250 0    50   Input ~ 0
AB3
Text HLabel 1800 2350 0    50   Input ~ 0
AB4
Text HLabel 1800 2850 0    50   Input ~ 0
AB5
Text HLabel 1800 2750 0    50   Input ~ 0
AB6
Text HLabel 1800 3450 0    50   Input ~ 0
AB7
Text HLabel 5450 5100 0    50   Input ~ 0
CLK3
Text HLabel 5450 4900 0    50   Input ~ 0
~RESET
Wire Wire Line
	1800 3450 2550 3450
Text HLabel 1800 3950 0    50   Input ~ 0
~SYSDEV
Wire Wire Line
	1800 3950 2150 3950
Wire Wire Line
	2150 3950 2150 3550
Wire Wire Line
	2150 3550 2550 3550
Wire Wire Line
	2150 3950 3650 3950
Wire Wire Line
	3650 3950 3650 3550
Wire Wire Line
	3650 3550 4600 3550
Connection ~ 2150 3950
Wire Wire Line
	6650 4150 1800 4150
Wire Wire Line
	5600 3250 5950 3250
Wire Wire Line
	5600 3350 5950 3350
Wire Wire Line
	5600 3450 5950 3450
Text HLabel 5950 3250 2    50   Output ~ 0
~IO14
Text HLabel 5950 3350 2    50   Output ~ 0
~IO18
Text HLabel 5950 3450 2    50   Output ~ 0
~IO1C
Wire Wire Line
	8300 5150 8600 5150
Text HLabel 8600 5150 2    50   3State ~ 0
~WS
Wire Wire Line
	1800 2850 2550 2850
Wire Wire Line
	1800 2750 2550 2750
Wire Wire Line
	2150 3350 2150 2350
Wire Wire Line
	2150 2350 3750 2350
Wire Wire Line
	3750 2350 3750 2950
Wire Wire Line
	3750 2950 4600 2950
Wire Wire Line
	2150 3350 2550 3350
Wire Wire Line
	3850 2850 3850 2250
Wire Wire Line
	3850 2250 1800 2250
Wire Wire Line
	3850 2850 4600 2850
Wire Wire Line
	1800 2150 3950 2150
Wire Wire Line
	3950 2150 3950 2750
Wire Wire Line
	3950 2750 4600 2750
Wire Wire Line
	1800 2350 2150 2350
Connection ~ 2150 2350
Wire Wire Line
	5450 4900 6100 4900
Wire Wire Line
	1800 4050 6550 4050
Text HLabel 1800 4150 0    50   Input ~ 0
~W
Text HLabel 1800 4050 0    50   Input ~ 0
~R
Wire Wire Line
	6650 3650 6650 4150
Wire Wire Line
	6550 4050 6550 3050
Wire Wire Line
	6450 3150 6450 2850
Connection ~ 6450 3150
Wire Wire Line
	6450 3150 6450 3450
Wire Wire Line
	6450 2050 1800 2050
Wire Wire Line
	6450 2750 6450 2050
Wire Wire Line
	6450 2750 7250 2750
Text HLabel 8600 3450 2    50   Output ~ 0
~WIO11
Text HLabel 8600 3350 2    50   Output ~ 0
~WIO10
Text HLabel 8600 2850 2    50   Output ~ 0
~RIO11
Text HLabel 8600 2750 2    50   Output ~ 0
~RIO10
Wire Wire Line
	8250 3450 8600 3450
Wire Wire Line
	8250 3350 8600 3350
Wire Wire Line
	8250 2850 8600 2850
Wire Wire Line
	8250 2750 8600 2750
Wire Wire Line
	6650 3650 7250 3650
Wire Wire Line
	6550 3050 7250 3050
Wire Wire Line
	6450 3450 7250 3450
Wire Wire Line
	6450 2850 7250 2850
Text Label 8500 3450 2    50   ~ 0
~WIO11
Text Label 8500 3350 2    50   ~ 0
~WIO10
Text Label 8500 2850 2    50   ~ 0
~RIO11
Text Label 8500 2750 2    50   ~ 0
~RIO10
NoConn ~ 8250 3650
NoConn ~ 8250 3550
NoConn ~ 8250 3050
NoConn ~ 8250 2950
Text Label 7050 2850 0    50   ~ 0
~IO10
Text Label 7050 3450 0    50   ~ 0
~IO10
Text Label 7050 2750 0    50   ~ 0
AB1
Text Label 7050 3350 0    50   ~ 0
AB1
Text Label 7050 3650 0    50   ~ 0
~W
Text Label 7050 3050 0    50   ~ 0
~R
Wire Wire Line
	7250 3350 7050 3350
$Comp
L alexios:74HC139 U?
U 1 1 60AF2A3E
P 7750 3450
F 0 "U?" H 7750 3075 50  0000 C CNN
F 1 "74HC139" H 7750 2984 50  0000 C CNN
F 2 "" H 7750 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7750 3450 50  0001 C CNN
	1    7750 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 1 1 60AF2A38
P 7750 2850
F 0 "U?" H 7750 3217 50  0000 C CNN
F 1 "74HC139" H 7750 3126 50  0000 C CNN
F 2 "" H 7750 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7750 2850 50  0001 C CNN
	1    7750 2850
	1    0    0    -1  
$EndComp
Text Notes 3550 5750 0    100  ~ 20
Wait State Generator
$EndSCHEMATC
