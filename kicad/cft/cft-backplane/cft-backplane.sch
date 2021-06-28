EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 13
Title "Control Unit Board"
Date ""
Rev "2119"
Comp ""
Comment1 "B0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5D8B16F5
P 7900 13450
AR Path="/5F67D4B5/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16F5" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16F5" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16F5" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 7900 13300 50  0001 C CNN
F 1 "+5V" H 7842 13487 50  0000 R CNN
F 2 "" H 7900 13450 50  0001 C CNN
F 3 "" H 7900 13450 50  0001 C CNN
	1    7900 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8B16FB
P 7900 13850
AR Path="/5F67D4B5/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D8B16FB" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8B16FB" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8B16FB" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 7900 13600 50  0001 C CNN
F 1 "GND" H 7822 13813 50  0000 R CNN
F 2 "" H 7900 13850 50  0001 C CNN
F 3 "" H 7900 13850 50  0001 C CNN
	1    7900 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 13450 7900 13550
$Comp
L Device:CP_Small C7
U 1 1 5D8B1702
P 7900 13650
AR Path="/5D8B1702" Ref="C7"  Part="1" 
AR Path="/5D34E810/5D8B1702" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8B1702" Ref="C?"  Part="1" 
F 0 "C7" H 7812 13696 50  0000 R CNN
F 1 "47µF" H 7812 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7900 13650 50  0001 C CNN
F 3 "~" H 7900 13650 50  0001 C CNN
	1    7900 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 13750 7900 13850
$Comp
L power:+5V #PWR?
U 1 1 5D8C8446
P 7450 13450
AR Path="/5F67D4B5/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D8C8446" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C8446" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8446" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 7450 13300 50  0001 C CNN
F 1 "+5V" H 7392 13487 50  0000 R CNN
F 2 "" H 7450 13450 50  0001 C CNN
F 3 "" H 7450 13450 50  0001 C CNN
	1    7450 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D8C844C
P 7450 13850
AR Path="/5F67D4B5/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D8C844C" Ref="#PWR0127"  Part="1" 
AR Path="/5D34E810/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5D8C844C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5D8C844C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0127" H 7450 13600 50  0001 C CNN
F 1 "GND" H 7372 13813 50  0000 R CNN
F 2 "" H 7450 13850 50  0001 C CNN
F 3 "" H 7450 13850 50  0001 C CNN
	1    7450 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 13450 7450 13550
$Comp
L Device:CP_Small C6
U 1 1 5D8C8453
P 7450 13650
AR Path="/5D8C8453" Ref="C6"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C6" H 7362 13696 50  0000 R CNN
F 1 "47µF" H 7362 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7450 13650 50  0001 C CNN
F 3 "~" H 7450 13650 50  0001 C CNN
	1    7450 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 13750 7450 13850
Text Notes 10650 14000 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 11200 14000 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	10600 13475 11400 13475
Wire Notes Line width 12 style solid
	10600 14050 10600 13475
Wire Notes Line width 12 style solid
	11400 14050 10600 14050
Wire Notes Line width 12 style solid
	11400 13475 11400 14050
Wire Notes Line style solid
	10600 13650 11400 13650
Wire Notes Line
	11150 13475 11150 14050
Text Notes 3200 13200 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 5750 13450
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 5750 13300 50  0001 C CNN
F 1 "+5V" H 5692 13487 50  0000 R CNN
F 2 "" H 5750 13450 50  0001 C CNN
F 3 "" H 5750 13450 50  0001 C CNN
	1    5750 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 5750 13850
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 5750 13600 50  0001 C CNN
F 1 "GND" H 5672 13813 50  0000 R CNN
F 2 "" H 5750 13850 50  0001 C CNN
F 3 "" H 5750 13850 50  0001 C CNN
	1    5750 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 13450 5750 13550
Wire Wire Line
	5750 13750 5750 13850
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 5300 13450
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0108"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0108" H 5300 13300 50  0001 C CNN
F 1 "+5V" H 5242 13487 50  0000 R CNN
F 2 "" H 5300 13450 50  0001 C CNN
F 3 "" H 5300 13450 50  0001 C CNN
	1    5300 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF9C
P 5300 13850
AR Path="/5F67D4B5/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF9C" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF9C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF9C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 5300 13600 50  0001 C CNN
F 1 "GND" H 5222 13813 50  0000 R CNN
F 2 "" H 5300 13850 50  0001 C CNN
F 3 "" H 5300 13850 50  0001 C CNN
	1    5300 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 13450 5300 13550
Wire Wire Line
	5300 13750 5300 13850
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 6200 13450
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 6200 13300 50  0001 C CNN
F 1 "+5V" H 6142 13487 50  0000 R CNN
F 2 "" H 6200 13450 50  0001 C CNN
F 3 "" H 6200 13450 50  0001 C CNN
	1    6200 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 6200 13850
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 6200 13600 50  0001 C CNN
F 1 "GND" H 6122 13813 50  0000 R CNN
F 2 "" H 6200 13850 50  0001 C CNN
F 3 "" H 6200 13850 50  0001 C CNN
	1    6200 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 13450 6200 13550
Wire Wire Line
	6200 13750 6200 13850
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P 7050 13450
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 7050 13300 50  0001 C CNN
F 1 "+5V" H 6992 13487 50  0000 R CNN
F 2 "" H 7050 13450 50  0001 C CNN
F 3 "" H 7050 13450 50  0001 C CNN
	1    7050 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P 7050 13850
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 7050 13600 50  0001 C CNN
F 1 "GND" H 6972 13813 50  0000 R CNN
F 2 "" H 7050 13850 50  0001 C CNN
F 3 "" H 7050 13850 50  0001 C CNN
	1    7050 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 13450 7050 13550
$Comp
L Device:CP_Small C5
U 1 1 5DD552AD
P 7050 13650
AR Path="/5DD552AD" Ref="C5"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C5" H 6962 13696 50  0000 R CNN
F 1 "47µF" H 6962 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7050 13650 50  0001 C CNN
F 3 "~" H 7050 13650 50  0001 C CNN
	1    7050 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 13750 7050 13850
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P 6600 13450
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H 6600 13300 50  0001 C CNN
F 1 "+5V" H 6542 13487 50  0000 R CNN
F 2 "" H 6600 13450 50  0001 C CNN
F 3 "" H 6600 13450 50  0001 C CNN
	1    6600 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P 6600 13850
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 6600 13600 50  0001 C CNN
F 1 "GND" H 6522 13813 50  0000 R CNN
F 2 "" H 6600 13850 50  0001 C CNN
F 3 "" H 6600 13850 50  0001 C CNN
	1    6600 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 13450 6600 13550
$Comp
L Device:CP_Small C4
U 1 1 5DD552C1
P 6600 13650
AR Path="/5DD552C1" Ref="C4"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C4" H 6512 13696 50  0000 R CNN
F 1 "47µF" H 6512 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6600 13650 50  0001 C CNN
F 3 "~" H 6600 13650 50  0001 C CNN
	1    6600 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 13750 6600 13850
Text Notes 750  850  0    100  ~ 20
The Control Unit Board
Text Notes 750  1650 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
$Comp
L Device:CP_Small C3
U 1 1 5EFD0822
P 6200 13650
AR Path="/5EFD0822" Ref="C3"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C3" H 6112 13696 50  0000 R CNN
F 1 "47µF" H 6112 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6200 13650 50  0001 C CNN
F 3 "~" H 6200 13650 50  0001 C CNN
	1    6200 13650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 5DF0FF8F
