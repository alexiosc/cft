EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 14 17
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
	3550 3500 3900 3500
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
AR Path="/5DEAC282/5E34FD9B/5E4A5D87" Ref="C1702"  Part="1" 
F 0 "C1702" H 3259 6646 50  0000 R CNN
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
U 1 1 5E4A5D99
P 5350 6600
AR Path="/5CC0D65F/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D99" Ref="C1703"  Part="1" 
F 0 "C1703" H 5259 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5DA5" Ref="C1713"  Part="1" 
F 0 "C1713" H 4859 6646 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5DD5" Ref="C1701"  Part="1" 
F 0 "C1701" H 1259 6646 50  0000 R CNN
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
Text Notes 6800 6600 0    50   ~ 0
Both micro-Address Vector and micro-Control Vector have changed\nsignificantly in this version. Fields are much more vertical now.\n\nControl Vector outputs are now synchronous, on the rising edge of CLK.
Text Notes 6800 6200 0    63   ~ 13
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
Text HLabel 3050 4750 2    50   Output ~ 0
WADDR2
Text HLabel 3050 4850 2    50   Output ~ 0
WADDR1
Text HLabel 3050 4950 2    50   Output ~ 0
WADDR0
Text Label 2950 4750 2    50   ~ 0
WADDR2
Text Label 2950 4850 2    50   ~ 0
WADDR1
Text Label 2950 4950 2    50   ~ 0
WADDR0
Text HLabel 3050 5450 2    50   Output ~ 0
RADDR0
Text Label 2950 5450 2    50   ~ 0
RADDR0
Text HLabel 3050 5050 2    50   Output ~ 0
RADDR4
Text HLabel 3050 5150 2    50   Output ~ 0
RADDR3
Text HLabel 3050 5350 2    50   Output ~ 0
RADDR2
Text HLabel 3050 5250 2    50   Output ~ 0
RADDR1
Text Label 2950 5250 2    50   ~ 0
RADDR1
Text Label 2950 5350 2    50   ~ 0
RADDR2
Text Label 2950 5150 2    50   ~ 0
RADDR3
Text Label 2950 5050 2    50   ~ 0
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
Text Notes 6850 3450 0    100  ~ 20
µ02
Wire Wire Line
	6350 1800 6000 1800
Wire Wire Line
	6350 1900 6000 1900
Wire Wire Line
	6350 2000 6000 2000
Wire Wire Line
	6350 2100 6000 2100
Text Label 6000 1800 0    50   ~ 0
UPC0
Text Label 6000 1900 0    50   ~ 0
UPC1
Text Label 6000 2000 0    50   ~ 0
UPC2
Text Label 6000 2100 0    50   ~ 0
UPC3
Text Label 6000 3400 0    50   ~ 0
~IRQSµC
Text Label 6000 3500 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	6000 2200 6350 2200
Wire Wire Line
	6000 2300 6350 2300
Wire Wire Line
	6000 2500 6350 2500
Wire Wire Line
	6000 2600 6350 2600
Wire Wire Line
	6000 2700 6350 2700
Wire Wire Line
	6000 2800 6350 2800
Wire Wire Line
	6000 2900 6350 2900
Wire Wire Line
	6000 3000 6350 3000
Wire Wire Line
	6000 3100 6350 3100
Wire Wire Line
	6000 3200 6350 3200
Wire Wire Line
	6000 3300 6350 3300
Wire Wire Line
	6000 2400 6350 2400
Wire Wire Line
	6000 3400 6350 3400
Wire Wire Line
	6000 3500 6350 3500
