EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 11
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
L alexios:cft-dfp-pod P?
U 1 1 66D4CEA5
P 2950 2450
AR Path="/66D4CEA5" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CEA5" Ref="P3"  Part="1" 
F 0 "P3" H 2950 3576 50  0000 C CNN
F 1 "cft-dfp-pod" H 2950 3650 50  0001 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 2950 1150 50  0001 C CNN
F 3 "" H 2950 2450 50  0001 C CNN
	1    2950 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CEAB
P 2350 3600
AR Path="/66D4CEAB" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEAB" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 2350 3350 50  0001 C CNN
F 1 "GND" H 2355 3427 50  0000 C CNN
F 2 "" H 2350 3600 50  0001 C CNN
F 3 "" H 2350 3600 50  0001 C CNN
	1    2350 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3550 2350 3550
Wire Wire Line
	2350 3550 2350 3600
$Comp
L power:+5V #PWR?
U 1 1 66D4CEB3
P 2350 1500
AR Path="/66D4CEB3" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEB3" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 2350 1350 50  0001 C CNN
F 1 "+5V" H 2365 1673 50  0000 C CNN
F 2 "" H 2350 1500 50  0001 C CNN
F 3 "" H 2350 1500 50  0001 C CNN
	1    2350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1500 2350 1550
Wire Wire Line
	2350 1550 2400 1550
Text Label 2100 1750 0    50   ~ 0
FPD0
Text Label 2100 1850 0    50   ~ 0
FPD1
Text Label 2100 1950 0    50   ~ 0
FPD2
Text Label 2100 2050 0    50   ~ 0
FPD3
Text Label 2100 2150 0    50   ~ 0
FPD4
Text Label 2100 2250 0    50   ~ 0
FPD5
Text Label 2100 2350 0    50   ~ 0
FPD6
Text Label 2100 2450 0    50   ~ 0
FPD7
Text Label 2100 2650 0    50   ~ 0
BUSCP
Wire Wire Line
	2400 3050 2100 3050
Wire Wire Line
	2400 3150 2100 3150
Wire Wire Line
	2400 3250 2350 3250
Text Label 2100 3350 0    50   ~ 0
~ABOE
Text Label 2100 3050 0    50   ~ 0
~WAB0
Text Label 2100 3150 0    50   ~ 0
~WAB1
Text Label 2100 2750 0    50   ~ 0
~RAB0
Text Label 2100 2850 0    50   ~ 0
~RAB1
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CED7
P 5450 2450
AR Path="/66D4CED7" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CED7" Ref="P4"  Part="1" 
F 0 "P4" H 5450 3576 50  0000 C CNN
F 1 "cft-dfp-pod" H 5450 3650 50  0001 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 5450 1150 50  0001 C CNN
F 3 "" H 5450 2450 50  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CEDD
P 4850 3600
AR Path="/66D4CEDD" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEDD" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 4850 3350 50  0001 C CNN
F 1 "GND" H 4855 3427 50  0000 C CNN
F 2 "" H 4850 3600 50  0001 C CNN
F 3 "" H 4850 3600 50  0001 C CNN
	1    4850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3550 4850 3550
Wire Wire Line
	4850 3550 4850 3600
$Comp
L power:+5V #PWR?
U 1 1 66D4CEE5
P 4850 1500
AR Path="/66D4CEE5" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEE5" Ref="#PWR0183"  Part="1" 
F 0 "#PWR0183" H 4850 1350 50  0001 C CNN
F 1 "+5V" H 4865 1673 50  0000 C CNN
F 2 "" H 4850 1500 50  0001 C CNN
F 3 "" H 4850 1500 50  0001 C CNN
	1    4850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1500 4850 1550
Wire Wire Line
	4850 1550 4900 1550
Wire Wire Line
	4900 1750 4600 1750
Wire Wire Line
	4900 1850 4600 1850
Wire Wire Line
	4900 1950 4600 1950
Wire Wire Line
	4900 2050 4600 2050
Wire Wire Line
	4900 2150 4600 2150
Wire Wire Line
	4900 2250 4600 2250
Wire Wire Line
	4900 2350 4600 2350
Wire Wire Line
	4900 2450 4600 2450
