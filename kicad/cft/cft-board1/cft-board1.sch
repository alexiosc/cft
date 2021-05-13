EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
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
S -10250 550  1150 1900
U 5E1C970B
F0 "Decoders" 50
F1 "alu_decoder.sch" 50
F2 "RADDR[0..4]" I L -10250 900 50 
F3 "WADDR[0..4]" I L -10250 1000 50 
F4 "T34" I L -10250 800 50 
F5 "ACTION[0..4]" I L -10250 1100 50 
F6 "ACP" O L -10250 1400 50 
F7 "CLK4" I L -10250 700 50 
F8 "~DECSP" O R -9100 2300 50 
F9 "~INCSP" O R -9100 2200 50 
F10 "~DECAC" O R -9100 1800 50 
F11 "~INCAC" O R -9100 1700 50 
F12 "~READ-SP" O R -9100 2000 50 
F13 "~WRITE-SP" O R -9100 2100 50 
F14 "~WRITE-AC" O R -9100 1600 50 
F15 "~ACTION-SRU" O R -9100 1300 50 
F16 "~ACTION-CLL" O R -9100 1200 50 
F17 "~ACTION-CPL" O R -9100 1100 50 
F18 "~READ-AC" O R -9100 1500 50 
F19 "~READ-ALU-B" O R -9100 900 50 
F20 "~READ-ALU-Y" O R -9100 800 50 
F21 "~ALU-OP" O R -9100 700 50 
F22 "~WRITE-ALU-B" O R -9100 1000 50 
$EndSheet
$Sheet
S -10250 3500 1150 450 
U 5DE6D8E0
F0 "Port A" 50
F1 "alu_port_a.sch" 50
F2 "A[0..15]" T R -9100 3650 50 
F3 "ACP" I L -10250 3650 50 
F4 "AC[0..15]" I L -10250 3800 50 
$EndSheet
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
Text Notes 700  -6550 0    197  ~ 39
Decoders
Wire Wire Line
	1250 -4800 900  -4800
Wire Wire Line
	1250 -4700 900  -4700
Wire Wire Line
	1250 -3350 900  -3350
Wire Wire Line
	1250 -3250 900  -3250
Wire Wire Line
	1250 -3950 900  -3950
Wire Wire Line
	1250 -3850 900  -3850
Wire Wire Line
	1250 -3750 900  -3750
Text Notes 1800 -3250 1    50   ~ 10
WADDR=010xx
Text Label 950  -4800 0    50   ~ 0
RADDR3
Text Label 950  -4700 0    50   ~ 0
RADDR4
Text Label 950  -3950 0    50   ~ 0
WADDR0
Text Label 950  -3850 0    50   ~ 0
WADDR1
Text Label 950  -3750 0    50   ~ 0
WADDR2
Text Label 950  -3250 0    50   ~ 0
WADDR4
Text Label 950  -3350 0    50   ~ 0
WADDR3
Entry Wire Line
	800  -4900 900  -4800
Entry Wire Line
	800  -4800 900  -4700
Entry Wire Line
	800  -4050 900  -3950
Entry Wire Line
	800  -3950 900  -3850
Entry Wire Line
	800  -3850 900  -3750
Entry Wire Line
	800  -3450 900  -3350
Entry Wire Line
	800  -3350 900  -3250
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
Text Label 800  -3450 1    50   ~ 0
WADDR[4..0]
Wire Wire Line
	2250 -3950 2850 -3950
Wire Wire Line
	2250 -3850 2850 -3850
Text Label 2850 -3950 2    50   ~ 0
~WRITE-PC
Text Label 800  -6050 0    50   ~ 0
~RESET
Wire Wire Line
	1350 -6050 800  -6050
$Comp
L alexios:74LVC1G04 U101
U 1 1 5DAE39EC
P 1650 -6050
F 0 "U101" H 1600 -5783 50  0000 C CNN
F 1 "74LVC1G04" H 1600 -5874 50  0000 C CNN
F 2 "alexios:SOT-23-5_HandSoldering" H 1650 -6050 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74LVC1G04.pdf" H 1650 -6050 50  0001 C CNN
	1    1650 -6050
	1    0    0    -1  
$EndComp
Text Label 2350 -6050 2    50   ~ 0
RESET
Wire Wire Line
	1850 -6050 2350 -6050
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
Text Label 1250 -3150 2    50   ~ 0
CLK4'
Text Notes 1500 -700 0    50   ~ 0
The '193 counters used here treat these as clocks\nand increment/decrement on the signals' rising edge.\nThis tends to be too late in the processor cycle. We can\nadvance the action by using CLK3. Current microcode\ndoesn't use it, but this also fixes a potential bug that\nwould prohibit incrementing a register twice in contiguous\nprocessor cycles.
Wire Wire Line
	1000 -4600 900  -4600
Wire Wire Line
	900  -4600 900  -4550
$Comp
L power:GND #PWR0101
U 1 1 5D9C912E
P 900 -4550
F 0 "#PWR0101" H 900 -4800 50  0001 C CNN
F 1 "GND" H 905 -4723 50  0000 C CNN
F 2 "" H 900 -4550 50  0001 C CNN
F 3 "" H 900 -4550 50  0001 C CNN
	1    900  -4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 -4600 1250 -4600
$Comp
L Device:Jumper_NC_Small JP101
U 1 1 60284772
P 1100 -4600
F 0 "JP101" H 1100 -4693 50  0000 C CNN
F 1 "Jumper_NC_Small" H 1100 -4479 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 1100 -4600 50  0001 C CNN
F 3 "~" H 1100 -4600 50  0001 C CNN
	1    1100 -4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  -3350 250  -3350
$Comp
L power:GND #PWR0103
U 1 1 5EEF256F
P 650 -2950
F 0 "#PWR0103" H 650 -3200 50  0001 C CNN
F 1 "GND" H 655 -3123 50  0000 C CNN
F 2 "" H 650 -2950 50  0001 C CNN
F 3 "" H 650 -2950 50  0001 C CNN
	1    650  -2950
	1    0    0    -1  
$EndComp
Text Label 250  -3350 0    50   ~ 0
CLK4
Text Notes 850  -2750 0    50   ~ 0
1-2: Normal Operation\n2-3: Standalone REG Board Testing
$Comp
L Jumper:SolderJumper_3_Open JP102
U 1 1 5EF00BEB
P 650 -3150
F 0 "JP102" V 650 -3082 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 695 -3083 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 650 -3150 50  0001 C CNN
F 3 "~" H 650 -3150 50  0001 C CNN
	1    650  -3150
	0    -1   1    0   
$EndComp
Wire Wire Line
	800  -3150 1250 -3150
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P -2400 8500
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0132"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0132" H -2400 8350 50  0001 C CNN
F 1 "+5V" H -2458 8537 50  0000 R CNN
F 2 "" H -2400 8500 50  0001 C CNN
F 3 "" H -2400 8500 50  0001 C CNN
	1    -2400 8500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P -2400 8900
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0135"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0135" H -2400 8650 50  0001 C CNN
F 1 "GND" H -2478 8863 50  0000 R CNN
F 2 "" H -2400 8900 50  0001 C CNN
F 3 "" H -2400 8900 50  0001 C CNN
	1    -2400 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2400 8500 -2400 8600
Wire Wire Line
	-2400 8800 -2400 8900
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P -2850 8500
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0131"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0131" H -2850 8350 50  0001 C CNN
F 1 "+5V" H -2908 8537 50  0000 R CNN
F 2 "" H -2850 8500 50  0001 C CNN
F 3 "" H -2850 8500 50  0001 C CNN
	1    -2850 8500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62FAE635
