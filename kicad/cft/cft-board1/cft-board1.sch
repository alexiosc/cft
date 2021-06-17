EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 19
Title "Control Unit Board"
Date ""
Rev "2023"
Comp ""
Comment1 "CTL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1600 8400 1150 1900
U 5E1C970B
F0 "Decoders" 50
F1 "alu_decoder.sch" 50
F2 "RADDR[0..4]" I L 1600 8750 50 
F3 "WADDR[0..4]" I L 1600 8850 50 
F4 "T34" I L 1600 8650 50 
F5 "ACTION[0..4]" I L 1600 8950 50 
F6 "ACP" O L 1600 9350 50 
F7 "CLK4" I L 1600 8550 50 
F8 "~DECSP" O R 2750 10250 50 
F9 "~INCSP" O R 2750 10150 50 
F10 "~DECAC" O R 2750 9750 50 
F11 "~INCAC" O R 2750 9650 50 
F12 "~READ-SP" O R 2750 9950 50 
F13 "~WRITE-SP" O R 2750 10050 50 
F14 "~WRITE-AC" O R 2750 9550 50 
F15 "~ACTION-SRU" O R 2750 9250 50 
F16 "~ACTION-CLL" O R 2750 9150 50 
F17 "~ACTION-CPL" O R 2750 9050 50 
F18 "~READ-AC" O R 2750 9450 50 
F19 "~READ-ALU-B" O R 2750 8850 50 
F20 "~READ-ALU-Y" O R 2750 8650 50 
F21 "~ALU-OP" O R 2750 8550 50 
F22 "~WRITE-ALU-B" O R 2750 8950 50 
F23 "~ALUOE" O R 2750 8750 50 
F24 "BCP" I L 1600 9150 50 
$EndSheet
$Sheet
S 1600 11350 1150 450 
U 5DE6D8E0
F0 "Port A" 50
F1 "alu_port_a.sch" 50
F2 "A[0..15]" T R 2750 11500 50 
F3 "ACP" I L 1600 11500 50 
F4 "AC[0..15]" I L 1600 11650 50 
$EndSheet
$Sheet
S 1600 12050 1150 550 
U 5DEA5E6C
F0 "Port B" 50
F1 "alu_port_b.sch" 50
F2 "IBUS[0..15]" B L 1600 12200 50 
F3 "B[0..15]" T R 2750 12200 50 
F4 "~READ-ALU-B" I L 1600 12500 50 
F5 "~WRITE-ALU-B" I L 1600 12300 50 
F6 "BCP" I L 1600 12400 50 
$EndSheet
$Sheet
S 4650 8850 1150 1300
U 5DE3C078
F0 "sheet5DE3C026" 50
F1 "cft_alu_rom.sch" 50
F2 "A[0..15]" I L 4650 9450 50 
F3 "B[0..15]" I L 4650 9550 50 
F4 "FL" I L 4650 9700 50 
F5 "RADDR0" I L 4650 9800 50 
F6 "RADDR1" I L 4650 9900 50 
F7 "RADDR2" I L 4650 10000 50 
F8 "~ALU-OP" I L 4650 9000 50 
F9 "X-IN" I L 4650 9350 50 
F10 "IBUS[0..15]" T R 5800 9000 50 
F11 "X1" O R 5800 9450 50 
F12 "X0" O R 5800 9350 50 
F13 "FVOUT-ROM" O R 5800 9550 50 
F14 "~SETV-ROM" O R 5800 9650 50 
F15 "FLCPL-ROM" O R 5800 9750 50 
F16 "~SETL-ROM" O R 5800 9850 50 
F17 "T34" I L 4650 9200 50 
F18 "~ALUOE" I L 4650 9100 50 
$EndSheet
Text Notes 700  -6550 0    197  ~ 39
Decoders
Text Notes 1800 -3250 1    50   ~ 10
WADDR=010xx
Text Label 2850 -3850 2    50   ~ 0
~WRITE-DR
NoConn ~ 2250 -5000
NoConn ~ 2250 -4900
NoConn ~ 2250 -4800
NoConn ~ 2250 -4700
NoConn ~ 2250 -3550
NoConn ~ 2250 -3450
NoConn ~ 2250 -3350
NoConn ~ 2250 -3250
Wire Wire Line
	2250 -3950 2850 -3950
Wire Wire Line
	2250 -3850 2850 -3850
Text Label 2850 -3950 2    50   ~ 0
~WRITE-PC
Text Notes 2550 -4300 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 3100 -4300 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	2500 -4825 3300 -4825
Wire Notes Line width 12 style solid
	2500 -4250 2500 -4825
Wire Notes Line width 12 style solid
	3300 -4250 2500 -4250
Wire Notes Line width 12 style solid
	3300 -4825 3300 -4250
Wire Notes Line style solid
	2500 -4650 3300 -4650
Wire Notes Line
	3050 -4825 3050 -4250
Text Notes 1500 -700 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 9000 16350
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0131"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0131" H 9000 16200 50  0001 C CNN
F 1 "+5V" H 8942 16387 50  0000 R CNN
F 2 "" H 9000 16350 50  0001 C CNN
F 3 "" H 9000 16350 50  0001 C CNN
	1    9000 16350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62FAE635
P 9000 16750
AR Path="/5F67D4B5/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/62FAE635" Ref="#PWR0134"  Part="1" 
AR Path="/5D34E810/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/62FAE635" Ref="#PWR?"  Part="1" 
F 0 "#PWR0134" H 9000 16500 50  0001 C CNN
F 1 "GND" H 8922 16713 50  0000 R CNN
F 2 "" H 9000 16750 50  0001 C CNN
F 3 "" H 9000 16750 50  0001 C CNN
	1    9000 16750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 16350 9000 16450
Wire Wire Line
	9000 16650 9000 16750
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P 9900 16350
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0133"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0133" H 9900 16200 50  0001 C CNN
F 1 "+5V" H 9842 16387 50  0000 R CNN
F 2 "" H 9900 16350 50  0001 C CNN
F 3 "" H 9900 16350 50  0001 C CNN
	1    9900 16350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P 9900 16750
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0136"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0136" H 9900 16500 50  0001 C CNN
F 1 "GND" H 9822 16713 50  0000 R CNN
F 2 "" H 9900 16750 50  0001 C CNN
F 3 "" H 9900 16750 50  0001 C CNN
	1    9900 16750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 16350 9900 16450
Wire Wire Line
	9900 16650 9900 16750
Wire Bus Line
	-5000 -4950 -4450 -4950
Text Label -5000 -4950 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-4450 -5750 -5000 -5750
Wire Wire Line
	-4450 -5650 -5000 -5650
Wire Wire Line
	-4450 -5550 -5000 -5550
Wire Wire Line
	-4450 -5450 -5000 -5450
Wire Wire Line
	-4450 -5850 -5000 -5850
Wire Wire Line
	-4450 -4550 -5000 -4550
Wire Wire Line
	-4450 -4450 -5000 -4450
Wire Wire Line
	-4450 -4350 -5000 -4350
Wire Wire Line
	-4450 -4850 -5000 -4850
Wire Wire Line
	-4450 -4050 -5000 -4050
Wire Wire Line
	-4450 -3950 -5000 -3950
Wire Wire Line
	-4450 -3850 -5000 -3850
Wire Wire Line
	-4450 -4150 -5000 -4150
Wire Wire Line
	-4450 -4250 -5000 -4250
Wire Wire Line
	-4450 -3250 -5000 -3250
Wire Wire Line
	-4450 -3150 -5000 -3150
Wire Wire Line
	-4450 -3350 -5000 -3350
Wire Wire Line
	-4450 -3550 -5000 -3550
Text Label -5000 -4850 0    50   ~ 0
~IRQ
Wire Wire Line
	-4450 -5150 -5000 -5150
Wire Wire Line
	-4450 -5050 -5000 -5050
Wire Bus Line
	-5000 -5950 -4450 -5950
Text Label -5000 -5950 0    50   ~ 0
IBUS[0..15]
Text Label -5000 -5850 0    50   ~ 0
~RESET
Text Label -5000 -5750 0    50   ~ 0
CLK1
Text Label -5000 -5650 0    50   ~ 0
CLK2
Text Label -5000 -5550 0    50   ~ 0
CLK3
Text Label -5000 -5450 0    50   ~ 0
CLK4
Text Label -5000 -5150 0    50   ~ 0
WSTB
Text Label -5000 -5050 0    50   ~ 0
T34
Wire Wire Line
	-4450 -4750 -5000 -4750
Text Label -5000 -4750 0    50   ~ 0
~IRQS
Text Label -5000 -4550 0    50   ~ 0
~RSTHOLD
Text Label -5000 -4450 0    50   ~ 0
~SYSDEV
Text Label -5000 -4350 0    50   ~ 0
~IODEV1xx
Text Label -5000 -4250 0    50   ~ 0
~IODEV2xx
Text Label -5000 -4150 0    50   ~ 0
~IODEV3xx
Text Label -5000 -4050 0    50   ~ 0
~MEM
Text Label -5000 -3950 0    50   ~ 0
~IO
Text Label -5000 -3850 0    50   ~ 0
~R
Text Label -5000 -3550 0    50   ~ 0
~WS
Text Label -5000 -3350 0    50   ~ 0
~ENDEXT
Text Label -5000 -3250 0    50   ~ 0
~SKIPEXT
Text Label -5000 -3150 0    50   ~ 0
~HALT
Text Label -5000 -3050 0    50   ~ 0
ACTION[0..3]
Text Label -5000 -2950 0    50   ~ 0
WADDR[0..4]
Text Label -5000 -2850 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-4450 -3050 -5000 -3050
Wire Bus Line
	-4450 -2950 -5000 -2950
Wire Bus Line
	-4450 -2850 -5000 -2850
Wire Bus Line
	-5000 -2750 -4450 -2750
Text Label -5000 -2750 0    50   ~ 0
RSVD[1..4]
Text Notes -4500 -6350 0    100  ~ 20
Edge Connector
Wire Wire Line
	-3300 -4950 -2700 -4950
NoConn ~ -5000 -4450
NoConn ~ -5000 -4350
NoConn ~ -5000 -4250
NoConn ~ -5000 -4150
NoConn ~ -5000 -2750
Wire Wire Line
	-3300 -5950 -2950 -5950
Wire Wire Line
	-3300 -5850 -2950 -5850
Wire Wire Line
	-3300 -5750 -2950 -5750
Wire Wire Line
	-3300 -5650 -2950 -5650
Wire Wire Line
	-3300 -5550 -2950 -5550
Wire Wire Line
	-3300 -5450 -2950 -5450
Wire Wire Line
	-3300 -5350 -2950 -5350
Text Label -2950 -5950 2    50   ~ 0
IR0
Text Label -2950 -5850 2    50   ~ 0
IR1
Text Label -2950 -5750 2    50   ~ 0
IR2
Text Label -2950 -5650 2    50   ~ 0
IR3
Text Label -2950 -5550 2    50   ~ 0
IR4
Text Label -2950 -5450 2    50   ~ 0
IR5
Text Label -2950 -5350 2    50   ~ 0
IR6
Entry Wire Line
	-2950 -5350 -2850 -5450
Entry Wire Line
	-2950 -5450 -2850 -5550
Entry Wire Line
	-2950 -5550 -2850 -5650
Entry Wire Line
	-2950 -5650 -2850 -5750
Entry Wire Line
	-2950 -5750 -2850 -5850
Entry Wire Line
	-2950 -5850 -2850 -5950
Entry Wire Line
	-2950 -5950 -2850 -6050
Entry Bus Bus
	-2850 -6100 -2750 -6200
Wire Bus Line
	-2750 -6200 -2450 -6200
