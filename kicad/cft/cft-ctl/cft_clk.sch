EESchema Schematic File Version 4
LIBS:cft-ctl-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 13
Title "Clock Generator"
Date ""
Rev ""
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 "clock.v"
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5E3810F5
P 2950 4600
AR Path="/5CC0D65F/5E3810F5" Ref="C?"  Part="1" 
AR Path="/5E3810F5" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3810F5" Ref="C25"  Part="1" 
F 0 "C25" H 2859 4646 50  0000 R CNN
F 1 "100nF" H 2859 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 4600 50  0001 C CNN
F 3 "~" H 2950 4600 50  0001 C CNN
	1    2950 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3810FB
P 2750 4800
AR Path="/5E3810FB" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3810FB" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 2750 4550 50  0001 C CNN
F 1 "GND" H 2600 4750 50  0000 C CNN
F 2 "" H 2750 4800 50  0001 C CNN
F 3 "" H 2750 4800 50  0001 C CNN
	1    2750 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E381101
P 2750 4400
AR Path="/5E381101" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381101" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 2750 4250 50  0001 C CNN
F 1 "+5V" H 2765 4573 50  0000 C CNN
F 2 "" H 2750 4400 50  0001 C CNN
F 3 "" H 2750 4400 50  0001 C CNN
	1    2750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4500 2950 4450
Wire Wire Line
	3100 4450 2950 4450
Connection ~ 2950 4450
Wire Wire Line
	2950 4700 2950 4750
Wire Wire Line
	3100 4750 2950 4750
Connection ~ 2950 4750
$Comp
L Device:C_Small C?
U 1 1 5E381133
P 2500 4600
AR Path="/5CC0D65F/5E381133" Ref="C?"  Part="1" 
AR Path="/5E381133" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E381133" Ref="C24"  Part="1" 
F 0 "C24" H 2409 4646 50  0000 R CNN
F 1 "10µF" H 2409 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2500 4600 50  0001 C CNN
F 3 "~" H 2500 4600 50  0001 C CNN
	1    2500 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4450 2750 4450
Wire Wire Line
	2500 4750 2750 4750
Wire Wire Line
	2750 4400 2750 4450
Connection ~ 2750 4450
Wire Wire Line
	2750 4450 2950 4450
Wire Wire Line
	2750 4800 2750 4750
Connection ~ 2750 4750
Wire Wire Line
	2750 4750 2950 4750
Text Label 3950 4600 0    50   ~ 0
CLK
Wire Wire Line
	2500 4700 2500 4750
Wire Wire Line
	2500 4500 2500 4450
Text Label 1550 3300 0    50   ~ 0
FPCLK
Text Label 6200 4100 2    50   ~ 0
~RESET
Text HLabel 1500 3300 0    50   Input ~ 0
FPCLK
Wire Wire Line
	6400 3600 6350 3600
Wire Wire Line
	6350 3600 6350 3700
$Comp
L power:GND #PWR?
U 1 1 5E381174
P 6350 4600
AR Path="/5E381174" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381174" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 6350 4350 50  0001 C CNN
F 1 "GND" H 6355 4427 50  0000 C CNN
F 2 "" H 6350 4600 50  0001 C CNN
F 3 "" H 6350 4600 50  0001 C CNN
	1    6350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3700 6350 3700
Connection ~ 6350 3700
Wire Wire Line
	6350 3700 6350 3800
Wire Wire Line
	6400 3800 6350 3800
Connection ~ 6350 3800
Wire Wire Line
	6350 3800 6350 3900
Wire Wire Line
	6400 3900 6350 3900
Connection ~ 6350 3900
NoConn ~ 7400 3800
NoConn ~ 7400 3900
NoConn ~ 7400 4300
NoConn ~ 7400 4100
$Comp
L alexios:74HC139 U?
U 2 1 5E38119D
P 8400 4500
AR Path="/5E38119D" Ref="U?"  Part="2" 
AR Path="/5E36D9C8/5E38119D" Ref="U36"  Part="2" 
F 0 "U36" H 8400 4867 50  0000 C CNN
F 1 "74HC139" H 8400 4776 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8400 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8400 4500 50  0001 C CNN
	2    8400 4500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC139 U?
U 3 1 5E3811A3
P 4600 7400
AR Path="/5E3811A3" Ref="U?"  Part="3" 
AR Path="/5E36D9C8/5E3811A3" Ref="U36"  Part="3" 
F 0 "U36" H 4780 7446 50  0000 L CNN
F 1 "74HC139" H 4780 7355 50  0000 L CNN
F 2 "alexios:SOIC-16" H 4600 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4600 7400 50  0001 C CNN
	3    4600 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3811AF
P 7850 4750
AR Path="/5E3811AF" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811AF" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 7850 4500 50  0001 C CNN
F 1 "GND" H 7855 4577 50  0000 C CNN
F 2 "" H 7850 4750 50  0001 C CNN
F 3 "" H 7850 4750 50  0001 C CNN
	1    7850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4500 7850 4500
Wire Wire Line
	7850 4500 7850 4700
Wire Wire Line
	7900 4700 7850 4700
Connection ~ 7850 4700
Wire Wire Line
	7850 4700 7850 4750
Wire Wire Line
	7400 3700 7700 3700
NoConn ~ 8900 4400
NoConn ~ 8900 4700
$Comp
L power:GND #PWR?
U 1 1 5E3811BF
P 2850 7500
AR Path="/5E3811BF" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811BF" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 2850 7250 50  0001 C CNN
F 1 "GND" H 2855 7327 50  0000 C CNN
F 2 "" H 2850 7500 50  0001 C CNN
F 3 "" H 2850 7500 50  0001 C CNN
	1    2850 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3811C5
