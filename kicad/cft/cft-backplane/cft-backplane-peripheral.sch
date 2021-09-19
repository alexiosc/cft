EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 13
Title "Peripheral Backplane"
Date ""
Rev "2134"
Comp ""
Comment1 "PB0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 10600 10450
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 10600 10300 50  0001 C CNN
F 1 "+5V" H 10542 10487 50  0000 R CNN
F 2 "" H 10600 10450 50  0001 C CNN
F 3 "" H 10600 10450 50  0001 C CNN
	1    10600 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 10600 10850
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 10600 10600 50  0001 C CNN
F 1 "GND" H 10522 10813 50  0000 R CNN
F 2 "" H 10600 10850 50  0001 C CNN
F 3 "" H 10600 10850 50  0001 C CNN
	1    10600 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 10450 10600 10550
$Comp
L Device:CP_Small C7
U 1 1 5D8B1702
P 10600 10650
AR Path="/5D8B1702" Ref="C7"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C7" H 10512 10696 50  0000 R CNN
F 1 "100µF" H 10512 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10600 10650 50  0001 C CNN
F 3 "~" H 10600 10650 50  0001 C CNN
	1    10600 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 10750 10600 10850
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 10150 10450
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 10150 10300 50  0001 C CNN
F 1 "+5V" H 10092 10487 50  0000 R CNN
F 2 "" H 10150 10450 50  0001 C CNN
F 3 "" H 10150 10450 50  0001 C CNN
	1    10150 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 10150 10850
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR0127"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0127" H 10150 10600 50  0001 C CNN
F 1 "GND" H 10072 10813 50  0000 R CNN
F 2 "" H 10150 10850 50  0001 C CNN
F 3 "" H 10150 10850 50  0001 C CNN
	1    10150 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 10450 10150 10550
$Comp
L Device:CP_Small C6
U 1 1 5D8C8453
P 10150 10650
AR Path="/5D8C8453" Ref="C6"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C6" H 10062 10696 50  0000 R CNN
F 1 "47µF" H 10062 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10150 10650 50  0001 C CNN
F 3 "~" H 10150 10650 50  0001 C CNN
	1    10150 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 10750 10150 10850
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 8450 10450
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 8450 10300 50  0001 C CNN
F 1 "+5V" H 8392 10487 50  0000 R CNN
F 2 "" H 8450 10450 50  0001 C CNN
F 3 "" H 8450 10450 50  0001 C CNN
	1    8450 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 8450 10850
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 8450 10600 50  0001 C CNN
F 1 "GND" H 8372 10813 50  0000 R CNN
F 2 "" H 8450 10850 50  0001 C CNN
F 3 "" H 8450 10850 50  0001 C CNN
	1    8450 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 10450 8450 10550
Wire Wire Line
	8450 10750 8450 10850
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 8000 10450
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0108"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 8000 10300 50  0001 C CNN
F 1 "+5V" H 7942 10487 50  0000 R CNN
F 2 "" H 8000 10450 50  0001 C CNN
F 3 "" H 8000 10450 50  0001 C CNN
	1    8000 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 8000 10850
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 8000 10600 50  0001 C CNN
F 1 "GND" H 7922 10813 50  0000 R CNN
F 2 "" H 8000 10850 50  0001 C CNN
F 3 "" H 8000 10850 50  0001 C CNN
	1    8000 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 10450 8000 10550
Wire Wire Line
	8000 10750 8000 10850
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 8900 10450
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 8900 10300 50  0001 C CNN
F 1 "+5V" H 8842 10487 50  0000 R CNN
F 2 "" H 8900 10450 50  0001 C CNN
F 3 "" H 8900 10450 50  0001 C CNN
	1    8900 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 8900 10850
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 8900 10600 50  0001 C CNN
F 1 "GND" H 8822 10813 50  0000 R CNN
F 2 "" H 8900 10850 50  0001 C CNN
F 3 "" H 8900 10850 50  0001 C CNN
	1    8900 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 10450 8900 10550
Wire Wire Line
	8900 10750 8900 10850
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P 9750 10450
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 9750 10300 50  0001 C CNN
F 1 "+5V" H 9692 10487 50  0000 R CNN
F 2 "" H 9750 10450 50  0001 C CNN
F 3 "" H 9750 10450 50  0001 C CNN
	1    9750 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P 9750 10850
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 9750 10600 50  0001 C CNN
F 1 "GND" H 9672 10813 50  0000 R CNN
F 2 "" H 9750 10850 50  0001 C CNN
F 3 "" H 9750 10850 50  0001 C CNN
	1    9750 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 10450 9750 10550
$Comp
L Device:CP_Small C5
U 1 1 5DD552AD
P 9750 10650
AR Path="/5DD552AD" Ref="C5"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C5" H 9662 10696 50  0000 R CNN
F 1 "47µF" H 9662 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9750 10650 50  0001 C CNN
F 3 "~" H 9750 10650 50  0001 C CNN
	1    9750 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 10750 9750 10850
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P 9300 10450
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H 9300 10300 50  0001 C CNN
F 1 "+5V" H 9242 10487 50  0000 R CNN
F 2 "" H 9300 10450 50  0001 C CNN
F 3 "" H 9300 10450 50  0001 C CNN
	1    9300 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P 9300 10850
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 9300 10600 50  0001 C CNN
F 1 "GND" H 9222 10813 50  0000 R CNN
F 2 "" H 9300 10850 50  0001 C CNN
F 3 "" H 9300 10850 50  0001 C CNN
	1    9300 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 10450 9300 10550
$Comp
L Device:CP_Small C4
U 1 1 5DD552C1
P 9300 10650
AR Path="/5DD552C1" Ref="C4"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C4" H 9212 10696 50  0000 R CNN
F 1 "47µF" H 9212 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9300 10650 50  0001 C CNN
F 3 "~" H 9300 10650 50  0001 C CNN
	1    9300 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 10750 9300 10850
Text Notes 750  850  0    100  ~ 20
Processor Bus Backplane
Text Notes 750  2100 0    50   ~ 0
This is a 12-slot backplane specifically for the processor bus. Since there are\na lot of short, point-to-point signals travelling on the processor bus, this\nbackplane has a number of unbussed pins, which need to be wired from\nslot to slot (thus making some slots specialised, like the backplane slots of\nany self-respecting mini).\n\nThere are bus hold ICs on signals used for buses: the Micro-Control Vector (µCV) ,\nIBus, Front Panel Data bus (FPD), and processor flag values.\n\nThere is no bus hold for open drain and active low control signals. This is for\nadditional safety against two mutually exclusive control signals somehow being\nheld asserted simultaneously by bus hold circuitry. OD and control signals must be\nappropriately conditioned by their drivers and pulled high with resistors close\nto input stages.
$Comp
L Device:CP_Small C3
U 1 1 5EFD0822
P 8900 10650
AR Path="/5EFD0822" Ref="C3"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C3" H 8812 10696 50  0000 R CNN
F 1 "47µF" H 8812 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8900 10650 50  0001 C CNN
F 3 "~" H 8900 10650 50  0001 C CNN
	1    8900 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 5DF0FF8F
P 8450 10650
AR Path="/5DF0FF8F" Ref="C2"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C2" H 8362 10696 50  0000 R CNN
F 1 "47µF" H 8362 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8450 10650 50  0001 C CNN
F 3 "~" H 8450 10650 50  0001 C CNN
	1    8450 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C1
U 1 1 5DF0FFA3
P 8000 10650
AR Path="/5DF0FFA3" Ref="C1"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C1" H 7912 10696 50  0000 R CNN
F 1 "47µF" H 7912 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8000 10650 50  0001 C CNN
F 3 "~" H 8000 10650 50  0001 C CNN
	1    8000 10650
	1    0    0    -1  
$EndComp
Wire Notes Line width 24 style solid
	11750 1300 15750 1300
$Comp
L power:+5V #PWR?
U 1 1 610E4076
P 11550 10450
AR Path="/5F67D4B5/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/610E4076" Ref="#PWR0182"  Part="1" 
AR Path="/5D34E810/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4076" Ref="#PWR?"  Part="1" 
F 0 "#PWR0182" H 11550 10300 50  0001 C CNN
F 1 "+5V" H 11492 10487 50  0000 R CNN
F 2 "" H 11550 10450 50  0001 C CNN
F 3 "" H 11550 10450 50  0001 C CNN
	1    11550 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E407C
P 11550 10850
AR Path="/5F67D4B5/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/610E407C" Ref="#PWR0183"  Part="1" 
AR Path="/5D34E810/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E407C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0183" H 11550 10600 50  0001 C CNN
F 1 "GND" H 11472 10813 50  0000 R CNN
F 2 "" H 11550 10850 50  0001 C CNN
F 3 "" H 11550 10850 50  0001 C CNN
	1    11550 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 10450 11550 10550
$Comp
L Device:CP_Small C9
U 1 1 610E4083
P 11550 10650
AR Path="/610E4083" Ref="C9"  Part="1" 
AR Path="/5D34E810/610E4083" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4083" Ref="C?"  Part="1" 
F 0 "C9" H 11462 10696 50  0000 R CNN
F 1 "100µF" H 11462 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 11550 10650 50  0001 C CNN
F 3 "~" H 11550 10650 50  0001 C CNN
	1    11550 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 10750 11550 10850
$Comp
L power:+5V #PWR?
U 1 1 610E408A
P 11100 10450
AR Path="/5F67D4B5/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/610E408A" Ref="#PWR0184"  Part="1" 
AR Path="/5D34E810/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E408A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0184" H 11100 10300 50  0001 C CNN
F 1 "+5V" H 11042 10487 50  0000 R CNN
F 2 "" H 11100 10450 50  0001 C CNN
F 3 "" H 11100 10450 50  0001 C CNN
	1    11100 10450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E4090
P 11100 10850
AR Path="/5F67D4B5/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/610E4090" Ref="#PWR0185"  Part="1" 
AR Path="/5D34E810/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4090" Ref="#PWR?"  Part="1" 
F 0 "#PWR0185" H 11100 10600 50  0001 C CNN
F 1 "GND" H 11022 10813 50  0000 R CNN
F 2 "" H 11100 10850 50  0001 C CNN
F 3 "" H 11100 10850 50  0001 C CNN
	1    11100 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11100 10450 11100 10550
$Comp
L Device:CP_Small C8
U 1 1 610E4097
P 11100 10650
AR Path="/610E4097" Ref="C8"  Part="1" 
AR Path="/5D34E810/610E4097" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4097" Ref="C?"  Part="1" 
F 0 "C8" H 11012 10696 50  0000 R CNN
F 1 "100µF" H 11012 10605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 11100 10650 50  0001 C CNN
F 3 "~" H 11100 10650 50  0001 C CNN
	1    11100 10650
	1    0    0    -1  
$EndComp
Wire Wire Line
	11100 10750 11100 10850
$Sheet
S 1650 6000 800  400 
U 85A27F74
F0 "sheet85A27F6F" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 1650 6100 50 
F3 "B[1..32]" U L 1650 6200 50 
F4 "C[1..32]" U L 1650 6300 50 
$EndSheet
Wire Bus Line
	1650 6100 1250 6100
Wire Bus Line
	1650 6200 1250 6200
Wire Bus Line
	1650 6300 1250 6300
Text Label 1250 6100 0    50   ~ 0
A[1..32]
Text Label 1250 6200 0    50   ~ 0
B[1..32]
Text Label 1250 6300 0    50   ~ 0
C[1..32]
$Sheet
S 1650 6600 800  400 
U 85A3ADD9
F0 "sheet85A3ADD4" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 1650 6700 50 
F3 "B[1..32]" U L 1650 6800 50 
F4 "C[1..32]" U L 1650 6900 50 
$EndSheet
Wire Bus Line
	1650 6700 1250 6700
Wire Bus Line
	1650 6800 1250 6800
Wire Bus Line
	1650 6900 1250 6900
