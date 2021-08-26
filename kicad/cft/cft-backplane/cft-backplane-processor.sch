EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 13
Title "Processor Backplane"
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
Text Notes 13700 5000 0    50   ~ 0
C32
Text Notes 13700 4900 0    50   ~ 0
C31
Text Notes 13700 4800 0    50   ~ 0
C30
Text Notes 13700 4700 0    50   ~ 0
C29
Text Notes 13700 4600 0    50   ~ 0
C28
Text Notes 13700 4500 0    50   ~ 0
C27
Text Notes 13700 4400 0    50   ~ 0
C26
Text Notes 13700 4300 0    50   ~ 0
C25
Text Notes 13700 4200 0    50   ~ 0
C24
Text Notes 13700 4100 0    50   ~ 0
C23
Text Notes 13700 4000 0    50   ~ 0
C22
Text Notes 13700 3900 0    50   ~ 0
C21
Text Notes 13700 3800 0    50   ~ 0
C20
Text Notes 13700 3700 0    50   ~ 0
C19
Text Notes 13700 3600 0    50   ~ 0
C18
Text Notes 13700 3500 0    50   ~ 0
C17
Text Notes 13700 3400 0    50   ~ 0
C16
Text Notes 13700 3300 0    50   ~ 0
C15
Text Notes 13700 3200 0    50   ~ 0
C14
Text Notes 13700 3100 0    50   ~ 0
C13
Text Notes 13700 3000 0    50   ~ 0
C12
Text Notes 13700 2900 0    50   ~ 0
C11
Text Notes 13700 2800 0    50   ~ 0
C10
Text Notes 13700 2700 0    50   ~ 0
C9
Text Notes 13700 2600 0    50   ~ 0
C8
Text Notes 13700 2500 0    50   ~ 0
C7
Text Notes 13700 2400 0    50   ~ 0
C6
Text Notes 13700 2300 0    50   ~ 0
C5
Text Notes 13700 2200 0    50   ~ 0
C4
Text Notes 13700 2100 0    50   ~ 0
C3
Text Notes 13700 2000 0    50   ~ 0
C2
Text Notes 13700 1900 0    50   ~ 0
C1
Text Notes 12350 5000 0    50   ~ 0
B32
Text Notes 12350 4900 0    50   ~ 0
B31
Text Notes 12350 4800 0    50   ~ 0
B30
Text Notes 12350 4700 0    50   ~ 0
B29
Text Notes 12350 4600 0    50   ~ 0
B28
Text Notes 12350 4500 0    50   ~ 0
B27
Text Notes 12350 4400 0    50   ~ 0
B26
Text Notes 12350 4300 0    50   ~ 0
B25
Text Notes 12350 4200 0    50   ~ 0
B24
Text Notes 12350 4100 0    50   ~ 0
B23
Text Notes 12350 4000 0    50   ~ 0
B22
Text Notes 12350 3900 0    50   ~ 0
B21
Text Notes 12350 3800 0    50   ~ 0
B20
Text Notes 12350 3700 0    50   ~ 0
B19
Text Notes 12350 3600 0    50   ~ 0
B18
Text Notes 12350 3500 0    50   ~ 0
B17
Text Notes 12350 3400 0    50   ~ 0
B16
Text Notes 12350 3300 0    50   ~ 0
B15
Text Notes 12350 3200 0    50   ~ 0
B14
Text Notes 12350 3100 0    50   ~ 0
B13
Text Notes 12350 3000 0    50   ~ 0
B12
Text Notes 12350 2900 0    50   ~ 0
B11
Text Notes 12350 2800 0    50   ~ 0
B10
Text Notes 12350 2700 0    50   ~ 0
B9
Text Notes 12350 2600 0    50   ~ 0
B8
Text Notes 12350 2500 0    50   ~ 0
B7
Text Notes 12350 2400 0    50   ~ 0
B6
Text Notes 12350 2300 0    50   ~ 0
B5
Text Notes 12350 2200 0    50   ~ 0
B4
Text Notes 12350 2100 0    50   ~ 0
B3
Text Notes 12350 2000 0    50   ~ 0
B2
Text Notes 12350 1900 0    50   ~ 0
B1
Text Notes 11250 1800 0    50   ~ 0
P1
Text Notes 11750 1800 0    50   ~ 0
P2
Text Notes 12600 1800 0    50   ~ 0
P1
Text Notes 13100 1800 0    50   ~ 0
P2
Text Notes 14000 1800 0    50   ~ 0
P1
Text Notes 14500 1800 0    50   ~ 0
P2
Text Notes 11250 1900 0    50   ~ 0
+5V
Text Notes 12600 1900 0    50   ~ 0
+5V
Text Notes 11750 1900 0    50   ~ 0
+5V
Text Notes 13100 1900 0    50   ~ 0
+5V
Text Notes 14000 1900 0    50   ~ 0
+5V
Text Notes 14500 1900 0    50   ~ 0
+5V
Text Notes 11750 2000 0    50   ~ 0
+5V
Text Notes 13100 2000 0    50   ~ 0
+5V
Text Notes 14500 2000 0    50   ~ 0
+5V
Text Notes 11250 2000 0    50   ~ 0
CLK1
Text Notes 12600 2100 0    50   ~ 0
CLK2
Text Notes 12600 2000 0    50   ~ 0
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
Text Notes 11250 4900 0    50   ~ 0
GND
Text Notes 11250 5000 0    50   ~ 0
GND
Text Notes 12600 2200 0    50   ~ 0
GND
Text Notes 12600 2300 0    50   ~ 0
GND
Text Notes 12600 4100 0    50   ~ 0
Unbussed
Text Notes 12600 4200 0    50   ~ 0
Unbussed
Text Notes 12600 4300 0    50   ~ 0
Unbussed
Text Notes 12600 4400 0    50   ~ 0
Unbussed
Text Notes 12600 4500 0    50   ~ 0
Unbussed
Text Notes 12600 4600 0    50   ~ 0
Unbussed
Text Notes 12600 4700 0    50   ~ 0
Unbussed
Text Notes 12600 4800 0    50   ~ 0
Unbussed
Text Notes 12600 4900 0    50   ~ 0
GND
Text Notes 12600 5000 0    50   ~ 0
GND
Text Notes 14000 4900 0    50   ~ 0
GND
Text Notes 14000 5000 0    50   ~ 0
GND
Text Notes 12600 2400 0    50   ~ 0
Bus (µCV)
Text Notes 12600 2500 0    50   ~ 0
Bus (µCV)
Text Notes 12600 2600 0    50   ~ 0
Bus (µCV)
Text Notes 12600 2700 0    50   ~ 0
Bus (µCV)
Text Notes 12600 2800 0    50   ~ 0
Bus (µCV)
Text Notes 12600 2900 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3000 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3100 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3200 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3300 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3400 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3500 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3600 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3700 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3800 0    50   ~ 0
Bus (µCV)
Text Notes 12600 3900 0    50   ~ 0
Bus (µCV)
Text Notes 12600 4000 0    50   ~ 0
Bus (µCV)
Text Notes 14000 2300 0    50   ~ 0
16 MHz
Text Notes 14000 2000 0    50   ~ 0
CLK4
Text Notes 14000 2100 0    50   ~ 0
T34
Text Notes 14000 2200 0    50   ~ 0
Bus (µCV)
Text Notes 14000 2400 0    50   ~ 0
Bus (µCV)
Text Notes 14000 2500 0    50   ~ 0
FV
Text Notes 14000 2600 0    50   ~ 0
FL
Text Notes 14000 2700 0    50   ~ 0
FZ
Text Notes 14000 2800 0    50   ~ 0
FN
Text Notes 14000 3000 0    50   ~ 0
Unbussed
Text Notes 14000 2900 0    50   ~ 0
~WRITEFL
Text Notes 14000 3100 0    50   ~ 0
Bussed
Text Notes 14000 3200 0    50   ~ 0
Bussed
Text Notes 11750 4900 0    50   ~ 0
GND
Text Notes 11750 5000 0    50   ~ 0
GND
Text Notes 13100 4900 0    50   ~ 0
GND
Text Notes 13100 5000 0    50   ~ 0
GND
Text Notes 14500 4900 0    50   ~ 0
GND
Text Notes 14500 5000 0    50   ~ 0
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
Text Notes 13100 2100 0    50   ~ 0
~HALT
Text Notes 13100 2200 0    50   ~ 0
~IRQ
Text Notes 13100 2800 0    50   ~ 0
~MEM
Text Notes 13100 2900 0    50   ~ 0
~IO
Text Notes 13100 3200 0    50   ~ 0
~IRQS
$Comp
L power:GND #PWR0101
U 1 1 60EAC7C6
P 1400 10500
F 0 "#PWR0101" H 1400 10250 50  0001 C CNN
F 1 "GND" H 1405 10327 50  0000 C CNN
F 2 "" H 1400 10500 50  0001 C CNN
F 3 "" H 1400 10500 50  0001 C CNN
	1    1400 10500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 10500 1400 10450
Wire Wire Line
	1200 9950 1400 9950
Connection ~ 1400 10050
Wire Wire Line
	1400 10050 1400 9950
Wire Wire Line
	1200 10050 1400 10050
Connection ~ 1400 10150
Wire Wire Line
	1400 10150 1400 10050
Wire Wire Line
	1200 10150 1400 10150
Connection ~ 1400 10250
Wire Wire Line
	1400 10250 1400 10150
Wire Wire Line
	1200 10250 1400 10250
Connection ~ 1400 10350
Wire Wire Line
	1400 10350 1400 10250
Wire Wire Line
	1200 10350 1400 10350
Connection ~ 1400 10450
Wire Wire Line
	1400 10450 1400 10350
Wire Wire Line
	1200 10450 1400 10450
Text Label 1200 9950 0    50   ~ 0
A31
Text Label 1200 10050 0    50   ~ 0
A32
Text Label 1200 10150 0    50   ~ 0
B31
Text Label 1200 10250 0    50   ~ 0
B32
Text Label 1200 10350 0    50   ~ 0
C31
Text Label 1200 10450 0    50   ~ 0
C32
$Comp
L power:+5V #PWR0102
U 1 1 60F81028
P 900 9850
F 0 "#PWR0102" H 900 9700 50  0001 C CNN
F 1 "+5V" H 915 10023 50  0000 C CNN
F 2 "" H 900 9850 50  0001 C CNN
F 3 "" H 900 9850 50  0001 C CNN
	1    900  9850
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  9850 900  10050
Wire Wire Line
	900  10450 1100 10450