P -2850 8900
AR Path="/5F67D4B5/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/62FAE635" Ref="#PWR0134"  Part="1" 
AR Path="/5D34E810/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/62FAE635" Ref="#PWR?"  Part="1" 
F 0 "#PWR0134" H -2850 8650 50  0001 C CNN
F 1 "GND" H -2928 8863 50  0000 R CNN
F 2 "" H -2850 8900 50  0001 C CNN
F 3 "" H -2850 8900 50  0001 C CNN
	1    -2850 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2850 8500 -2850 8600
Wire Wire Line
	-2850 8800 -2850 8900
$Comp
L power:+5V #PWR?
U 1 1 5EFD0815
P -1950 8500
AR Path="/5F67D4B5/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5EFD0815" Ref="#PWR0133"  Part="1" 
AR Path="/5D34E810/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0815" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD0815" Ref="#PWR?"  Part="1" 
F 0 "#PWR0133" H -1950 8350 50  0001 C CNN
F 1 "+5V" H -2008 8537 50  0000 R CNN
F 2 "" H -1950 8500 50  0001 C CNN
F 3 "" H -1950 8500 50  0001 C CNN
	1    -1950 8500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFD081B
P -1950 8900
AR Path="/5F67D4B5/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5EFD081B" Ref="#PWR0136"  Part="1" 
AR Path="/5D34E810/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5EFD081B" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5EFD081B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0136" H -1950 8650 50  0001 C CNN
F 1 "GND" H -2028 8863 50  0000 R CNN
F 2 "" H -1950 8900 50  0001 C CNN
F 3 "" H -1950 8900 50  0001 C CNN
	1    -1950 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1950 8500 -1950 8600
Wire Wire Line
	-1950 8800 -1950 8900
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
$Comp
L Device:R_Small R110
U 1 1 601C6ACC
P -1950 -4150
F 0 "R110" V -2000 -4000 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4300 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4150 50  0001 C CNN
F 3 "~" H -1950 -4150 50  0001 C CNN
	1    -1950 -4150
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R109
U 1 1 601C6AC6
P -1950 -4250
F 0 "R109" V -2000 -4100 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4400 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4250 50  0001 C CNN
F 3 "~" H -1950 -4250 50  0001 C CNN
	1    -1950 -4250
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R108
U 1 1 601B696E
P -1950 -4350
F 0 "R108" V -2000 -4200 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4500 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4350 50  0001 C CNN
F 3 "~" H -1950 -4350 50  0001 C CNN
	1    -1950 -4350
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R107
U 1 1 601B6968
P -1950 -4450
F 0 "R107" V -2000 -4300 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4600 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4450 50  0001 C CNN
F 3 "~" H -1950 -4450 50  0001 C CNN
	1    -1950 -4450
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R106
U 1 1 601A6784
P -1950 -4550
F 0 "R106" V -2000 -4400 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4700 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4550 50  0001 C CNN
F 3 "~" H -1950 -4550 50  0001 C CNN
	1    -1950 -4550
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R105
U 1 1 601A677E
P -1950 -4650
F 0 "R105" V -2000 -4500 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4800 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4650 50  0001 C CNN
F 3 "~" H -1950 -4650 50  0001 C CNN
	1    -1950 -4650
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R104
U 1 1 60196662
P -1950 -4750
F 0 "R104" V -2000 -4600 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -4900 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4750 50  0001 C CNN
F 3 "~" H -1950 -4750 50  0001 C CNN
	1    -1950 -4750
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R103
U 1 1 6019665C
P -1950 -4850
F 0 "R103" V -2000 -4700 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -5000 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -4850 50  0001 C CNN
F 3 "~" H -1950 -4850 50  0001 C CNN
	1    -1950 -4850
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R102
U 1 1 60185C13
P -1950 -5050
F 0 "R102" V -2000 -4900 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -5200 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -5050 50  0001 C CNN
F 3 "~" H -1950 -5050 50  0001 C CNN
	1    -1950 -5050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R101
U 1 1 6018580D
P -1950 -5150
F 0 "R101" V -2000 -5000 50  0000 C CNN
F 1 "4.7kΩ" V -2050 -5300 50  0001 C CNN
F 2 "alexios:R_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H -1950 -5150 50  0001 C CNN
F 3 "~" H -1950 -5150 50  0001 C CNN
	1    -1950 -5150
	0    -1   1    0   
$EndComp
Wire Wire Line
	-3300 -5050 -2050 -5050
Wire Wire Line
	-3300 -5150 -2050 -5150
Wire Wire Line
	-3300 -4850 -2050 -4850
Wire Wire Line
	-3300 -4750 -2050 -4750
Wire Wire Line
	-3300 -4650 -2050 -4650
Wire Wire Line
	-3300 -4550 -2050 -4550
Wire Wire Line
	-3300 -4450 -2050 -4450
Wire Wire Line
	-3300 -4350 -2050 -4350
Wire Wire Line
	-3300 -4250 -2050 -4250
Wire Wire Line
	-3300 -4150 -2050 -4150
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
P -1950 8700
AR Path="/5EFD0822" Ref="C114"  Part="1" 
AR Path="/5D34E810/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5EFD0822" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5EFD0822" Ref="C?"  Part="1" 
F 0 "C114" H -2038 8746 50  0000 R CNN
F 1 "47µF" H -2038 8655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1950 8700 50  0001 C CNN
F 3 "~" H -1950 8700 50  0001 C CNN
	1    -1950 8700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C113
U 1 1 62FAE633
P -2400 8700
AR Path="/62FAE633" Ref="C113"  Part="1" 
AR Path="/5D34E810/62FAE633" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE633" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE633" Ref="C?"  Part="1" 
F 0 "C113" H -2488 8746 50  0000 R CNN
F 1 "47µF" H -2488 8655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2400 8700 50  0001 C CNN
F 3 "~" H -2400 8700 50  0001 C CNN
	1    -2400 8700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C112
U 1 1 62FAE636
P -2850 8700
AR Path="/62FAE636" Ref="C112"  Part="1" 
AR Path="/5D34E810/62FAE636" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE636" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE636" Ref="C?"  Part="1" 
F 0 "C112" H -2938 8746 50  0000 R CNN
F 1 "47µF" H -2938 8655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2850 8700 50  0001 C CNN
F 3 "~" H -2850 8700 50  0001 C CNN
	1    -2850 8700
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
AR Path="/6084E503" Ref="#PWR0111"  Part="1" 
AR Path="/5D34E810/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E503" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H -1650 5200 50  0001 C CNN
F 1 "+5V" H -1708 5387 50  0000 R CNN
F 2 "" H -1650 5350 50  0001 C CNN
F 3 "" H -1650 5350 50  0001 C CNN
	1    -1650 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62FAE629
P -1650 5750
AR Path="/5F67D4B5/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/62FAE629" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE629" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H -1650 5500 50  0001 C CNN
F 1 "GND" H -1728 5713 50  0000 R CNN
F 2 "" H -1650 5750 50  0001 C CNN
F 3 "" H -1650 5750 50  0001 C CNN
	1    -1650 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 5350 -1650 5450
