EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 18
Title ""
Date ""
Rev "2049"
Comp ""
Comment1 "DFP"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Bus Line
	15250 1450 15800 1450
Wire Bus Line
	15250 1550 15800 1550
Text Label 15800 1450 2    50   ~ 0
AB[0..23]
Text Label 15800 1550 2    50   ~ 0
DB[0..15]
Wire Bus Line
	15800 1850 15250 1850
Text Label 15800 1850 2    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	15250 2250 15800 2250
Wire Wire Line
	15250 2350 15800 2350
Wire Wire Line
	15250 2450 15800 2450
Wire Wire Line
	15250 2750 15800 2750
Wire Wire Line
	15250 2850 15800 2850
Wire Wire Line
	15250 2950 15800 2950
Wire Wire Line
	15250 3050 15800 3050
Wire Wire Line
	15250 2650 15800 2650
Wire Wire Line
	15250 2550 15800 2550
Wire Wire Line
	15250 3450 15800 3450
Wire Wire Line
	15250 3150 15800 3150
Wire Bus Line
	15800 2150 15250 2150
Text Label 15800 2150 2    50   ~ 0
~IRQ[0..7]
Text Label 15800 1950 2    50   ~ 0
~IRQ
Wire Wire Line
	15250 1750 15800 1750
Wire Bus Line
	2550 -6000 3100 -6000
Text Label 2550 -6000 0    50   ~ 0
IBUS[0..15]
Text Label 15800 1750 2    50   ~ 0
T34
Wire Wire Line
	15250 2050 15800 2050
Text Label 15800 2050 2    50   ~ 0
~IRQS
Text Label 15800 2250 2    50   ~ 0
~RSTHOLD
Text Label 15800 2350 2    50   ~ 0
~SYSDEV
Text Label 15800 2450 2    50   ~ 0
~IODEV1xx
Text Label 15800 2550 2    50   ~ 0
~IODEV2xx
Text Label 15800 2650 2    50   ~ 0
~IODEV3xx
Text Label 15800 2750 2    50   ~ 0
~MEM
Text Label 15800 2850 2    50   ~ 0
~IO
Text Label 15800 2950 2    50   ~ 0
~R
Text Label 15800 3150 2    50   ~ 0
~WS
Text Label 15800 3450 2    50   ~ 0
~HALT
Text Label 2550 -3000 0    50   ~ 0
ACTION[0..3]
Text Label 2550 -2900 0    50   ~ 0
WADDR[0..4]
Text Label 2550 -2800 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	3100 -3000 2550 -3000
Wire Bus Line
	3100 -2900 2550 -2900
Wire Bus Line
	3100 -2800 2550 -2800
Wire Bus Line
	2550 -2700 3100 -2700
Text Label 2550 -2700 0    50   ~ 0
RSVD[0..6]
Text Label 4800 -5700 2    50   ~ 0
FPA1
$Comp
L power:+5V #PWR?
U 1 1 5FE9C141
P 4250 -5900
AR Path="/5FE9C141" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C141" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C141" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 4250 -6050 50  0001 C CNN
F 1 "+5V" V 4265 -5772 50  0000 L CNN
F 2 "" H 4250 -5900 50  0001 C CNN
F 3 "" H 4250 -5900 50  0001 C CNN
	1    4250 -5900
	0    1    1    0   
$EndComp
Text Label 4800 -3400 2    50   ~ 0
POWER
Text Label 4800 -3500 2    50   ~ 0
~LTSON
Text Label 4800 -3600 2    50   ~ 0
SWD3
Text Label 4800 -3700 2    50   ~ 0
SWD2
Text Label 4800 -3800 2    50   ~ 0
SWD1
Text Label 4800 -3900 2    50   ~ 0
SWD0
Text Label 4800 -4000 2    50   ~ 0
SWA3
Text Label 4800 -4100 2    50   ~ 0
SWA2
Text Label 4800 -4200 2    50   ~ 0
SWA1
Text Label 4800 -4300 2    50   ~ 0
SWA0
Text Label 4800 -4400 2    50   ~ 0
~ROW5
Text Label 4800 -4500 2    50   ~ 0
~ROW4
Text Label 4800 -4600 2    50   ~ 0
~ROW3
Text Label 4800 -4700 2    50   ~ 0
~ROW2
Text Label 4800 -4800 2    50   ~ 0
~ROW1
Wire Wire Line
	4250 -5700 4800 -5700
Wire Wire Line
	4250 -5800 4800 -5800
Wire Wire Line
	4250 -2800 4400 -2800
Wire Wire Line
	4250 -2900 4400 -2900
Wire Wire Line
	4250 -3000 4400 -3000
Wire Wire Line
	4250 -3500 4800 -3500
Wire Wire Line
	4250 -3600 4800 -3600
Wire Wire Line
	4250 -3700 4800 -3700
Wire Wire Line
	4250 -3800 4800 -3800
Wire Wire Line
	4250 -3900 4800 -3900
Wire Wire Line
	4250 -4000 4800 -4000
Wire Wire Line
	4250 -4100 4800 -4100
Wire Wire Line
	4250 -4200 4800 -4200
Wire Wire Line
	4250 -4300 4800 -4300
Wire Wire Line
	4250 -4400 4800 -4400
Wire Wire Line
	4250 -4500 4800 -4500
Wire Wire Line
	4250 -4600 4800 -4600
Wire Wire Line
	4250 -4700 4800 -4700
Wire Wire Line
	4250 -4800 4800 -4800
Text Label 4800 -5800 2    50   ~ 0
FPA0
NoConn ~ 4400 -3000
NoConn ~ 4400 -2800
$Comp
L power:+5V #PWR?
U 1 1 5FE9C16D
P 4250 -6000
AR Path="/5FE9C16D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C16D" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C16D" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 4250 -6150 50  0001 C CNN
F 1 "+5V" V 4265 -5872 50  0000 L CNN
F 2 "" H 4250 -6000 50  0001 C CNN
F 3 "" H 4250 -6000 50  0001 C CNN
	1    4250 -6000
	0    1    1    0   
$EndComp
Text Notes 3850 -4150 1    100  ~ 20
Left Slot
Entry Wire Line
	4800 -4300 4900 -4200
Entry Wire Line
	4800 -4200 4900 -4100
Entry Wire Line
	4800 -4100 4900 -4000
Entry Wire Line
	4800 -4000 4900 -3900
Entry Wire Line
	4800 -3900 4900 -3800
Entry Wire Line
	4800 -3800 4900 -3700
Entry Wire Line
	4800 -3700 4900 -3600
Entry Wire Line
	4800 -3600 4900 -3500
Text Label 4900 -4200 0    50   ~ 0
SWA[0..3]
Text Label 4900 -3800 0    50   ~ 0
SWD[0..3]
Text Notes 4950 -3400 0    50   ~ 0
Power switch from front panel
Wire Wire Line
	4250 -2100 4400 -2100
NoConn ~ 4400 -2900
$Comp
L power:GND #PWR?
U 1 1 5FE9C188
P 4400 -2100
AR Path="/5FE9C188" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C188" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C188" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 4400 -2350 50  0001 C CNN
F 1 "GND" H 4405 -2273 50  0000 C CNN
F 2 "" H 4400 -2100 50  0001 C CNN
F 3 "" H 4400 -2100 50  0001 C CNN
	1    4400 -2100
	1    0    0    -1  
$EndComp
Text Label 4800 -2200 2    50   ~ 0
TXD1
Text Label 4800 -2300 2    50   ~ 0
RXD
Wire Wire Line
	4250 -2300 4800 -2300
Wire Wire Line
	4250 -2200 4800 -2200
Wire Wire Line
	4250 -3400 4800 -3400
Text Label 15800 3050 2    50   ~ 0
~W
$Comp
L power:GND #PWR?
U 1 1 5FE9C19C
P 4550 -3050
AR Path="/5FE9C19C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C19C" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C19C" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 4550 -3300 50  0001 C CNN
F 1 "GND" H 4555 -3223 50  0000 C CNN
F 2 "" H 4550 -3050 50  0001 C CNN
F 3 "" H 4550 -3050 50  0001 C CNN
	1    4550 -3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 -3300 4550 -3300
Wire Wire Line
	4550 -3300 4550 -3200
Wire Wire Line
	4250 -3200 4550 -3200
Connection ~ 4550 -3200
Wire Wire Line
	4250 -3100 4550 -3100
Wire Wire Line
	4550 -3200 4550 -3100
Connection ~ 4550 -3100
Wire Wire Line
	4550 -3100 4550 -3050
Wire Wire Line
	3100 -3300 3000 -3300
Wire Wire Line
	3100 -3200 2550 -3200
NoConn ~ 3000 -3300
Wire Bus Line
	7100 -5400 6550 -5400
Wire Bus Line
	7100 -5300 6550 -5300
Text Label 6550 -5400 0    50   ~ 0
AB[0..7]
Text Label 6550 -5300 0    50   ~ 0
DB[0..15]
Wire Bus Line
	6550 -5000 7100 -5000
Text Label 6550 -5000 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	7100 -5800 6550 -5800
Wire Wire Line
	7100 -5700 6550 -5700
Wire Wire Line
	7100 -5600 6550 -5600
Wire Wire Line
	7100 -5500 6550 -5500
Wire Wire Line
	7100 -5900 6550 -5900
Wire Wire Line
	7100 -4600 6550 -4600
Wire Wire Line
	7100 -4500 6550 -4500
Wire Wire Line
	7100 -4400 6550 -4400
Wire Wire Line
	7100 -4900 6550 -4900
Wire Wire Line
	7100 -3900 6550 -3900
Wire Wire Line
	7100 -3800 6550 -3800
Wire Wire Line
	7100 -4200 6550 -4200
Wire Wire Line
	7100 -4300 6550 -4300
Wire Wire Line
	7100 -3400 6550 -3400
