EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 11
Title "Control Store (24×512k ROM)"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "control_store.v"
$EndDescr
Wire Wire Line
	4050 3600 4400 3600
$Comp
L power:GND #PWR?
U 1 1 5E37FA6E
P 2000 4000
AR Path="/5DEAC282/5E37FA6E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA6E" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 2000 3750 50  0001 C CNN
F 1 "GND" H 1850 3950 50  0000 C CNN
F 2 "" H 2000 4000 50  0001 C CNN
F 3 "" H 2000 4000 50  0001 C CNN
	1    2000 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E37FA5A
P 2400 4000
AR Path="/5DEAC282/5E37FA5A" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA5A" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2400 3850 50  0001 C CNN
F 1 "+5V" H 2415 4173 50  0000 C CNN
F 2 "" H 2400 4000 50  0001 C CNN
F 3 "" H 2400 4000 50  0001 C CNN
	1    2400 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4000 2400 4000
Text Notes 8600 1150 0    50   ~ 0
Microcode ROMs are wired as a 512K×24 bit\ntable, so all address lines are the same but\ndata out lines differ.
$Comp
L alexios:29F040 U?
U 2 1 5E4A5D71
P 1800 7350
AR Path="/5DEAC282/5E4A5D71" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D71" Ref="U52"  Part="2" 
F 0 "U52" H 1980 8146 50  0000 L CNN
F 1 "29F040" H 1980 8055 50  0000 L CNN
F 2 "alexios:PLCC32" H 1800 7350 50  0001 C CNN
F 3 "" H 1800 7350 50  0001 C CNN
	2    1800 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 2 1 5E4A5D77
P 3800 7350
AR Path="/5DEAC282/5E4A5D77" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D77" Ref="U53"  Part="2" 
F 0 "U53" H 3980 8146 50  0000 L CNN
F 1 "29F040" H 3980 8055 50  0000 L CNN
F 2 "alexios:PLCC32" H 3800 7350 50  0001 C CNN
F 3 "" H 3800 7350 50  0001 C CNN
	2    3800 7350
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 2 1 5E4A5D7D
P 5800 7350
AR Path="/5DEAC282/5E4A5D7D" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D7D" Ref="U54"  Part="2" 
F 0 "U54" H 5980 8146 50  0000 L CNN
F 1 "29F040" H 5980 8055 50  0000 L CNN
F 2 "alexios:PLCC32" H 5800 7350 50  0001 C CNN
F 3 "" H 5800 7350 50  0001 C CNN
	2    5800 7350
	1    0    0    -1  
$EndComp
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
AR Path="/5DEAC282/5E34FD9B/5E4A5D87" Ref="C52"  Part="1" 
F 0 "C52" H 3259 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5D93" Ref="C51"  Part="1" 
F 0 "C51" H 2859 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5D99" Ref="C54"  Part="1" 
F 0 "C54" H 5259 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5DA5" Ref="C53"  Part="1" 
F 0 "C53" H 4859 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5DAB" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 1450 6450 50  0001 C CNN
F 1 "GND" H 1455 6527 50  0000 C CNN
F 2 "" H 1450 6700 50  0001 C CNN
F 3 "" H 1450 6700 50  0001 C CNN
	1    1450 6700
	1    0    0    -1  
$EndComp
Connection ~ 1450 6700
$Comp
L power:GND #PWR?
U 1 1 5E4A5DB2
P 3450 6700
AR Path="/5DEAC282/5E4A5DB2" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DB2" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 3450 6450 50  0001 C CNN
F 1 "GND" H 3455 6527 50  0000 C CNN
F 2 "" H 3450 6700 50  0001 C CNN
F 3 "" H 3450 6700 50  0001 C CNN
	1    3450 6700
	1    0    0    -1  
$EndComp
Connection ~ 3450 6700
$Comp
L power:GND #PWR?
U 1 1 5E4A5DB9
P 5450 6700
AR Path="/5DEAC282/5E4A5DB9" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DB9" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 5450 6450 50  0001 C CNN
F 1 "GND" H 5455 6527 50  0000 C CNN
F 2 "" H 5450 6700 50  0001 C CNN
F 3 "" H 5450 6700 50  0001 C CNN
	1    5450 6700
	1    0    0    -1  
$EndComp
Connection ~ 5450 6700
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DC0
P 1450 6500
AR Path="/5DEAC282/5E4A5DC0" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DC0" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 1450 6350 50  0001 C CNN
F 1 "+5V" H 1465 6673 50  0000 C CNN
F 2 "" H 1450 6500 50  0001 C CNN
F 3 "" H 1450 6500 50  0001 C CNN
	1    1450 6500
	1    0    0    -1  
