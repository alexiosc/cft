EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 11
Title "The L Register"
Date "2019-11-17"
Rev "2020"
Comp ""
Comment1 "ALU"
Comment2 ""
Comment3 ""
Comment4 "reg_l.v"
$EndDescr
$Comp
L alexios:74HC253 U?
U 2 1 5D9AE85D
P 1300 7200
AR Path="/5DC89E19/5D9AE85D" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9AE85D" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9AE85D" Ref="U804"  Part="2" 
F 0 "U804" H 1479 7846 50  0000 L CNN
F 1 "74HC253" H 1479 7755 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1600 7800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 1600 7800 50  0001 C CNN
	2    1300 7200
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U?
U 2 1 5D9BC7A1
P 2750 6350
AR Path="/5DC89E19/5D9BC7A1" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BC7A1" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9BC7A1" Ref="U806"  Part="2" 
F 0 "U806" H 2880 6146 50  0000 L CNN
F 1 "74LVC1G32" H 2880 6055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2860 6330 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2860 6330 50  0001 C CNN
	2    2750 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 5D9BCE39
P 4250 7200
AR Path="/5DC89E19/5D9BCE39" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BCE39" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9BCE39" Ref="U807"  Part="2" 
F 0 "U807" H 4330 7096 50  0000 L CNN
F 1 "74LVC1G11" H 4330 7005 50  0000 L CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 4150 7125 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 4150 7125 50  0001 C CNN
	2    4250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9C517A
P 2350 6600
AR Path="/5CC0D65F/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9C517A" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D9C517A" Ref="C802"  Part="1" 
F 0 "C802" H 2259 6646 50  0000 R CNN
F 1 "100nF" H 2259 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2350 6600 50  0001 C CNN
F 3 "~" H 2350 6600 50  0001 C CNN
	1    2350 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C5181
P 2350 6700
AR Path="/5D9C5181" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9C5181" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9C5181" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9C5181" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9C5181" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9C5181" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9C5181" Ref="#PWR0807"  Part="1" 
F 0 "#PWR0807" H 2350 6450 50  0001 C CNN
F 1 "GND" H 2355 6527 50  0000 C CNN
F 2 "" H 2350 6700 50  0001 C CNN
F 3 "" H 2350 6700 50  0001 C CNN
	1    2350 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9C5187
P 2350 6500
AR Path="/5D9C5187" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9C5187" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9C5187" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9C5187" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9C5187" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9C5187" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9C5187" Ref="#PWR0804"  Part="1" 
F 0 "#PWR0804" H 2350 6350 50  0001 C CNN
F 1 "+5V" H 2365 6673 50  0000 C CNN
F 2 "" H 2350 6500 50  0001 C CNN
F 3 "" H 2350 6500 50  0001 C CNN
	1    2350 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9C755E
P 950 6600
AR Path="/5CC0D65F/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9C755E" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D9C755E" Ref="C801"  Part="1" 
F 0 "C801" H 859 6646 50  0000 R CNN
F 1 "100nF" H 859 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 6600 50  0001 C CNN
F 3 "~" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9C7565
P 950 6700
AR Path="/5D9C7565" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9C7565" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9C7565" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9C7565" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9C7565" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9C7565" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9C7565" Ref="#PWR0806"  Part="1" 
F 0 "#PWR0806" H 950 6450 50  0001 C CNN
F 1 "GND" H 955 6527 50  0000 C CNN
F 2 "" H 950 6700 50  0001 C CNN
F 3 "" H 950 6700 50  0001 C CNN
	1    950  6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9C756B
P 950 6500
AR Path="/5D9C756B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9C756B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9C756B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9C756B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9C756B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9C756B" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9C756B" Ref="#PWR0803"  Part="1" 
F 0 "#PWR0803" H 950 6350 50  0001 C CNN
F 1 "+5V" H 965 6673 50  0000 C CNN
F 2 "" H 950 6500 50  0001 C CNN
F 3 "" H 950 6500 50  0001 C CNN
	1    950  6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9CE0D0
