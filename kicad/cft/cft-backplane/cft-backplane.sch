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
Text Label 13400 7500 0    50   ~ 0
POWERON
$Comp
L power:GND #PWR032
U 1 1 60FE112B
P 13750 7700
F 0 "#PWR032" H 13750 7450 50  0001 C CNN
F 1 "GND" H 13755 7527 50  0000 C CNN
F 2 "" H 13750 7700 50  0001 C CNN
F 3 "" H 13750 7700 50  0001 C CNN
	1    13750 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13900 7600 13750 7600
Wire Wire Line
	13750 7600 13750 7700
Wire Wire Line
	13900 7500 13400 7500
$Comp
L Device:R_Small R1
U 1 1 610BC2DF
P 14050 8650
F 0 "R1" V 13854 8650 50  0000 C CNN
F 1 "1kΩ" V 13945 8650 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14050 8650 50  0001 C CNN
F 3 "~" H 14050 8650 50  0001 C CNN
	1    14050 8650
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D1
U 1 1 610BD748
P 14350 8650
F 0 "D1" H 14343 8395 50  0000 C CNN
F 1 "LED_ALT" H 14343 8486 50  0000 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14350 8650 50  0001 C CNN
F 3 "~" H 14350 8650 50  0001 C CNN
	1    14350 8650
	-1   0    0    1   
$EndComp
Wire Wire Line
	14150 8650 14200 8650
Wire Wire Line
	14500 8650 14550 8650
Wire Wire Line
	14550 8650 14550 8700
$Comp
L power:GND #PWR034
U 1 1 610EE7A0
P 14550 8700
F 0 "#PWR034" H 14550 8450 50  0001 C CNN
F 1 "GND" H 14555 8527 50  0000 C CNN
F 2 "" H 14550 8700 50  0001 C CNN
F 3 "" H 14550 8700 50  0001 C CNN
	1    14550 8700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13950 8650 13850 8650
Text Label 13500 9200 0    50   ~ 0
POWEROK
$Comp
L Device:R_Small R2
U 1 1 61121114
P 14050 9200
F 0 "R2" V 13854 9200 50  0000 C CNN
F 1 "1kΩ" V 13945 9200 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14050 9200 50  0001 C CNN
F 3 "~" H 14050 9200 50  0001 C CNN
	1    14050 9200
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D2
U 1 1 6112111A
P 14350 9200
F 0 "D2" H 14343 8945 50  0000 C CNN
F 1 "LED_ALT" H 14343 9036 50  0000 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14350 9200 50  0001 C CNN
F 3 "~" H 14350 9200 50  0001 C CNN
	1    14350 9200
	-1   0    0    1   
$EndComp
Wire Wire Line
	14150 9200 14200 9200
Wire Wire Line
	14500 9200 14550 9200
Wire Wire Line
	14550 9200 14550 9250
$Comp
L power:GND #PWR035
U 1 1 61121123
P 14550 9250
F 0 "#PWR035" H 14550 9000 50  0001 C CNN
F 1 "GND" H 14555 9077 50  0000 C CNN
F 2 "" H 14550 9250 50  0001 C CNN
F 3 "" H 14550 9250 50  0001 C CNN
	1    14550 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	13950 9200 13500 9200
$Comp
L Device:R_Small R3
U 1 1 611A11D4
P 14050 9750
F 0 "R3" V 13854 9750 50  0000 C CNN
F 1 "1kΩ" V 13945 9750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14050 9750 50  0001 C CNN
F 3 "~" H 14050 9750 50  0001 C CNN
	1    14050 9750
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D3
U 1 1 611A11DA
P 14350 9750
F 0 "D3" H 14343 9495 50  0000 C CNN
F 1 "LED_ALT" H 14343 9586 50  0000 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14350 9750 50  0001 C CNN
F 3 "~" H 14350 9750 50  0001 C CNN
	1    14350 9750
	-1   0    0    1   
$EndComp
Wire Wire Line
	14150 9750 14200 9750
Wire Wire Line
	14500 9750 14550 9750
Wire Wire Line
	14550 9750 14550 9800
