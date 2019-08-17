EESchema Schematic File Version 4
LIBS:cft-pb0-cache
LIBS:cft-card-blank-single-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 9
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
L Device:R_Pack04 RN?
U 1 1 5D158134
P 6750 2950
AR Path="/5D158134" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5D158134" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158134" Ref="RN7"  Part="1" 
F 0 "RN7" V 6333 2950 50  0000 C CNN
F 1 "30Ω" V 6424 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0612" V 7025 2950 50  0001 C CNN
F 3 "~" H 6750 2950 50  0001 C CNN
	1    6750 2950
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5D158135
P 6750 2550
AR Path="/5D158135" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5D158135" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158135" Ref="RN8"  Part="1" 
F 0 "RN8" V 6983 2550 50  0000 C CNN
F 1 "30Ω" V 7074 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0612" V 7025 2550 50  0001 C CNN
F 3 "~" H 6750 2550 50  0001 C CNN
	1    6750 2550
	0    1    -1   0   
$EndComp
Wire Wire Line
	10000 2750 10450 2750
Wire Wire Line
	10000 2850 10450 2850
Wire Wire Line
	10000 2950 10450 2950
Wire Wire Line
	10000 3050 10450 3050
Wire Wire Line
	10000 3150 10450 3150
Text Label 10350 2750 2    50   ~ 0
~MEM
Text Label 10350 2850 2    50   ~ 0
~IO
Text Label 10350 2950 2    50   ~ 0
~R
Text Label 10350 3050 2    50   ~ 0
~WEN
Text Label 10350 3150 2    50   ~ 0
~END
$Comp
L power:+5V #PWR?
U 1 1 5D158138
P 6250 4650
AR Path="/5DEAC282/5D158138" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158138" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 6250 4500 50  0001 C CNN
F 1 "+5V" H 6265 4823 50  0000 C CNN
F 2 "" H 6250 4650 50  0001 C CNN
F 3 "" H 6250 4650 50  0001 C CNN
	1    6250 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4650 6250 4650
Text Notes 8950 4100 0    100  ~ 20
µ03
Wire Wire Line
	10000 2450 10450 2450
Wire Wire Line
	10000 2550 10450 2550
Wire Wire Line
	10000 2650 10450 2650
Text Label 10350 2450 2    50   ~ 0
ACTION1
Text Label 10350 2550 2    50   ~ 0
ACTION2
Text Label 10350 2650 2    50   ~ 0
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
~IRQSUC
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
COND
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
AR Path="/5DEAC282/5E34FD9B/5E37FA6E" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 2800 4400 50  0001 C CNN
F 1 "GND" H 2650 4600 50  0000 C CNN
F 2 "" H 2800 4650 50  0001 C CNN
F 3 "" H 2800 4650 50  0001 C CNN
	1    2800 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D158136
P 3200 4650
AR Path="/5DEAC282/5D158136" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158136" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 3200 4500 50  0001 C CNN
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
U 1 1 5D158132
P 3700 2550
AR Path="/5D158132" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5D158132" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158132" Ref="RN6"  Part="1" 
F 0 "RN6" V 3933 2550 50  0000 C CNN
F 1 "30Ω" V 4024 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0612" V 3975 2550 50  0001 C CNN
F 3 "~" H 3700 2550 50  0001 C CNN
	1    3700 2550
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E37FA25
P 3700 2950
AR Path="/5E37FA25" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E37FA25" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA25" Ref="RN5"  Part="1" 
F 0 "RN5" V 3283 2950 50  0000 C CNN
F 1 "30Ω" V 3374 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0612" V 3975 2950 50  0001 C CNN
F 3 "~" H 3700 2950 50  0001 C CNN
	1    3700 2950
	0    1    -1   0   
$EndComp
$Comp
L alexios:29F040 U?
U 1 1 5E37FA15
P 2900 3300
AR Path="/5DEAC282/5E37FA15" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E37FA15" Ref="U24"  Part="1" 
F 0 "U24" H 2875 4417 50  0000 C CNN
F 1 "29F040" H 2875 4326 50  0000 C CNN
F 2 "Sockets:PLCC32" H 2900 3300 50  0001 C CNN
F 3 "" H 2900 3300 50  0001 C CNN
	1    2900 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 1 1 5E3B6B58
P 9000 3300
AR Path="/5DEAC282/5E3B6B58" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B6B58" Ref="U25"  Part="1" 
F 0 "U25" H 8975 4417 50  0000 C CNN
F 1 "29F040" H 8975 4326 50  0000 C CNN
F 2 "Sockets:PLCC32" H 9000 3300 50  0001 C CNN
F 3 "" H 9000 3300 50  0001 C CNN
	1    9000 3300
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 1 1 5E3B5D62
P 5950 3300
AR Path="/5DEAC282/5E3B5D62" Ref="U?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E3B5D62" Ref="U26"  Part="1" 
F 0 "U26" H 5925 4417 50  0000 C CNN
F 1 "29F040" H 5925 4326 50  0000 C CNN
F 2 "Sockets:PLCC32" H 5950 3300 50  0001 C CNN
F 3 "" H 5950 3300 50  0001 C CNN
	1    5950 3300
	1    0    0    -1  