P 2350 7350
AR Path="/5CC0D65F/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9CE0D0" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D9CE0D0" Ref="C805"  Part="1" 
F 0 "C805" H 2259 7396 50  0000 R CNN
F 1 "100nF" H 2259 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2350 7350 50  0001 C CNN
F 3 "~" H 2350 7350 50  0001 C CNN
	1    2350 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9CE0D7
P 2350 7450
AR Path="/5D9CE0D7" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9CE0D7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9CE0D7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9CE0D7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9CE0D7" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9CE0D7" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9CE0D7" Ref="#PWR0814"  Part="1" 
F 0 "#PWR0814" H 2350 7200 50  0001 C CNN
F 1 "GND" H 2355 7277 50  0000 C CNN
F 2 "" H 2350 7450 50  0001 C CNN
F 3 "" H 2350 7450 50  0001 C CNN
	1    2350 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9CE0DD
P 2350 7250
AR Path="/5D9CE0DD" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9CE0DD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9CE0DD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9CE0DD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9CE0DD" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9CE0DD" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9CE0DD" Ref="#PWR0810"  Part="1" 
F 0 "#PWR0810" H 2350 7100 50  0001 C CNN
F 1 "+5V" H 2365 7423 50  0000 C CNN
F 2 "" H 2350 7250 50  0001 C CNN
F 3 "" H 2350 7250 50  0001 C CNN
	1    2350 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9D2863
P 3800 7350
AR Path="/5CC0D65F/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9D2863" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D9D2863" Ref="C806"  Part="1" 
F 0 "C806" H 3709 7396 50  0000 R CNN
F 1 "100nF" H 3709 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3800 7350 50  0001 C CNN
F 3 "~" H 3800 7350 50  0001 C CNN
	1    3800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9D286A
P 3800 7450
AR Path="/5D9D286A" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9D286A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9D286A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9D286A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9D286A" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9D286A" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9D286A" Ref="#PWR0815"  Part="1" 
F 0 "#PWR0815" H 3800 7200 50  0001 C CNN
F 1 "GND" H 3805 7277 50  0000 C CNN
F 2 "" H 3800 7450 50  0001 C CNN
F 3 "" H 3800 7450 50  0001 C CNN
	1    3800 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9D2870
P 3800 7250
AR Path="/5D9D2870" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9D2870" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9D2870" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9D2870" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9D2870" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9D2870" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9D2870" Ref="#PWR0811"  Part="1" 
F 0 "#PWR0811" H 3800 7100 50  0001 C CNN
F 1 "+5V" H 3815 7423 50  0000 C CNN
F 2 "" H 3800 7250 50  0001 C CNN
F 3 "" H 3800 7250 50  0001 C CNN
	1    3800 7250
	1    0    0    -1  
$EndComp
Connection ~ 3800 7250
Connection ~ 3800 7450
Connection ~ 950  6500
Connection ~ 950  6700
Connection ~ 2350 6500
Connection ~ 2350 6700
$Comp
L alexios:74HC74 U?
U 3 1 5D3440A1
P 5600 7350
AR Path="/5DC89E19/5D3440A1" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D3440A1" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D3440A1" Ref="U802"  Part="3" 
F 0 "U802" H 5600 7767 50  0000 C CNN
F 1 "74AC74" H 5600 7676 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5550 7500 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 5550 7500 50  0001 C CNN
	3    5600 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D34587B
P 5250 7350
AR Path="/5CC0D65F/5D34587B" Ref="C?"  Part="1" 
AR Path="/5D34587B" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D34587B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D34587B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D34587B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D34587B" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D34587B" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D34587B" Ref="C807"  Part="1" 
F 0 "C807" H 5159 7396 50  0000 R CNN
F 1 "100nF" H 5159 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 7350 50  0001 C CNN
F 3 "~" H 5250 7350 50  0001 C CNN
	1    5250 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D345881
