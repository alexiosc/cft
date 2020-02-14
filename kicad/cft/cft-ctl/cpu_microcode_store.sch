EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 12
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
	4350 3600 4700 3600
$Comp
L power:GND #PWR?
U 1 1 5E37FA6E
P 2300 4000
AR Path="/5DEAC282/5E37FA6E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA6E" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 2300 3750 50  0001 C CNN
F 1 "GND" H 2150 3950 50  0000 C CNN
F 2 "" H 2300 4000 50  0001 C CNN
F 3 "" H 2300 4000 50  0001 C CNN
	1    2300 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E37FA5A
P 2700 4000
AR Path="/5DEAC282/5E37FA5A" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA5A" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2700 3850 50  0001 C CNN
F 1 "+5V" H 2715 4173 50  0000 C CNN
F 2 "" H 2700 4000 50  0001 C CNN
F 3 "" H 2700 4000 50  0001 C CNN
	1    2700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4000 2700 4000
Text Notes 9100 1400 0    50   ~ 0
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3350 6600 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 6600 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5350 6600 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4950 6600 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 6600 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 6600 50  0001 C CNN
F 3 "~" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
Text Notes 8150 6600 0    50   ~ 0
Both micro-Address Vector and micro-Control Vector have changed\nsignificantly in this version. Fields are much more vertical now.\n\nControl Vector outputs are now synchronous, on the rising edge of CLK.
Text Notes 8150 6200 0    63   ~ 13
2019 Design Update
Text HLabel 1300 1800 0    50   Input ~ 0
UPC0
Text HLabel 1300 1900 0    50   Input ~ 0
UPC1
Text HLabel 1300 2000 0    50   Input ~ 0
UPC2
Text HLabel 1300 2100 0    50   Input ~ 0
UPC3
Text HLabel 1300 2200 0    50   Input ~ 0
IDX0
Text HLabel 1300 2300 0    50   Input ~ 0
IDX1
Text HLabel 1300 2400 0    50   Input ~ 0
~COND
Text HLabel 1300 2500 0    50   Input ~ 0
IN-RSVD
Text HLabel 1300 2600 0    50   Input ~ 0
IR7
Text HLabel 1300 2700 0    50   Input ~ 0
IR8
Text HLabel 1300 2800 0    50   Input ~ 0
IR9
Text HLabel 1300 2900 0    50   Input ~ 0
IR10
Text HLabel 1300 3000 0    50   Input ~ 0
IR11
Text HLabel 1300 3100 0    50   Input ~ 0
IR12
Text HLabel 1300 3200 0    50   Input ~ 0
IR13
Text HLabel 1300 3300 0    50   Input ~ 0
IR14
Text HLabel 1300 3400 0    50   Input ~ 0
IR15
Text HLabel 1300 3500 0    50   Input ~ 0
~IRQSµC
Text HLabel 1300 3600 0    50   Input ~ 0
~RSTHOLD
Text Notes 2300 3450 0    100  ~ 20
µ00
$Comp
L alexios:29F040 U?
U 1 1 5E37FA15
P 2400 2650
AR Path="/5DEAC282/5E37FA15" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA15" Ref="U52"  Part="1" 
F 0 "U52" H 2375 3767 50  0000 C CNN
F 1 "29F040" H 2375 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 2400 2650 50  0001 C CNN
F 3 "" H 2400 2650 50  0001 C CNN
	1    2400 2650
	1    0    0    -1  
$EndComp
Text Label 1400 6000 0    50   ~ 0
CLK
Text Label 1400 6100 0    50   ~ 0
~OE
$Comp
L power:GND #PWR?
U 1 1 5F0788AB
P 2450 4000
AR Path="/5DEAC282/5F0788AB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F0788AB" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 2450 3750 50  0001 C CNN
F 1 "GND" H 2600 3950 50  0000 C CNN
F 2 "" H 2450 4000 50  0001 C CNN
F 3 "" H 2450 4000 50  0001 C CNN
	1    2450 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1800 1300 1800
Wire Wire Line
	1750 1900 1300 1900
Wire Wire Line
	1750 2000 1300 2000
Wire Wire Line
	1750 2100 1300 2100
Text Label 1400 1800 0    50   ~ 0
UPC0
Text Label 1400 1900 0    50   ~ 0
UPC1
Text Label 1400 2000 0    50   ~ 0
UPC2
Text Label 1400 2100 0    50   ~ 0
UPC3
Text Label 1400 3500 0    50   ~ 0
~IRQSµC
Text Label 1400 3600 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	1300 2200 1750 2200
Wire Wire Line
	1300 2300 1750 2300
Wire Wire Line
	1300 2600 1750 2600
Wire Wire Line
	1300 2700 1750 2700
