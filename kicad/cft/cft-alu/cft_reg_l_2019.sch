EESchema Schematic File Version 4
LIBS:cft-alu-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7100 6950 0    197  ~ 39
The Link Register (L)
$Comp
L alexios:74HC253 U?
U 2 1 5D9AE85D
P 1300 7200
AR Path="/5DC89E19/5D9AE85D" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9AE85D" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9AE85D" Ref="U45"  Part="2" 
F 0 "U45" H 1479 7846 50  0000 L CNN
F 1 "74HC253" H 1479 7755 50  0000 L CNN
F 2 "alexios:SOIC-16" H 1600 7800 50  0001 C CNN
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
AR Path="/5D121AA3/5D9BC7A1" Ref="U46"  Part="2" 
F 0 "U46" H 2880 6146 50  0000 L CNN
F 1 "74LVC1G32" H 2880 6055 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2860 6330 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 2860 6330 50  0001 C CNN
	2    2750 6350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 2 1 5D9BCCC6
P 4250 6500
AR Path="/5DC89E19/5D9BCCC6" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BCCC6" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9BCCC6" Ref="U6"  Part="2" 
F 0 "U6" H 4330 6446 50  0000 L CNN
F 1 "74LVC1G08" H 4330 6355 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3900 6500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 3900 6500 50  0001 C CNN
	2    4250 6500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 2 1 5D9BCDED
P 2800 7250
AR Path="/5DC89E19/5D9BCDED" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BCDED" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9BCDED" Ref="U44"  Part="2" 
F 0 "U44" H 2880 7196 50  0000 L CNN
F 1 "74LVC1G08" H 2880 7105 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 2450 7250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 2450 7250 50  0001 C CNN
	2    2800 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G11 U?
U 2 1 5D9BCE39
P 4250 7200
AR Path="/5DC89E19/5D9BCE39" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BCE39" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D9BCE39" Ref="U47"  Part="2" 
F 0 "U47" H 4330 7096 50  0000 L CNN
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
AR Path="/5D121AA3/5D9C517A" Ref="C31"  Part="1" 
F 0 "C31" H 2259 6646 50  0000 R CNN
F 1 "100nF" H 2259 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 6600 50  0001 C CNN
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
AR Path="/5D121AA3/5D9C5181" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 2350 6450 50  0001 C CNN
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
AR Path="/5D121AA3/5D9C5187" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 2350 6350 50  0001 C CNN
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
AR Path="/5D121AA3/5D9C755E" Ref="C30"  Part="1" 
F 0 "C30" H 859 6646 50  0000 R CNN
F 1 "100nF" H 859 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 6600 50  0001 C CNN
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
AR Path="/5D121AA3/5D9C7565" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 950 6450 50  0001 C CNN
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
AR Path="/5D121AA3/5D9C756B" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 950 6350 50  0001 C CNN
F 1 "+5V" H 965 6673 50  0000 C CNN
F 2 "" H 950 6500 50  0001 C CNN
F 3 "" H 950 6500 50  0001 C CNN
	1    950  6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D9CBD11
P 3800 6600
AR Path="/5CC0D65F/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5F597FD4/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9CBD11" Ref="C?"  Part="1" 
AR Path="/5D121AA3/5D9CBD11" Ref="C32"  Part="1" 
F 0 "C32" H 3709 6646 50  0000 R CNN
F 1 "100nF" H 3709 6555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 6600 50  0001 C CNN
F 3 "~" H 3800 6600 50  0001 C CNN
	1    3800 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D9CBD18
P 3800 6700
AR Path="/5D9CBD18" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9CBD18" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9CBD18" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9CBD18" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9CBD18" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9CBD18" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9CBD18" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 3800 6450 50  0001 C CNN
F 1 "GND" H 3805 6527 50  0000 C CNN
F 2 "" H 3800 6700 50  0001 C CNN
F 3 "" H 3800 6700 50  0001 C CNN
	1    3800 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D9CBD1E
