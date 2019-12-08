EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 11
Title "Memory Bank Register File"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC670 U28
U 2 1 5DAE9F74
P 5000 7150
F 0 "U28" H 5180 7596 50  0000 L CNN
F 1 "74HC670" H 5180 7505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5300 7300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 5300 7300 50  0001 C CNN
	2    5000 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U29
U 2 1 5DAEB055
P 5000 7800
F 0 "U29" H 5180 8246 50  0000 L CNN
F 1 "74HC670" H 5180 8155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5300 7950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 5300 7950 50  0001 C CNN
	2    5000 7800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB78DDF
P 4650 6750
AR Path="/5CC0D65F/5DB78DDF" Ref="C?"  Part="1" 
AR Path="/5DB78DDF" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB78DDF" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB78DDF" Ref="C22"  Part="1" 
F 0 "C22" H 4559 6796 50  0000 R CNN
F 1 "100nF" H 4559 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4650 6750 50  0001 C CNN
F 3 "~" H 4650 6750 50  0001 C CNN
	1    4650 6750
	1    0    0    -1  
$EndComp
Connection ~ 4650 6650
$Comp
L power:+5V #PWR?
U 1 1 5DB78DE5
P 4650 6650
AR Path="/5DB78DE5" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB78DE5" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB78DE5" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 4650 6500 50  0001 C CNN
F 1 "+5V" H 4665 6823 50  0000 C CNN
F 2 "" H 4650 6650 50  0001 C CNN
F 3 "" H 4650 6650 50  0001 C CNN
	1    4650 6650
	1    0    0    -1  
$EndComp
Connection ~ 4650 6850
$Comp
L power:GND #PWR?
U 1 1 5DB78DEB
P 4650 6850
AR Path="/5DB78DEB" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB78DEB" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB78DEB" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 4650 6600 50  0001 C CNN
F 1 "GND" H 4655 6677 50  0000 C CNN
F 2 "" H 4650 6850 50  0001 C CNN
F 3 "" H 4650 6850 50  0001 C CNN
	1    4650 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DBBD3BA
P 4650 7400
AR Path="/5CC0D65F/5DBBD3BA" Ref="C?"  Part="1" 
AR Path="/5DBBD3BA" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DBBD3BA" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DBBD3BA" Ref="C26"  Part="1" 
F 0 "C26" H 4559 7446 50  0000 R CNN
F 1 "100nF" H 4559 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4650 7400 50  0001 C CNN
F 3 "~" H 4650 7400 50  0001 C CNN
	1    4650 7400
	1    0    0    -1  
$EndComp
Connection ~ 4650 7300
$Comp
L power:+5V #PWR?
U 1 1 5DBBD3C0
P 4650 7300
AR Path="/5DBBD3C0" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBBD3C0" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBBD3C0" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 4650 7150 50  0001 C CNN
F 1 "+5V" H 4665 7473 50  0000 C CNN
F 2 "" H 4650 7300 50  0001 C CNN
F 3 "" H 4650 7300 50  0001 C CNN
	1    4650 7300
	1    0    0    -1  
$EndComp
Connection ~ 4650 7500
$Comp
L power:GND #PWR?
U 1 1 5DBBD3C6
P 4650 7500
AR Path="/5DBBD3C6" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBBD3C6" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBBD3C6" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 4650 7250 50  0001 C CNN
F 1 "GND" H 4655 7327 50  0000 C CNN
F 2 "" H 4650 7500 50  0001 C CNN
F 3 "" H 4650 7500 50  0001 C CNN
	1    4650 7500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U33
U 2 1 5DAEA948
P 6300 7150
F 0 "U33" H 6480 7596 50  0000 L CNN
F 1 "74HC670" H 6480 7505 50  0000 L CNN
F 2 "alexios:SOIC-16" H 6600 7300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 6600 7300 50  0001 C CNN
	2    6300 7150
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U34
U 2 1 5DAEB4D2
P 6300 7800
F 0 "U34" H 6480 8246 50  0000 L CNN
F 1 "74HC670" H 6480 8155 50  0000 L CNN
F 2 "alexios:SOIC-16" H 6600 7950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 6600 7950 50  0001 C CNN
	2    6300 7800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB89F0A
P 5950 6750
AR Path="/5CC0D65F/5DB89F0A" Ref="C?"  Part="1" 
AR Path="/5DB89F0A" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB89F0A" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB89F0A" Ref="C23"  Part="1" 
F 0 "C23" H 5859 6796 50  0000 R CNN
F 1 "100nF" H 5859 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5950 6750 50  0001 C CNN
F 3 "~" H 5950 6750 50  0001 C CNN
	1    5950 6750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB89F10
P 5950 6650
AR Path="/5DB89F10" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB89F10" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB89F10" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 5950 6500 50  0001 C CNN
F 1 "+5V" H 5965 6823 50  0000 C CNN
F 2 "" H 5950 6650 50  0001 C CNN
F 3 "" H 5950 6650 50  0001 C CNN
	1    5950 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB89F16
