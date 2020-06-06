EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 12
Title "Microcode Front Panel Buffers"
Date ""
Rev "2020"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3300 3300 0    50   Input ~ 0
RADDR0
Text HLabel 3300 3400 0    50   Input ~ 0
RADDR1
Text HLabel 3300 3500 0    50   Input ~ 0
RADDR2
Text HLabel 3300 3600 0    50   Input ~ 0
RADDR3
Text HLabel 3300 3700 0    50   Input ~ 0
RADDR4
Text HLabel 3300 3800 0    50   Input ~ 0
WADDR0
Text HLabel 3300 3900 0    50   Input ~ 0
WADDR1
Text HLabel 3300 4000 0    50   Input ~ 0
WADDR2
Text HLabel 6100 1800 0    50   Input ~ 0
WADDR3
Text HLabel 6100 1900 0    50   Input ~ 0
WADDR4
Text HLabel 6100 2000 0    50   Input ~ 0
COND0
Text HLabel 6100 2100 0    50   Input ~ 0
COND1
Text HLabel 6100 2200 0    50   Input ~ 0
COND2
Text HLabel 6100 2300 0    50   Input ~ 0
COND3
Text HLabel 6100 2400 0    50   Input ~ 0
COND4
Text HLabel 6100 2500 0    50   Input ~ 0
ACTION0
Text HLabel 6100 3300 0    50   Input ~ 0
ACTION1
Text HLabel 6100 3400 0    50   Input ~ 0
ACTION2
Text HLabel 6100 3500 0    50   Input ~ 0
ACTION3
Text HLabel 6100 3600 0    50   Input ~ 0
~MEM
Text HLabel 6100 3700 0    50   Input ~ 0
~IO
Text HLabel 6100 3800 0    50   Input ~ 0
~R
Text HLabel 6100 3900 0    50   Input ~ 0
~WEN
Text HLabel 6100 4000 0    50   Input ~ 0
~END
Text Label 3400 1800 0    50   ~ 0
UPC0
Text Label 3400 1900 0    50   ~ 0
UPC1
Text Label 3400 2000 0    50   ~ 0
UPC2
Text Label 3400 2100 0    50   ~ 0
UPC3
Text Label 3400 2200 0    50   ~ 0
IDX0
Text Label 3400 2300 0    50   ~ 0
IDX1
Text Label 3400 2500 0    50   ~ 0
IN-RSVD
Text Label 3400 2400 0    50   ~ 0
~COND
Wire Wire Line
	3850 1800 3300 1800
Wire Wire Line
	3850 1900 3300 1900
Wire Wire Line
	3850 2000 3300 2000
Wire Wire Line
	3850 2100 3300 2100
Wire Wire Line
	3850 2200 3300 2200
Wire Wire Line
	3850 2300 3300 2300
Wire Wire Line
	3850 2400 3300 2400
Wire Wire Line
	3850 2500 3300 2500
Text HLabel 3300 2700 0    50   Input ~ 0
~FPµA0
Text HLabel 3300 4200 0    50   Input ~ 0
~FPµC0
Text HLabel 6100 2700 0    50   Input ~ 0
~FPµC1
Text HLabel 6100 4200 0    50   Input ~ 0
~FPµC2
Text Label 3400 2700 0    50   ~ 0
~FPµA0
$Comp
L alexios:74HC541 U16
U 1 1 5E0A9015
P 4350 2300
F 0 "U16" H 4350 3067 50  0000 C CNN
F 1 "74HC541" H 4350 2976 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4350 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4350 2300 50  0001 C CNN
	1    4350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2700 3850 2700
$Comp
L power:GND #PWR0121
U 1 1 5E0C6AD6
P 3850 2800
F 0 "#PWR0121" H 3850 2550 50  0001 C CNN
F 1 "GND" H 3855 2627 50  0000 C CNN
F 2 "" H 3850 2800 50  0001 C CNN
F 3 "" H 3850 2800 50  0001 C CNN
	1    3850 2800
	1    0    0    -1  
$EndComp
Text Label 5150 3300 2    50   ~ 0
FPD0
Text Label 5150 3400 2    50   ~ 0
FPD1
Text Label 5150 3500 2    50   ~ 0
FPD2
Text Label 5150 3600 2    50   ~ 0
FPD3
Text Label 5150 3700 2    50   ~ 0
FPD4
Text Label 5150 3800 2    50   ~ 0
FPD5
Text Label 5150 3900 2    50   ~ 0
FPD6
Text Label 5150 4000 2    50   ~ 0
FPD7
Wire Wire Line
	4850 3300 5150 3300
