EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
Title "Control Unit Board"
Date ""
Rev "2023"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 2350 -7300 0    197  ~ 39
Decoders
Wire Wire Line
	2900 -5550 2550 -5550
Wire Wire Line
	2900 -5450 2550 -5450
Wire Wire Line
	2900 -4100 2550 -4100
Wire Wire Line
	2900 -4000 2550 -4000
Wire Wire Line
	2900 -4700 2550 -4700
Wire Wire Line
	2900 -4600 2550 -4600
Wire Wire Line
	2900 -4500 2550 -4500
Text Notes 3450 -4000 1    50   ~ 10
WADDR=010xx
Text Label 2600 -5550 0    50   ~ 0
RADDR3
Text Label 2600 -5450 0    50   ~ 0
RADDR4
Text Label 2600 -4700 0    50   ~ 0
WADDR0
Text Label 2600 -4600 0    50   ~ 0
WADDR1
Text Label 2600 -4500 0    50   ~ 0
WADDR2
Text Label 2600 -4000 0    50   ~ 0
WADDR4
Text Label 2600 -4100 0    50   ~ 0
WADDR3
Entry Wire Line
	2450 -5650 2550 -5550
Entry Wire Line
	2450 -5550 2550 -5450
Entry Wire Line
	2450 -4800 2550 -4700
Entry Wire Line
	2450 -4700 2550 -4600
Entry Wire Line
	2450 -4600 2550 -4500
Entry Wire Line
	2450 -4200 2550 -4100
Entry Wire Line
	2450 -4100 2550 -4000
Text Label 4500 -4600 2    50   ~ 0
~WRITE-DR
NoConn ~ 3900 -5750
NoConn ~ 3900 -5650
NoConn ~ 3900 -5550
NoConn ~ 3900 -5450
NoConn ~ 3900 -4300
NoConn ~ 3900 -4200
NoConn ~ 3900 -4100
NoConn ~ 3900 -4000
Text Label 2450 -4200 1    50   ~ 0
WADDR[4..0]
Wire Wire Line
	3900 -4700 4500 -4700
Wire Wire Line
	3900 -4600 4500 -4600
Text Label 4500 -4700 2    50   ~ 0
~WRITE-PC
Text Label 2450 -6800 0    50   ~ 0
~RESET
Wire Wire Line
	3000 -6800 2450 -6800
$Comp
L alexios:74LVC1G04 U101
U 1 1 5DAE39EC
P 3300 -6800
F 0 "U101" H 3250 -6533 50  0000 C CNN
F 1 "74LVC1G04" H 3250 -6624 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 3300 -6800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 3300 -6800 50  0001 C CNN
	1    3300 -6800
	1    0    0    -1  
$EndComp
Text Label 4000 -6800 2    50   ~ 0
RESET
Wire Wire Line
	3500 -6800 4000 -6800
Text Notes 4200 -5050 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 4750 -5050 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	4150 -5575 4950 -5575
Wire Notes Line width 12 style solid
	4150 -5000 4150 -5575
Wire Notes Line width 12 style solid
	4950 -5000 4150 -5000
Wire Notes Line width 12 style solid
	4950 -5575 4950 -5000
Wire Notes Line style solid
	4150 -5400 4950 -5400
Wire Notes Line
	4700 -5575 4700 -5000
Text Label 2900 -3900 2    50   ~ 0
CLK4'
Text Notes 3150 -1450 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
Wire Wire Line
	2650 -5350 2550 -5350
Wire Wire Line
	2550 -5350 2550 -5300
$Comp
L power:GND #PWR0101
U 1 1 5D9C912E
P 2550 -5300
F 0 "#PWR0101" H 2550 -5550 50  0001 C CNN
F 1 "GND" H 2555 -5473 50  0000 C CNN
F 2 "" H 2550 -5300 50  0001 C CNN
F 3 "" H 2550 -5300 50  0001 C CNN
	1    2550 -5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 -5350 2900 -5350
$Comp
L Device:Jumper_NC_Small JP101
U 1 1 60284772
P 2750 -5350
F 0 "JP101" H 2750 -5443 50  0000 C CNN
F 1 "Jumper_NC_Small" H 2750 -5229 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 2750 -5350 50  0001 C CNN
F 3 "~" H 2750 -5350 50  0001 C CNN
	1    2750 -5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 -4100 1900 -4100
$Comp
L power:GND #PWR0103
U 1 1 5EEF256F
P 2300 -3700
F 0 "#PWR0103" H 2300 -3950 50  0001 C CNN
F 1 "GND" H 2305 -3873 50  0000 C CNN
F 2 "" H 2300 -3700 50  0001 C CNN
F 3 "" H 2300 -3700 50  0001 C CNN
	1    2300 -3700
	1    0    0    -1  
$EndComp
Text Label 1900 -4100 0    50   ~ 0
CLK4
Text Notes 2500 -3500 0    50   ~ 0
1-2: Normal Operation\n2-3: Standalone REG Board Testing
$Comp
L Jumper:SolderJumper_3_Open JP102
U 1 1 5EF00BEB
P 2300 -3900
F 0 "JP102" V 2300 -3832 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 2345 -3833 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2300 -3900 50  0001 C CNN
F 3 "~" H 2300 -3900 50  0001 C CNN
	1    2300 -3900
	0    -1   1    0   
$EndComp
Wire Wire Line
	2450 -3900 2900 -3900
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 19750 -2050
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 19750 -2200 50  0001 C CNN
F 1 "+5V" H 19692 -2013 50  0000 R CNN
F 2 "" H 19750 -2050 50  0001 C CNN
F 3 "" H 19750 -2050 50  0001 C CNN
	1    19750 -2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 19750 -1650
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 19750 -1900 50  0001 C CNN
F 1 "GND" H 19672 -1687 50  0000 R CNN
F 2 "" H 19750 -1650 50  0001 C CNN
F 3 "" H 19750 -1650 50  0001 C CNN
	1    19750 -1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	19750 -2050 19750 -1950
Wire Wire Line
	19750 -1750 19750 -1650
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 19300 -2050
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0108"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 19300 -2200 50  0001 C CNN
F 1 "+5V" H 19242 -2013 50  0000 R CNN
F 2 "" H 19300 -2050 50  0001 C CNN
F 3 "" H 19300 -2050 50  0001 C CNN
	1    19300 -2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 19300 -1650
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 19300 -1900 50  0001 C CNN
F 1 "GND" H 19222 -1687 50  0000 R CNN
F 2 "" H 19300 -1650 50  0001 C CNN
F 3 "" H 19300 -1650 50  0001 C CNN
	1    19300 -1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	19300 -2050 19300 -1950
Wire Wire Line
	19300 -1750 19300 -1650
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 20200 -2050
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 20200 -2200 50  0001 C CNN
F 1 "+5V" H 20142 -2013 50  0000 R CNN
F 2 "" H 20200 -2050 50  0001 C CNN
F 3 "" H 20200 -2050 50  0001 C CNN
	1    20200 -2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 20200 -1650
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 20200 -1900 50  0001 C CNN
F 1 "GND" H 20122 -1687 50  0000 R CNN
F 2 "" H 20200 -1650 50  0001 C CNN
F 3 "" H 20200 -1650 50  0001 C CNN
	1    20200 -1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	20200 -2050 20200 -1950
Wire Wire Line
	20200 -1750 20200 -1650
Wire Wire Line
	12500 -3200 12600 -3200
Wire Wire Line
	12500 -3700 12850 -3700
Wire Wire Line
	12500 -3800 12850 -3800
Wire Wire Line
	12500 -3900 12850 -3900
Wire Wire Line
	12500 -4000 12850 -4000
Wire Wire Line
	12500 -4100 12850 -4100
Wire Wire Line
	12500 -4200 12850 -4200
Wire Wire Line
	12500 -4300 12850 -4300
Wire Wire Line
	12500 -4400 12850 -4400
Wire Wire Line
	12500 -4500 12850 -4500
Wire Wire Line
	12500 -4600 12850 -4600
Wire Wire Line
	12500 -4700 12850 -4700
Wire Wire Line
	12500 -4800 12850 -4800
Wire Wire Line
	12500 -4900 12850 -4900
Wire Wire Line
	12500 -5000 12850 -5000
Wire Wire Line
	12500 -5100 12850 -5100
Wire Wire Line
	12500 -5200 12850 -5200
Wire Wire Line
	12500 -5500 12850 -5500
Wire Wire Line
	12500 -5600 12850 -5600
Wire Wire Line
	12500 -5700 12850 -5700
Wire Wire Line
	12500 -5800 12850 -5800
Wire Wire Line
	12500 -5900 12850 -5900
Wire Wire Line
	12500 -6000 12850 -6000
Wire Wire Line
	12500 -6100 12850 -6100
Wire Wire Line
	12500 -6200 12850 -6200
Wire Wire Line
	12500 -6300 12850 -6300
Wire Wire Line
	12500 -6400 12850 -6400
Wire Wire Line
	12500 -6500 12850 -6500
Wire Wire Line
	12500 -6600 12850 -6600
Wire Wire Line
	12500 -6700 12850 -6700
Wire Wire Line
	10950 -2800 11300 -2800
Wire Wire Line
	10950 -2900 11300 -2900
Wire Wire Line
	10950 -3000 11300 -3000
Wire Wire Line
	10950 -3100 11300 -3100
Wire Wire Line
	10950 -3200 11300 -3200
Wire Wire Line
	10950 -3300 11300 -3300
Wire Wire Line
	10950 -3400 11300 -3400
Wire Wire Line
	10950 -3500 11300 -3500
Wire Wire Line
	10950 -3700 11300 -3700
Wire Wire Line
	10950 -3800 11300 -3800
Wire Wire Line
	10950 -3900 11300 -3900
Wire Wire Line
	10950 -4000 11300 -4000
Wire Wire Line
	10950 -4100 11300 -4100
Wire Wire Line
	10950 -4200 11300 -4200
Wire Wire Line
	10950 -4300 11300 -4300
Wire Wire Line
	10950 -4400 11300 -4400
Wire Wire Line
	10950 -4500 11300 -4500
Wire Wire Line
	10950 -4600 11300 -4600
Wire Wire Line
	10950 -4700 11300 -4700
Wire Wire Line
	10950 -4800 11300 -4800
Wire Wire Line
	10950 -4900 11300 -4900
Wire Wire Line
	10950 -5000 11300 -5000
Wire Wire Line
	10950 -5100 11300 -5100
