EESchema Schematic File Version 4
LIBS:cft-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 35
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 7150 7000 0    197  ~ 39
Unit Decoders
$Comp
L alexios:74HC138 U1801
U 1 1 5E72FE8B
P 5050 1700
F 0 "U1801" H 5050 2367 50  0000 C CNN
F 1 "74HC138" H 5050 2276 50  0000 C CNN
F 2 "" H 5050 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5050 1700 50  0001 C CNN
	1    5050 1700
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U1804
U 1 1 5E7303D5
P 5100 3750
F 0 "U1804" H 5100 4417 50  0000 C CNN
F 1 "74HC138" H 5100 4326 50  0000 C CNN
F 2 "" H 5100 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5100 3750 50  0001 C CNN
	1    5100 3750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC138 U1804
U 2 1 5E733824
P 4850 7400
F 0 "U1804" H 5030 7446 50  0000 L CNN
F 1 "74HC138" H 5030 7355 50  0000 L CNN
F 2 "" H 4850 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4850 7400 50  0001 C CNN
	2    4850 7400
	1    0    0    -1  
$EndComp
$Comp
L alexios:74AHC1G04 U1501
U 2 1 5E735150
P 3450 7400
F 0 "U1501" H 3630 7446 50  0000 L CNN
F 1 "74AHC1G04" H 3630 7355 50  0000 L CNN
F 2 "" H 3450 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3450 7400 50  0001 C CNN
	2    3450 7400
	1    0    0    -1  
$EndComp
Text Label 4500 1300 2    50   ~ 0
RUNIT0
Text Label 4500 1400 2    50   ~ 0
RUNIT1
Text Label 4500 1500 2    50   ~ 0
RUNIT2
$Comp
L alexios:74HC541 U1802
U 1 1 5E73CC7E
P 6550 1800
F 0 "U1802" H 6550 2567 50  0000 C CNN
F 1 "74HC541" H 6550 2476 50  0000 C CNN
F 2 "" H 6550 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6550 1800 50  0001 C CNN
	1    6550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1300 6050 1300
Wire Wire Line
	5550 1400 6050 1400
Wire Wire Line
	5550 1500 6050 1500
Wire Wire Line
	5550 1600 6050 1600
Wire Wire Line
	5550 1700 6050 1700
Wire Wire Line
	5550 1800 6050 1800
Wire Wire Line
	5550 1900 6050 1900
Wire Wire Line
	5550 2000 6050 2000
$Comp
L alexios:74HC541 U1805
U 1 1 5E740D86
P 6550 3850
F 0 "U1805" H 6550 4617 50  0000 C CNN
F 1 "74HC541" H 6550 4526 50  0000 C CNN
F 2 "" H 6550 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6550 3850 50  0001 C CNN
	1    6550 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01802
U 1 1 5E743D49
P 6050 2300
F 0 "#PWR01802" H 6050 2050 50  0001 C CNN
F 1 "GND" H 6055 2127 50  0000 C CNN
F 2 "" H 6050 2300 50  0001 C CNN
F 3 "" H 6050 2300 50  0001 C CNN
	1    6050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01805
U 1 1 5E744194
P 6050 4350
F 0 "#PWR01805" H 6050 4100 50  0001 C CNN
F 1 "GND" H 6055 4177 50  0000 C CNN
F 2 "" H 6050 4350 50  0001 C CNN
F 3 "" H 6050 4350 50  0001 C CNN
	1    6050 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E754172
P 7250 1900
AR Path="/5E754172" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E754172" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5E754172" Ref="RN1804"  Part="1" 
F 0 "RN1804" V 7483 1900 50  0000 C CNN
F 1 "30Ω" V 7574 1900 50  0000 C CNN
F 2 "" V 7525 1900 50  0001 C CNN
F 3 "~" H 7250 1900 50  0001 C CNN
	1    7250 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E757D2C
P 7250 1500
AR Path="/5E757D2C" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E757D2C" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5E757D2C" Ref="RN1803"  Part="1" 
F 0 "RN1803" V 6833 1500 50  0000 C CNN
F 1 "30Ω" V 6924 1500 50  0000 C CNN
F 2 "" V 7525 1500 50  0001 C CNN
F 3 "~" H 7250 1500 50  0001 C CNN
	1    7250 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 3450 8250 3450
Wire Wire Line
	7450 3550 8350 3550
Wire Wire Line
	7450 3750 8550 3750
Wire Wire Line
	7450 3850 8650 3850
