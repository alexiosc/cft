EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 13
Title ""
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CEA5
P 3450 2300
AR Path="/66D4CEA5" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CEA5" Ref="J3"  Part="1" 
F 0 "J3" H 3450 3426 50  0000 C CNN
F 1 "cft-dfp-pod" H 3450 3500 50  0001 C CNN
F 2 "alexios:CFT-2020-DFP-RevB-Bus-Pod-44pin" H 3450 1000 50  0001 C CNN
F 3 "" H 3450 2300 50  0001 C CNN
	1    3450 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CEAB
P 2850 3450
AR Path="/66D4CEAB" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEAB" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 2850 3200 50  0001 C CNN
F 1 "GND" H 2855 3277 50  0000 C CNN
F 2 "" H 2850 3450 50  0001 C CNN
F 3 "" H 2850 3450 50  0001 C CNN
	1    2850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3400 2850 3400
Wire Wire Line
	2850 3400 2850 3450
$Comp
L power:+5V #PWR?
U 1 1 66D4CEB3
P 2850 1350
AR Path="/66D4CEB3" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEB3" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2850 1200 50  0001 C CNN
F 1 "+5V" H 2865 1523 50  0000 C CNN
F 2 "" H 2850 1350 50  0001 C CNN
F 3 "" H 2850 1350 50  0001 C CNN
	1    2850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1350 2850 1400
Wire Wire Line
	2850 1400 2900 1400
Text Label 2600 1600 0    50   ~ 0
FPD0
Text Label 2600 1700 0    50   ~ 0
FPD1
Text Label 2600 1800 0    50   ~ 0
FPD2
Text Label 2600 1900 0    50   ~ 0
FPD3
Text Label 2600 2000 0    50   ~ 0
FPD4
Text Label 2600 2100 0    50   ~ 0
FPD5
Text Label 2600 2200 0    50   ~ 0
FPD6
Text Label 2600 2300 0    50   ~ 0
FPD7
Text Label 1850 2500 0    50   ~ 0
BUSCP
Wire Wire Line
	2900 2900 2600 2900
Wire Wire Line
	2900 3000 2600 3000
Wire Wire Line
	2900 3100 2850 3100
Text Label 1850 3200 0    50   ~ 0
~ABOE
Text Label 2600 2900 0    50   ~ 0
~WAB0
Text Label 2600 3000 0    50   ~ 0
~WAB1
Text Label 2600 2600 0    50   ~ 0
~RAB0
Text Label 2600 2700 0    50   ~ 0
~RAB1
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CED7
P 5950 2300
AR Path="/66D4CED7" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CED7" Ref="J5"  Part="1" 
F 0 "J5" H 5950 3426 50  0000 C CNN
F 1 "cft-dfp-pod" H 5950 3500 50  0001 C CNN
F 2 "alexios:CFT-2020-DFP-RevB-Bus-Pod-44pin" H 5950 1000 50  0001 C CNN
F 3 "" H 5950 2300 50  0001 C CNN
	1    5950 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CEDD
P 5350 3450
AR Path="/66D4CEDD" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEDD" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 5350 3200 50  0001 C CNN
F 1 "GND" H 5355 3277 50  0000 C CNN
F 2 "" H 5350 3450 50  0001 C CNN
F 3 "" H 5350 3450 50  0001 C CNN
	1    5350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3400 5350 3400
Wire Wire Line
	5350 3400 5350 3450
$Comp
L power:+5V #PWR?
U 1 1 66D4CEE5
P 5350 1350
AR Path="/66D4CEE5" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CEE5" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 5350 1200 50  0001 C CNN
F 1 "+5V" H 5365 1523 50  0000 C CNN
F 2 "" H 5350 1350 50  0001 C CNN
F 3 "" H 5350 1350 50  0001 C CNN
	1    5350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1350 5350 1400
Wire Wire Line
	5350 1400 5400 1400
Wire Wire Line
	5400 1600 5100 1600
Wire Wire Line
	5400 1700 5100 1700
Wire Wire Line
	5400 1800 5100 1800
Wire Wire Line
	5400 1900 5100 1900
Wire Wire Line
	5400 2000 5100 2000
Wire Wire Line
	5400 2100 5100 2100
Wire Wire Line
	5400 2200 5100 2200
Wire Wire Line
	5400 2300 5100 2300
Text Label 5100 1600 0    50   ~ 0
FPD0
Text Label 5100 1700 0    50   ~ 0
FPD1
Text Label 5100 1800 0    50   ~ 0
FPD2
Text Label 5100 1900 0    50   ~ 0
FPD3
Text Label 5100 2000 0    50   ~ 0
FPD4
Text Label 5100 2100 0    50   ~ 0
FPD5
Text Label 5100 2200 0    50   ~ 0
FPD6
Text Label 5100 2300 0    50   ~ 0
FPD7
Wire Wire Line
	5400 2500 5100 2500
