EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 19
Title "ALU/Interrupt Board"
Date ""
Rev "2023"
Comp ""
Comment1 "B1"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF96
P 9000 10500
AR Path="/5F67D4B5/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF96" Ref="#PWR0131"  Part="1" 
AR Path="/5D34E810/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF96" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF96" Ref="#PWR?"  Part="1" 
F 0 "#PWR0131" H 9000 10350 50  0001 C CNN
F 1 "+5V" H 8942 10537 50  0000 R CNN
F 2 "" H 9000 10500 50  0001 C CNN
F 3 "" H 9000 10500 50  0001 C CNN
	1    9000 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62FAE635
P 9000 10900
AR Path="/5F67D4B5/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/62FAE635" Ref="#PWR0134"  Part="1" 
AR Path="/5D34E810/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE635" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/62FAE635" Ref="#PWR?"  Part="1" 
F 0 "#PWR0134" H 9000 10650 50  0001 C CNN
F 1 "GND" H 8922 10863 50  0000 R CNN
F 2 "" H 9000 10900 50  0001 C CNN
F 3 "" H 9000 10900 50  0001 C CNN
	1    9000 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 10500 9000 10600
Wire Wire Line
	9000 10800 9000 10900
$Comp
L Device:CP_Small C112
U 1 1 62FAE636
P 9000 10700
AR Path="/62FAE636" Ref="C112"  Part="1" 
AR Path="/5D34E810/62FAE636" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE636" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE636" Ref="C?"  Part="1" 
F 0 "C112" H 8912 10746 50  0000 R CNN
F 1 "47µF" H 8912 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9000 10700 50  0001 C CNN
F 3 "~" H 9000 10700 50  0001 C CNN
	1    9000 10700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6084E503
P 6300 10500
AR Path="/5F67D4B5/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/6084E503" Ref="#PWR0111"  Part="1" 
AR Path="/5D34E810/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6084E503" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6084E503" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 6300 10350 50  0001 C CNN
F 1 "+5V" H 6242 10537 50  0000 R CNN
F 2 "" H 6300 10500 50  0001 C CNN
F 3 "" H 6300 10500 50  0001 C CNN
	1    6300 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62FAE629
P 6300 10900
AR Path="/5F67D4B5/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/62FAE629" Ref="#PWR0114"  Part="1" 
AR Path="/5D34E810/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/62FAE629" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/62FAE629" Ref="#PWR?"  Part="1" 
F 0 "#PWR0114" H 6300 10650 50  0001 C CNN
F 1 "GND" H 6222 10863 50  0000 R CNN
F 2 "" H 6300 10900 50  0001 C CNN
F 3 "" H 6300 10900 50  0001 C CNN
	1    6300 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 10500 6300 10600
Wire Wire Line
	6300 10800 6300 10900
$Comp
L power:+5V #PWR?
U 1 1 5F91D04D
P 5850 10500
AR Path="/5F67D4B5/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F91D04D" Ref="#PWR0109"  Part="1" 
AR Path="/5D34E810/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D04D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D04D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0109" H 5850 10350 50  0001 C CNN
F 1 "+5V" H 5792 10537 50  0000 R CNN
F 2 "" H 5850 10500 50  0001 C CNN
F 3 "" H 5850 10500 50  0001 C CNN
	1    5850 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F91D053
P 5850 10900
AR Path="/5F67D4B5/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F91D053" Ref="#PWR0112"  Part="1" 
AR Path="/5D34E810/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5F91D053" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5F91D053" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 5850 10650 50  0001 C CNN
F 1 "GND" H 5772 10863 50  0000 R CNN
F 2 "" H 5850 10900 50  0001 C CNN
F 3 "" H 5850 10900 50  0001 C CNN
	1    5850 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 10500 5850 10600
Wire Wire Line
	5850 10800 5850 10900
Wire Wire Line
	15550 9300 15900 9300
Wire Wire Line
	15550 9200 15900 9200
Wire Wire Line
	15550 9100 15900 9100
Wire Wire Line
	15550 9000 15900 9000
Wire Wire Line
	15550 8900 15900 8900
Wire Wire Line
	15550 8800 15900 8800
Wire Wire Line
	15550 8700 15900 8700
Wire Wire Line
	15550 8600 15900 8600
Wire Wire Line
	15550 8500 15900 8500
Wire Wire Line
	15550 8400 15900 8400
Wire Wire Line
	15550 8300 15900 8300
Wire Wire Line
	15550 8200 15900 8200
Wire Wire Line
	15550 8100 15900 8100
Wire Wire Line
	15550 8000 15900 8000
Wire Wire Line
	15550 7900 15900 7900
Wire Wire Line
	15550 7800 15900 7800
Wire Wire Line
	15550 7600 15900 7600
Wire Wire Line
	15550 7500 15900 7500
Wire Wire Line
	15550 7400 15900 7400
Wire Wire Line
	15550 7300 15900 7300
Wire Wire Line
	15550 7200 15900 7200
Wire Wire Line
	15550 7100 15900 7100
Wire Wire Line
	15550 7000 15900 7000
Wire Wire Line
	15550 6900 15900 6900
Wire Wire Line
	15550 6800 15900 6800
Wire Wire Line
	15550 6600 15900 6600
Wire Wire Line
	15550 6500 15900 6500
Wire Wire Line
	15550 6400 15900 6400
Wire Wire Line
	15550 6300 15900 6300
Wire Wire Line
	14000 10000 14350 10000
Wire Wire Line
	14000 9900 14350 9900
Wire Wire Line
	14000 9800 14350 9800
Wire Wire Line
	14000 9700 14350 9700
Wire Wire Line
	14000 9600 14350 9600
Wire Wire Line
	14000 9500 14350 9500
Wire Wire Line
	14000 9400 14350 9400
Wire Wire Line
	14000 9300 14350 9300
Wire Wire Line
	14000 9100 14350 9100
Wire Wire Line
	14000 9000 14350 9000
Wire Wire Line
	14000 8900 14350 8900
Wire Wire Line
	14000 8800 14350 8800
Wire Wire Line
	14000 8700 14350 8700
Wire Wire Line
	14000 8600 14350 8600
Wire Wire Line
	14000 8500 14350 8500
Wire Wire Line
	14000 8400 14350 8400
Wire Wire Line
	14000 8300 14350 8300
Wire Wire Line
	14000 8200 14350 8200
Wire Wire Line
	14000 8100 14350 8100
Wire Wire Line
	14000 8000 14350 8000
Wire Wire Line
	14000 7900 14350 7900
Wire Wire Line
	14000 7800 14350 7800
Wire Wire Line
	14000 7700 14350 7700
Wire Wire Line
	14000 7600 14350 7600
Wire Wire Line
	14000 7500 14350 7500
Wire Wire Line
	14000 7400 14350 7400
Wire Wire Line
	14000 7300 14350 7300
Wire Wire Line
	14000 7200 14350 7200
Wire Wire Line
	14000 7100 14350 7100
Wire Wire Line
	14000 7000 14350 7000
Wire Wire Line
	14000 6900 14350 6900
Wire Wire Line
	14000 6600 14350 6600
Wire Wire Line
	14000 6500 14350 6500
Wire Wire Line
	13450 7000 13800 7000
Wire Wire Line
	13450 6900 13800 6900
Wire Wire Line
	13450 6700 13800 6700
Wire Wire Line
	13450 6600 13800 6600
Wire Wire Line
	13450 6500 13800 6500
Wire Wire Line
	13450 6400 13800 6400
Wire Wire Line
	13450 6300 13800 6300
Wire Wire Line
	13800 8300 13450 8300
Wire Wire Line
	13800 8200 13450 8200
Wire Wire Line
	13800 8100 13450 8100
Wire Wire Line
	13800 8000 13450 8000
Wire Wire Line
	13800 7900 13450 7900
Wire Wire Line
	13800 7800 13450 7800
Wire Wire Line
	13800 7700 13450 7700
Wire Wire Line
	13800 7600 13450 7600
Text Label 13800 6300 2    50   ~ 0
FPD0
Text Label 13800 6400 2    50   ~ 0
FPD1
Text Label 13800 6500 2    50   ~ 0
FPD2
Text Label 13800 6600 2    50   ~ 0
FPD3
Text Label 13800 6700 2    50   ~ 0
FPD4
Text Label 13800 6800 2    50   ~ 0
FPD5
Text Label 13800 6900 2    50   ~ 0
FPD6
Text Label 13800 7000 2    50   ~ 0
FPD7
Wire Wire Line
	15550 10000 15650 10000
Wire Wire Line
	15650 10000 15650 10100
Text Label 15900 7800 2    50   ~ 0
DB0
Text Label 15900 7900 2    50   ~ 0
DB1
Text Label 15900 8000 2    50   ~ 0
DB2
Text Label 15900 8100 2    50   ~ 0
DB3
Text Label 15900 8200 2    50   ~ 0
DB4
Text Label 15900 8300 2    50   ~ 0
DB5
Text Label 15900 8400 2    50   ~ 0
DB6
Text Label 15900 8500 2    50   ~ 0
DB7
Text Label 15900 8600 2    50   ~ 0
DB8
Text Label 15900 8700 2    50   ~ 0
DB9
Text Label 15900 8800 2    50   ~ 0
DB10
Text Label 15900 8900 2    50   ~ 0
DB11
Text Label 15900 9000 2    50   ~ 0
DB12
Text Label 15900 9100 2    50   ~ 0
DB13
Text Label 15900 9200 2    50   ~ 0
DB14
Text Label 15900 9300 2    50   ~ 0
DB15
$Comp
L power:+5V #PWR0105
U 1 1 62FAE63E
P 14300 6250
F 0 "#PWR0105" H 14300 6100 50  0001 C CNN
F 1 "+5V" H 14315 6423 50  0000 C CNN
F 2 "" H 14300 6250 50  0001 C CNN
F 3 "" H 14300 6250 50  0001 C CNN
	1    14300 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 6300 14300 6300
Wire Wire Line
	14300 6300 14300 6250