Wire Wire Line
	10950 -5200 11300 -5200
Wire Wire Line
	10950 -5300 11300 -5300
Wire Wire Line
	10950 -5400 11300 -5400
Wire Wire Line
	10950 -5500 11300 -5500
Wire Wire Line
	10950 -5600 11300 -5600
Wire Wire Line
	10950 -5700 11300 -5700
Wire Wire Line
	10950 -5800 11300 -5800
Wire Wire Line
	10950 -5900 11300 -5900
Wire Wire Line
	10950 -6000 11300 -6000
Wire Wire Line
	10950 -6200 11300 -6200
Wire Wire Line
	10950 -6300 11300 -6300
Wire Wire Line
	10350 -3800 10700 -3800
Wire Wire Line
	10350 -3900 10700 -3900
Wire Wire Line
	10350 -4000 10700 -4000
Wire Wire Line
	10350 -4100 10700 -4100
Wire Wire Line
	10350 -4200 10700 -4200
Wire Wire Line
	10350 -4300 10700 -4300
Wire Wire Line
	10350 -4400 10700 -4400
Wire Wire Line
	10350 -4500 10700 -4500
Wire Wire Line
	10350 -4600 10700 -4600
Wire Wire Line
	10350 -4700 10700 -4700
Wire Wire Line
	10350 -4800 10700 -4800
Wire Wire Line
	10350 -4900 10700 -4900
Wire Wire Line
	10350 -5000 10700 -5000
Wire Wire Line
	10350 -5100 10700 -5100
Wire Wire Line
	10350 -5200 10700 -5200
Wire Wire Line
	10350 -5300 10700 -5300
Wire Wire Line
	10350 -5400 10700 -5400
Wire Wire Line
	10350 -5500 10700 -5500
Wire Wire Line
	10350 -5700 10700 -5700
Wire Wire Line
	10350 -5800 10700 -5800
Wire Wire Line
	10350 -6000 10700 -6000
Wire Wire Line
	10350 -6100 10700 -6100
Wire Wire Line
	10350 -6200 10700 -6200
Wire Wire Line
	10350 -6300 10700 -6300
Wire Wire Line
	10350 -6400 10700 -6400
Wire Wire Line
	10350 -6500 10700 -6500
Wire Wire Line
	10350 -6600 10700 -6600
Wire Wire Line
	10350 -6700 10700 -6700
Wire Wire Line
	8800 -2700 9150 -2700
Wire Wire Line
	8800 -2800 9150 -2800
Wire Wire Line
	8800 -2900 9150 -2900
Wire Wire Line
	8800 -3000 9150 -3000
Wire Wire Line
	8800 -3100 9150 -3100
Wire Wire Line
	8800 -3200 9150 -3200
Wire Wire Line
	8800 -3300 9150 -3300
Wire Wire Line
	8800 -3400 9150 -3400
Wire Wire Line
	8800 -3600 9150 -3600
Wire Wire Line
	8800 -3700 9150 -3700
Wire Wire Line
	8800 -3800 9150 -3800
Wire Wire Line
	8800 -3900 9150 -3900
Wire Wire Line
	8800 -4000 9150 -4000
Wire Wire Line
	8800 -4200 9150 -4200
Wire Wire Line
	8800 -4300 9150 -4300
Wire Wire Line
	8800 -4400 9150 -4400
Wire Wire Line
	8800 -4500 9150 -4500
Wire Wire Line
	8800 -4600 9150 -4600
Wire Wire Line
	8800 -4700 9150 -4700
Wire Wire Line
	8800 -4800 9150 -4800
Wire Wire Line
	8800 -4900 9150 -4900
Wire Wire Line
	8800 -5000 9150 -5000
Wire Wire Line
	8800 -5100 9150 -5100
Wire Wire Line
	8800 -5200 9150 -5200
Wire Wire Line
	8800 -5300 9150 -5300
Wire Wire Line
	8800 -5400 9150 -5400
Wire Wire Line
	8800 -5500 9150 -5500
Wire Wire Line
	8800 -5600 9150 -5600
Wire Wire Line
	8800 -5700 9150 -5700
Wire Wire Line
	8800 -5900 9150 -5900
Wire Wire Line
	8800 -6000 9150 -6000
Wire Wire Line
	8800 -6100 9150 -6100
Wire Wire Line
	8800 -6200 9150 -6200
Wire Wire Line
	8800 -6300 9150 -6300
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 60A3E373
P 9750 -6800
F 0 "P1" H 9750 -6633 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 9750 -6724 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 9700 -7700 50  0001 C CNN
F 3 "" H 9700 -7700 50  0001 C CNN
	1    9750 -6800
	1    0    0    -1  
$EndComp
Text Label 10700 -6700 2    50   ~ 0
FPD0
Text Label 10700 -6600 2    50   ~ 0
FPD1
Text Label 10700 -6500 2    50   ~ 0
FPD2
Text Label 10700 -6400 2    50   ~ 0
FPD3
Text Label 10700 -6300 2    50   ~ 0
FPD4
Text Label 10700 -6200 2    50   ~ 0
FPD5
Text Label 10700 -6100 2    50   ~ 0
FPD6
Text Label 10700 -6000 2    50   ~ 0
FPD7
Text Label 10700 -5800 2    50   ~ 0
~ENDEXT
Text Label 10700 -5700 2    50   ~ 0
~SKIPEXT
Wire Wire Line
	9100 -6500 9100 -6600
Wire Wire Line
	9100 -6500 9150 -6500
$Comp
L power:+5V #PWR0129
U 1 1 60E723B0
P 9100 -6750
F 0 "#PWR0129" H 9100 -6900 50  0001 C CNN
F 1 "+5V" H 9115 -6577 50  0000 C CNN
F 2 "" H 9100 -6750 50  0001 C CNN
F 3 "" H 9100 -6750 50  0001 C CNN
	1    9100 -6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 -6700 9100 -6700
Connection ~ 9100 -6700
Wire Wire Line
	9100 -6700 9100 -6750
Wire Wire Line
	9150 -6600 9100 -6600
Connection ~ 9100 -6600
Wire Wire Line
	9100 -6600 9100 -6700
$Comp
L power:GND #PWR0132
U 1 1 60F6906D
P 12600 -2600
F 0 "#PWR0132" H 12600 -2850 50  0001 C CNN
F 1 "GND" H 12605 -2773 50  0000 C CNN
F 2 "" H 12600 -2600 50  0001 C CNN
F 3 "" H 12600 -2600 50  0001 C CNN
	1    12600 -2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	12500 -3100 12600 -3100
Wire Wire Line
	12600 -3200 12600 -3100
Connection ~ 12600 -3100
Wire Wire Line
	12500 -3000 12600 -3000
Wire Wire Line
	12600 -3100 12600 -3000
Connection ~ 12600 -3000
Wire Wire Line
	12600 -3000 12600 -2900
Wire Wire Line
	12500 -2900 12600 -2900
Connection ~ 12600 -2900
Wire Wire Line
	12600 -2900 12600 -2800
Wire Wire Line
	12500 -2800 12600 -2800
Connection ~ 12600 -2800
Wire Wire Line
	12600 -2800 12600 -2700
Wire Wire Line
	12500 -2700 12600 -2700
Connection ~ 12600 -2700
Wire Wire Line
	12600 -2700 12600 -2600
Text Label 12850 -5200 2    50   ~ 0
DB0
Text Label 12850 -5100 2    50   ~ 0
DB1
Text Label 12850 -5000 2    50   ~ 0
DB2
Text Label 12850 -4900 2    50   ~ 0
DB3
Text Label 12850 -4800 2    50   ~ 0
DB4
Text Label 12850 -4700 2    50   ~ 0
DB5
Text Label 12850 -4600 2    50   ~ 0
DB6
Text Label 12850 -4500 2    50   ~ 0
DB7
Text Label 12850 -4400 2    50   ~ 0
DB8
Text Label 12850 -4300 2    50   ~ 0
DB9
Text Label 12850 -4200 2    50   ~ 0
DB10
Text Label 12850 -4100 2    50   ~ 0
DB11
Text Label 12850 -4000 2    50   ~ 0
DB12
Text Label 12850 -3900 2    50   ~ 0
DB13
Text Label 12850 -3800 2    50   ~ 0
DB14
Text Label 12850 -3700 2    50   ~ 0
DB15
Text Label 10700 -5500 2    50   ~ 0
RADDR0
Text Label 10700 -5400 2    50   ~ 0
RADDR1
Text Label 10700 -5300 2    50   ~ 0
RADDR2
Text Label 10700 -5200 2    50   ~ 0
RADDR3
Text Label 10700 -5100 2    50   ~ 0
RADDR4
Text Label 10700 -5000 2    50   ~ 0
WADDR0
Text Label 10700 -4900 2    50   ~ 0
WADDR1
Text Label 10700 -4800 2    50   ~ 0
WADDR2
Text Label 10700 -4700 2    50   ~ 0
WADDR3
Text Label 10700 -4600 2    50   ~ 0
WADDR4
Text Label 10700 -4500 2    50   ~ 0
ACTION0
Text Label 10700 -4400 2    50   ~ 0
ACTION1
Text Label 10700 -4300 2    50   ~ 0
ACTION2
Text Label 10700 -4200 2    50   ~ 0
ACTION3
Text Label 10700 -4100 2    50   ~ 0
COND0
Text Label 10700 -4000 2    50   ~ 0
COND1
Text Label 10700 -3900 2    50   ~ 0
COND2
Text Label 10700 -3800 2    50   ~ 0
COND3
Wire Wire Line
	10350 -3200 10450 -3200
$Comp
L power:GND #PWR0131
U 1 1 61C7A92A
P 10450 -2600
F 0 "#PWR0131" H 10450 -2850 50  0001 C CNN
F 1 "GND" H 10455 -2773 50  0000 C CNN
F 2 "" H 10450 -2600 50  0001 C CNN
F 3 "" H 10450 -2600 50  0001 C CNN
	1    10450 -2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 -3100 10450 -3100
Wire Wire Line
	10450 -3200 10450 -3100
Connection ~ 10450 -3100
Wire Wire Line
	10350 -3000 10450 -3000
Wire Wire Line
	10450 -3100 10450 -3000
Connection ~ 10450 -3000
Wire Wire Line
	10450 -3000 10450 -2900
Wire Wire Line
	10350 -2900 10450 -2900
Connection ~ 10450 -2900
Wire Wire Line
	10450 -2900 10450 -2800
Wire Wire Line
	10350 -2800 10450 -2800