Wire Wire Line
	7450 3950 8750 3950
$Comp
L Device:R_Pack04 RN?
U 1 1 5E773CA0
P 8350 3150
AR Path="/5E773CA0" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E773CA0" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5E773CA0" Ref="RN1805"  Part="1" 
F 0 "RN1805" H 8071 3104 50  0000 R CNN
F 1 "10kΩ" H 8071 3195 50  0000 R CNN
F 2 "" V 8625 3150 50  0001 C CNN
F 3 "~" H 8350 3150 50  0001 C CNN
	1    8350 3150
	1    0    0    1   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E773CA6
P 8750 3150
AR Path="/5E773CA6" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E773CA6" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5E773CA6" Ref="RN1806"  Part="1" 
F 0 "RN1806" H 8938 3104 50  0000 L CNN
F 1 "10kΩ" H 8938 3195 50  0000 L CNN
F 2 "" V 9025 3150 50  0001 C CNN
F 3 "~" H 8750 3150 50  0001 C CNN
	1    8750 3150
	1    0    0    1   
$EndComp
Wire Wire Line
	8250 3350 8250 3450
Connection ~ 8250 3450
Wire Wire Line
	8250 3450 9550 3450
Wire Wire Line
	8350 3350 8350 3550
Connection ~ 8350 3550
Wire Wire Line
	8350 3550 9550 3550
Wire Wire Line
	7450 3650 8450 3650
Wire Wire Line
	8450 3350 8450 3650
Connection ~ 8450 3650
Wire Wire Line
	8450 3650 9550 3650
Wire Wire Line
	8550 3350 8550 3750
Connection ~ 8550 3750
Wire Wire Line
	8550 3750 9550 3750
Wire Wire Line
	8650 3350 8650 3850
Connection ~ 8650 3850
Wire Wire Line
	8650 3850 9550 3850
Wire Wire Line
	8750 3350 8750 3950
Connection ~ 8750 3950
Wire Wire Line
	8750 3950 9550 3950
Wire Wire Line
	8850 3350 8850 4050
Wire Wire Line
	7450 4050 8850 4050
Connection ~ 8850 4050
Wire Wire Line
	8850 4050 9550 4050
Wire Wire Line
	4550 1900 4150 1900
Text Label 4500 1900 2    50   ~ 0
CLK1
Text Label 4500 2000 2    50   ~ 0
RUNIT3
Text Label 4500 2100 2    50   ~ 0
~RUEN
Wire Wire Line
	4000 1300 4550 1300
Wire Wire Line
	4000 1500 4550 1500
Wire Wire Line
	4000 1400 4550 1400
Wire Wire Line
	4000 2000 4550 2000
Entry Wire Line
	3900 1200 4000 1300
Entry Wire Line
	3900 1300 4000 1400
Entry Wire Line
	3900 1400 4000 1500
Entry Wire Line
	3900 1900 4000 2000
Entry Bus Bus
	3800 1000 3900 1100
Text HLabel 2050 1000 0    50   Input ~ 0
RUNIT[0..3]
Text Label 2150 1000 0    50   ~ 0
RUNIT[0..3]
Text Label 3900 1800 1    50   ~ 0
RUNIT[0..3]
Wire Wire Line
	4150 1900 4150 700 
Text Label 2150 700  0    50   ~ 0
CLK1
Text HLabel 2050 700  0    50   Input ~ 0
CLK1
Wire Wire Line
	4600 3350 4050 3350
Wire Wire Line
	4600 3450 4050 3450
Wire Wire Line
	4600 3550 4050 3550
Text Label 4550 3350 2    50   ~ 0
WUNIT0
Text Label 4550 3450 2    50   ~ 0
WUNIT1
Text Label 4550 3550 2    50   ~ 0
WUNIT2
Text Label 4550 3950 2    50   ~ 0
~RESET
Text Label 4550 4050 2    50   ~ 0
CLK3
$Comp
L power:GND #PWR01804
U 1 1 5E7A7C05
P 4600 4150
F 0 "#PWR01804" H 4600 3900 50  0001 C CNN
F 1 "GND" H 4605 3977 50  0000 C CNN
F 2 "" H 4600 4150 50  0001 C CNN
F 3 "" H 4600 4150 50  0001 C CNN
	1    4600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2950 8150 2900
Wire Wire Line
	8150 2900 8250 2900
Wire Wire Line
	8850 2900 8850 2950
