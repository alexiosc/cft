EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
Title "Memory Bank Unit"
Date ""
Rev "2006"
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 "mbu.v"
$EndDescr
Text Notes 2100 950  0    100  ~ 20
Address Decoding
$Comp
L alexios:74HC138 U?
U 1 1 5EDE7D4D
P 2600 5500
AR Path="/5F3EA987/5EDE7D4D" Ref="U?"  Part="1" 
AR Path="/5EDE7D4D" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7D4D" Ref="U17"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5EDE7D4D" Ref="U?"  Part="1" 
F 0 "U17" H 2600 6167 50  0000 C CNN
F 1 "74HC138" H 2600 6076 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 5500 50  0001 C CNN
	1    2600 5500
	1    0    0    -1  
$EndComp
Text Label 2100 5300 2    50   ~ 0
WADDR4
NoConn ~ 3100 5300
NoConn ~ 3100 5400
NoConn ~ 3100 5500
NoConn ~ 3100 5600
NoConn ~ 3100 5700
Text Notes 2650 5750 1    50   ~ 10
WADDR=001XX
Wire Wire Line
	2100 1350 1800 1350
Wire Wire Line
	2100 1450 1800 1450
Wire Wire Line
	2100 1550 1800 1550
Wire Wire Line
	2100 1950 1800 1950
Wire Wire Line
	2100 2050 1800 2050
Wire Wire Line
	2100 2150 1250 2150
Text Label 1800 2150 0    50   ~ 0
~SYSDEV
$Comp
L alexios:74HC138 U?
U 1 1 5EDE7D98
P 2600 1750
AR Path="/5F3EA987/5EDE7D98" Ref="U?"  Part="1" 
AR Path="/5EDE7D98" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5EDE7D98" Ref="U10"  Part="1" 
AR Path="/61F95ACC/63C9F04D/5EDE7D98" Ref="U?"  Part="1" 
F 0 "U10" H 2600 2400 50  0000 C CNN
F 1 "74HC138" H 2600 2300 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 1750 50  0001 C CNN
	1    2600 1750
	1    0    0    -1  
$EndComp
Text Label 1800 1950 0    50   ~ 0
AB3
Text Label 1800 1350 0    50   ~ 0
AB4
Text Label 1800 1450 0    50   ~ 0
AB5
Text Label 1800 1550 0    50   ~ 0
AB6
Text Label 1800 2050 0    50   ~ 0
AB7
Text Notes 2650 2150 1    50   ~ 10
IOADDR=00:00001xxx
NoConn ~ 3100 1450
NoConn ~ 3100 1550
NoConn ~ 3100 1650
NoConn ~ 3100 1750
NoConn ~ 3100 1850
NoConn ~ 3100 1950
NoConn ~ 3100 2050
Text Label 3350 5200 0    50   ~ 0
~WAR
Text Label 3450 1350 2    50   ~ 0
~IOMBR
Entry Wire Line
	1700 1250 1800 1350
Entry Wire Line
	1700 1350 1800 1450
Entry Wire Line
	1700 1450 1800 1550
Entry Wire Line
	1700 1850 1800 1950
Entry Wire Line
	1700 1950 1800 2050
Entry Bus Bus
	1600 1050 1700 1150
Wire Bus Line
	1600 1050 1250 1050
Text HLabel 1250 1050 0    50   Input ~ 0
AB[0..7]
Text Label 1700 1750 1    50   ~ 0
AB[0..7]
$Comp
L alexios:74HC138 U?
U 2 1 5F84B8BC
P 1300 1700
AR Path="/5F3EA987/5F84B8BC" Ref="U?"  Part="1" 
AR Path="/5F84B8BC" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5F84B8BC" Ref="U10"  Part="2" 
AR Path="/61F95ACC/63C9F04D/5F84B8BC" Ref="U?"  Part="1" 
F 0 "U10" H 1200 2000 50  0000 L CNN
F 1 "74HC138" H 1150 1450 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 1700 50  0001 C CNN
	2    1300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F84D2EB
P 950 1800
AR Path="/5F84D2EB" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F84D2EB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F84D2EB" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 950 1550 50  0001 C CNN
F 1 "GND" H 955 1627 50  0000 C CNN
F 2 "" H 950 1800 50  0001 C CNN
F 3 "" H 950 1800 50  0001 C CNN
	1    950  1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F84D2F1
P 950 1600
AR Path="/5F84D2F1" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F84D2F1" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F84D2F1" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 950 1450 50  0001 C CNN
F 1 "+5V" H 965 1773 50  0000 C CNN
F 2 "" H 950 1600 50  0001 C CNN
F 3 "" H 950 1600 50  0001 C CNN
	1    950  1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F84D2F7
P 950 1700
AR Path="/5CC0D65F/5F84D2F7" Ref="C?"  Part="1" 
AR Path="/5F84D2F7" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5F84D2F7" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5F84D2F7" Ref="C9"  Part="1" 
F 0 "C9" H 859 1746 50  0000 R CNN
F 1 "100nF" H 859 1655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 1700 50  0001 C CNN
F 3 "~" H 950 1700 50  0001 C CNN
	1    950  1700
	1    0    0    -1  
$EndComp
Connection ~ 950  1600
Connection ~ 950  1800
Wire Wire Line
	1700 6950 2100 6950
Text HLabel 1700 6950 0    50   Input ~ 0
~RESET
Text Label 1750 6950 0    50   ~ 0
~RESET
Text Notes 2250 6300 0    100  ~ 20
MBU Enable
Text Label 1750 7250 0    50   ~ 0
~IOWMBR
Wire Wire Line
	2100 7150 2050 7150
$Comp
L power:+5V #PWR066
U 1 1 6121EEB0
P 2050 6850
F 0 "#PWR066" H 2050 6700 50  0001 C CNN
F 1 "+5V" H 2065 7023 50  0000 C CNN
F 2 "" H 2050 6850 50  0001 C CNN
F 3 "" H 2050 6850 50  0001 C CNN
	1    2050 6850
	1    0    0    -1  
$EndComp
Text HLabel 1250 2150 0    50   Input ~ 0
~SYSDEV
Wire Wire Line
	3100 7250 3000 7250