Connection ~ 10450 -2800
Wire Wire Line
	10450 -2800 10450 -2700
Wire Wire Line
	10350 -2700 10450 -2700
Connection ~ 10450 -2700
Wire Wire Line
	10450 -2700 10450 -2600
Wire Wire Line
	11250 -6500 11250 -6600
Wire Wire Line
	11250 -6500 11300 -6500
$Comp
L power:+5V #PWR0130
U 1 1 61D152B5
P 11250 -6750
F 0 "#PWR0130" H 11250 -6900 50  0001 C CNN
F 1 "+5V" H 11265 -6577 50  0000 C CNN
F 2 "" H 11250 -6750 50  0001 C CNN
F 3 "" H 11250 -6750 50  0001 C CNN
	1    11250 -6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11300 -6700 11250 -6700
Connection ~ 11250 -6700
Wire Wire Line
	11250 -6700 11250 -6750
Wire Wire Line
	11300 -6600 11250 -6600
Connection ~ 11250 -6600
Wire Wire Line
	11250 -6600 11250 -6700
Text Label 8800 -6300 0    50   ~ 0
CLK1
Text Label 8800 -6200 0    50   ~ 0
CLK2
Text Label 8800 -6100 0    50   ~ 0
CLK3
Text Label 8800 -6000 0    50   ~ 0
CLK4
Text Label 8800 -5900 0    50   ~ 0
T34
Text Label 8800 -5700 0    50   ~ 0
IBUS0
Text Label 8800 -5600 0    50   ~ 0
IBUS1
Text Label 8800 -5500 0    50   ~ 0
IBUS2
Text Label 8800 -5400 0    50   ~ 0
IBUS3
Text Label 8800 -5300 0    50   ~ 0
IBUS4
Text Label 8800 -5200 0    50   ~ 0
IBUS5
Text Label 8800 -5100 0    50   ~ 0
IBUS6
Text Label 8800 -5000 0    50   ~ 0
IBUS7
Text Label 8800 -4900 0    50   ~ 0
IBUS8
Text Label 8800 -4800 0    50   ~ 0
IBUS9
Text Label 8800 -4700 0    50   ~ 0
IBUS10
Text Label 8800 -4600 0    50   ~ 0
IBUS11
Text Label 8800 -4500 0    50   ~ 0
IBUS12
Text Label 8800 -4400 0    50   ~ 0
IBUS13
Text Label 8800 -4300 0    50   ~ 0
IBUS14
Text Label 8800 -4200 0    50   ~ 0
IBUS15
Text Label 8800 -4000 0    50   ~ 0
FV
Text Label 8800 -3900 0    50   ~ 0
FL
Text Label 8800 -3800 0    50   ~ 0
FZ
Text Label 8800 -3700 0    50   ~ 0
FN
Text Label 8800 -3600 0    50   ~ 0
~WRITE-FL
Text Label 8800 -3400 0    50   ~ 0
IR0
Text Label 8800 -3300 0    50   ~ 0
IR1
Text Label 8800 -3200 0    50   ~ 0
IR2
Text Label 8800 -3100 0    50   ~ 0
IR3
Text Label 8800 -3000 0    50   ~ 0
IR4
Text Label 8800 -2900 0    50   ~ 0
IR5
Text Label 8800 -2800 0    50   ~ 0
IR6
Text Label 8800 -2700 0    50   ~ 0
IR7
Text Label 10950 -6300 0    50   ~ 0
~RESET
Text Label 10950 -6200 0    50   ~ 0
~RSTHOLD
Text Label 10950 -6000 0    50   ~ 0
AB0
Text Label 10950 -5900 0    50   ~ 0
AB1
Text Label 10950 -5800 0    50   ~ 0
AB2
Text Label 10950 -5700 0    50   ~ 0
AB3
Text Label 10950 -5600 0    50   ~ 0
AB4
Text Label 10950 -5500 0    50   ~ 0
AB5
Text Label 10950 -5400 0    50   ~ 0
AB6
Text Label 10950 -5300 0    50   ~ 0
AB7
Text Label 10950 -5200 0    50   ~ 0
AB8
Text Label 10950 -5100 0    50   ~ 0
AB9
Text Label 10950 -5000 0    50   ~ 0
AB10
Text Label 10950 -4900 0    50   ~ 0
AB11
Text Label 10950 -4800 0    50   ~ 0
AB12
Text Label 10950 -4700 0    50   ~ 0
AB13
Text Label 10950 -4600 0    50   ~ 0
AB14
Text Label 10950 -4500 0    50   ~ 0
AB15
Text Label 10950 -4400 0    50   ~ 0
AB16
Text Label 10950 -4300 0    50   ~ 0
AB17
Text Label 10950 -4200 0    50   ~ 0
AB18
Text Label 10950 -4100 0    50   ~ 0
AB19
Text Label 10950 -4000 0    50   ~ 0
AB20
Text Label 10950 -3900 0    50   ~ 0
AB21
Text Label 10950 -3800 0    50   ~ 0
AB22
Text Label 10950 -3700 0    50   ~ 0
AB23
Text Label 10950 -3500 0    50   ~ 0
~IRQ0
Text Label 10950 -3400 0    50   ~ 0
~IRQ1
Text Label 10950 -3300 0    50   ~ 0
~IRQ2
Text Label 10950 -3200 0    50   ~ 0
~IRQ3
Text Label 10950 -3100 0    50   ~ 0
~IRQ4
Text Label 10950 -3000 0    50   ~ 0
~IRQ5
Text Label 10950 -2900 0    50   ~ 0
~IRQ6
Text Label 10950 -2800 0    50   ~ 0
~IRQ7
Text Label 12850 -6700 2    50   ~ 0
~MEM
Text Label 12850 -6600 2    50   ~ 0
~IO
Text Label 12850 -6500 2    50   ~ 0
~R
Text Label 12850 -6400 2    50   ~ 0
~W
Text Label 12850 -6300 2    50   ~ 0
~SYSDEV
Text Label 12850 -6200 2    50   ~ 0
~IODEV1XX
Text Label 12850 -6100 2    50   ~ 0
~IODEV2XX
Text Label 12850 -6000 2    50   ~ 0
~IODEV3XX
Text Label 12850 -5900 2    50   ~ 0
~WS
Text Label 12850 -5800 2    50   ~ 0
~WAITING
Text Label 12850 -5700 2    50   ~ 0
~HALT
Text Label 12850 -5600 2    50   ~ 0
~IRQ
Text Label 12850 -5500 2    50   ~ 0
~IRQS
Wire Bus Line
	-3350 -5700 -2800 -5700
Text Label -3350 -5700 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-2800 -6500 -3350 -6500
Wire Wire Line
	-2800 -6400 -3350 -6400
Wire Wire Line
	-2800 -6300 -3350 -6300
Wire Wire Line
	-2800 -6200 -3350 -6200
Wire Wire Line
	-2800 -6600 -3350 -6600
Wire Wire Line
	-2800 -5300 -3350 -5300
Wire Wire Line
	-2800 -5200 -3350 -5200
Wire Wire Line
	-2800 -5100 -3350 -5100
Wire Wire Line
	-2800 -5600 -3350 -5600
Wire Wire Line
	-2800 -4800 -3350 -4800
Wire Wire Line
	-2800 -4700 -3350 -4700
Wire Wire Line
	-2800 -4600 -3350 -4600
Wire Wire Line
	-2800 -4900 -3350 -4900
Wire Wire Line
	-2800 -5000 -3350 -5000
Wire Wire Line
	-2800 -4000 -3350 -4000
Wire Wire Line
	-2800 -3900 -3350 -3900
Wire Wire Line
	-2800 -4100 -3350 -4100
Wire Wire Line
	-2800 -4300 -3350 -4300
Text Label -3350 -5600 0    50   ~ 0
~IRQ
Wire Wire Line
	-2800 -5900 -3350 -5900
Wire Wire Line
	-2800 -5800 -3350 -5800
Wire Bus Line
	-3350 -6700 -2800 -6700
Text Label -3350 -6700 0    50   ~ 0
IBUS[0..15]
Text Label -3350 -6600 0    50   ~ 0
~RESET
Text Label -3350 -6500 0    50   ~ 0
CLK1
Text Label -3350 -6400 0    50   ~ 0
CLK2
Text Label -3350 -6300 0    50   ~ 0
CLK3
Text Label -3350 -6200 0    50   ~ 0
CLK4
Text Label -3350 -5900 0    50   ~ 0
WSTB
Text Label -3350 -5800 0    50   ~ 0
T34
Wire Wire Line
	-2800 -5500 -3350 -5500
Text Label -3350 -5500 0    50   ~ 0
~IRQS
Text Label -3350 -5300 0    50   ~ 0
~RSTHOLD
Text Label -3350 -5200 0    50   ~ 0
~SYSDEV
Text Label -3350 -5100 0    50   ~ 0
~IODEV1xx
Text Label -3350 -5000 0    50   ~ 0
~IODEV2xx
Text Label -3350 -4900 0    50   ~ 0
~IODEV3xx
Text Label -3350 -4800 0    50   ~ 0
~MEM
Text Label -3350 -4700 0    50   ~ 0
~IO
Text Label -3350 -4600 0    50   ~ 0
~R
Text Label -3350 -4300 0    50   ~ 0
~WS
Text Label -3350 -4100 0    50   ~ 0
~ENDEXT
Text Label -3350 -4000 0    50   ~ 0
~SKIPEXT
Text Label -3350 -3900 0    50   ~ 0
~HALT
Text Label -3350 -3800 0    50   ~ 0
ACTION[0..3]
Text Label -3350 -3700 0    50   ~ 0
WADDR[0..4]
Text Label -3350 -3600 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-2800 -3800 -3350 -3800
Wire Bus Line
	-2800 -3700 -3350 -3700
Wire Bus Line
	-2800 -3600 -3350 -3600
Wire Bus Line
	-3350 -3500 -2800 -3500
Text Label -3350 -3500 0    50   ~ 0
RSVD[1..4]
Text Notes -2850 -7100 0    100  ~ 20
Edge Connector
Wire Wire Line
	-1650 -5700 -1050 -5700
NoConn ~ -3350 -5200
NoConn ~ -3350 -5100
NoConn ~ -3350 -5000
NoConn ~ -3350 -4900
NoConn ~ -3350 -3500
Wire Wire Line
	-1650 -6700 -1300 -6700
Wire Wire Line
	-1650 -6600 -1300 -6600