Wire Wire Line
	8250 2950 8250 2900
Connection ~ 8250 2900
Wire Wire Line
	8250 2900 8350 2900
Wire Wire Line
	8350 2950 8350 2900
Connection ~ 8350 2900
Wire Wire Line
	8350 2900 8450 2900
Wire Wire Line
	8450 2950 8450 2900
Connection ~ 8450 2900
Wire Wire Line
	8450 2900 8550 2900
Wire Wire Line
	8550 2950 8550 2900
Connection ~ 8550 2900
Wire Wire Line
	8550 2900 8650 2900
Wire Wire Line
	8650 2950 8650 2900
Connection ~ 8650 2900
Wire Wire Line
	8650 2900 8750 2900
Wire Wire Line
	8750 2950 8750 2900
Connection ~ 8750 2900
Wire Wire Line
	8750 2900 8850 2900
$Comp
L power:+5V #PWR01803
U 1 1 5E7CB42D
P 8850 2900
F 0 "#PWR01803" H 8850 2750 50  0001 C CNN
F 1 "+5V" H 8865 3073 50  0000 C CNN
F 2 "" H 8850 2900 50  0001 C CNN
F 3 "" H 8850 2900 50  0001 C CNN
	1    8850 2900
	1    0    0    -1  
$EndComp
Connection ~ 8850 2900
NoConn ~ 7450 1300
Text Label 9400 1400 2    50   ~ 0
~R1
Text Label 9400 1500 2    50   ~ 0
~RAGL
Text Label 9400 1600 2    50   ~ 0
~READ-PC
Text Label 9400 1700 2    50   ~ 0
~READ-DR
Text Label 9400 1800 2    50   ~ 0
~RAC
Text Label 9400 1900 2    50   ~ 0
~R6
Text Label 9400 2000 2    50   ~ 0
~R7
Text HLabel 9600 1400 2    50   Output ~ 0
~R1
Text HLabel 9600 1500 2    50   Output ~ 0
~RAGL
Text HLabel 9600 1600 2    50   Output ~ 0
~READ-PC
Text HLabel 9600 1700 2    50   Output ~ 0
~READ-DR
Text HLabel 9600 1800 2    50   Output ~ 0
~RAC
Text HLabel 9600 1900 2    50   Output ~ 0
~R6
Text HLabel 9600 2000 2    50   Output ~ 0
~R7
Text Label 2150 2700 0    50   ~ 0
~µCE
Text HLabel 2050 2700 0    50   Input ~ 0
~µCE
Wire Wire Line
	5800 2200 5800 2700
Wire Wire Line
	5800 2200 6050 2200
Wire Wire Line
	2050 2700 5800 2700
Text Label 6050 2200 2    50   ~ 0
~µCE
NoConn ~ 7450 3350
NoConn ~ 8150 3350
Text Label 9400 3450 2    50   ~ 0
~W1
Text Label 9400 3550 2    50   ~ 0
~WRITE-AR
Text Label 9400 3650 2    50   ~ 0
~WRITE-PC
Text Label 9400 3750 2    50   ~ 0
~WIR
Text Label 9400 3850 2    50   ~ 0
~WRITE-DR
Text Label 9400 3950 2    50   ~ 0
~WRITE-AC
Text Label 9400 4050 2    50   ~ 0
~WALU
Text Notes 7900 2250 0    50   ~ 0
Another 8 read options source\nvarious results from the ALU.\nThese are decoded in the ALU itself.
Entry Wire Line
	3950 3250 4050 3350
Entry Wire Line
	3950 3350 4050 3450
Entry Wire Line
	3950 3450 4050 3550
Entry Bus Bus
	3850 3050 3950 3150
Wire Bus Line
	3850 3050 2050 3050
Text HLabel 2050 3050 0    50   Input ~ 0
WUNIT[0..2]
Wire Wire Line
	4150 700  2050 700 
Wire Bus Line
	2050 1000 3800 1000
$Comp
L Device:R_Pack04 RN?
U 1 1 5E83A5BA
P 7250 3950
AR Path="/5E83A5BA" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E83A5BA" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5E83A5BA" Ref="RN1808"  Part="1" 
F 0 "RN1808" V 7483 3950 50  0000 C CNN
F 1 "30Ω" V 7574 3950 50  0000 C CNN
F 2 "" V 7525 3950 50  0001 C CNN
F 3 "~" H 7250 3950 50  0001 C CNN
	1    7250 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5E83A5C0