Text Label 13800 7600 2    50   ~ 0
IR0
Text Label 13800 7700 2    50   ~ 0
IR1
Text Label 13800 7800 2    50   ~ 0
IR2
Text Label 13800 7900 2    50   ~ 0
IR3
Text Label 13800 8000 2    50   ~ 0
IR4
Text Label 13800 8100 2    50   ~ 0
IR5
Text Label 13800 8200 2    50   ~ 0
IR6
Text Label 13800 8300 2    50   ~ 0
IR7
Text Label 14000 6500 0    50   ~ 0
~RESET
Text Label 14000 6600 0    50   ~ 0
~RSTHOLD
Text Label 14000 6800 0    50   ~ 0
AB0
Text Label 14000 6900 0    50   ~ 0
AB1
Text Label 14000 7000 0    50   ~ 0
AB2
Text Label 14000 7100 0    50   ~ 0
AB3
Text Label 14000 7200 0    50   ~ 0
AB4
Text Label 14000 7300 0    50   ~ 0
AB5
Text Label 14000 7400 0    50   ~ 0
AB6
Text Label 14000 7500 0    50   ~ 0
AB7
Text Label 14000 7600 0    50   ~ 0
AB8
Text Label 14000 7700 0    50   ~ 0
AB9
Text Label 14000 7800 0    50   ~ 0
AB10
Text Label 14000 7900 0    50   ~ 0
AB11
Text Label 14000 8000 0    50   ~ 0
AB12
Text Label 14000 8100 0    50   ~ 0
AB13
Text Label 14000 8200 0    50   ~ 0
AB14
Text Label 14000 8300 0    50   ~ 0
AB15
Text Label 14000 8400 0    50   ~ 0
AB16
Text Label 14000 8500 0    50   ~ 0
AB17
Text Label 14000 8600 0    50   ~ 0
AB18
Text Label 14000 8700 0    50   ~ 0
AB19
Text Label 14000 8800 0    50   ~ 0
AB20
Text Label 14000 8900 0    50   ~ 0
AB21
Text Label 14000 9000 0    50   ~ 0
AB22
Text Label 14000 9100 0    50   ~ 0
AB23
Text Label 14000 9300 0    50   ~ 0
~IRQ0
Text Label 14000 9400 0    50   ~ 0
~IRQ1
Text Label 14000 9500 0    50   ~ 0
~IRQ2
Text Label 14000 9600 0    50   ~ 0
~IRQ3
Text Label 14000 9700 0    50   ~ 0
~IRQ4
Text Label 14000 9800 0    50   ~ 0
~IRQ5
Text Label 14000 9900 0    50   ~ 0
~IRQ6
Text Label 14000 10000 0    50   ~ 0
~IRQ7
Text Label 15900 6400 2    50   ~ 0
~IO
Text Label 15900 6500 2    50   ~ 0
~R
Text Label 15900 6600 2    50   ~ 0
~W
Text Label 15900 6800 2    50   ~ 0
~SYSDEV
Text Label 15900 6900 2    50   ~ 0
~IODEV1XX
Text Label 15900 7000 2    50   ~ 0
~IODEV2XX
Text Label 15900 7100 2    50   ~ 0
~IODEV3XX
Text Label 15900 7200 2    50   ~ 0
~WS
Text Label 15900 7300 2    50   ~ 0
~WAITING
Text Label 15900 7400 2    50   ~ 0
~HALT
Text Label 15900 7500 2    50   ~ 0
~IRQ
Text Label 15900 7600 2    50   ~ 0
~IRQS
Text Notes 800  950  0    100  ~ 20
Board 1: ALU, Registers (Part 2), and Interrupts
Text Notes 800  2350 0    50   ~ 0
The CFT's ALU is probably among the most complex units of the processor. The 2019\nedition uses three ROMs containing all binary and unary operations except shifts and\nrolls. (the original ALU used 6 larger ROMs). The ROMs can perform two's complement\naddition (with carry and overflow), and bitwise AND, OR, XOR and NOT. Three of the\neight possible operations are still undefined.\n\nA separate unit can perform rolls, bitwise shifts and sign-extending (arithmethic) right\nshifts. This is a serial unit, not a barrel shifter, so the longer the bit distance the\nlonger it takes to calculate it. It's still better than having to wait several clock cycles for\na single bit though.\n\nAlso present here are unts that need to be colocated with the ALU: the L register;\nthe overflow (V) flag; and the second half of the REG board: the Accumulator (AC)\nand Stack Pointer (SP).\n\nThe remaining space is taken up by the 8-channle Interrupt Controller (IRC) board.
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 2 1 609EF5BD
P 12850 6200
F 0 "P1" H 12850 6367 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 12850 6276 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 12800 5300 50  0001 C CNN
F 3 "" H 12800 5300 50  0001 C CNN
	2    12850 6200
	1    0    0    -1  
$EndComp
$Comp
L alexios:CFT-2021-Processor-Bus P1
U 1 1 62FAE63B
P 10600 6200
F 0 "P1" H 10600 6367 50  0000 C CNN
F 1 "CFT-2021-Processor-Bus" H 10600 6276 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 10550 5300 50  0001 C CNN
F 3 "" H 10550 5300 50  0001 C CNN
	1    10600 6200
	1    0    0    -1  
$EndComp
Text Label 11550 6500 2    50   ~ 0
~END
Wire Wire Line
	11200 6500 11550 6500
Text Label 9650 9200 0    50   ~ 0
~WRITE-FL
Text Label 9650 9100 0    50   ~ 0
FN
Text Label 9650 9000 0    50   ~ 0
FZ
Text Label 9650 8900 0    50   ~ 0
FL
Text Label 9650 8800 0    50   ~ 0
FV
Text Label 9650 8600 0    50   ~ 0
IBUS15
Text Label 9650 8500 0    50   ~ 0
IBUS14
Text Label 9650 8400 0    50   ~ 0
IBUS13
Text Label 9650 8300 0    50   ~ 0
IBUS12
Text Label 9650 8200 0    50   ~ 0
IBUS11
Text Label 9650 8100 0    50   ~ 0
IBUS10
Text Label 9650 8000 0    50   ~ 0
IBUS9
Text Label 9650 7900 0    50   ~ 0
IBUS8
Text Label 9650 7800 0    50   ~ 0
IBUS7
Text Label 9650 7700 0    50   ~ 0
IBUS6
Text Label 9650 7600 0    50   ~ 0
IBUS5
Text Label 9650 7500 0    50   ~ 0
IBUS4
Text Label 9650 7400 0    50   ~ 0
IBUS3
Text Label 9650 7300 0    50   ~ 0
IBUS2
Text Label 9650 7200 0    50   ~ 0
IBUS1
Text Label 9650 7100 0    50   ~ 0
IBUS0
Text Label 9650 6900 0    50   ~ 0
T34
Text Label 9650 6800 0    50   ~ 0
CLK4
Text Label 9650 6700 0    50   ~ 0
CLK3
Text Label 9650 6600 0    50   ~ 0
CLK2
Wire Wire Line
	11300 9200 11300 9300
Wire Wire Line
	11200 9200 11300 9200
$Comp
L power:GND #PWR0106
U 1 1 61C7A92A
P 11300 9300
F 0 "#PWR0106" H 11300 9050 50  0001 C CNN
F 1 "GND" H 11305 9127 50  0000 C CNN
F 2 "" H 11300 9300 50  0001 C CNN
F 3 "" H 11300 9300 50  0001 C CNN
	1    11300 9300
	1    0    0    -1  
$EndComp
Text Label 11550 8900 2    50   ~ 0
COND3
Text Label 11550 8800 2    50   ~ 0
COND2
Text Label 11550 8700 2    50   ~ 0
COND1
Text Label 11550 8600 2    50   ~ 0
COND0
Text Label 11550 8400 2    50   ~ 0
ACTION3
Text Label 11550 8300 2    50   ~ 0
ACTION2
Text Label 11550 8200 2    50   ~ 0
ACTION1
Text Label 11550 8100 2    50   ~ 0
ACTION0
Text Label 11550 7900 2    50   ~ 0
WADDR4
Text Label 11550 7800 2    50   ~ 0
WADDR3
Text Label 11550 7700 2    50   ~ 0
WADDR2
Text Label 11550 7600 2    50   ~ 0
WADDR1
Text Label 11550 7500 2    50   ~ 0
WADDR0
Text Label 11550 7300 2    50   ~ 0
RADDR4
Text Label 11550 7200 2    50   ~ 0
RADDR3
Text Label 11550 7100 2    50   ~ 0
RADDR2
Text Label 11550 7000 2    50   ~ 0
RADDR1
Text Label 11550 6900 2    50   ~ 0
RADDR0
Wire Wire Line
	9950 6300 9950 6250
Wire Wire Line
	10000 6300 9950 6300
$Comp
L power:+5V #PWR0104
U 1 1 62FAE63C
P 9950 6250
F 0 "#PWR0104" H 9950 6100 50  0001 C CNN
F 1 "+5V" H 9965 6423 50  0000 C CNN
F 2 "" H 9950 6250 50  0001 C CNN
F 3 "" H 9950 6250 50  0001 C CNN
	1    9950 6250
	1    0    0    -1  
$EndComp
Text Label 11550 6700 2    50   ~ 0
~SKIPEXT
Text Label 11550 6600 2    50   ~ 0
~ENDEXT
Wire Wire Line
	9650 6600 10000 6600
Wire Wire Line
	9650 6700 10000 6700
Wire Wire Line
	9650 6800 10000 6800
Wire Wire Line
	9650 6900 10000 6900
Wire Wire Line
	9650 7100 10000 7100
Wire Wire Line
	9650 7200 10000 7200
Wire Wire Line
	9650 7300 10000 7300
Wire Wire Line
	9650 7400 10000 7400
Wire Wire Line
	9650 7500 10000 7500
Wire Wire Line
	9650 7600 10000 7600
Wire Wire Line
	9650 7700 10000 7700
Wire Wire Line
	9650 7800 10000 7800
Wire Wire Line
	9650 7900 10000 7900
Wire Wire Line
	9650 8000 10000 8000
Wire Wire Line
	9650 8100 10000 8100
Wire Wire Line
	9650 8200 10000 8200
Wire Wire Line
	9650 8300 10000 8300
Wire Wire Line
	9650 8400 10000 8400
Wire Wire Line
	9650 8500 10000 8500
Wire Wire Line
	9650 8600 10000 8600
Wire Wire Line
	9650 8800 10000 8800
Wire Wire Line
	9650 8900 10000 8900
Wire Wire Line
	9650 9000 10000 9000
Wire Wire Line
	9650 9100 10000 9100
Wire Wire Line
	11200 6600 11550 6600
Wire Wire Line
	11200 6700 11550 6700
Wire Wire Line
	11200 6900 11550 6900
Wire Wire Line
	11200 7000 11550 7000
Wire Wire Line
	11200 7100 11550 7100
Wire Wire Line
	11200 7200 11550 7200
Wire Wire Line
	11200 7300 11550 7300
Wire Wire Line
	11200 7500 11550 7500
Wire Wire Line
	11200 7600 11550 7600
Wire Wire Line
	11200 7700 11550 7700
Wire Wire Line
	11200 7800 11550 7800
Wire Wire Line
	11200 7900 11550 7900
Wire Wire Line
	11200 8100 11550 8100
Wire Wire Line
	11200 8200 11550 8200
Wire Wire Line
	11200 8300 11550 8300
Wire Wire Line
	11200 8400 11550 8400
Wire Wire Line
	11200 8600 11550 8600
Wire Wire Line
	11200 8700 11550 8700
Wire Wire Line
	11200 8800 11550 8800
Wire Wire Line
	11200 8900 11550 8900
Wire Wire Line
	11200 6300 11550 6300
Text Label 11550 6300 2    50   ~ 0
16MHz
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61115B2C
P 9900 6300
F 0 "#FLG0101" H 9900 6375 50  0001 C CNN
F 1 "PWR_FLAG" V 9900 6427 50  0000 L CNN
F 2 "" H 9900 6300 50  0001 C CNN
F 3 "~" H 9900 6300 50  0001 C CNN
	1    9900 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9900 6300 9950 6300
Connection ~ 9950 6300
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61150065
P 11350 9200
F 0 "#FLG0102" H 11350 9275 50  0001 C CNN
F 1 "PWR_FLAG" V 11350 9328 50  0000 L CNN
F 2 "" H 11350 9200 50  0001 C CNN
F 3 "~" H 11350 9200 50  0001 C CNN
	1    11350 9200
	0    1    1    0   
$EndComp
Wire Wire Line
	11300 9200 11350 9200
Connection ~ 11300 9200
Wire Wire Line
	13450 6800 13800 6800
Wire Wire Line
	14000 6800 14350 6800