$EndComp
Connection ~ 1450 6500
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DC7
P 3450 6500
AR Path="/5DEAC282/5E4A5DC7" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DC7" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 3450 6350 50  0001 C CNN
F 1 "+5V" H 3465 6673 50  0000 C CNN
F 2 "" H 3450 6500 50  0001 C CNN
F 3 "" H 3450 6500 50  0001 C CNN
	1    3450 6500
	1    0    0    -1  
$EndComp
Connection ~ 3450 6500
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DCE
P 5450 6500
AR Path="/5DEAC282/5E4A5DCE" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DCE" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 5450 6350 50  0001 C CNN
F 1 "+5V" H 5465 6673 50  0000 C CNN
F 2 "" H 5450 6500 50  0001 C CNN
F 3 "" H 5450 6500 50  0001 C CNN
	1    5450 6500
	1    0    0    -1  
$EndComp
Connection ~ 5450 6500
$Comp
L Device:C_Small C?
U 1 1 5E4A5DD5
P 1350 6600
AR Path="/5CC0D65F/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DD5" Ref="C50"  Part="1" 
F 0 "C50" H 1259 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5DDD" Ref="C49"  Part="1" 
F 0 "C49" H 859 6646 50  0000 R CNN
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
IN-RSVD
Text HLabel 1000 2600 0    50   Input ~ 0
IR7
Text HLabel 1000 2700 0    50   Input ~ 0
IR8
Text HLabel 1000 2800 0    50   Input ~ 0
IR9
Text HLabel 1000 2900 0    50   Input ~ 0
IR10
Text HLabel 1000 3000 0    50   Input ~ 0
IR11
Text HLabel 1000 3100 0    50   Input ~ 0
IR12
Text HLabel 1000 3200 0    50   Input ~ 0
IR13
Text HLabel 1000 3300 0    50   Input ~ 0
IR14
Text HLabel 1000 3400 0    50   Input ~ 0
IR15
Text HLabel 1000 3500 0    50   Input ~ 0
~IRQSµC
Text HLabel 1000 3600 0    50   Input ~ 0
~RSTHOLD
Text Notes 2000 3450 0    100  ~ 20
µ00
$Comp
L alexios:29F040 U?
U 1 1 5E37FA15
P 2100 2650
AR Path="/5DEAC282/5E37FA15" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA15" Ref="U52"  Part="1" 
F 0 "U52" H 2075 3767 50  0000 C CNN
F 1 "29F040" H 2075 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 2100 2650 50  0001 C CNN
F 3 "" H 2100 2650 50  0001 C CNN
	1    2100 2650
	1    0    0    -1  
$EndComp
Text Label 1100 6000 0    50   ~ 0
CLK
Text Label 1100 6100 0    50   ~ 0
~OE
$Comp
L power:GND #PWR?
U 1 1 5F0788AB
P 2150 4000
AR Path="/5DEAC282/5F0788AB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F0788AB" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 2150 3750 50  0001 C CNN
F 1 "GND" H 2300 3950 50  0000 C CNN
F 2 "" H 2150 4000 50  0001 C CNN
F 3 "" H 2150 4000 50  0001 C CNN
	1    2150 4000
	1    0    0    -1  
$EndComp
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
Text Label 1100 3500 0    50   ~ 0
~IRQSµC
Text Label 1100 3600 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	1000 2200 1450 2200
Wire Wire Line
	1000 2300 1450 2300
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
	1000 3400 1450 3400
Wire Wire Line
	1000 2400 1450 2400
Wire Wire Line
	1000 2500 1450 2500
Wire Wire Line
	1000 3500 1450 3500
Wire Wire Line
	1000 3600 1450 3600