P 7250 3550
AR Path="/5E83A5C0" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5E83A5C0" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5E83A5C0" Ref="RN1807"  Part="1" 
F 0 "RN1807" V 6833 3550 50  0000 C CNN
F 1 "30Ω" V 6924 3550 50  0000 C CNN
F 2 "" V 7525 3550 50  0001 C CNN
F 3 "~" H 7250 3550 50  0001 C CNN
	1    7250 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3350 6050 3350
Wire Wire Line
	5600 3450 6050 3450
Wire Wire Line
	5600 3550 6050 3550
Wire Wire Line
	5600 3650 6050 3650
Wire Wire Line
	5600 3750 6050 3750
Wire Wire Line
	5600 3850 6050 3850
Wire Wire Line
	5600 3950 6050 3950
Wire Wire Line
	5600 4050 6050 4050
Wire Wire Line
	5800 2700 5800 4250
Wire Wire Line
	5800 4250 6050 4250
Connection ~ 5800 2700
Text Label 6050 4250 2    50   ~ 0
~µCE
Wire Wire Line
	2050 4050 4600 4050
Text HLabel 2050 3950 0    50   Input ~ 0
~RESET
Text HLabel 2050 4050 0    50   Input ~ 0
CLK3
$Comp
L alexios:74AHC1G04 U1803
U 1 1 5E733FF7
P 3600 2100
F 0 "U1803" H 3550 2367 50  0000 C CNN
F 1 "74AHC1G04" H 3550 2276 50  0000 C CNN
F 2 "" H 3600 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 3600 2100 50  0001 C CNN
	1    3600 2100
	1    0    0    -1  
$EndComp
Text HLabel 9550 3450 2    50   Input ~ 0
~W1
Text HLabel 9550 3550 2    50   Input ~ 0
~WRITE-AR
Text HLabel 9550 3650 2    50   Input ~ 0
~WRITE-PC
Text HLabel 9550 3750 2    50   Input ~ 0
~WIR
Text HLabel 9550 3850 2    50   Input ~ 0
~WRITE-DR
Text HLabel 9550 3950 2    50   Input ~ 0
~WRITE-AC
Text HLabel 9550 4050 2    50   Input ~ 0
~WALU
Wire Wire Line
	2050 3950 2850 3950
Wire Wire Line
	3300 2100 2850 2100
Wire Wire Line
	2850 2100 2850 3950
Connection ~ 2850 3950
Wire Wire Line
	2850 3950 4600 3950
Text Label 3000 2100 0    50   ~ 0
~RESET
Text Label 4500 2700 2    50   ~ 0
~µCE
$Comp
L alexios:74HC138 U1801
U 2 1 5E730918
P 4850 6750
F 0 "U1801" H 5030 6796 50  0000 L CNN
F 1 "74HC138" H 5030 6705 50  0000 L CNN
F 2 "" H 4850 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4850 6750 50  0001 C CNN
	2    4850 6750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U1402
U 2 1 5E9224D0
P 6250 6750
F 0 "U1402" H 6430 6796 50  0000 L CNN
F 1 "74HC541" H 6430 6705 50  0000 L CNN
F 2 "" H 6250 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6250 6750 50  0001 C CNN
	2    6250 6750
	1    0    0    -1  
$EndComp
$Comp
L alexios:74HC541 U1405
U 2 1 5E922B29
P 6200 7400
F 0 "U1405" H 6380 7446 50  0000 L CNN
F 1 "74HC541" H 6380 7355 50  0000 L CNN
F 2 "" H 6200 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC541" H 6200 7400 50  0001 C CNN
	2    6200 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E9262D3
P 5900 6750
AR Path="/5CC0D65F/5E9262D3" Ref="C?"  Part="1" 
AR Path="/5E9262D3" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E9262D3" Ref="C?"  Part="1" 
AR Path="/5E726BB8/5E9262D3" Ref="C1802"  Part="1" 
F 0 "C1802" H 5809 6796 50  0000 R CNN
F 1 "100nF" H 5809 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5900 6750 50  0001 C CNN
F 3 "~" H 5900 6750 50  0001 C CNN
	1    5900 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E92A03D
P 5850 7400
AR Path="/5CC0D65F/5E92A03D" Ref="C?"  Part="1" 
AR Path="/5E92A03D" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E92A03D" Ref="C?"  Part="1" 
AR Path="/5E726BB8/5E92A03D" Ref="C1805"  Part="1" 
F 0 "C1805" H 5759 7446 50  0000 R CNN
F 1 "100nF" H 5759 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5850 7400 50  0001 C CNN
F 3 "~" H 5850 7400 50  0001 C CNN
	1    5850 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E92DEC5