$Comp
L alexios:CFT-2021-Peripheral-Bus P2
U 1 1 60987323
P 14950 6200
F 0 "P2" H 14950 6367 50  0000 C CNN
F 1 "CFT-2021-Peripheral-Bus" H 14950 6276 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 14825 5325 50  0001 C CNN
F 3 "" H 14825 5325 50  0001 C CNN
	1    14950 6200
	1    0    0    -1  
$EndComp
Text Label 9650 6500 0    50   ~ 0
CLK1
Wire Wire Line
	9650 6500 10000 6500
NoConn ~ 12250 6300
NoConn ~ 12250 6400
Text Notes 9650 5700 0    100  ~ 20
Processor Bus
Text Notes 12450 5850 0    100  ~ 20
Local Bus
Text Notes 14400 5850 0    100  ~ 20
Peripheral Bus
$Comp
L power:+5V #PWR?
U 1 1 634E8C25
P 7200 10500
AR Path="/5F67D4B5/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/634E8C25" Ref="#PWR0117"  Part="1" 
AR Path="/5D34E810/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C25" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C25" Ref="#PWR?"  Part="1" 
F 0 "#PWR0117" H 7200 10350 50  0001 C CNN
F 1 "+5V" H 7142 10537 50  0000 R CNN
F 2 "" H 7200 10500 50  0001 C CNN
F 3 "" H 7200 10500 50  0001 C CNN
	1    7200 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C2B
P 7200 10900
AR Path="/5F67D4B5/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/634E8C2B" Ref="#PWR0120"  Part="1" 
AR Path="/5D34E810/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C2B" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C2B" Ref="#PWR?"  Part="1" 
F 0 "#PWR0120" H 7200 10650 50  0001 C CNN
F 1 "GND" H 7122 10863 50  0000 R CNN
F 2 "" H 7200 10900 50  0001 C CNN
F 3 "" H 7200 10900 50  0001 C CNN
	1    7200 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 10500 7200 10600
$Comp
L Device:CP_Small C106
U 1 1 634E8C32
P 7200 10700
AR Path="/634E8C32" Ref="C106"  Part="1" 
AR Path="/5D34E810/634E8C32" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C32" Ref="C?"  Part="1" 
F 0 "C106" H 7112 10746 50  0000 R CNN
F 1 "47µF" H 7112 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7200 10700 50  0001 C CNN
F 3 "~" H 7200 10700 50  0001 C CNN
	1    7200 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 10800 7200 10900
$Comp
L power:+5V #PWR?
U 1 1 634E8C4D
P 6750 10500
AR Path="/5F67D4B5/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/634E8C4D" Ref="#PWR0115"  Part="1" 
AR Path="/5D34E810/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C4D" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C4D" Ref="#PWR?"  Part="1" 
F 0 "#PWR0115" H 6750 10350 50  0001 C CNN
F 1 "+5V" H 6692 10537 50  0000 R CNN
F 2 "" H 6750 10500 50  0001 C CNN
F 3 "" H 6750 10500 50  0001 C CNN
	1    6750 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 634E8C53
P 6750 10900
AR Path="/5F67D4B5/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/634E8C53" Ref="#PWR0118"  Part="1" 
AR Path="/5D34E810/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/634E8C53" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/634E8C53" Ref="#PWR?"  Part="1" 
F 0 "#PWR0118" H 6750 10650 50  0001 C CNN
F 1 "GND" H 6672 10863 50  0000 R CNN
F 2 "" H 6750 10900 50  0001 C CNN
F 3 "" H 6750 10900 50  0001 C CNN
	1    6750 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 10500 6750 10600
Wire Wire Line
	6750 10800 6750 10900
$Comp
L power:+5V #PWR?
U 1 1 6352FA20
P 8550 10500
AR Path="/5F67D4B5/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/6352FA20" Ref="#PWR0125"  Part="1" 
AR Path="/5D34E810/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA20" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA20" Ref="#PWR?"  Part="1" 
F 0 "#PWR0125" H 8550 10350 50  0001 C CNN
F 1 "+5V" H 8492 10537 50  0000 R CNN
F 2 "" H 8550 10500 50  0001 C CNN
F 3 "" H 8550 10500 50  0001 C CNN
	1    8550 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA26
P 8550 10900
AR Path="/5F67D4B5/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/6352FA26" Ref="#PWR0130"  Part="1" 
AR Path="/5D34E810/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA26" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA26" Ref="#PWR?"  Part="1" 
F 0 "#PWR0130" H 8550 10650 50  0001 C CNN
F 1 "GND" H 8472 10863 50  0000 R CNN
F 2 "" H 8550 10900 50  0001 C CNN
F 3 "" H 8550 10900 50  0001 C CNN
	1    8550 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 10500 8550 10600
$Comp
L Device:CP_Small C111
U 1 1 6352FA2D
P 8550 10700
AR Path="/6352FA2D" Ref="C111"  Part="1" 
AR Path="/5D34E810/6352FA2D" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA2D" Ref="C?"  Part="1" 
F 0 "C111" H 8462 10746 50  0000 R CNN
F 1 "47µF" H 8462 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8550 10700 50  0001 C CNN
F 3 "~" H 8550 10700 50  0001 C CNN
	1    8550 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 10800 8550 10900
$Comp
L power:+5V #PWR?
U 1 1 6352FA34
P 8100 10500
AR Path="/5F67D4B5/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/6352FA34" Ref="#PWR0124"  Part="1" 
AR Path="/5D34E810/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA34" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA34" Ref="#PWR?"  Part="1" 
F 0 "#PWR0124" H 8100 10350 50  0001 C CNN
F 1 "+5V" H 8042 10537 50  0000 R CNN
F 2 "" H 8100 10500 50  0001 C CNN
F 3 "" H 8100 10500 50  0001 C CNN
	1    8100 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA3A
P 8100 10900
AR Path="/5F67D4B5/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/6352FA3A" Ref="#PWR0129"  Part="1" 
AR Path="/5D34E810/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA3A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA3A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0129" H 8100 10650 50  0001 C CNN
F 1 "GND" H 8022 10863 50  0000 R CNN
F 2 "" H 8100 10900 50  0001 C CNN
F 3 "" H 8100 10900 50  0001 C CNN
	1    8100 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 10500 8100 10600
$Comp
L Device:CP_Small C110
U 1 1 6352FA41
P 8100 10700
AR Path="/6352FA41" Ref="C110"  Part="1" 
AR Path="/5D34E810/6352FA41" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA41" Ref="C?"  Part="1" 
F 0 "C110" H 8012 10746 50  0000 R CNN
F 1 "47µF" H 8012 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8100 10700 50  0001 C CNN
F 3 "~" H 8100 10700 50  0001 C CNN
	1    8100 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 10800 8100 10900
$Comp
L power:+5V #PWR?
U 1 1 6352FA48
P 7650 10500
AR Path="/5F67D4B5/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/6352FA48" Ref="#PWR0123"  Part="1" 
AR Path="/5D34E810/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA48" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA48" Ref="#PWR?"  Part="1" 
F 0 "#PWR0123" H 7650 10350 50  0001 C CNN
F 1 "+5V" H 7592 10537 50  0000 R CNN
F 2 "" H 7650 10500 50  0001 C CNN
F 3 "" H 7650 10500 50  0001 C CNN
	1    7650 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6352FA4E
P 7650 10900
AR Path="/5F67D4B5/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/6352FA4E" Ref="#PWR0128"  Part="1" 
AR Path="/5D34E810/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/6352FA4E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/6352FA4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR0128" H 7650 10650 50  0001 C CNN
F 1 "GND" H 7572 10863 50  0000 R CNN
F 2 "" H 7650 10900 50  0001 C CNN
F 3 "" H 7650 10900 50  0001 C CNN
	1    7650 10900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 10500 7650 10600
$Comp
L Device:CP_Small C109
U 1 1 6352FA55
P 7650 10700
AR Path="/6352FA55" Ref="C109"  Part="1" 
AR Path="/5D34E810/6352FA55" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6352FA55" Ref="C?"  Part="1" 
F 0 "C109" H 7562 10746 50  0000 R CNN
F 1 "47µF" H 7562 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 7650 10700 50  0001 C CNN
F 3 "~" H 7650 10700 50  0001 C CNN
	1    7650 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 10800 7650 10900
NoConn ~ 15550 6700
NoConn ~ 13800 8300
NoConn ~ 15900 7200
NoConn ~ 15900 7300
NoConn ~ 15900 7400
NoConn ~ 15900 6900
NoConn ~ 15900 7000
NoConn ~ 15900 7100
NoConn ~ 15900 6400
NoConn ~ 11550 6600
NoConn ~ 11550 6700
NoConn ~ 11550 8600
NoConn ~ 11550 8700
NoConn ~ 11550 8800
NoConn ~ 11550 8900
NoConn ~ 11550 6500
$Comp
L Device:CP_Small C113
U 1 1 62FAE633
P 9450 10700
AR Path="/62FAE633" Ref="C113"  Part="1" 
AR Path="/5D34E810/62FAE633" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/62FAE633" Ref="C?"  Part="1" 
AR Path="/5DD3D79F/62FAE633" Ref="C?"  Part="1" 
F 0 "C113" H 9362 10746 50  0000 R CNN
F 1 "47µF" H 9362 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9450 10700 50  0001 C CNN
F 3 "~" H 9450 10700 50  0001 C CNN
	1    9450 10700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 10800 9450 10900
Wire Wire Line
	9450 10500 9450 10600
$Comp
L power:GND #PWR?
U 1 1 5DF0FF88
P 9450 10900
AR Path="/5F67D4B5/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF88" Ref="#PWR0135"  Part="1" 
AR Path="/5D34E810/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF88" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF88" Ref="#PWR?"  Part="1" 
F 0 "#PWR0135" H 9450 10650 50  0001 C CNN
F 1 "GND" H 9372 10863 50  0000 R CNN
F 2 "" H 9450 10900 50  0001 C CNN
F 3 "" H 9450 10900 50  0001 C CNN
	1    9450 10900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5DF0FF82
P 9450 10500
AR Path="/5F67D4B5/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DF0FF82" Ref="#PWR0132"  Part="1" 
AR Path="/5D34E810/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/5DF0FF82" Ref="#PWR?"  Part="1" 
AR Path="/5DD3D79F/5DF0FF82" Ref="#PWR?"  Part="1" 
F 0 "#PWR0132" H 9450 10350 50  0001 C CNN
F 1 "+5V" H 9392 10537 50  0000 R CNN
F 2 "" H 9450 10500 50  0001 C CNN
F 3 "" H 9450 10500 50  0001 C CNN
	1    9450 10500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 62FAE63D
P 15650 10100
F 0 "#PWR0107" H 15650 9850 50  0001 C CNN
F 1 "GND" H 15750 10100 50  0000 C CNN
F 2 "" H 15650 10100 50  0001 C CNN
F 3 "" H 15650 10100 50  0001 C CNN
	1    15650 10100
	1    0    0    -1  