Wire Wire Line
	5400 2600 5100 2600
Wire Wire Line
	5400 2700 5100 2700
Text Label 5100 2500 0    50   ~ 0
BUSCP
Wire Wire Line
	5400 2900 5100 2900
Wire Wire Line
	5400 3000 5100 3000
Wire Wire Line
	6850 1600 6500 1600
Wire Wire Line
	6500 1700 6850 1700
Wire Wire Line
	6500 1800 6850 1800
Wire Wire Line
	6500 1900 6850 1900
Wire Wire Line
	6500 2000 6850 2000
Wire Wire Line
	6500 2100 6850 2100
Wire Wire Line
	6500 2200 6850 2200
Wire Wire Line
	6500 2300 6850 2300
Wire Wire Line
	9350 2500 9000 2500
Wire Wire Line
	9000 2600 9350 2600
Wire Wire Line
	9000 2700 9350 2700
Wire Wire Line
	9000 2800 9350 2800
Text Label 5100 2900 0    50   ~ 0
~WAB2
Text Label 5100 3000 0    50   ~ 0
~WCV0
Text Label 5100 2600 0    50   ~ 0
~RAB2
Wire Wire Line
	4000 1600 4350 1600
Wire Wire Line
	4000 1700 4350 1700
Wire Wire Line
	4000 1800 4350 1800
Wire Wire Line
	4000 1900 4350 1900
Wire Wire Line
	4000 2000 4350 2000
Wire Wire Line
	4000 2100 4350 2100
Wire Wire Line
	4000 2200 4350 2200
Wire Wire Line
	4000 2300 4350 2300
Wire Wire Line
	4000 2500 4350 2500
Wire Wire Line
	4000 2600 4350 2600
Wire Wire Line
	4000 2700 4350 2700
Wire Wire Line
	4000 2800 4350 2800
Wire Wire Line
	4000 2900 4350 2900
Wire Wire Line
	4000 3000 4350 3000
Wire Wire Line
	4000 3100 4350 3100
Wire Wire Line
	4000 3200 4350 3200
Text Label 4350 1600 2    50   ~ 0
AB0
Text Label 4350 1700 2    50   ~ 0
AB1
Text Label 4350 1800 2    50   ~ 0
AB2
Text Label 4350 1900 2    50   ~ 0
AB3
Text Label 4350 2000 2    50   ~ 0
AB4
Text Label 4350 2100 2    50   ~ 0
AB5
Text Label 4350 2200 2    50   ~ 0
AB6
Text Label 4350 2300 2    50   ~ 0
AB7
Text Label 4350 2500 2    50   ~ 0
AB8
Text Label 4350 2600 2    50   ~ 0
AB9
Text Label 4350 2700 2    50   ~ 0
AB10
Text Label 4350 2800 2    50   ~ 0
AB11
Text Label 4350 2900 2    50   ~ 0
AB12
Text Label 4350 3000 2    50   ~ 0
AB13
Text Label 4350 3100 2    50   ~ 0
AB14
Text Label 4350 3200 2    50   ~ 0
AB15
Text Label 6850 1600 2    50   ~ 0
AB16
Text Label 6850 1700 2    50   ~ 0
AB17
Text Label 6850 1800 2    50   ~ 0
AB18
Text Label 6850 1900 2    50   ~ 0
AB19
Text Label 6850 2000 2    50   ~ 0
AB20
Text Label 6850 2100 2    50   ~ 0
AB21
Text Label 6850 2200 2    50   ~ 0
AB22
Text Label 6850 2300 2    50   ~ 0
AB23
Text Label 4350 5000 2    50   ~ 0
DB0
Text Label 4350 5100 2    50   ~ 0
DB1
Text Label 4350 5200 2    50   ~ 0
DB2
Text Label 4350 5300 2    50   ~ 0
DB3
Text Label 4350 5400 2    50   ~ 0
DB4
Text Label 4350 5500 2    50   ~ 0
DB5
Text Label 4350 5600 2    50   ~ 0
DB6
Text Label 4350 5700 2    50   ~ 0
DB7
Text Label 4350 5900 2    50   ~ 0
DB8
Text Label 4350 6000 2    50   ~ 0
DB9
Text Label 4350 6100 2    50   ~ 0
DB10
Text Label 4350 6200 2    50   ~ 0
DB11
Text Label 4350 6300 2    50   ~ 0
DB12
Text Label 4350 6400 2    50   ~ 0
DB13
Text Label 4350 6500 2    50   ~ 0
DB14
Text Label 4350 6600 2    50   ~ 0
DB15
Text Label 6850 5000 2    50   ~ 0
IBUS0
Text Label 6850 5100 2    50   ~ 0
IBUS1
Text Label 6850 5200 2    50   ~ 0
IBUS2
Text Label 6850 5300 2    50   ~ 0
IBUS3
Text Label 6850 5400 2    50   ~ 0
IBUS4
Text Label 6850 5500 2    50   ~ 0
IBUS5
Text Label 6850 5600 2    50   ~ 0
IBUS6
Text Label 6850 5700 2    50   ~ 0
IBUS7
Text Label 6850 5900 2    50   ~ 0
IBUS8
Text Label 6850 6000 2    50   ~ 0
IBUS9
Text Label 6850 6100 2    50   ~ 0
IBUS10
Text Label 6850 6200 2    50   ~ 0
IBUS11
Text Label 6850 6300 2    50   ~ 0
IBUS12
Text Label 6850 6400 2    50   ~ 0
IBUS13
Text Label 6850 6500 2    50   ~ 0
IBUS14
Text Label 6850 6600 2    50   ~ 0
IBUS15
Text Label 9350 2500 2    50   ~ 0
ACTION0
Text Label 9350 2600 2    50   ~ 0
ACTION1
Text Label 9350 2700 2    50   ~ 0
ACTION2
Text Label 9350 2800 2    50   ~ 0
ACTION3
Text Label 5100 2700 0    50   ~ 0
~RCV0
Wire Wire Line
	2900 3200 2850 3200