P 4500 7400
AR Path="/5CC0D65F/5E92DEC5" Ref="C?"  Part="1" 
AR Path="/5E92DEC5" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E92DEC5" Ref="C?"  Part="1" 
AR Path="/5E726BB8/5E92DEC5" Ref="C1804"  Part="1" 
F 0 "C1804" H 4409 7446 50  0000 R CNN
F 1 "100nF" H 4409 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4500 7400 50  0001 C CNN
F 3 "~" H 4500 7400 50  0001 C CNN
	1    4500 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E931C4E
P 4500 6750
AR Path="/5CC0D65F/5E931C4E" Ref="C?"  Part="1" 
AR Path="/5E931C4E" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E931C4E" Ref="C?"  Part="1" 
AR Path="/5E726BB8/5E931C4E" Ref="C1801"  Part="1" 
F 0 "C1801" H 4409 6796 50  0000 R CNN
F 1 "100nF" H 4409 6705 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4500 6750 50  0001 C CNN
F 3 "~" H 4500 6750 50  0001 C CNN
	1    4500 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E935B77
P 3100 7400
AR Path="/5CC0D65F/5E935B77" Ref="C?"  Part="1" 
AR Path="/5E935B77" Ref="C?"  Part="1" 
AR Path="/5DEAC282/5E935B77" Ref="C?"  Part="1" 
AR Path="/5E726BB8/5E935B77" Ref="C1803"  Part="1" 
F 0 "C1803" H 3009 7446 50  0000 R CNN
F 1 "100nF" H 3009 7355 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3100 7400 50  0001 C CNN
F 3 "~" H 3100 7400 50  0001 C CNN
	1    3100 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01813
U 1 1 5E9523BA
P 3100 7500
F 0 "#PWR01813" H 3100 7250 50  0001 C CNN
F 1 "GND" H 3105 7327 50  0000 C CNN
F 2 "" H 3100 7500 50  0001 C CNN
F 3 "" H 3100 7500 50  0001 C CNN
	1    3100 7500
	1    0    0    -1  
$EndComp
Connection ~ 3100 7500
$Comp
L power:GND #PWR01814
U 1 1 5E9527CA
P 4500 7500
F 0 "#PWR01814" H 4500 7250 50  0001 C CNN
F 1 "GND" H 4505 7327 50  0000 C CNN
F 2 "" H 4500 7500 50  0001 C CNN
F 3 "" H 4500 7500 50  0001 C CNN
	1    4500 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01815
U 1 1 5E953210
P 5850 7500
F 0 "#PWR01815" H 5850 7250 50  0001 C CNN
F 1 "GND" H 5855 7327 50  0000 C CNN
F 2 "" H 5850 7500 50  0001 C CNN
F 3 "" H 5850 7500 50  0001 C CNN
	1    5850 7500
	1    0    0    -1  
$EndComp
Connection ~ 5850 7500
Connection ~ 4500 7500
$Comp
L power:GND #PWR01808
U 1 1 5E953D8B
P 4500 6850
F 0 "#PWR01808" H 4500 6600 50  0001 C CNN
F 1 "GND" H 4505 6677 50  0000 C CNN
F 2 "" H 4500 6850 50  0001 C CNN
F 3 "" H 4500 6850 50  0001 C CNN
	1    4500 6850
	1    0    0    -1  
$EndComp
Connection ~ 4500 6850
$Comp
L power:GND #PWR01809
U 1 1 5E953F3E
P 5900 6850
F 0 "#PWR01809" H 5900 6600 50  0001 C CNN
F 1 "GND" H 5905 6677 50  0000 C CNN
F 2 "" H 5900 6850 50  0001 C CNN
F 3 "" H 5900 6850 50  0001 C CNN
	1    5900 6850
	1    0    0    -1  
$EndComp
Connection ~ 5900 6850
$Comp
L power:+5V #PWR01807
U 1 1 5E95478C
P 5900 6650
F 0 "#PWR01807" H 5900 6500 50  0001 C CNN
F 1 "+5V" H 5915 6823 50  0000 C CNN
F 2 "" H 5900 6650 50  0001 C CNN
F 3 "" H 5900 6650 50  0001 C CNN
	1    5900 6650
	1    0    0    -1  