Wire Wire Line
	1300 2800 1750 2800
Wire Wire Line
	1300 2900 1750 2900
Wire Wire Line
	1300 3000 1750 3000
Wire Wire Line
	1300 3100 1750 3100
Wire Wire Line
	1300 3200 1750 3200
Wire Wire Line
	1300 3300 1750 3300
Wire Wire Line
	1300 3400 1750 3400
Wire Wire Line
	1300 2400 1750 2400
Wire Wire Line
	1300 2500 1750 2500
Wire Wire Line
	1300 3500 1750 3500
Wire Wire Line
	1300 3600 1750 3600
Text Label 1400 2200 0    50   ~ 0
IDX0
Text Label 1400 2300 0    50   ~ 0
IDX1
Text Label 1400 2700 0    50   ~ 0
IR8
Text Label 1400 2800 0    50   ~ 0
IR9
Text Label 1400 2900 0    50   ~ 0
IR10
Text Label 1400 3000 0    50   ~ 0
IR11
Text Label 1400 3100 0    50   ~ 0
IR12
Text Label 1400 3200 0    50   ~ 0
IR13
Text Label 1400 3300 0    50   ~ 0
IR14
Text Label 1400 3400 0    50   ~ 0
IR15
Text Label 1400 2500 0    50   ~ 0
IN-RSVD
Text Label 1400 2400 0    50   ~ 0
~COND
Text Label 1400 2600 0    50   ~ 0
IR7
Text HLabel 3850 5450 2    50   Output ~ 0
WADDR2
Text HLabel 3850 5350 2    50   Output ~ 0
WADDR1
Text HLabel 3850 5250 2    50   Output ~ 0
WADDR0
Text Label 3750 5450 2    50   ~ 0
WADDR2
Text Label 3750 5350 2    50   ~ 0
WADDR1
Text Label 3750 5250 2    50   ~ 0
WADDR0
Text HLabel 3850 4750 2    50   Output ~ 0
RADDR0
Text Label 3750 4750 2    50   ~ 0
RADDR0
Text HLabel 3850 5150 2    50   Output ~ 0
RADDR4
Text HLabel 3850 5050 2    50   Output ~ 0
RADDR3
Text HLabel 3850 4950 2    50   Output ~ 0
RADDR2
Text HLabel 3850 4850 2    50   Output ~ 0
RADDR1
Text Label 3750 4850 2    50   ~ 0
RADDR1
Text Label 3750 4950 2    50   ~ 0
RADDR2
Text Label 3750 5050 2    50   ~ 0
RADDR3
Text Label 3750 5150 2    50   ~ 0
RADDR4
$Comp
L alexios:74HC574 U58
U 1 1 5F02A882
P 2400 5250
F 0 "U58" H 2400 6017 50  0000 C CNN
F 1 "74HC574" H 2400 5926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 2100 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2100 5200 50  0001 C CNN
F 4 "Yes" H 2250 4300 50  0001 C CNN "Verified"
	1    2400 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F0EED39
P 3050 4750
F 0 "R5" V 3000 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 3850 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 4750 50  0001 C CNN
F 3 "~" H 3050 4750 50  0001 C CNN
	1    3050 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R30
U 1 1 5F1723E0
P 3050 4850
F 0 "R30" V 3000 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 4850 50  0001 C CNN
F 3 "~" H 3050 4850 50  0001 C CNN
	1    3050 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R33
U 1 1 5F1725D2
P 3050 4950
F 0 "R33" V 3000 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 4950 50  0001 C CNN
F 3 "~" H 3050 4950 50  0001 C CNN
	1    3050 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R36
U 1 1 5F172791
P 3050 5050
F 0 "R36" V 3000 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 5050 50  0001 C CNN
F 3 "~" H 3050 5050 50  0001 C CNN
	1    3050 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R39
U 1 1 5F17294F
P 3050 5150
F 0 "R39" V 3000 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 5150 50  0001 C CNN
F 3 "~" H 3050 5150 50  0001 C CNN
	1    3050 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R42
U 1 1 5F172B1C
P 3050 5250
F 0 "R42" V 3000 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 5250 50  0001 C CNN
F 3 "~" H 3050 5250 50  0001 C CNN
	1    3050 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R45
U 1 1 5F172C96
P 3050 5350
F 0 "R45" V 3000 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 5350 50  0001 C CNN
F 3 "~" H 3050 5350 50  0001 C CNN
	1    3050 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R48
U 1 1 5F172E80
P 3050 5450
F 0 "R48" V 3000 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 2800 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 5450 50  0001 C CNN
F 3 "~" H 3050 5450 50  0001 C CNN
	1    3050 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 5450 3850 5450
Wire Wire Line
	3150 5350 3850 5350