P 5750 13650
AR Path="/5DF0FF8F" Ref="C2"  Part="1" 
AR Path="/5D34E810/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF8F" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF8F" Ref="C?"  Part="1" 
F 0 "C2" H 5662 13696 50  0000 R CNN
F 1 "47µF" H 5662 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5750 13650 50  0001 C CNN
F 3 "~" H 5750 13650 50  0001 C CNN
	1    5750 13650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C1
U 1 1 5DF0FFA3
P 5300 13650
AR Path="/5DF0FFA3" Ref="C1"  Part="1" 
AR Path="/5D34E810/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FFA3" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DF0FFA3" Ref="C?"  Part="1" 
F 0 "C1" H 5212 13696 50  0000 R CNN
F 1 "47µF" H 5212 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5300 13650 50  0001 C CNN
F 3 "~" H 5300 13650 50  0001 C CNN
	1    5300 13650
	1    0    0    -1  
$EndComp
Wire Notes Line width 24 style solid
	10950 12700 8150 12700
Wire Notes Line width 24 style solid
	10950 12700 10950 12000
Wire Notes Line width 24 style solid
	8150 12000 10950 12000
Wire Notes Line width 24 style solid
	8150 12000 8150 12700
Text Notes 8250 12250 0    63   ~ 13
Note: IDX Registration
Text Notes 8250 12600 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
$Comp
L power:+5V #PWR?
U 1 1 610E4076
P 8850 13450
AR Path="/5F67D4B5/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/610E4076" Ref="#PWR0182"  Part="1" 
AR Path="/5D34E810/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4076" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4076" Ref="#PWR?"  Part="1" 
F 0 "#PWR0182" H 8850 13300 50  0001 C CNN
F 1 "+5V" H 8792 13487 50  0000 R CNN
F 2 "" H 8850 13450 50  0001 C CNN
F 3 "" H 8850 13450 50  0001 C CNN
	1    8850 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E407C
P 8850 13850
AR Path="/5F67D4B5/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/610E407C" Ref="#PWR0183"  Part="1" 
AR Path="/5D34E810/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E407C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E407C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0183" H 8850 13600 50  0001 C CNN
F 1 "GND" H 8772 13813 50  0000 R CNN
F 2 "" H 8850 13850 50  0001 C CNN
F 3 "" H 8850 13850 50  0001 C CNN
	1    8850 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 13450 8850 13550
$Comp
L Device:CP_Small C9
U 1 1 610E4083
P 8850 13650
AR Path="/610E4083" Ref="C9"  Part="1" 
AR Path="/5D34E810/610E4083" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4083" Ref="C?"  Part="1" 
F 0 "C9" H 8762 13696 50  0000 R CNN
F 1 "47µF" H 8762 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8850 13650 50  0001 C CNN
F 3 "~" H 8850 13650 50  0001 C CNN
	1    8850 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 13750 8850 13850
$Comp
L power:+5V #PWR?
U 1 1 610E408A
P 8400 13450
AR Path="/5F67D4B5/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/610E408A" Ref="#PWR0184"  Part="1" 
AR Path="/5D34E810/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E408A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E408A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0184" H 8400 13300 50  0001 C CNN
F 1 "+5V" H 8342 13487 50  0000 R CNN
F 2 "" H 8400 13450 50  0001 C CNN
F 3 "" H 8400 13450 50  0001 C CNN
	1    8400 13450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610E4090
P 8400 13850
AR Path="/5F67D4B5/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/610E4090" Ref="#PWR0185"  Part="1" 
AR Path="/5D34E810/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/610E4090" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/610E4090" Ref="#PWR?"  Part="1" 
F 0 "#PWR0185" H 8400 13600 50  0001 C CNN
F 1 "GND" H 8322 13813 50  0000 R CNN
F 2 "" H 8400 13850 50  0001 C CNN
F 3 "" H 8400 13850 50  0001 C CNN
	1    8400 13850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 13450 8400 13550
$Comp
L Device:CP_Small C8
U 1 1 610E4097
P 8400 13650
AR Path="/610E4097" Ref="C8"  Part="1" 
AR Path="/5D34E810/610E4097" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/610E4097" Ref="C?"  Part="1" 
F 0 "C8" H 8312 13696 50  0000 R CNN
F 1 "47µF" H 8312 13605 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8400 13650 50  0001 C CNN
F 3 "~" H 8400 13650 50  0001 C CNN
	1    8400 13650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 13750 8400 13850
$Sheet
S 1050 2350 800  400 
U 6199673B
F0 "Sheet6199673A" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 2450 50 
F3 "B[1..32]" U L 1050 2550 50 
F4 "C[1..32]" U L 1050 2650 50 
$EndSheet
Wire Wire Line
	10000 7050 10350 7050
Wire Wire Line
	10000 6950 10350 6950
Wire Wire Line
	10000 6850 10350 6850
Wire Wire Line
	10000 6750 10350 6750
Wire Wire Line
	10000 6650 10350 6650
Wire Wire Line
	10000 6550 10350 6550
Wire Wire Line
	10000 6450 10350 6450
Wire Wire Line
	10000 6350 10350 6350
Wire Wire Line
	10000 6250 10350 6250
Wire Wire Line
	10000 6150 10350 6150
Wire Wire Line
	10000 6050 10350 6050
Wire Wire Line
	10000 5950 10350 5950
Wire Wire Line
	10000 5850 10350 5850
Wire Wire Line
	10000 5750 10350 5750
Wire Wire Line
	10000 5650 10350 5650
Wire Wire Line
	10000 5550 10350 5550
Wire Wire Line
	10000 5350 10350 5350
Wire Wire Line
	10000 5250 10350 5250
Wire Wire Line
	10000 5150 10350 5150
Wire Wire Line
	10000 5050 10350 5050
Wire Wire Line
	10000 4950 10350 4950
Wire Wire Line
	10000 4850 10350 4850
Wire Wire Line
	10000 4750 10350 4750
Wire Wire Line
	10000 4650 10350 4650
Wire Wire Line
	10000 4550 10350 4550
Wire Wire Line
	10000 4350 10350 4350
Wire Wire Line
	10000 4250 10350 4250
Wire Wire Line
	10000 4150 10350 4150
Wire Wire Line
	10000 4050 10350 4050
Wire Wire Line
	8450 7750 8800 7750
Wire Wire Line
	8450 7650 8800 7650
Wire Wire Line
	8450 7550 8800 7550
Wire Wire Line
	8450 7450 8800 7450
Wire Wire Line
	8450 7350 8800 7350
Wire Wire Line
	8450 7250 8800 7250
Wire Wire Line
	8450 7150 8800 7150
Wire Wire Line
	8450 7050 8800 7050
Wire Wire Line
	8450 6850 8800 6850
Wire Wire Line
	8450 6750 8800 6750
Wire Wire Line
	8450 6650 8800 6650
Wire Wire Line
	8450 6550 8800 6550
Wire Wire Line
	8450 6450 8800 6450
Wire Wire Line
	8450 6350 8800 6350
Wire Wire Line
	8450 6250 8800 6250
Wire Wire Line
	8450 6150 8800 6150
Wire Wire Line
	8450 6050 8800 6050
