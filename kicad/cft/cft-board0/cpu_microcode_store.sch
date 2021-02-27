EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
Title "Control Store (24×512k ROM)"
Date ""
Rev "2023"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "control_store.v"
$EndDescr
Wire Wire Line
	4050 3500 4400 3500
Text Notes 8600 1150 0    50   ~ 0
Microcode ROMs are wired as a 512K×24 bit\ntable, so all address lines are the same but\ndata out lines differ.
Wire Wire Line
	1450 6500 1350 6500
Connection ~ 1350 6500
Wire Wire Line
	1450 6700 1350 6700
Connection ~ 1350 6700
$Comp
L Device:C_Small C?
U 1 1 5E4A5D87
P 3350 6600
AR Path="/5CC0D65F/5E4A5D87" Ref="C?"  Part="1" 
AR Path="/5E4A5D87" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D87" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D87" Ref="C1705"  Part="1" 
F 0 "C1705" H 3259 6646 50  0000 R CNN
F 1 "100nF" H 3259 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 6600 50  0001 C CNN
F 3 "~" H 3350 6600 50  0001 C CNN
	1    3350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6500 3350 6500
Connection ~ 3350 6500
Wire Wire Line
	3350 6500 2950 6500
Wire Wire Line
	3450 6700 3350 6700
Connection ~ 3350 6700
Wire Wire Line
	3350 6700 2950 6700
$Comp
L Device:C_Small C?
U 1 1 5E4A5D93
P 2950 6600
AR Path="/5CC0D65F/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D93" Ref="C1704"  Part="1" 
F 0 "C1704" H 2859 6646 50  0000 R CNN
F 1 "10µF" H 2859 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2950 6600 50  0001 C CNN
F 3 "~" H 2950 6600 50  0001 C CNN
	1    2950 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4A5D99
P 5350 6600
AR Path="/5CC0D65F/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D99" Ref="C1707"  Part="1" 
F 0 "C1707" H 5259 6646 50  0000 R CNN
F 1 "100nF" H 5259 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 6600 50  0001 C CNN
F 3 "~" H 5350 6600 50  0001 C CNN
	1    5350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 6500 5350 6500
Connection ~ 5350 6500
Wire Wire Line
	5350 6500 4950 6500
Wire Wire Line
	5450 6700 5350 6700
Connection ~ 5350 6700
Wire Wire Line
	5350 6700 4950 6700
$Comp
L Device:C_Small C?
U 1 1 5E4A5DA5
P 4950 6600
AR Path="/5CC0D65F/5E4A5DA5" Ref="C?"  Part="1" 
AR Path="/5E4A5DA5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DA5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DA5" Ref="C1706"  Part="1" 
F 0 "C1706" H 4859 6646 50  0000 R CNN
F 1 "10µF" H 4859 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 6600 50  0001 C CNN
F 3 "~" H 4950 6600 50  0001 C CNN
	1    4950 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4A5DAB
P 1450 6700
AR Path="/5DEAC282/5E4A5DAB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DAB" Ref="#PWR01714"  Part="1" 
F 0 "#PWR01714" H 1450 6450 50  0001 C CNN
F 1 "GND" H 1455 6527 50  0000 C CNN
F 2 "" H 1450 6700 50  0001 C CNN
F 3 "" H 1450 6700 50  0001 C CNN
	1    1450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4A5DB2
P 3450 6700
AR Path="/5DEAC282/5E4A5DB2" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DB2" Ref="#PWR01715"  Part="1" 
F 0 "#PWR01715" H 3450 6450 50  0001 C CNN
F 1 "GND" H 3455 6527 50  0000 C CNN
F 2 "" H 3450 6700 50  0001 C CNN
F 3 "" H 3450 6700 50  0001 C CNN
	1    3450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4A5DB9
P 5450 6700
AR Path="/5DEAC282/5E4A5DB9" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DB9" Ref="#PWR01716"  Part="1" 
F 0 "#PWR01716" H 5450 6450 50  0001 C CNN
F 1 "GND" H 5455 6527 50  0000 C CNN
F 2 "" H 5450 6700 50  0001 C CNN
F 3 "" H 5450 6700 50  0001 C CNN
	1    5450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DC0
P 1450 6500
AR Path="/5DEAC282/5E4A5DC0" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DC0" Ref="#PWR01711"  Part="1" 
F 0 "#PWR01711" H 1450 6350 50  0001 C CNN
F 1 "+5V" H 1465 6673 50  0000 C CNN
F 2 "" H 1450 6500 50  0001 C CNN
F 3 "" H 1450 6500 50  0001 C CNN
	1    1450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DC7
P 3450 6500
AR Path="/5DEAC282/5E4A5DC7" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DC7" Ref="#PWR01712"  Part="1" 
F 0 "#PWR01712" H 3450 6350 50  0001 C CNN
F 1 "+5V" H 3465 6673 50  0000 C CNN
F 2 "" H 3450 6500 50  0001 C CNN
F 3 "" H 3450 6500 50  0001 C CNN
	1    3450 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DCE
P 5450 6500
AR Path="/5DEAC282/5E4A5DCE" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DCE" Ref="#PWR01713"  Part="1" 
F 0 "#PWR01713" H 5450 6350 50  0001 C CNN
F 1 "+5V" H 5465 6673 50  0000 C CNN
F 2 "" H 5450 6500 50  0001 C CNN
F 3 "" H 5450 6500 50  0001 C CNN
	1    5450 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4A5DD5
P 1350 6600
AR Path="/5CC0D65F/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DD5" Ref="C1703"  Part="1" 
F 0 "C1703" H 1259 6646 50  0000 R CNN
F 1 "100nF" H 1259 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1350 6600 50  0001 C CNN
F 3 "~" H 1350 6600 50  0001 C CNN
	1    1350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 6700 950  6700
Wire Wire Line
	1350 6500 950  6500
$Comp
L Device:C_Small C?
U 1 1 5E4A5DDD
P 950 6600
AR Path="/5CC0D65F/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DDD" Ref="C1702"  Part="1" 
F 0 "C1702" H 859 6646 50  0000 R CNN
F 1 "10µF" H 859 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6600 50  0001 C CNN
F 3 "~" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
Text Notes 8150 6600 0    50   ~ 0
Both micro-Address Vector and micro-Control Vector have changed\nsignificantly in this version. Fields are much more vertical now.\n\nControl Vector outputs are now synchronous, on the rising edge of CLK.
Text Notes 8150 6200 0    63   ~ 13
2019 Design Update
Text HLabel 1000 1800 0    50   Input ~ 0
UPC0
Text HLabel 1000 1900 0    50   Input ~ 0
UPC1
Text HLabel 1000 2000 0    50   Input ~ 0
UPC2
Text HLabel 1000 2100 0    50   Input ~ 0
UPC3
Text HLabel 1000 2200 0    50   Input ~ 0
IDX0
Text HLabel 1000 2300 0    50   Input ~ 0
IDX1
Text HLabel 1000 2400 0    50   Input ~ 0
~COND
Text HLabel 1000 2500 0    50   Input ~ 0
IR7
Text HLabel 1000 2600 0    50   Input ~ 0
IR8
Text HLabel 1000 2700 0    50   Input ~ 0
IR9
Text HLabel 1000 2800 0    50   Input ~ 0
IR10
Text HLabel 1000 2900 0    50   Input ~ 0
IR11
Text HLabel 1000 3000 0    50   Input ~ 0
IR12
Text HLabel 1000 3100 0    50   Input ~ 0
IR13
Text HLabel 1000 3200 0    50   Input ~ 0
IR14
Text HLabel 1000 3300 0    50   Input ~ 0
IR15
Text HLabel 1000 3400 0    50   Input ~ 0
~IRQSµC
Text HLabel 1000 3500 0    50   Input ~ 0
~RSTHOLD
Text Notes 1950 3450 0    100  ~ 20
µ00
Text Label 1100 6000 0    50   ~ 0
CLK
Text Label 1100 6100 0    50   ~ 0
~OE
Wire Wire Line
	1450 1800 1000 1800
