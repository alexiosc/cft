EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
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
L alexios:74HC74 U41
U 1 1 60AF299A
P 4500 5350
F 0 "U41" H 4500 5767 50  0000 C CNN
F 1 "74HC74" H 4500 5676 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4450 5500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 4450 5500 50  0001 C CNN
	1    4500 5350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U41
U 2 1 60AF29A0
P 4500 6050
F 0 "U41" H 4500 5725 50  0000 C CNN
F 1 "74HC74" H 4500 5634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 4450 6200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 4450 6200 50  0001 C CNN
	2    4500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5300 2450 5300
Text Label 3350 5300 0    50   ~ 0
~SEL
Wire Wire Line
	4050 5400 3800 5400
Text Label 3350 5400 0    50   ~ 0
CLK3
Wire Wire Line
	4950 5200 5050 5200
Wire Wire Line
	5050 5200 5050 5700
Wire Wire Line
	5050 5700 4000 5700
Wire Wire Line
	4000 5700 4000 6000
Wire Wire Line
	4000 6000 4050 6000
NoConn ~ 4950 5500
NoConn ~ 4950 6200
Wire Wire Line
	3800 5400 3800 6100
Wire Wire Line
	3800 6100 4050 6100
Connection ~ 3800 5400
Wire Wire Line
	3800 5400 3250 5400
Wire Wire Line
	4050 5200 3900 5200
Text Label 3350 5200 0    50   ~ 0
~RESET
Wire Wire Line
	3900 5200 3900 5900
Connection ~ 3900 5200
Wire Wire Line
	3900 5900 4050 5900
$Comp
L power:+5V #PWR0107
U 1 1 60AF29BB
P 4050 5500
F 0 "#PWR0107" H 4050 5350 50  0001 C CNN
F 1 "+5V" V 4000 5400 50  0000 L CNN
F 2 "" H 4050 5500 50  0001 C CNN
F 3 "" H 4050 5500 50  0001 C CNN
	1    4050 5500
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 60AF29C1
P 4050 6200
F 0 "#PWR0108" H 4050 6050 50  0001 C CNN
F 1 "+5V" V 4000 6100 50  0000 L CNN
F 2 "" H 4050 6200 50  0001 C CNN
F 3 "" H 4050 6200 50  0001 C CNN
	1    4050 6200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 5450 6250 5550
Connection ~ 6250 5450
Wire Wire Line
	6250 5350 6250 5450
Connection ~ 5650 5450
Wire Wire Line
	5650 5550 5700 5550
Wire Wire Line
	5650 5450 5650 5550
$Comp
L alexios:74LVC1G07 U?
U 1 1 60AF29CE
P 5900 5550
AR Path="/600C0F8F/60AF29CE" Ref="U?"  Part="1" 
AR Path="/60AF29CE" Ref="U?"  Part="1" 
AR Path="/60AA2B43/60AF29CE" Ref="U42"  Part="1" 
F 0 "U42" H 5950 5375 50  0000 C CNN
F 1 "74LVC1G07" H 5950 5284 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6000 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6000 5550 50  0001 C CNN
	1    5900 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5550 6250 5550
Wire Wire Line
	6000 5350 6250 5350
Wire Wire Line
	5650 5350 5700 5350
Wire Wire Line
	5350 5450 5650 5450
Wire Wire Line
	5650 5450 5650 5350
$Comp
L Device:D_Schottky_ALT D?
U 1 1 60AF29DA
P 5850 5350
AR Path="/600C0F8F/60AF29DA" Ref="D?"  Part="1" 
AR Path="/60AF29DA" Ref="D?"  Part="1" 
AR Path="/60AA2B43/60AF29DA" Ref="D11"  Part="1" 
F 0 "D11" H 5850 5566 50  0000 C CNN
F 1 "CUS520" H 5850 5475 50  0000 C CNN
F 2 "alexios:SOD-323" H 5850 5350 50  0001 C CNN
F 3 "~" H 5850 5350 50  0001 C CNN
F 4 "757-CUS520H3F; £0.043/100" H 5850 5350 50  0001 C CNN "Mouser"
	1    5850 5350
	1    0    0    -1  