Wire Wire Line
	2850 3100 2850 3200
Connection ~ 2850 3200
Wire Wire Line
	2850 3200 2350 3200
Wire Wire Line
	6500 2500 6850 2500
Wire Wire Line
	6500 2600 6850 2600
Wire Wire Line
	6500 2700 6850 2700
Wire Wire Line
	6500 2800 6850 2800
Wire Wire Line
	6500 2900 6850 2900
Text Label 6850 2500 2    50   ~ 0
RADDR0
Text Label 6850 2600 2    50   ~ 0
RADDR1
Text Label 6850 2700 2    50   ~ 0
RADDR2
Text Label 6850 2800 2    50   ~ 0
RADDR3
Text Label 6850 2900 2    50   ~ 0
RADDR4
Wire Wire Line
	6500 3000 6550 3000
Wire Wire Line
	6500 3100 6550 3100
Wire Wire Line
	6500 3200 6550 3200
NoConn ~ 6550 3000
NoConn ~ 6550 3100
NoConn ~ 6550 3200
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CF7F
P 8450 2300
AR Path="/66D4CF7F" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CF7F" Ref="J7"  Part="1" 
F 0 "J7" H 8450 3426 50  0000 C CNN
F 1 "cft-dfp-pod" H 8450 3500 50  0001 C CNN
F 2 "alexios:CFT-2020-DFP-RevB-Bus-Pod-44pin" H 8450 1000 50  0001 C CNN
F 3 "" H 8450 2300 50  0001 C CNN
	1    8450 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CF85
P 7850 3450
AR Path="/66D4CF85" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CF85" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 7850 3200 50  0001 C CNN
F 1 "GND" H 7855 3277 50  0000 C CNN
F 2 "" H 7850 3450 50  0001 C CNN
F 3 "" H 7850 3450 50  0001 C CNN
	1    7850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3400 7850 3400
Wire Wire Line
	7850 3400 7850 3450
$Comp
L power:+5V #PWR?
U 1 1 66D4CF8D
P 7850 1350
AR Path="/66D4CF8D" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CF8D" Ref="#PWR0211"  Part="1" 
F 0 "#PWR0211" H 7850 1200 50  0001 C CNN
F 1 "+5V" H 7865 1523 50  0000 C CNN
F 2 "" H 7850 1350 50  0001 C CNN
F 3 "" H 7850 1350 50  0001 C CNN
	1    7850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 1350 7850 1400
Wire Wire Line
	7850 1400 7900 1400
Wire Wire Line
	7900 1600 7600 1600
Wire Wire Line
	7900 1700 7600 1700
Wire Wire Line
	7900 1800 7600 1800
Wire Wire Line
	7900 1900 7600 1900
Wire Wire Line
	7900 2000 7600 2000
Wire Wire Line
	7900 2100 7600 2100
Wire Wire Line
	7900 2200 7600 2200
Wire Wire Line
	7900 2300 7600 2300
Text Label 7600 1600 0    50   ~ 0
FPD0
Text Label 7600 1700 0    50   ~ 0
FPD1
Text Label 7600 1800 0    50   ~ 0
FPD2
Text Label 7600 1900 0    50   ~ 0
FPD3
Text Label 7600 2000 0    50   ~ 0
FPD4
Text Label 7600 2100 0    50   ~ 0
FPD5
Text Label 7600 2200 0    50   ~ 0
FPD6
Text Label 7600 2300 0    50   ~ 0
FPD7
Wire Wire Line
	7900 2500 7600 2500
Wire Wire Line
	7900 2600 7600 2600