Text Label 1250 6700 0    50   ~ 0
A[1..32]
Text Label 1250 6800 0    50   ~ 0
B[1..32]
Text Label 1250 6900 0    50   ~ 0
C[1..32]
$Sheet
S 3250 3600 800  400 
U 85A4DD82
F0 "sheet85A4DD7D" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 3250 3700 50 
F3 "B[1..32]" U L 3250 3800 50 
F4 "C[1..32]" U L 3250 3900 50 
$EndSheet
Wire Bus Line
	3250 3700 2850 3700
Wire Bus Line
	3250 3800 2850 3800
Wire Bus Line
	3250 3900 2850 3900
Text Label 2850 3700 0    50   ~ 0
A[1..32]
Text Label 2850 3800 0    50   ~ 0
B[1..32]
Text Label 2850 3900 0    50   ~ 0
C[1..32]
$Sheet
S 3250 4200 800  400 
U 85A60DD6
F0 "sheet85A60DD1" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 3250 4300 50 
F3 "B[1..32]" U L 3250 4400 50 
F4 "C[1..32]" U L 3250 4500 50 
$EndSheet
Wire Bus Line
	3250 4300 2850 4300
Wire Bus Line
	3250 4400 2850 4400
Wire Bus Line
	3250 4500 2850 4500
Text Label 2850 4300 0    50   ~ 0
A[1..32]
Text Label 2850 4400 0    50   ~ 0
B[1..32]
Text Label 2850 4500 0    50   ~ 0
C[1..32]
$Sheet
S 3250 4800 800  400 
U 85A73EB4
F0 "sheet85A73EAF" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 3250 4900 50 
F3 "B[1..32]" U L 3250 5000 50 
F4 "C[1..32]" U L 3250 5100 50 
$EndSheet
Wire Bus Line
	3250 4900 2850 4900
Wire Bus Line
	3250 5000 2850 5000
Wire Bus Line
	3250 5100 2850 5100
Text Label 2850 4900 0    50   ~ 0
A[1..32]
Text Label 2850 5000 0    50   ~ 0
B[1..32]
Text Label 2850 5100 0    50   ~ 0
C[1..32]
$Sheet
S 3250 5400 800  400 
U 85A8707D
F0 "sheet85A87078" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 3250 5500 50 
F3 "B[1..32]" U L 3250 5600 50 
F4 "C[1..32]" U L 3250 5700 50 
$EndSheet
Wire Bus Line
	3250 5500 2850 5500
Wire Bus Line
	3250 5600 2850 5600
Wire Bus Line
	3250 5700 2850 5700
Text Label 2850 5500 0    50   ~ 0
A[1..32]
Text Label 2850 5600 0    50   ~ 0
B[1..32]
Text Label 2850 5700 0    50   ~ 0
C[1..32]
$Sheet
S 3250 6000 800  400 
U 85A9A356
F0 "sheet85A9A351" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 3250 6100 50 
F3 "B[1..32]" U L 3250 6200 50 
F4 "C[1..32]" U L 3250 6300 50 
$EndSheet
Wire Bus Line
	3250 6100 2850 6100
Wire Bus Line
	3250 6200 2850 6200
Wire Bus Line
	3250 6300 2850 6300
Text Label 2850 6100 0    50   ~ 0
A[1..32]
Text Label 2850 6200 0    50   ~ 0
B[1..32]
Text Label 2850 6300 0    50   ~ 0
C[1..32]
$Sheet
S 3250 6600 800  400 
U 85AAD6B0
F0 "sheet85AAD6AB" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 3250 6700 50 
F3 "B[1..32]" U L 3250 6800 50 
F4 "C[1..32]" U L 3250 6900 50 
$EndSheet
Wire Bus Line
	3250 6700 2850 6700
Wire Bus Line
	3250 6800 2850 6800
Wire Bus Line
	3250 6900 2850 6900
Text Label 2850 6700 0    50   ~ 0
A[1..32]
Text Label 2850 6800 0    50   ~ 0
B[1..32]
Text Label 2850 6900 0    50   ~ 0
C[1..32]
Text Notes 11900 1600 0    50   ~ 0
A1
Text Notes 11900 1700 0    50   ~ 0
A2
Text Notes 11900 1800 0    50   ~ 0
A3
Text Notes 11900 1900 0    50   ~ 0
A4
Text Notes 11900 2000 0    50   ~ 0
A5
Text Notes 11900 2100 0    50   ~ 0
A6
Text Notes 11900 2200 0    50   ~ 0
A7
Text Notes 11900 2300 0    50   ~ 0
A8
Text Notes 11900 2400 0    50   ~ 0
A9
Text Notes 11900 2500 0    50   ~ 0
A10
Text Notes 11900 2600 0    50   ~ 0
A11
Text Notes 11900 2700 0    50   ~ 0
A12
Text Notes 11900 2800 0    50   ~ 0
A13
Text Notes 11900 2900 0    50   ~ 0
A14
Text Notes 11900 3200 0    50   ~ 0
A17
Text Notes 11900 3300 0    50   ~ 0
A18
Text Notes 11900 3400 0    50   ~ 0
A19
Text Notes 11900 3500 0    50   ~ 0
A20
Text Notes 11900 3600 0    50   ~ 0
A21
Text Notes 11900 3700 0    50   ~ 0
A22
Text Notes 11900 3800 0    50   ~ 0
A23
Text Notes 11900 3900 0    50   ~ 0
A24
Text Notes 11900 4000 0    50   ~ 0
A25
Text Notes 11900 4100 0    50   ~ 0
A26
Text Notes 11900 4200 0    50   ~ 0
A27
Text Notes 11900 4300 0    50   ~ 0
A28
Text Notes 11900 4400 0    50   ~ 0
A29
Text Notes 11900 4500 0    50   ~ 0
A30
Text Notes 11900 4600 0    50   ~ 0
A31
Text Notes 11900 4700 0    50   ~ 0
A32
Text Notes 14600 4700 0    50   ~ 0
C32
Text Notes 14600 4600 0    50   ~ 0
C31
Text Notes 14600 4500 0    50   ~ 0
C30
Text Notes 14600 4400 0    50   ~ 0
C29
Text Notes 14600 4300 0    50   ~ 0
C28
Text Notes 14600 4200 0    50   ~ 0
C27
Text Notes 14600 4100 0    50   ~ 0
C26
Text Notes 14600 4000 0    50   ~ 0
C25
Text Notes 14600 3900 0    50   ~ 0
C24
Text Notes 14600 3800 0    50   ~ 0
C23
Text Notes 14600 3700 0    50   ~ 0
C22
Text Notes 14600 3600 0    50   ~ 0
C21
Text Notes 14600 3500 0    50   ~ 0
C20
Text Notes 14600 3400 0    50   ~ 0
C19
Text Notes 14600 3300 0    50   ~ 0
C18
Text Notes 14600 3200 0    50   ~ 0
C17
Text Notes 14600 3100 0    50   ~ 0
C16
Text Notes 14600 3000 0    50   ~ 0
C15
Text Notes 14600 2900 0    50   ~ 0
C14
Text Notes 14600 2800 0    50   ~ 0
C13
Text Notes 14600 2700 0    50   ~ 0
C12
Text Notes 14600 2600 0    50   ~ 0
C11
Text Notes 14600 2500 0    50   ~ 0
C10
Text Notes 14600 2400 0    50   ~ 0
C9
Text Notes 14600 2300 0    50   ~ 0
C8
Text Notes 14600 2200 0    50   ~ 0
C7
Text Notes 14600 2100 0    50   ~ 0
C6
Text Notes 14600 2000 0    50   ~ 0
C5
Text Notes 14600 1900 0    50   ~ 0
C4
Text Notes 14600 1800 0    50   ~ 0
C3
Text Notes 14600 1700 0    50   ~ 0
C2
Text Notes 14600 1600 0    50   ~ 0
C1
Text Notes 13250 4700 0    50   ~ 0
B32
Text Notes 13250 4600 0    50   ~ 0
B31
Text Notes 13250 4500 0    50   ~ 0
B30
Text Notes 13250 4400 0    50   ~ 0
B29
Text Notes 13250 4300 0    50   ~ 0
B28
Text Notes 13250 4200 0    50   ~ 0
B27
Text Notes 13250 4100 0    50   ~ 0
B26
Text Notes 13250 4000 0    50   ~ 0
B25
Text Notes 13250 3900 0    50   ~ 0
B24
Text Notes 13250 3800 0    50   ~ 0
B23
Text Notes 13250 3700 0    50   ~ 0
B22
Text Notes 13250 3600 0    50   ~ 0
B21
Text Notes 13250 3500 0    50   ~ 0
B20
Text Notes 13250 3400 0    50   ~ 0
B19
Text Notes 13250 3300 0    50   ~ 0
B18
Text Notes 13250 3200 0    50   ~ 0
B17
Text Notes 13250 3100 0    50   ~ 0
B16
Text Notes 13250 3000 0    50   ~ 0
B15
Text Notes 13250 2900 0    50   ~ 0
B14
Text Notes 13250 2800 0    50   ~ 0
B13
Text Notes 13250 2700 0    50   ~ 0
B12
Text Notes 13250 2600 0    50   ~ 0
B11
Text Notes 13250 2500 0    50   ~ 0
B10
Text Notes 13250 2400 0    50   ~ 0
B9
Text Notes 13250 2300 0    50   ~ 0
B8
Text Notes 13250 2200 0    50   ~ 0
B7
Text Notes 13250 2100 0    50   ~ 0
B6
Text Notes 13250 2000 0    50   ~ 0
B5
Text Notes 13250 1900 0    50   ~ 0
B4
Text Notes 13250 1800 0    50   ~ 0
B3
Text Notes 13250 1700 0    50   ~ 0
B2
Text Notes 13250 1600 0    50   ~ 0
B1
Text Notes 12150 1500 0    50   ~ 0
P1
Text Notes 12650 1500 0    50   ~ 0
P2
Text Notes 13500 1500 0    50   ~ 0
P1
Text Notes 14000 1500 0    50   ~ 0
P2
Text Notes 14900 1500 0    50   ~ 0
P1
Text Notes 15400 1500 0    50   ~ 0
P2
Text Notes 12150 1600 0    50   ~ 0
+5V
Text Notes 13500 1600 0    50   ~ 0
+5V
Text Notes 12650 1600 0    50   ~ 0
+5V
Text Notes 14000 1600 0    50   ~ 0
+5V
Text Notes 14900 1600 0    50   ~ 0
+5V
Text Notes 15400 1600 0    50   ~ 0
+5V
Text Notes 12650 1700 0    50   ~ 0
+5V
Text Notes 14000 1700 0    50   ~ 0
+5V
Text Notes 15400 1700 0    50   ~ 0
+5V
Text Notes 12150 1700 0    50   ~ 0
CLK1
Text Notes 13500 1800 0    50   ~ 0
CLK2
Text Notes 13500 1700 0    50   ~ 0
CLK3
Text Notes 12150 1800 0    50   ~ 0
Unbussed
Text Notes 12150 1900 0    50   ~ 0
Unbussed
Text Notes 12150 2000 0    50   ~ 0
Unbussed
Text Notes 12150 2100 0    50   ~ 0
Unbussed
Text Notes 12150 2200 0    50   ~ 0
Unbussed
Text Notes 12150 2300 0    50   ~ 0
Unbussed
Text Notes 12150 2400 0    50   ~ 0
Unbussed
Text Notes 12150 2500 0    50   ~ 0
Unbussed
Text Notes 12150 2600 0    50   ~ 0
Unbussed
Text Notes 12150 2700 0    50   ~ 0
Unbussed
Text Notes 12150 2800 0    50   ~ 0
Unbussed
Text Notes 12150 2900 0    50   ~ 0
Unbussed
Text Notes 12150 3000 0    50   ~ 0
Unbussed
Text Notes 12150 3100 0    50   ~ 0
Unbussed
Text Notes 12150 3200 0    50   ~ 0
Unbussed
Text Notes 12150 3300 0    50   ~ 0
Unbussed
Text Notes 12150 3400 0    50   ~ 0
Unbussed
Text Notes 12150 3500 0    50   ~ 0
Unbussed
Text Notes 12150 3600 0    50   ~ 0
Unbussed
Text Notes 12150 3700 0    50   ~ 0
Unbussed
Text Notes 12150 4600 0    50   ~ 0
GND
Text Notes 12150 4700 0    50   ~ 0
GND
Text Notes 13500 1900 0    50   ~ 0
GND
Text Notes 13500 2000 0    50   ~ 0
GND
Text Notes 13500 3800 0    50   ~ 0
Unbussed
Text Notes 13500 3900 0    50   ~ 0
Unbussed
Text Notes 13500 4000 0    50   ~ 0
Unbussed
Text Notes 13500 4100 0    50   ~ 0
Unbussed
Text Notes 13500 4200 0    50   ~ 0
Unbussed
Text Notes 13500 4300 0    50   ~ 0
Unbussed
Text Notes 13500 4400 0    50   ~ 0
Unbussed
Text Notes 13500 4500 0    50   ~ 0
Unbussed
Text Notes 13500 4600 0    50   ~ 0
GND
Text Notes 13500 4700 0    50   ~ 0
GND
Text Notes 14900 4600 0    50   ~ 0
GND
Text Notes 14900 4700 0    50   ~ 0
GND
Text Notes 13500 2100 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2200 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2300 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2400 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2500 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2600 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2700 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2800 0    50   ~ 0
Bus (µCV)
Text Notes 13500 2900 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3000 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3100 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3200 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3300 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3400 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3500 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3600 0    50   ~ 0
Bus (µCV)
Text Notes 13500 3700 0    50   ~ 0
Bus (µCV)
Text Notes 14900 2000 0    50   ~ 0
16 MHz
Text Notes 14900 1700 0    50   ~ 0
CLK4
Text Notes 14900 1800 0    50   ~ 0
T34
Text Notes 14900 1900 0    50   ~ 0
Bus (µCV)
Text Notes 14900 2100 0    50   ~ 0
Bus (µCV)
Text Notes 14900 2200 0    50   ~ 10
FV
Text Notes 14900 2300 0    50   ~ 10
FL
Text Notes 14900 2400 0    50   ~ 10
FZ
Text Notes 14900 2500 0    50   ~ 10
FN
Text Notes 14900 2700 0    50   ~ 0
Unbussed
Text Notes 14900 2600 0    50   ~ 0
~WRITEFL
Text Notes 14900 2800 0    50   ~ 0
~END\n
Text Notes 14900 2900 0    50   ~ 0
~ENDEXT\n
Text Notes 12650 4600 0    50   ~ 0
GND
Text Notes 12650 4700 0    50   ~ 0
GND
Text Notes 14000 4600 0    50   ~ 0
GND
Text Notes 14000 4700 0    50   ~ 0
GND
Text Notes 15400 4600 0    50   ~ 0
GND
Text Notes 15400 4700 0    50   ~ 0
GND
Text Notes 12650 1800 0    50   ~ 0
~RESET
Text Notes 12650 1900 0    50   ~ 0
T34
Text Notes 12650 2100 0    50   ~ 0
~WS
Text Notes 12650 2300 0    50   ~ 0
IODEVxx
Text Notes 12650 2400 0    50   ~ 0
IODEVxx
Text Notes 12650 2700 0    50   ~ 0
IODEVxx
Text Notes 12650 2800 0    50   ~ 0
IODEVxx
Text Notes 12650 2900 0    50   ~ 0
~WAITING
Text Notes 14000 1800 0    50   ~ 0
~HALT
Text Notes 14000 1900 0    50   ~ 0
~IRQ
Text Notes 14000 2500 0    50   ~ 0
~MEM
Text Notes 14000 2600 0    50   ~ 0
~IO
Text Notes 14000 2900 0    50   ~ 0
~IRQS
$Comp
L power:GND #PWR0101
U 1 1 60EAC7C6
P 1550 10500
F 0 "#PWR0101" H 1550 10250 50  0001 C CNN
F 1 "GND" H 1555 10327 50  0000 C CNN
F 2 "" H 1550 10500 50  0001 C CNN
F 3 "" H 1550 10500 50  0001 C CNN
	1    1550 10500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 10500 1550 10450