Text Label 4600 1750 0    50   ~ 0
FPD0
Text Label 4600 1850 0    50   ~ 0
FPD1
Text Label 4600 1950 0    50   ~ 0
FPD2
Text Label 4600 2050 0    50   ~ 0
FPD3
Text Label 4600 2150 0    50   ~ 0
FPD4
Text Label 4600 2250 0    50   ~ 0
FPD5
Text Label 4600 2350 0    50   ~ 0
FPD6
Text Label 4600 2450 0    50   ~ 0
FPD7
Wire Wire Line
	4900 2650 4600 2650
Wire Wire Line
	4900 2750 4600 2750
Wire Wire Line
	4900 2850 4600 2850
Text Label 4600 2650 0    50   ~ 0
BUSCP
Wire Wire Line
	4900 3050 4600 3050
Wire Wire Line
	4900 3150 4600 3150
Wire Wire Line
	4900 3250 4600 3250
Wire Wire Line
	4900 3350 4600 3350
Wire Wire Line
	6350 1750 6000 1750
Wire Wire Line
	6000 1850 6350 1850
Wire Wire Line
	6000 1950 6350 1950
Wire Wire Line
	6000 2050 6350 2050
Wire Wire Line
	6000 2150 6350 2150
Wire Wire Line
	6000 2250 6350 2250
Wire Wire Line
	6000 2350 6350 2350
Wire Wire Line
	6000 2450 6350 2450
Wire Wire Line
	8850 2650 8500 2650
Wire Wire Line
	8500 2750 8850 2750
Wire Wire Line
	8500 2850 8850 2850
Wire Wire Line
	8500 2950 8850 2950
Text Label 4600 3050 0    50   ~ 0
~WAB2
Text Label 4600 3150 0    50   ~ 0
~WCV0
Text Label 4600 2750 0    50   ~ 0
~RAB2
Wire Wire Line
	3500 1750 3850 1750
Wire Wire Line
	3500 1850 3850 1850
Wire Wire Line
	3500 1950 3850 1950
Wire Wire Line
	3500 2050 3850 2050
Wire Wire Line
	3500 2150 3850 2150
Wire Wire Line
	3500 2250 3850 2250
Wire Wire Line
	3500 2350 3850 2350
Wire Wire Line
	3500 2450 3850 2450
Wire Wire Line
	3500 2650 3850 2650
Wire Wire Line
	3500 2750 3850 2750
Wire Wire Line
	3500 2850 3850 2850
Wire Wire Line
	3500 2950 3850 2950
Wire Wire Line
	3500 3050 3850 3050
Wire Wire Line
	3500 3150 3850 3150
Wire Wire Line
	3500 3250 3850 3250
Wire Wire Line
	3500 3350 3850 3350