Wire Wire Line
	7900 2700 7600 2700
Text Label 7600 2500 0    50   ~ 0
BUSCP
Wire Wire Line
	7900 2900 7600 2900
Wire Wire Line
	7900 3000 7600 3000
Wire Wire Line
	7900 3100 7850 3100
Wire Wire Line
	7900 3200 7850 3200
Text Label 7600 2900 0    50   ~ 0
~WCV1
Text Label 7600 3000 0    50   ~ 0
~WCV2
Text Label 7600 2700 0    50   ~ 0
~RCV2
Text Label 7600 3200 0    50   ~ 0
~CVOE
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CFB1
P 3450 5700
AR Path="/66D4CFB1" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CFB1" Ref="J4"  Part="1" 
F 0 "J4" H 3450 6826 50  0000 C CNN
F 1 "cft-dfp-pod" H 3450 6900 50  0001 C CNN
F 2 "alexios:CFT-2020-DFP-RevB-Bus-Pod-44pin" H 3450 4400 50  0001 C CNN
F 3 "" H 3450 5700 50  0001 C CNN
	1    3450 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CFB7
P 2850 6850
AR Path="/66D4CFB7" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFB7" Ref="#PWR0212"  Part="1" 
F 0 "#PWR0212" H 2850 6600 50  0001 C CNN
F 1 "GND" H 2855 6677 50  0000 C CNN
F 2 "" H 2850 6850 50  0001 C CNN
F 3 "" H 2850 6850 50  0001 C CNN
	1    2850 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6800 2850 6800
Wire Wire Line
	2850 6800 2850 6850
$Comp
L power:+5V #PWR?
U 1 1 66D4CFBF
P 2850 4750
AR Path="/66D4CFBF" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFBF" Ref="#PWR0213"  Part="1" 
F 0 "#PWR0213" H 2850 4600 50  0001 C CNN
F 1 "+5V" H 2865 4923 50  0000 C CNN
F 2 "" H 2850 4750 50  0001 C CNN
F 3 "" H 2850 4750 50  0001 C CNN
	1    2850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4750 2850 4800
Wire Wire Line
	2850 4800 2900 4800
Wire Wire Line
	2900 5000 2600 5000
Wire Wire Line
	2900 5100 2600 5100
Wire Wire Line
	2900 5200 2600 5200
Wire Wire Line
	2900 5300 2600 5300
Wire Wire Line
	2900 5400 2600 5400
Wire Wire Line
	2900 5500 2600 5500
Wire Wire Line
	2900 5600 2600 5600
Wire Wire Line
	2900 5700 2600 5700
Text Label 2600 5000 0    50   ~ 0
FPD0
Text Label 2600 5100 0    50   ~ 0
FPD1
Text Label 2600 5200 0    50   ~ 0
FPD2
Text Label 2600 5300 0    50   ~ 0
FPD3
Text Label 2600 5400 0    50   ~ 0
FPD4
Text Label 2600 5500 0    50   ~ 0
FPD5
Text Label 2600 5600 0    50   ~ 0
FPD6
Text Label 2600 5700 0    50   ~ 0
FPD7
Wire Wire Line
	4350 5000 4000 5000
Wire Wire Line
	4000 5100 4350 5100
Wire Wire Line
	4000 5200 4350 5200
Wire Wire Line
	4000 5300 4350 5300
Wire Wire Line
	4000 5400 4350 5400
Wire Wire Line
	4000 5500 4350 5500
Wire Wire Line
	4000 5600 4350 5600
Wire Wire Line
	4000 5700 4350 5700
$Comp
L alexios:cft-dfp-pod P?
U 1 1 66D4CFDF
P 5950 5700
AR Path="/66D4CFDF" Ref="P?"  Part="1" 
AR Path="/66CDCD87/66D4CFDF" Ref="J6"  Part="1" 
F 0 "J6" H 5950 6826 50  0000 C CNN
F 1 "cft-dfp-pod" H 5950 6900 50  0001 C CNN
F 2 "alexios:CFT-2020-DFP-RevB-Bus-Pod-44pin" H 5950 4400 50  0001 C CNN
F 3 "" H 5950 5700 50  0001 C CNN
	1    5950 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66D4CFE5
P 5350 6850
AR Path="/66D4CFE5" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFE5" Ref="#PWR0214"  Part="1" 
F 0 "#PWR0214" H 5350 6600 50  0001 C CNN
F 1 "GND" H 5355 6677 50  0000 C CNN
F 2 "" H 5350 6850 50  0001 C CNN
F 3 "" H 5350 6850 50  0001 C CNN
	1    5350 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6800 5350 6800
Wire Wire Line
	5350 6800 5350 6850
