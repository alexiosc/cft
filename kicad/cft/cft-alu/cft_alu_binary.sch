EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 37
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
L power:+5V #PWR?
U 1 1 6045D9FC
P 10250 4200
AR Path="/6045D9FC" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045D9FC" Ref="#PWR01218"  Part="1" 
F 0 "#PWR01218" H 10250 4050 50  0001 C CNN
F 1 "+5V" H 10265 4373 50  0000 C CNN
F 2 "" H 10250 4200 50  0001 C CNN
F 3 "" H 10250 4200 50  0001 C CNN
	1    10250 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6045DA02
P 10250 3450
AR Path="/6045DA02" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA02" Ref="#PWR01216"  Part="1" 
F 0 "#PWR01216" H 10250 3300 50  0001 C CNN
F 1 "+5V" H 10265 3623 50  0000 C CNN
F 2 "" H 10250 3450 50  0001 C CNN
F 3 "" H 10250 3450 50  0001 C CNN
	1    10250 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6045DA08
P 10250 3650
AR Path="/6045DA08" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA08" Ref="#PWR01217"  Part="1" 
F 0 "#PWR01217" H 10250 3400 50  0001 C CNN
F 1 "GND" H 10255 3477 50  0000 C CNN
F 2 "" H 10250 3650 50  0001 C CNN
F 3 "" H 10250 3650 50  0001 C CNN
	1    10250 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6045DA0E
P 10250 4400
AR Path="/6045DA0E" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA0E" Ref="#PWR01219"  Part="1" 
F 0 "#PWR01219" H 10250 4150 50  0001 C CNN
F 1 "GND" H 10255 4227 50  0000 C CNN
F 2 "" H 10250 4400 50  0001 C CNN
F 3 "" H 10250 4400 50  0001 C CNN
	1    10250 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6045DA14
P 10250 4300
AR Path="/5CC0D65F/6045DA14" Ref="C?"  Part="1" 
AR Path="/6045DA14" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA14" Ref="C1208"  Part="1" 
F 0 "C1208" H 10159 4346 50  0000 R CNN
F 1 "100nF" H 10159 4255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10250 4300 50  0001 C CNN
F 3 "~" H 10250 4300 50  0001 C CNN
	1    10250 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6045DA1A
P 10250 3550
AR Path="/5CC0D65F/6045DA1A" Ref="C?"  Part="1" 
AR Path="/6045DA1A" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA1A" Ref="C1207"  Part="1" 
F 0 "C1207" H 10159 3596 50  0000 R CNN
F 1 "100nF" H 10159 3505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10250 3550 50  0001 C CNN
F 3 "~" H 10250 3550 50  0001 C CNN
	1    10250 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6045DA20
P 9850 2800
AR Path="/5CC0D65F/6045DA20" Ref="C?"  Part="1" 
AR Path="/6045DA20" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA20" Ref="C1203"  Part="1" 
F 0 "C1203" H 9759 2846 50  0000 R CNN
F 1 "1µF" H 9759 2755 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 2800 50  0001 C CNN
F 3 "~" H 9850 2800 50  0001 C CNN
	1    9850 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6045DA26
P 9850 2050
AR Path="/5CC0D65F/6045DA26" Ref="C?"  Part="1" 
AR Path="/6045DA26" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA26" Ref="C1202"  Part="1" 
F 0 "C1202" H 9759 2096 50  0000 R CNN
F 1 "1µF" H 9759 2005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 2050 50  0001 C CNN
F 3 "~" H 9850 2050 50  0001 C CNN
	1    9850 2050
	1    0    0    -1  
$EndComp
Connection ~ 10250 4400
Connection ~ 10250 4200
$Comp
L alexios:74HC74 U?
U 3 1 6045DA2E
P 10600 4300
AR Path="/6045DA2E" Ref="U?"  Part="3" 
AR Path="/60413270/6045DA2E" Ref="U1203"  Part="3" 
F 0 "U1203" H 10780 4346 50  0000 L CNN
F 1 "74HC74" H 10780 4255 50  0000 L CNN
F 2 "" H 10550 4300 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 10550 4300 50  0001 C CNN
	3    10600 4300
	1    0    0    -1  
$EndComp
Connection ~ 10250 3650
Connection ~ 10250 3450
$Comp
L alexios:74HC253 U?
U 2 1 6045DA36
P 10600 4150
AR Path="/6045DA36" Ref="U?"  Part="2" 
AR Path="/60413270/6045DA36" Ref="U1201"  Part="2" 
F 0 "U1201" H 10780 4796 50  0000 L CNN
F 1 "74HC253" H 10780 4705 50  0000 L CNN
F 2 "" H 10900 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS253" H 10900 4750 50  0001 C CNN
	2    10600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2700 10250 2700
$Comp
L power:+5V #PWR?
U 1 1 6045DA3D
P 10050 2700
AR Path="/6045DA3D" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA3D" Ref="#PWR01214"  Part="1" 
F 0 "#PWR01214" H 10050 2550 50  0001 C CNN
F 1 "+5V" H 10065 2873 50  0000 C CNN
F 2 "" H 10050 2700 50  0001 C CNN
F 3 "" H 10050 2700 50  0001 C CNN
	1    10050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2900 10250 2900