$Comp
L power:GND #PWR036
U 1 1 611A11E3
P 14550 9800
F 0 "#PWR036" H 14550 9550 50  0001 C CNN
F 1 "GND" H 14555 9627 50  0000 C CNN
F 2 "" H 14550 9800 50  0001 C CNN
F 3 "" H 14550 9800 50  0001 C CNN
	1    14550 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	13950 9750 13500 9750
Text Label 13500 9750 0    50   ~ 0
STANDBY
$Comp
L power:+5V #PWR033
U 1 1 611BACB9
P 13850 8600
F 0 "#PWR033" H 13850 8450 50  0001 C CNN
F 1 "+5V" H 13865 8773 50  0000 C CNN
F 2 "" H 13850 8600 50  0001 C CNN
F 3 "" H 13850 8600 50  0001 C CNN
	1    13850 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13850 8600 13850 8650
$Comp
L Connector_Generic:Conn_01x02 J14
U 1 1 61218E72
P 14100 7500
F 0 "J14" H 14180 7492 50  0000 L CNN
F 1 "Conn_01x02" H 14180 7401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 14100 7500 50  0001 C CNN
F 3 "~" H 14100 7500 50  0001 C CNN
	1    14100 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 60EAACFE
P 13750 7000
F 0 "#PWR030" H 13750 6750 50  0001 C CNN
F 1 "GND" H 13755 6827 50  0000 C CNN
F 2 "" H 13750 7000 50  0001 C CNN
F 3 "" H 13750 7000 50  0001 C CNN
	1    13750 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	13900 6800 13750 6800
Connection ~ 13750 6800
Wire Wire Line
	13750 6700 13750 6800
Wire Wire Line
	13900 6700 13750 6700
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
Text Label 13500 8200 0    50   ~ 0
POWEROK
Wire Wire Line
	13950 8200 13500 8200
Wire Wire Line
	14250 8200 14550 8200
$Comp
L Device:D_Schottky_ALT D4
U 1 1 61427D60
P 14100 8200
F 0 "D4" H 14100 7983 50  0000 C CNN
F 1 "D_Schottky_ALT" H 14100 8074 50  0000 C CNN
F 2 "alexios:SOD-323" H 14100 8200 50  0001 C CNN
F 3 "~" H 14100 8200 50  0001 C CNN
	1    14100 8200
	-1   0    0    1   
$EndComp
Text Label 14550 8200 2    50   ~ 0
A3
Text Notes 14600 8200 0    50   ~ 0
(~RESET~ on Peripheral Bus)
Wire Wire Line
	13900 6100 13750 6100
Wire Wire Line
	13750 6100 13750 6000
Connection ~ 13750 6000
Wire Wire Line
	13900 6600 13750 6600
Wire Wire Line
	13750 6600 13750 6700
Connection ~ 13750 6700
Text Label 13400 6200 0    50   ~ 0
POWERON
Wire Wire Line
	13900 6300 13400 6300
$Comp
L Connector:Screw_Terminal_01x10 J13
U 1 1 60EBF4DE
P 14100 6400
F 0 "J13" H 14180 6300 50  0000 L CNN
F 1 "Phoenix 1766204" H 14180 6391 50  0000 L CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_10-G-3.81_1x10_P3.81mm_Horizontal" H 14100 6400 50  0001 C CNN
F 3 "https://gr.mouser.com/datasheet/2/324/4/1766204-1441427.pdf" H 14100 6400 50  0001 C CNN
F 4 "651-1766204; €4.65" H 14100 6400 50  0001 C CNN "Mouser"
	1    14100 6400
	1    0    0    1   
$EndComp
Wire Wire Line
	13900 6200 13400 6200
Text Label 13400 6300 0    50   ~ 0
POWEROK
Wire Wire Line
	13900 6400 13400 6400
Text Label 13400 6400 0    50   ~ 0
STANDBY
Wire Wire Line
	13400 6500 13900 6500
Text Label 13400 6500 0    50   ~ 0
SPARE
$Comp
L Device:CP_Small C10
U 1 1 60F60F37
P 13400 6800
AR Path="/60F60F37" Ref="C10"  Part="1" 
AR Path="/5D34E810/60F60F37" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/60F60F37" Ref="C?"  Part="1" 
F 0 "C10" H 13312 6846 50  0000 R CNN
F 1 "47µF" H 13312 6755 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 13400 6800 50  0001 C CNN
F 3 "~" H 13400 6800 50  0001 C CNN
	1    13400 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	13400 6500 13400 6700
