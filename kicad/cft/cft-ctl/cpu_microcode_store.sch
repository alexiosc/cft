EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 13
Title "Control Store (24×512k ROM)"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FA43
P 6750 2650
AR Path="/5E37FA43" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FA43" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA43" Ref="RN4"  Part="1" 
F 0 "RN4" V 6333 2650 50  0000 C CNN
F 1 "30Ω" V 6424 2650 50  0000 C CNN
F 2 "" V 7025 2650 50  0001 C CNN
F 3 "~" H 6750 2650 50  0001 C CNN
	1    6750 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FA49
P 6750 3050
AR Path="/5E37FA49" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FA49" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA49" Ref="RN7"  Part="1" 
F 0 "RN7" V 6983 3050 50  0000 C CNN
F 1 "30Ω" V 7074 3050 50  0000 C CNN
F 2 "" V 7025 3050 50  0001 C CNN
F 3 "~" H 6750 3050 50  0001 C CNN
	1    6750 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 2750 7400 2750
Wire Wire Line
	6950 2850 7400 2850
Wire Wire Line
	6950 2950 7400 2950
Wire Wire Line
	6950 3050 7400 3050
Wire Wire Line
	6950 3150 7400 3150
Text Label 7300 2750 2    50   ~ 0
~MEM
Text Label 7300 2850 2    50   ~ 0
~IO
Text Label 7300 2950 2    50   ~ 0
~R
Text Label 7300 3050 2    50   ~ 0
~WEN
Text Label 7300 3150 2    50   ~ 0
~END
$Comp
L power:+5V #PWR?
U 1 1 5E37FA67
P 6250 4650
AR Path="/5DEAC282/5E37FA67" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA67" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 6250 4500 50  0001 C CNN
F 1 "+5V" H 6265 4823 50  0000 C CNN
F 2 "" H 6250 4650 50  0001 C CNN
F 3 "" H 6250 4650 50  0001 C CNN
	1    6250 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4650 6250 4650
Text Notes 5900 4100 0    100  ~ 20
µ03
Wire Wire Line
	6950 2450 7400 2450
Wire Wire Line
	6950 2550 7400 2550
Wire Wire Line
	6950 2650 7400 2650
Text Label 7300 2450 2    50   ~ 0
ACTION1
Text Label 7300 2550 2    50   ~ 0
ACTION2
Text Label 7300 2650 2    50   ~ 0
ACTION3
Wire Wire Line
	5300 2450 4950 2450
Wire Wire Line
	5300 2550 4950 2550
Wire Wire Line
	5300 2650 4950 2650
Wire Wire Line
	5300 2750 4950 2750
Text Label 4950 2450 0    50   ~ 0
UPC0
Text Label 4950 2550 0    50   ~ 0
UPC1
Text Label 4950 2650 0    50   ~ 0
UPC2
Text Label 4950 2750 0    50   ~ 0
UPC3
Text Label 4950 4150 0    50   ~ 0
~IRQSµC
Text Label 4950 4250 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	4950 2850 5300 2850
Wire Wire Line
	4950 2950 5300 2950
Wire Wire Line
	4950 3250 5300 3250
Wire Wire Line
	4950 3350 5300 3350
Wire Wire Line
	4950 3450 5300 3450
Wire Wire Line
	4950 3550 5300 3550
Wire Wire Line
	4950 3650 5300 3650
Wire Wire Line
	4950 3750 5300 3750
Wire Wire Line
	4950 3850 5300 3850
Wire Wire Line
	4950 3950 5300 3950
Wire Wire Line
	4950 4050 5300 4050
Wire Wire Line
	4950 3050 5300 3050
Wire Wire Line
	4950 3150 5300 3150
Wire Wire Line
	4950 4150 5300 4150
Wire Wire Line
	4950 4250 5300 4250