P 4250 7500
AR Path="/5E3811C5" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811C5" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 4250 7250 50  0001 C CNN
F 1 "GND" H 4255 7327 50  0000 C CNN
F 2 "" H 4250 7500 50  0001 C CNN
F 3 "" H 4250 7500 50  0001 C CNN
	1    4250 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E3811CB
P 4250 7300
AR Path="/5E3811CB" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811CB" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 4250 7150 50  0001 C CNN
F 1 "+5V" H 4265 7473 50  0000 C CNN
F 2 "" H 4250 7300 50  0001 C CNN
F 3 "" H 4250 7300 50  0001 C CNN
	1    4250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3811D1
P 2850 7400
AR Path="/5CC0D65F/5E3811D1" Ref="C?"  Part="1" 
AR Path="/5E3811D1" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3811D1" Ref="C30"  Part="1" 
F 0 "C30" H 2759 7446 50  0000 R CNN
F 1 "100nF" H 2759 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2850 7400 50  0001 C CNN
F 3 "~" H 2850 7400 50  0001 C CNN
	1    2850 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E3811D7
P 4250 7400
AR Path="/5CC0D65F/5E3811D7" Ref="C?"  Part="1" 
AR Path="/5E3811D7" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E3811D7" Ref="C31"  Part="1" 
F 0 "C31" H 4159 7446 50  0000 R CNN
F 1 "100nF" H 4159 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4250 7400 50  0001 C CNN
F 3 "~" H 4250 7400 50  0001 C CNN
	1    4250 7400
	1    0    0    -1  
$EndComp
Connection ~ 4250 7300
Connection ~ 4250 7500
$Comp
L power:+5V #PWR?
U 1 1 5E3811E1
P 2850 7300
AR Path="/5E3811E1" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E3811E1" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 2850 7150 50  0001 C CNN
F 1 "+5V" H 2865 7473 50  0000 C CNN
F 2 "" H 2850 7300 50  0001 C CNN
F 3 "" H 2850 7300 50  0001 C CNN
	1    2850 7300
	1    0    0    -1  
$EndComp
Text Label 7750 3600 0    50   ~ 0
÷2
Text Label 7750 3700 0    50   ~ 0
÷4
Wire Wire Line
	8900 3600 10000 3600
Wire Wire Line
	8900 3700 10000 3700
Wire Wire Line
	8900 3800 9450 3800
$Comp
L alexios:74HC139 U?
U 1 1 5E3811EE
P 8400 3700
AR Path="/5E3811EE" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5E3811EE" Ref="U36"  Part="1" 
F 0 "U36" H 8400 4067 50  0000 C CNN
F 1 "74HC139" H 8400 3976 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8400 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8400 3700 50  0001 C CNN
	1    8400 3700
	1    0    0    -1  
$EndComp
Text HLabel 10800 3600 2    50   Output ~ 0
CLK1
Text HLabel 10800 3700 2    50   Output ~ 0
CLK2
Text HLabel 10800 3800 2    50   Output ~ 0
CLK3
Text HLabel 10800 3900 2    50   Output ~ 0
CLK4
Wire Wire Line
	7700 4400 7900 4400
Wire Wire Line
	7900 3900 7850 3900
Wire Wire Line
	7850 3900 7850 3950
$Comp
L power:GND #PWR?
U 1 1 5E381202
P 7850 3950
AR Path="/5E381202" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381202" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 7850 3700 50  0001 C CNN
F 1 "GND" H 7855 3777 50  0000 C CNN
F 2 "" H 7850 3950 50  0001 C CNN
F 3 "" H 7850 3950 50  0001 C CNN
	1    7850 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4500 10000 4500
Text Label 9000 4500 0    50   ~ 0
T34₀
Text HLabel 10800 4500 2    50   Output ~ 0
T34
Wire Wire Line
	4600 4100 4600 3200
Wire Wire Line
	4600 3200 4250 3200
$Comp
L Device:C_Small C?
U 1 1 5CF0ABAA
P 800 7350
AR Path="/5CC0D65F/5CF0ABAA" Ref="C?"  Part="1" 
AR Path="/5CF0ABAA" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5CF0ABAA" Ref="C28"  Part="1" 
F 0 "C28" H 709 7396 50  0000 R CNN
F 1 "47µF" H 709 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 800 7350 50  0001 C CNN
F 3 "~" H 800 7350 50  0001 C CNN
	1    800  7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR091
U 1 1 5CF0BF5E
P 800 7250
F 0 "#PWR091" H 800 7100 50  0001 C CNN
F 1 "+5V" H 815 7423 50  0000 C CNN
F 2 "" H 800 7250 50  0001 C CNN
F 3 "" H 800 7250 50  0001 C CNN
	1    800  7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR096
U 1 1 5CF0C819
P 800 7450
F 0 "#PWR096" H 800 7200 50  0001 C CNN
F 1 "GND" H 805 7277 50  0000 C CNN
F 2 "" H 800 7450 50  0001 C CNN
F 3 "" H 800 7450 50  0001 C CNN
	1    800  7450
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC590 U?
U 1 1 5D0FD6BA
P 8250 1350
AR Path="/5E4DDD44/5D0FD6BA" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D0FD6BA" Ref="U34"  Part="1" 
F 0 "U34" H 8250 775 50  0000 C CNN
F 1 "74HC590" H 8250 684 50  0000 C CNN
F 2 "alexios:SOIC-16" H 8250 1400 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 8250 1400 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 1150 7700 1150
Wire Wire Line
	8900 600  8900 1550