Wire Wire Line
	13750 6800 13750 7000
Wire Wire Line
	13400 6900 13400 7000
$Comp
L power:GND #PWR?
U 1 1 60F60F30
P 13400 7000
AR Path="/5F67D4B5/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/60F60F30" Ref="#PWR0103"  Part="1" 
AR Path="/5D34E810/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/60F60F30" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/60F60F30" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 13400 6750 50  0001 C CNN
F 1 "GND" H 13405 6827 50  0000 C CNN
F 2 "" H 13400 7000 50  0001 C CNN
F 3 "" H 13400 7000 50  0001 C CNN
	1    13400 7000
	1    0    0    -1  
$EndComp
Text Notes 14200 6550 0    50   ~ 0
Mates with: 1827185, 1827033
Wire Wire Line
	13400 6500 13100 6500
Connection ~ 13400 6500
$Comp
L Connector:TestPoint TP1
U 1 1 610FE30F
P 13100 6500
F 0 "TP1" V 13295 6572 50  0000 C CNN
F 1 "TestPoint" V 13204 6572 50  0000 C CNN
F 2 "TestPoint:TestPoint_Loop_D3.50mm_Drill1.4mm_Beaded" H 13300 6500 50  0001 C CNN
F 3 "~" H 13300 6500 50  0001 C CNN
	1    13100 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	20950 4650 20600 4650
Wire Wire Line
	20950 4750 20600 4750
Wire Wire Line
	20950 4850 20600 4850
Wire Wire Line
	20950 4950 20600 4950
Wire Wire Line
	20950 5450 20600 5450
Wire Wire Line
	20950 5550 20600 5550
Wire Wire Line
	20950 5650 20600 5650
Wire Wire Line
	20950 5750 20600 5750
Wire Wire Line
	20950 5850 20600 5850
Wire Wire Line
	20950 5950 20600 5950
Wire Wire Line
	20950 6050 20600 6050
Wire Wire Line
	20950 6150 20600 6150
Wire Wire Line
	20950 6250 20600 6250
Wire Wire Line
	20950 6350 20600 6350
Wire Wire Line
	20950 4450 20600 4450
Wire Wire Line
	20950 4550 20600 4550
Wire Wire Line
	23500 5900 23150 5900
Wire Wire Line
	23500 5100 23150 5100
Wire Wire Line
	23500 5800 23150 5800
Wire Wire Line
	23500 5700 23150 5700
Wire Wire Line
	23500 5500 23150 5500
Wire Wire Line
	23500 5400 23150 5400
Wire Wire Line
	23500 5000 23150 5000
Wire Wire Line
	18000 2450 17650 2450
Wire Wire Line
	18000 3250 17650 3250
Wire Wire Line
	20950 3350 20600 3350
Wire Wire Line
	20950 3250 20600 3250
Wire Wire Line
	20950 3150 20600 3150
Wire Wire Line
	20950 2750 20600 2750
Wire Wire Line
	20950 2850 20600 2850
Wire Wire Line
	19950 4100 19600 4100
Wire Wire Line
	18250 8100 17900 8100
Wire Wire Line
	18250 8200 17900 8200
Wire Wire Line
	18250 8300 17900 8300
Wire Wire Line
	18250 8400 17900 8400
Wire Wire Line
	18250 8500 17900 8500
Wire Wire Line
	18250 8600 17900 8600
Wire Wire Line
	18250 8700 17900 8700
Wire Wire Line
	18250 8800 17900 8800
Wire Wire Line
	18250 8900 17900 8900
Wire Wire Line
	18250 9000 17900 9000
Wire Wire Line
	18250 9100 17900 9100
Wire Wire Line
	18250 9200 17900 9200
Wire Wire Line
	18250 9300 17900 9300
Wire Wire Line
	18250 9400 17900 9400
Wire Wire Line
	18250 9500 17900 9500
Wire Wire Line
	18250 9600 17900 9600
Wire Wire Line
	18250 9950 17900 9950
Wire Wire Line
	18250 10050 17900 10050
Wire Wire Line
	18250 10150 17900 10150
Wire Wire Line
	18250 10250 17900 10250
