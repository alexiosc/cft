EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 18
Title ""
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label -700 3450 2    50   ~ 0
~WOR1
Text Label -700 5400 2    50   ~ 0
~RDSR0
Wire Wire Line
	-950 5400 -700 5400
Wire Wire Line
	-950 3450 -700 3450
Wire Wire Line
	-950 3950 -450 3950
Wire Wire Line
	-950 4050 -450 4050
Wire Wire Line
	-950 4150 -450 4150
Text Label -700 3950 2    50   ~ 0
~WCV0
Text Label -700 4050 2    50   ~ 0
~WCV1
Text Label -700 4150 2    50   ~ 0
~WCV2
Text Label -700 5950 2    50   ~ 0
~RDSR1
Wire Wire Line
	-950 5950 -700 5950
Wire Wire Line
	-950 6450 -450 6450
Wire Wire Line
	-950 6550 -450 6550
Wire Wire Line
	-950 6650 -450 6650
Text Label -700 6450 2    50   ~ 0
~RCV0
Text Label -700 6550 2    50   ~ 0
~RCV1
Text Label -700 6650 2    50   ~ 0
~RCV2
Wire Wire Line
	-950 6050 -700 6050
Text Label -700 6050 2    50   ~ 0
~RDSR2
Text Notes -500 6050 0    50   ~ 0
Optional
Text Notes 1500 1250 0    100  ~ 20
DFP Address Decoders
Text HLabel -450 3950 2    50   Output ~ 0
~WCV0
Text HLabel -450 4050 2    50   Output ~ 0
~WCV1
Text HLabel -450 4150 2    50   Output ~ 0
~WCV2
Text HLabel -450 6450 2    50   Output ~ 0
~RCV0
Text HLabel -450 6550 2    50   Output ~ 0
~RCV1
Text HLabel -450 6650 2    50   Output ~ 0
~RCV2
Entry Bus Bus
	1250 1550 1350 1650
Wire Bus Line
	1250 1550 1150 1550
Text Label 1350 2800 3    50   ~ 0
FPD[0..7]
Text HLabel 1150 1550 0    50   Input ~ 0
FPA[0..7]
Wire Wire Line
	4050 4300 4550 4300
Text HLabel 4050 4300 0    50   Input ~ 0
~FPORH
Text HLabel 4050 2850 0    50   Input ~ 0
~FPORL
Wire Wire Line
	4550 2750 4350 2750
Text Label 4350 4000 0    50   ~ 0
FPD7
Text Label 4350 3900 0    50   ~ 0
FPD6
Text Label 4350 3800 0    50   ~ 0
FPD5
Text Label 4350 3700 0    50   ~ 0
FPD4
Text Label 4350 3600 0    50   ~ 0
FPD3
Text Label 4350 3500 0    50   ~ 0
FPD2
Text Label 4350 3400 0    50   ~ 0
FPD1
Text Label 4350 3300 0    50   ~ 0
FPD0
$Comp
L power:GND #PWR?
U 1 1 65780688
P 4700 5200
AR Path="/5D78E680/65780688" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/65780688" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/65780688" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/65780688" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65780688" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/65780688" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65780688" Ref="#PWR073"  Part="1" 
F 0 "#PWR073" H 4700 4950 50  0001 C CNN
F 1 "GND" H 4705 5027 50  0000 C CNN
F 2 "" H 4700 5200 50  0001 C CNN
F 3 "" H 4700 5200 50  0001 C CNN
	1    4700 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 65780681
P 4700 5000
AR Path="/5D78E680/65780681" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/65780681" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/65780681" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/65780681" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65780681" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/65780681" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65780681" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 4700 4850 50  0001 C CNN
F 1 "+5V" H 4715 5173 50  0000 C CNN
F 2 "" H 4700 5000 50  0001 C CNN
F 3 "" H 4700 5000 50  0001 C CNN
	1    4700 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6578067A
P 4700 5100
AR Path="/5D78E680/6578067A" Ref="C?"  Part="1" 
AR Path="/5D363063/6578067A" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/6578067A" Ref="C?"  Part="1" 
AR Path="/5E4A8360/6578067A" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6578067A" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/6578067A" Ref="C?"  Part="1" 
AR Path="/64FC7999/6578067A" Ref="C305"  Part="1" 
F 0 "C305" H 4609 5146 50  0000 R CNN
F 1 "100nF" H 4609 5055 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 5100 50  0001 C CNN
F 3 "~" H 4700 5100 50  0001 C CNN
	1    4700 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6578066E
P 4700 5900
AR Path="/5D78E680/6578066E" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/6578066E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/6578066E" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/6578066E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6578066E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6578066E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6578066E" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 4700 5650 50  0001 C CNN
F 1 "GND" H 4705 5727 50  0000 C CNN
F 2 "" H 4700 5900 50  0001 C CNN
F 3 "" H 4700 5900 50  0001 C CNN
	1    4700 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 65780667
P 4700 5700
AR Path="/5D78E680/65780667" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/65780667" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/65780667" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/65780667" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65780667" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/65780667" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65780667" Ref="#PWR074"  Part="1" 
F 0 "#PWR074" H 4700 5550 50  0001 C CNN
F 1 "+5V" H 4715 5873 50  0000 C CNN
F 2 "" H 4700 5700 50  0001 C CNN
F 3 "" H 4700 5700 50  0001 C CNN
	1    4700 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 65780660
P 4700 5800
AR Path="/5D78E680/65780660" Ref="C?"  Part="1" 
AR Path="/5D363063/65780660" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/65780660" Ref="C?"  Part="1" 
AR Path="/5E4A8360/65780660" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65780660" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/65780660" Ref="C?"  Part="1" 
AR Path="/64FC7999/65780660" Ref="C306"  Part="1" 
F 0 "C306" H 4609 5846 50  0000 R CNN
F 1 "100nF" H 4609 5755 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 5800 50  0001 C CNN
F 3 "~" H 4700 5800 50  0001 C CNN
	1    4700 5800
	1    0    0    -1  
$EndComp
Text Label 4350 2550 0    50   ~ 0
FPD7
Text Label 4350 2450 0    50   ~ 0
FPD6
Text Label 4350 2350 0    50   ~ 0
FPD5
Text Label 4350 2250 0    50   ~ 0
FPD4
Text Label 4350 2150 0    50   ~ 0
FPD3
Text Label 4350 2050 0    50   ~ 0
FPD2
Text Label 4350 1950 0    50   ~ 0
FPD1
Text Label 4350 1850 0    50   ~ 0
FPD0
Text Label 4350 4200 0    50   ~ 0
~WOR1
Wire Wire Line
	4550 4200 4350 4200
Text Label 4350 2750 0    50   ~ 0
~WOR0
Wire Wire Line
	4050 2850 4550 2850
$Comp
L alexios:74HC574 U?
U 1 1 6607EE46
P 5050 2350
AR Path="/6607EE46" Ref="U?"  Part="1" 
AR Path="/5D78E680/6607EE46" Ref="U?"  Part="2" 
AR Path="/5D363063/6607EE46" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/6607EE46" Ref="U?"  Part="2" 
AR Path="/5E4A8360/6607EE46" Ref="U?"  Part="2" 
AR Path="/64FC7999/6548E0CC/6607EE46" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/6607EE46" Ref="U?"  Part="2" 
AR Path="/64FC7999/6607EE46" Ref="U305"  Part="1" 
F 0 "U305" H 5050 3117 50  0000 C CNN
F 1 "74HC541" H 5050 3026 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4750 2300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4750 2300 50  0001 C CNN
	1    5050 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 66080820
P 5050 3800
AR Path="/66080820" Ref="U?"  Part="1" 
AR Path="/5D78E680/66080820" Ref="U?"  Part="2" 
AR Path="/5D363063/66080820" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/66080820" Ref="U?"  Part="2" 
AR Path="/5E4A8360/66080820" Ref="U?"  Part="2" 
AR Path="/64FC7999/6548E0CC/66080820" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/66080820" Ref="U?"  Part="2" 
AR Path="/64FC7999/66080820" Ref="U306"  Part="1" 
F 0 "U306" H 5050 4567 50  0000 C CNN
F 1 "74HC541" H 5050 4476 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4750 3750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4750 3750 50  0001 C CNN
	1    5050 3800
	1    0    0    -1  
