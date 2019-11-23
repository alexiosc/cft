EESchema Schematic File Version 4
LIBS:cft-dfp-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 13
Title "DFP Devices (OR, DSR)"
Date "2019-11-17"
Rev "1945"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3100 4300 2    50   ~ 0
CPH
Text Label 1750 4800 0    50   ~ 0
~RDSR
Text HLabel 1650 4800 0    50   3State ~ 0
~RDSR
Text HLabel 1650 4300 0    50   Input ~ 0
CPH
Text Label 1750 4300 0    50   ~ 0
CPH
Wire Wire Line
	3150 4300 1650 4300
Text Label 3100 4400 2    50   ~ 0
~OEH
Text Label 3100 2950 2    50   ~ 0
~OEL
Text Label 3100 2850 2    50   ~ 0
CPL
Entry Wire Line
	2750 3400 2650 3300
Entry Wire Line
	2750 3500 2650 3400
Entry Wire Line
	2750 4100 2650 4000
Entry Wire Line
	2750 4000 2650 3900
Entry Wire Line
	2750 3900 2650 3800
Entry Wire Line
	2750 3800 2650 3700
Entry Wire Line
	2750 3700 2650 3600
Entry Wire Line
	2750 3600 2650 3500
Wire Wire Line
	2750 4100 3150 4100
Wire Wire Line
	3150 3400 2750 3400
Wire Wire Line
	3150 3500 2750 3500
Wire Wire Line
	3150 3600 2750 3600
Wire Wire Line
	3150 3700 2750 3700
Wire Wire Line
	3150 3800 2750 3800
Wire Wire Line
	3150 3900 2750 3900
Wire Wire Line
	3150 4000 2750 4000
Text HLabel 1650 2850 0    50   Input ~ 0
CPL
Text HLabel 1650 2950 0    50   Input ~ 0
~OEL
Text HLabel 1650 1500 0    50   3State ~ 0
FPD[0..7]
Text Label 1750 1500 0    50   ~ 0
FPD[0..7]
Wire Bus Line
	2550 1500 1650 1500
Entry Bus Bus
	2550 1500 2650 1600
Entry Bus Bus
	2650 4600 2750 4700
Entry Bus Bus
	4650 1600 4750 1500
Text Label 1750 2850 0    50   ~ 0
CPL
Wire Wire Line
	3150 2850 1650 2850
Text Label 1750 2950 0    50   ~ 0
~OEL
$Comp
L alexios:74HC574 U?
U 1 1 5D43C652
P 3650 3900
AR Path="/5D43C652" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D43C652" Ref="U?"  Part="1" 
AR Path="/5D363063/5D43C652" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D43C652" Ref="U?"  Part="1" 
AR Path="/5E4A8360/5D43C652" Ref="U902"  Part="1" 
F 0 "U902" H 3650 4667 50  0000 C CNN
F 1 "74HC574" H 3650 4576 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 3350 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3350 3850 50  0001 C CNN
	1    3650 3900
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 1 1 5D43C659
P 3650 2450
AR Path="/5D43C659" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D43C659" Ref="U?"  Part="1" 
AR Path="/5D363063/5D43C659" Ref="U?"  Part="1" 
AR Path="/5D42FF4D/5D43C659" Ref="U?"  Part="1" 
AR Path="/5E4A8360/5D43C659" Ref="U901"  Part="1" 
F 0 "U901" H 3650 3217 50  0000 C CNN
F 1 "74HC574" H 3650 3126 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 3350 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3350 2400 50  0001 C CNN
	1    3650 2450
	1    0    0    -1  
$EndComp
Entry Wire Line
	4550 3400 4650 3300
Entry Wire Line
	4550 1950 4650 1850
Entry Wire Line
	4550 2650 4650 2550
Entry Wire Line
	4550 2550 4650 2450
Entry Wire Line
	4550 2450 4650 2350
Entry Wire Line
	4550 2350 4650 2250
Entry Wire Line
	4550 2250 4650 2150
Entry Wire Line
	4550 2150 4650 2050
Entry Wire Line
	4550 2050 4650 1950
Wire Wire Line
	2750 2650 3150 2650
Entry Wire Line
	2750 1950 2650 1850
Entry Wire Line
	2750 2050 2650 1950
Entry Wire Line
	4550 4100 4650 4000
Entry Wire Line
	4550 4000 4650 3900
Entry Wire Line
	4550 3900 4650 3800
Entry Wire Line
	4550 3800 4650 3700