Text Label -2450 -6200 2    50   ~ 0
IR[0..6]
Text Label -2700 -4950 2    50   ~ 0
~WRITE-FL
Text Label -2700 -5150 2    50   ~ 0
FL
Text Label -2700 -5050 2    50   ~ 0
FV
Text Notes -2650 -5150 0    50   ~ 0
← ALU
Text Notes -2650 -5950 0    50   ~ 0
→ BUS.MBU
Text Notes -2650 -4950 0    50   ~ 0
→ ALU
Wire Wire Line
	-3300 -2050 -2700 -2050
Text Notes -2650 -5850 0    50   ~ 0
→ BUS.MBU
Text Notes -2650 -5750 0    50   ~ 0
→ BUS.MBU
Text Notes -2650 -5650 0    50   ~ 0
→ BUS.MBU
Text Notes -2650 -5550 0    50   ~ 0
→ BUS.MBU
Text Notes -2650 -5450 0    50   ~ 0
→ BUS.MBU
Text Notes -2650 -5050 0    50   ~ 0
← ALU
Wire Wire Line
	-3300 -2350 -2700 -2350
Wire Wire Line
	-3300 -2250 -2700 -2250
Wire Wire Line
	-3300 -2750 -2700 -2750
Wire Wire Line
	-3300 -2650 -2700 -2650
Wire Wire Line
	-3300 -2550 -2700 -2550
Wire Wire Line
	-3300 -2450 -2700 -2450
Wire Wire Line
	-3300 -2850 -2700 -2850
Text Label -2700 -2850 2    50   ~ 0
COND0
Text Label -2700 -2750 2    50   ~ 0
COND1
Text Label -2700 -2650 2    50   ~ 0
COND2
Text Label -2700 -2550 2    50   ~ 0
COND3
Text Label -2700 -2450 2    50   ~ 0
COND4
Text Label -2700 -2350 2    50   ~ 0
CEXT8
Text Label -2700 -2250 2    50   ~ 0
CEXT9
Text Label -2700 -4850 2    50   ~ 0
FZ
Text Label -2700 -4750 2    50   ~ 0
FN
Text Notes -2650 -4850 0    50   ~ 0
← REG
Text Notes -2650 -4750 0    50   ~ 0
← REG
Text Label -2700 -4650 2    50   ~ 0
PC10
Text Label -2700 -4550 2    50   ~ 0
PC11
Text Label -2700 -4450 2    50   ~ 0
PC12
Text Label -2700 -4350 2    50   ~ 0
PC13
Text Label -2700 -4250 2    50   ~ 0
PC14
Text Label -2700 -4150 2    50   ~ 0
PC15
Text Notes -2650 -4650 0    50   ~ 0
← REG
Text Notes -2650 -4550 0    50   ~ 0
← REG
Text Notes -2650 -4450 0    50   ~ 0
← REG
Text Notes -2650 -4350 0    50   ~ 0
← REG
Text Notes -2650 -4250 0    50   ~ 0
← REG
Text Notes -2650 -4150 0    50   ~ 0
← REG
Wire Wire Line
	-3300 -4050 -2700 -4050
Text Label -2700 -4050 2    50   ~ 0
~FPRESET
Wire Wire Line
	-3300 -3950 -2700 -3950
Text Label -2700 -3950 2    50   ~ 0
FPCLK
Wire Wire Line
	-3300 -3850 -2700 -3850
Text Label -2700 -3850 2    50   ~ 0
~FPCLK~⁄CLK
Wire Wire Line
	-3300 -2950 -2700 -2950
Text Label -2700 -2950 2    50   ~ 0
POWEROK
Wire Wire Line
	-3300 -3750 -2700 -3750
Text Label -2700 -3750 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes -2650 -4050 0    50   ~ 0
← DFP
Text Notes -2650 -3950 0    50   ~ 0
← DFP
Text Notes -2650 -3850 0    50   ~ 0
← DFP
Text Notes -2650 -2950 0    50   ~ 0
← PSU (backplane)
Text Notes -2650 -3750 0    50   ~ 0
→ DFP
Text Notes -12000 -6550 0    100  ~ 20
The Control Unit Board
Text Notes -12000 -5750 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Notes -2650 -2850 0    50   ~ 0
Future expansion
Text Label -2700 -3350 2    50   ~ 0
~FPµC2
Text Label -2700 -3450 2    50   ~ 0
~FPµC1
Text Label -2700 -3550 2    50   ~ 0
~FPµC0
Text Label -2700 -3650 2    50   ~ 0
~FPµA0
Text Notes -2650 -3650 0    50   ~ 0
← DFP
Text Notes -2650 -3550 0    50   ~ 0
← DFP
Text Notes -2650 -3450 0    50   ~ 0
← DFP
Text Notes -2650 -3350 0    50   ~ 0
← DFP
Text Label -2700 -3250 2    50   ~ 0
~FPIRL
Text Label -2700 -3150 2    50   ~ 0
~FPIRH
Text Notes -2650 -3250 0    50   ~ 0
← DFP
Text Notes -2650 -3150 0    50   ~ 0
← DFP
Text Label -2700 -5250 2    50   ~ 0
~WEN
Text Notes -2650 -5250 0    50   ~ 0
→ BUS
Text Notes -2650 -3050 0    50   ~ 0
← DFP
Text Label -2700 -3050 2    50   ~ 0
~FPFLAGS
Text Notes -2650 -5350 0    50   ~ 0
→ BUS.MBU
Wire Wire Line
	-4450 -3450 -5000 -3450
Text Label -5000 -3450 0    50   ~ 0
~WAITING
NoConn ~ -2700 -2050
Text Notes -3050 -1750 0    50   ~ 0
Pull-downs above are for testing\nCTL board without other boards.
$Comp
L power:GND #PWR0102
U 1 1 60407157
P -1750 -3000
F 0 "#PWR0102" H -1750 -3250 50  0001 C CNN
F 1 "GND" H -1745 -3173 50  0000 C CNN
F 2 "" H -1750 -3000 50  0001 C CNN
F 3 "" H -1750 -3000 50  0001 C CNN
	1    -1750 -3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-1850 -4150 -1750 -4150
Wire Wire Line
	-1750 -4250 -1750 -4150
Connection ~ -1750 -4250
Wire Wire Line
	-1850 -4250 -1750 -4250
Wire Wire Line
	-1750 -4350 -1750 -4250
Connection ~ -1750 -4350
Wire Wire Line
	-1850 -4350 -1750 -4350
Wire Wire Line
	-1750 -4450 -1750 -4350
Connection ~ -1750 -4450
Wire Wire Line
	-1850 -4450 -1750 -4450
Wire Wire Line
	-1750 -4550 -1750 -4450
Connection ~ -1750 -4550
Wire Wire Line
	-1850 -4550 -1750 -4550
Wire Wire Line
	-1750 -4650 -1750 -4550
Connection ~ -1750 -4650
Wire Wire Line
	-1850 -4650 -1750 -4650
Wire Wire Line
	-1750 -4750 -1750 -4650
Connection ~ -1750 -4750
Wire Wire Line
	-1850 -4750 -1750 -4750
Wire Wire Line
	-1750 -4850 -1750 -4750
Connection ~ -1750 -4850
Wire Wire Line
	-1850 -4850 -1750 -4850
Wire Wire Line
	-1750 -5050 -1750 -4850
Connection ~ -1750 -5050
Wire Wire Line
	-1850 -5050 -1750 -5050
Wire Wire Line
	-1750 -5150 -1750 -5050
Wire Wire Line
	-1850 -5150 -1750 -5150
Wire Wire Line
	-3300 -5050 -2050 -5050
Wire Wire Line
	-3300 -5150 -2050 -5150
Wire Wire Line
	-3300 -5250 -2700 -5250
Text Notes -2650 -2750 0    50   ~ 0
Future expansion
Text Notes -2650 -2650 0    50   ~ 0
Future expansion
Text Notes -2650 -2550 0    50   ~ 0
Future expansion
Text Notes -2650 -2450 0    50   ~ 0
Future expansion
Text Notes -2650 -2350 0    50   ~ 0
Future expansion
Text Notes -2650 -2250 0    50   ~ 0
Future expansion
Connection ~ -1750 -4150
Wire Wire Line
	-3300 -3050 -2700 -3050
Wire Wire Line
	-3300 -3150 -2700 -3150
Wire Wire Line
	-3300 -3250 -2700 -3250
Wire Wire Line
	-3300 -3350 -2700 -3350
Wire Wire Line
	-3300 -3450 -2700 -3450
Wire Wire Line
	-3300 -3550 -2700 -3550
Wire Wire Line
	-3300 -3650 -2700 -3650
Wire Wire Line
	-1750 -4150 -1750 -3000
$Comp
L Device:CP_Small C114
U 1 1 5EFD0822
P 9900 16550
AR Path="/5EFD0822" Ref="C114"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C114" H 9812 16596 50  0000 R CNN
F 1 "47µF" H 9812 16505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9900 16550 50  0001 C CNN
F 3 "~" H 9900 16550 50  0001 C CNN
	1    9900 16550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C112
U 1 1 62FAE636
P 9000 16550
AR Path="/62FAE636" Ref="C112"  Part="1" 
AR Path="/5D34E810/62FAE636" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE636" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE636" Ref="C?"  Part="1" 
F 0 "C112" H 8912 16596 50  0000 R CNN
F 1 "47µF" H 8912 16505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9000 16550 50  0001 C CNN
F 3 "~" H 9000 16550 50  0001 C CNN
	1    9000 16550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6084E503
P 10200 13200
AR Path="/5F67D4B5/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/6084E503" Ref="#PWR0111"  Part="1" 
AR Path="/5D34E810/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E503" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 10200 13050 50  0001 C CNN
F 1 "+5V" H 10142 13237 50  0000 R CNN
F 2 "" H 10200 13200 50  0001 C CNN
F 3 "" H 10200 13200 50  0001 C CNN
	1    10200 13200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62FAE629
P 10200 13600
AR Path="/5F67D4B5/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/62FAE629" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE629" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 10200 13350 50  0001 C CNN
F 1 "GND" H 10122 13563 50  0000 R CNN
F 2 "" H 10200 13600 50  0001 C CNN
F 3 "" H 10200 13600 50  0001 C CNN
	1    10200 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 13200 10200 13300
$Comp
L Device:CP_Small C103
U 1 1 6084E505
P 10200 13400
AR Path="/6084E505" Ref="C103"  Part="1" 
AR Path="/5D34E810/6084E505" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6084E505" Ref="C?"  Part="1" 
F 0 "C103" H 10112 13446 50  0000 R CNN
F 1 "47µF" H 10112 13355 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10200 13400 50  0001 C CNN
F 3 "~" H 10200 13400 50  0001 C CNN
	1    10200 13400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 13500 10200 13600
$Comp
L power:+5V #PWR?
U 1 1 6084E506
P 9750 13200
AR Path="/5F67D4B5/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/6084E506" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E506" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H 9750 13050 50  0001 C CNN
F 1 "+5V" H 9692 13237 50  0000 R CNN
F 2 "" H 9750 13200 50  0001 C CNN
F 3 "" H 9750 13200 50  0001 C CNN
	1    9750 13200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6084E507
P 9750 13600
AR Path="/5F67D4B5/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/6084E507" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E507" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 9750 13350 50  0001 C CNN
F 1 "GND" H 9672 13563 50  0000 R CNN
F 2 "" H 9750 13600 50  0001 C CNN
F 3 "" H 9750 13600 50  0001 C CNN
	1    9750 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 13200 9750 13300
$Comp
L Device:CP_Small C102
U 1 1 5D8C8453
P 9750 13400
AR Path="/5D8C8453" Ref="C102"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C102" H 9662 13446 50  0000 R CNN
F 1 "47µF" H 9662 13355 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9750 13400 50  0001 C CNN
F 3 "~" H 9750 13400 50  0001 C CNN
	1    9750 13400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 13500 9750 13600
Wire Bus Line
	5800 9000 6300 9000