Wire Wire Line
	8450 5950 8800 5950
Wire Wire Line
	8450 5850 8800 5850
Wire Wire Line
	8450 5750 8800 5750
Wire Wire Line
	8450 5650 8800 5650
Wire Wire Line
	8450 5550 8800 5550
Wire Wire Line
	8450 5450 8800 5450
Wire Wire Line
	8450 5350 8800 5350
Wire Wire Line
	8450 5250 8800 5250
Wire Wire Line
	8450 5150 8800 5150
Wire Wire Line
	8450 5050 8800 5050
Wire Wire Line
	8450 4950 8800 4950
Wire Wire Line
	8450 4850 8800 4850
Wire Wire Line
	8450 4750 8800 4750
Wire Wire Line
	8450 4650 8800 4650
Wire Wire Line
	8450 4350 8800 4350
Wire Wire Line
	8450 4250 8800 4250
Wire Wire Line
	7900 4750 8250 4750
Wire Wire Line
	7900 4650 8250 4650
Wire Wire Line
	7900 4450 8250 4450
Wire Wire Line
	7900 4350 8250 4350
Wire Wire Line
	7900 4250 8250 4250
Wire Wire Line
	7900 4150 8250 4150
Wire Wire Line
	7900 4050 8250 4050
Wire Wire Line
	8250 6050 7900 6050
Wire Wire Line
	8250 5950 7900 5950
Wire Wire Line
	8250 5850 7900 5850
Wire Wire Line
	8250 5750 7900 5750
Wire Wire Line
	8250 5650 7900 5650
Wire Wire Line
	8250 5550 7900 5550
Wire Wire Line
	8250 5450 7900 5450
Wire Wire Line
	8250 5350 7900 5350
Text Label 8250 4050 2    50   ~ 0
FPD0
Text Label 8250 4150 2    50   ~ 0
FPD1
Text Label 8250 4250 2    50   ~ 0
FPD2
Text Label 8250 4350 2    50   ~ 0
FPD3
Text Label 8250 4450 2    50   ~ 0
FPD4
Text Label 8250 4550 2    50   ~ 0
FPD5
Text Label 8250 4650 2    50   ~ 0
FPD6
Text Label 8250 4750 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR04
U 1 1 857F75B3
P 10100 7850
AR Path="/857F75B3" Ref="#PWR04"  Part="1" 
AR Path="/6199673B/857F75B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 10100 7600 50  0001 C CNN
F 1 "GND" H 10105 7677 50  0000 C CNN
F 2 "" H 10100 7850 50  0001 C CNN
F 3 "" H 10100 7850 50  0001 C CNN
	1    10100 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 7750 10100 7750
Wire Wire Line
	10100 7750 10100 7850
Text Label 10350 5550 2    50   ~ 0
DB0
Text Label 10350 5650 2    50   ~ 0
DB1
Text Label 10350 5750 2    50   ~ 0
DB2
Text Label 10350 5850 2    50   ~ 0
DB3
Text Label 10350 5950 2    50   ~ 0
DB4
Text Label 10350 6050 2    50   ~ 0
DB5
Text Label 10350 6150 2    50   ~ 0
DB6
Text Label 10350 6250 2    50   ~ 0
DB7
Text Label 10350 6350 2    50   ~ 0
DB8
Text Label 10350 6450 2    50   ~ 0
DB9
Text Label 10350 6550 2    50   ~ 0
DB10
Text Label 10350 6650 2    50   ~ 0
DB11
Text Label 10350 6750 2    50   ~ 0
DB12
Text Label 10350 6850 2    50   ~ 0
DB13
Text Label 10350 6950 2    50   ~ 0
DB14
Text Label 10350 7050 2    50   ~ 0
DB15
$Comp
L power:+5V #PWR02
U 1 1 857F75CB
P 8750 4000
AR Path="/857F75CB" Ref="#PWR02"  Part="1" 
AR Path="/6199673B/857F75CB" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 8750 3850 50  0001 C CNN
F 1 "+5V" H 8765 4173 50  0000 C CNN
F 2 "" H 8750 4000 50  0001 C CNN
F 3 "" H 8750 4000 50  0001 C CNN
	1    8750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4050 8750 4050
Wire Wire Line
	8750 4050 8750 4000
Text Label 8250 5350 2    50   ~ 0
IR0
Text Label 8250 5450 2    50   ~ 0
IR1
Text Label 8250 5550 2    50   ~ 0
IR2
Text Label 8250 5650 2    50   ~ 0
IR3
Text Label 8250 5750 2    50   ~ 0
IR4
Text Label 8250 5850 2    50   ~ 0
IR5
Text Label 8250 5950 2    50   ~ 0
IR6
Text Label 8250 6050 2    50   ~ 0
IR7
Text Label 8450 4250 0    50   ~ 0
~RESET
Text Label 8450 4350 0    50   ~ 0
~RSTHOLD
Text Label 8450 4550 0    50   ~ 0
AB0
Text Label 8450 4650 0    50   ~ 0
AB1
Text Label 8450 4750 0    50   ~ 0
AB2
Text Label 8450 4850 0    50   ~ 0
AB3
Text Label 8450 4950 0    50   ~ 0
AB4
Text Label 8450 5050 0    50   ~ 0
AB5
Text Label 8450 5150 0    50   ~ 0
AB6
Text Label 8450 5250 0    50   ~ 0
AB7
Text Label 8450 5350 0    50   ~ 0
AB8
Text Label 8450 5450 0    50   ~ 0
AB9
Text Label 8450 5550 0    50   ~ 0
AB10
Text Label 8450 5650 0    50   ~ 0
AB11
Text Label 8450 5750 0    50   ~ 0
AB12
Text Label 8450 5850 0    50   ~ 0
AB13
Text Label 8450 5950 0    50   ~ 0
AB14
Text Label 8450 6050 0    50   ~ 0
AB15
Text Label 8450 6150 0    50   ~ 0
AB16
Text Label 8450 6250 0    50   ~ 0
AB17
Text Label 8450 6350 0    50   ~ 0
AB18
Text Label 8450 6450 0    50   ~ 0
AB19
Text Label 8450 6550 0    50   ~ 0
AB20
Text Label 8450 6650 0    50   ~ 0
AB21
Text Label 8450 6750 0    50   ~ 0
AB22
Text Label 8450 6850 0    50   ~ 0
AB23
Text Label 8450 7050 0    50   ~ 0
~IRQ0
Text Label 8450 7150 0    50   ~ 0
~IRQ1
Text Label 8450 7250 0    50   ~ 0
~IRQ2
Text Label 8450 7350 0    50   ~ 0
~IRQ3
Text Label 8450 7450 0    50   ~ 0
~IRQ4
Text Label 8450 7550 0    50   ~ 0
~IRQ5
Text Label 8450 7650 0    50   ~ 0
~IRQ6
Text Label 8450 7750 0    50   ~ 0
~IRQ7
Text Label 10350 4050 2    50   ~ 0
~MEM
Text Label 10350 4150 2    50   ~ 0
~IO
Text Label 10350 4250 2    50   ~ 0
~R
Text Label 10350 4350 2    50   ~ 0
~W
Text Label 10350 4550 2    50   ~ 0
~SYSDEV
Text Label 10350 4650 2    50   ~ 0
~IODEV1XX
Text Label 10350 4750 2    50   ~ 0
~IODEV2XX
Text Label 10350 4850 2    50   ~ 0
~IODEV3XX
Text Label 10350 4950 2    50   ~ 0
~WS
Text Label 10350 5050 2    50   ~ 0
~WAITING
Text Label 10350 5150 2    50   ~ 0
~HALT
Text Label 10350 5250 2    50   ~ 0
~IRQ
Text Label 10350 5350 2    50   ~ 0
~IRQS
Text Label 6200 5950 0    50   ~ 0
~FPRESET
Text Label 6200 4250 0    50   ~ 0
FPCLK
Text Label 6200 4350 0    50   ~ 0
~FPCLK~⁄CLK
Text Label 6200 6050 0    50   ~ 0
POWEROK
Text Label 6200 5850 0    50   ~ 0
FPFETCH
Text Label 6200 4950 0    50   ~ 0
~FPµC2
Text Label 6200 4850 0    50   ~ 0
~FPµC1
Text Label 6200 4750 0    50   ~ 0
~FPµC0
Text Label 6200 4650 0    50   ~ 0
~FPµA0
Text Label 6200 4550 0    50   ~ 0
~FPIRL
Text Label 6200 5050 0    50   ~ 0
~FPIRH
Text Label 6200 5150 0    50   ~ 0
~FPFLAGS
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 857F7616
P 7300 3950
AR Path="/857F7616" Ref="P1"  Part="2" 
AR Path="/6199673B/857F7616" Ref="P?"  Part="2" 
F 0 "P1" H 7300 4117 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 7300 4026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 7250 3050 50  0001 C CNN
F 3 "" H 7250 3050 50  0001 C CNN
	2    7300 3950
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 857F761C
P 5050 3950
AR Path="/857F761C" Ref="P1"  Part="1" 
AR Path="/6199673B/857F761C" Ref="P?"  Part="1" 
F 0 "P1" H 5050 4117 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 5050 4026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 5000 3050 50  0001 C CNN
F 3 "" H 5000 3050 50  0001 C CNN
	1    5050 3950
	1    0    0    -1  