Wire Wire Line
	7100 -3700 6550 -3700
Wire Bus Line
	6550 -4700 7100 -4700
Text Label 6550 -4700 0    50   ~ 0
~IRQ[0..7]
Text Label 6550 -4900 0    50   ~ 0
~IRQ
Wire Wire Line
	7100 -5100 6550 -5100
Text Label 6550 -5900 0    50   ~ 0
~RESET
Text Label 6550 -5800 0    50   ~ 0
CLK1
Text Label 6550 -5700 0    50   ~ 0
CLK2
Text Label 6550 -5600 0    50   ~ 0
CLK3
Text Label 6550 -5500 0    50   ~ 0
CLK4
Text Label 6550 -5100 0    50   ~ 0
T34
Wire Wire Line
	7100 -4800 6550 -4800
Text Label 6550 -4800 0    50   ~ 0
~IRQS
Text Label 6550 -4600 0    50   ~ 0
~RSTHOLD
Text Label 6550 -4500 0    50   ~ 0
~SYSDEV
Text Label 6550 -4400 0    50   ~ 0
~IODEV1xx
Text Label 6550 -4300 0    50   ~ 0
~IODEV2xx
Text Label 6550 -4200 0    50   ~ 0
~IODEV3xx
Text Label 6550 -3900 0    50   ~ 0
~R
Text Label 6550 -3800 0    50   ~ 0
~W
Text Label 6550 -3700 0    50   ~ 0
~WS
Text Label 6550 -3400 0    50   ~ 0
~HALT
Text Label 12200 9200 0    50   ~ 0
FPCLKEN
Text Label 12200 9100 0    50   ~ 0
FPµSTEP
$Comp
L power:GND #PWR?
U 1 1 5FE9C1EE
P 8250 -5700
AR Path="/5FE9C1EE" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C1EE" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C1EE" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 8250 -5950 50  0001 C CNN
F 1 "GND" V 8300 -5800 50  0000 R CNN
F 2 "" H 8250 -5700 50  0001 C CNN
F 3 "" H 8250 -5700 50  0001 C CNN
	1    8250 -5700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FE9C1F4
P 8250 -5500
AR Path="/5FE9C1F4" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C1F4" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C1F4" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 8250 -5750 50  0001 C CNN
F 1 "GND" V 8300 -5600 50  0000 R CNN
F 2 "" H 8250 -5500 50  0001 C CNN
F 3 "" H 8250 -5500 50  0001 C CNN
	1    8250 -5500
	0    -1   -1   0   
$EndComp
Text Notes 9050 -5900 0    50   ~ 0
To reset and clock generator
Text Notes 9550 -5300 0    50   ~ 0
To Memory Bank Registers
Wire Wire Line
	8250 -5200 8850 -5200
Text Label 8850 -5200 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 9550 -5200 0    50   ~ 0
From Microcode Sequencer
Text Notes 7850 -3850 1    100  ~ 20
Right Slot
Wire Wire Line
	8250 -6000 8850 -6000
Text Label 8850 -6000 2    50   ~ 0
POWER
Text Notes 9050 -6000 0    50   ~ 0
Power enable → backplane
Text Label 8850 -4000 2    50   ~ 0
~FPOE29
Text Label 8850 -4300 2    50   ~ 0
~FPOE25
Text Label 8850 -4800 2    50   ~ 0
~FPOE21
Wire Wire Line
	8250 -4600 8850 -4600
Wire Wire Line
	8250 -4300 8850 -4300
Wire Wire Line
	8250 -4400 8850 -4400
Wire Wire Line
	8250 -4200 8850 -4200
Text Notes 8900 -3400 0    50   ~ 0
PC high
Text Label 8850 -3400 2    50   ~ 0
~FPOE5
Wire Wire Line
	8250 -4100 8850 -4100
Wire Wire Line
	8250 -4000 8850 -4000
Wire Wire Line
	8250 -3900 8850 -3900
Text Label 8850 -4100 2    50   ~ 0
~FPOE30
Wire Wire Line
	8250 -3500 8850 -3500
Text Label 8850 -4400 2    50   ~ 0
~FPOE26
Wire Wire Line
	8250 -3700 8850 -3700
Text Notes 8900 -5000 0    50   ~ 0
IR low\n
Text Notes 8900 -2300 0    50   ~ 0
AC low
Text Notes 8900 -3100 0    50   ~ 0
PC low
Text Notes 8900 -3500 0    50   ~ 0
µCV low
Text Label 8850 -2300 2    50   ~ 0
~FPOE10
Text Label 8850 -3100 2    50   ~ 0
~FPOE6
Text Label 8850 -3500 2    50   ~ 0
~FPOE2
Wire Wire Line
	8250 -3300 8850 -3300
Wire Wire Line
	8250 -3400 8850 -3400
Wire Wire Line
	8250 -3100 8850 -3100
Text Label 8850 -4500 2    50   ~ 0
~FPOE23
Wire Wire Line
	8250 -2500 8850 -2500
Text Label 8850 -4900 2    50   ~ 0
~FPOE19
Wire Wire Line
	8250 -2600 8850 -2600
Text Notes 8900 -4500 0    50   ~ 0
µAddress low
Text Notes 8900 -2400 0    50   ~ 0
(reserved)
Text Label 8850 -2200 2    50   ~ 0
~FPOE15
Wire Wire Line
	8250 -2300 8850 -2300
Text Notes 8900 -2200 0    50   ~ 0
(reserved)
Text Notes 8900 -2800 0    50   ~ 0
IRQs enabled
Text Notes 8900 -3600 0    50   ~ 0
IRQ requests
Text Label 8850 -2400 2    50   ~ 0
~FPOE11
Text Label 8850 -2800 2    50   ~ 0
~FPOE7
Text Label 8850 -3600 2    50   ~ 0
~FPOE3
Wire Wire Line
	8250 -2400 8850 -2400
Wire Wire Line
	8250 -2100 8850 -2100
Wire Wire Line
	8250 -2200 8850 -2200
Wire Wire Line
	8250 -2700 8850 -2700
Wire Wire Line
	8250 -2900 8850 -2900
Wire Wire Line
	8250 -3000 8850 -3000
Wire Wire Line
	8250 -3200 8850 -3200
Text Label 8850 -2900 2    50   ~ 0
~FPSPHOE
Text Label 8850 -3200 2    50   ~ 0
~FPSPLOE
Text Notes 8900 -2700 0    50   ~ 0
MFD: DR high
Text Notes 8900 -2900 0    50   ~ 0
MFD: DR low
Text Notes 8900 -3000 0    50   ~ 0
MFD: SP high\n
Text Notes 8900 -3200 0    50   ~ 0
MFD: SP low
Wire Wire Line
	8250 -4500 8850 -4500
Text Label 8850 -3700 2    50   ~ 0
~FPOE0
Text Notes 8900 -3700 0    50   ~ 0
µCV high
Wire Wire Line
	8250 -4700 8850 -4700
Wire Wire Line
	8250 -4800 8850 -4800
Text Label 8850 -2500 2    50   ~ 0
~FPOE8
Text Notes 8900 -2500 0    50   ~ 0
Flags
Wire Wire Line
	8250 -4900 8850 -4900
Text Label 8850 -2100 2    50   ~ 0
~FPOE12
Text Notes 8900 -2100 0    50   ~ 0
(reserved)
Wire Wire Line
	8250 -5000 8850 -5000
Text Label 8850 -4600 2    50   ~ 0
~FPOE24
Wire Wire Line
	8250 -2800 8850 -2800
Text Label 8850 -3800 2    50   ~ 0
~FPOE27
Wire Wire Line
	8250 -5100 8850 -5100
Text Label 8850 -2700 2    50   ~ 0
~FPDRHOE
Text Label 8850 -3000 2    50   ~ 0
~FPDRLOE
Wire Wire Line
	8250 -3600 8850 -3600
Text Label 8850 -5000 2    50   ~ 0
~FPOE18
Wire Wire Line
	8250 -3800 8850 -3800
Text Label 8850 -4700 2    50   ~ 0
~FPOE22
Wire Wire Line
	8250 -5900 8850 -5900
NoConn ~ 8850 -5900
Wire Wire Line
	15250 1950 15800 1950
Text Label 9650 9450 2    50   ~ 0
FP-FPD0
Text Label 8450 9450 0    50   ~ 0
FP-FPD1
Text Label 9650 9350 2    50   ~ 0
FP-FPD2
Text Label 8450 9350 0    50   ~ 0
FP-FPD3
Text Label 9650 9250 2    50   ~ 0
FP-FPD4
Text Label 8450 9250 0    50   ~ 0
FP-FPD5
Text Label 9650 9150 2    50   ~ 0
FP-FPD6
Text Notes 2400 -6350 0    100  ~ 20
Processor/Memory Mapped Slots
Text Notes 6950 -6350 0    100  ~ 20
Device I/O Slots
Text Label 2550 -3200 0    50   ~ 0
~WAITING
Wire Wire Line
	7100 -3200 6550 -3200