$EndComp
Entry Bus Bus
	4150 4400 4250 4500
Entry Wire Line
	4250 1850 4150 1950
Wire Wire Line
	4250 1850 4550 1850
Entry Wire Line
	4250 1950 4150 2050
Wire Wire Line
	4250 1950 4550 1950
Entry Wire Line
	4250 2050 4150 2150
Entry Wire Line
	4250 2150 4150 2250
Wire Wire Line
	4250 2150 4550 2150
Wire Wire Line
	4250 2050 4550 2050
Entry Wire Line
	4250 2250 4150 2350
Entry Wire Line
	4250 2350 4150 2450
Entry Wire Line
	4250 2450 4150 2550
Entry Wire Line
	4250 2550 4150 2650
Wire Wire Line
	4250 2550 4550 2550
Wire Wire Line
	4250 2450 4550 2450
Wire Wire Line
	4250 2350 4550 2350
Wire Wire Line
	4250 2250 4550 2250
Entry Wire Line
	4250 3300 4150 3400
Entry Wire Line
	4250 3400 4150 3500
Entry Wire Line
	4250 3500 4150 3600
Entry Wire Line
	4250 3600 4150 3700
Entry Wire Line
	4250 3700 4150 3800
Entry Wire Line
	4250 3800 4150 3900
Entry Wire Line
	4250 3900 4150 4000
Entry Wire Line
	4250 4000 4150 4100
Wire Wire Line
	4250 4000 4550 4000
Wire Wire Line
	4250 3900 4550 3900
Wire Wire Line
	4250 3800 4550 3800
Wire Wire Line
	4250 3700 4550 3700
Wire Wire Line
	4250 3600 4550 3600
Wire Wire Line
	4250 3500 4550 3500
Wire Wire Line
	4250 3400 4550 3400
Wire Wire Line
	4250 3300 4550 3300
Wire Bus Line
	5850 4500 4250 4500
Entry Bus Bus
	5950 4400 5850 4500
$Comp
L alexios:74HC541 U?
U 1 1 6607C601
P 8450 5250
AR Path="/64FC7999/6548E0CC/6607C601" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/6607C601" Ref="U?"  Part="2" 
AR Path="/64FC7999/6607C601" Ref="U309"  Part="1" 
F 0 "U309" H 8450 6017 50  0000 C CNN
F 1 "74HC541" H 8450 5926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8450 5250 50  0001 C CNN
	1    8450 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 6607BC5E
P 8450 3800
AR Path="/64FC7999/6548E0CC/6607BC5E" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/6607BC5E" Ref="U?"  Part="2" 
AR Path="/64FC7999/6607BC5E" Ref="U308"  Part="1" 
F 0 "U308" H 8450 4567 50  0000 C CNN
F 1 "74HC541" H 8450 4476 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 3800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8450 3800 50  0001 C CNN
	1    8450 3800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 1 1 66079B6F
P 8450 2350
AR Path="/64FC7999/6548E0CC/66079B6F" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/66079B6F" Ref="U?"  Part="2" 
AR Path="/64FC7999/66079B6F" Ref="U307"  Part="1" 
F 0 "U307" H 8450 3117 50  0000 C CNN
F 1 "74HC541" H 8450 3026 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8450 2350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8450 2350 50  0001 C CNN
	1    8450 2350
	1    0    0    -1  
$EndComp
Connection ~ 9850 5250
Connection ~ 9850 5050
Text Notes 7150 1250 0    100  ~ 20
DIP Switch Register Plus (DSR)
Text Notes 4250 1250 0    100  ~ 20
Output Register (OR)
Entry Bus Bus
	9250 1450 9350 1550
Wire Bus Line
	6050 1450 9250 1450
Entry Bus Bus
	5950 1550 6050 1450
Wire Wire Line
	5550 3300 5850 3300
Wire Wire Line
	5550 3400 5850 3400
Wire Wire Line
	5550 3500 5850 3500
Wire Wire Line
	5550 3600 5850 3600
Wire Wire Line
	5550 3700 5850 3700
Wire Wire Line
	5550 3800 5850 3800
Wire Wire Line
	5550 3900 5850 3900
Wire Wire Line
	5550 4000 5850 4000
Entry Wire Line
	5850 1850 5950 1750
Entry Wire Line
	5850 1950 5950 1850
Entry Wire Line
	5850 2050 5950 1950
Entry Wire Line
	5850 2150 5950 2050
Entry Wire Line
	5850 2250 5950 2150
Entry Wire Line
	5850 2350 5950 2250
Entry Wire Line
	5850 2450 5950 2350
Entry Wire Line
	5850 2550 5950 2450
Wire Wire Line
	5550 2550 5850 2550
Wire Wire Line
	5550 2450 5850 2450
Wire Wire Line
	5550 2350 5850 2350
Wire Wire Line
	5550 2250 5850 2250
Wire Wire Line
	5550 2150 5850 2150
Wire Wire Line
	5550 2050 5850 2050
Wire Wire Line
	5550 1950 5850 1950
Wire Wire Line
	5550 1850 5850 1850
Entry Wire Line
	5850 3300 5950 3200
Entry Wire Line
	5850 3400 5950 3300
Entry Wire Line
	5850 3500 5950 3400
Entry Wire Line
	5850 3600 5950 3500
Entry Wire Line
	5850 3700 5950 3600
Entry Wire Line
	5850 3800 5950 3700
Entry Wire Line
	5850 3900 5950 3800
Entry Wire Line
	5850 4000 5950 3900
Text HLabel 9650 5800 2    50   3State ~ 0
FPD[0..7]
Wire Bus Line
	9450 5800 9650 5800
Entry Bus Bus
	9350 5700 9450 5800
Entry Wire Line
	9250 5450 9350 5550
Entry Wire Line
	9250 5350 9350 5450
Entry Wire Line
	9250 5250 9350 5350
Entry Wire Line
	9250 5150 9350 5250
Entry Wire Line
	9250 5050 9350 5150
Entry Wire Line
	9250 4950 9350 5050
Entry Wire Line
	9250 4850 9350 4950
Entry Wire Line
	9250 4750 9350 4850
Entry Wire Line
	9250 4000 9350 4100
Entry Wire Line
	9250 3900 9350 4000
Entry Wire Line
	9250 3800 9350 3900
Entry Wire Line
	9250 3700 9350 3800
Entry Wire Line
	9250 3600 9350 3700
Entry Wire Line
	9250 3500 9350 3600
Entry Wire Line
	9250 3400 9350 3500
Entry Wire Line
	9250 3300 9350 3400
Entry Wire Line
	9250 2550 9350 2650
Entry Wire Line
	9250 2450 9350 2550
Entry Wire Line
	9250 2350 9350 2450
Entry Wire Line
	9250 2250 9350 2350
Entry Wire Line
	9250 2150 9350 2250
Entry Wire Line
	9250 2050 9350 2150
Entry Wire Line
	9250 1950 9350 2050
Entry Wire Line
	9250 1850 9350 1950
Wire Wire Line
	8950 4750 9250 4750
Wire Wire Line
	8950 4850 9250 4850
Wire Wire Line
	8950 4950 9250 4950
Wire Wire Line
	8950 5050 9250 5050
Wire Wire Line
	8950 5150 9250 5150
Wire Wire Line
	8950 5250 9250 5250
Wire Wire Line
	8950 5350 9250 5350
Wire Wire Line
	8950 5450 9250 5450
Wire Wire Line
	8950 3300 9250 3300
Wire Wire Line
	8950 3400 9250 3400
Wire Wire Line
	8950 3500 9250 3500
Wire Wire Line
	8950 3600 9250 3600