Text Label 1100 2200 0    50   ~ 0
IDX0
Text Label 1100 2300 0    50   ~ 0
IDX1
Text Label 1100 2700 0    50   ~ 0
IR8
Text Label 1100 2800 0    50   ~ 0
IR9
Text Label 1100 2900 0    50   ~ 0
IR10
Text Label 1100 3000 0    50   ~ 0
IR11
Text Label 1100 3100 0    50   ~ 0
IR12
Text Label 1100 3200 0    50   ~ 0
IR13
Text Label 1100 3300 0    50   ~ 0
IR14
Text Label 1100 3400 0    50   ~ 0
IR15
Text Label 1100 2500 0    50   ~ 0
IN-RSVD
Text Label 1100 2400 0    50   ~ 0
~COND
Text Label 1100 2600 0    50   ~ 0
IR7
Text HLabel 3550 5450 2    50   Output ~ 0
WADDR2
Text HLabel 3550 5350 2    50   Output ~ 0
WADDR1
Text HLabel 3550 5250 2    50   Output ~ 0
WADDR0
Text Label 3450 5450 2    50   ~ 0
WADDR2
Text Label 3450 5350 2    50   ~ 0
WADDR1
Text Label 3450 5250 2    50   ~ 0
WADDR0
Text HLabel 3550 4750 2    50   Output ~ 0
RADDR0
Text Label 3450 4750 2    50   ~ 0
RADDR0
Text HLabel 3550 5150 2    50   Output ~ 0
RADDR4
Text HLabel 3550 5050 2    50   Output ~ 0
RADDR3
Text HLabel 3550 4950 2    50   Output ~ 0
RADDR2
Text HLabel 3550 4850 2    50   Output ~ 0
RADDR1
Text Label 3450 4850 2    50   ~ 0
RADDR1
Text Label 3450 4950 2    50   ~ 0
RADDR2
Text Label 3450 5050 2    50   ~ 0
RADDR3
Text Label 3450 5150 2    50   ~ 0
RADDR4
$Comp
L alexios:74HC574 U58
U 1 1 5F02A882
P 2100 5250
F 0 "U58" H 2100 6017 50  0000 C CNN
F 1 "74HC574" H 2100 5926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 1800 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1800 5200 50  0001 C CNN
F 4 "Yes" H 1950 4300 50  0001 C CNN "Verified"
	1    2100 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F0EED39
P 2750 4750
F 0 "R5" V 2700 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 3550 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 4750 50  0001 C CNN
F 3 "~" H 2750 4750 50  0001 C CNN
	1    2750 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R30
U 1 1 5F1723E0
P 2750 4850
F 0 "R30" V 2700 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 4850 50  0001 C CNN
F 3 "~" H 2750 4850 50  0001 C CNN
	1    2750 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R33
U 1 1 5F1725D2
P 2750 4950
F 0 "R33" V 2700 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 4950 50  0001 C CNN
F 3 "~" H 2750 4950 50  0001 C CNN
	1    2750 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R36
U 1 1 5F172791
P 2750 5050
F 0 "R36" V 2700 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5050 50  0001 C CNN
F 3 "~" H 2750 5050 50  0001 C CNN
	1    2750 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R39
U 1 1 5F17294F
P 2750 5150
F 0 "R39" V 2700 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5150 50  0001 C CNN
F 3 "~" H 2750 5150 50  0001 C CNN
	1    2750 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R42
U 1 1 5F172B1C
P 2750 5250
F 0 "R42" V 2700 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5250 50  0001 C CNN
F 3 "~" H 2750 5250 50  0001 C CNN
	1    2750 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R45
U 1 1 5F172C96
P 2750 5350
F 0 "R45" V 2700 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5350 50  0001 C CNN
F 3 "~" H 2750 5350 50  0001 C CNN
	1    2750 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R48
U 1 1 5F172E80
P 2750 5450
F 0 "R48" V 2700 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 2500 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5450 50  0001 C CNN
F 3 "~" H 2750 5450 50  0001 C CNN
	1    2750 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	2850 5450 3550 5450
Wire Wire Line
	2850 5350 3550 5350
Wire Wire Line
	2850 5250 3550 5250
Wire Wire Line
	2850 5050 3550 5050
Wire Wire Line
	2850 4950 3550 4950
Wire Wire Line
	2850 4850 3550 4850
Wire Wire Line
	2850 4750 3550 4750
Wire Wire Line
	2850 5150 3550 5150
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
Text Notes 7950 3450 0    100  ~ 20
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
Text Label 7000 3500 0    50   ~ 0
~IRQSµC
Text Label 7000 3600 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7000 2200 7350 2200
Wire Wire Line
	7000 2300 7350 2300
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
	7000 3400 7350 3400
Wire Wire Line
	7000 2400 7350 2400
Wire Wire Line
	7000 2500 7350 2500
Wire Wire Line
	7000 3500 7350 3500
Wire Wire Line
	7000 3600 7350 3600