Text Label 6550 -3200 0    50   ~ 0
~WAITING
Text HLabel 12200 5700 0    50   UnSpc ~ 0
CLK1
Text HLabel 12200 5800 0    50   UnSpc ~ 0
CLK2
Text HLabel 12200 5900 0    50   UnSpc ~ 0
CLK3
Text HLabel 12200 6000 0    50   UnSpc ~ 0
CLK4
Text HLabel 14200 2250 2    50   UnSpc ~ 0
~IRQ
Text HLabel 14200 2350 2    50   UnSpc ~ 0
~IRQS
Text HLabel 15800 1450 2    50   UnSpc ~ 0
AB[0..23]
Text HLabel 15800 1550 2    50   UnSpc ~ 0
DB[0..15]
Text HLabel 15800 1850 2    50   UnSpc ~ 0
CFT-FPD[0..7]
Text HLabel 2550 -6000 0    50   UnSpc ~ 0
IBUS[0..15]
Text HLabel 15800 2150 2    50   UnSpc ~ 0
~IRQ[0..7]
Text HLabel 2550 -3000 0    50   UnSpc ~ 0
ACTION[0..3]
Text HLabel 2550 -2900 0    50   UnSpc ~ 0
WADDR[0..4]
Text HLabel 2550 -2800 0    50   UnSpc ~ 0
RADDR[0..4]
Text HLabel 2550 -2700 0    50   UnSpc ~ 0
RSVD[0..6]
Text HLabel 15800 2250 2    50   UnSpc ~ 0
~RSTHOLD
Text HLabel 14200 1550 2    50   UnSpc ~ 0
~SYSDEV
Text HLabel 14200 1650 2    50   UnSpc ~ 0
~IODEV1xx
Text HLabel 14200 1750 2    50   UnSpc ~ 0
~IODEV2xx
Text HLabel 14200 1850 2    50   UnSpc ~ 0
~IODEV3xx
Text HLabel 14200 1050 2    50   UnSpc ~ 0
~MEM
Text HLabel 14200 1150 2    50   UnSpc ~ 0
~IO
Text HLabel 14200 1250 2    50   UnSpc ~ 0
~R
Text HLabel 14200 1350 2    50   UnSpc ~ 0
~W
Text HLabel 14200 1950 2    50   UnSpc ~ 0
~WS
Wire Bus Line
	7000 9800 7600 9800
Text HLabel 7600 9800 2    50   Input ~ 0
FPA[0..1]
Entry Wire Line
	4800 -4800 4900 -4700
Entry Wire Line
	4800 -4700 4900 -4600
Entry Wire Line
	4800 -4600 4900 -4500
Entry Wire Line
	4800 -4500 4900 -4400
Entry Wire Line
	4800 -4400 4900 -4300
Text Label 4900 -4700 0    50   ~ 0
~ROW[1..5]
Text Label 7000 9800 0    50   ~ 0
FPA[0..1]
Wire Bus Line
	7000 9900 7600 9900
Text HLabel 7600 9900 2    50   Input ~ 0
~ROW[1..5]
Wire Bus Line
	7000 10000 7600 10000
Text HLabel 7600 10000 2    50   Input ~ 0
SWA[0..3]
Text Label 7000 9900 0    50   ~ 0
~ROW[1..5]
Text Label 7000 10000 0    50   ~ 0
SWA[0..3]
Wire Bus Line
	7000 10100 7600 10100
Text HLabel 7600 10100 2    50   Input ~ 0
SWD[0..3]
Text Label 7000 10100 0    50   ~ 0
SWD[0..3]
Text HLabel 4800 -2300 2    50   UnSpc ~ 0
RXD
Text HLabel 4800 -2200 2    50   UnSpc ~ 0
TXD1
Text HLabel 14200 2050 2    50   UnSpc ~ 0
~WAITING
Wire Wire Line
	15250 3250 15800 3250
Text Label 15800 3250 2    50   ~ 0
~ENDEXT
Text HLabel 15800 3250 2    50   UnSpc ~ 0
~ENDEXT
Wire Wire Line
	15250 3350 15800 3350
Text Label 15800 3350 2    50   ~ 0
~SKIPEXT
Text HLabel 15800 3350 2    50   UnSpc ~ 0
~SKIPEXT
Text Label 7000 10200 0    50   ~ 0
~LTSON
Wire Wire Line
	7600 10200 7000 10200
Text HLabel 7600 10200 2    50   Input ~ 0
~LTSON
Text HLabel 11950 9200 0    50   Input ~ 0
FPCLKEN
Text HLabel 11950 9100 0    50   Input ~ 0
FPµSTEP
Text HLabel 11950 11000 0    50   Input ~ 0
~FPRAM~∕ROM
Text HLabel 11950 11100 0    50   Input ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	7350 -1400 7950 -1400
Text HLabel 7950 -1400 2    50   Input ~ 0
~FPOE[0..31]
Text Label 7350 -1400 0    50   ~ 0
~FPOE[0..31]
Text Label 7350 -1200 0    50   ~ 0
~FPSPLOE
Text Label 7350 -1300 0    50   ~ 0
~FPDRLOE
Text Label 7350 -1000 0    50   ~ 0
~FPSPHOE
Text Label 7350 -1100 0    50   ~ 0
~FPDRHOE
Wire Wire Line
	7950 -1300 7350 -1300
Wire Wire Line
	7950 -1200 7350 -1200
Wire Wire Line
	7950 -1100 7350 -1100
Wire Wire Line
	7950 -1000 7350 -1000
Text HLabel 7950 -1300 2    50   Input ~ 0
~FPDRLOE
Text HLabel 7950 -1200 2    50   Input ~ 0
~FPSPLOE
Text HLabel 7950 -1100 2    50   Input ~ 0
~FPDRHOE
Text HLabel 7950 -1000 2    50   Input ~ 0
~FPSPHOE
NoConn ~ 4400 -2500
NoConn ~ 4400 -2700
NoConn ~ 4400 -2400
NoConn ~ 4400 -2600
Wire Wire Line
	4250 -2400 4400 -2400
Wire Wire Line
	4250 -2500 4400 -2500
Wire Wire Line
	4250 -2600 4400 -2600
Wire Wire Line
	4250 -2700 4400 -2700
Wire Bus Line
	7000 9700 7600 9700
Text HLabel 7600 9700 2    50   Input ~ 0
FP-FPD[0..7]
Text Label 7000 9700 0    50   ~ 0
FP-FPD[0..7]
Wire Wire Line
	7100 -4100 6550 -4100
Wire Wire Line
	7100 -4000 6550 -4000
Text Label 6550 -4100 0    50   ~ 0
~MEM
Text Label 6550 -4000 0    50   ~ 0
~IO
Text Label 8850 -5100 2    50   ~ 0
~FPOE17
Text Notes 8900 -5100 0    50   ~ 0
IR high
Text Label 8850 -3900 2    50   ~ 0
~FPOE28
Text Label 8850 -4200 2    50   ~ 0
~FPOE1
Text Notes 8900 -4200 0    50   ~ 0
µCV mid
Text Notes 8900 -3300 0    50   ~ 0
AEXT
Text Label 8850 -3300 2    50   ~ 0
~FPOE4
Text Label 8850 -2600 2    50   ~ 0
~FPOE9
Text Notes 8900 -2600 0    50   ~ 0
AC high
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 60E76092
P 13150 5400
F 0 "P1" H 13150 5567 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 13150 5476 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 13100 4500 50  0001 C CNN
F 3 "" H 13100 4500 50  0001 C CNN
	1    13150 5400
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 60E78699
P 13150 9000
F 0 "P1" H 13150 9167 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 13150 9076 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 13100 8100 50  0001 C CNN
F 3 "" H 13100 8100 50  0001 C CNN
	2    13150 9000
	1    0    0    -1  
$EndComp
Text Label 12200 1550 0    50   ~ 0
AB0
Text Label 12200 1650 0    50   ~ 0
AB1
Text Label 12200 1750 0    50   ~ 0
AB2
Text Label 12200 1850 0    50   ~ 0
AB3
Text Label 12200 1950 0    50   ~ 0
AB4
Text Label 12200 2050 0    50   ~ 0
AB5
Text Label 12200 2150 0    50   ~ 0
AB6
Text Label 12200 2250 0    50   ~ 0
AB7
Text Label 12200 2350 0    50   ~ 0
AB8
Text Label 12200 2450 0    50   ~ 0
AB9
Text Label 12200 2550 0    50   ~ 0
AB10
Text Label 12200 2650 0    50   ~ 0
AB11
Text Label 12200 2750 0    50   ~ 0
AB12
Text Label 12200 2850 0    50   ~ 0
AB13
Text Label 12200 2950 0    50   ~ 0
AB14
Text Label 12200 3050 0    50   ~ 0
AB15
Text Label 12200 3150 0    50   ~ 0
AB16
Text Label 12200 3250 0    50   ~ 0
AB17
Text Label 12200 3350 0    50   ~ 0
AB18
Text Label 12200 3450 0    50   ~ 0
AB19
Text Label 12200 3550 0    50   ~ 0
AB20
Text Label 12200 3650 0    50   ~ 0
AB21
Text Label 12200 3750 0    50   ~ 0
AB22
Text Label 12200 3850 0    50   ~ 0
AB23
Text Label 12200 4050 0    50   ~ 0
~IRQ0
Text Label 12200 4150 0    50   ~ 0
~IRQ1
Text Label 12200 4250 0    50   ~ 0
~IRQ2
Text Label 12200 4350 0    50   ~ 0
~IRQ3
Text Label 12200 4450 0    50   ~ 0
~IRQ4
Text Label 12200 4550 0    50   ~ 0
~IRQ5
Text Label 12200 4650 0    50   ~ 0
~IRQ6
Text Label 12200 4750 0    50   ~ 0
~IRQ7
Text Label 14050 2550 2    50   ~ 0
DB0
Text Label 14050 2650 2    50   ~ 0
DB1
Text Label 14050 2750 2    50   ~ 0
DB2
Text Label 14050 2850 2    50   ~ 0
DB3
Text Label 14050 2950 2    50   ~ 0
DB4
Text Label 14050 3050 2    50   ~ 0
DB5
Text Label 14050 3150 2    50   ~ 0
DB6
Text Label 14050 3250 2    50   ~ 0
DB7
Text Label 14050 3350 2    50   ~ 0
DB8
Text Label 14050 3450 2    50   ~ 0
DB9
Text Label 14050 3550 2    50   ~ 0
DB10
Text Label 14050 3650 2    50   ~ 0
DB11
Text Label 14050 3750 2    50   ~ 0
DB12
Text Label 14050 3850 2    50   ~ 0
DB13
Text Label 14050 3950 2    50   ~ 0
DB14
Text Label 14050 4050 2    50   ~ 0
DB15
Wire Wire Line
	14100 6100 13750 6100