Text Label 3100 7250 2    50   ~ 0
~DIS
Text Label 2100 5200 2    50   ~ 0
WADDR3
Text Label 2100 5100 2    50   ~ 0
WADDR2
NoConn ~ 3100 5800
NoConn ~ 3100 5100
$Comp
L alexios:74LVC1G74 U?
U 1 1 60083AB7
P 2550 7100
AR Path="/6005A9A5/60083AB7" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60083AB7" Ref="U8"  Part="1" 
F 0 "U8" H 2550 7517 50  0000 C CNN
F 1 "74LVC1G74" H 2550 7426 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 3000 7100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 3000 7100 50  0001 C CNN
	1    2550 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0145
U 1 1 5E459A7C
P 2050 5650
F 0 "#PWR0145" H 2050 5500 50  0001 C CNN
F 1 "+5V" H 2065 5823 50  0000 C CNN
F 2 "" H 2050 5650 50  0001 C CNN
F 3 "" H 2050 5650 50  0001 C CNN
	1    2050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5800 2050 5800
Wire Wire Line
	2050 5700 2100 5700
Wire Wire Line
	2100 5900 2050 5900
Wire Wire Line
	2050 5900 2050 5950
$Comp
L power:GND #PWR0147
U 1 1 5E8B7ED4
P 2050 5950
F 0 "#PWR0147" H 2050 5700 50  0001 C CNN
F 1 "GND" H 2055 5777 50  0000 C CNN
F 2 "" H 2050 5950 50  0001 C CNN
F 3 "" H 2050 5950 50  0001 C CNN
	1    2050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5800 2050 5900
Connection ~ 2050 5900
Text Label 2100 2700 2    50   ~ 0
RADDR1
Text Label 2100 2800 2    50   ~ 0
RADDR2
Text Label 2100 3200 2    50   ~ 0
RADDR3
Text Label 2100 3300 2    50   ~ 0
RADDR4
Text Notes 2650 3250 1    50   ~ 10
RADDR=01XXX
$Comp
L alexios:74HC138 U?
U 1 1 6022A4DB
P 2600 4250
AR Path="/5F3EA987/6022A4DB" Ref="U?"  Part="1" 
AR Path="/6022A4DB" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6022A4DB" Ref="U7"  Part="1" 
AR Path="/61F95ACC/63C9F04D/6022A4DB" Ref="U?"  Part="1" 
F 0 "U7" H 2600 4917 50  0000 C CNN
F 1 "74HC138" H 2600 4826 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 4250 50  0001 C CNN
	1    2600 4250
	1    0    0    -1  
$EndComp
Text Notes 2650 4500 1    50   ~ 10
WADDR=01XXX
Text Label 2100 4550 2    50   ~ 0
WADDR4
NoConn ~ 3100 2600
NoConn ~ 3100 2700
NoConn ~ 3100 2800
NoConn ~ 3100 2900
Text Label 3550 3100 2    50   ~ 0
~RMBP
Text Label 3550 4450 2    50   ~ 0
~WMBP
NoConn ~ 3100 3300
Text HLabel 1250 3400 0    50   Input ~ 0
~T34
Wire Wire Line
	1250 3400 1550 3400
Text Label 2100 3400 2    50   ~ 0
~T34
Text Notes 3250 4300 0    50   ~ 0
Asserted if CU addresses\nwrite_mbp (01100) or\nwrite_mbp_flags (01101).
NoConn ~ 3100 3000
Text Notes 3250 2950 0    50   ~ 0
RADDR=01101
$Comp
L alexios:74HC138 U?
U 1 1 60A07F64
P 2600 3000
AR Path="/5F3EA987/60A07F64" Ref="U?"  Part="1" 
AR Path="/60A07F64" Ref="U?"  Part="1" 
AR Path="/61F95ACC/60A07F64" Ref="U5"  Part="1" 
AR Path="/61F95ACC/63C9F04D/60A07F64" Ref="U?"  Part="1" 
F 0 "U5" H 2600 3667 50  0000 C CNN
F 1 "74HC138" H 2600 3576 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2600 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2600 3000 50  0001 C CNN
	1    2600 3000
	1    0    0    -1  
$EndComp
Text Label 3100 6950 2    50   ~ 0
~EN
Wire Wire Line
	6550 4300 6950 4300
Wire Wire Line
	6550 4200 6550 4300
$Comp
L Device:R_Small R?
U 1 1 60083AD2
P 6550 4100
AR Path="/60083AD2" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/60083AD2" Ref="R?"  Part="1" 
AR Path="/5D54E677/60083AD2" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/60083AD2" Ref="R?"  Part="1" 
AR Path="/5DEAC282/60083AD2" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/60083AD2" Ref="R?"  Part="1" 
AR Path="/5D46B22D/60083AD2" Ref="R?"  Part="1" 
AR Path="/61F95ACC/60083AD2" Ref="R9"  Part="1" 
AR Path="/6005A9A5/60083AD2" Ref="R?"  Part="1" 
F 0 "R9" H 6491 4054 50  0000 R CNN
F 1 "4.7kΩ" H 6491 4145 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6550 4100 50  0001 C CNN
F 3 "~" H 6550 4100 50  0001 C CNN
	1    6550 4100
	-1   0    0    1   
$EndComp
Text HLabel 5550 4300 0    50   Input ~ 0
~FPRAM~∕ROM
Wire Wire Line
	8700 4200 9000 4200
Wire Wire Line
	8700 4100 9000 4100
Wire Wire Line
	8700 4000 9000 4000
Wire Wire Line
	8700 3900 9000 3900
Wire Wire Line
	8700 3800 9000 3800
Wire Wire Line
	8700 3700 9000 3700
Wire Wire Line
	8700 3600 9000 3600
Wire Wire Line
	8700 3500 9000 3500
Text Label 8750 4200 0    50   ~ 0
AEXT7
Text Label 8750 4100 0    50   ~ 0
AEXT6
Text Label 8750 4000 0    50   ~ 0
AEXT5
Text Label 8750 3900 0    50   ~ 0
AEXT4
Text Label 8750 3800 0    50   ~ 0
AEXT3
Text Label 8750 3700 0    50   ~ 0
AEXT2
Text Label 8750 3600 0    50   ~ 0
AEXT1
Text Label 8750 3500 0    50   ~ 0
AEXT0
$Comp
L power:GND #PWR05
U 1 1 643A0C45
P 8950 2450
F 0 "#PWR05" H 8950 2200 50  0001 C CNN
F 1 "GND" H 8955 2277 50  0000 C CNN
F 2 "" H 8950 2450 50  0001 C CNN
F 3 "" H 8950 2450 50  0001 C CNN
	1    8950 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2400 8950 2450