Text Label 3850 1750 2    50   ~ 0
AB0
Text Label 3850 1850 2    50   ~ 0
AB1
Text Label 3850 1950 2    50   ~ 0
AB2
Text Label 3850 2050 2    50   ~ 0
AB3
Text Label 3850 2150 2    50   ~ 0
AB4
Text Label 3850 2250 2    50   ~ 0
AB5
Text Label 3850 2350 2    50   ~ 0
AB6
Text Label 3850 2450 2    50   ~ 0
AB7
Text Label 3850 2650 2    50   ~ 0
AB8
Text Label 3850 2750 2    50   ~ 0
AB9
Text Label 3850 2850 2    50   ~ 0
AB10
Text Label 3850 2950 2    50   ~ 0
AB11
Text Label 3850 3050 2    50   ~ 0
AB12
Text Label 3850 3150 2    50   ~ 0
AB13
Text Label 3850 3250 2    50   ~ 0
AB14
Text Label 3850 3350 2    50   ~ 0
AB15
Text Label 6350 1750 2    50   ~ 0
AB16
Text Label 6350 1850 2    50   ~ 0
AB17
Text Label 6350 1950 2    50   ~ 0
AB18
Text Label 6350 2050 2    50   ~ 0
AB19
Text Label 6350 2150 2    50   ~ 0
AB20
Text Label 6350 2250 2    50   ~ 0
AB21
Text Label 6350 2350 2    50   ~ 0
AB22
Text Label 6350 2450 2    50   ~ 0
AB23
Text Label 3850 5000 2    50   ~ 0
DB0
Text Label 3850 5100 2    50   ~ 0
DB1
Text Label 3850 5200 2    50   ~ 0
DB2
Text Label 3850 5300 2    50   ~ 0
DB3
Text Label 3850 5400 2    50   ~ 0
DB4
Text Label 3850 5500 2    50   ~ 0
DB5
Text Label 3850 5600 2    50   ~ 0
DB6
Text Label 3850 5700 2    50   ~ 0
DB7
Text Label 3850 5900 2    50   ~ 0
DB8
Text Label 3850 6000 2    50   ~ 0
DB9
Text Label 3850 6100 2    50   ~ 0
DB10
Text Label 3850 6200 2    50   ~ 0
DB11
Text Label 3850 6300 2    50   ~ 0
DB12
Text Label 3850 6400 2    50   ~ 0
DB13
Text Label 3850 6500 2    50   ~ 0
DB14
Text Label 3850 6600 2    50   ~ 0
DB15
Text Label 6350 5000 2    50   ~ 0
IBUS0
Text Label 6350 5100 2    50   ~ 0
IBUS1
Text Label 6350 5200 2    50   ~ 0
IBUS2
Text Label 6350 5300 2    50   ~ 0
IBUS3
Text Label 6350 5400 2    50   ~ 0
IBUS4
Text Label 6350 5500 2    50   ~ 0
IBUS5
Text Label 6350 5600 2    50   ~ 0
IBUS6
Text Label 6350 5700 2    50   ~ 0
IBUS7
Text Label 6350 5900 2    50   ~ 0
IBUS8
Text Label 6350 6000 2    50   ~ 0
IBUS9
Text Label 6350 6100 2    50   ~ 0
IBUS10
Text Label 6350 6200 2    50   ~ 0
IBUS11
Text Label 6350 6300 2    50   ~ 0
IBUS12
Text Label 6350 6400 2    50   ~ 0
IBUS13
Text Label 6350 6500 2    50   ~ 0
IBUS14
Text Label 6350 6600 2    50   ~ 0
IBUS15
Text Label 8850 2650 2    50   ~ 0
ACTION0
Text Label 8850 2750 2    50   ~ 0
ACTION1
Text Label 8850 2850 2    50   ~ 0
ACTION2
Text Label 8850 2950 2    50   ~ 0
ACTION3
Wire Wire Line
	8500 3050 8850 3050
Wire Wire Line
	8500 3150 8850 3150
Wire Wire Line
	8500 3250 8850 3250
Wire Wire Line
	8500 3350 8850 3350
Text Label 8850 3050 2    50   ~ 0
COND0
Text Label 8850 3150 2    50   ~ 0
COND1
Text Label 8850 3250 2    50   ~ 0
COND2
Text Label 8850 3350 2    50   ~ 0
COND3
Text Label 4600 3250 0    50   ~ 0
~ABOE
Text Label 4600 2850 0    50   ~ 0
~RCV0
Text Label 4600 3350 0    50   ~ 0
~CVOE
Wire Wire Line
	2400 3350 2350 3350
Wire Wire Line
	2350 3250 2350 3350
Connection ~ 2350 3350
Wire Wire Line
	2350 3350 2100 3350
Wire Wire Line
	6000 2650 6350 2650
Wire Wire Line
	6000 2750 6350 2750
Wire Wire Line
	6000 2850 6350 2850
Wire Wire Line
	6000 2950 6350 2950
Wire Wire Line
	6000 3050 6350 3050
Text Label 6350 2650 2    50   ~ 0
RADDR0
Text Label 6350 2750 2    50   ~ 0
RADDR1
Text Label 6350 2850 2    50   ~ 0
RADDR2
Text Label 6350 2950 2    50   ~ 0
RADDR3
Text Label 6350 3050 2    50   ~ 0
RADDR4
Wire Wire Line
	6000 3150 6050 3150
Wire Wire Line
	6000 3250 6050 3250
Wire Wire Line
	6000 3350 6050 3350