P 5250 7450
AR Path="/5D345881" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D345881" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D345881" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D345881" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D345881" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D345881" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D345881" Ref="#PWR0816"  Part="1" 
F 0 "#PWR0816" H 5250 7200 50  0001 C CNN
F 1 "GND" H 5255 7277 50  0000 C CNN
F 2 "" H 5250 7450 50  0001 C CNN
F 3 "" H 5250 7450 50  0001 C CNN
	1    5250 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D345887
P 5250 7250
AR Path="/5D345887" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D345887" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D345887" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D345887" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D345887" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D345887" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D345887" Ref="#PWR0812"  Part="1" 
F 0 "#PWR0812" H 5250 7100 50  0001 C CNN
F 1 "+5V" H 5265 7423 50  0000 C CNN
F 2 "" H 5250 7250 50  0001 C CNN
F 3 "" H 5250 7250 50  0001 C CNN
	1    5250 7250
	1    0    0    -1  
$EndComp
Connection ~ 5250 7250
Connection ~ 5250 7450
Wire Wire Line
	1450 1100 8750 1100
Connection ~ 4450 1000
Wire Wire Line
	8650 1000 8650 2950
Text Label 7800 1300 0    50   ~ 0
FL
NoConn ~ 8400 3050
NoConn ~ 3950 3550
Text Label 8850 2750 0    50   ~ 0
FLFAST
Text Notes 8850 3650 0    50   ~ 0
FLFAST is for use by the Shift/Roll Unit,\nwhich operates in the same clock\ndomain as this flip-flop (four times\nfaster than the system clock) and needs\nthe result back quickly.\n
Text Label 10150 3200 0    50   ~ 0
FLFAST
Text Label 8850 3200 0    50   ~ 0
FLFAST
Text HLabel 10750 3200 2    50   Output ~ 0
FLFAST
Wire Wire Line
	8550 2750 9150 2750
Connection ~ 8550 2750
Wire Wire Line
	8550 3200 10750 3200
Wire Wire Line
	8550 2750 8550 3200
Wire Wire Line
	4650 1300 4650 1650
Connection ~ 4650 1750
Text Label 4750 1300 0    50   ~ 0
FL
Wire Wire Line
	4650 1650 5500 1650
Wire Wire Line
	4650 1300 10350 1300
Wire Wire Line
	10350 2650 10750 2650
Connection ~ 10350 2650
Wire Wire Line
	10350 2650 10350 1300
$Comp
L alexios:74HC32 U?
U 4 1 5D9BC98F
P 5750 1500
AR Path="/5DC89E19/5D9BC98F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BC98F" Ref="U?"  Part="4" 
AR Path="/5D121AA3/5D9BC98F" Ref="U801"  Part="4" 
F 0 "U801" H 5750 1575 50  0000 C CNN
F 1 "74HC32" H 5750 1484 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5750 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5750 1500 50  0001 C CNN
	4    5750 1500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 3 1 5D995B6D
P 6350 2650
AR Path="/5DC89E19/5D995B6D" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D98F946/5D995B6D" Ref="U?"  Part="3" 
AR Path="/5D121AA3/5D995B6D" Ref="U801"  Part="3" 
F 0 "U801" H 6350 2725 50  0000 C CNN
F 1 "74HC32" H 6350 2634 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 6350 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6350 2650 50  0001 C CNN
	3    6350 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 2 1 5D995B66
P 5750 2650
AR Path="/5DC89E19/5D995B66" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D995B66" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D995B66" Ref="U801"  Part="2" 
F 0 "U801" H 5750 2725 50  0000 C CNN
F 1 "74HC32" H 5750 2634 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5750 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5750 2650 50  0001 C CNN
	2    5750 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 1 1 5D995B5F
P 5150 2650
AR Path="/5DC89E19/5D995B5F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995B5F" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995B5F" Ref="U801"  Part="1" 
F 0 "U801" H 5150 2725 50  0000 C CNN
F 1 "74HC32" H 5150 2634 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 5150 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5150 2650 50  0001 C CNN
	1    5150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2850 4900 2900
Connection ~ 4900 2850
Wire Wire Line
	4900 2800 4900 2850