Wire Wire Line
	3150 5250 3850 5250
Wire Wire Line
	3150 5050 3850 5050
Wire Wire Line
	3150 4950 3850 4950
Wire Wire Line
	3150 4850 3850 4850
Wire Wire Line
	3150 4750 3850 4750
Wire Wire Line
	3150 5150 3850 5150
Wire Wire Line
	2900 4750 2950 4750
Wire Wire Line
	2900 4850 2950 4850
Wire Wire Line
	2900 4950 2950 4950
Wire Wire Line
	2900 5050 2950 5050
Wire Wire Line
	2900 5150 2950 5150
Wire Wire Line
	2900 5250 2950 5250
Wire Wire Line
	2900 5350 2950 5350
Wire Wire Line
	2900 5450 2950 5450
Wire Wire Line
	3000 1800 3300 1800
Wire Wire Line
	3000 1900 3300 1900
Wire Wire Line
	3000 2000 3300 2000
Wire Wire Line
	3000 2100 3300 2100
Wire Wire Line
	3000 2200 3300 2200
Wire Wire Line
	3000 2300 3300 2300
Wire Wire Line
	3000 2400 3300 2400
Wire Wire Line
	3000 2500 3300 2500
Text Notes 8250 3450 0    100  ~ 20
µ02
Wire Wire Line
	7650 1800 7300 1800
Wire Wire Line
	7650 1900 7300 1900
Wire Wire Line
	7650 2000 7300 2000
Wire Wire Line
	7650 2100 7300 2100
Text Label 7300 1800 0    50   ~ 0
UPC0
Text Label 7300 1900 0    50   ~ 0
UPC1
Text Label 7300 2000 0    50   ~ 0
UPC2
Text Label 7300 2100 0    50   ~ 0
UPC3
Text Label 7300 3500 0    50   ~ 0
~IRQSµC
Text Label 7300 3600 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7300 2200 7650 2200
Wire Wire Line
	7300 2300 7650 2300
Wire Wire Line
	7300 2600 7650 2600
Wire Wire Line
	7300 2700 7650 2700
Wire Wire Line
	7300 2800 7650 2800
Wire Wire Line
	7300 2900 7650 2900
Wire Wire Line
	7300 3000 7650 3000
Wire Wire Line
	7300 3100 7650 3100
Wire Wire Line
	7300 3200 7650 3200
Wire Wire Line
	7300 3300 7650 3300
Wire Wire Line
	7300 3400 7650 3400
Wire Wire Line
	7300 2400 7650 2400
Wire Wire Line
	7300 2500 7650 2500
Wire Wire Line
	7300 3500 7650 3500
Wire Wire Line
	7300 3600 7650 3600
Text Label 7300 2200 0    50   ~ 0
IDX0
Text Label 7300 2300 0    50   ~ 0
IDX1
Text Label 7300 2700 0    50   ~ 0
IR8
Text Label 7300 2800 0    50   ~ 0
IR9
Text Label 7300 2900 0    50   ~ 0
IR10
Text Label 7300 3000 0    50   ~ 0
IR11
Text Label 7300 3100 0    50   ~ 0
IR12
Text Label 7300 3200 0    50   ~ 0
IR13
Text Label 7300 3300 0    50   ~ 0
IR14
Text Label 7300 3400 0    50   ~ 0
IR15
Text Label 7300 2500 0    50   ~ 0
IN-RSVD
Text Label 7300 2400 0    50   ~ 0
~COND
Text Label 7300 2600 0    50   ~ 0
IR7
$Comp
L alexios:29F040 U?
U 1 1 5E3B5D62
P 8300 2650
AR Path="/5DEAC282/5E3B5D62" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B5D62" Ref="U54"  Part="1" 
F 0 "U54" H 8275 3767 50  0000 C CNN
F 1 "29F040" H 8275 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 8300 2650 50  0001 C CNN
F 3 "" H 8300 2650 50  0001 C CNN
	1    8300 2650
	1    0    0    -1  
$EndComp
Text HLabel 6800 4850 2    50   Output ~ 0
WADDR4
Text HLabel 6800 4750 2    50   Output ~ 0
WADDR3
Text Label 6700 4850 2    50   ~ 0
WADDR4
Text Label 6700 4750 2    50   ~ 0
WADDR3
Wire Wire Line
	6100 4850 6800 4850
Wire Wire Line
	6100 4750 6800 4750
