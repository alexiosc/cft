EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 36 36
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1250 2400 0    50   Input ~ 0
RADDR0
Text HLabel 1250 2500 0    50   Input ~ 0
RADDR1
Text HLabel 1250 2600 0    50   Input ~ 0
RADDR2
Text HLabel 1250 2700 0    50   Input ~ 0
RADDR3
Text HLabel 1250 2800 0    50   Input ~ 0
RADDR4
Text HLabel 1250 2900 0    50   Input ~ 0
WADDR0
Text HLabel 1250 3000 0    50   Input ~ 0
WADDR1
Text HLabel 1250 3100 0    50   Input ~ 0
WADDR2
Text HLabel 1250 3200 0    50   Input ~ 0
WADDR3
Text HLabel 1250 3300 0    50   Input ~ 0
WADDR4
Text HLabel 1250 3400 0    50   Input ~ 0
COND0
Text HLabel 1250 3500 0    50   Input ~ 0
COND1
Text HLabel 1250 3600 0    50   Input ~ 0
COND2
Text HLabel 1250 3700 0    50   Input ~ 0
COND3
Text HLabel 1250 3800 0    50   Input ~ 0
COND4
Text HLabel 1250 3900 0    50   Input ~ 0
ACTION0
Text HLabel 1250 4000 0    50   Input ~ 0
ACTION1
Text HLabel 1250 4100 0    50   Input ~ 0
ACTION2
Text HLabel 1250 4200 0    50   Input ~ 0
ACTION3
Text HLabel 1250 4300 0    50   Input ~ 0
~MEM
Text HLabel 1250 4400 0    50   Input ~ 0
~IO
Text HLabel 1250 4500 0    50   Input ~ 0
~R
Text HLabel 1250 4600 0    50   Input ~ 0
~WEN
Text HLabel 1250 4700 0    50   Input ~ 0
~END
Text Notes 7100 6950 0    197  ~ 39
µCode Bus Hold
Text Label 1700 2400 2    50   ~ 0
RADDR0
Text Label 1700 2500 2    50   ~ 0
RADDR1
Text Label 1700 2600 2    50   ~ 0
RADDR2
Text Label 1700 2700 2    50   ~ 0
RADDR3
Text Label 1700 2800 2    50   ~ 0
RADDR4
Text Label 1700 2900 2    50   ~ 0
WADDR0
Text Label 1700 3000 2    50   ~ 0
WADDR1
Text Label 1700 3100 2    50   ~ 0
WADDR2
Text Label 1700 3200 2    50   ~ 0
WADDR3
Text Label 1700 3300 2    50   ~ 0
WADDR4
Text Label 1700 3400 2    50   ~ 0
COND0
Text Label 1700 3500 2    50   ~ 0
COND1
Text Label 1700 3600 2    50   ~ 0
COND2
Text Label 1700 3700 2    50   ~ 0
COND3
Text Label 1700 3800 2    50   ~ 0
COND4
Text Label 1700 3900 2    50   ~ 0
ACTION0
Wire Wire Line
	1250 2400 1700 2400
Wire Wire Line
	1250 2500 1700 2500
Wire Wire Line
	1250 2600 1700 2600
Wire Wire Line
	1250 2700 1700 2700
Wire Wire Line
	1250 2800 1700 2800
Wire Wire Line
	1250 2900 1700 2900
Wire Wire Line
	1250 3000 1700 3000
Wire Wire Line
	1250 3100 1700 3100
Wire Wire Line
	1250 3200 1700 3200
Wire Wire Line
	1250 3300 1700 3300
Wire Wire Line
	1250 3400 1700 3400
Wire Wire Line
	1250 3500 1700 3500
Wire Wire Line
	1250 3600 1700 3600
Wire Wire Line
	1250 3700 1700 3700
Wire Wire Line
	1250 3800 1700 3800
Wire Wire Line
	1250 3900 1700 3900
Text Label 1700 4300 2    50   ~ 0
~MEM
Text Label 1700 4400 2    50   ~ 0
~IO
Text Label 1700 4500 2    50   ~ 0
~R
Text Label 1700 4600 2    50   ~ 0
~WEN
Text Label 1700 4700 2    50   ~ 0
~END
Text Label 1700 4000 2    50   ~ 0
ACTION1
Text Label 1700 4100 2    50   ~ 0
ACTION2
Text Label 1700 4200 2    50   ~ 0
ACTION3
Wire Wire Line
	1250 4000 1700 4000
Wire Wire Line
	1250 4100 1700 4100
Wire Wire Line
	1250 4200 1700 4200
