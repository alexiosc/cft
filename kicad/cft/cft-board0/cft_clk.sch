EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 17
Title "Clock Generator"
Date ""
Rev "2119"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "clock.v"
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5E3810FB
P 2650 5150
AR Path="/5E3810FB" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3810FB" Ref="#PWR01013"  Part="1" 
F 0 "#PWR01013" H 2650 4900 50  0001 C CNN
F 1 "GND" H 2500 5100 50  0000 C CNN
F 2 "" H 2650 5150 50  0001 C CNN
F 3 "" H 2650 5150 50  0001 C CNN
	1    2650 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E381101
P 2650 4450
AR Path="/5E381101" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381101" Ref="#PWR01009"  Part="1" 
F 0 "#PWR01009" H 2650 4300 50  0001 C CNN
F 1 "+5V" H 2665 4623 50  0000 C CNN
F 2 "" H 2650 4450 50  0001 C CNN
F 3 "" H 2650 4450 50  0001 C CNN
	1    2650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4850 2650 4800
Wire Wire Line
	2800 4800 2650 4800
Connection ~ 2650 4800
Wire Wire Line
	2650 5050 2650 5100
Wire Wire Line
	2800 5100 2650 5100
Connection ~ 2650 5100
Wire Wire Line
	2650 5150 2650 5100
Text Label 3900 4950 0    50   ~ 0
CLK
Text Label 1550 3300 0    50   ~ 0
FPCLK
Text HLabel 1500 3300 0    50   Input ~ 0
FPCLK
Wire Wire Line
	6400 3600 6350 3600
Wire Wire Line
	6350 3600 6350 3700
$Comp
L power:GND #PWR?
U 1 1 5E381174
P 6350 4600
AR Path="/5E381174" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381174" Ref="#PWR01011"  Part="1" 
F 0 "#PWR01011" H 6350 4350 50  0001 C CNN
F 1 "GND" H 6355 4427 50  0000 C CNN
F 2 "" H 6350 4600 50  0001 C CNN
F 3 "" H 6350 4600 50  0001 C CNN
	1    6350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3700 6350 3700
Connection ~ 6350 3700
Wire Wire Line
	6350 3700 6350 3800
Wire Wire Line
	6400 3800 6350 3800
Connection ~ 6350 3800
Wire Wire Line
	6350 3800 6350 3900
Wire Wire Line
	6400 3900 6350 3900
Connection ~ 6350 3900
NoConn ~ 7400 3800
NoConn ~ 7400 3900
NoConn ~ 7400 4300
NoConn ~ 7400 4100
$Comp
L alexios:74HC139 U?
U 2 1 5E38119D
P 8400 5000
AR Path="/5E38119D" Ref="U?"  Part="2" 
AR Path="/5E36D9C8/5E38119D" Ref="U1003"  Part="2" 
F 0 "U1003" H 8400 5367 50  0000 C CNN
F 1 "74HC139" H 8400 5276 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8400 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8400 5000 50  0001 C CNN
	2    8400 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3811AF
P 7850 5250
AR Path="/5E3811AF" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811AF" Ref="#PWR01012"  Part="1" 
F 0 "#PWR01012" H 7850 5000 50  0001 C CNN
F 1 "GND" H 7855 5077 50  0000 C CNN
F 2 "" H 7850 5250 50  0001 C CNN
F 3 "" H 7850 5250 50  0001 C CNN
	1    7850 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 5000 7850 5000
Wire Wire Line
	7850 5000 7850 5200
Wire Wire Line
	7900 5200 7850 5200
Connection ~ 7850 5200
Wire Wire Line
	7850 5200 7850 5250
Wire Wire Line
	7400 3700 7700 3700
NoConn ~ 8900 4900
NoConn ~ 8900 5200
Text Label 7750 3600 0    50   ~ 0
÷2
Text Label 7750 3700 0    50   ~ 0
÷4
Wire Wire Line
	8900 3800 9000 3800
$Comp
L alexios:74HC139 U?
U 1 1 5E3811EE
P 8400 3700
AR Path="/5E3811EE" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5E3811EE" Ref="U1003"  Part="1" 
F 0 "U1003" H 8400 4067 50  0000 C CNN
F 1 "74HC139" H 8400 3976 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8400 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8400 3700 50  0001 C CNN
	1    8400 3700
	1    0    0    -1  
$EndComp
Text HLabel 10800 3600 2    50   Output ~ 0
CLK1
Text HLabel 10800 3700 2    50   Output ~ 0
CLK2
Text HLabel 10800 3800 2    50   Output ~ 0
CLK3
Text HLabel 10800 3900 2    50   Output ~ 0
CLK4
Wire Wire Line
	7700 4900 7900 4900
Wire Wire Line
	7900 3900 7850 3900
Wire Wire Line
	7850 3900 7850 3950
$Comp
L power:GND #PWR?
U 1 1 5E381202
P 7850 3950
AR Path="/5E381202" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381202" Ref="#PWR01008"  Part="1" 
F 0 "#PWR01008" H 7850 3700 50  0001 C CNN
F 1 "GND" H 7855 3777 50  0000 C CNN
F 2 "" H 7850 3950 50  0001 C CNN
F 3 "" H 7850 3950 50  0001 C CNN
	1    7850 3950
	1    0    0    -1  
$EndComp
Text HLabel 10800 5000 2    50   Output ~ 0
T34
Wire Wire Line
	4600 4100 4600 3200
Wire Wire Line
	4600 3200 4250 3200
$Comp
L alexios:74HC590 U?
U 1 1 5D0FD6BA
P 8250 1350
AR Path="/5E4DDD44/5D0FD6BA" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D0FD6BA" Ref="U1001"  Part="1" 
F 0 "U1001" H 8250 775 50  0000 C CNN
F 1 "74HC590" H 8250 684 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 8250 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 8250 1400 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1150 7700 1150
Wire Wire Line
	8900 600  8900 1550
Wire Wire Line
	8900 1550 8750 1550
NoConn ~ 8750 850 
NoConn ~ 8750 950 
NoConn ~ 8750 1050
NoConn ~ 8750 1150
NoConn ~ 8750 1250
NoConn ~ 8750 1350
NoConn ~ 8750 1450
Wire Wire Line
	8900 1550 8950 1550