Wire Wire Line
	18250 10350 17900 10350
Wire Wire Line
	18250 10450 17900 10450
Wire Wire Line
	18250 10550 17900 10550
Wire Wire Line
	18250 10650 17900 10650
Wire Wire Line
	18250 10750 17900 10750
Wire Wire Line
	18250 10850 17900 10850
Wire Wire Line
	18250 10950 17900 10950
Wire Wire Line
	18250 11050 17900 11050
Wire Wire Line
	18250 11150 17900 11150
Wire Wire Line
	18250 11250 17900 11250
Wire Wire Line
	18250 11350 17900 11350
Wire Wire Line
	18250 11450 17900 11450
Text Label 20600 4650 0    50   ~ 0
C15
Text Label 20600 4750 0    50   ~ 0
C16
Text Label 20600 4850 0    50   ~ 0
C17
Text Label 20600 4950 0    50   ~ 0
C18
Text Label 20600 5450 0    50   ~ 0
C21
Text Label 20600 5550 0    50   ~ 0
C22
Text Label 20600 5650 0    50   ~ 0
C23
Text Label 20600 5750 0    50   ~ 0
C24
Text Label 20600 5850 0    50   ~ 0
C25
Text Label 20600 6050 0    50   ~ 0
C27
Text Label 20600 6150 0    50   ~ 0
C28
Text Label 20600 6250 0    50   ~ 0
C29
Text Label 20600 6350 0    50   ~ 0
C30
Text Label 20600 4450 0    50   ~ 0
C13
Text Label 20600 4550 0    50   ~ 0
C14
Text Label 23150 5100 0    50   ~ 0
A25
Text Label 23150 5800 0    50   ~ 0
A26
Text Label 23150 5700 0    50   ~ 0
A27
Text Label 23150 5500 0    50   ~ 0
A29
Text Label 23150 5400 0    50   ~ 0
A30
Text Label 17650 2450 0    50   ~ 0
C4
Text Label 17650 3250 0    50   ~ 0
C6
Text Label 20600 3350 0    50   ~ 0
B10
Text Label 20600 3250 0    50   ~ 0
B11
Text Label 20600 3150 0    50   ~ 0
B12
Text Label 20600 2750 0    50   ~ 0
B13
Text Label 20600 2850 0    50   ~ 0
B14
Text Label 19600 4100 0    50   ~ 0
B15
Text Notes 17900 1700 0    100  ~ 20
Processor Bus: Bus Hold
Text Notes 17850 4600 0    100  ~ 20
Peripheral Bus: Bus Hold
Text Label 17900 8100 0    50   ~ 0
C4
Text Label 17900 8200 0    50   ~ 0
C5
Text Label 17900 8300 0    50   ~ 0
C6
Text Label 17900 8400 0    50   ~ 0
C7
Text Label 17900 8500 0    50   ~ 0
C8
Text Label 17900 8600 0    50   ~ 0
C9
Text Label 17900 8700 0    50   ~ 0
C10
Text Label 17900 8800 0    50   ~ 0
C11
Text Label 17900 8900 0    50   ~ 0
C15
Text Label 17900 9000 0    50   ~ 0
C16
Text Label 17900 9100 0    50   ~ 0
C17
Text Label 17900 9200 0    50   ~ 0
C18
Text Label 17900 9300 0    50   ~ 0
C19
Text Label 17900 9400 0    50   ~ 0
C20
Text Label 17900 9500 0    50   ~ 0
C21
Text Label 17900 9600 0    50   ~ 0
C22
Text Label 17900 9950 0    50   ~ 0
B23
Text Label 17900 10050 0    50   ~ 0
B24
Text Label 17900 10150 0    50   ~ 0
B25
Text Label 17900 10250 0    50   ~ 0
B26
Text Label 17900 10350 0    50   ~ 0
B27
Text Label 17900 10450 0    50   ~ 0
B28
Text Label 17900 10550 0    50   ~ 0
B29
Text Label 17900 10650 0    50   ~ 0
B30
Text Label 17900 10750 0    50   ~ 0
A15
Text Label 17900 10850 0    50   ~ 0
A16
Text Label 17900 10950 0    50   ~ 0
A17
Text Label 17900 11050 0    50   ~ 0
A18
Text Label 17900 11150 0    50   ~ 0
A19
Text Label 17900 11250 0    50   ~ 0
A20
Text Label 17900 11350 0    50   ~ 0
A21
Text Label 17900 11450 0    50   ~ 0
A22
Text Label 23150 5000 0    50   ~ 0
A23
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
Text Label 20600 5150 0    50   ~ 0
C20
Text Label 20600 5050 0    50   ~ 0
C19
Wire Wire Line
	20950 5150 20600 5150