Entry Wire Line
	4550 3700 4650 3600
Entry Wire Line
	4550 3600 4650 3500
Entry Wire Line
	4550 3500 4650 3400
Wire Wire Line
	3150 1950 2750 1950
Wire Wire Line
	3150 2050 2750 2050
Wire Wire Line
	3150 2150 2750 2150
Wire Wire Line
	3150 2250 2750 2250
Wire Wire Line
	3150 2350 2750 2350
Wire Wire Line
	3150 2450 2750 2450
Wire Wire Line
	3150 2550 2750 2550
Entry Wire Line
	2750 2650 2650 2550
Entry Wire Line
	2750 2550 2650 2450
Entry Wire Line
	2750 2450 2650 2350
Entry Wire Line
	2750 2350 2650 2250
Entry Wire Line
	2750 2250 2650 2150
Entry Wire Line
	2750 2150 2650 2050
Text Label 3100 1950 2    50   ~ 0
FPD0
Text Label 3100 2050 2    50   ~ 0
FPD1
Text Label 3100 2150 2    50   ~ 0
FPD2
Text Label 3100 2250 2    50   ~ 0
FPD3
Text Label 3100 2350 2    50   ~ 0
FPD4
Text Label 3100 2450 2    50   ~ 0
FPD5
Text Label 3100 2550 2    50   ~ 0
FPD6
Text Label 3100 2650 2    50   ~ 0
FPD7
Text Label 3100 3400 2    50   ~ 0
FPD0
Text Label 3100 3500 2    50   ~ 0
FPD1
Text Label 3100 3600 2    50   ~ 0
FPD2
Text Label 3100 3700 2    50   ~ 0
FPD3
Text Label 3100 3800 2    50   ~ 0
FPD4
Text Label 3100 3900 2    50   ~ 0
FPD5
Text Label 3100 4000 2    50   ~ 0
FPD6
Text Label 3100 4100 2    50   ~ 0
FPD7
Wire Wire Line
	4150 2650 4550 2650
Wire Wire Line
	4550 1950 4150 1950
Wire Wire Line
	4550 2050 4150 2050
Wire Wire Line
	4550 2150 4150 2150
Wire Wire Line
	4550 2250 4150 2250
Wire Wire Line
	4550 2350 4150 2350
Wire Wire Line
	4550 2450 4150 2450
Wire Wire Line
	4550 2550 4150 2550
Text Label 4500 1950 2    50   ~ 0
FPD0
Text Label 4500 2050 2    50   ~ 0
FPD1
Text Label 4500 2150 2    50   ~ 0
FPD2
Text Label 4500 2250 2    50   ~ 0
FPD3
Text Label 4500 2350 2    50   ~ 0
FPD4
Text Label 4500 2450 2    50   ~ 0
FPD5
Text Label 4500 2550 2    50   ~ 0
FPD6
Text Label 4500 2650 2    50   ~ 0
FPD7
Wire Wire Line
	4150 4100 4550 4100
Wire Wire Line
	4550 3400 4150 3400
Wire Wire Line
	4550 3500 4150 3500
Wire Wire Line
	4550 3600 4150 3600
Wire Wire Line
	4550 3700 4150 3700
Wire Wire Line
	4550 3800 4150 3800
Wire Wire Line
	4550 3900 4150 3900
Wire Wire Line
	4550 4000 4150 4000
Text Label 4500 3400 2    50   ~ 0
FPD0
Text Label 4500 3500 2    50   ~ 0
FPD1
Text Label 4500 3600 2    50   ~ 0
FPD2
Text Label 4500 3700 2    50   ~ 0
FPD3
Text Label 4500 3800 2    50   ~ 0
FPD4
Text Label 4500 3900 2    50   ~ 0
FPD5
Text Label 4500 4000 2    50   ~ 0
FPD6
Text Label 4500 4100 2    50   ~ 0
FPD7
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 5D44ACF2
P 5300 2500
F 0 "SW1" H 5300 3167 50  0000 C CNN
F 1 "SW_DIP_x08" H 5300 3076 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Piano_10.8x21.88mm_W7.62mm_P2.54mm" H 5300 2500 50  0001 C CNN
F 3 "" H 5300 2500 50  0001 C CNN
	1    5300 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U903
U 1 1 5D44CE36
P 7200 2600
F 0 "U903" H 7200 3367 50  0000 C CNN
F 1 "74HC541" H 7200 3276 50  0000 C CNN
F 2 "alexios:SOIC-20W" H 7200 2600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 7200 2600 50  0001 C CNN
	1    7200 2600
	1    0    0    -1  