Wire Wire Line
	-1650 -6500 -1300 -6500
Wire Wire Line
	-1650 -6400 -1300 -6400
Wire Wire Line
	-1650 -6300 -1300 -6300
Wire Wire Line
	-1650 -6200 -1300 -6200
Wire Wire Line
	-1650 -6100 -1300 -6100
Text Label -1300 -6700 2    50   ~ 0
IR0
Text Label -1300 -6600 2    50   ~ 0
IR1
Text Label -1300 -6500 2    50   ~ 0
IR2
Text Label -1300 -6400 2    50   ~ 0
IR3
Text Label -1300 -6300 2    50   ~ 0
IR4
Text Label -1300 -6200 2    50   ~ 0
IR5
Text Label -1300 -6100 2    50   ~ 0
IR6
Entry Wire Line
	-1300 -6100 -1200 -6200
Entry Wire Line
	-1300 -6200 -1200 -6300
Entry Wire Line
	-1300 -6300 -1200 -6400
Entry Wire Line
	-1300 -6400 -1200 -6500
Entry Wire Line
	-1300 -6500 -1200 -6600
Entry Wire Line
	-1300 -6600 -1200 -6700
Entry Wire Line
	-1300 -6700 -1200 -6800
Entry Bus Bus
	-1200 -6850 -1100 -6950
Wire Bus Line
	-1100 -6950 -800 -6950
Text Label -800 -6950 2    50   ~ 0
IR[0..6]
Text Label -1050 -5700 2    50   ~ 0
~WRITE-FL
Text Label -1050 -5900 2    50   ~ 0
FL
Text Label -1050 -5800 2    50   ~ 0
FV
Text Notes -1000 -5900 0    50   ~ 0
← ALU
Text Notes -1000 -6700 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -5700 0    50   ~ 0
→ ALU
Wire Wire Line
	-1650 -2800 -1050 -2800
Text Notes -1000 -6600 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6500 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6400 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6300 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -6200 0    50   ~ 0
→ BUS.MBU
Text Notes -1000 -5800 0    50   ~ 0
← ALU
Wire Wire Line
	-1650 -3100 -1050 -3100
Wire Wire Line
	-1650 -3000 -1050 -3000
Wire Wire Line
	-1650 -3500 -1050 -3500
Wire Wire Line
	-1650 -3400 -1050 -3400
Wire Wire Line
	-1650 -3300 -1050 -3300
Wire Wire Line
	-1650 -3200 -1050 -3200
Wire Wire Line
	-1650 -3600 -1050 -3600
Text Label -1050 -3600 2    50   ~ 0
COND0
Text Label -1050 -3500 2    50   ~ 0
COND1
Text Label -1050 -3400 2    50   ~ 0
COND2
Text Label -1050 -3300 2    50   ~ 0
COND3
Text Label -1050 -3200 2    50   ~ 0
COND4
Text Label -1050 -3100 2    50   ~ 0
CEXT8
Text Label -1050 -3000 2    50   ~ 0
CEXT9
Text Label -1050 -5600 2    50   ~ 0
FZ
Text Label -1050 -5500 2    50   ~ 0
FN
Text Notes -1000 -5600 0    50   ~ 0
← REG
Text Notes -1000 -5500 0    50   ~ 0
← REG
Text Label -1050 -5400 2    50   ~ 0
PC10
Text Label -1050 -5300 2    50   ~ 0
PC11
Text Label -1050 -5200 2    50   ~ 0
PC12
Text Label -1050 -5100 2    50   ~ 0
PC13
Text Label -1050 -5000 2    50   ~ 0
PC14
Text Label -1050 -4900 2    50   ~ 0
PC15
Text Notes -1000 -5400 0    50   ~ 0
← REG
Text Notes -1000 -5300 0    50   ~ 0
← REG
Text Notes -1000 -5200 0    50   ~ 0
← REG
Text Notes -1000 -5100 0    50   ~ 0
← REG
Text Notes -1000 -5000 0    50   ~ 0
← REG
Text Notes -1000 -4900 0    50   ~ 0
← REG
Wire Wire Line
	-1650 -4800 -1050 -4800
Text Label -1050 -4800 2    50   ~ 0
~FPRESET
Wire Wire Line
	-1650 -4700 -1050 -4700
Text Label -1050 -4700 2    50   ~ 0
FPCLK
Wire Wire Line
	-1650 -4600 -1050 -4600
Text Label -1050 -4600 2    50   ~ 0
~FPCLK~⁄CLK
Wire Wire Line
	-1650 -3700 -1050 -3700
Text Label -1050 -3700 2    50   ~ 0
POWEROK
Wire Wire Line
	-1650 -4500 -1050 -4500
Text Label -1050 -4500 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes -1000 -4800 0    50   ~ 0
← DFP
Text Notes -1000 -4700 0    50   ~ 0
← DFP
Text Notes -1000 -4600 0    50   ~ 0
← DFP
Text Notes -1000 -3700 0    50   ~ 0
← PSU (backplane)
Text Notes -1000 -4500 0    50   ~ 0
→ DFP
Text Notes -10350 -7300 0    100  ~ 20
The Control Unit Board
Text Notes -10350 -6500 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes -1000 -3600 0    50   ~ 0
Future expansion
Text Label -1050 -4100 2    50   ~ 0
~FPµC2
Text Label -1050 -4200 2    50   ~ 0
~FPµC1
Text Label -1050 -4300 2    50   ~ 0
~FPµC0
Text Label -1050 -4400 2    50   ~ 0
~FPµA0
Text Notes -1000 -4400 0    50   ~ 0
← DFP
Text Notes -1000 -4300 0    50   ~ 0
← DFP
Text Notes -1000 -4200 0    50   ~ 0
← DFP
Text Notes -1000 -4100 0    50   ~ 0
← DFP
Text Label -1050 -4000 2    50   ~ 0
~FPIRL
Text Label -1050 -3900 2    50   ~ 0
~FPIRH
Text Notes -1000 -4000 0    50   ~ 0
← DFP
Text Notes -1000 -3900 0    50   ~ 0
← DFP
Text Label -1050 -6000 2    50   ~ 0
~WEN
Text Notes -1000 -6000 0    50   ~ 0
→ BUS
Text Notes -1000 -3800 0    50   ~ 0
← DFP
Text Label -1050 -3800 2    50   ~ 0
~FPFLAGS
Text Notes -1000 -6100 0    50   ~ 0
→ BUS.MBU
Wire Wire Line
	-2800 -4200 -3350 -4200
Text Label -3350 -4200 0    50   ~ 0
~WAITING
NoConn ~ -1050 -2800
Text Notes -1400 -2500 0    50   ~ 0
Pull-downs above are for testing\nCTL board without other boards.
$Comp
L power:GND #PWR0102
U 1 1 60407157
P -100 -3750
F 0 "#PWR0102" H -100 -4000 50  0001 C CNN
F 1 "GND" H -95 -3923 50  0000 C CNN
F 2 "" H -100 -3750 50  0001 C CNN
F 3 "" H -100 -3750 50  0001 C CNN
	1    -100 -3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-200 -4900 -100 -4900
Wire Wire Line
	-100 -5000 -100 -4900
Connection ~ -100 -5000
Wire Wire Line
	-200 -5000 -100 -5000
Wire Wire Line
	-100 -5100 -100 -5000
Connection ~ -100 -5100
Wire Wire Line
	-200 -5100 -100 -5100
Wire Wire Line
	-100 -5200 -100 -5100
Connection ~ -100 -5200
Wire Wire Line
	-200 -5200 -100 -5200
Wire Wire Line
	-100 -5300 -100 -5200
Connection ~ -100 -5300
Wire Wire Line
	-200 -5300 -100 -5300
Wire Wire Line
	-100 -5400 -100 -5300
Connection ~ -100 -5400
Wire Wire Line
	-200 -5400 -100 -5400
Wire Wire Line
	-100 -5500 -100 -5400
Connection ~ -100 -5500
Wire Wire Line
	-200 -5500 -100 -5500
Wire Wire Line
	-100 -5600 -100 -5500
Connection ~ -100 -5600
Wire Wire Line
	-200 -5600 -100 -5600
Wire Wire Line
	-100 -5800 -100 -5600
Connection ~ -100 -5800
Wire Wire Line
	-200 -5800 -100 -5800
Wire Wire Line
	-100 -5900 -100 -5800
Wire Wire Line
	-200 -5900 -100 -5900
$Comp
L Device:R_Small R110
U 1 1 601C6ACC
P -300 -4900
F 0 "R110" V -350 -4750 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -4900 50  0001 C CNN
F 3 "~" H -300 -4900 50  0001 C CNN
	1    -300 -4900
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R109
U 1 1 601C6AC6
P -300 -5000
F 0 "R109" V -350 -4850 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5000 50  0001 C CNN
F 3 "~" H -300 -5000 50  0001 C CNN
	1    -300 -5000
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R108
U 1 1 601B696E
P -300 -5100
F 0 "R108" V -350 -4950 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5250 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5100 50  0001 C CNN
F 3 "~" H -300 -5100 50  0001 C CNN
	1    -300 -5100
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R107
U 1 1 601B6968
P -300 -5200
F 0 "R107" V -350 -5050 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5350 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5200 50  0001 C CNN
F 3 "~" H -300 -5200 50  0001 C CNN
	1    -300 -5200
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R106
U 1 1 601A6784
P -300 -5300
F 0 "R106" V -350 -5150 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5300 50  0001 C CNN
F 3 "~" H -300 -5300 50  0001 C CNN
	1    -300 -5300
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R105
U 1 1 601A677E
P -300 -5400
F 0 "R105" V -350 -5250 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5550 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5400 50  0001 C CNN
F 3 "~" H -300 -5400 50  0001 C CNN
	1    -300 -5400
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R104
U 1 1 60196662
P -300 -5500
F 0 "R104" V -350 -5350 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5650 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5500 50  0001 C CNN
F 3 "~" H -300 -5500 50  0001 C CNN
	1    -300 -5500
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R103
U 1 1 6019665C
P -300 -5600
F 0 "R103" V -350 -5450 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5750 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5600 50  0001 C CNN
F 3 "~" H -300 -5600 50  0001 C CNN
	1    -300 -5600
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R102
U 1 1 60185C13
P -300 -5800
F 0 "R102" V -350 -5650 50  0000 C CNN
F 1 "4.7kΩ" V -400 -5950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5800 50  0001 C CNN
F 3 "~" H -300 -5800 50  0001 C CNN
	1    -300 -5800
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R101
U 1 1 6018580D
P -300 -5900
F 0 "R101" V -350 -5750 50  0000 C CNN
F 1 "4.7kΩ" V -400 -6050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -300 -5900 50  0001 C CNN
F 3 "~" H -300 -5900 50  0001 C CNN
	1    -300 -5900
	0    -1   1    0   