Wire Wire Line
	14100 6200 13750 6200
Wire Wire Line
	14100 6300 13750 6300
Wire Wire Line
	14100 6400 13750 6400
Wire Wire Line
	14100 6500 13750 6500
Wire Wire Line
	14100 6700 13750 6700
Wire Wire Line
	14100 6800 13750 6800
Wire Wire Line
	14100 6900 13750 6900
Wire Wire Line
	14100 7000 13750 7000
Wire Wire Line
	14100 7100 13750 7100
Wire Wire Line
	14100 7300 13750 7300
Wire Wire Line
	14100 7400 13750 7400
Wire Wire Line
	14100 7500 13750 7500
Wire Wire Line
	14100 7600 13750 7600
Wire Wire Line
	14100 7800 13750 7800
Wire Wire Line
	14100 7900 13750 7900
Wire Wire Line
	14100 8000 13750 8000
Wire Wire Line
	14100 8100 13750 8100
Wire Wire Line
	13750 5900 14100 5900
Wire Wire Line
	13750 5800 14100 5800
Wire Wire Line
	13750 5700 14100 5700
Wire Wire Line
	13750 5500 14100 5500
Wire Wire Line
	13750 8400 13800 8400
Wire Wire Line
	13800 8400 13800 8450
$Comp
L power:GND #PWR0157
U 1 1 60F75F81
P 13800 8450
F 0 "#PWR0157" H 13800 8200 50  0001 C CNN
F 1 "GND" H 13805 8277 50  0000 C CNN
F 2 "" H 13800 8450 50  0001 C CNN
F 3 "" H 13800 8450 50  0001 C CNN
	1    13800 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 8000 12100 8000
Wire Wire Line
	12550 8100 12100 8100
Wire Wire Line
	12550 8200 12100 8200
Wire Wire Line
	12550 8300 12100 8300
Wire Wire Line
	12550 8400 12100 8400
Wire Wire Line
	12550 5700 12200 5700
Wire Wire Line
	12550 5800 12200 5800
Wire Wire Line
	12550 5900 12200 5900
Wire Wire Line
	12550 6000 12200 6000
Wire Wire Line
	12550 6100 12200 6100
Wire Wire Line
	12550 1050 12500 1050
Wire Wire Line
	12500 1050 12500 1000
$Comp
L power:+5V #PWR0158
U 1 1 610B7E9D
P 12500 1000
F 0 "#PWR0158" H 12500 850 50  0001 C CNN
F 1 "+5V" H 12515 1173 50  0000 C CNN
F 2 "" H 12500 1000 50  0001 C CNN
F 3 "" H 12500 1000 50  0001 C CNN
	1    12500 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 5500 12500 5500
Wire Wire Line
	12500 5500 12500 5450
$Comp
L power:+5V #PWR0159
U 1 1 610B88AF
P 12500 5450
F 0 "#PWR0159" H 12500 5300 50  0001 C CNN
F 1 "+5V" H 12515 5623 50  0000 C CNN
F 2 "" H 12500 5450 50  0001 C CNN
F 3 "" H 12500 5450 50  0001 C CNN
	1    12500 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	12550 9100 11950 9100
Wire Wire Line
	12550 9200 11950 9200
Wire Wire Line
	12550 11100 11950 11100
Wire Wire Line
	14150 9100 13750 9100
Wire Wire Line
	14150 9200 13750 9200
Wire Wire Line
	14150 9300 13750 9300
Wire Wire Line
	14150 9400 13750 9400
Wire Wire Line
	14150 9500 13750 9500
Wire Wire Line
	14150 9600 13750 9600
Wire Wire Line
	14150 9700 13750 9700
Wire Wire Line
	14150 9800 13750 9800
Wire Wire Line
	14100 10600 13750 10600
Wire Wire Line
	14100 10700 13750 10700
Wire Wire Line
	14100 10800 13750 10800
Wire Wire Line
	14100 10900 13750 10900
Wire Wire Line
	14100 11000 13750 11000
Text Label 12200 1250 0    50   ~ 0
~RESET
Text Label 12200 1350 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	12100 1350 12550 1350
Wire Wire Line
	12100 1550 12550 1550
Wire Wire Line
	12100 1650 12550 1650
Wire Wire Line
	12100 1750 12550 1750
Wire Wire Line
	12100 1850 12550 1850
Wire Wire Line
	12100 1950 12550 1950
Wire Wire Line
	12100 2050 12550 2050
Wire Wire Line
	12100 2150 12550 2150
Wire Wire Line
	12100 2250 12550 2250
Wire Wire Line
	12100 2350 12550 2350
Wire Wire Line
	12100 2450 12550 2450
Wire Wire Line
	12100 2550 12550 2550
Wire Wire Line
	12100 2650 12550 2650
Wire Wire Line
	12100 2750 12550 2750
Wire Wire Line
	12100 2850 12550 2850
Wire Wire Line
	12100 2950 12550 2950
Wire Wire Line
	12100 3050 12550 3050
Wire Wire Line
	12100 3150 12550 3150
Wire Wire Line
	12100 3250 12550 3250
Wire Wire Line
	12100 3350 12550 3350
Wire Wire Line
	12100 3450 12550 3450
Wire Wire Line
	12100 3550 12550 3550
Wire Wire Line
	12100 3650 12550 3650
Wire Wire Line
	12100 3750 12550 3750
Wire Wire Line
	12100 3850 12550 3850
Wire Wire Line
	12100 4050 12550 4050
Wire Wire Line
	12100 4150 12550 4150
Wire Wire Line
	12100 4250 12550 4250
Wire Wire Line
	12100 4350 12550 4350
Wire Wire Line
	12100 4450 12550 4450
Wire Wire Line
	12100 4550 12550 4550
Wire Wire Line
	12100 4650 12550 4650
Wire Wire Line
	12100 4750 12550 4750
Entry Wire Line
	12000 1450 12100 1550
Entry Wire Line
	12000 1550 12100 1650
Entry Wire Line
	12000 1650 12100 1750
Entry Wire Line
	12000 1750 12100 1850
Entry Wire Line
	12000 1850 12100 1950
Entry Wire Line
	12000 1950 12100 2050
Entry Wire Line
	12000 2050 12100 2150
Entry Wire Line
	12000 2150 12100 2250
Entry Wire Line
	12000 2250 12100 2350
Entry Wire Line
	12000 2350 12100 2450
Entry Wire Line
	12000 2450 12100 2550
Entry Wire Line
	12000 2550 12100 2650
Entry Wire Line
	12000 2650 12100 2750
Entry Wire Line
	12000 2750 12100 2850
Entry Wire Line
	12000 2850 12100 2950
Entry Wire Line
	12000 2950 12100 3050
Entry Wire Line
	12000 3050 12100 3150
Entry Wire Line
	12000 3150 12100 3250
Entry Wire Line
	12000 3250 12100 3350
Entry Wire Line
	12000 3350 12100 3450
Entry Wire Line
	12000 3450 12100 3550
Entry Wire Line
	12000 3550 12100 3650
Entry Wire Line
	12000 3650 12100 3750
Entry Wire Line
	12000 3750 12100 3850
Entry Wire Line
	12000 3950 12100 4050
Entry Wire Line
	12000 4050 12100 4150
Entry Wire Line
	12000 4150 12100 4250
Entry Wire Line
	12000 4250 12100 4350
Entry Wire Line
	12000 4350 12100 4450
Entry Wire Line
	12000 4450 12100 4550
Entry Wire Line
	12000 4550 12100 4650
Entry Wire Line
	12000 4650 12100 4750
Entry Wire Line
	12000 6200 12100 6300
Entry Wire Line
	12000 6300 12100 6400
Entry Wire Line
	12000 6400 12100 6500
Entry Wire Line
	12000 6500 12100 6600
Entry Wire Line
	12000 6600 12100 6700
Entry Wire Line
	12000 6700 12100 6800
Entry Wire Line
	12000 6800 12100 6900
Entry Wire Line
	12000 6900 12100 7000
Entry Wire Line
	12000 7000 12100 7100
Entry Wire Line
	12000 7100 12100 7200
Entry Wire Line
	12000 7200 12100 7300
Entry Wire Line
	12000 7300 12100 7400
Entry Wire Line
	12000 7400 12100 7500
Entry Wire Line
	12000 7500 12100 7600
Entry Wire Line
	12000 7600 12100 7700
Entry Wire Line
	12000 7700 12100 7800
Wire Wire Line
	12100 6300 12550 6300
Wire Wire Line
	12100 6400 12550 6400
Wire Wire Line
	12100 6500 12550 6500
Wire Wire Line
	12100 6600 12550 6600
Wire Wire Line
	12100 6700 12550 6700
Wire Wire Line
	12100 6800 12550 6800
Wire Wire Line
	12100 6900 12550 6900
Wire Wire Line
	12100 7000 12550 7000
Wire Wire Line
	12100 7100 12550 7100
Wire Wire Line
	12100 7200 12550 7200
Wire Wire Line
	12100 7300 12550 7300
Wire Wire Line
	12100 7400 12550 7400
Wire Wire Line
	12100 7500 12550 7500
Wire Wire Line
	12100 7600 12550 7600
Wire Wire Line
	12100 7700 12550 7700
Wire Wire Line
	12100 7800 12550 7800