Wire Wire Line
	8950 3700 9250 3700
Wire Wire Line
	8950 3800 9250 3800
Wire Wire Line
	8950 3900 9250 3900
Wire Wire Line
	8950 4000 9250 4000
Wire Wire Line
	8950 2550 9250 2550
Wire Wire Line
	8950 2450 9250 2450
Wire Wire Line
	8950 2350 9250 2350
Wire Wire Line
	8950 2250 9250 2250
Wire Wire Line
	8950 2150 9250 2150
Wire Wire Line
	8950 2050 9250 2050
Wire Wire Line
	8950 1950 9250 1950
Wire Wire Line
	8950 1850 9250 1850
Wire Wire Line
	6200 2550 6250 2550
Wire Wire Line
	6250 1850 6200 1850
Wire Wire Line
	6250 1950 6200 1950
Wire Wire Line
	6250 2050 6200 2050
Wire Wire Line
	6250 2150 6200 2150
Wire Wire Line
	6250 2250 6200 2250
Wire Wire Line
	6250 2350 6200 2350
Wire Wire Line
	6250 2450 6200 2450
Text Label 7750 2750 0    50   ~ 0
~RDSR0
Wire Wire Line
	7950 2750 7750 2750
$Comp
L power:GND #PWR?
U 1 1 654B3A7F
P 7950 2850
AR Path="/64FC7999/6548E0CC/654B3A7F" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/654B3A7F" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/654B3A7F" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 7950 2600 50  0001 C CNN
F 1 "GND" H 7955 2677 50  0000 C CNN
F 2 "" H 7950 2850 50  0001 C CNN
F 3 "" H 7950 2850 50  0001 C CNN
	1    7950 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 654B3A85
P 6950 3000
AR Path="/64FC7999/6548E0CC/654B3A85" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/654B3A85" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/654B3A85" Ref="#PWR079"  Part="1" 
F 0 "#PWR079" H 6950 2750 50  0001 C CNN
F 1 "GND" H 6955 2827 50  0000 C CNN
F 2 "" H 6950 3000 50  0001 C CNN
F 3 "" H 6950 3000 50  0001 C CNN
	1    6950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2550 7950 2550
Wire Wire Line
	7650 2600 7650 2550
Wire Wire Line
	7550 2450 7950 2450
Wire Wire Line
	7550 2600 7550 2450
Wire Wire Line
	7450 2350 7950 2350
Wire Wire Line
	7450 2600 7450 2350
Wire Wire Line
	7350 2250 7950 2250
Wire Wire Line
	7350 2600 7350 2250
Wire Wire Line
	7250 2150 7950 2150
Wire Wire Line
	7250 2600 7250 2150
Wire Wire Line
	7150 2050 7950 2050
Wire Wire Line
	7150 2600 7150 2050
Wire Wire Line
	7050 1950 7950 1950
Wire Wire Line
	6850 1950 7050 1950
Connection ~ 7050 1950
Wire Wire Line
	7050 2600 7050 1950
Wire Wire Line
	6950 1850 7950 1850
Wire Wire Line
	6950 2600 6950 1850
Connection ~ 7650 2550
Wire Wire Line
	6850 2550 7650 2550
Connection ~ 7550 2450
Wire Wire Line
	6850 2450 7550 2450
Connection ~ 7450 2350
Wire Wire Line
	6850 2350 7450 2350
Connection ~ 7350 2250
Wire Wire Line
	6850 2250 7350 2250
Connection ~ 7250 2150
Wire Wire Line
	6850 2150 7250 2150
Connection ~ 7150 2050
Wire Wire Line
	6850 2050 7150 2050
Connection ~ 6950 1850
Wire Wire Line
	6850 1850 6950 1850
Wire Wire Line
	6200 2450 6200 2550
Connection ~ 6200 2450
Wire Wire Line
	6200 2350 6200 2450
Connection ~ 6200 2350
Wire Wire Line
	6200 2250 6200 2350
Connection ~ 6200 2250
Wire Wire Line
	6200 2150 6200 2250
Wire Wire Line
	6200 2050 6200 2150
Connection ~ 6200 2150
Connection ~ 6200 2050
Wire Wire Line
	6200 1950 6200 2050
Connection ~ 6200 1950
Wire Wire Line
	6200 1850 6200 1950
Connection ~ 6200 1850
$Comp
L power:+5V #PWR?
U 1 1 654B3AB9
P 6200 1850
AR Path="/64FC7999/6548E0CC/654B3AB9" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/654B3AB9" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/654B3AB9" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 6200 1700 50  0001 C CNN
F 1 "+5V" H 6150 2000 50  0000 C CNN
F 2 "" H 6200 1850 50  0001 C CNN
F 3 "" H 6200 1850 50  0001 C CNN
	1    6200 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW?
U 1 1 654B3AE7
P 6550 2250
AR Path="/5E4A8360/654B3AE7" Ref="SW?"  Part="1" 
AR Path="/60757845/6079630E/654B3AE7" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6548E0CC/654B3AE7" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6549E394/654B3AE7" Ref="SW?"  Part="1" 
AR Path="/64FC7999/654B3AE7" Ref="SW2"  Part="1" 
F 0 "SW2" H 6550 1683 50  0000 C CNN
F 1 "SW_DIP_x08" H 6550 1774 50  0000 C CNN
F 2 "alexios:SW_DIP_SPSTx08_Piano_10.8x21.88mm_W7.62mm_P2.54mm" H 6550 2250 50  0001 C CNN
F 3 "" H 6550 2250 50  0001 C CNN
	1    6550 2250
	1    0    0    -1  
$EndComp
Text Label 5750 1850 2    50   ~ 0
FPD0
Text Label 5750 1950 2    50   ~ 0
FPD1
Text Label 5750 2050 2    50   ~ 0
FPD2
Text Label 5750 2150 2    50   ~ 0
FPD3
Text Label 5750 2250 2    50   ~ 0
FPD4
Text Label 5750 2350 2    50   ~ 0
FPD5
Text Label 5750 2450 2    50   ~ 0
FPD6
Text Label 5750 2550 2    50   ~ 0
FPD7
Text Label 5750 3300 2    50   ~ 0
FPD0
Text Label 5750 3400 2    50   ~ 0
FPD1
Text Label 5750 3500 2    50   ~ 0
FPD2
Text Label 5750 3600 2    50   ~ 0
FPD3
Text Label 5750 3700 2    50   ~ 0
FPD4
Text Label 5750 3800 2    50   ~ 0
FPD5
Text Label 5750 3900 2    50   ~ 0
FPD6
Text Label 5750 4000 2    50   ~ 0
FPD7
Text Label 9200 1850 2    50   ~ 0
FPD0
Text Label 9200 1950 2    50   ~ 0
FPD1
Text Label 9200 2050 2    50   ~ 0
FPD2
Text Label 9200 2150 2    50   ~ 0
FPD3
Text Label 9200 2250 2    50   ~ 0
FPD4
Text Label 9200 2350 2    50   ~ 0
FPD5
Text Label 9200 2450 2    50   ~ 0
FPD6
Text Label 9200 2550 2    50   ~ 0
FPD7
Wire Wire Line
	6200 4000 6250 4000
Wire Wire Line
	6250 3300 6200 3300
Wire Wire Line
	6250 3400 6200 3400
Wire Wire Line
	6250 3500 6200 3500
Wire Wire Line
	6250 3600 6200 3600
Wire Wire Line
	6250 3700 6200 3700
Wire Wire Line
	6250 3800 6200 3800
Wire Wire Line
	6250 3900 6200 3900
Text Label 7750 4200 0    50   ~ 0
~RDSR1
Wire Wire Line
	7950 4200 7750 4200
$Comp
L power:GND #PWR?
U 1 1 6573669A
P 7950 4300
AR Path="/64FC7999/6548E0CC/6573669A" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6573669A" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6573669A" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 7950 4050 50  0001 C CNN
F 1 "GND" H 7955 4127 50  0000 C CNN
F 2 "" H 7950 4300 50  0001 C CNN
F 3 "" H 7950 4300 50  0001 C CNN
	1    7950 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 657366A0