Wire Wire Line
	9000 2400 8950 2400
Wire Wire Line
	9000 2300 8750 2300
Text Label 8750 2300 0    50   ~ 0
~RMBP
$Comp
L alexios:74HC541 U4
U 1 1 642AEC87
P 9500 1900
F 0 "U4" H 9850 1550 50  0000 L CNN
F 1 "74HC541" H 9850 1450 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 9500 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9500 1900 50  0001 C CNN
	1    9500 1900
	1    0    0    -1  
$EndComp
Text Label 9350 1050 0    50   ~ 0
IBUS[0..15]
Entry Wire Line
	8600 2200 8700 2100
Entry Wire Line
	8600 1900 8700 1800
Entry Wire Line
	8600 2000 8700 1900
Entry Wire Line
	8600 2100 8700 2000
Entry Wire Line
	8600 1500 8700 1400
Entry Wire Line
	8600 1600 8700 1500
Entry Wire Line
	8600 1700 8700 1600
Entry Wire Line
	8600 1800 8700 1700
Entry Wire Line
	8700 4200 8600 4100
Entry Wire Line
	8700 3900 8600 3800
Entry Wire Line
	8700 4000 8600 3900
Entry Wire Line
	8700 4100 8600 4000
Entry Wire Line
	8700 3500 8600 3400
Entry Wire Line
	8700 3600 8600 3500
Entry Wire Line
	8700 3700 8600 3600
Entry Wire Line
	8700 3800 8600 3700
Text Label 8600 2850 1    50   ~ 0
AEXT[0..7]
$Comp
L alexios:74HC541 U19
U 1 1 61720F4D
P 9500 4000
F 0 "U19" H 9850 3650 50  0000 L CNN
F 1 "74HC541" H 9850 3550 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 9500 4000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9500 4000 50  0001 C CNN
	1    9500 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4400 8750 4400
Text Label 8750 4400 0    50   ~ 0
~IOMBR
Text Notes 8700 4700 0    50   ~ 0
IN (i.e. register read) transactions only!
Wire Wire Line
	10000 3500 10300 3500
Wire Wire Line
	10000 3600 10300 3600
Wire Wire Line
	10000 3700 10300 3700
Wire Wire Line
	10000 3800 10300 3800
Wire Wire Line
	10000 3900 10300 3900
Wire Wire Line
	10000 4000 10300 4000
Wire Wire Line
	10000 4100 10300 4100
Wire Wire Line
	10000 4200 10300 4200
Entry Wire Line
	10400 3600 10300 3500
Entry Wire Line
	10400 3700 10300 3600
Entry Wire Line
	10400 3800 10300 3700
Entry Wire Line
	10400 3900 10300 3800
Entry Wire Line
	10400 4000 10300 3900
Entry Wire Line
	10400 4100 10300 4000
Entry Wire Line
	10400 4200 10300 4100
Entry Wire Line
	10400 4300 10300 4200
Text Label 10050 3500 0    50   ~ 0
DB0
Text Label 10050 3600 0    50   ~ 0
DB1
Text Label 10050 3700 0    50   ~ 0
DB2
Text Label 10050 3800 0    50   ~ 0
DB3
Text Label 10050 3900 0    50   ~ 0
DB4
Text Label 10050 4000 0    50   ~ 0
DB5
Text Label 10050 4100 0    50   ~ 0
DB6
Text Label 10050 4200 0    50   ~ 0
DB7
Wire Wire Line
	8700 2100 9000 2100
Wire Wire Line
	8700 2000 9000 2000
Wire Wire Line
	8700 1900 9000 1900
Wire Wire Line
	8700 1800 9000 1800
Wire Wire Line
	8700 1700 9000 1700
Wire Wire Line
	8700 1600 9000 1600
Wire Wire Line
	8700 1500 9000 1500
Wire Wire Line
	8700 1400 9000 1400
Entry Wire Line
	10300 2100 10400 2000
Entry Wire Line
	10300 2000 10400 1900
Entry Wire Line
	10300 1900 10400 1800
Entry Wire Line
	10300 1800 10400 1700
Entry Wire Line
	10300 1700 10400 1600
Entry Wire Line
	10300 1600 10400 1500
Entry Wire Line
	10300 1500 10400 1400
Entry Wire Line
	10300 1400 10400 1300
Wire Wire Line
	10000 2100 10300 2100
Wire Wire Line
	10000 2000 10300 2000
Wire Wire Line
	10000 1900 10300 1900
Wire Wire Line
	10000 1800 10300 1800
Wire Wire Line
	10000 1700 10300 1700
Wire Wire Line
	10000 1600 10300 1600
Wire Wire Line
	10000 1500 10300 1500
Wire Wire Line
	10000 1400 10300 1400
Text Label 10250 2100 2    50   ~ 0
IBUS7
Text Label 10250 2000 2    50   ~ 0
IBUS6
Text Label 10250 1900 2    50   ~ 0
IBUS5
Text Label 10250 1800 2    50   ~ 0
IBUS4
Text Label 10250 1700 2    50   ~ 0
IBUS3
Text Label 10250 1600 2    50   ~ 0
IBUS2
Text Label 10250 1500 2    50   ~ 0
IBUS1
Text Label 10250 1400 2    50   ~ 0
IBUS0
Text Label 8750 2100 0    50   ~ 0
AEXT7
Text Label 8750 2000 0    50   ~ 0
AEXT6
Text Label 8750 1900 0    50   ~ 0
AEXT5
Text Label 8750 1800 0    50   ~ 0
AEXT4
Text Label 8750 1700 0    50   ~ 0
AEXT3
Text Label 8750 1600 0    50   ~ 0
AEXT2
Text Label 8750 1500 0    50   ~ 0
AEXT1
Text Label 8750 1400 0    50   ~ 0
AEXT0
Text Notes 3450 1200 2    50   ~ 0
AB=&008–&00F
Text Label 2100 3850 2    50   ~ 0
WADDR1
Text Label 2100 3950 2    50   ~ 0
WADDR2
Text Label 2100 4050 2    50   ~ 0
WADDR3
Wire Wire Line
	2100 4450 2050 4450