Wire Wire Line
	1350 9950 1550 9950
Connection ~ 1550 10050
Wire Wire Line
	1550 10050 1550 9950
Wire Wire Line
	1350 10050 1550 10050
Connection ~ 1550 10150
Wire Wire Line
	1550 10150 1550 10050
Wire Wire Line
	1350 10150 1550 10150
Connection ~ 1550 10250
Wire Wire Line
	1550 10250 1550 10150
Wire Wire Line
	1350 10250 1550 10250
Connection ~ 1550 10350
Wire Wire Line
	1550 10350 1550 10250
Wire Wire Line
	1350 10350 1550 10350
Connection ~ 1550 10450
Wire Wire Line
	1550 10450 1550 10350
Wire Wire Line
	1350 10450 1550 10450
Text Label 1350 9950 0    50   ~ 0
A31
Text Label 1350 10050 0    50   ~ 0
A32
Text Label 1350 10150 0    50   ~ 0
B31
Text Label 1350 10250 0    50   ~ 0
B32
Text Label 1350 10350 0    50   ~ 0
C31
Text Label 1350 10450 0    50   ~ 0
C32
$Comp
L power:+5V #PWR0102
U 1 1 60F81028
P 1050 9850
F 0 "#PWR0102" H 1050 9700 50  0001 C CNN
F 1 "+5V" H 1065 10023 50  0000 C CNN
F 2 "" H 1050 9850 50  0001 C CNN
F 3 "" H 1050 9850 50  0001 C CNN
	1    1050 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 9850 1050 9950
Wire Wire Line
	1050 10350 1250 10350
Wire Wire Line
	1250 9950 1050 9950
Connection ~ 1050 10050
Wire Wire Line
	1050 10050 1050 10150
Wire Wire Line
	1250 10150 1050 10150
Connection ~ 1050 10250
Wire Wire Line
	1050 10250 1050 10350
Text Label 1250 9950 2    50   ~ 0
A1
Text Label 1250 10150 2    50   ~ 0
B1
Text Label 1250 10350 2    50   ~ 0
C1
Text Notes 15400 2800 0    50   ~ 0
~W
Text Notes 15400 2900 0    50   ~ 0
Bussed
Text Notes 15400 3800 0    50   ~ 0
~IRQ0
Text Notes 15400 3900 0    50   ~ 0
~IRQ1
Text Notes 15400 4000 0    50   ~ 0
~IRQ2
Text Notes 15400 4100 0    50   ~ 0
~IRQ3
Text Notes 15400 4200 0    50   ~ 0
~IRQ4
Text Notes 15400 4300 0    50   ~ 0
~IRQ5
Text Notes 15400 4400 0    50   ~ 0
~IRQ6
Text Notes 15400 4500 0    50   ~ 0
~IRQ7
$Comp
L Device:R_Small R1
U 1 1 610BC2DF
P 7700 8550
F 0 "R1" V 7504 8550 50  0000 C CNN
F 1 "1kΩ" V 7595 8550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7700 8550 50  0001 C CNN
F 3 "~" H 7700 8550 50  0001 C CNN
	1    7700 8550
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D1
U 1 1 610BD748
P 7350 8550
F 0 "D1" H 7343 8387 50  0000 C CNN
F 1 "LED_ALT" H 7343 8386 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 8550 50  0001 C CNN
F 3 "~" H 7350 8550 50  0001 C CNN
	1    7350 8550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 610EE7A0
P 7900 9500
F 0 "#PWR034" H 7900 9250 50  0001 C CNN
F 1 "GND" H 7905 9327 50  0000 C CNN
F 2 "" H 7900 9500 50  0001 C CNN
F 3 "" H 7900 9500 50  0001 C CNN
	1    7900 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 8550 7100 8550
$Comp
L power:+5V #PWR033
U 1 1 611BACB9
P 7100 8500
F 0 "#PWR033" H 7100 8350 50  0001 C CNN
F 1 "+5V" H 7115 8673 50  0000 C CNN
F 2 "" H 7100 8500 50  0001 C CNN
F 3 "" H 7100 8500 50  0001 C CNN
	1    7100 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 8500 7100 8550
$Comp
L power:GND #PWR030
U 1 1 60EAACFE
P 3750 9850
F 0 "#PWR030" H 3750 9600 50  0001 C CNN
F 1 "GND" H 3755 9677 50  0000 C CNN
F 2 "" H 3750 9850 50  0001 C CNN
F 3 "" H 3750 9850 50  0001 C CNN
	1    3750 9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 9650 3750 9650
Connection ~ 3750 9650
Wire Wire Line
	3750 9550 3750 9650
Wire Wire Line
	3900 9550 3750 9550
Wire Wire Line
	3750 8550 3750 8500
Wire Wire Line
	3900 8550 3750 8550
$Comp
L power:+5V #PWR029
U 1 1 60E6696D
P 3750 8500
F 0 "#PWR029" H 3750 8350 50  0001 C CNN
F 1 "+5V" H 3765 8673 50  0000 C CNN
F 2 "" H 3750 8500 50  0001 C CNN
F 3 "" H 3750 8500 50  0001 C CNN
	1    3750 8500
	1    0    0    -1  
$EndComp
Connection ~ 3750 8550
Wire Wire Line
	3750 8650 3750 8550
Wire Wire Line
	3900 8650 3750 8650
Wire Wire Line
	3900 8750 3750 8750
Wire Wire Line
	3750 8750 3750 8650
Connection ~ 3750 8650
Wire Wire Line
	3900 9450 3750 9450
Wire Wire Line
	3750 9450 3750 9550