$Comp
L power:GND #PWR?
U 1 1 6045DA44
P 10050 2900
AR Path="/6045DA44" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA44" Ref="#PWR01215"  Part="1" 
F 0 "#PWR01215" H 10050 2650 50  0001 C CNN
F 1 "GND" H 10055 2727 50  0000 C CNN
F 2 "" H 10050 2900 50  0001 C CNN
F 3 "" H 10050 2900 50  0001 C CNN
	1    10050 2900
	1    0    0    -1  
$EndComp
Connection ~ 10050 2900
Wire Wire Line
	9850 2900 10050 2900
Connection ~ 10050 2700
Wire Wire Line
	9850 2700 10050 2700
$Comp
L Device:C_Small C?
U 1 1 6045DA4E
P 10250 2800
AR Path="/5CC0D65F/6045DA4E" Ref="C?"  Part="1" 
AR Path="/6045DA4E" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA4E" Ref="C1206"  Part="1" 
F 0 "C1206" H 10159 2846 50  0000 R CNN
F 1 "100nF" H 10159 2755 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10250 2800 50  0001 C CNN
F 3 "~" H 10250 2800 50  0001 C CNN
	1    10250 2800
	1    0    0    -1  
$EndComp
Connection ~ 10250 2700
Connection ~ 10250 2900
$Comp
L alexios:29F040 U?
U 2 1 6045DA56
P 10600 3550
AR Path="/5DEAC282/6045DA56" Ref="U?"  Part="1" 
AR Path="/6045DA56" Ref="U?"  Part="2" 
AR Path="/60413270/6045DA56" Ref="U1205"  Part="2" 
F 0 "U1205" H 10780 4346 50  0000 L CNN
F 1 "29F040" H 10780 4255 50  0000 L CNN
F 2 "" H 10600 3550 50  0001 C CNN
F 3 "" H 10600 3550 50  0001 C CNN
	2    10600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1950 10250 1950
$Comp
L power:+5V #PWR?
U 1 1 6045DA5D
P 10050 1950
AR Path="/6045DA5D" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA5D" Ref="#PWR01212"  Part="1" 
F 0 "#PWR01212" H 10050 1800 50  0001 C CNN
F 1 "+5V" H 10065 2123 50  0000 C CNN
F 2 "" H 10050 1950 50  0001 C CNN
F 3 "" H 10050 1950 50  0001 C CNN
	1    10050 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2150 10250 2150
$Comp
L power:GND #PWR?
U 1 1 6045DA64
P 10050 2150
AR Path="/6045DA64" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA64" Ref="#PWR01213"  Part="1" 
F 0 "#PWR01213" H 10050 1900 50  0001 C CNN
F 1 "GND" H 10055 1977 50  0000 C CNN
F 2 "" H 10050 2150 50  0001 C CNN
F 3 "" H 10050 2150 50  0001 C CNN
	1    10050 2150
	1    0    0    -1  
$EndComp
Connection ~ 10050 2150
Wire Wire Line
	9850 2150 10050 2150
Connection ~ 10050 1950
Wire Wire Line
	9850 1950 10050 1950
$Comp
L Device:C_Small C?
U 1 1 6045DA6E
P 10250 2050
AR Path="/5CC0D65F/6045DA6E" Ref="C?"  Part="1" 
AR Path="/6045DA6E" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA6E" Ref="C1205"  Part="1" 
F 0 "C1205" H 10159 2096 50  0000 R CNN
F 1 "100nF" H 10159 2005 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10250 2050 50  0001 C CNN
F 3 "~" H 10250 2050 50  0001 C CNN
	1    10250 2050
	1    0    0    -1  
$EndComp
Connection ~ 10250 1950
Connection ~ 10250 2150
$Comp
L alexios:29F040 U?
U 2 1 6045DA76
P 10600 2800
AR Path="/5DEAC282/6045DA76" Ref="U?"  Part="1" 
AR Path="/6045DA76" Ref="U?"  Part="2" 
AR Path="/60413270/6045DA76" Ref="U1204"  Part="2" 
F 0 "U1204" H 10780 3596 50  0000 L CNN
F 1 "29F040" H 10780 3505 50  0000 L CNN
F 2 "" H 10600 2800 50  0001 C CNN
F 3 "" H 10600 2800 50  0001 C CNN
	2    10600 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1200 10250 1200
$Comp
L power:+5V #PWR?
U 1 1 6045DA7D
P 10050 1200
AR Path="/6045DA7D" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA7D" Ref="#PWR01210"  Part="1" 
F 0 "#PWR01210" H 10050 1050 50  0001 C CNN
F 1 "+5V" H 10065 1373 50  0000 C CNN
F 2 "" H 10050 1200 50  0001 C CNN
F 3 "" H 10050 1200 50  0001 C CNN
	1    10050 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1400 10250 1400
$Comp
L power:GND #PWR?
U 1 1 6045DA84
P 10050 1400
AR Path="/6045DA84" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DA84" Ref="#PWR01211"  Part="1" 
F 0 "#PWR01211" H 10050 1150 50  0001 C CNN
F 1 "GND" H 10055 1227 50  0000 C CNN
F 2 "" H 10050 1400 50  0001 C CNN
F 3 "" H 10050 1400 50  0001 C CNN
	1    10050 1400
	1    0    0    -1  
$EndComp
Connection ~ 10050 1400
Wire Wire Line
	9850 1400 10050 1400
Connection ~ 10050 1200
Wire Wire Line
	9850 1200 10050 1200