Text Label 4950 2850 0    50   ~ 0
IDX0
Text Label 4950 2950 0    50   ~ 0
IDX1
Text Label 4950 3350 0    50   ~ 0
IR8
Text Label 4950 3450 0    50   ~ 0
IR9
Text Label 4950 3550 0    50   ~ 0
IR10
Text Label 4950 3650 0    50   ~ 0
IR11
Text Label 4950 3750 0    50   ~ 0
IR12
Text Label 4950 3850 0    50   ~ 0
IR13
Text Label 4950 3950 0    50   ~ 0
IR14
Text Label 4950 4050 0    50   ~ 0
IR15
Text Label 4950 3150 0    50   ~ 0
IN-RSVD
Text Label 4950 3050 0    50   ~ 0
~COND
Text Label 4950 3250 0    50   ~ 0
IR7
Text Label 4250 3150 2    50   ~ 0
WADDR2
Text Label 4250 3050 2    50   ~ 0
WADDR1
Text Label 4250 2950 2    50   ~ 0
WADDR0
Text Label 4250 2850 2    50   ~ 0
RADDR4
Text Label 4250 2750 2    50   ~ 0
RADDR3
Text Label 4250 2650 2    50   ~ 0
RADDR2
Text Label 4250 2550 2    50   ~ 0
RADDR1
Text Label 4250 2450 2    50   ~ 0
RADDR0
Wire Wire Line
	3900 3150 4350 3150
Wire Wire Line
	3900 3050 4350 3050
Wire Wire Line
	3900 2950 4350 2950
Wire Wire Line
	3900 2850 4350 2850
Wire Wire Line
	3900 2750 4350 2750
Wire Wire Line
	3900 2650 4350 2650
Wire Wire Line
	3900 2550 4350 2550
Wire Wire Line
	3900 2450 4350 2450
Text Notes 2800 4100 0    100  ~ 20
µ01
Wire Wire Line
	2950 4650 2950 4800
$Comp
L power:GND #PWR?
U 1 1 5E37FA6E
P 2800 4650
AR Path="/5DEAC282/5E37FA6E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA6E" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 2800 4400 50  0001 C CNN
F 1 "GND" H 2650 4600 50  0000 C CNN
F 2 "" H 2800 4650 50  0001 C CNN
F 3 "" H 2800 4650 50  0001 C CNN
	1    2800 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E37FA5A
P 3200 4650
AR Path="/5DEAC282/5E37FA5A" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA5A" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 3200 4500 50  0001 C CNN
F 1 "+5V" H 3215 4823 50  0000 C CNN
F 2 "" H 3200 4650 50  0001 C CNN
F 3 "" H 3200 4650 50  0001 C CNN
	1    3200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4650 3200 4650
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FA2B
P 3700 3050
AR Path="/5E37FA2B" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FA2B" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA2B" Ref="RN6"  Part="1" 
F 0 "RN6" V 3933 3050 50  0000 C CNN
F 1 "30Ω" V 4024 3050 50  0000 C CNN
F 2 "" V 3975 3050 50  0001 C CNN
F 3 "~" H 3700 3050 50  0001 C CNN
	1    3700 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FA25
P 3700 2650
AR Path="/5E37FA25" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FA25" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA25" Ref="RN3"  Part="1" 
F 0 "RN3" V 3283 2650 50  0000 C CNN
F 1 "30Ω" V 3374 2650 50  0000 C CNN
F 2 "" V 3975 2650 50  0001 C CNN
F 3 "~" H 3700 2650 50  0001 C CNN
	1    3700 2650
	0    1    1    0   
$EndComp
$Comp
L alexios:29F040 U?
U 1 1 5E37FA15
P 2900 3300
AR Path="/5DEAC282/5E37FA15" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA15" Ref="U52"  Part="1" 
F 0 "U52" H 2875 4417 50  0000 C CNN
F 1 "29F040" H 2875 4326 50  0000 C CNN
F 2 "alexios:PLCC32" H 2900 3300 50  0001 C CNN
F 3 "" H 2900 3300 50  0001 C CNN
	1    2900 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 1 1 5E3B6B58