$Comp
L power:+5V #PWR?
U 1 1 66D4CFED
P 5350 4750
AR Path="/66D4CFED" Ref="#PWR?"  Part="1" 
AR Path="/66CDCD87/66D4CFED" Ref="#PWR0215"  Part="1" 
F 0 "#PWR0215" H 5350 4600 50  0001 C CNN
F 1 "+5V" H 5365 4923 50  0000 C CNN
F 2 "" H 5350 4750 50  0001 C CNN
F 3 "" H 5350 4750 50  0001 C CNN
	1    5350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4750 5350 4800
Wire Wire Line
	5350 4800 5400 4800
Wire Wire Line
	5400 5000 5100 5000
Wire Wire Line
	5400 5100 5100 5100
Wire Wire Line
	5400 5200 5100 5200
Wire Wire Line
	5400 5300 5100 5300
Wire Wire Line
	5400 5400 5100 5400
Wire Wire Line
	5400 5500 5100 5500
Wire Wire Line
	5400 5600 5100 5600
Wire Wire Line
	5400 5700 5100 5700
Text Label 5100 5000 0    50   ~ 0
FPD0
Text Label 5100 5100 0    50   ~ 0
FPD1
Text Label 5100 5200 0    50   ~ 0
FPD2
Text Label 5100 5300 0    50   ~ 0
FPD3
Text Label 5100 5400 0    50   ~ 0
FPD4
Text Label 5100 5500 0    50   ~ 0
FPD5
Text Label 5100 5600 0    50   ~ 0
FPD6
Text Label 5100 5700 0    50   ~ 0
FPD7
Wire Wire Line
	4000 5900 4350 5900
Wire Wire Line
	4000 6000 4350 6000
Wire Wire Line
	4000 6100 4350 6100
Wire Wire Line
	4000 6200 4350 6200
Wire Wire Line
	4000 6300 4350 6300
Wire Wire Line
	4000 6400 4350 6400
Wire Wire Line
	4000 6500 4350 6500
Wire Wire Line
	4000 6600 4350 6600
Wire Wire Line
	2900 5900 2600 5900
Wire Wire Line
	2900 6000 2600 6000
Wire Wire Line
	2900 6100 2600 6100
Text Label 2600 5900 0    50   ~ 0
BUSCP
Wire Wire Line
	2900 6300 2600 6300
Wire Wire Line
	2900 6400 2600 6400
Wire Wire Line
	2900 6500 2850 6500
Text Label 1850 6600 0    50   ~ 0
~DBOE
Text Label 2600 6300 0    50   ~ 0
~WDB0
Text Label 2600 6400 0    50   ~ 0
~WDB1
Text Label 2600 6000 0    50   ~ 0
~RDB0
Text Label 2600 6100 0    50   ~ 0
~RDB1
Wire Wire Line
	2900 6600 2850 6600
Wire Wire Line
	2850 6500 2850 6600
Connection ~ 2850 6600
Wire Wire Line
	2850 6600 2400 6600
Wire Wire Line
	5400 5900 5100 5900
Wire Wire Line
	5400 6000 5100 6000
Wire Wire Line
	5400 6100 5100 6100
Text Label 5100 5900 0    50   ~ 0
BUSCP
Wire Wire Line
	5400 6300 5100 6300
Wire Wire Line
	5400 6400 5100 6400
Wire Wire Line
	5400 6500 5350 6500
Text Label 4600 6600 0    50   ~ 0
~IBOE
Text Label 5100 6300 0    50   ~ 0
~WIB0
Text Label 5100 6400 0    50   ~ 0
~WIB1
Text Label 5100 6000 0    50   ~ 0
~RIB0
Text Label 5100 6100 0    50   ~ 0
~RIB1
Wire Wire Line
	5400 6600 5350 6600
Wire Wire Line
	5350 6500 5350 6600
Connection ~ 5350 6600
Wire Wire Line
	6850 5000 6500 5000
Wire Wire Line
	6500 5100 6850 5100
Wire Wire Line
	6500 5200 6850 5200
Wire Wire Line
	6500 5300 6850 5300
Wire Wire Line
	6500 5400 6850 5400
Wire Wire Line
	6500 5500 6850 5500
Wire Wire Line
	6500 5600 6850 5600
Wire Wire Line
	6500 5700 6850 5700
Wire Wire Line
	6500 5900 6850 5900
Wire Wire Line
	6500 6000 6850 6000
Wire Wire Line
	6500 6100 6850 6100
Wire Wire Line
	6500 6200 6850 6200
Wire Wire Line
	6500 6300 6850 6300
Wire Wire Line
	6500 6400 6850 6400
Wire Wire Line
	6500 6500 6850 6500
Wire Wire Line
	6500 6600 6850 6600
Wire Wire Line
	9350 1600 9000 1600
Wire Wire Line
	9000 1700 9350 1700
Wire Wire Line
	9000 1800 9350 1800
Wire Wire Line
	9000 1900 9350 1900