Wire Wire Line
	1250 4300 1700 4300
Wire Wire Line
	1250 4400 1700 4400
Wire Wire Line
	1250 4500 1700 4500
Wire Wire Line
	1250 4600 1700 4600
Wire Wire Line
	1250 4700 1700 4700
$Comp
L alexios:SN74ACT1073 U?
U 1 1 5DF0CD8F
P 6200 2900
F 0 "U?" H 6530 2696 50  0000 L CNN
F 1 "SN74ACT1073" H 6530 2605 50  0000 L CNN
F 2 "" H 5900 3250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 5900 3250 50  0001 C CNN
	1    6200 2900
	1    0    0    -1  
$EndComp
Text Label 5250 2400 0    50   ~ 0
RADDR0
Text Label 5250 2500 0    50   ~ 0
RADDR1
Text Label 5250 2600 0    50   ~ 0
RADDR2
Text Label 5250 2700 0    50   ~ 0
RADDR3
Text Label 5250 2800 0    50   ~ 0
RADDR4
Text Label 5250 2900 0    50   ~ 0
WADDR0
Text Label 5250 3000 0    50   ~ 0
WADDR1
Text Label 5250 3100 0    50   ~ 0
WADDR2
Text Label 5250 3200 0    50   ~ 0
WADDR3
Text Label 5250 3300 0    50   ~ 0
WADDR4
Text Label 5250 3400 0    50   ~ 0
COND0
Text Label 5250 3500 0    50   ~ 0
COND1
Text Label 5250 3600 0    50   ~ 0
COND2
Text Label 5250 3700 0    50   ~ 0
COND3
Text Label 5250 3800 0    50   ~ 0
COND4
Text Label 5250 3900 0    50   ~ 0
ACTION0
Wire Wire Line
	5700 2400 5250 2400
Wire Wire Line
	5700 2500 5250 2500
Wire Wire Line
	5700 2600 5250 2600
Wire Wire Line
	5700 2700 5250 2700
Wire Wire Line
	5700 2800 5250 2800
Wire Wire Line
	5700 2900 5250 2900
Wire Wire Line
	5700 3000 5250 3000
Wire Wire Line
	5700 3100 5250 3100
Wire Wire Line
	5700 3200 5250 3200
Wire Wire Line
	5700 3300 5250 3300
Wire Wire Line
	5700 3400 5250 3400
Wire Wire Line
	5700 3500 5250 3500
Wire Wire Line
	5700 3600 5250 3600
Wire Wire Line
	5700 3700 5250 3700
Wire Wire Line
	5700 3800 5250 3800
Wire Wire Line
	5700 3900 5250 3900
Text Label 7200 2300 0    50   ~ 0
ACTION1
Text Label 7200 2400 0    50   ~ 0
ACTION2
Wire Wire Line
	7650 2300 7200 2300
Wire Wire Line
	7650 2400 7200 2400
Text Label 7200 2600 0    50   ~ 0
~MEM
Text Label 7200 2700 0    50   ~ 0
~IO
Text Label 7200 2800 0    50   ~ 0
~R
Text Label 7200 2900 0    50   ~ 0
~WEN
Text Label 7200 3000 0    50   ~ 0
~END
Text Label 7200 2500 0    50   ~ 0
ACTION3
Wire Wire Line
	7650 2500 7200 2500
Wire Wire Line
	7650 2600 7200 2600
Wire Wire Line
	7650 2700 7200 2700
Wire Wire Line
	7650 2800 7200 2800
Wire Wire Line
	7650 2900 7200 2900
Wire Wire Line
	7650 3000 7200 3000
Wire Wire Line
	7650 3100 7550 3100
$Comp
L power:GND #PWR?
U 1 1 5DF5300A
P 7550 3250
F 0 "#PWR?" H 7550 3000 50  0001 C CNN
F 1 "GND" H 7555 3077 50  0000 C CNN
F 2 "" H 7550 3250 50  0001 C CNN
F 3 "" H 7550 3250 50  0001 C CNN
	1    7550 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3100 7550 3200
Wire Wire Line
	7650 3200 7550 3200
$Comp
L alexios:SN74ACT1073 U?
U 2 1 5DF877F1
P 6200 4900
F 0 "U?" H 6380 5259 50  0000 L CNN
F 1 "SN74ACT1073" H 6380 5168 50  0000 L CNN
F 2 "" H 5900 5250 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 5900 5250 50  0001 C CNN
	2    6200 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5DF877F7