$EndComp
Text Label 6000 4250 2    50   ~ 0
~END
Wire Wire Line
	5650 4250 6000 4250
Text Label 4100 6950 0    50   ~ 0
~WRITE-FL
Text Label 4100 6850 0    50   ~ 0
FN
Text Label 4100 6750 0    50   ~ 0
FZ
Text Label 4100 6650 0    50   ~ 0
FL
Text Label 4100 6550 0    50   ~ 0
FV
Text Label 4100 6350 0    50   ~ 0
IBUS15
Text Label 4100 6250 0    50   ~ 0
IBUS14
Text Label 4100 6150 0    50   ~ 0
IBUS13
Text Label 4100 6050 0    50   ~ 0
IBUS12
Text Label 4100 5950 0    50   ~ 0
IBUS11
Text Label 4100 5850 0    50   ~ 0
IBUS10
Text Label 4100 5750 0    50   ~ 0
IBUS9
Text Label 4100 5650 0    50   ~ 0
IBUS8
Text Label 4100 5550 0    50   ~ 0
IBUS7
Text Label 4100 5450 0    50   ~ 0
IBUS6
Text Label 4100 5350 0    50   ~ 0
IBUS5
Text Label 4100 5250 0    50   ~ 0
IBUS4
Text Label 4100 5150 0    50   ~ 0
IBUS3
Text Label 4100 5050 0    50   ~ 0
IBUS2
Text Label 4100 4950 0    50   ~ 0
IBUS1
Text Label 4100 4850 0    50   ~ 0
IBUS0
Text Label 4100 4650 0    50   ~ 0
T34
Text Label 4100 4550 0    50   ~ 0
CLK4
Text Label 4100 4450 0    50   ~ 0
CLK3
Text Label 4100 4350 0    50   ~ 0
CLK2
Wire Wire Line
	5750 6950 5750 7050
Wire Wire Line
	5650 6950 5750 6950
$Comp
L power:GND #PWR03
U 1 1 857F763F
P 5750 7050
AR Path="/857F763F" Ref="#PWR03"  Part="1" 
AR Path="/6199673B/857F763F" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 5750 6800 50  0001 C CNN
F 1 "GND" H 5755 6877 50  0000 C CNN
F 2 "" H 5750 7050 50  0001 C CNN
F 3 "" H 5750 7050 50  0001 C CNN
	1    5750 7050
	1    0    0    -1  
$EndComp
Text Label 6000 6650 2    50   ~ 0
COND3
Text Label 6000 6550 2    50   ~ 0
COND2
Text Label 6000 6450 2    50   ~ 0
COND1
Text Label 6000 6350 2    50   ~ 0
COND0
Text Label 6000 6150 2    50   ~ 0
ACTION3
Text Label 6000 6050 2    50   ~ 0
ACTION2
Text Label 6000 5950 2    50   ~ 0
ACTION1
Text Label 6000 5850 2    50   ~ 0
ACTION0
Text Label 6000 5650 2    50   ~ 0
WADDR4
Text Label 6000 5550 2    50   ~ 0
WADDR3
Text Label 6000 5450 2    50   ~ 0
WADDR2
Text Label 6000 5350 2    50   ~ 0
WADDR1
Text Label 6000 5250 2    50   ~ 0
WADDR0
Text Label 6000 5050 2    50   ~ 0
RADDR4
Text Label 6000 4950 2    50   ~ 0
RADDR3
Text Label 6000 4850 2    50   ~ 0
RADDR2
Text Label 6000 4750 2    50   ~ 0
RADDR1
Text Label 6000 4650 2    50   ~ 0
RADDR0
Wire Wire Line
	4400 4050 4400 4000
Wire Wire Line
	4450 4050 4400 4050
$Comp
L power:+5V #PWR01
U 1 1 857F7659
P 4400 4000
AR Path="/857F7659" Ref="#PWR01"  Part="1" 
AR Path="/6199673B/857F7659" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 4400 3850 50  0001 C CNN
F 1 "+5V" H 4415 4173 50  0000 C CNN
F 2 "" H 4400 4000 50  0001 C CNN
F 3 "" H 4400 4000 50  0001 C CNN
	1    4400 4000
	1    0    0    -1  
$EndComp
Text Label 6000 4450 2    50   ~ 0
~SKIPEXT
Text Label 6000 4350 2    50   ~ 0
~ENDEXT
Wire Wire Line
	4100 4350 4450 4350
Wire Wire Line
	4100 4450 4450 4450
Wire Wire Line
	4100 4550 4450 4550
Wire Wire Line
	4100 4650 4450 4650
Wire Wire Line
	4100 4850 4450 4850
Wire Wire Line
	4100 4950 4450 4950
Wire Wire Line
	4100 5050 4450 5050
Wire Wire Line
	4100 5150 4450 5150
Wire Wire Line
	4100 5250 4450 5250
Wire Wire Line
	4100 5350 4450 5350
Wire Wire Line
	4100 5450 4450 5450
Wire Wire Line
	4100 5550 4450 5550
Wire Wire Line
	4100 5650 4450 5650
Wire Wire Line
	4100 5750 4450 5750
Wire Wire Line
	4100 5850 4450 5850
Wire Wire Line
	4100 5950 4450 5950
Wire Wire Line
	4100 6050 4450 6050
Wire Wire Line
	4100 6150 4450 6150