$Comp
L Device:C_Small C?
U 1 1 6045DA8E
P 9850 1300
AR Path="/5CC0D65F/6045DA8E" Ref="C?"  Part="1" 
AR Path="/6045DA8E" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA8E" Ref="C1201"  Part="1" 
F 0 "C1201" H 9759 1346 50  0000 R CNN
F 1 "1µF" H 9759 1255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 1300 50  0001 C CNN
F 3 "~" H 9850 1300 50  0001 C CNN
	1    9850 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6045DA94
P 10250 1300
AR Path="/5CC0D65F/6045DA94" Ref="C?"  Part="1" 
AR Path="/6045DA94" Ref="C?"  Part="1" 
AR Path="/60413270/6045DA94" Ref="C1204"  Part="1" 
F 0 "C1204" H 10159 1346 50  0000 R CNN
F 1 "100nF" H 10159 1255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10250 1300 50  0001 C CNN
F 3 "~" H 10250 1300 50  0001 C CNN
	1    10250 1300
	1    0    0    -1  
$EndComp
Connection ~ 10250 1200
Connection ~ 10250 1400
$Comp
L alexios:29F040 U?
U 2 1 6045DA9C
P 10600 2050
AR Path="/5DEAC282/6045DA9C" Ref="U?"  Part="1" 
AR Path="/6045DA9C" Ref="U?"  Part="2" 
AR Path="/60413270/6045DA9C" Ref="U1202"  Part="2" 
F 0 "U1202" H 10780 2846 50  0000 L CNN
F 1 "29F040" H 10780 2755 50  0000 L CNN
F 2 "" H 10600 2050 50  0001 C CNN
F 3 "" H 10600 2050 50  0001 C CNN
	2    10600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5050 1750 5050
$Comp
L alexios:74HC74 U?
U 1 1 6045DAA3
P 4300 6250
AR Path="/6045DAA3" Ref="U?"  Part="1" 
AR Path="/60413270/6045DAA3" Ref="U1203"  Part="1" 
F 0 "U1203" H 4600 5800 50  0000 C CNN
F 1 "74HC74" H 4650 5700 50  0000 C CNN
F 2 "" H 4250 6250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4250 6250 50  0001 C CNN
	1    4300 6250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 2 1 6045DAA9
P 4300 4950
AR Path="/6045DAA9" Ref="U?"  Part="2" 
AR Path="/60413270/6045DAA9" Ref="U1203"  Part="2" 
F 0 "U1203" H 4600 4500 50  0000 C CNN
F 1 "74HC74" H 4650 4400 50  0000 C CNN
F 2 "" H 4250 4950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 4250 4950 50  0001 C CNN
	2    4300 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6045DAAF
P 4900 4850
AR Path="/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5D54E677/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5F4B0011/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5F63066B/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5D30488D/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5D44ECB5/6045DAAF" Ref="R?"  Part="1" 
AR Path="/5D46B22D/6045DAAF" Ref="R?"  Part="1" 
AR Path="/60413270/6045DAAF" Ref="R1201"  Part="1" 
F 0 "R1201" V 4704 4850 50  0000 C CNN
F 1 "30Ω" V 4795 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4900 4850 50  0001 C CNN
F 3 "~" H 4900 4850 50  0001 C CNN
	1    4900 4850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6045DAB5
P 4350 4550
AR Path="/6045DAB5" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DAB5" Ref="#PWR01205"  Part="1" 
F 0 "#PWR01205" H 4350 4400 50  0001 C CNN
F 1 "+5V" H 4365 4723 50  0000 C CNN
F 2 "" H 4350 4550 50  0001 C CNN
F 3 "" H 4350 4550 50  0001 C CNN
	1    4350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4850 5100 4850
Text HLabel 5100 4850 2    50   Output ~ 0
FV
Text HLabel 5100 6150 2    50   Output ~ 0
~FLTADD
$Comp
L Device:R_Small R?
U 1 1 6045DABE
P 4900 6150
AR Path="/6045DABE" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/6045DABE" Ref="R?"  Part="1" 
AR Path="/5D54E677/6045DABE" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/6045DABE" Ref="R?"  Part="1" 
AR Path="/5F4B0011/6045DABE" Ref="R?"  Part="1" 
AR Path="/5F63066B/6045DABE" Ref="R?"  Part="1" 
AR Path="/5D30488D/6045DABE" Ref="R?"  Part="1" 
AR Path="/5D44ECB5/6045DABE" Ref="R?"  Part="1" 
AR Path="/5D46B22D/6045DABE" Ref="R?"  Part="1" 
AR Path="/60413270/6045DABE" Ref="R1202"  Part="1" 
F 0 "R1202" V 4704 6150 50  0000 C CNN
F 1 "30Ω" V 4795 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4900 6150 50  0001 C CNN
F 3 "~" H 4900 6150 50  0001 C CNN
	1    4900 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 6150 5100 6150
Wire Wire Line
	4350 5500 4350 5600
Wire Wire Line
	4350 6800 4350 6850
Wire Wire Line
	4350 6850 4200 6850
Wire Wire Line
	4200 6850 4200 6800
$Comp
L power:+5V #PWR?
U 1 1 6045DAC9
P 4200 6800
AR Path="/6045DAC9" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DAC9" Ref="#PWR01204"  Part="1" 
F 0 "#PWR01204" H 4200 6650 50  0001 C CNN
F 1 "+5V" H 4050 6850 50  0000 C CNN
F 2 "" H 4200 6800 50  0001 C CNN
F 3 "" H 4200 6800 50  0001 C CNN
	1    4200 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4850 3450 4850