Wire Wire Line
	20950 5050 20600 5050
Text Label 17650 2550 0    50   ~ 0
B6
Wire Wire Line
	18000 2550 17650 2550
Wire Wire Line
	18000 3150 17650 3150
Wire Wire Line
	18000 2750 17650 2750
Text Label 17650 2750 0    50   ~ 0
B8
Wire Wire Line
	18000 3350 17650 3350
Text Label 17650 3350 0    50   ~ 0
C5
Wire Wire Line
	18000 2650 17650 2650
Text Label 17650 2650 0    50   ~ 0
C7
Wire Wire Line
	18000 3050 17650 3050
Text Label 17650 3050 0    50   ~ 0
C8
Text Label 17650 2950 0    50   ~ 0
C9
Wire Wire Line
	18000 2950 17650 2950
Text Label 17650 3150 0    50   ~ 0
B7
Wire Wire Line
	18000 2850 17650 2850
Text Label 17650 2850 0    50   ~ 0
B9
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
P 21450 2950
F 0 "U2" H 21343 3717 50  0000 C CNN
F 1 "SN74ACT1071" H 21343 3626 50  0000 C CNN
F 2 "alexios:SOIC-14" H 21150 3300 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 21150 3300 50  0001 C CNN
	1    21450 2950
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U2
U 2 1 62C590F7
P 22550 3200
F 0 "U2" H 22730 3559 50  0000 L CNN
F 1 "SN74ACT1071" H 22730 3468 50  0000 L CNN
F 2 "alexios:SOIC-14" H 22250 3550 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 22250 3550 50  0001 C CNN
	2    22550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	22200 2700 22150 2700
Wire Wire Line
	22200 2800 22150 2800
Wire Wire Line
	22200 3000 22150 3000
Wire Wire Line
	22200 3100 22150 3100
$Comp
L Device:C_Small C12
U 1 1 62C59101
P 22150 2900
F 0 "C12" H 22241 2946 50  0000 L CNN
F 1 "100nF" H 22241 2855 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 22150 2900 50  0001 C CNN
F 3 "~" H 22150 2900 50  0001 C CNN
	1    22150 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	22150 2800 22150 2700
Connection ~ 22150 2800
Connection ~ 22150 2700
Wire Wire Line
	22150 2700 22150 2650
$Comp
L power:+5V #PWR0104
U 1 1 62C5910B
P 22150 2650
F 0 "#PWR0104" H 22150 2500 50  0001 C CNN
F 1 "+5V" H 22165 2823 50  0000 C CNN
F 2 "" H 22150 2650 50  0001 C CNN
F 3 "" H 22150 2650 50  0001 C CNN
	1    22150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	22150 3000 22150 3100
Connection ~ 22150 3000
$Comp
L power:GND #PWR0107
U 1 1 62C59113
P 22150 3150
F 0 "#PWR0107" H 22150 2900 50  0001 C CNN
F 1 "GND" H 22155 2977 50  0000 C CNN
F 2 "" H 22150 3150 50  0001 C CNN
F 3 "" H 22150 3150 50  0001 C CNN
	1    22150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	22150 3100 22150 3150
Connection ~ 22150 3100
Wire Wire Line
	20950 2450 20600 2450
Text Label 20600 2450 0    50   ~ 0
C10
Wire Wire Line
	20950 2550 20600 2550
Text Label 20600 2550 0    50   ~ 0
C11
Wire Wire Line
	20600 2650 20950 2650
Text Label 20600 2650 0    50   ~ 0
C12
Wire Wire Line
	20600 2950 20950 2950
Wire Wire Line
	20600 3050 20950 3050
Text Label 20600 3050 0    50   ~ 0
C13
Text Label 20600 2950 0    50   ~ 0
C14
Wire Wire Line
	23850 3400 23500 3400