Wire Wire Line
	4100 6250 4450 6250
Wire Wire Line
	4100 6350 4450 6350
Wire Wire Line
	4100 6550 4450 6550
Wire Wire Line
	4100 6650 4450 6650
Wire Wire Line
	4100 6750 4450 6750
Wire Wire Line
	4100 6850 4450 6850
Wire Wire Line
	4100 6950 4450 6950
Wire Wire Line
	5650 4350 6000 4350
Wire Wire Line
	5650 4450 6000 4450
Wire Wire Line
	5650 4650 6000 4650
Wire Wire Line
	5650 4750 6000 4750
Wire Wire Line
	5650 4850 6000 4850
Wire Wire Line
	5650 4950 6000 4950
Wire Wire Line
	5650 5050 6000 5050
Wire Wire Line
	5650 5250 6000 5250
Wire Wire Line
	5650 5350 6000 5350
Wire Wire Line
	5650 5450 6000 5450
Wire Wire Line
	5650 5550 6000 5550
Wire Wire Line
	5650 5650 6000 5650
Wire Wire Line
	5650 5850 6000 5850
Wire Wire Line
	5650 5950 6000 5950
Wire Wire Line
	5650 6050 6000 6050
Wire Wire Line
	5650 6150 6000 6150
Wire Wire Line
	5650 6350 6000 6350
Wire Wire Line
	5650 6450 6000 6450
Wire Wire Line
	5650 6550 6000 6550
Wire Wire Line
	5650 6650 6000 6650
Wire Wire Line
	6200 4850 6700 4850
Wire Wire Line
	6200 4750 6700 4750
Wire Wire Line
	6200 4650 6700 4650
Wire Wire Line
	6200 4450 6700 4450
Wire Wire Line
	6200 4350 6700 4350
Wire Wire Line
	6200 4250 6700 4250
Wire Wire Line
	6200 5550 6700 5550
Wire Wire Line
	6200 5450 6700 5450
Wire Wire Line
	6200 5350 6700 5350
Wire Wire Line
	6200 5250 6700 5250
Wire Wire Line
	6200 5150 6700 5150
Wire Wire Line
	6200 5050 6700 5050
Wire Wire Line
	6200 4950 6700 4950
Wire Wire Line
	6700 5650 6200 5650
Wire Wire Line
	6700 5750 6200 5750
Wire Wire Line
	6700 5850 6200 5850
Wire Wire Line
	6700 5950 6200 5950
Wire Wire Line
	6700 6050 6200 6050
Wire Wire Line
	5650 4050 6000 4050
Text Label 6000 4050 2    50   ~ 0
16MHz
NoConn ~ 5650 6850
Text Label 6200 5250 0    50   ~ 0
~FPAEXT
Wire Wire Line
	10000 4450 10350 4450
Text Label 10350 4450 2    50   ~ 0
T34
Text Label 6200 5350 0    50   ~ 0
~FPPCL
Text Label 6200 5450 0    50   ~ 0
~FPPCH
Text Label 6200 5550 0    50   ~ 0
~FPDRL
Text Label 6200 5650 0    50   ~ 0
~FPDRH
Text Label 6200 4450 0    50   ~ 0
~FPCTX
Text Label 6200 5750 0    50   ~ 0
~FPRAM~∕ROM
NoConn ~ 8450 7050
NoConn ~ 8450 7150
NoConn ~ 8450 7250
NoConn ~ 8450 7350
NoConn ~ 8450 7450
NoConn ~ 8450 7550
NoConn ~ 8450 7650
NoConn ~ 8450 7750
$Comp
L power:PWR_FLAG #FLG01
U 1 1 857F76B4
P 4350 4050
AR Path="/857F76B4" Ref="#FLG01"  Part="1" 
AR Path="/6199673B/857F76B4" Ref="#FLG?"  Part="1" 
F 0 "#FLG01" H 4350 4125 50  0001 C CNN
F 1 "PWR_FLAG" V 4350 4177 50  0000 L CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "~" H 4350 4050 50  0001 C CNN
	1    4350 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 4050 4400 4050
Connection ~ 4400 4050
$Comp
L power:PWR_FLAG #FLG02
U 1 1 857F76BC
P 5800 6950
AR Path="/857F76BC" Ref="#FLG02"  Part="1" 
AR Path="/6199673B/857F76BC" Ref="#FLG?"  Part="1" 
F 0 "#FLG02" H 5800 7025 50  0001 C CNN
F 1 "PWR_FLAG" V 5800 7078 50  0000 L CNN
F 2 "" H 5800 6950 50  0001 C CNN
F 3 "~" H 5800 6950 50  0001 C CNN
	1    5800 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 6950 5800 6950
Connection ~ 5750 6950
Wire Wire Line
	7900 4550 8250 4550
Wire Wire Line
	6200 4550 6700 4550
Wire Wire Line
	8450 4550 8800 4550
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 857F76C7
P 9400 3950
AR Path="/857F76C7" Ref="P2"  Part="1" 
AR Path="/6199673B/857F76C7" Ref="P?"  Part="1" 
F 0 "P2" H 9400 4117 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 9400 4026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 9275 3075 50  0001 C CNN
F 3 "" H 9275 3075 50  0001 C CNN
	1    9400 3950
	1    0    0    -1  
$EndComp
Text Label 4100 4250 0    50   ~ 0
CLK1
Wire Wire Line
	4100 4250 4450 4250
NoConn ~ 6700 4050
NoConn ~ 6700 4150
Text Notes 4100 3600 0    100  ~ 20
Processor Bus
Text Notes 6900 3600 0    100  ~ 20
Local Bus
Text Notes 8850 3600 0    100  ~ 20
Peripheral Bus
$Comp
L alexios:SN74ACT1073 U?
U 1 1 857F76D4
P 5000 8050
AR Path="/6199673B/857F76D4" Ref="U?"  Part="1" 
AR Path="/857F76D4" Ref="U1"  Part="1" 
F 0 "U1" H 5330 7846 50  0000 L CNN
F 1 "SN74ACT1073" H 5330 7755 50  0000 L CNN
F 2 "" H 4700 8400 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1073.pdf" H 4700 8400 50  0001 C CNN
	1    5000 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 7550 4100 7550
Wire Wire Line
	4500 7650 4100 7650
Wire Wire Line
	4500 7750 4100 7750
Wire Wire Line
	4500 7850 4100 7850
Wire Wire Line
	4500 7950 4100 7950
Wire Wire Line
	4500 8050 4100 8050
Wire Wire Line
	4500 8150 4100 8150
Wire Wire Line
	4500 8250 4100 8250
Wire Wire Line
	4500 8350 4100 8350
Wire Wire Line
	4500 8450 4100 8450
Wire Wire Line
	4500 8550 4100 8550
Wire Wire Line
	4500 8650 4100 8650
Wire Wire Line
	4500 8750 4100 8750
Wire Wire Line
	4500 8850 4100 8850
Wire Wire Line
	4500 8950 4100 8950
Wire Wire Line
	4500 9050 4100 9050
Text Label 4100 7550 0    50   ~ 0
X45
Wire Bus Line
	1050 2450 650  2450
Wire Bus Line
	1050 2550 650  2550
Wire Bus Line
	1050 2650 650  2650