Text Label 3450 4850 0    50   ~ 0
FVOUT
Wire Wire Line
	3850 6150 3450 6150
Text Label 3450 6150 0    50   ~ 0
~ALUCPL
Text Label 3450 5200 0    50   ~ 0
FLAGCLK
Text Label 3450 5600 0    50   ~ 0
~RESET
Text Label 3450 6500 0    50   ~ 0
FLAGCLK
Text Label 3450 5750 0    50   ~ 0
CLK3
Wire Wire Line
	4350 5850 4350 5750
Wire Wire Line
	3150 6500 3850 6500
Wire Wire Line
	3450 5750 4350 5750
Wire Wire Line
	4350 5600 3350 5600
Wire Wire Line
	3850 5200 3150 5200
NoConn ~ 4800 6500
NoConn ~ 4800 5200
$Comp
L alexios:74HC253 U?
U 1 1 6045DADE
P 2250 5550
AR Path="/6045DADE" Ref="U?"  Part="1" 
AR Path="/60413270/6045DADE" Ref="U1201"  Part="1" 
F 0 "U1201" H 2250 4550 50  0000 C CNN
F 1 "74HC253" H 2250 4450 50  0000 C CNN
F 2 "" H 2550 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS253" H 2550 6150 50  0001 C CNN
	1    2250 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 4850 1650 4950
$Comp
L power:GND #PWR?
U 1 1 6045DAE5
P 1650 6650
AR Path="/6045DAE5" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DAE5" Ref="#PWR01201"  Part="1" 
F 0 "#PWR01201" H 1650 6400 50  0001 C CNN
F 1 "GND" H 1655 6477 50  0000 C CNN
F 2 "" H 1650 6650 50  0001 C CNN
F 3 "" H 1650 6650 50  0001 C CNN
	1    1650 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4850 1650 4850
Wire Wire Line
	1750 4950 1650 4950
Connection ~ 1650 4950
Wire Wire Line
	1650 4950 1650 5150
Wire Wire Line
	1750 5150 1650 5150
Wire Wire Line
	1750 5550 1650 5550
Wire Wire Line
	1750 5650 1650 5650
Wire Wire Line
	1750 5750 1650 5750
Wire Wire Line
	1750 5850 1650 5850
Wire Wire Line
	1750 6250 1050 6250
Wire Wire Line
	1750 6350 1050 6350
Text HLabel 1050 5050 0    50   Input ~ 0
CLK3
Text HLabel 1050 6250 0    50   Input ~ 0
~BOE
Text Label 1050 6350 0    50   ~ 0
FLATCH
Text Label 1100 5050 0    50   ~ 0
CLK3
Wire Wire Line
	1750 6050 1650 6050
Connection ~ 1650 5150
Wire Wire Line
	1650 5150 1650 5350
Wire Wire Line
	1650 6050 1650 6650
Wire Wire Line
	1650 5550 1650 5650
Connection ~ 1650 5650
Wire Wire Line
	1650 5650 1650 5750
Connection ~ 1650 5750
Wire Wire Line
	1650 5750 1650 5850
Connection ~ 1650 6050
Connection ~ 1650 5850
Wire Wire Line
	1650 5850 1650 6050
Wire Wire Line
	1750 5350 1650 5350
Connection ~ 1650 5550
Connection ~ 1650 5350
Wire Wire Line
	1650 5350 1650 5550
NoConn ~ 2750 5550
Text Label 2750 4850 0    50   ~ 0
FLAGCLK
Wire Wire Line
	2750 4850 3150 4850
Wire Wire Line
	3150 4850 3150 5200
Text Label 2750 4650 0    50   ~ 0
~RESET
Text Label 1100 4650 0    50   ~ 0
~RESET
Wire Wire Line
	3350 4650 3350 5600
Wire Wire Line
	1050 4650 3350 4650
Text HLabel 1050 4650 0    50   Input ~ 0
~RESET
Connection ~ 3150 5200
Wire Wire Line
	3150 5200 3150 6500
Wire Wire Line
	8000 2050 8650 2050
Wire Wire Line
	8000 2150 8650 2150
Text HLabel 9100 4000 2    50   Output ~ 0
Y[0..15]
Wire Wire Line
	3650 2650 4450 2650
Entry Bus Bus
	6050 3900 6150 4000
Entry Bus Bus
	8400 3900 8500 4000
Text Label 8650 4000 0    50   ~ 0
Y[0..15]
Text Label 6800 4000 0    50   ~ 0
Y[0..15]
Text Label 4600 4000 0    50   ~ 0
Y[0..15]
Entry Bus Bus
	4050 800  4150 900 
Entry Bus Bus
	3900 1000 4000 1100
Entry Bus Bus
	6200 1000 6300 1100
Entry Bus Bus
	6350 800  6450 900 