Wire Wire Line
	2050 4450 2050 4400
$Comp
L power:+5V #PWR013
U 1 1 64826DD2
P 2050 4400
F 0 "#PWR013" H 2050 4250 50  0001 C CNN
F 1 "+5V" H 2065 4573 50  0000 C CNN
F 2 "" H 2050 4400 50  0001 C CNN
F 3 "" H 2050 4400 50  0001 C CNN
	1    2050 4400
	1    0    0    -1  
$EndComp
NoConn ~ 3100 3850
NoConn ~ 3100 3950
NoConn ~ 3100 4050
NoConn ~ 3100 4150
NoConn ~ 3100 4250
NoConn ~ 3100 4350
NoConn ~ 3100 4550
Wire Wire Line
	2050 5650 2050 5700
$Comp
L power:+5V #PWR?
U 1 1 60083AD8
P 6550 3950
AR Path="/6005A9A5/60083AD8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/60083AD8" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 6550 3800 50  0001 C CNN
F 1 "+5V" H 6450 3950 50  0000 C CNN
F 2 "" H 6550 3950 50  0001 C CNN
F 3 "" H 6550 3950 50  0001 C CNN
	1    6550 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3950 6550 4000
Wire Wire Line
	6450 4300 6550 4300
Connection ~ 6550 4300
Wire Wire Line
	5550 4300 6150 4300
$Comp
L Device:D_ALT D1
U 1 1 6553D07B
P 6300 4300
F 0 "D1" H 6300 4424 50  0000 C CNN
F 1 "D_ALT" H 6300 4425 50  0001 C CNN
F 2 "alexios:SOD-323" H 6300 4300 50  0001 C CNN
F 3 "~" H 6300 4300 50  0001 C CNN
	1    6300 4300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U6
U 1 1 6807A17E
P 3850 3100
F 0 "U6" H 3800 2925 50  0000 C CNN
F 1 "74LVC1G04" H 3800 2834 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3850 3100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 3850 3100 50  0001 C CNN
	1    3850 3100
	1    0    0    -1  
$EndComp
$Sheet
S 7050 1250 1150 2400
U 6888FBA2
F0 "8×8 Register File" 50
F1 "mbu_regfile.sch" 50
F2 "D0" I L 7050 1400 50 
F3 "D1" I L 7050 1500 50 
F4 "D2" I L 7050 1600 50 
F5 "D3" I L 7050 1700 50 
F6 "D4" I L 7050 1800 50 
F7 "D5" I L 7050 1900 50 
F8 "D6" I L 7050 2000 50 
F9 "D7" I L 7050 2100 50 
F10 "WA0" I L 7050 2300 50 
F11 "WA1" I L 7050 2400 50 
F12 "~WEN0" I L 7050 2500 50 
F13 "~WEN1" I L 7050 2600 50 
F14 "RA0" I L 7050 2800 50 
F15 "RA1" I L 7050 2900 50 
F16 "~REN0" I L 7050 3000 50 
F17 "~REN1" I L 7050 3100 50 
F18 "~EN" I L 7050 3300 50 
F19 "ROM" I L 7050 3400 50 
F20 "AEXT7" O R 8200 2100 50 
F21 "AEXT6" O R 8200 2000 50 
F22 "AEXT5" O R 8200 1900 50 
F23 "AEXT4" O R 8200 1800 50 
F24 "AEXT3" O R 8200 1700 50 
F25 "AEXT2" O R 8200 1600 50 
F26 "AEXT1" O R 8200 1500 50 
F27 "AEXT0" O R 8200 1400 50 
$EndSheet
Entry Wire Line
	8600 2200 8500 2100
Entry Wire Line
	8600 1900 8500 1800
Entry Wire Line
	8600 2000 8500 1900
Entry Wire Line
	8600 2100 8500 2000
Entry Wire Line
	8600 1500 8500 1400
Entry Wire Line
	8600 1600 8500 1500
Entry Wire Line
	8600 1700 8500 1600
Entry Wire Line
	8600 1800 8500 1700
Wire Wire Line
	8500 2100 8200 2100
Wire Wire Line
	8500 2000 8200 2000
Wire Wire Line
	8500 1900 8200 1900
Wire Wire Line
	8500 1800 8200 1800
Wire Wire Line
	8500 1700 8200 1700
Wire Wire Line
	8500 1600 8200 1600
Wire Wire Line
	8500 1500 8200 1500
Wire Wire Line
	8500 1400 8200 1400
Text Label 8450 2100 2    50   ~ 0
AEXT7
Text Label 8450 2000 2    50   ~ 0
AEXT6
Text Label 8450 1900 2    50   ~ 0
AEXT5
Text Label 8450 1800 2    50   ~ 0
AEXT4
Text Label 8450 1700 2    50   ~ 0
AEXT3
Text Label 8450 1600 2    50   ~ 0
AEXT2
Text Label 8450 1500 2    50   ~ 0
AEXT1
Text Label 8450 1400 2    50   ~ 0
AEXT0
Text Label 6600 1400 0    50   ~ 0
IBUS0
Text Label 6600 1500 0    50   ~ 0
IBUS1
Text Label 6600 1600 0    50   ~ 0
IBUS2
Text Label 6600 1700 0    50   ~ 0
IBUS3
Text Label 6600 1800 0    50   ~ 0
IBUS4
Text Label 6600 1900 0    50   ~ 0
IBUS5
Text Label 6600 2000 0    50   ~ 0
IBUS6
Text Label 6600 2100 0    50   ~ 0
IBUS7
Text Label 6600 2300 0    50   ~ 0
WA0
Text Label 6600 2400 0    50   ~ 0
WA1
Text Label 6600 2500 0    50   ~ 0
~WEN0
Text Label 6600 2600 0    50   ~ 0
~WEN1
Text Label 6600 2800 0    50   ~ 0
RA0
Text Label 6600 2900 0    50   ~ 0
RA1
Text Label 6600 3000 0    50   ~ 0
~REN0
Text Label 6600 3100 0    50   ~ 0
~REN1
Text Label 6600 3300 0    50   ~ 0
~EN
Text Label 6950 3950 1    50   ~ 0
ROM
Wire Wire Line
	6550 1400 7050 1400