Text Label 6000 2200 0    50   ~ 0
IDX0
Text Label 6000 2300 0    50   ~ 0
IDX1
Text Label 6000 2600 0    50   ~ 0
IR8
Text Label 6000 2700 0    50   ~ 0
IR9
Text Label 6000 2800 0    50   ~ 0
IR10
Text Label 6000 2900 0    50   ~ 0
IR11
Text Label 6000 3000 0    50   ~ 0
IR12
Text Label 6000 3100 0    50   ~ 0
IR13
Text Label 6000 3200 0    50   ~ 0
IR14
Text Label 6000 3300 0    50   ~ 0
IR15
Text Label 6000 2400 0    50   ~ 0
~COND
Text Label 6000 2500 0    50   ~ 0
IR7
Text HLabel 5500 5250 2    50   Output ~ 0
WADDR4
Text HLabel 5500 5450 2    50   Output ~ 0
WADDR3
Text Label 5400 5250 2    50   ~ 0
WADDR4
Text Label 5400 5450 2    50   ~ 0
WADDR3
Text HLabel 5500 4750 2    50   Output ~ 0
ACTION0
Text HLabel 5500 4950 2    50   Output ~ 0
COND4
Text HLabel 5500 4850 2    50   Output ~ 0
COND3
Text HLabel 5500 5350 2    50   Output ~ 0
COND0
Text Label 5400 5350 2    50   ~ 0
COND0
Text Label 5400 4850 2    50   ~ 0
COND3
Text Label 5400 4950 2    50   ~ 0
COND4
Text Label 5400 4750 2    50   ~ 0
ACTION0
Text Label 3550 2500 0    50   ~ 0
IR7
Text Label 3550 2400 0    50   ~ 0
~COND
Text Label 3550 3300 0    50   ~ 0
IR15
Text Label 3550 3200 0    50   ~ 0
IR14
Text Label 3550 3100 0    50   ~ 0
IR13
Text Label 3550 3000 0    50   ~ 0
IR12
Text Label 3550 2900 0    50   ~ 0
IR11
Text Label 3550 2800 0    50   ~ 0
IR10
Text Label 3550 2700 0    50   ~ 0
IR9
Text Label 3550 2600 0    50   ~ 0
IR8
Text Label 3550 2300 0    50   ~ 0
IDX1
Text Label 3550 2200 0    50   ~ 0
IDX0
Wire Wire Line
	3550 3400 3900 3400
Wire Wire Line
	3550 2400 3900 2400
Wire Wire Line
	3550 3300 3900 3300
Wire Wire Line
	3550 3200 3900 3200
Wire Wire Line
	3550 3100 3900 3100
Wire Wire Line
	3550 3000 3900 3000
Wire Wire Line
	3550 2900 3900 2900
Wire Wire Line
	3550 2800 3900 2800
Wire Wire Line
	3550 2700 3900 2700
Wire Wire Line
	3550 2600 3900 2600
Wire Wire Line
	3550 2500 3900 2500
Wire Wire Line
	3550 2300 3900 2300
Wire Wire Line
	3550 2200 3900 2200
Text Label 3550 3500 0    50   ~ 0
~RSTHOLD
Text Label 3550 3400 0    50   ~ 0
~IRQSµC
Text Label 3550 2100 0    50   ~ 0
UPC3
Text Label 3550 2000 0    50   ~ 0
UPC2
Text Label 3550 1900 0    50   ~ 0
UPC1
Text Label 3550 1800 0    50   ~ 0
UPC0
Wire Wire Line
	3900 2100 3550 2100
Wire Wire Line
	3900 2000 3550 2000
Wire Wire Line
	3900 1900 3550 1900
Wire Wire Line
	3900 1800 3550 1800
Text Notes 4400 3450 0    100  ~ 20
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
	5150 1800 5450 1800
Wire Wire Line
	5150 1900 5450 1900
Wire Wire Line
	5150 2000 5450 2000
Wire Wire Line
	5150 2100 5450 2100
Wire Wire Line
	5150 2200 5450 2200
Wire Wire Line
	5150 2300 5450 2300
Wire Wire Line
	5150 2400 5450 2400
Wire Wire Line
	5150 2500 5450 2500
Entry Wire Line
	5450 1800 5550 1900
Entry Wire Line
	5450 1900 5550 2000
Entry Wire Line
	5450 2000 5550 2100
Entry Wire Line
	5450 2100 5550 2200
Entry Wire Line
	5450 2200 5550 2300
Entry Wire Line
	5450 2300 5550 2400
Entry Wire Line
	5450 2400 5550 2500
Entry Wire Line
	5450 2500 5550 2600
Entry Bus Bus
	5550 4050 5450 4150
Wire Bus Line
	5450 4150 3750 4150