Wire Wire Line
	23850 3300 23500 3300
Wire Wire Line
	23850 3200 23500 3200
Wire Wire Line
	23850 2800 23500 2800
Wire Wire Line
	23850 2900 23500 2900
Text Label 23500 3400 0    50   ~ 0
B15
Text Label 23500 3300 0    50   ~ 0
B16
Text Label 23500 3200 0    50   ~ 0
B17
Text Label 23500 2800 0    50   ~ 0
B18
Text Label 23500 2900 0    50   ~ 0
B19
Wire Wire Line
	25100 2750 25050 2750
Wire Wire Line
	25100 2850 25050 2850
Wire Wire Line
	25100 3050 25050 3050
Wire Wire Line
	25100 3150 25050 3150
$Comp
L Device:C_Small C13
U 1 1 630BA1BA
P 25050 2950
F 0 "C13" H 25141 2996 50  0000 L CNN
F 1 "100nF" H 25141 2905 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 25050 2950 50  0001 C CNN
F 3 "~" H 25050 2950 50  0001 C CNN
	1    25050 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	25050 2850 25050 2750
Connection ~ 25050 2850
Connection ~ 25050 2750
Wire Wire Line
	25050 2750 25050 2700
$Comp
L power:+5V #PWR0111
U 1 1 630BA1C4
P 25050 2700
F 0 "#PWR0111" H 25050 2550 50  0001 C CNN
F 1 "+5V" H 25065 2873 50  0000 C CNN
F 2 "" H 25050 2700 50  0001 C CNN
F 3 "" H 25050 2700 50  0001 C CNN
	1    25050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	25050 3050 25050 3150
Connection ~ 25050 3050
$Comp
L power:GND #PWR0119
U 1 1 630BA1CC
P 25050 3200
F 0 "#PWR0119" H 25050 2950 50  0001 C CNN
F 1 "GND" H 25055 3027 50  0000 C CNN
F 2 "" H 25050 3200 50  0001 C CNN
F 3 "" H 25050 3200 50  0001 C CNN
	1    25050 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	25050 3150 25050 3200
Connection ~ 25050 3150
Wire Wire Line
	23850 2500 23500 2500
Text Label 23500 2500 0    50   ~ 0
C15
Wire Wire Line
	23850 2600 23500 2600
Text Label 23500 2600 0    50   ~ 0
C16
Wire Wire Line
	23500 2700 23850 2700
Text Label 23500 2700 0    50   ~ 0
C17
Wire Wire Line
	23500 3000 23850 3000
Wire Wire Line
	23500 3100 23850 3100
Text Label 23500 3100 0    50   ~ 0
C18
Text Label 23500 3000 0    50   ~ 0
C19
$Comp
L alexios:SN74ACT1071 U3
U 2 1 630BA1B0
P 25450 3250
F 0 "U3" H 25630 3609 50  0000 L CNN
F 1 "SN74ACT1071" H 25630 3518 50  0000 L CNN
F 2 "alexios:SOIC-14" H 25150 3600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 25150 3600 50  0001 C CNN
	2    25450 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U3
U 1 1 630BA1AA
P 24350 3000
F 0 "U3" H 24243 3767 50  0000 C CNN
F 1 "SN74ACT1071" H 24243 3676 50  0000 C CNN
F 2 "alexios:SOIC-14" H 24050 3350 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 24050 3350 50  0001 C CNN
	1    24350 3000
	1    0    0    -1  
$EndComp
Text Label 20600 5950 0    50   ~ 0
C26
Wire Wire Line
	26900 3400 26550 3400
Wire Wire Line
	26900 3300 26550 3300
Wire Wire Line
	26900 3200 26550 3200
Wire Wire Line
	26900 2800 26550 2800
Wire Wire Line
	26900 2900 26550 2900
Text Label 26550 3400 0    50   ~ 0
B20
Text Label 26550 3300 0    50   ~ 0
B21
Text Label 26550 3200 0    50   ~ 0
B22
Text Label 26550 2800 0    50   ~ 0
B23
Text Label 26550 3100 0    50   ~ 0
B24
Wire Wire Line
	28150 2750 28100 2750
Wire Wire Line
	28150 2850 28100 2850