P 6950 4450
AR Path="/64FC7999/6548E0CC/657366A0" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/657366A0" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/657366A0" Ref="#PWR080"  Part="1" 
F 0 "#PWR080" H 6950 4200 50  0001 C CNN
F 1 "GND" H 6955 4277 50  0000 C CNN
F 2 "" H 6950 4450 50  0001 C CNN
F 3 "" H 6950 4450 50  0001 C CNN
	1    6950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4000 7950 4000
Wire Wire Line
	7650 4050 7650 4000
Wire Wire Line
	7550 3900 7950 3900
Wire Wire Line
	7550 4050 7550 3900
Wire Wire Line
	7450 3800 7950 3800
Wire Wire Line
	7450 4050 7450 3800
Wire Wire Line
	7350 3700 7950 3700
Wire Wire Line
	7350 4050 7350 3700
Wire Wire Line
	7250 3600 7950 3600
Wire Wire Line
	7250 4050 7250 3600
Wire Wire Line
	7150 3500 7950 3500
Wire Wire Line
	7150 4050 7150 3500
Wire Wire Line
	7050 3400 7950 3400
Wire Wire Line
	6850 3400 7050 3400
Connection ~ 7050 3400
Wire Wire Line
	7050 4050 7050 3400
Wire Wire Line
	6950 3300 7950 3300
Wire Wire Line
	6950 4050 6950 3300
Connection ~ 7650 4000
Wire Wire Line
	6850 4000 7650 4000
Connection ~ 7550 3900
Wire Wire Line
	6850 3900 7550 3900
Connection ~ 7450 3800
Wire Wire Line
	6850 3800 7450 3800
Connection ~ 7350 3700
Wire Wire Line
	6850 3700 7350 3700
Connection ~ 7250 3600
Wire Wire Line
	6850 3600 7250 3600
Connection ~ 7150 3500
Wire Wire Line
	6850 3500 7150 3500
Connection ~ 6950 3300
Wire Wire Line
	6850 3300 6950 3300
Wire Wire Line
	6200 3900 6200 4000
Connection ~ 6200 3900
Wire Wire Line
	6200 3800 6200 3900
Connection ~ 6200 3800
Wire Wire Line
	6200 3700 6200 3800
Connection ~ 6200 3700
Wire Wire Line
	6200 3600 6200 3700
Wire Wire Line
	6200 3500 6200 3600
Connection ~ 6200 3600
Connection ~ 6200 3500
Wire Wire Line
	6200 3400 6200 3500
Connection ~ 6200 3400
Wire Wire Line
	6200 3300 6200 3400
Connection ~ 6200 3300
$Comp
L power:+5V #PWR?
U 1 1 657366D4
P 6200 3300
AR Path="/64FC7999/6548E0CC/657366D4" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/657366D4" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/657366D4" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 6200 3150 50  0001 C CNN
F 1 "+5V" H 6150 3450 50  0000 C CNN
F 2 "" H 6200 3300 50  0001 C CNN
F 3 "" H 6200 3300 50  0001 C CNN
	1    6200 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 657366DA
P 7350 4250
AR Path="/5E4A8360/657366DA" Ref="RN?"  Part="1" 
AR Path="/60757845/6079630E/657366DA" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6548E0CC/657366DA" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6549E394/657366DA" Ref="RN?"  Part="1" 
AR Path="/64FC7999/657366DA" Ref="RN16"  Part="1" 
F 0 "RN16" H 7700 4450 50  0000 R CNN
F 1 "4.7kΩ" H 7700 4550 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 7825 4250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7350 4250 50  0001 C CNN
	1    7350 4250
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_DIP_x08 SW?
U 1 1 657366E6
P 6550 3700
AR Path="/5E4A8360/657366E6" Ref="SW?"  Part="1" 
AR Path="/60757845/6079630E/657366E6" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6548E0CC/657366E6" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6549E394/657366E6" Ref="SW?"  Part="1" 
AR Path="/64FC7999/657366E6" Ref="SW3"  Part="1" 
F 0 "SW3" H 6550 3133 50  0000 C CNN
F 1 "SW_DIP_x08" H 6550 3224 50  0000 C CNN
F 2 "alexios:SW_DIP_SPSTx08_Piano_10.8x21.88mm_W7.62mm_P2.54mm" H 6550 3700 50  0001 C CNN
F 3 "" H 6550 3700 50  0001 C CNN
	1    6550 3700
	1    0    0    -1  
$EndComp
Text Label 9200 3300 2    50   ~ 0
FPD0
Text Label 9200 3400 2    50   ~ 0
FPD1
Text Label 9200 3500 2    50   ~ 0
FPD2
Text Label 9200 3600 2    50   ~ 0
FPD3
Text Label 9200 3700 2    50   ~ 0
FPD4
Text Label 9200 3800 2    50   ~ 0
FPD5
Text Label 9200 3900 2    50   ~ 0
FPD6
Text Label 9200 4000 2    50   ~ 0
FPD7
Wire Wire Line
	6200 5450 6250 5450
Wire Wire Line
	6250 4750 6200 4750
Wire Wire Line
	6250 4850 6200 4850
Wire Wire Line
	6250 4950 6200 4950
Wire Wire Line
	6250 5050 6200 5050
Wire Wire Line
	6250 5150 6200 5150
Wire Wire Line
	6250 5250 6200 5250
Wire Wire Line
	6250 5350 6200 5350
Text Label 7750 5650 0    50   ~ 0
~RDSR2
Wire Wire Line
	7950 5650 7750 5650
$Comp
L power:GND #PWR?
U 1 1 6574FC7D
P 7950 5750
AR Path="/64FC7999/6548E0CC/6574FC7D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6574FC7D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6574FC7D" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 7950 5500 50  0001 C CNN
F 1 "GND" H 7955 5577 50  0000 C CNN
F 2 "" H 7950 5750 50  0001 C CNN
F 3 "" H 7950 5750 50  0001 C CNN
	1    7950 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6574FC83
P 6950 5900
AR Path="/64FC7999/6548E0CC/6574FC83" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6574FC83" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6574FC83" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 6950 5650 50  0001 C CNN
F 1 "GND" H 6955 5727 50  0000 C CNN
F 2 "" H 6950 5900 50  0001 C CNN
F 3 "" H 6950 5900 50  0001 C CNN
	1    6950 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 5450 7950 5450
Wire Wire Line
	7650 5500 7650 5450
Wire Wire Line
	7550 5350 7950 5350
Wire Wire Line
	7550 5500 7550 5350
Wire Wire Line
	7450 5250 7950 5250
Wire Wire Line
	7450 5500 7450 5250
Wire Wire Line
	7350 5150 7950 5150
Wire Wire Line
	7350 5500 7350 5150
Wire Wire Line
	7250 5050 7950 5050
Wire Wire Line
	7250 5500 7250 5050
Wire Wire Line
	7150 4950 7950 4950
Wire Wire Line
	7150 5500 7150 4950
Wire Wire Line
	7050 4850 7950 4850
Wire Wire Line
	6850 4850 7050 4850
Connection ~ 7050 4850
Wire Wire Line
	7050 5500 7050 4850
Wire Wire Line
	6950 4750 7950 4750
Wire Wire Line
	6950 5500 6950 4750
Connection ~ 7650 5450
Wire Wire Line
	6850 5450 7650 5450
Connection ~ 7550 5350
Wire Wire Line
	6850 5350 7550 5350
Connection ~ 7450 5250
Wire Wire Line
	6850 5250 7450 5250
Connection ~ 7350 5150
Wire Wire Line
	6850 5150 7350 5150
Connection ~ 7250 5050
Wire Wire Line
	6850 5050 7250 5050
Connection ~ 7150 4950
Wire Wire Line
	6850 4950 7150 4950