Wire Wire Line
	9000 2000 9350 2000
Text Label 9350 1600 2    50   ~ 0
WADDR0
Text Label 9350 1700 2    50   ~ 0
WADDR1
Text Label 9350 1800 2    50   ~ 0
WADDR2
Text Label 9350 1900 2    50   ~ 0
WADDR3
Text Label 9350 2000 2    50   ~ 0
WADDR4
Wire Wire Line
	9000 2900 9050 2900
Wire Wire Line
	9000 3000 9050 3000
Wire Wire Line
	9000 3100 9050 3100
NoConn ~ 9050 2900
NoConn ~ 9050 3000
NoConn ~ 9050 3100
Text Label 7600 2600 0    50   ~ 0
~RCV1
Wire Wire Line
	7850 3100 7850 3200
Connection ~ 7850 3200
Wire Wire Line
	7850 3200 7600 3200
Text Notes 2750 1000 0    100  ~ 20
Address Bus 0–15
Text Notes 5200 1000 0    100  ~ 20
Address Bus 16–23\nControl Bus (RADDR)
Text Notes 7750 1000 0    100  ~ 20
Control Bus (WADDR,\nACTION & COND)
Text Notes 3100 4400 0    100  ~ 20
Data Bus
Text Notes 5800 4400 0    100  ~ 20
IBus
Wire Wire Line
	2900 2300 2600 2300
Wire Wire Line
	2900 2200 2600 2200
Wire Wire Line
	2900 2100 2600 2100
Wire Wire Line
	2900 2000 2600 2000
Wire Wire Line
	2900 1900 2600 1900
Wire Wire Line
	2900 1800 2600 1800
Wire Wire Line
	2900 1700 2600 1700
Wire Wire Line
	2900 1600 2600 1600
Entry Bus Bus
	2400 1300 2500 1400
Entry Wire Line
	2500 1500 2600 1600
Entry Wire Line
	2500 1600 2600 1700
Entry Wire Line
	2500 1700 2600 1800
Entry Wire Line
	2500 1800 2600 1900
Entry Wire Line
	2500 1900 2600 2000
Entry Wire Line
	2500 2000 2600 2100
Entry Wire Line
	2500 2100 2600 2200
Entry Wire Line
	2500 2200 2600 2300
Wire Wire Line
	2900 2700 2600 2700
Wire Wire Line
	2900 2600 2600 2600
Wire Wire Line
	2900 2500 2350 2500
Text HLabel 10300 950  2    50   BiDi ~ 0
AB[0..23]
Text HLabel 10300 1150 2    50   BiDi ~ 0
RADDR[0..4]
Text HLabel 10300 1250 2    50   BiDi ~ 0
WADDR[0..4]
Text HLabel 10300 1350 2    50   BiDi ~ 0
ACTION[0..3]
Text HLabel 10300 1650 2    50   BiDi ~ 0
DB[0..15]
Text HLabel 10300 1850 2    50   BiDi ~ 0
IBUS[0..15]
Wire Bus Line
	10300 950  9800 950 
Wire Bus Line
	10300 1150 9800 1150
Wire Bus Line
	10300 1250 9800 1250
Wire Bus Line
	10300 1350 9800 1350
Wire Bus Line
	10300 1650 9800 1650
Wire Bus Line
	10300 1850 9800 1850
Text Label 9800 950  0    50   ~ 0
AB[0..23]
Text Label 9800 1150 0    50   ~ 0
RADDR[0..4]
Text Label 9800 1250 0    50   ~ 0
WADDR[0..4]
Text Label 9800 1350 0    50   ~ 0
ACTION[0..3]
Text Label 9800 1650 0    50   ~ 0
DB[0..15]
Text Label 9800 1850 0    50   ~ 0
IBUS[0..15]
$Comp
L Device:R_Small R9
U 1 1 6042C115
P 2350 2300
F 0 "R9" H 2292 2346 50  0000 R CNN
F 1 "10kΩ" H 2292 2255 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2350 2300 50  0001 C CNN
F 3 "~" H 2350 2300 50  0001 C CNN
	1    2350 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2400 2350 2500
Connection ~ 2350 2500
Wire Wire Line
	2350 2500 1850 2500
$Comp
L power:+5V #PWR0216
U 1 1 60442D32
P 2350 2200
F 0 "#PWR0216" H 2350 2050 50  0001 C CNN
F 1 "+5V" H 2365 2373 50  0000 C CNN
F 2 "" H 2350 2200 50  0001 C CNN
F 3 "" H 2350 2200 50  0001 C CNN
	1    2350 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R10
U 1 1 6045B0F4
P 2350 3000
F 0 "R10" H 2292 3046 50  0000 R CNN
F 1 "10kΩ" H 2292 2955 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2350 3000 50  0001 C CNN
F 3 "~" H 2350 3000 50  0001 C CNN
	1    2350 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0217