$EndComp
Connection ~ 5900 6650
$Comp
L power:+5V #PWR01806
U 1 1 5E954ADB
P 4500 6650
F 0 "#PWR01806" H 4500 6500 50  0001 C CNN
F 1 "+5V" H 4515 6823 50  0000 C CNN
F 2 "" H 4500 6650 50  0001 C CNN
F 3 "" H 4500 6650 50  0001 C CNN
	1    4500 6650
	1    0    0    -1  
$EndComp
Connection ~ 4500 6650
$Comp
L power:+5V #PWR01810
U 1 1 5E954BB8
P 3100 7300
F 0 "#PWR01810" H 3100 7150 50  0001 C CNN
F 1 "+5V" H 3115 7473 50  0000 C CNN
F 2 "" H 3100 7300 50  0001 C CNN
F 3 "" H 3100 7300 50  0001 C CNN
	1    3100 7300
	1    0    0    -1  
$EndComp
Connection ~ 3100 7300
$Comp
L power:+5V #PWR01811
U 1 1 5E954D27
P 4500 7300
F 0 "#PWR01811" H 4500 7150 50  0001 C CNN
F 1 "+5V" H 4515 7473 50  0000 C CNN
F 2 "" H 4500 7300 50  0001 C CNN
F 3 "" H 4500 7300 50  0001 C CNN
	1    4500 7300
	1    0    0    -1  
$EndComp
Connection ~ 4500 7300
$Comp
L power:+5V #PWR01812
U 1 1 5E954F0E
P 5850 7300
F 0 "#PWR01812" H 5850 7150 50  0001 C CNN
F 1 "+5V" H 5865 7473 50  0000 C CNN
F 2 "" H 5850 7300 50  0001 C CNN
F 3 "" H 5850 7300 50  0001 C CNN
	1    5850 7300
	1    0    0    -1  
$EndComp
Connection ~ 5850 7300
$Comp
L alexios:74HC139 U903
U 3 1 610CB917
P 1400 7300
F 0 "U903" H 1580 7346 50  0000 L CNN
F 1 "74HC139" H 1580 7255 50  0000 L CNN
F 2 "" H 1400 7300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 1400 7300 50  0001 C CNN
	3    1400 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 610CB91D
P 1050 7300
AR Path="/5CC0D65F/610CB91D" Ref="C?"  Part="1" 
AR Path="/610CB91D" Ref="C?"  Part="1" 
AR Path="/5E726BB8/610CB91D" Ref="C909"  Part="1" 
F 0 "C909" H 959 7346 50  0000 R CNN
F 1 "100nF" H 959 7255 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1050 7300 50  0001 C CNN
F 3 "~" H 1050 7300 50  0001 C CNN
	1    1050 7300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0923
U 1 1 610CB923
P 1050 7200
F 0 "#PWR0923" H 1050 7050 50  0001 C CNN
F 1 "+5V" H 1065 7373 50  0000 C CNN
F 2 "" H 1050 7200 50  0001 C CNN
F 3 "" H 1050 7200 50  0001 C CNN
	1    1050 7200
	1    0    0    -1  
$EndComp
Connection ~ 1050 7200
$Comp
L power:GND #PWR0924
U 1 1 610CB92A
P 1050 7400
F 0 "#PWR0924" H 1050 7150 50  0001 C CNN
F 1 "GND" H 1055 7227 50  0000 C CNN
F 2 "" H 1050 7400 50  0001 C CNN
F 3 "" H 1050 7400 50  0001 C CNN
	1    1050 7400
	1    0    0    -1  
$EndComp
Connection ~ 1050 7400
Wire Wire Line
	4500 4950 2050 4950
Connection ~ 4500 4950
Wire Wire Line
	4500 4950 4500 5700
Wire Wire Line
	5600 5050 5700 5050
Text Label 9400 5300 2    50   ~ 0
~INCDR
Text Label 9400 5200 2    50   ~ 0
~DECDR
Text Label 4150 5600 0    50   ~ 0
~STPAC
Text Label 4150 4950 0    50   ~ 0
~DEC
Text Label 4150 4850 0    50   ~ 0
~STPDR
$Comp
L power:GND #PWR0925
U 1 1 610CB944
P 4600 5150
F 0 "#PWR0925" H 4600 4900 50  0001 C CNN
F 1 "GND" H 4605 4977 50  0000 C CNN
F 2 "" H 4600 5150 50  0001 C CNN
F 3 "" H 4600 5150 50  0001 C CNN
	1    4600 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4950 4500 4950