Text HLabel 6800 5450 2    50   Output ~ 0
ACTION0
Text HLabel 6800 5350 2    50   Output ~ 0
COND4
Text HLabel 6800 5250 2    50   Output ~ 0
COND3
Text HLabel 6800 5150 2    50   Output ~ 0
COND2
Text HLabel 6800 5050 2    50   Output ~ 0
COND1
Text HLabel 6800 4950 2    50   Output ~ 0
COND0
Text Label 6700 4950 2    50   ~ 0
COND0
Text Label 6700 5050 2    50   ~ 0
COND1
Text Label 6700 5150 2    50   ~ 0
COND2
Text Label 6700 5250 2    50   ~ 0
COND3
Text Label 6700 5350 2    50   ~ 0
COND4
Text Label 6700 5450 2    50   ~ 0
ACTION0
$Comp
L alexios:29F040 U?
U 1 1 5E3B6B58
P 5350 2650
AR Path="/5DEAC282/5E3B6B58" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B6B58" Ref="U53"  Part="1" 
F 0 "U53" H 5325 3767 50  0000 C CNN
F 1 "29F040" H 5325 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 5350 2650 50  0001 C CNN
F 3 "" H 5350 2650 50  0001 C CNN
	1    5350 2650
	1    0    0    -1  
$EndComp
Text Label 4350 2600 0    50   ~ 0
IR7
Text Label 4350 2400 0    50   ~ 0
~COND
Text Label 4350 2500 0    50   ~ 0
IN-RSVD
Text Label 4350 3400 0    50   ~ 0
IR15
Text Label 4350 3300 0    50   ~ 0
IR14
Text Label 4350 3200 0    50   ~ 0
IR13
Text Label 4350 3100 0    50   ~ 0
IR12
Text Label 4350 3000 0    50   ~ 0
IR11
Text Label 4350 2900 0    50   ~ 0
IR10
Text Label 4350 2800 0    50   ~ 0
IR9
Text Label 4350 2700 0    50   ~ 0
IR8
Text Label 4350 2300 0    50   ~ 0
IDX1
Text Label 4350 2200 0    50   ~ 0
IDX0
Wire Wire Line
	4350 3500 4700 3500
Wire Wire Line
	4350 2500 4700 2500
Wire Wire Line
	4350 2400 4700 2400
Wire Wire Line
	4350 3400 4700 3400
Wire Wire Line
	4350 3300 4700 3300
Wire Wire Line
	4350 3200 4700 3200
Wire Wire Line
	4350 3100 4700 3100
Wire Wire Line
	4350 3000 4700 3000
Wire Wire Line
	4350 2900 4700 2900
Wire Wire Line
	4350 2800 4700 2800
Wire Wire Line
	4350 2700 4700 2700
Wire Wire Line
	4350 2600 4700 2600
Wire Wire Line
	4350 2300 4700 2300
Wire Wire Line
	4350 2200 4700 2200
Text Label 4350 3600 0    50   ~ 0
~RSTHOLD
Text Label 4350 3500 0    50   ~ 0
~IRQSµC
Text Label 4350 2100 0    50   ~ 0
UPC3
Text Label 4350 2000 0    50   ~ 0
UPC2
Text Label 4350 1900 0    50   ~ 0
UPC1
Text Label 4350 1800 0    50   ~ 0
UPC0
Wire Wire Line
	4700 2100 4350 2100
Wire Wire Line
	4700 2000 4350 2000
Wire Wire Line
	4700 1900 4350 1900
Wire Wire Line
	4700 1800 4350 1800
Text Notes 5300 3450 0    100  ~ 20
µ01
Entry Wire Line
	3300 1800 3400 1900
Entry Wire Line
	3300 1900 3400 2000
Entry Wire Line
	3300 2000 3400 2100
Entry Wire Line
	3300 2100 3400 2200
Entry Wire Line
	3300 2200 3400 2300
Entry Wire Line
	3300 2300 3400 2400
Entry Wire Line
	3300 2400 3400 2500
Entry Wire Line
	3300 2500 3400 2600
Text Label 3050 1800 0    50   ~ 0
µCV0
Text Label 3050 1900 0    50   ~ 0
µCV1
Text Label 3050 2000 0    50   ~ 0
µCV2
Text Label 3050 2100 0    50   ~ 0
µCV3
Text Label 3050 2200 0    50   ~ 0
µCV4
Text Label 3050 2300 0    50   ~ 0
µCV5
Text Label 3050 2400 0    50   ~ 0
µCV6
Text Label 3050 2500 0    50   ~ 0
µCV7
Wire Wire Line
	1600 4750 1900 4750
Wire Wire Line
	1600 4850 1900 4850
Wire Wire Line
	1600 4950 1900 4950
Wire Wire Line
	1600 5050 1900 5050
Wire Wire Line
	1600 5150 1900 5150
Wire Wire Line
	1600 5250 1900 5250
Wire Wire Line
	1600 5350 1900 5350
Wire Wire Line
	1600 5450 1900 5450