$EndComp
Text Notes 5750 -350 0    50   ~ 0
Microcode ROMs are wired as a 512K×24 bit\ntable, so all address lines are the same but\ndata out lines differ.
Text Label 8000 3250 0    50   ~ 0
IR7
Text Label 8000 3050 0    50   ~ 0
COND
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
~IRQSUC
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
Text Label 7300 3150 2    50   ~ 0
ACTION0
Text Label 7300 3050 2    50   ~ 0
COND4
$Comp
L Device:R_Pack04 RN?
U 1 1 5D15813A
P 9800 2550
AR Path="/5D15813A" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5D15813A" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D15813A" Ref="RN10"  Part="1" 
F 0 "RN10" V 10033 2550 50  0000 C CNN
F 1 "30Ω" V 10124 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0612" V 10075 2550 50  0001 C CNN
F 3 "~" H 9800 2550 50  0001 C CNN
	1    9800 2550
	0    1    -1   0   
$EndComp
Text Label 7300 2950 2    50   ~ 0
COND3
Text Label 7300 2850 2    50   ~ 0
COND2
Text Label 7300 2750 2    50   ~ 0
COND1
Text Label 7300 2650 2    50   ~ 0
COND0
Text Label 7300 2550 2    50   ~ 0
WADDR4
Text Label 7300 2450 2    50   ~ 0
WADDR3
Wire Wire Line
	6950 3150 7400 3150
Wire Wire Line
	6950 3050 7400 3050
Wire Wire Line
	6950 2950 7400 2950
Wire Wire Line
	6950 2850 7400 2850
Wire Wire Line
	6950 2750 7400 2750
Wire Wire Line
	6950 2650 7400 2650
Wire Wire Line
	6950 2550 7400 2550
Wire Wire Line
	6950 2450 7400 2450
Text Notes 5900 4100 0    100  ~ 20
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
AR Path="/5DEAC282/5E34FD9B/5E37FA60" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 9300 4500 50  0001 C CNN
F 1 "+5V" H 9315 4823 50  0000 C CNN
F 2 "" H 9300 4650 50  0001 C CNN
F 3 "" H 9300 4650 50  0001 C CNN
	1    9300 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5D158133
P 9800 2950
AR Path="/5D158133" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5D158133" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158133" Ref="RN9"  Part="1" 
F 0 "RN9" V 9383 2950 50  0000 C CNN
F 1 "30Ω" V 9474 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0612" V 10075 2950 50  0001 C CNN
F 3 "~" H 9800 2950 50  0001 C CNN
	1    9800 2950
	0    1    -1   0   
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
~µCE
Text Label 2250 4800 2    50   ~ 0
~µCE
Wire Wire Line
	6000 4800 6000 4650
$Comp
L alexios:29F040 U?
U 2 1 5D158153
P 2950 5950
AR Path="/5DEAC282/5D158153" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5D158153" Ref="U24"  Part="2" 
F 0 "U24" H 3130 6746 50  0000 L CNN
F 1 "29F040" H 3130 6655 50  0000 L CNN
F 2 "Sockets:PLCC32" H 2950 5950 50  0001 C CNN
F 3 "" H 2950 5950 50  0001 C CNN
	2    2950 5950
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 2 1 5D158154
P 6000 5950
AR Path="/5DEAC282/5D158154" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5D158154" Ref="U25"  Part="2" 
F 0 "U25" H 6180 6746 50  0000 L CNN
F 1 "29F040" H 6180 6655 50  0000 L CNN
F 2 "Sockets:PLCC32" H 6000 5950 50  0001 C CNN
F 3 "" H 6000 5950 50  0001 C CNN
	2    6000 5950
	1    0    0    -1  
$EndComp
$Comp
L alexios:29F040 U?
U 2 1 5D158155
P 9050 5950
AR Path="/5DEAC282/5D158155" Ref="U?"  Part="2" 
AR Path="/5DEAC282/5E34FD9B/5D158155" Ref="U26"  Part="2" 
F 0 "U26" H 9230 6746 50  0000 L CNN
F 1 "29F040" H 9230 6655 50  0000 L CNN
F 2 "Sockets:PLCC32" H 9050 5950 50  0001 C CNN
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
U 1 1 5D158156
P 5550 5200
AR Path="/5CC0D65F/5D158156" Ref="C?"  Part="1" 
AR Path="/5D158156" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D158156" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158156" Ref="C43"  Part="1" 
F 0 "C43" H 5459 5246 50  0000 R CNN
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
U 1 1 5D158157
P 5150 5200
AR Path="/5CC0D65F/5D158157" Ref="C?"  Part="1" 
AR Path="/5D158157" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D158157" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158157" Ref="C42"  Part="1" 
F 0 "C42" H 5059 5246 50  0000 R CNN
F 1 "10µF" H 5059 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5150 5200 50  0001 C CNN
F 3 "~" H 5150 5200 50  0001 C CNN
	1    5150 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D158158