Text Label 4850 1650 0    50   ~ 0
FL
Text Label 4850 1750 0    50   ~ 0
~ACTION-CPL
Text Label 7800 1200 0    50   ~ 0
~FL
Text Label 7800 1100 0    50   ~ 0
CLK4
Text Label 7800 1000 0    50   ~ 0
~RSTHOLD
Text Label 4550 2700 1    50   ~ 0
~FL
Text Label 4750 1200 0    50   ~ 0
~FL
Text Label 4450 2700 1    50   ~ 0
~RSTHOLD
Text Label 4150 4500 1    50   ~ 0
~FLAGWE
Text Label 4750 1100 0    50   ~ 0
CLK4
Text Label 4750 1000 0    50   ~ 0
~RSTHOLD
Text Label 1550 1100 0    50   ~ 0
CLK4
Text Label 1550 4900 0    50   ~ 0
~ACTION-CLL
Wire Wire Line
	4550 1200 10450 1200
Wire Wire Line
	4550 4700 4550 1200
Wire Wire Line
	5500 4700 4550 4700
Wire Wire Line
	10450 1200 10450 2950
Wire Wire Line
	8750 2850 8750 1100
Wire Wire Line
	4450 1000 8650 1000
Wire Wire Line
	8750 2850 9150 2850
Text Label 3200 4900 0    50   ~ 0
~ACTION-CLL
Text Label 3200 4600 0    50   ~ 0
~FLAGWE
Wire Wire Line
	4250 3850 6100 3850
Wire Wire Line
	2800 4250 2950 4250
Connection ~ 2800 4250
Wire Wire Line
	4250 4700 4250 3850
Wire Wire Line
	2800 4700 4250 4700
Wire Wire Line
	2800 4250 2800 4700
Wire Wire Line
	4150 3750 6100 3750
Wire Wire Line
	2900 4350 2950 4350
Connection ~ 2900 4350
Wire Wire Line
	4150 4600 4150 3750
Wire Wire Line
	2900 4600 4150 4600
Wire Wire Line
	2900 4350 2900 4600
Wire Wire Line
	1450 1000 4450 1000
Wire Wire Line
	4450 4800 6100 4800
Wire Wire Line
	1450 4800 4350 4800
Wire Wire Line
	4350 3950 6100 3950
Wire Wire Line
	4350 4800 4350 3950
Wire Wire Line
	6050 4700 6100 4700
Wire Wire Line
	6050 4650 6050 4700
Wire Wire Line
	4650 1750 5500 1750
Wire Wire Line
	4650 4600 5500 4600
Wire Wire Line
	4650 4600 4650 1750
Text HLabel 1450 1000 0    50   Input ~ 0
~RSTHOLD
Text Label 1550 1000 0    50   ~ 0
~RSTHOLD
Text HLabel 1450 4900 0    50   Input ~ 0
~ACTION-CLL
Wire Wire Line
	1450 1750 4650 1750
Wire Wire Line
	1450 4350 2900 4350
Wire Wire Line
	1450 4250 2800 4250
Wire Wire Line
	1450 2850 2900 2850
Wire Wire Line
	2900 2850 2900 2950
Text HLabel 1450 2850 0    50   Input ~ 0
IBUS12
Text HLabel 1450 3000 0    50   Input ~ 0
FLOUT-ROM
Text HLabel 1450 3450 0    50   Input ~ 0
FLOUT-SRU
Text HLabel 1450 4250 0    50   Input ~ 0
~SETL-ROM
Text HLabel 1450 4350 0    50   Input ~ 0
~FLAGWE
Text HLabel 1450 1750 0    50   Input ~ 0
~ACTION-CPL
Text Label 1550 3450 0    50   ~ 0
FLOUT-SRU
Text Label 1550 2850 0    50   ~ 0
IBUS12
Wire Wire Line
	2950 2950 2900 2950
Wire Wire Line
	2950 2850 2900 2850
Wire Wire Line
	2900 4050 2900 3850
Connection ~ 2900 4050
Wire Wire Line
	2950 4050 2900 4050
Wire Wire Line
	2900 3850 2900 3750
