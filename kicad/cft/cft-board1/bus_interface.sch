EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 20
Title ""
Date ""
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
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
AR Path="/61C2F29F/60AF29F4" Ref="U2002"  Part="1" 
F 0 "U2002" H 2500 3217 50  0000 C CNN
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
L power:GND #PWR0148
U 1 1 60AF2A05
P 1950 2400
F 0 "#PWR0148" H 1950 2150 50  0001 C CNN
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
L power:+5V #PWR0149
U 1 1 60AF2A19
P 4000 2700
F 0 "#PWR0149" H 4000 2550 50  0001 C CNN
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
AR Path="/61C2F29F/60AF2A23" Ref="U2003"  Part="1" 
F 0 "U2003" H 4550 3217 50  0000 C CNN
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
L alexios:74HC139 U2004
U 1 1 60AF2A38
P 7200 1550
F 0 "U2004" H 7200 1917 50  0000 C CNN
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
Text Notes 6650 1050 0    100  ~ 20
IRC Address Decoder
NoConn ~ 7700 2150
$Comp
L alexios:74HC139 U2004
U 2 1 60AF2A3E
P 7200 2150
F 0 "U2004" H 7850 2000 50  0000 L CNN
F 1 "74HC139" H 7850 1900 50  0000 L CNN
F 2 "alexios:SOIC-16" H 7200 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7200 2150 50  0001 C CNN
	2    7200 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603E8F75
P 950 6450
AR Path="/603E8F75" Ref="C?"  Part="1" 
AR Path="/5F160E7C/603E8F75" Ref="C?"  Part="1" 
AR Path="/60AA2B43/603E8F75" Ref="C43"  Part="1" 
AR Path="/61C2F29F/603E8F75" Ref="C2002"  Part="1" 
F 0 "C2002" H 859 6496 50  0000 R CNN
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
AR Path="/61C2F29F/603E8F7D" Ref="#PWR02009"  Part="1" 
F 0 "#PWR02009" H 950 6350 50  0001 C CNN
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
AR Path="/61C2F29F/603E8F83" Ref="#PWR02007"  Part="1" 
F 0 "#PWR02007" H 950 6150 50  0001 C CNN
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
AR Path="/61C2F29F/603F3269" Ref="C2003"  Part="1" 
F 0 "C2003" H 2209 6496 50  0000 R CNN
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
AR Path="/61C2F29F/603F3271" Ref="#PWR02010"  Part="1" 
F 0 "#PWR02010" H 2300 6350 50  0001 C CNN
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
AR Path="/61C2F29F/603F3277" Ref="#PWR02008"  Part="1" 
F 0 "#PWR02008" H 2300 6150 50  0001 C CNN
F 1 "+5V" H 2315 6473 50  0000 C CNN
F 2 "" H 2300 6300 50  0001 C CNN
F 3 "" H 2300 6300 50  0001 C CNN
	1    2300 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 603FC3E5
P 2300 7250
AR Path="/603FC3E5" Ref="C?"  Part="1" 
AR Path="/5F160E7C/603FC3E5" Ref="C?"  Part="1" 
AR Path="/60AA2B43/603FC3E5" Ref="C46"  Part="1" 
AR Path="/61C2F29F/603FC3E5" Ref="C2005"  Part="1" 
F 0 "C2005" H 2209 7296 50  0000 R CNN
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
AR Path="/61C2F29F/603FC3ED" Ref="#PWR02016"  Part="1" 
F 0 "#PWR02016" H 2300 7150 50  0001 C CNN
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
AR Path="/61C2F29F/603FC3F3" Ref="#PWR02012"  Part="1" 
F 0 "#PWR02012" H 2300 6950 50  0001 C CNN
F 1 "+5V" H 2315 7273 50  0000 C CNN
F 2 "" H 2300 7100 50  0001 C CNN
F 3 "" H 2300 7100 50  0001 C CNN
	1    2300 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U2004
U 3 1 60409F37
P 2650 7250
F 0 "U2004" H 2830 7296 50  0000 L CNN
F 1 "74HC139" H 2830 7205 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2650 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2650 7250 50  0001 C CNN
	3    2650 7250
	1    0    0    -1  
$EndComp
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
AR Path="/61C2F29F/6040D2CD" Ref="U2003"  Part="2" 
F 0 "U2003" H 2830 6496 50  0000 L CNN
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
AR Path="/61C2F29F/6040CB6C" Ref="U2002"  Part="2" 
F 0 "U2002" H 1480 6496 50  0000 L CNN
F 1 "74HC138" H 1480 6405 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 6450 50  0001 C CNN
	2    1300 6450
	1    0    0    -1  
$EndComp
Connection ~ 950  6350
Connection ~ 950  6550
Connection ~ 2300 7150
Connection ~ 2300 7350
$Comp
L alexios:74HC74 U2006
U 3 1 60412F79
P 5450 7250
F 0 "U2006" H 5630 7296 50  0000 L CNN
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
AR Path="/61C2F29F/60414177" Ref="C2007"  Part="1" 
F 0 "C2007" H 5009 7296 50  0000 R CNN
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
AR Path="/61C2F29F/6041417F" Ref="#PWR02018"  Part="1" 
F 0 "#PWR02018" H 5100 7150 50  0001 C CNN
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
AR Path="/61C2F29F/60414185" Ref="#PWR02014"  Part="1" 
F 0 "#PWR02014" H 5100 6950 50  0001 C CNN
F 1 "+5V" H 5115 7273 50  0000 C CNN
F 2 "" H 5100 7100 50  0001 C CNN
F 3 "" H 5100 7100 50  0001 C CNN
	1    5100 7100
	1    0    0    -1  
$EndComp
Connection ~ 5100 7150
Connection ~ 5100 7350
$Comp
L alexios:74LVC1G11 U2005
U 2 1 6041EC6E
P 4100 7100
F 0 "U2005" H 4180 6996 50  0000 L CNN
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
AR Path="/61C2F29F/6041F563" Ref="C2006"  Part="1" 
F 0 "C2006" H 3559 7296 50  0000 R CNN
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
AR Path="/61C2F29F/6041F56B" Ref="#PWR02017"  Part="1" 
F 0 "#PWR02017" H 3650 7150 50  0001 C CNN
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
AR Path="/61C2F29F/6041F571" Ref="#PWR02013"  Part="1" 
F 0 "#PWR02013" H 3650 6950 50  0001 C CNN
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