$EndComp
Wire Wire Line
	-1650 -5800 -400 -5800
Wire Wire Line
	-1650 -5900 -400 -5900
Wire Wire Line
	-1650 -5600 -400 -5600
Wire Wire Line
	-1650 -5500 -400 -5500
Wire Wire Line
	-1650 -5400 -400 -5400
Wire Wire Line
	-1650 -5300 -400 -5300
Wire Wire Line
	-1650 -5200 -400 -5200
Wire Wire Line
	-1650 -5100 -400 -5100
Wire Wire Line
	-1650 -5000 -400 -5000
Wire Wire Line
	-1650 -4900 -400 -4900
Wire Wire Line
	-1650 -6000 -1050 -6000
Text Notes -1000 -3500 0    50   ~ 0
Future expansion
Text Notes -1000 -3400 0    50   ~ 0
Future expansion
Text Notes -1000 -3300 0    50   ~ 0
Future expansion
Text Notes -1000 -3200 0    50   ~ 0
Future expansion
Text Notes -1000 -3100 0    50   ~ 0
Future expansion
Text Notes -1000 -3000 0    50   ~ 0
Future expansion
Connection ~ -100 -4900
Wire Wire Line
	-1650 -3800 -1050 -3800
Wire Wire Line
	-1650 -3900 -1050 -3900
Wire Wire Line
	-1650 -4000 -1050 -4000
Wire Wire Line
	-1650 -4100 -1050 -4100
Wire Wire Line
	-1650 -4200 -1050 -4200
Wire Wire Line
	-1650 -4300 -1050 -4300
Wire Wire Line
	-1650 -4400 -1050 -4400
Wire Wire Line
	-100 -4900 -100 -3750
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 60987323
P 11900 -6800
F 0 "P2" H 11900 -6633 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 11900 -6724 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 11775 -7675 50  0001 C CNN
F 3 "" H 11775 -7675 50  0001 C CNN
	1    11900 -6800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C22
U 1 1 5EFD0822
P 20200 -1850
AR Path="/5EFD0822" Ref="C22"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C22" H 20112 -1804 50  0000 R CNN
F 1 "47µF" H 20112 -1895 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 20200 -1850 50  0001 C CNN
F 3 "~" H 20200 -1850 50  0001 C CNN
	1    20200 -1850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C21
U 1 1 5DF0FF8F
P 19750 -1850
AR Path="/5DF0FF8F" Ref="C21"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C21" H 19662 -1804 50  0000 R CNN
F 1 "47µF" H 19662 -1895 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 19750 -1850 50  0001 C CNN
F 3 "~" H 19750 -1850 50  0001 C CNN
	1    19750 -1850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C20
U 1 1 5DF0FFA3
P 19300 -1850
AR Path="/5DF0FFA3" Ref="C20"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C20" H 19212 -1804 50  0000 R CNN
F 1 "47µF" H 19212 -1895 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 19300 -1850 50  0001 C CNN
F 3 "~" H 19300 -1850 50  0001 C CNN
	1    19300 -1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4150 1100 -4700 1100
Wire Wire Line
	-4150 1200 -4700 1200
Wire Wire Line
	-4150 1300 -4700 1300
Wire Wire Line
	-4150 1400 -4700 1400
Wire Wire Line
	-4150 1000 -4700 1000
Wire Wire Line
	-4150 2300 -4700 2300
Wire Wire Line
	-4150 2400 -4700 2400
Wire Wire Line
	-4150 2500 -4700 2500
Wire Wire Line
	-4150 2000 -4700 2000
Wire Wire Line
	-4150 2800 -4700 2800
Wire Wire Line
	-4150 2900 -4700 2900
Wire Wire Line
	-4150 3000 -4700 3000
Wire Wire Line
	-4150 3100 -4700 3100
Wire Wire Line
	-4150 2700 -4700 2700
Wire Wire Line
	-4150 2600 -4700 2600
Wire Wire Line
	-4150 3400 -4700 3400
Wire Wire Line
	-4150 3500 -4700 3500
Wire Wire Line
	-4150 3300 -4700 3300
Wire Wire Line
	-4150 3200 -4700 3200
Text Label -4700 2000 0    50   ~ 0
~IRQ
Wire Wire Line
	-4150 1800 -4700 1800
Wire Bus Line
	-4700 900  -4150 900 
Text Label -4700 900  0    50   ~ 0
IBUS[0..15]
Text Label -4700 1000 0    50   ~ 0
~RESET
Text Label -4700 1100 0    50   ~ 0
CLK1
Text Label -4700 1200 0    50   ~ 0
CLK2
Text Label -4700 1300 0    50   ~ 0
CLK3
Text Label -4700 1400 0    50   ~ 0
CLK4
Wire Wire Line
	-4150 2100 -4700 2100
Text Label -4700 2100 0    50   ~ 0
~IRQS
Text Label -4700 2300 0    50   ~ 0
~RSTHOLD
Text Label -4700 2400 0    50   ~ 0
~SYSDEV
Text Label -4700 2500 0    50   ~ 0
~IODEV1xx
Text Label -4700 2600 0    50   ~ 0
~IODEV2xx
Text Label -4700 2700 0    50   ~ 0
~IODEV3xx
Text Label -4700 2800 0    50   ~ 0
~MEM
Text Label -4700 2900 0    50   ~ 0
~IO
Text Label -4700 3000 0    50   ~ 0
~R
Text Label -4700 3200 0    50   ~ 0
~WS
Text Label -4700 3300 0    50   ~ 0
~ENDEXT
Text Label -4700 3400 0    50   ~ 0
~SKIPEXT
Text Label -4700 3500 0    50   ~ 0
~HALT
Text Label -4700 3800 0    50   ~ 0
ACTION[0..3]
Text Label -4700 3900 0    50   ~ 0
WADDR[0..4]
Text Label -4700 4000 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-4150 3800 -4700 3800
Wire Bus Line
	-4150 3900 -4700 3900
Wire Bus Line
	-4150 4000 -4700 4000
Wire Bus Line
	-4700 4100 -4150 4100
Text Label -4700 4100 0    50   ~ 0
RSVD[1..4]
Text Notes -3400 3250 1    100  ~ 20
Backplane Slot
Text Label -4700 3100 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 6084E503
P -1650 5350
AR Path="/5F67D4B5/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/6084E503" Ref="#PWR02"  Part="1" 
AR Path="/5D34E810/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E503" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H -1650 5200 50  0001 C CNN
F 1 "+5V" H -1708 5387 50  0000 R CNN
F 2 "" H -1650 5350 50  0001 C CNN
F 3 "" H -1650 5350 50  0001 C CNN
	1    -1650 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P -1650 5750
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR04"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H -1650 5500 50  0001 C CNN
F 1 "GND" H -1728 5713 50  0000 R CNN
F 2 "" H -1650 5750 50  0001 C CNN
F 3 "" H -1650 5750 50  0001 C CNN
	1    -1650 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 5350 -1650 5450
$Comp
L Device:CP_Small C2
U 1 1 6084E505
P -1650 5550
AR Path="/6084E505" Ref="C2"  Part="1" 
AR Path="/5D34E810/6084E505" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6084E505" Ref="C?"  Part="1" 
F 0 "C2" H -1738 5596 50  0000 R CNN
F 1 "47µF" H -1738 5505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1650 5550 50  0001 C CNN
F 3 "~" H -1650 5550 50  0001 C CNN
	1    -1650 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 5650 -1650 5750
$Comp
L power:+5V #PWR?
U 1 1 6084E506
P -2100 5350
AR Path="/5F67D4B5/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/6084E506" Ref="#PWR01"  Part="1" 
AR Path="/5D34E810/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E506" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H -2100 5200 50  0001 C CNN
F 1 "+5V" H -2158 5387 50  0000 R CNN
F 2 "" H -2100 5350 50  0001 C CNN
F 3 "" H -2100 5350 50  0001 C CNN
	1    -2100 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6084E507
P -2100 5750
AR Path="/5F67D4B5/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/6084E507" Ref="#PWR03"  Part="1" 
AR Path="/5D34E810/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E507" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H -2100 5500 50  0001 C CNN
F 1 "GND" H -2178 5713 50  0000 R CNN
F 2 "" H -2100 5750 50  0001 C CNN
F 3 "" H -2100 5750 50  0001 C CNN
	1    -2100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 5350 -2100 5450
$Comp
L Device:CP_Small C1
U 1 1 5D8C8453
P -2100 5550
AR Path="/5D8C8453" Ref="C1"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C1" H -2188 5596 50  0000 R CNN
F 1 "47µF" H -2188 5505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2100 5550 50  0001 C CNN
F 3 "~" H -2100 5550 50  0001 C CNN
	1    -2100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 5650 -2100 5750
Text Label -2650 3100 2    50   ~ 0
AC0
Text Label -2650 3200 2    50   ~ 0
AC1
Text Label -2650 3300 2    50   ~ 0
AC2
Text Label -2650 3400 2    50   ~ 0
AC3
Text Label -2650 3500 2    50   ~ 0
AC4
Text Label -2650 3600 2    50   ~ 0
AC5
Text Label -2650 3700 2    50   ~ 0
AC6
Text Label -2650 3800 2    50   ~ 0
AC7
Text Label -2650 3900 2    50   ~ 0
AC8
Text Label -2650 4000 2    50   ~ 0
AC9
Text Label -2650 4100 2    50   ~ 0
AC10
Text Label -2650 4200 2    50   ~ 0
AC11
Text Label -2650 4300 2    50   ~ 0
AC12
Text Label -2650 4400 2    50   ~ 0
AC13
Text Label -2650 4500 2    50   ~ 0
AC14
Text Label -2650 4600 2    50   ~ 0
AC15
Wire Wire Line
	-3000 3100 -2650 3100
Wire Wire Line
	-3000 3200 -2650 3200
Wire Wire Line
	-3000 3300 -2650 3300
Wire Wire Line
	-3000 3400 -2650 3400
Wire Wire Line
	-3000 3500 -2650 3500
Wire Wire Line
	-3000 3600 -2650 3600
Wire Wire Line
	-3000 3700 -2650 3700