Text Label 6300 9000 2    50   ~ 0
IBUS[0..15]
Wire Wire Line
	5800 9350 6300 9350
Wire Wire Line
	5800 9450 6300 9450
Wire Wire Line
	5800 9550 6300 9550
Wire Wire Line
	5800 9650 6300 9650
Wire Wire Line
	5800 9750 6300 9750
Wire Wire Line
	5800 9850 6300 9850
Text Label 6300 9350 2    50   ~ 0
X0
Text Label 6300 9450 2    50   ~ 0
X1
Text Label 6300 9850 2    50   ~ 0
~SETL-ROM
Text Label 4150 12200 0    50   ~ 0
B[0..15]
Wire Wire Line
	4650 11900 4050 11900
Wire Wire Line
	4650 11750 4050 11750
Wire Wire Line
	4650 11600 4050 11600
Wire Bus Line
	4650 11450 4050 11450
Text Label 4050 11450 0    50   ~ 0
IR[0..3]
Text Label 4050 11600 0    50   ~ 0
IR4
Text Label 4050 11750 0    50   ~ 0
IR5
Text Label 4050 11900 0    50   ~ 0
IR6
Wire Wire Line
	4050 10650 4650 10650
Wire Wire Line
	4650 11050 4050 11050
Wire Wire Line
	4650 10850 4050 10850
Text Label 4050 11050 0    50   ~ 0
CLK4
Wire Wire Line
	5800 12200 6300 12200
Text Label 6300 12200 2    50   ~ 0
BCP
Text Label 4050 10650 0    50   ~ 0
~RESET
Text Label 4050 10850 0    50   ~ 0
CLK2
Text Label 4100 12300 0    50   ~ 0
FLFAST
Wire Wire Line
	5800 12300 6300 12300
Wire Bus Line
	5800 12100 6300 12100
Text Label 6300 12100 2    50   ~ 0
IBUS[0..15]
Text Label 6300 12300 2    50   ~ 0
FLOUT-SRU
Text Notes 5750 12550 2    79   ~ 16
SRU
Text Label 1050 8750 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	1600 8750 1050 8750
Wire Wire Line
	1050 8650 1600 8650
Text Label 1050 8650 0    50   ~ 0
T34
Text Label 1050 8850 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	1600 8850 1050 8850
Text Label 1050 8950 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	1600 8950 1050 8950
Wire Wire Line
	2750 8950 3300 8950
Text Label 3300 8850 2    50   ~ 0
~READ-ALU-B
Text Label 3300 8950 2    50   ~ 0
~WRITE-ALU-B
Text Label 3800 13150 2    50   ~ 0
FL
Text Label 950  13850 0    50   ~ 0
~FLAGWE
Text Label 950  13950 0    50   ~ 0
IBUS12
Wire Wire Line
	1650 13950 950  13950
Text Label 950  13350 0    50   ~ 0
CLK4
Text Label 950  13150 0    50   ~ 0
~RSTHOLD
Text Notes 0    13150 0    100  ~ 20
Flags
Text Notes 2700 11750 2    79   ~ 16
A
Text Notes 2700 12550 2    79   ~ 16
B
Wire Bus Line
	1050 11650 1600 11650
Text Label 1050 11650 0    50   ~ 0
AC[0..15]
Text Label 1050 12200 0    50   ~ 0
IBUS[0..15]
Wire Wire Line
	950  12400 1600 12400
Text Label 950  12500 0    50   ~ 0
~READ-ALU-B
Text Label 950  12400 0    50   ~ 0
BCP
Wire Wire Line
	1600 12500 950  12500
Text Label 2850 12200 0    50   ~ 0
B[0..15]
Wire Bus Line
	3600 12200 2750 12200
Text Label 2850 11500 0    50   ~ 0
A[0..15]
Text Notes 450  11850 2    100  ~ 20
Ports
Wire Wire Line
	950  13150 1650 13150
Wire Wire Line
	950  13350 1650 13350
Wire Wire Line
	950  13850 1650 13850
Text Label 3800 13250 2    50   ~ 0
FLFAST
Wire Wire Line
	1650 13650 950  13650
Text Label 950  13650 0    50   ~ 0
BCP
Wire Wire Line
	1650 13750 950  13750
Text Label 950  13750 0    50   ~ 0
FLOUT-SRU
Wire Wire Line
	1650 14250 950  14250
Text Label 950  14150 0    50   ~ 0
~ACTION-CPL
Text Label 950  14250 0    50   ~ 0
~ACTION-CLL
Entry Bus Bus
	3700 9650 3800 9550
Entry Bus Bus
	3700 12100 3800 12200
Wire Bus Line
	3800 12200 4650 12200
Entry Bus Bus
	3600 12200 3700 12100
Entry Bus Bus
	3800 9450 3700 9550
Wire Bus Line
	3600 9650 3700 9550
Entry Bus Bus
	6300 9000 6400 9100
Entry Bus Bus
	6400 12000 6300 12100
Entry Bus Bus
	850  12100 950  12200
Wire Bus Line
	850  12100 850  11150
Entry Bus Bus
	950  11050 850  11150
Wire Bus Line
	950  11050 3400 11050
Entry Bus Bus
	3500 10950 3400 11050
Entry Bus Bus
	6300 8650 6400 8750
Entry Bus Bus
	3800 8650 3700 8750
Wire Bus Line
	6300 8650 3800 8650
Wire Bus Line
	3500 10950 3500 8950
Wire Bus Line
	3500 8950 3700 8750
Wire Wire Line
	4050 12300 4650 12300
Text Label 3300 8550 2    50   ~ 0
~ALU-OP
Text Label 3300 9150 2    50   ~ 0
~ACTION-CLL
Text Label 3300 9050 2    50   ~ 0
~ACTION-CPL
Wire Wire Line
	2750 9150 3300 9150
Text Label 3300 9250 2    50   ~ 0
~ACTION-SRU
Text Label 3600 10400 1    50   ~ 0
A[0..15]
Text Label 3500 10400 1    50   ~ 0
IBUS[0..15]
Wire Bus Line
	2750 11500 3500 11500
Entry Bus Bus
	3600 11400 3500 11500
Wire Bus Line
	3600 9650 3600 11400
Text Label 3700 11850 1    50   ~ 0
B[0..15]
Wire Wire Line
	4050 12300 4050 13250
Wire Wire Line
	2800 13250 4050 13250
Wire Bus Line
	3800 9450 4650 9450
Wire Bus Line
	3800 9550 4650 9550
Text Label 3950 12900 1    50   ~ 0
FL
Text Label 4050 12900 1    50   ~ 0
FLFAST
Text Label 6300 9750 2    50   ~ 0
FLCPL-ROM
Text Label 6300 9650 2    50   ~ 0
~SETV-ROM
Text Label 6300 9550 2    50   ~ 0
FVOUT-ROM
Wire Wire Line
	4050 12050 4650 12050
Text Label 4050 12050 0    50   ~ 0
~ACTION-SRU
Text Label 3700 10400 1    50   ~ 0
B[0..15]
Text Label 3950 10400 1    50   ~ 0
FL
Wire Wire Line
	2750 9050 3300 9050
Wire Wire Line
	1650 14150 950  14150
Wire Wire Line
	4650 10750 4050 10750
Text Label 4050 10750 0    50   ~ 0
~RSTHOLD
Wire Bus Line
	950  12200 1600 12200
Wire Wire Line
	1600 12300 950  12300
Text Label 950  12300 0    50   ~ 0
~WRITE-ALU-B
Wire Wire Line
	2750 8850 3300 8850
Text Label 3300 8650 2    50   ~ 0
~READ-ALU-Y
Text Label 4150 9550 0    50   ~ 0
B[0..15]
Text Label 4150 9450 0    50   ~ 0
A[0..15]
Text Label 4150 9350 0    50   ~ 0
X-IN
Text Label 4050 9700 0    50   ~ 0
FL
Wire Wire Line
	1600 9350 1450 9350
Wire Wire Line
	1450 9350 1450 11500
Wire Wire Line
	1450 11500 1600 11500
Wire Wire Line
	4650 9200 4050 9200
Text Label 4050 9200 0    50   ~ 0
T34
Text Label 4050 9800 0    50   ~ 0
RADDR0
Text Label 4050 9900 0    50   ~ 0
RADDR1
Text Label 4050 10000 0    50   ~ 0
RADDR2
Wire Wire Line
	4050 9900 4650 9900
Wire Wire Line
	4050 9800 4650 9800
Wire Wire Line
	4650 10000 4050 10000
Wire Wire Line
	4650 9700 3950 9700
Wire Wire Line
	3950 9700 3950 13150
Text Notes 6650 10650 1    100  ~ 20
Operations
Text Notes 0    10100 0    100  ~ 20
Control
Wire Wire Line
	4050 10950 4650 10950
Text Label 4050 10950 0    50   ~ 0
CLK3
Wire Bus Line
	3700 9650 3700 12100
Text Label 2850 11050 0    50   ~ 0
IBUS[0..15]
Text Label 4050 9000 0    50   ~ 0
~ALU-OP
Wire Wire Line
	2750 8550 3300 8550
Wire Wire Line
	2750 8650 3300 8650
Wire Wire Line
	4050 9000 4650 9000
Wire Wire Line
	2750 9250 3300 9250
Text Notes 700  2350 0    197  ~ 39
The ALU
Text Notes 750  3450 0    50   ~ 0
The CFT's ALU is probably among the most complex units of the processor. The 2019\nedition uses three ROMs containing all binary and unary operations except shifts and\nrolls. (the original ALU used 6 larger ROMs). The ROMs can perform two's complement\naddition (with carry and overflow), and bitwise AND, OR, XOR and NOT. Three of the\neight possible operations are still undefined.\n\nA separate unit can perform rolls, bitwise shifts and sign-extending (arithmethic) right\nshifts. This is a serial unit, not a barrel shifter, so the longer the bit distance the\nlonger it takes to calculate it. It's still better tha having to wait several clock cycles for\na single bit though.\n\nAlso present here are the L register and V flag.
Text Notes 2750 14600 2    79   ~ 16
L & V
Text Notes 5750 10100 2    79   ~ 16
ROM
Wire Wire Line
	1050 8550 1600 8550
Text Label 1050 8550 0    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5F91D04D
P 9300 13200
AR Path="/5F67D4B5/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F91D04D" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D04D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 9300 13050 50  0001 C CNN
F 1 "+5V" H 9242 13237 50  0000 R CNN
F 2 "" H 9300 13200 50  0001 C CNN
F 3 "" H 9300 13200 50  0001 C CNN
	1    9300 13200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F91D053
P 9300 13600
AR Path="/5F67D4B5/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F91D053" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D053" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 9300 13350 50  0001 C CNN
F 1 "GND" H 9222 13563 50  0000 R CNN
F 2 "" H 9300 13600 50  0001 C CNN
F 3 "" H 9300 13600 50  0001 C CNN
	1    9300 13600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 13200 9300 13300
$Comp
L Device:CP_Small C101
U 1 1 5F91D05A
P 9300 13400
AR Path="/5F91D05A" Ref="C101"  Part="1" 
AR Path="/5D34E810/5F91D05A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5F91D05A" Ref="C?"  Part="1" 
F 0 "C101" H 9212 13446 50  0000 R CNN
F 1 "47µF" H 9212 13355 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9300 13400 50  0001 C CNN
F 3 "~" H 9300 13400 50  0001 C CNN
	1    9300 13400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 13500 9300 13600
Text Notes 7050 1250 0    197  ~ 39
Registers
Text Label 6650 1700 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7150 1700 6650 1700
Text Label 6650 3400 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7150 3400 6650 3400
Text Label 6650 1900 0    50   ~ 0
~READ-AC
Text Label 6650 2000 0    50   ~ 0
~WRITE-AC
Wire Wire Line
	7150 3600 6650 3600