Connection ~ 2900 3850
Wire Wire Line
	2950 3850 2900 3850
Wire Wire Line
	2900 3750 2900 3650
Connection ~ 2900 3750
Wire Wire Line
	2950 3750 2900 3750
Wire Wire Line
	2900 3650 2900 3550
Connection ~ 2900 3650
Wire Wire Line
	2950 3650 2900 3650
Wire Wire Line
	2900 3550 2900 3350
Connection ~ 2900 3550
Wire Wire Line
	2950 3550 2900 3550
Wire Wire Line
	2900 3350 2950 3350
$Comp
L alexios:74HC253 U?
U 1 1 5D995AEE
P 3450 3550
AR Path="/5DC89E19/5D995AEE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AEE" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AEE" Ref="U804"  Part="1" 
F 0 "U804" H 3450 4517 50  0000 C CNN
F 1 "74HC253" H 3450 4426 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 3750 4150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 3750 4150 50  0001 C CNN
	1    3450 3550
	1    0    0    -1  
$EndComp
Text Label 1550 4350 0    50   ~ 0
~FLAGWE
Text Label 1550 4250 0    50   ~ 0
~SETL-ROM
Wire Wire Line
	7050 1700 7050 2750
$Comp
L alexios:74HC74 U?
U 2 1 5D995ADF
P 9600 2800
AR Path="/5DC89E19/5D995ADF" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D995ADF" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D995ADF" Ref="U802"  Part="2" 
F 0 "U802" H 9600 3217 50  0000 C CNN
F 1 "74AC74" H 9600 3126 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 9550 2950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9550 2950 50  0001 C CNN
	2    9600 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 1 1 5D995AD8
P 7950 2900
AR Path="/5DC89E19/5D995AD8" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AD8" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AD8" Ref="U802"  Part="1" 
F 0 "U802" H 7950 3317 50  0000 C CNN
F 1 "74AC74" H 7950 3226 50  0000 C CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 7900 3050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7900 3050 50  0001 C CNN
	1    7950 2900
	1    0    0    -1  
$EndComp
Text Label 7500 2850 2    50   ~ 0
LD
Text Label 4850 3750 0    50   ~ 0
~FLAGWE
Wire Wire Line
	7050 2950 7500 2950
Wire Wire Line
	7050 2750 7500 2750
Wire Wire Line
	7200 3050 7500 3050
Wire Wire Line
	7200 4800 7200 3050
Wire Wire Line
	8400 2750 8550 2750
Wire Wire Line
	9100 2650 9150 2650
Wire Wire Line
	9100 2600 9100 2650
$Comp
L power:+5V #PWR?
U 1 1 5D995AC2
P 9100 2600
AR Path="/5DC89E19/5D995AC2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AC2" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D995AC2" Ref="#PWR0801"  Part="1" 
F 0 "#PWR0801" H 9100 2450 50  0001 C CNN
F 1 "+5V" H 9115 2773 50  0000 C CNN
F 2 "" H 9100 2600 50  0001 C CNN
F 3 "" H 9100 2600 50  0001 C CNN
	1    9100 2600
	1    0    0    -1  
$EndComp
Text Label 8850 2950 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	9150 2950 8650 2950
Text Label 7500 2950 2    50   ~ 0
CLKL
Text Label 7500 2750 2    50   ~ 0
~SETL
Wire Wire Line
	6000 1700 7050 1700
Text Label 6100 1700 0    50   ~ 0
~SETL
Text Label 1550 1750 0    50   ~ 0
~ACTION-CPL
Text Label 4850 4700 0    50   ~ 0
~FL
$Comp
L alexios:74LVC1G32 U?
U 1 1 5D995AA5
P 5700 4650
AR Path="/5DC89E19/5D995AA5" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AA5" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AA5" Ref="U806"  Part="1" 
F 0 "U806" H 5750 4917 50  0000 C CNN
F 1 "74LVC1G32" H 5750 4826 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5810 4630 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5810 4630 50  0001 C CNN
	1    5700 4650
	1    0    0    -1  