Wire Wire Line
	4850 3400 5150 3400
Wire Wire Line
	4850 3500 5150 3500
Wire Wire Line
	4850 3600 5150 3600
Wire Wire Line
	4850 3700 5150 3700
Wire Wire Line
	4850 3800 5150 3800
Wire Wire Line
	4850 3900 5150 3900
Wire Wire Line
	4850 4000 5150 4000
$Comp
L alexios:74HC541 U17
U 1 1 5DDD8FBA
P 4350 3800
F 0 "U17" H 4350 4567 50  0000 C CNN
F 1 "74HC541" H 4350 4476 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 4350 3800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4350 3800 50  0001 C CNN
	1    4350 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5DDD8FC1
P 3850 4300
F 0 "#PWR0122" H 3850 4050 50  0001 C CNN
F 1 "GND" H 3855 4127 50  0000 C CNN
F 2 "" H 3850 4300 50  0001 C CNN
F 3 "" H 3850 4300 50  0001 C CNN
	1    3850 4300
	1    0    0    -1  
$EndComp
Text Label 3400 3300 0    50   ~ 0
RADDR0
Text Label 3400 3400 0    50   ~ 0
RADDR1
Text Label 3400 3500 0    50   ~ 0
RADDR2
Text Label 3400 3600 0    50   ~ 0
RADDR3
Text Label 3400 3700 0    50   ~ 0
RADDR4
Text Label 3400 3800 0    50   ~ 0
WADDR0
Text Label 3400 3900 0    50   ~ 0
WADDR1
Text Label 3400 4000 0    50   ~ 0
WADDR2
Wire Wire Line
	3850 3300 3300 3300
Wire Wire Line
	3850 3400 3300 3400
Wire Wire Line
	3850 3500 3300 3500
Wire Wire Line
	3850 3600 3300 3600
Wire Wire Line
	3850 3700 3300 3700
Wire Wire Line
	3850 3800 3300 3800
Wire Wire Line
	3850 3900 3300 3900
Wire Wire Line
	3850 4000 3300 4000
Text Label 3400 4200 0    50   ~ 0
~FPµĊ0
Wire Wire Line
	3300 4200 3850 4200
Text Label 7950 1800 2    50   ~ 0
FPD0
Text Label 7950 1900 2    50   ~ 0
FPD1
Text Label 7950 2000 2    50   ~ 0
FPD2
Text Label 7950 2100 2    50   ~ 0
FPD3
Text Label 7950 2200 2    50   ~ 0
FPD4
Text Label 7950 2300 2    50   ~ 0
FPD5
Text Label 7950 2400 2    50   ~ 0
FPD6
Text Label 7950 2500 2    50   ~ 0
FPD7
Wire Wire Line
	7650 1800 7950 1800
Wire Wire Line
	7650 1900 7950 1900
Wire Wire Line
	7650 2000 7950 2000
Wire Wire Line
	7650 2100 7950 2100
Wire Wire Line
	7650 2200 7950 2200
Wire Wire Line
	7650 2300 7950 2300
Wire Wire Line
	7650 2400 7950 2400
Wire Wire Line
	7650 2500 7950 2500
$Comp
L power:GND #PWR0125
U 1 1 5DEA3445
P 6650 2800
F 0 "#PWR0125" H 6650 2550 50  0001 C CNN
F 1 "GND" H 6655 2627 50  0000 C CNN
F 2 "" H 6650 2800 50  0001 C CNN
F 3 "" H 6650 2800 50  0001 C CNN
	1    6650 2800
	1    0    0    -1  
$EndComp
Text Label 6200 1800 0    50   ~ 0
WADDR3
Text Label 6200 1900 0    50   ~ 0
WADDR4
Text Label 6200 2000 0    50   ~ 0
COND0
Text Label 6200 2100 0    50   ~ 0
COND1
Text Label 6200 2200 0    50   ~ 0
COND2
Text Label 6200 2300 0    50   ~ 0
COND3
Text Label 6200 2400 0    50   ~ 0
COND4
Text Label 6200 2500 0    50   ~ 0
ACTION0
Wire Wire Line
	6650 1800 6100 1800
Wire Wire Line
	6650 1900 6100 1900
Wire Wire Line
	6650 2000 6100 2000
Wire Wire Line
	6650 2100 6100 2100
Wire Wire Line
	6650 2200 6100 2200