Wire Wire Line
	8900 1550 8750 1550
NoConn ~ 8750 850 
NoConn ~ 8750 950 
NoConn ~ 8750 1050
NoConn ~ 8750 1150
NoConn ~ 8750 1250
NoConn ~ 8750 1350
NoConn ~ 8750 1450
$Comp
L alexios:74HC590 U34
U 2 1 5D0FD6CB
P 5950 7750
F 0 "U34" H 6130 8146 50  0000 L CNN
F 1 "74HC590" H 6130 8055 50  0000 L CNN
F 2 "alexios:SOIC-16" H 5950 7800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 5950 7800 50  0001 C CNN
	2    5950 7750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR095
U 1 1 5D0FD6D2
P 5600 7300
F 0 "#PWR095" H 5600 7150 50  0001 C CNN
F 1 "+5V" H 5615 7473 50  0000 C CNN
F 2 "" H 5600 7300 50  0001 C CNN
F 3 "" H 5600 7300 50  0001 C CNN
	1    5600 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0100
U 1 1 5D0FD6D8
P 5600 7500
F 0 "#PWR0100" H 5600 7250 50  0001 C CNN
F 1 "GND" H 5605 7327 50  0000 C CNN
F 2 "" H 5600 7500 50  0001 C CNN
F 3 "" H 5600 7500 50  0001 C CNN
	1    5600 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D0FD6DE
P 5600 7400
AR Path="/5CC0D65F/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D0FD6DE" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D0FD6DE" Ref="C32"  Part="1" 
F 0 "C32" H 5509 7446 50  0000 R CNN
F 1 "100nF" H 5509 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5600 7400 50  0001 C CNN
F 3 "~" H 5600 7400 50  0001 C CNN
	1    5600 7400
	1    0    0    -1  
$EndComp
Connection ~ 5600 7300
Connection ~ 5600 7500
Wire Wire Line
	8900 1550 8950 1550
Connection ~ 8900 1550
$Comp
L Device:R_Small R14
U 1 1 5D0FD6E9
P 9400 1550
F 0 "R14" V 9204 1550 50  0000 C CNN
F 1 "30Ω" V 9295 1550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9400 1550 50  0001 C CNN
F 3 "~" H 9400 1550 50  0001 C CNN
	1    9400 1550
	0    1    1    0   
$EndComp
Text Label 9800 1550 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	7700 600  8900 600 
Wire Wire Line
	7700 850  7700 600 
Wire Wire Line
	7750 850  7700 850 
Text HLabel 10600 1550 2    50   Output ~ 0
~RSTHOLD
$Comp
L power:GND #PWR077
U 1 1 5D0FD6F6
P 7750 1750
F 0 "#PWR077" H 7750 1500 50  0001 C CNN
F 1 "GND" H 7755 1577 50  0000 C CNN
F 2 "" H 7750 1750 50  0001 C CNN
F 3 "" H 7750 1750 50  0001 C CNN
	1    7750 1750
	1    0    0    -1  
$EndComp
Text HLabel 1550 1450 0    50   3State ~ 0
~RESET
Text Label 7450 1050 0    50   ~ 0
CLK3
Text Label 7450 1350 0    50   ~ 0
~RESET
Wire Wire Line
	7750 1350 4250 1350
Wire Wire Line
	7700 1150 7700 1050
Connection ~ 7700 1050
Wire Wire Line
	7700 1050 7750 1050
Text HLabel 1500 2800 0    50   Input ~ 0
POWEROK
Text HLabel 1500 2500 0    50   Input ~ 0
~FPRESET
$Comp
L power:+5V #PWR?
U 1 1 5D127395
P 3050 1700
AR Path="/5E4DDD44/5D127395" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D127395" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 3050 1550 50  0001 C CNN
F 1 "+5V" H 3200 1750 50  0000 C CNN
F 2 "" H 3050 1700 50  0001 C CNN
F 3 "" H 3050 1700 50  0001 C CNN
	1    3050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1950 3150 1950
Wire Wire Line
	2900 1950 2950 1950
Connection ~ 3050 1950
$Comp
L power:+5V #PWR075
U 1 1 5D14C3C4
P 4250 1000
F 0 "#PWR075" H 4250 850 50  0001 C CNN
F 1 "+5V" H 4265 1173 50  0000 C CNN
F 2 "" H 4250 1000 50  0001 C CNN
F 3 "" H 4250 1000 50  0001 C CNN
	1    4250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1200 4250 1350
Connection ~ 4250 1350
$Comp
L Device:R_Small R?
U 1 1 5D150EAB
P 4250 1100
AR Path="/5E4DDD44/5D150EAB" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D150EAB" Ref="R13"  Part="1" 
F 0 "R13" H 4309 1146 50  0000 L CNN
F 1 "4.7kΩ" H 4309 1055 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 1100 50  0001 C CNN
F 3 "~" H 4250 1100 50  0001 C CNN
	1    4250 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3800 9450 3150
Wire Wire Line
	9450 3150 6900 3150
Wire Wire Line
	6900 3150 6900 1050
Connection ~ 9450 3800
Wire Wire Line
	9450 3800 10000 3800
Wire Wire Line
	6900 1050 7700 1050
$Comp
L alexios:tactile_switch SW1
U 1 1 5CF80B1C
P 2700 1950
F 0 "SW1" H 2700 2149 50  0000 C CNN
F 1 "tactile_switch" H 2700 1890 50  0001 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx39-2LFS" H 2700 2150 50  0001 C CNN
F 3 "" H 2700 2150 50  0001 C CNN
	1    2700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1900 3050 1950
Wire Wire Line
	2450 1950 2500 1950