Wire Wire Line
	1450 1900 1000 1900
Wire Wire Line
	1450 2000 1000 2000
Wire Wire Line
	1450 2100 1000 2100
Text Label 1100 1800 0    50   ~ 0
UPC0
Text Label 1100 1900 0    50   ~ 0
UPC1
Text Label 1100 2000 0    50   ~ 0
UPC2
Text Label 1100 2100 0    50   ~ 0
UPC3
Text Label 1100 3400 0    50   ~ 0
~IRQSµC
Text Label 1100 3500 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	1000 2200 1450 2200
Wire Wire Line
	1000 2300 1450 2300
Wire Wire Line
	1000 2500 1450 2500
Wire Wire Line
	1000 2600 1450 2600
Wire Wire Line
	1000 2700 1450 2700
Wire Wire Line
	1000 2800 1450 2800
Wire Wire Line
	1000 2900 1450 2900
Wire Wire Line
	1000 3000 1450 3000
Wire Wire Line
	1000 3100 1450 3100
Wire Wire Line
	1000 3200 1450 3200
Wire Wire Line
	1000 3300 1450 3300
Wire Wire Line
	1000 2400 1450 2400
Wire Wire Line
	1000 3400 1450 3400
Wire Wire Line
	1000 3500 1450 3500
Text Label 1100 2200 0    50   ~ 0
IDX0
Text Label 1100 2300 0    50   ~ 0
IDX1
Text Label 1100 2600 0    50   ~ 0
IR8
Text Label 1100 2700 0    50   ~ 0
IR9
Text Label 1100 2800 0    50   ~ 0
IR10
Text Label 1100 2900 0    50   ~ 0
IR11
Text Label 1100 3000 0    50   ~ 0
IR12
Text Label 1100 3100 0    50   ~ 0
IR13
Text Label 1100 3200 0    50   ~ 0
IR14
Text Label 1100 3300 0    50   ~ 0
IR15
Text Label 1100 2400 0    50   ~ 0
~COND
Text Label 1100 2500 0    50   ~ 0
IR7
Text HLabel 3550 4750 2    50   Output ~ 0
WADDR2
Text HLabel 3550 4850 2    50   Output ~ 0
WADDR1
Text HLabel 3550 4950 2    50   Output ~ 0
WADDR0
Text Label 3450 4750 2    50   ~ 0
WADDR2
Text Label 3450 4850 2    50   ~ 0
WADDR1
Text Label 3450 4950 2    50   ~ 0
WADDR0
Text HLabel 3550 5450 2    50   Output ~ 0
RADDR0
Text Label 3450 5450 2    50   ~ 0
RADDR0
Text HLabel 3550 5050 2    50   Output ~ 0
RADDR4
Text HLabel 3550 5150 2    50   Output ~ 0
RADDR3
Text HLabel 3550 5350 2    50   Output ~ 0
RADDR2
Text HLabel 3550 5250 2    50   Output ~ 0
RADDR1
Text Label 3450 5250 2    50   ~ 0
RADDR1
Text Label 3450 5350 2    50   ~ 0
RADDR2
Text Label 3450 5150 2    50   ~ 0
RADDR3
Text Label 3450 5050 2    50   ~ 0
RADDR4
$Comp
L alexios:74HC574 U1705
U 1 1 5F02A882
P 2100 5250
F 0 "U1705" H 2100 6017 50  0000 C CNN
F 1 "74HC574" H 2100 5926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 1800 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 1800 5200 50  0001 C CNN
F 4 "Yes" H 1950 4300 50  0001 C CNN "Verified"
	1    2100 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1705
U 1 1 5F0EED39
P 2750 4750
F 0 "R1705" V 2700 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 3550 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 4750 50  0001 C CNN
F 3 "~" H 2750 4750 50  0001 C CNN
	1    2750 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1708
U 1 1 5F1723E0
P 2750 4850
F 0 "R1708" V 2700 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 4850 50  0001 C CNN
F 3 "~" H 2750 4850 50  0001 C CNN
	1    2750 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1711
U 1 1 5F1725D2
P 2750 4950
F 0 "R1711" V 2700 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 4950 50  0001 C CNN
F 3 "~" H 2750 4950 50  0001 C CNN
	1    2750 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1714
U 1 1 5F172791
P 2750 5050
F 0 "R1714" V 2700 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5050 50  0001 C CNN
F 3 "~" H 2750 5050 50  0001 C CNN
	1    2750 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1716
U 1 1 5F17294F
P 2750 5150
F 0 "R1716" V 2700 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5150 50  0001 C CNN
F 3 "~" H 2750 5150 50  0001 C CNN
	1    2750 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1718
U 1 1 5F172B1C
P 2750 5250
F 0 "R1718" V 2700 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5250 50  0001 C CNN
F 3 "~" H 2750 5250 50  0001 C CNN
	1    2750 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1720
U 1 1 5F172C96
P 2750 5350
F 0 "R1720" V 2700 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5350 50  0001 C CNN
F 3 "~" H 2750 5350 50  0001 C CNN
	1    2750 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1722
U 1 1 5F172E80
P 2750 5450
F 0 "R1722" V 2700 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5450 50  0001 C CNN
F 3 "~" H 2750 5450 50  0001 C CNN
	1    2750 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 4750 3550 4750
Wire Wire Line
	2850 4850 3550 4850
Wire Wire Line
	2850 4950 3550 4950
Wire Wire Line
	2850 5150 3550 5150
Wire Wire Line
	2850 5350 3550 5350
Wire Wire Line
	2850 5250 3550 5250
Wire Wire Line
	2850 5450 3550 5450
Wire Wire Line
	2850 5050 3550 5050
Wire Wire Line
	2600 4750 2650 4750
Wire Wire Line
	2600 4850 2650 4850
Wire Wire Line
	2600 4950 2650 4950
Wire Wire Line
	2600 5050 2650 5050
Wire Wire Line
	2600 5150 2650 5150