$EndComp
Text Notes 12000 5550 0    197  ~ 39
Backplane
Text Label 13950 3850 0    50   ~ 0
AB18
Text Label 13950 3750 0    50   ~ 0
AB17
Text Label 13950 3650 0    50   ~ 0
AB16
Text Label 13950 3550 0    50   ~ 0
AB15
Text Label 13950 3450 0    50   ~ 0
AB14
Text Label 13950 3350 0    50   ~ 0
AB13
Text Label 13950 3250 0    50   ~ 0
AB12
Text Label 13950 3150 0    50   ~ 0
AB11
Text Label 13950 3050 0    50   ~ 0
AB10
Text Label 13950 2950 0    50   ~ 0
AB9
Text Label 13950 2850 0    50   ~ 0
AB8
Text Label 13950 2750 0    50   ~ 0
AB7
Text Label 13950 2650 0    50   ~ 0
AB6
Text Label 13950 2550 0    50   ~ 0
AB5
Text Label 13950 2450 0    50   ~ 0
AB4
Text Label 13950 2350 0    50   ~ 0
AB3
Text Label 13950 2250 0    50   ~ 0
AB2
Text Label 13950 2150 0    50   ~ 0
AB1
Text Label 13950 2050 0    50   ~ 0
AB0
Wire Wire Line
	14300 3850 13950 3850
Wire Wire Line
	14300 3750 13950 3750
Wire Wire Line
	14300 3650 13950 3650
Wire Wire Line
	14300 3550 13950 3550
Wire Wire Line
	14300 3450 13950 3450
Wire Wire Line
	14300 3350 13950 3350
Wire Wire Line
	14300 3250 13950 3250
Wire Wire Line
	14300 3150 13950 3150
Wire Wire Line
	14300 3050 13950 3050
Wire Wire Line
	14300 2950 13950 2950
Wire Wire Line
	14300 2850 13950 2850
Wire Wire Line
	14300 2750 13950 2750
Wire Wire Line
	14300 2650 13950 2650
Wire Wire Line
	14300 2550 13950 2550
Wire Wire Line
	14300 2450 13950 2450
Wire Wire Line
	14300 2350 13950 2350
Wire Wire Line
	14300 2250 13950 2250
Wire Wire Line
	14300 2150 13950 2150
Wire Wire Line
	14300 2050 13950 2050
Text Label 11800 3850 0    50   ~ 0
AB18
Text Label 11800 3750 0    50   ~ 0
AB17
Text Label 11800 3650 0    50   ~ 0
AB16
Text Label 11800 3550 0    50   ~ 0
AB15
Text Label 11800 3450 0    50   ~ 0
AB14
Text Label 11800 3350 0    50   ~ 0
AB13
Text Label 11800 3250 0    50   ~ 0
AB12
Text Label 11800 3150 0    50   ~ 0
AB11
Text Label 11800 3050 0    50   ~ 0
AB10
Text Label 11800 2950 0    50   ~ 0
AB9
Text Label 11800 2850 0    50   ~ 0
AB8
Text Label 11800 2750 0    50   ~ 0
AB7
Text Label 11800 2650 0    50   ~ 0
AB6
Text Label 11800 2550 0    50   ~ 0
AB5
Text Label 11800 2450 0    50   ~ 0
AB4
Text Label 11800 2350 0    50   ~ 0
AB3
Text Label 11800 2250 0    50   ~ 0
AB2
Text Label 11800 2150 0    50   ~ 0
AB1
Text Label 11800 2050 0    50   ~ 0
AB0
Wire Wire Line
	12150 3850 11800 3850
Wire Wire Line
	12150 3750 11800 3750
Wire Wire Line
	12150 3650 11800 3650
Wire Wire Line
	12150 3550 11800 3550
Wire Wire Line
	12150 3450 11800 3450
Wire Wire Line
	12150 3350 11800 3350
Wire Wire Line
	12150 3250 11800 3250
Wire Wire Line
	12150 3150 11800 3150
Wire Wire Line
	12150 3050 11800 3050
Wire Wire Line
	12150 2950 11800 2950
Wire Wire Line
	12150 2850 11800 2850
Wire Wire Line
	12150 2750 11800 2750
Wire Wire Line
	12150 2650 11800 2650
Wire Wire Line
	12150 2550 11800 2550
Wire Wire Line
	12150 2450 11800 2450
Wire Wire Line
	12150 2350 11800 2350
Wire Wire Line
	12150 2250 11800 2250
Wire Wire Line
	12150 2150 11800 2150
Wire Wire Line
	12150 2050 11800 2050
Wire Wire Line
	13250 2750 13550 2750
Wire Wire Line
	13250 2650 13550 2650
Wire Wire Line
	13250 2550 13550 2550
Wire Wire Line
	13250 2450 13550 2450
Wire Wire Line
	13250 2350 13550 2350
Wire Wire Line
	13250 2250 13550 2250
Wire Wire Line
	13250 2150 13550 2150
Wire Wire Line
	13250 2050 13550 2050
Text Label 13550 2050 2    50   ~ 0
DB8
Text Label 13550 2150 2    50   ~ 0
DB9
Text Label 13550 2250 2    50   ~ 0
DB10
Text Label 13550 2350 2    50   ~ 0
DB11
Text Label 13550 2450 2    50   ~ 0
DB12
Text Label 13550 2550 2    50   ~ 0
DB13
Text Label 13550 2650 2    50   ~ 0
DB14
Text Label 13550 2750 2    50   ~ 0
DB15
Wire Wire Line
	7450 3400 7050 3400
Wire Wire Line
	7450 3500 7050 3500
Wire Wire Line
	7450 3600 7050 3600
Wire Wire Line
	7450 4000 7050 4000
Wire Wire Line
	7450 4100 7050 4100
Wire Wire Line
	7050 3700 7450 3700
Wire Wire Line
	7050 3800 7450 3800
Wire Wire Line
	7050 3900 7450 3900
Wire Bus Line
	1350 3300 900  3300
Wire Bus Line
	2350 3300 2800 3300
Text Label 900  3300 0    50   ~ 0
AB[0..18]
Text Label 2800 3300 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 3200 1000 600 
U 65B2AF42
F0 "sheet65B2AE92" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 3300 50 
F3 "~CE" I L 1350 3500 50 
F4 "~R" I L 1350 3600 50 
F5 "~W" I L 1350 3700 50 
F6 "~DB[0..15]" T R 2350 3300 50 
$EndSheet
Wire Wire Line
	1350 3500 900  3500
Wire Wire Line
	1350 3600 900  3600
Wire Wire Line
	1350 3700 900  3700
Text Label 900  3700 0    50   ~ 0
~W
Wire Bus Line
	1350 4200 900  4200
Wire Bus Line
	2350 4200 2800 4200
Text Label 900  4200 0    50   ~ 0
AB[0..18]
Text Label 2800 4200 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 3200 1000 600 
U 65B2AF51
F0 "sheet65B2AE93" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 3300 50 
F3 "~CE" I L 3550 3500 50 
F4 "~R" I L 3550 3600 50 
F5 "~W" I L 3550 3700 50 
F6 "~DB[0..15]" T R 4550 3300 50 
$EndSheet
Wire Wire Line
	1350 4400 900  4400
Wire Bus Line
	1350 5100 900  5100
Wire Bus Line
	2350 5100 2800 5100
Text Label 900  5100 0    50   ~ 0
AB[0..18]
Text Label 2800 5100 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 4100 1000 600 
U 65B2AF5D
F0 "sheet65B2AE94" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 4200 50 
F3 "~CE" I L 1350 4400 50 
F4 "~R" I L 1350 4500 50 
F5 "~W" I L 1350 4600 50 
F6 "~DB[0..15]" T R 2350 4200 50 
$EndSheet
Wire Wire Line
	1350 5300 900  5300
Wire Bus Line
	1350 6000 900  6000
Wire Bus Line
	2350 6000 2800 6000
Text Label 900  6000 0    50   ~ 0
AB[0..18]
Text Label 2800 6000 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 4100 1000 600 
U 65B2AF69
F0 "sheet65B2AE95" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 4200 50 
F3 "~CE" I L 3550 4400 50 
F4 "~R" I L 3550 4500 50 
F5 "~W" I L 3550 4600 50 
F6 "~DB[0..15]" T R 4550 4200 50 
$EndSheet
Wire Wire Line
	1350 6200 900  6200
Wire Bus Line
	1350 6900 900  6900
Wire Bus Line
	2350 6900 2800 6900
Text Label 900  6900 0    50   ~ 0
AB[0..18]
Text Label 2800 6900 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 5000 1000 600 
U 65B2AF75
F0 "sheet65B2AE96" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 5100 50 
F3 "~CE" I L 1350 5300 50 
F4 "~R" I L 1350 5400 50 
F5 "~W" I L 1350 5500 50 
F6 "~DB[0..15]" T R 2350 5100 50 
$EndSheet
Wire Wire Line
	1350 7100 900  7100
Wire Bus Line
	1350 7800 900  7800
Wire Bus Line
	2350 7800 2800 7800
Text Label 900  7800 0    50   ~ 0
AB[0..18]
Text Label 2800 7800 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 5000 1000 600 
U 65B2AF81
F0 "sheet65B2AE97" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 5100 50 
F3 "~CE" I L 3550 5300 50 
F4 "~R" I L 3550 5400 50 
F5 "~W" I L 3550 5500 50 
F6 "~DB[0..15]" T R 4550 5100 50 
$EndSheet
Wire Wire Line
	1350 8000 900  8000
Wire Bus Line
	3550 3300 3100 3300
Wire Bus Line
	4550 3300 5000 3300
Text Label 3100 3300 0    50   ~ 0
AB[0..18]
Text Label 5000 3300 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 5900 1000 600 
U 65B2AF8D
F0 "sheet65B2AE98" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 6000 50 
F3 "~CE" I L 1350 6200 50 
F4 "~R" I L 1350 6300 50 
F5 "~W" I L 1350 6400 50 
F6 "~DB[0..15]" T R 2350 6000 50 
$EndSheet
Wire Wire Line
	3550 3500 3100 3500
Wire Bus Line
	3550 4200 3100 4200
Wire Bus Line
	4550 4200 5000 4200
Text Label 3100 4200 0    50   ~ 0
AB[0..18]
Text Label 5000 4200 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 5900 1000 600 
U 65B2AF99
F0 "sheet65B2AE99" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 6000 50 
F3 "~CE" I L 3550 6200 50 
F4 "~R" I L 3550 6300 50 
F5 "~W" I L 3550 6400 50 
F6 "~DB[0..15]" T R 4550 6000 50 
$EndSheet
Wire Wire Line
	3550 4400 3100 4400
Wire Bus Line
	3550 5100 3100 5100
Wire Bus Line
	4550 5100 5000 5100
Text Label 3100 5100 0    50   ~ 0
AB[0..18]
Text Label 5000 5100 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 6800 1000 600 
U 65B2AFA5
F0 "sheet65B2AE9A" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 6900 50 
F3 "~CE" I L 1350 7100 50 
F4 "~R" I L 1350 7200 50 
F5 "~W" I L 1350 7300 50 
F6 "~DB[0..15]" T R 2350 6900 50 
$EndSheet
Wire Wire Line
	3550 5300 3100 5300
Wire Bus Line
	3550 6000 3100 6000
Wire Bus Line
	4550 6000 5000 6000
Text Label 3100 6000 0    50   ~ 0
AB[0..18]
Text Label 5000 6000 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 6800 1000 600 
U 65B2AFB1
F0 "sheet65B2AE9B" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 6900 50 
F3 "~CE" I L 3550 7100 50 
F4 "~R" I L 3550 7200 50 
F5 "~W" I L 3550 7300 50 
F6 "~DB[0..15]" T R 4550 6900 50 
$EndSheet
Wire Wire Line
	3550 6200 3100 6200
Wire Bus Line
	3550 6900 3100 6900
Wire Bus Line
	4550 6900 5000 6900
