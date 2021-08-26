EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "Timers, Interrupts & Clock "
Date ""
Rev ""
Comp ""
Comment1 "TIC"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Bus Line
	-3500 2250 -4050 2250
Wire Bus Line
	-3500 2350 -4050 2350
Text Label -4050 2350 0    50   ~ 0
DB[0..15]
Wire Bus Line
	-4050 2650 -3500 2650
Text Label -4050 2650 0    50   ~ 0
FPD[0..7]
Wire Wire Line
	-3500 1850 -4050 1850
Wire Wire Line
	-3500 1950 -4050 1950
Wire Wire Line
	-3500 2050 -4050 2050
Wire Wire Line
	-3500 2150 -4050 2150
Wire Wire Line
	-3500 1750 -4050 1750
Wire Wire Line
	-3500 3050 -4050 3050
Wire Wire Line
	-3500 3150 -4050 3150
Wire Wire Line
	-3500 3250 -4050 3250
Wire Wire Line
	-3500 3550 -4050 3550
Wire Wire Line
	-3500 3650 -4050 3650
Wire Wire Line
	-3500 3750 -4050 3750
Wire Wire Line
	-3500 3850 -4050 3850
Wire Wire Line
	-3500 3450 -4050 3450
Wire Wire Line
	-3500 3350 -4050 3350
Wire Wire Line
	-3500 4150 -4050 4150
Wire Wire Line
	-3500 4250 -4050 4250
Wire Wire Line
	-3500 4050 -4050 4050
Wire Wire Line
	-3500 3950 -4050 3950
Text Label -4050 2950 0    50   ~ 0
~IRQ[0..7]
Text Label -4050 2750 0    50   ~ 0
~IRQ
Wire Wire Line
	-3500 2450 -4050 2450
Wire Wire Line
	-3500 2550 -4050 2550
Text Label -4050 1750 0    50   ~ 0
~RESET
Text Label -4050 1850 0    50   ~ 0
CLK1
Text Label -4050 1950 0    50   ~ 0
CLK2
Text Label -4050 2050 0    50   ~ 0
CLK3
Text Label -4050 2150 0    50   ~ 0
CLK4
Text Label -4050 2450 0    50   ~ 0
WSTB
Text Label -4050 2550 0    50   ~ 0
T34
Wire Wire Line
	-3500 2850 -4050 2850
Text Label -4050 2850 0    50   ~ 0
~IRQS
Text Label -4050 3050 0    50   ~ 0
~RSTHOLD
Text Label -4050 3150 0    50   ~ 0
~SYSDEV
Text Label -4050 3250 0    50   ~ 0
~IODEV1xx
Text Label -4050 3350 0    50   ~ 0
~IODEV2xx
Text Label -4050 3450 0    50   ~ 0
~IODEV3xx
Text Label -4050 3550 0    50   ~ 0
~MEM
Text Label -4050 3650 0    50   ~ 0
~IO
Text Label -4050 3750 0    50   ~ 0
~R
Text Label -4050 3950 0    50   ~ 0
~WS
Text Label -4050 4050 0    50   ~ 0
~ENDEXT
Text Label -4050 4150 0    50   ~ 0
~SKIPEXT
Text Label -4050 4250 0    50   ~ 0
~HALT
Text Label -4050 3850 0    50   ~ 0
~W
$Comp
L power:+5V #PWR?
U 1 1 5DD552A0
P -1000 6100
AR Path="/5F67D4B5/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A0" Ref="#PWR012"  Part="1" 
AR Path="/5D34E810/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A0" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A0" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H -1000 5950 50  0001 C CNN
F 1 "+5V" H -1058 6137 50  0000 R CNN
F 2 "" H -1000 6100 50  0001 C CNN
F 3 "" H -1000 6100 50  0001 C CNN
	1    -1000 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552A6
P -1000 6500
AR Path="/5F67D4B5/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD552A6" Ref="#PWR015"  Part="1" 
AR Path="/5D34E810/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552A6" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552A6" Ref="#PWR?"  Part="1" 
F 0 "#PWR015" H -1000 6250 50  0001 C CNN
F 1 "GND" H -1078 6463 50  0000 R CNN
F 2 "" H -1000 6500 50  0001 C CNN
F 3 "" H -1000 6500 50  0001 C CNN
	1    -1000 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1000 6100 -1000 6200