Wire Wire Line
	2600 5250 2650 5250
Wire Wire Line
	2600 5350 2650 5350
Wire Wire Line
	2600 5450 2650 5450
Wire Wire Line
	2700 1800 3000 1800
Wire Wire Line
	2700 1900 3000 1900
Wire Wire Line
	2700 2000 3000 2000
Wire Wire Line
	2700 2100 3000 2100
Wire Wire Line
	2700 2200 3000 2200
Wire Wire Line
	2700 2300 3000 2300
Wire Wire Line
	2700 2400 3000 2400
Wire Wire Line
	2700 2500 3000 2500
Text Notes 7850 3450 0    100  ~ 20
µ02
Wire Wire Line
	7350 1800 7000 1800
Wire Wire Line
	7350 1900 7000 1900
Wire Wire Line
	7350 2000 7000 2000
Wire Wire Line
	7350 2100 7000 2100
Text Label 7000 1800 0    50   ~ 0
UPC0
Text Label 7000 1900 0    50   ~ 0
UPC1
Text Label 7000 2000 0    50   ~ 0
UPC2
Text Label 7000 2100 0    50   ~ 0
UPC3
Text Label 7000 3400 0    50   ~ 0
~IRQSµC
Text Label 7000 3500 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7000 2200 7350 2200
Wire Wire Line
	7000 2300 7350 2300
Wire Wire Line
	7000 2500 7350 2500
Wire Wire Line
	7000 2600 7350 2600
Wire Wire Line
	7000 2700 7350 2700
Wire Wire Line
	7000 2800 7350 2800
Wire Wire Line
	7000 2900 7350 2900
Wire Wire Line
	7000 3000 7350 3000
Wire Wire Line
	7000 3100 7350 3100
Wire Wire Line
	7000 3200 7350 3200
Wire Wire Line
	7000 3300 7350 3300
Wire Wire Line
	7000 2400 7350 2400
Wire Wire Line
	7000 3400 7350 3400
Wire Wire Line
	7000 3500 7350 3500
Text Label 7000 2200 0    50   ~ 0
IDX0
Text Label 7000 2300 0    50   ~ 0
IDX1
Text Label 7000 2600 0    50   ~ 0
IR8
Text Label 7000 2700 0    50   ~ 0
IR9
Text Label 7000 2800 0    50   ~ 0
IR10
Text Label 7000 2900 0    50   ~ 0
IR11
Text Label 7000 3000 0    50   ~ 0
IR12
Text Label 7000 3100 0    50   ~ 0
IR13
Text Label 7000 3200 0    50   ~ 0
IR14
Text Label 7000 3300 0    50   ~ 0
IR15
Text Label 7000 2400 0    50   ~ 0
~COND
Text Label 7000 2500 0    50   ~ 0
IR7
Text HLabel 6500 5250 2    50   Output ~ 0
WADDR4
Text HLabel 6500 5450 2    50   Output ~ 0
WADDR3
Text Label 6400 5250 2    50   ~ 0
WADDR4
Text Label 6400 5450 2    50   ~ 0
WADDR3
Wire Wire Line
	5800 5250 6500 5250
Wire Wire Line
	5800 5450 6500 5450
Text HLabel 6500 4750 2    50   Output ~ 0
ACTION0
Text HLabel 6500 4850 2    50   Output ~ 0
COND4
Text HLabel 6500 4950 2    50   Output ~ 0
COND3
Text HLabel 6500 5050 2    50   Output ~ 0
COND2
Text HLabel 6500 5150 2    50   Output ~ 0
COND1
Text HLabel 6500 5350 2    50   Output ~ 0
COND0
Text Label 6400 5350 2    50   ~ 0
COND0
Text Label 6400 5150 2    50   ~ 0
COND1
Text Label 6400 5050 2    50   ~ 0
COND2
Text Label 6400 4950 2    50   ~ 0
COND3
Text Label 6400 4850 2    50   ~ 0
COND4
Text Label 6400 4750 2    50   ~ 0
ACTION0
Text Label 4050 2500 0    50   ~ 0
IR7
Text Label 4050 2400 0    50   ~ 0
~COND
Text Label 4050 3300 0    50   ~ 0
IR15
Text Label 4050 3200 0    50   ~ 0
IR14
Text Label 4050 3100 0    50   ~ 0
IR13
Text Label 4050 3000 0    50   ~ 0
IR12
Text Label 4050 2900 0    50   ~ 0
IR11
Text Label 4050 2800 0    50   ~ 0
IR10
Text Label 4050 2700 0    50   ~ 0
IR9
Text Label 4050 2600 0    50   ~ 0
IR8
Text Label 4050 2300 0    50   ~ 0
IDX1
Text Label 4050 2200 0    50   ~ 0
IDX0
Wire Wire Line
	4050 3400 4400 3400
Wire Wire Line
	4050 2400 4400 2400
Wire Wire Line
	4050 3300 4400 3300
Wire Wire Line
	4050 3200 4400 3200
Wire Wire Line
	4050 3100 4400 3100
Wire Wire Line
	4050 3000 4400 3000
Wire Wire Line
	4050 2900 4400 2900
Wire Wire Line
	4050 2800 4400 2800
Wire Wire Line
	4050 2700 4400 2700
Wire Wire Line
	4050 2600 4400 2600
Wire Wire Line
	4050 2500 4400 2500
Wire Wire Line
	4050 2300 4400 2300
Wire Wire Line
	4050 2200 4400 2200
Text Label 4050 3500 0    50   ~ 0
~RSTHOLD
Text Label 4050 3400 0    50   ~ 0
~IRQSµC
Text Label 4050 2100 0    50   ~ 0
UPC3
Text Label 4050 2000 0    50   ~ 0
UPC2
Text Label 4050 1900 0    50   ~ 0
UPC1
Text Label 4050 1800 0    50   ~ 0
UPC0
Wire Wire Line
	4400 2100 4050 2100
Wire Wire Line
	4400 2000 4050 2000
Wire Wire Line
	4400 1900 4050 1900
Wire Wire Line
	4400 1800 4050 1800
Text Notes 4900 3450 0    100  ~ 20
µ01
Entry Wire Line
	3000 1800 3100 1900
Entry Wire Line
	3000 1900 3100 2000
Entry Wire Line
	3000 2000 3100 2100
Entry Wire Line
	3000 2100 3100 2200
Entry Wire Line
	3000 2200 3100 2300
Entry Wire Line
	3000 2300 3100 2400
Entry Wire Line
	3000 2400 3100 2500
Entry Wire Line
	3000 2500 3100 2600
Text Label 2750 1800 0    50   ~ 0
µCV0
Text Label 2750 1900 0    50   ~ 0
µCV1
Text Label 2750 2000 0    50   ~ 0
µCV2
Text Label 2750 2100 0    50   ~ 0
µCV3
Text Label 2750 2200 0    50   ~ 0
µCV4
Text Label 2750 2300 0    50   ~ 0
µCV5
Text Label 2750 2400 0    50   ~ 0
µCV6
Text Label 2750 2500 0    50   ~ 0
µCV7
Entry Wire Line
	1300 5450 1200 5350