$Comp
L power:GND #PWR078
U 1 1 5CFA0680
P 3150 2350
F 0 "#PWR078" H 3150 2100 50  0001 C CNN
F 1 "GND" H 3000 2300 50  0000 C CNN
F 2 "" H 3150 2350 50  0001 C CNN
F 3 "" H 3150 2350 50  0001 C CNN
	1    3150 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5CFC28E8
P 3150 2100
AR Path="/5CC0D65F/5CFC28E8" Ref="C?"  Part="1" 
AR Path="/5CFC28E8" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5CFC28E8" Ref="C23"  Part="1" 
F 0 "C23" H 3059 2146 50  0000 R CNN
F 1 "100nF" H 3059 2055 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3150 2100 50  0001 C CNN
F 3 "~" H 3150 2100 50  0001 C CNN
	1    3150 2100
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G17 U35
U 1 1 5CFCDA62
P 3550 1950
F 0 "U35" H 3500 1775 50  0000 C CNN
F 1 "74LVC1G17" H 3500 1684 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3550 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3550 1950 50  0001 C CNN
	1    3550 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5D12738E
P 3050 1800
AR Path="/5E4DDD44/5D12738E" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5D12738E" Ref="R15"  Part="1" 
F 0 "R15" H 3109 1846 50  0000 L CNN
F 1 "4.7kΩ" H 3109 1755 50  0000 L CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 1800 50  0001 C CNN
F 3 "~" H 3050 1800 50  0001 C CNN
	1    3050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2000 3150 1950
Connection ~ 3150 1950
Wire Wire Line
	3150 1950 3250 1950
Wire Wire Line
	2450 2250 2450 1950
Wire Wire Line
	3150 2200 3150 2250
Wire Wire Line
	3150 2250 2450 2250
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5D01818E
P 2200 1950
F 0 "J1" H 2200 1700 50  0000 C CNN
F 1 "Conn_01x02" H 2500 1900 50  0001 C CNN
F 2 "" H 2200 1950 50  0001 C CNN
F 3 "~" H 2200 1950 50  0001 C CNN
	1    2200 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 1950 2450 1950
Connection ~ 2450 1950
Wire Wire Line
	2400 1850 2450 1850
Wire Wire Line
	2450 1850 2450 1650
Wire Wire Line
	2450 1650 2950 1650
Wire Wire Line
	2950 1650 2950 1950
Connection ~ 2950 1950
Wire Wire Line
	2950 1950 3050 1950
Wire Wire Line
	4050 1950 4250 1950
Wire Wire Line
	4250 1950 4250 2500
Wire Wire Line
	4250 2800 4050 2800
Wire Wire Line
	4050 2500 4250 2500
Connection ~ 4250 2500
Wire Wire Line
	4250 2500 4250 2800
Wire Wire Line
	3150 2350 3150 2250
Connection ~ 3150 2250
Wire Wire Line
	4250 1950 4250 1450
Connection ~ 4250 1950
Wire Wire Line
	4250 2800 4250 3200
Connection ~ 4250 2800
NoConn ~ 8900 4600
Wire Wire Line
	7400 3600 7600 3600
Wire Wire Line
	7700 4400 7700 3700
Connection ~ 7700 3700
Wire Wire Line
	7700 3700 7900 3700
Text Label 7750 4400 0    50   ~ 0
÷4
Wire Notes Line style solid
	3250 6000 3700 6000
Wire Notes Line style solid
	3700 6000 3700 6050
Wire Notes Line style solid
	3700 6050 3850 6050
Wire Notes Line style solid
	3850 6050 3850 6000
Wire Notes Line style solid
	3850 6000 3900 6000
Wire Notes Line style solid
	3225 5900 3550 5900
Wire Notes Line style solid
	3550 5900 3550 5950
Wire Notes Line style solid
	3550 5950 3700 5950
Wire Notes Line style solid
	3700 5950 3700 5900
Wire Notes Line style solid
	3700 5900 3900 5900
Wire Notes Line style solid
	3225 5800 3400 5800
Wire Notes Line style solid
	3400 5800 3400 5850
Wire Notes Line style solid
	3400 5850 3550 5850
Wire Notes Line style solid
	3550 5850 3550 5800
Wire Notes Line style solid
	3550 5800 3900 5800
Wire Notes Line style solid
	3225 5700 3250 5700
Wire Notes Line style solid
	3250 5700 3250 5750
Wire Notes Line style solid
	3250 5750 3400 5750
Wire Notes Line style solid
	3250 6000 3250 6050
Wire Notes Line style solid
	3250 6050 3225 6050
Wire Notes Line style solid
	3850 5750 3900 5750
Wire Notes Line style solid
	3250 6100 3550 6100
Wire Notes Line style solid
	3550 6100 3550 6150
Wire Notes Line style solid
	3550 6150 3850 6150
Wire Notes Line style solid
	3850 6150 3850 6100
Wire Notes Line style solid
	3850 6100 3900 6100
Wire Notes Line style solid
	3250 6100 3250 6150
Wire Notes Line style solid
	3250 6150 3225 6150
Wire Notes Line style solid
	3225 5600 3225 5650
Text Notes 3200 5650 2    50   ~ 0
CLKIN
Text Notes 3200 6150 2    50   ~ 0
T34
Text Notes 3200 5850 2    50   ~ 0
CLK2
Text Notes 3200 5950 2    50   ~ 0
CLK3
Text Notes 3200 6050 2    50   ~ 0
CLK4
Text Notes 3200 5750 2    50   ~ 0
CLK1
Wire Notes Line style solid
	3725 6200 3735 6250