Wire Wire Line
	6650 2300 6100 2300
Wire Wire Line
	6650 2400 6100 2400
Wire Wire Line
	6650 2500 6100 2500
Text Label 6200 2700 0    50   ~ 0
~FPµĊ1
Wire Wire Line
	6100 2700 6650 2700
Text Label 7950 3300 2    50   ~ 0
FPD0
Text Label 7950 3400 2    50   ~ 0
FPD1
Text Label 7950 3500 2    50   ~ 0
FPD2
Text Label 7950 3600 2    50   ~ 0
FPD3
Text Label 7950 3700 2    50   ~ 0
FPD4
Text Label 7950 3800 2    50   ~ 0
FPD5
Text Label 7950 3900 2    50   ~ 0
FPD6
Text Label 7950 4000 2    50   ~ 0
FPD7
Wire Wire Line
	7650 3300 7950 3300
Wire Wire Line
	7650 3400 7950 3400
Wire Wire Line
	7650 3500 7950 3500
Wire Wire Line
	7650 3600 7950 3600
Wire Wire Line
	7650 3700 7950 3700
Wire Wire Line
	7650 3800 7950 3800
Wire Wire Line
	7650 3900 7950 3900
Wire Wire Line
	7650 4000 7950 4000
$Comp
L alexios:74HC541 U21
U 1 1 5DF1B315
P 7150 3800
F 0 "U21" H 7150 4567 50  0000 C CNN
F 1 "74HC541" H 7150 4476 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7150 3800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7150 3800 50  0001 C CNN
	1    7150 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5DF1B31B
P 6650 4300
F 0 "#PWR0126" H 6650 4050 50  0001 C CNN
F 1 "GND" H 6655 4127 50  0000 C CNN
F 2 "" H 6650 4300 50  0001 C CNN
F 3 "" H 6650 4300 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
Text Label 6200 3600 0    50   ~ 0
~MEM
Text Label 6200 3700 0    50   ~ 0
~IO
Text Label 6200 3800 0    50   ~ 0
~R
Text Label 6200 3900 0    50   ~ 0
~WEN
Text Label 6200 4000 0    50   ~ 0
~END
Text Label 6200 3300 0    50   ~ 0
ACTION1
Text Label 6200 3400 0    50   ~ 0
ACTION2
Text Label 6200 3500 0    50   ~ 0
ACTION3
Wire Wire Line
	6650 3300 6100 3300
Wire Wire Line
	6650 3400 6100 3400
Wire Wire Line
	6650 3500 6100 3500
Wire Wire Line
	6650 3600 6100 3600
Wire Wire Line
	6650 3700 6100 3700
Wire Wire Line
	6650 3800 6100 3800
Wire Wire Line
	6650 3900 6100 3900
Wire Wire Line
	6650 4000 6100 4000
Text Label 6200 4200 0    50   ~ 0
~FPµĊ2
Wire Wire Line
	6100 4200 6650 4200
Text Label 5150 1800 2    50   ~ 0
FPD0
Text Label 5150 1900 2    50   ~ 0
FPD1
Text Label 5150 2000 2    50   ~ 0
FPD2
Text Label 5150 2100 2    50   ~ 0
FPD3
Text Label 5150 2200 2    50   ~ 0
FPD4
Text Label 5150 2300 2    50   ~ 0
FPD5
Text Label 5150 2400 2    50   ~ 0
FPD6
Text Label 5150 2500 2    50   ~ 0
FPD7
Wire Wire Line
	4850 1800 5150 1800
Wire Wire Line
	4850 1900 5150 1900
Wire Wire Line
	4850 2000 5150 2000
Wire Wire Line
	4850 2100 5150 2100
Wire Wire Line
	4850 2200 5150 2200
Wire Wire Line
	4850 2300 5150 2300
Wire Wire Line
	4850 2400 5150 2400
Wire Wire Line
	4850 2500 5150 2500
Entry Wire Line
	5150 1800 5250 1900
Entry Wire Line
	5150 1900 5250 2000
Entry Wire Line
	5150 2000 5250 2100
Entry Wire Line
	5150 2100 5250 2200
Entry Wire Line
	5150 2200 5250 2300
Entry Wire Line
	5150 2300 5250 2400
Entry Wire Line
	5150 2400 5250 2500
Entry Wire Line
	5150 2500 5250 2600
