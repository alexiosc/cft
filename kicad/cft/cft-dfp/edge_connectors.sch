EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 13
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
	3450 2000 2900 2000
Wire Bus Line
	3450 2100 2900 2100
Text Label 2900 2000 0    50   ~ 0
AB[0..23]
Text Label 2900 2100 0    50   ~ 0
DB[0..15]
Wire Bus Line
	2900 2400 3450 2400
Text Label 2900 2400 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	3450 2800 2900 2800
Wire Wire Line
	3450 2900 2900 2900
Wire Wire Line
	3450 3000 2900 3000
Wire Wire Line
	3450 3300 2900 3300
Wire Wire Line
	3450 3400 2900 3400
Wire Wire Line
	3450 3500 2900 3500
Wire Wire Line
	3450 3600 2900 3600
Wire Wire Line
	3450 3200 2900 3200
Wire Wire Line
	3450 3100 2900 3100
Wire Wire Line
	3450 4000 2900 4000
Wire Wire Line
	3450 3700 2900 3700
Wire Bus Line
	2900 2700 3450 2700
Text Label 2900 2700 0    50   ~ 0
~IRQ[0..7]
Text Label 2900 2500 0    50   ~ 0
~IRQ
Wire Wire Line
	3450 2300 2900 2300
Wire Bus Line
	2900 1400 3450 1400
Text Label 2900 1400 0    50   ~ 0
IBUS[0..15]
Text Label 2900 2300 0    50   ~ 0
T34
Wire Wire Line
	3450 2600 2900 2600
Text Label 2900 2600 0    50   ~ 0
~IRQS
Text Label 2900 2800 0    50   ~ 0
~RSTHOLD
Text Label 2900 2900 0    50   ~ 0
~SYSDEV
Text Label 2900 3000 0    50   ~ 0
~IODEV1xx
Text Label 2900 3100 0    50   ~ 0
~IODEV2xx
Text Label 2900 3200 0    50   ~ 0
~IODEV3xx
Text Label 2900 3300 0    50   ~ 0
~MEM
Text Label 2900 3400 0    50   ~ 0
~IO
Text Label 2900 3500 0    50   ~ 0
~R
Text Label 2900 3700 0    50   ~ 0
~WS
Text Label 2900 4000 0    50   ~ 0
~HALT
Text Label 2900 4300 0    50   ~ 0
ACTION[0..3]
Text Label 2900 4400 0    50   ~ 0
WADDR[0..4]
Text Label 2900 4500 0    50   ~ 0
RADDR[0..4]
Wire Bus Line
	3450 4300 2900 4300
Wire Bus Line
	3450 4400 2900 4400
Wire Bus Line
	3450 4500 2900 4500
Wire Bus Line
	2900 4600 3450 4600
Text Label 2900 4600 0    50   ~ 0
RSVD[0..6]
Text Label 5150 1700 2    50   ~ 0
FPA1
$Comp
L power:+5V #PWR?
U 1 1 5FE9C141
P 4600 1500
AR Path="/5FE9C141" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C141" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C141" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 4600 1350 50  0001 C CNN
F 1 "+5V" V 4615 1628 50  0000 L CNN
F 2 "" H 4600 1500 50  0001 C CNN
F 3 "" H 4600 1500 50  0001 C CNN
	1    4600 1500
	0    1    1    0   
$EndComp
Text Label 5150 4000 2    50   ~ 0
POWER
Text Label 5150 3900 2    50   ~ 0
~LTSON
Text Label 5150 3800 2    50   ~ 0
SWD3
Text Label 5150 3700 2    50   ~ 0
SWD2
Text Label 5150 3600 2    50   ~ 0
SWD1
Text Label 5150 3500 2    50   ~ 0
SWD0
Text Label 5150 3400 2    50   ~ 0
SWA3
Text Label 5150 3300 2    50   ~ 0
SWA2
Text Label 5150 3200 2    50   ~ 0
SWA1
Text Label 5150 3100 2    50   ~ 0
SWA0
Text Label 5150 3000 2    50   ~ 0
~ROW5
Text Label 5150 2900 2    50   ~ 0
~ROW4
Text Label 5150 2800 2    50   ~ 0
~ROW3
Text Label 5150 2700 2    50   ~ 0
~ROW2
Text Label 5150 2600 2    50   ~ 0
~ROW1
Wire Wire Line
	4600 1700 5150 1700