Entry Wire Line
	1300 5350 1200 5250
Entry Wire Line
	1300 5250 1200 5150
Entry Wire Line
	1300 5150 1200 5050
Entry Wire Line
	1300 5050 1200 4950
Entry Wire Line
	1300 4950 1200 4850
Entry Wire Line
	1300 4850 1200 4750
Entry Wire Line
	1300 4750 1200 4650
Entry Bus Bus
	3100 4050 3000 4150
Wire Bus Line
	3000 4150 1300 4150
Entry Bus Bus
	1200 4250 1300 4150
Wire Wire Line
	5650 1800 5950 1800
Wire Wire Line
	5650 1900 5950 1900
Wire Wire Line
	5650 2000 5950 2000
Wire Wire Line
	5650 2100 5950 2100
Wire Wire Line
	5650 2200 5950 2200
Wire Wire Line
	5650 2300 5950 2300
Wire Wire Line
	5650 2400 5950 2400
Wire Wire Line
	5650 2500 5950 2500
Entry Wire Line
	5950 1800 6050 1900
Entry Wire Line
	5950 1900 6050 2000
Entry Wire Line
	5950 2000 6050 2100
Entry Wire Line
	5950 2100 6050 2200
Entry Wire Line
	5950 2200 6050 2300
Entry Wire Line
	5950 2300 6050 2400
Entry Wire Line
	5950 2400 6050 2500
Entry Wire Line
	5950 2500 6050 2600
Entry Bus Bus
	6050 4050 5950 4150
Wire Bus Line
	5950 4150 4250 4150
Text Label 6050 3350 1    50   ~ 0
µCV[8..15]
Text Label 5700 1800 0    50   ~ 0
µCV8
Text Label 5700 1900 0    50   ~ 0
µCV9
Text Label 5700 2000 0    50   ~ 0
µCV10
Text Label 5700 2100 0    50   ~ 0
µCV11
Text Label 5700 2200 0    50   ~ 0
µCV12
Text Label 5700 2300 0    50   ~ 0
µCV13
Text Label 5700 2400 0    50   ~ 0
µCV14
Text Label 5700 2500 0    50   ~ 0
µCV15
Text Label 4250 5650 0    50   ~ 0
CLK
Text Label 4250 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U1706
U 1 1 5F517073
P 5050 5250
F 0 "U1706" H 5050 6017 50  0000 C CNN
F 1 "74HC574" H 5050 5926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4750 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4750 5200 50  0001 C CNN
F 4 "Yes" H 4900 4300 50  0001 C CNN "Verified"
	1    5050 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5750 4250 5750
$Comp
L Device:R_Small R1706
U 1 1 5F51707B
P 5700 4750
F 0 "R1706" V 5650 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 6500 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 4750 50  0001 C CNN
F 3 "~" H 5700 4750 50  0001 C CNN
	1    5700 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1709
U 1 1 5F517081
P 5700 4850
F 0 "R1709" V 5650 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 4850 50  0001 C CNN
F 3 "~" H 5700 4850 50  0001 C CNN
	1    5700 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1712
U 1 1 5F517087
P 5700 4950
F 0 "R1712" V 5650 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 4950 50  0001 C CNN
F 3 "~" H 5700 4950 50  0001 C CNN
	1    5700 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1715
U 1 1 5F51708D
P 5700 5050
F 0 "R1715" V 5650 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5050 50  0001 C CNN
F 3 "~" H 5700 5050 50  0001 C CNN
	1    5700 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1717
U 1 1 5F517093
P 5700 5150
F 0 "R1717" V 5650 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5150 50  0001 C CNN
F 3 "~" H 5700 5150 50  0001 C CNN
	1    5700 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1719
U 1 1 5F517099
P 5700 5250
F 0 "R1719" V 5650 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5250 50  0001 C CNN
F 3 "~" H 5700 5250 50  0001 C CNN
	1    5700 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1721
U 1 1 5F51709F
P 5700 5350
F 0 "R1721" V 5650 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5350 50  0001 C CNN
F 3 "~" H 5700 5350 50  0001 C CNN
	1    5700 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1723
U 1 1 5F5170A5
P 5700 5450
F 0 "R1723" V 5650 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5450 50  0001 C CNN
F 3 "~" H 5700 5450 50  0001 C CNN
	1    5700 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 4750 5600 4750
Wire Wire Line
	5550 4850 5600 4850
Wire Wire Line
	5550 4950 5600 4950
Wire Wire Line
	5550 5050 5600 5050
Wire Wire Line
	5550 5150 5600 5150
Wire Wire Line
	5550 5250 5600 5250
Wire Wire Line
	5550 5350 5600 5350
Wire Wire Line
	5550 5450 5600 5450
Entry Wire Line
	4250 5450 4150 5350
Entry Wire Line
	4250 5350 4150 5250
Entry Wire Line
	4250 5250 4150 5150
Entry Wire Line
	4250 5150 4150 5050
Entry Wire Line
	4250 5050 4150 4950
Entry Wire Line
	4250 4950 4150 4850
Entry Wire Line
	4250 4850 4150 4750
Entry Wire Line
	4250 4750 4150 4650
Entry Bus Bus
	4150 4250 4250 4150
Wire Bus Line
	8900 4150 7200 4150
Text Label 7200 5650 0    50   ~ 0
CLK
Text Label 7200 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U1707
U 1 1 5F5592A3
P 8000 5250
F 0 "U1707" H 8000 6017 50  0000 C CNN
F 1 "74HC574" H 8000 5926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7700 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 7700 5200 50  0001 C CNN
F 4 "Yes" H 7850 4300 50  0001 C CNN "Verified"
	1    8000 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1724
U 1 1 5F5592D5
P 8650 4750
F 0 "R1724" V 8600 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 8400 4750 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 4750 50  0001 C CNN
F 3 "~" H 8650 4750 50  0001 C CNN
	1    8650 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 4750 8550 4750
Wire Wire Line
	8500 5450 8550 5450
Entry Wire Line
	7200 5450 7100 5350
Entry Wire Line
	7200 5350 7100 5250
Entry Wire Line
	7200 5250 7100 5150
Entry Wire Line
	7200 5150 7100 5050
Entry Wire Line
	7200 5050 7100 4950
Entry Wire Line
	7200 4950 7100 4850
Entry Wire Line
	7200 4850 7100 4750
Entry Wire Line
	7200 4750 7100 4650
Entry Bus Bus
	7100 4250 7200 4150
Entry Wire Line
	8900 1800 9000 1900
Entry Wire Line
	8900 1900 9000 2000
Entry Wire Line
	8900 2000 9000 2100
Entry Wire Line
	8900 2100 9000 2200
Entry Wire Line
	8900 2200 9000 2300
Entry Wire Line
	8900 2300 9000 2400
Entry Wire Line
	8900 2400 9000 2500
Entry Wire Line
	8900 2500 9000 2600