Wire Wire Line
	-3000 3800 -2650 3800
Wire Wire Line
	-3000 3900 -2650 3900
Wire Wire Line
	-3000 4000 -2650 4000
Wire Wire Line
	-3000 4100 -2650 4100
Wire Wire Line
	-3000 4200 -2650 4200
Wire Wire Line
	-3000 4300 -2650 4300
Wire Wire Line
	-3000 4400 -2650 4400
Wire Wire Line
	-3000 4500 -2650 4500
Wire Wire Line
	-3000 4600 -2650 4600
Wire Wire Line
	-3000 1800 -2650 1800
NoConn ~ -4700 1100
NoConn ~ -4700 2000
NoConn ~ -4700 2100
NoConn ~ -4700 2400
NoConn ~ -4700 2500
NoConn ~ -4700 2600
NoConn ~ -4700 2700
NoConn ~ -4700 2800
NoConn ~ -4700 2900
NoConn ~ -4700 3000
NoConn ~ -4700 3100
NoConn ~ -4700 3200
NoConn ~ -4700 3300
NoConn ~ -4700 3400
NoConn ~ -4700 3500
NoConn ~ -4700 4100
Wire Wire Line
	-3000 1700 -2650 1700
Wire Wire Line
	-3000 1600 -2450 1600
Wire Wire Line
	-3000 3000 -2950 3000
Wire Wire Line
	-3000 900  -2650 900 
Wire Wire Line
	-3000 1000 -2650 1000
Wire Wire Line
	-3000 1100 -2650 1100
Wire Wire Line
	-3000 1200 -2650 1200
Wire Wire Line
	-3000 1300 -2650 1300
Wire Wire Line
	-3000 1400 -2650 1400
Wire Wire Line
	-3000 1500 -2650 1500
Text Label -2650 900  2    50   ~ 0
IR0
Text Label -2650 1000 2    50   ~ 0
IR1
Text Label -2650 1100 2    50   ~ 0
IR2
Text Label -2650 1200 2    50   ~ 0
IR3
Text Label -2650 1300 2    50   ~ 0
IR4
Text Label -2650 1400 2    50   ~ 0
IR5
Text Label -2650 1500 2    50   ~ 0
IR6
Entry Wire Line
	-2650 1500 -2550 1400
Entry Wire Line
	-2650 1400 -2550 1300
Entry Wire Line
	-2650 1300 -2550 1200
Entry Wire Line
	-2650 1200 -2550 1100
Entry Wire Line
	-2650 1100 -2550 1000
Entry Wire Line
	-2650 1000 -2550 900 
Entry Wire Line
	-2650 900  -2550 800 
Entry Bus Bus
	-2550 750  -2450 650 
Wire Bus Line
	-2450 650  -2150 650 
Text Label -2150 650  2    50   ~ 0
IR[0..6]
Text Label -2650 1800 2    50   ~ 0
~FLAGWE
Text Label -2450 1600 2    50   ~ 0
FL-OFFBOARD
Text Label -2650 1700 2    50   ~ 0
FV
Text Notes -2450 1600 0    50   ~ 0
→ Control Unit
Text Notes -2450 1700 0    50   ~ 0
→ Control Unit
Text Notes -2450 1500 0    50   ~ 0
← Control Unit
Text Notes -2450 1400 0    50   ~ 0
← Control Unit
Text Notes -2450 1300 0    50   ~ 0
← Control Unit
Text Notes -2450 1200 0    50   ~ 0
← Control Unit
Text Notes -2450 1100 0    50   ~ 0
← Control Unit
Text Notes -2450 1000 0    50   ~ 0
← Control Unit
Text Notes -2450 900  0    50   ~ 0
← Control Unit
Wire Bus Line
	-6050 1150 -5550 1150
Text Label -5550 1150 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	-6050 1500 -5550 1500
Wire Wire Line
	-6050 1600 -5550 1600
Wire Wire Line
	-6050 1700 -5550 1700
Wire Wire Line
	-6050 1800 -5550 1800
Wire Wire Line
	-6050 1900 -5550 1900
Wire Wire Line
	-6050 2000 -5550 2000
Text Label -5550 1500 2    50   ~ 0
X0
Text Label -5550 1600 2    50   ~ 0
X1
Text Label -5550 2000 2    50   ~ 0
~SETL-ROM
$Sheet
S -7200 2650 1150 2100
U 5DF75CDE
F0 "sheet5DF75CCD" 50
F1 "Serial_Shifter.sch" 50
F2 "CLK2" I L -7200 3000 50 
F3 "CLK4" I L -7200 3200 50 
F4 "DIST[0..3]" I L -7200 3600 50 
F5 "~SHIFT~∕ROTATE" I L -7200 4050 50 
F6 "~LOGIC~∕ARITH" I L -7200 3900 50 
F7 "~LEFT~∕RIGHT" I L -7200 3750 50 
F8 "B[0..15]" I L -7200 4350 50 
F9 "~RESET" I L -7200 2800 50 
F10 "IBUS[0..15]" B R -6050 4250 50 
F11 "FLOUT-SRU" O R -6050 4450 50 
F12 "FLFAST" I L -7200 4450 50 
F13 "BCP" O R -6050 4350 50 
F14 "~START" I L -7200 4200 50 
F15 "~RSTHOLD" I L -7200 2900 50 
F16 "CLK3" I L -7200 3100 50 
$EndSheet
Text Label -7700 4350 0    50   ~ 0
B[0..15]
Wire Wire Line
	-7200 4050 -7700 4050
Wire Wire Line
	-7200 3900 -7700 3900
Wire Wire Line
	-7200 3750 -7700 3750
Wire Bus Line
	-7200 3600 -7700 3600
Text Label -7700 3600 0    50   ~ 0
IR[0..3]
Text Label -7700 3750 0    50   ~ 0
IR4
Text Label -7700 3900 0    50   ~ 0
IR5
Text Label -7700 4050 0    50   ~ 0
IR6
Wire Wire Line
	-7700 2800 -7200 2800
Wire Wire Line
	-7200 3200 -7700 3200
Wire Wire Line
	-7200 3000 -7700 3000
Text Label -7700 3200 0    50   ~ 0
CLK4
Wire Wire Line
	-6050 4350 -5550 4350
Text Label -5550 4350 2    50   ~ 0
BCP
Text Label -7700 2800 0    50   ~ 0
~RESET
Text Label -7700 3000 0    50   ~ 0
CLK2
Text Label -7700 4450 0    50   ~ 0
FLFAST
Wire Wire Line
	-6050 4450 -5550 4450
Wire Bus Line
	-6050 4250 -5550 4250
Text Label -5550 4250 2    50   ~ 0
IBUS[0..15]
Text Label -5550 4450 2    50   ~ 0
FLOUT-SRU
Text Notes -6100 4700 2    79   ~ 16
SRU
Text Label -10800 2200 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-10250 2200 -10800 2200
Wire Wire Line
	-10800 2100 -10250 2100
Text Label -10800 2100 0    50   ~ 0
T34
Text Label -10800 2300 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	-10250 2300 -10800 2300
Text Label -10800 2400 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	-10250 2400 -10800 2400
Wire Wire Line
	-9100 2300 -8550 2300
Text Label -8550 2200 2    50   ~ 0
~READ-ALU-B
Text Label -8550 2300 2    50   ~ 0
~WRITE-ALU-B
Text Label -7700 5950 0    50   ~ 0
~FLAGWE
Text Label -7700 5450 0    50   ~ 0
CLK4
Text Label -7700 5300 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	-7700 5950 -7200 5950
Text Label -5500 5300 2    50   ~ 0
FV
Wire Wire Line
	-6050 5300 -5500 5300
Text Label -8050 5300 2    50   ~ 0
FL
Text Label -10900 6200 0    50   ~ 0
~FLAGWE
Text Label -7700 6050 0    50   ~ 0
IBUS13
Wire Wire Line
	-7200 6050 -7700 6050
Text Label -10900 6300 0    50   ~ 0
IBUS12
Wire Wire Line
	-10200 6300 -10900 6300
Text Label -10900 5450 0    50   ~ 0
CLK4
Wire Wire Line
	-7200 5450 -7700 5450
Wire Wire Line
	-7200 5300 -7700 5300
Text Label -10900 5300 0    50   ~ 0
~RSTHOLD
$Sheet
S -7200 5150 1150 1100
U 5D35C694
F0 "Overflow Register (V)" 50
F1 "cft_reg_v_2019.sch" 50
F2 "FV" O R -6050 5300 50 
F3 "~SETV-ROM" I L -7200 5650 50 
F4 "CLK4" I L -7200 5450 50 
F5 "~RSTHOLD" I L -7200 5300 50 
F6 "IBUS13" I L -7200 6050 50 
F7 "FVOUT-ROM" I L -7200 5750 50 
F8 "~FLAGWE" I L -7200 5950 50 
$EndSheet
Text Notes -11850 5300 0    100  ~ 20
Flags
Text Notes -9150 3900 2    79   ~ 16
A
Text Notes -9150 4700 2    79   ~ 16
B
Wire Bus Line
	-10800 3800 -10250 3800
Text Label -10800 3800 0    50   ~ 0
AC[0..15]
Text Label -10800 4350 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	-10900 4550 -10250 4550
Text Label -10900 4650 0    50   ~ 0
~READ-ALU-B
Text Label -10900 4550 0    50   ~ 0
BCP
Wire Wire Line
	-10250 4650 -10900 4650
Text Label -9000 4350 0    50   ~ 0
B[0..15]
Wire Bus Line
	-8250 4350 -9100 4350
$Sheet
S -10250 4200 1150 550 
U 5DEA5E6C
F0 "Port B" 50
F1 "alu_port_b.sch" 50
F2 "IBUS[0..15]" B L -10250 4350 50 
F3 "B[0..15]" T R -9100 4350 50 
F4 "~READ-ALU-B" I L -10250 4650 50 
F5 "~WRITE-ALU-B" I L -10250 4450 50 
F6 "BCP" I L -10250 4550 50 
$EndSheet
Text Label -9000 3650 0    50   ~ 0
A[0..15]
$Sheet
S -10250 3500 1150 450 
U 5DE6D8E0
F0 "Port A" 50
F1 "alu_port_a.sch" 50
F2 "A[0..15]" T R -9100 3650 50 
F3 "ACP" I L -10250 3650 50 
F4 "AC[0..15]" I L -10250 3800 50 
$EndSheet
Text Notes -11400 4000 2    100  ~ 20
Ports
Wire Wire Line
	-10900 5300 -10200 5300