Wire Wire Line
	4600 1600 5150 1600
Wire Wire Line
	4600 4600 4750 4600
Wire Wire Line
	4600 4500 4750 4500
Wire Wire Line
	4600 4400 4750 4400
Wire Wire Line
	4600 3900 5150 3900
Wire Wire Line
	4600 3800 5150 3800
Wire Wire Line
	4600 3700 5150 3700
Wire Wire Line
	4600 3600 5150 3600
Wire Wire Line
	4600 3500 5150 3500
Wire Wire Line
	4600 3400 5150 3400
Wire Wire Line
	4600 3300 5150 3300
Wire Wire Line
	4600 3200 5150 3200
Wire Wire Line
	4600 3100 5150 3100
Wire Wire Line
	4600 3000 5150 3000
Wire Wire Line
	4600 2900 5150 2900
Wire Wire Line
	4600 2800 5150 2800
Wire Wire Line
	4600 2700 5150 2700
Wire Wire Line
	4600 2600 5150 2600
Text Label 5150 1600 2    50   ~ 0
FPA0
NoConn ~ 4750 4400
NoConn ~ 4750 4600
$Comp
L power:+5V #PWR?
U 1 1 5FE9C16D
P 4600 1400
AR Path="/5FE9C16D" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C16D" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C16D" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 4600 1250 50  0001 C CNN
F 1 "+5V" V 4615 1528 50  0000 L CNN
F 2 "" H 4600 1400 50  0001 C CNN
F 3 "" H 4600 1400 50  0001 C CNN
	1    4600 1400
	0    1    1    0   
$EndComp
Text Notes 4200 3250 1    100  ~ 20
Left Slot
Entry Wire Line
	5150 3100 5250 3200
Entry Wire Line
	5150 3200 5250 3300
Entry Wire Line
	5150 3300 5250 3400
Entry Wire Line
	5150 3400 5250 3500
Entry Wire Line
	5150 3500 5250 3600
Entry Wire Line
	5150 3600 5250 3700
Entry Wire Line
	5150 3700 5250 3800
Entry Wire Line
	5150 3800 5250 3900
Text Label 5250 3200 0    50   ~ 0
SWA[0..3]
Text Label 5250 3600 0    50   ~ 0
SWD[0..3]
Text Notes 5300 4000 0    50   ~ 0
Power switch from front panel
Wire Wire Line
	4600 5300 4750 5300
NoConn ~ 4750 4500
$Comp
L power:GND #PWR?
U 1 1 5FE9C188
P 4750 5300
AR Path="/5FE9C188" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C188" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C188" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 4750 5050 50  0001 C CNN
F 1 "GND" H 4755 5127 50  0000 C CNN
F 2 "" H 4750 5300 50  0001 C CNN
F 3 "" H 4750 5300 50  0001 C CNN
	1    4750 5300
	1    0    0    -1  
$EndComp
Text Label 5150 5200 2    50   ~ 0
TXD1
Text Label 5150 5100 2    50   ~ 0
RXD
Wire Wire Line
	4600 5100 5150 5100
Wire Wire Line
	4600 5200 5150 5200
Wire Wire Line
	4600 4000 5150 4000
Text Label 2900 3600 0    50   ~ 0
~W
$Comp
L power:GND #PWR?
U 1 1 5FE9C19C
P 4900 4350
AR Path="/5FE9C19C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C19C" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C19C" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 4900 4100 50  0001 C CNN
F 1 "GND" H 4905 4177 50  0000 C CNN
F 2 "" H 4900 4350 50  0001 C CNN
F 3 "" H 4900 4350 50  0001 C CNN
	1    4900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4100 4900 4100