Text Label 1650 4750 0    50   ~ 0
µCV0
Text Label 1650 4850 0    50   ~ 0
µCV1
Text Label 1650 4950 0    50   ~ 0
µCV2
Text Label 1650 5050 0    50   ~ 0
µCV3
Text Label 1650 5150 0    50   ~ 0
µCV4
Text Label 1650 5250 0    50   ~ 0
µCV5
Text Label 1650 5350 0    50   ~ 0
µCV6
Text Label 1650 5450 0    50   ~ 0
µCV7
Entry Wire Line
	1600 5450 1500 5350
Entry Wire Line
	1600 5350 1500 5250
Entry Wire Line
	1600 5250 1500 5150
Entry Wire Line
	1600 5150 1500 5050
Entry Wire Line
	1600 5050 1500 4950
Entry Wire Line
	1600 4950 1500 4850
Entry Wire Line
	1600 4850 1500 4750
Entry Wire Line
	1600 4750 1500 4650
Entry Bus Bus
	3400 4150 3300 4250
Wire Bus Line
	3300 4250 1600 4250
Entry Bus Bus
	1500 4350 1600 4250
Text Label 3400 3350 1    50   ~ 0
µCV[0..7]
Wire Wire Line
	5950 1800 6250 1800
Wire Wire Line
	5950 1900 6250 1900
Wire Wire Line
	5950 2000 6250 2000
Wire Wire Line
	5950 2100 6250 2100
Wire Wire Line
	5950 2200 6250 2200
Wire Wire Line
	5950 2300 6250 2300
Wire Wire Line
	5950 2400 6250 2400
Wire Wire Line
	5950 2500 6250 2500
Entry Wire Line
	6250 1800 6350 1900
Entry Wire Line
	6250 1900 6350 2000
Entry Wire Line
	6250 2000 6350 2100
Entry Wire Line
	6250 2100 6350 2200
Entry Wire Line
	6250 2200 6350 2300
Entry Wire Line
	6250 2300 6350 2400
Entry Wire Line
	6250 2400 6350 2500
Entry Wire Line
	6250 2500 6350 2600
Entry Bus Bus
	6350 4150 6250 4250
Wire Bus Line
	6250 4250 4550 4250
Text Label 6350 3350 1    50   ~ 0
µCV[8..15]
Text Label 6000 1800 0    50   ~ 0
µCV8
Text Label 6000 1900 0    50   ~ 0
µCV9
Text Label 6000 2000 0    50   ~ 0
µCV10
Text Label 6000 2100 0    50   ~ 0
µCV11
Text Label 6000 2200 0    50   ~ 0
µCV12
Text Label 6000 2300 0    50   ~ 0
µCV13
Text Label 6000 2400 0    50   ~ 0
µCV14
Text Label 6000 2500 0    50   ~ 0
µCV15
Text Label 4550 5650 0    50   ~ 0
CLK
Text Label 4550 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U59
U 1 1 5F517073
P 5350 5250
F 0 "U59" H 5350 6017 50  0000 C CNN
F 1 "74HC574" H 5350 5926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 5050 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5050 5200 50  0001 C CNN
F 4 "Yes" H 5200 4300 50  0001 C CNN "Verified"
	1    5350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5750 4550 5750
$Comp
L Device:R_Small R6
U 1 1 5F51707B
P 6000 4750
F 0 "R6" V 5950 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 6800 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 4750 50  0001 C CNN
F 3 "~" H 6000 4750 50  0001 C CNN
	1    6000 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R31
U 1 1 5F517081
P 6000 4850
F 0 "R31" V 5950 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 4850 50  0001 C CNN
F 3 "~" H 6000 4850 50  0001 C CNN
	1    6000 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R34
U 1 1 5F517087
P 6000 4950
F 0 "R34" V 5950 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 4950 50  0001 C CNN
F 3 "~" H 6000 4950 50  0001 C CNN
	1    6000 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R37
U 1 1 5F51708D
P 6000 5050
F 0 "R37" V 5950 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 5050 50  0001 C CNN
F 3 "~" H 6000 5050 50  0001 C CNN
	1    6000 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R40
U 1 1 5F517093
P 6000 5150
F 0 "R40" V 5950 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 5150 50  0001 C CNN
F 3 "~" H 6000 5150 50  0001 C CNN
	1    6000 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R43
U 1 1 5F517099
P 6000 5250
F 0 "R43" V 5950 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 5250 50  0001 C CNN
F 3 "~" H 6000 5250 50  0001 C CNN
	1    6000 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R46
U 1 1 5F51709F
P 6000 5350
F 0 "R46" V 5950 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 5350 50  0001 C CNN
F 3 "~" H 6000 5350 50  0001 C CNN
	1    6000 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R49
