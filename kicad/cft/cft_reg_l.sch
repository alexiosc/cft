EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 20 24
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
L Device:R_Small R?
U 1 1 5EF8B923
P 8450 3200
AR Path="/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5D54E677/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5F4B0011/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5F63066B/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5D30488D/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5D44ECB5/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5EF8B923" Ref="R?"  Part="1" 
AR Path="/5EF76914/5EF8B923" Ref="R2001"  Part="1" 
F 0 "R2001" V 8646 3200 50  0000 C CNN
F 1 "30Ω" V 8555 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8450 3200 50  0001 C CNN
F 3 "~" H 8450 3200 50  0001 C CNN
	1    8450 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8550 3200 10000 3200
Text HLabel 10000 3200 2    50   Output ~ 0
FL
Text Label 8600 3200 0    50   ~ 0
FL
$Comp
L power:+5V #PWR?
U 1 1 5EF8B92C
P 7900 2900
AR Path="/5EF8B92C" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8B92C" Ref="#PWR02001"  Part="1" 
F 0 "#PWR02001" H 7900 2750 50  0001 C CNN
F 1 "+5V" H 7915 3073 50  0000 C CNN
F 2 "" H 7900 2900 50  0001 C CNN
F 3 "" H 7900 2900 50  0001 C CNN
	1    7900 2900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 1 1 5EF8B932
P 5300 4950
AR Path="/5EF8B932" Ref="U?"  Part="1" 
AR Path="/5EF76914/5EF8B932" Ref="U2005"  Part="1" 
F 0 "U2005" H 5225 4775 50  0000 C CNN
F 1 "74AHC1G08" H 5225 4684 50  0000 C CNN
F 2 "" H 4950 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 4950 4950 50  0001 C CNN
	1    5300 4950
	1    0    0    -1  
$EndComp
Text Label 5500 4950 0    50   ~ 0
~CLL-ASYNC
Text Label 2850 5000 0    50   ~ 0
~CLL
$Comp
L alexios:74HC112 U?
U 1 1 5EF8B93D
P 8200 3150
AR Path="/5EF8B93D" Ref="U?"  Part="1" 
AR Path="/5EF76914/5EF8B93D" Ref="U2003"  Part="1" 
F 0 "U2003" H 8350 3600 50  0000 C CNN
F 1 "74HC112" H 8350 3500 50  0000 C CNN
F 2 "" H 7900 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 7900 2800 50  0001 C CNN
	1    8200 3150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U?
U 2 1 5EF8B943
P 6700 6600
AR Path="/5EF8B943" Ref="U?"  Part="2" 
AR Path="/5EF76914/5EF8B943" Ref="U2003"  Part="2" 
F 0 "U2003" H 6600 6850 50  0000 C CNN
F 1 "74HC112" H 6700 6750 50  0000 C CNN
F 2 "" H 6400 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 6400 6250 50  0001 C CNN
	2    6700 6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC112 U?
U 3 1 5EF8B949
P 4500 7450
AR Path="/5EF8B949" Ref="U?"  Part="3" 
AR Path="/5EF76914/5EF8B949" Ref="U2003"  Part="3" 
F 0 "U2003" H 4380 7696 50  0000 L CNN
F 1 "74HC112" H 4380 7605 50  0000 L CNN
F 2 "" H 4200 7100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS112" H 4200 7100 50  0001 C CNN
	3    4500 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4950 7900 3900
Wire Wire Line
	5450 4950 7900 4950
NoConn ~ 8350 3600
$Comp
L alexios:74LVC1G10 U?
U 1 1 5EF8B952
P 5250 2500
AR Path="/5EF8B952" Ref="U?"  Part="1" 
AR Path="/5EF76914/5EF8B952" Ref="U2001"  Part="1" 
F 0 "U2001" H 5200 2764 50  0000 C CNN
F 1 "74LVC1G10" H 5200 2673 50  0000 C CNN
F 2 "" H 5150 2425 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5150 2425 50  0001 C CNN
	1    5250 2500
	1    0    0    -1  
$EndComp
Text Label 2850 2450 0    50   ~ 0
~CPL
Text Label 2850 2550 0    50   ~ 0
~FLTADD
Text Label 2850 2650 0    50   ~ 0
~ACCPL
$Comp
L alexios:74HC253 U?
U 1 1 5EF8B95E
P 5400 3800
AR Path="/5EF8B95E" Ref="U?"  Part="1" 
AR Path="/5EF76914/5EF8B95E" Ref="U2004"  Part="1" 
F 0 "U2004" H 5400 4767 50  0000 C CNN
F 1 "74HC253" H 5400 4676 50  0000 C CNN
F 2 "" H 5700 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS253" H 5700 4400 50  0001 C CNN
	1    5400 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF8B964