Wire Wire Line
	1100 10050 900  10050
Connection ~ 900  10050
Wire Wire Line
	900  10050 900  10250
Wire Wire Line
	1100 10250 900  10250
Connection ~ 900  10250
Wire Wire Line
	900  10250 900  10450
Text Label 1100 10050 2    50   ~ 0
A1
Text Label 1100 10250 2    50   ~ 0
B1
Text Label 1100 10450 2    50   ~ 0
C1
Text Notes 14500 3100 0    50   ~ 10
~W
Text Notes 14500 3200 0    50   ~ 0
Bussed
Text Notes 14500 4100 0    50   ~ 0
~IRQ0
Text Notes 14500 4200 0    50   ~ 0
~IRQ1
Text Notes 14500 4300 0    50   ~ 0
~IRQ2
Text Notes 14500 4400 0    50   ~ 0
~IRQ3
Text Notes 14500 4500 0    50   ~ 0
~IRQ4
Text Notes 14500 4600 0    50   ~ 0
~IRQ5
Text Notes 14500 4700 0    50   ~ 0
~IRQ6
Text Notes 14500 4800 0    50   ~ 0
~IRQ7
$Comp
L Device:R_Small R1
U 1 1 610BC2DF
P 14550 5850
F 0 "R1" V 14354 5850 50  0000 C CNN
F 1 "1kΩ" V 14445 5850 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14550 5850 50  0001 C CNN
F 3 "~" H 14550 5850 50  0001 C CNN
	1    14550 5850
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D1
U 1 1 610BD748
P 14850 5850
F 0 "D1" H 14843 5595 50  0000 C CNN
F 1 "LED_ALT" H 14843 5686 50  0000 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14850 5850 50  0001 C CNN
F 3 "~" H 14850 5850 50  0001 C CNN
	1    14850 5850
	-1   0    0    1   
$EndComp
Wire Wire Line
	14650 5850 14700 5850
Wire Wire Line
	15000 5850 15050 5850
Wire Wire Line
	15050 5850 15050 5900
$Comp
L power:GND #PWR034
U 1 1 610EE7A0
P 15050 5900
F 0 "#PWR034" H 15050 5650 50  0001 C CNN
F 1 "GND" H 15055 5727 50  0000 C CNN
F 2 "" H 15050 5900 50  0001 C CNN
F 3 "" H 15050 5900 50  0001 C CNN
	1    15050 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	14450 5850 14350 5850
$Comp
L power:+5V #PWR033
U 1 1 611BACB9
P 14350 5800
F 0 "#PWR033" H 14350 5650 50  0001 C CNN
F 1 "+5V" H 14365 5973 50  0000 C CNN
F 2 "" H 14350 5800 50  0001 C CNN
F 3 "" H 14350 5800 50  0001 C CNN
	1    14350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 5800 14350 5850
$Comp
L power:GND #PWR030
U 1 1 60EAACFE
P 13750 6700
F 0 "#PWR030" H 13750 6450 50  0001 C CNN
F 1 "GND" H 13755 6527 50  0000 C CNN
F 2 "" H 13750 6700 50  0001 C CNN
F 3 "" H 13750 6700 50  0001 C CNN
	1    13750 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13900 6500 13750 6500
Connection ~ 13750 6500
Wire Wire Line
	13750 6400 13750 6500
Wire Wire Line
	13900 6400 13750 6400
Wire Wire Line
	13750 5900 13750 5850
Wire Wire Line
	13900 5900 13750 5900
$Comp
L power:+5V #PWR029
U 1 1 60E6696D
P 13750 5850
F 0 "#PWR029" H 13750 5700 50  0001 C CNN
F 1 "+5V" H 13765 6023 50  0000 C CNN
F 2 "" H 13750 5850 50  0001 C CNN
F 3 "" H 13750 5850 50  0001 C CNN
	1    13750 5850
	1    0    0    -1  
$EndComp
Connection ~ 13750 5900
Wire Wire Line
	13750 6000 13750 5900
Wire Wire Line
	13900 6000 13750 6000
Wire Wire Line
	13900 6100 13750 6100
Wire Wire Line
	13750 6100 13750 6000
Connection ~ 13750 6000
Wire Wire Line
	13900 6300 13750 6300
Wire Wire Line
	13750 6300 13750 6400
Connection ~ 13750 6400
Wire Wire Line
	13400 6200 13900 6200
Text Label 13400 6200 0    50   ~ 0
SPARE
$Comp
L Device:CP_Small C10
U 1 1 60F60F37
P 13400 6500
AR Path="/60F60F37" Ref="C10"  Part="1" 
AR Path="/5D34E810/60F60F37" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/60F60F37" Ref="C?"  Part="1" 
F 0 "C10" H 13312 6546 50  0000 R CNN
F 1 "47µF" H 13312 6455 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 13400 6500 50  0001 C CNN
F 3 "~" H 13400 6500 50  0001 C CNN
	1    13400 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13400 6200 13400 6400
Wire Wire Line
	13750 6500 13750 6700
Wire Wire Line
	13400 6600 13400 6700
$Comp
L power:GND #PWR?
U 1 1 60F60F30
P 13400 6700
AR Path="/5F67D4B5/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/60F60F30" Ref="#PWR0103"  Part="1" 
AR Path="/5D34E810/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/60F60F30" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 13400 6450 50  0001 C CNN
F 1 "GND" H 13405 6527 50  0000 C CNN
F 2 "" H 13400 6700 50  0001 C CNN
F 3 "" H 13400 6700 50  0001 C CNN
	1    13400 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13400 6200 13100 6200
Connection ~ 13400 6200
$Comp
L Connector:TestPoint TP1
U 1 1 610FE30F
P 13100 6200
F 0 "TP1" V 13295 6272 50  0000 C CNN
F 1 "TestPoint" V 13204 6272 50  0000 C CNN
F 2 "TestPoint:TestPoint_Loop_D2.50mm_Drill1.85mm" H 13300 6200 50  0001 C CNN
F 3 "~" H 13300 6200 50  0001 C CNN
	1    13100 6200
	0    -1   -1   0   