U 1 1 5F5170A5
P 6000 5450
F 0 "R49" V 5950 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 5750 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 5450 50  0001 C CNN
F 3 "~" H 6000 5450 50  0001 C CNN
	1    6000 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 4750 5900 4750
Wire Wire Line
	5850 4850 5900 4850
Wire Wire Line
	5850 4950 5900 4950
Wire Wire Line
	5850 5050 5900 5050
Wire Wire Line
	5850 5150 5900 5150
Wire Wire Line
	5850 5250 5900 5250
Wire Wire Line
	5850 5350 5900 5350
Wire Wire Line
	5850 5450 5900 5450
Entry Wire Line
	4550 5450 4450 5350
Entry Wire Line
	4550 5350 4450 5250
Entry Wire Line
	4550 5250 4450 5150
Entry Wire Line
	4550 5150 4450 5050
Entry Wire Line
	4550 5050 4450 4950
Entry Wire Line
	4550 4950 4450 4850
Entry Wire Line
	4550 4850 4450 4750
Entry Wire Line
	4550 4750 4450 4650
Entry Bus Bus
	4450 4350 4550 4250
Wire Bus Line
	9200 4250 7500 4250
Text Label 7500 5650 0    50   ~ 0
CLK
Text Label 7500 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U60
U 1 1 5F5592A3
P 8300 5250
F 0 "U60" H 8300 6017 50  0000 C CNN
F 1 "74HC574" H 8300 5926 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8000 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8000 5200 50  0001 C CNN
F 4 "Yes" H 8150 4300 50  0001 C CNN "Verified"
	1    8300 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5F5592AB
P 8950 4750
F 0 "R8" V 8900 4900 50  0000 C CNN
F 1 "0Ω/30Ω" V 9750 5000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 4750 50  0001 C CNN
F 3 "~" H 8950 4750 50  0001 C CNN
	1    8950 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R32
U 1 1 5F5592B1
P 8950 4850
F 0 "R32" V 8900 5000 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 4850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 4850 50  0001 C CNN
F 3 "~" H 8950 4850 50  0001 C CNN
	1    8950 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R35
U 1 1 5F5592B7
P 8950 4950
F 0 "R35" V 8900 5100 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 4950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 4950 50  0001 C CNN
F 3 "~" H 8950 4950 50  0001 C CNN
	1    8950 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R38
U 1 1 5F5592BD
P 8950 5050
F 0 "R38" V 8900 5200 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 5050 50  0001 C CNN
F 3 "~" H 8950 5050 50  0001 C CNN
	1    8950 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R41
U 1 1 5F5592C3
P 8950 5150
F 0 "R41" V 8900 5300 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 5150 50  0001 C CNN
F 3 "~" H 8950 5150 50  0001 C CNN
	1    8950 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R44
U 1 1 5F5592C9
P 8950 5250
F 0 "R44" V 8900 5400 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 5250 50  0001 C CNN
F 3 "~" H 8950 5250 50  0001 C CNN
	1    8950 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R47
U 1 1 5F5592CF
P 8950 5350
F 0 "R47" V 8900 5500 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 5350 50  0001 C CNN
F 3 "~" H 8950 5350 50  0001 C CNN
	1    8950 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R50
U 1 1 5F5592D5
P 8950 5450
F 0 "R50" V 8900 5600 50  0000 C CNN
F 1 "0Ω/30Ω" V 8700 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8950 5450 50  0001 C CNN
F 3 "~" H 8950 5450 50  0001 C CNN
	1    8950 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 4750 8850 4750
Wire Wire Line
	8800 4850 8850 4850
Wire Wire Line
	8800 4950 8850 4950
Wire Wire Line
	8800 5050 8850 5050
Wire Wire Line
	8800 5150 8850 5150
Wire Wire Line
	8800 5250 8850 5250
Wire Wire Line
	8800 5350 8850 5350
Wire Wire Line
	8800 5450 8850 5450
Entry Wire Line
	7500 5450 7400 5350
Entry Wire Line
	7500 5350 7400 5250
Entry Wire Line
	7500 5250 7400 5150
Entry Wire Line
	7500 5150 7400 5050
Entry Wire Line
	7500 5050 7400 4950
Entry Wire Line
	7500 4950 7400 4850
Entry Wire Line
	7500 4850 7400 4750
Entry Wire Line
	7500 4750 7400 4650
Entry Bus Bus
	7400 4350 7500 4250
Entry Wire Line
	9200 1800 9300 1900
Entry Wire Line
	9200 1900 9300 2000
Entry Wire Line
	9200 2000 9300 2100
Entry Wire Line
	9200 2100 9300 2200
Entry Wire Line
	9200 2200 9300 2300
Entry Wire Line
	9200 2300 9300 2400
Entry Wire Line
	9200 2400 9300 2500