Connection ~ 6950 4750
Wire Wire Line
	6850 4750 6950 4750
Wire Wire Line
	6200 5350 6200 5450
Connection ~ 6200 5350
Wire Wire Line
	6200 5250 6200 5350
Connection ~ 6200 5250
Wire Wire Line
	6200 5150 6200 5250
Connection ~ 6200 5150
Wire Wire Line
	6200 5050 6200 5150
Wire Wire Line
	6200 4950 6200 5050
Connection ~ 6200 5050
Connection ~ 6200 4950
Wire Wire Line
	6200 4850 6200 4950
Connection ~ 6200 4850
Wire Wire Line
	6200 4750 6200 4850
Connection ~ 6200 4750
$Comp
L power:+5V #PWR?
U 1 1 6574FCB7
P 6200 4750
AR Path="/64FC7999/6548E0CC/6574FCB7" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6574FCB7" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6574FCB7" Ref="#PWR078"  Part="1" 
F 0 "#PWR078" H 6200 4600 50  0001 C CNN
F 1 "+5V" H 6150 4900 50  0000 C CNN
F 2 "" H 6200 4750 50  0001 C CNN
F 3 "" H 6200 4750 50  0001 C CNN
	1    6200 4750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW?
U 1 1 6574FCC9
P 6550 5150
AR Path="/5E4A8360/6574FCC9" Ref="SW?"  Part="1" 
AR Path="/60757845/6079630E/6574FCC9" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6574FCC9" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6549E394/6574FCC9" Ref="SW?"  Part="1" 
AR Path="/64FC7999/6574FCC9" Ref="SW4"  Part="1" 
F 0 "SW4" H 6550 4583 50  0000 C CNN
F 1 "SW_DIP_x08" H 6550 4674 50  0000 C CNN
F 2 "alexios:SW_DIP_SPSTx08_Piano_10.8x21.88mm_W7.62mm_P2.54mm" H 6550 5150 50  0001 C CNN
F 3 "" H 6550 5150 50  0001 C CNN
	1    6550 5150
	1    0    0    -1  
$EndComp
Text Label 9200 4750 2    50   ~ 0
FPD0
Text Label 9200 4850 2    50   ~ 0
FPD1
Text Label 9200 4950 2    50   ~ 0
FPD2
Text Label 9200 5050 2    50   ~ 0
FPD3
Text Label 9200 5150 2    50   ~ 0
FPD4
Text Label 9200 5250 2    50   ~ 0
FPD5
Text Label 9200 5350 2    50   ~ 0
FPD6
Text Label 9200 5450 2    50   ~ 0
FPD7
$Comp
L alexios:74HC541 U?
U 2 1 65780640
P 10200 2250
AR Path="/64FC7999/6548E0CC/65780640" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/65780640" Ref="U?"  Part="2" 
AR Path="/64FC7999/65780640" Ref="U307"  Part="2" 
F 0 "U307" H 10379 2296 50  0000 L CNN
F 1 "74HC541" H 10379 2205 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10200 2250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10200 2250 50  0001 C CNN
	2    10200 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 65780646
P 9850 2250
AR Path="/5D78E680/65780646" Ref="C?"  Part="1" 
AR Path="/5D363063/65780646" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/65780646" Ref="C?"  Part="1" 
AR Path="/5E4A8360/65780646" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65780646" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/65780646" Ref="C?"  Part="1" 
AR Path="/64FC7999/65780646" Ref="C307"  Part="1" 
F 0 "C307" H 9759 2296 50  0000 R CNN
F 1 "100nF" H 9759 2205 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9850 2250 50  0001 C CNN
F 3 "~" H 9850 2250 50  0001 C CNN
	1    9850 2250
	1    0    0    -1  
$EndComp
Connection ~ 9850 2150
$Comp
L power:+5V #PWR?
U 1 1 6578064D
P 9850 2150
AR Path="/5D78E680/6578064D" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/6578064D" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/6578064D" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/6578064D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6578064D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6578064D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6578064D" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 9850 2000 50  0001 C CNN
F 1 "+5V" H 9865 2323 50  0000 C CNN
F 2 "" H 9850 2150 50  0001 C CNN
F 3 "" H 9850 2150 50  0001 C CNN
	1    9850 2150
	1    0    0    -1  
$EndComp
Connection ~ 9850 2350
$Comp
L power:GND #PWR?
U 1 1 65780654
P 9850 2350
AR Path="/5D78E680/65780654" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/65780654" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/65780654" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/65780654" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65780654" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/65780654" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65780654" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 9850 2100 50  0001 C CNN
F 1 "GND" H 9855 2177 50  0000 C CNN
F 2 "" H 9850 2350 50  0001 C CNN
F 3 "" H 9850 2350 50  0001 C CNN
	1    9850 2350
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 6579DDE7
P 10200 3700
AR Path="/64FC7999/6548E0CC/6579DDE7" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/6579DDE7" Ref="U?"  Part="2" 
AR Path="/64FC7999/6579DDE7" Ref="U308"  Part="2" 
F 0 "U308" H 10379 3746 50  0000 L CNN
F 1 "74HC541" H 10379 3655 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10200 3700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10200 3700 50  0001 C CNN
	2    10200 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6579DDED
P 9850 3700
AR Path="/5D78E680/6579DDED" Ref="C?"  Part="1" 
AR Path="/5D363063/6579DDED" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/6579DDED" Ref="C?"  Part="1" 
AR Path="/5E4A8360/6579DDED" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6579DDED" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/6579DDED" Ref="C?"  Part="1" 
AR Path="/64FC7999/6579DDED" Ref="C308"  Part="1" 
F 0 "C308" H 9759 3746 50  0000 R CNN
F 1 "100nF" H 9759 3655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9850 3700 50  0001 C CNN
F 3 "~" H 9850 3700 50  0001 C CNN
	1    9850 3700
	1    0    0    -1  
$EndComp
Connection ~ 9850 3600
$Comp
L power:+5V #PWR?
U 1 1 6579DDF4
P 9850 3600
AR Path="/5D78E680/6579DDF4" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/6579DDF4" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/6579DDF4" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/6579DDF4" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6579DDF4" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6579DDF4" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6579DDF4" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 9850 3450 50  0001 C CNN
F 1 "+5V" H 9865 3773 50  0000 C CNN
F 2 "" H 9850 3600 50  0001 C CNN
F 3 "" H 9850 3600 50  0001 C CNN
	1    9850 3600
	1    0    0    -1  
$EndComp
Connection ~ 9850 3800
$Comp
L power:GND #PWR?
U 1 1 6579DDFB
P 9850 3800
AR Path="/5D78E680/6579DDFB" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/6579DDFB" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/6579DDFB" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/6579DDFB" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6579DDFB" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/6579DDFB" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6579DDFB" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 9850 3550 50  0001 C CNN
F 1 "GND" H 9855 3627 50  0000 C CNN
F 2 "" H 9850 3800 50  0001 C CNN
F 3 "" H 9850 3800 50  0001 C CNN
	1    9850 3800
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U?
U 2 1 657F6B81
P 10200 5150
AR Path="/64FC7999/6548E0CC/657F6B81" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/657F6B81" Ref="U?"  Part="2" 
AR Path="/64FC7999/657F6B81" Ref="U309"  Part="2" 
F 0 "U309" H 10379 5196 50  0000 L CNN
F 1 "74HC541" H 10379 5105 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 10200 5150 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10200 5150 50  0001 C CNN
	2    10200 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 657F6B87
P 9850 5150
AR Path="/5D78E680/657F6B87" Ref="C?"  Part="1" 
AR Path="/5D363063/657F6B87" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/657F6B87" Ref="C?"  Part="1" 
AR Path="/5E4A8360/657F6B87" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/657F6B87" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/657F6B87" Ref="C?"  Part="1" 
AR Path="/64FC7999/657F6B87" Ref="C309"  Part="1" 
F 0 "C309" H 9759 5196 50  0000 R CNN
F 1 "100nF" H 9759 5105 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9850 5150 50  0001 C CNN
F 3 "~" H 9850 5150 50  0001 C CNN
	1    9850 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 657F6B8E