P 5950 6850
AR Path="/5DB89F16" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB89F16" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB89F16" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 5950 6600 50  0001 C CNN
F 1 "GND" H 5955 6677 50  0000 C CNN
F 2 "" H 5950 6850 50  0001 C CNN
F 3 "" H 5950 6850 50  0001 C CNN
	1    5950 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DBCE23C
P 5950 7400
AR Path="/5CC0D65F/5DBCE23C" Ref="C?"  Part="1" 
AR Path="/5DBCE23C" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DBCE23C" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DBCE23C" Ref="C27"  Part="1" 
F 0 "C27" H 5859 7446 50  0000 R CNN
F 1 "100nF" H 5859 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5950 7400 50  0001 C CNN
F 3 "~" H 5950 7400 50  0001 C CNN
	1    5950 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DBCE242
P 5950 7300
AR Path="/5DBCE242" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBCE242" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBCE242" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 5950 7150 50  0001 C CNN
F 1 "+5V" H 5965 7473 50  0000 C CNN
F 2 "" H 5950 7300 50  0001 C CNN
F 3 "" H 5950 7300 50  0001 C CNN
	1    5950 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DBCE248
P 5950 7500
AR Path="/5DBCE248" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBCE248" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBCE248" Ref="#PWR073"  Part="1" 
F 0 "#PWR073" H 5950 7250 50  0001 C CNN
F 1 "GND" H 5955 7327 50  0000 C CNN
F 2 "" H 5950 7500 50  0001 C CNN
F 3 "" H 5950 7500 50  0001 C CNN
	1    5950 7500
	1    0    0    -1  
$EndComp
Connection ~ 5950 6650
Connection ~ 5950 6850
Connection ~ 5950 7300
Connection ~ 5950 7500
$Comp
L alexios:74HC670 U28
U 1 1 61FE7E73
P 4650 2000
F 0 "U28" H 4650 2767 50  0000 C CNN
F 1 "74HC670" H 4650 2676 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4950 2150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 4950 2150 50  0001 C CNN
	1    4650 2000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U33
U 1 1 61FE7E7A
P 4650 3600
F 0 "U33" H 4650 4367 50  0000 C CNN
F 1 "74HC670" H 4650 4276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 4950 3750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 4950 3750 50  0001 C CNN
	1    4650 3600
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U29
U 1 1 61FE7E91
P 6700 2000
F 0 "U29" H 6700 2767 50  0000 C CNN
F 1 "74HC670" H 6700 2676 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7000 2150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 7000 2150 50  0001 C CNN
	1    6700 2000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC670 U34
U 1 1 61FE7E98
P 6700 3600
F 0 "U34" H 6700 4367 50  0000 C CNN
F 1 "74HC670" H 6700 4276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 7000 3750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 7000 3750 50  0001 C CNN
	1    6700 3600
	1    0    0    -1  
$EndComp
Text Label 3800 2600 0    50   ~ 0
~BANKR0
Wire Wire Line
	4150 2600 3800 2600
Wire Wire Line
	4150 2400 3800 2400
Wire Wire Line
	4150 2500 3800 2500
Text Label 3800 2400 0    50   ~ 0
SEL0
Text Label 3800 2500 0    50   ~ 0
SEL1
Wire Wire Line
	4150 2000 3800 2000
Wire Wire Line
	4150 2100 3800 2100
Wire Wire Line
	3800 1500 4150 1500
Wire Wire Line
	3800 1600 4150 1600
Wire Wire Line
	3800 1700 4150 1700
Wire Wire Line
	3800 1800 4150 1800
Text Label 3800 1500 0    50   ~ 0
IBUS0
Text Label 3800 1600 0    50   ~ 0
IBUS1
Text Label 3800 1700 0    50   ~ 0
IBUS2
Text Label 3800 1800 0    50   ~ 0
IBUS3
Wire Wire Line
	4150 2200 3800 2200
Text Label 3800 2200 0    50   ~ 0
~BANKW0
Entry Wire Line
	3700 1400 3800 1500
Entry Wire Line
	3700 1500 3800 1600
Entry Wire Line
	3700 1600 3800 1700
Entry Wire Line
	3700 1700 3800 1800
Entry Wire Line
	5500 1800 5600 1900
Entry Wire Line
	5500 1700 5600 1800
Entry Wire Line
	5500 1600 5600 1700
Entry Wire Line
	5500 1500 5600 1600
Text Label 5200 1800 0    50   ~ 0
AEXT3
Text Label 5200 1700 0    50   ~ 0
AEXT2
Text Label 5200 1600 0    50   ~ 0
AEXT1
Text Label 5200 1500 0    50   ~ 0
AEXT0
Wire Wire Line
	5150 1800 5500 1800
Wire Wire Line
	5150 1700 5500 1700
Wire Wire Line
	5150 1600 5500 1600
Wire Wire Line
	5150 1500 5500 1500
Wire Wire Line
	5150 3100 5500 3100
Text Label 5200 3100 0    50   ~ 0
AEXT4
Text Label 5200 3200 0    50   ~ 0
AEXT5
Text Label 5200 3300 0    50   ~ 0
AEXT6
Wire Wire Line
	5150 3200 5500 3200
Wire Wire Line
	5150 3300 5500 3300