$Comp
L Device:CP_Small C103
U 1 1 6084E505
P -1650 5550
AR Path="/6084E505" Ref="C103"  Part="1" 
AR Path="/5D34E810/6084E505" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6084E505" Ref="C?"  Part="1" 
F 0 "C103" H -1738 5596 50  0000 R CNN
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
AR Path="/6084E506" Ref="#PWR0110"  Part="1" 
AR Path="/5D34E810/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E506" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E506" Ref="#PWR?"  Part="1" 
F 0 "#PWR0110" H -2100 5200 50  0001 C CNN
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
AR Path="/6084E507" Ref="#PWR0113"  Part="1" 
AR Path="/5D34E810/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E507" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E507" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H -2100 5500 50  0001 C CNN
F 1 "GND" H -2178 5713 50  0000 R CNN
F 2 "" H -2100 5750 50  0001 C CNN
F 3 "" H -2100 5750 50  0001 C CNN
	1    -2100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 5350 -2100 5450
$Comp
L Device:CP_Small C102
U 1 1 5D8C8453
P -2100 5550
AR Path="/5D8C8453" Ref="C102"  Part="1" 
AR Path="/5D34E810/5D8C8453" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5D8C8453" Ref="C?"  Part="1" 
F 0 "C102" H -2188 5596 50  0000 R CNN
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
Text Label -10800 900  0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	-10250 900  -10800 900 
Wire Wire Line
	-10800 800  -10250 800 
Text Label -10800 800  0    50   ~ 0
T34
Text Label -10800 1000 0    50   ~ 0
WADDR[0..4]
Wire Bus Line
	-10250 1000 -10800 1000
Text Label -10800 1100 0    50   ~ 0
ACTION[0..3]
Wire Bus Line
	-10250 1100 -10800 1100
Wire Wire Line
	-9100 1000 -8550 1000
Text Label -8550 900  2    50   ~ 0
~READ-ALU-B
Text Label -8550 1000 2    50   ~ 0
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
Text Label -9000 3650 0    50   ~ 0
A[0..15]
Text Notes -11400 4000 2    100  ~ 20
Ports
Wire Wire Line
	-10900 5300 -10200 5300
Wire Wire Line
	-10900 5450 -10200 5450
Wire Wire Line
	-10900 6200 -10200 6200
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
Text Label -8550 700  2    50   ~ 0
~ALU-OP
Text Label -8550 1200 2    50   ~ 0
~ACTION-CLL
Text Label -8550 1100 2    50   ~ 0
~ACTION-CPL
Wire Wire Line
	-9100 1200 -8550 1200
Text Label -8550 1300 2    50   ~ 0
~ACTION-SRU
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
	-9100 1100 -8550 1100
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
AR Path="/5DC7BFB4" Ref="JP103"  Part="1" 
F 0 "JP103" H -8100 1613 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H -8100 1614 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H -8100 1500 50  0001 C CNN
F 3 "~" H -8100 1500 50  0001 C CNN
	1    -8100 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5DC97446
P -8250 1550
F 0 "#PWR0108" H -8250 1300 50  0001 C CNN
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
AR Path="/5DCFA7A8" Ref="TP105"  Part="1" 
F 0 "TP105" V -3400 5738 50  0000 L CNN
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
L Connector:TestPoint TP103
U 1 1 5DD216FF
P -2950 2900
F 0 "TP103" V -2950 3088 50  0000 L CNN
F 1 "TestPoint" V -2905 3088 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2750 2900 50  0001 C CNN
F 3 "~" H -2750 2900 50  0001 C CNN
	1    -2950 2900
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP101
U 1 1 5DCAA8B1
P -2650 2500
F 0 "TP101" V -2650 2688 50  0000 L CNN
F 1 "TestPoint" V -2605 2688 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2450 2500 50  0001 C CNN
F 3 "~" H -2450 2500 50  0001 C CNN
	1    -2650 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	-3000 2900 -2950 2900
$Comp
L Connector:TestPoint TP102
U 1 1 5DCF8FE6
P -2950 2700
F 0 "TP102" V -2950 2888 50  0000 L CNN
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
L Connector:TestPoint TP104
U 1 1 5DE16EEE
P -2950 3000
F 0 "TP104" V -2950 3188 50  0000 L CNN
F 1 "TestPoint" V -2905 3188 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H -2750 3000 50  0001 C CNN
F 3 "~" H -2750 3000 50  0001 C CNN
	1    -2950 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R111
U 1 1 5DCC470D
P -8800 5150
F 0 "R111" V -8996 5150 50  0000 C CNN
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
	-9100 900  -8550 900 
Text Label -8550 800  2    50   ~ 0
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
	-10250 1400 -10400 1400
Wire Wire Line
	-10400 1400 -10400 3650
Wire Wire Line
	-10400 3650 -10250 3650
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
	-9100 700  -8550 700 
Wire Wire Line
	-9100 800  -8550 800 
Wire Wire Line
	-7700 1150 -7200 1150
Wire Wire Line
	-7700 1250 -7200 1250
Wire Wire Line
	-9100 1300 -8550 1300
Text Notes -12000 -750 0    197  ~ 39
The ALU
Text Notes -11950 350  0    50   ~ 0
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
	-10800 700  -10250 700 
Text Label -10800 700  0    50   ~ 0
CLK4
$Comp
L power:+5V #PWR?
U 1 1 5F91D04D
P -2550 5350
AR Path="/5F67D4B5/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F91D04D" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D04D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H -2550 5200 50  0001 C CNN
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
AR Path="/5F91D053" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D053" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H -2550 5500 50  0001 C CNN
F 1 "GND" H -2628 5713 50  0000 R CNN
F 2 "" H -2550 5750 50  0001 C CNN
F 3 "" H -2550 5750 50  0001 C CNN
	1    -2550 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 5350 -2550 5450
$Comp
L Device:CP_Small C101
U 1 1 5F91D05A
P -2550 5550
AR Path="/5F91D05A" Ref="C101"  Part="1" 
AR Path="/5D34E810/5F91D05A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5F91D05A" Ref="C?"  Part="1" 
F 0 "C101" H -2638 5596 50  0000 R CNN
F 1 "47µF" H -2638 5505 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2550 5550 50  0001 C CNN
F 3 "~" H -2550 5550 50  0001 C CNN
	1    -2550 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 5650 -2550 5750
Wire Wire Line
	-4250 7000 -4250 7100
$Comp
L Device:CP_Small C107
U 1 1 62FAE630
P -4250 6900
AR Path="/62FAE630" Ref="C107"  Part="1" 
AR Path="/5D34E810/62FAE630" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE630" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE630" Ref="C?"  Part="1" 
F 0 "C107" H -4338 6946 50  0000 R CNN
F 1 "47µF" H -4338 6855 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -4250 6900 50  0001 C CNN
F 3 "~" H -4250 6900 50  0001 C CNN
	1    -4250 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4250 6700 -4250 6800
$Comp
L power:GND #PWR?
U 1 1 62FAE62F
P -4250 7100
AR Path="/5F67D4B5/62FAE62F" Ref="#PWR?"  Part="1" 
AR Path="/62FAE62F" Ref="#PWR0126"  Part="1" 
AR Path="/5D34E810/62FAE62F" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE62F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE62F" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/62FAE62F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0126" H -4250 6850 50  0001 C CNN
F 1 "GND" H -4328 7063 50  0000 R CNN
F 2 "" H -4250 7100 50  0001 C CNN
F 3 "" H -4250 7100 50  0001 C CNN
	1    -4250 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 62FAE62E