U 1 1 6045B0FB
P 2350 2900
F 0 "#PWR0217" H 2350 2750 50  0001 C CNN
F 1 "+5V" H 2365 3073 50  0000 C CNN
F 2 "" H 2350 2900 50  0001 C CNN
F 3 "" H 2350 2900 50  0001 C CNN
	1    2350 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3100 2350 3200
Connection ~ 2350 3200
Wire Wire Line
	2350 3200 1850 3200
Wire Wire Line
	5400 3200 4900 3200
Text Label 4600 3200 0    50   ~ 0
~CVOE
Wire Wire Line
	5400 3100 5100 3100
Text Label 5100 3100 0    50   ~ 0
~ABOE
$Comp
L Device:R_Small R12
U 1 1 604CE3BB
P 4900 3000
F 0 "R12" H 4842 3046 50  0000 R CNN
F 1 "10kΩ" H 4842 2955 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4900 3000 50  0001 C CNN
F 3 "~" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0218
U 1 1 604CE3C1
P 4900 2900
F 0 "#PWR0218" H 4900 2750 50  0001 C CNN
F 1 "+5V" H 4915 3073 50  0000 C CNN
F 2 "" H 4900 2900 50  0001 C CNN
F 3 "" H 4900 2900 50  0001 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3100 4900 3200
Connection ~ 4900 3200
Wire Wire Line
	4900 3200 4600 3200
$Comp
L Device:R_Small R11
U 1 1 6052AC8B
P 2400 6400
F 0 "R11" H 2342 6446 50  0000 R CNN
F 1 "10kΩ" H 2342 6355 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 6400 50  0001 C CNN
F 3 "~" H 2400 6400 50  0001 C CNN
	1    2400 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0219
U 1 1 6052AC91
P 2400 6300
F 0 "#PWR0219" H 2400 6150 50  0001 C CNN
F 1 "+5V" H 2415 6473 50  0000 C CNN
F 2 "" H 2400 6300 50  0001 C CNN
F 3 "" H 2400 6300 50  0001 C CNN
	1    2400 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6500 2400 6600
Connection ~ 2400 6600
Wire Wire Line
	2400 6600 1850 6600
Wire Wire Line
	4600 6600 4950 6600
$Comp
L Device:R_Small R13
U 1 1 605720CE
P 4950 6400
F 0 "R13" H 4892 6446 50  0000 R CNN
F 1 "10kΩ" H 4892 6355 50  0000 R CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 6400 50  0001 C CNN
F 3 "~" H 4950 6400 50  0001 C CNN
	1    4950 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0220
U 1 1 605720D4
P 4950 6300
F 0 "#PWR0220" H 4950 6150 50  0001 C CNN
F 1 "+5V" H 4965 6473 50  0000 C CNN
F 2 "" H 4950 6300 50  0001 C CNN
F 3 "" H 4950 6300 50  0001 C CNN
	1    4950 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6500 4950 6600
Connection ~ 4950 6600
Wire Wire Line
	4950 6600 5350 6600
Text Label 1300 1300 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	1250 1450 1500 1450
Text Label 1500 1950 2    50   ~ 0
~IBOE
Text Label 1500 1850 2    50   ~ 0
~DBOE
Text Label 1500 1750 2    50   ~ 0
~CVOE
Text Label 1500 1650 2    50   ~ 0
~ABOE
Wire Wire Line
	1250 1950 1500 1950
Wire Wire Line
	1250 1850 1500 1850
Wire Wire Line
	1250 1750 1500 1750
Wire Wire Line
	1250 1650 1500 1650
Text HLabel 1250 1950 0    50   Input ~ 0
~IBOE
Text HLabel 1250 1850 0    50   Input ~ 0
~DBOE
Text HLabel 1250 1750 0    50   Input ~ 0
~CVOE
Text HLabel 1250 1650 0    50   Input ~ 0
~ABOE
Text Label 1500 4800 2    50   ~ 0
~WIB1
Text Label 1500 4700 2    50   ~ 0
~WIB0
Text Label 1500 4500 2    50   ~ 0
~RIB1
Text Label 1500 4400 2    50   ~ 0
~RIB0
Text Label 1500 4200 2    50   ~ 0
~WDB1
Text Label 1500 4100 2    50   ~ 0
~WDB0
Text Label 1500 3900 2    50   ~ 0
~RDB1
Text Label 1500 3800 2    50   ~ 0
~RDB0
Text Label 1500 3550 2    50   ~ 0
~WCV2
Text Label 1500 3450 2    50   ~ 0
~WCV1
Text Label 1500 3350 2    50   ~ 0
~WCV0
Text Label 1500 3150 2    50   ~ 0
~RCV2
Text Label 1500 3050 2    50   ~ 0
~RCV1
Text Label 1500 2950 2    50   ~ 0
~RCV0
Text Label 1500 2750 2    50   ~ 0
~WAB2
Text Label 1500 2650 2    50   ~ 0
~WAB1
Text Label 1500 2550 2    50   ~ 0
~WAB0
Text Label 1500 2350 2    50   ~ 0
~RAB2
Text Label 1500 2250 2    50   ~ 0
~RAB1
Text Label 1500 2150 2    50   ~ 0
~RAB0
Text Label 1500 1450 2    50   ~ 0
BUSCP
Wire Wire Line
	1250 4800 1500 4800