$Comp
L alexios:29F040 U?
U 1 1 6045DB22
P 5100 2300
AR Path="/5DEAC282/6045DB22" Ref="U?"  Part="1" 
AR Path="/6045DB22" Ref="U?"  Part="1" 
AR Path="/60413270/6045DB22" Ref="U1204"  Part="1" 
F 0 "U1204" H 5075 3417 50  0000 C CNN
F 1 "29F040" H 5075 3326 50  0000 C CNN
F 2 "" H 5100 2300 50  0001 C CNN
F 3 "" H 5100 2300 50  0001 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
Text Notes 5000 3100 0    100  ~ 20
B01
$Comp
L alexios:29F040 U?
U 1 1 6045DB29
P 7400 2300
AR Path="/5DEAC282/6045DB29" Ref="U?"  Part="1" 
AR Path="/6045DB29" Ref="U?"  Part="1" 
AR Path="/60413270/6045DB29" Ref="U1205"  Part="1" 
F 0 "U1205" H 7375 3417 50  0000 C CNN
F 1 "29F040" H 7375 3326 50  0000 C CNN
F 2 "" H 7400 2300 50  0001 C CNN
F 3 "" H 7400 2300 50  0001 C CNN
	1    7400 2300
	1    0    0    -1  
$EndComp
Text Notes 7300 3100 0    100  ~ 20
B02
Wire Wire Line
	4450 1450 4250 1450
Wire Wire Line
	4450 1550 4250 1550
Wire Wire Line
	4450 1650 4250 1650
Wire Wire Line
	4450 1750 4250 1750
Wire Wire Line
	4450 1850 4250 1850
Wire Wire Line
	4450 1950 4250 1950
Wire Wire Line
	4450 2050 4100 2050
Wire Wire Line
	4450 2150 4100 2150
Wire Wire Line
	4450 2250 4100 2250
Wire Wire Line
	4450 2350 4100 2350
Wire Wire Line
	4450 2450 4100 2450
Wire Wire Line
	4450 2550 4100 2550
Wire Wire Line
	6750 1450 6550 1450
Wire Wire Line
	6750 1550 6550 1550
Wire Wire Line
	6750 1650 6550 1650
Wire Wire Line
	6750 1750 6550 1750
Wire Wire Line
	6750 1850 6400 1850
Text Label 4450 1450 2    50   ~ 0
B6
Text Label 4450 1550 2    50   ~ 0
B7
Text Label 4450 1650 2    50   ~ 0
B8
Text Label 4450 1750 2    50   ~ 0
B9
Text Label 4450 1850 2    50   ~ 0
B10
Text Label 4450 1950 2    50   ~ 0
B11
Text Label 4450 2050 2    50   ~ 0
A6
Text Label 4450 2150 2    50   ~ 0
A7
Text Label 4450 2250 2    50   ~ 0
A8
Text Label 4450 2350 2    50   ~ 0
A9
Text Label 4450 2650 2    50   ~ 0
CO1
Wire Wire Line
	5000 3650 5000 3750
Wire Wire Line
	5000 3750 5150 3750
Wire Wire Line
	5150 3650 5150 3750
Text Label 4450 2750 2    50   ~ 0
RUNIT0
Wire Wire Line
	4100 2750 4450 2750
Text Label 6750 1450 2    50   ~ 0
B12
Text Label 6750 1550 2    50   ~ 0
B13
Text Label 6750 1650 2    50   ~ 0
B14
Text Label 6750 1750 2    50   ~ 0
B15
Text Label 6750 1850 2    50   ~ 0
A12
Text Label 6750 1950 2    50   ~ 0
A13
Text Label 6750 2050 2    50   ~ 0
A14
Text Label 6750 2150 2    50   ~ 0
A15
Text Label 6750 2250 2    50   ~ 0
CO2
Text Label 6750 2350 2    50   ~ 0
RUNIT0
Text Label 6750 2450 2    50   ~ 0
RUNIT1
Wire Wire Line
	6400 2350 6750 2350
Wire Wire Line
	4350 3250 4350 3750
Wire Wire Line
	4450 3250 4350 3250
Connection ~ 4350 3250
Wire Wire Line
	4350 3150 4350 3250
Wire Wire Line
	4450 3150 4350 3150
Connection ~ 4350 3150
Wire Wire Line
	4350 3050 4350 3150
Wire Wire Line
	4450 3050 4350 3050
Connection ~ 4350 3050
Wire Wire Line
	4350 2950 4350 3050
Connection ~ 5000 3750
Wire Wire Line
	4350 3750 5000 3750
Wire Wire Line
	4450 2950 4350 2950
Wire Wire Line
	6650 3250 6650 3750
Wire Wire Line
	6750 3250 6650 3250
Connection ~ 6650 3250
Wire Wire Line
	6650 3150 6650 3250
Wire Wire Line
	6750 3150 6650 3150
Connection ~ 6650 3150
Wire Wire Line
	6650 3050 6650 3150
Wire Wire Line
	6750 3050 6650 3050
Connection ~ 6650 3050
Wire Wire Line
	6650 2950 6650 3050
Wire Wire Line
	6650 3750 7300 3750
Wire Wire Line
	6750 2950 6650 2950
Wire Wire Line
	6750 2550 6650 2550
Wire Wire Line
	6650 2550 6650 2650
Wire Wire Line
	6750 2650 6650 2650
Connection ~ 6650 2650
Wire Wire Line
	6650 2650 6650 2750
Wire Wire Line
	6750 2750 6650 2750
Connection ~ 6650 2750
Wire Wire Line
	6650 2750 6650 2850
Wire Wire Line
	6750 2850 6650 2850
Connection ~ 6650 2950
Connection ~ 6650 2850
Wire Wire Line
	6650 2850 6650 2950