$Comp
L Device:CP_Small C4
U 1 1 5DD552AD
P -1000 6300
AR Path="/5DD552AD" Ref="C4"  Part="1" 
AR Path="/5D34E810/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552AD" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552AD" Ref="C?"  Part="1" 
F 0 "C4" H -1088 6346 50  0000 R CNN
F 1 "47µF" H -1088 6255 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1000 6300 50  0001 C CNN
F 3 "~" H -1000 6300 50  0001 C CNN
	1    -1000 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1000 6400 -1000 6500
$Comp
L power:+5V #PWR?
U 1 1 5DD552B4
P -1450 6100
AR Path="/5F67D4B5/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD552B4" Ref="#PWR011"  Part="1" 
AR Path="/5D34E810/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552B4" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552B4" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H -1450 5950 50  0001 C CNN
F 1 "+5V" H -1508 6137 50  0000 R CNN
F 2 "" H -1450 6100 50  0001 C CNN
F 3 "" H -1450 6100 50  0001 C CNN
	1    -1450 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DD552BA
P -1450 6500
AR Path="/5F67D4B5/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD552BA" Ref="#PWR014"  Part="1" 
AR Path="/5D34E810/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DD552BA" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DD552BA" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H -1450 6250 50  0001 C CNN
F 1 "GND" H -1528 6463 50  0000 R CNN
F 2 "" H -1450 6500 50  0001 C CNN
F 3 "" H -1450 6500 50  0001 C CNN
	1    -1450 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1450 6100 -1450 6200
$Comp
L Device:CP_Small C3
U 1 1 5DD552C1
P -1450 6300
AR Path="/5DD552C1" Ref="C3"  Part="1" 
AR Path="/5D34E810/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5DD552C1" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/5DD552C1" Ref="C?"  Part="1" 
F 0 "C3" H -1538 6346 50  0000 R CNN
F 1 "47µF" H -1538 6255 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H -1450 6300 50  0001 C CNN
F 3 "~" H -1450 6300 50  0001 C CNN
	1    -1450 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1450 6400 -1450 6500
Text Notes -3550 1250 0    100  ~ 20
Edge Connector
NoConn ~ -4050 2250
NoConn ~ -4050 2350
NoConn ~ -4050 3050
NoConn ~ -4050 3250
NoConn ~ -4050 3350
NoConn ~ -4050 3450
Text Label -4050 2250 0    50   ~ 0
AB[0..23]
Text Notes -11150 900  0    100  ~ 20
The INT, IRC and RTC boards
Text Notes -11150 1700 0    50   ~ 0
This board contains a number of relatively simple units. The interconnections and feeback loops between these units\nmake this a Turing Complete design, and an actual processor at that. Nearly every unit here except the clock generator\nfeeds back into another one. The core of the design is the Microcode Sequencer unit. It outputs the correct sequence\nof 24 control signals to execute an instruction. The Instruction Register holds the instruction being executed. The\nSkip and Branch Unit can be queried by the Sequencer to make decisions. The two Addressing Modes sub-units\ninterpret parts of the IR to tell the Sequencer exactly how to interpret instruction operands. The Flag Unit is crucial\nin implemting subroutines, interrupts and re-entrancy by storing and retrieving flag values. And the Interrupt Unit\nnotifies the Sequencer about external interrupt requests.
Wire Wire Line
	-10750 2450 -11200 2450
Wire Wire Line
	-10750 2550 -11200 2550
Wire Wire Line
	-10750 2650 -11200 2650
Wire Wire Line
	-10750 2750 -11200 2750
Wire Wire Line
	-10750 2850 -11200 2850
Wire Wire Line
	-11200 3000 -10750 3000
Wire Wire Line
	-11200 3100 -10750 3100
Wire Wire Line
	-11200 3200 -10750 3200
Wire Wire Line
	-11200 3300 -10750 3300
Wire Wire Line
	-11200 3400 -10750 3400
Wire Wire Line
	-11200 3500 -10750 3500
Wire Wire Line
	-11200 3600 -10750 3600
Wire Wire Line
	-9600 3850 -9150 3850