NoConn ~ 6050 3150
NoConn ~ 6050 3250
NoConn ~ 6050 3350
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CF7F
P 7950 2450
AR Path="/66D4CF7F" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CF7F" Ref="P5"  Part="1" 
F 0 "P5" H 7950 3576 50  0000 C CNN
F 1 "cft-dfp-pod" H 7950 3650 50  0001 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 7950 1150 50  0001 C CNN
F 3 "" H 7950 2450 50  0001 C CNN
	1    7950 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CF85
P 7350 3600
AR Path="/66D4CF85" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CF85" Ref="#PWR0184"  Part="1" 
F 0 "#PWR0184" H 7350 3350 50  0001 C CNN
F 1 "GND" H 7355 3427 50  0000 C CNN
F 2 "" H 7350 3600 50  0001 C CNN
F 3 "" H 7350 3600 50  0001 C CNN
	1    7350 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3550 7350 3550
Wire Wire Line
	7350 3550 7350 3600
$Comp
L power:+5V #PWR?
U 1 1 66D4CF8D
P 7350 1500
AR Path="/66D4CF8D" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CF8D" Ref="#PWR0185"  Part="1" 
F 0 "#PWR0185" H 7350 1350 50  0001 C CNN
F 1 "+5V" H 7365 1673 50  0000 C CNN
F 2 "" H 7350 1500 50  0001 C CNN
F 3 "" H 7350 1500 50  0001 C CNN
	1    7350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 1500 7350 1550
Wire Wire Line
	7350 1550 7400 1550
Wire Wire Line
	7400 1750 7100 1750
Wire Wire Line
	7400 1850 7100 1850
Wire Wire Line
	7400 1950 7100 1950
Wire Wire Line
	7400 2050 7100 2050
Wire Wire Line
	7400 2150 7100 2150
Wire Wire Line
	7400 2250 7100 2250
Wire Wire Line
	7400 2350 7100 2350
Wire Wire Line
	7400 2450 7100 2450
Text Label 7100 1750 0    50   ~ 0
FPD0
Text Label 7100 1850 0    50   ~ 0
FPD1
Text Label 7100 1950 0    50   ~ 0
FPD2
Text Label 7100 2050 0    50   ~ 0
FPD3
Text Label 7100 2150 0    50   ~ 0
FPD4
Text Label 7100 2250 0    50   ~ 0
FPD5
Text Label 7100 2350 0    50   ~ 0
FPD6
Text Label 7100 2450 0    50   ~ 0
FPD7
Wire Wire Line
	7400 2650 7100 2650
Wire Wire Line
	7400 2750 7100 2750
Wire Wire Line
	7400 2850 7100 2850
Text Label 7100 2650 0    50   ~ 0
BUSCP
Wire Wire Line
	7400 3050 7100 3050
Wire Wire Line
	7400 3150 7100 3150
Wire Wire Line
	7400 3250 7350 3250
Wire Wire Line
	7400 3350 7350 3350
Text Label 7100 3050 0    50   ~ 0
~WCV1
Text Label 7100 3150 0    50   ~ 0
~WCV2
Text Label 7100 2850 0    50   ~ 0
~RCV2
Text Label 7100 3350 0    50   ~ 0
~CVOE
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CFB1
P 2950 5700
AR Path="/66D4CFB1" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CFB1" Ref="P6"  Part="1" 
F 0 "P6" H 2950 6826 50  0000 C CNN
F 1 "cft-dfp-pod" H 2950 6900 50  0001 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 2950 4400 50  0001 C CNN
F 3 "" H 2950 5700 50  0001 C CNN
	1    2950 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CFB7
P 2350 6850
AR Path="/66D4CFB7" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFB7" Ref="#PWR0186"  Part="1" 
F 0 "#PWR0186" H 2350 6600 50  0001 C CNN
F 1 "GND" H 2355 6677 50  0000 C CNN
F 2 "" H 2350 6850 50  0001 C CNN
F 3 "" H 2350 6850 50  0001 C CNN
	1    2350 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6800 2350 6800
Wire Wire Line
	2350 6800 2350 6850