Wire Wire Line
	4900 4100 4900 4200
Wire Wire Line
	4600 4200 4900 4200
Connection ~ 4900 4200
Wire Wire Line
	4600 4300 4900 4300
Wire Wire Line
	4900 4200 4900 4300
Connection ~ 4900 4300
Wire Wire Line
	4900 4300 4900 4350
Wire Wire Line
	3450 4100 3350 4100
Wire Wire Line
	3450 4200 2900 4200
NoConn ~ 3350 4100
Wire Bus Line
	7450 2000 6900 2000
Wire Bus Line
	7450 2100 6900 2100
Text Label 6900 2000 0    50   ~ 0
AB[0..7]
Text Label 6900 2100 0    50   ~ 0
DB[0..15]
Wire Bus Line
	6900 2400 7450 2400
Text Label 6900 2400 0    50   ~ 0
CFT-FPD[0..7]
Wire Wire Line
	7450 1600 6900 1600
Wire Wire Line
	7450 1700 6900 1700
Wire Wire Line
	7450 1800 6900 1800
Wire Wire Line
	7450 1900 6900 1900
Wire Wire Line
	7450 1500 6900 1500
Wire Wire Line
	7450 2800 6900 2800
Wire Wire Line
	7450 2900 6900 2900
Wire Wire Line
	7450 3000 6900 3000
Wire Wire Line
	7450 2500 6900 2500
Wire Wire Line
	7450 3500 6900 3500
Wire Wire Line
	7450 3600 6900 3600
Wire Wire Line
	7450 3200 6900 3200
Wire Wire Line
	7450 3100 6900 3100
Wire Wire Line
	7450 4000 6900 4000
Wire Wire Line
	7450 3700 6900 3700
Wire Bus Line
	6900 2700 7450 2700
Text Label 6900 2700 0    50   ~ 0
~IRQ[0..7]
Text Label 6900 2500 0    50   ~ 0
~IRQ
Wire Wire Line
	7450 2300 6900 2300
Text Label 6900 1500 0    50   ~ 0
~RESET
Text Label 6900 1600 0    50   ~ 0
CLK1
Text Label 6900 1700 0    50   ~ 0
CLK2
Text Label 6900 1800 0    50   ~ 0
CLK3
Text Label 6900 1900 0    50   ~ 0
CLK4
Text Label 6900 2300 0    50   ~ 0
T34
Wire Wire Line
	7450 2600 6900 2600
Text Label 6900 2600 0    50   ~ 0
~IRQS
Text Label 6900 2800 0    50   ~ 0
~RSTHOLD
Text Label 6900 2900 0    50   ~ 0
~SYSDEV
Text Label 6900 3000 0    50   ~ 0
~IODEV1xx
Text Label 6900 3100 0    50   ~ 0
~IODEV2xx
Text Label 6900 3200 0    50   ~ 0
~IODEV3xx
Text Label 6900 3500 0    50   ~ 0
~R
Text Label 6900 3600 0    50   ~ 0
~W
Text Label 6900 3700 0    50   ~ 0
~WS
Text Label 6900 4000 0    50   ~ 0
~HALT
Wire Wire Line
	8600 1600 9200 1600
Text Label 9200 1600 2    50   ~ 0
FPCLKEN
Wire Wire Line
	8600 1800 9200 1800
Text Label 9200 1800 2    50   ~ 0
FPµSTEP
$Comp
L power:GND #PWR?
U 1 1 5FE9C1EE
P 8600 1700
AR Path="/5FE9C1EE" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C1EE" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C1EE" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 8600 1450 50  0001 C CNN
F 1 "GND" V 8650 1600 50  0000 R CNN
F 2 "" H 8600 1700 50  0001 C CNN
F 3 "" H 8600 1700 50  0001 C CNN
	1    8600 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FE9C1F4