P -4250 6700
AR Path="/5F67D4B5/62FAE62E" Ref="#PWR?"  Part="1" 
AR Path="/62FAE62E" Ref="#PWR0121"  Part="1" 
AR Path="/5D34E810/62FAE62E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE62E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE62E" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/62FAE62E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0121" H -4250 6550 50  0001 C CNN
F 1 "+5V" H -4308 6737 50  0000 R CNN
F 2 "" H -4250 6700 50  0001 C CNN
F 3 "" H -4250 6700 50  0001 C CNN
	1    -4250 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3800 7000 -3800 7100
$Comp
L Device:CP_Small C108
U 1 1 62FAE62D
P -3800 6900
AR Path="/62FAE62D" Ref="C108"  Part="1" 
AR Path="/5D34E810/62FAE62D" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE62D" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE62D" Ref="C?"  Part="1" 
F 0 "C108" H -3888 6946 50  0000 R CNN
F 1 "47µF" H -3888 6855 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -3800 6900 50  0001 C CNN
F 3 "~" H -3800 6900 50  0001 C CNN
	1    -3800 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3800 6700 -3800 6800
$Comp
L power:GND #PWR?
U 1 1 62FAE62C
P -3800 7100
AR Path="/5F67D4B5/62FAE62C" Ref="#PWR?"  Part="1" 
AR Path="/62FAE62C" Ref="#PWR0127"  Part="1" 
AR Path="/5D34E810/62FAE62C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE62C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE62C" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/62FAE62C" Ref="#PWR?"  Part="1" 
F 0 "#PWR0127" H -3800 6850 50  0001 C CNN
F 1 "GND" H -3878 7063 50  0000 R CNN
F 2 "" H -3800 7100 50  0001 C CNN
F 3 "" H -3800 7100 50  0001 C CNN
	1    -3800 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P -3800 6700
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR0122"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR0122" H -3800 6550 50  0001 C CNN
F 1 "+5V" H -3858 6737 50  0000 R CNN
F 2 "" H -3800 6700 50  0001 C CNN
F 3 "" H -3800 6700 50  0001 C CNN
	1    -3800 6700
	1    0    0    -1  
$EndComp
Text Notes 7050 1550 0    197  ~ 39
Registers
Text Label 6650 2100 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7150 2100 6650 2100
Text Label 6650 3400 0    50   ~ 0
IBUS[0..15]
Wire Bus Line
	7150 3400 6650 3400
Text Label 6650 2300 0    50   ~ 0
~READ-AC
Text Label 6650 2400 0    50   ~ 0
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
~READ-DR
Text Label 6650 3700 0    50   ~ 0
~WRITE-DR
Wire Bus Line
	8300 2500 8800 2500
Text Label 8800 2500 2    50   ~ 0
FPD[0..7]
Wire Wire Line
	8300 2300 8800 2300
Wire Wire Line
	8300 2400 8800 2400
Text Label 8800 2300 2    50   ~ 0
~FPACH
Text Label 8800 2400 2    50   ~ 0
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
~FPDRH
Text Label 8800 3800 2    50   ~ 0
~FPDRL
Wire Bus Line
	8300 2100 8800 2100
Text Label 8800 2100 2    50   ~ 0
AC[0..15]
Wire Wire Line
	7150 2500 6650 2500
Wire Wire Line
	7150 2400 6650 2400
Wire Wire Line
	7150 2300 6650 2300
Text Label 6650 3900 0    50   ~ 0
~DECDR
Text Label 6650 3800 0    50   ~ 0
~INCDR
Text Label 6650 2500 0    50   ~ 0
~INCAC
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
Wire Wire Line
	23600 450  23950 450 
Wire Wire Line
	23600 350  23950 350 
Wire Wire Line
	23600 250  23950 250 
Wire Wire Line
	23600 150  23950 150 
Wire Wire Line
	23600 50   23950 50  
Wire Wire Line
	23600 -50  23950 -50 
Wire Wire Line
	23600 -150 23950 -150
Wire Wire Line
	23600 -250 23950 -250
Wire Wire Line
	23600 -350 23950 -350
Wire Wire Line
	23600 -450 23950 -450
Wire Wire Line
	23600 -550 23950 -550
Wire Wire Line
	23600 -650 23950 -650
Wire Wire Line
	23600 -750 23950 -750
Wire Wire Line
	23600 -850 23950 -850
Wire Wire Line
	23600 -950 23950 -950
Wire Wire Line
	23600 -1050 23950 -1050
Wire Wire Line
	23600 -1250 23950 -1250
Wire Wire Line
	23600 -1350 23950 -1350
Wire Wire Line
	23600 -1450 23950 -1450
Wire Wire Line
	23600 -1550 23950 -1550
Wire Wire Line
	23600 -1650 23950 -1650
Wire Wire Line
	23600 -1750 23950 -1750
Wire Wire Line
	23600 -1850 23950 -1850
Wire Wire Line
	23600 -1950 23950 -1950
Wire Wire Line
	23600 -2050 23950 -2050
Wire Wire Line
	23600 -2250 23950 -2250
Wire Wire Line
	23600 -2350 23950 -2350
Wire Wire Line
	23600 -2450 23950 -2450
Wire Wire Line
	23600 -2550 23950 -2550
Wire Wire Line
	22050 1150 22400 1150
Wire Wire Line
	22050 1050 22400 1050
Wire Wire Line
	22050 950  22400 950 
Wire Wire Line
	22050 850  22400 850 
Wire Wire Line
	22050 750  22400 750 
Wire Wire Line
	22050 650  22400 650 
Wire Wire Line
	22050 550  22400 550 
Wire Wire Line
	22050 450  22400 450 
Wire Wire Line
	22050 250  22400 250 
Wire Wire Line
	22050 150  22400 150 
Wire Wire Line
	22050 50   22400 50  
Wire Wire Line
	22050 -50  22400 -50 
Wire Wire Line
	22050 -150 22400 -150
Wire Wire Line
	22050 -250 22400 -250
Wire Wire Line
	22050 -350 22400 -350
Wire Wire Line
	22050 -450 22400 -450
Wire Wire Line
	22050 -550 22400 -550
Wire Wire Line
	22050 -650 22400 -650
Wire Wire Line
	22050 -750 22400 -750
Wire Wire Line
	22050 -850 22400 -850
Wire Wire Line
	22050 -950 22400 -950
Wire Wire Line
	22050 -1050 22400 -1050
Wire Wire Line
	22050 -1150 22400 -1150
Wire Wire Line
	22050 -1250 22400 -1250
Wire Wire Line
	22050 -1350 22400 -1350
Wire Wire Line
	22050 -1450 22400 -1450
Wire Wire Line
	22050 -1550 22400 -1550
Wire Wire Line
	22050 -1650 22400 -1650
Wire Wire Line
	22050 -1750 22400 -1750
Wire Wire Line
	22050 -1850 22400 -1850
Wire Wire Line
	22050 -1950 22400 -1950
Wire Wire Line
	22050 -2250 22400 -2250
Wire Wire Line
	22050 -2350 22400 -2350
Wire Wire Line
	21500 -1850 21850 -1850
Wire Wire Line
	21500 -1950 21850 -1950
Wire Wire Line
	21500 -2150 21850 -2150
Wire Wire Line
	21500 -2250 21850 -2250
Wire Wire Line
	21500 -2350 21850 -2350
Wire Wire Line
	21500 -2450 21850 -2450
Wire Wire Line
	21500 -2550 21850 -2550
Wire Wire Line
	21850 -550 21500 -550
Wire Wire Line
	21850 -650 21500 -650
Wire Wire Line
	21850 -750 21500 -750