Entry Wire Line
	5500 3100 5600 3200
Entry Wire Line
	5500 3200 5600 3300
Entry Wire Line
	5500 3300 5600 3400
Entry Wire Line
	5500 3400 5600 3500
Text Label 5200 3400 0    50   ~ 0
AEXT7
Wire Wire Line
	5150 3400 5500 3400
Connection ~ 5150 3400
Text Label 5150 3900 1    50   ~ 0
AEXT7
Wire Wire Line
	3600 5650 5150 5650
Wire Wire Line
	1750 4700 1750 4900
$Comp
L power:GND #PWR?
U 1 1 5DC014EE
P 3200 6800
AR Path="/5DC014EE" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DC014EE" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DC014EE" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 3200 6550 50  0001 C CNN
F 1 "GND" H 3205 6627 50  0000 C CNN
F 2 "" H 3200 6800 50  0001 C CNN
F 3 "" H 3200 6800 50  0001 C CNN
	1    3200 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DC014E8
P 3200 6600
AR Path="/5DC014E8" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DC014E8" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DC014E8" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 3200 6450 50  0001 C CNN
F 1 "+5V" H 3215 6773 50  0000 C CNN
F 2 "" H 3200 6600 50  0001 C CNN
F 3 "" H 3200 6600 50  0001 C CNN
	1    3200 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DC014E2
P 3200 6700
AR Path="/5CC0D65F/5DC014E2" Ref="C?"  Part="1" 
AR Path="/5DC014E2" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DC014E2" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DC014E2" Ref="C21"  Part="1" 
F 0 "C21" H 3109 6746 50  0000 R CNN
F 1 "100nF" H 3109 6655 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3200 6700 50  0001 C CNN
F 3 "~" H 3200 6700 50  0001 C CNN
	1    3200 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DBF066E
P 3200 7500
AR Path="/5DBF066E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBF066E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBF066E" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 3200 7250 50  0001 C CNN
F 1 "GND" H 3205 7327 50  0000 C CNN
F 2 "" H 3200 7500 50  0001 C CNN
F 3 "" H 3200 7500 50  0001 C CNN
	1    3200 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DBF0668
P 3200 7300
AR Path="/5DBF0668" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DBF0668" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DBF0668" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 3200 7150 50  0001 C CNN
F 1 "+5V" H 3215 7473 50  0000 C CNN
F 2 "" H 3200 7300 50  0001 C CNN
F 3 "" H 3200 7300 50  0001 C CNN
	1    3200 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DBF0662
P 3200 7400
AR Path="/5CC0D65F/5DBF0662" Ref="C?"  Part="1" 
AR Path="/5DBF0662" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DBF0662" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DBF0662" Ref="C25"  Part="1" 
F 0 "C25" H 3109 7446 50  0000 R CNN
F 1 "100nF" H 3109 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3200 7400 50  0001 C CNN
F 3 "~" H 3200 7400 50  0001 C CNN
	1    3200 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB9AD5C
P 10100 2500
AR Path="/5DB9AD5C" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB9AD5C" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB9AD5C" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 10100 2250 50  0001 C CNN
F 1 "GND" H 10105 2327 50  0000 C CNN
F 2 "" H 10100 2500 50  0001 C CNN
F 3 "" H 10100 2500 50  0001 C CNN
	1    10100 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB9AD56
P 10100 2300
AR Path="/5DB9AD56" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB9AD56" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB9AD56" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 10100 2150 50  0001 C CNN
F 1 "+5V" H 10115 2473 50  0000 C CNN
F 2 "" H 10100 2300 50  0001 C CNN
F 3 "" H 10100 2300 50  0001 C CNN
	1    10100 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB9AD50
P 10100 2400
AR Path="/5CC0D65F/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB9AD50" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB9AD50" Ref="C19"  Part="1" 
F 0 "C19" H 10009 2446 50  0000 R CNN
F 1 "100nF" H 10009 2355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10100 2400 50  0001 C CNN
F 3 "~" H 10100 2400 50  0001 C CNN
	1    10100 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DB680A4
P 1850 7500
AR Path="/5DB680A4" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB680A4" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB680A4" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 1850 7250 50  0001 C CNN
F 1 "GND" H 1855 7327 50  0000 C CNN
F 2 "" H 1850 7500 50  0001 C CNN
F 3 "" H 1850 7500 50  0001 C CNN
	1    1850 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DB6809E
P 1850 7300
AR Path="/5DB6809E" Ref="#PWR?"  Part="1" 
AR Path="/5F3EA987/5DB6809E" Ref="#PWR?"  Part="1" 
AR Path="/61F95ACC/5DB6809E" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 1850 7150 50  0001 C CNN
F 1 "+5V" H 1865 7473 50  0000 C CNN
F 2 "" H 1850 7300 50  0001 C CNN
F 3 "" H 1850 7300 50  0001 C CNN
	1    1850 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DB68098