Text Label 7000 2200 0    50   ~ 0
IDX0
Text Label 7000 2300 0    50   ~ 0
IDX1
Text Label 7000 2700 0    50   ~ 0
IR8
Text Label 7000 2800 0    50   ~ 0
IR9
Text Label 7000 2900 0    50   ~ 0
IR10
Text Label 7000 3000 0    50   ~ 0
IR11
Text Label 7000 3100 0    50   ~ 0
IR12
Text Label 7000 3200 0    50   ~ 0
IR13
Text Label 7000 3300 0    50   ~ 0
IR14
Text Label 7000 3400 0    50   ~ 0
IR15
Text Label 7000 2500 0    50   ~ 0
IN-RSVD
Text Label 7000 2400 0    50   ~ 0
~COND
Text Label 7000 2600 0    50   ~ 0
IR7
$Comp
L alexios:29F040 U?
U 1 1 5E3B5D62
P 8000 2650
AR Path="/5DEAC282/5E3B5D62" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B5D62" Ref="U54"  Part="1" 
F 0 "U54" H 7975 3767 50  0000 C CNN
F 1 "29F040" H 7975 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 8000 2650 50  0001 C CNN
F 3 "" H 8000 2650 50  0001 C CNN
	1    8000 2650
	1    0    0    -1  
$EndComp
Text HLabel 6500 4850 2    50   Output ~ 0
WADDR4
Text HLabel 6500 4750 2    50   Output ~ 0
WADDR3
Text Label 6400 4850 2    50   ~ 0
WADDR4
Text Label 6400 4750 2    50   ~ 0
WADDR3
Wire Wire Line
	5800 4850 6500 4850
Wire Wire Line
	5800 4750 6500 4750
Text HLabel 6500 5450 2    50   Output ~ 0
ACTION0
Text HLabel 6500 5350 2    50   Output ~ 0
COND4
Text HLabel 6500 5250 2    50   Output ~ 0
COND3
Text HLabel 6500 5150 2    50   Output ~ 0
COND2
Text HLabel 6500 5050 2    50   Output ~ 0
COND1
Text HLabel 6500 4950 2    50   Output ~ 0
COND0
Text Label 6400 4950 2    50   ~ 0
COND0
Text Label 6400 5050 2    50   ~ 0
COND1
Text Label 6400 5150 2    50   ~ 0
COND2
Text Label 6400 5250 2    50   ~ 0
COND3
Text Label 6400 5350 2    50   ~ 0
COND4
Text Label 6400 5450 2    50   ~ 0
ACTION0
$Comp
L alexios:29F040 U?
U 1 1 5E3B6B58
P 5050 2650
AR Path="/5DEAC282/5E3B6B58" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B6B58" Ref="U53"  Part="1" 
F 0 "U53" H 5025 3767 50  0000 C CNN
F 1 "29F040" H 5025 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 5050 2650 50  0001 C CNN
F 3 "" H 5050 2650 50  0001 C CNN
	1    5050 2650
	1    0    0    -1  
$EndComp
Text Label 4050 2600 0    50   ~ 0
IR7
Text Label 4050 2400 0    50   ~ 0
~COND
Text Label 4050 2500 0    50   ~ 0
IN-RSVD
Text Label 4050 3400 0    50   ~ 0
IR15
Text Label 4050 3300 0    50   ~ 0
IR14
Text Label 4050 3200 0    50   ~ 0
IR13
Text Label 4050 3100 0    50   ~ 0
IR12
Text Label 4050 3000 0    50   ~ 0
IR11
Text Label 4050 2900 0    50   ~ 0
IR10
Text Label 4050 2800 0    50   ~ 0
IR9
Text Label 4050 2700 0    50   ~ 0
IR8
Text Label 4050 2300 0    50   ~ 0
IDX1
Text Label 4050 2200 0    50   ~ 0
IDX0
Wire Wire Line
	4050 3500 4400 3500
Wire Wire Line
	4050 2500 4400 2500
Wire Wire Line
	4050 2400 4400 2400
Wire Wire Line
	4050 3400 4400 3400
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
	4050 2300 4400 2300
Wire Wire Line
	4050 2200 4400 2200
Text Label 4050 3600 0    50   ~ 0
~RSTHOLD
Text Label 4050 3500 0    50   ~ 0
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
Text Notes 5000 3450 0    100  ~ 20
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
	1300 5250 1600 5250
Wire Wire Line
	1300 5350 1600 5350
Wire Wire Line
	1300 5450 1600 5450
Text Label 1350 4750 0    50   ~ 0
µCV0
Text Label 1350 4850 0    50   ~ 0
µCV1
Text Label 1350 4950 0    50   ~ 0
µCV2
Text Label 1350 5050 0    50   ~ 0
µCV3
Text Label 1350 5150 0    50   ~ 0
µCV4
Text Label 1350 5250 0    50   ~ 0
µCV5
Text Label 1350 5350 0    50   ~ 0
µCV6
Text Label 1350 5450 0    50   ~ 0
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
	3100 4150 3000 4250