$Comp
L power:+5V #PWR?
U 1 1 66D4CFBF
P 2350 4750
AR Path="/66D4CFBF" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFBF" Ref="#PWR0187"  Part="1" 
F 0 "#PWR0187" H 2350 4600 50  0001 C CNN
F 1 "+5V" H 2365 4923 50  0000 C CNN
F 2 "" H 2350 4750 50  0001 C CNN
F 3 "" H 2350 4750 50  0001 C CNN
	1    2350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4750 2350 4800
Wire Wire Line
	2350 4800 2400 4800
Wire Wire Line
	2400 5000 2100 5000
Wire Wire Line
	2400 5100 2100 5100
Wire Wire Line
	2400 5200 2100 5200
Wire Wire Line
	2400 5300 2100 5300
Wire Wire Line
	2400 5400 2100 5400
Wire Wire Line
	2400 5500 2100 5500
Wire Wire Line
	2400 5600 2100 5600
Wire Wire Line
	2400 5700 2100 5700
Text Label 2100 5000 0    50   ~ 0
FPD0
Text Label 2100 5100 0    50   ~ 0
FPD1
Text Label 2100 5200 0    50   ~ 0
FPD2
Text Label 2100 5300 0    50   ~ 0
FPD3
Text Label 2100 5400 0    50   ~ 0
FPD4
Text Label 2100 5500 0    50   ~ 0
FPD5
Text Label 2100 5600 0    50   ~ 0
FPD6
Text Label 2100 5700 0    50   ~ 0
FPD7
Wire Wire Line
	3850 5000 3500 5000
Wire Wire Line
	3500 5100 3850 5100
Wire Wire Line
	3500 5200 3850 5200
Wire Wire Line
	3500 5300 3850 5300
Wire Wire Line
	3500 5400 3850 5400
Wire Wire Line
	3500 5500 3850 5500
Wire Wire Line
	3500 5600 3850 5600
Wire Wire Line
	3500 5700 3850 5700
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CFDF
P 5450 5700
AR Path="/66D4CFDF" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CFDF" Ref="P7"  Part="1" 
F 0 "P7" H 5450 6826 50  0000 C CNN
F 1 "cft-dfp-pod" H 5450 6900 50  0001 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 5450 4400 50  0001 C CNN
F 3 "" H 5450 5700 50  0001 C CNN
	1    5450 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CFE5
P 4850 6850
AR Path="/66D4CFE5" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFE5" Ref="#PWR0188"  Part="1" 
F 0 "#PWR0188" H 4850 6600 50  0001 C CNN
F 1 "GND" H 4855 6677 50  0000 C CNN
F 2 "" H 4850 6850 50  0001 C CNN
F 3 "" H 4850 6850 50  0001 C CNN
	1    4850 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6800 4850 6800
Wire Wire Line
	4850 6800 4850 6850
$Comp
L power:+5V #PWR?
U 1 1 66D4CFED
P 4850 4750
AR Path="/66D4CFED" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFED" Ref="#PWR0189"  Part="1" 
F 0 "#PWR0189" H 4850 4600 50  0001 C CNN
F 1 "+5V" H 4865 4923 50  0000 C CNN
F 2 "" H 4850 4750 50  0001 C CNN
F 3 "" H 4850 4750 50  0001 C CNN
	1    4850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4750 4850 4800
Wire Wire Line
	4850 4800 4900 4800
Wire Wire Line
	4900 5000 4600 5000
Wire Wire Line
	4900 5100 4600 5100
Wire Wire Line
	4900 5200 4600 5200
Wire Wire Line
	4900 5300 4600 5300
Wire Wire Line
	4900 5400 4600 5400
Wire Wire Line
	4900 5500 4600 5500
Wire Wire Line
	4900 5600 4600 5600
Wire Wire Line
	4900 5700 4600 5700
Text Label 4600 5000 0    50   ~ 0
FPD0
Text Label 4600 5100 0    50   ~ 0
FPD1
Text Label 4600 5200 0    50   ~ 0
FPD2
Text Label 4600 5300 0    50   ~ 0
FPD3
Text Label 4600 5400 0    50   ~ 0
FPD4
Text Label 4600 5500 0    50   ~ 0
FPD5
Text Label 4600 5600 0    50   ~ 0
FPD6
Text Label 4600 5700 0    50   ~ 0
FPD7
Wire Wire Line
	3500 5900 3850 5900