Connection ~ 8900 1550
$Comp
L Device:R_Small R1003
U 1 1 5D0FD6E9
P 9400 1550
F 0 "R1003" V 9204 1550 50  0000 C CNN
F 1 "30Ω" V 9295 1550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9400 1550 50  0001 C CNN
F 3 "~" H 9400 1550 50  0001 C CNN
	1    9400 1550
	0    1    1    0   
$EndComp
Text Label 9800 1550 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7700 600  8900 600 
Wire Wire Line
	7700 850  7700 600 
Wire Wire Line
	7750 850  7700 850 
Text HLabel 10600 1550 2    50   Output ~ 0
~RSTHOLD
$Comp
L power:GND #PWR01003
U 1 1 5D0FD6F6
P 7750 1750
F 0 "#PWR01003" H 7750 1500 50  0001 C CNN
F 1 "GND" H 7755 1577 50  0000 C CNN
F 2 "" H 7750 1750 50  0001 C CNN
F 3 "" H 7750 1750 50  0001 C CNN
	1    7750 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1150 7700 1050
Connection ~ 7700 1050
Wire Wire Line
	7700 1050 7750 1050
$Comp
L power:+5V #PWR01001
U 1 1 5D14C3C4
P 4250 1000
F 0 "#PWR01001" H 4250 850 50  0001 C CNN
F 1 "+5V" H 4265 1173 50  0000 C CNN
F 2 "" H 4250 1000 50  0001 C CNN
F 3 "" H 4250 1000 50  0001 C CNN
	1    4250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1200 4250 1350
Connection ~ 4250 1350
$Comp
L Device:R_Small R?
U 1 1 5D150EAB
P 4250 1100
AR Path="/5E4DDD44/5D150EAB" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D150EAB" Ref="R1001"  Part="1" 
F 0 "R1001" H 4309 1146 50  0000 L CNN
F 1 "4.7kΩ" H 4309 1055 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 1100 50  0001 C CNN
F 3 "~" H 4250 1100 50  0001 C CNN
	1    4250 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3800 9000 3150
Wire Wire Line
	9000 3150 6900 3150
Wire Wire Line
	6900 3150 6900 1050
Connection ~ 9000 3800
Wire Wire Line
	6900 1050 7700 1050
NoConn ~ 8900 5100
Wire Wire Line
	7700 4900 7700 3700
Connection ~ 7700 3700
Wire Wire Line
	7700 3700 7900 3700
Text Label 7750 4900 0    50   ~ 0
÷4
Wire Notes Line style solid
	1600 6050 2050 6050
Wire Notes Line style solid
	2050 6050 2050 6100
Wire Notes Line style solid
	2050 6100 2200 6100
Wire Notes Line style solid
	2200 6100 2200 6050
Wire Notes Line style solid
	2200 6050 2250 6050
Wire Notes Line style solid
	1575 5950 1900 5950
Wire Notes Line style solid
	1900 5950 1900 6000
Wire Notes Line style solid
	1900 6000 2050 6000
Wire Notes Line style solid
	2050 6000 2050 5950
Wire Notes Line style solid
	2050 5950 2250 5950
Wire Notes Line style solid
	1575 5850 1750 5850
Wire Notes Line style solid
	1750 5850 1750 5900
Wire Notes Line style solid
	1750 5900 1900 5900
Wire Notes Line style solid
	1900 5900 1900 5850
Wire Notes Line style solid
	1900 5850 2250 5850
Wire Notes Line style solid
	1575 5750 1600 5750
Wire Notes Line style solid
	1600 5750 1600 5800
Wire Notes Line style solid
	1600 5800 1750 5800
Wire Notes Line style solid
	1600 6050 1600 6100
Wire Notes Line style solid
	1600 6100 1575 6100
Wire Notes Line style solid
	2200 5800 2250 5800
Wire Notes Line style solid
	1600 6150 1900 6150
Wire Notes Line style solid
	1900 6150 1900 6200
Wire Notes Line style solid
	1900 6200 2200 6200
Wire Notes Line style solid
	2200 6200 2200 6150
Wire Notes Line style solid
	2200 6150 2250 6150
Wire Notes Line style solid
	1600 6150 1600 6200
Wire Notes Line style solid
	1600 6200 1575 6200
Wire Notes Line style solid
	1575 5650 1575 5700
Text Notes 1550 5700 2    50   ~ 0
CLKIN
Text Notes 1550 6200 2    50   ~ 0
T34
Text Notes 1550 5900 2    50   ~ 0
CLK2
Text Notes 1550 6000 2    50   ~ 0
CLK3
Text Notes 1550 6100 2    50   ~ 0
CLK4
Text Notes 1550 5800 2    50   ~ 0
CLK1
Wire Notes Line style solid
	2075 6250 2085 6300
Wire Notes Line style solid
	2140 6300 2150 6250
Text Notes 1550 6300 2    50   ~ 0
WSTB
Wire Notes Line style solid
	1600 5700 1600 5650
Wire Notes Line style solid
	1575 5700 1600 5700
Wire Notes Line style solid
	1600 5650 1625 5650
Wire Notes Line style solid
	1750 5750 2200 5750
Wire Notes Line style solid
	2200 5750 2200 5800
Wire Notes Line style solid
	1750 5800 1750 5750
Wire Notes Line style solid
	1625 5650 1625 5700
Wire Notes Line style solid
	1650 5700 1650 5650
Wire Notes Line style solid
	1625 5700 1650 5700
Wire Notes Line style solid
	1650 5650 1675 5650
Wire Notes Line style solid
	1675 5650 1675 5700
Wire Notes Line style solid
	1700 5700 1700 5650
Wire Notes Line style solid
	1675 5700 1700 5700
Wire Notes Line style solid
	1700 5650 1725 5650
Wire Notes Line style solid
	1725 5650 1725 5700
Wire Notes Line style solid
	1750 5700 1750 5650
Wire Notes Line style solid
	1725 5700 1750 5700
Wire Notes Line style solid
	1750 5650 1775 5650
Wire Notes Line style solid
	1775 5650 1775 5700
Wire Notes Line style solid
	1800 5700 1800 5650