Entry Wire Line
	9200 2500 9300 2600
Entry Bus Bus
	9300 4150 9200 4250
Text Label 9300 3350 1    50   ~ 0
µCV[8..15]
Text HLabel 9700 4750 2    50   Output ~ 0
ACTION1
Text HLabel 9700 4850 2    50   Output ~ 0
ACTION2
Text HLabel 9700 4950 2    50   Output ~ 0
ACTION3
Text HLabel 9700 5050 2    50   Output ~ 0
~MEM
Text HLabel 9700 5150 2    50   Output ~ 0
~IO
Text HLabel 9700 5250 2    50   Output ~ 0
~R
Text HLabel 9700 5350 2    50   Output ~ 0
~WEN
Text HLabel 9700 5450 2    50   Output ~ 0
~END
Text Label 9600 5250 2    50   ~ 0
~R
Text Label 9600 5150 2    50   ~ 0
~IO
Text Label 9600 5050 2    50   ~ 0
~MEM
Text Label 9600 5450 2    50   ~ 0
~END
Text Label 9600 5350 2    50   ~ 0
~WEN
Text Label 9600 4750 2    50   ~ 0
ACTION1
Text Label 9600 4850 2    50   ~ 0
ACTION2
Text Label 9600 4950 2    50   ~ 0
ACTION3
Wire Wire Line
	6100 4950 6800 4950
Wire Wire Line
	6100 5050 6800 5050
Wire Wire Line
	6100 5150 6800 5150
Wire Wire Line
	6100 5250 6800 5250
Wire Wire Line
	6100 5350 6800 5350
Wire Wire Line
	6100 5450 6800 5450
Wire Wire Line
	9050 4750 9700 4750
Wire Wire Line
	9050 4850 9700 4850
Wire Wire Line
	9050 4950 9700 4950
Wire Wire Line
	9050 5050 9700 5050
Wire Wire Line
	9050 5150 9700 5150
Wire Wire Line
	9050 5250 9700 5250
Wire Wire Line
	9050 5350 9700 5350
Wire Wire Line
	9050 5450 9700 5450
$Comp
L power:GND #PWR?
U 1 1 5F777533
P 5250 4000
AR Path="/5DEAC282/5F777533" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F777533" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 5250 3750 50  0001 C CNN
F 1 "GND" H 5100 3950 50  0000 C CNN
F 2 "" H 5250 4000 50  0001 C CNN
F 3 "" H 5250 4000 50  0001 C CNN
	1    5250 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F777539
P 5650 4000
AR Path="/5DEAC282/5F777539" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F777539" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 5650 3850 50  0001 C CNN
F 1 "+5V" H 5665 4173 50  0000 C CNN
F 2 "" H 5650 4000 50  0001 C CNN
F 3 "" H 5650 4000 50  0001 C CNN
	1    5650 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4000 5650 4000
$Comp
L power:GND #PWR?
U 1 1 5F777540
P 5400 4000
AR Path="/5DEAC282/5F777540" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F777540" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 5400 3750 50  0001 C CNN
F 1 "GND" H 5550 3950 50  0000 C CNN
F 2 "" H 5400 4000 50  0001 C CNN
F 3 "" H 5400 4000 50  0001 C CNN
	1    5400 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F78B738
P 8200 4000
AR Path="/5DEAC282/5F78B738" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F78B738" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 8200 3750 50  0001 C CNN
F 1 "GND" H 8050 3950 50  0000 C CNN
F 2 "" H 8200 4000 50  0001 C CNN
F 3 "" H 8200 4000 50  0001 C CNN
	1    8200 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F78B73E
P 8600 4000
AR Path="/5DEAC282/5F78B73E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F78B73E" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 8600 3850 50  0001 C CNN
F 1 "+5V" H 8615 4173 50  0000 C CNN
F 2 "" H 8600 4000 50  0001 C CNN
F 3 "" H 8600 4000 50  0001 C CNN
	1    8600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4000 8600 4000
$Comp
L power:GND #PWR?
U 1 1 5F78B745
P 8350 4000
AR Path="/5DEAC282/5F78B745" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F78B745" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 8350 3750 50  0001 C CNN
F 1 "GND" H 8500 3950 50  0000 C CNN
F 2 "" H 8350 4000 50  0001 C CNN
F 3 "" H 8350 4000 50  0001 C CNN
	1    8350 4000
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1450 7350 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3450 7350 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5450 7350 50  0001 C CNN
F 3 "~" H 5450 7350 50  0001 C CNN
	1    5450 7350
	1    0    0    -1  
$EndComp
Connection ~ 5450 7250
Connection ~ 5450 7450
Text HLabel 1300 6000 0    50   Input ~ 0
CLK
Text HLabel 1300 6100 0    50   Input ~ 0
~OE
Wire Wire Line
	1300 6100 1800 6100