$EndComp
Text Label 7950 5450 2    50   ~ 0
~WS
$Comp
L Jumper:SolderJumper_3_Open JP6
U 1 1 60AF29E1
P 5200 5450
F 0 "JP6" V 5100 5200 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 5155 5517 50  0001 L CNN
F 2 "alexios:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 5200 5450 50  0001 C CNN
F 3 "~" H 5200 5450 50  0001 C CNN
	1    5200 5450
	0    -1   1    0   
$EndComp
Wire Wire Line
	5050 5200 5200 5200
Wire Wire Line
	5200 5200 5200 5250
Connection ~ 5050 5200
Wire Wire Line
	4950 5900 5200 5900
Wire Wire Line
	5200 5900 5200 5650
Text Notes 4650 4300 0    50   ~ 0
Open\n1–2\n2–3
Text Notes 4950 4300 0    50   ~ 0
No Wait States\n1 Wait State\n2 Wait States
Wire Notes Line width 18 style solid
	4600 4025 5600 4025
Wire Notes Line width 18 style solid
	5600 4025 5600 4350
Wire Notes Line width 18 style solid
	5600 4350 4600 4350
Wire Notes Line width 18 style solid
	4600 4350 4600 4025
$Comp
L alexios:74LVC1G11 U40
U 1 1 60AF2A65
P 2250 5250
F 0 "U40" H 2200 5514 50  0000 C CNN
F 1 "74LVC1G11" H 2200 5423 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2150 5175 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 2150 5175 50  0001 C CNN
	1    2250 5250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 60AF2A71
P 1750 5300
F 0 "JP3" H 1550 5350 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 1750 5414 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 1750 5300 50  0001 C CNN
F 3 "~" H 1750 5300 50  0001 C CNN
	1    1750 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5200 1950 5200
Wire Wire Line
	1900 5300 1950 5300
Wire Wire Line
	1900 5400 1950 5400
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 60AF2A7A
P 1750 5400
F 0 "JP4" H 1550 5450 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 1750 5514 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 1750 5400 50  0001 C CNN
F 3 "~" H 1750 5400 50  0001 C CNN
	1    1750 5400
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 60AF2A80
P 1750 5200
F 0 "JP5" H 1550 5250 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 1750 5314 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 1750 5200 50  0001 C CNN
F 3 "~" H 1750 5200 50  0001 C CNN
	1    1750 5200
	1    0    0    -1  
$EndComp
Text HLabel 3250 5400 0    50   Input ~ 0
CLK3
Text HLabel 3250 5200 0    50   Input ~ 0
~RESET
Wire Wire Line
	6250 5450 8050 5450
Text HLabel 8050 5450 2    50   3State ~ 0
~WS
Wire Wire Line
	3250 5200 3900 5200
Text Notes 1050 4850 0    100  ~ 20
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
AR Path="/60AA2B43/60AF29F4" Ref="U37"  Part="1" 
F 0 "U37" H 2500 3217 50  0000 C CNN
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
L power:GND #PWR0105
U 1 1 60AF2A05
P 1950 2400
F 0 "#PWR0105" H 1950 2150 50  0001 C CNN
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
L power:+5V #PWR0106
U 1 1 60AF2A19
P 4000 2700
F 0 "#PWR0106" H 4000 2550 50  0001 C CNN
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
AR Path="/60AA2B43/60AF2A23" Ref="U38"  Part="1" 
F 0 "U38" H 4550 3217 50  0000 C CNN
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
Wire Wire Line
	6700 1550 5900 1550
Text HLabel 8050 1550 2    50   Output ~ 0
~RISR
Text HLabel 8050 1450 2    50   Output ~ 0
~RIER
Wire Wire Line
	7700 1550 8050 1550
Wire Wire Line
	7700 1450 8050 1450
Wire Wire Line
	6000 1750 6700 1750