P 3800 6500
AR Path="/5D9CBD1E" Ref="#PWR?"  Part="1" 
AR Path="/5F597FD4/5D9CBD1E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/5D9CBD1E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/5D9CBD1E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D9CBD1E" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9CBD1E" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D9CBD1E" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 3800 6350 50  0001 C CNN
F 1 "+5V" H 3815 6673 50  0000 C CNN
F 2 "" H 3800 6500 50  0001 C CNN
F 3 "" H 3800 6500 50  0001 C CNN
	1    3800 6500
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
AR Path="/5D121AA3/5D9CE0D0" Ref="C34"  Part="1" 
F 0 "C34" H 2259 7396 50  0000 R CNN
F 1 "100nF" H 2259 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2350 7350 50  0001 C CNN
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
AR Path="/5D121AA3/5D9CE0D7" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 2350 7200 50  0001 C CNN
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
AR Path="/5D121AA3/5D9CE0DD" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 2350 7100 50  0001 C CNN
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
AR Path="/5D121AA3/5D9D2863" Ref="C35"  Part="1" 
F 0 "C35" H 3709 7396 50  0000 R CNN
F 1 "100nF" H 3709 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 7350 50  0001 C CNN
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
AR Path="/5D121AA3/5D9D286A" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 3800 7200 50  0001 C CNN
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
AR Path="/5D121AA3/5D9D2870" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 3800 7100 50  0001 C CNN
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
Connection ~ 3800 6500
Connection ~ 3800 6700
Connection ~ 2350 7250
Connection ~ 2350 7450
Connection ~ 2350 6500
Connection ~ 2350 6700
$Comp
L alexios:74HC74 U?
U 3 1 5D3440A1
P 5600 7350
AR Path="/5DC89E19/5D3440A1" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D3440A1" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D3440A1" Ref="U43"  Part="3" 
F 0 "U43" H 5600 7767 50  0000 C CNN
F 1 "74AC74" H 5600 7676 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5550 7500 50  0001 C CNN
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
AR Path="/5D121AA3/5D34587B" Ref="C36"  Part="1" 
F 0 "C36" H 5159 7396 50  0000 R CNN
F 1 "100nF" H 5159 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5250 7350 50  0001 C CNN
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
AR Path="/5D121AA3/5D345881" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 5250 7200 50  0001 C CNN
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
AR Path="/5D121AA3/5D345887" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 5250 7100 50  0001 C CNN
F 1 "+5V" H 5265 7423 50  0000 C CNN
F 2 "" H 5250 7250 50  0001 C CNN
F 3 "" H 5250 7250 50  0001 C CNN
	1    5250 7250
	1    0    0    -1  
$EndComp
Connection ~ 5250 7250
Connection ~ 5250 7450
Wire Wire Line
	4400 4900 4400 4100
Wire Wire Line
	4400 4100 6050 4100
Wire Wire Line
	1650 4900 4400 4900
Wire Wire Line
	1650 1700 8350 1700
Connection ~ 4400 1600
Wire Wire Line
	8250 1600 8250 2950
Text Label 7400 1900 0    50   ~ 0
FL
NoConn ~ 8000 3050
NoConn ~ 3900 3550
Text Label 8450 2750 0    50   ~ 0
FLFAST
Text Notes 8450 3650 0    50   ~ 0
FLFAST is for use by the Shift/Roll Unit,\nwhich operates in the same clock\ndomain as this flip-flop (four times\nfaster than the system clock) and needs\nthe result back quickly.\n
Text Label 9750 3200 0    50   ~ 0
FLFAST
Text Label 8450 3200 0    50   ~ 0
FLFAST
Text HLabel 10350 3200 2    50   Output ~ 0
FLFAST
Wire Wire Line
	8150 2750 8750 2750
Connection ~ 8150 2750
Wire Wire Line
	8150 3200 10350 3200
Wire Wire Line
	8150 2750 8150 3200
Wire Wire Line
	4600 1900 4600 2250