Wire Bus Line
	3000 4250 1300 4250
Entry Bus Bus
	1200 4350 1300 4250
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
	6050 4150 5950 4250
Wire Bus Line
	5950 4250 4250 4250
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
L alexios:74HC574 U59
U 1 1 5F517073
P 5050 5250
F 0 "U59" H 5050 6017 50  0000 C CNN
F 1 "74HC574" H 5050 5926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4750 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4750 5200 50  0001 C CNN
F 4 "Yes" H 4900 4300 50  0001 C CNN "Verified"
	1    5050 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5750 4250 5750
$Comp
L Device:R_Small R6
U 1 1 5F51707B
P 5700 4750
F 0 "R6" V 5650 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 6500 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 4750 50  0001 C CNN
F 3 "~" H 5700 4750 50  0001 C CNN
	1    5700 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R31
U 1 1 5F517081
P 5700 4850
F 0 "R31" V 5650 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 4850 50  0001 C CNN
F 3 "~" H 5700 4850 50  0001 C CNN
	1    5700 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R34
U 1 1 5F517087
P 5700 4950
F 0 "R34" V 5650 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 4950 50  0001 C CNN
F 3 "~" H 5700 4950 50  0001 C CNN
	1    5700 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R37
U 1 1 5F51708D
P 5700 5050
F 0 "R37" V 5650 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5050 50  0001 C CNN
F 3 "~" H 5700 5050 50  0001 C CNN
	1    5700 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R40
U 1 1 5F517093
P 5700 5150
F 0 "R40" V 5650 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5150 50  0001 C CNN
F 3 "~" H 5700 5150 50  0001 C CNN
	1    5700 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R43
U 1 1 5F517099
P 5700 5250
F 0 "R43" V 5650 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5250 50  0001 C CNN
F 3 "~" H 5700 5250 50  0001 C CNN
	1    5700 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R46
U 1 1 5F51709F
P 5700 5350
F 0 "R46" V 5650 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 5450 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5700 5350 50  0001 C CNN
F 3 "~" H 5700 5350 50  0001 C CNN
	1    5700 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R49
U 1 1 5F5170A5
P 5700 5450
F 0 "R49" V 5650 5600 50  0000 C CNN
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
	4150 4350 4250 4250
Wire Bus Line
	8900 4250 7200 4250
Text Label 7200 5650 0    50   ~ 0
CLK
Text Label 7200 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U60
U 1 1 5F5592A3
P 8000 5250
F 0 "U60" H 8000 6017 50  0000 C CNN
F 1 "74HC574" H 8000 5926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7700 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7700 5200 50  0001 C CNN
F 4 "Yes" H 7850 4300 50  0001 C CNN "Verified"
	1    8000 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5F5592AB
P 8650 4750
F 0 "R8" V 8600 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 9450 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 4750 50  0001 C CNN
F 3 "~" H 8650 4750 50  0001 C CNN
	1    8650 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R32
U 1 1 5F5592B1
P 8650 4850
F 0 "R32" V 8600 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 8400 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 4850 50  0001 C CNN
F 3 "~" H 8650 4850 50  0001 C CNN
	1    8650 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R35
U 1 1 5F5592B7
P 8650 4950
F 0 "R35" V 8600 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 8400 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 4950 50  0001 C CNN
F 3 "~" H 8650 4950 50  0001 C CNN
	1    8650 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R50
U 1 1 5F5592D5
P 8650 5450
F 0 "R50" V 8600 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 8400 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 5450 50  0001 C CNN
F 3 "~" H 8650 5450 50  0001 C CNN
	1    8650 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 4750 8550 4750
Wire Wire Line
	8500 4850 8550 4850
Wire Wire Line
	8500 4950 8550 4950
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
	7100 4350 7200 4250
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
Text HLabel 10750 4750 2    50   Output ~ 0
ACTION1
Text HLabel 10750 4850 2    50   Output ~ 0
ACTION2
Text HLabel 10750 4950 2    50   Output ~ 0
ACTION3
Text HLabel 10750 5450 2    50   Output ~ 0
~END
Text Label 9300 5450 2    50   ~ 0
~END
Text Label 9300 4750 2    50   ~ 0
ACTION1
Text Label 9300 4850 2    50   ~ 0
ACTION2
Text Label 9300 4950 2    50   ~ 0
ACTION3
Wire Wire Line
	5800 4950 6500 4950