Text Label 9000 3350 1    50   ~ 0
µCV[8..15]
Wire Wire Line
	5800 5350 6500 5350
Wire Wire Line
	5800 5150 6500 5150
Wire Wire Line
	5800 5050 6500 5050
Wire Wire Line
	5800 4950 6500 4950
Wire Wire Line
	5800 4850 6500 4850
Wire Wire Line
	5800 4750 6500 4750
$Comp
L alexios:74HC574 U1705
U 2 1 5F7CB74C
P 1800 7350
F 0 "U1705" H 1980 7396 50  0000 L CNN
F 1 "74HC574" H 1980 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 1500 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 1500 7300 50  0001 C CNN
F 4 "Yes" H 1650 6400 50  0001 C CNN "Verified"
	2    1800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F7CCB83
P 1450 7250
AR Path="/5DEAC282/5F7CCB83" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F7CCB83" Ref="#PWR01717"  Part="1" 
F 0 "#PWR01717" H 1450 7100 50  0001 C CNN
F 1 "+5V" H 1465 7423 50  0000 C CNN
F 2 "" H 1450 7250 50  0001 C CNN
F 3 "" H 1450 7250 50  0001 C CNN
	1    1450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01720
U 1 1 5F7E179D
P 1450 7450
F 0 "#PWR01720" H 1450 7200 50  0001 C CNN
F 1 "GND" H 1455 7277 50  0000 C CNN
F 2 "" H 1450 7450 50  0001 C CNN
F 3 "" H 1450 7450 50  0001 C CNN
	1    1450 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F7E1852
P 1450 7350
AR Path="/5CC0D65F/5F7E1852" Ref="C?"  Part="1" 
AR Path="/5F7E1852" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F7E1852" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F7E1852" Ref="C1708"  Part="1" 
F 0 "C1708" H 1359 7396 50  0000 R CNN
F 1 "100nF" H 1359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 7350 50  0001 C CNN
F 3 "~" H 1450 7350 50  0001 C CNN
	1    1450 7350
	1    0    0    -1  
$EndComp
Connection ~ 1450 7250
Connection ~ 1450 7450
$Comp
L alexios:74HC574 U1706
U 2 1 5F82A383
P 3800 7350
F 0 "U1706" H 3980 7396 50  0000 L CNN
F 1 "74HC574" H 3980 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 3500 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3500 7300 50  0001 C CNN
F 4 "Yes" H 3650 6400 50  0001 C CNN "Verified"
	2    3800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F82A389
P 3450 7250
AR Path="/5DEAC282/5F82A389" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F82A389" Ref="#PWR01718"  Part="1" 
F 0 "#PWR01718" H 3450 7100 50  0001 C CNN
F 1 "+5V" H 3465 7423 50  0000 C CNN
F 2 "" H 3450 7250 50  0001 C CNN
F 3 "" H 3450 7250 50  0001 C CNN
	1    3450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01721
U 1 1 5F82A38F
P 3450 7450
F 0 "#PWR01721" H 3450 7200 50  0001 C CNN
F 1 "GND" H 3455 7277 50  0000 C CNN
F 2 "" H 3450 7450 50  0001 C CNN
F 3 "" H 3450 7450 50  0001 C CNN
	1    3450 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F82A395
P 3450 7350
AR Path="/5CC0D65F/5F82A395" Ref="C?"  Part="1" 
AR Path="/5F82A395" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F82A395" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F82A395" Ref="C1709"  Part="1" 
F 0 "C1709" H 3359 7396 50  0000 R CNN
F 1 "100nF" H 3359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 7350 50  0001 C CNN
F 3 "~" H 3450 7350 50  0001 C CNN
	1    3450 7350
	1    0    0    -1  
$EndComp
Connection ~ 3450 7250
Connection ~ 3450 7450
$Comp
L alexios:74HC574 U1707
U 2 1 5F8510DD
P 5800 7350
F 0 "U1707" H 5980 7396 50  0000 L CNN
F 1 "74HC574" H 5980 7305 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 5500 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 5500 7300 50  0001 C CNN
F 4 "Yes" H 5650 6400 50  0001 C CNN "Verified"
	2    5800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F8510E3
P 5450 7250
AR Path="/5DEAC282/5F8510E3" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F8510E3" Ref="#PWR01719"  Part="1" 
F 0 "#PWR01719" H 5450 7100 50  0001 C CNN
F 1 "+5V" H 5465 7423 50  0000 C CNN
F 2 "" H 5450 7250 50  0001 C CNN
F 3 "" H 5450 7250 50  0001 C CNN
	1    5450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01722
U 1 1 5F8510E9
P 5450 7450
F 0 "#PWR01722" H 5450 7200 50  0001 C CNN
F 1 "GND" H 5455 7277 50  0000 C CNN
F 2 "" H 5450 7450 50  0001 C CNN
F 3 "" H 5450 7450 50  0001 C CNN
	1    5450 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F8510EF
P 5450 7350
AR Path="/5CC0D65F/5F8510EF" Ref="C?"  Part="1" 
AR Path="/5F8510EF" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F8510EF" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F8510EF" Ref="C1710"  Part="1" 
F 0 "C1710" H 5359 7396 50  0000 R CNN
F 1 "100nF" H 5359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 7350 50  0001 C CNN
F 3 "~" H 5450 7350 50  0001 C CNN
	1    5450 7350
	1    0    0    -1  
$EndComp
Connection ~ 5450 7250
Connection ~ 5450 7450
Text HLabel 1000 6000 0    50   Input ~ 0
CLK
Text HLabel 1000 6100 0    50   Input ~ 0
~OE
Wire Wire Line
	1000 6100 1500 6100
Wire Wire Line
	7000 6000 7000 5650
Wire Wire Line
	7000 5650 7500 5650
Wire Wire Line
	1000 6000 1400 6000
Wire Wire Line
	1600 5650 1400 5650
Wire Wire Line
	1400 5650 1400 6000
Connection ~ 1400 6000
Wire Wire Line
	1400 6000 4150 6000
Wire Wire Line
	1600 5750 1500 5750
Wire Wire Line
	1500 5750 1500 6100
Connection ~ 1500 6100
Wire Wire Line
	4250 6100 4250 5750
Wire Wire Line
	1500 6100 4250 6100
Wire Wire Line
	4150 5650 4150 6000
Wire Wire Line
	4150 5650 4550 5650
Connection ~ 4150 6000
Wire Wire Line
	4150 6000 7000 6000
Wire Wire Line
	4250 6100 7100 6100
Wire Wire Line
	7100 6100 7100 5750
Wire Wire Line
	7100 5750 7500 5750
Connection ~ 4250 6100
Wire Notes Line width 24 style solid
	8050 6000 11050 6000
Wire Notes Line width 24 style solid
	11050 6000 11050 6700
Wire Notes Line width 24 style solid
	11050 6700 8050 6700
Wire Notes Line width 24 style solid
	8050 6700 8050 6000