P 5950 3300
AR Path="/5DEAC282/5E3B6B58" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B6B58" Ref="U53"  Part="1" 
F 0 "U53" H 5925 4417 50  0000 C CNN
F 1 "29F040" H 5925 4326 50  0000 C CNN
F 2 "alexios:PLCC32" H 5950 3300 50  0001 C CNN
F 3 "" H 5950 3300 50  0001 C CNN
	1    5950 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 1 1 5E3B5D62
P 9000 3300
AR Path="/5DEAC282/5E3B5D62" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B5D62" Ref="U54"  Part="1" 
F 0 "U54" H 8975 4417 50  0000 C CNN
F 1 "29F040" H 8975 4326 50  0000 C CNN
F 2 "alexios:PLCC32" H 9000 3300 50  0001 C CNN
F 3 "" H 9000 3300 50  0001 C CNN
	1    9000 3300
	1    0    0    -1  
$EndComp
Text Notes 5750 -350 0    50   ~ 0
Microcode ROMs are wired as a 512K×24 bit\ntable, so all address lines are the same but\ndata out lines differ.
Text Label 8000 3250 0    50   ~ 0
IR7
Text Label 8000 3050 0    50   ~ 0
~COND
Text Label 8000 3150 0    50   ~ 0
IN-RSVD
Text Label 8000 4050 0    50   ~ 0
IR15
Text Label 8000 3950 0    50   ~ 0
IR14
Text Label 8000 3850 0    50   ~ 0
IR13
Text Label 8000 3750 0    50   ~ 0
IR12
Text Label 8000 3650 0    50   ~ 0
IR11
Text Label 8000 3550 0    50   ~ 0
IR10
Text Label 8000 3450 0    50   ~ 0
IR9
Text Label 8000 3350 0    50   ~ 0
IR8
Text Label 8000 2950 0    50   ~ 0
IDX1
Text Label 8000 2850 0    50   ~ 0
IDX0
Wire Wire Line
	8000 4250 8350 4250
Wire Wire Line
	8000 4150 8350 4150
Wire Wire Line
	8000 3150 8350 3150
Wire Wire Line
	8000 3050 8350 3050
Wire Wire Line
	8000 4050 8350 4050
Wire Wire Line
	8000 3950 8350 3950
Wire Wire Line
	8000 3850 8350 3850
Wire Wire Line
	8000 3750 8350 3750
Wire Wire Line
	8000 3650 8350 3650
Wire Wire Line
	8000 3550 8350 3550
Wire Wire Line
	8000 3450 8350 3450
Wire Wire Line
	8000 3350 8350 3350
Wire Wire Line
	8000 3250 8350 3250
Wire Wire Line
	8000 2950 8350 2950
Wire Wire Line
	8000 2850 8350 2850
Text Label 8000 4250 0    50   ~ 0
~RSTHOLD
Text Label 8000 4150 0    50   ~ 0
~IRQSµC
Text Label 8000 2750 0    50   ~ 0
UPC3
Text Label 8000 2650 0    50   ~ 0
UPC2
Text Label 8000 2550 0    50   ~ 0
UPC1
Text Label 8000 2450 0    50   ~ 0
UPC0
Wire Wire Line
	8350 2750 8000 2750
Wire Wire Line
	8350 2650 8000 2650
Wire Wire Line
	8350 2550 8000 2550
Wire Wire Line
	8350 2450 8000 2450
Text Label 10350 3150 2    50   ~ 0
ACTION0
Text Label 10350 3050 2    50   ~ 0
COND4
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FAB0
P 9800 3050
AR Path="/5E37FAB0" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FAB0" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FAB0" Ref="RN8"  Part="1" 
F 0 "RN8" V 10033 3050 50  0000 C CNN
F 1 "30Ω" V 10124 3050 50  0000 C CNN
F 2 "" V 10075 3050 50  0001 C CNN
F 3 "~" H 9800 3050 50  0001 C CNN
	1    9800 3050
	0    1    1    0   
$EndComp
Text Label 10350 2950 2    50   ~ 0
COND3
Text Label 10350 2850 2    50   ~ 0
COND2
Text Label 10350 2750 2    50   ~ 0
COND1
Text Label 10350 2650 2    50   ~ 0
COND0
Text Label 10350 2550 2    50   ~ 0
WADDR4
Text Label 10350 2450 2    50   ~ 0
WADDR3
Wire Wire Line
	10000 3150 10450 3150