P 1850 7400
AR Path="/5CC0D65F/5DB68098" Ref="C?"  Part="1" 
AR Path="/5DB68098" Ref="C?"  Part="1" 
AR Path="/5F3EA987/5DB68098" Ref="C?"  Part="1" 
AR Path="/61F95ACC/5DB68098" Ref="C24"  Part="1" 
F 0 "C24" H 1759 7446 50  0000 R CNN
F 1 "100nF" H 1759 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1850 7400 50  0001 C CNN
F 3 "~" H 1850 7400 50  0001 C CNN
	1    1850 7400
	1    0    0    -1  
$EndComp
Connection ~ 3200 6600
Connection ~ 3200 6800
$Comp
L alexios:74AHC1G125 U36
U 2 1 5DAF889C
P 3550 6700
F 0 "U36" H 3730 6746 50  0000 L CNN
F 1 "74AHC1G125" H 3730 6655 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3725 6950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3725 6950 50  0001 C CNN
	2    3550 6700
	1    0    0    -1  
$EndComp
Connection ~ 3200 7300
Connection ~ 3200 7500
$Comp
L alexios:74LVC1G74 U40
U 2 1 5DAF7668
P 3550 7400
F 0 "U40" H 3730 7446 50  0000 L CNN
F 1 "74LVC1G74" H 3730 7355 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 4000 7400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 4000 7400 50  0001 C CNN
	2    3550 7400
	1    0    0    -1  
$EndComp
Connection ~ 10100 2300
Connection ~ 10100 2500
$Comp
L alexios:74HC541 U30
U 2 1 5DAEC681
P 10450 2400
F 0 "U30" H 10630 2446 50  0000 L CNN
F 1 "74HC541" H 10630 2355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 10450 2400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10450 2400 50  0001 C CNN
	2    10450 2400
	1    0    0    -1  
$EndComp
Connection ~ 1850 7500
Connection ~ 1850 7300
$Comp
L alexios:74HC139 U39
U 3 1 5DAE9571
P 2200 7400
F 0 "U39" H 2380 7446 50  0000 L CNN
F 1 "74HC139" H 2380 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 2200 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2200 7400 50  0001 C CNN
	3    2200 7400
	1    0    0    -1  
$EndComp
Text Notes 2850 4600 0    50   ~ 0
High after ~RESET~\nasserted.
Text Notes 2850 5050 0    50   ~ 0
High after ~BANKW0~\nasserted.
Text Notes 1200 6150 0    50   ~ 0
After ~RESET~ and before ~BANKW0~ is asserted, drive AEXT₀₋₇ with &00 (~RAM~/ROM position set to ~RAM~)\nor &80 (set to ROM). Use pull-down resistors for most of the vector. After the first write to an MBR register,\nthis stops and random values can be expected to be present! So the minimum required registers should be\ninitialised as early as possible after reset.
$Comp
L power:GND #PWR058
U 1 1 5DA49867
P 6350 5250
F 0 "#PWR058" H 6350 5000 50  0001 C CNN
F 1 "GND" H 6500 5200 50  0000 C CNN
F 2 "" H 6350 5250 50  0001 C CNN
F 3 "" H 6350 5250 50  0001 C CNN
	1    6350 5250
	1    0    0    -1  
$EndComp
Entry Wire Line
	6650 4600 6750 4500
Entry Wire Line
	6550 4600 6650 4500
Entry Wire Line
	6450 4600 6550 4500
Entry Wire Line
	6350 4600 6450 4500
Entry Wire Line
	6250 4600 6350 4500
Entry Wire Line
	6150 4600 6250 4500
Entry Wire Line
	6050 4600 6150 4500
Entry Wire Line
	5950 4600 6050 4500
Wire Wire Line
	6650 4850 6650 4600
Wire Wire Line
	6550 4850 6550 4600
Wire Wire Line
	6450 4850 6450 4600
Wire Wire Line
	6350 4850 6350 4600
Text Label 5950 4600 3    50   ~ 0
AEXT0
Text Label 6650 4600 3    50   ~ 0
AEXT7
Text Label 6550 4600 3    50   ~ 0
AEXT6
Text Label 6450 4600 3    50   ~ 0
AEXT5
Text Label 6350 4600 3    50   ~ 0
AEXT4
Text Label 6250 4600 3    50   ~ 0
AEXT3
Text Label 6150 4600 3    50   ~ 0
AEXT2
Text Label 6050 4600 3    50   ~ 0
AEXT1
Wire Wire Line
	6250 4850 6250 4600
Wire Wire Line
	6150 4850 6150 4600
Wire Wire Line
	6050 4850 6050 4600
Wire Wire Line
	5950 4850 5950 4600
Text Label 1350 4150 3    50   ~ 0
~BANKW0
Wire Wire Line
	1350 5100 1800 5100
Wire Wire Line
	1350 3550 1350 5100
Wire Wire Line
	2850 3550 1350 3550
Wire Wire Line
	2850 3150 3250 3150
Wire Wire Line
	2800 3150 2850 3150
Connection ~ 2850 3150
Wire Wire Line
	2850 3150 2850 3550
Text Label 3650 5650 0    50   ~ 0
AEXT7
Wire Wire Line
	2800 4450 2800 4800
Wire Wire Line
	1750 4450 2800 4450
Wire Wire Line
	1750 4200 1800 4200
Wire Wire Line
	1750 4450 1750 4200
