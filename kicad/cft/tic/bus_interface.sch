EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC74 U10
U 1 1 60AF299A
P 4500 5700
F 0 "U10" H 4500 6117 50  0000 C CNN
F 1 "74HC74" H 4500 6026 50  0000 C CNN
F 2 "" H 4450 5850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 4450 5850 50  0001 C CNN
	1    4500 5700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U12
U 1 1 60AF29A0
P 4500 6400
F 0 "U12" H 4500 6075 50  0000 C CNN
F 1 "74HC74" H 4500 5984 50  0000 C CNN
F 2 "" H 4450 6550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 4450 6550 50  0001 C CNN
	1    4500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5650 2450 5650
Text Label 3350 5650 0    50   ~ 0
~SEL
Wire Wire Line
	4050 5750 3800 5750
Text Label 3350 5750 0    50   ~ 0
CLK3
Wire Wire Line
	4950 5550 5050 5550
Wire Wire Line
	5050 5550 5050 6050
Wire Wire Line
	5050 6050 4000 6050
Wire Wire Line
	4000 6050 4000 6350
Wire Wire Line
	4000 6350 4050 6350
NoConn ~ 4950 5850
NoConn ~ 4950 6550
Wire Wire Line
	3800 5750 3800 6450
Wire Wire Line
	3800 6450 4050 6450
Connection ~ 3800 5750
Wire Wire Line
	3800 5750 3250 5750
Wire Wire Line
	4050 5550 3900 5550
Text Label 3350 5550 0    50   ~ 0
~RESET
Wire Wire Line
	3900 5550 3900 6250
Connection ~ 3900 5550
Wire Wire Line
	3900 6250 4050 6250
$Comp
L power:+5V #PWR012
U 1 1 60AF29BB
P 4050 5850
F 0 "#PWR012" H 4050 5700 50  0001 C CNN
F 1 "+5V" V 4000 5750 50  0000 L CNN
F 2 "" H 4050 5850 50  0001 C CNN
F 3 "" H 4050 5850 50  0001 C CNN
	1    4050 5850
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 60AF29C1
P 4050 6550
F 0 "#PWR013" H 4050 6400 50  0001 C CNN
F 1 "+5V" V 4000 6450 50  0000 L CNN
F 2 "" H 4050 6550 50  0001 C CNN
F 3 "" H 4050 6550 50  0001 C CNN
	1    4050 6550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 5800 6100 5900
Connection ~ 6100 5800
Wire Wire Line
	6100 5700 6100 5800
Connection ~ 5500 5800
Wire Wire Line
	5500 5900 5550 5900
Wire Wire Line
	5500 5800 5500 5900
$Comp
L alexios:74LVC1G07 U?
U 1 1 60AF29CE
P 5750 5900
AR Path="/600C0F8F/60AF29CE" Ref="U?"  Part="1" 
AR Path="/60AF29CE" Ref="U?"  Part="1" 
AR Path="/60AA2B43/60AF29CE" Ref="U11"  Part="1" 
F 0 "U11" H 5650 5800 50  0000 R CNN
F 1 "74LVC1G07" H 5850 5800 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5850 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5850 5900 50  0001 C CNN
	1    5750 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5900 6100 5900
Wire Wire Line
	5850 5700 6100 5700
Wire Wire Line
	5500 5700 5550 5700
Wire Wire Line
	5350 5800 5500 5800
Wire Wire Line
	5500 5800 5500 5700
$Comp
L Device:D_Schottky_ALT D?
U 1 1 60AF29DA
P 5700 5700
AR Path="/600C0F8F/60AF29DA" Ref="D?"  Part="1" 
AR Path="/60AF29DA" Ref="D?"  Part="1" 
AR Path="/60AA2B43/60AF29DA" Ref="D1"  Part="1" 
F 0 "D1" H 5700 5916 50  0000 C CNN
F 1 "CUS520" H 5700 5825 50  0000 C CNN
F 2 "alexios:SOD-323" H 5700 5700 50  0001 C CNN
F 3 "~" H 5700 5700 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 5700 5700 50  0001 C CNN "Mouser"
	1    5700 5700
	1    0    0    -1  