P 9850 5050
AR Path="/5D78E680/657F6B8E" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/657F6B8E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/657F6B8E" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/657F6B8E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/657F6B8E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/657F6B8E" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/657F6B8E" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 9850 4900 50  0001 C CNN
F 1 "+5V" H 9865 5223 50  0000 C CNN
F 2 "" H 9850 5050 50  0001 C CNN
F 3 "" H 9850 5050 50  0001 C CNN
	1    9850 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 657F6B95
P 9850 5250
AR Path="/5D78E680/657F6B95" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/657F6B95" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/657F6B95" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/657F6B95" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/657F6B95" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/657F6B95" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/657F6B95" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 9850 5000 50  0001 C CNN
F 1 "GND" H 9855 5077 50  0000 C CNN
F 2 "" H 9850 5250 50  0001 C CNN
F 3 "" H 9850 5250 50  0001 C CNN
	1    9850 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 6B515ACE
P 5050 5100
AR Path="/6B515ACE" Ref="U?"  Part="1" 
AR Path="/5D78E680/6B515ACE" Ref="U?"  Part="2" 
AR Path="/5D363063/6B515ACE" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/6B515ACE" Ref="U?"  Part="2" 
AR Path="/5E4A8360/6B515ACE" Ref="U?"  Part="2" 
AR Path="/64FC7999/6548E0CC/6B515ACE" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/6B515ACE" Ref="U?"  Part="2" 
AR Path="/64FC7999/6B515ACE" Ref="U305"  Part="2" 
F 0 "U305" H 5230 5146 50  0000 L CNN
F 1 "74HC541" H 5230 5055 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4750 5050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4750 5050 50  0001 C CNN
	2    5050 5100
	1    0    0    -1  
$EndComp
Connection ~ 4700 5200
Connection ~ 4700 5000
$Comp
L alexios:74HC574 U?
U 2 1 6B516CE1
P 5050 5800
AR Path="/6B516CE1" Ref="U?"  Part="1" 
AR Path="/5D78E680/6B516CE1" Ref="U?"  Part="2" 
AR Path="/5D363063/6B516CE1" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/6B516CE1" Ref="U?"  Part="2" 
AR Path="/5E4A8360/6B516CE1" Ref="U?"  Part="2" 
AR Path="/64FC7999/6548E0CC/6B516CE1" Ref="U?"  Part="2" 
AR Path="/64FC7999/6549E394/6B516CE1" Ref="U?"  Part="2" 
AR Path="/64FC7999/6B516CE1" Ref="U306"  Part="2" 
F 0 "U306" H 5230 5846 50  0000 L CNN
F 1 "74HC541" H 5230 5755 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4750 5750 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4750 5750 50  0001 C CNN
	2    5050 5800
	1    0    0    -1  
$EndComp
Connection ~ 4700 5900
Connection ~ 4700 5700
$Comp
L alexios:74HC138 U301
U 1 1 6464B82D
P -1450 2600
F 0 "U301" H -1450 3267 50  0000 C CNN
F 1 "74HC138" H -1450 3176 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H -1450 2600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H -1450 2600 50  0001 C CNN
F 4 "Yes" H -1525 1775 50  0001 C CNN "Verified"
	1    -1450 2600
	1    0    0    -1  
$EndComp
Text Label -700 2200 2    50   ~ 0
~WAB0
Text Label -700 2400 2    50   ~ 0
~WAB2
Text Label -700 2500 2    50   ~ 0
~WDB0
Text Label -700 2600 2    50   ~ 0
~WDB1
Text Label -700 2700 2    50   ~ 0
~WIB0
Text Label -700 2800 2    50   ~ 0
~WIB1
Text Label -700 2900 2    50   ~ 0
~WOR0
Text Label -700 2300 2    50   ~ 0
~WAB1
Wire Wire Line
	-950 2900 -700 2900
Wire Wire Line
	-950 2800 -450 2800
Wire Wire Line
	-950 2700 -450 2700
Wire Wire Line
	-950 2600 -450 2600
Wire Wire Line
	-950 2500 -450 2500
Wire Wire Line
	-950 2400 -450 2400
Wire Wire Line
	-950 2300 -450 2300
Wire Wire Line
	-950 2200 -450 2200
Text HLabel -450 2200 2    50   Output ~ 0
~WAB0
Text HLabel -450 2300 2    50   Output ~ 0
~WAB1
Text HLabel -450 2400 2    50   Output ~ 0
~WAB2
Text HLabel -450 2500 2    50   Output ~ 0
~WDB0
Text HLabel -450 2600 2    50   Output ~ 0
~WDB1
Text HLabel -450 2700 2    50   Output ~ 0
~WIB0
Text HLabel -450 2800 2    50   Output ~ 0
~WIB1
Text Label -2200 2400 0    50   ~ 0
FPA2
Text Label -2200 2300 0    50   ~ 0
FPA1
Text Label -2200 2200 0    50   ~ 0
FPA0
Wire Wire Line
	-1950 2400 -2200 2400
Wire Wire Line
	-1950 2300 -2200 2300
Wire Wire Line
	-1950 2200 -2200 2200
Text Label -2200 3000 0    50   ~ 0
~WR
Text Label -2200 2900 0    50   ~ 0
~WEN0
$Comp
L alexios:74HC138 U302
U 1 1 64774450
P -1450 3850
F 0 "U302" H -1450 4517 50  0000 C CNN
F 1 "74HC138" H -1450 4426 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H -1450 3850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H -1450 3850 50  0001 C CNN
F 4 "Yes" H -1525 3025 50  0001 C CNN "Verified"
	1    -1450 3850
	1    0    0    -1  
$EndComp
Text Label -2200 3650 0    50   ~ 0
FPA2
Text Label -2200 3550 0    50   ~ 0
FPA1
Text Label -2200 3450 0    50   ~ 0
FPA0
Wire Wire Line
	-1950 3650 -2200 3650
Wire Wire Line
	-1950 3550 -2200 3550
Wire Wire Line
	-1950 3450 -2200 3450
Text Label -2200 4250 0    50   ~ 0
~WR
Text Label -2200 4150 0    50   ~ 0
~WEN1
$Comp
L alexios:74HC138 U303
U 1 1 647BCCC8
P -1450 5100
F 0 "U303" H -1450 5767 50  0000 C CNN
F 1 "74HC138" H -1450 5676 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H -1450 5100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H -1450 5100 50  0001 C CNN
F 4 "Yes" H -1525 4275 50  0001 C CNN "Verified"
	1    -1450 5100
	1    0    0    -1  
$EndComp
Text Label -2200 4900 0    50   ~ 0
FPA2
Text Label -2200 4800 0    50   ~ 0
FPA1
Text Label -2200 4700 0    50   ~ 0
FPA0
Wire Wire Line
	-1950 4900 -2200 4900
Wire Wire Line
	-1950 4800 -2200 4800
Wire Wire Line
	-1950 4700 -2200 4700
Text Label -2200 5500 0    50   ~ 0
~RD
Text Label -2200 5400 0    50   ~ 0
~REN0
Text Label -2200 6150 0    50   ~ 0
FPA2
Text Label -2200 6050 0    50   ~ 0
FPA1
Text Label -2200 5950 0    50   ~ 0
FPA0
Wire Wire Line
	-1950 6150 -2200 6150
Wire Wire Line
	-1950 6050 -2200 6050
Wire Wire Line
	-1950 5950 -2200 5950
Text HLabel -450 5300 2    50   Output ~ 0
~RIB1
Text HLabel -450 5200 2    50   Output ~ 0
~RIB0
Text HLabel -450 5100 2    50   Output ~ 0
~RDB1
Text HLabel -450 5000 2    50   Output ~ 0
~RDB0
Text HLabel -450 4900 2    50   Output ~ 0
~RAB2
Text HLabel -450 4800 2    50   Output ~ 0
~RAB1
Text HLabel -450 4700 2    50   Output ~ 0
~RAB0
Text Label -700 4800 2    50   ~ 0
~RAB1
Wire Wire Line
	-950 4800 -450 4800