$EndComp
Text Notes 17900 1700 0    100  ~ 20
Processor Bus: Bus Hold
Text Notes 11000 3400 0    50   ~ 0
A16
Text Notes 11000 3300 0    50   ~ 0
A15
Text Notes 10850 3300 0    50   ~ 0
BH
Text Notes 10850 3400 0    50   ~ 0
BH
Text Notes 10850 3500 0    50   ~ 0
BH
Text Notes 10850 3600 0    50   ~ 0
BH
Text Notes 10850 3700 0    50   ~ 0
BH
Text Notes 10850 3800 0    50   ~ 0
BH
Text Notes 10850 3900 0    50   ~ 0
BH
Text Notes 10850 4000 0    50   ~ 0
BH
Text Notes 10850 4100 0    50   ~ 0
BH
Text Notes 10850 4200 0    50   ~ 0
BH
Text Notes 10850 4300 0    50   ~ 0
BH
Text Notes 10850 4400 0    50   ~ 0
BH
Text Notes 10850 4500 0    50   ~ 0
BH
Text Notes 10850 4600 0    50   ~ 0
BH
Text Notes 10850 4700 0    50   ~ 0
BH
Text Notes 10850 4800 0    50   ~ 0
BH
Text Notes 12200 2400 0    50   ~ 0
BH
Text Notes 12200 2500 0    50   ~ 0
BH
Text Notes 12200 2600 0    50   ~ 0
BH
Text Notes 12200 2700 0    50   ~ 0
BH
Text Notes 12200 2800 0    50   ~ 0
BH
Text Notes 12200 2900 0    50   ~ 0
BH
Text Notes 12200 3000 0    50   ~ 0
BH
Text Notes 12200 3100 0    50   ~ 0
BH
Text Notes 12200 3200 0    50   ~ 0
BH
Text Notes 12200 3300 0    50   ~ 0
BH
Text Notes 12200 3400 0    50   ~ 0
BH
Text Notes 12200 3500 0    50   ~ 0
BH
Text Notes 12200 3600 0    50   ~ 0
BH
Text Notes 12200 3700 0    50   ~ 0
BH
Text Notes 12200 3800 0    50   ~ 0
BH
Text Notes 12200 3900 0    50   ~ 0
BH
Text Notes 12200 4000 0    50   ~ 0
BH
Text Notes 12200 4100 0    50   ~ 0
BH
Text Notes 12200 4200 0    50   ~ 0
BH
Text Notes 12200 4300 0    50   ~ 0
BH
Text Notes 12200 4400 0    50   ~ 0
BH
Text Notes 12200 4500 0    50   ~ 0
BH
Text Notes 12200 4600 0    50   ~ 0
BH
Text Notes 12200 4700 0    50   ~ 0
BH
Text Notes 12200 4800 0    50   ~ 0
BH
Text Notes 13550 3300 0    50   ~ 0
BH
Text Notes 13550 3400 0    50   ~ 0
BH
Text Notes 13550 3500 0    50   ~ 0
BH
Text Notes 13550 3600 0    50   ~ 0
BH
Text Notes 13550 3700 0    50   ~ 0
BH
Text Notes 13550 3800 0    50   ~ 0
BH
Text Notes 13550 3900 0    50   ~ 0
BH
Text Notes 13550 4000 0    50   ~ 0
BH
Text Notes 13550 4100 0    50   ~ 0
BH
Text Notes 13550 4200 0    50   ~ 0
BH
Text Notes 13550 4300 0    50   ~ 0
BH
Text Notes 13550 4400 0    50   ~ 0
BH
Text Notes 13550 4500 0    50   ~ 0
BH
Text Notes 13550 4600 0    50   ~ 0
BH
Text Notes 13550 4700 0    50   ~ 0
BH
Text Notes 13550 4800 0    50   ~ 0
BH
Text Notes 13550 2500 0    50   ~ 0
BH
Text Notes 13550 2600 0    50   ~ 0
BH
Text Notes 13550 2700 0    50   ~ 0
BH
Text Notes 13550 2800 0    50   ~ 0
BH
Text Notes 13550 2900 0    50   ~ 0
BH
Text Notes 13550 3000 0    50   ~ 0
BH
Text Notes 13550 3100 0    50   ~ 0
BH
Text Notes 13550 3200 0    50   ~ 0
BH
Text Notes 14500 3000 0    50   ~ 10
~R
Text Notes 14500 3300 0    50   ~ 10
AB8
Text Notes 14500 3400 0    50   ~ 10
AB9
Text Notes 14500 3500 0    50   ~ 10
AB10
Text Notes 14500 3600 0    50   ~ 10
AB11
Text Notes 14500 3700 0    50   ~ 10
AB12
Text Notes 14500 3800 0    50   ~ 10
AB13
Text Notes 14500 3900 0    50   ~ 10
AB14
Text Notes 14500 4000 0    50   ~ 10
AB15
Text Notes 11250 4100 0    50   ~ 10
FPD0
Text Notes 11250 4200 0    50   ~ 10
FPD1
Text Notes 11250 4300 0    50   ~ 10
FPD2
Text Notes 11250 4400 0    50   ~ 10
FPD3
Text Notes 11250 4500 0    50   ~ 10
FPD4
Text Notes 11250 4600 0    50   ~ 10
FPD5
Text Notes 11250 4700 0    50   ~ 10
FPD6
Text Notes 11250 4800 0    50   ~ 10
FPD7
Text Notes 11750 3300 0    50   ~ 10
DB0
Text Notes 11750 3400 0    50   ~ 10
DB1
Text Notes 11750 3500 0    50   ~ 10
DB2
Text Notes 11750 3600 0    50   ~ 10
DB3
Text Notes 11750 3700 0    50   ~ 10
DB4
Text Notes 11750 3800 0    50   ~ 10
DB5
Text Notes 11750 3900 0    50   ~ 10
DB6
Text Notes 11750 4000 0    50   ~ 10
DB7
Text Notes 11750 4100 0    50   ~ 10
DB8
Text Notes 11750 4200 0    50   ~ 10
DB9
Text Notes 11750 4300 0    50   ~ 10
DB10
Text Notes 11750 4400 0    50   ~ 10
DB11
Text Notes 11750 4500 0    50   ~ 10
DB12
Text Notes 11750 4600 0    50   ~ 10
DB13
Text Notes 11750 4700 0    50   ~ 10
DB14
Text Notes 11750 4800 0    50   ~ 10
DB15
Text Notes 13100 4100 0    50   ~ 10
AB16
Text Notes 13100 4200 0    50   ~ 10
AB17
Text Notes 13100 4300 0    50   ~ 10
AB18
Text Notes 13100 4400 0    50   ~ 10
AB19
Text Notes 13100 4500 0    50   ~ 10
AB20
Text Notes 13100 4600 0    50   ~ 10
AB21
Text Notes 13100 4700 0    50   ~ 10
AB22
Text Notes 13100 4800 0    50   ~ 10
AB23
Text Notes 14000 3300 0    50   ~ 10
IBUS0
Text Notes 14000 3400 0    50   ~ 10
IBUS1
Text Notes 14000 3500 0    50   ~ 10
IBUS2
Text Notes 14000 3600 0    50   ~ 10
IBUS3
Text Notes 14000 3700 0    50   ~ 10
IBUS4
Text Notes 14000 3800 0    50   ~ 10
IBUS5
Text Notes 14000 3900 0    50   ~ 10
IBUS6
Text Notes 14000 4000 0    50   ~ 10
IBUS7
Text Notes 14000 4100 0    50   ~ 10
IBUS8
Text Notes 14000 4200 0    50   ~ 10
IBUS9
Text Notes 14000 4300 0    50   ~ 10
IBUS10
Text Notes 14000 4400 0    50   ~ 10
IBUS11
Text Notes 14000 4500 0    50   ~ 10
IBUS12
Text Notes 14000 4600 0    50   ~ 10
IBUS13
Text Notes 14000 4700 0    50   ~ 10
IBUS14
Text Notes 14000 4800 0    50   ~ 10
IBUS15
Text Notes 14500 2200 0    50   ~ 10
AB0
Text Notes 14500 2300 0    50   ~ 10
AB1
Text Notes 14500 2400 0    50   ~ 10
AB2
Text Notes 14500 2500 0    50   ~ 10
AB3
Text Notes 14500 2600 0    50   ~ 10
AB4
Text Notes 14500 2700 0    50   ~ 10
AB5
Text Notes 14500 2800 0    50   ~ 10
AB6
Text Notes 14500 2900 0    50   ~ 10
AB7
$Comp
L alexios:SN74ACT1071 U1
U 1 1 6246D5FB
P 18500 2950
F 0 "U1" H 18393 3717 50  0000 C CNN
F 1 "SN74ACT1071" H 18393 3626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 18200 3300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 18200 3300 50  0001 C CNN
	1    18500 2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U1
U 2 1 62AA17B3
P 19600 3200
F 0 "U1" H 19780 3559 50  0000 L CNN
F 1 "SN74ACT1071" H 19780 3468 50  0000 L CNN
F 2 "alexios:SOIC-14" H 19300 3550 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 19300 3550 50  0001 C CNN
	2    19600 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 2700 19200 2700
Wire Wire Line
	19250 2800 19200 2800
Wire Wire Line
	19250 3000 19200 3000
Wire Wire Line
	19250 3100 19200 3100
$Comp
L Device:C_Small C11
U 1 1 62B21FA7
P 19200 2900
F 0 "C11" H 19291 2946 50  0000 L CNN
F 1 "100nF" H 19291 2855 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19200 2900 50  0001 C CNN
F 3 "~" H 19200 2900 50  0001 C CNN
	1    19200 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	19200 2800 19200 2700
Connection ~ 19200 2800
Connection ~ 19200 2700
Wire Wire Line
	19200 2700 19200 2650
$Comp
L power:+5V #PWR031
U 1 1 62B4D5B4
P 19200 2650
F 0 "#PWR031" H 19200 2500 50  0001 C CNN
F 1 "+5V" H 19215 2823 50  0000 C CNN
F 2 "" H 19200 2650 50  0001 C CNN
F 3 "" H 19200 2650 50  0001 C CNN
	1    19200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	19200 3000 19200 3100
Connection ~ 19200 3000
$Comp
L power:GND #PWR037
U 1 1 62BCE8F4
P 19200 3150
F 0 "#PWR037" H 19200 2900 50  0001 C CNN
F 1 "GND" H 19205 2977 50  0000 C CNN
F 2 "" H 19200 3150 50  0001 C CNN
F 3 "" H 19200 3150 50  0001 C CNN
	1    19200 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	19200 3100 19200 3150
Connection ~ 19200 3100
$Comp
L alexios:SN74ACT1071 U2
U 1 1 62C590E1
P 18550 9850
F 0 "U2" H 18443 10617 50  0000 C CNN
F 1 "SN74ACT1071" H 18443 10526 50  0000 C CNN
F 2 "alexios:SOIC-14" H 18250 10200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 18250 10200 50  0001 C CNN
	1    18550 9850
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U2
U 2 1 62C590F7
P 19650 10100
F 0 "U2" H 19830 10459 50  0000 L CNN
F 1 "SN74ACT1071" H 19830 10368 50  0000 L CNN
F 2 "alexios:SOIC-14" H 19350 10450 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 19350 10450 50  0001 C CNN
	2    19650 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	19300 9600 19250 9600
Wire Wire Line
	19300 9700 19250 9700
Wire Wire Line
	19300 9900 19250 9900
Wire Wire Line
	19300 10000 19250 10000
$Comp
L Device:C_Small C12
U 1 1 62C59101
P 19250 9800
F 0 "C12" H 19341 9846 50  0000 L CNN
F 1 "100nF" H 19341 9755 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19250 9800 50  0001 C CNN
F 3 "~" H 19250 9800 50  0001 C CNN
	1    19250 9800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	19250 9700 19250 9600
Connection ~ 19250 9700
Connection ~ 19250 9600
Wire Wire Line
	19250 9600 19250 9550
$Comp
L power:+5V #PWR0104
U 1 1 62C5910B
P 19250 9550
F 0 "#PWR0104" H 19250 9400 50  0001 C CNN
F 1 "+5V" H 19265 9723 50  0000 C CNN
F 2 "" H 19250 9550 50  0001 C CNN
F 3 "" H 19250 9550 50  0001 C CNN
	1    19250 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 9900 19250 10000
Connection ~ 19250 9900
$Comp
L power:GND #PWR0107
U 1 1 62C59113
P 19250 10050
F 0 "#PWR0107" H 19250 9800 50  0001 C CNN
F 1 "GND" H 19255 9877 50  0000 C CNN
F 2 "" H 19250 10050 50  0001 C CNN
F 3 "" H 19250 10050 50  0001 C CNN
	1    19250 10050
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 10000 19250 10050
Connection ~ 19250 10000
Wire Wire Line
	19300 6900 19250 6900
Wire Wire Line
	19300 7000 19250 7000
Wire Wire Line
	19300 7200 19250 7200
Wire Wire Line
	19300 7300 19250 7300
$Comp
L Device:C_Small C13
U 1 1 630BA1BA
P 19250 7100
F 0 "C13" H 19341 7146 50  0000 L CNN
F 1 "100nF" H 19341 7055 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19250 7100 50  0001 C CNN
F 3 "~" H 19250 7100 50  0001 C CNN
	1    19250 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	19250 7000 19250 6900
Connection ~ 19250 7000
Connection ~ 19250 6900
Wire Wire Line
	19250 6900 19250 6850
$Comp
L power:+5V #PWR0111
U 1 1 630BA1C4
P 19250 6850
F 0 "#PWR0111" H 19250 6700 50  0001 C CNN
F 1 "+5V" H 19265 7023 50  0000 C CNN
F 2 "" H 19250 6850 50  0001 C CNN
F 3 "" H 19250 6850 50  0001 C CNN
	1    19250 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 7200 19250 7300
Connection ~ 19250 7200
$Comp
L power:GND #PWR0119
U 1 1 630BA1CC
P 19250 7350
F 0 "#PWR0119" H 19250 7100 50  0001 C CNN
F 1 "GND" H 19255 7177 50  0000 C CNN
F 2 "" H 19250 7350 50  0001 C CNN
F 3 "" H 19250 7350 50  0001 C CNN
	1    19250 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 7300 19250 7350
Connection ~ 19250 7300
$Comp
L alexios:SN74ACT1071 U3
U 2 1 630BA1B0
P 19650 7400
F 0 "U3" H 19830 7759 50  0000 L CNN
F 1 "SN74ACT1071" H 19830 7668 50  0000 L CNN
F 2 "alexios:SOIC-14" H 19350 7750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 19350 7750 50  0001 C CNN
	2    19650 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U3