$EndComp
Entry Wire Line
	8100 2100 8200 2000
Entry Wire Line
	8100 2800 8200 2700
Entry Wire Line
	8100 2700 8200 2600
Entry Wire Line
	8100 2600 8200 2500
Entry Wire Line
	8100 2500 8200 2400
Entry Wire Line
	8100 2400 8200 2300
Entry Wire Line
	8100 2300 8200 2200
Entry Wire Line
	8100 2200 8200 2100
Wire Wire Line
	7700 2800 8100 2800
Wire Wire Line
	8100 2100 7700 2100
Wire Wire Line
	8100 2200 7700 2200
Wire Wire Line
	8100 2300 7700 2300
Wire Wire Line
	8100 2400 7700 2400
Wire Wire Line
	8100 2500 7700 2500
Wire Wire Line
	8100 2600 7700 2600
Wire Wire Line
	8100 2700 7700 2700
Text Label 8050 2100 2    50   ~ 0
FPD0
Text Label 8050 2200 2    50   ~ 0
FPD1
Text Label 8050 2300 2    50   ~ 0
FPD2
Text Label 8050 2400 2    50   ~ 0
FPD3
Text Label 8050 2500 2    50   ~ 0
FPD4
Text Label 8050 2600 2    50   ~ 0
FPD5
Text Label 8050 2700 2    50   ~ 0
FPD6
Text Label 8050 2800 2    50   ~ 0
FPD7
Wire Bus Line
	2750 4700 4550 4700
Entry Bus Bus
	4550 4700 4650 4600
Wire Bus Line
	4750 1500 8100 1500
Entry Bus Bus
	8100 1500 8200 1600
$Comp
L Device:R_Network08 RN901
U 1 1 5D45B95D
P 6100 3100
F 0 "RN901" H 5621 3054 50  0000 R CNN
F 1 "4.7kΩ" H 5621 3145 50  0000 R CNN
F 2 "Resistor_THT:R_Array_SIP9" V 6575 3100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6100 3100 50  0001 C CNN
	1    6100 3100
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR0907
U 1 1 5D45CB33
P 4950 2100
F 0 "#PWR0907" H 4950 1950 50  0001 C CNN
F 1 "+5V" H 4800 2150 50  0000 C CNN
F 2 "" H 4950 2100 50  0001 C CNN
F 3 "" H 4950 2100 50  0001 C CNN
	1    4950 2100
	1    0    0    -1  
$EndComp
Connection ~ 4950 2100
Wire Wire Line
	4950 2100 4950 2200
Connection ~ 4950 2200
Wire Wire Line
	4950 2200 4950 2300
Connection ~ 4950 2300
Connection ~ 4950 2400
Connection ~ 4950 2500
Connection ~ 4950 2600
Connection ~ 4950 2700
Wire Wire Line
	4950 2300 4950 2400
Wire Wire Line
	4950 2400 4950 2500
Wire Wire Line
	4950 2500 4950 2600
Wire Wire Line
	4950 2600 4950 2700
Wire Wire Line
	4950 2700 4950 2800
Wire Wire Line
	5600 2100 5700 2100
Wire Wire Line
	5600 2300 5900 2300
Wire Wire Line
	5600 2400 6000 2400
Wire Wire Line
	5600 2500 6100 2500
Wire Wire Line
	5600 2600 6200 2600
Wire Wire Line
	5600 2700 6300 2700
Wire Wire Line
	5600 2800 6400 2800
Wire Wire Line
	5700 2900 5700 2100
Connection ~ 5700 2100
Wire Wire Line
	5700 2100 6700 2100
Wire Wire Line
	5800 2900 5800 2200
Wire Wire Line
	5600 2200 5800 2200
Connection ~ 5800 2200
Wire Wire Line
	5800 2200 6700 2200
Wire Wire Line
	5900 2900 5900 2300
Connection ~ 5900 2300
Wire Wire Line
	5900 2300 6700 2300
Wire Wire Line
	6000 2900 6000 2400
Connection ~ 6000 2400
Wire Wire Line
	6000 2400 6700 2400
Wire Wire Line
	6100 2900 6100 2500
Connection ~ 6100 2500
Wire Wire Line
	6100 2500 6700 2500
Wire Wire Line
	6200 2900 6200 2600
Connection ~ 6200 2600
Wire Wire Line
	6200 2600 6700 2600