Wire Wire Line
	10000 3050 10450 3050
Wire Wire Line
	10000 2950 10450 2950
Wire Wire Line
	10000 2850 10450 2850
Wire Wire Line
	10000 2750 10450 2750
Wire Wire Line
	10000 2650 10450 2650
Wire Wire Line
	10000 2550 10450 2550
Wire Wire Line
	10000 2450 10450 2450
Text Notes 8950 4100 0    100  ~ 20
µ02
Wire Wire Line
	9050 4650 9050 4800
Wire Wire Line
	9200 4650 9300 4650
$Comp
L power:+5V #PWR?
U 1 1 5E37FA60
P 9300 4650
AR Path="/5DEAC282/5E37FA60" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA60" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 9300 4500 50  0001 C CNN
F 1 "+5V" H 9315 4823 50  0000 C CNN
F 2 "" H 9300 4650 50  0001 C CNN
F 3 "" H 9300 4650 50  0001 C CNN
	1    9300 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FA37
P 9800 2650
AR Path="/5E37FA37" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FA37" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA37" Ref="RN5"  Part="1" 
F 0 "RN5" V 9383 2650 50  0000 C CNN
F 1 "30Ω" V 9474 2650 50  0000 C CNN
F 2 "" V 10075 2650 50  0001 C CNN
F 3 "~" H 9800 2650 50  0001 C CNN
	1    9800 2650
	0    1    1    0   
$EndComp
Text HLabel 4350 2450 2    50   Output ~ 0
RADDR0
Text HLabel 4350 2550 2    50   Output ~ 0
RADDR1
Text HLabel 4350 2650 2    50   Output ~ 0
RADDR2
Text HLabel 4350 2750 2    50   Output ~ 0
RADDR3
Text HLabel 4350 2850 2    50   Output ~ 0
RADDR4
Text HLabel 4350 2950 2    50   Output ~ 0
WADDR0
Text HLabel 4350 3050 2    50   Output ~ 0
WADDR1
Text HLabel 4350 3150 2    50   Output ~ 0
WADDR2
Text HLabel 7400 2450 2    50   Output ~ 0
WADDR3
Text HLabel 7400 2550 2    50   Output ~ 0
WADDR4
Text HLabel 7400 2650 2    50   Output ~ 0
COND0
Text HLabel 7400 2750 2    50   Output ~ 0
COND1
Text HLabel 7400 2850 2    50   Output ~ 0
COND2
Text HLabel 7400 2950 2    50   Output ~ 0
COND3
Text HLabel 7400 3050 2    50   Output ~ 0
COND4
Text HLabel 7400 3150 2    50   Output ~ 0
ACTION0
Text HLabel 10450 2450 2    50   Output ~ 0
ACTION1
Text HLabel 10450 2550 2    50   Output ~ 0
ACTION2
Text HLabel 10450 2650 2    50   Output ~ 0
ACTION3
Text HLabel 10450 2750 2    50   Output ~ 0
~MEM
Text HLabel 10450 2850 2    50   Output ~ 0
~IO
Text HLabel 10450 2950 2    50   Output ~ 0
~R
Text HLabel 10450 3050 2    50   Output ~ 0
~WEN
Text HLabel 10450 3150 2    50   Output ~ 0
~END
Text HLabel 1150 4800 0    50   Input ~ 0
~CSE
Text Label 2250 4800 2    50   ~ 0
~CSE
Wire Wire Line
	6000 4800 6000 4650