Connection ~ 3750 9550
Text Notes 7400 3100 0    100  ~ 20
Bus Hold
Text Notes 11900 3100 0    50   ~ 0
A16
Text Notes 11900 3000 0    50   ~ 0
A15
Text Notes 15400 2700 0    50   ~ 0
~R
Text Notes 15400 3000 0    50   ~ 10
AB8
Text Notes 15400 3100 0    50   ~ 10
AB9
Text Notes 15400 3200 0    50   ~ 10
AB10
Text Notes 15400 3300 0    50   ~ 10
AB11
Text Notes 15400 3400 0    50   ~ 10
AB12
Text Notes 15400 3500 0    50   ~ 10
AB13
Text Notes 15400 3600 0    50   ~ 10
AB14
Text Notes 15400 3700 0    50   ~ 10
AB15
Text Notes 12150 3800 0    50   ~ 10
FPD0
Text Notes 12150 3900 0    50   ~ 10
FPD1
Text Notes 12150 4000 0    50   ~ 10
FPD2
Text Notes 12150 4100 0    50   ~ 10
FPD3
Text Notes 12150 4200 0    50   ~ 10
FPD4
Text Notes 12150 4300 0    50   ~ 10
FPD5
Text Notes 12150 4400 0    50   ~ 10
FPD6
Text Notes 12150 4500 0    50   ~ 10
FPD7
Text Notes 12650 3000 0    50   ~ 10
DB0
Text Notes 12650 3100 0    50   ~ 10
DB1
Text Notes 12650 3200 0    50   ~ 10
DB2
Text Notes 12650 3300 0    50   ~ 10
DB3
Text Notes 12650 3400 0    50   ~ 10
DB4
Text Notes 12650 3500 0    50   ~ 10
DB5
Text Notes 12650 3600 0    50   ~ 10
DB6
Text Notes 12650 3700 0    50   ~ 10
DB7
Text Notes 12650 3800 0    50   ~ 10
DB8
Text Notes 12650 3900 0    50   ~ 10
DB9
Text Notes 12650 4000 0    50   ~ 10
DB10
Text Notes 12650 4100 0    50   ~ 10
DB11
Text Notes 12650 4200 0    50   ~ 10
DB12
Text Notes 12650 4300 0    50   ~ 10
DB13
Text Notes 12650 4400 0    50   ~ 10
DB14
Text Notes 12650 4500 0    50   ~ 10
DB15
Text Notes 14000 3800 0    50   ~ 10
AB16
Text Notes 14000 3900 0    50   ~ 10
AB17
Text Notes 14000 4000 0    50   ~ 10
AB18
Text Notes 14000 4100 0    50   ~ 10
AB19
Text Notes 14000 4200 0    50   ~ 10
AB20
Text Notes 14000 4300 0    50   ~ 10
AB21
Text Notes 14000 4400 0    50   ~ 10
AB22
Text Notes 14000 4500 0    50   ~ 10
AB23
Text Notes 14900 3000 0    50   ~ 10
IBUS0
Text Notes 14900 3100 0    50   ~ 10
IBUS1
Text Notes 14900 3200 0    50   ~ 10
IBUS2
Text Notes 14900 3300 0    50   ~ 10
IBUS3
Text Notes 14900 3400 0    50   ~ 10
IBUS4
Text Notes 14900 3500 0    50   ~ 10
IBUS5
Text Notes 14900 3600 0    50   ~ 10
IBUS6
Text Notes 14900 3700 0    50   ~ 10
IBUS7
Text Notes 14900 3800 0    50   ~ 10
IBUS8
Text Notes 14900 3900 0    50   ~ 10
IBUS9
Text Notes 14900 4000 0    50   ~ 10
IBUS10
Text Notes 14900 4100 0    50   ~ 10
IBUS11
Text Notes 14900 4200 0    50   ~ 10
IBUS12
Text Notes 14900 4300 0    50   ~ 10
IBUS13
Text Notes 14900 4400 0    50   ~ 10
IBUS14
Text Notes 14900 4500 0    50   ~ 10
IBUS15
Text Notes 15400 1900 0    50   ~ 10
AB0
Text Notes 15400 2000 0    50   ~ 10
AB1
Text Notes 15400 2100 0    50   ~ 10
AB2
Text Notes 15400 2200 0    50   ~ 10
AB3
Text Notes 15400 2300 0    50   ~ 10
AB4
Text Notes 15400 2400 0    50   ~ 10
AB5
Text Notes 15400 2500 0    50   ~ 10
AB6
Text Notes 15400 2600 0    50   ~ 10
AB7
$Comp
L alexios:SN74ACT1071 U1
U 1 1 6246D5FB
P 5950 4150
F 0 "U1" H 5843 4917 50  0000 C CNN
F 1 "SN74ACT1071" H 5843 4826 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5650 4500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 5650 4500 50  0001 C CNN
	1    5950 4150
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1
U 2 1 62AA17B3
P 7050 4400
F 0 "U1" H 7230 4759 50  0000 L CNN
F 1 "SN74ACT1071" H 7230 4668 50  0000 L CNN
F 2 "alexios:SOIC-14" H 6750 4750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 6750 4750 50  0001 C CNN
	2    7050 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3900 6650 3900
Wire Wire Line
	6700 4000 6650 4000
Wire Wire Line
	6700 4200 6650 4200
Wire Wire Line
	6700 4300 6650 4300
$Comp
L Device:C_Small C11
U 1 1 62B21FA7
P 6650 4100
F 0 "C11" H 6741 4146 50  0000 L CNN
F 1 "100nF" H 6741 4055 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 4100 50  0001 C CNN
F 3 "~" H 6650 4100 50  0001 C CNN
	1    6650 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6650 4000 6650 3900
Connection ~ 6650 4000
Connection ~ 6650 3900
Wire Wire Line
	6650 3900 6650 3850
$Comp
L power:+5V #PWR031
U 1 1 62B4D5B4
P 6650 3850
F 0 "#PWR031" H 6650 3700 50  0001 C CNN
F 1 "+5V" H 6665 4023 50  0000 C CNN
F 2 "" H 6650 3850 50  0001 C CNN
F 3 "" H 6650 3850 50  0001 C CNN
	1    6650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4200 6650 4300
Connection ~ 6650 4200
$Comp
L power:GND #PWR037
U 1 1 62BCE8F4
P 6650 4350
F 0 "#PWR037" H 6650 4100 50  0001 C CNN
F 1 "GND" H 6655 4177 50  0000 C CNN
F 2 "" H 6650 4350 50  0001 C CNN
F 3 "" H 6650 4350 50  0001 C CNN
	1    6650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4300 6650 4350
Connection ~ 6650 4300
$Comp
L alexios:SN74ACT1071 U2
U 1 1 62C590E1
P 9450 6950
F 0 "U2" H 9343 7717 50  0000 C CNN
F 1 "SN74ACT1071" H 9343 7626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9150 7300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9150 7300 50  0001 C CNN
	1    9450 6950
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U2
U 2 1 62C590F7
P 10550 7200
F 0 "U2" H 10730 7559 50  0000 L CNN
F 1 "SN74ACT1071" H 10730 7468 50  0000 L CNN
F 2 "alexios:SOIC-14" H 10250 7550 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 10250 7550 50  0001 C CNN
	2    10550 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 6700 10150 6700
Wire Wire Line
	10200 6800 10150 6800
Wire Wire Line
	10200 7000 10150 7000
Wire Wire Line
	10200 7100 10150 7100
$Comp
L Device:C_Small C12
U 1 1 62C59101
P 10150 6900
F 0 "C12" H 10241 6946 50  0000 L CNN
F 1 "100nF" H 10241 6855 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 6900 50  0001 C CNN
F 3 "~" H 10150 6900 50  0001 C CNN
	1    10150 6900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10150 6800 10150 6700
Connection ~ 10150 6800
Connection ~ 10150 6700
Wire Wire Line
	10150 6700 10150 6650
$Comp
L power:+5V #PWR0104
U 1 1 62C5910B
P 10150 6650
F 0 "#PWR0104" H 10150 6500 50  0001 C CNN
F 1 "+5V" H 10165 6823 50  0000 C CNN
F 2 "" H 10150 6650 50  0001 C CNN
F 3 "" H 10150 6650 50  0001 C CNN
	1    10150 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 7000 10150 7100
Connection ~ 10150 7000
$Comp
L power:GND #PWR0107
U 1 1 62C59113
P 10150 7150
F 0 "#PWR0107" H 10150 6900 50  0001 C CNN
F 1 "GND" H 10155 6977 50  0000 C CNN
F 2 "" H 10150 7150 50  0001 C CNN
F 3 "" H 10150 7150 50  0001 C CNN
	1    10150 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 7100 10150 7150
Connection ~ 10150 7100
Wire Wire Line
	10200 3900 10150 3900
Wire Wire Line
	10200 4000 10150 4000
Wire Wire Line
	10200 4200 10150 4200
Wire Wire Line
	10200 4300 10150 4300
$Comp
L Device:C_Small C13
U 1 1 630BA1BA
P 10150 4100
F 0 "C13" H 10241 4146 50  0000 L CNN
F 1 "100nF" H 10241 4055 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 4100 50  0001 C CNN
F 3 "~" H 10150 4100 50  0001 C CNN
	1    10150 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10150 4000 10150 3900
Connection ~ 10150 4000
Connection ~ 10150 3900
Wire Wire Line
	10150 3900 10150 3850
$Comp
L power:+5V #PWR0111
U 1 1 630BA1C4
P 10150 3850
F 0 "#PWR0111" H 10150 3700 50  0001 C CNN
F 1 "+5V" H 10165 4023 50  0000 C CNN
F 2 "" H 10150 3850 50  0001 C CNN
F 3 "" H 10150 3850 50  0001 C CNN
	1    10150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4200 10150 4300
Connection ~ 10150 4200
$Comp
L power:GND #PWR0119
U 1 1 630BA1CC
P 10150 4350
F 0 "#PWR0119" H 10150 4100 50  0001 C CNN
F 1 "GND" H 10155 4177 50  0000 C CNN
F 2 "" H 10150 4350 50  0001 C CNN
F 3 "" H 10150 4350 50  0001 C CNN
	1    10150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4300 10150 4350
Connection ~ 10150 4300
$Comp
L alexios:SN74ACT1071 U3
U 2 1 630BA1B0
P 10550 4400
F 0 "U3" H 10730 4759 50  0000 L CNN
F 1 "SN74ACT1071" H 10730 4668 50  0000 L CNN
F 2 "alexios:SOIC-14" H 10250 4750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 10250 4750 50  0001 C CNN
	2    10550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 5300 10150 5300
Wire Wire Line
	10200 5400 10150 5400
Wire Wire Line
	10200 5600 10150 5600
Wire Wire Line
	10200 5700 10150 5700
$Comp
L Device:C_Small C14
U 1 1 63100A54
P 10150 5500
F 0 "C14" H 10241 5546 50  0000 L CNN
F 1 "100nF" H 10241 5455 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 5500 50  0001 C CNN
F 3 "~" H 10150 5500 50  0001 C CNN
	1    10150 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10150 5400 10150 5300
Connection ~ 10150 5400
Connection ~ 10150 5300
Wire Wire Line
	10150 5300 10150 5250
$Comp
L power:+5V #PWR0120
U 1 1 63100A5E
P 10150 5250
F 0 "#PWR0120" H 10150 5100 50  0001 C CNN
F 1 "+5V" H 10165 5423 50  0000 C CNN
F 2 "" H 10150 5250 50  0001 C CNN
F 3 "" H 10150 5250 50  0001 C CNN
	1    10150 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5600 10150 5700
Connection ~ 10150 5600
$Comp
L power:GND #PWR0121
U 1 1 63100A66
P 10150 5750
F 0 "#PWR0121" H 10150 5500 50  0001 C CNN
F 1 "GND" H 10155 5577 50  0000 C CNN
F 2 "" H 10150 5750 50  0001 C CNN
F 3 "" H 10150 5750 50  0001 C CNN
	1    10150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5700 10150 5750
Connection ~ 10150 5700
$Comp
L alexios:SN74ACT1071 U4
U 2 1 63100A78
P 10550 5800
F 0 "U4" H 10730 6159 50  0000 L CNN
F 1 "SN74ACT1071" H 10730 6068 50  0000 L CNN
F 2 "alexios:SOIC-14" H 10250 6150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 10250 6150 50  0001 C CNN
	2    10550 5800
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U4
U 1 1 63100A7E
P 9450 5550
F 0 "U4" H 9343 6317 50  0000 C CNN
F 1 "SN74ACT1071" H 9343 6226 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9150 5900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9150 5900 50  0001 C CNN
	1    9450 5550
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U6
U 2 1 63428623
P 7050 6200
F 0 "U6" H 7230 6559 50  0000 L CNN
F 1 "SN74ACT1071" H 7230 6468 50  0000 L CNN
F 2 "alexios:SOIC-14" H 6750 6550 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 6750 6550 50  0001 C CNN
	2    7050 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 5700 6650 5700
Wire Wire Line
	6700 5800 6650 5800
Wire Wire Line
	6700 6000 6650 6000
Wire Wire Line
	6700 6100 6650 6100
$Comp
L Device:C_Small C16
U 1 1 6342862D
P 6650 5900
F 0 "C16" H 6741 5946 50  0000 L CNN
F 1 "100nF" H 6741 5855 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 5900 50  0001 C CNN
F 3 "~" H 6650 5900 50  0001 C CNN
	1    6650 5900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6650 5800 6650 5700
Connection ~ 6650 5800
Connection ~ 6650 5700
Wire Wire Line
	6650 5700 6650 5650
$Comp
L power:+5V #PWR0122
U 1 1 63428637
P 6650 5650
F 0 "#PWR0122" H 6650 5500 50  0001 C CNN
F 1 "+5V" H 6665 5823 50  0000 C CNN
F 2 "" H 6650 5650 50  0001 C CNN
F 3 "" H 6650 5650 50  0001 C CNN
	1    6650 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 6000 6650 6100
Connection ~ 6650 6000
$Comp
L power:GND #PWR0123
U 1 1 6342863F
P 6650 6150
F 0 "#PWR0123" H 6650 5900 50  0001 C CNN
F 1 "GND" H 6655 5977 50  0000 C CNN
F 2 "" H 6650 6150 50  0001 C CNN
F 3 "" H 6650 6150 50  0001 C CNN
	1    6650 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 6100 6650 6150