Wire Wire Line
	1250 4700 1500 4700
Wire Wire Line
	1250 4500 1500 4500
Wire Wire Line
	1250 4400 1500 4400
Wire Wire Line
	1250 4200 1500 4200
Wire Wire Line
	1250 4100 1500 4100
Wire Wire Line
	1250 3900 1500 3900
Wire Wire Line
	1250 3800 1500 3800
Wire Wire Line
	1250 3550 1500 3550
Wire Wire Line
	1250 3450 1500 3450
Wire Wire Line
	1250 3350 1500 3350
Wire Wire Line
	1250 3150 1500 3150
Wire Wire Line
	1250 3050 1500 3050
Wire Wire Line
	1250 2950 1500 2950
Wire Wire Line
	1250 2750 1500 2750
Wire Wire Line
	1250 2650 1500 2650
Wire Wire Line
	1250 2550 1500 2550
Wire Wire Line
	1250 2350 1500 2350
Wire Wire Line
	1250 2250 1500 2250
Wire Wire Line
	1250 2150 1500 2150
Text HLabel 1250 4800 0    50   Input ~ 0
~WIB1
Text HLabel 1250 4700 0    50   Input ~ 0
~WIB0
Text HLabel 1250 4500 0    50   Input ~ 0
~RIB1
Text HLabel 1250 4400 0    50   Input ~ 0
~RIB0
Text HLabel 1250 4200 0    50   Input ~ 0
~WDB1
Text HLabel 1250 4100 0    50   Input ~ 0
~WDB0
Text HLabel 1250 3900 0    50   Input ~ 0
~RDB1
Text HLabel 1250 3800 0    50   Input ~ 0
~RDB0
Text HLabel 1250 3550 0    50   Input ~ 0
~WCV2
Text HLabel 1250 3450 0    50   Input ~ 0
~WCV1
Text HLabel 1250 3350 0    50   Input ~ 0
~WCV0
Text HLabel 1250 3150 0    50   Input ~ 0
~RCV2
Text HLabel 1250 3050 0    50   Input ~ 0
~RCV1
Text HLabel 1250 2950 0    50   Input ~ 0
~RCV0
Text HLabel 1250 2750 0    50   Input ~ 0
~WAB2
Text HLabel 1250 2650 0    50   Input ~ 0
~WAB1
Text HLabel 1250 2550 0    50   Input ~ 0
~WAB0
Text HLabel 1250 2350 0    50   Input ~ 0
~RAB2
Text HLabel 1250 2250 0    50   Input ~ 0
~RAB1
Text HLabel 1250 2150 0    50   Input ~ 0
~RAB0
Text HLabel 1250 1450 0    50   Input ~ 0
BUSCP
Wire Bus Line
	1250 1300 2400 1300
Text HLabel 1250 1300 0    50   BiDi ~ 0
FPD[0..7]
$Sheet
S 8600 3950 500  400 
U 60FF3530
F0 "sheet60FF352C" 50
F1 "cft_boardled.sch" 50
F2 "~LED1" I L 8600 4100 50 
F3 "~LED2" I L 8600 4200 50 
$EndSheet
Wire Wire Line
	8600 4100 8300 4100
Wire Wire Line
	8600 4200 8300 4200
Text Label 8300 4100 0    50   ~ 0
~ABOE
Text Label 8300 4200 0    50   ~ 0
~CVOE
$Sheet
S 8600 4700 500  400 
U 610E2BBB
F0 "sheet610E2BB7" 50
F1 "cft_boardled.sch" 50
F2 "~LED1" I L 8600 4850 50 
F3 "~LED2" I L 8600 4950 50 
$EndSheet
Wire Wire Line
	8600 4850 8300 4850
Wire Wire Line
	8600 4950 8300 4950
Text Label 8300 4850 0    50   ~ 0
~DBOE
Text Label 8300 4950 0    50   ~ 0
~IBOE
Wire Wire Line
	9000 3200 9050 3200
NoConn ~ 9050 3200
Text Notes 9200 3200 0    50   ~ 0
There is no COND[0..3] I/O because that\nfield is local to the CTL board.
NoConn ~ 9000 2100
NoConn ~ 9000 2200
NoConn ~ 9000 2300
Wire Bus Line
	2500 1400 2500 2200
$EndSCHEMATC