Text Notes -11150 2050 0    100  ~ 20
Address Decoding & Wait States
Text Label -11200 2450 0    50   ~ 0
~RESET
Text Label -11200 2550 0    50   ~ 0
CLK3
Text Label -11200 2650 0    50   ~ 0
~SYSDEV
Text Label -11200 2750 0    50   ~ 0
~R
Text Label -11200 2850 0    50   ~ 0
~W
Text Label -11200 3000 0    50   ~ 0
AB1
Text Label -11200 3100 0    50   ~ 0
AB2
Text Label -11200 3200 0    50   ~ 0
AB3
Text Label -11200 3300 0    50   ~ 0
AB4
Text Label -11200 3400 0    50   ~ 0
AB5
Text Label -11200 3500 0    50   ~ 0
AB6
Text Label -11200 3600 0    50   ~ 0
AB7
Text Label -9150 3850 2    50   ~ 0
~WS
Text Label -9150 3550 2    50   ~ 0
~RTCW
Text Label -9150 3450 2    50   ~ 0
~RTCR
Text Label -9150 3350 2    50   ~ 0
~RTCAW
Text Label -7500 6450 0    50   ~ 0
~RTCW
Text Label -7500 6350 0    50   ~ 0
~RTCR
Text Label -7500 6250 0    50   ~ 0
~RTCAW
Text Label -7500 6150 0    50   ~ 0
~RTCCS
$Sheet
S -7050 5950 1150 600 
U 5FD01D67
F0 "Real Time Clock" 50
F1 "rtc.sch" 50
F2 "~DB[0..15]" B L -7050 6050 50 
F3 "~RTCAW" I L -7050 6250 50 
F4 "~RTCW" I L -7050 6450 50 
F5 "~RTCR" I L -7050 6350 50 
F6 "~RTCCS" I L -7050 6150 50 
$EndSheet
$Sheet
S -10750 2300 1150 1650
U 60AA2B43
F0 "Bus Interface" 50
F1 "bus_interface.sch" 50
F2 "AB1" I L -10750 3000 50 
F3 "AB2" I L -10750 3100 50 
F4 "AB3" I L -10750 3200 50 
F5 "AB4" I L -10750 3300 50 
F6 "AB5" I L -10750 3400 50 
F7 "AB6" I L -10750 3500 50 
F8 "AB7" I L -10750 3600 50 
F9 "CLK3" I L -10750 2550 50 
F10 "~RESET" I L -10750 2450 50 
F11 "~SYSDEV" I L -10750 2650 50 
F12 "~WS" T R -9600 3850 50 
F13 "~W" I L -10750 2850 50 
F14 "~R" I L -10750 2750 50 
F15 "~RTCR" O R -9600 3450 50 
F16 "~RTCAW" O R -9600 3350 50 
F17 "~RTCW" O R -9600 3550 50 
F18 "~RISR" O R -9600 2650 50 
F19 "~RIER" O R -9600 2450 50 
F20 "~WIER" O R -9600 2550 50 
F21 "~T0CS" O R -9600 2850 50 
F22 "~T1CS" O R -9600 2950 50 
F23 "~RTCCS" O R -9600 3150 50 
$EndSheet
Wire Wire Line
	-9600 2850 -8200 2850
Wire Wire Line
	-8200 2850 -8200 5150
Wire Wire Line
	-8200 5150 -7050 5150
Wire Wire Line
	-9600 2950 -8300 2950
Wire Wire Line
	-8300 2950 -8300 5250
Wire Wire Line
	-8300 5250 -7050 5250
Wire Bus Line
	-7050 4850 -7500 4850
Text Label -7500 4850 0    50   ~ 0
DB[0..15]
Wire Bus Line
	-7050 6050 -7500 6050
Text Label -7500 6050 0    50   ~ 0
DB[0..15]
Wire Wire Line
	-7050 4450 -7500 4450
Wire Wire Line
	-7050 4550 -7500 4550
Text Label -7500 4450 0    50   ~ 0
~R
Text Label -7500 4550 0    50   ~ 0
~W
Wire Wire Line
	-7500 4750 -7050 4750
Text Label -7500 4750 0    50   ~ 0
AB1
Wire Wire Line
	-7500 4650 -7050 4650
Text Label -7500 4650 0    50   ~ 0
AB0
Text Label -5450 5350 2    50   ~ 0
~IRQ2i
Text Label -5450 5250 2    50   ~ 0
~IRQ1i
Text Label -5450 5150 2    50   ~ 0
~IRQ0i
Wire Wire Line
	-5450 4950 -5900 4950