Text Label 3100 6900 0    50   ~ 0
AB[0..18]
Text Label 5000 6900 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 7700 1000 600 
U 65B2AFBD
F0 "sheet65B2AE9C" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 7800 50 
F3 "~CE" I L 1350 8000 50 
F4 "~R" I L 1350 8100 50 
F5 "~W" I L 1350 8200 50 
F6 "~DB[0..15]" T R 2350 7800 50 
$EndSheet
Wire Wire Line
	3550 7100 3100 7100
Wire Bus Line
	3550 7800 3100 7800
Wire Bus Line
	4550 7800 5000 7800
Text Label 3100 7800 0    50   ~ 0
AB[0..18]
Text Label 5000 7800 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 7700 1000 600 
U 65B2AFC9
F0 "sheet65B2AE9D" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 7800 50 
F3 "~CE" I L 3550 8000 50 
F4 "~R" I L 3550 8100 50 
F5 "~W" I L 3550 8200 50 
F6 "~DB[0..15]" T R 4550 7800 50 
$EndSheet
Wire Wire Line
	3550 8000 3100 8000
$Comp
L power:+5V #PWR?
U 1 1 65B2AFD0
P 14500 4300
AR Path="/60F438E4/65B2AFD0" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFD0" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 14500 4150 50  0001 C CNN
F 1 "+5V" H 14515 4473 50  0000 C CNN
F 2 "" H 14500 4300 50  0001 C CNN
F 3 "" H 14500 4300 50  0001 C CNN
	1    14500 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 65B2AFD6
P 12350 4550
AR Path="/60F438E4/65B2AFD6" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFD6" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 12350 4300 50  0001 C CNN
F 1 "GND" H 12355 4377 50  0000 C CNN
F 2 "" H 12350 4550 50  0001 C CNN
F 3 "" H 12350 4550 50  0001 C CNN
	1    12350 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 65B2AFDC
P 14500 4500
AR Path="/60F438E4/65B2AFDC" Ref="#PWR?"  Part="1" 
AR Path="/65B2AFDC" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 14500 4250 50  0001 C CNN
F 1 "GND" H 14505 4327 50  0000 C CNN
F 2 "" H 14500 4500 50  0001 C CNN
F 3 "" H 14500 4500 50  0001 C CNN
	1    14500 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13250 2950 13550 2950
Text Label 13550 3050 2    50   ~ 0
~R
Wire Wire Line
	13250 3050 13550 3050
Wire Wire Line
	13250 3150 13550 3150
Text Label 13550 2950 2    50   ~ 0
~CS16
Text Label 13550 3150 2    50   ~ 0
~ROMW
Text Label 900  3500 0    50   ~ 0
~CS0
Text Label 3100 3500 0    50   ~ 0
~CS1
Text Label 900  4400 0    50   ~ 0
~CS2
Text Label 3100 4400 0    50   ~ 0
~CS3
Text Label 900  5300 0    50   ~ 0
~CS4
Text Label 3100 5300 0    50   ~ 0
~CS5
Text Label 900  6200 0    50   ~ 0
~CS6
Text Label 3100 6200 0    50   ~ 0
~CS7
Text Label 900  7100 0    50   ~ 0
~CS8
Text Label 3100 7100 0    50   ~ 0
~CS9
Text Label 900  8000 0    50   ~ 0
~CS10
Text Label 3100 8000 0    50   ~ 0
~CS11
Text Label 900  3600 0    50   ~ 0
~R
Wire Wire Line
	3550 3600 3100 3600
Wire Wire Line
	3550 3700 3100 3700
Text Label 3100 3700 0    50   ~ 0
~W
Text Label 3100 3600 0    50   ~ 0
~R
Wire Wire Line
	1350 4500 900  4500
Wire Wire Line
	1350 4600 900  4600
Text Label 900  4600 0    50   ~ 0
~W
Text Label 900  4500 0    50   ~ 0
~R
Wire Wire Line
	1350 5400 900  5400
Wire Wire Line
	1350 5500 900  5500
Text Label 900  5500 0    50   ~ 0
~W
Text Label 900  5400 0    50   ~ 0
~R
Wire Wire Line
	1350 6300 900  6300
Wire Wire Line
	1350 6400 900  6400
Text Label 900  6400 0    50   ~ 0
~W
Text Label 900  6300 0    50   ~ 0
~R
Wire Wire Line
	1350 7200 900  7200
Wire Wire Line
	1350 7300 900  7300
Text Label 900  7300 0    50   ~ 0
~W
Text Label 900  7200 0    50   ~ 0
~R
Wire Wire Line
	1350 8100 900  8100
Wire Wire Line
	1350 8200 900  8200
Text Label 900  8200 0    50   ~ 0
~W
Text Label 900  8100 0    50   ~ 0
~R
Wire Wire Line
	3550 8100 3100 8100
Wire Wire Line
	3550 8200 3100 8200
Text Label 3100 8200 0    50   ~ 0
~W
Text Label 3100 8100 0    50   ~ 0
~R
Wire Wire Line
	3550 7200 3100 7200
Wire Wire Line
	3550 7300 3100 7300
Text Label 3100 7300 0    50   ~ 0
~W
Text Label 3100 7200 0    50   ~ 0
~R
Wire Wire Line
	3550 6300 3100 6300
Wire Wire Line
	3550 6400 3100 6400
Text Label 3100 6400 0    50   ~ 0
~W
Text Label 3100 6300 0    50   ~ 0
~R
Wire Wire Line
	3550 5400 3100 5400
Wire Wire Line
	3550 5500 3100 5500
Text Label 3100 5500 0    50   ~ 0
~W
Text Label 3100 5400 0    50   ~ 0
~R
Wire Wire Line
	3550 4500 3100 4500
Wire Wire Line
	3550 4600 3100 4600
Text Label 3100 4600 0    50   ~ 0
~W
Text Label 3100 4500 0    50   ~ 0
~R
Text Label 15700 3150 2    50   ~ 0
~ROMW
Text Label 15700 2950 2    50   ~ 0
~CS16
Wire Wire Line
	15400 3150 15700 3150
Wire Wire Line
	15400 3050 15700 3050
Text Label 15700 3050 2    50   ~ 0
~R
Wire Wire Line
	15400 2950 15700 2950
Wire Wire Line
	15400 2050 15700 2050
Wire Wire Line
	15400 2150 15700 2150
Wire Wire Line
	15400 2250 15700 2250
Wire Wire Line
	15400 2350 15700 2350
Wire Wire Line
	15400 2450 15700 2450
Wire Wire Line
	15400 2550 15700 2550
Wire Wire Line
	15400 2650 15700 2650
Wire Wire Line
	15400 2750 15700 2750
Text Label 15700 2050 2    50   ~ 0
DB0
Text Label 15700 2150 2    50   ~ 0
DB1
Text Label 15700 2250 2    50   ~ 0
DB2
Text Label 15700 2350 2    50   ~ 0
DB3
Text Label 15700 2450 2    50   ~ 0
DB4
Text Label 15700 2550 2    50   ~ 0
DB5
Text Label 15700 2650 2    50   ~ 0
DB6
Text Label 15700 2750 2    50   ~ 0
DB7
$Comp
L alexios:29W040 U?
U 1 1 65B2B0E8
P 14850 2850
AR Path="/60F438E4/65B2B0E8" Ref="U?"  Part="1" 
AR Path="/65B2B0E8" Ref="U5"  Part="1" 
F 0 "U5" H 14850 3917 50  0000 C CNN
F 1 "29W040" H 14850 3826 50  0000 C CNN
F 2 "alexios:PLCC32" H 14850 2850 50  0001 C CNN
F 3 "" H 14850 2850 50  0001 C CNN
	1    14850 2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W040 U?
U 1 1 65B2B0EE
P 12700 2850
AR Path="/60F438E4/65B2B0EE" Ref="U?"  Part="1" 
AR Path="/65B2B0EE" Ref="U4"  Part="1" 
F 0 "U4" H 12700 3917 50  0000 C CNN
F 1 "29W040" H 12700 3826 50  0000 C CNN
F 2 "alexios:PLCC32" H 12700 2850 50  0001 C CNN
F 3 "" H 12700 2850 50  0001 C CNN
	1    12700 2850
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W040 U?
U 2 1 65B2B0F4
P 14850 4400
AR Path="/60F438E4/65B2B0F4" Ref="U?"  Part="2" 
AR Path="/65B2B0F4" Ref="U5"  Part="2" 
F 0 "U5" H 15030 4446 50  0000 L CNN
F 1 "29W040" H 15030 4355 50  0000 L CNN
F 2 "alexios:PLCC32" H 14850 4400 50  0001 C CNN
F 3 "" H 14850 4400 50  0001 C CNN
	2    14850 4400
	1    0    0    -1  
$EndComp
$Comp
L alexios:29W040 U?
U 2 1 65B2B0FA
P 12700 4450
AR Path="/60F438E4/65B2B0FA" Ref="U?"  Part="2" 
AR Path="/65B2B0FA" Ref="U4"  Part="2" 
F 0 "U4" H 12880 4496 50  0000 L CNN
F 1 "29W040" H 12880 4405 50  0000 L CNN
F 2 "alexios:PLCC32" H 12700 4450 50  0001 C CNN
F 3 "" H 12700 4450 50  0001 C CNN
	2    12700 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 65B2B100
P 12350 4350
AR Path="/60F438E4/65B2B100" Ref="#PWR?"  Part="1" 
AR Path="/65B2B100" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 12350 4200 50  0001 C CNN
F 1 "+5V" H 12365 4523 50  0000 C CNN
F 2 "" H 12350 4350 50  0001 C CNN
F 3 "" H 12350 4350 50  0001 C CNN
	1    12350 4350
	1    0    0    -1  
$EndComp
Connection ~ 14500 4300
Connection ~ 14500 4500
Connection ~ 12350 4350
Connection ~ 12350 4550
Text Notes 5550 2900 0    197  ~ 39
Address Decoders
Text Notes 1000 2900 0    197  ~ 39
1–20× 512Kw Static RAM
Text Notes 11800 1200 0    197  ~ 39
512kW ROM (Flash RAM)
Text Notes -3450 1300 0    50   ~ 0
All devices are 512K which eases decoding. There is space for 24\n512K×8 SRAM packages which provide between 512 kW and 6 MW.\nAll chips except the lowest bank are optional.\n\nROM is mapped to 80:0000₁₆.
Text Notes -3450 700  0    100  ~ 20
Notes
Text Notes -9600 500  0    197  ~ 39
Read/Write Decoding
Wire Notes Line width 12 style solid
	-3700 1550 -600 1550
Wire Notes Line width 12 style solid
	-600 1550 -600 300 
Wire Notes Line width 12 style solid
	10750 1550 9850 1550
Wire Bus Line
	1350 8700 900  8700
Wire Bus Line
	2350 8700 2800 8700
Text Label 900  8700 0    50   ~ 0
AB[0..18]
Text Label 2800 8700 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 8600 1000 600 
U 65B2B182
F0 "sheet65B2AE9E" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 8700 50 
F3 "~CE" I L 1350 8900 50 
F4 "~R" I L 1350 9000 50 
F5 "~W" I L 1350 9100 50 
F6 "~DB[0..15]" T R 2350 8700 50 
$EndSheet
Wire Wire Line
	1350 8900 900  8900
Wire Bus Line
	1350 9600 900  9600
Wire Bus Line
	2350 9600 2800 9600