U 1 1 630BA1AA
P 18550 7150
F 0 "U3" H 18443 7917 50  0000 C CNN
F 1 "SN74ACT1071" H 18443 7826 50  0000 C CNN
F 2 "alexios:SOIC-14" H 18250 7500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 18250 7500 50  0001 C CNN
	1    18550 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	19300 8250 19250 8250
Wire Wire Line
	19300 8350 19250 8350
Wire Wire Line
	19300 8550 19250 8550
Wire Wire Line
	19300 8650 19250 8650
$Comp
L Device:C_Small C14
U 1 1 63100A54
P 19250 8450
F 0 "C14" H 19341 8496 50  0000 L CNN
F 1 "100nF" H 19341 8405 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19250 8450 50  0001 C CNN
F 3 "~" H 19250 8450 50  0001 C CNN
	1    19250 8450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	19250 8350 19250 8250
Connection ~ 19250 8350
Connection ~ 19250 8250
Wire Wire Line
	19250 8250 19250 8200
$Comp
L power:+5V #PWR0120
U 1 1 63100A5E
P 19250 8200
F 0 "#PWR0120" H 19250 8050 50  0001 C CNN
F 1 "+5V" H 19265 8373 50  0000 C CNN
F 2 "" H 19250 8200 50  0001 C CNN
F 3 "" H 19250 8200 50  0001 C CNN
	1    19250 8200
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 8550 19250 8650
Connection ~ 19250 8550
$Comp
L power:GND #PWR0121
U 1 1 63100A66
P 19250 8700
F 0 "#PWR0121" H 19250 8450 50  0001 C CNN
F 1 "GND" H 19255 8527 50  0000 C CNN
F 2 "" H 19250 8700 50  0001 C CNN
F 3 "" H 19250 8700 50  0001 C CNN
	1    19250 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 8650 19250 8700
Connection ~ 19250 8650
$Comp
L alexios:SN74ACT1071 U4
U 2 1 63100A78
P 19650 8750
F 0 "U4" H 19830 9109 50  0000 L CNN
F 1 "SN74ACT1071" H 19830 9018 50  0000 L CNN
F 2 "alexios:SOIC-14" H 19350 9100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 19350 9100 50  0001 C CNN
	2    19650 8750
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U4
U 1 1 63100A7E
P 18550 8500
F 0 "U4" H 18443 9267 50  0000 C CNN
F 1 "SN74ACT1071" H 18443 9176 50  0000 C CNN
F 2 "alexios:SOIC-14" H 18250 8850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 18250 8850 50  0001 C CNN
	1    18550 8500
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U6
U 1 1 6342861D
P 18550 5750
F 0 "U6" H 18443 6517 50  0000 C CNN
F 1 "SN74ACT1071" H 18443 6426 50  0000 C CNN
F 2 "alexios:SOIC-14" H 18250 6100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 18250 6100 50  0001 C CNN
	1    18550 5750
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U6
U 2 1 63428623
P 19650 6000
F 0 "U6" H 19830 6359 50  0000 L CNN
F 1 "SN74ACT1071" H 19830 6268 50  0000 L CNN
F 2 "alexios:SOIC-14" H 19350 6350 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 19350 6350 50  0001 C CNN
	2    19650 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	19300 5500 19250 5500
Wire Wire Line
	19300 5600 19250 5600
Wire Wire Line
	19300 5800 19250 5800
Wire Wire Line
	19300 5900 19250 5900
$Comp
L Device:C_Small C16
U 1 1 6342862D
P 19250 5700
F 0 "C16" H 19341 5746 50  0000 L CNN
F 1 "100nF" H 19341 5655 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19250 5700 50  0001 C CNN
F 3 "~" H 19250 5700 50  0001 C CNN
	1    19250 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	19250 5600 19250 5500
Connection ~ 19250 5600
Connection ~ 19250 5500
Wire Wire Line
	19250 5500 19250 5450
$Comp
L power:+5V #PWR0122
U 1 1 63428637
P 19250 5450
F 0 "#PWR0122" H 19250 5300 50  0001 C CNN
F 1 "+5V" H 19265 5623 50  0000 C CNN
F 2 "" H 19250 5450 50  0001 C CNN
F 3 "" H 19250 5450 50  0001 C CNN
	1    19250 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 5800 19250 5900
Connection ~ 19250 5800
$Comp
L power:GND #PWR0123
U 1 1 6342863F
P 19250 5950
F 0 "#PWR0123" H 19250 5700 50  0001 C CNN
F 1 "GND" H 19255 5777 50  0000 C CNN
F 2 "" H 19250 5950 50  0001 C CNN
F 3 "" H 19250 5950 50  0001 C CNN
	1    19250 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 5900 19250 5950
Connection ~ 19250 5900
$Sheet
S 1050 4150 800  400 
U 6199DFD2
F0 "sheet6199DFCD" 50
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
S 1050 3550 800  400 
U 619D299D
F0 "sheet619D2998" 50
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
S 1050 2950 800  400 
U 61A07546
F0 "sheet61A07540" 50
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
S 1050 2350 800  400 
U 61A07551
F0 "sheet61A07541" 50
F1 "slot.sch" 50
F2 "A[1..32]" U L 1050 2450 50 
F3 "B[1..32]" U L 1050 2550 50 
F4 "C[1..32]" U L 1050 2650 50 
$EndSheet
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
Wire Wire Line
	25950 -1500 26300 -1500
Wire Wire Line
	25950 -1600 26300 -1600
Wire Wire Line
	25950 -1800 26300 -1800
Wire Wire Line
	25950 -1900 26300 -1900
Wire Wire Line
	25950 -2000 26300 -2000
Wire Wire Line
	25950 -2100 26300 -2100
Wire Wire Line
	25950 -2200 26300 -2200
Wire Wire Line
	26300 -200 25950 -200
Wire Wire Line
	26300 -300 25950 -300
Wire Wire Line
	26300 -400 25950 -400
Wire Wire Line
	26300 -500 25950 -500
Wire Wire Line
	26300 -600 25950 -600
Wire Wire Line
	26300 -700 25950 -700
Wire Wire Line
	26300 -800 25950 -800
Wire Wire Line
	26300 -900 25950 -900
Text Label 26300 -2200 2    50   ~ 0
FPD0
Text Label 26300 -2100 2    50   ~ 0
FPD1
Text Label 26300 -2000 2    50   ~ 0
FPD2
Text Label 26300 -1900 2    50   ~ 0
FPD3
Text Label 26300 -1800 2    50   ~ 0
FPD4
Text Label 26300 -1700 2    50   ~ 0
FPD5
Text Label 26300 -1600 2    50   ~ 0
FPD6
Text Label 26300 -1500 2    50   ~ 0
FPD7
Text Label 26300 -900 2    50   ~ 0
IR0
Text Label 26300 -800 2    50   ~ 0
IR1
Text Label 26300 -700 2    50   ~ 0
IR2
Text Label 26300 -600 2    50   ~ 0
IR3
Text Label 26300 -500 2    50   ~ 0
IR4
Text Label 26300 -400 2    50   ~ 0
IR5
Text Label 26300 -300 2    50   ~ 0
IR6
Text Label 26300 -200 2    50   ~ 0
IR7
Text Label 24250 -300 0    50   ~ 0
~FPRESET
Text Label 24250 -2000 0    50   ~ 0
FPCLK
Text Label 24250 -1900 0    50   ~ 0
~FPCLK~⁄CLK
Text Label 24250 -200 0    50   ~ 0
POWEROK
Text Label 24250 -400 0    50   ~ 0
FPFETCH
Text Label 24250 -1300 0    50   ~ 0
~FPµC2
Text Label 24250 -1400 0    50   ~ 0
~FPµC1
Text Label 24250 -1500 0    50   ~ 0
~FPµC0
Text Label 24250 -1600 0    50   ~ 0
~FPµA0
Text Label 24250 -1700 0    50   ~ 0
~FPIRL
Text Label 24250 -1200 0    50   ~ 0
~FPIRH
Text Label 24250 -1100 0    50   ~ 0
~FPFLAGS
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 857F7616
P 25350 -2300
AR Path="/857F7616" Ref="P1"  Part="2" 
AR Path="/6199673B/857F7616" Ref="P?"  Part="2" 
F 0 "P1" H 25350 -2133 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 25350 -2224 50  0000 C CNN
F 2 "" H 25300 -3200 50  0001 C CNN
F 3 "" H 25300 -3200 50  0001 C CNN
	2    25350 -2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	24250 -1400 24750 -1400
Wire Wire Line
	24250 -1500 24750 -1500
Wire Wire Line
	24250 -1600 24750 -1600
Wire Wire Line
	24250 -1800 24750 -1800
Wire Wire Line
	24250 -1900 24750 -1900
Wire Wire Line
	24250 -2000 24750 -2000
Wire Wire Line
	24250 -700 24750 -700
Wire Wire Line
	24250 -800 24750 -800
Wire Wire Line
	24250 -900 24750 -900
Wire Wire Line
	24250 -1000 24750 -1000
Wire Wire Line
	24250 -1100 24750 -1100
Wire Wire Line
	24250 -1200 24750 -1200
Wire Wire Line
	24250 -1300 24750 -1300
Wire Wire Line
	24750 -600 24250 -600
Wire Wire Line
	24750 -500 24250 -500
Wire Wire Line
	24750 -400 24250 -400
Wire Wire Line
	24750 -300 24250 -300
Wire Wire Line
	24750 -200 24250 -200
Text Label 24250 -1000 0    50   ~ 0
~FPAEXT
Text Label 24250 -900 0    50   ~ 0
~FPPCL
Text Label 24250 -800 0    50   ~ 0
~FPPCH
Text Label 24250 -700 0    50   ~ 0
~FPDRL
Text Label 24250 -600 0    50   ~ 0
~FPDRH
Text Label 24250 -1800 0    50   ~ 0
~FPCTX
Text Label 24250 -500 0    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	25950 -1700 26300 -1700
Wire Wire Line
	24250 -1700 24750 -1700
NoConn ~ 24750 -2200
NoConn ~ 24750 -2100
Text Notes 24950 -2650 0    100  ~ 20
Local Bus
NoConn ~ 26850 -2100
Text Notes 26900 -2650 0    100  ~ 20
Peripheral Bus
Text Notes 20850 -2650 0    100  ~ 20
Processor Bus
Wire Wire Line
	20850 -2000 21200 -2000