Text Label 1700 4800 2    50   ~ 0
~RESET
Wire Wire Line
	1200 4800 1800 4800
Text HLabel 1200 4800 0    50   Input ~ 0
~RESET
Wire Wire Line
	3350 5100 3350 5450
Wire Wire Line
	2700 5100 3350 5100
$Comp
L alexios:74LVC1G74 U35
U 1 1 5D1C9022
P 2250 4950
F 0 "U35" H 2250 5367 50  0000 C CNN
F 1 "74LVC1G74" H 2250 5276 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 2700 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G74.pdf" H 2700 4950 50  0001 C CNN
	1    2250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4900 1750 4900
Wire Wire Line
	1750 5000 1800 5000
Connection ~ 1750 4900
Wire Wire Line
	1750 4900 1750 5000
$Comp
L power:+5V #PWR056
U 1 1 5D1C2F41
P 1750 4700
F 0 "#PWR056" H 1750 4550 50  0001 C CNN
F 1 "+5V" H 1765 4873 50  0000 C CNN
F 2 "" H 1750 4700 50  0001 C CNN
F 3 "" H 1750 4700 50  0001 C CNN
	1    1750 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR057
U 1 1 5D5C7150
P 5950 5250
F 0 "#PWR057" H 5950 5000 50  0001 C CNN
F 1 "GND" H 6100 5200 50  0000 C CNN
F 2 "" H 5950 5250 50  0001 C CNN
F 3 "" H 5950 5250 50  0001 C CNN
	1    5950 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04 RN2
U 1 1 5D5C7149
P 6550 5050
F 0 "RN2" H 6738 5004 50  0000 L CNN
F 1 "4.7kΩ" H 6738 5095 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 6825 5050 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6550 5050 50  0001 C CNN
	1    6550 5050
	1    0    0    1   
$EndComp
$Comp
L Device:R_Network04 RN1
U 1 1 5D532D59
P 6150 5050
F 0 "RN1" H 5871 5004 50  0000 R CNN
F 1 "4.7kΩ" H 5871 5095 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP5" V 6425 5050 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6150 5050 50  0001 C CNN
	1    6150 5050
	1    0    0    1   
$EndComp
$Comp
L alexios:74AHC1G125 U14
U 1 1 5D51C57C
P 3300 5650
F 0 "U14" H 3400 5900 50  0000 L CNN
F 1 "74AHC1G125" H 3400 5800 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3475 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3475 5900 50  0001 C CNN
	1    3300 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR055
U 1 1 61FE7EBF
P 1800 3900
F 0 "#PWR055" H 1800 3750 50  0001 C CNN
F 1 "+5V" H 1815 4073 50  0000 C CNN
F 2 "" H 1800 3900 50  0001 C CNN
F 3 "" H 1800 3900 50  0001 C CNN
	1    1800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4800 2800 4800
Wire Wire Line
	7200 3400 7550 3400
Text Label 7250 3400 0    50   ~ 0
AEXT7
Entry Wire Line
	7550 3400 7650 3500
Entry Wire Line
	7550 3300 7650 3400
Wire Wire Line
	7200 3300 7550 3300
Text Label 7250 3300 0    50   ~ 0
AEXT6
Entry Wire Line
	7550 3300 7650 3400
Entry Wire Line
	7550 3200 7650 3300
Wire Wire Line
	1200 5650 1350 5650
Text Label 2500 5650 2    50   ~ 0
~FPRAM~∕ROM
Text Label 1700 5100 2    50   ~ 0
~BANKW0
Text HLabel 1200 5650 0    50   Input ~ 0
~FPRAM~∕ROM
Text Label 1350 700  0    50   ~ 0
IBUS[0..7]
Wire Wire Line
	3450 2650 1400 2650
NoConn ~ 2800 4100
NoConn ~ 2800 3900
NoConn ~ 2800 3250
NoConn ~ 2800 3050
Wire Wire Line
	1400 2650 1400 3350
Wire Wire Line
	1400 3350 1800 3350
Text HLabel 1200 700  0    50   3State ~ 0
IBUS[0..7]
Wire Bus Line
	3600 700  1200 700 
Text HLabel 1200 1800 0    50   Input ~ 0
IR[0..11]
Text HLabel 1200 1650 0    50   Input ~ 0
WADDR[0..4]
Text Label 3700 2850 1    50   ~ 0
IBUS[0..7]
Text Label 5750 2850 1    50   ~ 0
IBUS[0..7]
Wire Bus Line
	7750 4500 10200 4500
Wire Wire Line
	7200 3200 7550 3200
Text Label 7250 3200 0    50   ~ 0
AEXT5
Text Label 7250 3100 0    50   ~ 0
AEXT4
Wire Wire Line
	7200 3100 7550 3100
Text Label 7250 1800 0    50   ~ 0
AEXT3
Text Label 7250 1700 0    50   ~ 0
AEXT2
Text Label 7250 1600 0    50   ~ 0
AEXT1
Text Label 7250 1500 0    50   ~ 0
AEXT0
Wire Wire Line
	7200 1800 7550 1800
Wire Wire Line
	7200 1700 7550 1700