$Comp
L alexios:29F040 U?
U 2 1 5E4A5D71
P 2950 5950
AR Path="/5DEAC282/5E4A5D71" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D71" Ref="U52"  Part="2" 
F 0 "U52" H 3130 6746 50  0000 L CNN
F 1 "29F040" H 3130 6655 50  0000 L CNN
F 2 "alexios:PLCC32" H 2950 5950 50  0001 C CNN
F 3 "" H 2950 5950 50  0001 C CNN
	2    2950 5950
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 2 1 5E4A5D77
P 6000 5950
AR Path="/5DEAC282/5E4A5D77" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D77" Ref="U53"  Part="2" 
F 0 "U53" H 6180 6746 50  0000 L CNN
F 1 "29F040" H 6180 6655 50  0000 L CNN
F 2 "alexios:PLCC32" H 6000 5950 50  0001 C CNN
F 3 "" H 6000 5950 50  0001 C CNN
	2    6000 5950
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 2 1 5E4A5D7D
P 9050 5950
AR Path="/5DEAC282/5E4A5D7D" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D7D" Ref="U54"  Part="2" 
F 0 "U54" H 9230 6746 50  0000 L CNN
F 1 "29F040" H 9230 6655 50  0000 L CNN
F 2 "alexios:PLCC32" H 9050 5950 50  0001 C CNN
F 3 "" H 9050 5950 50  0001 C CNN
	2    9050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5100 2500 5100
Connection ~ 2500 5100
Wire Wire Line
	2600 5300 2500 5300
Connection ~ 2500 5300
$Comp
L Device:C_Small C?
U 1 1 5E4A5D87
P 5550 5200
AR Path="/5CC0D65F/5E4A5D87" Ref="C?"  Part="1" 
AR Path="/5E4A5D87" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D87" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D87" Ref="C52"  Part="1" 
F 0 "C52" H 5459 5246 50  0000 R CNN
F 1 "100nF" H 5459 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5550 5200 50  0001 C CNN
F 3 "~" H 5550 5200 50  0001 C CNN
	1    5550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5100 5550 5100
Connection ~ 5550 5100
Wire Wire Line
	5550 5100 5150 5100
Wire Wire Line
	5650 5300 5550 5300
Connection ~ 5550 5300
Wire Wire Line
	5550 5300 5150 5300
$Comp
L Device:C_Small C?
U 1 1 5E4A5D93
P 5150 5200
AR Path="/5CC0D65F/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D93" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D93" Ref="C51"  Part="1" 
F 0 "C51" H 5059 5246 50  0000 R CNN
F 1 "10µF" H 5059 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5150 5200 50  0001 C CNN
F 3 "~" H 5150 5200 50  0001 C CNN
	1    5150 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E4A5D99
P 8600 5200
AR Path="/5CC0D65F/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5D99" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5D99" Ref="C54"  Part="1" 
F 0 "C54" H 8509 5246 50  0000 R CNN
F 1 "100nF" H 8509 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8600 5200 50  0001 C CNN
F 3 "~" H 8600 5200 50  0001 C CNN
	1    8600 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5100 8600 5100
Connection ~ 8600 5100
Wire Wire Line
	8600 5100 8200 5100
Wire Wire Line
	8700 5300 8600 5300
Connection ~ 8600 5300
Wire Wire Line
	8600 5300 8200 5300
$Comp
L Device:C_Small C?
U 1 1 5E4A5DA5
P 8200 5200
AR Path="/5CC0D65F/5E4A5DA5" Ref="C?"  Part="1" 
AR Path="/5E4A5DA5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DA5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DA5" Ref="C53"  Part="1" 
F 0 "C53" H 8109 5246 50  0000 R CNN
F 1 "10µF" H 8109 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8200 5200 50  0001 C CNN
F 3 "~" H 8200 5200 50  0001 C CNN
	1    8200 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4A5DAB
P 2600 5300
AR Path="/5DEAC282/5E4A5DAB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DAB" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 2600 5050 50  0001 C CNN
F 1 "GND" H 2605 5127 50  0000 C CNN
F 2 "" H 2600 5300 50  0001 C CNN
F 3 "" H 2600 5300 50  0001 C CNN
	1    2600 5300
	1    0    0    -1  
$EndComp
Connection ~ 2600 5300
$Comp
L power:GND #PWR?
U 1 1 5E4A5DB2
P 5650 5300
AR Path="/5DEAC282/5E4A5DB2" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DB2" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 5650 5050 50  0001 C CNN
F 1 "GND" H 5655 5127 50  0000 C CNN
F 2 "" H 5650 5300 50  0001 C CNN
F 3 "" H 5650 5300 50  0001 C CNN
	1    5650 5300
	1    0    0    -1  