Wire Wire Line
	-10900 5450 -10200 5450
Wire Wire Line
	-10900 6200 -10200 6200
$Sheet
S -10200 5150 1150 1650
U 5D121AA3
F0 "Link Register (L)" 50
F1 "cft_reg_l_2019.sch" 50
F2 "FL" O R -9050 5300 50 
F3 "CLK4" I L -10200 5450 50 
F4 "~FLAGWE" I L -10200 6200 50 
F5 "FLOUT-ROM" I L -10200 5800 50 
F6 "IBUS12" I L -10200 6300 50 
F7 "~RSTHOLD" I L -10200 5300 50 
F8 "~ACTION-CLL" I L -10200 6600 50 
F9 "~ACTION-CPL" I L -10200 6500 50 
F10 "BCP" I L -10200 5950 50 
F11 "FLOUT-SRU" I L -10200 6050 50 
F12 "FLFAST" O R -9050 5400 50 
F13 "~SETL-ROM" I L -10200 5700 50 
$EndSheet
Text Label -8050 5400 2    50   ~ 0
FLFAST
Wire Wire Line
	-10200 5950 -10900 5950
Text Label -10900 5950 0    50   ~ 0
BCP
Wire Wire Line
	-10200 6050 -10900 6050
Text Label -10900 6050 0    50   ~ 0
FLOUT-SRU
Wire Wire Line
	-10200 6600 -10900 6600
Text Label -10900 6500 0    50   ~ 0
~ACTION-CPL
Text Label -10900 6600 0    50   ~ 0
~ACTION-CLL
Entry Bus Bus
	-8150 1800 -8050 1700
Entry Bus Bus
	-8150 4250 -8050 4350
Wire Bus Line
	-8050 4350 -7200 4350
Entry Bus Bus
	-8250 4350 -8150 4250
Entry Bus Bus
	-8050 1600 -8150 1700
Wire Bus Line
	-8250 1800 -8150 1700
Entry Bus Bus
	-5550 1150 -5450 1250
Entry Bus Bus
	-5450 4150 -5550 4250
Entry Bus Bus
	-11000 4250 -10900 4350
Wire Bus Line
	-11000 4250 -11000 3300
Entry Bus Bus
	-10900 3200 -11000 3300
Wire Bus Line
	-10900 3200 -8450 3200
Entry Bus Bus
	-8350 3100 -8450 3200
Entry Bus Bus
	-5550 800  -5450 900 
Entry Bus Bus
	-8050 800  -8150 900 
Wire Bus Line
	-5550 800  -8050 800 
Wire Bus Line
	-8350 3100 -8350 1100
Wire Bus Line
	-8350 1100 -8150 900 
Text Notes -2400 3950 1    50   ~ 0
Input From REG Board
Entry Wire Line
	-2550 3000 -2650 3100
Entry Wire Line
	-2550 3100 -2650 3200
Entry Wire Line
	-2550 3200 -2650 3300
Entry Wire Line
	-2550 3300 -2650 3400
Entry Wire Line
	-2550 3400 -2650 3500
Entry Wire Line
	-2550 3500 -2650 3600
Entry Wire Line
	-2550 3600 -2650 3700
Entry Wire Line
	-2550 3700 -2650 3800
Entry Wire Line
	-2550 3800 -2650 3900
Entry Wire Line
	-2550 3900 -2650 4000
Entry Wire Line
	-2550 4000 -2650 4100
Entry Wire Line
	-2550 4100 -2650 4200
Entry Wire Line
	-2550 4200 -2650 4300
Entry Wire Line
	-2550 4300 -2650 4400
Entry Wire Line
	-2550 4400 -2650 4500
Entry Wire Line
	-2550 4500 -2650 4600
Text Label -2400 2800 0    50   ~ 0
AC[0..15]
Wire Bus Line
	-2450 2800 -2050 2800
Entry Bus Bus
	-2550 2900 -2450 2800
Wire Wire Line
	-7800 4450 -7200 4450
Text Label -8550 2000 2    50   ~ 0
~ALU-OP
Text Label -8550 2500 2    50   ~ 0
~ACTION-CLL
Text Label -8550 2400 2    50   ~ 0
~ACTION-CPL
Wire Wire Line
	-9100 2500 -8550 2500
Text Label -8550 2700 2    50   ~ 0
~ACTION-SRU
$Sheet
S -10250 1850 1150 1000
U 5E1C970B
F0 "Decoders" 50
F1 "alu_decoder.sch" 50
F2 "RADDR[0..4]" I L -10250 2200 50 
F3 "WADDR[0..4]" I L -10250 2300 50 
F4 "T34" I L -10250 2100 50 
F5 "ACTION[0..4]" I L -10250 2400 50 
F6 "~WRITE-ALU-B" O R -9100 2300 50 
F7 "~ACTION-SRU" O R -9100 2700 50 
F8 "~ACTION-CPL" O R -9100 2400 50 
F9 "~ACTION-CLL" O R -9100 2500 50 
F10 "~READ-ALU-B" O R -9100 2200 50 
F11 "~ACTION-110" O R -9100 2600 50 
F12 "~READ-ALU-Y" O R -9100 2100 50 
F13 "~ALU-OP" O R -9100 2000 50 
F14 "ACP" O L -10250 2700 50 
F15 "CLK4" I L -10250 2000 50 
$EndSheet
Text Label -8250 2550 1    50   ~ 0
A[0..15]
Text Label -8350 2550 1    50   ~ 0
IBUS[0..15]
Wire Bus Line
	-9100 3650 -8350 3650
Entry Bus Bus
	-8250 3550 -8350 3650
Wire Bus Line
	-8250 1800 -8250 3550
Text Label -8150 4000 1    50   ~ 0
B[0..15]
Wire Wire Line
	-7800 4450 -7800 5400
Wire Wire Line
	-9050 5400 -7800 5400
Wire Wire Line
	-9050 5300 -8950 5300
Wire Bus Line
	-8050 1600 -7200 1600
Wire Bus Line
	-8050 1700 -7200 1700
Text Label -7900 5050 1    50   ~ 0
FL
Text Label -7800 5050 1    50   ~ 0
FLFAST
Wire Wire Line
	-10200 5700 -10900 5700
Wire Wire Line
	-10200 5800 -10900 5800
Text Label -10900 5800 0    50   ~ 0
FLOUT-ROM
Wire Wire Line
	-7200 5650 -7700 5650
Wire Wire Line
	-7200 5750 -7700 5750
Text Label -7700 5650 0    50   ~ 0
~SETV-ROM
Text Label -7700 5750 0    50   ~ 0
FVOUT-ROM
Text Label -5550 1900 2    50   ~ 0
FLOUT-ROM
Text Label -5550 1800 2    50   ~ 0
~SETV-ROM
Text Label -5550 1700 2    50   ~ 0
FVOUT-ROM
Wire Wire Line
	-7700 4200 -7200 4200
Text Label -7700 4200 0    50   ~ 0
~ACTION-SRU
Text Label -8150 2550 1    50   ~ 0
B[0..15]
Text Label -7900 2550 1    50   ~ 0
FL
Wire Wire Line
	-9100 2400 -8550 2400
Wire Wire Line
	-10200 6500 -10900 6500
Text Notes -2450 1800 0    50   ~ 0
← Control Unit
Wire Wire Line
	-3000 4700 -2650 4700
Wire Wire Line
	-3000 4800 -2650 4800
NoConn ~ -2650 4700
NoConn ~ -2650 4800
Wire Wire Line
	-3000 1900 -2650 1900
Wire Wire Line
	-3000 2000 -2650 2000
Wire Wire Line
	-3000 2100 -2650 2100
Wire Wire Line
	-3000 2200 -2650 2200
Wire Wire Line
	-3000 2300 -2650 2300
Wire Wire Line
	-3000 2400 -2650 2400
Wire Wire Line
	-3000 2700 -2950 2700
Wire Wire Line
	-3000 2800 -2650 2800
Wire Wire Line
	-3000 2500 -2650 2500
Wire Wire Line
	-3000 2600 -2650 2600
NoConn ~ -2650 2800
Text Notes -1850 1900 3    50   ~ 0
For ROM Expansion
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5DC7BFB4
P -8100 1500
AR Path="/5DE3C078/5DC7BFB4" Ref="JP?"  Part="1" 
AR Path="/5DC7BFB4" Ref="JP1"  Part="1" 
F 0 "JP1" H -8100 1613 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H -8100 1614 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H -8100 1500 50  0001 C CNN
F 3 "~" H -8100 1500 50  0001 C CNN
	1    -8100 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5DC97446
P -8250 1550
F 0 "#PWR0113" H -8250 1300 50  0001 C CNN
F 1 "GND" H -8250 1650 50  0000 C CNN
F 2 "" H -8250 1550 50  0001 C CNN
F 3 "" H -8250 1550 50  0001 C CNN
	1    -8250 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8250 1500 -8250 1550
Text Label -4150 5550 0    50   ~ 0
~ACTION-110
$Comp
L Connector:TestPoint TP?
U 1 1 5DCFA7A8
P -3400 5550
AR Path="/5DF75CDE/5DCFA7A8" Ref="TP?"  Part="1" 
AR Path="/5DCFA7A8" Ref="TP14"  Part="1" 
F 0 "TP14" V -3400 5738 50  0000 L CNN
F 1 "TestPoint" H -3342 5577 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -3200 5550 50  0001 C CNN
F 3 "~" H -3200 5550 50  0001 C CNN
	1    -3400 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	-3400 5550 -4150 5550
Text Notes -4150 5400 0    50   ~ 0
Actions for future expansion
Wire Wire Line
	-7950 1500 -7200 1500
$Comp
L Connector:TestPoint TP3
U 1 1 5DD216FF
P -2950 2900
F 0 "TP3" V -2950 3088 50  0000 L CNN
F 1 "TestPoint" V -2905 3088 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2750 2900 50  0001 C CNN
F 3 "~" H -2750 2900 50  0001 C CNN
	1    -2950 2900
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5DCAA8B1
P -2650 2500
F 0 "TP1" V -2650 2688 50  0000 L CNN
F 1 "TestPoint" V -2605 2688 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2450 2500 50  0001 C CNN
F 3 "~" H -2450 2500 50  0001 C CNN
	1    -2650 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	-3000 2900 -2950 2900