Text Label 12200 6300 0    50   ~ 0
IBUS0
Text Label 12200 6400 0    50   ~ 0
IBUS1
Text Label 12200 6500 0    50   ~ 0
IBUS2
Text Label 12200 6600 0    50   ~ 0
IBUS3
Text Label 12200 6700 0    50   ~ 0
IBUS4
Text Label 12200 6800 0    50   ~ 0
IBUS5
Text Label 12200 6900 0    50   ~ 0
IBUS6
Text Label 12200 7000 0    50   ~ 0
IBUS7
Text Label 12200 7100 0    50   ~ 0
IBUS8
Text Label 12200 7200 0    50   ~ 0
IBUS9
Text Label 12200 7300 0    50   ~ 0
IBUS10
Text Label 12200 7400 0    50   ~ 0
IBUS11
Text Label 12200 7500 0    50   ~ 0
IBUS12
Text Label 12200 7600 0    50   ~ 0
IBUS13
Text Label 12200 7700 0    50   ~ 0
IBUS14
Text Label 12200 7800 0    50   ~ 0
IBUS15
Text Label 14050 6100 2    50   ~ 0
RADDR0
Text Label 14050 6200 2    50   ~ 0
RADDR1
Text Label 14050 6300 2    50   ~ 0
RADDR2
Text Label 14050 6400 2    50   ~ 0
RADDR3
Text Label 14050 6500 2    50   ~ 0
RADDR4
Text Label 14050 6700 2    50   ~ 0
WADDR0
Text Label 14050 6800 2    50   ~ 0
WADDR1
Text Label 14050 6900 2    50   ~ 0
WADDR2
Text Label 14050 7000 2    50   ~ 0
WADDR3
Text Label 14050 7100 2    50   ~ 0
WADDR4
Text Label 14050 7300 2    50   ~ 0
ACTION0
Text Label 14050 7400 2    50   ~ 0
ACTION1
Text Label 14050 7500 2    50   ~ 0
ACTION2
Text Label 14050 7600 2    50   ~ 0
ACTION3
Text Label 14050 7800 2    50   ~ 0
COND0
Text Label 14050 7900 2    50   ~ 0
COND1
Text Label 14050 8000 2    50   ~ 0
COND2
Text Label 14050 8100 2    50   ~ 0
COND3
Text Label 12200 8000 0    50   ~ 0
FV
Text Label 12200 8100 0    50   ~ 0
FL
Text Label 12200 8200 0    50   ~ 0
FZ
Text Label 12200 8300 0    50   ~ 0
FN
Text Label 12200 8400 0    50   ~ 0
~WRITE-FL
Text Label 14050 5700 2    50   ~ 0
~END
Text Label 14050 5800 2    50   ~ 0
~ENDEXT
Text Label 14050 5900 2    50   ~ 0
~SKIPEXT
Wire Wire Line
	12100 1250 12550 1250
Text HLabel 12100 1250 0    50   UnSpc ~ 0
~RESET
Text HLabel 12200 6100 0    50   UnSpc ~ 0
T34
NoConn ~ 12100 8400
NoConn ~ 12100 8000
NoConn ~ 12100 8100
NoConn ~ 12100 8200
NoConn ~ 12100 8300
Text Label 14150 9100 2    50   ~ 0
CFT-FPD0
Text Label 14150 9200 2    50   ~ 0
CFT-FPD1
Text Label 14150 9300 2    50   ~ 0
CFT-FPD2
Text Label 14150 9400 2    50   ~ 0
CFT-FPD3
Text Label 14150 9500 2    50   ~ 0
CFT-FPD4
Text Label 14150 9600 2    50   ~ 0
CFT-FPD5
Text Label 14150 9700 2    50   ~ 0
CFT-FPD6
Text Label 14150 9800 2    50   ~ 0
CFT-FPD7
Wire Wire Line
	8800 9050 8450 9050
Wire Wire Line
	8800 9150 8450 9150
Wire Wire Line
	8800 9250 8450 9250
Wire Wire Line
	8800 9350 8450 9350
Wire Wire Line
	8800 9450 8450 9450
Wire Wire Line
	8800 9550 8450 9550
Wire Wire Line
	8800 9650 8450 9650
Wire Wire Line
	8800 9750 8450 9750
Wire Wire Line
	8800 9850 8450 9850
Wire Wire Line
	8800 9950 8450 9950
Wire Wire Line
	8800 10050 8450 10050
Wire Wire Line
	8800 10150 8450 10150
Wire Wire Line
	9650 9050 9300 9050
Wire Wire Line
	9650 9150 9300 9150
Wire Wire Line
	9650 9250 9300 9250
Wire Wire Line
	9650 9350 9300 9350
Wire Wire Line
	9650 9450 9300 9450
Wire Wire Line
	9650 9550 9300 9550
Wire Wire Line
	9650 9650 9300 9650
Wire Wire Line
	9650 9750 9300 9750
Wire Wire Line
	9650 9850 9300 9850
Wire Wire Line
	9650 9950 9300 9950
Wire Wire Line
	9650 10050 9300 10050
Wire Wire Line
	9650 10150 9300 10150
Text Label 8450 9050 0    50   ~ 0
FPA0
Text Label 9650 9050 2    50   ~ 0
FPA1
Text Label 8450 9150 0    50   ~ 0
FP-FPD7
Text Label 8450 9550 0    50   ~ 0
~ROW1
Text Label 9650 9550 2    50   ~ 0
~ROW2
Text Label 8450 9650 0    50   ~ 0
~ROW3
Text Label 9650 9650 2    50   ~ 0
~ROW4
Text Label 8450 9750 0    50   ~ 0
~ROW5
$Comp
L power:+5V #PWR01
U 1 1 61A879D6
P 8750 8900
F 0 "#PWR01" H 8750 8750 50  0001 C CNN
F 1 "+5V" H 8765 9073 50  0000 C CNN
F 2 "" H 8750 8900 50  0001 C CNN
F 3 "" H 8750 8900 50  0001 C CNN
	1    8750 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 8900 8750 8950
Wire Wire Line
	8750 8950 8800 8950
$Comp
L power:+5V #PWR02
U 1 1 61AB4B50
P 9350 8900
F 0 "#PWR02" H 9350 8750 50  0001 C CNN
F 1 "+5V" H 9365 9073 50  0000 C CNN
F 2 "" H 9350 8900 50  0001 C CNN
F 3 "" H 9350 8900 50  0001 C CNN
	1    9350 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 8950 9350 8950
Wire Wire Line
	9350 8950 9350 8900
Wire Wire Line
	8800 10250 8450 10250
$Comp
L power:GND #PWR03
U 1 1 61B106C5
P 8750 10400
F 0 "#PWR03" H 8750 10150 50  0001 C CNN
F 1 "GND" H 8755 10227 50  0000 C CNN
F 2 "" H 8750 10400 50  0001 C CNN
F 3 "" H 8750 10400 50  0001 C CNN
	1    8750 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 10400 8750 10350
Wire Wire Line
	8750 10350 8800 10350
$Comp
L power:GND #PWR04
U 1 1 61B3CE62
P 9350 10400
F 0 "#PWR04" H 9350 10150 50  0001 C CNN
F 1 "GND" H 9355 10227 50  0000 C CNN
F 2 "" H 9350 10400 50  0001 C CNN
F 3 "" H 9350 10400 50  0001 C CNN
	1    9350 10400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 10250 9350 10250
Wire Wire Line
	9350 10250 9350 10350
Wire Wire Line
	9300 10350 9350 10350
Connection ~ 9350 10350
Wire Wire Line
	9350 10350 9350 10400
Text Label 9650 9750 2    50   ~ 0
SWA0
Text Label 8450 9850 0    50   ~ 0
SWA1
Text Label 9650 9850 2    50   ~ 0
SWA2
Text Label 8450 9950 0    50   ~ 0
SWA3
Text Label 9650 9950 2    50   ~ 0
SWD0
Text Label 8450 10050 0    50   ~ 0
SWD1
Text Label 9650 10050 2    50   ~ 0
SWD2
Text Label 8450 10150 0    50   ~ 0
SWD3
Text Label 9650 10150 2    50   ~ 0
~LTSON
Text Label 8450 10250 0    50   ~ 0
POWER
Text Notes 8250 11450 0    50   ~ 0
Note: this is for front panel moduiles with\nrevision 1951 only! For newer revisions,\nthe order of FPD0-7 must be reversed\nwith a twist in the ribbon cable between\nwires 3 and 12.\n\nThe POWER input may not be needed if\nthe key switch is wired directly to the\npower supply.
$Comp
L Connector_Generic:Conn_02x15_Odd_Even J2
U 1 1 615879D6
P 9000 9650
F 0 "J2" H 9050 10475 50  0000 C CNN
F 1 "Conn_02x15_Odd_Even" H 9050 10476 50  0001 C CNN
F 2 "Connector_IDC:IDC-Header_2x15_P2.54mm_Horizontal" H 9000 9650 50  0001 C CNN
F 3 "~" H 9000 9650 50  0001 C CNN
	1    9000 9650
	1    0    0    -1  
$EndComp
Entry Wire Line
	8350 9050 8450 9150
Wire Bus Line
	8350 9050 8350 9700
Text Label 8350 9700 1    50   ~ 0
FP-FPD[0..7]
Entry Wire Line
	4800 -5000 4900 -4900
Entry Wire Line
	4800 -4900 4900 -4800
Wire Wire Line
	4250 -4900 4800 -4900
Text Notes 5000 -5200 0    50   ~ 0
Flipped to account for\nFront Panel Module\nlayout.
Entry Wire Line
	4800 -5600 4900 -5500
Entry Wire Line
	4800 -5500 4900 -5400
Entry Wire Line
	4800 -5400 4900 -5300
Entry Wire Line
	4800 -5300 4900 -5200
Entry Wire Line
	4800 -5200 4900 -5100
Entry Wire Line
	4800 -5100 4900 -5000
Text Label 4900 -5500 0    50   ~ 0
FP-FPD[0..7]
Wire Wire Line
	4800 -5600 4250 -5600