Text Label 20850 -2000 0    50   ~ 0
CLK1
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 857F76C7
P 27450 -2300
AR Path="/857F76C7" Ref="P2"  Part="1" 
AR Path="/6199673B/857F76C7" Ref="P?"  Part="1" 
F 0 "P2" H 27450 -2133 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 27450 -2224 50  0000 C CNN
F 2 "" H 27325 -3175 50  0001 C CNN
F 3 "" H 27325 -3175 50  0001 C CNN
	1    27450 -2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	26500 -1700 26850 -1700
$Comp
L power:PWR_FLAG #FLG02
U 1 1 857F76BC
P 22550 700
AR Path="/857F76BC" Ref="#FLG02"  Part="1" 
AR Path="/6199673B/857F76BC" Ref="#FLG?"  Part="1" 
F 0 "#FLG02" H 22550 775 50  0001 C CNN
F 1 "PWR_FLAG" V 22550 828 50  0000 L CNN
F 2 "" H 22550 700 50  0001 C CNN
F 3 "~" H 22550 700 50  0001 C CNN
	1    22550 700 
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 857F76B4
P 21100 -2200
AR Path="/857F76B4" Ref="#FLG01"  Part="1" 
AR Path="/6199673B/857F76B4" Ref="#FLG?"  Part="1" 
F 0 "#FLG01" H 21100 -2125 50  0001 C CNN
F 1 "PWR_FLAG" V 21100 -2073 50  0000 L CNN
F 2 "" H 21100 -2200 50  0001 C CNN
F 3 "~" H 21100 -2200 50  0001 C CNN
	1    21100 -2200
	0    -1   -1   0   
$EndComp
NoConn ~ 26500 1500
NoConn ~ 26500 1400
NoConn ~ 26500 1300
NoConn ~ 26500 1200
NoConn ~ 26500 1100
NoConn ~ 26500 1000
NoConn ~ 26500 900 
NoConn ~ 26500 800 
Text Label 28400 -1800 2    50   ~ 0
T34
Wire Wire Line
	28050 -1800 28400 -1800
NoConn ~ 22400 600 
Text Label 22750 -2200 2    50   ~ 0
16MHz
Wire Wire Line
	22400 -2200 22750 -2200
Wire Wire Line
	22400 400  22750 400 
Wire Wire Line
	22400 300  22750 300 
Wire Wire Line
	22400 200  22750 200 
Wire Wire Line
	22400 100  22750 100 
Wire Wire Line
	22400 -100 22750 -100
Wire Wire Line
	22400 -200 22750 -200
Wire Wire Line
	22400 -300 22750 -300
Wire Wire Line
	22400 -400 22750 -400
Wire Wire Line
	22400 -600 22750 -600
Wire Wire Line
	22400 -700 22750 -700
Wire Wire Line
	22400 -800 22750 -800
Wire Wire Line
	22400 -900 22750 -900
Wire Wire Line
	22400 -1000 22750 -1000
Wire Wire Line
	22400 -1200 22750 -1200
Wire Wire Line
	22400 -1300 22750 -1300
Wire Wire Line
	22400 -1400 22750 -1400
Wire Wire Line
	22400 -1500 22750 -1500
Wire Wire Line
	22400 -1600 22750 -1600
Wire Wire Line
	22400 -1800 22750 -1800
Wire Wire Line
	22400 -1900 22750 -1900
Wire Wire Line
	20850 700  21200 700 
Wire Wire Line
	20850 600  21200 600 
Wire Wire Line
	20850 500  21200 500 
Wire Wire Line
	20850 400  21200 400 
Wire Wire Line
	20850 300  21200 300 
Wire Wire Line
	20850 100  21200 100 
Wire Wire Line
	20850 0    21200 0   
Wire Wire Line
	20850 -100 21200 -100
Wire Wire Line
	20850 -200 21200 -200
Wire Wire Line
	20850 -300 21200 -300
Wire Wire Line
	20850 -400 21200 -400
Wire Wire Line
	20850 -500 21200 -500
Wire Wire Line
	20850 -600 21200 -600
Wire Wire Line
	20850 -700 21200 -700
Wire Wire Line
	20850 -800 21200 -800
Wire Wire Line
	20850 -900 21200 -900
Wire Wire Line
	20850 -1000 21200 -1000
Wire Wire Line
	20850 -1100 21200 -1100
Wire Wire Line
	20850 -1200 21200 -1200
Wire Wire Line
	20850 -1300 21200 -1300
Wire Wire Line
	20850 -1400 21200 -1400
Wire Wire Line
	20850 -1600 21200 -1600
Wire Wire Line
	20850 -1700 21200 -1700
Wire Wire Line
	20850 -1800 21200 -1800
Wire Wire Line
	20850 -1900 21200 -1900
Text Label 22750 -1900 2    50   ~ 0
~ENDEXT
Text Label 22750 -1800 2    50   ~ 0
~SKIPEXT
$Comp
L power:+5V #PWR01
U 1 1 857F7659
P 21150 -2250
AR Path="/857F7659" Ref="#PWR01"  Part="1" 
AR Path="/6199673B/857F7659" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 21150 -2400 50  0001 C CNN
F 1 "+5V" H 21165 -2077 50  0000 C CNN
F 2 "" H 21150 -2250 50  0001 C CNN
F 3 "" H 21150 -2250 50  0001 C CNN
	1    21150 -2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	21100 -2200 21150 -2200
Wire Wire Line
	21200 -2200 21150 -2200
Connection ~ 21150 -2200
Wire Wire Line
	21150 -2200 21150 -2250
Text Label 22750 -1600 2    50   ~ 0
RADDR0
Text Label 22750 -1500 2    50   ~ 0
RADDR1
Text Label 22750 -1400 2    50   ~ 0
RADDR2
Text Label 22750 -1300 2    50   ~ 0
RADDR3
Text Label 22750 -1200 2    50   ~ 0
RADDR4
Text Label 22750 -1000 2    50   ~ 0
WADDR0
Text Label 22750 -900 2    50   ~ 0
WADDR1
Text Label 22750 -800 2    50   ~ 0
WADDR2
Text Label 22750 -700 2    50   ~ 0
WADDR3
Text Label 22750 -600 2    50   ~ 0
WADDR4
Text Label 22750 -400 2    50   ~ 0
ACTION0
Text Label 22750 -300 2    50   ~ 0
ACTION1
Text Label 22750 -200 2    50   ~ 0
ACTION2
Text Label 22750 -100 2    50   ~ 0
ACTION3
Text Label 22750 100  2    50   ~ 0
COND0
Text Label 22750 200  2    50   ~ 0
COND1
Text Label 22750 300  2    50   ~ 0
COND2
Text Label 22750 400  2    50   ~ 0
COND3
$Comp
L power:GND #PWR03
U 1 1 857F763F
P 22500 800
AR Path="/857F763F" Ref="#PWR03"  Part="1" 
AR Path="/6199673B/857F763F" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 22500 550 50  0001 C CNN
F 1 "GND" H 22505 627 50  0000 C CNN
F 2 "" H 22500 800 50  0001 C CNN
F 3 "" H 22500 800 50  0001 C CNN
	1    22500 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	22500 700  22550 700 
Wire Wire Line
	22400 700  22500 700 
Connection ~ 22500 700 
Wire Wire Line
	22500 700  22500 800 
Text Label 20850 -1900 0    50   ~ 0
CLK2
Text Label 20850 -1800 0    50   ~ 0
CLK3
Text Label 20850 -1700 0    50   ~ 0
CLK4
Text Label 20850 -1600 0    50   ~ 0
T34
Text Label 20850 -1400 0    50   ~ 0
IBUS0
Text Label 20850 -1300 0    50   ~ 0
IBUS1
Text Label 20850 -1200 0    50   ~ 0
IBUS2
Text Label 20850 -1100 0    50   ~ 0
IBUS3
Text Label 20850 -1000 0    50   ~ 0
IBUS4
Text Label 20850 -900 0    50   ~ 0
IBUS5
Text Label 20850 -800 0    50   ~ 0
IBUS6
Text Label 20850 -700 0    50   ~ 0
IBUS7
Text Label 20850 -600 0    50   ~ 0
IBUS8
Text Label 20850 -500 0    50   ~ 0
IBUS9
Text Label 20850 -400 0    50   ~ 0
IBUS10
Text Label 20850 -300 0    50   ~ 0
IBUS11
Text Label 20850 -200 0    50   ~ 0
IBUS12
Text Label 20850 -100 0    50   ~ 0
IBUS13
Text Label 20850 0    0    50   ~ 0
IBUS14
Text Label 20850 100  0    50   ~ 0
IBUS15
Text Label 20850 300  0    50   ~ 0
FV
Text Label 20850 400  0    50   ~ 0
FL
Text Label 20850 500  0    50   ~ 0
FZ
Text Label 20850 600  0    50   ~ 0
FN
Text Label 20850 700  0    50   ~ 0
~WRITE-FL
Wire Wire Line
	22400 -2000 22750 -2000
Text Label 22750 -2000 2    50   ~ 0
~END
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 857F761C
P 21800 -2300
AR Path="/857F761C" Ref="P1"  Part="1" 
AR Path="/6199673B/857F761C" Ref="P?"  Part="1" 
F 0 "P1" H 21800 -2133 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 21800 -2224 50  0000 C CNN
F 2 "" H 21750 -3200 50  0001 C CNN
F 3 "" H 21750 -3200 50  0001 C CNN
	1    21800 -2300
	1    0    0    -1  