P 8600 1900
AR Path="/5FE9C1F4" Ref="#PWR?"  Part="1" 
AR Path="/60757845/5FE9C1F4" Ref="#PWR?"  Part="1" 
AR Path="/5FE640D1/5FE9C1F4" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 8600 1650 50  0001 C CNN
F 1 "GND" V 8650 1800 50  0000 R CNN
F 2 "" H 8600 1900 50  0001 C CNN
F 3 "" H 8600 1900 50  0001 C CNN
	1    8600 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8600 2100 9200 2100
Text Label 9200 2100 2    50   ~ 0
~FPRAM~∕ROM
Wire Wire Line
	8600 2000 9200 2000
Text Label 9200 2000 2    50   ~ 0
~FPRESET
Text Notes 9400 1500 0    50   ~ 0
To reset and clock generator
Text Notes 9900 2100 0    50   ~ 0
To Memory Bank Registers
Wire Wire Line
	8600 2200 9200 2200
Text Label 9200 2200 2    50   ~ 0
FPFETCH∕~EXEC
Text Notes 9900 2200 0    50   ~ 0
From Microcode Sequencer
Text Notes 8200 3550 1    100  ~ 20
Right Slot
Wire Wire Line
	8600 1400 9200 1400
Text Label 9200 1400 2    50   ~ 0
POWER
Text Notes 9400 1400 0    50   ~ 0
Power enable → backplane
Text Label 9200 3400 2    50   ~ 0
~FPOE29
Text Label 9200 3100 2    50   ~ 0
~FPOE25
Text Label 9200 2600 2    50   ~ 0
~FPOE21
Wire Wire Line
	8600 2800 9200 2800
Wire Wire Line
	8600 3100 9200 3100
Wire Wire Line
	8600 3000 9200 3000
Wire Wire Line
	8600 3200 9200 3200
Text Notes 9250 4000 0    50   ~ 0
PC high
Text Label 9200 4000 2    50   ~ 0
~FPOE5
Wire Wire Line
	8600 3300 9200 3300
Wire Wire Line
	8600 3400 9200 3400
Wire Wire Line
	8600 3500 9200 3500
Text Label 9200 3300 2    50   ~ 0
~FPOE30
Wire Wire Line
	8600 3900 9200 3900
Text Label 9200 3000 2    50   ~ 0
~FPOE26
Wire Wire Line
	8600 3700 9200 3700
Text Notes 9250 2400 0    50   ~ 0
IR low\n
Text Notes 9250 5100 0    50   ~ 0
AC low
Text Notes 9250 4300 0    50   ~ 0
PC low
Text Notes 9250 3900 0    50   ~ 0
µCV low
Text Label 9200 5100 2    50   ~ 0
~FPOE10
Text Label 9200 4300 2    50   ~ 0
~FPOE6
Text Label 9200 3900 2    50   ~ 0
~FPOE2
Wire Wire Line
	8600 4100 9200 4100
Wire Wire Line
	8600 4000 9200 4000
Wire Wire Line
	8600 4300 9200 4300
Text Label 9200 2900 2    50   ~ 0
~FPOE23
Wire Wire Line
	8600 4900 9200 4900
Text Label 9200 2500 2    50   ~ 0
~FPOE19
Wire Wire Line
	8600 4800 9200 4800
Text Notes 9250 2900 0    50   ~ 0
µAddress low
Text Notes 9250 5000 0    50   ~ 0
(reserved)
Text Label 9200 5200 2    50   ~ 0
~FPOE15
Wire Wire Line
	8600 5100 9200 5100
Text Notes 9250 5200 0    50   ~ 0
(reserved)
Text Notes 9250 4600 0    50   ~ 0
IRQs enabled
Text Notes 9250 3800 0    50   ~ 0
IRQ requests
Text Label 9200 5000 2    50   ~ 0
~FPOE11
Text Label 9200 4600 2    50   ~ 0
~FPOE7
Text Label 9200 3800 2    50   ~ 0
~FPOE3
Wire Wire Line
	8600 5000 9200 5000