Wire Wire Line
	3500 6000 3850 6000
Wire Wire Line
	3500 6100 3850 6100
Wire Wire Line
	3500 6200 3850 6200
Wire Wire Line
	3500 6300 3850 6300
Wire Wire Line
	3500 6400 3850 6400
Wire Wire Line
	3500 6500 3850 6500
Wire Wire Line
	3500 6600 3850 6600
Wire Wire Line
	2400 5900 2100 5900
Wire Wire Line
	2400 6000 2100 6000
Wire Wire Line
	2400 6100 2100 6100
Text Label 2100 5900 0    50   ~ 0
BUSCP
Wire Wire Line
	2400 6300 2100 6300
Wire Wire Line
	2400 6400 2100 6400
Wire Wire Line
	2400 6500 2350 6500
Text Label 2100 6600 0    50   ~ 0
~DBOE
Text Label 2100 6300 0    50   ~ 0
~WDB0
Text Label 2100 6400 0    50   ~ 0
~WDB1
Text Label 2100 6000 0    50   ~ 0
~RDB0
Text Label 2100 6100 0    50   ~ 0
~RDB1
Wire Wire Line
	2400 6600 2350 6600
Wire Wire Line
	2350 6500 2350 6600
Connection ~ 2350 6600
Wire Wire Line
	2350 6600 2100 6600
Wire Wire Line
	4900 5900 4600 5900
Wire Wire Line
	4900 6000 4600 6000
Wire Wire Line
	4900 6100 4600 6100
Text Label 4600 5900 0    50   ~ 0
BUSCP
Wire Wire Line
	4900 6300 4600 6300
Wire Wire Line
	4900 6400 4600 6400
Wire Wire Line
	4900 6500 4850 6500
Text Label 4600 6600 0    50   ~ 0
~IBOE
Text Label 4600 6300 0    50   ~ 0
~WIB0
Text Label 4600 6400 0    50   ~ 0
~WIB1
Text Label 4600 6000 0    50   ~ 0
~RIB0
Text Label 4600 6100 0    50   ~ 0
~RIB1
Wire Wire Line
	4900 6600 4850 6600
Wire Wire Line
	4850 6500 4850 6600
Connection ~ 4850 6600
Wire Wire Line
	4850 6600 4600 6600
Wire Wire Line
	6350 5000 6000 5000
Wire Wire Line
	6000 5100 6350 5100
Wire Wire Line
	6000 5200 6350 5200
Wire Wire Line
	6000 5300 6350 5300
Wire Wire Line
	6000 5400 6350 5400
Wire Wire Line
	6000 5500 6350 5500
Wire Wire Line
	6000 5600 6350 5600
Wire Wire Line
	6000 5700 6350 5700
Wire Wire Line
	6000 5900 6350 5900
Wire Wire Line
	6000 6000 6350 6000
Wire Wire Line
	6000 6100 6350 6100
Wire Wire Line
	6000 6200 6350 6200
Wire Wire Line
	6000 6300 6350 6300
Wire Wire Line
	6000 6400 6350 6400
Wire Wire Line
	6000 6500 6350 6500
Wire Wire Line
	6000 6600 6350 6600
Wire Wire Line
	8850 1750 8500 1750
Wire Wire Line
	8500 1850 8850 1850
Wire Wire Line
	8500 1950 8850 1950
Wire Wire Line
	8500 2050 8850 2050
Wire Wire Line
	8500 2150 8850 2150
Text Label 8850 1750 2    50   ~ 0
WADDR0
Text Label 8850 1850 2    50   ~ 0
WADDR1
Text Label 8850 1950 2    50   ~ 0
WADDR2
Text Label 8850 2050 2    50   ~ 0
WADDR3
Text Label 8850 2150 2    50   ~ 0
WADDR4
Wire Wire Line
	8500 2250 8550 2250
Wire Wire Line
	8500 2350 8550 2350
Wire Wire Line
	8500 2450 8550 2450
NoConn ~ 8550 2250
NoConn ~ 8550 2350
NoConn ~ 8550 2450
Text Label 7100 2750 0    50   ~ 0
~RCV1
Wire Wire Line
	7350 3250 7350 3350