$EndComp
Text Label 10250 2950 2    50   ~ 0
~FL
Wire Wire Line
	10050 2950 10450 2950
Wire Wire Line
	6050 4650 6000 4650
Text Label 4850 4600 0    50   ~ 0
~ACTION-CPL
Text Label 10150 2650 0    50   ~ 0
FL
Text Label 4850 4900 0    50   ~ 0
~ACTION-CLL
Text Label 4850 4800 0    50   ~ 0
~RSTHOLD
Text Label 6700 4800 0    50   ~ 0
~CLRL
Wire Wire Line
	6600 4800 7200 4800
Text Label 7500 3050 2    50   ~ 0
~CLRL
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D995A8C
P 6400 4750
AR Path="/5DC89E19/5D995A8C" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995A8C" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995A8C" Ref="U807"  Part="1" 
F 0 "U807" H 6350 5014 50  0000 C CNN
F 1 "74LVC1G11" H 6350 4923 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6300 4675 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 6300 4675 50  0001 C CNN
	1    6400 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2650 10350 2650
Text HLabel 1450 1100 0    50   Input ~ 0
CLK4
Text Label 9050 2850 2    50   ~ 0
CLK4
$Comp
L power:GND #PWR?
U 1 1 5D995A82
P 2900 4050
AR Path="/5DC89E19/5D995A82" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995A82" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D995A82" Ref="#PWR0802"  Part="1" 
F 0 "#PWR0802" H 2900 3800 50  0001 C CNN
F 1 "GND" H 2750 4000 50  0000 C CNN
F 2 "" H 2900 4050 50  0001 C CNN
F 3 "" H 2900 4050 50  0001 C CNN
	1    2900 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E2DC514
P 950 7350
AR Path="/5CC0D65F/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5E2DC514" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5E2DC514" Ref="C804"  Part="1" 
F 0 "C804" H 859 7396 50  0000 R CNN
F 1 "100nF" H 859 7305 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7350 50  0001 C CNN
F 3 "~" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2DC51B
P 950 7450
AR Path="/5E2DC51B" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E2DC51B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E2DC51B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E2DC51B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E2DC51B" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5E2DC51B" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5E2DC51B" Ref="#PWR0813"  Part="1" 
F 0 "#PWR0813" H 950 7200 50  0001 C CNN
F 1 "GND" H 955 7277 50  0000 C CNN
F 2 "" H 950 7450 50  0001 C CNN
F 3 "" H 950 7450 50  0001 C CNN
	1    950  7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E2DC521
P 950 7250
AR Path="/5E2DC521" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5E2DC521" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5E2DC521" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5E2DC521" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E2DC521" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5E2DC521" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5E2DC521" Ref="#PWR0809"  Part="1" 
F 0 "#PWR0809" H 950 7100 50  0001 C CNN
F 1 "+5V" H 965 7423 50  0000 C CNN
F 2 "" H 950 7250 50  0001 C CNN
F 3 "" H 950 7250 50  0001 C CNN
	1    950  7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 5 1 5E2E1118
P 1300 7050
AR Path="/5DC89E19/5E2E1118" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5E2E1118" Ref="U?"  Part="4" 
AR Path="/5D121AA3/5E2E1118" Ref="U801"  Part="5" 
F 0 "U801" H 1480 6796 50  0000 L CNN
F 1 "74HC32" H 1480 6705 50  0000 L CNN
F 2 "alexios:DIP-14_W7.62mm_Socket" H 1300 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1300 7050 50  0001 C CNN
	5    1300 7050
	1    0    0    -1  
$EndComp
Connection ~ 950  7250
Connection ~ 950  7450
Wire Wire Line
	4450 1000 4450 4800
Wire Wire Line
	6100 2850 6100 2800
Wire Wire Line
	6100 2850 6100 2900
Connection ~ 6100 2850
Wire Wire Line
	6000 2850 6100 2850
Wire Wire Line
	5500 2850 5500 2900
Wire Wire Line
	5500 2800 5500 2850
Connection ~ 5500 2850
Wire Wire Line
	5500 2850 5400 2850