Text Label 5550 3350 1    50   ~ 0
µCV[8..15]
Text Label 5200 1800 0    50   ~ 0
µCV8
Text Label 5200 1900 0    50   ~ 0
µCV9
Text Label 5200 2000 0    50   ~ 0
µCV10
Text Label 5200 2100 0    50   ~ 0
µCV11
Text Label 5200 2200 0    50   ~ 0
µCV12
Text Label 5200 2300 0    50   ~ 0
µCV13
Text Label 5200 2400 0    50   ~ 0
µCV14
Text Label 5200 2500 0    50   ~ 0
µCV15
Text Label 3750 5650 0    50   ~ 0
CLK
Text Label 3750 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U1706
U 1 1 5F517073
P 4550 5250
F 0 "U1706" H 4550 6017 50  0000 C CNN
F 1 "74HC574" H 4550 5926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4250 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4250 5200 50  0001 C CNN
F 4 "Yes" H 4400 4300 50  0001 C CNN "Verified"
	1    4550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5750 3750 5750
Entry Wire Line
	3750 5450 3650 5350
Entry Wire Line
	3750 5350 3650 5250
Entry Wire Line
	3750 5250 3650 5150
Entry Wire Line
	3750 5150 3650 5050
Entry Wire Line
	3750 5050 3650 4950
Entry Wire Line
	3750 4950 3650 4850
Entry Wire Line
	3750 4850 3650 4750
Entry Wire Line
	3750 4750 3650 4650
Entry Bus Bus
	3650 4250 3750 4150
Wire Bus Line
	7900 4150 6200 4150
Text Label 6200 5650 0    50   ~ 0
CLK
Text Label 6200 5750 0    50   ~ 0
~OE
$Comp
L alexios:74HC574 U1707
U 1 1 5F5592A3
P 7000 5250
F 0 "U1707" H 7000 6017 50  0000 C CNN
F 1 "74HC574" H 7000 5926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6700 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc574.pdf" H 6700 5200 50  0001 C CNN
F 4 "Yes" H 6850 4300 50  0001 C CNN "Verified"
	1    7000 5250
	1    0    0    -1  
$EndComp
Entry Wire Line
	6200 5450 6100 5350
Entry Wire Line
	6200 5350 6100 5250
Entry Wire Line
	6200 5250 6100 5150
Entry Wire Line
	6200 5150 6100 5050
Entry Wire Line
	6200 5050 6100 4950
Entry Wire Line
	6200 4950 6100 4850
Entry Wire Line
	6200 4850 6100 4750
Entry Wire Line
	6200 4750 6100 4650
Entry Bus Bus
	6100 4250 6200 4150
Entry Wire Line
	7900 1800 8000 1900
Entry Wire Line
	7900 1900 8000 2000
Entry Wire Line
	7900 2000 8000 2100
Entry Wire Line
	7900 2100 8000 2200
Entry Wire Line
	7900 2200 8000 2300
Entry Wire Line
	7900 2300 8000 2400
Entry Wire Line
	7900 2400 8000 2500
Entry Wire Line
	7900 2500 8000 2600
Text Label 8000 3350 1    50   ~ 0
µCV[8..15]
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
AR Path="/5DEAC282/5E34FD9B/5F7E1852" Ref="C1705"  Part="1" 
F 0 "C1705" H 1359 7396 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5F82A395" Ref="C1706"  Part="1" 
F 0 "C1706" H 3359 7396 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5F8510EF" Ref="C1707"  Part="1" 
F 0 "C1707" H 5359 7396 50  0000 R CNN
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
	6000 6000 6000 5650
Wire Wire Line
	6000 5650 6500 5650
Wire Wire Line
	1000 6000 1400 6000
Wire Wire Line
	1600 5650 1400 5650
Wire Wire Line
	1400 5650 1400 6000
Connection ~ 1400 6000
Wire Wire Line
	1400 6000 3650 6000
Wire Wire Line
	1600 5750 1500 5750
Wire Wire Line
	1500 5750 1500 6100
Connection ~ 1500 6100
Wire Wire Line
	3750 6100 3750 5750
Wire Wire Line
	1500 6100 3750 6100