Text Label 900  9600 0    50   ~ 0
AB[0..18]
Text Label 2800 9600 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 8600 1000 600 
U 65B2B18E
F0 "sheet65B2AE9F" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 8700 50 
F3 "~CE" I L 3550 8900 50 
F4 "~R" I L 3550 9000 50 
F5 "~W" I L 3550 9100 50 
F6 "~DB[0..15]" T R 4550 8700 50 
$EndSheet
Wire Wire Line
	1350 9800 900  9800
Wire Bus Line
	3550 8700 3100 8700
Wire Bus Line
	4550 8700 5000 8700
Text Label 3100 8700 0    50   ~ 0
AB[0..18]
Text Label 5000 8700 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 9500 1000 600 
U 65B2B19A
F0 "sheet65B2AEA0" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 9600 50 
F3 "~CE" I L 1350 9800 50 
F4 "~R" I L 1350 9900 50 
F5 "~W" I L 1350 10000 50 
F6 "~DB[0..15]" T R 2350 9600 50 
$EndSheet
Wire Wire Line
	3550 8900 3100 8900
Wire Bus Line
	3550 9600 3100 9600
Wire Bus Line
	4550 9600 5000 9600
Text Label 3100 9600 0    50   ~ 0
AB[0..18]
Text Label 5000 9600 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 9500 1000 600 
U 65B2B1A6
F0 "sheet65B2AEA1" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 9600 50 
F3 "~CE" I L 3550 9800 50 
F4 "~R" I L 3550 9900 50 
F5 "~W" I L 3550 10000 50 
F6 "~DB[0..15]" T R 4550 9600 50 
$EndSheet
Wire Wire Line
	3550 9800 3100 9800
Text Label 900  8900 0    50   ~ 0
~CS12
Text Label 3100 8900 0    50   ~ 0
~CS13
Text Label 900  9800 0    50   ~ 0
~CS14
Text Label 3100 9800 0    50   ~ 0
~CS15
Wire Wire Line
	1350 9000 900  9000
Wire Wire Line
	1350 9100 900  9100
Text Label 900  9100 0    50   ~ 0
~W
Text Label 900  9000 0    50   ~ 0
~R
Wire Wire Line
	1350 9900 900  9900
Wire Wire Line
	1350 10000 900  10000
Text Label 900  10000 0    50   ~ 0
~W
Text Label 900  9900 0    50   ~ 0
~R
Wire Wire Line
	3550 9900 3100 9900
Wire Wire Line
	3550 10000 3100 10000
Text Label 3100 10000 0    50   ~ 0
~W
Text Label 3100 9900 0    50   ~ 0
~R
Wire Wire Line
	3550 9000 3100 9000
Wire Wire Line
	3550 9100 3100 9100
Text Label 3100 9100 0    50   ~ 0
~W
Text Label 3100 9000 0    50   ~ 0
~R
Wire Bus Line
	1350 10450 900  10450
Wire Bus Line
	2350 10450 2800 10450
Text Label 900  10450 0    50   ~ 0
AB[0..18]
Text Label 2800 10450 2    50   ~ 0
DB[0..15]
$Sheet
S 1350 10350 1000 600 
U 65B2B1C6
F0 "sheet65B2AEA2" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 1350 10450 50 
F3 "~CE" I L 1350 10650 50 
F4 "~R" I L 1350 10750 50 
F5 "~W" I L 1350 10850 50 
F6 "~DB[0..15]" T R 2350 10450 50 
$EndSheet
Wire Wire Line
	1350 10650 900  10650
Wire Bus Line
	3550 10450 3100 10450
Wire Bus Line
	4550 10450 5000 10450
Text Label 3100 10450 0    50   ~ 0
AB[0..18]
Text Label 5000 10450 2    50   ~ 0
DB[0..15]
$Sheet
S 3550 10350 1000 600 
U 65B2B1DE
F0 "sheet65B2AEA4" 50
F1 "rambank.sch" 50
F2 "AB[0..18]" I L 3550 10450 50 
F3 "~CE" I L 3550 10650 50 
F4 "~R" I L 3550 10750 50 
F5 "~W" I L 3550 10850 50 
F6 "~DB[0..15]" T R 4550 10450 50 
$EndSheet
Wire Wire Line
	3550 10650 3100 10650
Text Label 900  10650 0    50   ~ 0
~CS20
Wire Wire Line
	1350 10750 900  10750
Wire Wire Line
	1350 10850 900  10850
Text Label 900  10850 0    50   ~ 0
~W
Text Label 900  10750 0    50   ~ 0
~R
Wire Wire Line
	3550 10750 3100 10750
Wire Wire Line
	3550 10850 3100 10850
Text Label 3100 10850 0    50   ~ 0
~W
Text Label 3100 10750 0    50   ~ 0
~R
Wire Wire Line
	7450 5100 7050 5100
Wire Wire Line
	7450 5200 7050 5200
Wire Wire Line
	7450 5300 7050 5300
Wire Wire Line
	7050 5400 7450 5400
Wire Wire Line
	7050 5500 7450 5500
Wire Wire Line
	7050 5600 7450 5600
Wire Wire Line
	7050 5700 7450 5700
Wire Wire Line
	7050 5800 7450 5800
Wire Wire Line
	7450 6650 7050 6650
Wire Wire Line
	7450 6750 7050 6750
Wire Wire Line
	7450 6850 7050 6850
Wire Wire Line
	7050 6950 7450 6950
Wire Wire Line
	7050 7050 7450 7050
Wire Wire Line
	7050 7150 7450 7150
Wire Wire Line
	7050 7250 7450 7250
Wire Wire Line
	7050 7350 7450 7350
Wire Wire Line
	6150 3400 5750 3400
Wire Wire Line
	6150 3500 5750 3500
Wire Wire Line
	6150 3600 5750 3600
Wire Wire Line
	6150 3700 5750 3700
Wire Wire Line
	6150 3800 5750 3800
Text Label 5750 3800 0    50   ~ 0
AB23
Text Label 5750 3700 0    50   ~ 0
AB22
Text Label 5750 3600 0    50   ~ 0
AB21
Text Label 5750 3500 0    50   ~ 0
AB20
Text Label 5750 3400 0    50   ~ 0
AB19
Wire Wire Line
	6150 3900 5750 3900
Text Label 5750 3900 0    50   ~ 0
~MEM
Wire Wire Line
	6150 5100 5750 5100
Wire Wire Line
	6150 5200 5750 5200
Wire Wire Line
	6150 5300 5750 5300
Wire Wire Line
	6150 5400 5750 5400
Wire Wire Line
	6150 5500 5750 5500
Text Label 5750 5500 0    50   ~ 0
AB23
Text Label 5750 5400 0    50   ~ 0
AB22
Text Label 5750 5300 0    50   ~ 0
AB21
Text Label 5750 5200 0    50   ~ 0
AB20
Text Label 5750 5100 0    50   ~ 0
AB19
Wire Wire Line
	6150 5600 5750 5600
Text Label 5750 5600 0    50   ~ 0
~MEM
Wire Wire Line
	6150 6650 5750 6650
Wire Wire Line
	6150 6750 5750 6750
Wire Wire Line
	6150 6850 5750 6850
Wire Wire Line
	6150 6950 5750 6950
Wire Wire Line
	6150 7050 5750 7050
Text Label 5750 7050 0    50   ~ 0
AB23
Text Label 5750 6950 0    50   ~ 0
AB22
Text Label 5750 6850 0    50   ~ 0
AB21
Text Label 5750 6750 0    50   ~ 0
AB20
Text Label 5750 6650 0    50   ~ 0
AB19
Wire Wire Line
	6150 7150 5750 7150
Text Label 5750 7150 0    50   ~ 0
~MEM
Text Label 7450 3400 2    50   ~ 0
~CS0
Text Label 7450 3500 2    50   ~ 0
~CS1
Text Label 7450 3600 2    50   ~ 0
~CS2
Text Label 7450 3700 2    50   ~ 0
~CS3
Text Label 7450 3800 2    50   ~ 0
~CS4
Text Label 7450 3900 2    50   ~ 0
~CS5
Text Label 7450 4000 2    50   ~ 0
~CS6
Text Label 7450 4100 2    50   ~ 0
~CS7
Text Label 7450 5100 2    50   ~ 0
~CS8
Text Label 7450 5200 2    50   ~ 0
~CS9
Text Label 7450 5300 2    50   ~ 0
~CS10
Text Label 7450 5400 2    50   ~ 0
~CS11
Text Label 7450 5500 2    50   ~ 0
~CS12
Text Label 7450 5600 2    50   ~ 0
~CS13
Text Label 7450 5700 2    50   ~ 0
~CS14
Text Label 7450 5800 2    50   ~ 0
~CS15
Text Label 7450 6650 2    50   ~ 0
~CS16
Text Label 7450 6750 2    50   ~ 0
~CS17
Text Label 7450 6850 2    50   ~ 0
~CS18
Text Label 7450 6950 2    50   ~ 0
~CS19
Text Label 7450 7050 2    50   ~ 0
~CS20
Text Label 7450 7150 2    50   ~ 0
~CS21
Text Label 7450 7250 2    50   ~ 0
~CS22
Text Label 7450 7350 2    50   ~ 0
~CS23
$Comp
L alexios:ATF16V8B U1
U 1 1 65BDD2B0
P 6600 3850
F 0 "U1" H 6600 4600 50  0000 C CNN
F 1 "ATF16V8B" H 6600 4500 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6600 3850 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 6600 3850 50  0001 C CNN
F 4 "MEMDEC00" V 6600 3900 50  0000 C CNB "Signature"
F 5 "mem-decoder.jed" H 6600 3200 50  0000 C CNN "Image Filename"
	1    6600 3850
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U3
U 1 1 6790CC6A
P 6600 5550
F 0 "U3" H 6600 6300 50  0000 C CNN
F 1 "ATF16V8B" H 6600 6200 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6600 5550 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 6600 5550 50  0001 C CNN
F 4 "MEMDEC00" V 6600 5600 50  0000 C CNB "Signature"
F 5 "mem-decoder.jed" H 6600 4900 50  0000 C CNN "Image Filename"
	1    6600 5550
	1    0    0    -1  
$EndComp
$Comp
L alexios:ATF16V8B U2
U 1 1 6790D79A
P 6600 7100
F 0 "U2" H 6600 7850 50  0000 C CNN
F 1 "ATF16V8B" H 6600 7750 50  0000 C CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6600 7100 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 6600 7100 50  0001 C CNN
F 4 "MEMDEC00" V 6600 7150 50  0000 C CNB "Signature"
F 5 "mem-decoder.jed" H 6600 6450 50  0000 C CNN "Image Filename"
	1    6600 7100
	1    0    0    -1  
$EndComp
NoConn ~ 6150 4200
NoConn ~ 6150 4300
NoConn ~ 6150 5900
NoConn ~ 6150 6000
NoConn ~ 6150 7450
NoConn ~ 6150 7550
$Comp
L Jumper:SolderJumper_2_Bridged JP1
U 1 1 67BC8A3C
P 5950 4000
F 0 "JP1" H 5650 4050 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5950 4114 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5950 4000 50  0001 C CNN
F 3 "~" H 5950 4000 50  0001 C CNN
	1    5950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4000 6150 4000
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 67CBDAB3
P 5950 4100
F 0 "JP2" H 5650 4150 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5950 4214 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5950 4100 50  0001 C CNN
F 3 "~" H 5950 4100 50  0001 C CNN
	1    5950 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4100 6150 4100