Wire Notes Line style solid
	1775 5700 1800 5700
Wire Notes Line style solid
	1800 5650 1825 5650
Wire Notes Line style solid
	1825 5650 1825 5700
Wire Notes Line style solid
	1850 5700 1850 5650
Wire Notes Line style solid
	1825 5700 1850 5700
Wire Notes Line style solid
	1850 5650 1875 5650
Wire Notes Line style solid
	1875 5650 1875 5700
Wire Notes Line style solid
	1900 5700 1900 5650
Wire Notes Line style solid
	1875 5700 1900 5700
Wire Notes Line style solid
	1900 5650 1925 5650
Wire Notes Line style solid
	1925 5650 1925 5700
Wire Notes Line style solid
	1950 5700 1950 5650
Wire Notes Line style solid
	1925 5700 1950 5700
Wire Notes Line style solid
	1950 5650 1975 5650
Wire Notes Line style solid
	1975 5650 1975 5700
Wire Notes Line style solid
	2000 5700 2000 5650
Wire Notes Line style solid
	1975 5700 2000 5700
Wire Notes Line style solid
	2000 5650 2025 5650
Wire Notes Line style solid
	2025 5650 2025 5700
Wire Notes Line style solid
	2050 5700 2050 5650
Wire Notes Line style solid
	2025 5700 2050 5700
Wire Notes Line style solid
	2050 5650 2075 5650
Wire Notes Line style solid
	2075 5650 2075 5700
Wire Notes Line style solid
	2100 5700 2100 5650
Wire Notes Line style solid
	2075 5700 2100 5700
Wire Notes Line style solid
	2100 5650 2125 5650
Wire Notes Line style solid
	2125 5650 2125 5700
Wire Notes Line style solid
	2150 5700 2150 5650
Wire Notes Line style solid
	2125 5700 2150 5700
Wire Notes Line style solid
	2150 5650 2175 5650
Wire Notes Line style solid
	2175 5650 2175 5700
Wire Notes Line style solid
	2200 5700 2200 5650
Wire Notes Line style solid
	2175 5700 2200 5700
Wire Notes Line style solid
	2200 5650 2225 5650
Wire Notes Line style solid
	2225 5650 2225 5700
Wire Notes Line style solid
	2250 5700 2250 5650
Wire Notes Line style solid
	2225 5700 2250 5700
Wire Notes Line style solid
	2165 6300 2175 6250
Wire Notes Line style solid
	2085 6300 2165 6300
Wire Notes Line style solid
	2110 6300 2100 6250
Wire Notes Line style solid
	2150 6250 2250 6250
Wire Notes Line style solid
	1600 6250 2100 6250
Wire Notes Line style solid
	1600 6250 1600 6300
Wire Notes Line style solid
	1600 6300 1575 6300
Text Notes 7650 2950 0    50   ~ 0
After a ~RESET~ pulse, the clock starts and we count 128 processor cycles.\nAt a 4 MHz clock, this is 32 µs. During this time, ~RSTHOLD~ is asserted, and\nmost of the processor units remain tri-stated and in reset while everything\nstabilises, capacitors are charged, etc.\n\nWhile ~RSTHOLD~ is low, the processor also performs its reset microprogram\nto initialise the PC with the boot vector.
Text Label 4900 4950 2    50   ~ 0
CLK
$Comp
L power:GND #PWR01014
U 1 1 5D665B60
P 4950 5650
F 0 "#PWR01014" H 4950 5400 50  0001 C CNN
F 1 "GND" H 5150 5600 50  0000 C CNN
F 2 "" H 4950 5650 50  0001 C CNN
F 3 "" H 4950 5650 50  0001 C CNN
	1    4950 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5500 4950 5500
Wire Wire Line
	4950 5500 4950 5600
NoConn ~ 6000 4700
Wire Wire Line
	3850 4950 4100 4950
$Comp
L power:GND #PWR?
U 1 1 5E381226
P 3150 3650
AR Path="/5E381226" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381226" Ref="#PWR01007"  Part="1" 
F 0 "#PWR01007" H 3150 3400 50  0001 C CNN
F 1 "GND" H 3155 3477 50  0000 C CNN
F 2 "" H 3150 3650 50  0001 C CNN
F 3 "" H 3150 3650 50  0001 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E38120E
P 3150 3550
AR Path="/5E38120E" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E38120E" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E38120E" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E38120E" Ref="R1014"  Part="1" 
F 0 "R1014" H 3092 3596 50  0000 R CNN
F 1 "4.7kΩ" H 3092 3505 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 3550 50  0001 C CNN
F 3 "~" H 3150 3550 50  0001 C CNN
	1    3150 3550
	1    0    0    -1  
$EndComp
Text HLabel 1500 3400 0    50   Input ~ 0
~FPCLK~⁄CLK
Text Label 1550 3400 0    50   ~ 0
~FPCLK~⁄CLK
$Comp
L power:+5V #PWR01006
U 1 1 5D18908F
P 3300 3050
F 0 "#PWR01006" H 3300 2900 50  0001 C CNN
F 1 "+5V" H 3315 3223 50  0000 C CNN
F 2 "" H 3300 3050 50  0001 C CNN
F 3 "" H 3300 3050 50  0001 C CNN
	1    3300 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E381214
P 3300 3150
AR Path="/5E381214" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E381214" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E381214" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E381214" Ref="R1005"  Part="1" 
F 0 "R1005" H 3242 3196 50  0000 R CNN
F 1 "4.7kΩ" H 3242 3105 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3300 3150 50  0001 C CNN
F 3 "~" H 3300 3150 50  0001 C CNN
	1    3300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3250 3300 3400
Wire Wire Line
	3300 3400 4400 3400
Wire Wire Line
	3150 3450 3150 3300
Wire Wire Line
	3150 3300 4500 3300
Text Label 6200 4500 2    50   ~ 0
CLKIN
$Comp
L alexios:74AC191 U?
U 1 1 5D805641
P 6900 4000
AR Path="/5CE09726/5D805641" Ref="U?"  Part="1" 
AR Path="/6A313729/5D805641" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D805641" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D805641" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D805641" Ref="U1004"  Part="1" 
F 0 "U1004" H 6900 4667 50  0000 C CNN
F 1 "74AC191" H 6900 4576 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6875 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 6875 4000 50  0001 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3900 6350 4200
Wire Wire Line
	6400 4200 6350 4200