$EndComp
Connection ~ 5650 5300
$Comp
L power:GND #PWR?
U 1 1 5E4A5DB9
P 8700 5300
AR Path="/5DEAC282/5E4A5DB9" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DB9" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 8700 5050 50  0001 C CNN
F 1 "GND" H 8705 5127 50  0000 C CNN
F 2 "" H 8700 5300 50  0001 C CNN
F 3 "" H 8700 5300 50  0001 C CNN
	1    8700 5300
	1    0    0    -1  
$EndComp
Connection ~ 8700 5300
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DC0
P 2600 5100
AR Path="/5DEAC282/5E4A5DC0" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DC0" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 2600 4950 50  0001 C CNN
F 1 "+5V" H 2615 5273 50  0000 C CNN
F 2 "" H 2600 5100 50  0001 C CNN
F 3 "" H 2600 5100 50  0001 C CNN
	1    2600 5100
	1    0    0    -1  
$EndComp
Connection ~ 2600 5100
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DC7
P 5650 5100
AR Path="/5DEAC282/5E4A5DC7" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DC7" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 5650 4950 50  0001 C CNN
F 1 "+5V" H 5665 5273 50  0000 C CNN
F 2 "" H 5650 5100 50  0001 C CNN
F 3 "" H 5650 5100 50  0001 C CNN
	1    5650 5100
	1    0    0    -1  
$EndComp
Connection ~ 5650 5100
$Comp
L power:+5V #PWR?
U 1 1 5E4A5DCE
P 8700 5100
AR Path="/5DEAC282/5E4A5DCE" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DCE" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 8700 4950 50  0001 C CNN
F 1 "+5V" H 8715 5273 50  0000 C CNN
F 2 "" H 8700 5100 50  0001 C CNN
F 3 "" H 8700 5100 50  0001 C CNN
	1    8700 5100
	1    0    0    -1  
$EndComp
Connection ~ 8700 5100
$Comp
L Device:C_Small C?
U 1 1 5E4A5DD5
P 2500 5200
AR Path="/5CC0D65F/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DD5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DD5" Ref="C50"  Part="1" 
F 0 "C50" H 2409 5246 50  0000 R CNN
F 1 "100nF" H 2409 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 5200 50  0001 C CNN
F 3 "~" H 2500 5200 50  0001 C CNN
	1    2500 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5300 2100 5300
Wire Wire Line
	2500 5100 2100 5100
$Comp
L Device:C_Small C?
U 1 1 5E4A5DDD
P 2100 5200
AR Path="/5CC0D65F/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E4A5DDD" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E4A5DDD" Ref="C49"  Part="1" 
F 0 "C49" H 2009 5246 50  0000 R CNN
F 1 "10µF" H 2009 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2100 5200 50  0001 C CNN
F 3 "~" H 2100 5200 50  0001 C CNN
	1    2100 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 4800 2950 4800
Connection ~ 2950 4800
Wire Wire Line
	2950 4800 6000 4800
Wire Wire Line
	6000 4800 9050 4800
Connection ~ 6000 4800
$Comp
L power:GND #PWR?
U 1 1 5D10A722
P 5850 4650
AR Path="/5DEAC282/5D10A722" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D10A722" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 5850 4400 50  0001 C CNN
F 1 "GND" H 5700 4600 50  0000 C CNN
F 2 "" H 5850 4650 50  0001 C CNN
F 3 "" H 5850 4650 50  0001 C CNN
	1    5850 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D10A9C4
P 8900 4650
AR Path="/5DEAC282/5D10A9C4" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D10A9C4" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 8900 4400 50  0001 C CNN
F 1 "GND" H 8750 4600 50  0000 C CNN
F 2 "" H 8900 4650 50  0001 C CNN
F 3 "" H 8900 4650 50  0001 C CNN
	1    8900 4650
	1    0    0    -1  