Wire Wire Line
	21850 -850 21500 -850
Wire Wire Line
	21850 -950 21500 -950
Wire Wire Line
	21850 -1050 21500 -1050
Wire Wire Line
	21850 -1150 21500 -1150
Wire Wire Line
	21850 -1250 21500 -1250
Text Label 21850 -2550 2    50   ~ 0
FPD0
Text Label 21850 -2450 2    50   ~ 0
FPD1
Text Label 21850 -2350 2    50   ~ 0
FPD2
Text Label 21850 -2250 2    50   ~ 0
FPD3
Text Label 21850 -2150 2    50   ~ 0
FPD4
Text Label 21850 -2050 2    50   ~ 0
FPD5
Text Label 21850 -1950 2    50   ~ 0
FPD6
Text Label 21850 -1850 2    50   ~ 0
FPD7
$Comp
L power:GND #PWR0107
U 1 1 62FAE63D
P 23700 1250
F 0 "#PWR0107" H 23700 1000 50  0001 C CNN
F 1 "GND" H 23705 1077 50  0000 C CNN
F 2 "" H 23700 1250 50  0001 C CNN
F 3 "" H 23700 1250 50  0001 C CNN
	1    23700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	23600 1150 23700 1150
Wire Wire Line
	23700 1150 23700 1250
Text Label 23950 -1050 2    50   ~ 0
DB0
Text Label 23950 -950 2    50   ~ 0
DB1
Text Label 23950 -850 2    50   ~ 0
DB2
Text Label 23950 -750 2    50   ~ 0
DB3
Text Label 23950 -650 2    50   ~ 0
DB4
Text Label 23950 -550 2    50   ~ 0
DB5
Text Label 23950 -450 2    50   ~ 0
DB6
Text Label 23950 -350 2    50   ~ 0
DB7
Text Label 23950 -250 2    50   ~ 0
DB8
Text Label 23950 -150 2    50   ~ 0
DB9
Text Label 23950 -50  2    50   ~ 0
DB10
Text Label 23950 50   2    50   ~ 0
DB11
Text Label 23950 150  2    50   ~ 0
DB12
Text Label 23950 250  2    50   ~ 0
DB13
Text Label 23950 350  2    50   ~ 0
DB14
Text Label 23950 450  2    50   ~ 0
DB15
$Comp
L power:+5V #PWR0105
U 1 1 62FAE63E
P 22350 -2600
F 0 "#PWR0105" H 22350 -2750 50  0001 C CNN
F 1 "+5V" H 22365 -2427 50  0000 C CNN
F 2 "" H 22350 -2600 50  0001 C CNN
F 3 "" H 22350 -2600 50  0001 C CNN
	1    22350 -2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	22400 -2550 22350 -2550
Wire Wire Line
	22350 -2550 22350 -2600
Text Label 21850 -1250 2    50   ~ 0
IR0
Text Label 21850 -1150 2    50   ~ 0
IR1
Text Label 21850 -1050 2    50   ~ 0
IR2
Text Label 21850 -950 2    50   ~ 0
IR3
Text Label 21850 -850 2    50   ~ 0
IR4
Text Label 21850 -750 2    50   ~ 0
IR5
Text Label 21850 -650 2    50   ~ 0
IR6
Text Label 21850 -550 2    50   ~ 0
IR7
Text Label 22050 -2350 0    50   ~ 0
~RESET
Text Label 22050 -2250 0    50   ~ 0
~RSTHOLD
Text Label 22050 -2050 0    50   ~ 0
AB0
Text Label 22050 -1950 0    50   ~ 0
AB1
Text Label 22050 -1850 0    50   ~ 0
AB2
Text Label 22050 -1750 0    50   ~ 0
AB3
Text Label 22050 -1650 0    50   ~ 0
AB4
Text Label 22050 -1550 0    50   ~ 0
AB5
Text Label 22050 -1450 0    50   ~ 0
AB6
Text Label 22050 -1350 0    50   ~ 0
AB7
Text Label 22050 -1250 0    50   ~ 0
AB8
Text Label 22050 -1150 0    50   ~ 0
AB9
Text Label 22050 -1050 0    50   ~ 0
AB10
Text Label 22050 -950 0    50   ~ 0
AB11
Text Label 22050 -850 0    50   ~ 0
AB12
Text Label 22050 -750 0    50   ~ 0
AB13
Text Label 22050 -650 0    50   ~ 0
AB14
Text Label 22050 -550 0    50   ~ 0
AB15
Text Label 22050 -450 0    50   ~ 0
AB16
Text Label 22050 -350 0    50   ~ 0
AB17
Text Label 22050 -250 0    50   ~ 0
AB18
Text Label 22050 -150 0    50   ~ 0
AB19
Text Label 22050 -50  0    50   ~ 0
AB20
Text Label 22050 50   0    50   ~ 0
AB21
Text Label 22050 150  0    50   ~ 0
AB22
Text Label 22050 250  0    50   ~ 0
AB23
Text Label 22050 450  0    50   ~ 0
~IRQ0
Text Label 22050 550  0    50   ~ 0
~IRQ1
Text Label 22050 650  0    50   ~ 0
~IRQ2
Text Label 22050 750  0    50   ~ 0
~IRQ3
Text Label 22050 850  0    50   ~ 0
~IRQ4
Text Label 22050 950  0    50   ~ 0
~IRQ5
Text Label 22050 1050 0    50   ~ 0
~IRQ6
Text Label 22050 1150 0    50   ~ 0
~IRQ7
Text Label 23950 -2550 2    50   ~ 0
~MEM
Text Label 23950 -2450 2    50   ~ 0
~IO
Text Label 23950 -2350 2    50   ~ 0
~R
Text Label 23950 -2250 2    50   ~ 0
~W
Text Label 23950 -2050 2    50   ~ 0
~SYSDEV
Text Label 23950 -1950 2    50   ~ 0
~IODEV1XX
Text Label 23950 -1850 2    50   ~ 0
~IODEV2XX
Text Label 23950 -1750 2    50   ~ 0
~IODEV3XX
Text Label 23950 -1650 2    50   ~ 0
~WS
Text Label 23950 -1550 2    50   ~ 0
~WAITING
Text Label 23950 -1450 2    50   ~ 0
~HALT
Text Label 23950 -1350 2    50   ~ 0
~IRQ
Text Label 23950 -1250 2    50   ~ 0
~IRQS
Text Label 19800 -650 0    50   ~ 0
~FPRESET
Text Label 19800 -2350 0    50   ~ 0
FPCLK
Text Label 19800 -2250 0    50   ~ 0
~FPCLK~⁄CLK
Text Label 19800 -550 0    50   ~ 0
POWEROK
Text Label 19800 -750 0    50   ~ 0
FPFETCH
Text Notes 750  850  0    100  ~ 20
Board 1: ALU, Registers (Part 2), and Interrupts
Text Notes 750  1650 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Text Label 19800 -1650 0    50   ~ 0
~FPµC2
Text Label 19800 -1750 0    50   ~ 0
~FPµC1
Text Label 19800 -1850 0    50   ~ 0
~FPµC0
Text Label 19800 -1950 0    50   ~ 0
~FPµA0
Text Label 19800 -2050 0    50   ~ 0
~FPIRL
Text Label 19800 -1550 0    50   ~ 0
~FPIRH
Text Label 19800 -1450 0    50   ~ 0
~FPFLAGS
$Comp
L alexios:CFT-2021-Processor-Bus P101
U 2 1 609EF5BD
P 20900 -2650
F 0 "P101" H 20900 -2483 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 20900 -2574 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 20850 -3550 50  0001 C CNN
F 3 "" H 20850 -3550 50  0001 C CNN
	2    20900 -2650
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P101
U 1 1 62FAE63B
P 18650 -2650
F 0 "P101" H 18650 -2483 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 18650 -2574 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 18600 -3550 50  0001 C CNN
F 3 "" H 18600 -3550 50  0001 C CNN
	1    18650 -2650
	1    0    0    -1  