$EndComp
Text Label 6300 5800 2    50   ~ 0
~WS
$Comp
L Jumper:SolderJumper_3_Open JP6
U 1 1 60AF29E1
P 5200 5800
F 0 "JP6" V 5300 5550 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 5155 5867 50  0001 L CNN
F 2 "" H 5200 5800 50  0001 C CNN
F 3 "~" H 5200 5800 50  0001 C CNN
	1    5200 5800
	0    -1   1    0   
$EndComp
Wire Wire Line
	5050 5550 5200 5550
Wire Wire Line
	5200 5550 5200 5600
Connection ~ 5050 5550
Wire Wire Line
	4950 6250 5200 6250
Wire Wire Line
	5200 6250 5200 6000
Text Notes 5400 6450 0    50   ~ 0
Open\n1–2\n2–3
Text Notes 5700 6450 0    50   ~ 0
No Wait States\n1 Wait State\n2 Wait States
Wire Notes Line width 18 style solid
	5350 6175 6350 6175
Wire Notes Line width 18 style solid
	6350 6175 6350 6500
Wire Notes Line width 18 style solid
	6350 6500 5350 6500
Wire Notes Line width 18 style solid
	5350 6500 5350 6175
$Comp
L alexios:74LVC1G11 U9
U 1 1 60AF2A65
P 2250 5600
F 0 "U9" H 2200 5864 50  0000 C CNN
F 1 "74LVC1G11" H 2200 5773 50  0000 C CNN
F 2 "" H 2150 5525 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 2150 5525 50  0001 C CNN
	1    2250 5600
	1    0    0    -1  
$EndComp
Text Label 1250 5750 0    50   ~ 0
~IO1C
Text Label 1250 5650 0    50   ~ 0
~IO18
Text Label 1250 5550 0    50   ~ 0
~IO14
Wire Wire Line
	1600 5750 1250 5750
Wire Wire Line
	1600 5650 1250 5650
Wire Wire Line
	1600 5550 1250 5550
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 60AF2A71
P 1750 5550
F 0 "JP3" H 1550 5600 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 1750 5664 50  0001 C CNN
F 2 "" H 1750 5550 50  0001 C CNN
F 3 "~" H 1750 5550 50  0001 C CNN
	1    1750 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5550 1950 5550
Wire Wire Line
	1900 5650 1950 5650
Wire Wire Line
	1900 5750 1950 5750
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 60AF2A7A
P 1750 5650
F 0 "JP4" H 1550 5700 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 1750 5764 50  0001 C CNN
F 2 "" H 1750 5650 50  0001 C CNN
F 3 "~" H 1750 5650 50  0001 C CNN
	1    1750 5650
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 60AF2A80
P 1750 5750
F 0 "JP5" H 1550 5800 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 1750 5864 50  0001 C CNN
F 2 "" H 1750 5750 50  0001 C CNN
F 3 "~" H 1750 5750 50  0001 C CNN
	1    1750 5750
	1    0    0    -1  
$EndComp
Text HLabel 3250 5750 0    50   Input ~ 0
CLK3
Text HLabel 3250 5550 0    50   Input ~ 0
~RESET
Wire Wire Line
	6100 5800 6400 5800
Text HLabel 6400 5800 2    50   3State ~ 0
~WS
Wire Wire Line
	3250 5550 3900 5550