Wire Wire Line
	5800 4000 5750 4000
Wire Wire Line
	5750 4000 5750 4100
$Comp
L power:GND #PWR0102
U 1 1 67D633DC
P 5750 4150
F 0 "#PWR0102" H 5750 3900 50  0001 C CNN
F 1 "GND" H 5600 4100 50  0000 C CNN
F 2 "" H 5750 4150 50  0001 C CNN
F 3 "" H 5750 4150 50  0001 C CNN
	1    5750 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4100 5800 4100
Connection ~ 5750 4100
Wire Wire Line
	5750 4100 5750 4150
Wire Wire Line
	6100 5700 6150 5700
Wire Wire Line
	6100 5800 6150 5800
Wire Wire Line
	5800 5700 5750 5700
Wire Wire Line
	5750 5700 5750 5800
$Comp
L power:GND #PWR0108
U 1 1 67E5BABB
P 5750 5850
F 0 "#PWR0108" H 5750 5600 50  0001 C CNN
F 1 "GND" H 5550 5800 50  0000 C CNN
F 2 "" H 5750 5850 50  0001 C CNN
F 3 "" H 5750 5850 50  0001 C CNN
	1    5750 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5800 5800 5800
Connection ~ 5750 5800
Wire Wire Line
	5750 5800 5750 5850
Wire Wire Line
	6100 7250 6150 7250
$Comp
L Jumper:SolderJumper_2_Bridged JP6
U 1 1 67EAFA90
P 5950 7350
F 0 "JP6" H 5650 7400 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5950 7464 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5950 7350 50  0001 C CNN
F 3 "~" H 5950 7350 50  0001 C CNN
	1    5950 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 7350 6150 7350
Wire Wire Line
	5800 7250 5750 7250
Wire Wire Line
	5750 7250 5750 7350
$Comp
L power:GND #PWR0127
U 1 1 67EAFA99
P 5750 7400
F 0 "#PWR0127" H 5750 7150 50  0001 C CNN
F 1 "GND" H 5600 7350 50  0000 C CNN
F 2 "" H 5750 7400 50  0001 C CNN
F 3 "" H 5750 7400 50  0001 C CNN
	1    5750 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 7350 5800 7350
Connection ~ 5750 7350
Wire Wire Line
	5750 7350 5750 7400
$Comp
L Jumper:SolderJumper_2_Bridged JP3
U 1 1 67E5BAAB
P 5950 5700
F 0 "JP3" H 5650 5750 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5950 5814 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 5950 5700 50  0001 C CNN
F 3 "~" H 5950 5700 50  0001 C CNN
	1    5950 5700
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 67F05347
P 5950 5800
F 0 "JP4" H 5650 5850 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5950 5914 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5950 5800 50  0001 C CNN
F 3 "~" H 5950 5800 50  0001 C CNN
	1    5950 5800
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 67F089E5
P 5950 7250
F 0 "JP5" H 5650 7300 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5950 7364 50  0001 C CNN
F 2 "alexios:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5950 7250 50  0001 C CNN
F 3 "~" H 5950 7250 50  0001 C CNN
	1    5950 7250
	1    0    0    -1  
$EndComp
Text Notes 7550 3400 0    50   ~ 0
00:0000 – 07:FFFF
Text Notes 7550 3500 0    50   ~ 0
08:0000 – 0F:FFFF
Text Notes 7550 3600 0    50   ~ 0
10:0000 – 17:FFFF
Text Notes 7550 3700 0    50   ~ 0
18:0000 – 1F:FFFF
Text Notes 7550 3800 0    50   ~ 0
20:0000 – 27:FFFF
Text Notes 7550 3900 0    50   ~ 0
28:0000 – 2F:FFFF
Text Notes 7550 4000 0    50   ~ 0
30:0000 – 37:FFFF
Text Notes 7550 4100 0    50   ~ 0
38:0000 – 3F:FFFF
Text Notes 7550 5100 0    50   ~ 0
40:0000 – 47:FFFF
Text Notes 7550 5200 0    50   ~ 0
48:0000 – 4F:FFFF
Text Notes 7550 5300 0    50   ~ 0
50:0000 – 57:FFFF
Text Notes 7550 5400 0    50   ~ 0
58:0000 – 5F:FFFF
Text Notes 7550 5500 0    50   ~ 0
60:0000 – 67:FFFF
Text Notes 7550 5600 0    50   ~ 0
68:0000 – 6F:FFFF
Text Notes 7550 5700 0    50   ~ 0
70:0000 – 77:FFFF
Text Notes 7550 5800 0    50   ~ 0
78:0000 – 7F:FFFF
Text Notes 7550 6650 0    50   ~ 0
80:0000 – 87:FFFF — ROM
Text Notes 7550 6750 0    50   ~ 0
88:0000 – 8F:FFFF
Text Notes 7550 6850 0    50   ~ 0
90:0000 – 97:FFFF
Text Notes 7550 6950 0    50   ~ 0
98:0000 – 9F:FFFF
Text Notes 7550 7050 0    50   ~ 0
A0:0000 – A7:FFFF
Text Notes 7550 7150 0    50   ~ 0
A8:0000 – AF:FFFF
Text Notes 7550 7250 0    50   ~ 0
B0:0000 – B7:FFFF
Text Notes 7550 7350 0    50   ~ 0
B8:0000 – BF:FFFF
$Comp
L alexios:ATF16V8B U1
U 2 1 6805CCD0
P 6200 9700
F 0 "U1" H 6380 9746 50  0000 L CNN
F 1 "ATF16V8B" H 6380 9655 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 6200 9700 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 6200 9700 50  0001 C CNN
F 4 "MEMDEC00" V 6200 9750 50  0001 C CNB "Signature"
F 5 "mem-decoder.jed" H 6200 9050 50  0001 C CNN "Image Filename"
	2    6200 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6805ECA1
P 5850 9600
AR Path="/60F438E4/6805ECA1" Ref="#PWR?"  Part="1" 
AR Path="/6805ECA1" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 5850 9450 50  0001 C CNN
F 1 "+5V" H 5865 9773 50  0000 C CNN
F 2 "" H 5850 9600 50  0001 C CNN
F 3 "" H 5850 9600 50  0001 C CNN
	1    5850 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6805ECA7
P 5850 9800
AR Path="/60F438E4/6805ECA7" Ref="#PWR?"  Part="1" 
AR Path="/6805ECA7" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 5850 9550 50  0001 C CNN
F 1 "GND" H 5855 9627 50  0000 C CNN
F 2 "" H 5850 9800 50  0001 C CNN
F 3 "" H 5850 9800 50  0001 C CNN
	1    5850 9800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6805ECB3
P 5850 9700
AR Path="/5E94D03A/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC68F14/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC75B87/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC75B97/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC8475C/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC8476C/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC8477C/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5EC8478C/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECB980E/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECB981E/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECCD509/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECCD519/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECCD529/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECCD539/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/6805ECB3" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/6805ECB3" Ref="C?"  Part="1" 
AR Path="/6805ECB3" Ref="C1"  Part="1" 
AR Path="/60F438E4/6805ECB3" Ref="C?"  Part="1" 
F 0 "C1" H 5759 9746 50  0000 R CNN
F 1 "100nF" H 5759 9655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5850 9700 50  0001 C CNN
F 3 "~" H 5850 9700 50  0001 C CNN
	1    5850 9700
	1    0    0    -1  
$EndComp
Connection ~ 5850 9800
Connection ~ 5850 9600
$Comp
L alexios:ATF16V8B U2
U 2 1 6810B3EB
P 7500 9700
F 0 "U2" H 7680 9746 50  0000 L CNN
F 1 "ATF16V8B" H 7680 9655 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 7500 9700 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 7500 9700 50  0001 C CNN
F 4 "MEMDEC00" V 7500 9750 50  0001 C CNB "Signature"
F 5 "mem-decoder.jed" H 7500 9050 50  0001 C CNN "Image Filename"
	2    7500 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6810B3F1
P 7150 9600
AR Path="/60F438E4/6810B3F1" Ref="#PWR?"  Part="1" 
AR Path="/6810B3F1" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 7150 9450 50  0001 C CNN
F 1 "+5V" H 7165 9773 50  0000 C CNN
F 2 "" H 7150 9600 50  0001 C CNN
F 3 "" H 7150 9600 50  0001 C CNN
	1    7150 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6810B3F7
P 7150 9800
AR Path="/60F438E4/6810B3F7" Ref="#PWR?"  Part="1" 
AR Path="/6810B3F7" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 7150 9550 50  0001 C CNN
F 1 "GND" H 7155 9627 50  0000 C CNN
F 2 "" H 7150 9800 50  0001 C CNN
F 3 "" H 7150 9800 50  0001 C CNN
	1    7150 9800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6810B3FD
P 7150 9700
AR Path="/5E94D03A/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC68F14/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC75B87/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC75B97/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC8475C/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC8476C/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC8477C/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5EC8478C/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECB980E/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECB981E/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECCD509/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECCD519/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECCD529/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECCD539/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/6810B3FD" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/6810B3FD" Ref="C?"  Part="1" 
AR Path="/6810B3FD" Ref="C2"  Part="1" 
AR Path="/60F438E4/6810B3FD" Ref="C?"  Part="1" 
F 0 "C2" H 7059 9746 50  0000 R CNN
F 1 "100nF" H 7059 9655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 9700 50  0001 C CNN
F 3 "~" H 7150 9700 50  0001 C CNN
	1    7150 9700
	1    0    0    -1  
$EndComp
Connection ~ 7150 9800
Connection ~ 7150 9600
$Comp
L alexios:ATF16V8B U3
U 2 1 6816157A
P 8800 9700
F 0 "U3" H 8980 9746 50  0000 L CNN
F 1 "ATF16V8B" H 8980 9655 50  0000 L CNN
F 2 "alexios:DIP-20_W7.62mm_Socket" H 8800 9700 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-0364-PLD-ATF16V8B-8BQ-8BQL-Datasheet.pdf" H 8800 9700 50  0001 C CNN
F 4 "MEMDEC00" V 8800 9750 50  0001 C CNB "Signature"
F 5 "mem-decoder.jed" H 8800 9050 50  0001 C CNN "Image Filename"
	2    8800 9700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 68161580
P 8450 9600
AR Path="/60F438E4/68161580" Ref="#PWR?"  Part="1" 
AR Path="/68161580" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 8450 9450 50  0001 C CNN
F 1 "+5V" H 8465 9773 50  0000 C CNN
F 2 "" H 8450 9600 50  0001 C CNN
F 3 "" H 8450 9600 50  0001 C CNN
	1    8450 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 68161586
P 8450 9800
AR Path="/60F438E4/68161586" Ref="#PWR?"  Part="1" 
AR Path="/68161586" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 8450 9550 50  0001 C CNN
F 1 "GND" H 8455 9627 50  0000 C CNN
F 2 "" H 8450 9800 50  0001 C CNN
F 3 "" H 8450 9800 50  0001 C CNN
	1    8450 9800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6816158C
P 8450 9700
AR Path="/5E94D03A/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC68F14/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC75B87/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC75B97/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC8475C/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC8476C/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC8477C/6816158C" Ref="C?"  Part="1" 
AR Path="/5EC8478C/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECB980E/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECB981E/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECCD509/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECCD519/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECCD529/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECCD539/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/6816158C" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/6816158C" Ref="C?"  Part="1" 
AR Path="/6816158C" Ref="C3"  Part="1" 
AR Path="/60F438E4/6816158C" Ref="C?"  Part="1" 
F 0 "C3" H 8359 9746 50  0000 R CNN
F 1 "100nF" H 8359 9655 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8450 9700 50  0001 C CNN
F 3 "~" H 8450 9700 50  0001 C CNN
	1    8450 9700
	1    0    0    -1  