Connection ~ 6350 4200
Wire Wire Line
	4500 3300 4500 4500
Wire Wire Line
	4400 3400 4400 5400
Text Label 4900 5400 2    50   ~ 0
~FPCLK~⁄CLK
Text Label 4900 4500 2    50   ~ 0
FPCLK
Wire Wire Line
	1500 3300 3150 3300
Connection ~ 3150 3300
Wire Wire Line
	1500 3400 3300 3400
Connection ~ 3300 3400
Wire Wire Line
	6000 4500 6400 4500
Wire Wire Line
	4600 4100 6400 4100
Text Label 10350 3600 0    50   ~ 0
CLK1
Text Label 10350 3700 0    50   ~ 0
CLK2
Text Label 10350 3800 0    50   ~ 0
CLK3
Text Label 10350 3900 0    50   ~ 0
CLK4
$Comp
L Device:R_Small R1011
U 1 1 5D6A69E9
P 10300 5450
F 0 "R1011" H 10241 5404 50  0000 R CNN
F 1 "100Ω" H 10241 5495 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10300 5450 50  0001 C CNN
F 3 "~" H 10300 5450 50  0001 C CNN
	1    10300 5450
	-1   0    0    1   
$EndComp
Text Label 10350 5000 0    50   ~ 0
T34
Connection ~ 4250 1450
Wire Wire Line
	4250 1450 4250 1350
$Comp
L Device:D_Schottky_ALT D1001
U 1 1 5E0B90C2
P 9100 1550
F 0 "D1001" H 9100 1674 50  0000 C CNN
F 1 "CUS520" H 9100 1400 50  0000 C CNN
F 2 "alexios:SOD-323" H 9100 1550 50  0001 C CNN
F 3 "~" H 9100 1550 50  0001 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1550 9300 1550
Wire Wire Line
	9500 1550 9650 1550
NoConn ~ 8750 1750
Connection ~ 2550 2700
Wire Wire Line
	2550 2800 2550 2700
Wire Wire Line
	2350 2400 2450 2400
Connection ~ 2350 2400
Wire Wire Line
	2350 2100 2350 2400
Wire Wire Line
	1850 2100 2350 2100
Wire Wire Line
	1850 2300 1850 2100
Wire Wire Line
	1800 2300 1850 2300
Connection ~ 1850 2400
Wire Wire Line
	1800 2400 1850 2400
Wire Wire Line
	2550 2700 1850 2700
Wire Wire Line
	2550 2650 2550 2700
Wire Wire Line
	1850 2700 1850 2400
Wire Wire Line
	2550 2400 2750 2400
Connection ~ 2550 2400
Wire Wire Line
	2550 2450 2550 2400
$Comp
L Device:R_Small R?
U 1 1 5D12738E
P 2450 2250
AR Path="/5E4DDD44/5D12738E" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D12738E" Ref="R1004"  Part="1" 
F 0 "R1004" H 2509 2296 50  0000 L CNN
F 1 "4.7kΩ" H 2509 2205 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2450 2250 50  0001 C CNN
F 3 "~" H 2450 2250 50  0001 C CNN
	1    2450 2250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G17 U1002
U 1 1 5CFCDA62
P 3050 2400
F 0 "U1002" H 3000 2667 50  0000 C CNN
F 1 "74LVC1G17" H 3000 2576 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3050 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3050 2400 50  0001 C CNN
	1    3050 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01005
U 1 1 5CFA0680
P 2550 2800
F 0 "#PWR01005" H 2550 2550 50  0001 C CNN
F 1 "GND" H 2400 2750 50  0000 C CNN
F 2 "" H 2550 2800 50  0001 C CNN
F 3 "" H 2550 2800 50  0001 C CNN
	1    2550 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2400 1900 2400
Wire Wire Line
	2450 2350 2450 2400
$Comp
L alexios:tactile_switch SW1001
U 1 1 5CF80B1C
P 2100 2400
F 0 "SW1001" H 2100 2599 50  0000 C CNN
F 1 "tactile_switch" H 2100 2340 50  0001 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx39-2LFS" H 2100 2600 50  0001 C CNN
F 3 "" H 2100 2600 50  0001 C CNN
	1    2100 2400
	-1   0    0    -1  
$EndComp
Connection ~ 2450 2400
Wire Wire Line
	2300 2400 2350 2400
Wire Wire Line
	2450 2400 2550 2400
$Comp
L power:+5V #PWR?
U 1 1 5D127395
P 2450 2150
AR Path="/5E4DDD44/5D127395" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D127395" Ref="#PWR01004"  Part="1" 
F 0 "#PWR01004" H 2450 2000 50  0001 C CNN
F 1 "+5V" H 2600 2200 50  0000 C CNN
F 2 "" H 2450 2150 50  0001 C CNN
F 3 "" H 2450 2150 50  0001 C CNN
	1    2450 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2400 4250 2400
Connection ~ 4250 2400
Wire Wire Line
	4250 2400 4250 3200
$Comp
L Device:D_Schottky_ALT D1004
U 1 1 5E075BF1
P 3900 2400
F 0 "D1004" H 3900 2276 50  0000 C CNN
F 1 "CUS520" H 3900 2185 50  0000 C CNN
F 2 "alexios:SOD-323" H 3900 2400 50  0001 C CNN
F 3 "~" H 3900 2400 50  0001 C CNN
	1    3900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2400 3750 2400
Wire Wire Line
	7400 3600 7900 3600
Text Label 6200 4100 2    50   ~ 0
~RESET
Text Label 7450 1350 0    50   ~ 0
~RESET
Text HLabel 1500 1450 0    50   3State ~ 0
~RESET
$Comp
L Connector_Generic:Conn_01x02 J1001
U 1 1 5D01818E
P 1600 2400
F 0 "J1001" H 1518 2167 50  0000 C CNN
F 1 "Conn_01x02" H 1900 2350 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 1600 2400 50  0001 C CNN
F 3 "~" H 1600 2400 50  0001 C CNN
	1    1600 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 1350 4250 1350