Wire Wire Line
	6550 1500 7050 1500
Wire Wire Line
	6550 1600 7050 1600
Wire Wire Line
	6550 1700 7050 1700
Wire Wire Line
	6550 1800 7050 1800
Wire Wire Line
	6550 1900 7050 1900
Wire Wire Line
	6550 2000 7050 2000
Wire Wire Line
	6550 2100 7050 2100
Entry Wire Line
	6450 1300 6550 1400
Entry Wire Line
	6450 1400 6550 1500
Entry Wire Line
	6450 1500 6550 1600
Entry Wire Line
	6450 1600 6550 1700
Entry Wire Line
	6450 1700 6550 1800
Entry Wire Line
	6450 1800 6550 1900
Entry Wire Line
	6450 1900 6550 2000
Entry Wire Line
	6450 2000 6550 2100
Text Label 6450 1800 1    50   ~ 0
IBUS[0..15]
Text HLabel 3800 5200 2    50   Output ~ 0
~WAR
Wire Wire Line
	1800 3300 2100 3300
Text Label 2100 2600 2    50   ~ 0
RADDR0
Wire Wire Line
	1800 4550 2100 4550
Text Label 2100 3750 2    50   ~ 0
WADDR0
Wire Wire Line
	2100 2600 1800 2600
Wire Wire Line
	2100 2700 1800 2700
Wire Wire Line
	2100 2800 1800 2800
Entry Wire Line
	1700 3200 1800 3300
Entry Bus Bus
	1600 2250 1700 2350
Wire Bus Line
	1600 2250 1250 2250
Text HLabel 1250 2250 0    50   Input ~ 0
RADDR[0..4]
Entry Wire Line
	1700 3100 1800 3200
Entry Wire Line
	1700 2700 1800 2800
Entry Wire Line
	1700 2600 1800 2700
Entry Wire Line
	1700 2500 1800 2600
Wire Wire Line
	2100 3850 1800 3850
Wire Wire Line
	2100 3950 1800 3950
Wire Wire Line
	2100 4050 1800 4050
Entry Wire Line
	1700 3650 1800 3750
Entry Wire Line
	1700 3750 1800 3850
Entry Wire Line
	1700 3850 1800 3950
Entry Wire Line
	1700 3950 1800 4050
Entry Wire Line
	1700 4450 1800 4550
Entry Bus Bus
	1600 3500 1700 3600
Wire Bus Line
	1600 3500 1250 3500
Text HLabel 1250 3500 0    50   Input ~ 0
WADDR[0..4]
Wire Wire Line
	1800 3750 2100 3750
Wire Wire Line
	2100 5100 1800 5100
Wire Wire Line
	2100 5200 1800 5200
Wire Wire Line
	2100 5300 1800 5300
Entry Wire Line
	1700 5000 1800 5100
Entry Wire Line
	1700 5100 1800 5200
Entry Wire Line
	1700 5200 1800 5300
Text Label 1700 4800 1    50   ~ 0
WADDR[0..4]
Text Label 1700 3100 1    50   ~ 0
RADDR[0..4]
Text HLabel 10650 4850 2    50   3State ~ 0
DB[0..7]
Text Label 10400 4700 1    50   ~ 0
DB[0..7]
Wire Wire Line
	5300 2300 4800 2300
Wire Wire Line
	5300 2400 4800 2400
Wire Wire Line
	5300 2500 4800 2500
Wire Wire Line
	5300 2800 4800 2800
Wire Wire Line
	5300 2900 4800 2900
Wire Wire Line
	5300 3300 4500 3300
Wire Wire Line
	5300 3400 4500 3400
Wire Wire Line
	5300 3000 4500 3000
Text Label 4800 2300 0    50   ~ 0
AB0
Text Label 4800 2400 0    50   ~ 0
AB1
Text Label 4800 2500 0    50   ~ 0
AB2
Wire Wire Line
	4650 1350 4650 2600
Wire Wire Line
	3100 1350 4650 1350
Wire Wire Line
	4650 2600 5300 2600
Text Label 4800 2700 0    50   ~ 0
~W
Text Label 4800 2800 0    50   ~ 0
WADDR0
Text Label 4800 2900 0    50   ~ 0
WADDR1
Text Label 4800 3600 0    50   ~ 0
~WMBP
Text Label 4800 3100 0    50   ~ 0
~RG
Text Label 4800 3300 0    50   ~ 0
IR0
Text Label 4800 3400 0    50   ~ 0
IR1
Text Label 4800 3000 0    50   ~ 0
~IR-IDX
Text HLabel 4500 3000 0    50   Input ~ 0
~IR-IDX
Text HLabel 4500 3300 0    50   Input ~ 0
IR0
Text HLabel 4500 3400 0    50   Input ~ 0
IR1
Wire Wire Line
	4600 3600 5300 3600
Wire Wire Line
	3100 4450 4600 4450
$Sheet
S 5300 2100 1150 1700
U 6AF25BF3
F0 "Control Logic" 50
F1 "mbu_control.sch" 50
F2 "~WEN0" O R 6450 2500 50 
F3 "~WEN1" O R 6450 2600 50 
F4 "AB0" I L 5300 2300 50 
F5 "AB1" I L 5300 2400 50 
F6 "AB2" I L 5300 2500 50 
F7 "~IOMBR" I L 5300 2600 50 
F8 "~W" I L 5300 2700 50 
F9 "~WMBP" I L 5300 3600 50 
F10 "WA0" O R 6450 2300 50 
F11 "WA1" O R 6450 2400 50 
F12 "WADDR0" I L 5300 2800 50 
F13 "WADDR1" I L 5300 2900 50 
F14 "~IR-IDX" I L 5300 3000 50 
F15 "IR0" I L 5300 3300 50 
F16 "IR1" I L 5300 3400 50 
F17 "~RG" I L 5300 3100 50 
F18 "~WAR" I L 5300 3700 50 
F19 "RA0" O R 6450 2800 50 
F20 "RA1" O R 6450 2900 50 
F21 "~REN0" O R 6450 3000 50 
F22 "~REN1" O R 6450 3100 50 
F23 "~IOWMBR" O R 6450 3600 50 
F24 "IR2" I L 5300 3500 50 
F25 "~T34" I L 5300 3200 50 
F26 "~RESET" I L 5300 2200 50 
$EndSheet
Wire Wire Line
	4600 3600 4600 4450