Wire Wire Line
	6950 2850 7500 2850
$Comp
L Jumper:SolderJumper_2_Bridged JP804
U 1 1 5DDDBB14
P 6650 2450
F 0 "JP804" V 6650 2518 50  0000 L CNN
F 1 "SolderJumper_2_Bridged" H 6650 2564 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6650 2450 50  0001 C CNN
F 3 "~" H 6650 2450 50  0001 C CNN
	1    6650 2450
	0    1    1    0   
$EndComp
Text Notes 4800 3350 0    50   ~ 0
Time delay configuration. n×Tpd, 0≤n≤3.\nThe proposed default is 3Tpd.\nThis is done to allow for FF hold time.\n(CLK and D may be synchronous)
Wire Wire Line
	1450 4900 6100 4900
Text Notes 6500 2200 0    50   ~ 10
Bridged
$Comp
L Jumper:SolderJumper_2_Open JP801
U 1 1 5DE549E1
P 4800 2450
F 0 "JP801" V 4800 2518 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 4800 2564 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4800 2450 50  0001 C CNN
F 3 "~" H 4800 2450 50  0001 C CNN
	1    4800 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 2850 4800 2850
$Comp
L Jumper:SolderJumper_2_Open JP802
U 1 1 5DE54BD2
P 5400 2450
F 0 "JP802" V 5400 2518 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 5400 2564 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5400 2450 50  0001 C CNN
F 3 "~" H 5400 2450 50  0001 C CNN
	1    5400 2450
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP803
U 1 1 5DE5719E
P 6000 2450
F 0 "JP803" V 6000 2518 50  0000 L CNN
F 1 "SolderJumper_2_Open" H 6000 2564 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6000 2450 50  0001 C CNN
F 3 "~" H 6000 2450 50  0001 C CNN
	1    6000 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 2600 4800 2850
Connection ~ 4800 2850
Wire Wire Line
	4800 2850 4900 2850
Wire Wire Line
	5400 2600 5400 2850
Connection ~ 5400 2850
Wire Wire Line
	6000 2600 6000 2850
Connection ~ 6000 2850
Wire Wire Line
	6600 2850 6650 2850
Wire Wire Line
	6650 2850 6650 2600
Wire Wire Line
	4800 2300 4800 2250
Wire Wire Line
	4800 2250 5400 2250
Wire Wire Line
	6950 2250 6950 2850
Wire Wire Line
	5400 2300 5400 2250
Connection ~ 5400 2250
Wire Wire Line
	5400 2250 6000 2250
Wire Wire Line
	6000 2300 6000 2250
Connection ~ 6000 2250
Wire Wire Line
	6000 2250 6650 2250
Wire Wire Line
	6650 2300 6650 2250
Connection ~ 6650 2250
Wire Wire Line
	6650 2250 6950 2250
Wire Wire Line
	7050 2950 7050 3850
Text Label 4050 2850 0    50   ~ 0
LD0
Text Label 5400 2750 1    50   ~ 0
LD1
Text Label 6000 2750 1    50   ~ 0
LD2
Text Label 6650 2750 1    50   ~ 0
LD3
Text HLabel 10750 2650 2    50   Output ~ 0
FL
Text Notes 7500 2350 0    63   ~ 13
Critical: AC family!
Text Label 2150 3100 0    50   ~ 0
FL
$Comp
L power:+5V #PWR?
U 1 1 5EC483D8
P 5250 6500
AR Path="/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EC483D8" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC483D8" Ref="#PWR0805"  Part="1" 
F 0 "#PWR0805" H 5250 6350 50  0001 C CNN
F 1 "+5V" H 5265 6673 50  0000 C CNN
F 2 "" H 5250 6500 50  0001 C CNN
F 3 "" H 5250 6500 50  0001 C CNN
	1    5250 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC483DE