P 8600 5200
AR Path="/5CC0D65F/5D158158" Ref="C?"  Part="1" 
AR Path="/5D158158" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D158158" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158158" Ref="C45"  Part="1" 
F 0 "C45" H 8509 5246 50  0000 R CNN
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
U 1 1 5D158159
P 8200 5200
AR Path="/5CC0D65F/5D158159" Ref="C?"  Part="1" 
AR Path="/5D158159" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D158159" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158159" Ref="C44"  Part="1" 
F 0 "C44" H 8109 5246 50  0000 R CNN
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
AR Path="/5DEAC282/5E34FD9B/5E4A5DAB" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 2600 5050 50  0001 C CNN
F 1 "GND" H 2605 5127 50  0000 C CNN
F 2 "" H 2600 5300 50  0001 C CNN
F 3 "" H 2600 5300 50  0001 C CNN
	1    2600 5300
	1    0    0    -1  
$EndComp
Connection ~ 2600 5300
$Comp
L power:GND #PWR?
U 1 1 5D15815B
P 5650 5300
AR Path="/5DEAC282/5D15815B" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D15815B" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 5650 5050 50  0001 C CNN
F 1 "GND" H 5655 5127 50  0000 C CNN
F 2 "" H 5650 5300 50  0001 C CNN
F 3 "" H 5650 5300 50  0001 C CNN
	1    5650 5300
	1    0    0    -1  
$EndComp
Connection ~ 5650 5300
$Comp
L power:GND #PWR?
U 1 1 5D15815C
P 8700 5300
AR Path="/5DEAC282/5D15815C" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D15815C" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 8700 5050 50  0001 C CNN
F 1 "GND" H 8705 5127 50  0000 C CNN
F 2 "" H 8700 5300 50  0001 C CNN
F 3 "" H 8700 5300 50  0001 C CNN
	1    8700 5300
	1    0    0    -1  
$EndComp
Connection ~ 8700 5300
$Comp
L power:+5V #PWR?
U 1 1 5D15815D
P 2600 5100
AR Path="/5DEAC282/5D15815D" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D15815D" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 2600 4950 50  0001 C CNN
F 1 "+5V" H 2615 5273 50  0000 C CNN
F 2 "" H 2600 5100 50  0001 C CNN
F 3 "" H 2600 5100 50  0001 C CNN
	1    2600 5100
	1    0    0    -1  
$EndComp
Connection ~ 2600 5100
$Comp
L power:+5V #PWR?
U 1 1 5D15815E
P 5650 5100
AR Path="/5DEAC282/5D15815E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D15815E" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 5650 4950 50  0001 C CNN
F 1 "+5V" H 5665 5273 50  0000 C CNN
F 2 "" H 5650 5100 50  0001 C CNN
F 3 "" H 5650 5100 50  0001 C CNN
	1    5650 5100
	1    0    0    -1  
$EndComp
Connection ~ 5650 5100
$Comp
L power:+5V #PWR?
U 1 1 5D15815F
P 8700 5100
AR Path="/5DEAC282/5D15815F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D15815F" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 8700 4950 50  0001 C CNN
F 1 "+5V" H 8715 5273 50  0000 C CNN
F 2 "" H 8700 5100 50  0001 C CNN
F 3 "" H 8700 5100 50  0001 C CNN
	1    8700 5100
	1    0    0    -1  
$EndComp
Connection ~ 8700 5100
$Comp
L Device:C_Small C?
U 1 1 5D158160
P 2500 5200
AR Path="/5CC0D65F/5D158160" Ref="C?"  Part="1" 
AR Path="/5D158160" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D158160" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158160" Ref="C41"  Part="1" 
F 0 "C41" H 2409 5246 50  0000 R CNN
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
U 1 1 5D158161
P 2100 5200
AR Path="/5CC0D65F/5D158161" Ref="C?"  Part="1" 
AR Path="/5D158161" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D158161" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D158161" Ref="C40"  Part="1" 
F 0 "C40" H 2009 5246 50  0000 R CNN
F 1 "10µF" H 2009 5155 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2100 5200 50  0001 C CNN
F 3 "~" H 2100 5200 50  0001 C CNN
	1    2100 5200
	1    0    0    -1  
$EndComp
Text Notes 7150 7000 0    197  ~ 39
Microcode Store
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
U 1 1 5D1580BB
P 5850 4650
AR Path="/5DEAC282/5D1580BB" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D1580BB" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 5850 4400 50  0001 C CNN
F 1 "GND" H 5700 4600 50  0000 C CNN
F 2 "" H 5850 4650 50  0001 C CNN
F 3 "" H 5850 4650 50  0001 C CNN
	1    5850 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D1580BC
P 8900 4650
AR Path="/5DEAC282/5D1580BC" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5D1580BC" Ref="#PWR095"  Part="1" 
F 0 "#PWR095" H 8900 4400 50  0001 C CNN
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
COND
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
~IRQSUC
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
~IRQSUC
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
COND
Text Label 2200 3250 2    50   ~ 0
IR7
$EndSCHEMATC