Text Notes 1350 6400 0    100  ~ 20
Wait State Generator
Text Notes 1800 1050 0    100  ~ 20
Address Decoder
$Comp
L alexios:74HC138 U?
U 1 1 60AF29F4
P 2500 2550
AR Path="/5F3EA987/60AF29F4" Ref="U?"  Part="1" 
AR Path="/60AF29F4" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60AF29F4" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/60AF29F4" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/60AF29F4" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/60AF29F4" Ref="U?"  Part="1" 
AR Path="/60AA2B43/60AF29F4" Ref="U6"  Part="1" 
F 0 "U6" H 2500 3217 50  0000 C CNN
F 1 "74HC138" H 2500 3126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2500 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2500 2550 50  0001 C CNN
	1    2500 2550
	1    0    0    -1  
$EndComp
Text Label 1700 2950 0    50   ~ 0
~SYSDEV
Text Label 1700 2850 0    50   ~ 0
AB7
Text Notes 2550 2800 1    50   ~ 10
IO=&010–01F
Text Label 1700 2250 0    50   ~ 0
AB5
Text Label 1700 2750 0    50   ~ 0
AB4
Text Label 1700 2150 0    50   ~ 0
AB6
$Comp
L power:GND #PWR010
U 1 1 60AF2A05
P 1950 2400
F 0 "#PWR010" H 1950 2150 50  0001 C CNN
F 1 "GND" H 1955 2227 50  0000 C CNN
F 2 "" H 1950 2400 50  0001 C CNN
F 3 "" H 1950 2400 50  0001 C CNN
	1    1950 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2350 1950 2350
Wire Wire Line
	1950 2350 1950 2400
Wire Wire Line
	3000 2150 3100 2150
Wire Wire Line
	3100 2150 3100 2850
Wire Wire Line
	3100 2850 4050 2850
NoConn ~ 3000 2250
NoConn ~ 3000 2350
NoConn ~ 3000 2450
NoConn ~ 3000 2550
NoConn ~ 3000 2650
NoConn ~ 3000 2750
NoConn ~ 3000 2850
Text Label 3750 2950 0    50   ~ 0
~SYSDEV
$Comp
L power:+5V #PWR011
U 1 1 60AF2A19
P 4000 2700
F 0 "#PWR011" H 4000 2550 50  0001 C CNN
F 1 "+5V" H 4100 2800 50  0000 C CNN
F 2 "" H 4000 2700 50  0001 C CNN
F 3 "" H 4000 2700 50  0001 C CNN
	1    4000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2700 4000 2750
Wire Wire Line
	4000 2750 4050 2750
$Comp
L alexios:74HC138 U?
U 1 1 60AF2A23
P 4550 2550
AR Path="/5F3EA987/60AF2A23" Ref="U?"  Part="1" 
AR Path="/60AF2A23" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60AF2A23" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/60AF2A23" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/60AF2A23" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/60AF2A23" Ref="U?"  Part="1" 
AR Path="/60AA2B43/60AF2A23" Ref="U7"  Part="1" 
F 0 "U7" H 4550 3217 50  0000 C CNN
F 1 "74HC138" H 4550 3126 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4550 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4550 2550 50  0001 C CNN
	1    4550 2550
	1    0    0    -1  
$EndComp
Text Label 3750 2150 0    50   ~ 0
AB2
Text Label 3750 2250 0    50   ~ 0
AB3
Text Label 3750 2350 0    50   ~ 0
AB4
NoConn ~ 5050 2150
NoConn ~ 5050 2250
NoConn ~ 5050 2350
NoConn ~ 5050 2450
Text Label 5150 2550 0    50   ~ 0
~IRCCS
Text Label 5150 2650 0    50   ~ 0
~T0CS
Text Label 5150 2750 0    50   ~ 0
~T1CS
Text Label 5150 2850 0    50   ~ 0
~RTCCS
Wire Wire Line
	5050 2550 5900 2550