Text Label -5450 4550 2    50   ~ 0
G0-1
Text Label -5450 4650 2    50   ~ 0
G0-2
Text Label -5450 4750 2    50   ~ 0
G1-0
Text Label -5450 4850 2    50   ~ 0
G1-1
Text Label -5450 4950 2    50   ~ 0
G1-2
Text Label -5450 4450 2    50   ~ 0
G0-0
Wire Wire Line
	-5900 4450 -5450 4450
Wire Wire Line
	-5900 4550 -5450 4550
Wire Wire Line
	-5900 4650 -5450 4650
Wire Wire Line
	-5900 4750 -5450 4750
Wire Wire Line
	-5900 4850 -5450 4850
Wire Wire Line
	-2050 2050 -2350 2050
Text Label -2050 1750 2    50   ~ 0
G0-1
Text Label -2050 1850 2    50   ~ 0
G0-2
Text Label -2050 1950 2    50   ~ 0
G1-0
Text Label -2050 2150 2    50   ~ 0
G1-1
Text Label -2050 2050 2    50   ~ 0
G1-2
Text Label -2050 1650 2    50   ~ 0
G0-0
Wire Wire Line
	-2350 1650 -2050 1650
Wire Wire Line
	-2350 1750 -2050 1750
Wire Wire Line
	-2350 1850 -2050 1850
Wire Wire Line
	-2350 1950 -2050 1950
Wire Wire Line
	-2350 2150 -2050 2150
Text Label -9150 2450 2    50   ~ 0
~RIER
Text Label -9150 2550 2    50   ~ 0
~WIER
Text Label -9150 2650 2    50   ~ 0
~RISR
Text Label -7500 5150 0    50   ~ 0
~T0CS
Text Label -7500 5250 0    50   ~ 0
~T1CS
Text Label -9150 2850 2    50   ~ 0
~T0CS
Text Label -9150 2950 2    50   ~ 0
~T1CS
Wire Wire Line
	-9600 3150 -8400 3150
Wire Wire Line
	-8400 6150 -7050 6150
Wire Wire Line
	-9600 3350 -8500 3350
Wire Wire Line
	-8500 6250 -7050 6250
Wire Wire Line
	-9600 3450 -8600 3450
Wire Wire Line
	-8600 6350 -7050 6350
Wire Wire Line
	-9600 3550 -8700 3550
Wire Wire Line
	-8700 6450 -7050 6450
Wire Wire Line
	-8400 3150 -8400 6150
Wire Wire Line
	-8500 3350 -8500 6250
Wire Wire Line
	-8600 3450 -8600 6350
Wire Wire Line
	-8700 3550 -8700 6450