Text Label 650  2450 0    50   ~ 0
A[1..32]
Text Label 650  2550 0    50   ~ 0
B[1..32]
Text Label 650  2650 0    50   ~ 0
C[1..32]
$Sheet
S 1050 2950 800  400 
U 859EF273
F0 "sheet859EF26E" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 3050 50 
F3 "B[1..32]" U L 1050 3150 50 
F4 "C[1..32]" U L 1050 3250 50 
$EndSheet
Wire Bus Line
	1050 3050 650  3050
Wire Bus Line
	1050 3150 650  3150
Wire Bus Line
	1050 3250 650  3250
Text Label 650  3050 0    50   ~ 0
A[1..32]
Text Label 650  3150 0    50   ~ 0
B[1..32]
Text Label 650  3250 0    50   ~ 0
C[1..32]
$Sheet
S 1050 3550 800  400 
U 85A02236
F0 "sheet85A02231" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 3650 50 
F3 "B[1..32]" U L 1050 3750 50 
F4 "C[1..32]" U L 1050 3850 50 
$EndSheet
Wire Bus Line
	1050 3650 650  3650
Wire Bus Line
	1050 3750 650  3750
Wire Bus Line
	1050 3850 650  3850
Text Label 650  3650 0    50   ~ 0
A[1..32]
Text Label 650  3750 0    50   ~ 0
B[1..32]
Text Label 650  3850 0    50   ~ 0
C[1..32]
$Sheet
S 1050 4150 800  400 
U 85A150E4
F0 "sheet85A150DF" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 4250 50 
F3 "B[1..32]" U L 1050 4350 50 
F4 "C[1..32]" U L 1050 4450 50 
$EndSheet
Wire Bus Line
	1050 4250 650  4250
Wire Bus Line
	1050 4350 650  4350
Wire Bus Line
	1050 4450 650  4450
Text Label 650  4250 0    50   ~ 0
A[1..32]
Text Label 650  4350 0    50   ~ 0
B[1..32]
Text Label 650  4450 0    50   ~ 0
C[1..32]
$Sheet
S 1050 4750 800  400 
U 85A27F74
F0 "sheet85A27F6F" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 4850 50 
F3 "B[1..32]" U L 1050 4950 50 
F4 "C[1..32]" U L 1050 5050 50 
$EndSheet
Wire Bus Line
	1050 4850 650  4850
Wire Bus Line
	1050 4950 650  4950
Wire Bus Line
	1050 5050 650  5050
Text Label 650  4850 0    50   ~ 0
A[1..32]
Text Label 650  4950 0    50   ~ 0
B[1..32]
Text Label 650  5050 0    50   ~ 0
C[1..32]
$Sheet
S 1050 5350 800  400 
U 85A3ADD9
F0 "sheet85A3ADD4" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 5450 50 
F3 "B[1..32]" U L 1050 5550 50 
F4 "C[1..32]" U L 1050 5650 50 
$EndSheet
Wire Bus Line
	1050 5450 650  5450
Wire Bus Line
	1050 5550 650  5550
Wire Bus Line
	1050 5650 650  5650
Text Label 650  5450 0    50   ~ 0
A[1..32]
Text Label 650  5550 0    50   ~ 0
B[1..32]
Text Label 650  5650 0    50   ~ 0
C[1..32]
$Sheet
S 1050 5950 800  400 
U 85A4DD82
F0 "sheet85A4DD7D" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 6050 50 
F3 "B[1..32]" U L 1050 6150 50 
F4 "C[1..32]" U L 1050 6250 50 
$EndSheet
Wire Bus Line
	1050 6050 650  6050
Wire Bus Line
	1050 6150 650  6150
Wire Bus Line
	1050 6250 650  6250
Text Label 650  6050 0    50   ~ 0
A[1..32]
Text Label 650  6150 0    50   ~ 0
B[1..32]
Text Label 650  6250 0    50   ~ 0
C[1..32]
$Sheet
S 1050 6550 800  400 
U 85A60DD6
F0 "sheet85A60DD1" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 6650 50 
F3 "B[1..32]" U L 1050 6750 50 
F4 "C[1..32]" U L 1050 6850 50 
$EndSheet
Wire Bus Line
	1050 6650 650  6650
Wire Bus Line
	1050 6750 650  6750
Wire Bus Line
	1050 6850 650  6850
Text Label 650  6650 0    50   ~ 0
A[1..32]
Text Label 650  6750 0    50   ~ 0
B[1..32]
Text Label 650  6850 0    50   ~ 0
C[1..32]
$Sheet
S 1050 7150 800  400 
U 85A73EB4
F0 "sheet85A73EAF" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 7250 50 
F3 "B[1..32]" U L 1050 7350 50 
F4 "C[1..32]" U L 1050 7450 50 
$EndSheet
Wire Bus Line
	1050 7250 650  7250
Wire Bus Line
	1050 7350 650  7350
Wire Bus Line
	1050 7450 650  7450
Text Label 650  7250 0    50   ~ 0
A[1..32]
Text Label 650  7350 0    50   ~ 0
B[1..32]
Text Label 650  7450 0    50   ~ 0
C[1..32]
$Sheet
S 1050 7750 800  400 
U 85A8707D
F0 "sheet85A87078" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 7850 50 
F3 "B[1..32]" U L 1050 7950 50 
F4 "C[1..32]" U L 1050 8050 50 
$EndSheet
Wire Bus Line
	1050 7850 650  7850
Wire Bus Line
	1050 7950 650  7950
Wire Bus Line
	1050 8050 650  8050
Text Label 650  7850 0    50   ~ 0
A[1..32]
Text Label 650  7950 0    50   ~ 0
B[1..32]
Text Label 650  8050 0    50   ~ 0
C[1..32]
$Sheet
S 1050 8350 800  400 
U 85A9A356
F0 "sheet85A9A351" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 8450 50 
F3 "B[1..32]" U L 1050 8550 50 
F4 "C[1..32]" U L 1050 8650 50 
$EndSheet
Wire Bus Line
	1050 8450 650  8450
Wire Bus Line
	1050 8550 650  8550
Wire Bus Line
	1050 8650 650  8650
Text Label 650  8450 0    50   ~ 0
A[1..32]
Text Label 650  8550 0    50   ~ 0
B[1..32]
Text Label 650  8650 0    50   ~ 0
C[1..32]
$Sheet
S 1050 8950 800  400 
U 85AAD6B0
F0 "sheet85AAD6AB" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 9050 50 
F3 "B[1..32]" U L 1050 9150 50 
F4 "C[1..32]" U L 1050 9250 50 
$EndSheet
Wire Bus Line
	1050 9050 650  9050
Wire Bus Line
	1050 9150 650  9150
Wire Bus Line
	1050 9250 650  9250