Wire Wire Line
	7150 3700 6650 3700
Wire Wire Line
	7150 3800 6650 3800
Wire Wire Line
	7150 3900 6650 3900
Text Label 6650 3600 0    50   ~ 0
~READ-SP
Text Label 6650 3700 0    50   ~ 0
~WRITE-SP
Wire Bus Line
	8300 2100 8800 2100
Text Label 8800 2100 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8300 1900 8800 1900
Wire Wire Line
	8300 2000 8800 2000
Text Label 8800 1900 2    50   ~ 0
~FPACH
Text Label 8800 2000 2    50   ~ 0
~FPACL
Wire Bus Line
	8300 3900 8800 3900
Text Label 8800 3900 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8300 3700 8800 3700
Wire Wire Line
	8300 3800 8800 3800
Text Label 8800 3700 2    50   ~ 0
~FPSPH
Text Label 8800 3800 2    50   ~ 0
~FPSPL
Wire Bus Line
	8300 1700 8800 1700
Text Label 8800 1700 2    50   ~ 0
AC[0..15]
Wire Wire Line
	7150 2100 6650 2100
Wire Wire Line
	7150 2000 6650 2000
Wire Wire Line
	7150 1900 6650 1900
Text Label 6650 3900 0    50   ~ 0
~DECSP
Text Label 6650 3800 0    50   ~ 0
~INCSP
Text Label 6650 2100 0    50   ~ 0
~INCAC
Text Notes 21200 4500 0    50   ~ 0
[RW]ADDR\n\n01000\n01001\n01010\n01011
Text Notes 21750 4500 0    50   ~ 0
Reg\n\nPC\nDR\nAC\nSP
Wire Notes Line width 12 style solid
	21150 3975 21950 3975
Wire Notes Line width 12 style solid
	21150 4550 21150 3975
Wire Notes Line width 12 style solid
	21950 4550 21150 4550
Wire Notes Line width 12 style solid
	21950 3975 21950 4550
Wire Notes Line style solid
	21150 4150 21950 4150
Wire Notes Line
	21700 3975 21700 4550
Text Notes 13750 3700 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
Wire Wire Line
	10650 -1700 11000 -1700
Wire Wire Line
	10650 -1800 11000 -1800
Wire Wire Line
	10650 -1900 11000 -1900
Wire Wire Line
	10650 -2000 11000 -2000
Wire Wire Line
	10650 -2100 11000 -2100
Wire Wire Line
	10650 -2200 11000 -2200
Wire Wire Line
	10650 -2300 11000 -2300
Wire Wire Line
	10650 -2400 11000 -2400
Wire Wire Line
	10650 -2500 11000 -2500
Wire Wire Line
	10650 -2600 11000 -2600
Wire Wire Line
	10650 -2700 11000 -2700
Wire Wire Line
	10650 -2800 11000 -2800
Wire Wire Line
	10650 -2900 11000 -2900
Wire Wire Line
	10650 -3000 11000 -3000
Wire Wire Line
	10650 -3100 11000 -3100
Wire Wire Line
	10650 -3200 11000 -3200
Wire Wire Line
	10650 -3400 11000 -3400
Wire Wire Line
	10650 -3500 11000 -3500
Wire Wire Line
	10650 -3600 11000 -3600
Wire Wire Line
	10650 -3700 11000 -3700
Wire Wire Line
	10650 -3800 11000 -3800
Wire Wire Line
	10650 -3900 11000 -3900
Wire Wire Line
	10650 -4000 11000 -4000
Wire Wire Line
	10650 -4100 11000 -4100
Wire Wire Line
	10650 -4200 11000 -4200
Wire Wire Line
	10650 -4400 11000 -4400
Wire Wire Line
	10650 -4500 11000 -4500
Wire Wire Line
	10650 -4600 11000 -4600
Wire Wire Line
	10650 -4700 11000 -4700
Wire Wire Line
	9100 -1000 9450 -1000
Wire Wire Line
	9100 -1100 9450 -1100
Wire Wire Line
	9100 -1200 9450 -1200
Wire Wire Line
	9100 -1300 9450 -1300
Wire Wire Line
	9100 -1400 9450 -1400
Wire Wire Line
	9100 -1500 9450 -1500
Wire Wire Line
	9100 -1600 9450 -1600
Wire Wire Line
	9100 -1700 9450 -1700
Wire Wire Line
	9100 -1900 9450 -1900
Wire Wire Line
	9100 -2000 9450 -2000
Wire Wire Line
	9100 -2100 9450 -2100
Wire Wire Line
	9100 -2200 9450 -2200
Wire Wire Line
	9100 -2300 9450 -2300
Wire Wire Line
	9100 -2400 9450 -2400
Wire Wire Line
	9100 -2500 9450 -2500
Wire Wire Line
	9100 -2600 9450 -2600
Wire Wire Line
	9100 -2700 9450 -2700
Wire Wire Line
	9100 -2800 9450 -2800
Wire Wire Line
	9100 -2900 9450 -2900
Wire Wire Line
	9100 -3000 9450 -3000
Wire Wire Line
	9100 -3100 9450 -3100
Wire Wire Line
	9100 -3200 9450 -3200
Wire Wire Line
	9100 -3300 9450 -3300
Wire Wire Line
	9100 -3400 9450 -3400
Wire Wire Line
	9100 -3500 9450 -3500
Wire Wire Line
	9100 -3600 9450 -3600
Wire Wire Line
	9100 -3700 9450 -3700
Wire Wire Line
	9100 -3800 9450 -3800
Wire Wire Line
	9100 -3900 9450 -3900
Wire Wire Line
	9100 -4000 9450 -4000
Wire Wire Line
	9100 -4100 9450 -4100
Wire Wire Line
	9100 -4400 9450 -4400
Wire Wire Line
	9100 -4500 9450 -4500
Wire Wire Line
	8550 -4000 8900 -4000
Wire Wire Line
	8550 -4100 8900 -4100
Wire Wire Line
	8550 -4300 8900 -4300
Wire Wire Line
	8550 -4400 8900 -4400
Wire Wire Line
	8550 -4500 8900 -4500
Wire Wire Line
	8550 -4600 8900 -4600
Wire Wire Line
	8550 -4700 8900 -4700
Wire Wire Line
	8900 -2700 8550 -2700
Wire Wire Line
	8900 -2800 8550 -2800
Wire Wire Line
	8900 -2900 8550 -2900
Wire Wire Line
	8900 -3000 8550 -3000
Wire Wire Line
	8900 -3100 8550 -3100
Wire Wire Line
	8900 -3200 8550 -3200
Wire Wire Line
	8900 -3300 8550 -3300
Wire Wire Line
	8900 -3400 8550 -3400
Text Label 8900 -4700 2    50   ~ 0
FPD0
Text Label 8900 -4600 2    50   ~ 0
FPD1
Text Label 8900 -4500 2    50   ~ 0
FPD2
Text Label 8900 -4400 2    50   ~ 0
FPD3
Text Label 8900 -4300 2    50   ~ 0
FPD4
Text Label 8900 -4200 2    50   ~ 0
FPD5
Text Label 8900 -4100 2    50   ~ 0
FPD6
Text Label 8900 -4000 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR0107
U 1 1 62FAE63D
P 10750 -900
F 0 "#PWR0107" H 10750 -1150 50  0001 C CNN
F 1 "GND" H 10755 -1073 50  0000 C CNN
F 2 "" H 10750 -900 50  0001 C CNN
F 3 "" H 10750 -900 50  0001 C CNN
	1    10750 -900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 -1000 10750 -1000
Wire Wire Line
	10750 -1000 10750 -900
Text Label 11000 -3200 2    50   ~ 0
DB0
Text Label 11000 -3100 2    50   ~ 0
DB1
Text Label 11000 -3000 2    50   ~ 0
DB2
Text Label 11000 -2900 2    50   ~ 0
DB3
Text Label 11000 -2800 2    50   ~ 0
DB4
Text Label 11000 -2700 2    50   ~ 0
DB5
Text Label 11000 -2600 2    50   ~ 0
DB6
Text Label 11000 -2500 2    50   ~ 0
DB7
Text Label 11000 -2400 2    50   ~ 0
DB8
Text Label 11000 -2300 2    50   ~ 0
DB9
Text Label 11000 -2200 2    50   ~ 0
DB10
Text Label 11000 -2100 2    50   ~ 0
DB11
Text Label 11000 -2000 2    50   ~ 0
DB12
Text Label 11000 -1900 2    50   ~ 0
DB13
Text Label 11000 -1800 2    50   ~ 0
DB14
Text Label 11000 -1700 2    50   ~ 0
DB15
$Comp
L power:+5V #PWR0105
U 1 1 62FAE63E
P 9400 -4750
F 0 "#PWR0105" H 9400 -4900 50  0001 C CNN
F 1 "+5V" H 9415 -4577 50  0000 C CNN
F 2 "" H 9400 -4750 50  0001 C CNN
F 3 "" H 9400 -4750 50  0001 C CNN
	1    9400 -4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 -4700 9400 -4700
Wire Wire Line
	9400 -4700 9400 -4750
Text Label 8900 -3400 2    50   ~ 0
IR0
Text Label 8900 -3300 2    50   ~ 0
IR1
Text Label 8900 -3200 2    50   ~ 0
IR2
Text Label 8900 -3100 2    50   ~ 0
IR3
Text Label 8900 -3000 2    50   ~ 0
IR4
Text Label 8900 -2900 2    50   ~ 0
IR5
Text Label 8900 -2800 2    50   ~ 0
IR6
Text Label 8900 -2700 2    50   ~ 0
IR7
Text Label 9100 -4500 0    50   ~ 0
~RESET
Text Label 9100 -4400 0    50   ~ 0
~RSTHOLD
Text Label 9100 -4200 0    50   ~ 0
AB0
Text Label 9100 -4100 0    50   ~ 0
AB1
Text Label 9100 -4000 0    50   ~ 0
AB2
Text Label 9100 -3900 0    50   ~ 0
AB3
Text Label 9100 -3800 0    50   ~ 0
AB4
Text Label 9100 -3700 0    50   ~ 0
AB5
Text Label 9100 -3600 0    50   ~ 0
AB6
Text Label 9100 -3500 0    50   ~ 0
AB7
Text Label 9100 -3400 0    50   ~ 0
AB8
Text Label 9100 -3300 0    50   ~ 0
AB9
Text Label 9100 -3200 0    50   ~ 0
AB10
Text Label 9100 -3100 0    50   ~ 0
AB11
Text Label 9100 -3000 0    50   ~ 0
AB12
Text Label 9100 -2900 0    50   ~ 0
AB13
Text Label 9100 -2800 0    50   ~ 0
AB14
Text Label 9100 -2700 0    50   ~ 0
AB15
Text Label 9100 -2600 0    50   ~ 0
AB16
Text Label 9100 -2500 0    50   ~ 0
AB17
Text Label 9100 -2400 0    50   ~ 0
AB18
Text Label 9100 -2300 0    50   ~ 0
AB19
Text Label 9100 -2200 0    50   ~ 0
AB20
Text Label 9100 -2100 0    50   ~ 0
AB21
Text Label 9100 -2000 0    50   ~ 0
AB22
Text Label 9100 -1900 0    50   ~ 0
AB23
Text Label 9100 -1700 0    50   ~ 0
~IRQ0
Text Label 9100 -1600 0    50   ~ 0
~IRQ1
Text Label 9100 -1500 0    50   ~ 0
~IRQ2
Text Label 9100 -1400 0    50   ~ 0
~IRQ3
Text Label 9100 -1300 0    50   ~ 0
~IRQ4
Text Label 9100 -1200 0    50   ~ 0
~IRQ5
Text Label 9100 -1100 0    50   ~ 0
~IRQ6
Text Label 9100 -1000 0    50   ~ 0
~IRQ7
Text Label 11000 -4700 2    50   ~ 0
~MEM
Text Label 11000 -4600 2    50   ~ 0
~IO
Text Label 11000 -4500 2    50   ~ 0
~R
Text Label 11000 -4400 2    50   ~ 0
~W
Text Label 11000 -4200 2    50   ~ 0
~SYSDEV
Text Label 11000 -4100 2    50   ~ 0
~IODEV1XX
Text Label 11000 -4000 2    50   ~ 0
~IODEV2XX
Text Label 11000 -3900 2    50   ~ 0
~IODEV3XX
Text Label 11000 -3800 2    50   ~ 0
~WS
Text Label 11000 -3700 2    50   ~ 0
~WAITING
Text Label 11000 -3600 2    50   ~ 0
~HALT
Text Label 11000 -3500 2    50   ~ 0
~IRQ
Text Label 11000 -3400 2    50   ~ 0
~IRQS
Text Notes 750  850  0    100  ~ 20
Board 1: ALU, Registers (Part 2), and Interrupts
Text Notes 750  1650 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Label 6850 -4000 0    50   ~ 0
~FPSPL
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 609EF5BD
P 7950 -4800
F 0 "P1" H 7950 -4633 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 7950 -4724 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 7900 -5700 50  0001 C CNN
F 3 "" H 7900 -5700 50  0001 C CNN
	2    7950 -4800
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 62FAE63B
P 5700 -4800
F 0 "P1" H 5700 -4633 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 5700 -4724 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 5650 -5700 50  0001 C CNN
F 3 "" H 5650 -5700 50  0001 C CNN
	1    5700 -4800
	1    0    0    -1  