P 4800 4300
AR Path="/5EF8B964" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8B964" Ref="#PWR02004"  Part="1" 
F 0 "#PWR02004" H 4800 4050 50  0001 C CNN
F 1 "GND" H 4650 4250 50  0000 C CNN
F 2 "" H 4800 4300 50  0001 C CNN
F 3 "" H 4800 4300 50  0001 C CNN
	1    4800 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3600 4800 3600
Wire Wire Line
	4800 3600 4800 3800
Text Label 2850 4500 0    50   ~ 0
ROLL16
Text Label 2850 4600 0    50   ~ 0
ISROLL
Text Label 5950 3100 0    50   ~ 0
LJ
Text Label 5950 3800 0    50   ~ 0
LK
Wire Wire Line
	4900 3800 4800 3800
Connection ~ 4800 3800
Wire Wire Line
	4800 3800 4800 3900
Wire Wire Line
	4900 3900 4800 3900
Connection ~ 4800 3900
Wire Wire Line
	4800 3900 4800 4000
Wire Wire Line
	4900 4000 4800 4000
Connection ~ 4800 4000
Wire Wire Line
	4800 4000 4800 4300
Wire Wire Line
	4900 4100 4700 4100
Wire Wire Line
	4900 4300 4800 4300
Connection ~ 4800 4300
Wire Wire Line
	4900 3400 4800 3400
Wire Wire Line
	4800 3400 4800 3600
Connection ~ 4800 3600
Connection ~ 4800 3400
Wire Wire Line
	4900 3100 4800 3100
Wire Wire Line
	4800 3100 4800 3200
Wire Wire Line
	4900 3300 4700 3300
Wire Wire Line
	4900 3200 4800 3200
Connection ~ 4800 3200
Wire Wire Line
	4800 3200 4800 3400
Wire Wire Line
	4700 3250 4700 3300
$Comp
L power:+5V #PWR?
U 1 1 5EF8B98B
P 4700 3250
AR Path="/5EF8B98B" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8B98B" Ref="#PWR02002"  Part="1" 
F 0 "#PWR02002" H 4700 3100 50  0001 C CNN
F 1 "+5V" H 4642 3287 50  0000 R CNN
F 2 "" H 4700 3250 50  0001 C CNN
F 3 "" H 4700 3250 50  0001 C CNN
	1    4700 3250
	1    0    0    -1  
$EndComp
Text Notes 3500 3550 0    50   ~ 0
ROLL16
Text Notes 3200 3550 0    50   ~ 0
ROLL
Text Notes 4050 3550 2    50   ~ 0
LJ
Text Notes 4250 3550 2    50   ~ 0
LK
Wire Notes Line style solid
	2850 3600 4350 3600
Text Notes 3350 3700 2    50   ~ 0
0
Text Notes 3650 3700 2    50   ~ 0
0
Text Notes 4050 3700 2    50   ~ 0
0
Text Notes 4250 3700 2    50   ~ 0
0
Text Notes 3350 3800 2    50   ~ 0
0
Text Notes 3650 3800 2    50   ~ 0
1
Text Notes 4050 3800 2    50   ~ 0
0
Text Notes 4250 3800 2    50   ~ 0
0
Text Notes 3650 3900 2    50   ~ 0
0
Text Notes 4050 3900 2    50   ~ 0
0
Text Notes 4250 3900 2    50   ~ 10
1
Text Notes 3650 4000 2    50   ~ 0
1
Text Notes 4050 4000 2    50   ~ 10
1
Text Notes 4250 4000 2    50   ~ 0
0
Text Notes 3350 3900 2    50   ~ 0
1
Text Notes 3350 4000 2    50   ~ 0
1
Text Notes 2900 3550 0    50   ~ 0
Input
Text Notes 3050 3700 2    50   ~ 0
0
Text Notes 3050 3800 2    50   ~ 0
1
Text Notes 3050 3900 2    50   ~ 0
2
Text Notes 3050 4000 2    50   ~ 0
3
Wire Wire Line
	5900 3800 6550 3800
Wire Wire Line
	5900 3100 6550 3100
Wire Wire Line
	5450 2550 6150 2550