Wire Wire Line
	7300 6000 7300 5650
Wire Wire Line
	7300 5650 7800 5650
Wire Wire Line
	1300 6000 1700 6000
Wire Wire Line
	1900 5650 1700 5650
Wire Wire Line
	1700 5650 1700 6000
Connection ~ 1700 6000
Wire Wire Line
	1700 6000 4450 6000
Wire Wire Line
	1900 5750 1800 5750
Wire Wire Line
	1800 5750 1800 6100
Connection ~ 1800 6100
Wire Wire Line
	4550 6100 4550 5750
Wire Wire Line
	1800 6100 4550 6100
Wire Wire Line
	4450 5650 4450 6000
Wire Wire Line
	4450 5650 4850 5650
Connection ~ 4450 6000
Wire Wire Line
	4450 6000 7300 6000
Wire Wire Line
	4550 6100 7400 6100
Wire Wire Line
	7400 6100 7400 5750
Wire Wire Line
	7400 5750 7800 5750
Connection ~ 4550 6100
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
	950  6025 1000 6025
Wire Notes Line style solid
	1000 5975 1050 5975
Wire Notes Line style solid
	1000 6025 1000 5975
Text Notes 2875 3750 1    50   ~ 0
microcode-00.bin
Text Notes 5825 3750 1    50   ~ 0
microcode-01.bin
Text Notes 8775 3750 1    50   ~ 0
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
	8900 1800 9200 1800
Wire Wire Line
	8900 1900 9200 1900
Wire Wire Line
	8900 2000 9200 2000
Wire Wire Line
	8900 2100 9200 2100
Wire Wire Line
	8900 2200 9200 2200
Wire Wire Line
	8900 2300 9200 2300
Wire Wire Line
	8900 2400 9200 2400
Wire Wire Line
	8900 2500 9200 2500
Text Label 9150 1800 2    50   ~ 0
µCV16
Text Label 9150 1900 2    50   ~ 0
µCV17
Text Label 9150 2000 2    50   ~ 0
µCV18
Text Label 9150 2100 2    50   ~ 0
µCV19
Text Label 9150 2200 2    50   ~ 0
µCV20
Text Label 9150 2300 2    50   ~ 0
µCV21
Text Label 9150 2400 2    50   ~ 0
µCV22
Text Label 9150 2500 2    50   ~ 0
µCV23
Wire Wire Line
	7800 4750 7500 4750
Wire Wire Line
	7800 4850 7500 4850
Wire Wire Line
	7800 4950 7500 4950
Wire Wire Line
	7800 5050 7500 5050
Wire Wire Line
	7800 5150 7500 5150
Wire Wire Line
	7800 5250 7500 5250
Wire Wire Line
	7800 5350 7500 5350
Wire Wire Line
	7800 5450 7500 5450
Text Label 7550 4750 0    50   ~ 0
µCV16
Text Label 7550 4850 0    50   ~ 0
µCV17
Text Label 7550 4950 0    50   ~ 0
µCV18
Text Label 7550 5050 0    50   ~ 0
µCV19
Text Label 7550 5150 0    50   ~ 0
µCV20
Text Label 7550 5250 0    50   ~ 0
µCV21
Text Label 7550 5350 0    50   ~ 0
µCV22
Text Label 7550 5450 0    50   ~ 0
µCV23
Wire Wire Line
	4550 4750 4850 4750
Wire Wire Line
	4550 4850 4850 4850
Wire Wire Line
	4550 4950 4850 4950
Wire Wire Line
	4550 5050 4850 5050
Wire Wire Line
	4550 5150 4850 5150
Wire Wire Line
	4550 5250 4850 5250
Wire Wire Line
	4550 5350 4850 5350
Wire Wire Line
	4550 5450 4850 5450
Text Label 4600 4750 0    50   ~ 0
µCV8
Text Label 4600 4850 0    50   ~ 0
µCV9
Text Label 4600 4950 0    50   ~ 0
µCV10
Text Label 4600 5050 0    50   ~ 0
µCV11
Text Label 4600 5150 0    50   ~ 0
µCV12
Text Label 4600 5250 0    50   ~ 0
µCV13
Text Label 4600 5350 0    50   ~ 0
µCV14
Text Label 4600 5450 0    50   ~ 0
µCV15
Wire Bus Line
	9300 1900 9300 4150
Wire Bus Line
	7400 4350 7400 5350
Wire Bus Line
	4450 4350 4450 5350
Wire Bus Line
	6350 1900 6350 4150
Wire Bus Line
	1500 4350 1500 5350
Wire Bus Line
	3400 1900 3400 4150
$EndSCHEMATC