Wire Wire Line
	5800 5050 6500 5050
Wire Wire Line
	5800 5150 6500 5150
Wire Wire Line
	5800 5250 6500 5250
Wire Wire Line
	5800 5350 6500 5350
Wire Wire Line
	5800 5450 6500 5450
Wire Wire Line
	8750 4750 10750 4750
Wire Wire Line
	8750 4850 10750 4850
Wire Wire Line
	8750 4950 10750 4950
Wire Wire Line
	8750 5450 10750 5450
$Comp
L power:GND #PWR?
U 1 1 5F777533
P 4950 4000
AR Path="/5DEAC282/5F777533" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F777533" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 4950 3750 50  0001 C CNN
F 1 "GND" H 4800 3950 50  0000 C CNN
F 2 "" H 4950 4000 50  0001 C CNN
F 3 "" H 4950 4000 50  0001 C CNN
	1    4950 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F777539
P 5350 4000
AR Path="/5DEAC282/5F777539" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F777539" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 5350 3850 50  0001 C CNN
F 1 "+5V" H 5365 4173 50  0000 C CNN
F 2 "" H 5350 4000 50  0001 C CNN
F 3 "" H 5350 4000 50  0001 C CNN
	1    5350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4000 5350 4000
$Comp
L power:GND #PWR?
U 1 1 5F777540
P 5100 4000
AR Path="/5DEAC282/5F777540" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F777540" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 5100 3750 50  0001 C CNN
F 1 "GND" H 5250 3950 50  0000 C CNN
F 2 "" H 5100 4000 50  0001 C CNN
F 3 "" H 5100 4000 50  0001 C CNN
	1    5100 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F78B738
P 7900 4000
AR Path="/5DEAC282/5F78B738" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F78B738" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 7900 3750 50  0001 C CNN
F 1 "GND" H 7750 3950 50  0000 C CNN
F 2 "" H 7900 4000 50  0001 C CNN
F 3 "" H 7900 4000 50  0001 C CNN
	1    7900 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F78B73E
P 8300 4000
AR Path="/5DEAC282/5F78B73E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F78B73E" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 8300 3850 50  0001 C CNN
F 1 "+5V" H 8315 4173 50  0000 C CNN
F 2 "" H 8300 4000 50  0001 C CNN
F 3 "" H 8300 4000 50  0001 C CNN
	1    8300 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4000 8300 4000
$Comp
L power:GND #PWR?
U 1 1 5F78B745
P 8050 4000
AR Path="/5DEAC282/5F78B745" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F78B745" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 8050 3750 50  0001 C CNN
F 1 "GND" H 8200 3950 50  0000 C CNN
F 2 "" H 8050 4000 50  0001 C CNN
F 3 "" H 8050 4000 50  0001 C CNN
	1    8050 4000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U58
U 2 1 5F7CB74C
P 1800 7350
F 0 "U58" H 1980 7396 50  0000 L CNN
F 1 "74HC574" H 1980 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1500 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1500 7300 50  0001 C CNN
F 4 "Yes" H 1650 6400 50  0001 C CNN "Verified"
	2    1800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F7CCB83
P 1450 7250
AR Path="/5DEAC282/5F7CCB83" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F7CCB83" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 1450 7100 50  0001 C CNN
F 1 "+5V" H 1465 7423 50  0000 C CNN
F 2 "" H 1450 7250 50  0001 C CNN
F 3 "" H 1450 7250 50  0001 C CNN
	1    1450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR066
U 1 1 5F7E179D
P 1450 7450
F 0 "#PWR066" H 1450 7200 50  0001 C CNN
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
AR Path="/5DEAC282/5E34FD9B/5F7E1852" Ref="C42"  Part="1" 
F 0 "C42" H 1359 7396 50  0000 R CNN
F 1 "100nF" H 1359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 7350 50  0001 C CNN
F 3 "~" H 1450 7350 50  0001 C CNN
	1    1450 7350
	1    0    0    -1  
$EndComp
Connection ~ 1450 7250
Connection ~ 1450 7450
$Comp
L alexios:74HC574 U59
U 2 1 5F82A383
P 3800 7350
F 0 "U59" H 3980 7396 50  0000 L CNN
F 1 "74HC574" H 3980 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 3500 7300 50  0001 C CNN
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
AR Path="/5DEAC282/5E34FD9B/5F82A389" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 3450 7100 50  0001 C CNN
F 1 "+5V" H 3465 7423 50  0000 C CNN
F 2 "" H 3450 7250 50  0001 C CNN
F 3 "" H 3450 7250 50  0001 C CNN
	1    3450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR067