Wire Notes Line style solid
	3790 6250 3800 6200
Text Notes 3200 6250 2    50   ~ 0
WSTB
Wire Notes Line style solid
	3250 5650 3250 5600
Wire Notes Line style solid
	3225 5650 3250 5650
Wire Notes Line style solid
	3250 5600 3275 5600
Wire Notes Line style solid
	3400 5700 3850 5700
Wire Notes Line style solid
	3850 5700 3850 5750
Wire Notes Line style solid
	3400 5750 3400 5700
Wire Notes Line style solid
	3275 5600 3275 5650
Wire Notes Line style solid
	3300 5650 3300 5600
Wire Notes Line style solid
	3275 5650 3300 5650
Wire Notes Line style solid
	3300 5600 3325 5600
Wire Notes Line style solid
	3325 5600 3325 5650
Wire Notes Line style solid
	3350 5650 3350 5600
Wire Notes Line style solid
	3325 5650 3350 5650
Wire Notes Line style solid
	3350 5600 3375 5600
Wire Notes Line style solid
	3375 5600 3375 5650
Wire Notes Line style solid
	3400 5650 3400 5600
Wire Notes Line style solid
	3375 5650 3400 5650
Wire Notes Line style solid
	3400 5600 3425 5600
Wire Notes Line style solid
	3425 5600 3425 5650
Wire Notes Line style solid
	3450 5650 3450 5600
Wire Notes Line style solid
	3425 5650 3450 5650
Wire Notes Line style solid
	3450 5600 3475 5600
Wire Notes Line style solid
	3475 5600 3475 5650
Wire Notes Line style solid
	3500 5650 3500 5600
Wire Notes Line style solid
	3475 5650 3500 5650
Wire Notes Line style solid
	3500 5600 3525 5600
Wire Notes Line style solid
	3525 5600 3525 5650
Wire Notes Line style solid
	3550 5650 3550 5600
Wire Notes Line style solid
	3525 5650 3550 5650
Wire Notes Line style solid
	3550 5600 3575 5600
Wire Notes Line style solid
	3575 5600 3575 5650
Wire Notes Line style solid
	3600 5650 3600 5600
Wire Notes Line style solid
	3575 5650 3600 5650
Wire Notes Line style solid
	3600 5600 3625 5600
Wire Notes Line style solid
	3625 5600 3625 5650
Wire Notes Line style solid
	3650 5650 3650 5600
Wire Notes Line style solid
	3625 5650 3650 5650
Wire Notes Line style solid
	3650 5600 3675 5600
Wire Notes Line style solid
	3675 5600 3675 5650
Wire Notes Line style solid
	3700 5650 3700 5600
Wire Notes Line style solid
	3675 5650 3700 5650
Wire Notes Line style solid
	3700 5600 3725 5600
Wire Notes Line style solid
	3725 5600 3725 5650
Wire Notes Line style solid
	3750 5650 3750 5600
Wire Notes Line style solid
	3725 5650 3750 5650
Wire Notes Line style solid
	3750 5600 3775 5600
Wire Notes Line style solid
	3775 5600 3775 5650
Wire Notes Line style solid
	3800 5650 3800 5600
Wire Notes Line style solid
	3775 5650 3800 5650
Wire Notes Line style solid
	3800 5600 3825 5600
Wire Notes Line style solid
	3825 5600 3825 5650
Wire Notes Line style solid
	3850 5650 3850 5600
Wire Notes Line style solid
	3825 5650 3850 5650
Wire Notes Line style solid
	3850 5600 3875 5600
Wire Notes Line style solid
	3875 5600 3875 5650
Wire Notes Line style solid
	3900 5650 3900 5600
Wire Notes Line style solid
	3875 5650 3900 5650
Wire Notes Line style solid
	3815 6250 3825 6200
Wire Notes Line style solid
	3735 6250 3815 6250
Wire Notes Line style solid
	3760 6250 3750 6200
Wire Notes Line style solid
	3800 6200 3900 6200
Wire Notes Line style solid
	3250 6200 3750 6200
Wire Notes Line style solid
	3250 6200 3250 6250
Wire Notes Line style solid
	3250 6250 3225 6250
Text Notes 7650 2700 0    50   ~ 0
After a ~RESET~ pulse, the clock starts and we count 128 processor cycles.\nAt a 4 MHz clock, this is 32 µs. During this time, ~RSTHOLD~ is asserted, and\nmost of the processor units remain tri-stated and in reset while everything\nstabilises, capacitors are charged, etc.\n\nWhile ~RSTHOLD~ is low, the processor also performs its reset microprogram\nto initialise the PC with the boot vector.
Text Label 5050 4600 2    50   ~ 0
CLK
$Comp
L alexios:74LVC2G157 U38
U 1 1 5D640CB7
P 5500 4600
F 0 "U38" H 5500 4967 50  0000 C CNN
F 1 "74LVC2G157" H 5500 4876 50  0000 C CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 5400 4725 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 5400 4725 50  0001 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR086
U 1 1 5D665B60
P 5100 4850
F 0 "#PWR086" H 5100 4600 50  0001 C CNN
F 1 "GND" H 5105 4677 50  0000 C CNN
F 2 "" H 5100 4850 50  0001 C CNN
F 3 "" H 5100 4850 50  0001 C CNN
	1    5100 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4800 5100 4800
Wire Wire Line
	5100 4800 5100 4850
NoConn ~ 5850 4800
Wire Wire Line
	3900 4600 5150 4600
Wire Wire Line
	4500 4500 5150 4500