Wire Wire Line
	4600 4850 2050 4850
NoConn ~ 5600 5150
NoConn ~ 5600 4950
$Comp
L alexios:74HC139 U903
U 1 1 610CB94E
P 5100 4950
F 0 "U903" H 5100 5317 50  0000 C CNN
F 1 "74HC139" H 5100 5226 50  0000 C CNN
F 2 "" H 5100 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5100 4950 50  0001 C CNN
	1    5100 4950
	1    0    0    -1  
$EndComp
Text Label 9400 5500 2    50   ~ 0
~ACTION-INCAC
Text Label 9400 5400 2    50   ~ 0
~ACTION-DECAC
Wire Wire Line
	4600 5700 4500 5700
Wire Wire Line
	4600 5600 2050 5600
$Comp
L power:GND #PWR0926
U 1 1 610CB958
P 4600 5900
F 0 "#PWR0926" H 4600 5650 50  0001 C CNN
F 1 "GND" H 4605 5727 50  0000 C CNN
F 2 "" H 4600 5900 50  0001 C CNN
F 3 "" H 4600 5900 50  0001 C CNN
	1    4600 5900
	1    0    0    -1  
$EndComp
NoConn ~ 5600 5900
NoConn ~ 5600 5700
$Comp
L alexios:74HC139 U903
U 2 1 610CB960
P 5100 5700
F 0 "U903" H 5100 6067 50  0000 C CNN
F 1 "74HC139" H 5100 5976 50  0000 C CNN
F 2 "" H 5100 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5100 5700 50  0001 C CNN
	2    5100 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5600 5700 5600
Text HLabel 2050 4850 0    50   Input ~ 0
~STPDR
Text HLabel 2050 4950 0    50   Input ~ 0
~DEC
Text HLabel 2050 5600 0    50   Input ~ 0
~STPAC
Text Label 4500 2550 2    50   ~ 0
RESET
Text HLabel 9600 2550 2    50   Output ~ 0
RESET
Text Notes 6300 2800 0    50   ~ 0
RESET is an active high version of ~RESET~\nused by the register modules.
Text Label 6300 2550 0    50   ~ 0
RESET
Text Label 2200 4850 0    50   ~ 0
~STPDR
Text Label 2200 4950 0    50   ~ 0
~DEC
Text Label 2150 3950 0    50   ~ 0
~RESET
Text Label 2150 4050 0    50   ~ 0
CLK3
Text Label 2200 5600 0    50   ~ 0
~STPAC
$Comp
L Device:R_Pack04 RN?
U 1 1 61162634
P 6050 5400
AR Path="/61162634" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/61162634" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/61162634" Ref="RN901"  Part="1" 
F 0 "RN901" V 6283 5400 50  0000 C CNN
F 1 "30Ω" V 6374 5400 50  0000 C CNN
F 2 "" V 6325 5400 50  0001 C CNN
F 3 "~" H 6050 5400 50  0001 C CNN
	1    6050 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 5050 5700 5300
Wire Wire Line
	5700 5300 5850 5300
Wire Wire Line
	5800 4850 5800 5200
Wire Wire Line
	5800 5200 5850 5200
Wire Wire Line
	5600 4850 5800 4850
Wire Wire Line
	5850 5400 5700 5400
Wire Wire Line
	5700 5400 5700 5600
Wire Wire Line
	5800 5800 5800 5500
Wire Wire Line
	5800 5500 5850 5500
Wire Wire Line
	5600 5800 5800 5800
Wire Wire Line
	6250 5200 9550 5200
Wire Wire Line
	6250 5300 9550 5300
Wire Wire Line
	6250 5400 9550 5400
Wire Wire Line
	6250 5500 9550 5500
Text Notes 4250 850  0    98   ~ 20
Read Unit Decoder
Text Notes 4200 2950 0    98   ~ 20
Write Unit Decoder
Wire Wire Line
	3900 2550 9600 2550
Wire Wire Line
	3900 2100 4550 2100
Connection ~ 3900 2100
Wire Wire Line
	3800 2100 3900 2100
Wire Wire Line
	3900 2100 3900 2550