P 5850 4600
AR Path="/5CC0D65F/5DF877F7" Ref="C?"  Part="1" 
AR Path="/5DF877F7" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DF877F7" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5DF877F7" Ref="C?"  Part="1" 
F 0 "C?" H 5759 4646 50  0000 R CNN
F 1 "100nF" H 5759 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5850 4600 50  0001 C CNN
F 3 "~" H 5850 4600 50  0001 C CNN
	1    5850 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF877FD
P 5850 4800
AR Path="/5DEAC282/5DF877FD" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5DF877FD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5850 4550 50  0001 C CNN
F 1 "GND" H 5855 4627 50  0000 C CNN
F 2 "" H 5850 4800 50  0001 C CNN
F 3 "" H 5850 4800 50  0001 C CNN
	1    5850 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF87803
P 5850 4400
AR Path="/5DEAC282/5DF87803" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5DF87803" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5850 4250 50  0001 C CNN
F 1 "+5V" H 5865 4573 50  0000 C CNN
F 2 "" H 5850 4400 50  0001 C CNN
F 3 "" H 5850 4400 50  0001 C CNN
	1    5850 4400
	1    0    0    -1  
$EndComp
Connection ~ 5850 4400
Connection ~ 5850 4500
Wire Wire Line
	5850 4500 5850 4400
Connection ~ 5850 4800
Connection ~ 5850 4700
Wire Wire Line
	5850 4700 5850 4800
$Comp
L Device:C_Small C?
U 1 1 5DF91FBA
P 8050 4600
AR Path="/5CC0D65F/5DF91FBA" Ref="C?"  Part="1" 
AR Path="/5DF91FBA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DF91FBA" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5DF91FBA" Ref="C?"  Part="1" 
F 0 "C?" H 7959 4646 50  0000 R CNN
F 1 "100nF" H 7959 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8050 4600 50  0001 C CNN
F 3 "~" H 8050 4600 50  0001 C CNN
	1    8050 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF91FC0
P 8050 4800
AR Path="/5DEAC282/5DF91FC0" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5DF91FC0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8050 4550 50  0001 C CNN
F 1 "GND" H 8055 4627 50  0000 C CNN
F 2 "" H 8050 4800 50  0001 C CNN
F 3 "" H 8050 4800 50  0001 C CNN
	1    8050 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF91FC6
P 8050 4400
AR Path="/5DEAC282/5DF91FC6" Ref="#PWR?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5DF91FC6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8050 4250 50  0001 C CNN
F 1 "+5V" H 8065 4573 50  0000 C CNN
F 2 "" H 8050 4400 50  0001 C CNN
F 3 "" H 8050 4400 50  0001 C CNN
	1    8050 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4500 8050 4400
Wire Wire Line
	8050 4700 8050 4800
Wire Wire Line
	5850 4700 5450 4700
Wire Wire Line
	5850 4500 5450 4500
$Comp
L Device:C_Small C?
U 1 1 5E004590
P 5450 4600
AR Path="/5CC0D65F/5E004590" Ref="C?"  Part="1" 
AR Path="/5E004590" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E004590" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E004590" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E004590" Ref="C?"  Part="1" 
F 0 "C?" H 5359 4646 50  0000 R CNN
F 1 "10µF" H 5359 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5450 4600 50  0001 C CNN
F 3 "~" H 5450 4600 50  0001 C CNN
	1    5450 4600
	1    0    0    -1  
$EndComp
Connection ~ 8050 4700
Wire Wire Line
	8050 4700 7650 4700
Connection ~ 8050 4500
Wire Wire Line
	8050 4500 7650 4500
$Comp
L Device:C_Small C?
U 1 1 5E0084D4
P 7650 4600
AR Path="/5CC0D65F/5E0084D4" Ref="C?"  Part="1" 
AR Path="/5E0084D4" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E0084D4" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E34FD9B/5E0084D4" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5DEAA264/5E0084D4" Ref="C?"  Part="1" 
F 0 "C?" H 7559 4646 50  0000 R CNN
F 1 "10µF" H 7559 4555 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7650 4600 50  0001 C CNN
F 3 "~" H 7650 4600 50  0001 C CNN
	1    7650 4600
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U?
U 1 1 5E0F9B5A
P 8150 2800
F 0 "U?" H 8480 2896 50  0000 L CNN
F 1 "SN74ACT1071" H 8480 2805 50  0000 L CNN
F 2 "" H 7850 3150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 7850 3150 50  0001 C CNN
	1    8150 2800
	1    0    0    -1  
$EndComp
Connection ~ 7550 3200
Wire Wire Line
	7550 3200 7550 3250
$EndSCHEMATC