Wire Wire Line
	1500 1450 4250 1450
Text Label 1600 1450 0    50   ~ 0
~RESET
Text Notes 1450 1250 0    50   ~ 0
There are four reset sources for the ~RESET~ signal: devices\non the bus, the ~FPRESET~ from the DFP, the POWEROK signal\nfrom the PSU, and an optional tactile switch and/or 2-pin jumper.\nThese are ORred together with diode logic and fed back to the\nbus ~RESET~ signal. All ~RESET~ drivers are open drain, so that's\nokay.
Wire Wire Line
	6350 4200 6350 4400
Wire Wire Line
	6350 4400 6350 4600
Connection ~ 6350 4400
Wire Wire Line
	6400 4400 6350 4400
$Comp
L Device:R_Small R1002
U 1 1 5FF6EE09
P 9650 1300
F 0 "R1002" H 9591 1254 50  0000 R CNN
F 1 "4.7kΩ" H 9591 1345 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9650 1300 50  0001 C CNN
F 3 "~" H 9650 1300 50  0001 C CNN
	1    9650 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	9650 1400 9650 1550
Connection ~ 9650 1550
Wire Wire Line
	9650 1550 10600 1550
$Comp
L power:+5V #PWR01002
U 1 1 5FF762EA
P 9650 1150
F 0 "#PWR01002" H 9650 1000 50  0001 C CNN
F 1 "+5V" H 9665 1323 50  0000 C CNN
F 2 "" H 9650 1150 50  0001 C CNN
F 3 "" H 9650 1150 50  0001 C CNN
	1    9650 1150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC157 U1005
U 1 1 604EB36D
P 5500 5100
F 0 "U1005" H 5500 5967 50  0000 C CNN
F 1 "74AC157" H 5500 5876 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 5500 5100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74ac157.pdf" H 5500 5100 50  0001 C CNN
	1    5500 5100
	1    0    0    -1  
$EndComp
NoConn ~ 6000 4600
NoConn ~ 6000 4800
Wire Wire Line
	4400 5400 5000 5400
Wire Wire Line
	4500 4500 5000 4500
Wire Wire Line
	5000 4600 4950 4600
Wire Wire Line
	4950 4600 4950 4700
Connection ~ 4950 5500
Wire Wire Line
	5000 4700 4950 4700
Connection ~ 4950 4700
Wire Wire Line
	4950 4700 4950 4800
Wire Wire Line
	5000 4800 4950 4800
Connection ~ 4950 4800
Wire Wire Line
	4950 4800 4950 5050
Wire Wire Line
	5000 5050 4950 5050
Connection ~ 4950 5050
Wire Wire Line
	4950 5050 4950 5150
Wire Wire Line
	5000 5150 4950 5150
Connection ~ 4950 5150
Wire Wire Line
	4950 5150 4950 5250
Wire Wire Line
	5000 5250 4950 5250
Connection ~ 4950 5250
Wire Wire Line
	4950 5250 4950 5500
$Comp
L alexios:CXO_DIP8 X1
U 1 1 604D2694
P 3100 4900
F 0 "X1" H 3200 5267 50  0000 C CNN
F 1 "CXO_DIP8" H 3200 5176 50  0000 C CNN
F 2 "alexios:Oscillator_DIP-8-socket" H 3250 4500 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 3200 4850 50  0001 C CNN
	1    3100 4900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 3 1 5E3811A3
P 5000 7400
AR Path="/5E3811A3" Ref="U?"  Part="3" 
AR Path="/5E36D9C8/5E3811A3" Ref="U1003"  Part="3" 
F 0 "U1003" H 5180 7446 50  0000 L CNN
F 1 "74HC139" H 5180 7355 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 5000 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5000 7400 50  0001 C CNN
	3    5000 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3811BF
P 3250 7500
AR Path="/5E3811BF" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811BF" Ref="#PWR01022"  Part="1" 
F 0 "#PWR01022" H 3250 7250 50  0001 C CNN
F 1 "GND" H 3255 7327 50  0000 C CNN
F 2 "" H 3250 7500 50  0001 C CNN
F 3 "" H 3250 7500 50  0001 C CNN
	1    3250 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3811C5
P 4650 7500
AR Path="/5E3811C5" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811C5" Ref="#PWR01023"  Part="1" 
F 0 "#PWR01023" H 4650 7250 50  0001 C CNN
F 1 "GND" H 4655 7327 50  0000 C CNN
F 2 "" H 4650 7500 50  0001 C CNN
F 3 "" H 4650 7500 50  0001 C CNN
	1    4650 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E3811CB
P 4650 7300
AR Path="/5E3811CB" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811CB" Ref="#PWR01018"  Part="1" 
F 0 "#PWR01018" H 4650 7150 50  0001 C CNN
F 1 "+5V" H 4665 7473 50  0000 C CNN
F 2 "" H 4650 7300 50  0001 C CNN
F 3 "" H 4650 7300 50  0001 C CNN
	1    4650 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3811D1
P 3250 7400
AR Path="/5CC0D65F/5E3811D1" Ref="C?"  Part="1" 
AR Path="/5E3811D1" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3811D1" Ref="C1004"  Part="1" 
F 0 "C1004" H 3159 7446 50  0000 R CNN
F 1 "100nF" H 3159 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3250 7400 50  0001 C CNN
F 3 "~" H 3250 7400 50  0001 C CNN
	1    3250 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3811D7
P 4650 7400
AR Path="/5CC0D65F/5E3811D7" Ref="C?"  Part="1" 
AR Path="/5E3811D7" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3811D7" Ref="C1003"  Part="1" 
F 0 "C1003" H 4559 7446 50  0000 R CNN
F 1 "100nF" H 4559 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4650 7400 50  0001 C CNN
F 3 "~" H 4650 7400 50  0001 C CNN
	1    4650 7400
	1    0    0    -1  
$EndComp
Connection ~ 4650 7300
Connection ~ 4650 7500
$Comp
L power:+5V #PWR?
U 1 1 5E3811E1
P 3250 7300
AR Path="/5E3811E1" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811E1" Ref="#PWR01017"  Part="1" 
F 0 "#PWR01017" H 3250 7150 50  0001 C CNN
F 1 "+5V" H 3265 7473 50  0000 C CNN
F 2 "" H 3250 7300 50  0001 C CNN
F 3 "" H 3250 7300 50  0001 C CNN
	1    3250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CF0ABAA