Connection ~ 4600 2350
Text Label 4700 1900 0    50   ~ 0
FL
Wire Wire Line
	4600 2250 5450 2250
Wire Wire Line
	4600 1900 9950 1900
Wire Wire Line
	9950 2650 10350 2650
Connection ~ 9950 2650
Wire Wire Line
	9950 2650 9950 1900
$Comp
L alexios:74HC32 U?
U 4 1 5D9BC98F
P 5700 2100
AR Path="/5DC89E19/5D9BC98F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D9BC98F" Ref="U?"  Part="4" 
AR Path="/5D121AA3/5D9BC98F" Ref="U38"  Part="4" 
F 0 "U38" H 5700 2175 50  0000 C CNN
F 1 "74HC32" H 5700 2084 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5700 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5700 2100 50  0001 C CNN
	4    5700 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 3 1 5D995B6D
P 6300 2650
AR Path="/5DC89E19/5D995B6D" Ref="U?"  Part="3" 
AR Path="/5DC89E19/5D98F946/5D995B6D" Ref="U?"  Part="3" 
AR Path="/5D121AA3/5D995B6D" Ref="U38"  Part="3" 
F 0 "U38" H 6300 2725 50  0000 C CNN
F 1 "74HC32" H 6300 2634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 6300 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6300 2650 50  0001 C CNN
	3    6300 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 2 1 5D995B66
P 5700 2650
AR Path="/5DC89E19/5D995B66" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D995B66" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D995B66" Ref="U38"  Part="2" 
F 0 "U38" H 5700 2725 50  0000 C CNN
F 1 "74HC32" H 5700 2634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5700 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5700 2650 50  0001 C CNN
	2    5700 2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC32 U?
U 1 1 5D995B5F
P 5100 2650
AR Path="/5DC89E19/5D995B5F" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995B5F" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995B5F" Ref="U38"  Part="1" 
F 0 "U38" H 5100 2725 50  0000 C CNN
F 1 "74HC32" H 5100 2634 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5100 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5100 2650 50  0001 C CNN
	1    5100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2850 4850 2900
Connection ~ 4850 2850
Wire Wire Line
	4850 2800 4850 2850
Wire Wire Line
	3900 2850 4850 2850
Text Label 4800 2250 0    50   ~ 0
FL
Text Label 4800 2350 0    50   ~ 0
~ACTION-CPL
Text Label 7400 1800 0    50   ~ 0
~FL
Text Label 7400 1700 0    50   ~ 0
CLK4
Text Label 7400 1600 0    50   ~ 0
~RESET
Text Label 4500 2700 1    50   ~ 0
~FL
Text Label 4700 1800 0    50   ~ 0
~FL
Text Label 4400 2700 1    50   ~ 0
~RESET
Text Label 4300 4450 1    50   ~ 0
BCP
Text Label 4200 4450 1    50   ~ 0
~READ-ALU-ADD
Text Label 4100 4450 1    50   ~ 0
~FLAGWE
Text Label 4700 1700 0    50   ~ 0
CLK4
Text Label 4700 1600 0    50   ~ 0
~RESET
Text Label 1850 1700 0    50   ~ 0
CLK4
Text Label 1850 4900 0    50   ~ 0
~ACTION-CLL
Wire Wire Line
	4400 1600 4400 4000
Wire Wire Line
	4500 1800 10050 1800
Wire Wire Line
	4500 3900 4500 1800
Wire Wire Line
	5450 3900 4500 3900
Wire Wire Line
	10050 1800 10050 2950
Wire Wire Line
	8350 2850 8350 1700
Wire Wire Line
	4400 1600 8250 1600
Wire Wire Line
	8350 2850 8750 2850
Text Label 3150 4900 0    50   ~ 0
~ACTION-CLL
Text Label 3150 4800 0    50   ~ 0
BCP
Text Label 3150 4600 0    50   ~ 0
~FLAGWE
Text Label 3150 4700 0    50   ~ 0
~READ-ALU-ADD
Wire Wire Line
	5450 2850 5450 2900