$Comp
L power:GND #PWR?
U 1 1 5E381226
P 3150 3650
AR Path="/5E381226" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E381226" Ref="#PWR080"  Part="1" 
F 0 "#PWR080" H 3150 3400 50  0001 C CNN
F 1 "GND" H 3155 3477 50  0000 C CNN
F 2 "" H 3150 3650 50  0001 C CNN
F 3 "" H 3150 3650 50  0001 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E38120E
P 3150 3550
AR Path="/5E38120E" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E38120E" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E38120E" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E38120E" Ref="R17"  Part="1" 
F 0 "R17" H 3092 3596 50  0000 R CNN
F 1 "4.7kΩ" H 3092 3505 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3150 3550 50  0001 C CNN
F 3 "~" H 3150 3550 50  0001 C CNN
	1    3150 3550
	1    0    0    -1  
$EndComp
Text HLabel 1500 3400 0    50   Input ~ 0
~FPCLK~⁄CLK
Text Label 1550 3400 0    50   ~ 0
~FPCLK~⁄CLK
$Comp
L power:+5V #PWR079
U 1 1 5D18908F
P 3300 3050
F 0 "#PWR079" H 3300 2900 50  0001 C CNN
F 1 "+5V" H 3315 3223 50  0000 C CNN
F 2 "" H 3300 3050 50  0001 C CNN
F 3 "" H 3300 3050 50  0001 C CNN
	1    3300 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E381214
P 3300 3150
AR Path="/5E381214" Ref="R?"  Part="1" 
AR Path="/5CC0D65F/5E381214" Ref="R?"  Part="1" 
AR Path="/5CD3AC27/5E381214" Ref="R?"  Part="1" 
AR Path="/5E36D9C8/5E381214" Ref="R16"  Part="1" 
F 0 "R16" H 3242 3196 50  0000 R CNN
F 1 "4.7kΩ" H 3242 3105 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3300 3150 50  0001 C CNN
F 3 "~" H 3300 3150 50  0001 C CNN
	1    3300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3250 3300 3400
Wire Wire Line
	3300 3400 4400 3400
Wire Wire Line
	3150 3450 3150 3300
Wire Wire Line
	3150 3300 4500 3300
Wire Wire Line
	4400 4700 5150 4700
Text Label 6200 4500 2    50   ~ 0
CLKIN
$Comp
L alexios:74AC191 U?
U 1 1 5D805641
P 6900 4000
AR Path="/5CE09726/5D805641" Ref="U?"  Part="1" 
AR Path="/6A313729/5D805641" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5D805641" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5D805641" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5D805641" Ref="U37"  Part="1" 
F 0 "U37" H 6900 3325 50  0000 C CNN
F 1 "74AC191" H 6900 3234 50  0000 C CNN
F 2 "alexios:SOIC-16" H 6875 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 6875 4000 50  0001 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3900 6350 4200
Wire Wire Line
	6400 4400 6350 4400
Connection ~ 6350 4400
Wire Wire Line
	6350 4400 6350 4600
Wire Wire Line
	6400 4200 6350 4200
Connection ~ 6350 4200
Wire Wire Line
	6350 4200 6350 4400
Wire Wire Line
	4500 3300 4500 4500
Wire Wire Line
	4400 3400 4400 4700
Text Label 5100 4700 2    50   ~ 0
~FPCLK~⁄CLK
Text Label 5050 4500 2    50   ~ 0
FPCLK
Text HLabel 10800 5200 2    50   Output ~ 0
WSTB
Text Label 9900 5200 0    50   ~ 0
WSTB₀
Text Label 10000 4500 2    50   ~ 0
T34
Wire Wire Line
	1500 2500 3750 2500
Wire Wire Line
	1500 2800 3750 2800
Wire Wire Line
	1500 3300 3150 3300
Connection ~ 3150 3300
Wire Wire Line
	1500 3400 3300 3400
Connection ~ 3300 3400
Wire Wire Line
	5850 4500 6400 4500
Wire Wire Line
	4600 4100 6400 4100
$Comp
L alexios:74LVC1G04 U40
U 1 1 5D606D47
P 8500 5250
F 0 "U40" H 8450 5517 50  0000 C CNN
F 1 "74LVC1G04" H 8450 5426 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8500 5250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 8500 5250 50  0001 C CNN
	1    8500 5250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G32 U39
U 1 1 5D6070DC
P 9600 5200
F 0 "U39" H 9650 5467 50  0000 C CNN
F 1 "74LVC1G32" H 9650 5376 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9710 5180 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9710 5180 50  0001 C CNN
	1    9600 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 5200 10200 5200
Wire Wire Line
	7600 3600 7600 5250
Wire Wire Line
	7600 5250 8200 5250
Connection ~ 7600 3600
Wire Wire Line
	7600 3600 7900 3600
Wire Wire Line
	8700 5250 9400 5250
Wire Wire Line
	8900 3900 9300 3900
Wire Wire Line
	9400 5150 9300 5150
Wire Wire Line
	9300 5150 9300 3900
Connection ~ 9300 3900
Wire Wire Line
	9300 3900 10000 3900
$Comp
L power:GND #PWR?
U 1 1 5D635148
P 7850 6100
AR Path="/5D635148" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D635148" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 7850 5850 50  0001 C CNN
F 1 "GND" H 7855 5927 50  0000 C CNN
F 2 "" H 7850 6100 50  0001 C CNN
F 3 "" H 7850 6100 50  0001 C CNN
	1    7850 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D63514E
P 7850 5900
AR Path="/5D63514E" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5D63514E" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 7850 5750 50  0001 C CNN
F 1 "+5V" H 7865 6073 50  0000 C CNN
F 2 "" H 7850 5900 50  0001 C CNN
F 3 "" H 7850 5900 50  0001 C CNN
	1    7850 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D635154