Wire Wire Line
	3650 5650 3650 6000
Wire Wire Line
	3650 5650 4050 5650
Connection ~ 3650 6000
Wire Wire Line
	3650 6000 6000 6000
Wire Wire Line
	3750 6100 6100 6100
Wire Wire Line
	6100 6100 6100 5750
Wire Wire Line
	6100 5750 6500 5750
Connection ~ 3750 6100
Wire Notes Line width 24 style solid
	6700 6000 9700 6000
Wire Notes Line width 24 style solid
	9700 6000 9700 6700
Wire Notes Line width 24 style solid
	9700 6700 6700 6700
Wire Notes Line width 24 style solid
	6700 6700 6700 6000
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
Text Notes 4850 3750 2    50   ~ 0
microcode-01.bin
Text Notes 7300 3750 2    50   ~ 0
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
	7600 1800 7900 1800
Wire Wire Line
	7600 1900 7900 1900
Wire Wire Line
	7600 2000 7900 2000
Wire Wire Line
	7600 2100 7900 2100
Wire Wire Line
	7600 2200 7900 2200
Wire Wire Line
	7600 2300 7900 2300
Wire Wire Line
	7600 2400 7900 2400
Wire Wire Line
	7600 2500 7900 2500
Text Label 7850 1800 2    50   ~ 0
µCV16
Text Label 7850 1900 2    50   ~ 0
µCV17
Text Label 7850 2000 2    50   ~ 0
µCV18
Text Label 7850 2100 2    50   ~ 0
µCV19
Text Label 7850 2200 2    50   ~ 0
µCV20
Text Label 7850 2300 2    50   ~ 0
µCV21
Text Label 7850 2400 2    50   ~ 0
µCV22
Text Label 7850 2500 2    50   ~ 0
µCV23
Wire Wire Line
	6500 5450 6200 5450
Wire Wire Line
	6500 5250 6200 5250
Wire Wire Line
	6500 5350 6200 5350
Wire Wire Line
	6500 5150 6200 5150
Wire Wire Line
	6500 5050 6200 5050
Wire Wire Line
	6500 4950 6200 4950
Wire Wire Line
	6500 4850 6200 4850
Wire Wire Line
	6500 4750 6200 4750
Text Label 6250 5450 0    50   ~ 0
µCV16
Text Label 6250 5250 0    50   ~ 0
µCV17
Text Label 6250 5350 0    50   ~ 0
µCV18
Text Label 6250 5150 0    50   ~ 0
µCV19
Text Label 6250 5050 0    50   ~ 0
µCV20
Text Label 6250 4950 0    50   ~ 0
µCV21
Text Label 6250 4850 0    50   ~ 0
µCV22
Text Label 6250 4750 0    50   ~ 0
µCV23
Wire Wire Line
	3750 5450 4050 5450
Wire Wire Line
	3750 5250 4050 5250
Wire Wire Line
	3750 5350 4050 5350
Wire Wire Line
	3750 4750 4050 4750
Text Label 3800 5450 0    50   ~ 0
µCV8
Text Label 3800 5250 0    50   ~ 0
µCV9
Text Label 3800 4750 0    50   ~ 0
µCV15
Text Label 3100 3350 1    50   ~ 0
µCV[0..7]
Text HLabel 10600 3100 2    50   Output ~ 0
~WEN
Text HLabel 10600 3300 2    50   Output ~ 0
~IO
Text HLabel 10600 3200 2    50   Output ~ 0
~MEM
Text Label 8150 3650 0    50   ~ 0
~MEM0
Text Label 8150 3750 0    50   ~ 0
~IO0
Text Label 8150 3850 0    50   ~ 0
~R0
Text Label 8150 3550 0    50   ~ 0
~WEN0
Text Notes 9000 1950 0    50   ~ 0
The '157 mux disables bus transactions\nduring ~NRSTHOLD~ to ensure undefined\ncontrol signals don't have unforeseen\nside effects on peripherals.
Entry Bus Bus
	8000 4050 7900 4150