$Sheet
S -3500 1500 1150 4200
U 5DD5525C
F0 "sheet5DD55211" 50
F1 "./bus.sch" 50
F2 "AB[0..23]" U L -3500 2250 50 
F3 "DB[0..15]" U L -3500 2350 50 
F4 "FPD[0..7]" U L -3500 2650 50 
F5 "~RESET" U L -3500 1750 50 
F6 "CLK1" U L -3500 1850 50 
F7 "CLK2" U L -3500 1950 50 
F8 "CLK3" U L -3500 2050 50 
F9 "CLK4" U L -3500 2150 50 
F10 "WSTB" U L -3500 2450 50 
F11 "T34" U L -3500 2550 50 
F12 "~IRQ" U L -3500 2750 50 
F13 "~IRQS" U L -3500 2850 50 
F14 "~IRQ[0..7]" U L -3500 2950 50 
F15 "~RSTHOLD" U L -3500 3050 50 
F16 "~SYSDEV" U L -3500 3150 50 
F17 "~IODEV1xx" U L -3500 3250 50 
F18 "~IODEV2xx" U L -3500 3350 50 
F19 "~IODEV3xx" U L -3500 3450 50 
F20 "~MEM" U L -3500 3550 50 
F21 "~IO" U L -3500 3650 50 
F22 "~R" U L -3500 3750 50 
F23 "~W" U L -3500 3850 50 
F24 "~WS" U L -3500 3950 50 
F25 "~ENDEXT" U L -3500 4050 50 
F26 "~SKIPEXT" U L -3500 4150 50 
F27 "~HALT" U L -3500 4250 50 
F28 "C1" U R -2350 1650 50 
F29 "C2" U R -2350 1750 50 
F30 "C3" U R -2350 1850 50 
F31 "C4" U R -2350 1950 50 
F32 "C5" U R -2350 2050 50 
F33 "C6" U R -2350 2150 50 
F34 "C7" U R -2350 2250 50 
F35 "C8" U R -2350 2350 50 
F36 "C9" U R -2350 2450 50 
F37 "C10" U R -2350 2550 50 
F38 "C11" U R -2350 2650 50 
F39 "C12" U R -2350 2750 50 
F40 "C13" U R -2350 2850 50 
F41 "C14" U R -2350 2950 50 
F42 "C15" U R -2350 3050 50 
F43 "C16" U R -2350 3150 50 
F44 "C17" U R -2350 3250 50 
F45 "C18" U R -2350 3350 50 
F46 "C19" U R -2350 3450 50 
F47 "C20" U R -2350 3550 50 
F48 "C21" U R -2350 3650 50 
F49 "C22" U R -2350 3750 50 
F50 "C23" U R -2350 3850 50 
F51 "C24" U R -2350 3950 50 
F52 "C25" U R -2350 4050 50 
F53 "C26" U R -2350 4150 50 
F54 "C27" U R -2350 4250 50 
F55 "C28" U R -2350 4350 50 
F56 "C29" U R -2350 4450 50 
F57 "C30" U R -2350 4550 50 
F58 "C31" U R -2350 4650 50 
F59 "C32" U R -2350 4750 50 
F60 "C33" U R -2350 4850 50 
F61 "C34" U R -2350 4950 50 
F62 "C35" U R -2350 5050 50 
F63 "C36" U R -2350 5150 50 
F64 "C37" U R -2350 5250 50 
F65 "C38" U R -2350 5350 50 
F66 "C39" U R -2350 5450 50 
F67 "C40" U R -2350 5550 50 
$EndSheet
Wire Wire Line
	-2350 2250 -2050 2250
Wire Wire Line
	-2350 2350 -2050 2350
Wire Wire Line
	-2350 2450 -2050 2450
Wire Wire Line
	-2350 2550 -2050 2550
Wire Wire Line
	-2350 2650 -2050 2650
Wire Wire Line
	-2350 2750 -2050 2750
Wire Wire Line
	-2350 2850 -2050 2850
Wire Wire Line
	-2350 2950 -2050 2950
Wire Wire Line
	-2350 3050 -2050 3050
Wire Wire Line
	-2350 3150 -2050 3150
Wire Wire Line
	-2350 3250 -2050 3250
Wire Wire Line
	-2350 3350 -2050 3350
Wire Wire Line
	-2350 3450 -2050 3450
Wire Wire Line
	-2350 3550 -2050 3550
Wire Wire Line
	-2350 3650 -2050 3650
Wire Wire Line
	-2350 3750 -2050 3750
Wire Wire Line
	-2350 3850 -2050 3850
Wire Wire Line
	-2350 3950 -2050 3950
Wire Wire Line
	-2350 4050 -2050 4050
Wire Wire Line
	-2350 4150 -2050 4150
Wire Wire Line
	-2350 4250 -2050 4250
Wire Wire Line
	-2350 4350 -2050 4350
Wire Wire Line
	-2350 4450 -2050 4450
Wire Wire Line
	-2350 4550 -2050 4550
Wire Wire Line
	-2350 4650 -2050 4650
Wire Wire Line
	-2350 4750 -2050 4750
Wire Wire Line
	-2350 4850 -2050 4850
Wire Wire Line
	-2350 4950 -2050 4950
Wire Wire Line
	-2350 5050 -2050 5050
Wire Wire Line
	-2350 5150 -2050 5150
Wire Wire Line
	-2350 5250 -2050 5250
Wire Wire Line
	-2350 5350 -2050 5350
Wire Wire Line
	-2350 5450 -2050 5450
Wire Wire Line
	-2350 5550 -2050 5550