Wire Wire Line
	7300 3650 7300 3750
Wire Wire Line
	7450 3650 7450 3750
Connection ~ 7300 3750
Wire Wire Line
	7300 3750 7450 3750
$Comp
L power:GND #PWR?
U 1 1 6045DB86
P 7450 3750
AR Path="/6045DB86" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DB86" Ref="#PWR01208"  Part="1" 
F 0 "#PWR01208" H 7450 3500 50  0001 C CNN
F 1 "GND" H 7455 3577 50  0000 C CNN
F 2 "" H 7450 3750 50  0001 C CNN
F 3 "" H 7450 3750 50  0001 C CNN
	1    7450 3750
	1    0    0    -1  
$EndComp
Connection ~ 7450 3750
Wire Wire Line
	5700 1450 5950 1450
Wire Wire Line
	5700 1550 5950 1550
Wire Wire Line
	5700 1650 5950 1650
Wire Wire Line
	5700 1750 5950 1750
Wire Wire Line
	5700 1850 5950 1850
Wire Wire Line
	5700 1950 5950 1950
Text Label 5750 1450 0    50   ~ 0
Y6
Text Label 5750 1550 0    50   ~ 0
Y7
Text Label 5750 1650 0    50   ~ 0
Y8
Text Label 5750 1750 0    50   ~ 0
Y9
Text Label 5750 1850 0    50   ~ 0
Y10
Text Label 5750 1950 0    50   ~ 0
Y11
Text Label 5750 2050 0    50   ~ 0
CO2
Text Label 8050 1450 0    50   ~ 0
Y12
Text Label 8050 1550 0    50   ~ 0
Y13
Text Label 8050 1650 0    50   ~ 0
Y14
Text Label 8050 1750 0    50   ~ 0
Y15
Entry Wire Line
	4150 1350 4250 1450
Entry Wire Line
	4150 1450 4250 1550
Entry Wire Line
	4150 1550 4250 1650
Entry Wire Line
	4150 1650 4250 1750
Entry Wire Line
	4150 1750 4250 1850
Entry Wire Line
	4150 1850 4250 1950
Entry Wire Line
	4000 1950 4100 2050
Entry Wire Line
	4000 2050 4100 2150
Entry Wire Line
	4000 2150 4100 2250
Entry Wire Line
	4000 2250 4100 2350
Entry Wire Line
	4000 2350 4100 2450
Entry Wire Line
	4000 2450 4100 2550
Entry Wire Line
	6450 1350 6550 1450
Entry Wire Line
	6450 1450 6550 1550
Entry Wire Line
	6450 1550 6550 1650
Entry Wire Line
	6450 1650 6550 1750
Entry Wire Line
	6300 1750 6400 1850
Entry Wire Line
	6300 1950 6400 2050
Entry Wire Line
	6300 2050 6400 2150
Entry Wire Line
	5950 1450 6050 1550
Entry Wire Line
	5950 1550 6050 1650
Entry Wire Line
	5950 1650 6050 1750
Entry Wire Line
	5950 1750 6050 1850
Entry Wire Line
	5950 1850 6050 1950
Entry Wire Line
	5950 1950 6050 2050
Wire Wire Line
	5950 2250 6750 2250
Wire Wire Line
	5700 2050 5950 2050
Text Label 4000 1700 1    50   ~ 0
A[0..15]
Text Label 4150 1700 1    50   ~ 0
B[0..15]
Text Label 6300 1600 1    50   ~ 0
A[0..15]
Text Label 6450 1600 1    50   ~ 0
B[0..15]
Wire Wire Line
	5950 2050 5950 2250
Wire Wire Line
	6750 1950 6400 1950
Entry Wire Line
	6300 1850 6400 1950
Wire Wire Line
	6400 2050 6750 2050
Wire Wire Line
	6400 2150 6750 2150
Text Label 5250 1000 2    50   ~ 0
A[0..15]
Text Label 4950 800  0    50   ~ 0
B[0..15]
$Comp
L power:+5V #PWR?
U 1 1 6045DBC4
P 5450 3650
AR Path="/6045DBC4" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DBC4" Ref="#PWR01207"  Part="1" 
F 0 "#PWR01207" H 5450 3500 50  0001 C CNN
F 1 "+5V" H 5465 3823 50  0000 C CNN
F 2 "" H 5450 3650 50  0001 C CNN
F 3 "" H 5450 3650 50  0001 C CNN
	1    5450 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6045DBCA
P 7750 3650
AR Path="/6045DBCA" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DBCA" Ref="#PWR01209"  Part="1" 
F 0 "#PWR01209" H 7750 3500 50  0001 C CNN
F 1 "+5V" H 7765 3823 50  0000 C CNN
F 2 "" H 7750 3650 50  0001 C CNN
F 3 "" H 7750 3650 50  0001 C CNN
	1    7750 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3650 7600 3650
Wire Wire Line
	5450 3650 5300 3650
Connection ~ 5150 3750
$Comp
L power:GND #PWR?
U 1 1 6045DBD3
P 5150 3750
AR Path="/6045DBD3" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DBD3" Ref="#PWR01206"  Part="1" 
F 0 "#PWR01206" H 5150 3500 50  0001 C CNN
F 1 "GND" H 5155 3577 50  0000 C CNN
F 2 "" H 5150 3750 50  0001 C CNN
F 3 "" H 5150 3750 50  0001 C CNN
	1    5150 3750
	1    0    0    -1  