Wire Wire Line
	7200 1600 7550 1600
Wire Wire Line
	7200 1500 7550 1500
Text Label 9750 4500 0    50   ~ 0
AEXT[0..7]
Wire Bus Line
	5850 700  9600 700 
Wire Bus Line
	3800 700  5650 700 
Entry Bus Bus
	3800 700  3700 800 
Entry Bus Bus
	3600 700  3700 800 
Entry Bus Bus
	9600 700  9700 800 
Entry Bus Bus
	5850 700  5750 800 
Entry Bus Bus
	5650 700  5750 800 
Entry Wire Line
	9600 1500 9700 1400
Entry Wire Line
	9600 1600 9700 1500
Entry Wire Line
	9600 1700 9700 1600
Entry Wire Line
	9600 1800 9700 1700
Entry Wire Line
	9600 1900 9700 1800
Entry Wire Line
	9600 2000 9700 1900
Entry Wire Line
	9600 2100 9700 2000
Entry Wire Line
	9600 2200 9700 2100
Entry Bus Bus
	7750 4500 7650 4400
Text HLabel 10200 4500 2    50   Output ~ 0
AEXT[0..7]
Wire Wire Line
	9250 2200 9600 2200
Wire Wire Line
	9250 2100 9600 2100
Wire Wire Line
	9250 2000 9600 2000
Wire Wire Line
	9250 1900 9600 1900
Wire Wire Line
	9250 1800 9600 1800
Wire Wire Line
	9250 1700 9600 1700
Wire Wire Line
	9250 1600 9600 1600
Wire Wire Line
	9250 1500 9600 1500
Text Label 7950 2400 0    50   ~ 0
~RMBR
Wire Wire Line
	8250 2400 7950 2400
$Comp
L alexios:74HC541 U30
U 1 1 61FE7F80
P 8750 2000
F 0 "U30" H 8750 2767 50  0000 C CNN
F 1 "74HC541" H 8750 2676 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 8750 2000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8750 2000 50  0001 C CNN
	1    8750 2000
	1    0    0    -1  
$EndComp
Entry Wire Line
	5750 3300 5850 3400
Entry Wire Line
	5750 3200 5850 3300
Entry Wire Line
	5750 3100 5850 3200
Entry Wire Line
	5750 3000 5850 3100
Entry Wire Line
	5750 1700 5850 1800
Entry Wire Line
	5750 1600 5850 1700
Entry Wire Line
	5750 1500 5850 1600
Entry Wire Line
	5750 1400 5850 1500
Entry Wire Line
	3700 3300 3800 3400
Entry Wire Line
	3700 3200 3800 3300
Entry Wire Line
	3700 3100 3800 3200
Entry Wire Line
	3700 3000 3800 3100
Text Label 5850 2400 0    50   ~ 0
SEL0
Wire Wire Line
	6200 2400 5850 2400
Text Label 5850 3800 0    50   ~ 0
~BANKW1
Wire Wire Line
	6200 3800 5850 3800
Text Label 5850 2200 0    50   ~ 0
~BANKW1
Wire Wire Line
	6200 2200 5850 2200
Text Label 3800 3800 0    50   ~ 0
~BANKW0
Wire Wire Line
	4150 3800 3800 3800
Text Label 1550 3350 0    50   ~ 0
~WMBR
Entry Wire Line
	7750 2200 7650 2300
Entry Wire Line
	7750 2100 7650 2200
Entry Wire Line
	7750 2000 7650 2100
Entry Wire Line
	7750 1900 7650 2000
Text Label 8150 2200 2    50   ~ 0
AEXT7
Text Label 8150 2100 2    50   ~ 0
AEXT6
Text Label 8150 2000 2    50   ~ 0
AEXT5
Text Label 8150 1900 2    50   ~ 0
AEXT4
Wire Wire Line
	8250 2200 7750 2200
Wire Wire Line
	8250 2100 7750 2100
Wire Wire Line
	8250 2000 7750 2000
Wire Wire Line
	8250 1900 7750 1900
Entry Wire Line
	7750 1800 7650 1900
Entry Wire Line
	7750 1700 7650 1800
Entry Wire Line
	7750 1600 7650 1700
Entry Wire Line
	7750 1500 7650 1600
Text Label 8150 1800 2    50   ~ 0
AEXT3
Text Label 8150 1700 2    50   ~ 0
AEXT2
Text Label 8150 1600 2    50   ~ 0
AEXT1
Text Label 8150 1500 2    50   ~ 0
AEXT0
Wire Wire Line
	8250 1800 7750 1800
Wire Wire Line
	8250 1700 7750 1700
Wire Wire Line
	8250 1600 7750 1600
Wire Wire Line
	8250 1500 7750 1500
Text Label 5850 3400 0    50   ~ 0
IBUS7
Text Label 5850 3300 0    50   ~ 0
IBUS6
Text Label 5850 3200 0    50   ~ 0
IBUS5
Text Label 5850 3100 0    50   ~ 0
IBUS4
Wire Wire Line
	5850 3400 6200 3400
Wire Wire Line
	5850 3300 6200 3300
Wire Wire Line
	5850 3200 6200 3200