Text Notes 6000 4950 0    98   ~ 20
Register Increment/Decrement Decoder
Text HLabel 9550 5200 2    50   Output ~ 0
~DECDR
Text HLabel 9550 5300 2    50   Output ~ 0
~INCDR
Text HLabel 9550 5400 2    50   Output ~ 0
~ACTION-DECAC
Text HLabel 9550 5500 2    50   Output ~ 0
~ACTION-INCAC
Wire Wire Line
	7450 1400 8250 1400
Wire Wire Line
	7450 1500 8350 1500
Wire Wire Line
	7450 1700 8550 1700
Wire Wire Line
	7450 1800 8650 1800
Wire Wire Line
	7450 1900 8750 1900
Wire Wire Line
	7450 1600 8450 1600
Wire Wire Line
	7450 2000 8850 2000
$Comp
L Device:R_Pack04 RN?
U 1 1 5DB326BC
P 8350 1100
AR Path="/5DB326BC" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DB326BC" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5DB326BC" Ref="RN?"  Part="1" 
F 0 "RN?" H 8071 1054 50  0000 R CNN
F 1 "10kΩ" H 8071 1145 50  0000 R CNN
F 2 "" V 8625 1100 50  0001 C CNN
F 3 "~" H 8350 1100 50  0001 C CNN
	1    8350 1100
	1    0    0    1   
$EndComp
$Comp
L Device:R_Pack04 RN?
U 1 1 5DB326C2
P 8750 1100
AR Path="/5DB326C2" Ref="RN?"  Part="1" 
AR Path="/5DEAC282/5DB326C2" Ref="RN?"  Part="1" 
AR Path="/5E726BB8/5DB326C2" Ref="RN?"  Part="1" 
F 0 "RN?" H 8938 1054 50  0000 L CNN
F 1 "10kΩ" H 8938 1145 50  0000 L CNN
F 2 "" V 9025 1100 50  0001 C CNN
F 3 "~" H 8750 1100 50  0001 C CNN
	1    8750 1100
	1    0    0    1   
$EndComp
Wire Wire Line
	8350 1300 8350 1500
Wire Wire Line
	8450 1300 8450 1600
Wire Wire Line
	8550 1300 8550 1700
Wire Wire Line
	8650 1300 8650 1800
Wire Wire Line
	8750 1300 8750 1900
Wire Wire Line
	8850 1300 8850 2000
Wire Wire Line
	8150 900  8150 850 
Wire Wire Line
	8150 850  8250 850 
Wire Wire Line
	8850 850  8850 900 
Wire Wire Line
	8250 900  8250 850 
Connection ~ 8250 850 
Wire Wire Line
	8250 850  8350 850 
Wire Wire Line
	8350 900  8350 850 
Connection ~ 8350 850 
Wire Wire Line
	8350 850  8450 850 
Wire Wire Line
	8450 900  8450 850 
Connection ~ 8450 850 
Wire Wire Line
	8450 850  8550 850 
Wire Wire Line
	8550 900  8550 850 
Connection ~ 8550 850 
Wire Wire Line
	8550 850  8650 850 
Wire Wire Line
	8650 900  8650 850 
Connection ~ 8650 850 
Wire Wire Line
	8650 850  8750 850 
Wire Wire Line
	8750 900  8750 850 
Connection ~ 8750 850 
Wire Wire Line
	8750 850  8850 850 
$Comp
L power:+5V #PWR?
U 1 1 5DB326E4
P 8850 850
F 0 "#PWR?" H 8850 700 50  0001 C CNN
F 1 "+5V" H 8865 1023 50  0000 C CNN
F 2 "" H 8850 850 50  0001 C CNN
F 3 "" H 8850 850 50  0001 C CNN
	1    8850 850 
	1    0    0    -1  
$EndComp
Connection ~ 8850 850 
NoConn ~ 8150 1300
Wire Wire Line
	8250 1400 8250 1300
Connection ~ 8250 1400
Wire Wire Line
	8250 1400 9600 1400
Connection ~ 8350 1500
Wire Wire Line
	8350 1500 9600 1500
Connection ~ 8450 1600
Wire Wire Line
	8450 1600 9600 1600
Connection ~ 8550 1700
Wire Wire Line
	8550 1700 9600 1700
Connection ~ 8650 1800
Wire Wire Line
	8650 1800 9600 1800
Connection ~ 8750 1900
Wire Wire Line
	8750 1900 9600 1900
Connection ~ 8850 2000
Wire Wire Line
	8850 2000 9600 2000
Wire Bus Line
	3950 3150 3950 3450
Wire Bus Line
	3900 1100 3900 1900
$EndSCHEMATC