Wire Wire Line
	6150 2550 6150 3000
Wire Wire Line
	6150 3700 6550 3700
Wire Wire Line
	6550 3000 6150 3000
Connection ~ 6150 3000
Wire Wire Line
	6150 3000 6150 3700
Wire Wire Line
	7050 3050 7250 3050
Wire Wire Line
	7050 3750 7250 3750
Wire Wire Line
	7250 3050 7250 3200
Wire Wire Line
	7250 3200 7400 3200
Wire Wire Line
	7250 3600 7400 3600
Wire Wire Line
	7250 3600 7250 3750
Wire Wire Line
	7100 2100 7100 3400
Wire Wire Line
	7100 3400 7400 3400
Text Label 2850 2100 0    50   ~ 0
CLK1
$Comp
L alexios:74HC253 U?
U 2 1 5EF8B9BD
P 1400 7200
AR Path="/5EF8B9BD" Ref="U?"  Part="2" 
AR Path="/5EF76914/5EF8B9BD" Ref="U2004"  Part="2" 
F 0 "U2004" H 1580 7846 50  0000 L CNN
F 1 "74HC253" H 1580 7755 50  0000 L CNN
F 2 "" H 1700 7800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS253" H 1700 7800 50  0001 C CNN
	2    1400 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G08 U?
U 2 1 5EF8B9C3
P 1500 7150
AR Path="/5EF8B9C3" Ref="U?"  Part="2" 
AR Path="/5EF76914/5EF8B9C3" Ref="U1508"  Part="2" 
F 0 "U1508" H 1580 7096 50  0000 L CNN
F 1 "74AHC1G08" H 1580 7005 50  0000 L CNN
F 2 "" H 1150 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1150 7150 50  0001 C CNN
	2    1500 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G10 U?
U 2 1 5EF8B9C9
P 2950 6400
AR Path="/5EF8B9C9" Ref="U?"  Part="2" 
AR Path="/5EF76914/5EF8B9C9" Ref="U2001"  Part="2" 
F 0 "U2001" H 3030 6296 50  0000 L CNN
F 1 "74LVC1G10" H 3030 6205 50  0000 L CNN
F 2 "" H 2850 6325 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2850 6325 50  0001 C CNN
	2    2950 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 6650 5850 6650
Wire Wire Line
	5850 6650 5850 6850
Wire Wire Line
	5850 7350 6400 7350
Wire Wire Line
	5900 6850 5850 6850
Connection ~ 5850 6850
Wire Wire Line
	5850 6850 5850 7050
Wire Wire Line
	5900 7050 5850 7050
Connection ~ 5850 7050
Wire Wire Line
	5850 7050 5850 7350
$Comp
L power:GND #PWR?
U 1 1 5EF8B9D8
P 6400 7450
AR Path="/5EF8B9D8" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8B9D8" Ref="#PWR02016"  Part="1" 
F 0 "#PWR02016" H 6400 7200 50  0001 C CNN
F 1 "GND" H 6405 7277 50  0000 C CNN
F 2 "" H 6400 7450 50  0001 C CNN
F 3 "" H 6400 7450 50  0001 C CNN
	1    6400 7450
	1    0    0    -1  
$EndComp
Connection ~ 6400 7350
Wire Wire Line
	6400 7350 6400 7450
NoConn ~ 6850 6650
NoConn ~ 6850 7050
Wire Wire Line
	6400 6350 5850 6350
Wire Wire Line
	5850 6350 5850 6650
Connection ~ 5850 6650
$Comp
L alexios:74HC32 U?
U 1 1 5EF8B9E5
P 6800 2850
AR Path="/5EF8B9E5" Ref="U?"  Part="1" 
AR Path="/5EF76914/5EF8B9E5" Ref="U2002"  Part="1" 
F 0 "U2002" H 6800 2925 50  0000 C CNN
F 1 "74HC32" H 6800 2834 50  0000 C CNN
F 2 "" H 6800 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6800 2850 50  0001 C CNN
	1    6800 2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 3 1 5EF8B9F1
P 5350 6500
AR Path="/5EF8B9F1" Ref="U?"  Part="3" 
AR Path="/5EF76914/5EF8B9F1" Ref="U2002"  Part="3" 
F 0 "U2002" H 5350 6575 50  0000 C CNN
F 1 "74HC32" H 5350 6484 50  0000 C CNN
F 2 "" H 5350 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5350 6500 50  0001 C CNN
	3    5350 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 4 1 5EF8B9F7