$EndComp
Text Notes 2300 -600 0    50   ~ 0
2019 Design Update: both micro-Address Vector and\nmicro-Control Vector have changed significantly in this\nversion. Fields are much more vertical now.
Text Notes 2300 -900 0    63   ~ 13
2019 Design Update
Text HLabel 1100 2450 0    50   Input ~ 0
UPC0
Text HLabel 1100 2550 0    50   Input ~ 0
UPC1
Text HLabel 1100 2650 0    50   Input ~ 0
UPC2
Text HLabel 1100 2750 0    50   Input ~ 0
UPC3
Text HLabel 1100 2850 0    50   Input ~ 0
IDX0
Text HLabel 1100 2950 0    50   Input ~ 0
IDX1
Text HLabel 1100 3050 0    50   Input ~ 0
~COND
Text HLabel 1100 3150 0    50   Input ~ 0
IN-RSVD
Text HLabel 1100 3250 0    50   Input ~ 0
IR7
Text HLabel 1100 3350 0    50   Input ~ 0
IR8
Text HLabel 1100 3450 0    50   Input ~ 0
IR9
Text HLabel 1100 3550 0    50   Input ~ 0
IR10
Text HLabel 1100 3650 0    50   Input ~ 0
IR11
Text HLabel 1100 3750 0    50   Input ~ 0
IR12
Text HLabel 1100 3850 0    50   Input ~ 0
IR13
Text HLabel 1100 3950 0    50   Input ~ 0
IR14
Text HLabel 1100 4050 0    50   Input ~ 0
IR15
Text HLabel 1100 4150 0    50   Input ~ 0
~IRQSµC
Text HLabel 1100 4250 0    50   Input ~ 0
~RSTHOLD
Wire Wire Line
	1100 2550 2250 2550
Wire Wire Line
	1100 2650 2250 2650
Wire Wire Line
	1100 2750 2250 2750
Wire Wire Line
	1100 2850 2250 2850
Wire Wire Line
	1100 2950 2250 2950
Wire Wire Line
	1100 3050 2250 3050
Wire Wire Line
	1100 3150 2250 3150
Wire Wire Line
	1100 3250 2250 3250
Wire Wire Line
	1100 3350 2250 3350
Wire Wire Line
	1100 3450 2250 3450
Wire Wire Line
	1100 3550 2250 3550
Wire Wire Line
	1100 3650 2250 3650
Wire Wire Line
	1100 3750 2250 3750
Wire Wire Line
	1100 3850 2250 3850
Wire Wire Line
	1100 3950 2250 3950
Wire Wire Line
	1100 4050 2250 4050
Wire Wire Line
	1100 4150 2250 4150
Wire Wire Line
	1100 4250 2250 4250
Wire Wire Line
	1100 2450 2250 2450
Text Label 2200 2450 2    50   ~ 0
UPC0
Text Label 2200 2550 2    50   ~ 0
UPC1
Text Label 2200 2650 2    50   ~ 0
UPC2
Text Label 2200 2750 2    50   ~ 0
UPC3
Text Label 2200 4150 2    50   ~ 0
~IRQSµC
Text Label 2200 4250 2    50   ~ 0
~RSTHOLD
Text Label 2200 2850 2    50   ~ 0
IDX0
Text Label 2200 2950 2    50   ~ 0
IDX1
Text Label 2200 3350 2    50   ~ 0
IR8
Text Label 2200 3450 2    50   ~ 0
IR9
Text Label 2200 3550 2    50   ~ 0
IR10
Text Label 2200 3650 2    50   ~ 0
IR11
Text Label 2200 3750 2    50   ~ 0
IR12
Text Label 2200 3850 2    50   ~ 0
IR13
Text Label 2200 3950 2    50   ~ 0
IR14
Text Label 2200 4050 2    50   ~ 0
IR15
Text Label 2200 3150 2    50   ~ 0
IN-RSVD
Text Label 2200 3050 2    50   ~ 0
~COND
Text Label 2200 3250 2    50   ~ 0
IR7
$EndSCHEMATC