$EndComp
Text Label 6650 -4500 2    50   ~ 0
~END
Wire Wire Line
	6300 -4500 6650 -4500
Text Label 4750 -1800 0    50   ~ 0
~WRITE-FL
Text Label 4750 -1900 0    50   ~ 0
FN
Text Label 4750 -2000 0    50   ~ 0
FZ
Text Label 4750 -2100 0    50   ~ 0
FL
Text Label 4750 -2200 0    50   ~ 0
FV
Text Label 4750 -2400 0    50   ~ 0
IBUS15
Text Label 4750 -2500 0    50   ~ 0
IBUS14
Text Label 4750 -2600 0    50   ~ 0
IBUS13
Text Label 4750 -2700 0    50   ~ 0
IBUS12
Text Label 4750 -2800 0    50   ~ 0
IBUS11
Text Label 4750 -2900 0    50   ~ 0
IBUS10
Text Label 4750 -3000 0    50   ~ 0
IBUS9
Text Label 4750 -3100 0    50   ~ 0
IBUS8
Text Label 4750 -3200 0    50   ~ 0
IBUS7
Text Label 4750 -3300 0    50   ~ 0
IBUS6
Text Label 4750 -3400 0    50   ~ 0
IBUS5
Text Label 4750 -3500 0    50   ~ 0
IBUS4
Text Label 4750 -3600 0    50   ~ 0
IBUS3
Text Label 4750 -3700 0    50   ~ 0
IBUS2
Text Label 4750 -3800 0    50   ~ 0
IBUS1
Text Label 4750 -3900 0    50   ~ 0
IBUS0
Text Label 4750 -4100 0    50   ~ 0
T34
Text Label 4750 -4200 0    50   ~ 0
CLK4
Text Label 4750 -4300 0    50   ~ 0
CLK3
Text Label 4750 -4400 0    50   ~ 0
CLK2
Wire Wire Line
	6400 -1800 6400 -1700
Wire Wire Line
	6300 -1800 6400 -1800
$Comp
L power:GND #PWR0106
U 1 1 61C7A92A
P 6400 -1700
F 0 "#PWR0106" H 6400 -1950 50  0001 C CNN
F 1 "GND" H 6405 -1873 50  0000 C CNN
F 2 "" H 6400 -1700 50  0001 C CNN
F 3 "" H 6400 -1700 50  0001 C CNN
	1    6400 -1700
	1    0    0    -1  
$EndComp
Text Label 6650 -2100 2    50   ~ 0
COND3
Text Label 6650 -2200 2    50   ~ 0
COND2
Text Label 6650 -2300 2    50   ~ 0
COND1
Text Label 6650 -2400 2    50   ~ 0
COND0
Text Label 6650 -2600 2    50   ~ 0
ACTION3
Text Label 6650 -2700 2    50   ~ 0
ACTION2
Text Label 6650 -2800 2    50   ~ 0
ACTION1
Text Label 6650 -2900 2    50   ~ 0
ACTION0
Text Label 6650 -3100 2    50   ~ 0
WADDR4
Text Label 6650 -3200 2    50   ~ 0
WADDR3
Text Label 6650 -3300 2    50   ~ 0
WADDR2
Text Label 6650 -3400 2    50   ~ 0
WADDR1
Text Label 6650 -3500 2    50   ~ 0
WADDR0
Text Label 6650 -3700 2    50   ~ 0
RADDR4
Text Label 6650 -3800 2    50   ~ 0
RADDR3
Text Label 6650 -3900 2    50   ~ 0
RADDR2
Text Label 6650 -4000 2    50   ~ 0
RADDR1
Text Label 6650 -4100 2    50   ~ 0
RADDR0
Wire Wire Line
	5050 -4700 5050 -4750
Wire Wire Line
	5100 -4700 5050 -4700
$Comp
L power:+5V #PWR0104
U 1 1 62FAE63C
P 5050 -4750
F 0 "#PWR0104" H 5050 -4900 50  0001 C CNN
F 1 "+5V" H 5065 -4577 50  0000 C CNN
F 2 "" H 5050 -4750 50  0001 C CNN
F 3 "" H 5050 -4750 50  0001 C CNN
	1    5050 -4750
	1    0    0    -1  
$EndComp
Text Label 6650 -4300 2    50   ~ 0
~SKIPEXT
Text Label 6650 -4400 2    50   ~ 0
~ENDEXT
Wire Wire Line
	4750 -4400 5100 -4400
Wire Wire Line
	4750 -4300 5100 -4300
Wire Wire Line
	4750 -4200 5100 -4200
Wire Wire Line
	4750 -4100 5100 -4100
Wire Wire Line
	4750 -3900 5100 -3900
Wire Wire Line
	4750 -3800 5100 -3800
Wire Wire Line
	4750 -3700 5100 -3700
Wire Wire Line
	4750 -3600 5100 -3600
Wire Wire Line
	4750 -3500 5100 -3500
Wire Wire Line
	4750 -3400 5100 -3400
Wire Wire Line
	4750 -3300 5100 -3300
Wire Wire Line
	4750 -3200 5100 -3200
Wire Wire Line
	4750 -3100 5100 -3100
Wire Wire Line
	4750 -3000 5100 -3000
Wire Wire Line
	4750 -2900 5100 -2900
Wire Wire Line
	4750 -2800 5100 -2800
Wire Wire Line
	4750 -2700 5100 -2700
Wire Wire Line
	4750 -2600 5100 -2600
Wire Wire Line
	4750 -2500 5100 -2500
Wire Wire Line
	4750 -2400 5100 -2400
Wire Wire Line
	4750 -2200 5100 -2200
Wire Wire Line
	4750 -2100 5100 -2100
Wire Wire Line
	4750 -2000 5100 -2000
Wire Wire Line
	4750 -1900 5100 -1900
Wire Wire Line
	6300 -4400 6650 -4400
Wire Wire Line
	6300 -4300 6650 -4300
Wire Wire Line
	6300 -4100 6650 -4100
Wire Wire Line
	6300 -4000 6650 -4000
Wire Wire Line
	6300 -3900 6650 -3900
Wire Wire Line
	6300 -3800 6650 -3800
Wire Wire Line
	6300 -3700 6650 -3700
Wire Wire Line
	6300 -3500 6650 -3500
Wire Wire Line
	6300 -3400 6650 -3400
Wire Wire Line
	6300 -3300 6650 -3300
Wire Wire Line
	6300 -3200 6650 -3200
Wire Wire Line
	6300 -3100 6650 -3100
Wire Wire Line
	6300 -2900 6650 -2900
Wire Wire Line
	6300 -2800 6650 -2800
Wire Wire Line
	6300 -2700 6650 -2700
Wire Wire Line
	6300 -2600 6650 -2600
Wire Wire Line
	6300 -2400 6650 -2400
Wire Wire Line
	6300 -2300 6650 -2300
Wire Wire Line
	6300 -2200 6650 -2200
Wire Wire Line
	6300 -2100 6650 -2100
Wire Wire Line
	6850 -3900 7350 -3900
Wire Wire Line
	6850 -4000 7350 -4000
Wire Wire Line
	6850 -4100 7350 -4100
Wire Wire Line
	6850 -4300 7350 -4300
Wire Wire Line
	6850 -4400 7350 -4400
Wire Wire Line
	6850 -4500 7350 -4500
Wire Wire Line
	6850 -3200 7350 -3200
Wire Wire Line
	6850 -3300 7350 -3300
Wire Wire Line
	6850 -3400 7350 -3400
Wire Wire Line
	6850 -3500 7350 -3500
Wire Wire Line
	6850 -3600 7350 -3600
Wire Wire Line
	6850 -3700 7350 -3700
Wire Wire Line
	6850 -3800 7350 -3800
Wire Wire Line
	7350 -3100 6850 -3100
Wire Wire Line
	7350 -3000 6850 -3000
Wire Wire Line
	7350 -2900 6850 -2900
Wire Wire Line
	7350 -2800 6850 -2800
Wire Wire Line
	7350 -2700 6850 -2700
Wire Wire Line
	6300 -4700 6650 -4700
Text Label 6650 -4700 2    50   ~ 0
16MHz
Wire Notes Line width 24 style solid
	21500 3200 18700 3200
Wire Notes Line width 24 style solid
	21500 3200 21500 2500
Wire Notes Line width 24 style solid
	18700 2500 21500 2500
Wire Notes Line width 24 style solid
	18700 2500 18700 3200
Text Notes 18800 2750 0    63   ~ 13
Note: IDX Registration
Text Notes 18800 3100 0    50   ~ 0
IDX0 and IDX1 are not registered because they rely solely on the\ncurrent value of the IR. IR is latched during CLK4, so at worst\nIDX will be valid at CLK1 + ~20ns.
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61115B2C
P 5000 -4700
F 0 "#FLG0101" H 5000 -4625 50  0001 C CNN
F 1 "PWR_FLAG" V 5000 -4573 50  0000 L CNN
F 2 "" H 5000 -4700 50  0001 C CNN
F 3 "~" H 5000 -4700 50  0001 C CNN
	1    5000 -4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 -4700 5050 -4700
Connection ~ 5050 -4700
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61150065
P 6450 -1800
F 0 "#FLG0102" H 6450 -1725 50  0001 C CNN
F 1 "PWR_FLAG" V 6450 -1672 50  0000 L CNN
F 2 "" H 6450 -1800 50  0001 C CNN
F 3 "~" H 6450 -1800 50  0001 C CNN
	1    6450 -1800
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 -1800 6450 -1800
Connection ~ 6400 -1800
Wire Wire Line
	8550 -4200 8900 -4200
Wire Wire Line
	6850 -4200 7350 -4200
Wire Wire Line
	9100 -4200 9450 -4200
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 60987323
P 10050 -4800
F 0 "P2" H 10050 -4633 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 10050 -4724 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 9925 -5675 50  0001 C CNN
F 3 "" H 9925 -5675 50  0001 C CNN
	1    10050 -4800
	1    0    0    -1  
$EndComp
Text Label 4750 -4500 0    50   ~ 0
CLK1
Wire Wire Line
	4750 -4500 5100 -4500