P 5350 6800
AR Path="/5EF8B9F7" Ref="U?"  Part="4" 
AR Path="/5EF76914/5EF8B9F7" Ref="U2002"  Part="4" 
F 0 "U2002" H 5350 6425 50  0000 C CNN
F 1 "74HC32" H 5350 6334 50  0000 C CNN
F 2 "" H 5350 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5350 6800 50  0001 C CNN
	4    5350 6800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 5 1 5EF8B9FD
P 2850 6950
AR Path="/5EF8B9FD" Ref="U?"  Part="5" 
AR Path="/5EF76914/5EF8B9FD" Ref="U908"  Part="5" 
F 0 "U908" H 3030 6696 50  0000 L CNN
F 1 "74HC32" H 3030 6605 50  0000 L CNN
F 2 "" H 2850 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2850 6950 50  0001 C CNN
	5    2850 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6650 5050 6650
Wire Wire Line
	5050 6650 5050 6750
$Comp
L power:GND #PWR?
U 1 1 5EF8BA05
P 5050 7100
AR Path="/5EF8BA05" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA05" Ref="#PWR02009"  Part="1" 
F 0 "#PWR02009" H 5050 6850 50  0001 C CNN
F 1 "GND" H 5055 6927 50  0000 C CNN
F 2 "" H 5050 7100 50  0001 C CNN
F 3 "" H 5050 7100 50  0001 C CNN
	1    5050 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6750 5050 6750
Wire Wire Line
	5100 6950 5050 6950
Connection ~ 5050 6950
Wire Wire Line
	5050 6950 5050 7050
Wire Wire Line
	5100 7050 5050 7050
Connection ~ 5050 7050
Wire Wire Line
	5050 7050 5050 7100
NoConn ~ 5600 6700
NoConn ~ 5600 7000
Wire Wire Line
	5050 6750 5050 6950
Connection ~ 5050 6750
Text Label 5450 2550 0    50   ~ 0
TOGGLE
Text Label 6550 3000 2    50   ~ 0
TOGGLE
Text Label 6550 3100 2    50   ~ 0
LJ
Text Label 6550 3800 2    50   ~ 0
LK
Text Label 6550 3700 2    50   ~ 0
TOGGLE
Text Label 7400 3400 2    50   ~ 0
CLK1
Text Label 7900 4000 3    50   ~ 0
~CLL-ASYNC
Text HLabel 2750 4500 0    50   Input ~ 0
ROLL16
Text HLabel 2750 4600 0    50   Input ~ 0
ISROLL
Wire Notes Line width 12 style solid
	2850 3400 4350 3400
Wire Notes Line width 12 style solid
	4350 3400 4350 4050
Wire Notes Line width 12 style solid
	4350 4050 2850 4050
Wire Notes Line width 12 style solid
	2850 4050 2850 3400
Wire Notes Line
	3850 3400 3850 4050
$Comp
L Device:C_Small C?
U 1 1 5EF8BA28
P 3850 7250
AR Path="/5CC0D65F/5EF8BA28" Ref="C?"  Part="1" 
AR Path="/5EF8BA28" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF8BA28" Ref="C2005"  Part="1" 
F 0 "C2005" H 3759 7296 50  0000 R CNN
F 1 "100nF" H 3759 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3850 7250 50  0001 C CNN
F 3 "~" H 3850 7250 50  0001 C CNN
	1    3850 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF8BA2E
P 2500 7250
AR Path="/5CC0D65F/5EF8BA2E" Ref="C?"  Part="1" 
AR Path="/5EF8BA2E" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF8BA2E" Ref="C2004"  Part="1" 
F 0 "C2004" H 2409 7296 50  0000 R CNN
F 1 "100nF" H 2409 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 7250 50  0001 C CNN
F 3 "~" H 2500 7250 50  0001 C CNN
	1    2500 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF8BA34
P 1050 7250
AR Path="/5CC0D65F/5EF8BA34" Ref="C?"  Part="1" 
AR Path="/5EF8BA34" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF8BA34" Ref="C2003"  Part="1" 
F 0 "C2003" H 959 7296 50  0000 R CNN
F 1 "100nF" H 959 7205 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7250 50  0001 C CNN
F 3 "~" H 1050 7250 50  0001 C CNN
	1    1050 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF8BA3A