Wire Wire Line
	28150 3050 28100 3050
Wire Wire Line
	28150 3150 28100 3150
$Comp
L Device:C_Small C14
U 1 1 63100A54
P 28100 2950
F 0 "C14" H 28191 2996 50  0000 L CNN
F 1 "100nF" H 28191 2905 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 28100 2950 50  0001 C CNN
F 3 "~" H 28100 2950 50  0001 C CNN
	1    28100 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	28100 2850 28100 2750
Connection ~ 28100 2850
Connection ~ 28100 2750
Wire Wire Line
	28100 2750 28100 2700
$Comp
L power:+5V #PWR0120
U 1 1 63100A5E
P 28100 2700
F 0 "#PWR0120" H 28100 2550 50  0001 C CNN
F 1 "+5V" H 28115 2873 50  0000 C CNN
F 2 "" H 28100 2700 50  0001 C CNN
F 3 "" H 28100 2700 50  0001 C CNN
	1    28100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	28100 3050 28100 3150
Connection ~ 28100 3050
$Comp
L power:GND #PWR0121
U 1 1 63100A66
P 28100 3200
F 0 "#PWR0121" H 28100 2950 50  0001 C CNN
F 1 "GND" H 28105 3027 50  0000 C CNN
F 2 "" H 28100 3200 50  0001 C CNN
F 3 "" H 28100 3200 50  0001 C CNN
	1    28100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	28100 3150 28100 3200
Connection ~ 28100 3150
Wire Wire Line
	26900 2500 26550 2500
Text Label 26550 2500 0    50   ~ 0
C20
Wire Wire Line
	26900 2600 26550 2600
Text Label 26550 2600 0    50   ~ 0
C21
Wire Wire Line
	26550 2700 26900 2700
Text Label 26550 2700 0    50   ~ 0
C22
Wire Wire Line
	26550 3000 26900 3000
Wire Wire Line
	26550 3100 26900 3100
$Comp
L alexios:SN74ACT1071 U4
U 2 1 63100A78
P 28500 3250
F 0 "U4" H 28680 3609 50  0000 L CNN
F 1 "SN74ACT1071" H 28680 3518 50  0000 L CNN
F 2 "alexios:SOIC-14" H 28200 3600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 28200 3600 50  0001 C CNN
	2    28500 3250
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U4
U 1 1 63100A7E
P 27400 3000
F 0 "U4" H 27293 3767 50  0000 C CNN
F 1 "SN74ACT1071" H 27293 3676 50  0000 C CNN
F 2 "alexios:SOIC-14" H 27100 3350 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 27100 3350 50  0001 C CNN
	1    27400 3000
	1    0    0    -1  
$EndComp
Text Label 26550 2900 0    50   ~ 0
B25
Text Label 26550 3000 0    50   ~ 0
B26
$Comp
L alexios:SN74ACT1071 U5
U 1 1 631E8156
P 24000 5500
F 0 "U5" H 23893 6267 50  0000 C CNN
F 1 "SN74ACT1071" H 23893 6176 50  0000 C CNN
F 2 "alexios:SOIC-14" H 23700 5850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 23700 5850 50  0001 C CNN
	1    24000 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U5
U 2 1 631E816C
P 25100 5750
F 0 "U5" H 25280 6109 50  0000 L CNN
F 1 "SN74ACT1071" H 25280 6018 50  0000 L CNN
F 2 "alexios:SOIC-14" H 24800 6100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 24800 6100 50  0001 C CNN
	2    25100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	24750 5250 24700 5250
Wire Wire Line
	24750 5350 24700 5350
Wire Wire Line
	24750 5550 24700 5550
Wire Wire Line
	24750 5650 24700 5650
$Comp
L Device:C_Small C15
U 1 1 631E8176
P 24700 5450
F 0 "C15" H 24791 5496 50  0000 L CNN
F 1 "100nF" H 24791 5405 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 24700 5450 50  0001 C CNN
F 3 "~" H 24700 5450 50  0001 C CNN
	1    24700 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	24700 5350 24700 5250
Connection ~ 24700 5350
Connection ~ 24700 5250
Wire Wire Line
	24700 5250 24700 5200