$EndComp
Text Label 19600 -2350 2    50   ~ 0
~END
Wire Wire Line
	19250 -2350 19600 -2350
Text Label 17700 350  0    50   ~ 0
~WRITE-FL
Text Label 17700 250  0    50   ~ 0
FN
Text Label 17700 150  0    50   ~ 0
FZ
Text Label 17700 50   0    50   ~ 0
FL
Text Label 17700 -50  0    50   ~ 0
FV
Text Label 17700 -250 0    50   ~ 0
IBUS15
Text Label 17700 -350 0    50   ~ 0
IBUS14
Text Label 17700 -450 0    50   ~ 0
IBUS13
Text Label 17700 -550 0    50   ~ 0
IBUS12
Text Label 17700 -650 0    50   ~ 0
IBUS11
Text Label 17700 -750 0    50   ~ 0
IBUS10
Text Label 17700 -850 0    50   ~ 0
IBUS9
Text Label 17700 -950 0    50   ~ 0
IBUS8
Text Label 17700 -1050 0    50   ~ 0
IBUS7
Text Label 17700 -1150 0    50   ~ 0
IBUS6
Text Label 17700 -1250 0    50   ~ 0
IBUS5
Text Label 17700 -1350 0    50   ~ 0
IBUS4
Text Label 17700 -1450 0    50   ~ 0
IBUS3
Text Label 17700 -1550 0    50   ~ 0
IBUS2
Text Label 17700 -1650 0    50   ~ 0
IBUS1
Text Label 17700 -1750 0    50   ~ 0
IBUS0
Text Label 17700 -1950 0    50   ~ 0
T34
Text Label 17700 -2050 0    50   ~ 0
CLK4
Text Label 17700 -2150 0    50   ~ 0
CLK3
Text Label 17700 -2250 0    50   ~ 0
CLK2
Wire Wire Line
	19350 350  19350 450 
Wire Wire Line
	19250 350  19350 350 
$Comp
L power:GND #PWR0106
U 1 1 61C7A92A
P 19350 450
F 0 "#PWR0106" H 19350 200 50  0001 C CNN
F 1 "GND" H 19355 277 50  0000 C CNN
F 2 "" H 19350 450 50  0001 C CNN
F 3 "" H 19350 450 50  0001 C CNN
	1    19350 450 
	1    0    0    -1  
$EndComp
Text Label 19600 50   2    50   ~ 0
COND3
Text Label 19600 -50  2    50   ~ 0
COND2
Text Label 19600 -150 2    50   ~ 0
COND1
Text Label 19600 -250 2    50   ~ 0
COND0
Text Label 19600 -450 2    50   ~ 0
ACTION3
Text Label 19600 -550 2    50   ~ 0
ACTION2
Text Label 19600 -650 2    50   ~ 0
ACTION1
Text Label 19600 -750 2    50   ~ 0
ACTION0
Text Label 19600 -950 2    50   ~ 0
WADDR4
Text Label 19600 -1050 2    50   ~ 0
WADDR3
Text Label 19600 -1150 2    50   ~ 0
WADDR2
Text Label 19600 -1250 2    50   ~ 0
WADDR1
Text Label 19600 -1350 2    50   ~ 0
WADDR0
Text Label 19600 -1550 2    50   ~ 0
RADDR4
Text Label 19600 -1650 2    50   ~ 0
RADDR3
Text Label 19600 -1750 2    50   ~ 0
RADDR2
Text Label 19600 -1850 2    50   ~ 0
RADDR1
Text Label 19600 -1950 2    50   ~ 0
RADDR0
Wire Wire Line
	18000 -2550 18000 -2600
Wire Wire Line
	18050 -2550 18000 -2550
$Comp
L power:+5V #PWR0104
U 1 1 62FAE63C
P 18000 -2600
F 0 "#PWR0104" H 18000 -2750 50  0001 C CNN
F 1 "+5V" H 18015 -2427 50  0000 C CNN
F 2 "" H 18000 -2600 50  0001 C CNN
F 3 "" H 18000 -2600 50  0001 C CNN
	1    18000 -2600
	1    0    0    -1  
$EndComp
Text Label 19600 -2150 2    50   ~ 0
~SKIPEXT
Text Label 19600 -2250 2    50   ~ 0
~ENDEXT
Wire Wire Line
	17700 -2250 18050 -2250
Wire Wire Line
	17700 -2150 18050 -2150
Wire Wire Line
	17700 -2050 18050 -2050
Wire Wire Line
	17700 -1950 18050 -1950
Wire Wire Line
	17700 -1750 18050 -1750
Wire Wire Line
	17700 -1650 18050 -1650
Wire Wire Line
	17700 -1550 18050 -1550
Wire Wire Line
	17700 -1450 18050 -1450
Wire Wire Line
	17700 -1350 18050 -1350
Wire Wire Line
	17700 -1250 18050 -1250
Wire Wire Line
	17700 -1150 18050 -1150
Wire Wire Line
	17700 -1050 18050 -1050
Wire Wire Line
	17700 -950 18050 -950
Wire Wire Line
	17700 -850 18050 -850
Wire Wire Line
	17700 -750 18050 -750
Wire Wire Line
	17700 -650 18050 -650
Wire Wire Line
	17700 -550 18050 -550
Wire Wire Line
	17700 -450 18050 -450
Wire Wire Line
	17700 -350 18050 -350
Wire Wire Line
	17700 -250 18050 -250
Wire Wire Line
	17700 -50  18050 -50 
Wire Wire Line
	17700 50   18050 50  
Wire Wire Line
	17700 150  18050 150 
Wire Wire Line
	17700 250  18050 250 
Wire Wire Line
	17700 350  18050 350 
Wire Wire Line
	19250 -2250 19600 -2250
Wire Wire Line
	19250 -2150 19600 -2150
Wire Wire Line
	19250 -1950 19600 -1950
Wire Wire Line
	19250 -1850 19600 -1850
Wire Wire Line
	19250 -1750 19600 -1750
Wire Wire Line
	19250 -1650 19600 -1650
Wire Wire Line
	19250 -1550 19600 -1550
Wire Wire Line
	19250 -1350 19600 -1350
Wire Wire Line
	19250 -1250 19600 -1250
Wire Wire Line
	19250 -1150 19600 -1150
Wire Wire Line
	19250 -1050 19600 -1050
Wire Wire Line
	19250 -950 19600 -950
Wire Wire Line
	19250 -750 19600 -750
Wire Wire Line
	19250 -650 19600 -650
Wire Wire Line
	19250 -550 19600 -550
Wire Wire Line
	19250 -450 19600 -450
Wire Wire Line
	19250 -250 19600 -250
Wire Wire Line
	19250 -150 19600 -150
Wire Wire Line
	19250 -50  19600 -50 
Wire Wire Line
	19250 50   19600 50  
Wire Wire Line
	19800 -1750 20300 -1750
Wire Wire Line
	19800 -1850 20300 -1850
Wire Wire Line
	19800 -1950 20300 -1950