Connection ~ 5450 2850
Wire Wire Line
	5450 2850 5350 2850
Wire Wire Line
	5450 2800 5450 2850
Wire Wire Line
	4200 3400 5450 3400
Wire Wire Line
	2750 4250 2900 4250
Connection ~ 2750 4250
Wire Wire Line
	4200 4700 4200 3400
Wire Wire Line
	2750 4700 4200 4700
Wire Wire Line
	2750 4250 2750 4700
Wire Wire Line
	4100 3300 5450 3300
Wire Wire Line
	2850 4350 2900 4350
Connection ~ 2850 4350
Wire Wire Line
	4100 4600 4100 3300
Wire Wire Line
	2850 4600 4100 4600
Wire Wire Line
	2850 4350 2850 4600
Wire Wire Line
	1650 1600 4400 1600
Wire Wire Line
	4400 4000 6050 4000
Wire Wire Line
	1650 4800 4300 4800
Wire Wire Line
	4300 3500 6050 3500
Wire Wire Line
	4300 4800 4300 3500
Wire Wire Line
	6000 3900 6050 3900
Wire Wire Line
	6000 3850 6000 3900
Wire Wire Line
	4600 2350 5450 2350
Wire Wire Line
	4600 3800 5450 3800
Wire Wire Line
	4600 3800 4600 2350
Text HLabel 1650 1600 0    50   Input ~ 0
~RESET
Text Label 1850 1600 0    50   ~ 0
~RESET
Text HLabel 1650 4800 0    50   Input ~ 0
BCP
Text Label 1850 4800 0    50   ~ 0
BCP
Text HLabel 1650 4900 0    50   Input ~ 0
~ACTION-CLL
Wire Wire Line
	1650 2350 4600 2350
Wire Wire Line
	1650 4350 2850 4350
Wire Wire Line
	1650 3150 2900 3150
Wire Wire Line
	1650 3050 2900 3050
Wire Wire Line
	1650 4250 2750 4250
Wire Wire Line
	1650 2950 2850 2950
Connection ~ 2850 2950
Wire Wire Line
	2850 2850 2850 2950
Text HLabel 1650 2950 0    50   Input ~ 0
IBUS12
Text HLabel 1650 3050 0    50   Input ~ 0
FLIN-ROM
Text HLabel 1650 3150 0    50   Input ~ 0
FLIN-SRU
Text HLabel 1650 4250 0    50   Input ~ 0
~ROM-SET-L
Text HLabel 1650 4350 0    50   Input ~ 0
~FLAGWE
Text HLabel 1650 2350 0    50   Input ~ 0
~ACTION-CPL
Text Label 1850 3150 0    50   ~ 0
FLIN-SRU
Text Label 1850 2950 0    50   ~ 0
IBUS12
Wire Wire Line
	2900 2950 2850 2950
Wire Wire Line
	2900 2850 2850 2850
Wire Wire Line
	2850 4050 2850 3850
Connection ~ 2850 4050
Wire Wire Line
	2900 4050 2850 4050
Wire Wire Line
	2850 3850 2850 3750
Connection ~ 2850 3850
Wire Wire Line
	2900 3850 2850 3850
Wire Wire Line
	2850 3750 2850 3650
Connection ~ 2850 3750
Wire Wire Line
	2900 3750 2850 3750
Wire Wire Line
	2850 3650 2850 3550
Connection ~ 2850 3650
Wire Wire Line
	2900 3650 2850 3650
Wire Wire Line
	2850 3550 2850 3350
Connection ~ 2850 3550
Wire Wire Line
	2900 3550 2850 3550
Wire Wire Line
	2850 3350 2900 3350
$Comp
L alexios:74HC253 U?
U 1 1 5D995AEE
P 3400 3550
AR Path="/5DC89E19/5D995AEE" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AEE" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AEE" Ref="U45"  Part="1" 
F 0 "U45" H 3400 4517 50  0000 C CNN
F 1 "74HC253" H 3400 4426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 3700 4150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT253.pdf" H 3700 4150 50  0001 C CNN
	1    3400 3550
	1    0    0    -1  