Wire Wire Line
	8600 5300 9200 5300
Wire Wire Line
	8600 5200 9200 5200
Wire Wire Line
	8600 4700 9200 4700
Wire Wire Line
	8600 4500 9200 4500
Wire Wire Line
	8600 4400 9200 4400
Wire Wire Line
	8600 4200 9200 4200
Text Label 9200 4500 2    50   ~ 0
~FPSPHOE
Text Label 9200 4200 2    50   ~ 0
~FPSPLOE
Text Notes 9250 4700 0    50   ~ 0
MFD: DR high
Text Notes 9250 4500 0    50   ~ 0
MFD: DR low
Text Notes 9250 4400 0    50   ~ 0
MFD: SP high\n
Text Notes 9250 4200 0    50   ~ 0
MFD: SP low
Wire Wire Line
	8600 2900 9200 2900
Text Label 9200 3700 2    50   ~ 0
~FPOE0
Text Notes 9250 3700 0    50   ~ 0
µCV high
Wire Wire Line
	8600 2700 9200 2700
Wire Wire Line
	8600 2600 9200 2600
Text Label 9200 4900 2    50   ~ 0
~FPOE8
Text Notes 9250 4900 0    50   ~ 0
Flags
Wire Wire Line
	8600 2500 9200 2500
Text Label 9200 5300 2    50   ~ 0
~FPOE12
Text Notes 9250 5300 0    50   ~ 0
(reserved)
Wire Wire Line
	8600 2400 9200 2400
Text Label 9200 2800 2    50   ~ 0
~FPOE24
Wire Wire Line
	8600 4600 9200 4600
Text Label 9200 3600 2    50   ~ 0
~FPOE27
Wire Wire Line
	8600 2300 9200 2300
Text Label 9200 4700 2    50   ~ 0
~FPDRHOE
Text Label 9200 4400 2    50   ~ 0
~FPDRLOE
Wire Wire Line
	8600 3800 9200 3800
Text Label 9200 2400 2    50   ~ 0
~FPOE18
Wire Wire Line
	8600 3600 9200 3600
Text Label 9200 2700 2    50   ~ 0
~FPOE22
Wire Wire Line
	8600 1500 9200 1500
NoConn ~ 9200 1500
Wire Wire Line
	3450 2500 2900 2500
Wire Wire Line
	4600 2400 5150 2400
Wire Wire Line
	4600 2300 5150 2300
Wire Wire Line
	4600 2200 5150 2200
Wire Wire Line
	4600 2100 5150 2100
Wire Wire Line
	4600 2000 5150 2000
Wire Wire Line
	4600 1900 5150 1900
Wire Wire Line
	4600 1800 5150 1800
Text Label 5150 2500 2    50   ~ 0
FP-FPD0
Text Label 5150 2400 2    50   ~ 0
FP-FPD1
Text Label 5150 2300 2    50   ~ 0
FP-FPD2
Text Label 5150 2200 2    50   ~ 0
FP-FPD3
Text Label 5150 2100 2    50   ~ 0
FP-FPD4
Text Label 5150 2000 2    50   ~ 0
FP-FPD5
Text Label 5150 1900 2    50   ~ 0
FP-FPD6
Text Label 5150 1800 2    50   ~ 0
FP-FPD7
Wire Wire Line
	4600 2500 5150 2500
Text Notes 5350 2200 0    50   ~ 0
Flipped to account for\nFront Panel Module\nlayout.
Text Notes 2750 1050 0    100  ~ 20
Processor/Memory Mapped Slots
Text Notes 7300 1050 0    100  ~ 20
Device I/O Slots
Text Label 2900 4200 0    50   ~ 0
~WAITING
Wire Wire Line
	7450 4200 6900 4200