P 1050 6600
AR Path="/5CC0D65F/5EF8BA3A" Ref="C?"  Part="1" 
AR Path="/5EF8BA3A" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF8BA3A" Ref="C2002"  Part="1" 
F 0 "C2002" H 959 6646 50  0000 R CNN
F 1 "100nF" H 959 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 6600 50  0001 C CNN
F 3 "~" H 1050 6600 50  0001 C CNN
	1    1050 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EF8BA40
P 2500 6550
AR Path="/5CC0D65F/5EF8BA40" Ref="C?"  Part="1" 
AR Path="/5EF8BA40" Ref="C?"  Part="1" 
AR Path="/5EF76914/5EF8BA40" Ref="C2001"  Part="1" 
F 0 "C2001" H 2409 6596 50  0000 R CNN
F 1 "100nF" H 2409 6505 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 6550 50  0001 C CNN
F 3 "~" H 2500 6550 50  0001 C CNN
	1    2500 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EF8BA46
P 2500 6450
AR Path="/5EF8BA46" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA46" Ref="#PWR02005"  Part="1" 
F 0 "#PWR02005" H 2500 6300 50  0001 C CNN
F 1 "+5V" H 2515 6623 50  0000 C CNN
F 2 "" H 2500 6450 50  0001 C CNN
F 3 "" H 2500 6450 50  0001 C CNN
	1    2500 6450
	1    0    0    -1  
$EndComp
Connection ~ 2500 6450
$Comp
L power:+5V #PWR?
U 1 1 5EF8BA4D
P 1050 6500
AR Path="/5EF8BA4D" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA4D" Ref="#PWR02006"  Part="1" 
F 0 "#PWR02006" H 1050 6350 50  0001 C CNN
F 1 "+5V" H 1065 6673 50  0000 C CNN
F 2 "" H 1050 6500 50  0001 C CNN
F 3 "" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
Connection ~ 1050 6500
$Comp
L power:+5V #PWR?
U 1 1 5EF8BA54
P 1050 7150
AR Path="/5EF8BA54" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA54" Ref="#PWR02010"  Part="1" 
F 0 "#PWR02010" H 1050 7000 50  0001 C CNN
F 1 "+5V" H 1065 7323 50  0000 C CNN
F 2 "" H 1050 7150 50  0001 C CNN
F 3 "" H 1050 7150 50  0001 C CNN
	1    1050 7150
	1    0    0    -1  
$EndComp
Connection ~ 1050 7150
$Comp
L power:+5V #PWR?
U 1 1 5EF8BA5B
P 2500 7150
AR Path="/5EF8BA5B" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA5B" Ref="#PWR02011"  Part="1" 
F 0 "#PWR02011" H 2500 7000 50  0001 C CNN
F 1 "+5V" H 2515 7323 50  0000 C CNN
F 2 "" H 2500 7150 50  0001 C CNN
F 3 "" H 2500 7150 50  0001 C CNN
	1    2500 7150
	1    0    0    -1  
$EndComp
Connection ~ 2500 7150
$Comp
L power:+5V #PWR?
U 1 1 5EF8BA62
P 3850 7150
AR Path="/5EF8BA62" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA62" Ref="#PWR02012"  Part="1" 
F 0 "#PWR02012" H 3850 7000 50  0001 C CNN
F 1 "+5V" H 3865 7323 50  0000 C CNN
F 2 "" H 3850 7150 50  0001 C CNN
F 3 "" H 3850 7150 50  0001 C CNN
	1    3850 7150
	1    0    0    -1  
$EndComp
Connection ~ 3850 7150
$Comp
L power:GND #PWR?
U 1 1 5EF8BA69
P 1050 6700
AR Path="/5EF8BA69" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA69" Ref="#PWR02008"  Part="1" 
F 0 "#PWR02008" H 1050 6450 50  0001 C CNN
F 1 "GND" H 1055 6527 50  0000 C CNN
F 2 "" H 1050 6700 50  0001 C CNN
F 3 "" H 1050 6700 50  0001 C CNN
	1    1050 6700
	1    0    0    -1  
$EndComp
Connection ~ 1050 6700
$Comp
L power:GND #PWR?
U 1 1 5EF8BA70
P 1050 7350
AR Path="/5EF8BA70" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA70" Ref="#PWR02013"  Part="1" 
F 0 "#PWR02013" H 1050 7100 50  0001 C CNN
F 1 "GND" H 1055 7177 50  0000 C CNN
F 2 "" H 1050 7350 50  0001 C CNN
F 3 "" H 1050 7350 50  0001 C CNN
	1    1050 7350
	1    0    0    -1  