$Comp
L power:+5V #PWR?
U 1 1 5F2CC361
P 9350 2300
AR Path="/5DEAC282/5F2CC361" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F2CC361" Ref="#PWR01701"  Part="1" 
F 0 "#PWR01701" H 9350 2150 50  0001 C CNN
F 1 "+5V" H 9365 2473 50  0000 C CNN
F 2 "" H 9350 2300 50  0001 C CNN
F 3 "" H 9350 2300 50  0001 C CNN
	1    9350 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01702
U 1 1 5F2CC367
P 9350 2500
F 0 "#PWR01702" H 9350 2250 50  0001 C CNN
F 1 "GND" H 9355 2327 50  0000 C CNN
F 2 "" H 9350 2500 50  0001 C CNN
F 3 "" H 9350 2500 50  0001 C CNN
	1    9350 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F2CC36D
P 9350 2400
AR Path="/5CC0D65F/5F2CC36D" Ref="C?"  Part="1" 
AR Path="/5F2CC36D" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5F2CC36D" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F2CC36D" Ref="C1704"  Part="1" 
F 0 "C1704" H 9259 2446 50  0000 R CNN
F 1 "100nF" H 9259 2355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 2400 50  0001 C CNN
F 3 "~" H 9350 2400 50  0001 C CNN
	1    9350 2400
	1    0    0    -1  
$EndComp
Connection ~ 9350 2300
Connection ~ 9350 2500
$Comp
L power:+5V #PWR01703
U 1 1 5F3FDE6E
P 9100 2900
F 0 "#PWR01703" H 9100 2750 50  0001 C CNN
F 1 "+5V" H 9115 3073 50  0000 C CNN
F 2 "" H 9100 2900 50  0001 C CNN
F 3 "" H 9100 2900 50  0001 C CNN
	1    9100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2900 9100 2950
Wire Wire Line
	9100 3400 9150 3400
Wire Wire Line
	9150 3100 9100 3100
Connection ~ 9100 3100
Wire Wire Line
	9100 3100 9100 3200
Wire Wire Line
	9150 3200 9100 3200
Connection ~ 9100 3200
Wire Wire Line
	9100 3200 9100 3300
Wire Wire Line
	9150 3300 9100 3300
Connection ~ 9100 3300
Wire Wire Line
	9100 3300 9100 3400
Wire Wire Line
	9150 4000 8800 4000
Text Label 8800 4000 0    50   ~ 0
~RSTHOLD
Text HLabel 10600 3400 2    50   Output ~ 0
~R
$Comp
L alexios:74AC157 U1704
U 2 1 5F2BA5E3
P 9700 2900
F 0 "U1704" H 9880 3446 50  0000 L CNN
F 1 "74AC157" H 9880 3355 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9700 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 9700 2900 50  0001 C CNN
	2    9700 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AC157 U1704
U 1 1 5EF0EC27
P 9650 3700
F 0 "U1704" H 9650 4567 50  0000 C CNN
F 1 "74AC157" H 9650 4476 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 9650 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 9650 3700 50  0001 C CNN
	1    9650 3700
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
P 4550 2650
F 0 "U1702" H 4525 3767 50  0000 C CNN
F 1 "AT27C020" H 4525 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 3925 875 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 4550 2650 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 4225 775 50  0001 C CNN "Mouser"
	1    4550 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F9EA638
P 5200 2850
AR Path="/5DEAC282/5F9EA638" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F9EA638" Ref="#PWR01705"  Part="1" 
F 0 "#PWR01705" H 5200 2700 50  0001 C CNN
F 1 "+5V" H 5215 3023 50  0000 C CNN
F 2 "" H 5200 2850 50  0001 C CNN
F 3 "" H 5200 2850 50  0001 C CNN
	1    5200 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2850 5200 2900
Wire Wire Line
	5200 3100 5150 3100
Wire Wire Line
	5150 2900 5200 2900
Connection ~ 5200 2900
Wire Wire Line
	5200 2900 5200 3100
Wire Wire Line
	5150 3300 5200 3300
Wire Wire Line
	5200 3300 5200 3500
Wire Wire Line
	5150 3500 5200 3500
Connection ~ 5200 3500
Wire Wire Line
	5200 3500 5200 3550