Text Label 4250 -5600 0    50   ~ 0
FP-FPD0
Text Label 4250 -5500 0    50   ~ 0
FP-FPD1
Text Label 4250 -5400 0    50   ~ 0
FP-FPD2
Text Label 4250 -5300 0    50   ~ 0
FP-FPD3
Text Label 4250 -5200 0    50   ~ 0
FP-FPD4
Text Label 4250 -5100 0    50   ~ 0
FP-FPD5
Text Label 4250 -5000 0    50   ~ 0
FP-FPD6
Wire Wire Line
	4800 -5500 4250 -5500
Wire Wire Line
	4800 -5400 4250 -5400
Wire Wire Line
	4800 -5300 4250 -5300
Wire Wire Line
	4800 -5200 4250 -5200
Wire Wire Line
	4800 -5100 4250 -5100
Wire Wire Line
	4800 -5000 4250 -5000
Text Label 4250 -4900 0    50   ~ 0
FP-FPD7
Text Label 2550 -3100 0    50   ~ 0
COND[0..3]
Wire Bus Line
	3100 -3100 2550 -3100
Text HLabel 2550 -3100 0    50   UnSpc ~ 0
COND[0..3]
Text HLabel 12100 1350 0    50   UnSpc ~ 0
~RSTHOLD
$Comp
L power:GND #PWR0176
U 1 1 673725FC
P 13800 4850
F 0 "#PWR0176" H 13800 4600 50  0001 C CNN
F 1 "GND" H 13805 4677 50  0000 C CNN
F 2 "" H 13800 4850 50  0001 C CNN
F 3 "" H 13800 4850 50  0001 C CNN
	1    13800 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13750 4750 13800 4750
Wire Wire Line
	13800 4750 13800 4850
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 60E74838
P 13150 950
F 0 "P2" H 13150 1117 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 13150 1026 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 13025 75  50  0001 C CNN
F 3 "" H 13025 75  50  0001 C CNN
	1    13150 950 
	1    0    0    -1  
$EndComp
Text Label 14150 1950 2    50   ~ 0
~WS
Text Label 14150 2050 2    50   ~ 0
~WAITING
Text Label 14150 2150 2    50   ~ 0
~HALT
Text Label 14150 2250 2    50   ~ 0
~IRQ
Text Label 14150 2350 2    50   ~ 0
~IRQS
Text Label 14150 1550 2    50   ~ 0
~SYSDEV
Text Label 14150 1650 2    50   ~ 0
~IODEV1XX
Text Label 14150 1750 2    50   ~ 0
~IODEV2XX
Text Label 14150 1850 2    50   ~ 0
~IODEV3XX
Text Label 14150 1450 2    50   ~ 0
T34-EXP
Text Label 14150 1350 2    50   ~ 0
~W
Text Label 14150 1250 2    50   ~ 0
~R
Text Label 14150 1150 2    50   ~ 0
~IO
Text Label 14150 1050 2    50   ~ 0
~MEM
Wire Wire Line
	13750 1050 14200 1050
Wire Wire Line
	13750 1150 14200 1150
Wire Wire Line
	13750 1250 14200 1250
Wire Wire Line
	13750 1350 14200 1350
Wire Wire Line
	13750 1450 14200 1450
Wire Wire Line
	13750 1550 14200 1550
Wire Wire Line
	13750 1650 14200 1650
Wire Wire Line
	13750 1750 14200 1750
Wire Wire Line
	13750 1850 14200 1850
Wire Wire Line
	13750 1950 14200 1950
Wire Wire Line
	13750 2050 14200 2050
Wire Wire Line
	13750 2150 14200 2150
Wire Wire Line
	13750 2250 14200 2250
Wire Wire Line
	13750 2350 14200 2350
Wire Wire Line
	13750 2550 14200 2550
Wire Wire Line
	13750 2650 14200 2650
Wire Wire Line
	13750 2750 14200 2750
Wire Wire Line
	13750 2850 14200 2850
Wire Wire Line
	13750 2950 14200 2950
Wire Wire Line
	13750 3050 14200 3050
Wire Wire Line
	13750 3150 14200 3150
Wire Wire Line
	13750 3250 14200 3250
Wire Wire Line
	13750 3350 14200 3350
Wire Wire Line
	13750 3450 14200 3450
Wire Wire Line
	13750 3550 14200 3550
Wire Wire Line
	13750 3650 14200 3650
Wire Wire Line
	13750 3750 14200 3750
Wire Wire Line
	13750 3850 14200 3850
Wire Wire Line
	13750 3950 14200 3950
Wire Wire Line
	13750 4050 14200 4050
Text HLabel 14200 2150 2    50   UnSpc ~ 0
~HALT
Text Label 12000 11000 0    50   ~ 0
~FPRAM~∕ROM
Text Label 12000 11100 0    50   ~ 0
FPFETCH∕~EXEC
Text Label 14100 10400 2    50   ~ 0
~FPIEN
Text Label 14100 10500 2    50   ~ 0
~FPIRF
Wire Wire Line
	13750 11100 14100 11100
Text Label 12000 9300 0    50   ~ 0
~FPCTX
Text Label 12000 9400 0    50   ~ 0
~FPIRL
Text Label 12000 9500 0    50   ~ 0
~FPµA0
Text Label 12000 9600 0    50   ~ 0
~FPµC0
Text Label 12000 9800 0    50   ~ 0
~FPSPL
Text Label 12000 9900 0    50   ~ 0
~FPACL
Text Label 12000 10000 0    50   ~ 0
~FPµC2
Text Label 12000 10100 0    50   ~ 0
~FPIRH
Text Label 12000 10200 0    50   ~ 0
~FPFLAGS
Text Label 12000 10300 0    50   ~ 0
~FPAEXT
Text Label 12000 10400 0    50   ~ 0
~FPPCL
Text Label 12000 10500 0    50   ~ 0
~FPPCH
Text Label 12000 10600 0    50   ~ 0
~FPSPH
Text Label 12000 10700 0    50   ~ 0
~FPACH
Text Label 12000 10800 0    50   ~ 0
~FPDRL
Text Label 12000 10900 0    50   ~ 0
~FPDRH
Text Label 12000 9700 0    50   ~ 0
~FPµC1
NoConn ~ 14100 10600
NoConn ~ 14100 10700
NoConn ~ 14100 10800
NoConn ~ 14100 10900
NoConn ~ 14100 11000
NoConn ~ 14100 11100
Text HLabel 11950 9300 0    50   Input ~ 0
~FPCTX
Wire Wire Line
	11950 9300 12550 9300
Text HLabel 11950 9400 0    50   Input ~ 0
~FPIRL
Text HLabel 11950 9500 0    50   Input ~ 0
~FPµA0
Wire Wire Line
	11950 9400 12550 9400
Wire Wire Line
	12550 11000 11950 11000
Wire Wire Line
	11950 9500 12550 9500
Wire Wire Line
	11950 9600 12550 9600
Wire Wire Line
	11950 9700 12550 9700
Wire Wire Line
	11950 9800 12550 9800
Wire Wire Line
	11950 9900 12550 9900
Wire Wire Line
	11950 10000 12550 10000
Wire Wire Line
	11950 10100 12550 10100
Wire Wire Line
	11950 10200 12550 10200
Wire Wire Line
	11950 10300 12550 10300
Wire Wire Line
	11950 10400 12550 10400
Wire Wire Line
	11950 10500 12550 10500
Wire Wire Line
	11950 10600 12550 10600
Wire Wire Line
	11950 10700 12550 10700
Wire Wire Line
	11950 10800 12550 10800
Wire Wire Line
	11950 10900 12550 10900
Text HLabel 11950 9600 0    50   Input ~ 0
~FPµC0
Text HLabel 11950 9700 0    50   Input ~ 0
~FPµC1
Text HLabel 11950 9800 0    50   Input ~ 0
~FPSPL
Text HLabel 11950 9900 0    50   Input ~ 0
~FPACL
Text HLabel 11950 10000 0    50   Input ~ 0
~FPµC2
Text HLabel 11950 10100 0    50   Input ~ 0
~FPIRH
Text HLabel 11950 10200 0    50   Input ~ 0
~FPFLAGS
Text HLabel 11950 10300 0    50   Input ~ 0
~FPAEXT
Text HLabel 11950 10400 0    50   Input ~ 0
~FPPCL
Text HLabel 11950 10500 0    50   Input ~ 0
~FPPCH
Text HLabel 11950 10600 0    50   Input ~ 0
~FPSHP
Text HLabel 11950 10700 0    50   Input ~ 0
~FPACH
Text HLabel 11950 10800 0    50   Input ~ 0
~FPDRL
Text HLabel 11950 10900 0    50   Input ~ 0
~FPDRH
Wire Wire Line
	13750 10400 14150 10400
Wire Wire Line
	13750 10500 14150 10500
Text HLabel 14150 10400 2    50   Input ~ 0
~FPIEN
Text HLabel 14150 10500 2    50   Input ~ 0
~FPIRF
NoConn ~ 14100 5500
NoConn ~ 14200 1450
Wire Bus Line
	4900 -4200 4900 -3900
Wire Bus Line
	4900 -3800 4900 -3500
Wire Bus Line
	4900 -4700 4900 -4300
Wire Bus Line
	12000 3950 12000 4650
Wire Bus Line
	4900 -5500 4900 -4800
Wire Bus Line
	12000 6200 12000 7700
Wire Bus Line
	12000 1450 12000 3750
Entry Bus Bus
	3000 4000 3100 4100
Text HLabel 1900 4000 0    50   Input ~ 0
CFT-FPD[0..7]
$Comp
L alexios:74HC541 U28
U 1 1 61794398
P 4650 4950
F 0 "U28" H 4650 5717 50  0000 C CNN
F 1 "74HC541" H 4650 5626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 4950 50  0001 C CNN
	1    4650 4950
	1    0    0    -1  
$EndComp
Text Label 4000 5350 2    50   ~ 0
~PANELEN
Wire Wire Line
	4100 5450 4150 5450