$Comp
L power:+5V #PWR038
U 1 1 631E8180
P 24700 5200
F 0 "#PWR038" H 24700 5050 50  0001 C CNN
F 1 "+5V" H 24715 5373 50  0000 C CNN
F 2 "" H 24700 5200 50  0001 C CNN
F 3 "" H 24700 5200 50  0001 C CNN
	1    24700 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	24700 5550 24700 5650
Connection ~ 24700 5550
$Comp
L power:GND #PWR039
U 1 1 631E8188
P 24700 5700
F 0 "#PWR039" H 24700 5450 50  0001 C CNN
F 1 "GND" H 24705 5527 50  0000 C CNN
F 2 "" H 24700 5700 50  0001 C CNN
F 3 "" H 24700 5700 50  0001 C CNN
	1    24700 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	24700 5650 24700 5700
Connection ~ 24700 5650
Text Label 23150 5900 0    50   ~ 0
A24
Text Label 23150 5600 0    50   ~ 0
A28
Wire Wire Line
	23500 5600 23150 5600
Wire Wire Line
	27100 5900 26750 5900
Wire Wire Line
	27100 5100 26750 5100
Wire Wire Line
	27100 5800 26750 5800
Wire Wire Line
	27100 5700 26750 5700
Wire Wire Line
	27100 5500 26750 5500
Wire Wire Line
	27100 5400 26750 5400
Wire Wire Line
	27100 5000 26750 5000
Text Label 26750 5100 0    50   ~ 0
A17
Text Label 26750 5800 0    50   ~ 0
A18
Text Label 26750 5700 0    50   ~ 0
A19
Text Label 26750 5400 0    50   ~ 0
A22
$Comp
L alexios:SN74ACT1071 U6
U 1 1 6342861D
P 27600 5500
F 0 "U6" H 27493 6267 50  0000 C CNN
F 1 "SN74ACT1071" H 27493 6176 50  0000 C CNN
F 2 "alexios:SOIC-14" H 27300 5850 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 27300 5850 50  0001 C CNN
	1    27600 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:SN74ACT1071 U6
U 2 1 63428623
P 28700 5750
F 0 "U6" H 28880 6109 50  0000 L CNN
F 1 "SN74ACT1071" H 28880 6018 50  0000 L CNN
F 2 "alexios:SOIC-14" H 28400 6100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74act1071.pdf" H 28400 6100 50  0001 C CNN
	2    28700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	28350 5250 28300 5250
Wire Wire Line
	28350 5350 28300 5350
Wire Wire Line
	28350 5550 28300 5550
Wire Wire Line
	28350 5650 28300 5650
$Comp
L Device:C_Small C16
U 1 1 6342862D
P 28300 5450
F 0 "C16" H 28391 5496 50  0000 L CNN
F 1 "100nF" H 28391 5405 50  0000 L CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 28300 5450 50  0001 C CNN
F 3 "~" H 28300 5450 50  0001 C CNN
	1    28300 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	28300 5350 28300 5250
Connection ~ 28300 5350
Connection ~ 28300 5250
Wire Wire Line
	28300 5250 28300 5200
$Comp
L power:+5V #PWR0122
U 1 1 63428637
P 28300 5200
F 0 "#PWR0122" H 28300 5050 50  0001 C CNN
F 1 "+5V" H 28315 5373 50  0000 C CNN
F 2 "" H 28300 5200 50  0001 C CNN
F 3 "" H 28300 5200 50  0001 C CNN
	1    28300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	28300 5550 28300 5650
Connection ~ 28300 5550
$Comp
L power:GND #PWR0123
U 1 1 6342863F
P 28300 5700
F 0 "#PWR0123" H 28300 5450 50  0001 C CNN
F 1 "GND" H 28305 5527 50  0000 C CNN
F 2 "" H 28300 5700 50  0001 C CNN
F 3 "" H 28300 5700 50  0001 C CNN
	1    28300 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	28300 5650 28300 5700
Connection ~ 28300 5650
Text Label 26750 5900 0    50   ~ 0
A16
Wire Wire Line
	27100 5600 26750 5600
Text Label 26750 5000 0    50   ~ 0
A15
Text Label 26750 5600 0    50   ~ 0
A20
Text Label 26750 5500 0    50   ~ 0
A21
NoConn ~ 8800 4150
$EndSCHEMATC