$Comp
L Connector:TestPoint TP2
U 1 1 5DCF8FE6
P -2950 2700
F 0 "TP2" V -2950 2888 50  0000 L CNN
F 1 "TestPoint" V -2905 2888 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2750 2700 50  0001 C CNN
F 3 "~" H -2750 2700 50  0001 C CNN
	1    -2950 2700
	0    1    1    0   
$EndComp
NoConn ~ -2650 1900
NoConn ~ -2650 2000
NoConn ~ -2650 2100
NoConn ~ -2650 2200
NoConn ~ -2650 2300
NoConn ~ -2650 2400
NoConn ~ -2650 2600
$Comp
L Connector:TestPoint TP4
U 1 1 5DE16EEE
P -2950 3000
F 0 "TP4" V -2950 3188 50  0000 L CNN
F 1 "TestPoint" V -2905 3188 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2750 3000 50  0001 C CNN
F 3 "~" H -2750 3000 50  0001 C CNN
	1    -2950 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5DCC470D
P -8800 5150
F 0 "R2" V -8996 5150 50  0000 C CNN
F 1 "30Ω" V -8905 5150 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -8800 5150 50  0001 C CNN
F 3 "~" H -8800 5150 50  0001 C CNN
	1    -8800 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	-8900 5150 -8950 5150
Wire Wire Line
	-8950 5150 -8950 5300
Connection ~ -8950 5300
Wire Wire Line
	-8950 5300 -7900 5300
Wire Wire Line
	-8700 5150 -8050 5150
Text Label -8050 5150 2    50   ~ 0
FL-OFFBOARD
Wire Wire Line
	-7200 2900 -7700 2900
Text Label -7700 2900 0    50   ~ 0
~RSTHOLD
Text Label -4700 1800 0    50   ~ 0
T34
Wire Bus Line
	-10900 4350 -10250 4350
Text Label -10900 5700 0    50   ~ 0
~SETL-ROM
Wire Wire Line
	-10250 4450 -10900 4450
Text Label -10900 4450 0    50   ~ 0
~WRITE-ALU-B
Wire Wire Line
	-9100 2600 -8550 2600
Text Label -8550 2600 2    50   ~ 0
~ACTION-110
Wire Wire Line
	-9100 2200 -8550 2200
Text Label -8550 2100 2    50   ~ 0
~READ-ALU-Y
Text Label -7700 1700 0    50   ~ 0
B[0..15]
Text Label -7700 1600 0    50   ~ 0
A[0..15]
Text Label -7700 1500 0    50   ~ 0
X-IN
Text Label -7700 1850 0    50   ~ 0
FL
Wire Wire Line
	-10250 2700 -10400 2700
Wire Wire Line
	-10400 2700 -10400 3650
Wire Wire Line
	-10400 3650 -10250 3650
$Sheet
S -7200 1000 1150 1300
U 5DE3C078
F0 "sheet5DE3C026" 50
F1 "cft_alu_rom.sch" 50
F2 "A[0..15]" I L -7200 1600 50 
F3 "B[0..15]" I L -7200 1700 50 
F4 "FL" I L -7200 1850 50 
F5 "RADDR0" I L -7200 1950 50 
F6 "RADDR1" I L -7200 2050 50 
F7 "RADDR2" I L -7200 2150 50 
F8 "~ALU-OP" I L -7200 1150 50 
F9 "X-IN" I L -7200 1500 50 
F10 "IBUS[0..15]" T R -6050 1150 50 
F11 "X1" O R -6050 1600 50 
F12 "X0" O R -6050 1500 50 
F13 "FVOUT-ROM" O R -6050 1700 50 
F14 "~SETV-ROM" O R -6050 1800 50 
F15 "FLOUT-ROM" O R -6050 1900 50 
F16 "~SETL-ROM" O R -6050 2000 50 
F17 "~READ-ALU-Y" I L -7200 1250 50 
F18 "T34" I L -7200 1350 50 
$EndSheet
Wire Wire Line
	-7200 1350 -7700 1350
Text Label -7700 1350 0    50   ~ 0
T34
Connection ~ -7900 5300
Wire Wire Line
	-7900 5300 -7900 5350
Text Label -7700 1950 0    50   ~ 0
RADDR0
Text Label -7700 2050 0    50   ~ 0
RADDR1
Text Label -7700 2150 0    50   ~ 0
RADDR2
Wire Wire Line
	-7700 2050 -7200 2050
Wire Wire Line
	-7700 1950 -7200 1950
Wire Wire Line
	-7200 2150 -7700 2150
Wire Wire Line
	-7200 1850 -7900 1850
Wire Wire Line
	-7900 1850 -7900 5300
Text Notes -4350 400  0    197  ~ 39
Edge Connector
Text Notes -5200 2800 1    100  ~ 20
Operations
Text Notes -11850 2250 0    100  ~ 20
Control
Wire Wire Line
	-7700 3100 -7200 3100
Text Label -7700 3100 0    50   ~ 0
CLK3
Wire Bus Line
	-8150 1800 -8150 4250
Text Label -9000 3200 0    50   ~ 0
IBUS[0..15]
Text Label -7700 1150 0    50   ~ 0
~ALU-OP
Text Label -7700 1250 0    50   ~ 0
~READ-ALU-Y
Wire Wire Line
	-9100 2000 -8550 2000
Wire Wire Line
	-9100 2100 -8550 2100
Wire Wire Line
	-7700 1150 -7200 1150
Wire Wire Line
	-7700 1250 -7200 1250
Wire Wire Line
	-9100 2700 -8550 2700
Text Notes -12000 400  0    197  ~ 39
The ALU
Text Notes -11950 1500 0    50   ~ 0
The CFT's ALU is probably among the most complex units of the processor. The 2019\nedition uses three ROMs containing all binary and unary operations except shifts and\nrolls. (the original ALU used 6 larger ROMs). The ROMs can perform two's complement\naddition (with carry and overflow), and bitwise AND, OR, XOR and NOT. Three of the\neight possible operations are still undefined.\n\nA separate unit can perform rolls, bitwise shifts and sign-extending (arithmethic) right\nshifts. This is a serial unit, not a barrel shifter, so the longer the bit distance the\nlonger it takes to calculate it. It's still better tha having to wait several clock cycles for\na single bit though.\n\nAlso present here are the L register and V flag.
Text Notes -9100 6750 2    79   ~ 16
L
Text Notes -6100 6200 2    79   ~ 16
V
Text Notes -6100 2250 2    79   ~ 16
ROM
Wire Notes Line
	-4250 5250 -2950 5250
Wire Notes Line
	-2950 5250 -2950 5700
Wire Notes Line
	-2950 5700 -4250 5700
Wire Notes Line
	-4250 5700 -4250 5250
Wire Wire Line
	-10800 2000 -10250 2000
Text Label -10800 2000 0    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5F91D04D
P -2550 5350
AR Path="/5F67D4B5/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F91D04D" Ref="#PWR012"  Part="1" 
AR Path="/5D34E810/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D04D" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H -2550 5200 50  0001 C CNN
F 1 "+5V" H -2608 5387 50  0000 R CNN
F 2 "" H -2550 5350 50  0001 C CNN
F 3 "" H -2550 5350 50  0001 C CNN
	1    -2550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F91D053
P -2550 5750
AR Path="/5F67D4B5/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F91D053" Ref="#PWR013"  Part="1" 
AR Path="/5D34E810/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D053" Ref="#PWR?"  Part="1" 
F 0 "#PWR013" H -2550 5500 50  0001 C CNN
F 1 "GND" H -2628 5713 50  0000 R CNN
F 2 "" H -2550 5750 50  0001 C CNN
F 3 "" H -2550 5750 50  0001 C CNN
	1    -2550 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 5350 -2550 5450
$Comp
L Device:CP_Small C36
U 1 1 5F91D05A
P -2550 5550
AR Path="/5F91D05A" Ref="C36"  Part="1" 
AR Path="/5D34E810/5F91D05A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5F91D05A" Ref="C?"  Part="1" 
F 0 "C36" H -2638 5596 50  0000 R CNN
F 1 "47µF" H -2638 5505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2550 5550 50  0001 C CNN
F 3 "~" H -2550 5550 50  0001 C CNN
	1    -2550 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 5650 -2550 5750
Wire Wire Line
	-750 -1950 -750 -1850
$Comp
L Device:CP_Small C102
U 1 1 5DD552C1
P -750 -2050
AR Path="/5DD552C1" Ref="C102"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C102" H -838 -2004 50  0000 R CNN
F 1 "47µF" H -838 -2095 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -750 -2050 50  0001 C CNN
F 3 "~" H -750 -2050 50  0001 C CNN
	1    -750 -2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-750 -2250 -750 -2150
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P -750 -1850
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H -750 -2100 50  0001 C CNN
F 1 "GND" H -828 -1887 50  0000 R CNN
F 2 "" H -750 -1850 50  0001 C CNN
F 3 "" H -750 -1850 50  0001 C CNN
	1    -750 -1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P -750 -2250
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H -750 -2400 50  0001 C CNN
F 1 "+5V" H -808 -2213 50  0000 R CNN
F 2 "" H -750 -2250 50  0001 C CNN
F 3 "" H -750 -2250 50  0001 C CNN
	1    -750 -2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-300 -1950 -300 -1850
$Comp
L Device:CP_Small C103
U 1 1 5DD552AD
P -300 -2050
AR Path="/5DD552AD" Ref="C103"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C103" H -388 -2004 50  0000 R CNN
F 1 "47µF" H -388 -2095 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -300 -2050 50  0001 C CNN
F 3 "~" H -300 -2050 50  0001 C CNN
	1    -300 -2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-300 -2250 -300 -2150
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P -300 -1850
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H -300 -2100 50  0001 C CNN
F 1 "GND" H -378 -1887 50  0000 R CNN
F 2 "" H -300 -1850 50  0001 C CNN
F 3 "" H -300 -1850 50  0001 C CNN
	1    -300 -1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P -300 -2250
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H -300 -2400 50  0001 C CNN
F 1 "+5V" H -358 -2213 50  0000 R CNN
F 2 "" H -300 -2250 50  0001 C CNN
F 3 "" H -300 -2250 50  0001 C CNN
	1    -300 -2250
	1    0    0    -1  
$EndComp
Wire Bus Line
	-5450 900  -5450 4150
Wire Bus Line
	2450 -4900 2450 -4100
Wire Bus Line
	-1200 -6850 -1200 -6200
Wire Bus Line
	-2550 750  -2550 1400
Wire Bus Line
	-2550 2900 -2550 4500
$EndSCHEMATC