Connection ~ 6650 6100
$Sheet
S 1650 5400 800  400 
U 6199DFD2
F0 "sheet6199DFCD" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 1650 5500 50 
F3 "B[1..32]" U L 1650 5600 50 
F4 "C[1..32]" U L 1650 5700 50 
$EndSheet
Wire Bus Line
	1650 5500 1250 5500
Wire Bus Line
	1650 5600 1250 5600
Wire Bus Line
	1650 5700 1250 5700
Text Label 1250 5500 0    50   ~ 0
A[1..32]
Text Label 1250 5600 0    50   ~ 0
B[1..32]
Text Label 1250 5700 0    50   ~ 0
C[1..32]
$Sheet
S 1650 4800 800  400 
U 619D299D
F0 "sheet619D2998" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 1650 4900 50 
F3 "B[1..32]" U L 1650 5000 50 
F4 "C[1..32]" U L 1650 5100 50 
$EndSheet
Wire Bus Line
	1650 4900 1250 4900
Wire Bus Line
	1650 5000 1250 5000
Wire Bus Line
	1650 5100 1250 5100
Text Label 1250 4900 0    50   ~ 0
A[1..32]
Text Label 1250 5000 0    50   ~ 0
B[1..32]
Text Label 1250 5100 0    50   ~ 0
C[1..32]
$Sheet
S 1650 4200 800  400 
U 61A07546
F0 "sheet61A07540" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 1650 4300 50 
F3 "B[1..32]" U L 1650 4400 50 
F4 "C[1..32]" U L 1650 4500 50 
$EndSheet
Wire Bus Line
	1650 4300 1250 4300
Wire Bus Line
	1650 4400 1250 4400
Wire Bus Line
	1650 4500 1250 4500
Text Label 1250 4300 0    50   ~ 0
A[1..32]
Text Label 1250 4400 0    50   ~ 0
B[1..32]
Text Label 1250 4500 0    50   ~ 0
C[1..32]
$Sheet
S 1650 3600 800  400 
U 61A07551
F0 "sheet61A07541" 50
F1 "peripheral-slot.sch" 50
F2 "A[1..32]" U L 1650 3700 50 
F3 "B[1..32]" U L 1650 3800 50 
F4 "C[1..32]" U L 1650 3900 50 
$EndSheet
Wire Bus Line
	1650 3700 1250 3700
Wire Bus Line
	1650 3800 1250 3800
Wire Bus Line
	1650 3900 1250 3900
Text Label 1250 3700 0    50   ~ 0
A[1..32]
Text Label 1250 3800 0    50   ~ 0
B[1..32]
Text Label 1250 3900 0    50   ~ 0
C[1..32]
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C1F6ED
P 4700 10350
AR Path="/6199673B/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/859EF273/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A02236/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A150E4/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A27F74/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A3ADD9/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A4DD82/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A60DD6/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A73EB4/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A8707D/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85A9A356/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/85AAD6B0/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/6199DFD2/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/619D299D/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/61A07546/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/61A07551/61C1F6ED" Ref="H?"  Part="1" 
AR Path="/61C1F6ED" Ref="H25"  Part="1" 
F 0 "H25" H 4800 10399 50  0000 L CNN
F 1 "MountingHole_Pad" H 4800 10308 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 4700 10350 50  0001 C CNN
F 3 "~" H 4700 10350 50  0001 C CNN
	1    4700 10350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C1F6F3
P 4700 10450
AR Path="/6199673B/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/859EF273/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A02236/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A150E4/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A27F74/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A3ADD9/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A4DD82/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A60DD6/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A73EB4/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A8707D/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85A9A356/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/85AAD6B0/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/6199DFD2/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/619D299D/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/61A07546/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/61A07551/61C1F6F3" Ref="#PWR?"  Part="1" 
AR Path="/61C1F6F3" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 4700 10200 50  0001 C CNN
F 1 "GND" H 4705 10277 50  0000 C CNN
F 2 "" H 4700 10450 50  0001 C CNN
F 3 "" H 4700 10450 50  0001 C CNN
	1    4700 10450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C1F6F9
P 4700 10850
AR Path="/6199673B/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/859EF273/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A02236/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A150E4/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A27F74/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A3ADD9/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A4DD82/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A60DD6/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A73EB4/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A8707D/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85A9A356/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/85AAD6B0/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/6199DFD2/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/619D299D/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/61A07546/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/61A07551/61C1F6F9" Ref="H?"  Part="1" 
AR Path="/61C1F6F9" Ref="H28"  Part="1" 
F 0 "H28" H 4800 10899 50  0000 L CNN
F 1 "MountingHole_Pad" H 4800 10808 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 4700 10850 50  0001 C CNN
F 3 "~" H 4700 10850 50  0001 C CNN
	1    4700 10850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C1F6FF
P 4700 10950
AR Path="/6199673B/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/859EF273/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A02236/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A150E4/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A27F74/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A3ADD9/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A4DD82/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A60DD6/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A73EB4/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A8707D/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85A9A356/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/85AAD6B0/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/6199DFD2/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/619D299D/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/61A07546/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/61A07551/61C1F6FF" Ref="#PWR?"  Part="1" 
AR Path="/61C1F6FF" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 4700 10700 50  0001 C CNN
F 1 "GND" H 4705 10777 50  0000 C CNN
F 2 "" H 4700 10950 50  0001 C CNN
F 3 "" H 4700 10950 50  0001 C CNN
	1    4700 10950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C55080
P 5750 10350
AR Path="/6199673B/61C55080" Ref="H?"  Part="1" 
AR Path="/859EF273/61C55080" Ref="H?"  Part="1" 
AR Path="/85A02236/61C55080" Ref="H?"  Part="1" 
AR Path="/85A150E4/61C55080" Ref="H?"  Part="1" 
AR Path="/85A27F74/61C55080" Ref="H?"  Part="1" 
AR Path="/85A3ADD9/61C55080" Ref="H?"  Part="1" 
AR Path="/85A4DD82/61C55080" Ref="H?"  Part="1" 
AR Path="/85A60DD6/61C55080" Ref="H?"  Part="1" 
AR Path="/85A73EB4/61C55080" Ref="H?"  Part="1" 
AR Path="/85A8707D/61C55080" Ref="H?"  Part="1" 
AR Path="/85A9A356/61C55080" Ref="H?"  Part="1" 
AR Path="/85AAD6B0/61C55080" Ref="H?"  Part="1" 
AR Path="/6199DFD2/61C55080" Ref="H?"  Part="1" 
AR Path="/619D299D/61C55080" Ref="H?"  Part="1" 
AR Path="/61A07546/61C55080" Ref="H?"  Part="1" 
AR Path="/61A07551/61C55080" Ref="H?"  Part="1" 
AR Path="/61C55080" Ref="H26"  Part="1" 
F 0 "H26" H 5850 10399 50  0000 L CNN
F 1 "MountingHole_Pad" H 5850 10308 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 5750 10350 50  0001 C CNN
F 3 "~" H 5750 10350 50  0001 C CNN
	1    5750 10350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C55086
P 5750 10450
AR Path="/6199673B/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/859EF273/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A02236/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A150E4/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A27F74/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A3ADD9/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A4DD82/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A60DD6/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A73EB4/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A8707D/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85A9A356/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/85AAD6B0/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/6199DFD2/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/619D299D/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/61A07546/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/61A07551/61C55086" Ref="#PWR?"  Part="1" 
AR Path="/61C55086" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 5750 10200 50  0001 C CNN
F 1 "GND" H 5755 10277 50  0000 C CNN
F 2 "" H 5750 10450 50  0001 C CNN
F 3 "" H 5750 10450 50  0001 C CNN
	1    5750 10450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C5508C
P 5750 10850
AR Path="/6199673B/61C5508C" Ref="H?"  Part="1" 
AR Path="/859EF273/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A02236/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A150E4/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A27F74/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A3ADD9/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A4DD82/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A60DD6/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A73EB4/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A8707D/61C5508C" Ref="H?"  Part="1" 
AR Path="/85A9A356/61C5508C" Ref="H?"  Part="1" 
AR Path="/85AAD6B0/61C5508C" Ref="H?"  Part="1" 
AR Path="/6199DFD2/61C5508C" Ref="H?"  Part="1" 
AR Path="/619D299D/61C5508C" Ref="H?"  Part="1" 
AR Path="/61A07546/61C5508C" Ref="H?"  Part="1" 
AR Path="/61A07551/61C5508C" Ref="H?"  Part="1" 
AR Path="/61C5508C" Ref="H29"  Part="1" 
F 0 "H29" H 5850 10899 50  0000 L CNN
F 1 "MountingHole_Pad" H 5850 10808 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 5750 10850 50  0001 C CNN
F 3 "~" H 5750 10850 50  0001 C CNN
	1    5750 10850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C55092
P 5750 10950
AR Path="/6199673B/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/859EF273/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A02236/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A150E4/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A27F74/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A3ADD9/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A4DD82/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A60DD6/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A73EB4/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A8707D/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85A9A356/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/85AAD6B0/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/6199DFD2/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/619D299D/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/61A07546/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/61A07551/61C55092" Ref="#PWR?"  Part="1" 
AR Path="/61C55092" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 5750 10700 50  0001 C CNN
F 1 "GND" H 5755 10777 50  0000 C CNN
F 2 "" H 5750 10950 50  0001 C CNN
F 3 "" H 5750 10950 50  0001 C CNN
	1    5750 10950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C883DF
P 6700 10350
AR Path="/6199673B/61C883DF" Ref="H?"  Part="1" 
AR Path="/859EF273/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A02236/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A150E4/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A27F74/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A3ADD9/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A4DD82/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A60DD6/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A73EB4/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A8707D/61C883DF" Ref="H?"  Part="1" 
AR Path="/85A9A356/61C883DF" Ref="H?"  Part="1" 
AR Path="/85AAD6B0/61C883DF" Ref="H?"  Part="1" 
AR Path="/6199DFD2/61C883DF" Ref="H?"  Part="1" 
AR Path="/619D299D/61C883DF" Ref="H?"  Part="1" 
AR Path="/61A07546/61C883DF" Ref="H?"  Part="1" 
AR Path="/61A07551/61C883DF" Ref="H?"  Part="1" 
AR Path="/61C883DF" Ref="H27"  Part="1" 
F 0 "H27" H 6800 10399 50  0000 L CNN
F 1 "MountingHole_Pad" H 6800 10308 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 6700 10350 50  0001 C CNN
F 3 "~" H 6700 10350 50  0001 C CNN
	1    6700 10350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C883E5
P 6700 10450
AR Path="/6199673B/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/859EF273/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A02236/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A150E4/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A27F74/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A3ADD9/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A4DD82/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A60DD6/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A73EB4/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A8707D/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85A9A356/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/85AAD6B0/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/6199DFD2/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/619D299D/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/61A07546/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/61A07551/61C883E5" Ref="#PWR?"  Part="1" 
AR Path="/61C883E5" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 6700 10200 50  0001 C CNN
F 1 "GND" H 6705 10277 50  0000 C CNN
F 2 "" H 6700 10450 50  0001 C CNN
F 3 "" H 6700 10450 50  0001 C CNN
	1    6700 10450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C883EB
P 6700 10850
AR Path="/6199673B/61C883EB" Ref="H?"  Part="1" 
AR Path="/859EF273/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A02236/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A150E4/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A27F74/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A3ADD9/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A4DD82/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A60DD6/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A73EB4/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A8707D/61C883EB" Ref="H?"  Part="1" 
AR Path="/85A9A356/61C883EB" Ref="H?"  Part="1" 
AR Path="/85AAD6B0/61C883EB" Ref="H?"  Part="1" 
AR Path="/6199DFD2/61C883EB" Ref="H?"  Part="1" 
AR Path="/619D299D/61C883EB" Ref="H?"  Part="1" 
AR Path="/61A07546/61C883EB" Ref="H?"  Part="1" 
AR Path="/61A07551/61C883EB" Ref="H?"  Part="1" 
AR Path="/61C883EB" Ref="H30"  Part="1" 
F 0 "H30" H 6800 10899 50  0000 L CNN
F 1 "MountingHole_Pad" H 6800 10808 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 6700 10850 50  0001 C CNN
F 3 "~" H 6700 10850 50  0001 C CNN
	1    6700 10850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C883F1