$EndComp
Connection ~ 8450 9800
Connection ~ 8450 9600
$Comp
L Device:C_Small C?
U 1 1 65B2B106
P 14500 4400
AR Path="/5E94D03A/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC68F14/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC75B87/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC75B97/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC8475C/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC8476C/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC8477C/65B2B106" Ref="C?"  Part="1" 
AR Path="/5EC8478C/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECB980E/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECB981E/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECCD509/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECCD519/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECCD529/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECCD539/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/65B2B106" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/65B2B106" Ref="C?"  Part="1" 
AR Path="/65B2B106" Ref="C5"  Part="1" 
AR Path="/60F438E4/65B2B106" Ref="C?"  Part="1" 
F 0 "C5" H 14409 4446 50  0000 R CNN
F 1 "100nF" H 14409 4355 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14500 4400 50  0001 C CNN
F 3 "~" H 14500 4400 50  0001 C CNN
	1    14500 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 65B2B10E
P 12350 4450
AR Path="/5E94D03A/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC68F14/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC75B87/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC75B97/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC8475C/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC8476C/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC8477C/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5EC8478C/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECB980E/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECB981E/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECCD509/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECCD519/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECCD529/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECCD539/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECDEC4E/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECDEC5E/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECDEC6E/65B2B10E" Ref="C?"  Part="1" 
AR Path="/5ECDEC7E/65B2B10E" Ref="C?"  Part="1" 
AR Path="/65B2B10E" Ref="C4"  Part="1" 
AR Path="/60F438E4/65B2B10E" Ref="C?"  Part="1" 
F 0 "C4" H 12259 4496 50  0000 R CNN
F 1 "100nF" H 12259 4405 50  0000 R CNN
F 2 "alexios:SMD_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12350 4450 50  0001 C CNN
F 3 "~" H 12350 4450 50  0001 C CNN
	1    12350 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C104
U 1 1 634E8C5A
P 6750 10700
AR Path="/634E8C5A" Ref="C104"  Part="1" 
AR Path="/5D34E810/634E8C5A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/634E8C5A" Ref="C?"  Part="1" 
F 0 "C104" H 6662 10746 50  0000 R CNN
F 1 "47µF" H 6662 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6750 10700 50  0001 C CNN
F 3 "~" H 6750 10700 50  0001 C CNN
	1    6750 10700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C103
U 1 1 6084E505
P 6300 10700
AR Path="/6084E505" Ref="C103"  Part="1" 
AR Path="/5D34E810/6084E505" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/6084E505" Ref="C?"  Part="1" 
F 0 "C103" H 6212 10746 50  0000 R CNN
F 1 "47µF" H 6212 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6300 10700 50  0001 C CNN
F 3 "~" H 6300 10700 50  0001 C CNN
	1    6300 10700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C101
U 1 1 5F91D05A
P 5850 10700
AR Path="/5F91D05A" Ref="C101"  Part="1" 
AR Path="/5D34E810/5F91D05A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/5F91D05A" Ref="C?"  Part="1" 
F 0 "C101" H 5762 10746 50  0000 R CNN
F 1 "47µF" H 5762 10655 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5850 10700 50  0001 C CNN
F 3 "~" H 5850 10700 50  0001 C CNN
	1    5850 10700
	1    0    0    -1  
$EndComp
NoConn ~ 14000 9300
NoConn ~ 14000 9400
NoConn ~ 14000 9500
NoConn ~ 14000 9600
NoConn ~ 14000 9700
NoConn ~ 14000 9800
NoConn ~ 14000 9900
NoConn ~ 14000 10000
NoConn ~ 15900 6800
NoConn ~ 15900 7500
NoConn ~ 15900 7600
Text Label 15900 6300 2    50   ~ 0
~MEM
Text Label 3100 10650 0    50   ~ 0
~CS21
$Comp
L alexios:Jumper_3_Bridged12 JP7
U 1 1 60E9D3CF
P 4850 -1800
F 0 "JP7" V 4850 -1733 50  0000 L CNN
F 1 "Jumper_3_Bridged12" H 4850 -1690 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 4850 -1800 50  0001 C CNN
F 3 "~" H 4850 -1800 50  0001 C CNN
	1    4850 -1800
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 -1800 4350 -1800
Wire Wire Line
	4850 -1550 4350 -1550
Text Label 4350 -1800 0    50   ~ 0
~ROMW
$Comp
L power:+5V #PWR0143
U 1 1 60F986FD
P 4850 -2050
F 0 "#PWR0143" H 4850 -2200 50  0001 C CNN
F 1 "+5V" H 4865 -1877 50  0000 C CNN
F 2 "" H 4850 -2050 50  0001 C CNN
F 3 "" H 4850 -2050 50  0001 C CNN
	1    4850 -2050
	1    0    0    -1  
$EndComp
Text Label 4350 -1550 0    50   ~ 0
~W
NoConn ~ 12250 6500
NoConn ~ 12250 6600
NoConn ~ 12250 6700
NoConn ~ 12250 6800
NoConn ~ 12250 6900
NoConn ~ 12250 7000
NoConn ~ 12250 7100
NoConn ~ 12250 7200
NoConn ~ 12250 7300
NoConn ~ 12250 7400
NoConn ~ 12250 7500
NoConn ~ 12250 7600
NoConn ~ 12250 7700
NoConn ~ 12250 7800
NoConn ~ 12250 7900
NoConn ~ 12250 8000
NoConn ~ 12250 8100
NoConn ~ 12250 8200
NoConn ~ 12250 8300
NoConn ~ 11550 6300
NoConn ~ 11550 6900
NoConn ~ 11550 7000
NoConn ~ 11550 7100
NoConn ~ 11550 7200
NoConn ~ 11550 7300
NoConn ~ 11550 7500
NoConn ~ 11550 7600
NoConn ~ 11550 7700
NoConn ~ 11550 7800
NoConn ~ 11550 7900
NoConn ~ 11550 8100
NoConn ~ 11550 8200
NoConn ~ 11550 8300
NoConn ~ 11550 8400
NoConn ~ 9650 6500
NoConn ~ 9650 6600
NoConn ~ 9650 6700
NoConn ~ 9650 6800
NoConn ~ 9650 6900
NoConn ~ 9650 7100
NoConn ~ 9650 7200
NoConn ~ 9650 7300
NoConn ~ 9650 7400
NoConn ~ 9650 7500
NoConn ~ 9650 7600
NoConn ~ 9650 7700
NoConn ~ 9650 7800
NoConn ~ 9650 7900
NoConn ~ 9650 8000
NoConn ~ 9650 8100
NoConn ~ 9650 8200
NoConn ~ 9650 8300
NoConn ~ 9650 8400
NoConn ~ 9650 8500
NoConn ~ 9650 8600
NoConn ~ 9650 8800
NoConn ~ 9650 8900
NoConn ~ 9650 9000
NoConn ~ 9650 9100
NoConn ~ 9650 9200
Wire Wire Line
	9650 9200 10000 9200
Text Notes 9650 5900 0    50   ~ 0
Processor bus connector used only for\npower and board stability.
NoConn ~ 13800 7600
NoConn ~ 13800 7700
NoConn ~ 13800 7800
NoConn ~ 13800 7900
NoConn ~ 13800 8000
NoConn ~ 13800 8100
NoConn ~ 13800 8200
NoConn ~ 13800 6300
NoConn ~ 13800 6400
NoConn ~ 13800 6500
NoConn ~ 13800 6600
NoConn ~ 13800 6700
NoConn ~ 13800 6800
NoConn ~ 13800 6900
NoConn ~ 13800 7000
NoConn ~ 14000 6500
NoConn ~ 14000 6600
Text Notes 5650 4450 0    50   ~ 0
Base Addr\n00:0000
Text Notes 5650 6150 0    50   ~ 0
Base Addr\n40:0000
Text Notes 5650 7700 0    50   ~ 0
Base Addr\n80:0000
Wire Notes Line width 12 style solid
	10750 1900 10750 1550
Wire Notes Line width 12 style solid
	9850 1725 10750 1725
Text Notes 9800 1550 2    50   ~ 0
00:0000
Text Notes 9900 1675 0    50   ~ 0
~CS0~: 512 kW RAM
Text Notes 9900 1850 0    50   ~ 0
~CS1~: 512 kW RAM
Wire Notes Line width 12 style solid
	9850 1900 10750 1900
Text Notes 9900 2025 0    50   ~ 0
Up to 8 MW of RAM
Wire Notes Line width 12 style solid
	9850 1550 9850 1900
Wire Notes Line width 12
	9850 1900 9850 2250
Text Notes 9800 1725 2    50   ~ 0
08:0000
Text Notes 9800 1900 2    50   ~ 0
10:0000
Wire Notes Line width 12 style solid
	10750 2250 9850 2250
Wire Notes Line width 12
	10750 1900 10750 2250
Text Notes 9800 2250 2    50   ~ 0
80:0000
Wire Notes Line width 12 style solid
	9850 2425 10750 2425
Text Notes 9900 2375 0    50   ~ 0
~CS16~: 512 kW ROM
Text Notes 9900 2650 0    50   ~ 0
~CS17~–~CS19~: decoded,\nunused
Text Notes 9800 2425 2    50   ~ 0
88:0000
Text Notes 9650 1950 3    50   ~ 0
. . .
Wire Notes Line width 12 style solid
	10700 1725 10700 1550
Wire Notes Line width 12 style solid
	10700 2425 10700 2250
Text Notes 10800 1675 0    50   ~ 0
Required
Text Notes 10800 2375 0    50   ~ 0
Required
Text Notes 9800 3300 2    50   ~ 0
B0:0000
Text Notes 9800 3125 2    50   ~ 0
A8:0000
Wire Notes Line width 12 style solid
	9850 2250 9850 3650
Wire Notes Line width 12 style solid
	10750 2250 10750 3650
Text Notes 9900 3525 0    50   ~ 0
~CS22~–~CS23~: decoded,\nunused
Wire Notes Line width 12 style solid
	9850 3650 10750 3650
Text Notes 9900 3250 0    50   ~ 0
~CS21~: 512 kW RAM
Text Notes 9900 3075 0    50   ~ 0
~CS20~: 512 kW RAM
Wire Notes Line width 12 style solid
	9850 3125 10750 3125
Text Notes 9800 2950 2    50   ~ 0
A0:0000
Wire Notes Line width 12 style solid
	10750 2950 9850 2950
Wire Notes Line width 12 style solid
	9850 3300 10750 3300
Text Notes 9900 3875 0    50   ~ 0
4 MW undecoded &\nunused
Wire Notes Line width 12
	9850 3650 9850 4000
Wire Notes Line width 12
	10750 3650 10750 4000
Text Notes 9650 3700 3    50   ~ 0
. . .
Text Notes 9800 3650 2    50   ~ 0
C0:0000
Wire Notes Line width 12 style solid
	9850 4025 10750 4025
Text Notes 10775 4025 0    50   ~ 0
FF:FFFF
Text Notes 9200 1200 0    197  ~ 39
Memory Map
$EndSCHEMATC