U 1 1 5F82A38F
P 3450 7450
F 0 "#PWR067" H 3450 7200 50  0001 C CNN
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
AR Path="/5DEAC282/5E34FD9B/5F82A395" Ref="C58"  Part="1" 
F 0 "C58" H 3359 7396 50  0000 R CNN
F 1 "100nF" H 3359 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 7350 50  0001 C CNN
F 3 "~" H 3450 7350 50  0001 C CNN
	1    3450 7350
	1    0    0    -1  
$EndComp
Connection ~ 3450 7250
Connection ~ 3450 7450
$Comp
L alexios:74HC574 U60
U 2 1 5F8510DD
P 5800 7350
F 0 "U60" H 5980 7396 50  0000 L CNN
F 1 "74HC574" H 5980 7305 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5500 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5500 7300 50  0001 C CNN
F 4 "Yes" H 5650 6400 50  0001 C CNN "Verified"
	2    5800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F8510E3
P 5450 7250
AR Path="/5DEAC282/5F8510E3" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F8510E3" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 5450 7100 50  0001 C CNN
F 1 "+5V" H 5465 7423 50  0000 C CNN
F 2 "" H 5450 7250 50  0001 C CNN
F 3 "" H 5450 7250 50  0001 C CNN
	1    5450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR068
U 1 1 5F8510E9
P 5450 7450
F 0 "#PWR068" H 5450 7200 50  0001 C CNN
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
AR Path="/5DEAC282/5E34FD9B/5F8510EF" Ref="C61"  Part="1" 
F 0 "C61" H 5359 7396 50  0000 R CNN
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
Text Notes 2575 3750 1    50   ~ 0
microcode-00.bin
Text Notes 5525 3750 1    50   ~ 0
microcode-01.bin
Text Notes 8475 3750 1    50   ~ 0
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
	7500 4750 7200 4750
Wire Wire Line
	7500 4850 7200 4850
Wire Wire Line
	7500 4950 7200 4950
Wire Wire Line
	7500 5050 7200 5050
Wire Wire Line
	7500 5150 7200 5150
Wire Wire Line
	7500 5250 7200 5250
Wire Wire Line
	7500 5350 7200 5350
Wire Wire Line
	7500 5450 7200 5450
Text Label 7250 4750 0    50   ~ 0
µCV16
Text Label 7250 4850 0    50   ~ 0
µCV17
Text Label 7250 4950 0    50   ~ 0
µCV18
Text Label 7250 5050 0    50   ~ 0
µCV19
Text Label 7250 5150 0    50   ~ 0
µCV20
Text Label 7250 5250 0    50   ~ 0
µCV21
Text Label 7250 5350 0    50   ~ 0
µCV22
Text Label 7250 5450 0    50   ~ 0
µCV23
Wire Wire Line
	4250 4750 4550 4750
Wire Wire Line
	4250 4850 4550 4850
Wire Wire Line
	4250 4950 4550 4950
Wire Wire Line
	4250 5050 4550 5050
Wire Wire Line
	4250 5150 4550 5150
Wire Wire Line
	4250 5250 4550 5250
Wire Wire Line
	4250 5350 4550 5350
Wire Wire Line
	4250 5450 4550 5450
Text Label 4300 4750 0    50   ~ 0
µCV8
Text Label 4300 4850 0    50   ~ 0
µCV9
Text Label 4300 4950 0    50   ~ 0
µCV10
Text Label 4300 5050 0    50   ~ 0
µCV11
Text Label 4300 5150 0    50   ~ 0
µCV12
Text Label 4300 5250 0    50   ~ 0
µCV13
Text Label 4300 5350 0    50   ~ 0
µCV14
Text Label 4300 5450 0    50   ~ 0
µCV15
Text Label 3100 3350 1    50   ~ 0
µCV[0..7]
Wire Wire Line
	10700 3150 10900 3150
Wire Wire Line
	10700 3050 10900 3050
Wire Wire Line
	10700 2950 10900 2950
Wire Wire Line
	10700 2850 10900 2850
Text HLabel 10900 3050 2    50   Output ~ 0
~WEN
Text HLabel 10900 3150 2    50   Output ~ 0
~IO
Text HLabel 10900 2850 2    50   Output ~ 0
~MEM
$Comp
L Device:R_Small R47
U 1 1 5F5592CF
P 10600 3150
F 0 "R47" V 10550 3300 50  0000 C CNN
F 1 "0Ω/30Ω" V 10150 3150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 3150 50  0001 C CNN
F 3 "~" H 10600 3150 50  0001 C CNN
	1    10600 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R44