Text HLabel 3600 5350 0    50   Input ~ 0
~PANELEN
Text Label 5450 4750 2    50   ~ 0
FPD3
Text Label 5450 4650 2    50   ~ 0
FPD2
Text Label 5450 4550 2    50   ~ 0
FPD1
Text Label 5450 4450 2    50   ~ 0
FPD0
Wire Wire Line
	5500 4750 5150 4750
Wire Wire Line
	5500 4650 5150 4650
Wire Wire Line
	5500 4550 5150 4550
Wire Wire Line
	5500 4450 5150 4450
Text Label 5450 5150 2    50   ~ 0
FPD7
Text Label 5450 5050 2    50   ~ 0
FPD6
Text Label 5450 4950 2    50   ~ 0
FPD5
Text Label 5450 4850 2    50   ~ 0
FPD4
Wire Wire Line
	5500 5150 5150 5150
Wire Wire Line
	5500 5050 5150 5050
Wire Wire Line
	5500 4950 5150 4950
Wire Wire Line
	5500 4850 5150 4850
Entry Wire Line
	5600 4350 5500 4450
Entry Wire Line
	5600 4450 5500 4550
Entry Wire Line
	5600 4550 5500 4650
Entry Wire Line
	5600 4650 5500 4750
Entry Wire Line
	5600 4750 5500 4850
Entry Wire Line
	5600 4850 5500 4950
Entry Wire Line
	5600 4950 5500 5050
Entry Wire Line
	5600 5050 5500 5150
Text Label 3250 5150 0    50   ~ 0
CFT-FPD7
Text Label 3250 5050 0    50   ~ 0
CFT-FPD6
Text Label 3250 4950 0    50   ~ 0
CFT-FPD5
Text Label 3250 4850 0    50   ~ 0
CFT-FPD4
Text Label 3250 4750 0    50   ~ 0
CFT-FPD3
Text Label 3250 4650 0    50   ~ 0
CFT-FPD2
Text Label 3250 4550 0    50   ~ 0
CFT-FPD1
Text Label 3250 4450 0    50   ~ 0
CFT-FPD0
Text Label 2900 5150 2    50   ~ 0
CFT-FPD7
Text Label 2900 5050 2    50   ~ 0
CFT-FPD6
Text Label 2900 4950 2    50   ~ 0
CFT-FPD5
Text Label 2900 4850 2    50   ~ 0
CFT-FPD4
Text Label 2900 4750 2    50   ~ 0
CFT-FPD3
Text Label 2900 4650 2    50   ~ 0
CFT-FPD2
Text Label 2900 4550 2    50   ~ 0
CFT-FPD1
Text Label 2900 4450 2    50   ~ 0
CFT-FPD0
Entry Bus Bus
	5700 4000 5600 4100
Wire Bus Line
	9850 4000 5700 4000
Text HLabel 9850 4000 2    50   UnSpc ~ 0
FPD[0..7]
$Comp
L alexios:74HC541 U29
U 1 1 61794399
P 6550 4950
F 0 "U29" H 6550 5717 50  0000 C CNN
F 1 "74HC541" H 6550 5626 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6550 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6550 4950 50  0001 C CNN
	1    6550 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5350 6000 5350
Wire Wire Line
	6050 5450 6000 5450
$Comp
L power:GND #PWR0142
U 1 1 6179439A
P 6000 5500
F 0 "#PWR0142" H 6000 5250 50  0001 C CNN
F 1 "GND" H 6005 5327 50  0000 C CNN
F 2 "" H 6000 5500 50  0001 C CNN
F 3 "" H 6000 5500 50  0001 C CNN
	1    6000 5500
	1    0    0    -1  
$EndComp
Entry Wire Line
	9550 4350 9450 4450
Entry Wire Line
	9550 4450 9450 4550
Entry Wire Line
	9550 4550 9450 4650
Entry Wire Line
	9550 4650 9450 4750
Entry Wire Line
	9550 4750 9450 4850
Entry Wire Line
	9550 4850 9450 4950
Entry Wire Line
	9550 4950 9450 5050
Entry Wire Line
	9550 5050 9450 5150
Entry Wire Line
	5600 4350 5700 4450
Entry Wire Line
	5600 4450 5700 4550
Entry Wire Line
	5600 4550 5700 4650
Entry Wire Line
	5600 4650 5700 4750
Entry Wire Line
	5600 4750 5700 4850
Entry Wire Line
	5600 4850 5700 4950
Entry Wire Line
	5600 4950 5700 5050
Entry Wire Line
	5600 5050 5700 5150
Text Label 6000 4750 2    50   ~ 0
FPD3
Text Label 6000 4650 2    50   ~ 0
FPD2
Text Label 6000 4550 2    50   ~ 0
FPD1
Text Label 6000 4450 2    50   ~ 0
FPD0
Wire Wire Line
	6050 4750 5700 4750
Wire Wire Line
	6050 4650 5700 4650
Wire Wire Line
	6050 4550 5700 4550
Wire Wire Line
	6050 4450 5700 4450
Text Label 6000 5150 2    50   ~ 0
FPD7
Text Label 6000 5050 2    50   ~ 0
FPD6
Text Label 6000 4950 2    50   ~ 0
FPD5
Text Label 6000 4850 2    50   ~ 0
FPD4
Wire Wire Line
	6050 5150 5700 5150
Wire Wire Line
	6050 5050 5700 5050
Wire Wire Line
	6050 4950 5700 4950
Wire Wire Line
	6050 4850 5700 4850
Text HLabel 9850 4150 2    50   Output ~ 0
FP-FPD[0..7]
Wire Bus Line
	9850 4150 9650 4150
Entry Bus Bus
	9650 4150 9550 4250
Wire Wire Line
	6000 5350 6000 5450
Connection ~ 6000 5450
Wire Wire Line
	6000 5450 6000 5500
$Comp
L power:GND #PWR0145
U 1 1 5FDEF369
P 8050 5500
F 0 "#PWR0145" H 8050 5250 50  0001 C CNN
F 1 "GND" H 8055 5327 50  0000 C CNN
F 2 "" H 8050 5500 50  0001 C CNN
F 3 "" H 8050 5500 50  0001 C CNN
	1    8050 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D19
U 1 1 5FE16E3D
P 8850 5400
F 0 "D19" H 9100 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8750 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8850 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8750 5425 50  0001 C CNN
	1    8850 5400
	-1   0    0    -1  
$EndComp
$Comp
L alexios:PESD5V2S2UT D20
U 1 1 5FE16E43
P 9250 5400
F 0 "D20" H 9500 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 9150 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9250 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 9150 5425 50  0001 C CNN
	1    9250 5400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5FE492B5
P 8450 5500
F 0 "#PWR0146" H 8450 5250 50  0001 C CNN
F 1 "GND" H 8455 5327 50  0000 C CNN
F 2 "" H 8450 5500 50  0001 C CNN
F 3 "" H 8450 5500 50  0001 C CNN
	1    8450 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0147
U 1 1 5FE49524
P 8850 5500
F 0 "#PWR0147" H 8850 5250 50  0001 C CNN
F 1 "GND" H 8855 5327 50  0000 C CNN
F 2 "" H 8850 5500 50  0001 C CNN
F 3 "" H 8850 5500 50  0001 C CNN
	1    8850 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 5FE4971B
P 9250 5500
F 0 "#PWR0148" H 9250 5250 50  0001 C CNN
F 1 "GND" H 9255 5327 50  0000 C CNN
F 2 "" H 9250 5500 50  0001 C CNN
F 3 "" H 9250 5500 50  0001 C CNN
	1    9250 5500
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U28
U 2 1 6179438F
P 4650 6000
F 0 "U28" H 4830 6046 50  0000 L CNN
F 1 "74HC541" H 4830 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 4650 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 4650 6000 50  0001 C CNN
	2    4650 6000
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U29
U 2 1 5FE8DA93
P 6550 6000
F 0 "U29" H 6730 6046 50  0000 L CNN
F 1 "74HC541" H 6730 5955 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6550 6000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT541.pdf" H 6550 6000 50  0001 C CNN
	2    6550 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61794391
P 6200 6000
AR Path="/61794391" Ref="C?"  Part="1" 
AR Path="/60757845/61794391" Ref="C?"  Part="1" 
AR Path="/64FC7999/61794391" Ref="C?"  Part="1" 
AR Path="/60A2F3C0/61794391" Ref="C29"  Part="1" 
AR Path="/5FE640D1/61794391" Ref="C29"  Part="1" 
F 0 "C29" H 6109 6046 50  0000 R CNN
F 1 "100nF" H 6109 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6200 6000 50  0001 C CNN
F 3 "~" H 6200 6000 50  0001 C CNN
	1    6200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEB43DF
P 6200 5900
AR Path="/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEB43DF" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEB43DF" Ref="#PWR0143"  Part="1" 
AR Path="/5FE640D1/5FEB43DF" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 6200 5750 50  0001 C CNN
F 1 "+5V" H 6215 6073 50  0000 C CNN
F 2 "" H 6200 5900 50  0001 C CNN
F 3 "" H 6200 5900 50  0001 C CNN
	1    6200 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEB43E5
P 6200 6100
AR Path="/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEB43E5" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEB43E5" Ref="#PWR0144"  Part="1" 
AR Path="/5FE640D1/5FEB43E5" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 6200 5850 50  0001 C CNN
F 1 "GND" H 6205 5927 50  0000 C CNN
F 2 "" H 6200 6100 50  0001 C CNN
F 3 "" H 6200 6100 50  0001 C CNN
	1    6200 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FEBAF89