$Comp
L power:GND #PWR?
U 1 1 5F9EA648
P 5200 3550
AR Path="/5DEAC282/5F9EA648" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5F9EA648" Ref="#PWR01708"  Part="1" 
F 0 "#PWR01708" H 5200 3300 50  0001 C CNN
F 1 "GND" H 5205 3377 50  0000 C CNN
F 2 "" H 5200 3550 50  0001 C CNN
F 3 "" H 5200 3550 50  0001 C CNN
	1    5200 3550
	1    0    0    -1  
$EndComp
$Comp
L alexios:AT27C020 U1703
U 1 1 5F9FE4FB
P 7000 2650
F 0 "U1703" H 6975 3767 50  0000 C CNN
F 1 "AT27C020" H 6975 3676 50  0000 C CNN
F 2 "alexios:PLCC32" H 6375 875 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/268/atmel_doc0570-1280178.pdf" H 7000 2650 50  0001 C CNN
F 4 "556-AT27C020-55JU; €3.02" H 6675 775 50  0001 C CNN "Mouser"
	1    7000 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FA02F58
P 7650 2850
AR Path="/5DEAC282/5FA02F58" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5FA02F58" Ref="#PWR01706"  Part="1" 
F 0 "#PWR01706" H 7650 2700 50  0001 C CNN
F 1 "+5V" H 7665 3023 50  0000 C CNN
F 2 "" H 7650 2850 50  0001 C CNN
F 3 "" H 7650 2850 50  0001 C CNN
	1    7650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2850 7650 2900
Wire Wire Line
	7650 3100 7600 3100
Wire Wire Line
	7600 2900 7650 2900
Connection ~ 7650 2900
Wire Wire Line
	7650 2900 7650 3100
Wire Wire Line
	7600 3300 7650 3300
Wire Wire Line
	7650 3300 7650 3500
Wire Wire Line
	7600 3500 7650 3500
Connection ~ 7650 3500
Wire Wire Line
	7650 3500 7650 3550
$Comp
L power:GND #PWR?
U 1 1 5FA02F68
P 7650 3550
AR Path="/5DEAC282/5FA02F68" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5FA02F68" Ref="#PWR01709"  Part="1" 
F 0 "#PWR01709" H 7650 3300 50  0001 C CNN
F 1 "GND" H 7655 3377 50  0000 C CNN
F 2 "" H 7650 3550 50  0001 C CNN
F 3 "" H 7650 3550 50  0001 C CNN
	1    7650 3550
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
Text Label 7850 4750 2    50   ~ 0
~END
Text HLabel 7900 5450 2    50   Output ~ 0
ACTION1
Text HLabel 7900 5250 2    50   Output ~ 0
ACTION2
Text HLabel 7900 5350 2    50   Output ~ 0
ACTION3
Text Label 7850 5450 2    50   ~ 0
ACTION1
Text Label 7850 5250 2    50   ~ 0
ACTION2
Text Label 7850 5350 2    50   ~ 0
ACTION3
Wire Wire Line
	7500 4850 7850 4850
Wire Wire Line
	7500 4950 7850 4950
Wire Wire Line
	7500 5050 7850 5050
Wire Wire Line
	7500 5150 7850 5150
Text Label 7850 4850 2    50   ~ 0
~WEN0
Text Label 7850 4950 2    50   ~ 0
~R0
Text Label 7850 5050 2    50   ~ 0
~IO0
Text Label 7850 5150 2    50   ~ 0
~MEM0
Text Notes 3500 4400 2    50   ~ 10
NOTE: '574 pins are out of order for easier routing!
Text Label 3800 5350 0    50   ~ 0
µCV10
Text HLabel 5500 5150 2    50   Output ~ 0
COND2
Text HLabel 5500 5050 2    50   Output ~ 0
COND1
Text Label 5400 5050 2    50   ~ 0
COND1
Text Label 5400 5150 2    50   ~ 0
COND2
Text Label 3800 5150 0    50   ~ 0
µCV12
Text Label 3800 5050 0    50   ~ 0
µCV11
Wire Wire Line
	3750 5150 4050 5150
Wire Wire Line
	3750 5050 4050 5050