$EndComp
Text Label 1850 4350 0    50   ~ 0
~FLAGWE
Text Label 1850 4250 0    50   ~ 0
~ROM-SET-L
Wire Wire Line
	6550 2850 7100 2850
Wire Wire Line
	6650 2300 6650 2750
Connection ~ 6050 2850
Wire Wire Line
	6050 2850 6050 2900
Wire Wire Line
	6050 2850 6050 2800
Wire Wire Line
	5950 2850 6050 2850
$Comp
L alexios:74HC74 U?
U 2 1 5D995ADF
P 9200 2800
AR Path="/5DC89E19/5D995ADF" Ref="U?"  Part="2" 
AR Path="/5DC89E19/5D98F946/5D995ADF" Ref="U?"  Part="2" 
AR Path="/5D121AA3/5D995ADF" Ref="U43"  Part="2" 
F 0 "U43" H 9200 3217 50  0000 C CNN
F 1 "74AC74" H 9200 3126 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9150 2950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 9150 2950 50  0001 C CNN
	2    9200 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC74 U?
U 1 1 5D995AD8
P 7550 2900
AR Path="/5DC89E19/5D995AD8" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AD8" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AD8" Ref="U43"  Part="1" 
F 0 "U43" H 7550 3317 50  0000 C CNN
F 1 "74AC74" H 7550 3226 50  0000 C CNN
F 2 "alexios:SOIC-14" H 7500 3050 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7500 3050 50  0001 C CNN
	1    7550 2900
	1    0    0    -1  
$EndComp
Text Label 7100 2850 2    50   ~ 0
LD
Text Label 4800 3400 0    50   ~ 0
~READ-ALU-ADD
Text Label 4800 3300 0    50   ~ 0
~FLAGWE
Text Label 4800 3500 0    50   ~ 0
BCP
Wire Wire Line
	6650 2950 7100 2950
Wire Wire Line
	6650 3450 6650 2950
Wire Wire Line
	6500 3450 6650 3450
Wire Wire Line
	5950 3400 6050 3400
Wire Wire Line
	5950 3350 5950 3400
Wire Wire Line
	5900 3350 5950 3350
Wire Wire Line
	6650 2750 7100 2750
Wire Wire Line
	6800 3050 7100 3050
Wire Wire Line
	6800 4000 6800 3050
Wire Wire Line
	8000 2750 8150 2750
Wire Wire Line
	8700 2650 8750 2650
Wire Wire Line
	8700 2600 8700 2650
$Comp
L power:+5V #PWR?
U 1 1 5D995AC2
P 8700 2600
AR Path="/5DC89E19/5D995AC2" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AC2" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D995AC2" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 8700 2450 50  0001 C CNN
F 1 "+5V" H 8715 2773 50  0000 C CNN
F 2 "" H 8700 2600 50  0001 C CNN
F 3 "" H 8700 2600 50  0001 C CNN
	1    8700 2600
	1    0    0    -1  
$EndComp
Text Label 8450 2950 0    50   ~ 0
~RESET
Wire Wire Line
	8750 2950 8250 2950
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D995AB2
P 5750 3350
AR Path="/5DC89E19/5D995AB2" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AB2" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AB2" Ref="U6"  Part="1" 
F 0 "U6" H 5675 3617 50  0000 C CNN
F 1 "74LVC1G08" H 5675 3526 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5400 3350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 5400 3350 50  0001 C CNN
	1    5750 3350
	1    0    0    -1  
$EndComp
Text Label 7100 2950 2    50   ~ 0
CLKL
Text Label 7100 2750 2    50   ~ 0
~SETL
Wire Wire Line
	5950 2300 6650 2300