$EndComp
Entry Wire Line
	4100 2750 4000 2850
Entry Wire Line
	4100 2850 4000 2950
Entry Wire Line
	6400 2350 6300 2450
Entry Wire Line
	6400 2450 6300 2550
Wire Wire Line
	6400 2450 6750 2450
Entry Bus Bus
	6200 4200 6300 4100
Entry Bus Bus
	3900 4200 4000 4100
Text Label 6300 3350 1    50   ~ 0
Y[0..15]
Text Label 4000 3350 1    50   ~ 0
RUNIT[0..1]
Text Label 6050 3350 1    50   ~ 0
RUNIT[0..1]
Text Label 4600 4200 0    50   ~ 0
RUNIT[0..1]
Text Label 8050 2150 0    50   ~ 0
FVOUT
Text Label 8650 2150 0    50   ~ 0
FVOUT
Text Label 8650 2050 0    50   ~ 0
~ALUCPL
Text Label 8650 1950 0    50   ~ 0
FLATCH
Text Label 8400 3350 1    50   ~ 0
Y[0..15]
Entry Wire Line
	8300 1750 8400 1850
Entry Wire Line
	8300 1650 8400 1750
Entry Wire Line
	8300 1550 8400 1650
Entry Wire Line
	8300 1450 8400 1550
Text Label 8050 2050 0    50   ~ 0
~ALUCPL
Text Label 8050 1950 0    50   ~ 0
FLATCH
Wire Wire Line
	8000 1950 8650 1950
Wire Wire Line
	8000 1750 8300 1750
Wire Wire Line
	8000 1650 8300 1650
Wire Wire Line
	8000 1550 8300 1550
Wire Wire Line
	8000 1450 8300 1450
Text Label 4450 2850 2    50   ~ 0
RUNIT1
Wire Wire Line
	4100 2850 4450 2850
Text Label 4450 2550 2    50   ~ 0
A11
Text Label 4450 2450 2    50   ~ 0
A10
NoConn ~ 5700 2150
NoConn ~ 8000 1850
Text Label 1150 4200 0    50   ~ 0
RUNIT[0..1]
Text Label 1150 2650 0    50   ~ 0
FL
Text Label 3000 4200 2    50   ~ 0
RUNIT[0..1]
Text Label 1750 3350 1    50   ~ 0
RUNIT[0..1]
Text Label 3750 3350 1    50   ~ 0
Y[0..15]
Entry Bus Bus
	1650 4200 1750 4100
Text HLabel 1050 4200 0    50   Input ~ 0
RUNIT[0..1]
Entry Wire Line
	1850 2850 1750 2950
Entry Wire Line
	1850 2750 1750 2850
Text HLabel 1050 2650 0    50   Input ~ 0
FL
Wire Wire Line
	1050 2650 2150 2650
$Comp
L power:GND #PWR?
U 1 1 6045DC05
P 2850 3750
AR Path="/6045DC05" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DC05" Ref="#PWR01202"  Part="1" 
F 0 "#PWR01202" H 2850 3500 50  0001 C CNN
F 1 "GND" H 2855 3577 50  0000 C CNN
F 2 "" H 2850 3750 50  0001 C CNN
F 3 "" H 2850 3750 50  0001 C CNN
	1    2850 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6045DC0B
P 3150 3650
AR Path="/6045DC0B" Ref="#PWR?"  Part="1" 
AR Path="/60413270/6045DC0B" Ref="#PWR01203"  Part="1" 
F 0 "#PWR01203" H 3150 3500 50  0001 C CNN
F 1 "+5V" H 3165 3823 50  0000 C CNN
F 2 "" H 3150 3650 50  0001 C CNN
F 3 "" H 3150 3650 50  0001 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3650 3150 3650
Entry Bus Bus
	3750 3900 3850 4000
Text HLabel 1050 1000 0    50   Input ~ 0
A[0..15]
Text HLabel 1050 800  0    50   Input ~ 0
B[0..15]
Text Label 1150 800  0    50   ~ 0
B[0..15]
Text Label 2600 800  0    50   ~ 0
B[0..15]
Text Label 2900 1000 2    50   ~ 0
A[0..15]
Text Label 1450 1000 2    50   ~ 0
A[0..15]
Entry Wire Line
	1900 1350 2000 1450
Entry Wire Line
	1900 1450 2000 1550
Entry Wire Line
	1900 1550 2000 1650
Entry Wire Line
	1900 1650 2000 1750
Entry Wire Line
	1900 1750 2000 1850
Entry Wire Line
	1900 1850 2000 1950
Entry Wire Line
	1750 1950 1850 2050
Entry Wire Line
	1750 2050 1850 2150
Entry Wire Line
	1750 2150 1850 2250
Entry Wire Line
	1750 2250 1850 2350
Entry Wire Line
	1750 2350 1850 2450
Entry Wire Line
	1750 2450 1850 2550
Entry Bus Bus
	1800 800  1900 900 
Entry Bus Bus
	1650 1000 1750 1100
Text Label 1900 1700 1    50   ~ 0
B[0..15]
Text Label 1750 1700 1    50   ~ 0
A[0..15]
Wire Wire Line
	2150 2050 1850 2050
Wire Wire Line
	2150 2150 1850 2150