Text Label 7950 1550 2    50   ~ 0
~RISR
Text Label 7950 1450 2    50   ~ 0
~RIER
NoConn ~ 7700 1750
NoConn ~ 7700 1650
Text Label 6500 1750 0    50   ~ 0
~R
$Comp
L alexios:74HC139 U36
U 1 1 60AF2A38
P 7200 1550
F 0 "U36" H 7200 1917 50  0000 C CNN
F 1 "74HC139" H 7200 1826 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7200 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 1550 50  0001 C CNN
	1    7200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1750 6000 3450
Text HLabel 8050 2050 2    50   Output ~ 0
~WIER
Wire Wire Line
	7700 2050 8050 2050
Text Label 7950 2050 2    50   ~ 0
~WIER
NoConn ~ 7700 2350
NoConn ~ 7700 2250
Text Label 6500 2050 0    50   ~ 0
AB1
Wire Wire Line
	6700 2050 6500 2050
Wire Wire Line
	5900 2150 6700 2150
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
L alexios:74HC139 U39
U 1 1 5FA291D7
P 7200 3550
F 0 "U39" H 7200 3917 50  0000 C CNN
F 1 "74HC139" H 7200 3826 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7200 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 3550 50  0001 C CNN
	1    7200 3550
	1    0    0    -1  
$EndComp
NoConn ~ 7700 4350
NoConn ~ 7700 4250
$Comp
L alexios:74HC139 U39
U 2 1 5FA291E5
P 7200 4150
F 0 "U39" H 7200 3775 50  0000 C CNN
F 1 "74HC139" H 7200 3684 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7200 4150 50  0001 C CNN
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
Text Notes 6650 1050 0    100  ~ 20
IRC Address Decoder
Text Notes 6650 3100 0    100  ~ 20
RTC Address Decoder
NoConn ~ 7700 2150
$Comp
L alexios:74HC139 U36
U 2 1 60AF2A3E
P 7200 2150
F 0 "U36" H 7850 2000 50  0000 L CNN
F 1 "74HC139" H 7850 1900 50  0000 L CNN
F 2 "alexios:SOIC-16" H 7200 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 2150 50  0001 C CNN
	2    7200 2150
	1    0    0    -1  
$EndComp
Text Label 5150 2750 0    50   ~ 0
~T1CS
Wire Notes Line
	7550 5050 7550 6400
Wire Notes Line
	7550 6400 5500 6400
Wire Notes Line
	5500 6400 5500 5050
Text Notes 6450 5300 0    50   ~ 0
Install either IC or diode.
Wire Notes Line
	7550 5050 5500 5050
$Comp
L Device:C_Small C?
U 1 1 603E8F75
P 950 6450
AR Path="/603E8F75" Ref="C?"  Part="1" 
AR Path="/5F160E7C/603E8F75" Ref="C?"  Part="1" 
AR Path="/60AA2B43/603E8F75" Ref="C43"  Part="1" 
F 0 "C43" H 859 6496 50  0000 R CNN
F 1 "100nF" H 859 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6450 50  0001 C CNN
F 3 "~" H 950 6450 50  0001 C CNN
	1    950  6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6300 950  6350
Wire Wire Line
	950  6550 950  6600
$Comp
L power:GND #PWR?
U 1 1 603E8F7D
P 950 6600
AR Path="/603E8F7D" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603E8F7D" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603E8F7D" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 950 6350 50  0001 C CNN
F 1 "GND" H 955 6427 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 603E8F83
P 950 6300
AR Path="/603E8F83" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603E8F83" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603E8F83" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 950 6150 50  0001 C CNN
F 1 "+5V" H 965 6473 50  0000 C CNN
F 2 "" H 950 6300 50  0001 C CNN
F 3 "" H 950 6300 50  0001 C CNN
	1    950  6300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603F3269
P 2300 6450
AR Path="/603F3269" Ref="C?"  Part="1" 
AR Path="/5F160E7C/603F3269" Ref="C?"  Part="1" 
AR Path="/60AA2B43/603F3269" Ref="C44"  Part="1" 
F 0 "C44" H 2209 6496 50  0000 R CNN
F 1 "100nF" H 2209 6405 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 6450 50  0001 C CNN
F 3 "~" H 2300 6450 50  0001 C CNN
	1    2300 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6300 2300 6350
Wire Wire Line
	2300 6550 2300 6600