Wire Wire Line
	5850 3100 6200 3100
Text Label 5850 1800 0    50   ~ 0
IBUS3
Text Label 5850 1700 0    50   ~ 0
IBUS2
Text Label 5850 1600 0    50   ~ 0
IBUS1
Text Label 5850 1500 0    50   ~ 0
IBUS0
Wire Wire Line
	5850 1800 6200 1800
Wire Wire Line
	5850 1700 6200 1700
Wire Wire Line
	5850 1600 6200 1600
Wire Wire Line
	5850 1500 6200 1500
Text Label 3800 3400 0    50   ~ 0
IBUS7
Text Label 3800 3300 0    50   ~ 0
IBUS6
Text Label 3800 3200 0    50   ~ 0
IBUS5
Text Label 3800 3100 0    50   ~ 0
IBUS4
Wire Wire Line
	3800 3400 4150 3400
Wire Wire Line
	3800 3300 4150 3300
Wire Wire Line
	3800 3200 4150 3200
Wire Wire Line
	3800 3100 4150 3100
Text Label 1550 4000 0    50   ~ 0
SEL2
Wire Wire Line
	1800 4000 1550 4000
Text Label 1550 3150 0    50   ~ 0
IR2
Wire Wire Line
	1800 3150 1550 3150
Text Label 5850 4100 0    50   ~ 0
SEL1
Text Label 5850 4000 0    50   ~ 0
SEL0
Wire Wire Line
	6200 4100 5850 4100
Wire Wire Line
	6200 4000 5850 4000
Text Label 5850 2500 0    50   ~ 0
SEL1
Wire Wire Line
	6200 2500 5850 2500
Text Label 3800 4100 0    50   ~ 0
SEL1
Text Label 3800 4000 0    50   ~ 0
SEL0
Wire Wire Line
	4150 4100 3800 4100
Wire Wire Line
	4150 4000 3800 4000
Wire Wire Line
	6200 4200 5850 4200
Text Label 5850 4200 0    50   ~ 0
~BANKR1
Wire Wire Line
	6200 2600 5850 2600
Text Label 5850 2600 0    50   ~ 0
~BANKR1
Wire Wire Line
	4150 4200 3800 4200
Text Label 3800 4200 0    50   ~ 0
~BANKR0
$Comp
L alexios:74HC139 U31
U 1 1 61FE7ED6
P 2300 3150
F 0 "U31" H 2300 3517 50  0000 C CNN
F 1 "74HC139" H 2300 3426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2300 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2300 3150 50  0001 C CNN
	1    2300 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR052
U 1 1 61FE7ED0
P 1800 3050
F 0 "#PWR052" H 1800 2900 50  0001 C CNN
F 1 "+5V" H 1815 3223 50  0000 C CNN
F 2 "" H 1800 3050 50  0001 C CNN
F 3 "" H 1800 3050 50  0001 C CNN
	1    1800 3050
	1    0    0    -1  
$EndComp
Text Label 3250 3150 2    50   ~ 0
~BANKW0
Text Label 3250 3350 2    50   ~ 0
~BANKW1
$Comp
L alexios:74HC139 U31
U 2 1 61FE7EC7
P 2300 4000
F 0 "U31" H 2300 4367 50  0000 C CNN
F 1 "74HC139" H 2300 4276 50  0000 C CNN
F 2 "alexios:SOIC-16" H 2300 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 2300 4000 50  0001 C CNN
	2    2300 4000
	1    0    0    -1  
$EndComp
Text Label 3250 4000 2    50   ~ 0
~BANKR0
Text Label 3250 4200 2    50   ~ 0
~BANKR1
Wire Wire Line
	2800 4200 3250 4200
Wire Wire Line
	2800 4000 3250 4000
Wire Wire Line
	2800 3350 3250 3350
Text Label 7650 2850 1    50   ~ 0
AEXT[0..7]
Text Label 5600 2850 1    50   ~ 0
AEXT[0..7]
Entry Wire Line
	7550 3100 7650 3200
Entry Bus Bus
	7550 4500 7650 4400
Entry Bus Bus
	5600 4400 5700 4500
Entry Wire Line
	7550 1800 7650 1900
Entry Wire Line
	7550 1700 7650 1800
Entry Wire Line
	7550 1600 7650 1700
Entry Wire Line
	7550 1500 7650 1600
Text HLabel 1200 1500 0    50   Input ~ 0
RADDR[0..4]
Text Label 9450 1500 2    50   ~ 0
IBUS0
Text Label 9450 1600 2    50   ~ 0
IBUS1
Text Label 9450 1700 2    50   ~ 0
IBUS2
Text Label 9450 1800 2    50   ~ 0
IBUS3
Text Label 9450 1900 2    50   ~ 0
IBUS4
Text Label 9450 2000 2    50   ~ 0
IBUS5
Text Label 9450 2100 2    50   ~ 0
IBUS6
Text Label 9450 2200 2    50   ~ 0
IBUS7
Text Label 3800 2000 0    50   ~ 0
IR0
Text Label 3800 2100 0    50   ~ 0
IR1
Wire Wire Line
	6200 2000 5850 2000