P 4300 6000
AR Path="/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/60757845/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/64FC7999/5FEBAF89" Ref="C?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF89" Ref="C28"  Part="1" 
AR Path="/5FE640D1/5FEBAF89" Ref="C28"  Part="1" 
F 0 "C28" H 4209 6046 50  0000 R CNN
F 1 "100nF" H 4209 5955 50  0000 R CNN
F 2 "alexios:C_SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4300 6000 50  0001 C CNN
F 3 "~" H 4300 6000 50  0001 C CNN
	1    4300 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEBAF8F
P 4300 5900
AR Path="/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEBAF8F" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF8F" Ref="#PWR0140"  Part="1" 
AR Path="/5FE640D1/5FEBAF8F" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 4300 5750 50  0001 C CNN
F 1 "+5V" H 4315 6073 50  0000 C CNN
F 2 "" H 4300 5900 50  0001 C CNN
F 3 "" H 4300 5900 50  0001 C CNN
	1    4300 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEBAF95
P 4300 6100
AR Path="/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/64FC7999/5FEBAF95" Ref="#PWR?"  Part="1" 
AR Path="/60A2F3C0/5FEBAF95" Ref="#PWR0141"  Part="1" 
AR Path="/5FE640D1/5FEBAF95" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 4300 5850 50  0001 C CNN
F 1 "GND" H 4305 5927 50  0000 C CNN
F 2 "" H 4300 6100 50  0001 C CNN
F 3 "" H 4300 6100 50  0001 C CNN
	1    4300 6100
	1    0    0    -1  
$EndComp
Connection ~ 6200 5900
Connection ~ 6200 6100
Entry Wire Line
	3200 5150 3100 5050
Entry Wire Line
	3200 5050 3100 4950
Entry Wire Line
	3200 4950 3100 4850
Entry Wire Line
	3200 4850 3100 4750
Entry Wire Line
	3200 4750 3100 4650
Entry Wire Line
	3200 4650 3100 4550
Entry Wire Line
	3200 4550 3100 4450
Entry Wire Line
	3200 4450 3100 4350
Wire Bus Line
	1900 4000 3000 4000
Entry Wire Line
	3000 5150 3100 5050
Entry Wire Line
	3000 5050 3100 4950
Entry Wire Line
	3000 4950 3100 4850
Entry Wire Line
	3000 4750 3100 4650
Entry Wire Line
	3000 4650 3100 4550
Entry Wire Line
	3000 4550 3100 4450
Entry Wire Line
	3000 4450 3100 4350
Entry Wire Line
	3000 4850 3100 4750
Wire Wire Line
	3000 5150 2450 5150
Wire Wire Line
	3000 5050 2450 5050
Wire Wire Line
	3000 4950 2450 4950
Wire Wire Line
	3000 4850 2450 4850
Wire Wire Line
	3000 4750 2450 4750
Wire Wire Line
	3000 4650 2450 4650
Wire Wire Line
	3000 4550 2450 4550
Wire Wire Line
	3000 4450 2450 4450
Wire Wire Line
	7500 4550 8350 4550
Wire Wire Line
	7500 4950 9150 4950
$Comp
L alexios:PESD5V2S2UT D18
U 1 1 61794389
P 8450 5400
F 0 "D18" H 8700 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8350 5150 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8450 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 8350 5425 50  0001 C CNN
	1    8450 5400
	-1   0    0    -1  
$EndComp
Text Notes 2050 5450 0    50   ~ 0
Optional; the backplane\nhas bus hold for FPD.
Wire Wire Line
	3600 5350 4150 5350
$Comp
L power:GND #PWR0163
U 1 1 6179439B
P 4100 5500
F 0 "#PWR0163" H 4100 5250 50  0001 C CNN
F 1 "GND" H 4105 5327 50  0000 C CNN
F 2 "" H 4100 5500 50  0001 C CNN
F 3 "" H 4100 5500 50  0001 C CNN
	1    4100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5450 4100 5500
Text Label 7500 4450 0    50   ~ 0
FP-FPD0
Text Label 7500 4550 0    50   ~ 0
FP-FPD1
Text Label 7500 4650 0    50   ~ 0
FP-FPD2
Text Label 7500 4750 0    50   ~ 0
FP-FPD3
Text Label 7500 4850 0    50   ~ 0
FP-FPD4
Text Label 7500 4950 0    50   ~ 0
FP-FPD5
Text Label 7500 5050 0    50   ~ 0
FP-FPD6
Text Label 7500 5150 0    50   ~ 0
FP-FPD7
Wire Wire Line
	8150 4450 9450 4450
Connection ~ 8150 4450
Wire Wire Line
	8150 5250 8150 4450
Wire Wire Line
	7500 4450 8150 4450
Wire Wire Line
	7500 4650 7950 4650
Wire Wire Line
	7950 4650 9450 4650
Connection ~ 7950 4650
Wire Wire Line
	7950 5250 7950 4650
$Comp
L alexios:PESD5V2S2UT D17
U 1 1 61794387
P 8050 5400
F 0 "D17" H 8350 5250 50  0000 R CNN
F 1 "PESD5V2S2UT" H 8850 5400 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8050 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PESDXS2UT_SERIES.pdf" V 7950 5425 50  0001 C CNN
	1    8050 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 4750 8550 4750
Wire Wire Line
	8350 5250 8350 4550
Connection ~ 8350 4550
Wire Wire Line
	8350 4550 9450 4550
Wire Wire Line
	8550 5250 8550 4750
Connection ~ 8550 4750
Wire Wire Line
	8550 4750 9450 4750
Wire Wire Line
	7500 4850 8950 4850
Wire Wire Line
	7500 5050 8750 5050
Wire Wire Line
	8750 5250 8750 5050
Connection ~ 8750 5050
Wire Wire Line
	8750 5050 9450 5050
Wire Wire Line
	8950 5250 8950 4850
Connection ~ 8950 4850
Wire Wire Line
	8950 4850 9450 4850
Connection ~ 9150 4950
Wire Wire Line
	7500 5150 9350 5150
Wire Wire Line
	9150 4950 9150 5250
Wire Wire Line
	9150 4950 9450 4950
Wire Wire Line
	9350 5250 9350 5150
Connection ~ 9350 5150
Wire Wire Line
	9350 5150 9450 5150
Wire Wire Line
	3200 5150 3750 5150
Wire Wire Line
	3200 5050 3750 5050
Wire Wire Line
	3200 4950 3750 4950
Wire Wire Line
	3200 4850 3750 4850
Wire Wire Line
	3200 4750 3750 4750
Wire Wire Line
	3200 4650 3750 4650
Wire Wire Line
	3200 4550 3750 4550
Wire Wire Line
	3200 4450 3750 4450
$Comp
L Device:R_Pack08 RN?
U 1 1 62CC0973
P 3950 4850
AR Path="/66CDCD87/61678CAE/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61B4C1AE/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61C8EF6B/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D0EECC/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D30C1E/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB558/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB5B6/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CD84/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CDCA/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C9920/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C999E/62CC0973" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C99B4/62CC0973" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/62CC0973" Ref="RN1701"  Part="1" 
AR Path="/5FE640D1/62CC0973" Ref="RN1701"  Part="1" 
F 0 "RN1701" V 3333 4850 50  0000 C CNN
F 1 "1kΩ" V 3424 4850 50  0000 C CNN
F 2 "alexios:Resistor-Pack-DIP-16_W7.62mm" V 4425 4850 50  0001 C CNN
F 3 "~" H 3950 4850 50  0001 C CNN
	1    3950 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 62CF0B32
P 2250 4850
AR Path="/60757845/62CF0B32" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/62CF0B32" Ref="RN1702"  Part="1" 
AR Path="/5FE640D1/62CF0B32" Ref="RN1702"  Part="1" 
F 0 "RN1702" V 1633 4850 50  0000 C CNN
F 1 "10kΩ" V 1724 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2725 4850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2250 4850 50  0001 C CNN
	1    2250 4850
	0    -1   1    0   
$EndComp
Wire Wire Line
	2000 4400 2000 4450
Wire Wire Line
	2050 4450 2000 4450
$Comp
L power:+5V #PWR0136
U 1 1 6091143C
P 2000 4400
F 0 "#PWR0136" H 2000 4250 50  0001 C CNN
F 1 "+5V" H 2015 4573 50  0000 C CNN
F 2 "" H 2000 4400 50  0001 C CNN
F 3 "" H 2000 4400 50  0001 C CNN
	1    2000 4400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Pack08 RN?
U 1 1 63156B4F
P 7300 4850
AR Path="/66CDCD87/61678CAE/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61B4C1AE/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61C8EF6B/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D0EECC/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61D30C1E/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB558/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/61FBB5B6/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CD84/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/6215CDCA/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C9920/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C999E/63156B4F" Ref="RN?"  Part="1" 
AR Path="/66CDCD87/621C99B4/63156B4F" Ref="RN?"  Part="1" 
AR Path="/60A2F3C0/63156B4F" Ref="RN1703"  Part="1" 
AR Path="/5FE640D1/63156B4F" Ref="RN1703"  Part="1" 
F 0 "RN1703" V 6683 4850 50  0000 C CNN
F 1 "1kΩ" V 6774 4850 50  0000 C CNN
F 2 "alexios:Resistor-Pack-DIP-16_W7.62mm" V 7775 4850 50  0001 C CNN
F 3 "~" H 7300 4850 50  0001 C CNN
	1    7300 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4450 7100 4450
Wire Wire Line
	7050 4550 7100 4550
Wire Wire Line
	7050 4650 7100 4650
Wire Wire Line
	7050 4750 7100 4750
Wire Wire Line
	7050 4850 7100 4850
Wire Wire Line
	7050 4950 7100 4950
Wire Wire Line
	7050 5050 7100 5050
Wire Wire Line
	7050 5150 7100 5150
Wire Bus Line
	3100 4100 3100 5050
Wire Bus Line
	9550 4250 9550 5050
Wire Bus Line
	5600 4100 5600 5050
Text Notes 2000 3950 0    50   ~ 0
up-to-date
$EndSCHEMATC