Wire Wire Line
	6300 2900 6300 2700
Connection ~ 6300 2700
Wire Wire Line
	6300 2700 6700 2700
Wire Wire Line
	6400 2900 6400 2800
Connection ~ 6400 2800
Wire Wire Line
	6400 2800 6700 2800
$Comp
L power:GND #PWR0908
U 1 1 5D47B986
P 5700 3300
F 0 "#PWR0908" H 5700 3050 50  0001 C CNN
F 1 "GND" H 5705 3127 50  0000 C CNN
F 2 "" H 5700 3300 50  0001 C CNN
F 3 "" H 5700 3300 50  0001 C CNN
	1    5700 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0909
U 1 1 5D47C9B3
P 6700 3100
F 0 "#PWR0909" H 6700 2850 50  0001 C CNN
F 1 "GND" H 6705 2927 50  0000 C CNN
F 2 "" H 6700 3100 50  0001 C CNN
F 3 "" H 6700 3100 50  0001 C CNN
	1    6700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3000 6550 3000
Wire Wire Line
	6550 3000 6550 4800
Wire Wire Line
	6550 4800 1650 4800
Text Label 6550 3000 0    50   ~ 0
~RDSR
Text Label 6550 4050 1    50   ~ 0
~RDSR
Wire Wire Line
	5000 2700 4950 2700
Wire Wire Line
	5000 2600 4950 2600
Wire Wire Line
	5000 2500 4950 2500
Wire Wire Line
	5000 2400 4950 2400
Wire Wire Line
	5000 2300 4950 2300
Wire Wire Line
	5000 2200 4950 2200
Wire Wire Line
	5000 2100 4950 2100
Wire Wire Line
	4950 2800 5000 2800
$Comp
L power:GND #PWR?
U 1 1 5D4ACD60
P 950 7400
AR Path="/5D78E680/5D4ACD60" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D4ACD60" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD60" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/5D4ACD60" Ref="#PWR0902"  Part="1" 
F 0 "#PWR0902" H 950 7150 50  0001 C CNN
F 1 "GND" H 955 7227 50  0000 C CNN
F 2 "" H 950 7400 50  0001 C CNN
F 3 "" H 950 7400 50  0001 C CNN
	1    950  7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4ACD66
P 950 7200
AR Path="/5D78E680/5D4ACD66" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D4ACD66" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD66" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/5D4ACD66" Ref="#PWR0901"  Part="1" 
F 0 "#PWR0901" H 950 7050 50  0001 C CNN
F 1 "+5V" H 965 7373 50  0000 C CNN
F 2 "" H 950 7200 50  0001 C CNN
F 3 "" H 950 7200 50  0001 C CNN
	1    950  7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4ACD6C
P 950 7300
AR Path="/5D78E680/5D4ACD6C" Ref="C?"  Part="1" 
AR Path="/5D363063/5D4ACD6C" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD6C" Ref="C?"  Part="1" 
AR Path="/5E4A8360/5D4ACD6C" Ref="C901"  Part="1" 
F 0 "C901" H 859 7346 50  0000 R CNN
F 1 "100nF" H 859 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 950 7300 50  0001 C CNN
F 3 "~" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D4ACD73
P 1300 7300
AR Path="/5D4ACD73" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D4ACD73" Ref="U?"  Part="2" 
AR Path="/5D363063/5D4ACD73" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D4ACD73" Ref="U?"  Part="2" 
AR Path="/5E4A8360/5D4ACD73" Ref="U901"  Part="2" 
F 0 "U901" H 1479 7346 50  0000 L CNN
F 1 "74HC574" H 1479 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 1000 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1000 7250 50  0001 C CNN
	2    1300 7300
	1    0    0    -1  
$EndComp
Connection ~ 950  7400
Connection ~ 950  7200
$Comp
L power:GND #PWR?
U 1 1 5D4ACD7C
P 2400 7400
AR Path="/5D78E680/5D4ACD7C" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D4ACD7C" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD7C" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/5D4ACD7C" Ref="#PWR0904"  Part="1" 
F 0 "#PWR0904" H 2400 7150 50  0001 C CNN
F 1 "GND" H 2405 7227 50  0000 C CNN
F 2 "" H 2400 7400 50  0001 C CNN
F 3 "" H 2400 7400 50  0001 C CNN
	1    2400 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4ACD82