P 6700 10950
AR Path="/6199673B/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/859EF273/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A02236/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A150E4/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A27F74/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A3ADD9/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A4DD82/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A60DD6/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A73EB4/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A8707D/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85A9A356/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/85AAD6B0/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/6199DFD2/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/619D299D/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/61A07546/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/61A07551/61C883F1" Ref="#PWR?"  Part="1" 
AR Path="/61C883F1" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 6700 10700 50  0001 C CNN
F 1 "GND" H 6705 10777 50  0000 C CNN
F 2 "" H 6700 10950 50  0001 C CNN
F 3 "" H 6700 10950 50  0001 C CNN
	1    6700 10950
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U3
U 1 1 630BA1AA
P 9450 4150
F 0 "U3" H 9343 4917 50  0000 C CNN
F 1 "SN74ACT1071" H 9343 4826 50  0000 C CNN
F 2 "alexios:SOIC-14" H 9150 4500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 9150 4500 50  0001 C CNN
	1    9450 4150
	1    0    0    -1  
$EndComp
Wire Notes Line width 24 style solid
	11750 4850 11750 1300
Wire Notes Line width 24 style solid
	15750 4850 11750 4850
Wire Notes Line width 24 style solid
	15750 1300 15750 4850
Wire Notes Line width 24 style solid
	13100 4850 13100 1300
Wire Notes Line width 24 style solid
	14400 4850 14400 1300
Wire Notes Line style solid
	12100 4850 12100 1300
Wire Notes Line style solid
	13450 4850 13450 1300
Wire Notes Line style solid
	14800 4850 14800 1300
Wire Notes Line style solid
	12600 4850 12600 1300
Wire Notes Line style solid
	13950 4850 13950 1300
Wire Notes Line style solid
	15350 4850 15350 1300
Text Notes 11750 1150 0    100  ~ 20
Backplane Pin-outs
Text Notes 2050 3100 0    100  ~ 20
DIN 41612 Sockets
Text Notes 7200 8700 0    50   ~ 0
Power LED
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61F47A43
P 3750 8750
F 0 "#FLG0101" H 3750 8825 50  0001 C CNN
F 1 "PWR_FLAG" V 3750 8877 50  0001 L CNN
F 2 "" H 3750 8750 50  0001 C CNN
F 3 "~" H 3750 8750 50  0001 C CNN
	1    3750 8750
	0    -1   -1   0   
$EndComp
Connection ~ 3750 8750
Wire Wire Line
	1050 10050 1250 10050
Connection ~ 1050 10150
Wire Wire Line
	1050 10150 1050 10250
Text Label 1250 10050 2    50   ~ 0
A2
Wire Wire Line
	1050 10250 1250 10250
Connection ~ 1050 10350
Wire Wire Line
	1050 10350 1050 10450
Text Label 1250 10250 2    50   ~ 0
B2
Connection ~ 1050 9950
Wire Wire Line
	1050 9950 1050 10050
Wire Wire Line
	1050 10450 1250 10450
Text Label 1250 10450 2    50   ~ 0
C2
Wire Wire Line
	750  9850 750  9950
Wire Wire Line
	750  10350 950  10350
Wire Wire Line
	950  9950 750  9950
Wire Wire Line
	950  10150 750  10150
Text Label 950  9950 2    50   ~ 0
A7
Text Label 950  10150 2    50   ~ 0
B7
Text Label 950  10350 2    50   ~ 0
C7
Connection ~ 750  10150
Connection ~ 750  9950
$Comp
L power:+12V #PWR0134
U 1 1 61942C06
P 750 9850
F 0 "#PWR0134" H 750 9700 50  0001 C CNN
F 1 "+12V" H 765 10023 50  0000 C CNN
F 2 "" H 750 9850 50  0001 C CNN
F 3 "" H 750 9850 50  0001 C CNN
	1    750  9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  9950 750  10150
Wire Wire Line
	750  10150 750  10350
Text Label 5400 5450 2    50   ~ 0
DB2
Text Label 5400 5850 2    50   ~ 0
DB4
Text Label 5400 6050 2    50   ~ 0
DB5
Text Label 5400 5950 2    50   ~ 0
DB6
Text Label 8900 7350 2    50   ~ 0
DB7
Text Label 8900 7250 2    50   ~ 0
DB8
Text Label 8900 6450 2    50   ~ 0
DB9
Text Label 8900 6550 2    50   ~ 0
DB10
Text Label 8900 6650 2    50   ~ 0
DB11
Text Label 8900 6750 2    50   ~ 0
DB12
Text Label 8900 6850 2    50   ~ 0
DB13
Text Label 8900 7050 2    50   ~ 0
DB14
Text Label 8900 6950 2    50   ~ 0
DB15
Text Label 4800 5450 0    50   ~ 0
A17
Text Label 4800 5850 0    50   ~ 0
A19
Text Label 4800 6050 0    50   ~ 0
A20
Text Label 4800 5950 0    50   ~ 0
A21
Text Label 8300 7350 0    50   ~ 0
A22
Text Label 8300 7250 0    50   ~ 0
A23
Text Label 8300 6450 0    50   ~ 0
A24
Text Label 8300 6550 0    50   ~ 0
A25
Text Label 8300 6650 0    50   ~ 0
A26
Text Label 8300 6750 0    50   ~ 0
A27
Text Label 8300 6850 0    50   ~ 0
A28
Text Label 8300 7050 0    50   ~ 0
A29
Text Label 8300 6950 0    50   ~ 0
A30
Wire Wire Line
	4800 5850 5450 5850
Wire Wire Line
	4800 6050 5450 6050
Wire Wire Line
	4800 5950 5450 5950
Wire Wire Line
	8300 7350 8950 7350
Wire Wire Line
	8300 7250 8950 7250
Wire Wire Line
	8300 6450 8950 6450
Wire Wire Line
	8300 6550 8950 6550
Wire Wire Line
	8300 6650 8950 6650
Wire Wire Line
	8300 6750 8950 6750
Wire Wire Line
	8300 6850 8950 6850
Wire Wire Line
	8300 7050 8950 7050
Wire Wire Line
	8300 6950 8950 6950
Text Label 5400 4450 2    50   ~ 0
AB1
Text Label 5400 4350 2    50   ~ 0
AB2
Text Label 5400 3650 2    50   ~ 0
AB3
Text Label 5400 3850 2    50   ~ 0
AB4
Text Label 5400 3950 2    50   ~ 0
AB5
Text Label 5400 4050 2    50   ~ 0
AB6
Text Label 5400 4150 2    50   ~ 0
AB7
Text Label 4800 4450 0    50   ~ 0
A5
Text Label 4800 3650 0    50   ~ 0
C6
Wire Wire Line
	4800 4450 5450 4450
Wire Wire Line
	4800 3650 5450 3650
Text Label 5400 5750 2    50   ~ 0
AB11
Text Label 5400 6150 2    50   ~ 0
AB12
Text Label 8900 4150 2    50   ~ 0
AB13
Text Label 8900 5050 2    50   ~ 0
AB14
Text Label 8900 5150 2    50   ~ 0
AB15
Text Label 8900 5250 2    50   ~ 0
AB16
Text Label 8900 5950 2    50   ~ 0
AB17
Text Label 8900 5850 2    50   ~ 0
AB18
Text Label 8900 5750 2    50   ~ 0
AB19
Text Label 4800 5750 0    50   ~ 0
C18
Text Label 4800 6150 0    50   ~ 0
C19
Text Label 8300 4150 0    50   ~ 0
C20
Text Label 8300 5050 0    50   ~ 0
C21
Text Label 8300 5150 0    50   ~ 0
C22
Text Label 8300 5250 0    50   ~ 0
B23
Text Label 8300 5950 0    50   ~ 0
B24
Text Label 8300 5850 0    50   ~ 0
B25
Text Label 8300 5750 0    50   ~ 0
B26
Wire Wire Line
	4800 5750 5450 5750
Wire Wire Line
	4800 6150 5450 6150
Wire Wire Line
	8300 4150 8950 4150
Wire Wire Line
	8300 5050 8950 5050
Wire Wire Line
	8300 5150 8950 5150
Wire Wire Line
	8300 5250 8950 5250
Wire Wire Line
	8300 5950 8950 5950
Wire Wire Line
	8300 5850 8950 5850
Wire Wire Line
	8300 5750 8950 5750
Text Label 8900 5650 2    50   ~ 0
AB20
Text Label 8900 5550 2    50   ~ 0
AB21
Text Label 8900 5350 2    50   ~ 0
AB22
Text Label 8900 5450 2    50   ~ 0
AB23
Text Label 8300 5650 0    50   ~ 0
B27
Text Label 8300 5550 0    50   ~ 0
B28
Text Label 8300 5350 0    50   ~ 0
B29
Text Label 8300 5450 0    50   ~ 0
B30
Wire Wire Line
	8300 5650 8950 5650
Wire Wire Line
	8300 5550 8950 5550
Wire Wire Line
	8300 5350 8950 5350
Wire Wire Line
	8300 5450 8950 5450
Wire Wire Line
	4800 5550 5450 5550
Text Label 4800 5550 0    50   ~ 0
C17
Text Label 5400 5550 2    50   ~ 0
AB10
Wire Wire Line
	12650 5350 12050 5350
Wire Wire Line
	12650 5450 12050 5450
Wire Wire Line
	12650 5650 12050 5650
Wire Wire Line
	12650 5750 12050 5750
Wire Wire Line
	12650 5850 12050 5850
Wire Wire Line
	12650 5950 12050 5950
Wire Wire Line
	12650 6050 12050 6050
Wire Wire Line
	12650 6150 12050 6150
Wire Wire Line
	12650 6250 12050 6250
Wire Wire Line
	12650 6350 12050 6350
Wire Wire Line
	12650 6450 12050 6450
Wire Wire Line
	12650 6550 12050 6550
Wire Wire Line
	12650 6650 12050 6650
Wire Wire Line
	12650 6750 12050 6750
Wire Wire Line
	12650 6850 12050 6850
Wire Wire Line
	12650 6950 12050 6950
Wire Wire Line
	12650 7050 12050 7050
Wire Wire Line
	12650 7150 12050 7150
Wire Wire Line
	12650 7250 12050 7250
Wire Wire Line
	12650 7350 12050 7350
Wire Wire Line
	12650 7450 12050 7450
Wire Wire Line
	12650 7550 12050 7550
Wire Wire Line
	12650 7650 12050 7650
Wire Wire Line
	12650 7750 12050 7750
Wire Wire Line
	12650 7850 12050 7850
Wire Wire Line
	12650 7950 12050 7950
Wire Wire Line
	12650 8150 12050 8150
Wire Wire Line
	12650 8250 12050 8250
Wire Wire Line
	12650 8350 12050 8350
Wire Wire Line
	12650 8450 12050 8450
Wire Wire Line
	12650 8550 12050 8550
Wire Wire Line
	12650 8650 12050 8650
Wire Wire Line
	12650 8750 12050 8750
Wire Wire Line
	12650 8850 12050 8850