NoConn ~ 7350 -4700
NoConn ~ 7350 -4600
Text Notes 4750 -5150 0    100  ~ 20
Processor Bus
Text Notes 7550 -5150 0    100  ~ 20
Local Bus
Text Notes 9500 -5150 0    100  ~ 20
Peripheral Bus
$Sheet
S 7150 1550 1150 1450
U 5D9672D4
F0 "Accumulator" 50
F1 "cft-reg-ac.sch" 50
F2 "~FPH" I R 8300 1900 50 
F3 "~FPL" I R 8300 2000 50 
F4 "~READ" I L 7150 1900 50 
F5 "~INC" I L 7150 2100 50 
F6 "~WRITE" I L 7150 2000 50 
F7 "IBUS[0..15]" I L 7150 1700 50 
F8 "FPD[0..7]" T R 8300 2100 50 
F9 "AC[0..15]" O R 8300 1700 50 
F10 "~DEC" I L 7150 2200 50 
F11 "FZ" O R 8300 2300 50 
F12 "FN" O R 8300 2400 50 
F13 "~ACCPL1" O R 8300 2550 50 
F14 "~ACCPL2" O R 8300 2650 50 
$EndSheet
$Sheet
S 7150 3250 1150 1000
U 5D967A8B
F0 "Stack Pointer" 50
F1 "cft-reg-dr-sp.sch" 50
F2 "~FPH" I R 8300 3700 50 
F3 "~FPL" I R 8300 3800 50 
F4 "~READ" I L 7150 3600 50 
F5 "~INC" I L 7150 3800 50 
F6 "~WRITE" I L 7150 3700 50 
F7 "IBUS[0..15]" I L 7150 3400 50 
F8 "~DEC" I L 7150 3900 50 
F9 "FPD[0..7]" T R 8300 3900 50 
$EndSheet
$Comp
L power:+5V #PWR?
U 1 1 634E8C25
P 10200 13950
AR Path="/5F67D4B5/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/634E8C25" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C25" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 10200 13800 50  0001 C CNN
F 1 "+5V" H 10142 13987 50  0000 R CNN
F 2 "" H 10200 13950 50  0001 C CNN
F 3 "" H 10200 13950 50  0001 C CNN
	1    10200 13950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C2B
P 10200 14350
AR Path="/5F67D4B5/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/634E8C2B" Ref="#PWR0120"  Part="1" 
AR Path="/5D34E810/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C2B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0120" H 10200 14100 50  0001 C CNN
F 1 "GND" H 10122 14313 50  0000 R CNN
F 2 "" H 10200 14350 50  0001 C CNN
F 3 "" H 10200 14350 50  0001 C CNN
	1    10200 14350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 13950 10200 14050
$Comp
L Device:CP_Small C106
U 1 1 634E8C32
P 10200 14150
AR Path="/634E8C32" Ref="C106"  Part="1" 
AR Path="/5D34E810/634E8C32" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C32" Ref="C?"  Part="1" 
F 0 "C106" H 10112 14196 50  0000 R CNN
F 1 "47µF" H 10112 14105 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10200 14150 50  0001 C CNN
F 3 "~" H 10200 14150 50  0001 C CNN
	1    10200 14150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 14250 10200 14350
$Comp
L power:+5V #PWR?
U 1 1 634E8C39
P 9750 13950
AR Path="/5F67D4B5/634E8C39" Ref="#PWR?"  Part="1" 
AR Path="/634E8C39" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/634E8C39" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C39" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C39" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H 9750 13800 50  0001 C CNN
F 1 "+5V" H 9692 13987 50  0000 R CNN
F 2 "" H 9750 13950 50  0001 C CNN
F 3 "" H 9750 13950 50  0001 C CNN
	1    9750 13950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C3F
P 9750 14350
AR Path="/5F67D4B5/634E8C3F" Ref="#PWR?"  Part="1" 
AR Path="/634E8C3F" Ref="#PWR0119"  Part="1" 
AR Path="/5D34E810/634E8C3F" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C3F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C3F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0119" H 9750 14100 50  0001 C CNN
F 1 "GND" H 9672 14313 50  0000 R CNN
F 2 "" H 9750 14350 50  0001 C CNN
F 3 "" H 9750 14350 50  0001 C CNN
	1    9750 14350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 13950 9750 14050
$Comp
L Device:CP_Small C105
U 1 1 634E8C46
P 9750 14150
AR Path="/634E8C46" Ref="C105"  Part="1" 
AR Path="/5D34E810/634E8C46" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C46" Ref="C?"  Part="1" 
F 0 "C105" H 9662 14196 50  0000 R CNN
F 1 "47µF" H 9662 14105 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9750 14150 50  0001 C CNN
F 3 "~" H 9750 14150 50  0001 C CNN
	1    9750 14150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 14250 9750 14350
$Comp
L power:+5V #PWR?
U 1 1 634E8C4D
P 9300 13950
AR Path="/5F67D4B5/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/634E8C4D" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C4D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 9300 13800 50  0001 C CNN
F 1 "+5V" H 9242 13987 50  0000 R CNN
F 2 "" H 9300 13950 50  0001 C CNN
F 3 "" H 9300 13950 50  0001 C CNN
	1    9300 13950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C53
P 9300 14350
AR Path="/5F67D4B5/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/634E8C53" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C53" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 9300 14100 50  0001 C CNN
F 1 "GND" H 9222 14313 50  0000 R CNN
F 2 "" H 9300 14350 50  0001 C CNN
F 3 "" H 9300 14350 50  0001 C CNN
	1    9300 14350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 13950 9300 14050
$Comp
L Device:CP_Small C104
U 1 1 634E8C5A
P 9300 14150
AR Path="/634E8C5A" Ref="C104"  Part="1" 
AR Path="/5D34E810/634E8C5A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C5A" Ref="C?"  Part="1" 
F 0 "C104" H 9212 14196 50  0000 R CNN
F 1 "47µF" H 9212 14105 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9300 14150 50  0001 C CNN
F 3 "~" H 9300 14150 50  0001 C CNN
	1    9300 14150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 14250 9300 14350
$Comp
L power:+5V #PWR?
U 1 1 6352FA20
P 10200 14700
AR Path="/5F67D4B5/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/6352FA20" Ref="#PWR0125"  Part="1" 
AR Path="/5D34E810/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA20" Ref="#PWR?"  Part="1" 
F 0 "#PWR0125" H 10200 14550 50  0001 C CNN
F 1 "+5V" H 10142 14737 50  0000 R CNN
F 2 "" H 10200 14700 50  0001 C CNN
F 3 "" H 10200 14700 50  0001 C CNN
	1    10200 14700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA26
P 10200 15100
AR Path="/5F67D4B5/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/6352FA26" Ref="#PWR0130"  Part="1" 
AR Path="/5D34E810/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA26" Ref="#PWR?"  Part="1" 
F 0 "#PWR0130" H 10200 14850 50  0001 C CNN
F 1 "GND" H 10122 15063 50  0000 R CNN
F 2 "" H 10200 15100 50  0001 C CNN
F 3 "" H 10200 15100 50  0001 C CNN
	1    10200 15100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 14700 10200 14800
$Comp
L Device:CP_Small C111
U 1 1 6352FA2D
P 10200 14900
AR Path="/6352FA2D" Ref="C111"  Part="1" 
AR Path="/5D34E810/6352FA2D" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA2D" Ref="C?"  Part="1" 
F 0 "C111" H 10112 14946 50  0000 R CNN
F 1 "47µF" H 10112 14855 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10200 14900 50  0001 C CNN
F 3 "~" H 10200 14900 50  0001 C CNN
	1    10200 14900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 15000 10200 15100
$Comp
L power:+5V #PWR?
U 1 1 6352FA34
P 9750 14700
AR Path="/5F67D4B5/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/6352FA34" Ref="#PWR0124"  Part="1" 
AR Path="/5D34E810/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA34" Ref="#PWR?"  Part="1" 
F 0 "#PWR0124" H 9750 14550 50  0001 C CNN
F 1 "+5V" H 9692 14737 50  0000 R CNN
F 2 "" H 9750 14700 50  0001 C CNN
F 3 "" H 9750 14700 50  0001 C CNN
	1    9750 14700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA3A
P 9750 15100
AR Path="/5F67D4B5/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/6352FA3A" Ref="#PWR0129"  Part="1" 
AR Path="/5D34E810/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA3A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0129" H 9750 14850 50  0001 C CNN
F 1 "GND" H 9672 15063 50  0000 R CNN
F 2 "" H 9750 15100 50  0001 C CNN
F 3 "" H 9750 15100 50  0001 C CNN
	1    9750 15100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 14700 9750 14800
$Comp
L Device:CP_Small C110
U 1 1 6352FA41
P 9750 14900
AR Path="/6352FA41" Ref="C110"  Part="1" 
AR Path="/5D34E810/6352FA41" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA41" Ref="C?"  Part="1" 
F 0 "C110" H 9662 14946 50  0000 R CNN
F 1 "47µF" H 9662 14855 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9750 14900 50  0001 C CNN
F 3 "~" H 9750 14900 50  0001 C CNN
	1    9750 14900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 15000 9750 15100
$Comp
L power:+5V #PWR?
U 1 1 6352FA48
P 9300 14700
AR Path="/5F67D4B5/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/6352FA48" Ref="#PWR0123"  Part="1" 
AR Path="/5D34E810/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA48" Ref="#PWR?"  Part="1" 
F 0 "#PWR0123" H 9300 14550 50  0001 C CNN
F 1 "+5V" H 9242 14737 50  0000 R CNN
F 2 "" H 9300 14700 50  0001 C CNN
F 3 "" H 9300 14700 50  0001 C CNN
	1    9300 14700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA4E
P 9300 15100
AR Path="/5F67D4B5/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/6352FA4E" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 9300 14850 50  0001 C CNN
F 1 "GND" H 9222 15063 50  0000 R CNN
F 2 "" H 9300 15100 50  0001 C CNN
F 3 "" H 9300 15100 50  0001 C CNN
	1    9300 15100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 14700 9300 14800
$Comp
L Device:CP_Small C109
U 1 1 6352FA55
P 9300 14900
AR Path="/6352FA55" Ref="C109"  Part="1" 
AR Path="/5D34E810/6352FA55" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA55" Ref="C?"  Part="1" 
F 0 "C109" H 9212 14946 50  0000 R CNN
F 1 "47µF" H 9212 14855 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9300 14900 50  0001 C CNN
F 3 "~" H 9300 14900 50  0001 C CNN
	1    9300 14900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 15000 9300 15100
Wire Wire Line
	2750 9450 3300 9450
Wire Wire Line
	2750 9550 3300 9550
Wire Wire Line
	2750 9650 3300 9650
Wire Wire Line
	2750 9750 3300 9750
Wire Wire Line
	2750 9950 3300 9950
Wire Wire Line
	2750 10050 3300 10050
Wire Wire Line
	2750 10150 3300 10150
Wire Wire Line
	2750 10250 3300 10250
Text Label 3300 9450 2    50   ~ 0
~READ-AC
Text Label 3300 9550 2    50   ~ 0
~WRITE-AC
Text Label 3300 9650 2    50   ~ 0
~INCAC
Text Label 3300 9750 2    50   ~ 0
~DECAC
Text Label 3300 9950 2    50   ~ 0
~READ-SP
Text Label 3300 10050 2    50   ~ 0
~WRITE-SP
Text Label 3300 10150 2    50   ~ 0
~INCSP
Text Label 3300 10250 2    50   ~ 0
~DECSP
Wire Wire Line
	7150 2200 6650 2200
Text Label 6650 2200 0    50   ~ 0
~DECAC
Wire Wire Line
	8300 2300 8800 2300
Text Label 8800 2300 2    50   ~ 0
FZ
Wire Wire Line
	8300 2400 8800 2400
Text Label 8800 2400 2    50   ~ 0
FN
Wire Wire Line
	4850 -1800 4850 -1500
Wire Wire Line
	4750 -1800 4850 -1800