Wire Wire Line
	19800 -2150 20300 -2150
Wire Wire Line
	19800 -2250 20300 -2250
Wire Wire Line
	19800 -2350 20300 -2350
Wire Wire Line
	19800 -1050 20300 -1050
Wire Wire Line
	19800 -1150 20300 -1150
Wire Wire Line
	19800 -1250 20300 -1250
Wire Wire Line
	19800 -1350 20300 -1350
Wire Wire Line
	19800 -1450 20300 -1450
Wire Wire Line
	19800 -1550 20300 -1550
Wire Wire Line
	19800 -1650 20300 -1650
Wire Wire Line
	20300 -950 19800 -950
Wire Wire Line
	20300 -850 19800 -850
Wire Wire Line
	20300 -750 19800 -750
Wire Wire Line
	20300 -650 19800 -650
Wire Wire Line
	20300 -550 19800 -550
Wire Wire Line
	19250 -2550 19600 -2550
Text Label 19600 -2550 2    50   ~ 0
16MHz
Text Label 19800 -1350 0    50   ~ 0
~FPAEXT
Wire Wire Line
	23600 -2150 23950 -2150
Text Label 23950 -2150 2    50   ~ 0
T34
Text Label 19800 -1250 0    50   ~ 0
~FPPCL
Text Label 19800 -1150 0    50   ~ 0
~FPPCH
Text Label 19800 -1050 0    50   ~ 0
~FPDRL
Text Label 19800 -950 0    50   ~ 0
~FPDRH
Text Label 19800 -2150 0    50   ~ 0
~FPCTX
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
Text Label 19800 -850 0    50   ~ 0
~FPRAM~∕ROM
NoConn ~ 22050 450 
NoConn ~ 22050 550 
NoConn ~ 22050 650 
NoConn ~ 22050 750 
NoConn ~ 22050 850 
NoConn ~ 22050 950 
NoConn ~ 22050 1050
NoConn ~ 22050 1150
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61115B2C
P 17950 -2550
F 0 "#FLG0101" H 17950 -2475 50  0001 C CNN
F 1 "PWR_FLAG" V 17950 -2423 50  0000 L CNN
F 2 "" H 17950 -2550 50  0001 C CNN
F 3 "~" H 17950 -2550 50  0001 C CNN
	1    17950 -2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	17950 -2550 18000 -2550
Connection ~ 18000 -2550
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61150065
P 19400 350
F 0 "#FLG0102" H 19400 425 50  0001 C CNN
F 1 "PWR_FLAG" V 19400 478 50  0000 L CNN
F 2 "" H 19400 350 50  0001 C CNN
F 3 "~" H 19400 350 50  0001 C CNN
	1    19400 350 
	0    1    1    0   
$EndComp
Wire Wire Line
	19350 350  19400 350 
Connection ~ 19350 350 
Wire Wire Line
	21500 -2050 21850 -2050
Wire Wire Line
	19800 -2050 20300 -2050
Wire Wire Line
	22050 -2050 22400 -2050
$Comp
L alexios:CFT-2021-Peripheral-Bus P102
U 1 1 60987323
P 23000 -2650
F 0 "P102" H 23000 -2483 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 23000 -2574 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 22875 -3525 50  0001 C CNN
F 3 "" H 22875 -3525 50  0001 C CNN
	1    23000 -2650
	1    0    0    -1  
$EndComp
Text Label 17700 -2350 0    50   ~ 0
CLK1
Wire Wire Line
	17700 -2350 18050 -2350
NoConn ~ 20300 -2550
NoConn ~ 20300 -2450
Text Notes 17700 -3000 0    100  ~ 20
Processor Bus
Text Notes 20500 -3000 0    100  ~ 20
Local Bus
Text Notes 22450 -3000 0    100  ~ 20
Peripheral Bus
$Sheet
S 7150 1950 1150 1000
U 5D9672D4
F0 "Accumulator" 50
F1 "cft-reg-ac.sch" 50
F2 "~FPH" I R 8300 2300 50 
F3 "~FPL" I R 8300 2400 50 
F4 "~READ" I L 7150 2300 50 
F5 "~INC" I L 7150 2500 50 
F6 "~WRITE" I L 7150 2400 50 
F7 "IBUS[0..15]" I L 7150 2100 50 
F8 "FPD[0..7]" T R 8300 2500 50 
F9 "AC[0..15]" O R 8300 2100 50 
F10 "~DEC" I L 7150 2600 50 
F11 "~REGCPL" O R 8300 2600 50 
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
P -1650 6100
AR Path="/5F67D4B5/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/634E8C25" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C25" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H -1650 5950 50  0001 C CNN
F 1 "+5V" H -1708 6137 50  0000 R CNN
F 2 "" H -1650 6100 50  0001 C CNN
F 3 "" H -1650 6100 50  0001 C CNN
	1    -1650 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C2B
P -1650 6500
AR Path="/5F67D4B5/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/634E8C2B" Ref="#PWR0120"  Part="1" 
AR Path="/5D34E810/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C2B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0120" H -1650 6250 50  0001 C CNN
F 1 "GND" H -1728 6463 50  0000 R CNN
F 2 "" H -1650 6500 50  0001 C CNN
F 3 "" H -1650 6500 50  0001 C CNN
	1    -1650 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 6100 -1650 6200
$Comp
L Device:CP_Small C106
U 1 1 634E8C32
P -1650 6300
AR Path="/634E8C32" Ref="C106"  Part="1" 
AR Path="/5D34E810/634E8C32" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C32" Ref="C?"  Part="1" 
F 0 "C106" H -1738 6346 50  0000 R CNN
F 1 "47µF" H -1738 6255 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1650 6300 50  0001 C CNN
F 3 "~" H -1650 6300 50  0001 C CNN
	1    -1650 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 6400 -1650 6500
$Comp
L power:+5V #PWR?
U 1 1 634E8C39
P -2100 6100
AR Path="/5F67D4B5/634E8C39" Ref="#PWR?"  Part="1" 
AR Path="/634E8C39" Ref="#PWR0116"  Part="1" 
AR Path="/5D34E810/634E8C39" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C39" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C39" Ref="#PWR?"  Part="1" 
F 0 "#PWR0116" H -2100 5950 50  0001 C CNN
F 1 "+5V" H -2158 6137 50  0000 R CNN
F 2 "" H -2100 6100 50  0001 C CNN
F 3 "" H -2100 6100 50  0001 C CNN
	1    -2100 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C3F
P -2100 6500
AR Path="/5F67D4B5/634E8C3F" Ref="#PWR?"  Part="1" 
AR Path="/634E8C3F" Ref="#PWR0119"  Part="1" 
AR Path="/5D34E810/634E8C3F" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C3F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C3F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0119" H -2100 6250 50  0001 C CNN
F 1 "GND" H -2178 6463 50  0000 R CNN
F 2 "" H -2100 6500 50  0001 C CNN
F 3 "" H -2100 6500 50  0001 C CNN
	1    -2100 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 6100 -2100 6200
$Comp
L Device:CP_Small C105
U 1 1 634E8C46
P -2100 6300
AR Path="/634E8C46" Ref="C105"  Part="1" 
AR Path="/5D34E810/634E8C46" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C46" Ref="C?"  Part="1" 
F 0 "C105" H -2188 6346 50  0000 R CNN
F 1 "47µF" H -2188 6255 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2100 6300 50  0001 C CNN
F 3 "~" H -2100 6300 50  0001 C CNN
	1    -2100 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 6400 -2100 6500