P 7850 6000
AR Path="/5CC0D65F/5D635154" Ref="C?"  Part="1" 
AR Path="/5D635154" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D635154" Ref="C26"  Part="1" 
F 0 "C26" H 7759 6046 50  0000 R CNN
F 1 "100nF" H 7759 5955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7850 6000 50  0001 C CNN
F 3 "~" H 7850 6000 50  0001 C CNN
	1    7850 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR088
U 1 1 5D635164
P 9200 5900
F 0 "#PWR088" H 9200 5750 50  0001 C CNN
F 1 "+5V" H 9215 6073 50  0000 C CNN
F 2 "" H 9200 5900 50  0001 C CNN
F 3 "" H 9200 5900 50  0001 C CNN
	1    9200 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR090
U 1 1 5D63516A
P 9200 6100
F 0 "#PWR090" H 9200 5850 50  0001 C CNN
F 1 "GND" H 9205 5927 50  0000 C CNN
F 2 "" H 9200 6100 50  0001 C CNN
F 3 "" H 9200 6100 50  0001 C CNN
	1    9200 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5D635170
P 9200 6000
AR Path="/5CC0D65F/5D635170" Ref="C?"  Part="1" 
AR Path="/5D635170" Ref="C?"  Part="1" 
AR Path="/5E4DDD44/5D635170" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5D635170" Ref="C27"  Part="1" 
F 0 "C27" H 9109 6046 50  0000 R CNN
F 1 "100nF" H 9109 5955 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9200 6000 50  0001 C CNN
F 3 "~" H 9200 6000 50  0001 C CNN
	1    9200 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC1G04 U40
U 2 1 5D63A62D
P 8200 6000
F 0 "U40" H 8380 6046 50  0000 L CNN
F 1 "74LVC1G04" H 8380 5955 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 8200 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 8200 6000 50  0001 C CNN
	2    8200 6000
	1    0    0    -1  
$EndComp
Connection ~ 7850 6100
Connection ~ 7850 5900
$Comp
L alexios:74LVC1G32 U39
U 2 1 5D63A796
P 9600 5750
F 0 "U39" H 9730 5546 50  0000 L CNN
F 1 "74LVC1G32" H 9730 5455 50  0000 L CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 9710 5730 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 9710 5730 50  0001 C CNN
	2    9600 5750
	1    0    0    -1  
$EndComp
Connection ~ 9200 6100
Connection ~ 9200 5900
Text Label 9000 3600 0    50   ~ 0
CLK1₀
Text Label 9000 3700 0    50   ~ 0
CLK2₀
Text Label 9000 3800 0    50   ~ 0
CLK3₀
Text Label 9000 3900 0    50   ~ 0
CLK4₀
Wire Wire Line
	10200 3600 10800 3600
Text Label 10350 3600 0    50   ~ 0
CLK1
Text Label 10350 3700 0    50   ~ 0
CLK2
Text Label 10350 3800 0    50   ~ 0
CLK3
Text Label 10350 3900 0    50   ~ 0
CLK4
$Comp
L Device:R_Small R18
U 1 1 5D659E40
P 10100 3600
F 0 "R18" V 10050 3450 50  0000 C CNN
F 1 "30Ω" V 9995 3600 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 3600 50  0001 C CNN
F 3 "~" H 10100 3600 50  0001 C CNN
	1    10100 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R19
U 1 1 5D683AF5
P 10100 3700
F 0 "R19" V 10050 3550 50  0000 C CNN
F 1 "30Ω" V 9995 3700 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 3700 50  0001 C CNN
F 3 "~" H 10100 3700 50  0001 C CNN
	1    10100 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 5D683B51
P 10100 3800
F 0 "R20" V 10050 3650 50  0000 C CNN
F 1 "30Ω" V 9995 3800 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 3800 50  0001 C CNN
F 3 "~" H 10100 3800 50  0001 C CNN
	1    10100 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R21
U 1 1 5D683BAF
P 10100 3900
F 0 "R21" V 10050 3750 50  0000 C CNN
F 1 "30Ω" V 10200 3900 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 3900 50  0001 C CNN
F 3 "~" H 10100 3900 50  0001 C CNN
	1    10100 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	10200 3700 10800 3700
Wire Wire Line
	10200 3800 10800 3800
Wire Wire Line
	10200 3900 10800 3900
$Comp
L Device:R_Small R22
U 1 1 5D6A69E9
P 10100 4500
F 0 "R22" V 9904 4500 50  0000 C CNN
F 1 "30Ω" V 9995 4500 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10100 4500 50  0001 C CNN
F 3 "~" H 10100 4500 50  0001 C CNN
	1    10100 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	10200 4500 10800 4500
Text Label 10350 4500 0    50   ~ 0
T34
$Comp
L Device:R_Small R23
U 1 1 5D6BE911
P 10300 5200
F 0 "R23" V 10104 5200 50  0000 C CNN
F 1 "30Ω" V 10195 5200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10300 5200 50  0001 C CNN
F 3 "~" H 10300 5200 50  0001 C CNN
	1    10300 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	10400 5200 10800 5200
Text Label 10500 5200 0    50   ~ 0
WSTB
$Comp
L power:GND #PWR?
U 1 1 5E38112C
P 1450 7450
AR Path="/5E38112C" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E38112C" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 1450 7200 50  0001 C CNN
F 1 "GND" H 1455 7277 50  0000 C CNN
F 2 "" H 1450 7450 50  0001 C CNN
F 3 "" H 1450 7450 50  0001 C CNN
	1    1450 7450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E381125