Text Label 6050 2300 0    50   ~ 0
~SETL
Text Label 1850 2350 0    50   ~ 0
~ACTION-CPL
Text Label 4800 3900 0    50   ~ 0
~FL
$Comp
L alexios:74LVC1G32 U?
U 1 1 5D995AA5
P 5650 3850
AR Path="/5DC89E19/5D995AA5" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AA5" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AA5" Ref="U46"  Part="1" 
F 0 "U46" H 5700 4117 50  0000 C CNN
F 1 "74LVC1G32" H 5700 4026 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 5760 3830 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 5760 3830 50  0001 C CNN
	1    5650 3850
	1    0    0    -1  
$EndComp
Text Label 9850 2950 2    50   ~ 0
~FL
Wire Wire Line
	9650 2950 10050 2950
Wire Wire Line
	6000 3850 5950 3850
Text Label 4800 3800 0    50   ~ 0
~ACTION-CPL
Text Label 9750 2650 0    50   ~ 0
FL
Text Label 4800 4100 0    50   ~ 0
~ACTION-CLL
Text Label 4800 4000 0    50   ~ 0
~RESET
Text Label 6750 4000 2    50   ~ 0
~CLRL
Wire Wire Line
	6550 4000 6800 4000
Text Label 7100 3050 2    50   ~ 0
~CLRL
$Comp
L alexios:74LVC1G11 U?
U 1 1 5D995A8C
P 6350 3950
AR Path="/5DC89E19/5D995A8C" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995A8C" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995A8C" Ref="U47"  Part="1" 
F 0 "U47" H 6300 4214 50  0000 C CNN
F 1 "74LVC1G11" H 6300 4123 50  0000 C CNN
F 2 "alexios:SOT-23-6_Handsoldering" H 6250 3875 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G11.pdf" H 6250 3875 50  0001 C CNN
	1    6350 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2650 9950 2650
Text HLabel 1650 1700 0    50   Input ~ 0
CLK4
Text Label 8650 2850 2    50   ~ 0
CLK4
Text HLabel 10350 2650 2    50   Output ~ 0
FL
$Comp
L power:GND #PWR?
U 1 1 5D995A82
P 2850 4050
AR Path="/5DC89E19/5D995A82" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995A82" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/5D995A82" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 2850 3800 50  0001 C CNN
F 1 "GND" H 2700 4000 50  0000 C CNN
F 2 "" H 2850 4050 50  0001 C CNN
F 3 "" H 2850 4050 50  0001 C CNN
	1    2850 4050
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G08 U?
U 1 1 5D995AB9
P 6350 3450
AR Path="/5DC89E19/5D995AB9" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D98F946/5D995AB9" Ref="U?"  Part="1" 
AR Path="/5D121AA3/5D995AB9" Ref="U44"  Part="1" 
F 0 "U44" H 6275 3717 50  0000 C CNN
F 1 "74LVC1G08" H 6275 3626 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 6000 3450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G08.pdf" H 6000 3450 50  0001 C CNN
	1    6350 3450
	1    0    0    -1  
$EndComp
Text Label 1850 3050 0    50   ~ 0
FLIN-ROM
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
AR Path="/5D121AA3/5E2DC514" Ref="C39"  Part="1" 
F 0 "C39" H 859 7396 50  0000 R CNN
F 1 "100nF" H 859 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7350 50  0001 C CNN
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
AR Path="/5D121AA3/5E2DC51B" Ref="#PWR0183"  Part="1" 
F 0 "#PWR0183" H 950 7200 50  0001 C CNN
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
AR Path="/5D121AA3/5E2DC521" Ref="#PWR0184"  Part="1" 
F 0 "#PWR0184" H 950 7100 50  0001 C CNN
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
AR Path="/5D121AA3/5E2E1118" Ref="U38"  Part="5" 
F 0 "U38" H 1300 7125 50  0000 C CNN
F 1 "74HC32" H 1300 7034 50  0000 C CNN
F 2 "alexios:SOIC-14" H 1300 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1300 7050 50  0001 C CNN
	5    1300 7050
	1    0    0    -1  
$EndComp
Connection ~ 950  7250
Connection ~ 950  7450
$EndSCHEMATC