U 1 1 5F5592C9
P 10600 3050
F 0 "R44" V 10550 3200 50  0000 C CNN
F 1 "0Ω/30Ω" V 10350 3050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 3050 50  0001 C CNN
F 3 "~" H 10600 3050 50  0001 C CNN
	1    10600 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R41
U 1 1 5F5592C3
P 10600 2950
F 0 "R41" V 10550 3100 50  0000 C CNN
F 1 "0Ω/30Ω" V 10350 2950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 2950 50  0001 C CNN
F 3 "~" H 10600 2950 50  0001 C CNN
	1    10600 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R38
U 1 1 5F5592BD
P 10600 2850
F 0 "R38" V 10550 3000 50  0000 C CNN
F 1 "0Ω/30Ω" V 10350 2850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 2850 50  0001 C CNN
F 3 "~" H 10600 2850 50  0001 C CNN
	1    10600 2850
	0    1    1    0   
$EndComp
Text Label 9100 3300 0    50   ~ 0
~MEM0
Text Label 9100 3600 0    50   ~ 0
~IO0
Text Label 9100 3400 0    50   ~ 0
~R0
Text Label 9100 3500 0    50   ~ 0
~WEN0
Text Label 9300 5050 2    50   ~ 0
~MEM0
Text Label 9300 5150 2    50   ~ 0
~IO0
Text Label 9300 5250 2    50   ~ 0
~R0
Text Label 9300 5350 2    50   ~ 0
~WEN0
Wire Wire Line
	8500 5050 9300 5050
Wire Wire Line
	8500 5150 9300 5150
Wire Wire Line
	8500 5250 9300 5250
Wire Wire Line
	8500 5350 9300 5350
Text Notes 9200 4550 0    50   ~ 0
The '157 mux disables bus transactions\nduring ~NRSTHOLD~ to ensure undefined\ncontrol signals don't have unforeseen\nside effects on peripherals.
Entry Bus Bus
	9000 4150 8900 4250
$Comp
L power:+5V #PWR?
U 1 1 5F2CC361
P 9650 2050
AR Path="/5DEAC282/5F2CC361" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F2CC361" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 9650 1900 50  0001 C CNN
F 1 "+5V" H 9665 2223 50  0000 C CNN
F 2 "" H 9650 2050 50  0001 C CNN
F 3 "" H 9650 2050 50  0001 C CNN
	1    9650 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 5F2CC367
P 9650 2250
F 0 "#PWR0161" H 9650 2000 50  0001 C CNN
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
AR Path="/5DEAC282/5E34FD9B/5F2CC36D" Ref="C10"  Part="1" 
F 0 "C10" H 9559 2196 50  0000 R CNN
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
L power:+5V #PWR0173
U 1 1 5F3FDE6E
P 9400 2800
F 0 "#PWR0173" H 9400 2650 50  0001 C CNN
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
	9450 3300 9100 3300
Wire Wire Line
	9450 3400 9100 3400
Wire Wire Line
	9450 3500 9100 3500
Wire Wire Line
	9450 3600 9100 3600
$Comp
L power:GND #PWR0174
U 1 1 5F4B072A
P 9400 3900
F 0 "#PWR0174" H 9400 3650 50  0001 C CNN
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
Text HLabel 10900 2950 2    50   Output ~ 0
~R
$Comp
L alexios:74AC157 U7
U 2 1 5F2BA5E3
P 10000 2650
F 0 "U7" H 10180 3196 50  0000 L CNN
F 1 "74AC157" H 10180 3105 50  0000 L CNN
F 2 "alexios:SOIC-16" H 10000 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 10000 2650 50  0001 C CNN
	2    10000 2650
	1    0    0    -1  
$EndComp
Wire Bus Line
	9000 1900 9000 4150
Wire Bus Line
	7100 4350 7100 5350
Wire Bus Line
	4150 4350 4150 5350
Wire Bus Line
	6050 1900 6050 4150
Wire Bus Line
	1200 4350 1200 5350
Wire Bus Line
	3100 1900 3100 4150
$Comp
L alexios:74AC157 U7
U 1 1 5EF0EC27
P 9950 3450
F 0 "U7" H 9950 4317 50  0000 C CNN
F 1 "74AC157" H 9950 4226 50  0000 C CNN
F 2 "alexios:SOIC-16" H 9950 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 9950 3450 50  0001 C CNN
	1    9950 3450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