P 950 7350
AR Path="/5CC0D65F/5CF0ABAA" Ref="C?"  Part="1" 
AR Path="/5CF0ABAA" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5CF0ABAA" Ref="C1002"  Part="1" 
F 0 "C1002" H 859 7396 50  0000 R CNN
F 1 "47µF" H 859 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7350 50  0001 C CNN
F 3 "~" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01015
U 1 1 5CF0BF5E
P 950 7250
F 0 "#PWR01015" H 950 7100 50  0001 C CNN
F 1 "+5V" H 965 7423 50  0000 C CNN
F 2 "" H 950 7250 50  0001 C CNN
F 3 "" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01020
U 1 1 5CF0C819
P 950 7450
F 0 "#PWR01020" H 950 7200 50  0001 C CNN
F 1 "GND" H 955 7277 50  0000 C CNN
F 2 "" H 950 7450 50  0001 C CNN
F 3 "" H 950 7450 50  0001 C CNN
	1    950  7450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U1001
U 2 1 5D0FD6CB
P 6350 7750
F 0 "U1001" H 6530 8146 50  0000 L CNN
F 1 "74HC590" H 6530 8055 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 6350 7800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 6350 7800 50  0001 C CNN
	2    6350 7750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01019
U 1 1 5D0FD6D2
P 6000 7300
F 0 "#PWR01019" H 6000 7150 50  0001 C CNN
F 1 "+5V" H 6015 7473 50  0000 C CNN
F 2 "" H 6000 7300 50  0001 C CNN
F 3 "" H 6000 7300 50  0001 C CNN
	1    6000 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01024
U 1 1 5D0FD6D8
P 6000 7500
F 0 "#PWR01024" H 6000 7250 50  0001 C CNN
F 1 "GND" H 6005 7327 50  0000 C CNN
F 2 "" H 6000 7500 50  0001 C CNN
F 3 "" H 6000 7500 50  0001 C CNN
	1    6000 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D0FD6DE
P 6000 7400
AR Path="/5CC0D65F/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D0FD6DE" Ref="C1001"  Part="1" 
F 0 "C1001" H 5909 7446 50  0000 R CNN
F 1 "100nF" H 5909 7355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 7400 50  0001 C CNN
F 3 "~" H 6000 7400 50  0001 C CNN
	1    6000 7400
	1    0    0    -1  
$EndComp
Connection ~ 6000 7300
Connection ~ 6000 7500
$Comp
L power:GND #PWR?
U 1 1 5E38112C
P 1850 7450
AR Path="/5E38112C" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E38112C" Ref="#PWR01021"  Part="1" 
F 0 "#PWR01021" H 1850 7200 50  0001 C CNN
F 1 "GND" H 1855 7277 50  0000 C CNN
F 2 "" H 1850 7450 50  0001 C CNN
F 3 "" H 1850 7450 50  0001 C CNN
	1    1850 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E381125
P 1850 7350
AR Path="/5CC0D65F/5E381125" Ref="C?"  Part="1" 
AR Path="/5E381125" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E381125" Ref="C1005"  Part="1" 
F 0 "C1005" H 1759 7396 50  0000 R CNN
F 1 "100nF" H 1759 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1850 7350 50  0001 C CNN
F 3 "~" H 1850 7350 50  0001 C CNN
	1    1850 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E38111F
P 1850 7250
AR Path="/5E38111F" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E38111F" Ref="#PWR01016"  Part="1" 
F 0 "#PWR01016" H 1850 7100 50  0001 C CNN
F 1 "+5V" H 1865 7423 50  0000 C CNN
F 2 "" H 1850 7250 50  0001 C CNN
F 3 "" H 1850 7250 50  0001 C CNN
	1    1850 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC191 U?
U 2 1 5DD549AB
P 3600 7650
AR Path="/5CE09726/5DD549AB" Ref="U?"  Part="1" 
AR Path="/6A313729/5DD549AB" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DD549AB" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DD549AB" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5DD549AB" Ref="U1004"  Part="2" 
F 0 "U1004" H 3780 7946 50  0000 L CNN
F 1 "74AC191" H 3780 7855 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3575 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 3575 7650 50  0001 C CNN
	2    3600 7650
	1    0    0    -1  
$EndComp
Connection ~ 3250 7300
Connection ~ 3250 7500
$Comp
L alexios:74LVC1G17 U1002
U 2 1 6157DD36
P 1300 7250
F 0 "U1002" H 1250 7517 50  0000 C CNN
F 1 "74LVC1G17" H 1250 7426 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1300 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1300 7250 50  0001 C CNN
	2    1300 7250
	1    0    0    -1  
$EndComp
Connection ~ 950  7450
Connection ~ 950  7250
$Comp
L alexios:74AC157 U1005
U 2 1 604F8DAC
P 2200 7850
F 0 "U1005" H 2380 8396 50  0000 L CNN
F 1 "74AC157" H 2380 8305 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 2200 7850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74ac157.pdf" H 2200 7850 50  0001 C CNN
	2    2200 7850
	1    0    0    -1  
$EndComp
Connection ~ 1850 7250
Connection ~ 1850 7450
$Comp
L Device:C_Small C?
U 1 1 5E3810F5
P 2650 4950
AR Path="/5CC0D65F/5E3810F5" Ref="C?"  Part="1" 
AR Path="/5E3810F5" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3810F5" Ref="C1016"  Part="1" 
F 0 "C1016" H 2559 4996 50  0000 R CNN
F 1 "1μF" H 2559 4905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 4950 50  0001 C CNN
F 3 "~" H 2650 4950 50  0001 C CNN
	1    2650 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CFC28E8
P 2550 2550
AR Path="/5CC0D65F/5CFC28E8" Ref="C?"  Part="1" 
AR Path="/5CFC28E8" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5CFC28E8" Ref="C1014"  Part="1" 
F 0 "C1014" H 2459 2596 50  0000 R CNN
F 1 "100nF" H 2459 2505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2550 2550 50  0001 C CNN
F 3 "~" H 2550 2550 50  0001 C CNN
	1    2550 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3600 9250 3600