Wire Wire Line
	6200 2100 5850 2100
Text Label 5850 2000 0    50   ~ 0
IR0
Text Label 5850 2100 0    50   ~ 0
IR1
Wire Wire Line
	4150 3600 3800 3600
Wire Wire Line
	4150 3700 3800 3700
Text Label 3800 3600 0    50   ~ 0
IR0
Text Label 3800 3700 0    50   ~ 0
IR1
Wire Wire Line
	6200 3600 5850 3600
Wire Wire Line
	6200 3700 5850 3700
Text Label 5850 3600 0    50   ~ 0
IR0
Text Label 5850 3700 0    50   ~ 0
IR1
$Comp
L power:GND #PWR050
U 1 1 60B7235A
P 8250 2500
F 0 "#PWR050" H 8250 2250 50  0001 C CNN
F 1 "GND" H 8255 2327 50  0000 C CNN
F 2 "" H 8250 2500 50  0001 C CNN
F 3 "" H 8250 2500 50  0001 C CNN
	1    8250 2500
	1    0    0    -1  
$EndComp
$Sheet
S 1600 1350 1150 650 
U 63C9F04D
F0 "Decoder" 50
F1 "reg_mbr_decoder.sch" 50
F2 "~RMBR" O R 2750 1800 50 
F3 "~WMBR" O R 2750 1650 50 
F4 "RADDR[0..4]" I L 1600 1500 50 
F5 "WADDR[0..4]" I L 1600 1650 50 
F6 "SEL[0..2]" O R 2750 1500 50 
F7 "IR[0..11]" I L 1600 1800 50 
$EndSheet
Wire Bus Line
	1200 1500 1600 1500
Wire Bus Line
	1200 1650 1600 1650
Wire Bus Line
	1600 1800 1200 1800
Wire Bus Line
	2750 1500 3150 1500
Text Label 3150 1500 2    50   ~ 0
SEL[0..2]
Wire Wire Line
	2750 1800 3150 1800
Text Label 3150 1650 2    50   ~ 0
~WMBR
Text Label 3150 1800 2    50   ~ 0
~RMBR
Text Notes 1200 1150 0    100  ~ 20
Register Address Decoding
Wire Wire Line
	3450 1650 3450 2650
Wire Wire Line
	2750 1650 3450 1650
Text Notes 7850 6100 0    50   ~ 0
MBn registers are accessed when:\n\n1. Write access when WADDR=00001 is selected (~WRITE-MBP+FLAGS~).\n2. Write access when WADDR=00011 is selected (~WRITE-MBn~).\n3. Read access when RADDR=00001 is selected (~READ-MBP+FLAGS~).\n4. Read access when RADDR=00011 is selected (~READ-MBn~).\n5. Read access when WADDR=001xx (~WRITE-AR:MBn~). Note, even though\nwe respond on WADDR, this is a READ operation.\n\nThe register to use is usually identified by IR₀₋₂, except in cases 1 and 3\n(which always use MB0 aka MBP), and case 5 where one of the first four\nregisters is selected by WADDR₀₋₁ unless WADDR=00111 (~WRITE-AR:MBZ~)\nand IR₁₁₋₈=1111 (I=1, R=1, Operand 3XX₁₆).
Wire Wire Line
	5150 3400 5150 5650
$Comp
L Device:R_Small R?
U 1 1 5D8BACBF
P 1350 5450
AR Path="/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D54E677/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D62E1DC/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5DEAC282/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5F67D4B5/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/5D46B22D/5D8BACBF" Ref="R?"  Part="1" 
AR Path="/61F95ACC/5D8BACBF" Ref="R3"  Part="1" 
F 0 "R3" H 1409 5496 50  0000 L CNN
F 1 "4.7kΩ" H 1409 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1350 5450 50  0001 C CNN
F 3 "~" H 1350 5450 50  0001 C CNN
	1    1350 5450
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR059
U 1 1 5D8E1171
P 1350 5350
F 0 "#PWR059" H 1350 5200 50  0001 C CNN
F 1 "+5V" H 1200 5450 50  0000 C CNN
F 2 "" H 1350 5350 50  0001 C CNN
F 3 "" H 1350 5350 50  0001 C CNN
	1    1350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5550 1350 5650
Connection ~ 1350 5650
Wire Wire Line
	1350 5650 3100 5650
Text Notes 8250 3150 0    50   ~ 0
IBUS[8..15] are purposefully not driven here!\nThey are handled by the flag unit.
Text Notes 8250 2950 0    50   ~ 10
Note
Wire Bus Line
	3700 800  3700 3300
Wire Bus Line
	5600 1600 5600 4400
Wire Bus Line
	9700 800  9700 2100
Wire Bus Line
	5750 800  5750 3300
Wire Bus Line
	5700 4500 7550 4500
Wire Bus Line
	7650 1600 7650 4400
$Sheet
S 11900 1400 600  1300
U 5E647D2E
F0 "4×8 bit file" 50
F1 "regfile4x8.sch" 50
F2 "OUT[0..7]" T R 12500 1500 50 
F3 "IN[0..7]" T L 11900 1500 50 
$EndSheet
$EndSCHEMATC