P 5250 6700
AR Path="/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5DE3C078/5EC483DE" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5EC483DE" Ref="#PWR0808"  Part="1" 
F 0 "#PWR0808" H 5250 6450 50  0001 C CNN
F 1 "GND" H 5255 6527 50  0000 C CNN
F 2 "" H 5250 6700 50  0001 C CNN
F 3 "" H 5250 6700 50  0001 C CNN
	1    5250 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EC483E4
P 5250 6600
AR Path="/5CC0D65F/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5E18A3E1/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5DE3C078/5EC483E4" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5EC483E4" Ref="C803"  Part="1" 
F 0 "C803" H 5159 6646 50  0000 R CNN
F 1 "100nF" H 5159 6555 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5250 6600 50  0001 C CNN
F 3 "~" H 5250 6600 50  0001 C CNN
	1    5250 6600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G86 U?
U 2 1 5EC483EA
P 5650 6450
AR Path="/5DE3C078/5EC483EA" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5EC483EA" Ref="U803"  Part="2" 
F 0 "U803" H 5780 6346 50  0000 L CNN
F 1 "74LVC1G86" H 5780 6255 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5590 6760 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G86.pdf" H 5590 6760 50  0001 C CNN
	2    5650 6450
	1    0    0    -1  
$EndComp
Connection ~ 5250 6700
Connection ~ 5250 6500
Connection ~ 2900 2850
Wire Wire Line
	1450 3450 2800 3450
Wire Wire Line
	2800 3150 2950 3150
Wire Wire Line
	2800 3150 2800 3450
Wire Wire Line
	1450 3000 2250 3000
$Comp
L alexios:74LVC1G86 U?
U 1 1 5EC483D0
P 2500 2950
AR Path="/5DE3C078/5EC483D0" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5EC483D0" Ref="U803"  Part="1" 
F 0 "U803" H 2500 2674 50  0000 C CNN
F 1 "74LVC1G86" H 2500 2583 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2440 3260 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G86.pdf" H 2440 3260 50  0001 C CNN
	1    2500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3050 2950 3050
Text Label 1550 3000 0    50   ~ 0
FLOUT-ROM
Wire Wire Line
	4650 1300 2100 1300
Wire Wire Line
	2100 1300 2100 3100
Wire Wire Line
	2100 3100 2250 3100
Connection ~ 4650 1300
Text Label 2100 2200 1    50   ~ 0
FL
Text Label 3200 4700 0    50   ~ 0
~SETL-ROM
Text Label 4250 4500 1    50   ~ 0
~SETL-ROM
Text Label 4850 3950 0    50   ~ 0
BCP
Text Label 4350 4500 1    50   ~ 0
BCP
Text Label 1550 4800 0    50   ~ 0
BCP
Text HLabel 1450 4800 0    50   Input ~ 0
BCP
Text Label 4850 3850 0    50   ~ 0
~SETL-ROM
Text Label 6650 3850 0    50   ~ 0
CLKL
Text Label 3200 4800 0    50   ~ 0
BCP
Text Notes 5150 4150 0    50   ~ 0
TODO: can we replace these with a single '11?
$Comp
L alexios:74LVC1G11 U?
U 1 1 60973450
P 6400 3800
AR Path="/5DC89E19/60973450" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/60973450" Ref="U?"  Part="1" 
AR Path="/5D121AA3/60973450" Ref="U805"  Part="1" 
F 0 "U805" H 6350 4064 50  0000 C CNN
F 1 "74LVC1G11" H 6350 3973 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6300 3725 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 6300 3725 50  0001 C CNN
	1    6400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3850 7050 3850
$Comp
L alexios:74LVC1G11 U?
U 2 1 6097E38C
P 2800 7200
AR Path="/5DC89E19/6097E38C" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/6097E38C" Ref="U?"  Part="1" 
AR Path="/5D121AA3/6097E38C" Ref="U805"  Part="2" 
F 0 "U805" H 2750 7464 50  0000 C CNN
F 1 "74LVC1G11" H 2750 7373 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 2700 7125 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 2700 7125 50  0001 C CNN
	2    2800 7200
	1    0    0    -1  
$EndComp
Connection ~ 2350 7450
Connection ~ 2350 7250
$EndSCHEMATC