$Comp
L power:GND #PWR?
U 1 1 603F3271
P 2300 6600
AR Path="/603F3271" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603F3271" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603F3271" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 2300 6350 50  0001 C CNN
F 1 "GND" H 2305 6427 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 603F3277
P 2300 6300
AR Path="/603F3277" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603F3277" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603F3277" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 2300 6150 50  0001 C CNN
F 1 "+5V" H 2315 6473 50  0000 C CNN
F 2 "" H 2300 6300 50  0001 C CNN
F 3 "" H 2300 6300 50  0001 C CNN
	1    2300 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603FC3C9
P 950 7250
AR Path="/603FC3C9" Ref="C?"  Part="1" 
AR Path="/5F160E7C/603FC3C9" Ref="C?"  Part="1" 
AR Path="/60AA2B43/603FC3C9" Ref="C45"  Part="1" 
F 0 "C45" H 859 7296 50  0000 R CNN
F 1 "100nF" H 859 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7250 50  0001 C CNN
F 3 "~" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  7100 950  7150
Wire Wire Line
	950  7350 950  7400
$Comp
L power:GND #PWR?
U 1 1 603FC3D1
P 950 7400
AR Path="/603FC3D1" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603FC3D1" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603FC3D1" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 950 7150 50  0001 C CNN
F 1 "GND" H 955 7227 50  0000 C CNN
F 2 "" H 950 7400 50  0001 C CNN
F 3 "" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 603FC3D7
P 950 7100
AR Path="/603FC3D7" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603FC3D7" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603FC3D7" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 950 6950 50  0001 C CNN
F 1 "+5V" H 965 7273 50  0000 C CNN
F 2 "" H 950 7100 50  0001 C CNN
F 3 "" H 950 7100 50  0001 C CNN
	1    950  7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603FC3E5
P 2300 7250
AR Path="/603FC3E5" Ref="C?"  Part="1" 
AR Path="/5F160E7C/603FC3E5" Ref="C?"  Part="1" 
AR Path="/60AA2B43/603FC3E5" Ref="C46"  Part="1" 
F 0 "C46" H 2209 7296 50  0000 R CNN
F 1 "100nF" H 2209 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 7250 50  0001 C CNN
F 3 "~" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 7100 2300 7150
Wire Wire Line
	2300 7350 2300 7400
$Comp
L power:GND #PWR?
U 1 1 603FC3ED
P 2300 7400
AR Path="/603FC3ED" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603FC3ED" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603FC3ED" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 2300 7150 50  0001 C CNN
F 1 "GND" H 2305 7227 50  0000 C CNN
F 2 "" H 2300 7400 50  0001 C CNN
F 3 "" H 2300 7400 50  0001 C CNN
	1    2300 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 603FC3F3
P 2300 7100
AR Path="/603FC3F3" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/603FC3F3" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/603FC3F3" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 2300 6950 50  0001 C CNN
F 1 "+5V" H 2315 7273 50  0000 C CNN
F 2 "" H 2300 7100 50  0001 C CNN
F 3 "" H 2300 7100 50  0001 C CNN
	1    2300 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U39
U 3 1 60409F37
P 2650 7250
F 0 "U39" H 2830 7296 50  0000 L CNN
F 1 "74HC139" H 2830 7205 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2650 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2650 7250 50  0001 C CNN
	3    2650 7250
	1    0    0    -1  
$EndComp
Connection ~ 950  7150
Connection ~ 950  7350
$Comp
L alexios:74HC138 U?
U 2 1 6040D2CD
P 2650 6450
AR Path="/5F3EA987/6040D2CD" Ref="U?"  Part="1" 
AR Path="/6040D2CD" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6040D2CD" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/6040D2CD" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/6040D2CD" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/6040D2CD" Ref="U?"  Part="1" 
AR Path="/60AA2B43/6040D2CD" Ref="U38"  Part="2" 
F 0 "U38" H 2830 6496 50  0000 L CNN
F 1 "74HC138" H 2830 6405 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2650 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2650 6450 50  0001 C CNN
	2    2650 6450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U?