Text Label 650  9050 0    50   ~ 0
A[1..32]
Text Label 650  9150 0    50   ~ 0
B[1..32]
Text Label 650  9250 0    50   ~ 0
C[1..32]
Text Notes 11000 1900 0    50   ~ 0
A1
Text Notes 11000 2000 0    50   ~ 0
A2
Text Notes 11000 2100 0    50   ~ 0
A3
Text Notes 11000 2200 0    50   ~ 0
A4
Text Notes 11000 2300 0    50   ~ 0
A5
Text Notes 11000 2400 0    50   ~ 0
A6
Text Notes 11000 2500 0    50   ~ 0
A7
Text Notes 11000 2600 0    50   ~ 0
A8
Text Notes 11000 2700 0    50   ~ 0
A9
Text Notes 11000 2800 0    50   ~ 0
A10
Text Notes 11000 2900 0    50   ~ 0
A11
Text Notes 11000 3000 0    50   ~ 0
A12
Text Notes 11000 3100 0    50   ~ 0
A13
Text Notes 11000 3200 0    50   ~ 0
A14
Text Notes 11000 3300 0    50   ~ 0
A15
Text Notes 11000 3400 0    50   ~ 0
A16
Text Notes 11000 3500 0    50   ~ 0
A17
Text Notes 11000 3600 0    50   ~ 0
A18
Text Notes 11000 3700 0    50   ~ 0
A19
Text Notes 11000 3800 0    50   ~ 0
A20
Text Notes 11000 3900 0    50   ~ 0
A21
Text Notes 11000 4000 0    50   ~ 0
A22
Text Notes 11000 4100 0    50   ~ 0
A23
Text Notes 11000 4200 0    50   ~ 0
A24
Text Notes 11000 4300 0    50   ~ 0
A25
Text Notes 11000 4400 0    50   ~ 0
A26
Text Notes 11000 4500 0    50   ~ 0
A27
Text Notes 11000 4600 0    50   ~ 0
A28
Text Notes 11000 4700 0    50   ~ 0
A29
Text Notes 11000 4800 0    50   ~ 0
A30
Text Notes 11000 4900 0    50   ~ 0
A31
Text Notes 11000 5000 0    50   ~ 0
A32
Text Notes 13400 5000 0    50   ~ 0
C32
Text Notes 13400 4900 0    50   ~ 0
C31
Text Notes 13400 4800 0    50   ~ 0
C30
Text Notes 13400 4700 0    50   ~ 0
C29
Text Notes 13400 4600 0    50   ~ 0
C28
Text Notes 13400 4500 0    50   ~ 0
C27
Text Notes 13400 4400 0    50   ~ 0
C26
Text Notes 13400 4300 0    50   ~ 0
C25
Text Notes 13400 4200 0    50   ~ 0
C24
Text Notes 13400 4100 0    50   ~ 0
C23
Text Notes 13400 4000 0    50   ~ 0
C22
Text Notes 13400 3900 0    50   ~ 0
C21
Text Notes 13400 3800 0    50   ~ 0
C20
Text Notes 13400 3700 0    50   ~ 0
C19
Text Notes 13400 3600 0    50   ~ 0
C18
Text Notes 13400 3500 0    50   ~ 0
C17
Text Notes 13400 3400 0    50   ~ 0
C16
Text Notes 13400 3300 0    50   ~ 0
C15
Text Notes 13400 3200 0    50   ~ 0
C14
Text Notes 13400 3100 0    50   ~ 0
C13
Text Notes 13400 3000 0    50   ~ 0
C12
Text Notes 13400 2900 0    50   ~ 0
C11
Text Notes 13400 2800 0    50   ~ 0
C10
Text Notes 13400 2700 0    50   ~ 0
C9
Text Notes 13400 2600 0    50   ~ 0
C8
Text Notes 13400 2500 0    50   ~ 0
C7
Text Notes 13400 2400 0    50   ~ 0
C6
Text Notes 13400 2300 0    50   ~ 0
C5
Text Notes 13400 2200 0    50   ~ 0
C4
Text Notes 13400 2100 0    50   ~ 0
C3
Text Notes 13400 2000 0    50   ~ 0
C2
Text Notes 13400 1900 0    50   ~ 0
C1
Text Notes 12200 5000 0    50   ~ 0
B32
Text Notes 12200 4900 0    50   ~ 0
B31
Text Notes 12200 4800 0    50   ~ 0
B30
Text Notes 12200 4700 0    50   ~ 0
B29
Text Notes 12200 4600 0    50   ~ 0
B28
Text Notes 12200 4500 0    50   ~ 0
B27
Text Notes 12200 4400 0    50   ~ 0
B26
Text Notes 12200 4300 0    50   ~ 0
B25
Text Notes 12200 4200 0    50   ~ 0
B24
Text Notes 12200 4100 0    50   ~ 0
B23
Text Notes 12200 4000 0    50   ~ 0
B22
Text Notes 12200 3900 0    50   ~ 0
B21
Text Notes 12200 3800 0    50   ~ 0
B20
Text Notes 12200 3700 0    50   ~ 0
B19
Text Notes 12200 3600 0    50   ~ 0
B18
Text Notes 12200 3500 0    50   ~ 0
B17
Text Notes 12200 3400 0    50   ~ 0
B16
Text Notes 12200 3300 0    50   ~ 0
B15
Text Notes 12200 3200 0    50   ~ 0
B14
Text Notes 12200 3100 0    50   ~ 0
B13
Text Notes 12200 3000 0    50   ~ 0
B12
Text Notes 12200 2900 0    50   ~ 0
B11
Text Notes 12200 2800 0    50   ~ 0
B10
Text Notes 12200 2700 0    50   ~ 0
B9
Text Notes 12200 2600 0    50   ~ 0
B8
Text Notes 12200 2500 0    50   ~ 0
B7
Text Notes 12200 2400 0    50   ~ 0
B6
Text Notes 12200 2300 0    50   ~ 0
B5
Text Notes 12200 2200 0    50   ~ 0
B4
Text Notes 12200 2100 0    50   ~ 0
B3
Text Notes 12200 2000 0    50   ~ 0
B2
Text Notes 12200 1900 0    50   ~ 0
B1
Text Notes 11250 1800 0    50   ~ 0
P1
Text Notes 11750 1800 0    50   ~ 0
P2
Text Notes 12450 1800 0    50   ~ 0
P1
Text Notes 12950 1800 0    50   ~ 0
P2
Text Notes 13700 1800 0    50   ~ 0
P1
Text Notes 14200 1800 0    50   ~ 0
P2
Text Notes 11250 1900 0    50   ~ 0
+5V
Text Notes 12450 1900 0    50   ~ 0
+5V
Text Notes 11750 1900 0    50   ~ 0
+5V
Text Notes 12950 1900 0    50   ~ 0
+5V
Text Notes 13700 1900 0    50   ~ 0
+5V
Text Notes 14200 1900 0    50   ~ 0
+5V
Text Notes 11750 2000 0    50   ~ 0
+5V
Text Notes 12950 2000 0    50   ~ 0
+5V
Text Notes 14200 2000 0    50   ~ 0
+5V
Text Notes 11250 2000 0    50   ~ 0
CLK1
Text Notes 12450 2100 0    50   ~ 0
CLK2
Text Notes 12450 2000 0    50   ~ 0
CLK3
Text Notes 11250 2100 0    50   ~ 0
Unbussed
Text Notes 11250 2200 0    50   ~ 0
Unbussed
Text Notes 11250 2300 0    50   ~ 0
Unbussed
Text Notes 11250 2400 0    50   ~ 0
Unbussed
Text Notes 11250 2500 0    50   ~ 0
Unbussed
Text Notes 11250 2600 0    50   ~ 0
Unbussed
Text Notes 11250 2700 0    50   ~ 0
Unbussed
Text Notes 11250 2800 0    50   ~ 0
Unbussed
Text Notes 11250 2900 0    50   ~ 0
Unbussed
Text Notes 11250 3000 0    50   ~ 0
Unbussed
Text Notes 11250 3100 0    50   ~ 0
Unbussed
Text Notes 11250 3200 0    50   ~ 0
Unbussed
Text Notes 11250 3300 0    50   ~ 0
Unbussed
Text Notes 11250 3400 0    50   ~ 0
Unbussed
Text Notes 11250 3500 0    50   ~ 0
Unbussed
Text Notes 11250 3600 0    50   ~ 0
Unbussed
Text Notes 11250 3700 0    50   ~ 0
Unbussed
Text Notes 11250 3800 0    50   ~ 0
Unbussed
Text Notes 11250 3900 0    50   ~ 0
Unbussed
Text Notes 11250 4000 0    50   ~ 0
Unbussed
Text Notes 11250 4100 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4200 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4300 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4400 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4500 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4600 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4700 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4800 0    50   ~ 0
Bus (FPD)
Text Notes 11250 4900 0    50   ~ 0
GND
Text Notes 11250 5000 0    50   ~ 0
GND
Text Notes 12450 2200 0    50   ~ 0
GND
Text Notes 12450 2300 0    50   ~ 0
GND
Text Notes 12450 4100 0    50   ~ 0
Unbussed
Text Notes 12450 4200 0    50   ~ 0
Unbussed
Text Notes 12450 4300 0    50   ~ 0
Unbussed
Text Notes 12450 4400 0    50   ~ 0
Unbussed
Text Notes 12450 4500 0    50   ~ 0
Unbussed
Text Notes 12450 4600 0    50   ~ 0
Unbussed
Text Notes 12450 4700 0    50   ~ 0
Unbussed
Text Notes 12450 4800 0    50   ~ 0
Unbussed
Text Notes 12450 4900 0    50   ~ 0
GND
Text Notes 12450 5000 0    50   ~ 0
GND
Text Notes 13700 4900 0    50   ~ 0
GND
Text Notes 13700 5000 0    50   ~ 0
GND
Text Notes 12450 2400 0    50   ~ 0
Bus (µCV)
Text Notes 12450 2500 0    50   ~ 0
Bus (µCV)
Text Notes 12450 2600 0    50   ~ 0
Bus (µCV)
Text Notes 12450 2700 0    50   ~ 0
Bus (µCV)
Text Notes 12450 2800 0    50   ~ 0
Bus (µCV)
Text Notes 12450 2900 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3000 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3100 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3200 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3300 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3400 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3500 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3600 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3700 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3800 0    50   ~ 0
Bus (µCV)
Text Notes 12450 3900 0    50   ~ 0
Bus (µCV)
Text Notes 12450 4000 0    50   ~ 0
Bus (µCV)
Text Notes 13700 2300 0    50   ~ 0
16 MHz
Text Notes 13700 2000 0    50   ~ 0
CLK4
Text Notes 13700 2100 0    50   ~ 0
T34
Text Notes 13700 2200 0    50   ~ 0
Bus (µCV)
Text Notes 13700 2400 0    50   ~ 0
Bus (µCV)
Text Notes 13700 2500 0    50   ~ 0
Fx
Text Notes 13700 2600 0    50   ~ 0
Fx
Text Notes 13700 2700 0    50   ~ 0
Fx
Text Notes 13700 2800 0    50   ~ 0
Fx
Text Notes 13700 3000 0    50   ~ 0
Unbussed
Text Notes 13700 2900 0    50   ~ 0
Fx
Text Notes 13700 3100 0    50   ~ 0
Bussed
Text Notes 13700 3200 0    50   ~ 0
Bussed
Text Notes 13700 3300 0    50   ~ 0
IBus
Text Notes 13700 3400 0    50   ~ 0
IBus
Text Notes 13700 3500 0    50   ~ 0
IBus
Text Notes 13700 3600 0    50   ~ 0
IBus
Text Notes 13700 3700 0    50   ~ 0
IBus
Text Notes 13700 3800 0    50   ~ 0
IBus
Text Notes 13700 3900 0    50   ~ 0
IBus
Text Notes 13700 4000 0    50   ~ 0
IBus
Text Notes 13700 4100 0    50   ~ 0
IBus
Text Notes 13700 4200 0    50   ~ 0
IBus
Text Notes 13700 4300 0    50   ~ 0
IBus
Text Notes 13700 4400 0    50   ~ 0
IBus
Text Notes 13700 4500 0    50   ~ 0
IBus
Text Notes 13700 4600 0    50   ~ 0
IBus
Text Notes 13700 4700 0    50   ~ 0
IBus
Text Notes 13700 4800 0    50   ~ 0
IBus
Text Notes 11750 4900 0    50   ~ 0
GND
Text Notes 11750 5000 0    50   ~ 0
GND
Text Notes 12950 4900 0    50   ~ 0
GND
Text Notes 12950 5000 0    50   ~ 0
GND
Text Notes 14100 4900 0    50   ~ 0
GND
Text Notes 14100 5000 0    50   ~ 0
GND
Text Notes 11750 2100 0    50   ~ 0
~RESET
Text Notes 11750 2200 0    50   ~ 0
T34
Text Notes 11750 2400 0    50   ~ 0
~WS
Text Notes 11750 2600 0    50   ~ 0
IODEVxx
Text Notes 11750 2700 0    50   ~ 0
IODEVxx
Text Notes 11750 3000 0    50   ~ 0
IODEVxx
Text Notes 11750 3100 0    50   ~ 0
IODEVxx
Text Notes 11750 3200 0    50   ~ 0
~WAITING
Text Notes 11750 3300 0    50   ~ 0
DB
Text Notes 11750 3400 0    50   ~ 0
DB
Text Notes 11750 3500 0    50   ~ 0
DB
Text Notes 11750 3600 0    50   ~ 0
DB
Text Notes 11750 3700 0    50   ~ 0
DB
Text Notes 11750 3800 0    50   ~ 0
DB
Text Notes 11750 3900 0    50   ~ 0
DB
Text Notes 11750 4000 0    50   ~ 0
DB
Text Notes 11750 4100 0    50   ~ 0
DB
Text Notes 11750 4200 0    50   ~ 0
DB
Text Notes 11750 4300 0    50   ~ 0
DB
Text Notes 11750 4400 0    50   ~ 0
DB
Text Notes 11750 4500 0    50   ~ 0
DB
Text Notes 11750 4600 0    50   ~ 0
DB
Text Notes 11750 4700 0    50   ~ 0
DB
Text Notes 11750 4800 0    50   ~ 0
DB
Text Notes 12950 2100 0    50   ~ 0
~HALT
Text Notes 12950 2200 0    50   ~ 0
~IRQ
Text Notes 12950 2800 0    50   ~ 0
~MEM
Text Notes 12950 2900 0    50   ~ 0
~IO
Text Notes 12950 3200 0    50   ~ 0
~IRQS
Text Notes 12950 4100 0    50   ~ 0
AB High
Text Notes 12950 4200 0    50   ~ 0
AB High
Text Notes 12950 4300 0    50   ~ 0
AB High
Text Notes 12950 4400 0    50   ~ 0
AB High
Text Notes 12950 4500 0    50   ~ 0
AB High
Text Notes 12950 4600 0    50   ~ 0
AB High
Text Notes 12950 4700 0    50   ~ 0
AB High
Text Notes 12950 4800 0    50   ~ 0
AB High
$EndSCHEMATC