Wire Wire Line
	5300 3700 4700 3700
Wire Wire Line
	4700 3700 4700 4550
Wire Wire Line
	3100 5200 3600 5200
Text Label 4800 3700 0    50   ~ 0
~WAR
Wire Wire Line
	4500 2700 5300 2700
Text HLabel 4500 2700 0    50   Input ~ 0
~W
Entry Bus Bus
	6350 1050 6450 1150
Wire Bus Line
	6350 1050 5700 1050
Text HLabel 5700 1050 0    50   3State ~ 0
IBUS[0..7]
Entry Bus Bus
	6450 1150 6550 1050
Wire Bus Line
	6550 1050 10300 1050
Entry Bus Bus
	10300 1050 10400 1150
Text Label 5850 1050 0    50   ~ 0
IBUS[0..7]
Wire Wire Line
	6450 2300 7050 2300
Wire Wire Line
	6450 2400 7050 2400
Wire Wire Line
	6450 2500 7050 2500
Wire Wire Line
	6450 2600 7050 2600
Wire Wire Line
	6450 2800 7050 2800
Wire Wire Line
	6450 2900 7050 2900
Wire Wire Line
	6450 3000 7050 3000
Wire Wire Line
	6450 3100 7050 3100
Wire Wire Line
	6950 3400 7050 3400
Wire Wire Line
	6600 3300 7050 3300
Wire Wire Line
	3000 6950 3100 6950
Wire Wire Line
	3650 6950 3700 6950
Wire Wire Line
	4000 6950 4050 6950
$Comp
L Device:LED_ALT D5
U 1 1 5F7130AB
P 3850 6950
F 0 "D5" H 3843 6786 50  0000 C CNN
F 1 "LED_ALT" H 3843 6786 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 6950 50  0001 C CNN
F 3 "~" H 3850 6950 50  0001 C CNN
	1    3850 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R23
U 1 1 5F7130B1
P 3550 6950
F 0 "R23" V 3354 6950 50  0000 C CNN
F 1 "680Ω" V 3445 6950 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3550 6950 50  0001 C CNN
F 3 "~" H 3550 6950 50  0001 C CNN
	1    3550 6950
	0    -1   1    0   
$EndComp
Wire Wire Line
	3400 6950 3450 6950
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 631AB2E9
P 3250 6950
F 0 "JP2" H 3250 7063 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 3250 7064 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 3250 6950 50  0001 C CNN
F 3 "~" H 3250 6950 50  0001 C CNN
	1    3250 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F82AB65
P 4050 7000
AR Path="/5F82AB65" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5F82AB65" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5F82AB65" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 4050 6750 50  0001 C CNN
F 1 "GND" H 4055 6827 50  0000 C CNN
F 2 "" H 4050 7000 50  0001 C CNN
F 3 "" H 4050 7000 50  0001 C CNN
	1    4050 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6950 4050 7000
Wire Wire Line
	6950 4300 6950 3400
Entry Bus Bus
	10400 4750 10500 4850
Wire Bus Line
	10500 4850 10650 4850
$Comp
L alexios:74HC138 U?
U 2 1 6BC4FA6D
P 1300 2850
AR Path="/5F3EA987/6BC4FA6D" Ref="U?"  Part="1" 
AR Path="/6BC4FA6D" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6BC4FA6D" Ref="U5"  Part="2" 
AR Path="/61F95ACC/63C9F04D/6BC4FA6D" Ref="U?"  Part="1" 
F 0 "U5" H 1200 3150 50  0000 L CNN
F 1 "74HC138" H 1150 2600 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 2850 50  0001 C CNN
	2    1300 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6BC4FA73
P 950 2950
AR Path="/6BC4FA73" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BC4FA73" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BC4FA73" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 950 2700 50  0001 C CNN
F 1 "GND" H 955 2777 50  0000 C CNN
F 2 "" H 950 2950 50  0001 C CNN
F 3 "" H 950 2950 50  0001 C CNN
	1    950  2950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BC4FA79
P 950 2750
AR Path="/6BC4FA79" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BC4FA79" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BC4FA79" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 950 2600 50  0001 C CNN
F 1 "+5V" H 965 2923 50  0000 C CNN
F 2 "" H 950 2750 50  0001 C CNN
F 3 "" H 950 2750 50  0001 C CNN
	1    950  2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BC4FA7F
P 950 2850
AR Path="/5CC0D65F/6BC4FA7F" Ref="C?"  Part="1" 
AR Path="/6BC4FA7F" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BC4FA7F" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BC4FA7F" Ref="C8"  Part="1" 
F 0 "C8" H 859 2896 50  0000 R CNN
F 1 "100nF" H 859 2805 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 2850 50  0001 C CNN
F 3 "~" H 950 2850 50  0001 C CNN
	1    950  2850
	1    0    0    -1  
$EndComp
Connection ~ 950  2750
Connection ~ 950  2950
$Comp
L alexios:74HC138 U?
U 2 1 6BC7BA02
P 1300 4200
AR Path="/5F3EA987/6BC7BA02" Ref="U?"  Part="1" 
AR Path="/6BC7BA02" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6BC7BA02" Ref="U7"  Part="2" 
AR Path="/61F95ACC/63C9F04D/6BC7BA02" Ref="U?"  Part="1" 
F 0 "U7" H 1200 4500 50  0000 L CNN
F 1 "74HC138" H 1150 3950 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 4200 50  0001 C CNN
	2    1300 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6BC7BA08
P 950 4300
AR Path="/6BC7BA08" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BC7BA08" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BC7BA08" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 950 4050 50  0001 C CNN
F 1 "GND" H 955 4127 50  0000 C CNN
F 2 "" H 950 4300 50  0001 C CNN
F 3 "" H 950 4300 50  0001 C CNN
	1    950  4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BC7BA0E
P 950 4100
AR Path="/6BC7BA0E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BC7BA0E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BC7BA0E" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 950 3950 50  0001 C CNN
F 1 "+5V" H 965 4273 50  0000 C CNN
F 2 "" H 950 4100 50  0001 C CNN
F 3 "" H 950 4100 50  0001 C CNN
	1    950  4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BC7BA14