U 2 1 6040CB6C
P 1300 6450
AR Path="/5F3EA987/6040CB6C" Ref="U?"  Part="1" 
AR Path="/6040CB6C" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6040CB6C" Ref="U?"  Part="1" 
AR Path="/5D65F6EF/6040CB6C" Ref="U?"  Part="1" 
AR Path="/5D69F3FD/6040CB6C" Ref="U?"  Part="1" 
AR Path="/5F67D4B5/6040CB6C" Ref="U?"  Part="1" 
AR Path="/60AA2B43/6040CB6C" Ref="U37"  Part="2" 
F 0 "U37" H 1480 6496 50  0000 L CNN
F 1 "74HC138" H 1480 6405 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 6450 50  0001 C CNN
	2    1300 6450
	1    0    0    -1  
$EndComp
Connection ~ 950  6350
Connection ~ 950  6550
$Comp
L alexios:74HC139 U36
U 3 1 60410338
P 1300 7250
F 0 "U36" H 1480 7296 50  0000 L CNN
F 1 "74HC139" H 1480 7205 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 1300 7250 50  0001 C CNN
	3    1300 7250
	1    0    0    -1  
$EndComp
Connection ~ 2300 7150
Connection ~ 2300 7350
$Comp
L alexios:74HC74 U41
U 3 1 60412F79
P 5450 7250
F 0 "U41" H 5630 7296 50  0000 L CNN
F 1 "74HC74" H 5630 7205 50  0000 L CNN
F 2 "alexios:SOIC-14" H 5400 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf" H 5400 7400 50  0001 C CNN
	3    5450 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60414177
P 5100 7250
AR Path="/60414177" Ref="C?"  Part="1" 
AR Path="/5F160E7C/60414177" Ref="C?"  Part="1" 
AR Path="/60AA2B43/60414177" Ref="C48"  Part="1" 
F 0 "C48" H 5009 7296 50  0000 R CNN
F 1 "100nF" H 5009 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 7250 50  0001 C CNN
F 3 "~" H 5100 7250 50  0001 C CNN
	1    5100 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 7100 5100 7150
Wire Wire Line
	5100 7350 5100 7400
$Comp
L power:GND #PWR?
U 1 1 6041417F
P 5100 7400
AR Path="/6041417F" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/6041417F" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/6041417F" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 5100 7150 50  0001 C CNN
F 1 "GND" H 5105 7227 50  0000 C CNN
F 2 "" H 5100 7400 50  0001 C CNN
F 3 "" H 5100 7400 50  0001 C CNN
	1    5100 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60414185
P 5100 7100
AR Path="/60414185" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/60414185" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/60414185" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 5100 6950 50  0001 C CNN
F 1 "+5V" H 5115 7273 50  0000 C CNN
F 2 "" H 5100 7100 50  0001 C CNN
F 3 "" H 5100 7100 50  0001 C CNN
	1    5100 7100
	1    0    0    -1  
$EndComp
Connection ~ 5100 7150
Connection ~ 5100 7350
$Comp
L alexios:74LVC1G11 U40
U 2 1 6041EC6E
P 4100 7100
F 0 "U40" H 4180 6996 50  0000 L CNN
F 1 "74LVC1G11" H 4180 6905 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4000 7025 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 4000 7025 50  0001 C CNN
	2    4100 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6041F563
P 3650 7250
AR Path="/6041F563" Ref="C?"  Part="1" 
AR Path="/5F160E7C/6041F563" Ref="C?"  Part="1" 
AR Path="/60AA2B43/6041F563" Ref="C47"  Part="1" 
F 0 "C47" H 3559 7296 50  0000 R CNN
F 1 "100nF" H 3559 7205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 7250 50  0001 C CNN
F 3 "~" H 3650 7250 50  0001 C CNN
	1    3650 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 7100 3650 7150
Wire Wire Line
	3650 7350 3650 7400
$Comp
L power:GND #PWR?
U 1 1 6041F56B
P 3650 7400
AR Path="/6041F56B" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/6041F56B" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/6041F56B" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 3650 7150 50  0001 C CNN
F 1 "GND" H 3655 7227 50  0000 C CNN
F 2 "" H 3650 7400 50  0001 C CNN
F 3 "" H 3650 7400 50  0001 C CNN
	1    3650 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6041F571