Text HLabel 1250 1450 0    50   Input ~ 0
AB1
Text HLabel 1250 1550 0    50   Input ~ 0
AB2
Text HLabel 1250 1650 0    50   Input ~ 0
AB3
Text HLabel 1250 1750 0    50   Input ~ 0
AB4
Text HLabel 1250 2250 0    50   Input ~ 0
AB5
Text HLabel 1250 2150 0    50   Input ~ 0
AB6
Text HLabel 1250 2850 0    50   Input ~ 0
AB7
Wire Wire Line
	1250 2850 2000 2850
Text HLabel 1250 3350 0    50   Input ~ 0
~SYSDEV
Wire Wire Line
	1250 3350 1600 3350
Wire Wire Line
	1600 3350 1600 2950
Wire Wire Line
	1600 2950 2000 2950
Wire Wire Line
	1600 3350 3100 3350
Wire Wire Line
	3100 3350 3100 2950
Wire Wire Line
	3100 2950 4050 2950
Connection ~ 1600 3350
Wire Wire Line
	6100 3550 1250 3550
Wire Wire Line
	5050 2650 8050 2650
Wire Wire Line
	5050 2750 8050 2750
Wire Wire Line
	5050 2850 6200 2850
Text HLabel 8050 2650 2    50   Output ~ 0
~T0CS
Text HLabel 8050 2750 2    50   Output ~ 0
~T1CS
Text HLabel 8050 2850 2    50   Output ~ 0
~RTCCS
Wire Wire Line
	1250 2250 2000 2250
Wire Wire Line
	1250 2150 2000 2150
Wire Wire Line
	1600 2750 1600 1750
Wire Wire Line
	1600 1750 3200 1750
Wire Wire Line
	3200 1750 3200 2350
Wire Wire Line
	3200 2350 4050 2350
Wire Wire Line
	1600 2750 2000 2750
Wire Wire Line
	3300 2250 3300 1650
Wire Wire Line
	3300 1650 1250 1650
Wire Wire Line
	3300 2250 4050 2250
Wire Wire Line
	1250 1550 3400 1550
Wire Wire Line
	3400 1550 3400 2150
Wire Wire Line
	3400 2150 4050 2150
Wire Wire Line
	1250 1750 1600 1750
Connection ~ 1600 1750
Wire Wire Line
	1250 3450 6000 3450
Text HLabel 1250 3550 0    50   Input ~ 0
~W
Text HLabel 1250 3450 0    50   Input ~ 0
~R
Wire Wire Line
	6100 2350 6700 2350
Text Label 6500 2350 0    50   ~ 0
~W
Text Notes 2550 4300 0    50   ~ 0
Address\n\n010–013: IRC\n014–017: TMR0\n018–01C: TMR1\n01D–01F: RTC
Wire Notes Line width 18 style solid
	2500 3775 3200 3775
Wire Notes Line width 18 style solid
	3200 3775 3200 4350
Wire Notes Line width 18 style solid
	3200 4350 2500 4350
Wire Notes Line width 18 style solid
	2500 4350 2500 3775
Text Label 6500 1450 0    50   ~ 0
AB1
Wire Wire Line
	1250 1450 6700 1450
Text Label 6500 1550 0    50   ~ 0
~IO10
Wire Wire Line
	6700 1550 5900 1550
Text HLabel 8050 1550 2    50   Output ~ 0
~RIO11
Text HLabel 8050 1450 2    50   Output ~ 0
~RIO10
Wire Wire Line
	7700 1550 8050 1550
Wire Wire Line
	7700 1450 8050 1450
Wire Wire Line
	6000 1750 6700 1750
Text Label 7950 1550 2    50   ~ 0
~RIO11
Text Label 7950 1450 2    50   ~ 0
~RIO10
NoConn ~ 7700 1750
NoConn ~ 7700 1650
Text Label 6500 1750 0    50   ~ 0
~R
$Comp
L alexios:74HC139 U5
U 1 1 60AF2A38
P 7200 1550
F 0 "U5" H 7200 1917 50  0000 C CNN
F 1 "74HC139" H 7200 1826 50  0000 C CNN
F 2 "" H 7200 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 1550 50  0001 C CNN
	1    7200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1750 6000 3450