Connection ~ 7350 3350
Wire Wire Line
	7350 3350 7100 3350
Text Notes 2250 1150 0    100  ~ 20
Address Bus 0–15
Text Notes 4700 1150 0    100  ~ 20
Address Bus 16–23\nControl Bus (RADDR)
Text Notes 7250 1150 0    100  ~ 20
Control Bus (WADDR,\nACTION & COND)
Text Notes 2600 4400 0    100  ~ 20
Data Bus
Text Notes 5300 4400 0    100  ~ 20
IBus
Wire Wire Line
	2400 2450 2100 2450
Wire Wire Line
	2400 2350 2100 2350
Wire Wire Line
	2400 2250 2100 2250
Wire Wire Line
	2400 2150 2100 2150
Wire Wire Line
	2400 2050 2100 2050
Wire Wire Line
	2400 1950 2100 1950
Wire Wire Line
	2400 1850 2100 1850
Wire Wire Line
	2400 1750 2100 1750
Text HLabel 1250 1450 0    50   BiDi ~ 0
FPD[0..7]
Text Label 1750 1450 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	1250 1450 1900 1450
Entry Bus Bus
	1900 1450 2000 1550
Entry Wire Line
	2000 1650 2100 1750
Entry Wire Line
	2000 1750 2100 1850
Entry Wire Line
	2000 1850 2100 1950
Entry Wire Line
	2000 1950 2100 2050
Entry Wire Line
	2000 2050 2100 2150
Entry Wire Line
	2000 2150 2100 2250
Entry Wire Line
	2000 2250 2100 2350
Entry Wire Line
	2000 2350 2100 2450
Wire Wire Line
	2400 2850 2100 2850
Wire Wire Line
	2400 2750 2100 2750
Wire Wire Line
	2400 2650 2100 2650
Text HLabel 1250 1600 0    50   Input ~ 0
BUSCP
Text HLabel 1250 2300 0    50   Input ~ 0
~RAB0
Text HLabel 1250 2400 0    50   Input ~ 0
~RAB1
Text HLabel 1250 2500 0    50   Input ~ 0
~RAB2
Text HLabel 1250 2700 0    50   Input ~ 0
~WAB0
Text HLabel 1250 2800 0    50   Input ~ 0
~WAB1
Text HLabel 1250 2900 0    50   Input ~ 0
~WAB2
Text HLabel 1250 3100 0    50   Input ~ 0
~RCV0
Text HLabel 1250 3200 0    50   Input ~ 0
~RCV1
Text HLabel 1250 3300 0    50   Input ~ 0
~RCV2
Text HLabel 1250 3500 0    50   Input ~ 0
~WCV0
Text HLabel 1250 3600 0    50   Input ~ 0
~WCV1
Text HLabel 1250 3700 0    50   Input ~ 0
~WCV2
Text HLabel 1250 3900 0    50   Input ~ 0
~RDB0
Text HLabel 1250 4000 0    50   Input ~ 0
~RDB1
Text HLabel 1250 4200 0    50   Input ~ 0
~WDB0
Text HLabel 1250 4300 0    50   Input ~ 0
~WDB1
Text HLabel 1250 4500 0    50   Input ~ 0
~RIB0
Text HLabel 1250 4600 0    50   Input ~ 0
~RIB1
Text HLabel 1250 4800 0    50   Input ~ 0
~WIB0
Text HLabel 1250 4900 0    50   Input ~ 0
~WIB1
Text HLabel 10150 1750 2    50   BiDi ~ 0
AB[0..23]
Text HLabel 10150 1950 2    50   BiDi ~ 0
RADDR[0..4]
Text HLabel 10150 2050 2    50   BiDi ~ 0
WADDR[0..4]
Text HLabel 10150 2150 2    50   BiDi ~ 0
ACTION[0..3]
Text HLabel 10150 2250 2    50   BiDi ~ 0
COND[0..3]
Text HLabel 10150 2450 2    50   BiDi ~ 0
DB[0..15]
Text HLabel 10150 2650 2    50   BiDi ~ 0
IBUS[0..15]
Wire Bus Line
	10150 1750 9650 1750
Wire Bus Line
	10150 1950 9650 1950
Wire Bus Line
	10150 2050 9650 2050