P 3650 7100
AR Path="/6041F571" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/6041F571" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/6041F571" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 3650 6950 50  0001 C CNN
F 1 "+5V" H 3665 7273 50  0000 C CNN
F 2 "" H 3650 7100 50  0001 C CNN
F 3 "" H 3650 7100 50  0001 C CNN
	1    3650 7100
	1    0    0    -1  
$EndComp
Connection ~ 3650 7350
Connection ~ 3650 7150
Connection ~ 2300 6350
Connection ~ 2300 6550
$Comp
L alexios:74LVC1G07 U?
U 2 1 60588FD2
P 6850 5800
AR Path="/600C0F8F/60588FD2" Ref="U?"  Part="1" 
AR Path="/60588FD2" Ref="U?"  Part="1" 
AR Path="/60AA2B43/60588FD2" Ref="U42"  Part="2" 
F 0 "U42" H 7030 5746 50  0000 L CNN
F 1 "74LVC1G07" H 7030 5655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6950 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 6950 5800 50  0001 C CNN
	2    6850 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60589B50
P 6500 5900
AR Path="/60589B50" Ref="C?"  Part="1" 
AR Path="/5F160E7C/60589B50" Ref="C?"  Part="1" 
AR Path="/60AA2B43/60589B50" Ref="C49"  Part="1" 
F 0 "C49" H 6409 5946 50  0000 R CNN
F 1 "100nF" H 6409 5855 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6500 5900 50  0001 C CNN
F 3 "~" H 6500 5900 50  0001 C CNN
	1    6500 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5750 6500 5800
Wire Wire Line
	6500 6000 6500 6050
$Comp
L power:GND #PWR?
U 1 1 60589B58
P 6500 6050
AR Path="/60589B58" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/60589B58" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/60589B58" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 6500 5800 50  0001 C CNN
F 1 "GND" H 6505 5877 50  0000 C CNN
F 2 "" H 6500 6050 50  0001 C CNN
F 3 "" H 6500 6050 50  0001 C CNN
	1    6500 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60589B5E
P 6500 5750
AR Path="/60589B5E" Ref="#PWR?"  Part="1" 
AR Path="/5F160E7C/60589B5E" Ref="#PWR?"  Part="1" 
AR Path="/60AA2B43/60589B5E" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 6500 5600 50  0001 C CNN
F 1 "+5V" H 6515 5923 50  0000 C CNN
F 2 "" H 6500 5750 50  0001 C CNN
F 3 "" H 6500 5750 50  0001 C CNN
	1    6500 5750
	1    0    0    -1  
$EndComp
Connection ~ 6500 5800
Connection ~ 6500 6000
Text Label 1100 5400 0    50   ~ 0
~T1CS
Wire Wire Line
	1600 5400 1100 5400
Text Label 1100 5200 0    50   ~ 0
~RTCCS
Wire Wire Line
	1600 5200 1100 5200
Wire Wire Line
	1600 5300 1100 5300
Text Label 1100 5300 0    50   ~ 0
~T0CS
Text Label 6500 1550 0    50   ~ 0
~IRCCS
Text Label 6500 2150 0    50   ~ 0
~IRCCS
Wire Notes Line width 18 style solid
	10200 1950 8900 1950
Wire Notes Line width 18 style solid
	8900 2850 8900 1950
Text Notes 8950 2800 0    50   ~ 0
Address\n\n010–011\n012–013\n\n014–017\n018–01C\n\n01C–01E\n01E–01F
Text Notes 9350 2800 0    50   ~ 0
Device\n\nIRC.IER\nIRC.ISR\n\nTMR0\nTMR1\n\nRTC.ADDR\nRTC.DATA
Text Notes 9800 2800 0    50   ~ 0
Direction\n\nrw\nr-\n\nrw\nrw\n\n-w\nrw
Wire Notes Line width 18 style solid
	8900 2850 10200 2850
Wire Notes Line width 18 style solid
	10200 1950 10200 2850
Wire Notes Line style solid
	8900 2100 10200 2100
$EndSCHEMATC