P 1450 7350
AR Path="/5CC0D65F/5E381125" Ref="C?"  Part="1" 
AR Path="/5E381125" Ref="C?"  Part="1" 
AR Path="/5E36D9C8/5E381125" Ref="C29"  Part="1" 
F 0 "C29" H 1359 7396 50  0000 R CNN
F 1 "100nF" H 1359 7305 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1450 7350 50  0001 C CNN
F 3 "~" H 1450 7350 50  0001 C CNN
	1    1450 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E38111F
P 1450 7250
AR Path="/5E38111F" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E38111F" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 1450 7100 50  0001 C CNN
F 1 "+5V" H 1465 7423 50  0000 C CNN
F 2 "" H 1450 7250 50  0001 C CNN
F 3 "" H 1450 7250 50  0001 C CNN
	1    1450 7250
	1    0    0    -1  
$EndComp
$Comp
L alexios:74LVC2G157 U38
U 2 1 5DD5152F
P 1800 7350
F 0 "U38" H 1980 7396 50  0000 L CNN
F 1 "74LVC2G157" H 1980 7305 50  0000 L CNN
F 2 "alexios:TSSOP-8_3x3mm_P0.65mm" H 1700 7475 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc2g157.pdf" H 1700 7475 50  0001 C CNN
	2    1800 7350
	1    0    0    -1  
$EndComp
Connection ~ 1450 7450
Connection ~ 1450 7250
$Comp
L alexios:74AC191 U?
U 2 1 5DD549AB
P 3200 7650
AR Path="/5CE09726/5DD549AB" Ref="U?"  Part="1" 
AR Path="/6A313729/5DD549AB" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D0A147D/5DD549AB" Ref="U?"  Part="1" 
AR Path="/5DC89E19/5D396E91/5DD549AB" Ref="U?"  Part="1" 
AR Path="/5E36D9C8/5DD549AB" Ref="U37"  Part="2" 
F 0 "U37" H 3380 7946 50  0000 L CNN
F 1 "74AC191" H 3380 7855 50  0000 L CNN
F 2 "alexios:SOIC-16" H 3175 7650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS190" H 3175 7650 50  0001 C CNN
	2    3200 7650
	1    0    0    -1  
$EndComp
Connection ~ 2850 7300
Connection ~ 2850 7500
$Comp
L Device:D_Schottky_ALT D1
U 1 1 5E063619
P 3900 1450
F 0 "D1" H 3900 1574 50  0000 C CNN
F 1 "D_Schottky_ALT" H 3900 1575 50  0001 C CNN
F 2 "" H 3900 1450 50  0001 C CNN
F 3 "~" H 3900 1450 50  0001 C CNN
	1    3900 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D2
U 1 1 5E075BF1
P 3900 1950
F 0 "D2" H 3900 2074 50  0000 C CNN
F 1 "D_Schottky_ALT" H 3900 2075 50  0001 C CNN
F 2 "" H 3900 1950 50  0001 C CNN
F 3 "~" H 3900 1950 50  0001 C CNN
	1    3900 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D3
U 1 1 5E075E86
P 3900 2500
F 0 "D3" H 3900 2624 50  0000 C CNN
F 1 "D_Schottky_ALT" H 3900 2625 50  0001 C CNN
F 2 "" H 3900 2500 50  0001 C CNN
F 3 "~" H 3900 2500 50  0001 C CNN
	1    3900 2500
	1    0    0    -1  
$EndComp
$Comp
L alexios:CXO_DIP8 X?
U 1 1 5E381107
P 3400 4550
AR Path="/5E381107" Ref="X?"  Part="1" 
AR Path="/5E36D9C8/5E381107" Ref="X1"  Part="1" 
F 0 "X1" H 3500 4917 50  0000 C CNN
F 1 "CXO_DIP8" H 3500 4826 50  0000 C CNN
F 2 "Oscillator:Oscillator_DIP-8" H 3550 4150 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 3500 4500 50  0001 C CNN
	1    3400 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0821E1
P 3950 4400
AR Path="/5E0821E1" Ref="#PWR?"  Part="1" 
AR Path="/5E36D9C8/5E0821E1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3950 4250 50  0001 C CNN
F 1 "+5V" H 3965 4573 50  0000 C CNN
F 2 "" H 3950 4400 50  0001 C CNN
F 3 "" H 3950 4400 50  0001 C CNN
	1    3950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4450 3950 4450
Wire Wire Line
	3950 4450 3950 4400
$Comp
L Device:D_Schottky_ALT D4
U 1 1 5E091A41
P 3900 2800
F 0 "D4" H 3900 2924 50  0000 C CNN
F 1 "D_Schottky_ALT" H 3900 2925 50  0001 C CNN
F 2 "" H 3900 2800 50  0001 C CNN
F 3 "~" H 3900 2800 50  0001 C CNN
	1    3900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1450 3750 1450
Connection ~ 4250 1450
Wire Wire Line
	4250 1450 4250 1350
Wire Wire Line
	4050 1450 4250 1450
$Comp
L Device:D_Schottky_ALT D5
U 1 1 5E0B90C2
P 9100 1550
F 0 "D5" H 9100 1674 50  0000 C CNN
F 1 "D_Schottky_ALT" H 9100 1675 50  0001 C CNN
F 2 "" H 9100 1550 50  0001 C CNN
F 3 "~" H 9100 1550 50  0001 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1550 9300 1550
Wire Wire Line
	9500 1550 10600 1550
NoConn ~ 8750 1750
Text Notes 8550 5600 0    100  ~ 20
Does the hazard created by this NOT gate cause\nactual disruption?
$EndSCHEMATC