Connection ~ 4850 -1800
Wire Wire Line
	4850 -1800 5100 -1800
Wire Wire Line
	4850 -1500 5150 -1500
Text Label 5150 -1500 2    50   ~ 0
~FLAGWE
Wire Wire Line
	2800 13350 3800 13350
Text Label 3800 13350 2    50   ~ 0
FV
Wire Wire Line
	950  13250 1650 13250
Text Label 950  13250 0    50   ~ 0
CLK1
Wire Wire Line
	2800 14000 3500 14000
Wire Wire Line
	2800 14100 3500 14100
Text Label 3500 14100 2    50   ~ 0
FVOUT-ROM
Text Label 3500 14000 2    50   ~ 0
~SETV-ROM
Text Label 950  13450 0    50   ~ 0
~SETL-ROM
Text Label 950  13550 0    50   ~ 0
FLCPL-ROM
Wire Wire Line
	1650 13550 950  13550
Wire Wire Line
	1650 13450 950  13450
Text Label 950  14050 0    50   ~ 0
IBUS13
Wire Wire Line
	1650 14050 950  14050
Wire Wire Line
	1650 14350 950  14350
Text Label 950  14350 0    50   ~ 0
~READ-ALU-Y
Wire Wire Line
	2750 8750 3300 8750
Text Label 3300 8750 2    50   ~ 0
~ALUOE
Wire Wire Line
	4650 9100 4050 9100
Text Label 4050 9100 0    50   ~ 0
~ALUOE
Wire Wire Line
	1600 9150 1050 9150
Text Label 1050 9150 0    50   ~ 0
BCP
Wire Wire Line
	4650 11150 4050 11150
Text Label 4050 11150 0    50   ~ 0
16MHz
$Sheet
S 4650 10500 1150 2100
U 5DF75CDE
F0 "sheet5DF75CCD" 50
F1 "Serial_Shifter.sch" 50
F2 "CLK2" I L 4650 10850 50 
F3 "CLK4" I L 4650 11050 50 
F4 "DIST[0..3]" I L 4650 11450 50 
F5 "~SHIFT~∕ROTATE" I L 4650 11900 50 
F6 "~LOGIC~∕ARITH" I L 4650 11750 50 
F7 "~LEFT~∕RIGHT" I L 4650 11600 50 
F8 "B[0..15]" I L 4650 12200 50 
F9 "~RESET" I L 4650 10650 50 
F10 "IBUS[0..15]" B R 5800 12100 50 
F11 "FLOUT-SRU" O R 5800 12300 50 
F12 "FLFAST" I L 4650 12300 50 
F13 "BCP" O R 5800 12200 50 
F14 "~START" I L 4650 12050 50 
F15 "~RSTHOLD" I L 4650 10750 50 
F16 "CLK3" I L 4650 10950 50 
F17 "16MHz" I L 4650 11150 50 
F18 "~WRITE-ALU-B" I L 4650 11300 50 
F19 "TC-LED" O R 5800 11900 50 
F20 "SRU-LED" O R 5800 11800 50 
$EndSheet
Wire Wire Line
	4650 11300 4050 11300
Text Label 4050 11300 0    50   ~ 0
~WRITE-ALU-B
Wire Wire Line
	8300 2550 8800 2550
Wire Wire Line
	8300 2650 8800 2650
Text Label 8800 2550 2    50   ~ 0
~ACCPL1
Text Label 8800 2650 2    50   ~ 0
~ACCPL2
$Sheet
S 1650 13000 1150 1650
U 5D121AA3
F0 "Link Register (L)" 50
F1 "cft_reg_l_2019.sch" 50
F2 "FL" O R 2800 13150 50 
F3 "CLK4" I L 1650 13350 50 
F4 "~FLAGWE" I L 1650 13850 50 
F5 "FLCPL-ROM" I L 1650 13550 50 
F6 "IBUS12" I L 1650 13950 50 
F7 "~RSTHOLD" I L 1650 13150 50 
F8 "~ACTION-CLL" I L 1650 14250 50 
F9 "~ACTION-CPL" I L 1650 14150 50 
F10 "BCP" I L 1650 13650 50 
F11 "FLOUT-SRU" I L 1650 13750 50 
F12 "FLFAST" O R 2800 13250 50 
F13 "~SETL-ROM" I L 1650 13450 50 
F14 "FV" O R 2800 13350 50 
F15 "CLK1" I L 1650 13250 50 
F16 "IBUS13" I L 1650 14050 50 
F17 "FVOUT-ROM" I R 2800 14100 50 
F18 "~SETV-ROM" I R 2800 14000 50 
F19 "~READ-ALU-Y" I L 1650 14350 50 
F20 "~ACCPL2" I L 1650 14550 50 
F21 "~ACCPL1" I L 1650 14450 50 
$EndSheet
Wire Wire Line
	1650 14450 950  14450
Wire Wire Line
	1650 14550 950  14550
Text Label 950  14450 0    50   ~ 0
~ACCPL1
Text Label 950  14550 0    50   ~ 0
~ACCPL2
Wire Wire Line
	3900 9350 4650 9350
$Comp
L power:GND #PWR0108
U 1 1 5DC97446
P 3900 9350
F 0 "#PWR0108" H 3900 9100 50  0001 C CNN
F 1 "GND" V 3850 9400 50  0000 C CNN
F 2 "" H 3900 9350 50  0001 C CNN
F 3 "" H 3900 9350 50  0001 C CNN
	1    3900 9350
	0    1    1    0   
$EndComp
Wire Bus Line
	8300 4950 8800 4950
Text Label 8800 4950 2    50   ~ 0
FPD[0..7]
Wire Bus Line
	7150 5750 6650 5750
Text Label 6650 5750 0    50   ~ 0
DB[0..15]
Wire Bus Line
	8300 5750 8800 5750
Text Label 8800 5750 2    50   ~ 0
~IRQ[0..7]
Wire Wire Line
	6650 4800 7150 4800
Text Label 6650 4800 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	8300 5350 8800 5350
Text Label 8800 5350 2    50   ~ 0
~FPIRF
Wire Wire Line
	8300 5450 8800 5450
Text Label 8800 5450 2    50   ~ 0
~IRQ
Wire Wire Line
	8300 5550 8800 5550
Text Label 8800 5550 2    50   ~ 0
~FPIEN
Text Label 6650 5000 0    50   ~ 0
CLK2
Text Label 6650 5100 0    50   ~ 0
CLK3
Wire Bus Line
	7150 5650 6650 5650
Text Label 6650 5650 0    50   ~ 0
AB[0..15]
Wire Wire Line
	6650 5000 7150 5000
Wire Wire Line
	6650 5100 7150 5100
Wire Wire Line
	7150 5300 6650 5300
Wire Wire Line
	7150 5400 6650 5400
Wire Wire Line
	7150 5500 6650 5500
Text Label 6650 5300 0    50   ~ 0
~R
Text Label 6650 5400 0    50   ~ 0
~W
Text Label 6650 5500 0    50   ~ 0
~SYSDEV
NoConn ~ 10650 -4300
Wire Wire Line
	2800 13150 3950 13150
$Sheet
S 7150 4700 1150 1200
U 60BB0546
F0 "Interrupt Controller" 50
F1 "irc.sch" 50
F2 "FPD[0..7]" T R 8300 4950 50 
F3 "~RESET" I L 7150 4800 50 
F4 "~FPIRF" I R 8300 5350 50 
F5 "~IRQ" T R 8300 5450 50 
F6 "~FPIEN" I R 8300 5550 50 
F7 "DB[0..15]" B L 7150 5750 50 
F8 "~IRQ[0..7]" T R 8300 5750 50 
F9 "CLK2" I L 7150 5000 50 
F10 "CLK3" I L 7150 5100 50 
F11 "AB[0..15]" I L 7150 5650 50 
F12 "~SYSDEV" I L 7150 5500 50 
F13 "~R" I L 7150 5300 50 
F14 "~W" I L 7150 5400 50 
$EndSheet
Text Label 6850 -3900 0    50   ~ 0
~FPACL
Text Label 6850 -3200 0    50   ~ 0
~FPSPH
Text Label 6850 -3100 0    50   ~ 0
~FPACH
Text Label 6850 -2700 0    50   ~ 0
~FPIRF
Text Label 6850 -2800 0    50   ~ 0
~FPIEN
NoConn ~ 8900 -2700
NoConn ~ 9100 -2600
NoConn ~ 9100 -2500
NoConn ~ 9100 -2400
NoConn ~ 9100 -2300
NoConn ~ 9100 -2200
NoConn ~ 9100 -2100
NoConn ~ 9100 -2000
NoConn ~ 9100 -1900
NoConn ~ 9100 -3400
NoConn ~ 9100 -3300
NoConn ~ 9100 -3200
NoConn ~ 9100 -3100
NoConn ~ 9100 -3000
NoConn ~ 9100 -2900
NoConn ~ 9100 -2800
NoConn ~ 9100 -2700
NoConn ~ 11000 -3800
NoConn ~ 11000 -3700
NoConn ~ 11000 -3600
NoConn ~ 11000 -4100
NoConn ~ 11000 -4000
NoConn ~ 11000 -3900
NoConn ~ 11000 -4700
NoConn ~ 11000 -4600
NoConn ~ 6650 -4400
NoConn ~ 6650 -4300
NoConn ~ 6650 -2400
NoConn ~ 6650 -2300
NoConn ~ 6650 -2200
NoConn ~ 6650 -2100
Wire Wire Line
	5800 11900 6300 11900
Text Label 6300 11900 2    50   ~ 0
TC-LED
$Comp
L alexios:74HC541 U120
U 1 1 60F5843D
P 8800 11250
F 0 "U120" H 8800 12017 50  0000 C CNN
F 1 "74HC541" H 8800 11926 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8800 11250 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 8800 11250 50  0001 C CNN
	1    8800 11250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 10750 7900 10750
Wire Wire Line
	8300 10850 7900 10850
Wire Wire Line
	8300 10950 7900 10950
Wire Wire Line
	8300 11050 7900 11050
Wire Wire Line
	8300 11150 7900 11150
Wire Wire Line
	8300 11650 8250 11650
Wire Wire Line
	8250 11650 8250 11750
$Comp
L power:GND #PWR0103
U 1 1 61138048
P 8250 11800
F 0 "#PWR0103" H 8250 11550 50  0001 C CNN
F 1 "GND" H 8255 11627 50  0000 C CNN
F 2 "" H 8250 11800 50  0001 C CNN
F 3 "" H 8250 11800 50  0001 C CNN
	1    8250 11800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 11750 8250 11750
Connection ~ 8250 11750
Wire Wire Line
	8250 11750 8250 11800
Wire Wire Line
	9500 11050 9300 11050
Text Label 7900 10750 0    50   ~ 0
FL
Text Label 7900 10850 0    50   ~ 0
FV
Text Label 7900 10950 0    50   ~ 0
FZ
Text Label 7900 11150 0    50   ~ 0
TC-LED
Wire Wire Line
	5800 11800 6300 11800
Text Label 6300 11800 2    50   ~ 0
SRU-LED
Text Label 7900 11050 0    50   ~ 0
SRU-LED
$Comp
L Device:LED_ALT D?
U 1 1 6122CBB7
P 10350 10750
AR Path="/60BB0546/6122CBB7" Ref="D?"  Part="1" 
AR Path="/5D121AA3/6122CBB7" Ref="D?"  Part="1" 
AR Path="/5DF75CDE/6122CBB7" Ref="D?"  Part="1" 
AR Path="/6122CBB7" Ref="D101"  Part="1" 
F 0 "D101" H 10200 10800 50  0000 C CNN
F 1 "LED_ALT" H 10343 10586 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 10750 50  0001 C CNN
F 3 "~" H 10350 10750 50  0001 C CNN
	1    10350 10750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9850 10750 10200 10750