Text Label -700 5300 2    50   ~ 0
~RIB1
Text Label -700 5200 2    50   ~ 0
~RIB0
Text Label -700 5100 2    50   ~ 0
~RDB1
Text Label -700 5000 2    50   ~ 0
~RDB0
Text Label -700 4900 2    50   ~ 0
~RAB2
Text Label -700 4700 2    50   ~ 0
~RAB0
Wire Wire Line
	-950 5300 -450 5300
Wire Wire Line
	-950 5200 -450 5200
Wire Wire Line
	-950 5100 -450 5100
Wire Wire Line
	-950 5000 -450 5000
Wire Wire Line
	-950 4900 -450 4900
Wire Wire Line
	-950 4700 -450 4700
$Comp
L alexios:74HC138 U304
U 1 1 647BCCF2
P -1450 6350
F 0 "U304" H -1450 7017 50  0000 C CNN
F 1 "74HC138" H -1450 6926 50  0000 C CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H -1450 6350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H -1450 6350 50  0001 C CNN
F 4 "Yes" H -1525 5525 50  0001 C CNN "Verified"
	1    -1450 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1950 6750 -2200 6750
Text Label -2200 6650 0    50   ~ 0
~REN1
Text Label -2200 6750 0    50   ~ 0
~RD
Text Notes -1100 4350 0    50   ~ 0
Writes to &48–4F
$Comp
L power:+5V #PWR0108
U 1 1 6491A656
P -2000 6500
F 0 "#PWR0108" H -2000 6350 50  0001 C CNN
F 1 "+5V" H -1985 6673 50  0000 C CNN
F 2 "" H -2000 6500 50  0001 C CNN
F 3 "" H -2000 6500 50  0001 C CNN
	1    -2000 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2000 6500 -2000 6550
Wire Wire Line
	-2000 6550 -1950 6550
$Comp
L power:+5V #PWR0109
U 1 1 64933507
P -2000 5250
F 0 "#PWR0109" H -2000 5100 50  0001 C CNN
F 1 "+5V" H -1985 5423 50  0000 C CNN
F 2 "" H -2000 5250 50  0001 C CNN
F 3 "" H -2000 5250 50  0001 C CNN
	1    -2000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2000 5250 -2000 5300
Wire Wire Line
	-2000 5300 -1950 5300
$Comp
L power:+5V #PWR0110
U 1 1 6494BCC9
P -2000 4000
F 0 "#PWR0110" H -2000 3850 50  0001 C CNN
F 1 "+5V" H -1985 4173 50  0000 C CNN
F 2 "" H -2000 4000 50  0001 C CNN
F 3 "" H -2000 4000 50  0001 C CNN
	1    -2000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2000 4000 -2000 4050
Wire Wire Line
	-2000 4050 -1950 4050
$Comp
L power:+5V #PWR0111
U 1 1 64964AA9
P -2000 2750
F 0 "#PWR0111" H -2000 2600 50  0001 C CNN
F 1 "+5V" H -1985 2923 50  0000 C CNN
F 2 "" H -2000 2750 50  0001 C CNN
F 3 "" H -2000 2750 50  0001 C CNN
	1    -2000 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2000 2750 -2000 2800
Wire Wire Line
	-2000 2800 -1950 2800
Wire Bus Line
	1350 1650 1350 4200
Text Notes -1100 3050 0    50   ~ 0
Writes to &40–47
Text Notes -1100 5600 0    50   ~ 0
Reads from &40–47
Text Notes -1100 6850 0    50   ~ 0
Reads from &48–4F
$Comp
L Device:C_Small C?
U 1 1 65FDF958
P 1050 6300
AR Path="/5D78E680/65FDF958" Ref="C?"  Part="1" 
AR Path="/5D363063/65FDF958" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/65FDF958" Ref="C?"  Part="1" 
AR Path="/5E4A8360/65FDF958" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65FDF958" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/65FDF958" Ref="C?"  Part="1" 
AR Path="/64FC7999/65FDF958" Ref="C301"  Part="1" 
F 0 "C301" H 959 6346 50  0000 R CNN
F 1 "100nF" H 959 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 6300 50  0001 C CNN
F 3 "~" H 1050 6300 50  0001 C CNN
	1    1050 6300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 65FDF951
P 1050 6200
AR Path="/5D78E680/65FDF951" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/65FDF951" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/65FDF951" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/65FDF951" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65FDF951" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/65FDF951" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65FDF951" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 1050 6050 50  0001 C CNN
F 1 "+5V" H 1065 6373 50  0000 C CNN
F 2 "" H 1050 6200 50  0001 C CNN
F 3 "" H 1050 6200 50  0001 C CNN
	1    1050 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 65FDF94A
P 1050 6400
AR Path="/5D78E680/65FDF94A" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/65FDF94A" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/65FDF94A" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/65FDF94A" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/65FDF94A" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/65FDF94A" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/65FDF94A" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 1050 6150 50  0001 C CNN
F 1 "GND" H 1055 6227 50  0000 C CNN
F 2 "" H 1050 6400 50  0001 C CNN
F 3 "" H 1050 6400 50  0001 C CNN
	1    1050 6400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U301
U 2 1 649BE404
P 1400 6300
F 0 "U301" H 1580 6346 50  0000 L CNN
F 1 "74HC138" H 1580 6255 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1400 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 1400 6300 50  0001 C CNN
F 4 "Yes" H 1325 5475 50  0001 C CNN "Verified"
	2    1400 6300
	1    0    0    -1  
$EndComp
Connection ~ 1050 6200
Connection ~ 1050 6400
$Comp
L Device:C_Small C?
U 1 1 649DA5F0
P 1050 7000
AR Path="/5D78E680/649DA5F0" Ref="C?"  Part="1" 
AR Path="/5D363063/649DA5F0" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/649DA5F0" Ref="C?"  Part="1" 
AR Path="/5E4A8360/649DA5F0" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/649DA5F0" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/649DA5F0" Ref="C?"  Part="1" 
AR Path="/64FC7999/649DA5F0" Ref="C302"  Part="1" 
F 0 "C302" H 959 7046 50  0000 R CNN
F 1 "100nF" H 959 6955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1050 7000 50  0001 C CNN
F 3 "~" H 1050 7000 50  0001 C CNN
	1    1050 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 649DA5F6
P 1050 6900
AR Path="/5D78E680/649DA5F6" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/649DA5F6" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/649DA5F6" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/649DA5F6" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/649DA5F6" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/649DA5F6" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/649DA5F6" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 1050 6750 50  0001 C CNN
F 1 "+5V" H 1065 7073 50  0000 C CNN
F 2 "" H 1050 6900 50  0001 C CNN
F 3 "" H 1050 6900 50  0001 C CNN
	1    1050 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 649DA5FC
P 1050 7100
AR Path="/5D78E680/649DA5FC" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/649DA5FC" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/649DA5FC" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/649DA5FC" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/649DA5FC" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/649DA5FC" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/649DA5FC" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 1050 6850 50  0001 C CNN
F 1 "GND" H 1055 6927 50  0000 C CNN
F 2 "" H 1050 7100 50  0001 C CNN
F 3 "" H 1050 7100 50  0001 C CNN
	1    1050 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U302
U 2 1 649DA603
P 1400 7000
F 0 "U302" H 1580 7046 50  0000 L CNN
F 1 "74HC138" H 1580 6955 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 1400 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 1400 7000 50  0001 C CNN
F 4 "Yes" H 1325 6175 50  0001 C CNN "Verified"
	2    1400 7000
	1    0    0    -1  