Text Label 3800 4950 0    50   ~ 0
µCV14
Text Label 3800 4850 0    50   ~ 0
µCV13
Wire Wire Line
	3750 4950 4050 4950
Wire Wire Line
	3750 4850 4050 4850
$Comp
L Device:C_Small C?
U 1 1 5E4A5D93
P 2950 6600
AR Path="/5CC0D65F/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D93" Ref="C1712"  Part="1" 
F 0 "C1712" H 2859 6646 50  0000 R CNN
F 1 "10µF" H 2859 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2950 6600 50  0001 C CNN
F 3 "~" H 2950 6600 50  0001 C CNN
	1    2950 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4A5DDD
P 950 6600
AR Path="/5CC0D65F/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DDD" Ref="C1711"  Part="1" 
F 0 "C1711" H 859 6646 50  0000 R CNN
F 1 "10µF" H 859 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6600 50  0001 C CNN
F 3 "~" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5250 7900 5250
Wire Wire Line
	7500 5350 7900 5350
Wire Wire Line
	7500 5450 7900 5450
Wire Wire Line
	2600 4750 3050 4750
Wire Wire Line
	2600 4850 3050 4850
Wire Wire Line
	2600 4950 3050 4950
Wire Wire Line
	2600 5050 3050 5050
Wire Wire Line
	2600 5150 3050 5150
Wire Wire Line
	2600 5250 3050 5250
Wire Wire Line
	2600 5350 3050 5350
Wire Wire Line
	2600 5450 3050 5450
Wire Wire Line
	5050 4750 5500 4750
Wire Wire Line
	5050 4850 5500 4850
Wire Wire Line
	5050 4950 5500 4950
Wire Wire Line
	5050 5050 5500 5050
Wire Wire Line
	5050 5150 5500 5150
Wire Wire Line
	5050 5250 5500 5250
Wire Wire Line
	5050 5350 5500 5350
Wire Wire Line
	5050 5450 5500 5450
Wire Wire Line
	10150 3200 10600 3200
Wire Wire Line
	10150 3300 10600 3300
Wire Wire Line
	10150 3400 10600 3400
Wire Wire Line
	10150 3100 10600 3100
Wire Wire Line
	7500 4750 7900 4750
Text HLabel 7900 4750 2    50   Output ~ 0
~END
Wire Wire Line
	9150 4100 8800 4100
Text Label 8800 4100 0    50   ~ 0
~OE
$Comp
L Device:R_Network05 RN?
U 1 1 62C78DB0
P 8750 3200
AR Path="/5DEAC282/62C78DB0" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/62C78DB0" Ref="RN1701"  Part="1" 
F 0 "RN1701" H 9037 3246 50  0000 L CNN
F 1 "10kΩ" H 9037 3155 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP6" V 9125 3200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8750 3200 50  0001 C CNN
	1    8750 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8950 3000 8950 2950
Wire Wire Line
	8950 2950 9100 2950
Connection ~ 9100 2950
Wire Wire Line
	9100 2950 9100 3100
Wire Wire Line
	8150 3550 8850 3550
Wire Wire Line
	8150 3650 8550 3650
Wire Wire Line
	8150 3750 8650 3750
Wire Wire Line
	8150 3850 8750 3850
Wire Wire Line
	8850 3400 8850 3550
Connection ~ 8850 3550
Wire Wire Line
	8850 3550 9150 3550
Wire Wire Line
	8750 3400 8750 3850
Connection ~ 8750 3850
Wire Wire Line
	8750 3850 9150 3850
Wire Wire Line
	8650 3400 8650 3750
Connection ~ 8650 3750
Wire Wire Line
	8650 3750 9150 3750
Wire Wire Line
	8550 3400 8550 3650
Wire Bus Line
	8000 1900 8000 4050
Wire Bus Line
	6100 4250 6100 5350
Wire Bus Line
	3650 4250 3650 5350
Wire Bus Line
	5550 1900 5550 4050
Wire Bus Line
	1200 4250 1200 5350
Wire Bus Line
	3100 1900 3100 4050
Connection ~ 8550 3650
Wire Wire Line
	8550 3650 9150 3650
$EndSCHEMATC