Wire Wire Line
	9300 10750 9650 10750
Wire Wire Line
	10500 10750 10700 10750
Wire Wire Line
	10700 10750 10700 10850
$Comp
L power:GND #PWR0101
U 1 1 612DE777
P 10700 11250
F 0 "#PWR0101" H 10700 11000 50  0001 C CNN
F 1 "GND" H 10705 11077 50  0000 C CNN
F 2 "" H 10700 11250 50  0001 C CNN
F 3 "" H 10700 11250 50  0001 C CNN
	1    10700 11250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 6131933E
P 9950 10850
AR Path="/60BB0546/6131933E" Ref="D?"  Part="1" 
AR Path="/5D121AA3/6131933E" Ref="D?"  Part="1" 
AR Path="/5DF75CDE/6131933E" Ref="D?"  Part="1" 
AR Path="/6131933E" Ref="D102"  Part="1" 
F 0 "D102" H 9800 10900 50  0000 C CNN
F 1 "LED_ALT" H 9943 10686 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 10850 50  0001 C CNN
F 3 "~" H 9950 10850 50  0001 C CNN
	1    9950 10850
	-1   0    0    1   
$EndComp
Wire Wire Line
	9500 10850 9300 10850
Wire Wire Line
	9700 10850 9800 10850
Wire Wire Line
	10100 10850 10700 10850
Connection ~ 10700 10850
Wire Wire Line
	10700 10850 10700 10950
$Comp
L Device:R_Small R?
U 1 1 613CAF7C
P 9750 10950
AR Path="/5DF75CDE/613CAF7C" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/613CAF7C" Ref="R?"  Part="1" 
AR Path="/5D121AA3/613CAF7C" Ref="R?"  Part="1" 
AR Path="/613CAF7C" Ref="R103"  Part="1" 
F 0 "R103" V 9700 10700 50  0000 R CNN
F 1 "1kΩ" V 9645 10950 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9750 10950 50  0001 C CNN
F 3 "~" H 9750 10950 50  0001 C CNN
	1    9750 10950
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 613CC13B
P 10350 10950
AR Path="/60BB0546/613CC13B" Ref="D?"  Part="1" 
AR Path="/5D121AA3/613CC13B" Ref="D?"  Part="1" 
AR Path="/5DF75CDE/613CC13B" Ref="D?"  Part="1" 
AR Path="/613CC13B" Ref="D103"  Part="1" 
F 0 "D103" H 10200 11000 50  0000 C CNN
F 1 "LED_ALT" H 10343 10786 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 10950 50  0001 C CNN
F 3 "~" H 10350 10950 50  0001 C CNN
	1    10350 10950
	-1   0    0    1   
$EndComp
Wire Wire Line
	9850 10950 10200 10950
Wire Wire Line
	9300 10950 9650 10950
$Comp
L Device:LED_ALT D?
U 1 1 614F68F0
P 9950 11050
AR Path="/60BB0546/614F68F0" Ref="D?"  Part="1" 
AR Path="/5D121AA3/614F68F0" Ref="D?"  Part="1" 
AR Path="/5DF75CDE/614F68F0" Ref="D?"  Part="1" 
AR Path="/614F68F0" Ref="D104"  Part="1" 
F 0 "D104" H 9800 11100 50  0000 C CNN
F 1 "LED_ALT" H 9943 10886 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9950 11050 50  0001 C CNN
F 3 "~" H 9950 11050 50  0001 C CNN
	1    9950 11050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 614F68F7
P 9600 11050
AR Path="/5DF75CDE/614F68F7" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/614F68F7" Ref="R?"  Part="1" 
AR Path="/5D121AA3/614F68F7" Ref="R?"  Part="1" 
AR Path="/614F68F7" Ref="R104"  Part="1" 
F 0 "R104" V 9550 10950 50  0000 R CNN
F 1 "1kΩ" V 9495 11050 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9600 11050 50  0001 C CNN
F 3 "~" H 9600 11050 50  0001 C CNN
	1    9600 11050
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 11050 9800 11050
Wire Wire Line
	10100 11050 10700 11050
Connection ~ 10700 11050
Wire Wire Line
	10700 11050 10700 11150
$Comp
L Device:R_Small R?
U 1 1 615EBB8E
P 9750 11150
AR Path="/5DF75CDE/615EBB8E" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/615EBB8E" Ref="R?"  Part="1" 
AR Path="/5D121AA3/615EBB8E" Ref="R?"  Part="1" 
AR Path="/615EBB8E" Ref="R105"  Part="1" 
F 0 "R105" V 9700 10900 50  0000 R CNN
F 1 "1kΩ" V 9645 11150 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9750 11150 50  0001 C CNN
F 3 "~" H 9750 11150 50  0001 C CNN
	1    9750 11150
	0    1    1    0   
$EndComp
$Comp
L Device:LED_ALT D?
U 1 1 615EBB94
P 10350 11150
AR Path="/60BB0546/615EBB94" Ref="D?"  Part="1" 
AR Path="/5D121AA3/615EBB94" Ref="D?"  Part="1" 
AR Path="/5DF75CDE/615EBB94" Ref="D?"  Part="1" 
AR Path="/615EBB94" Ref="D105"  Part="1" 
F 0 "D105" H 10200 11200 50  0000 C CNN
F 1 "LED_ALT" H 10343 10986 50  0001 C CNN
F 2 "alexios:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 11150 50  0001 C CNN
F 3 "~" H 10350 11150 50  0001 C CNN
	1    10350 11150
	-1   0    0    1   
$EndComp
Wire Wire Line
	9850 11150 10200 11150
Wire Wire Line
	9300 11150 9650 11150
Wire Wire Line
	10500 10950 10700 10950
Connection ~ 10700 10950
Wire Wire Line
	10700 10950 10700 11050
Wire Wire Line
	10500 11150 10700 11150
Connection ~ 10700 11150
NoConn ~ 9300 11450
NoConn ~ 9300 11350
Wire Wire Line
	8300 11350 8250 11350
Wire Wire Line
	8250 11350 8250 11450
Connection ~ 8250 11650
Wire Wire Line
	8300 11450 8250 11450
Connection ~ 8250 11450
Wire Wire Line
	8250 11450 8250 11650
Wire Wire Line
	10700 11150 10700 11250
NoConn ~ 9300 11250
Wire Wire Line
	8300 11250 8250 11250
Wire Wire Line
	8250 11250 8250 11350
Connection ~ 8250 11350
$Comp
L Device:R_Small R?
U 1 1 612689D7
P 9600 10850
AR Path="/5DF75CDE/612689D7" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/612689D7" Ref="R?"  Part="1" 
AR Path="/5D121AA3/612689D7" Ref="R?"  Part="1" 
AR Path="/612689D7" Ref="R102"  Part="1" 
F 0 "R102" V 9550 10750 50  0000 R CNN
F 1 "1kΩ" V 9495 10850 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9600 10850 50  0001 C CNN
F 3 "~" H 9600 10850 50  0001 C CNN
	1    9600 10850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 6122CBB1
P 9750 10750
AR Path="/5DF75CDE/6122CBB1" Ref="R?"  Part="1" 
AR Path="/5DF75CDE/5EF12B5A/6122CBB1" Ref="R?"  Part="1" 
AR Path="/5D121AA3/6122CBB1" Ref="R?"  Part="1" 
AR Path="/6122CBB1" Ref="R101"  Part="1" 
F 0 "R101" V 9700 10500 50  0000 R CNN
F 1 "1kΩ" V 9645 10750 50  0000 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9750 10750 50  0001 C CNN
F 3 "~" H 9750 10750 50  0001 C CNN
	1    9750 10750
	0    1    1    0   
$EndComp
$Comp
L alexios:74HC541 U120
U 2 1 619C88C2
P 10000 11700
F 0 "U120" H 10180 11746 50  0000 L CNN
F 1 "74HC541" H 10180 11655 50  0000 L CNN
F 2 "" H 10000 11700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 10000 11700 50  0001 C CNN
	2    10000 11700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 619CDBA8
P 9650 11700
AR Path="/5CC0D65F/619CDBA8" Ref="C?"  Part="1" 
AR Path="/619CDBA8" Ref="C120"  Part="1" 
AR Path="/5F597FD4/619CDBA8" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/619CDBA8" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/619CDBA8" Ref="C?"  Part="1" 
AR Path="/5DC89E19/619CDBA8" Ref="C?"  Part="1" 
AR Path="/5DC89E19/5D98F946/619CDBA8" Ref="C?"  Part="1" 
AR Path="/5D121AA3/619CDBA8" Ref="C?"  Part="1" 
AR Path="/5E1C970B/619CDBA8" Ref="C?"  Part="1" 
F 0 "C120" H 9559 11746 50  0000 R CNN
F 1 "100nF" H 9559 11655 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9650 11700 50  0001 C CNN
F 3 "~" H 9650 11700 50  0001 C CNN
	1    9650 11700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0177
U 1 1 619CDBAE
P 9650 11800
AR Path="/619CDBAE" Ref="#PWR0177"  Part="1" 
AR Path="/5F597FD4/619CDBAE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/619CDBAE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/619CDBAE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/619CDBAE" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/619CDBAE" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/619CDBAE" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/619CDBAE" Ref="#PWR?"  Part="1" 
F 0 "#PWR0177" H 9650 11550 50  0001 C CNN
F 1 "GND" H 9655 11627 50  0000 C CNN
F 2 "" H 9650 11800 50  0001 C CNN
F 3 "" H 9650 11800 50  0001 C CNN
	1    9650 11800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0178
U 1 1 619CDBB4
P 9650 11600
AR Path="/619CDBB4" Ref="#PWR0178"  Part="1" 
AR Path="/5F597FD4/619CDBB4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF23BD4/619CDBB4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5CF5A95E/619CDBB4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/619CDBB4" Ref="#PWR?"  Part="1" 
AR Path="/5DC89E19/5D98F946/619CDBB4" Ref="#PWR?"  Part="1" 
AR Path="/5D121AA3/619CDBB4" Ref="#PWR?"  Part="1" 
AR Path="/5E1C970B/619CDBB4" Ref="#PWR?"  Part="1" 
F 0 "#PWR0178" H 9650 11450 50  0001 C CNN
F 1 "+5V" H 9665 11773 50  0000 C CNN
F 2 "" H 9650 11600 50  0001 C CNN
F 3 "" H 9650 11600 50  0001 C CNN
	1    9650 11600
	1    0    0    -1  
$EndComp
Connection ~ 9650 11600
Connection ~ 9650 11800
NoConn ~ 6650 -4500
$Comp
L Device:CP_Small C113
U 1 1 62FAE633
P 9450 16550
AR Path="/62FAE633" Ref="C113"  Part="1" 
AR Path="/5D34E810/62FAE633" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE633" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE633" Ref="C?"  Part="1" 
F 0 "C113" H 9362 16596 50  0000 R CNN
F 1 "47µF" H 9362 16505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9450 16550 50  0001 C CNN
F 3 "~" H 9450 16550 50  0001 C CNN
	1    9450 16550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 16650 9450 16750
Wire Wire Line
	9450 16350 9450 16450
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 9450 16750
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0135"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0135" H 9450 16500 50  0001 C CNN
F 1 "GND" H 9372 16713 50  0000 R CNN
F 2 "" H 9450 16750 50  0001 C CNN
F 3 "" H 9450 16750 50  0001 C CNN
	1    9450 16750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 9450 16350
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0132"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0132" H 9450 16200 50  0001 C CNN
F 1 "+5V" H 9392 16387 50  0000 R CNN
F 2 "" H 9450 16350 50  0001 C CNN
F 3 "" H 9450 16350 50  0001 C CNN
	1    9450 16350
	1    0    0    -1  
$EndComp
Wire Bus Line
	6400 8750 6400 12000
Wire Bus Line
	-2850 -6100 -2850 -5450
$EndSCHEMATC