Text Notes 800  1250 0    50   ~ 0
Microcode Address Vector signals are expected to be registered\nelsewhere, and remain constant for at least 70ns before the\nrising edge of CLK.
Text Notes 800  900  0    63   ~ 13
Registering of Micro-Address Vector
Wire Notes Line width 24 style solid
	700  700  3700 700 
Wire Notes Line width 24 style solid
	3700 700  3700 1350
Wire Notes Line width 24 style solid
	3700 1350 700  1350
Wire Notes Line width 24 style solid
	700  1350 700  700 
Wire Notes Line style solid
	650  6025 700  6025
Wire Notes Line style solid
	700  5975 750  5975
Wire Notes Line style solid
	700  6025 700  5975
Text Notes 2400 3750 2    50   ~ 0
microcode-00.bin
Text Notes 5350 3750 2    50   ~ 0
microcode-01.bin
Text Notes 8300 3750 2    50   ~ 0
microcode-02.bin
Text Notes 6000 1275 0    50   ~ 0
NOT FOR MICROCODE VERSIONS < 7\n\nFor versions 8 and above, check microcode\ndocumentation for compatibility!
Text Notes 6000 850  0    63   ~ 13
Compatibility
Wire Notes Line width 24 style solid
	5925 675  7775 675 
Wire Notes Line width 24 style solid
	7775 675  7775 1375
Wire Notes Line width 24 style solid
	7775 1375 5925 1375
Wire Notes Line width 24 style solid
	5925 1375 5925 675 
Wire Wire Line
	8600 1800 8900 1800
Wire Wire Line
	8600 1900 8900 1900
Wire Wire Line
	8600 2000 8900 2000
Wire Wire Line
	8600 2100 8900 2100
Wire Wire Line
	8600 2200 8900 2200
Wire Wire Line
	8600 2300 8900 2300
Wire Wire Line
	8600 2400 8900 2400
Wire Wire Line
	8600 2500 8900 2500
Text Label 8850 1800 2    50   ~ 0
µCV16
Text Label 8850 1900 2    50   ~ 0
µCV17
Text Label 8850 2000 2    50   ~ 0
µCV18
Text Label 8850 2100 2    50   ~ 0
µCV19
Text Label 8850 2200 2    50   ~ 0
µCV20
Text Label 8850 2300 2    50   ~ 0
µCV21
Text Label 8850 2400 2    50   ~ 0
µCV22
Text Label 8850 2500 2    50   ~ 0
µCV23
Wire Wire Line
	7500 5450 7200 5450
Wire Wire Line
	7500 5250 7200 5250
Wire Wire Line
	7500 5350 7200 5350
Wire Wire Line
	7500 5150 7200 5150
Wire Wire Line
	7500 5050 7200 5050
Wire Wire Line
	7500 4950 7200 4950
Wire Wire Line
	7500 4850 7200 4850
Wire Wire Line
	7500 4750 7200 4750
Text Label 7250 5450 0    50   ~ 0
µCV16
Text Label 7250 5250 0    50   ~ 0
µCV17
Text Label 7250 5350 0    50   ~ 0
µCV18
Text Label 7250 5150 0    50   ~ 0
µCV19
Text Label 7250 5050 0    50   ~ 0
µCV20
Text Label 7250 4950 0    50   ~ 0
µCV21
Text Label 7250 4850 0    50   ~ 0
µCV22
Text Label 7250 4750 0    50   ~ 0
µCV23
Wire Wire Line
	4250 5450 4550 5450
Wire Wire Line
	4250 5250 4550 5250
Wire Wire Line
	4250 5350 4550 5350
Wire Wire Line
	4250 5150 4550 5150
Wire Wire Line
	4250 5050 4550 5050
Wire Wire Line
	4250 4950 4550 4950
Wire Wire Line
	4250 4850 4550 4850
Wire Wire Line
	4250 4750 4550 4750
Text Label 4300 5450 0    50   ~ 0
µCV8
Text Label 4300 5250 0    50   ~ 0
µCV9
Text Label 4300 5150 0    50   ~ 0
µCV11
Text Label 4300 5050 0    50   ~ 0
µCV12
Text Label 4300 4950 0    50   ~ 0
µCV13
Text Label 4300 4850 0    50   ~ 0
µCV14
Text Label 4300 4750 0    50   ~ 0
µCV15
Text Label 3100 3350 1    50   ~ 0
µCV[0..7]
Wire Wire Line
	10700 3050 10900 3050
Wire Wire Line
	10700 3150 10900 3150
Wire Wire Line
	10700 2850 10900 2850
Wire Wire Line
	10700 2950 10900 2950
Text HLabel 10900 2950 2    50   Output ~ 0
~WEN
Text HLabel 10900 3150 2    50   Output ~ 0
~IO
Text HLabel 10900 3050 2    50   Output ~ 0
~MEM
$Comp
L Device:R_Small R1704
U 1 1 5F5592CF
P 10600 3150
F 0 "R1704" V 10550 3300 50  0000 C CNN
F 1 "0Ω/30Ω" V 10150 3150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 3150 50  0001 C CNN
F 3 "~" H 10600 3150 50  0001 C CNN
	1    10600 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1703
U 1 1 5F5592C9
P 10600 3050
F 0 "R1703" V 10550 3200 50  0000 C CNN
F 1 "0Ω/30Ω" V 10350 3050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 3050 50  0001 C CNN
F 3 "~" H 10600 3050 50  0001 C CNN
	1    10600 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1702
U 1 1 5F5592C3
P 10600 2950
F 0 "R1702" V 10550 3100 50  0000 C CNN
F 1 "0Ω/30Ω" V 10350 2950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 2950 50  0001 C CNN
F 3 "~" H 10600 2950 50  0001 C CNN
	1    10600 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1701
U 1 1 5F5592BD
P 10600 2850
F 0 "R1701" V 10550 3000 50  0000 C CNN
F 1 "0Ω/30Ω" V 10350 2850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 2850 50  0001 C CNN
F 3 "~" H 10600 2850 50  0001 C CNN
	1    10600 2850
	0    1    1    0   
$EndComp
Text Label 9100 3500 0    50   ~ 0
~MEM0
Text Label 9100 3600 0    50   ~ 0
~IO0
Text Label 9100 3300 0    50   ~ 0
~R0
Text Label 9100 3400 0    50   ~ 0
~WEN0
Text Notes 9200 4550 0    50   ~ 0
The '157 mux disables bus transactions\nduring ~NRSTHOLD~ to ensure undefined\ncontrol signals don't have unforeseen\nside effects on peripherals.
Entry Bus Bus
	9000 4050 8900 4150
$Comp
L power:+5V #PWR?
U 1 1 5F2CC361
P 9650 2050
AR Path="/5DEAC282/5F2CC361" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F2CC361" Ref="#PWR01701"  Part="1" 
F 0 "#PWR01701" H 9650 1900 50  0001 C CNN
F 1 "+5V" H 9665 2223 50  0000 C CNN
F 2 "" H 9650 2050 50  0001 C CNN
F 3 "" H 9650 2050 50  0001 C CNN
	1    9650 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01702