$EndComp
Text Label 28400 -900 2    50   ~ 0
~IRQS
Text Label 28400 -1000 2    50   ~ 0
~IRQ
Text Label 28400 -1100 2    50   ~ 0
~HALT
Text Label 28400 -1200 2    50   ~ 0
~WAITING
Text Label 28400 -1300 2    50   ~ 0
~WS
Text Label 28400 -1400 2    50   ~ 0
~IODEV3XX
Text Label 28400 -1500 2    50   ~ 0
~IODEV2XX
Text Label 28400 -1600 2    50   ~ 0
~IODEV1XX
Text Label 28400 -1700 2    50   ~ 0
~SYSDEV
Text Label 28400 -1900 2    50   ~ 0
~W
Text Label 28400 -2000 2    50   ~ 0
~R
Text Label 28400 -2100 2    50   ~ 0
~IO
Text Label 28400 -2200 2    50   ~ 0
~MEM
Text Label 26500 1500 0    50   ~ 0
~IRQ7
Text Label 26500 1400 0    50   ~ 0
~IRQ6
Text Label 26500 1300 0    50   ~ 0
~IRQ5
Text Label 26500 1200 0    50   ~ 0
~IRQ4
Text Label 26500 1100 0    50   ~ 0
~IRQ3
Text Label 26500 1000 0    50   ~ 0
~IRQ2
Text Label 26500 900  0    50   ~ 0
~IRQ1
Text Label 26500 800  0    50   ~ 0
~IRQ0
Text Label 26500 600  0    50   ~ 0
AB23
Text Label 26500 500  0    50   ~ 0
AB22
Text Label 26500 400  0    50   ~ 0
AB21
Text Label 26500 300  0    50   ~ 0
AB20
Text Label 26500 200  0    50   ~ 0
AB19
Text Label 26500 100  0    50   ~ 0
AB18
Text Label 26500 0    0    50   ~ 0
AB17
Text Label 26500 -100 0    50   ~ 0
AB16
Text Label 26500 -200 0    50   ~ 0
AB15
Text Label 26500 -300 0    50   ~ 0
AB14
Text Label 26500 -400 0    50   ~ 0
AB13
Text Label 26500 -500 0    50   ~ 0
AB12
Text Label 26500 -600 0    50   ~ 0
AB11
Text Label 26500 -700 0    50   ~ 0
AB10
Text Label 26500 -800 0    50   ~ 0
AB9
Text Label 26500 -900 0    50   ~ 0
AB8
Text Label 26500 -1000 0    50   ~ 0
AB7
Text Label 26500 -1100 0    50   ~ 0
AB6
Text Label 26500 -1200 0    50   ~ 0
AB5
Text Label 26500 -1300 0    50   ~ 0
AB4
Text Label 26500 -1400 0    50   ~ 0
AB3
Text Label 26500 -1500 0    50   ~ 0
AB2
Text Label 26500 -1600 0    50   ~ 0
AB1
Text Label 26500 -1700 0    50   ~ 0
AB0
Text Label 26500 -1900 0    50   ~ 0
~RSTHOLD
Text Label 26500 -2000 0    50   ~ 0
~RESET
Wire Wire Line
	26800 -2200 26800 -2250
Wire Wire Line
	26850 -2200 26800 -2200
$Comp
L power:+5V #PWR02
U 1 1 857F75CB
P 26800 -2250
AR Path="/857F75CB" Ref="#PWR02"  Part="1" 
AR Path="/6199673B/857F75CB" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 26800 -2400 50  0001 C CNN
F 1 "+5V" H 26815 -2077 50  0000 C CNN
F 2 "" H 26800 -2250 50  0001 C CNN
F 3 "" H 26800 -2250 50  0001 C CNN
	1    26800 -2250
	1    0    0    -1  
$EndComp
Text Label 28400 800  2    50   ~ 0
DB15
Text Label 28400 700  2    50   ~ 0
DB14
Text Label 28400 600  2    50   ~ 0
DB13
Text Label 28400 500  2    50   ~ 0
DB12
Text Label 28400 400  2    50   ~ 0
DB11
Text Label 28400 300  2    50   ~ 0
DB10
Text Label 28400 200  2    50   ~ 0
DB9
Text Label 28400 100  2    50   ~ 0
DB8
Text Label 28400 0    2    50   ~ 0
DB7
Text Label 28400 -100 2    50   ~ 0
DB6
Text Label 28400 -200 2    50   ~ 0
DB5
Text Label 28400 -300 2    50   ~ 0
DB4
Text Label 28400 -400 2    50   ~ 0
DB3
Text Label 28400 -500 2    50   ~ 0
DB2
Text Label 28400 -600 2    50   ~ 0
DB1
Text Label 28400 -700 2    50   ~ 0
DB0
Wire Wire Line
	28150 1500 28150 1600
Wire Wire Line
	28050 1500 28150 1500
$Comp
L power:GND #PWR04
U 1 1 857F75B3
P 28150 1600
AR Path="/857F75B3" Ref="#PWR04"  Part="1" 
AR Path="/6199673B/857F75B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 28150 1350 50  0001 C CNN
F 1 "GND" H 28155 1427 50  0000 C CNN
F 2 "" H 28150 1600 50  0001 C CNN
F 3 "" H 28150 1600 50  0001 C CNN
	1    28150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	26500 -2000 26850 -2000
Wire Wire Line
	26500 -1900 26850 -1900
Wire Wire Line
	26500 -1600 26850 -1600
Wire Wire Line
	26500 -1500 26850 -1500
Wire Wire Line
	26500 -1400 26850 -1400
Wire Wire Line
	26500 -1300 26850 -1300
Wire Wire Line
	26500 -1200 26850 -1200
Wire Wire Line
	26500 -1100 26850 -1100
Wire Wire Line
	26500 -1000 26850 -1000
Wire Wire Line
	26500 -900 26850 -900
Wire Wire Line
	26500 -800 26850 -800
Wire Wire Line
	26500 -700 26850 -700
Wire Wire Line
	26500 -600 26850 -600
Wire Wire Line
	26500 -500 26850 -500
Wire Wire Line
	26500 -400 26850 -400
Wire Wire Line
	26500 -300 26850 -300
Wire Wire Line
	26500 -200 26850 -200
Wire Wire Line
	26500 -100 26850 -100
Wire Wire Line
	26500 0    26850 0   
Wire Wire Line
	26500 100  26850 100 
Wire Wire Line
	26500 200  26850 200 
Wire Wire Line
	26500 300  26850 300 
Wire Wire Line
	26500 400  26850 400 
Wire Wire Line
	26500 500  26850 500 
Wire Wire Line
	26500 600  26850 600 
Wire Wire Line
	26500 800  26850 800 
Wire Wire Line
	26500 900  26850 900 
Wire Wire Line
	26500 1000 26850 1000
Wire Wire Line
	26500 1100 26850 1100
Wire Wire Line
	26500 1200 26850 1200
Wire Wire Line
	26500 1300 26850 1300
Wire Wire Line
	26500 1400 26850 1400
Wire Wire Line
	26500 1500 26850 1500
Wire Wire Line
	28050 -2200 28400 -2200
Wire Wire Line
	28050 -2100 28400 -2100
Wire Wire Line
	28050 -2000 28400 -2000
Wire Wire Line
	28050 -1900 28400 -1900
Wire Wire Line
	28050 -1700 28400 -1700
Wire Wire Line
	28050 -1600 28400 -1600
Wire Wire Line
	28050 -1500 28400 -1500
Wire Wire Line
	28050 -1400 28400 -1400
Wire Wire Line
	28050 -1300 28400 -1300
Wire Wire Line
	28050 -1200 28400 -1200
Wire Wire Line
	28050 -1100 28400 -1100
Wire Wire Line
	28050 -1000 28400 -1000
Wire Wire Line
	28050 -900 28400 -900
Wire Wire Line
	28050 -700 28400 -700
Wire Wire Line
	28050 -600 28400 -600
Wire Wire Line
	28050 -500 28400 -500
Wire Wire Line
	28050 -400 28400 -400
Wire Wire Line
	28050 -300 28400 -300
Wire Wire Line
	28050 -200 28400 -200
Wire Wire Line
	28050 -100 28400 -100
Wire Wire Line
	28050 0    28400 0   
Wire Wire Line
	28050 100  28400 100 
Wire Wire Line
	28050 200  28400 200 
Wire Wire Line
	28050 300  28400 300 
Wire Wire Line
	28050 400  28400 400 
Wire Wire Line
	28050 500  28400 500 
Wire Wire Line
	28050 600  28400 600 
Wire Wire Line
	28050 700  28400 700 
Wire Wire Line
	28050 800  28400 800 
Wire Wire Line
	19600 -2000 20150 -2000
Text Label 19600 -2000 0    50   ~ 0
CLK1
Wire Wire Line
	19600 700  20150 700 
Wire Wire Line
	19600 600  20150 600 
Wire Wire Line
	19600 500  20150 500 
Wire Wire Line
	19600 400  20150 400 
Wire Wire Line
	19600 300  20150 300 
Wire Wire Line
	19600 100  20150 100 
Wire Wire Line
	19600 0    20150 0   
Wire Wire Line
	19600 -100 20150 -100
Wire Wire Line
	19600 -200 20150 -200
Wire Wire Line
	19600 -300 20150 -300
Wire Wire Line
	19600 -400 20150 -400
Wire Wire Line
	19600 -500 20150 -500
Wire Wire Line
	19600 -600 20150 -600
Wire Wire Line
	19600 -700 20150 -700
Wire Wire Line
	19600 -800 20150 -800
Wire Wire Line
	19600 -900 20150 -900
Wire Wire Line
	19600 -1000 20150 -1000
Wire Wire Line
	19600 -1100 20150 -1100
Wire Wire Line
	19600 -1200 20150 -1200
Wire Wire Line
	19600 -1300 20150 -1300
Wire Wire Line
	19600 -1400 20150 -1400
Wire Wire Line
	19600 -1600 20150 -1600
Wire Wire Line
	19600 -1700 20150 -1700
Wire Wire Line
	19600 -1800 20150 -1800
Wire Wire Line
	19600 -1900 20150 -1900