$EndComp
Connection ~ 1050 6900
Connection ~ 1050 7100
$Comp
L Device:C_Small C?
U 1 1 64A0CF56
P 2400 6300
AR Path="/5D78E680/64A0CF56" Ref="C?"  Part="1" 
AR Path="/5D363063/64A0CF56" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/64A0CF56" Ref="C?"  Part="1" 
AR Path="/5E4A8360/64A0CF56" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/64A0CF56" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/64A0CF56" Ref="C?"  Part="1" 
AR Path="/64FC7999/64A0CF56" Ref="C303"  Part="1" 
F 0 "C303" H 2309 6346 50  0000 R CNN
F 1 "100nF" H 2309 6255 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 6300 50  0001 C CNN
F 3 "~" H 2400 6300 50  0001 C CNN
	1    2400 6300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64A0CF5C
P 2400 6200
AR Path="/5D78E680/64A0CF5C" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/64A0CF5C" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/64A0CF5C" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/64A0CF5C" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/64A0CF5C" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/64A0CF5C" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/64A0CF5C" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 2400 6050 50  0001 C CNN
F 1 "+5V" H 2415 6373 50  0000 C CNN
F 2 "" H 2400 6200 50  0001 C CNN
F 3 "" H 2400 6200 50  0001 C CNN
	1    2400 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64A0CF62
P 2400 6400
AR Path="/5D78E680/64A0CF62" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/64A0CF62" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/64A0CF62" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/64A0CF62" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/64A0CF62" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/64A0CF62" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/64A0CF62" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 2400 6150 50  0001 C CNN
F 1 "GND" H 2405 6227 50  0000 C CNN
F 2 "" H 2400 6400 50  0001 C CNN
F 3 "" H 2400 6400 50  0001 C CNN
	1    2400 6400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U303
U 2 1 64A0CF69
P 2750 6300
F 0 "U303" H 2930 6346 50  0000 L CNN
F 1 "74HC138" H 2930 6255 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 2750 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 2750 6300 50  0001 C CNN
F 4 "Yes" H 2675 5475 50  0001 C CNN "Verified"
	2    2750 6300
	1    0    0    -1  
$EndComp
Connection ~ 2400 6200
Connection ~ 2400 6400
$Comp
L Device:C_Small C?
U 1 1 64A0CF71
P 2400 7000
AR Path="/5D78E680/64A0CF71" Ref="C?"  Part="1" 
AR Path="/5D363063/64A0CF71" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/64A0CF71" Ref="C?"  Part="1" 
AR Path="/5E4A8360/64A0CF71" Ref="C?"  Part="1" 
AR Path="/64FC7999/6548E0CC/64A0CF71" Ref="C?"  Part="1" 
AR Path="/64FC7999/6549E394/64A0CF71" Ref="C?"  Part="1" 
AR Path="/64FC7999/64A0CF71" Ref="C304"  Part="1" 
F 0 "C304" H 2309 7046 50  0000 R CNN
F 1 "100nF" H 2309 6955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7000 50  0001 C CNN
F 3 "~" H 2400 7000 50  0001 C CNN
	1    2400 7000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 64A0CF77
P 2400 6900
AR Path="/5D78E680/64A0CF77" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/64A0CF77" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/64A0CF77" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/64A0CF77" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/64A0CF77" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/64A0CF77" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/64A0CF77" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 2400 6750 50  0001 C CNN
F 1 "+5V" H 2415 7073 50  0000 C CNN
F 2 "" H 2400 6900 50  0001 C CNN
F 3 "" H 2400 6900 50  0001 C CNN
	1    2400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64A0CF7D
P 2400 7100
AR Path="/5D78E680/64A0CF7D" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/64A0CF7D" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/64A0CF7D" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/64A0CF7D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6548E0CC/64A0CF7D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/6549E394/64A0CF7D" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/64A0CF7D" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 2400 6850 50  0001 C CNN
F 1 "GND" H 2405 6927 50  0000 C CNN
F 2 "" H 2400 7100 50  0001 C CNN
F 3 "" H 2400 7100 50  0001 C CNN
	1    2400 7100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U304
U 2 1 64A0CF84
P 2750 7000
F 0 "U304" H 2930 7046 50  0000 L CNN
F 1 "74HC138" H 2930 6955 50  0000 L CNN
F 2 "alexios:DIP-16_W7.62mm_Socket" H 2750 7000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT138.pdf" H 2750 7000 50  0001 C CNN
F 4 "Yes" H 2675 6175 50  0001 C CNN "Verified"
	2    2750 7000
	1    0    0    -1  
$EndComp
Connection ~ 2400 6900
Connection ~ 2400 7100
Text HLabel -2250 2900 0    50   Input ~ 0
~WEN0
Text HLabel -2250 4150 0    50   Input ~ 0
~WEN1
Text HLabel -2250 5400 0    50   Input ~ 0
~REN0
Text HLabel -2250 6650 0    50   Input ~ 0
~REN1
Wire Wire Line
	-2250 2900 -1950 2900
Wire Wire Line
	-2250 4150 -1950 4150
Wire Wire Line
	-2250 5400 -1950 5400
Wire Wire Line
	-2250 6650 -1950 6650
Text HLabel -2250 3000 0    50   Input ~ 0
~WR
Wire Wire Line
	-2250 3000 -1950 3000
Wire Wire Line
	-1950 4250 -2200 4250
Text HLabel -2250 5500 0    50   Input ~ 0
~RD
Wire Wire Line
	-2250 5500 -1950 5500
$Comp
L Device:R_Network08 RN?
U 1 1 654B3ABF
P 7350 2800
AR Path="/5E4A8360/654B3ABF" Ref="RN?"  Part="1" 
AR Path="/60757845/6079630E/654B3ABF" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6548E0CC/654B3ABF" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6549E394/654B3ABF" Ref="RN?"  Part="1" 
AR Path="/64FC7999/654B3ABF" Ref="RN15"  Part="1" 
F 0 "RN15" H 7700 3000 50  0000 R CNN
F 1 "4.7kΩ" H 7700 3100 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 7825 2800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7350 2800 50  0001 C CNN
	1    7350 2800
	1    0    0    1   
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 6574FCBD
P 7350 5700
AR Path="/5E4A8360/6574FCBD" Ref="RN?"  Part="1" 
AR Path="/60757845/6079630E/6574FCBD" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6548E0CC/6574FCBD" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6549E394/6574FCBD" Ref="RN?"  Part="1" 
AR Path="/64FC7999/6574FCBD" Ref="RN17"  Part="1" 
F 0 "RN17" H 7700 5900 50  0000 R CNN
F 1 "4.7kΩ" H 7700 6000 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 7825 5700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7350 5700 50  0001 C CNN
	1    7350 5700
	1    0    0    1   
$EndComp
NoConn ~ -600 3550
NoConn ~ -600 3650
NoConn ~ -600 3750
NoConn ~ -600 3850
Text Label -700 3550 2    50   ~ 0
~W49
Text Label -700 3650 2    50   ~ 0
~W4A
Text Label -700 3750 2    50   ~ 0
~W4B
Text Label -700 3850 2    50   ~ 0
~W4C
Wire Wire Line
	-950 3550 -600 3550
Wire Wire Line
	-950 3650 -600 3650
Wire Wire Line
	-950 3750 -600 3750
Wire Wire Line
	-950 3850 -600 3850
Text Notes -550 3750 0    50   ~ 0
Expansion
NoConn ~ -600 6150
NoConn ~ -600 6250
NoConn ~ -600 6350
Text Label -700 6150 2    50   ~ 0
~R49
Text Label -700 6250 2    50   ~ 0
~R4A
Text Label -700 6350 2    50   ~ 0
~R4B
Wire Wire Line
	-950 6150 -600 6150
Wire Wire Line
	-950 6250 -600 6250
Wire Wire Line
	-950 6350 -600 6350
Text Notes -500 6250 0    50   ~ 0
Expansion
Wire Bus Line
	5950 1550 5950 4400
Wire Bus Line
	4150 1950 4150 4400
Wire Bus Line
	9350 1550 9350 5700
$EndSCHEMATC