$Comp
L alexios:74HC541 U16
U 2 1 5E19A961
P 4400 5400
F 0 "U16" H 4580 5446 50  0000 L CNN
F 1 "74HC541" H 4580 5355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4400 5400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4400 5400 50  0001 C CNN
	2    4400 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E19A967
P 4050 5400
AR Path="/5CC0D65F/5E19A967" Ref="C?"  Part="1" 
AR Path="/5E19A967" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E19A967" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E19A967" Ref="C39"  Part="1" 
F 0 "C39" H 3959 5446 50  0000 R CNN
F 1 "100nF" H 3959 5355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 5400 50  0001 C CNN
F 3 "~" H 4050 5400 50  0001 C CNN
	1    4050 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E19A96D
P 4050 5500
AR Path="/5DEAC282/5E19A96D" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E19A96D" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 4050 5250 50  0001 C CNN
F 1 "GND" H 4055 5327 50  0000 C CNN
F 2 "" H 4050 5500 50  0001 C CNN
F 3 "" H 4050 5500 50  0001 C CNN
	1    4050 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E19A973
P 4050 5300
AR Path="/5DEAC282/5E19A973" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E19A973" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 4050 5150 50  0001 C CNN
F 1 "+5V" H 4065 5473 50  0000 C CNN
F 2 "" H 4050 5300 50  0001 C CNN
F 3 "" H 4050 5300 50  0001 C CNN
	1    4050 5300
	1    0    0    -1  
$EndComp
Connection ~ 4050 5300
Connection ~ 4050 5500
Entry Wire Line
	5150 4000 5250 4100
Entry Wire Line
	5150 3900 5250 4000
Entry Wire Line
	5150 3800 5250 3900
Entry Wire Line
	5150 3700 5250 3800
Entry Wire Line
	5150 3600 5250 3700
Entry Wire Line
	5150 3500 5250 3600
Entry Wire Line
	5150 3400 5250 3500
Entry Wire Line
	5150 3300 5250 3400
Entry Wire Line
	7950 2500 8050 2600
Entry Wire Line
	7950 2400 8050 2500
Entry Wire Line
	7950 2300 8050 2400
Entry Wire Line
	7950 2200 8050 2300
Entry Wire Line
	7950 2100 8050 2200
Entry Wire Line
	7950 2000 8050 2100
Entry Wire Line
	7950 1900 8050 2000
Entry Wire Line
	7950 1800 8050 1900
Entry Wire Line
	7950 4000 8050 4100
Entry Wire Line
	7950 3900 8050 4000
Entry Wire Line
	7950 3800 8050 3900
Entry Wire Line
	7950 3700 8050 3800
Entry Wire Line
	7950 3600 8050 3700
Entry Wire Line
	7950 3500 8050 3600
Entry Wire Line
	7950 3400 8050 3500
Entry Wire Line
	7950 3300 8050 3400
Wire Bus Line
	8150 4700 8700 4700
Text HLabel 8700 4700 2    50   Input ~ 0
FPD[0..7]
Text Label 8600 4700 2    50   ~ 0
FPD[0..7]
Entry Bus Bus
	8050 4600 8150 4700
Entry Bus Bus
	5250 4600 5350 4700
Wire Bus Line
	5350 4700 7950 4700
Text Label 6450 4700 2    50   ~ 0
FPD[0..7]
Entry Bus Bus
	7950 4700 8050 4600
$Comp
L alexios:74HC541 U31
U 2 1 5E3397F2
P 5700 5400
F 0 "U31" H 5880 5446 50  0000 L CNN
F 1 "74HC541" H 5880 5355 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5700 5400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5700 5400 50  0001 C CNN
	2    5700 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3397F8
P 5350 5400
AR Path="/5CC0D65F/5E3397F8" Ref="C?"  Part="1" 
AR Path="/5E3397F8" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E3397F8" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E3397F8" Ref="C43"  Part="1" 
F 0 "C43" H 5259 5446 50  0000 R CNN
F 1 "100nF" H 5259 5355 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 5400 50  0001 C CNN
F 3 "~" H 5350 5400 50  0001 C CNN
	1    5350 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3397FE
P 5350 5500
AR Path="/5DEAC282/5E3397FE" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E3397FE" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 5350 5250 50  0001 C CNN
F 1 "GND" H 5355 5327 50  0000 C CNN
F 2 "" H 5350 5500 50  0001 C CNN
F 3 "" H 5350 5500 50  0001 C CNN
	1    5350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E339804