$Comp
L power:+5V #PWR?
U 1 1 634E8C4D
P -2550 6100
AR Path="/5F67D4B5/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/634E8C4D" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C4D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H -2550 5950 50  0001 C CNN
F 1 "+5V" H -2608 6137 50  0000 R CNN
F 2 "" H -2550 6100 50  0001 C CNN
F 3 "" H -2550 6100 50  0001 C CNN
	1    -2550 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C53
P -2550 6500
AR Path="/5F67D4B5/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/634E8C53" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C53" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H -2550 6250 50  0001 C CNN
F 1 "GND" H -2628 6463 50  0000 R CNN
F 2 "" H -2550 6500 50  0001 C CNN
F 3 "" H -2550 6500 50  0001 C CNN
	1    -2550 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 6100 -2550 6200
$Comp
L Device:CP_Small C104
U 1 1 634E8C5A
P -2550 6300
AR Path="/634E8C5A" Ref="C104"  Part="1" 
AR Path="/5D34E810/634E8C5A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C5A" Ref="C?"  Part="1" 
F 0 "C104" H -2638 6346 50  0000 R CNN
F 1 "47µF" H -2638 6255 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2550 6300 50  0001 C CNN
F 3 "~" H -2550 6300 50  0001 C CNN
	1    -2550 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 6400 -2550 6500
$Comp
L power:+5V #PWR?
U 1 1 6352FA20
P -1650 6850
AR Path="/5F67D4B5/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/6352FA20" Ref="#PWR0125"  Part="1" 
AR Path="/5D34E810/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA20" Ref="#PWR?"  Part="1" 
F 0 "#PWR0125" H -1650 6700 50  0001 C CNN
F 1 "+5V" H -1708 6887 50  0000 R CNN
F 2 "" H -1650 6850 50  0001 C CNN
F 3 "" H -1650 6850 50  0001 C CNN
	1    -1650 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA26
P -1650 7250
AR Path="/5F67D4B5/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/6352FA26" Ref="#PWR0130"  Part="1" 
AR Path="/5D34E810/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA26" Ref="#PWR?"  Part="1" 
F 0 "#PWR0130" H -1650 7000 50  0001 C CNN
F 1 "GND" H -1728 7213 50  0000 R CNN
F 2 "" H -1650 7250 50  0001 C CNN
F 3 "" H -1650 7250 50  0001 C CNN
	1    -1650 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 6850 -1650 6950
$Comp
L Device:CP_Small C111
U 1 1 6352FA2D
P -1650 7050
AR Path="/6352FA2D" Ref="C111"  Part="1" 
AR Path="/5D34E810/6352FA2D" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA2D" Ref="C?"  Part="1" 
F 0 "C111" H -1738 7096 50  0000 R CNN
F 1 "47µF" H -1738 7005 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1650 7050 50  0001 C CNN
F 3 "~" H -1650 7050 50  0001 C CNN
	1    -1650 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1650 7150 -1650 7250
$Comp
L power:+5V #PWR?
U 1 1 6352FA34
P -2100 6850
AR Path="/5F67D4B5/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/6352FA34" Ref="#PWR0124"  Part="1" 
AR Path="/5D34E810/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA34" Ref="#PWR?"  Part="1" 
F 0 "#PWR0124" H -2100 6700 50  0001 C CNN
F 1 "+5V" H -2158 6887 50  0000 R CNN
F 2 "" H -2100 6850 50  0001 C CNN
F 3 "" H -2100 6850 50  0001 C CNN
	1    -2100 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA3A
P -2100 7250
AR Path="/5F67D4B5/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/6352FA3A" Ref="#PWR0129"  Part="1" 
AR Path="/5D34E810/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA3A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0129" H -2100 7000 50  0001 C CNN
F 1 "GND" H -2178 7213 50  0000 R CNN
F 2 "" H -2100 7250 50  0001 C CNN
F 3 "" H -2100 7250 50  0001 C CNN
	1    -2100 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 6850 -2100 6950
$Comp
L Device:CP_Small C110
U 1 1 6352FA41
P -2100 7050
AR Path="/6352FA41" Ref="C110"  Part="1" 
AR Path="/5D34E810/6352FA41" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA41" Ref="C?"  Part="1" 
F 0 "C110" H -2188 7096 50  0000 R CNN
F 1 "47µF" H -2188 7005 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2100 7050 50  0001 C CNN
F 3 "~" H -2100 7050 50  0001 C CNN
	1    -2100 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2100 7150 -2100 7250
$Comp
L power:+5V #PWR?
U 1 1 6352FA48
P -2550 6850
AR Path="/5F67D4B5/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/6352FA48" Ref="#PWR0123"  Part="1" 
AR Path="/5D34E810/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA48" Ref="#PWR?"  Part="1" 
F 0 "#PWR0123" H -2550 6700 50  0001 C CNN
F 1 "+5V" H -2608 6887 50  0000 R CNN
F 2 "" H -2550 6850 50  0001 C CNN
F 3 "" H -2550 6850 50  0001 C CNN
	1    -2550 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA4E
P -2550 7250
AR Path="/5F67D4B5/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/6352FA4E" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H -2550 7000 50  0001 C CNN
F 1 "GND" H -2628 7213 50  0000 R CNN
F 2 "" H -2550 7250 50  0001 C CNN
F 3 "" H -2550 7250 50  0001 C CNN
	1    -2550 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 6850 -2550 6950
$Comp
L Device:CP_Small C109
U 1 1 6352FA55
P -2550 7050
AR Path="/6352FA55" Ref="C109"  Part="1" 
AR Path="/5D34E810/6352FA55" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA55" Ref="C?"  Part="1" 
F 0 "C109" H -2638 7096 50  0000 R CNN
F 1 "47µF" H -2638 7005 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -2550 7050 50  0001 C CNN
F 3 "~" H -2550 7050 50  0001 C CNN
	1    -2550 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2550 7150 -2550 7250
Wire Wire Line
	-9100 1500 -8550 1500
Wire Wire Line
	-9100 1600 -8550 1600
Wire Wire Line
	-9100 1700 -8550 1700
Wire Wire Line
	-9100 1800 -8550 1800
Wire Wire Line
	-9100 2000 -8550 2000
Wire Wire Line
	-9100 2100 -8550 2100
Wire Wire Line
	-9100 2200 -8550 2200
Wire Wire Line
	-9100 2300 -8550 2300
Text Label -8550 1500 2    50   ~ 0
~READ-AC
Text Label -8550 1600 2    50   ~ 0
~WRITE-AC
Text Label -8550 1700 2    50   ~ 0
~INCAC
Text Label -8550 1800 2    50   ~ 0
~DECAC
Text Label -8550 2000 2    50   ~ 0
~READ-SP
Text Label -8550 2100 2    50   ~ 0
~WRITE-SP
Text Label -8550 2200 2    50   ~ 0
~INCSP
Text Label -8550 2300 2    50   ~ 0
~DECSP
Wire Wire Line
	7150 2600 6650 2600
Text Label 6650 2600 0    50   ~ 0
~DECAC
Wire Wire Line
	8300 2600 8800 2600
Wire Bus Line
	-5450 900  -5450 4150
Wire Bus Line
	800  -4150 800  -3350
Wire Bus Line
	-2850 -6100 -2850 -5450
Wire Bus Line
	-2550 750  -2550 1400
Wire Bus Line
	-2550 2900 -2550 4500
Text Label 8800 2600 2    50   ~ 0
~ACCPL
$EndSCHEMATC