Text Label 6900 4200 0    50   ~ 0
~WAITING
Text HLabel 12200 5700 0    50   UnSpc ~ 0
CLK1
Text HLabel 12200 5800 0    50   UnSpc ~ 0
CLK2
Text HLabel 12200 5900 0    50   UnSpc ~ 0
CLK3
Text HLabel 12200 6000 0    50   UnSpc ~ 0
CLK4
Text HLabel 2900 2300 0    50   UnSpc ~ 0
T34
Text HLabel 2900 2500 0    50   UnSpc ~ 0
~IRQ
Text HLabel 2900 2600 0    50   UnSpc ~ 0
~IRQS
Text HLabel 2900 2000 0    50   UnSpc ~ 0
AB[0..23]
Text HLabel 2900 2100 0    50   UnSpc ~ 0
DB[0..15]
Text HLabel 2900 2400 0    50   UnSpc ~ 0
CFT-FPD[0..7]
Text HLabel 2900 1400 0    50   UnSpc ~ 0
IBUS[0..15]
Text HLabel 2900 2700 0    50   UnSpc ~ 0
~IRQ[0..7]
Text HLabel 2900 4300 0    50   UnSpc ~ 0
ACTION[0..3]
Text HLabel 2900 4400 0    50   UnSpc ~ 0
WADDR[0..4]
Text HLabel 2900 4500 0    50   UnSpc ~ 0
RADDR[0..4]
Text HLabel 2900 4600 0    50   UnSpc ~ 0
RSVD[0..6]
Text HLabel 2900 2800 0    50   UnSpc ~ 0
~RSTHOLD
Text HLabel 2900 2900 0    50   UnSpc ~ 0
~SYSDEV
Text HLabel 2900 3000 0    50   UnSpc ~ 0
~IODEV1xx
Text HLabel 2900 3100 0    50   UnSpc ~ 0
~IODEV2xx
Text HLabel 2900 3200 0    50   UnSpc ~ 0
~IODEV3xx
Text HLabel 2900 3300 0    50   UnSpc ~ 0
~MEM
Text HLabel 2900 3400 0    50   UnSpc ~ 0
~IO
Text HLabel 2900 3500 0    50   UnSpc ~ 0
~R
Text HLabel 2900 3600 0    50   UnSpc ~ 0
~W
Text HLabel 2900 3700 0    50   UnSpc ~ 0
~WS
Entry Wire Line
	5150 1800 5250 1900
Entry Wire Line
	5150 1900 5250 2000
Entry Wire Line
	5150 2000 5250 2100
Entry Wire Line
	5150 2100 5250 2200
Entry Wire Line
	5150 2200 5250 2300
Entry Wire Line
	5150 2300 5250 2400
Entry Wire Line
	5150 2400 5250 2500
Entry Wire Line
	5150 2500 5250 2600
Text Label 5250 1900 0    50   ~ 0
FP-FPD[0..7]
Wire Bus Line
	3700 6000 4300 6000
Text HLabel 4300 6000 2    50   Input ~ 0
FPA[0..1]
Entry Wire Line
	5150 2600 5250 2700
Entry Wire Line
	5150 2700 5250 2800
Entry Wire Line
	5150 2800 5250 2900
Entry Wire Line
	5150 2900 5250 3000
Entry Wire Line
	5150 3000 5250 3100
Text Label 5250 2700 0    50   ~ 0
~ROW[1..5]
Text Label 3700 6000 0    50   ~ 0
FPA[0..1]
Wire Bus Line
	3700 6100 4300 6100
Text HLabel 4300 6100 2    50   Input ~ 0
~ROW[1..5]
Wire Bus Line
	3700 6200 4300 6200
Text HLabel 4300 6200 2    50   Input ~ 0
SWA[0..3]
Text Label 3700 6100 0    50   ~ 0
~ROW[1..5]
Text Label 3700 6200 0    50   ~ 0
SWA[0..3]
Wire Bus Line
	3700 6300 4300 6300