NoConn ~ -2050 2250
NoConn ~ -2050 2350
NoConn ~ -2050 2450
NoConn ~ -2050 2550
NoConn ~ -2050 2650
NoConn ~ -2050 2750
NoConn ~ -2050 2850
NoConn ~ -2050 2950
NoConn ~ -2050 3050
NoConn ~ -2050 3150
NoConn ~ -2050 3250
NoConn ~ -2050 3350
NoConn ~ -2050 3450
NoConn ~ -2050 3550
NoConn ~ -2050 3650
NoConn ~ -2050 3750
NoConn ~ -2050 3850
NoConn ~ -2050 3950
NoConn ~ -2050 4050
NoConn ~ -2050 4150
NoConn ~ -2050 4250
NoConn ~ -2050 4350
NoConn ~ -2050 4450
NoConn ~ -2050 4550
NoConn ~ -2050 4650
NoConn ~ -2050 4750
NoConn ~ -2050 4850
NoConn ~ -2050 4950
NoConn ~ -2050 5050
NoConn ~ -2050 5150
NoConn ~ -2050 5250
NoConn ~ -2050 5350
Wire Wire Line
	-4050 2750 -3500 2750
Text Label -2050 5450 2    50   ~ 0
~FPIEN
Text Label -2050 5550 2    50   ~ 0
~FPIRF
NoConn ~ -4050 4050
NoConn ~ -4050 4150
NoConn ~ -4050 4250
NoConn ~ -4050 3550
NoConn ~ -4050 2850
NoConn ~ -4050 2450
NoConn ~ -4050 2550
NoConn ~ -4050 2150
NoConn ~ -4050 1850
NoConn ~ -4050 3650
Text Notes -6600 5450 0    100  ~ 20
TMR
Text Notes -6600 6500 0    100  ~ 20
RTC
$Sheet
S -7050 4300 1150 1200
U 607E2CF3
F0 "Timers" 50
F1 "tmr.sch" 50
F2 "~IRQ0i" T R -5900 5150 50 
F3 "~IRQ1i" T R -5900 5250 50 
F4 "~IRQ2i" T R -5900 5350 50 
F5 "DB[0..15]" B L -7050 4850 50 
F6 "~R" I L -7050 4450 50 
F7 "~T0CS" I L -7050 5150 50 
F8 "~T1CS" I L -7050 5250 50 
F9 "~W" I L -7050 4550 50 
F10 "AB0" I L -7050 4650 50 
F11 "AB1" I L -7050 4750 50 
F12 "OUT-G0-0" O R -5900 4450 50 
F13 "OUT-G0-1" O R -5900 4550 50 
F14 "OUT-G0-2" O R -5900 4650 50 
F15 "OUT-G1-1" O R -5900 4850 50 
F16 "OUT-G1-2" O R -5900 4950 50 
F17 "OUT-G1-0" O R -5900 4750 50 
$EndSheet
Wire Bus Line
	-4050 2950 -3500 2950
Wire Wire Line
	-5900 5350 -5450 5350
Wire Wire Line
	-5900 5250 -5450 5250
Wire Wire Line
	-5900 5150 -5450 5150
$Sheet
S -3500 6200 1150 3000
U 64860A0B
F0 "Quad Serial Board" 50
F1 "tty.sch" 50
$EndSheet
$Comp
L Interface_Ethernet:W5100 U?
U 1 1 61281AB3
P -9200 9950
F 0 "U?" H -9200 7861 50  0000 C CNN
F 1 "W5100" H -9200 7770 50  0000 C CNN
F 2 "Package_QFP:LQFP-80_10x10mm_P0.4mm" H -9050 8000 50  0001 L CNN
F 3 "http://www.wiznet.io/wp-content/uploads/wiznethome/Chip/W5100/Document/W5100_Datasheet_v1.2.7.pdf" H -12850 13100 50  0001 C CNN
	1    -9200 9950
	1    0    0    -1  
$EndComp
$Comp
L RF_Module:ESP-WROOM-02 U?
U 1 1 61281AB9
P -7050 10200
F 0 "U?" H -7050 10981 50  0000 C CNN
F 1 "ESP-WROOM-02" H -7050 10890 50  0000 C CNN
F 2 "RF_Module:ESP-WROOM-02" H -6450 9650 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/0c-esp-wroom-02_datasheet_en.pdf" H -7000 11700 50  0001 C CNN
	1    -7050 10200
	1    0    0    -1  
$EndComp
$Comp
L Interface_USB:FT232RL U?
U 1 1 61DE661D
P -4650 11150
F 0 "U?" H -4650 12331 50  0000 C CNN
F 1 "FT232RL" H -4650 12240 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H -3550 10250 50  0001 C CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232R.pdf" H -4650 11150 50  0001 C CNN
	1    -4650 11150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