Text Label 19600 -1900 0    50   ~ 0
CLK2
Text Label 19600 -1800 0    50   ~ 0
CLK3
Text Label 19600 -1700 0    50   ~ 0
CLK4
Text Label 19600 -1600 0    50   ~ 0
T34
Text Label 19600 -1400 0    50   ~ 0
IBUS0
Text Label 19600 -1300 0    50   ~ 0
IBUS1
Text Label 19600 -1200 0    50   ~ 0
IBUS2
Text Label 19600 -1100 0    50   ~ 0
IBUS3
Text Label 19600 -1000 0    50   ~ 0
IBUS4
Text Label 19600 -900 0    50   ~ 0
IBUS5
Text Label 19600 -800 0    50   ~ 0
IBUS6
Text Label 19600 -700 0    50   ~ 0
IBUS7
Text Label 19600 -600 0    50   ~ 0
IBUS8
Text Label 19600 -500 0    50   ~ 0
IBUS9
Text Label 19600 -400 0    50   ~ 0
IBUS10
Text Label 19600 -300 0    50   ~ 0
IBUS11
Text Label 19600 -200 0    50   ~ 0
IBUS12
Text Label 19600 -100 0    50   ~ 0
IBUS13
Text Label 19600 0    0    50   ~ 0
IBUS14
Text Label 19600 100  0    50   ~ 0
IBUS15
Text Label 19600 300  0    50   ~ 0
FV
Text Label 19600 400  0    50   ~ 0
FL
Text Label 19600 500  0    50   ~ 0
FZ
Text Label 19600 600  0    50   ~ 0
FN
Text Label 19600 700  0    50   ~ 0
~WRITE-FL
Text Label 20150 -2000 2    50   ~ 0
A2
Text Label 20150 -1900 2    50   ~ 0
B3
Text Label 20150 -1800 2    50   ~ 0
B2
Text Label 20150 -1700 2    50   ~ 0
C2
Text Label 20150 -1600 2    50   ~ 0
C3
Text Label 20150 -1400 2    50   ~ 0
C15
Text Label 20150 -1300 2    50   ~ 0
C16
Text Label 20150 -1200 2    50   ~ 0
C17
Text Label 20150 -1100 2    50   ~ 0
C18
Text Label 20150 -1000 2    50   ~ 0
C19
Text Label 20150 -900 2    50   ~ 0
C20
Text Label 20150 -800 2    50   ~ 0
C21
Text Label 20150 -700 2    50   ~ 0
C22
Text Label 20150 -600 2    50   ~ 0
C23
Text Label 20150 -500 2    50   ~ 0
C24
Text Label 20150 -400 2    50   ~ 0
C25
Text Label 20150 -300 2    50   ~ 0
C26
Text Label 20150 -200 2    50   ~ 0
C27
Text Label 20150 -100 2    50   ~ 0
C28
Text Label 20150 0    2    50   ~ 0
C29
Text Label 20150 100  2    50   ~ 0
C30
Text Label 20150 300  2    50   ~ 0
C7
Text Label 20150 400  2    50   ~ 0
C8
Text Label 20150 500  2    50   ~ 0
C9
Text Label 20150 600  2    50   ~ 0
C10
Text Label 20150 700  2    50   ~ 0
C11
Wire Wire Line
	23200 400  23800 400 
Wire Wire Line
	23200 300  23800 300 
Wire Wire Line
	23200 200  23800 200 
Wire Wire Line
	23200 100  23800 100 
Wire Wire Line
	23200 -100 23800 -100
Wire Wire Line
	23200 -200 23800 -200
Wire Wire Line
	23200 -300 23800 -300
Wire Wire Line
	23200 -400 23800 -400
Wire Wire Line
	23200 -600 23800 -600
Wire Wire Line
	23200 -700 23800 -700
Wire Wire Line
	23200 -800 23800 -800
Wire Wire Line
	23200 -900 23800 -900
Wire Wire Line
	23200 -1000 23800 -1000
Wire Wire Line
	23200 -1200 23800 -1200
Wire Wire Line
	23200 -1300 23800 -1300
Wire Wire Line
	23200 -1400 23800 -1400
Wire Wire Line
	23200 -1500 23800 -1500
Wire Wire Line
	23200 -1600 23800 -1600
Wire Wire Line
	23200 -1800 23800 -1800
Wire Wire Line
	23200 -1900 23800 -1900
Text Label 23800 -1900 2    50   ~ 0
~ENDEXT
Text Label 23800 -1800 2    50   ~ 0
~SKIPEXT
Text Label 23800 -1600 2    50   ~ 0
RADDR0
Text Label 23800 -1500 2    50   ~ 0
RADDR1
Text Label 23800 -1400 2    50   ~ 0
RADDR2
Text Label 23800 -1300 2    50   ~ 0
RADDR3
Text Label 23800 -1200 2    50   ~ 0
RADDR4
Text Label 23800 -1000 2    50   ~ 0
WADDR0
Text Label 23800 -900 2    50   ~ 0
WADDR1
Text Label 23800 -800 2    50   ~ 0
WADDR2
Text Label 23800 -700 2    50   ~ 0
WADDR3
Text Label 23800 -600 2    50   ~ 0
WADDR4
Text Label 23800 -400 2    50   ~ 0
ACTION0
Text Label 23800 -300 2    50   ~ 0
ACTION1
Text Label 23800 -200 2    50   ~ 0
ACTION2
Text Label 23800 -100 2    50   ~ 0
ACTION3
Text Label 23800 100  2    50   ~ 0
COND0
Text Label 23800 200  2    50   ~ 0
COND1
Text Label 23800 300  2    50   ~ 0
COND2
Text Label 23800 400  2    50   ~ 0
COND3
Wire Wire Line
	23200 -2000 23800 -2000
Text Label 23800 -2000 2    50   ~ 0
~END
Text Label 23200 -2000 0    50   ~ 0
C13
Text Label 23200 -1900 0    50   ~ 0
C14
Text Label 23200 -1800 0    50   ~ 0
B22
Text Label 23200 -1600 0    50   ~ 0
C4
Text Label 23200 -1500 0    50   ~ 0
C6
Text Label 23200 -1400 0    50   ~ 0
B6
Text Label 23200 -1300 0    50   ~ 0
B7
Text Label 23200 -1200 0    50   ~ 0
B8
Text Label 23200 -1000 0    50   ~ 0
B9
Text Label 23200 -900 0    50   ~ 0
B10
Text Label 23200 -800 0    50   ~ 0
B11
Text Label 23200 -700 0    50   ~ 0
B12
Text Label 23200 -600 0    50   ~ 0
B13
Text Label 23200 -400 0    50   ~ 0
B14
Text Label 23200 -300 0    50   ~ 0
B15
Text Label 23200 -200 0    50   ~ 0
B16
Text Label 23200 -100 0    50   ~ 0
B17
Text Label 23200 100  0    50   ~ 0
B18
Text Label 23200 200  0    50   ~ 0
B19
Text Label 23200 300  0    50   ~ 0
B20
Text Label 23200 400  0    50   ~ 0
B21
Wire Wire Line
	1200 9750 1400 9750
Text Label 1200 9750 0    50   ~ 0
B4
Text Label 1200 9850 0    50   ~ 0
B5
$Comp
L alexios:SN74ACT1071 U7
U 1 1 630E26A9
P 18500 4350
F 0 "U7" H 18393 5117 50  0000 C CNN
F 1 "SN74ACT1071" H 18393 5026 50  0000 C CNN
F 2 "alexios:SOIC-14" H 18200 4700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 18200 4700 50  0001 C CNN
	1    18500 4350
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U7
U 2 1 630E26AF
P 19600 4600
F 0 "U7" H 19780 4959 50  0000 L CNN
F 1 "SN74ACT1071" H 19780 4868 50  0000 L CNN
F 2 "alexios:SOIC-14" H 19300 4950 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 19300 4950 50  0001 C CNN
	2    19600 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	19250 4100 19200 4100
Wire Wire Line
	19250 4200 19200 4200
Wire Wire Line
	19250 4400 19200 4400
Wire Wire Line
	19250 4500 19200 4500
$Comp
L Device:C_Small C17
U 1 1 630E26B9
P 19200 4300
F 0 "C17" H 19291 4346 50  0000 L CNN
F 1 "100nF" H 19291 4255 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 19200 4300 50  0001 C CNN
F 3 "~" H 19200 4300 50  0001 C CNN
	1    19200 4300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	19200 4200 19200 4100
Connection ~ 19200 4200
Connection ~ 19200 4100
Wire Wire Line
	19200 4100 19200 4050
$Comp
L power:+5V #PWR05
U 1 1 630E26C3
P 19200 4050
F 0 "#PWR05" H 19200 3900 50  0001 C CNN
F 1 "+5V" H 19215 4223 50  0000 C CNN
F 2 "" H 19200 4050 50  0001 C CNN
F 3 "" H 19200 4050 50  0001 C CNN
	1    19200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	19200 4400 19200 4500
Connection ~ 19200 4400
$Comp
L power:GND #PWR06
U 1 1 630E26CB
P 19200 4550
F 0 "#PWR06" H 19200 4300 50  0001 C CNN
F 1 "GND" H 19205 4377 50  0000 C CNN
F 2 "" H 19200 4550 50  0001 C CNN
F 3 "" H 19200 4550 50  0001 C CNN
	1    19200 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	19200 4500 19200 4550
Connection ~ 19200 4500
Wire Wire Line
	17400 3950 18000 3950
Wire Wire Line
	17400 3850 18000 3850
Text Label 18000 3850 2    50   ~ 0
RADDR0
Text Label 18000 3950 2    50   ~ 0
RADDR1
Text Label 17400 3850 0    50   ~ 0
C4
Text Label 17400 3950 0    50   ~ 0
C6
Wire Wire Line
	17650 4750 18000 4750
Text Label 17650 4750 0    50   ~ 0
FV
Wire Wire Line
	17650 4350 18000 4350
Wire Wire Line
	17650 4450 18000 4450
Wire Wire Line
	17650 4550 18000 4550
Wire Wire Line
	17650 4650 18000 4650
Text Label 17650 4650 0    50   ~ 0
FL
Text Label 17650 4550 0    50   ~ 0
FZ
Text Label 17650 4450 0    50   ~ 0
FN
Text Label 17650 4350 0    50   ~ 0
~WRITE-FL
Wire Wire Line
	17400 3150 18000 3150
Text Label 17400 3150 0    50   ~ 0
B8
Wire Wire Line
	17400 2550 18000 2550
Text Label 17400 2550 0    50   ~ 0
B10
Text Label 17400 2450 0    50   ~ 0
B9
Wire Wire Line
	17400 2450 18000 2450
Wire Wire Line
	17400 2650 18000 2650
Text Label 17400 2650 0    50   ~ 0
B11
Wire Wire Line
	17400 2750 18000 2750
Text Label 17400 2750 0    50   ~ 0
B12
Text Label 18000 2750 2    50   ~ 0
WADDR3
Text Label 18000 2650 2    50   ~ 0
WADDR2
Text Label 18000 2550 2    50   ~ 0
WADDR1
Text Label 18000 2450 2    50   ~ 0
WADDR0
Text Label 18000 3150 2    50   ~ 0
RADDR4
Text Label 18000 3350 2    50   ~ 0
RADDR2
Text Label 18000 3250 2    50   ~ 0
RADDR3
Text Label 17400 3250 0    50   ~ 0
B7
Wire Wire Line
	17400 3250 18000 3250
Text Label 17400 3350 0    50   ~ 0
B6
Wire Wire Line
	17400 3350 18000 3350
Wire Wire Line
	17400 2850 18000 2850
Text Label 17400 2850 0    50   ~ 0
B13
Text Label 18000 2850 2    50   ~ 0
WADDR4
Text Label 17400 3050 0    50   ~ 0
B14
Text Label 17400 2950 0    50   ~ 0
B15
Text Label 18000 2950 2    50   ~ 0
ACTION1
Text Label 18000 3050 2    50   ~ 0
ACTION0
Wire Wire Line
	17400 3050 18000 3050