Text HLabel 8050 2150 2    50   Output ~ 0
~WIO11
Text HLabel 8050 2050 2    50   Output ~ 0
~WIO10
Wire Wire Line
	7700 2150 8050 2150
Wire Wire Line
	7700 2050 8050 2050
Text Label 7950 2150 2    50   ~ 0
~WIO11
Text Label 7950 2050 2    50   ~ 0
~WIO10
NoConn ~ 7700 2350
NoConn ~ 7700 2250
$Comp
L alexios:74HC139 U5
U 2 1 60AF2A3E
P 7200 2150
F 0 "U5" H 7850 2000 50  0000 L CNN
F 1 "74HC139" H 7850 1900 50  0000 L CNN
F 2 "" H 7200 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 2150 50  0001 C CNN
	2    7200 2150
	1    0    0    -1  
$EndComp
Text Label 6500 2050 0    50   ~ 0
AB1
Wire Wire Line
	6700 2050 6500 2050
Wire Wire Line
	5900 2150 6700 2150
Text Label 6500 2150 0    50   ~ 0
~IO10
Wire Wire Line
	5900 1550 5900 2150
Wire Wire Line
	5900 2150 5900 2550
Connection ~ 5900 2150
Wire Wire Line
	6100 2350 6100 3550
NoConn ~ 7700 3750
NoConn ~ 7700 3650
$Comp
L alexios:74HC139 U8
U 1 1 5FA291D7
P 7200 3550
F 0 "U8" H 7200 3917 50  0000 C CNN
F 1 "74HC139" H 7200 3826 50  0000 C CNN
F 2 "" H 7200 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 3550 50  0001 C CNN
	1    7200 3550
	1    0    0    -1  
$EndComp
NoConn ~ 7700 4350
NoConn ~ 7700 4250
$Comp
L alexios:74HC139 U8
U 2 1 5FA291E5
P 7200 4150
F 0 "U8" H 7200 3775 50  0000 C CNN
F 1 "74HC139" H 7200 3684 50  0000 C CNN
F 2 "" H 7200 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 4150 50  0001 C CNN
	2    7200 4150
	1    0    0    -1  
$EndComp
Text Label 6500 3450 0    50   ~ 0
AB1
Wire Wire Line
	6700 3450 6500 3450
Wire Wire Line
	6200 3550 6700 3550
Connection ~ 6200 2850
Wire Wire Line
	6200 2850 8050 2850
Wire Wire Line
	6200 2850 6200 3550
Text Label 6500 4050 0    50   ~ 0
AB1
Wire Wire Line
	6700 4050 6500 4050
Wire Wire Line
	6200 3550 6200 4150
Wire Wire Line
	6200 4150 6700 4150
Connection ~ 6200 3550
Wire Wire Line
	6700 3750 6500 3750
Wire Wire Line
	6700 4350 6500 4350
Text Label 6500 3750 0    50   ~ 0
~R
Text Label 6500 4350 0    50   ~ 0
~W
Wire Wire Line
	7700 3550 8050 3550
Wire Wire Line
	7700 4050 8050 4050
Wire Wire Line
	7700 4150 8050 4150
Text Label 7950 4050 2    50   ~ 0
~RTCAW
Text Label 7950 4150 2    50   ~ 0
~RTCW
NoConn ~ 7700 3450
Text Label 7950 3550 2    50   ~ 0
~RTCR
Text HLabel 8050 3550 2    50   Output ~ 0
~RTCR
Text HLabel 8050 4050 2    50   Output ~ 0
~RTCAW
Text HLabel 8050 4150 2    50   Output ~ 0
~RTCW
Text Label 6500 3550 0    50   ~ 0
~RTCCS
Text Label 6500 4150 0    50   ~ 0
~RTCCS
$EndSCHEMATC