Wire Wire Line
	9250 3600 10800 3600
Connection ~ 9250 3600
Connection ~ 9600 3700
Wire Wire Line
	9600 3700 10800 3700
Wire Wire Line
	8900 3700 9600 3700
Connection ~ 9950 3800
Wire Wire Line
	9950 3800 10800 3800
Wire Wire Line
	9000 3800 9950 3800
Connection ~ 10300 3900
Wire Wire Line
	10300 3900 10800 3900
Wire Wire Line
	8900 3900 10300 3900
Wire Wire Line
	10300 4000 10300 3900
Wire Wire Line
	9950 4000 9950 3800
Wire Wire Line
	9600 4000 9600 3700
Wire Wire Line
	9250 4000 9250 3600
$Comp
L Device:C_Small C1010
U 1 1 61516152
P 10300 4100
F 0 "C1010" H 10250 4200 50  0000 R CNN
F 1 "120pF" H 10250 4000 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10300 4100 50  0001 C CNN
F 3 "~" H 10300 4100 50  0001 C CNN
	1    10300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1009
U 1 1 61516022
P 9950 4100
F 0 "C1009" H 9900 4200 50  0000 R CNN
F 1 "120pF" H 9900 4000 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 4100 50  0001 C CNN
F 3 "~" H 9950 4100 50  0001 C CNN
	1    9950 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1008
U 1 1 61515D77
P 9600 4100
F 0 "C1008" H 9550 4200 50  0000 R CNN
F 1 "120pF" H 9550 4000 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9600 4100 50  0001 C CNN
F 3 "~" H 9600 4100 50  0001 C CNN
	1    9600 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1007
U 1 1 5D659E40
P 9250 4350
F 0 "R1007" H 9200 4350 50  0000 R CNN
F 1 "100Ω" H 9200 4250 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 4350 50  0001 C CNN
F 3 "~" H 9250 4350 50  0001 C CNN
	1    9250 4350
	1    0    0    -1  
$EndComp
Connection ~ 10300 4550
Wire Wire Line
	10300 4600 10300 4550
$Comp
L power:GND #PWR0801
U 1 1 614E5961
P 10300 4600
F 0 "#PWR0801" H 10300 4350 50  0001 C CNN
F 1 "GND" H 10305 4427 50  0000 C CNN
F 2 "" H 10300 4600 50  0001 C CNN
F 3 "" H 10300 4600 50  0001 C CNN
	1    10300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 4550 10300 4550
Connection ~ 9950 4550
Wire Wire Line
	9950 4450 9950 4550
Wire Wire Line
	9600 4550 9950 4550
Connection ~ 9600 4550
Wire Wire Line
	9600 4450 9600 4550
Wire Wire Line
	10300 4550 10300 4450
Wire Wire Line
	9250 4550 9600 4550
Wire Wire Line
	9250 4450 9250 4550
Wire Wire Line
	10300 4200 10300 4250
Wire Wire Line
	9950 4200 9950 4250
Wire Wire Line
	9600 4200 9600 4250
Wire Wire Line
	9250 4200 9250 4250
$Comp
L Device:C_Small C1007
U 1 1 61496128
P 9250 4100
F 0 "C1007" H 9200 4200 50  0000 R CNN
F 1 "120pF" H 9200 4000 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9250 4100 50  0001 C CNN
F 3 "~" H 9250 4100 50  0001 C CNN
	1    9250 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1008
U 1 1 5D683AF5
P 9600 4350
F 0 "R1008" H 9550 4350 50  0000 R CNN
F 1 "100Ω" H 9550 4250 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9600 4350 50  0001 C CNN
F 3 "~" H 9600 4350 50  0001 C CNN
	1    9600 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1009
U 1 1 5D683B51
P 9950 4350
F 0 "R1009" H 9900 4350 50  0000 R CNN
F 1 "100Ω" H 9900 4250 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 4350 50  0001 C CNN
F 3 "~" H 9950 4350 50  0001 C CNN
	1    9950 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1010
U 1 1 5D683BAF
P 10300 4350
F 0 "R1010" H 10250 4350 50  0000 R CNN
F 1 "100Ω" H 10250 4250 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10300 4350 50  0001 C CNN
F 3 "~" H 10300 4350 50  0001 C CNN
	1    10300 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1011
U 1 1 6153C2A6
P 10300 5200
F 0 "C1011" H 10250 5300 50  0000 R CNN
F 1 "120pF" H 10250 5100 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10300 5200 50  0001 C CNN
F 3 "~" H 10300 5200 50  0001 C CNN
	1    10300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5100 10300 5000
Wire Wire Line
	10300 5300 10300 5350
$Comp
L power:GND #PWR0104
U 1 1 6154C002
P 10300 5600
F 0 "#PWR0104" H 10300 5350 50  0001 C CNN
F 1 "GND" H 10305 5427 50  0000 C CNN
F 2 "" H 10300 5600 50  0001 C CNN
F 3 "" H 10300 5600 50  0001 C CNN
	1    10300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5550 10300 5600
$Comp
L alexios:74LVC1G125 U1006
U 1 1 61575DF9
P 4450 6100
F 0 "U1006" H 4500 5925 50  0000 C CNN
F 1 "74LVC1G125" H 4500 5834 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4625 6350 50  0001 C CNN
F 3 "" H 4625 6350 50  0001 C CNN
	1    4450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4950 4100 6100
Wire Wire Line
	4100 6100 4250 6100
Connection ~ 4100 4950
Wire Wire Line
	4100 4950 5000 4950
Wire Wire Line
	4500 5900 4500 5600
Wire Wire Line
	4500 5600 4950 5600
Connection ~ 4950 5600
Wire Wire Line
	4950 5600 4950 5650
Text HLabel 10800 6100 2    50   Output ~ 0
16MHz
$Comp
L Device:R_Small R1012
U 1 1 615B3A6A
P 5450 6550
F 0 "R1012" H 5509 6596 50  0000 L CNN
F 1 "100Ω" H 5509 6505 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 6550 50  0001 C CNN
F 3 "~" H 5450 6550 50  0001 C CNN
	1    5450 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1012