Text Label 12050 5350 0    50   ~ 0
~RESET
Text Label 12050 5450 0    50   ~ 0
~RSTHOLD
Text Label 12050 5650 0    50   ~ 0
AB0
Text Label 12050 5750 0    50   ~ 0
AB1
Text Label 12050 5850 0    50   ~ 0
AB2
Text Label 12050 5950 0    50   ~ 0
AB3
Text Label 12050 6050 0    50   ~ 0
AB4
Text Label 12050 6150 0    50   ~ 0
AB5
Text Label 12050 6250 0    50   ~ 0
AB6
Text Label 12050 6350 0    50   ~ 0
AB7
Text Label 12050 6450 0    50   ~ 0
AB8
Text Label 12050 6550 0    50   ~ 0
AB9
Text Label 12050 6650 0    50   ~ 0
AB10
Text Label 12050 6750 0    50   ~ 0
AB11
Text Label 12050 6850 0    50   ~ 0
AB12
Text Label 12050 6950 0    50   ~ 0
AB13
Text Label 12050 7050 0    50   ~ 0
AB14
Text Label 12050 7150 0    50   ~ 0
AB15
Text Label 12050 7250 0    50   ~ 0
AB16
Text Label 12050 7350 0    50   ~ 0
AB17
Text Label 12050 7450 0    50   ~ 0
AB18
Text Label 12050 7550 0    50   ~ 0
AB19
Text Label 12050 7650 0    50   ~ 0
AB20
Text Label 12050 7750 0    50   ~ 0
AB21
Text Label 12050 7850 0    50   ~ 0
AB22
Text Label 12050 7950 0    50   ~ 0
AB23
Text Label 12650 5650 2    50   ~ 0
C4
Text Label 12650 5750 2    50   ~ 0
A5
Text Label 12650 5850 2    50   ~ 0
A6
Text Label 12650 5950 2    50   ~ 0
C6
Text Label 12650 6050 2    50   ~ 0
C8
Text Label 12650 6150 2    50   ~ 0
C9
Text Label 12650 6250 2    50   ~ 0
C10
Text Label 12650 6350 2    50   ~ 0
C11
Text Label 12650 6450 2    50   ~ 0
C15
Text Label 12650 6550 2    50   ~ 0
C16
Text Label 12650 6650 2    50   ~ 0
C17
Text Label 12650 6750 2    50   ~ 0
C18
Text Label 12650 6850 2    50   ~ 0
C19
Text Label 12650 6950 2    50   ~ 0
C20
Text Label 12650 7050 2    50   ~ 0
C21
Text Label 12650 7150 2    50   ~ 0
C22
Text Label 12650 7350 2    50   ~ 0
B24
Text Label 12650 7450 2    50   ~ 0
B25
Text Label 12650 7550 2    50   ~ 0
B26
Text Label 12650 7650 2    50   ~ 0
B27
Text Label 12650 7750 2    50   ~ 0
B28
Text Label 12650 7850 2    50   ~ 0
B29
Text Label 12650 7950 2    50   ~ 0
B30
Text Label 12050 8150 0    50   ~ 0
~IRQ0
Text Label 12050 8250 0    50   ~ 0
~IRQ1
Text Label 12050 8350 0    50   ~ 0
~IRQ2
Text Label 12050 8450 0    50   ~ 0
~IRQ3
Text Label 12050 8550 0    50   ~ 0
~IRQ4
Text Label 12050 8650 0    50   ~ 0
~IRQ5
Text Label 12050 8750 0    50   ~ 0
~IRQ6
Text Label 12050 8850 0    50   ~ 0
~IRQ7
Text Label 12650 8150 2    50   ~ 0
C23
Text Label 12650 8250 2    50   ~ 0
C24
Text Label 12650 8350 2    50   ~ 0
C25
Text Label 12650 8450 2    50   ~ 0
C26
Text Label 12650 8550 2    50   ~ 0
C27
Text Label 12650 8650 2    50   ~ 0
C28
Text Label 12650 8750 2    50   ~ 0
C29
Text Label 12650 8850 2    50   ~ 0
C30
Text Label 12650 5350 2    50   ~ 0
A3
Text Label 12650 5450 2    50   ~ 0
C3
Text Label 12650 7250 2    50   ~ 0
B23
Wire Wire Line
	12850 5750 13450 5750
Text Label 12850 6850 0    50   ~ 0
A15
Text Label 12850 6950 0    50   ~ 0
A16
Text Label 12850 7050 0    50   ~ 0
A17
Text Label 12850 7150 0    50   ~ 0
A18
Text Label 12850 7250 0    50   ~ 0
A19
Text Label 12850 7350 0    50   ~ 0
A20
Text Label 12850 7450 0    50   ~ 0
A21
Text Label 12850 7550 0    50   ~ 0
A22
Text Label 12850 7650 0    50   ~ 0
A23
Text Label 12850 7750 0    50   ~ 0
A24
Text Label 12850 7850 0    50   ~ 0
A25
Text Label 12850 7950 0    50   ~ 0
A26
Text Label 12850 8050 0    50   ~ 0
A27
Text Label 12850 8150 0    50   ~ 0
A28
Text Label 12850 8250 0    50   ~ 0
A29
Text Label 12850 8350 0    50   ~ 0
A30
Text Label 13450 5750 2    50   ~ 0
T34
Text Label 12850 5450 0    50   ~ 0
B11
Text Label 12850 5550 0    50   ~ 0
C12
Text Label 12850 5650 0    50   ~ 0
C13
Text Label 12850 5750 0    50   ~ 0
A4
Text Label 12850 5850 0    50   ~ 0
A12
Text Label 12850 5950 0    50   ~ 0
A13
Text Label 12850 6050 0    50   ~ 0
A9
Text Label 12850 6150 0    50   ~ 0
A8
Text Label 12850 6250 0    50   ~ 0
C5
Text Label 12850 6350 0    50   ~ 0
A14
Text Label 12850 6450 0    50   ~ 0
B3
Text Label 12850 6550 0    50   ~ 0
B4
Text Label 12850 6650 0    50   ~ 0
C14
Wire Wire Line
	4800 4350 5450 4350
Text Label 4800 4350 0    50   ~ 0
A6
Text Label 8300 4350 0    50   ~ 0
A16
Text Label 8900 4350 2    50   ~ 0
DB1
Wire Wire Line
	8300 4350 8950 4350
Wire Wire Line
	4800 5450 5450 5450
$Comp
L alexios:SN74ACT1071 U6
U 1 1 6342861D
P 5950 5950
F 0 "U6" H 5843 6717 50  0000 C CNN
F 1 "SN74ACT1071" H 5843 6626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 5650 6300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 5650 6300 50  0001 C CNN
	1    5950 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5650 5450 5650
Text Label 4800 5650 0    50   ~ 0
A18
Text Label 5400 5650 2    50   ~ 0
DB3
Wire Wire Line
	4800 4550 5450 4550
Text Label 4800 4550 0    50   ~ 0
C4
Text Label 5400 4550 2    50   ~ 0
AB0
Wire Wire Line
	8300 4450 8950 4450
Text Label 8300 4450 0    50   ~ 0
C16
Text Label 8900 4450 2    50   ~ 0
AB9
NoConn ~ 5450 4250
Wire Wire Line
	4800 4150 5450 4150
Wire Wire Line
	4800 4050 5450 4050
Wire Wire Line
	4800 3950 5450 3950
Wire Wire Line
	4800 3850 5450 3850
Text Label 4800 4150 0    50   ~ 0
C11
Text Label 4800 4050 0    50   ~ 0
C10
Text Label 4800 3950 0    50   ~ 0
C9
Text Label 4800 3850 0    50   ~ 0
C8
Wire Wire Line
	8300 4550 8950 4550
Text Label 8900 4550 2    50   ~ 0
DB0
Text Label 8300 4550 0    50   ~ 0
A15
Wire Wire Line
	8300 3650 8950 3650
Text Label 8300 3650 0    50   ~ 0
C15
Text Label 8900 3650 2    50   ~ 0
AB8
Text Notes 4250 9300 0    50   ~ 0
Mates with: TBP02P1-381-12BE
Wire Wire Line
	3900 8850 3750 8850
Wire Wire Line
	3750 8850 3750 8950
Connection ~ 3750 8950
Wire Wire Line
	3750 8950 3900 8950
Wire Wire Line
	3750 9650 3750 9850
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61F48EC5
P 3750 9650
F 0 "#FLG0102" H 3750 9725 50  0001 C CNN
F 1 "PWR_FLAG" V 3750 9777 50  0001 L CNN
F 2 "" H 3750 9650 50  0001 C CNN
F 3 "~" H 3750 9650 50  0001 C CNN
	1    3750 9650
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x12 J13
U 1 1 612E2EE4
P 4100 9050
F 0 "J13" H 4180 9042 50  0000 L CNN
F 1 "CUI TBP02R1-381-12BE" H 4180 8951 50  0000 L CNN
F 2 "alexios:CUI-TBP02R1-381-12BE" H 4100 9050 50  0001 C CNN
F 3 "~" H 4100 9050 50  0001 C CNN
	1    4100 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 9150 3400 9150
Text Label 3400 9150 0    50   ~ 0
POWEROK
Text Label 3400 9250 0    50   ~ 0
VSTB
Text Label 3400 9350 0    50   ~ 0
POWERON
Wire Wire Line
	3900 9250 3400 9250
Wire Wire Line
	3900 9350 3400 9350
$Comp
L Device:LED_ALT D2
U 1 1 6143E5CA
P 7600 9000
F 0 "D2" H 7593 8837 50  0000 C CNN
F 1 "LED_ALT" H 7593 8836 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7600 9000 50  0001 C CNN
F 3 "~" H 7600 9000 50  0001 C CNN
	1    7600 9000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7400 9000 7450 9000
Wire Wire Line
	7200 9000 6650 9000
Text Notes 7200 9150 0    50   ~ 0
Power OK
Wire Wire Line
	3200 8950 3300 8950
$Comp
L Device:CP_Small C10
U 1 1 60F60F37
P 3200 9100
AR Path="/60F60F37" Ref="C10"  Part="1" 
AR Path="/5D34E810/60F60F37" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/60F60F37" Ref="C?"  Part="1" 
F 0 "C10" H 3112 9146 50  0000 R CNN
F 1 "100µF 16V" H 3112 9055 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 3200 9100 50  0001 C CNN
F 3 "~" H 3200 9100 50  0001 C CNN
	1    3200 9100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F60F30
P 3200 9450
AR Path="/5F67D4B5/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/60F60F30" Ref="#PWR0103"  Part="1" 
AR Path="/5D34E810/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/60F60F30" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 3200 9200 50  0001 C CNN
F 1 "GND" H 3205 9277 50  0000 C CNN
F 2 "" H 3200 9450 50  0001 C CNN
F 3 "" H 3200 9450 50  0001 C CNN
	1    3200 9450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 8950 3200 9000
$Comp
L power:+12V #PWR0135
U 1 1 63E9A321
P 3200 8900
F 0 "#PWR0135" H 3200 8750 50  0001 C CNN
F 1 "+12V" H 3215 9073 50  0000 C CNN
F 2 "" H 3200 8900 50  0001 C CNN
F 3 "" H 3200 8900 50  0001 C CNN
	1    3200 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 8900 3200 8950
Connection ~ 3200 8950
$Comp
L Device:R_Small R2
U 1 1 6143E5C4
P 7300 9000
F 0 "R2" V 7104 9000 50  0000 C CNN
F 1 "1kΩ" V 7195 9000 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 9000 50  0001 C CNN
F 3 "~" H 7300 9000 50  0001 C CNN
	1    7300 9000
	0    1    1    0   
$EndComp
Text Label 6650 9000 0    50   ~ 0
POWEROK
$Comp
L Device:LED_ALT D4
U 1 1 614D0445
P 7600 9450
F 0 "D4" H 7593 9287 50  0000 C CNN
F 1 "LED_ALT" H 7593 9286 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7600 9450 50  0001 C CNN
F 3 "~" H 7600 9450 50  0001 C CNN
	1    7600 9450
	-1   0    0    1   
$EndComp
Wire Wire Line
	7400 9450 7450 9450
Wire Wire Line
	7200 9450 6650 9450
Text Notes 7200 9600 0    50   ~ 0
PSU On
$Comp
L Device:R_Small R4
U 1 1 614D0455
P 7300 9450
F 0 "R4" V 7104 9450 50  0000 C CNN
F 1 "1kΩ" V 7195 9450 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 9450 50  0001 C CNN
F 3 "~" H 7300 9450 50  0001 C CNN
	1    7300 9450
	0    1    1    0   