Wire Wire Line
	2150 2250 1850 2250
Wire Wire Line
	2150 2350 1850 2350
Wire Wire Line
	2150 2450 1850 2450
Wire Wire Line
	2150 2550 1850 2550
Wire Wire Line
	3650 2050 3650 2650
Entry Wire Line
	3650 1950 3750 2050
Entry Wire Line
	3650 1850 3750 1950
Entry Wire Line
	3650 1750 3750 1850
Entry Wire Line
	3650 1650 3750 1750
Entry Wire Line
	3650 1550 3750 1650
Entry Wire Line
	3650 1450 3750 1550
NoConn ~ 3400 2150
Text Label 3450 2050 0    50   ~ 0
CO1
Text Label 3450 1950 0    50   ~ 0
Y5
Text Label 3450 1850 0    50   ~ 0
Y4
Text Label 3450 1750 0    50   ~ 0
Y3
Text Label 3450 1650 0    50   ~ 0
Y2
Text Label 3450 1550 0    50   ~ 0
Y1
Text Label 3450 1450 0    50   ~ 0
Y0
Wire Wire Line
	3400 2050 3650 2050
Wire Wire Line
	3400 1950 3650 1950
Wire Wire Line
	3400 1850 3650 1850
Wire Wire Line
	3400 1750 3650 1750
Wire Wire Line
	3400 1650 3650 1650
Wire Wire Line
	3400 1550 3650 1550
Wire Wire Line
	3400 1450 3650 1450
Wire Wire Line
	2850 3650 2850 3750
Connection ~ 2850 3750
Wire Wire Line
	2700 3750 2850 3750
Wire Wire Line
	2700 3650 2700 3750
Wire Wire Line
	2050 3250 2050 3750
Wire Wire Line
	2150 3250 2050 3250
Connection ~ 2050 3250
Wire Wire Line
	2050 3150 2050 3250
Wire Wire Line
	2150 3150 2050 3150
Connection ~ 2050 3150
Wire Wire Line
	2050 3050 2050 3150
Wire Wire Line
	2150 3050 2050 3050
Connection ~ 2050 3050
Wire Wire Line
	2050 2950 2050 3050
Connection ~ 2700 3750
Wire Wire Line
	2050 3750 2700 3750
Wire Wire Line
	2150 2950 2050 2950
Wire Wire Line
	1850 2850 2150 2850
Wire Wire Line
	1850 2750 2150 2750
Text Label 2150 2850 2    50   ~ 0
RUNIT1
Text Label 2150 2750 2    50   ~ 0
RUNIT0
Text Label 2150 2650 2    50   ~ 0
FL
Text Label 2150 2550 2    50   ~ 0
A5
Text Label 2150 2450 2    50   ~ 0
A4
Text Label 2150 2350 2    50   ~ 0
A3
Text Label 2150 2250 2    50   ~ 0
A2
Text Label 2150 2150 2    50   ~ 0
A1
Text Label 2150 2050 2    50   ~ 0
A0
Text Label 2150 1950 2    50   ~ 0
B5
Text Label 2150 1850 2    50   ~ 0
B4
Text Label 2150 1750 2    50   ~ 0
B3
Text Label 2150 1650 2    50   ~ 0
B2
Text Label 2150 1550 2    50   ~ 0
B1
Text Label 2150 1450 2    50   ~ 0
B0
Wire Wire Line
	2150 1950 2000 1950
Wire Wire Line
	2150 1850 2000 1850
Wire Wire Line
	2150 1750 2000 1750
Wire Wire Line
	2150 1650 2000 1650
Wire Wire Line
	2150 1550 2000 1550
Wire Wire Line
	2150 1450 2000 1450
Text Notes 2700 3100 0    100  ~ 20
B01
$Comp
L alexios:29F040 U?
U 1 1 6045DC6E
P 2800 2300
AR Path="/5DEAC282/6045DC6E" Ref="U?"  Part="1" 
AR Path="/6045DC6E" Ref="U?"  Part="1" 
AR Path="/60413270/6045DC6E" Ref="U1202"  Part="1" 
F 0 "U1202" H 2775 3417 50  0000 C CNN
F 1 "29F040" H 2775 3326 50  0000 C CNN
F 2 "" H 2800 2300 50  0001 C CNN
F 3 "" H 2800 2300 50  0001 C CNN
	1    2800 2300
	1    0    0    -1  
$EndComp
Text Notes 7100 7000 0    197  ~ 39
ALU Binary Ops & Flags
Wire Bus Line
	1750 2850 1750 4100
Wire Bus Line
	6300 2450 6300 4100
Wire Bus Line
	4000 2850 4000 4100
Wire Bus Line
	3850 4000 9100 4000
Wire Bus Line
	1100 800  6350 800 
Wire Bus Line
	1100 1000 6200 1000
Wire Bus Line
	1050 4200 6200 4200
Wire Bus Line
	8400 1550 8400 3900
Wire Bus Line
	6300 1100 6300 2050
Wire Bus Line
	6450 900  6450 1650
Wire Bus Line
	4150 900  4150 1850
Wire Bus Line
	4000 1100 4000 2450
Wire Bus Line
	6050 1550 6050 3900
Wire Bus Line
	1900 900  1900 1850
Wire Bus Line
	1750 1100 1750 2450
Wire Bus Line
	3750 1550 3750 3900
$EndSCHEMATC