P 5350 5300
AR Path="/5DEAC282/5E339804" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E339804" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 5350 5150 50  0001 C CNN
F 1 "+5V" H 5365 5473 50  0000 C CNN
F 2 "" H 5350 5300 50  0001 C CNN
F 3 "" H 5350 5300 50  0001 C CNN
	1    5350 5300
	1    0    0    -1  
$EndComp
Connection ~ 5350 5300
Connection ~ 5350 5500
$Comp
L alexios:74HC541 U17
U 2 1 5E33980C
P 4400 6100
F 0 "U17" H 4580 6146 50  0000 L CNN
F 1 "74HC541" H 4580 6055 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4400 6100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4400 6100 50  0001 C CNN
	2    4400 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E339812
P 4050 6100
AR Path="/5CC0D65F/5E339812" Ref="C?"  Part="1" 
AR Path="/5E339812" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E339812" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E339812" Ref="C40"  Part="1" 
F 0 "C40" H 3959 6146 50  0000 R CNN
F 1 "100nF" H 3959 6055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 6100 50  0001 C CNN
F 3 "~" H 4050 6100 50  0001 C CNN
	1    4050 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E339818
P 4050 6200
AR Path="/5DEAC282/5E339818" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E339818" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 4050 5950 50  0001 C CNN
F 1 "GND" H 4055 6027 50  0000 C CNN
F 2 "" H 4050 6200 50  0001 C CNN
F 3 "" H 4050 6200 50  0001 C CNN
	1    4050 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E33981E
P 4050 6000
AR Path="/5DEAC282/5E33981E" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E33981E" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 4050 5850 50  0001 C CNN
F 1 "+5V" H 4065 6173 50  0000 C CNN
F 2 "" H 4050 6000 50  0001 C CNN
F 3 "" H 4050 6000 50  0001 C CNN
	1    4050 6000
	1    0    0    -1  
$EndComp
Connection ~ 4050 6000
Connection ~ 4050 6200
$Comp
L alexios:74HC541 U21
U 2 1 5E346E7D
P 5700 6100
F 0 "U21" H 5880 6146 50  0000 L CNN
F 1 "74HC541" H 5880 6055 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 5700 6100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 5700 6100 50  0001 C CNN
	2    5700 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E346E83
P 5350 6100
AR Path="/5CC0D65F/5E346E83" Ref="C?"  Part="1" 
AR Path="/5E346E83" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E346E83" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E346E83" Ref="C41"  Part="1" 
F 0 "C41" H 5259 6146 50  0000 R CNN
F 1 "100nF" H 5259 6055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 6100 50  0001 C CNN
F 3 "~" H 5350 6100 50  0001 C CNN
	1    5350 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E346E89
P 5350 6200
AR Path="/5DEAC282/5E346E89" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E346E89" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 5350 5950 50  0001 C CNN
F 1 "GND" H 5355 6027 50  0000 C CNN
F 2 "" H 5350 6200 50  0001 C CNN
F 3 "" H 5350 6200 50  0001 C CNN
	1    5350 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E346E8F
P 5350 6000
AR Path="/5DEAC282/5E346E8F" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5D82AC00/5E346E8F" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 5350 5850 50  0001 C CNN
F 1 "+5V" H 5365 6173 50  0000 C CNN
F 2 "" H 5350 6000 50  0001 C CNN
F 3 "" H 5350 6000 50  0001 C CNN
	1    5350 6000
	1    0    0    -1  
$EndComp
Connection ~ 5350 6000
Connection ~ 5350 6200
Text HLabel 3300 2500 0    50   Input ~ 0
IN-RSVD
Text HLabel 3300 2400 0    50   Input ~ 0
~COND
Text HLabel 3300 2300 0    50   Input ~ 0
IDX1
Text HLabel 3300 2200 0    50   Input ~ 0
IDX0
Text HLabel 3300 2100 0    50   Input ~ 0
UPC3
Text HLabel 3300 2000 0    50   Input ~ 0
UPC2
Text HLabel 3300 1900 0    50   Input ~ 0
UPC1
Text HLabel 3300 1800 0    50   Input ~ 0
UPC0
$Comp
L alexios:74HC541 U31
U 1 1 5E3E4299
P 7150 2300
F 0 "U31" H 7150 3067 50  0000 C CNN
F 1 "74HC541" H 7150 2976 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7150 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7150 2300 50  0001 C CNN
	1    7150 2300
	1    0    0    -1  
$EndComp
Wire Bus Line
	8050 1900 8050 4600
Wire Bus Line
	5250 1900 5250 4600
$EndSCHEMATC