P 2400 7200
AR Path="/5D78E680/5D4ACD82" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D4ACD82" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD82" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/5D4ACD82" Ref="#PWR0903"  Part="1" 
F 0 "#PWR0903" H 2400 7050 50  0001 C CNN
F 1 "+5V" H 2415 7373 50  0000 C CNN
F 2 "" H 2400 7200 50  0001 C CNN
F 3 "" H 2400 7200 50  0001 C CNN
	1    2400 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4ACD88
P 2400 7300
AR Path="/5D78E680/5D4ACD88" Ref="C?"  Part="1" 
AR Path="/5D363063/5D4ACD88" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD88" Ref="C?"  Part="1" 
AR Path="/5E4A8360/5D4ACD88" Ref="C902"  Part="1" 
F 0 "C902" H 2309 7346 50  0000 R CNN
F 1 "100nF" H 2309 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7300 50  0001 C CNN
F 3 "~" H 2400 7300 50  0001 C CNN
	1    2400 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC574 U?
U 2 1 5D4ACD8F
P 2750 7300
AR Path="/5D4ACD8F" Ref="U?"  Part="1" 
AR Path="/5D78E680/5D4ACD8F" Ref="U?"  Part="2" 
AR Path="/5D363063/5D4ACD8F" Ref="U?"  Part="2" 
AR Path="/5D42FF4D/5D4ACD8F" Ref="U?"  Part="2" 
AR Path="/5E4A8360/5D4ACD8F" Ref="U902"  Part="2" 
F 0 "U902" H 2929 7346 50  0000 L CNN
F 1 "74HC574" H 2929 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 2450 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2450 7250 50  0001 C CNN
	2    2750 7300
	1    0    0    -1  
$EndComp
Connection ~ 2400 7400
Connection ~ 2400 7200
$Comp
L power:GND #PWR?
U 1 1 5D4ACD98
P 3850 7400
AR Path="/5D78E680/5D4ACD98" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D4ACD98" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD98" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/5D4ACD98" Ref="#PWR0906"  Part="1" 
F 0 "#PWR0906" H 3850 7150 50  0001 C CNN
F 1 "GND" H 3855 7227 50  0000 C CNN
F 2 "" H 3850 7400 50  0001 C CNN
F 3 "" H 3850 7400 50  0001 C CNN
	1    3850 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D4ACD9E
P 3850 7200
AR Path="/5D78E680/5D4ACD9E" Ref="#PWR?"  Part="1" 
AR Path="/5D363063/5D4ACD9E" Ref="#PWR?"  Part="1" 
AR Path="/5D42FF4D/5D4ACD9E" Ref="#PWR?"  Part="1" 
AR Path="/5E4A8360/5D4ACD9E" Ref="#PWR0905"  Part="1" 
F 0 "#PWR0905" H 3850 7050 50  0001 C CNN
F 1 "+5V" H 3865 7373 50  0000 C CNN
F 2 "" H 3850 7200 50  0001 C CNN
F 3 "" H 3850 7200 50  0001 C CNN
	1    3850 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D4ACDA4
P 3850 7300
AR Path="/5D78E680/5D4ACDA4" Ref="C?"  Part="1" 
AR Path="/5D363063/5D4ACDA4" Ref="C?"  Part="1" 
AR Path="/5D42FF4D/5D4ACDA4" Ref="C?"  Part="1" 
AR Path="/5E4A8360/5D4ACDA4" Ref="C903"  Part="1" 
F 0 "C903" H 3759 7346 50  0000 R CNN
F 1 "100nF" H 3759 7255 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 7300 50  0001 C CNN
F 3 "~" H 3850 7300 50  0001 C CNN
	1    3850 7300
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U903
U 2 1 5D4B3307
P 4200 7300
F 0 "U903" H 4379 7346 50  0000 L CNN
F 1 "74HC541" H 4379 7255 50  0000 L CNN
F 2 "alexios:SOIC-20W" H 4200 7300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4200 7300 50  0001 C CNN
	2    4200 7300
	1    0    0    -1  
$EndComp
Connection ~ 3850 7400
Connection ~ 3850 7200
Wire Wire Line
	1650 2950 3150 2950
Wire Wire Line
	1650 4400 3150 4400
Text HLabel 1650 4400 0    50   Input ~ 0
~OEH
Text Label 1750 4400 0    50   ~ 0
~OEH
Wire Bus Line
	8200 1600 8200 2700
Wire Bus Line
	4650 1600 4650 4600
Wire Bus Line
	2650 1600 2650 4600
$EndSCHEMATC