Text HLabel 4300 6300 2    50   Input ~ 0
SWD[0..3]
Text Label 3700 6300 0    50   ~ 0
SWD[0..3]
Text HLabel 5150 5100 2    50   UnSpc ~ 0
RXD
Text HLabel 5150 5200 2    50   UnSpc ~ 0
TXD1
Text HLabel 2900 4000 0    50   UnSpc ~ 0
~HALT
Text HLabel 2900 4200 0    50   UnSpc ~ 0
~WAITING
Wire Wire Line
	3450 3800 2900 3800
Text Label 2900 3800 0    50   ~ 0
~ENDEXT
Text HLabel 2900 3800 0    50   UnSpc ~ 0
~ENDEXT
Wire Wire Line
	3450 3900 2900 3900
Text Label 2900 3900 0    50   ~ 0
~SKIPEXT
Text HLabel 2900 3900 0    50   UnSpc ~ 0
~SKIPEXT
Text Label 3700 6400 0    50   ~ 0
~LTSON
Wire Wire Line
	4300 6400 3700 6400
Text HLabel 4300 6400 2    50   Input ~ 0
~LTSON
Text HLabel 9200 1600 2    50   Input ~ 0
FPCLKEN
Text HLabel 9200 1800 2    50   Input ~ 0
FPµSTEP
Text HLabel 9200 2000 2    50   Input ~ 0
~FPRESET
Text HLabel 9200 2100 2    50   Input ~ 0
~FPRAM~∕ROM
Text HLabel 9200 2200 2    50   Input ~ 0
FPFETCH∕~EXEC
Wire Bus Line
	7700 6000 8300 6000
Text HLabel 8300 6000 2    50   Input ~ 0
~FPOE[0..31]
Text Label 7700 6000 0    50   ~ 0
~FPOE[0..31]
Text Label 7700 6200 0    50   ~ 0
~FPSPLOE
Text Label 7700 6100 0    50   ~ 0
~FPDRLOE
Text Label 7700 6400 0    50   ~ 0
~FPSPHOE
Text Label 7700 6300 0    50   ~ 0
~FPDRHOE
Wire Wire Line
	8300 6100 7700 6100
Wire Wire Line
	8300 6200 7700 6200
Wire Wire Line
	8300 6300 7700 6300
Wire Wire Line
	8300 6400 7700 6400
Text HLabel 8300 6100 2    50   Input ~ 0
~FPDRLOE
Text HLabel 8300 6200 2    50   Input ~ 0
~FPSPLOE
Text HLabel 8300 6300 2    50   Input ~ 0
~FPDRHOE
Text HLabel 8300 6400 2    50   Input ~ 0
~FPSPHOE
NoConn ~ 4750 4900
NoConn ~ 4750 4700
NoConn ~ 4750 5000
NoConn ~ 4750 4800
Wire Wire Line
	4600 5000 4750 5000
Wire Wire Line
	4600 4900 4750 4900
Wire Wire Line
	4600 4800 4750 4800
Wire Wire Line
	4600 4700 4750 4700
Wire Bus Line
	3700 5900 4300 5900
Text HLabel 4300 5900 2    50   Output ~ 0
FP-FPD[0..7]
Text Label 3700 5900 0    50   ~ 0
FP-FPD[0..7]
Wire Wire Line
	7450 3300 6900 3300
Wire Wire Line
	7450 3400 6900 3400
Text Label 6900 3300 0    50   ~ 0
~MEM
Text Label 6900 3400 0    50   ~ 0
~IO
Text Label 9200 2300 2    50   ~ 0
~FPOE17
Text Notes 9250 2300 0    50   ~ 0
IR high
Text Label 9200 3500 2    50   ~ 0
~FPOE28
Text Label 9200 3200 2    50   ~ 0
~FPOE1
Text Notes 9250 3200 0    50   ~ 0
µCV mid
Text Notes 9250 4100 0    50   ~ 0
AEXT
Text Label 9200 4100 2    50   ~ 0
~FPOE4
Text Label 9200 4800 2    50   ~ 0
~FPOE9
Text Notes 9250 4800 0    50   ~ 0
AC high
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
	14150 1050 13750 1050