P 950 4200
AR Path="/5CC0D65F/6BC7BA14" Ref="C?"  Part="1" 
AR Path="/6BC7BA14" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BC7BA14" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BC7BA14" Ref="C11"  Part="1" 
F 0 "C11" H 859 4246 50  0000 R CNN
F 1 "100nF" H 859 4155 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 4200 50  0001 C CNN
F 3 "~" H 950 4200 50  0001 C CNN
	1    950  4200
	1    0    0    -1  
$EndComp
Connection ~ 950  4100
Connection ~ 950  4300
$Comp
L alexios:74HC138 U?
U 2 1 6BCA7949
P 1300 5550
AR Path="/5F3EA987/6BCA7949" Ref="U?"  Part="1" 
AR Path="/6BCA7949" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6BCA7949" Ref="U17"  Part="2" 
AR Path="/61F95ACC/63C9F04D/6BCA7949" Ref="U?"  Part="1" 
F 0 "U17" H 1200 5850 50  0000 L CNN
F 1 "74HC138" H 1150 5300 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1300 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1300 5550 50  0001 C CNN
	2    1300 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6BCA794F
P 950 5650
AR Path="/6BCA794F" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BCA794F" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BCA794F" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 950 5400 50  0001 C CNN
F 1 "GND" H 955 5477 50  0000 C CNN
F 2 "" H 950 5650 50  0001 C CNN
F 3 "" H 950 5650 50  0001 C CNN
	1    950  5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BCA7955
P 950 5450
AR Path="/6BCA7955" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BCA7955" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BCA7955" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 950 5300 50  0001 C CNN
F 1 "+5V" H 965 5623 50  0000 C CNN
F 2 "" H 950 5450 50  0001 C CNN
F 3 "" H 950 5450 50  0001 C CNN
	1    950  5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BCA795B
P 950 5550
AR Path="/5CC0D65F/6BCA795B" Ref="C?"  Part="1" 
AR Path="/6BCA795B" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BCA795B" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BCA795B" Ref="C13"  Part="1" 
F 0 "C13" H 859 5596 50  0000 R CNN
F 1 "100nF" H 859 5505 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 5550 50  0001 C CNN
F 3 "~" H 950 5550 50  0001 C CNN
	1    950  5550
	1    0    0    -1  
$EndComp
Connection ~ 950  5450
Connection ~ 950  5650
$Comp
L power:GND #PWR?
U 1 1 6BCD4C82
P 7950 6400
AR Path="/6BCD4C82" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BCD4C82" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BCD4C82" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 7950 6150 50  0001 C CNN
F 1 "GND" H 7955 6227 50  0000 C CNN
F 2 "" H 7950 6400 50  0001 C CNN
F 3 "" H 7950 6400 50  0001 C CNN
	1    7950 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BCD4C88
P 7950 6200
AR Path="/6BCD4C88" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BCD4C88" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BCD4C88" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7950 6050 50  0001 C CNN
F 1 "+5V" H 7965 6373 50  0000 C CNN
F 2 "" H 7950 6200 50  0001 C CNN
F 3 "" H 7950 6200 50  0001 C CNN
	1    7950 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BCD4C8E
P 7950 6300
AR Path="/5CC0D65F/6BCD4C8E" Ref="C?"  Part="1" 
AR Path="/6BCD4C8E" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BCD4C8E" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BCD4C8E" Ref="C14"  Part="1" 
F 0 "C14" H 7859 6346 50  0000 R CNN
F 1 "100nF" H 7859 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7950 6300 50  0001 C CNN
F 3 "~" H 7950 6300 50  0001 C CNN
	1    7950 6300
	1    0    0    -1  
$EndComp
Connection ~ 7950 6400
Connection ~ 7950 6200
$Comp
L power:GND #PWR?
U 1 1 6BD037BD
P 9300 3050
AR Path="/6BD037BD" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD037BD" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD037BD" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 9300 2800 50  0001 C CNN
F 1 "GND" H 9305 2877 50  0000 C CNN
F 2 "" H 9300 3050 50  0001 C CNN
F 3 "" H 9300 3050 50  0001 C CNN
	1    9300 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BD037C3
P 9300 2850
AR Path="/6BD037C3" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD037C3" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD037C3" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 9300 2700 50  0001 C CNN
F 1 "+5V" H 9315 3023 50  0000 C CNN
F 2 "" H 9300 2850 50  0001 C CNN
F 3 "" H 9300 2850 50  0001 C CNN
	1    9300 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BD037C9
P 9300 2950
AR Path="/5CC0D65F/6BD037C9" Ref="C?"  Part="1" 
AR Path="/6BD037C9" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BD037C9" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BD037C9" Ref="C10"  Part="1" 
F 0 "C10" H 9209 2996 50  0000 R CNN
F 1 "100nF" H 9209 2905 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 2950 50  0001 C CNN
F 3 "~" H 9300 2950 50  0001 C CNN
	1    9300 2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U4
U 2 1 6BD2E486
P 9650 2950
F 0 "U4" H 9830 2996 50  0000 L CNN
F 1 "74HC541" H 9830 2905 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 9650 2950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9650 2950 50  0001 C CNN
	2    9650 2950
	1    0    0    -1  
$EndComp
Connection ~ 9300 3050
Connection ~ 9300 2850
$Comp
L power:GND #PWR?
U 1 1 6BD5B1A0
P 9300 5250
AR Path="/6BD5B1A0" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD5B1A0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD5B1A0" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 9300 5000 50  0001 C CNN
F 1 "GND" H 9305 5077 50  0000 C CNN
F 2 "" H 9300 5250 50  0001 C CNN
F 3 "" H 9300 5250 50  0001 C CNN
	1    9300 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BD5B1A6
P 9300 5050
AR Path="/6BD5B1A6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD5B1A6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD5B1A6" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 9300 4900 50  0001 C CNN
F 1 "+5V" H 9315 5223 50  0000 C CNN
F 2 "" H 9300 5050 50  0001 C CNN
F 3 "" H 9300 5050 50  0001 C CNN
	1    9300 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BD5B1AC
P 9300 5150
AR Path="/5CC0D65F/6BD5B1AC" Ref="C?"  Part="1" 
AR Path="/6BD5B1AC" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BD5B1AC" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BD5B1AC" Ref="C12"  Part="1" 
F 0 "C12" H 9209 5196 50  0000 R CNN
F 1 "100nF" H 9209 5105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 5150 50  0001 C CNN
F 3 "~" H 9300 5150 50  0001 C CNN
	1    9300 5150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U19