U 1 1 5F2CC367
P 9650 2250
F 0 "#PWR01702" H 9650 2000 50  0001 C CNN
F 1 "GND" H 9655 2077 50  0000 C CNN
F 2 "" H 9650 2250 50  0001 C CNN
F 3 "" H 9650 2250 50  0001 C CNN
	1    9650 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F2CC36D
P 9650 2150
AR Path="/5CC0D65F/5F2CC36D" Ref="C?"  Part="1" 
AR Path="/5F2CC36D" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F2CC36D" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F2CC36D" Ref="C1701"  Part="1" 
F 0 "C1701" H 9559 2196 50  0000 R CNN
F 1 "100nF" H 9559 2105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9650 2150 50  0001 C CNN
F 3 "~" H 9650 2150 50  0001 C CNN
	1    9650 2150
	1    0    0    -1  
$EndComp
Connection ~ 9650 2050
Connection ~ 9650 2250
Wire Wire Line
	10450 2850 10500 2850
Wire Wire Line
	10450 2950 10500 2950
Wire Wire Line
	10450 3050 10500 3050
Wire Wire Line
	10450 3150 10500 3150
$Comp
L power:+5V #PWR01703
U 1 1 5F3FDE6E
P 9400 2800
F 0 "#PWR01703" H 9400 2650 50  0001 C CNN
F 1 "+5V" H 9415 2973 50  0000 C CNN
F 2 "" H 9400 2800 50  0001 C CNN
F 3 "" H 9400 2800 50  0001 C CNN
	1    9400 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2800 9400 2850
Wire Wire Line
	9400 3150 9450 3150
Wire Wire Line
	9450 2850 9400 2850
Connection ~ 9400 2850
Wire Wire Line
	9400 2850 9400 2950
Wire Wire Line
	9450 2950 9400 2950
Connection ~ 9400 2950
Wire Wire Line
	9400 2950 9400 3050
Wire Wire Line
	9450 3050 9400 3050
Connection ~ 9400 3050
Wire Wire Line
	9400 3050 9400 3150
Wire Wire Line
	9450 3400 9100 3400
Wire Wire Line
	9450 3300 9100 3300
Wire Wire Line
	9450 3500 9100 3500
Wire Wire Line
	9450 3600 9100 3600
$Comp
L power:GND #PWR01710
U 1 1 5F4B072A
P 9400 3900
F 0 "#PWR01710" H 9400 3650 50  0001 C CNN
F 1 "GND" H 9405 3727 50  0000 C CNN
F 2 "" H 9400 3900 50  0001 C CNN
F 3 "" H 9400 3900 50  0001 C CNN
	1    9400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3850 9400 3850
Wire Wire Line
	9400 3850 9400 3900
Wire Wire Line
	9450 3750 9100 3750
Text Label 9100 3750 0    50   ~ 0
~RSTHOLD
Text HLabel 10900 2850 2    50   Output ~ 0
~R
$Comp
L alexios:74AC157 U1704
U 2 1 5F2BA5E3
P 10000 2650
F 0 "U1704" H 10180 3196 50  0000 L CNN
F 1 "74AC157" H 10180 3105 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 10000 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 10000 2650 50  0001 C CNN
	2    10000 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC157 U1704
U 1 1 5EF0EC27
P 9950 3450
F 0 "U1704" H 9950 4317 50  0000 C CNN
F 1 "74AC157" H 9950 4226 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9950 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 9950 3450 50  0001 C CNN
	1    9950 3450
	1    0    0    -1  
$EndComp
$Comp
L alexios:AT27C020 U1701
U 1 1 5F938C57
P 2100 2650
F 0 "U1701" H 2075 3767 50  0000 C CNN
F 1 "AT27C020" H 2075 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 1475 875 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 2100 2650 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 1775 775 50  0001 C CNN "Mouser"
	1    2100 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F964C17
P 2750 2850
AR Path="/5DEAC282/5F964C17" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F964C17" Ref="#PWR01704"  Part="1" 
F 0 "#PWR01704" H 2750 2700 50  0001 C CNN
F 1 "+5V" H 2765 3023 50  0000 C CNN
F 2 "" H 2750 2850 50  0001 C CNN
F 3 "" H 2750 2850 50  0001 C CNN
	1    2750 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2850 2750 2900
Wire Wire Line
	2750 3100 2700 3100
Wire Wire Line
	2700 2900 2750 2900
Connection ~ 2750 2900
Wire Wire Line
	2750 2900 2750 3100
Wire Wire Line
	2700 3300 2750 3300
Wire Wire Line
	2750 3300 2750 3500
Wire Wire Line
	2700 3500 2750 3500
Connection ~ 2750 3500
Wire Wire Line
	2750 3500 2750 3550
$Comp
L power:GND #PWR?
U 1 1 5F9C1A62
P 2750 3550
AR Path="/5DEAC282/5F9C1A62" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F9C1A62" Ref="#PWR01707"  Part="1" 
F 0 "#PWR01707" H 2750 3300 50  0001 C CNN
F 1 "GND" H 2755 3377 50  0000 C CNN
F 2 "" H 2750 3550 50  0001 C CNN
F 3 "" H 2750 3550 50  0001 C CNN
	1    2750 3550
	1    0    0    -1  
$EndComp
$Comp
L alexios:AT27C020 U1702
U 1 1 5F9D536F
P 5050 2650
F 0 "U1702" H 5025 3767 50  0000 C CNN
F 1 "AT27C020" H 5025 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 4425 875 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 5050 2650 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 4725 775 50  0001 C CNN "Mouser"
	1    5050 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F9EA638
P 5700 2850
AR Path="/5DEAC282/5F9EA638" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F9EA638" Ref="#PWR01705"  Part="1" 
F 0 "#PWR01705" H 5700 2700 50  0001 C CNN
F 1 "+5V" H 5715 3023 50  0000 C CNN
F 2 "" H 5700 2850 50  0001 C CNN
F 3 "" H 5700 2850 50  0001 C CNN
	1    5700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2850 5700 2900
Wire Wire Line
	5700 3100 5650 3100
Wire Wire Line
	5650 2900 5700 2900
Connection ~ 5700 2900
Wire Wire Line
	5700 2900 5700 3100
Wire Wire Line
	5650 3300 5700 3300
Wire Wire Line
	5700 3300 5700 3500
Wire Wire Line
	5650 3500 5700 3500
Connection ~ 5700 3500
Wire Wire Line
	5700 3500 5700 3550
$Comp
L power:GND #PWR?
U 1 1 5F9EA648
P 5700 3550
AR Path="/5DEAC282/5F9EA648" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F9EA648" Ref="#PWR01708"  Part="1" 
F 0 "#PWR01708" H 5700 3300 50  0001 C CNN
F 1 "GND" H 5705 3377 50  0000 C CNN
F 2 "" H 5700 3550 50  0001 C CNN
F 3 "" H 5700 3550 50  0001 C CNN
	1    5700 3550
	1    0    0    -1  