Wire Wire Line
	14150 1150 13750 1150
Wire Wire Line
	14150 1250 13750 1250
Wire Wire Line
	14150 1350 13750 1350
Wire Wire Line
	14150 1450 13750 1450
Wire Wire Line
	14150 1550 13750 1550
Wire Wire Line
	14150 1650 13750 1650
Wire Wire Line
	14150 1750 13750 1750
Wire Wire Line
	14150 1850 13750 1850
Wire Wire Line
	14150 1950 13750 1950
Wire Wire Line
	14150 2050 13750 2050
Wire Wire Line
	14150 2150 13750 2150
Wire Wire Line
	14150 2250 13750 2250
Wire Wire Line
	14150 2350 13750 2350
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
	12550 9100 12200 9100
Wire Wire Line
	12550 9200 12200 9200
Wire Wire Line
	12550 9300 12200 9300
Wire Wire Line
	12550 9400 12200 9400
Wire Wire Line
	12550 9500 12200 9500
Wire Wire Line
	12550 9600 12200 9600
Wire Wire Line
	12550 9700 12200 9700
Wire Wire Line
	12550 9800 12200 9800
Wire Wire Line
	12550 9900 12200 9900
Wire Wire Line
	12550 10000 12200 10000
Wire Wire Line
	12550 10100 12200 10100
Wire Wire Line
	12550 10200 12200 10200
Wire Wire Line
	12550 10300 12200 10300
Wire Wire Line
	12550 10400 12200 10400
Wire Wire Line
	12550 10500 12200 10500
Wire Wire Line
	12550 10600 12200 10600
Wire Wire Line
	12550 10700 12200 10700
Wire Wire Line
	12550 10800 12200 10800
Wire Wire Line
	12550 10900 12200 10900
Wire Wire Line
	12550 11000 12200 11000
Wire Wire Line
	12550 11100 12200 11100
Wire Wire Line
	14100 9100 13750 9100
Wire Wire Line
	14100 9200 13750 9200
Wire Wire Line
	14100 9300 13750 9300
Wire Wire Line
	14100 9400 13750 9400
Wire Wire Line
	14100 9500 13750 9500
Wire Wire Line
	14100 9600 13750 9600
Wire Wire Line
	14100 9700 13750 9700
Wire Wire Line
	14100 9800 13750 9800
Wire Wire Line
	14100 10400 13750 10400
Wire Wire Line
	14100 10500 13750 10500
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
Wire Wire Line
	14100 11100 13750 11100
Text Label 12200 1250 0    50   ~ 0
~RESET
Text Label 12200 1350 0    50   ~ 0
~RSTHOLD
Wire Wire Line
	13750 2550 14150 2550
Wire Wire Line
	13750 2650 14150 2650
Wire Wire Line
	13750 2750 14150 2750
Wire Wire Line
	13750 2850 14150 2850
Wire Wire Line
	13750 2950 14150 2950
Wire Wire Line
	13750 3050 14150 3050
Wire Wire Line
	13750 3150 14150 3150
Wire Wire Line
	13750 3250 14150 3250
Wire Wire Line
	13750 3350 14150 3350
Wire Wire Line
	13750 3450 14150 3450
Wire Wire Line
	13750 3550 14150 3550
Wire Wire Line
	13750 3650 14150 3650
Wire Wire Line
	13750 3750 14150 3750
Wire Wire Line
	13750 3850 14150 3850
Wire Wire Line
	13750 3950 14150 3950
Wire Wire Line
	13750 4050 14150 4050
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
Wire Bus Line
	5250 3200 5250 3500
Wire Bus Line
	5250 3600 5250 3900
Wire Bus Line
	5250 2700 5250 3100
Wire Bus Line
	5250 1900 5250 2600
Wire Bus Line
	12000 3950 12000 4650
Wire Bus Line
	12000 6200 12000 7700
Wire Bus Line
	12000 1450 12000 3750
$EndSCHEMATC