U 2 1 6BD5B1B2
P 9650 5150
F 0 "U19" H 9830 5196 50  0000 L CNN
F 1 "74HC541" H 9830 5105 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 9650 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 9650 5150 50  0001 C CNN
	2    9650 5150
	1    0    0    -1  
$EndComp
Connection ~ 9300 5250
Connection ~ 9300 5050
$Comp
L alexios:74LVC1G04 U6
U 2 1 6BD8628D
P 9650 6300
F 0 "U6" H 9830 6346 50  0000 L CNN
F 1 "74LVC1G04" H 9830 6255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9650 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 9650 6300 50  0001 C CNN
	2    9650 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6BD8975E
P 9300 6400
AR Path="/6BD8975E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD8975E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD8975E" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 9300 6150 50  0001 C CNN
F 1 "GND" H 9305 6227 50  0000 C CNN
F 2 "" H 9300 6400 50  0001 C CNN
F 3 "" H 9300 6400 50  0001 C CNN
	1    9300 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6BD89764
P 9300 6200
AR Path="/6BD89764" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/6BD89764" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/6BD89764" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 9300 6050 50  0001 C CNN
F 1 "+5V" H 9315 6373 50  0000 C CNN
F 2 "" H 9300 6200 50  0001 C CNN
F 3 "" H 9300 6200 50  0001 C CNN
	1    9300 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6BD8976A
P 9300 6300
AR Path="/5CC0D65F/6BD8976A" Ref="C?"  Part="1" 
AR Path="/6BD8976A" Ref="C?"  Part="1" 
AR Path="/5F3EA987/6BD8976A" Ref="C?"  Part="1" 
AR Path="/61F95ACC/6BD8976A" Ref="C15"  Part="1" 
F 0 "C15" H 9209 6346 50  0000 R CNN
F 1 "100nF" H 9209 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 6300 50  0001 C CNN
F 3 "~" H 9300 6300 50  0001 C CNN
	1    9300 6300
	1    0    0    -1  
$EndComp
Connection ~ 9300 6400
Connection ~ 9300 6200
Text Label 4800 2600 0    50   ~ 0
~IOMBR
Text Notes 7150 900  0    100  ~ 20
Register File
Text Notes 9100 900  0    100  ~ 20
Bus Drivers
Text Notes 5300 1900 0    100  ~ 20
Address\nSelection
Wire Wire Line
	3600 5200 3600 4550
Wire Wire Line
	3600 4550 4700 4550
Connection ~ 3600 5200
Wire Wire Line
	3600 5200 3800 5200
Wire Notes Line width 20 style solid
	7350 5550 7350 4900
Wire Wire Line
	1750 7250 2100 7250
Wire Wire Line
	6450 3600 6800 3600
Text Label 6800 3600 2    50   ~ 0
~IOWMBR
Wire Notes Line width 20 style solid
	5700 4900 5700 5550
Wire Notes Line width 20 style solid
	7350 5550 5700 5550
Wire Notes Line width 20 style solid
	5700 4900 7350 4900
Text Notes 5800 5400 0    50   ~ 0
Signals IBUS[8..15] are intentionally\nnot driven here! They are handled by\nthe flag unit.
Text Notes 5800 5100 0    50   ~ 10
Note
Entry Bus Bus
	8600 5550 8700 5650
Wire Bus Line
	8700 5650 10650 5650
Text HLabel 10650 5650 2    50   Output ~ 0
AEXT[0..7]
Text Label 10550 5650 2    50   ~ 0
AEXT[0..7]
Wire Wire Line
	9000 4500 8750 4500
Text Label 8750 4500 0    50   ~ 0
~R
$Comp
L alexios:74LVC1G74 U?
U 2 1 6BCFEA5B
P 8300 6300
AR Path="/6005A9A5/6BCFEA5B" Ref="U?"  Part="1" 
AR Path="/61F95ACC/6BCFEA5B" Ref="U8"  Part="2" 
F 0 "U8" H 8480 6346 50  0000 L CNN
F 1 "74LVC1G74" H 8480 6255 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 8750 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 8750 6300 50  0001 C CNN
	2    8300 6300
	1    0    0    -1  
$EndComp
Text HLabel 1250 950  0    50   Input ~ 0
~R
Wire Wire Line
	1250 950  1600 950 
Text Label 1600 950  2    50   ~ 0
~R
Wire Wire Line
	4050 3100 5300 3100
Wire Wire Line
	5300 3500 4500 3500
Text HLabel 4500 3500 0    50   Input ~ 0
IR2
Text Label 4800 3500 0    50   ~ 0
IR2
Wire Wire Line
	3100 3100 3550 3100
Wire Wire Line
	5300 3200 4800 3200
Text Label 4800 3200 0    50   ~ 0
~T34
Text Label 6100 4300 2    50   ~ 0
~FPRAM~∕ROM
Text Label 4800 2200 0    50   ~ 0
~RESET
Text Notes 1900 6550 0    50   ~ 0
The MBU is disabled after reset and enabled\nwhen it's first written to.
Wire Wire Line
	2050 7050 2050 6850
Wire Wire Line
	2050 7150 2050 7050
Connection ~ 2050 7050
Wire Wire Line
	2100 7050 2050 7050
Wire Wire Line
	4750 2200 4750 700 
Wire Wire Line
	4750 700  1250 700 
Wire Wire Line
	4750 2200 5300 2200
Text HLabel 1250 700  0    50   Input ~ 0
~RESET
Wire Wire Line
	1800 3200 2100 3200
NoConn ~ 3100 3200
Wire Wire Line
	1550 4650 2100 4650
Text Label 2100 4650 2    50   ~ 0
~T34
Wire Wire Line
	1550 3400 1550 4650
Connection ~ 1550 3400
Wire Wire Line
	1550 3400 2100 3400
Wire Bus Line
	1700 1150 1700 1950
Wire Bus Line
	1700 2350 1700 3200
Wire Bus Line
	1700 3600 1700 5200
Wire Bus Line
	6450 1150 6450 2000
Wire Bus Line
	10400 1150 10400 2000
Wire Bus Line
	10400 3600 10400 4750
Wire Bus Line
	8600 1500 8600 5550
$EndSCHEMATC