U 1 1 615B3A70
P 5450 6300
F 0 "C1012" H 5350 6300 50  0000 R CNN
F 1 "120pF" H 5400 6200 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 6300 50  0001 C CNN
F 3 "~" H 5450 6300 50  0001 C CNN
	1    5450 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 6400 5450 6450
$Comp
L power:GND #PWR0107
U 1 1 615B3A77
P 5450 6700
F 0 "#PWR0107" H 5450 6450 50  0001 C CNN
F 1 "GND" H 5455 6527 50  0000 C CNN
F 2 "" H 5450 6700 50  0001 C CNN
F 3 "" H 5450 6700 50  0001 C CNN
	1    5450 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 6650 5450 6700
$Comp
L alexios:74LVC1G125 U1006
U 2 1 615C0473
P 4450 6700
F 0 "U1006" H 4630 6746 50  0000 L CNN
F 1 "74LVC1G125" H 4630 6655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 4625 6950 50  0001 C CNN
F 3 "" H 4625 6950 50  0001 C CNN
	2    4450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 615C15FE
P 4100 6800
AR Path="/615C15FE" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/615C15FE" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 4100 6550 50  0001 C CNN
F 1 "GND" H 3950 6700 50  0000 C CNN
F 2 "" H 4100 6800 50  0001 C CNN
F 3 "" H 4100 6800 50  0001 C CNN
	1    4100 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 615C1604
P 4100 6700
AR Path="/5CC0D65F/615C1604" Ref="C?"  Part="1" 
AR Path="/615C1604" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/615C1604" Ref="C1006"  Part="1" 
F 0 "C1006" H 4009 6746 50  0000 R CNN
F 1 "100nF" H 4009 6655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 6700 50  0001 C CNN
F 3 "~" H 4100 6700 50  0001 C CNN
	1    4100 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 615C160A
P 4100 6350
AR Path="/615C160A" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/615C160A" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 4100 6200 50  0001 C CNN
F 1 "+5V" H 3950 6450 50  0000 C CNN
F 2 "" H 4100 6350 50  0001 C CNN
F 3 "" H 4100 6350 50  0001 C CNN
	1    4100 6350
	1    0    0    -1  
$EndComp
Connection ~ 4100 6800
Wire Wire Line
	5450 6200 5450 6100
Wire Wire Line
	5450 6100 10800 6100
Connection ~ 10300 5000
Wire Wire Line
	10300 5000 10800 5000
Wire Wire Line
	8900 5000 10300 5000
Text Label 7600 1050 2    50   ~ 0
CLK3
Wire Wire Line
	9650 1150 9650 1200
$Comp
L Device:R_Small R?
U 1 1 60AA029A
P 3750 4950
AR Path="/60AA029A" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60AA029A" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/60AA029A" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/60AA029A" Ref="R1017"  Part="1" 
F 0 "R1017" V 3854 4950 50  0000 C CNN
F 1 "30Ω" V 3945 4950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 4950 50  0001 C CNN
F 3 "~" H 3750 4950 50  0001 C CNN
	1    3750 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4950 3650 4950
$Comp
L Device:R_Small R?
U 1 1 60A971E2
P 3700 4600
AR Path="/60A971E2" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60A971E2" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/60A971E2" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/60A971E2" Ref="R1016"  Part="1" 
F 0 "R1016" H 3641 4554 50  0000 R CNN
F 1 "4.7kΩ" H 3641 4645 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 4600 50  0001 C CNN
F 3 "~" H 3700 4600 50  0001 C CNN
	1    3700 4600
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0821E1
P 3700 4450
AR Path="/5E0821E1" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E0821E1" Ref="#PWR01010"  Part="1" 
F 0 "#PWR01010" H 3700 4300 50  0001 C CNN
F 1 "+5V" H 3715 4623 50  0000 C CNN
F 2 "" H 3700 4450 50  0001 C CNN
F 3 "" H 3700 4450 50  0001 C CNN
	1    3700 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4800 3700 4700
Wire Wire Line
	3600 4800 3700 4800
Wire Wire Line
	3700 4450 3700 4500
$Comp
L Device:R_Small R?
U 1 1 60ADAAFD
P 2650 4600
AR Path="/60ADAAFD" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60ADAAFD" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/60ADAAFD" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/60ADAAFD" Ref="R1015"  Part="1" 
F 0 "R1015" H 2591 4554 50  0000 R CNN
F 1 "30Ω" H 2591 4645 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 4600 50  0001 C CNN
F 3 "~" H 2650 4600 50  0001 C CNN
	1    2650 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 4450 2650 4500
Wire Wire Line
	2650 4700 2650 4800
$Comp
L Device:R_Small R?
U 1 1 60B78ACD
P 4900 6100
AR Path="/60B78ACD" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60B78ACD" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/60B78ACD" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/60B78ACD" Ref="R1018"  Part="1" 
F 0 "R1018" V 5004 6100 50  0000 C CNN
F 1 "0Ω" V 5095 6100 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 6100 50  0001 C CNN
F 3 "~" H 4900 6100 50  0001 C CNN
	1    4900 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 6100 4800 6100
Wire Wire Line
	5000 6100 5450 6100
Connection ~ 5450 6100
$Comp
L Device:R_Small R?
U 1 1 60B8B71D
P 4100 6450
AR Path="/60B8B71D" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60B8B71D" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/60B8B71D" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/60B8B71D" Ref="R1019"  Part="1" 
F 0 "R1019" H 4041 6404 50  0000 R CNN
F 1 "30Ω" H 4041 6495 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4100 6450 50  0001 C CNN
F 3 "~" H 4100 6450 50  0001 C CNN
	1    4100 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6550 4100 6600
Connection ~ 4100 6600
Wire Notes Line
	3500 5850 5850 5850
Wire Notes Line
	5850 5850 5850 7050
Wire Notes Line
	5850 7050 3500 7050
Wire Notes Line
	3500 7050 3500 5850
Text Notes 3550 6000 0    63   ~ 13
Optional
Text Notes 3550 6100 0    50   ~ 0
(Maybe)
Wire Wire Line
	4250 1450 4250 2400
$EndSCHEMATC