Wire Bus Line
	10150 2150 9650 2150
Wire Bus Line
	10150 2250 9650 2250
Wire Bus Line
	10150 2450 9650 2450
Wire Bus Line
	10150 2650 9650 2650
Text Label 9650 1750 0    50   ~ 0
AB[0..23]
Text Label 9650 1950 0    50   ~ 0
RADDR[0..4]
Text Label 9650 2050 0    50   ~ 0
WADDR[0..4]
Text Label 9650 2150 0    50   ~ 0
ACTION[0..3]
Text Label 9650 2250 0    50   ~ 0
COND[0..3]
Text Label 9650 2450 0    50   ~ 0
DB[0..15]
Text Label 9650 2650 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	1250 1600 1500 1600
Wire Wire Line
	1250 2300 1500 2300
Wire Wire Line
	1250 2400 1500 2400
Wire Wire Line
	1250 2500 1500 2500
Wire Wire Line
	1250 2700 1500 2700
Wire Wire Line
	1250 2800 1500 2800
Wire Wire Line
	1250 2900 1500 2900
Wire Wire Line
	1250 3100 1500 3100
Wire Wire Line
	1250 3200 1500 3200
Wire Wire Line
	1250 3300 1500 3300
Wire Wire Line
	1250 3500 1500 3500
Wire Wire Line
	1250 3600 1500 3600
Wire Wire Line
	1250 3700 1500 3700
Wire Wire Line
	1250 3900 1500 3900
Wire Wire Line
	1250 4000 1500 4000
Wire Wire Line
	1250 4200 1500 4200
Wire Wire Line
	1250 4300 1500 4300
Wire Wire Line
	1250 4500 1500 4500
Wire Wire Line
	1250 4600 1500 4600
Wire Wire Line
	1250 4800 1500 4800
Wire Wire Line
	1250 4900 1500 4900
Text Label 1500 1600 2    50   ~ 0
BUSCP
Text Label 1500 2300 2    50   ~ 0
~RAB0
Text Label 1500 2400 2    50   ~ 0
~RAB1
Text Label 1500 2500 2    50   ~ 0
~RAB2
Text Label 1500 2700 2    50   ~ 0
~WAB0
Text Label 1500 2800 2    50   ~ 0
~WAB1
Text Label 1500 2900 2    50   ~ 0
~WAB2
Text Label 1500 3100 2    50   ~ 0
~RCV0
Text Label 1500 3200 2    50   ~ 0
~RCV1
Text Label 1500 3300 2    50   ~ 0
~RCV2
Text Label 1500 3500 2    50   ~ 0
~WCV0
Text Label 1500 3600 2    50   ~ 0
~WCV1
Text Label 1500 3700 2    50   ~ 0
~WCV2
Text Label 1500 3900 2    50   ~ 0
~RDB0
Text Label 1500 4000 2    50   ~ 0
~RDB1
Text Label 1500 4200 2    50   ~ 0
~WDB0
Text Label 1500 4300 2    50   ~ 0
~WDB1
Text Label 1500 4500 2    50   ~ 0
~RIB0
Text Label 1500 4600 2    50   ~ 0
~RIB1
Text Label 1500 4800 2    50   ~ 0
~WIB0
Text Label 1500 4900 2    50   ~ 0
~WIB1
Text HLabel 1250 1800 0    50   Input ~ 0
~ABOE
Text HLabel 1250 1900 0    50   Input ~ 0
~CVOE
Text HLabel 1250 2000 0    50   Input ~ 0
~DBOE
Text HLabel 1250 2100 0    50   Input ~ 0
~IBOE
Wire Wire Line
	1250 1800 1500 1800
Wire Wire Line
	1250 1900 1500 1900
Wire Wire Line
	1250 2000 1500 2000
Wire Wire Line
	1250 2100 1500 2100
Text Label 1500 1800 2    50   ~ 0
~ABOE
Text Label 1500 1900 2    50   ~ 0
~CVOE
Text Label 1500 2000 2    50   ~ 0
~DBOE
Text Label 1500 2100 2    50   ~ 0
~IBOE
Wire Bus Line
	2000 1550 2000 2350
$EndSCHEMATC