$EndComp
Connection ~ 1050 7350
$Comp
L power:GND #PWR?
U 1 1 5EF8BA77
P 2500 6650
AR Path="/5EF8BA77" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA77" Ref="#PWR02007"  Part="1" 
F 0 "#PWR02007" H 2500 6400 50  0001 C CNN
F 1 "GND" H 2505 6477 50  0000 C CNN
F 2 "" H 2500 6650 50  0001 C CNN
F 3 "" H 2500 6650 50  0001 C CNN
	1    2500 6650
	1    0    0    -1  
$EndComp
Connection ~ 2500 6650
$Comp
L power:GND #PWR?
U 1 1 5EF8BA7E
P 2500 7350
AR Path="/5EF8BA7E" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA7E" Ref="#PWR02014"  Part="1" 
F 0 "#PWR02014" H 2500 7100 50  0001 C CNN
F 1 "GND" H 2505 7177 50  0000 C CNN
F 2 "" H 2500 7350 50  0001 C CNN
F 3 "" H 2500 7350 50  0001 C CNN
	1    2500 7350
	1    0    0    -1  
$EndComp
Connection ~ 2500 7350
$Comp
L power:GND #PWR?
U 1 1 5EF8BA85
P 3850 7350
AR Path="/5EF8BA85" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5EF8BA85" Ref="#PWR02015"  Part="1" 
F 0 "#PWR02015" H 3850 7100 50  0001 C CNN
F 1 "GND" H 3855 7177 50  0000 C CNN
F 2 "" H 3850 7350 50  0001 C CNN
F 3 "" H 3850 7350 50  0001 C CNN
	1    3850 7350
	1    0    0    -1  
$EndComp
Connection ~ 3850 7350
Text HLabel 2750 4900 0    50   Input ~ 0
~RESET
Text HLabel 2750 5000 0    50   Input ~ 0
~CLL
Text HLabel 2750 2650 0    50   Input ~ 0
~ACCPL
Text HLabel 2750 2550 0    50   Input ~ 0
~FLTADD
Text HLabel 2750 2450 0    50   Input ~ 0
~CPL
Text HLabel 2750 2100 0    50   Input ~ 0
CLK1
Wire Wire Line
	2750 2100 7100 2100
Wire Wire Line
	4950 2650 2750 2650
Wire Wire Line
	4950 2550 2750 2550
Wire Wire Line
	4950 2450 2750 2450
Text Label 4950 2100 2    50   ~ 0
CLK1
Text Label 4950 2450 2    50   ~ 0
~CPL
Text Label 4950 2550 2    50   ~ 0
~FLTADD
Text Label 4950 2650 2    50   ~ 0
~ACCPL
Text Label 4900 4500 2    50   ~ 0
ROLL16
Text Label 4900 4600 2    50   ~ 0
ISROLL
Text Label 2850 4900 0    50   ~ 0
~RESET
Text Label 4900 4900 2    50   ~ 0
~RESET
Text Label 4900 5000 2    50   ~ 0
~CLL
Text Notes 7100 7000 0    197  ~ 39
Link Register (L)
Wire Wire Line
	2750 4500 4900 4500
Wire Wire Line
	2750 4600 4900 4600
Wire Wire Line
	2750 4900 5000 4900
Wire Wire Line
	2750 5000 5000 5000
$Comp
L power:+5V #PWR?
U 1 1 5F01555B
P 4700 4050
AR Path="/5F01555B" Ref="#PWR?"  Part="1" 
AR Path="/5EF76914/5F01555B" Ref="#PWR02003"  Part="1" 
F 0 "#PWR02003" H 4700 3900 50  0001 C CNN
F 1 "+5V" H 4642 4087 50  0000 R CNN
F 2 "" H 4700 4050 50  0001 C CNN
F 3 "" H 4700 4050 50  0001 C CNN
	1    4700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4050 4700 4100
Text Label 7100 2600 1    50   ~ 0
CLK1
$Comp
L alexios:74HC32 U?
U 2 1 60F66507
P 6800 3550
AR Path="/60F66507" Ref="U?"  Part="1" 
AR Path="/5EF76914/60F66507" Ref="U2002"  Part="2" 
F 0 "U2002" H 6800 3625 50  0000 C CNN
F 1 "74HC32" H 6800 3534 50  0000 C CNN
F 2 "" H 6800 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6800 3550 50  0001 C CNN
	2    6800 3550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