$EndComp
$Comp
L alexios:AT27C020 U1703
U 1 1 5F9FE4FB
P 8000 2650
F 0 "U1703" H 7975 3767 50  0000 C CNN
F 1 "AT27C020" H 7975 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 7375 875 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 8000 2650 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 7675 775 50  0001 C CNN "Mouser"
	1    8000 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FA02F58
P 8650 2850
AR Path="/5DEAC282/5FA02F58" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5FA02F58" Ref="#PWR01706"  Part="1" 
F 0 "#PWR01706" H 8650 2700 50  0001 C CNN
F 1 "+5V" H 8665 3023 50  0000 C CNN
F 2 "" H 8650 2850 50  0001 C CNN
F 3 "" H 8650 2850 50  0001 C CNN
	1    8650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2850 8650 2900
Wire Wire Line
	8650 3100 8600 3100
Wire Wire Line
	8600 2900 8650 2900
Connection ~ 8650 2900
Wire Wire Line
	8650 2900 8650 3100
Wire Wire Line
	8600 3300 8650 3300
Wire Wire Line
	8650 3300 8650 3500
Wire Wire Line
	8600 3500 8650 3500
Connection ~ 8650 3500
Wire Wire Line
	8650 3500 8650 3550
$Comp
L power:GND #PWR?
U 1 1 5FA02F68
P 8650 3550
AR Path="/5DEAC282/5FA02F68" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5FA02F68" Ref="#PWR01709"  Part="1" 
F 0 "#PWR01709" H 8650 3300 50  0001 C CNN
F 1 "GND" H 8655 3377 50  0000 C CNN
F 2 "" H 8650 3550 50  0001 C CNN
F 3 "" H 8650 3550 50  0001 C CNN
	1    8650 3550
	1    0    0    -1  
$EndComp
Text Notes 2600 3900 2    50   ~ 10
Atmel AT27C020 55ns parts.
$Comp
L alexios:AT27C020 U1701
U 2 1 5FA33B55
P 1800 7350
F 0 "U1701" H 1980 8146 50  0000 L CNN
F 1 "AT27C020" H 1980 8055 50  0000 L CNN
F 2 "alexios:PLCC32" H 1175 5575 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 1800 7350 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 1475 5475 50  0001 C CNN "Mouser"
	2    1800 7350
	1    0    0    -1  
$EndComp
Connection ~ 1450 6700
Connection ~ 1450 6500
$Comp
L alexios:AT27C020 U1702
U 2 1 5FA35738
P 3800 7350
F 0 "U1702" H 3980 8146 50  0000 L CNN
F 1 "AT27C020" H 3980 8055 50  0000 L CNN
F 2 "alexios:PLCC32" H 3175 5575 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 3800 7350 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 3475 5475 50  0001 C CNN "Mouser"
	2    3800 7350
	1    0    0    -1  
$EndComp
Connection ~ 3450 6700
Connection ~ 3450 6500
$Comp
L alexios:AT27C020 U1703
U 2 1 5FA36B3D
P 5800 7350
F 0 "U1703" H 5980 8146 50  0000 L CNN
F 1 "AT27C020" H 5980 8055 50  0000 L CNN
F 2 "alexios:PLCC32" H 5175 5575 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 5800 7350 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 5475 5475 50  0001 C CNN "Mouser"
	2    5800 7350
	1    0    0    -1  
$EndComp
Connection ~ 5450 6700
Connection ~ 5450 6500
Text Label 1350 4750 0    50   ~ 0
µCV7
Text Label 1350 4850 0    50   ~ 0
µCV6
Text Label 1350 4950 0    50   ~ 0
µCV5
Text Label 1350 5050 0    50   ~ 0
µCV4
Text Label 1350 5150 0    50   ~ 0
µCV3
Text Label 1350 5350 0    50   ~ 0
µCV2
Text Label 1350 5250 0    50   ~ 0
µCV1
Text Label 1350 5450 0    50   ~ 0
µCV0
Wire Wire Line
	1300 4750 1600 4750
Wire Wire Line
	1300 4850 1600 4850
Wire Wire Line
	1300 4950 1600 4950
Wire Wire Line
	1300 5050 1600 5050
Wire Wire Line
	1300 5150 1600 5150
Wire Wire Line
	1300 5350 1600 5350
Wire Wire Line
	1300 5250 1600 5250
Wire Wire Line
	1300 5450 1600 5450
Wire Wire Line
	8750 4750 10750 4750
Text Label 9300 4750 2    50   ~ 0
~END
Text HLabel 10750 4750 2    50   Output ~ 0
~END
Text HLabel 10750 5450 2    50   Output ~ 0
ACTION1
Text HLabel 10750 5250 2    50   Output ~ 0
ACTION2
Text HLabel 10750 5350 2    50   Output ~ 0
ACTION3
Text Label 9300 5450 2    50   ~ 0
ACTION1
Text Label 9300 5250 2    50   ~ 0
ACTION2
Text Label 9300 5350 2    50   ~ 0
ACTION3
Wire Wire Line
	8750 5450 10750 5450
Wire Wire Line
	8750 5250 10750 5250
Wire Wire Line
	8750 5350 10750 5350
$Comp
L Device:R_Small R1713
U 1 1 5F5592B7
P 8650 5450
F 0 "R1713" V 8600 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 8400 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 5450 50  0001 C CNN
F 3 "~" H 8650 5450 50  0001 C CNN
	1    8650 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1710
U 1 1 5F5592B1
P 8650 5350
F 0 "R1710" V 8600 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 8400 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 5350 50  0001 C CNN
F 3 "~" H 8650 5350 50  0001 C CNN
	1    8650 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1707
U 1 1 5F5592AB
P 8650 5250
F 0 "R1707" V 8600 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 9450 5500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 5250 50  0001 C CNN
F 3 "~" H 8650 5250 50  0001 C CNN
	1    8650 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 5350 8550 5350
Wire Wire Line
	8500 5250 8550 5250
Wire Wire Line
	8500 4850 9300 4850
Wire Wire Line
	8500 4950 9300 4950
Wire Wire Line
	8500 5050 9300 5050
Wire Wire Line
	8500 5150 9300 5150
Text Label 9300 4850 2    50   ~ 0
~WEN0
Text Label 9300 4950 2    50   ~ 0
~R0
Text Label 9300 5050 2    50   ~ 0
~IO0
Text Label 9300 5150 2    50   ~ 0
~MEM0
Text Notes 3500 4400 2    50   ~ 10
NOTE: '574 pins are out of order for easier routing!
Text Label 4300 5350 0    50   ~ 0
µCV10
Wire Bus Line
	9000 1900 9000 4050
Wire Bus Line
	7100 4250 7100 5350
Wire Bus Line
	4150 4250 4150 5350
Wire Bus Line
	6050 1900 6050 4050
Wire Bus Line
	1200 4250 1200 5350
Wire Bus Line
	3100 1900 3100 4050
$EndSCHEMATC