Wire Wire Line
	17400 2950 18000 2950
Wire Wire Line
	17450 5250 18050 5250
Text Label 18050 5250 2    50   ~ 0
ACTION3
Text Label 17450 5250 0    50   ~ 0
B17
Wire Wire Line
	17450 5650 18050 5650
Wire Wire Line
	17450 5550 18050 5550
Wire Wire Line
	17450 5450 18050 5450
Text Label 18050 5350 2    50   ~ 0
COND0
Text Label 18050 5450 2    50   ~ 0
COND1
Text Label 18050 5550 2    50   ~ 0
COND2
Text Label 18050 5650 2    50   ~ 0
COND3
Text Label 17450 5450 0    50   ~ 0
B19
Text Label 17450 5550 0    50   ~ 0
B20
Text Label 17450 5650 0    50   ~ 0
B21
Wire Wire Line
	18050 8000 17500 8000
Wire Wire Line
	18050 7250 17500 7250
Wire Wire Line
	18050 7350 17500 7350
Wire Wire Line
	18050 7450 17500 7450
Text Label 18050 6650 2    50   ~ 0
IBUS0
Text Label 18050 6750 2    50   ~ 0
IBUS1
Text Label 18050 7550 2    50   ~ 0
IBUS2
Text Label 18050 7450 2    50   ~ 0
IBUS3
Text Label 18050 7350 2    50   ~ 0
IBUS4
Text Label 18050 7250 2    50   ~ 0
IBUS5
Text Label 18050 8000 2    50   ~ 0
IBUS9
Text Label 17500 7450 0    50   ~ 0
C18
Text Label 17500 7350 0    50   ~ 0
C19
Text Label 17500 7250 0    50   ~ 0
C20
Text Label 17500 8000 0    50   ~ 0
C24
Text Label 17500 6750 0    50   ~ 0
C16
Text Label 17500 6650 0    50   ~ 0
C15
Wire Wire Line
	18050 6650 17500 6650
Wire Wire Line
	18050 6750 17500 6750
Wire Wire Line
	18050 7550 17500 7550
Text Label 17500 7550 0    50   ~ 0
C17
Wire Wire Line
	18050 7050 17500 7050
Wire Wire Line
	18050 6950 17500 6950
Wire Wire Line
	18050 7150 17500 7150
Text Label 18050 7150 2    50   ~ 0
IBUS6
Text Label 18050 6950 2    50   ~ 0
IBUS7
Text Label 18050 7050 2    50   ~ 0
IBUS8
Text Label 17500 7150 0    50   ~ 0
C21
Text Label 17500 6950 0    50   ~ 0
C22
Text Label 17500 7050 0    50   ~ 0
C23
Wire Wire Line
	18050 8500 17500 8500
Wire Wire Line
	18050 8600 17500 8600
Wire Wire Line
	18050 8700 17500 8700
Wire Wire Line
	18050 8800 17500 8800
Wire Wire Line
	18050 8900 17500 8900
Text Label 18050 8900 2    50   ~ 0
IBUS11
Text Label 18050 8800 2    50   ~ 0
IBUS12
Text Label 18050 8700 2    50   ~ 0
IBUS13
Text Label 18050 8600 2    50   ~ 0
IBUS14
Text Label 18050 8500 2    50   ~ 0
IBUS15
Text Label 17500 8900 0    50   ~ 0
C26
Text Label 17500 8800 0    50   ~ 0
C27
Text Label 17500 8700 0    50   ~ 0
C28
Text Label 17500 8600 0    50   ~ 0
C29
Text Label 17500 8500 0    50   ~ 0
C30
Text Label 17500 8100 0    50   ~ 0
C25
Text Label 18050 8100 2    50   ~ 0
IBUS10
Wire Wire Line
	18050 8100 17500 8100
Wire Wire Line
	17550 9750 18050 9750
Wire Wire Line
	17550 9650 18050 9650
Wire Wire Line
	17550 9450 18050 9450
Wire Wire Line
	17550 9350 18050 9350
Wire Wire Line
	17550 10050 18050 10050
Wire Wire Line
	17550 10150 18050 10150
Wire Wire Line
	17550 10250 18050 10250
Text Label 18050 10250 2    50   ~ 0
FPD0
Text Label 18050 10150 2    50   ~ 0
FPD1
Text Label 18050 10050 2    50   ~ 0
FPD2
Text Label 18050 9350 2    50   ~ 0
FPD3
Text Label 18050 9450 2    50   ~ 0
FPD4
Text Label 18050 9550 2    50   ~ 0
FPD5
Text Label 18050 9650 2    50   ~ 0
FPD6
Text Label 18050 9750 2    50   ~ 0
FPD7
Wire Wire Line
	17550 9550 18050 9550
Text Label 17550 10250 0    50   ~ 0
A23
Text Label 17550 10150 0    50   ~ 0
A24
Text Label 17550 10050 0    50   ~ 0
A25
Text Label 17550 9350 0    50   ~ 0
A26
Text Label 17550 9450 0    50   ~ 0
A27
Text Label 17550 9550 0    50   ~ 0
A28
Text Label 17550 9650 0    50   ~ 0
A29
Text Label 17550 9750 0    50   ~ 0
A30
Text Label 17450 5350 0    50   ~ 0
B18
Wire Wire Line
	17450 5350 18050 5350
Text Label 17450 6150 0    50   ~ 0
B16
Text Label 18050 6150 2    50   ~ 0
ACTION2
Wire Wire Line
	17450 6150 18050 6150
Text Notes 14200 6400 0    50   ~ 0
Mates with: TBP02P1-381-07BE
$Comp
L Connector:Screw_Terminal_01x07 J13
U 1 1 616752A2
P 14100 6200
F 0 "J13" H 14180 6242 50  0000 L CNN
F 1 "CUI TBP02R1-381-06BE" H 14180 6151 50  0000 L CNN
F 2 "alexios:CUI-TBP02R1-381-07BE" H 14100 6200 50  0001 C CNN
F 3 "~" H 14100 6200 50  0001 C CNN
	1    14100 6200
	1    0    0    -1  
$EndComp
NoConn ~ 18000 4050
NoConn ~ 18000 4150
NoConn ~ 18000 4250
NoConn ~ 18050 5750
NoConn ~ 18050 5850
NoConn ~ 18050 5950
NoConn ~ 18050 6050
NoConn ~ 18050 6850
NoConn ~ 18050 8200
NoConn ~ 18050 8300
NoConn ~ 18050 8400
NoConn ~ 18050 9850
NoConn ~ 18050 9950
Connection ~ 1400 9950
Wire Wire Line
	1200 9850 1400 9850
Wire Wire Line
	1400 9950 1400 9850
Wire Wire Line
	1400 9850 1400 9750
Connection ~ 1400 9850
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C1F6ED
P 1900 9900
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
F 0 "H25" H 2000 9949 50  0000 L CNN
F 1 "MountingHole_Pad" H 2000 9858 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 1900 9900 50  0001 C CNN
F 3 "~" H 1900 9900 50  0001 C CNN
	1    1900 9900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C1F6F3
P 1900 10000
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
F 0 "#PWR07" H 1900 9750 50  0001 C CNN
F 1 "GND" H 1905 9827 50  0000 C CNN
F 2 "" H 1900 10000 50  0001 C CNN
F 3 "" H 1900 10000 50  0001 C CNN
	1    1900 10000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C1F6F9
P 1900 10400
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
F 0 "H28" H 2000 10449 50  0000 L CNN
F 1 "MountingHole_Pad" H 2000 10358 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 1900 10400 50  0001 C CNN
F 3 "~" H 1900 10400 50  0001 C CNN
	1    1900 10400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C1F6FF
P 1900 10500
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
F 0 "#PWR010" H 1900 10250 50  0001 C CNN
F 1 "GND" H 1905 10327 50  0000 C CNN
F 2 "" H 1900 10500 50  0001 C CNN
F 3 "" H 1900 10500 50  0001 C CNN
	1    1900 10500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C55080
P 2950 9900
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
F 0 "H26" H 3050 9949 50  0000 L CNN
F 1 "MountingHole_Pad" H 3050 9858 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 2950 9900 50  0001 C CNN
F 3 "~" H 2950 9900 50  0001 C CNN
	1    2950 9900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C55086
P 2950 10000
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
F 0 "#PWR08" H 2950 9750 50  0001 C CNN
F 1 "GND" H 2955 9827 50  0000 C CNN
F 2 "" H 2950 10000 50  0001 C CNN
F 3 "" H 2950 10000 50  0001 C CNN
	1    2950 10000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C5508C
P 2950 10400
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
F 0 "H29" H 3050 10449 50  0000 L CNN
F 1 "MountingHole_Pad" H 3050 10358 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 2950 10400 50  0001 C CNN
F 3 "~" H 2950 10400 50  0001 C CNN
	1    2950 10400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C55092
P 2950 10500
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
F 0 "#PWR011" H 2950 10250 50  0001 C CNN
F 1 "GND" H 2955 10327 50  0000 C CNN
F 2 "" H 2950 10500 50  0001 C CNN
F 3 "" H 2950 10500 50  0001 C CNN
	1    2950 10500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C883DF
P 3900 9900
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
F 0 "H27" H 4000 9949 50  0000 L CNN
F 1 "MountingHole_Pad" H 4000 9858 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 3900 9900 50  0001 C CNN
F 3 "~" H 3900 9900 50  0001 C CNN
	1    3900 9900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C883E5
P 3900 10000
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
F 0 "#PWR09" H 3900 9750 50  0001 C CNN
F 1 "GND" H 3905 9827 50  0000 C CNN
F 2 "" H 3900 10000 50  0001 C CNN
F 3 "" H 3900 10000 50  0001 C CNN
	1    3900 10000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 61C883EB
P 3900 10400
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
F 0 "H30" H 4000 10449 50  0000 L CNN
F 1 "MountingHole_Pad" H 4000 10358 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 3900 10400 50  0001 C CNN
F 3 "~" H 3900 10400 50  0001 C CNN
	1    3900 10400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C883F1
P 3900 10500
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
F 0 "#PWR012" H 3900 10250 50  0001 C CNN
F 1 "GND" H 3905 10327 50  0000 C CNN
F 2 "" H 3900 10500 50  0001 C CNN
F 3 "" H 3900 10500 50  0001 C CNN
	1    3900 10500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