$EndComp
Text Label 6650 9450 0    50   ~ 0
VSTB
Wire Wire Line
	7900 8550 7900 9000
Wire Wire Line
	7750 9000 7900 9000
Connection ~ 7900 9000
Wire Wire Line
	7900 9000 7900 9450
Wire Wire Line
	7750 9450 7900 9450
Connection ~ 7900 9450
Wire Wire Line
	7900 9450 7900 9500
Wire Wire Line
	9050 8550 8650 8550
Text Label 8650 8550 0    50   ~ 0
POWEROK
$Comp
L Device:D_ALT D3
U 1 1 615AE9A2
P 9400 8550
F 0 "D3" H 9400 8767 50  0000 C CNN
F 1 "1N4148?" H 9400 8676 50  0000 C CNN
F 2 "alexios:SOD-323" H 9400 8550 50  0001 C CNN
F 3 "~" H 9400 8550 50  0001 C CNN
	1    9400 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 8550 9850 8550
Text Label 9850 8550 2    50   ~ 0
~RESET
$Comp
L Device:R_Small R3
U 1 1 61642313
P 9150 8550
F 0 "R3" V 8954 8550 50  0000 C CNN
F 1 "1kΩ" V 9045 8550 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9150 8550 50  0001 C CNN
F 3 "~" H 9150 8550 50  0001 C CNN
	1    9150 8550
	0    1    1    0   
$EndComp
Text Label 8600 9000 0    50   ~ 0
POWERON
Wire Wire Line
	9100 9000 8600 9000
$Comp
L Connector_Generic:Conn_01x02 J14
U 1 1 616B7464
P 9300 9000
F 0 "J14" H 9380 8946 50  0000 L CNN
F 1 "2.54mm header" H 9380 8901 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 9300 9000 50  0001 C CNN
F 3 "~" H 9300 9000 50  0001 C CNN
	1    9300 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 9100 9000 9100
Wire Wire Line
	9000 9100 9000 9200
$Comp
L power:GND #PWR01
U 1 1 616D4DA8
P 9000 9200
F 0 "#PWR01" H 9000 8950 50  0001 C CNN
F 1 "GND" H 9005 9027 50  0000 C CNN
F 2 "" H 9000 9200 50  0001 C CNN
F 3 "" H 9000 9200 50  0001 C CNN
	1    9000 9200
	1    0    0    -1  
$EndComp
Wire Notes Line
	8550 8700 9950 8700
Wire Notes Line
	9950 8700 9950 9500
Wire Notes Line
	9950 9500 8550 9500
Wire Notes Line
	8550 9500 8550 8700
Text Notes 8600 8850 0    50   ~ 0
Power switch connector, optional
Wire Wire Line
	7800 8550 7900 8550
Wire Wire Line
	7500 8550 7600 8550
NoConn ~ 3900 9050
NoConn ~ 8950 3750
NoConn ~ 8950 3850
NoConn ~ 8950 3950
NoConn ~ 8950 4050
NoConn ~ 8950 4250
NoConn ~ 8950 7150
NoConn ~ 5450 6250
NoConn ~ 5450 6350
Text Label 12850 5350 0    50   ~ 0
B10
Text Label 13450 5650 2    50   ~ 0
~W
Text Label 13450 5550 2    50   ~ 0
~R
Text Label 13450 5450 2    50   ~ 0
~IO
Text Label 13450 5350 2    50   ~ 0
~MEM
Wire Wire Line
	12850 5650 13450 5650
Wire Wire Line
	12850 5550 13450 5550
Wire Wire Line
	12850 5450 13450 5450
Wire Wire Line
	12850 5350 13450 5350
Text Label 13450 6650 2    50   ~ 0
~IRQS
Text Label 13450 6550 2    50   ~ 0
~IRQ
Text Label 13450 6450 2    50   ~ 0
~HALT
Text Label 13450 6350 2    50   ~ 0
~WAITING
Text Label 13450 6250 2    50   ~ 0
~WS
Text Label 13450 6150 2    50   ~ 0
~IODEV3XX
Text Label 13450 6050 2    50   ~ 0
~IODEV2XX
Text Label 13450 5950 2    50   ~ 0
~IODEV1XX
Text Label 13450 5850 2    50   ~ 0
~SYSDEV
Text Label 13450 8350 2    50   ~ 0
DB15
Text Label 13450 8250 2    50   ~ 0
DB14
Text Label 13450 8150 2    50   ~ 0
DB13
Text Label 13450 8050 2    50   ~ 0
DB12
Text Label 13450 7950 2    50   ~ 0
DB11
Text Label 13450 7850 2    50   ~ 0
DB10
Text Label 13450 7750 2    50   ~ 0
DB9
Text Label 13450 7650 2    50   ~ 0
DB8
Text Label 13450 7550 2    50   ~ 0
DB7
Text Label 13450 7450 2    50   ~ 0
DB6
Text Label 13450 7350 2    50   ~ 0
DB5
Text Label 13450 7250 2    50   ~ 0
DB4
Text Label 13450 7150 2    50   ~ 0
DB3
Text Label 13450 7050 2    50   ~ 0
DB2
Text Label 13450 6950 2    50   ~ 0
DB1
Text Label 13450 6850 2    50   ~ 0
DB0
Wire Wire Line
	12850 8350 13450 8350
Wire Wire Line
	12850 8250 13450 8250
Wire Wire Line
	12850 8150 13450 8150
Wire Wire Line
	12850 8050 13450 8050
Wire Wire Line
	12850 7950 13450 7950
Wire Wire Line
	12850 7850 13450 7850
Wire Wire Line
	12850 7750 13450 7750
Wire Wire Line
	12850 7650 13450 7650
Wire Wire Line
	12850 7550 13450 7550
Wire Wire Line
	12850 7450 13450 7450
Wire Wire Line
	12850 7350 13450 7350
Wire Wire Line
	12850 7250 13450 7250
Wire Wire Line
	12850 7150 13450 7150
Wire Wire Line
	12850 7050 13450 7050
Wire Wire Line
	12850 6950 13450 6950
Wire Wire Line
	12850 6850 13450 6850
Wire Wire Line
	12850 6650 13450 6650
Wire Wire Line
	12850 6550 13450 6550
Wire Wire Line
	12850 6450 13450 6450
Wire Wire Line
	12850 6350 13450 6350
Wire Wire Line
	12850 6250 13450 6250
Wire Wire Line
	12850 6150 13450 6150
Wire Wire Line
	12850 6050 13450 6050
Wire Wire Line
	12850 5950 13450 5950
Wire Wire Line
	12850 5850 13450 5850
$Comp
L Device:R_Small R5
U 1 1 614D3CD1
P 14650 5350
F 0 "R5" V 14600 5550 50  0000 C CNN
F 1 "100kΩ" V 14545 5350 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5350 50  0001 C CNN
F 3 "~" H 14650 5350 50  0001 C CNN
	1    14650 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5350 15000 5350
Wire Wire Line
	15000 5350 15000 5250
$Comp
L power:+5V #PWR0136
U 1 1 614F19A0
P 15000 5250
F 0 "#PWR0136" H 15000 5100 50  0001 C CNN
F 1 "+5V" H 15015 5423 50  0000 C CNN
F 2 "" H 15000 5250 50  0001 C CNN
F 3 "" H 15000 5250 50  0001 C CNN
	1    15000 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 6150F532
P 14650 5450
F 0 "R6" V 14600 5650 50  0000 C CNN
F 1 "100kΩ" V 14545 5450 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5450 50  0001 C CNN
F 3 "~" H 14650 5450 50  0001 C CNN
	1    14650 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5450 15000 5450
Wire Wire Line
	15000 5450 15000 5350
Connection ~ 15000 5350
$Comp
L Device:R_Small R7
U 1 1 61548DED
P 14650 5550
F 0 "R7" V 14600 5750 50  0000 C CNN
F 1 "100kΩ" V 14545 5550 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5550 50  0001 C CNN
F 3 "~" H 14650 5550 50  0001 C CNN
	1    14650 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5550 15000 5550
Wire Wire Line
	15000 5550 15000 5450
$Comp
L Device:R_Small R8
U 1 1 61565976
P 14650 5650
F 0 "R8" V 14600 5850 50  0000 C CNN
F 1 "100kΩ" V 14545 5650 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5650 50  0001 C CNN
F 3 "~" H 14650 5650 50  0001 C CNN
	1    14650 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5650 15000 5650
Wire Wire Line
	15000 5650 15000 5550
$Comp
L Device:R_Small R9
U 1 1 615827F8
P 14650 5750
F 0 "R9" V 14600 5950 50  0000 C CNN
F 1 "100kΩ" V 14545 5750 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5750 50  0001 C CNN
F 3 "~" H 14650 5750 50  0001 C CNN
	1    14650 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5750 15000 5750
Wire Wire Line
	15000 5750 15000 5650
$Comp
L Device:R_Small R10
U 1 1 6159F9C8
P 14650 5850
F 0 "R10" V 14600 6050 50  0000 C CNN
F 1 "100kΩ" V 14545 5850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5850 50  0001 C CNN
F 3 "~" H 14650 5850 50  0001 C CNN
	1    14650 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5850 15000 5850
Wire Wire Line
	15000 5850 15000 5750
$Comp
L Device:R_Small R11
U 1 1 615BCFAB
P 14650 5950
F 0 "R11" V 14600 6150 50  0000 C CNN
F 1 "100kΩ" V 14545 5950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 5950 50  0001 C CNN
F 3 "~" H 14650 5950 50  0001 C CNN
	1    14650 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 5950 15000 5950
Wire Wire Line
	15000 5950 15000 5850
$Comp
L Device:R_Small R12
U 1 1 615DA7F8
P 14650 6050
F 0 "R12" V 14600 6250 50  0000 C CNN
F 1 "100kΩ" V 14545 6050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14650 6050 50  0001 C CNN
F 3 "~" H 14650 6050 50  0001 C CNN
	1    14650 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	14750 6050 15000 6050
Wire Wire Line
	15000 6050 15000 5950
Wire Wire Line
	14550 5350 14100 5350
Wire Wire Line
	14550 5450 14100 5450
Wire Wire Line
	14550 5550 14100 5550
Wire Wire Line
	14550 5650 14100 5650
Wire Wire Line
	14550 5750 14100 5750
Wire Wire Line
	14550 5850 14100 5850
Wire Wire Line
	14550 5950 14100 5950
Wire Wire Line
	14550 6050 14100 6050
Text Label 14100 5350 0    50   ~ 0
~MEM
Text Label 14100 5450 0    50   ~ 0
~IO
Text Label 14100 5550 0    50   ~ 0
~R
Text Label 14100 5650 0    50   ~ 0
~W
Text Label 14100 5750 0    50   ~ 0
~SYSDEV
Text Label 14100 5850 0    50   ~ 0
~IODEV1XX
Text Label 14100 5950 0    50   ~ 0
~IODEV2XX
Text Label 14100 6050 0    50   ~ 0
~IODEV3XX
Text Notes 3750 8100 0    100  ~ 20
Power Connector
Text Notes 6950 8100 0    100  ~ 20
Power LEDs
Text Notes 8600 8100 0    100  ~ 20
Brownout Reset
NoConn ~ 5450 3750
Wire Wire Line
	3200 9250 3200 9450
Wire Wire Line
	3200 9200 3200 9250
Connection ~ 3200 9250
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 63E698AF
P 3300 8950
F 0 "#FLG0103" H 3300 9025 50  0001 C CNN
F 1 "PWR_FLAG" V 3300 9077 50  0001 L CNN
F 2 "" H 3300 8950 50  0001 C CNN
F 3 "~" H 3300 8950 50  0001 C CNN
	1    3300 8950
	1    0    0    -1  
$EndComp
Connection ~ 3300 8950
Wire Wire Line
	3300 8950 3750 8950
$EndSCHEMATC
