EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Debugging Front Panel"
Date "2019-11-17"
Rev "2133"
Comp ""
Comment1 "DFP"
Comment2 "Last revision manufactured: 1939."
Comment3 "R1945 reallocates A72/A73 due to short."
Comment4 ""
$EndDescr
$Comp
L Device:CP_Small C17
U 1 1 609CAF2E
P 1150 7200
AR Path="/609CAF2E" Ref="C17"  Part="1" 
AR Path="/5D34E810/609CAF2E" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF2E" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF2E" Ref="C?"  Part="1" 
F 0 "C17" H 1062 7246 50  0000 R CNN
F 1 "47µF" H 1062 7155 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 1150 7200 50  0001 C CNN
F 3 "~" H 1150 7200 50  0001 C CNN
	1    1150 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF34
P 1150 7400
AR Path="/5F67D4B5/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/609CAF34" Ref="#PWR033"  Part="1" 
AR Path="/5D34E810/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF34" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF34" Ref="#PWR?"  Part="1" 
F 0 "#PWR033" H 1150 7150 50  0001 C CNN
F 1 "GND" H 1072 7363 50  0000 R CNN
F 2 "" H 1150 7400 50  0001 C CNN
F 3 "" H 1150 7400 50  0001 C CNN
	1    1150 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF3A
P 1150 7000
AR Path="/5F67D4B5/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/609CAF3A" Ref="#PWR032"  Part="1" 
AR Path="/5D34E810/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF3A" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF3A" Ref="#PWR?"  Part="1" 
F 0 "#PWR032" H 1150 6850 50  0001 C CNN
F 1 "+5V" H 1092 7037 50  0000 R CNN
F 2 "" H 1150 7000 50  0001 C CNN
F 3 "" H 1150 7000 50  0001 C CNN
	1    1150 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 7000 1150 7100
Wire Wire Line
	1150 7300 1150 7400
$Comp
L Device:CP_Small C18
U 1 1 609CAF42
P 1550 7200
AR Path="/609CAF42" Ref="C18"  Part="1" 
AR Path="/5D34E810/609CAF42" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF42" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF42" Ref="C?"  Part="1" 
F 0 "C18" H 1462 7246 50  0000 R CNN
F 1 "47µF" H 1462 7155 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 1550 7200 50  0001 C CNN
F 3 "~" H 1550 7200 50  0001 C CNN
	1    1550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF48
P 1550 7400
AR Path="/5F67D4B5/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/609CAF48" Ref="#PWR035"  Part="1" 
AR Path="/5D34E810/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF48" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF48" Ref="#PWR?"  Part="1" 
F 0 "#PWR035" H 1550 7150 50  0001 C CNN
F 1 "GND" H 1472 7363 50  0000 R CNN
F 2 "" H 1550 7400 50  0001 C CNN
F 3 "" H 1550 7400 50  0001 C CNN
	1    1550 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF4E
P 1550 7000
AR Path="/5F67D4B5/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/609CAF4E" Ref="#PWR034"  Part="1" 
AR Path="/5D34E810/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF4E" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF4E" Ref="#PWR?"  Part="1" 
F 0 "#PWR034" H 1550 6850 50  0001 C CNN
F 1 "+5V" H 1492 7037 50  0000 R CNN
F 2 "" H 1550 7000 50  0001 C CNN
F 3 "" H 1550 7000 50  0001 C CNN
	1    1550 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 7000 1550 7100
Wire Wire Line
	1550 7300 1550 7400
$Comp
L Device:CP_Small C19
U 1 1 609CAF56
P 2000 7200
AR Path="/609CAF56" Ref="C19"  Part="1" 
AR Path="/5D34E810/609CAF56" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF56" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF56" Ref="C?"  Part="1" 
F 0 "C19" H 1912 7246 50  0000 R CNN
F 1 "47µF" H 1912 7155 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 2000 7200 50  0001 C CNN
F 3 "~" H 2000 7200 50  0001 C CNN
	1    2000 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF5C
P 2000 7400
AR Path="/5F67D4B5/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/609CAF5C" Ref="#PWR037"  Part="1" 
AR Path="/5D34E810/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF5C" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF5C" Ref="#PWR?"  Part="1" 
F 0 "#PWR037" H 2000 7150 50  0001 C CNN
F 1 "GND" H 1922 7363 50  0000 R CNN
F 2 "" H 2000 7400 50  0001 C CNN
F 3 "" H 2000 7400 50  0001 C CNN
	1    2000 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF62
P 2000 7000
AR Path="/5F67D4B5/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/609CAF62" Ref="#PWR036"  Part="1" 
AR Path="/5D34E810/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF62" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF62" Ref="#PWR?"  Part="1" 
F 0 "#PWR036" H 2000 6850 50  0001 C CNN
F 1 "+5V" H 1942 7037 50  0000 R CNN
F 2 "" H 2000 7000 50  0001 C CNN
F 3 "" H 2000 7000 50  0001 C CNN
	1    2000 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 7000 2000 7100
Wire Wire Line
	2000 7300 2000 7400
$Comp
L Device:CP_Small C20
U 1 1 609CAF6A
P 2400 7200
AR Path="/609CAF6A" Ref="C20"  Part="1" 
AR Path="/5D34E810/609CAF6A" Ref="C?"  Part="1" 
AR Path="/5F1DB2E8/609CAF6A" Ref="C?"  Part="1" 
AR Path="/60757845/609CAF6A" Ref="C?"  Part="1" 
F 0 "C20" H 2312 7246 50  0000 R CNN
F 1 "47µF" H 2312 7155 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 2400 7200 50  0001 C CNN
F 3 "~" H 2400 7200 50  0001 C CNN
	1    2400 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 609CAF70
P 2400 7400
AR Path="/5F67D4B5/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/609CAF70" Ref="#PWR039"  Part="1" 
AR Path="/5D34E810/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF70" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF70" Ref="#PWR?"  Part="1" 
F 0 "#PWR039" H 2400 7150 50  0001 C CNN
F 1 "GND" H 2322 7363 50  0000 R CNN
F 2 "" H 2400 7400 50  0001 C CNN
F 3 "" H 2400 7400 50  0001 C CNN
	1    2400 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 609CAF76
P 2400 7000
AR Path="/5F67D4B5/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/609CAF76" Ref="#PWR038"  Part="1" 
AR Path="/5D34E810/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/609CAF76" Ref="#PWR?"  Part="1" 
AR Path="/60757845/609CAF76" Ref="#PWR?"  Part="1" 
F 0 "#PWR038" H 2400 6850 50  0001 C CNN
F 1 "+5V" H 2342 7037 50  0000 R CNN
F 2 "" H 2400 7000 50  0001 C CNN
F 3 "" H 2400 7000 50  0001 C CNN
	1    2400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7000 2400 7100
Wire Wire Line
	2400 7300 2400 7400
$Comp
L alexios:DIN-41612-3x32-Bauform-C J1
U 1 1 619FBE7A
P 1900 2800
F 0 "J1" H 1818 4567 50  0000 C CNN
F 1 "DIN-41612-C" H 1818 4476 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 1875 -600 50  0001 C CNN
F 3 " ~" H 1875 -600 50  0001 C CNN
	1    1900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1300 1350 1300
Wire Wire Line
	1600 1400 1350 1400
Wire Wire Line
	1600 1500 1350 1500
Wire Wire Line
	1600 1600 1350 1600
Wire Wire Line
	1600 1700 1350 1700
Wire Wire Line
	1600 1800 1350 1800
Wire Wire Line
	1600 1900 1350 1900
Wire Wire Line
	1600 2000 1350 2000
Wire Wire Line
	1600 2100 1350 2100
Wire Wire Line
	1600 2200 1350 2200
Wire Wire Line
	1600 2300 1350 2300
Wire Wire Line
	1600 2400 1350 2400
Wire Wire Line
	1600 2500 1350 2500
Wire Wire Line
	1600 2600 1350 2600
Wire Wire Line
	1600 2700 1350 2700
Wire Wire Line
	1600 2800 1350 2800
Wire Wire Line
	1600 2900 1350 2900
Wire Wire Line
	1600 3000 1350 3000
Wire Wire Line
	1600 3100 1350 3100
Wire Wire Line
	1600 3200 1350 3200
Wire Wire Line
	1600 3300 1350 3300
Wire Wire Line
	1600 3400 1350 3400
Wire Wire Line
	1600 3500 1350 3500
Wire Wire Line
	1600 3600 1350 3600
Wire Wire Line
	1600 3700 1350 3700
Wire Wire Line
	1600 3800 1350 3800
Wire Wire Line
	1600 3900 1350 3900
Wire Wire Line
	1600 4000 1350 4000
Wire Wire Line
	1600 4100 1350 4100
Wire Wire Line
	1600 4200 1350 4200
Wire Wire Line
	1600 4300 1350 4300
Wire Wire Line
	1600 4400 1350 4400
Text Label 1350 1300 0    50   ~ 0
A1
Text Label 1350 1400 0    50   ~ 0
A2
Text Label 1350 1500 0    50   ~ 0
A3
Text Label 1350 1600 0    50   ~ 0
A4
Text Label 1350 1700 0    50   ~ 0
A5
Text Label 1350 1800 0    50   ~ 0
A6
Text Label 1350 1900 0    50   ~ 0
A7
Text Label 1350 2000 0    50   ~ 0
A8
Text Label 1350 2100 0    50   ~ 0
A9
Text Label 1350 2200 0    50   ~ 0
A10
Text Label 1350 2300 0    50   ~ 0
A11
Text Label 1350 2400 0    50   ~ 0
A12
Text Label 1350 2500 0    50   ~ 0
A13
Text Label 1350 2600 0    50   ~ 0
A14
Text Label 1350 2700 0    50   ~ 0
A15
Text Label 1350 2800 0    50   ~ 0
A16
Text Label 1350 2900 0    50   ~ 0
A17
Text Label 1350 3000 0    50   ~ 0
A18
Text Label 1350 3100 0    50   ~ 0
A19
Text Label 1350 3200 0    50   ~ 0
A20
Text Label 1350 3300 0    50   ~ 0
A21
Text Label 1350 3400 0    50   ~ 0
A22
Text Label 1350 3500 0    50   ~ 0
A23
Text Label 1350 3600 0    50   ~ 0
A24
Text Label 1350 3700 0    50   ~ 0
A25
Text Label 1350 3800 0    50   ~ 0
A26
Text Label 1350 3900 0    50   ~ 0
A27
Text Label 1350 4000 0    50   ~ 0
A28
Text Label 1350 4100 0    50   ~ 0
A29
Text Label 1350 4200 0    50   ~ 0
A30
Text Label 1350 4300 0    50   ~ 0
A31
Text Label 1350 4400 0    50   ~ 0
A32
Wire Wire Line
	2600 1300 2350 1300
Wire Wire Line
	2600 1400 2350 1400
Wire Wire Line
	2600 1500 2350 1500
Wire Wire Line
	2600 1600 2350 1600
Wire Wire Line
	2600 1700 2350 1700
Wire Wire Line
	2600 1800 2350 1800
Wire Wire Line
	2600 1900 2350 1900
Wire Wire Line
	2600 2000 2350 2000
Wire Wire Line
	2600 2100 2350 2100
Wire Wire Line
	2600 2200 2350 2200
Wire Wire Line
	2600 2300 2350 2300
Wire Wire Line
	2600 2400 2350 2400
Wire Wire Line
	2600 2500 2350 2500
Wire Wire Line
	2600 2600 2350 2600
Wire Wire Line
	2600 2700 2350 2700
Wire Wire Line
	2600 2800 2350 2800
Wire Wire Line
	2600 2900 2350 2900
Wire Wire Line
	2600 3000 2350 3000
Wire Wire Line
	2600 3100 2350 3100
Wire Wire Line
	2600 3200 2350 3200
Wire Wire Line
	2600 3300 2350 3300
Wire Wire Line
	2600 3400 2350 3400
Wire Wire Line
	2600 3500 2350 3500
Wire Wire Line
	2600 3600 2350 3600
Wire Wire Line
	2600 3700 2350 3700
Wire Wire Line
	2600 3800 2350 3800
Wire Wire Line
	2600 3900 2350 3900
Wire Wire Line
	2600 4000 2350 4000
Wire Wire Line
	2600 4100 2350 4100
Wire Wire Line
	2600 4200 2350 4200
Wire Wire Line
	2600 4300 2350 4300
Wire Wire Line
	2600 4400 2350 4400
Wire Wire Line
	3600 1300 3350 1300
Wire Wire Line
	3600 1400 3350 1400
Wire Wire Line
	3600 1500 3350 1500
Wire Wire Line
	3600 1600 3350 1600
Wire Wire Line
	3600 1700 3350 1700
Wire Wire Line
	3600 1800 3350 1800
Wire Wire Line
	3600 1900 3350 1900
Wire Wire Line
	3600 2000 3350 2000
Wire Wire Line
	3600 2100 3350 2100
Wire Wire Line
	3600 2200 3350 2200
Wire Wire Line
	3600 2300 3350 2300
Wire Wire Line
	3600 2400 3350 2400
Wire Wire Line
	3600 2500 3350 2500
Wire Wire Line
	3600 2600 3350 2600
Wire Wire Line
	3600 2700 3350 2700
Wire Wire Line
	3600 2800 3350 2800
Wire Wire Line
	3600 2900 3350 2900
Wire Wire Line
	3600 3000 3350 3000
Wire Wire Line
	3600 3100 3350 3100
Wire Wire Line
	3600 3200 3350 3200
Wire Wire Line
	3600 3300 3350 3300
Wire Wire Line
	3600 3400 3350 3400
Wire Wire Line
	3600 3500 3350 3500
Wire Wire Line
	3600 3600 3350 3600
Wire Wire Line
	3600 3700 3350 3700
Wire Wire Line
	3600 3800 3350 3800
Wire Wire Line
	3600 3900 3350 3900
Wire Wire Line
	3600 4000 3350 4000
Wire Wire Line
	3600 4100 3350 4100
Wire Wire Line
	3600 4200 3350 4200
Wire Wire Line
	3600 4300 3350 4300
Wire Wire Line
	3600 4400 3350 4400
Text Label 2350 1300 0    50   ~ 0
B1
Text Label 2350 1400 0    50   ~ 0
B2
Text Label 2350 1500 0    50   ~ 0
B3
Text Label 2350 1600 0    50   ~ 0
B4
Text Label 2350 1700 0    50   ~ 0
B5
Text Label 2350 1800 0    50   ~ 0
B6
Text Label 2350 1900 0    50   ~ 0
B7
Text Label 2350 2000 0    50   ~ 0
B8
Text Label 2350 2100 0    50   ~ 0
B9
Text Label 2350 2200 0    50   ~ 0
B10
Text Label 2350 2300 0    50   ~ 0
B11
Text Label 2350 2400 0    50   ~ 0
B12
Text Label 2350 2500 0    50   ~ 0
B13
Text Label 2350 2600 0    50   ~ 0
B14
Text Label 2350 2700 0    50   ~ 0
B15
Text Label 2350 2800 0    50   ~ 0
B16
Text Label 2350 2900 0    50   ~ 0
B17
Text Label 2350 3000 0    50   ~ 0
B18
Text Label 2350 3100 0    50   ~ 0
B19
Text Label 2350 3200 0    50   ~ 0
B20
Text Label 2350 3300 0    50   ~ 0
B21
Text Label 2350 3400 0    50   ~ 0
B22
Text Label 2350 3500 0    50   ~ 0
B23
Text Label 2350 3600 0    50   ~ 0
B24
Text Label 2350 3700 0    50   ~ 0
B25
Text Label 2350 3800 0    50   ~ 0
B26
Text Label 2350 3900 0    50   ~ 0
B27
Text Label 2350 4000 0    50   ~ 0
B28
Text Label 2350 4100 0    50   ~ 0
B29
Text Label 2350 4200 0    50   ~ 0
B30
Text Label 2350 4300 0    50   ~ 0
B31
Text Label 2350 4400 0    50   ~ 0
B32
Text Label 3350 1300 0    50   ~ 0
C1
Text Label 3350 1400 0    50   ~ 0
C2
Text Label 3350 1500 0    50   ~ 0
C3
Text Label 3350 1600 0    50   ~ 0
C4
Text Label 3350 1700 0    50   ~ 0
C5
Text Label 3350 1800 0    50   ~ 0
C6
Text Label 3350 1900 0    50   ~ 0
C7
Text Label 3350 2000 0    50   ~ 0
C8
Text Label 3350 2100 0    50   ~ 0
C9
Text Label 3350 2200 0    50   ~ 0
C10
Text Label 3350 2300 0    50   ~ 0
C11
Text Label 3350 2400 0    50   ~ 0
C12
Text Label 3350 2500 0    50   ~ 0
C13
Text Label 3350 2600 0    50   ~ 0
C14
Text Label 3350 2700 0    50   ~ 0
C15
Text Label 3350 2800 0    50   ~ 0
C16
Text Label 3350 2900 0    50   ~ 0
C17
Text Label 3350 3000 0    50   ~ 0
C18
Text Label 3350 3100 0    50   ~ 0
C19
Text Label 3350 3200 0    50   ~ 0
C20
Text Label 3350 3300 0    50   ~ 0
C21
Text Label 3350 3400 0    50   ~ 0
C22
Text Label 3350 3500 0    50   ~ 0
C23
Text Label 3350 3600 0    50   ~ 0
C24
Text Label 3350 3700 0    50   ~ 0
C25
Text Label 3350 3800 0    50   ~ 0
C26
Text Label 3350 3900 0    50   ~ 0
C27
Text Label 3350 4000 0    50   ~ 0
C28
Text Label 3350 4100 0    50   ~ 0
C29
Text Label 3350 4200 0    50   ~ 0
C30
Text Label 3350 4300 0    50   ~ 0
C31
Text Label 3350 4400 0    50   ~ 0
C32
$Comp
L alexios:DIN-41612-3x32-Bauform-C J1
U 2 1 63FFE295
P 2900 2800
F 0 "J1" H 2818 4567 50  0000 C CNN
F 1 "DIN-41612-C" H 2818 4476 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 2875 -600 50  0001 C CNN
F 3 " ~" H 2875 -600 50  0001 C CNN
	2    2900 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:DIN-41612-3x32-Bauform-C J1
U 3 1 64000BD7
P 3900 2800
F 0 "J1" H 3818 4567 50  0000 C CNN
F 1 "DIN-41612-C" H 3818 4476 50  0000 C CNN
F 2 "alexios:DIN41612_B_3x32_Horizontal" H 3875 -600 50  0001 C CNN
F 3 " ~" H 3875 -600 50  0001 C CNN
	3    3900 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:DIN-41612-3x32-Bauform-C P1
U 1 1 640744DF
P 5900 2800
F 0 "P1" H 5818 4567 50  0000 C CNN
F 1 "DIN-41612-C" H 5818 4476 50  0000 C CNN
F 2 "alexios:DIN41612_C_3x32_Female_Vertical_THT" H 5875 -600 50  0001 C CNN
F 3 " ~" H 5875 -600 50  0001 C CNN
	1    5900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1400 5350 1400
Wire Wire Line
	5600 1500 5350 1500
Wire Wire Line
	5600 1600 5350 1600
Wire Wire Line
	5600 1700 5350 1700
Wire Wire Line
	5600 1800 5350 1800
Wire Wire Line
	5600 1900 5350 1900
Wire Wire Line
	5600 2000 5350 2000
Wire Wire Line
	5600 2100 5350 2100
Wire Wire Line
	5600 2200 5350 2200
Wire Wire Line
	5600 2300 5350 2300
Wire Wire Line
	5600 2400 5350 2400
Wire Wire Line
	5600 2500 5350 2500
Wire Wire Line
	5600 2600 5350 2600
Wire Wire Line
	5600 2700 5350 2700
Wire Wire Line
	5600 2800 5350 2800
Wire Wire Line
	5600 2900 5350 2900
Wire Wire Line
	5600 3000 5350 3000
Wire Wire Line
	5600 3100 5350 3100
Wire Wire Line
	5600 3200 5350 3200
Wire Wire Line
	5600 3300 5350 3300
Wire Wire Line
	5600 3400 5350 3400
Wire Wire Line
	5600 3500 5350 3500
Wire Wire Line
	5600 3600 5350 3600
Wire Wire Line
	5600 3700 5350 3700
Wire Wire Line
	5600 3800 5350 3800
Wire Wire Line
	5600 3900 5350 3900
Wire Wire Line
	5600 4000 5350 4000
Wire Wire Line
	5600 4100 5350 4100
Wire Wire Line
	5600 4200 5350 4200
Wire Wire Line
	5600 4300 5350 4300
Wire Wire Line
	5600 4400 5350 4400
Text Label 5350 1300 0    50   ~ 0
A1
Text Label 5350 1400 0    50   ~ 0
A2
Text Label 5350 1500 0    50   ~ 0
A3
Text Label 5350 1600 0    50   ~ 0
A4
Text Label 5350 1700 0    50   ~ 0
A5
Text Label 5350 1800 0    50   ~ 0
A6
Text Label 5350 1900 0    50   ~ 0
A7
Text Label 5350 2000 0    50   ~ 0
A8
Text Label 5350 2100 0    50   ~ 0
A9
Text Label 5350 2200 0    50   ~ 0
A10
Text Label 5350 2300 0    50   ~ 0
A11
Text Label 5350 2400 0    50   ~ 0
A12
Text Label 5350 2500 0    50   ~ 0
A13
Text Label 5350 2600 0    50   ~ 0
A14
Text Label 5350 2700 0    50   ~ 0
A15
Text Label 5350 2800 0    50   ~ 0
A16
Text Label 5350 2900 0    50   ~ 0
A17
Text Label 5350 3000 0    50   ~ 0
A18
Text Label 5350 3100 0    50   ~ 0
A19
Text Label 5350 3200 0    50   ~ 0
A20
Text Label 5350 3300 0    50   ~ 0
A21
Text Label 5350 3400 0    50   ~ 0
A22
Text Label 5350 3500 0    50   ~ 0
A23
Text Label 5350 3600 0    50   ~ 0
A24
Text Label 5350 3700 0    50   ~ 0
A25
Text Label 5350 3800 0    50   ~ 0
A26
Text Label 5350 3900 0    50   ~ 0
A27
Text Label 5350 4000 0    50   ~ 0
A28
Text Label 5350 4100 0    50   ~ 0
A29
Text Label 5350 4200 0    50   ~ 0
A30
Text Label 5350 4300 0    50   ~ 0
A31
Text Label 5350 4400 0    50   ~ 0
A32
Wire Wire Line
	6600 1400 6350 1400
Wire Wire Line
	6600 1500 6350 1500
Wire Wire Line
	6600 1600 6350 1600
Wire Wire Line
	6600 1700 6350 1700
Wire Wire Line
	6600 1800 6350 1800
Wire Wire Line
	6600 1900 6350 1900
Wire Wire Line
	6600 2000 6350 2000
Wire Wire Line
	6600 2100 6350 2100
Wire Wire Line
	6600 2200 6350 2200
Wire Wire Line
	6600 2300 6350 2300
Wire Wire Line
	6600 2400 6350 2400
Wire Wire Line
	6600 2500 6350 2500
Wire Wire Line
	6600 2600 6350 2600
Wire Wire Line
	6600 2700 6350 2700
Wire Wire Line
	6600 2800 6350 2800
Wire Wire Line
	6600 2900 6350 2900
Wire Wire Line
	6600 3000 6350 3000
Wire Wire Line
	6600 3100 6350 3100
Wire Wire Line
	6600 3200 6350 3200
Wire Wire Line
	6600 3300 6350 3300
Wire Wire Line
	6600 3400 6350 3400
Wire Wire Line
	6600 3500 6350 3500
Wire Wire Line
	6600 3600 6350 3600
Wire Wire Line
	6600 3700 6350 3700
Wire Wire Line
	6600 3800 6350 3800
Wire Wire Line
	6600 3900 6350 3900
Wire Wire Line
	6600 4000 6350 4000
Wire Wire Line
	6600 4100 6350 4100
Wire Wire Line
	6600 4200 6350 4200
Wire Wire Line
	6600 4300 6350 4300
Wire Wire Line
	6600 4400 6350 4400
Wire Wire Line
	7600 1400 7350 1400
Wire Wire Line
	7600 1500 7350 1500
Wire Wire Line
	7600 1600 7350 1600
Wire Wire Line
	7600 1700 7350 1700
Wire Wire Line
	7600 1800 7350 1800
Wire Wire Line
	7600 1900 7350 1900
Wire Wire Line
	7600 2000 7350 2000
Wire Wire Line
	7600 2100 7350 2100
Wire Wire Line
	7600 2200 7350 2200
Wire Wire Line
	7600 2300 7350 2300
Wire Wire Line
	7600 2400 7350 2400
Wire Wire Line
	7600 2500 7350 2500
Wire Wire Line
	7600 2600 7350 2600
Wire Wire Line
	7600 2700 7350 2700
Wire Wire Line
	7600 2800 7350 2800
Wire Wire Line
	7600 2900 7350 2900
Wire Wire Line
	7600 3000 7350 3000
Wire Wire Line
	7600 3100 7350 3100
Wire Wire Line
	7600 3200 7350 3200
Wire Wire Line
	7600 3300 7350 3300
Wire Wire Line
	7600 3400 7350 3400
Wire Wire Line
	7600 3500 7350 3500
Wire Wire Line
	7600 3600 7350 3600
Wire Wire Line
	7600 3700 7350 3700
Wire Wire Line
	7600 3800 7350 3800
Wire Wire Line
	7600 3900 7350 3900
Wire Wire Line
	7600 4000 7350 4000
Wire Wire Line
	7600 4100 7350 4100
Wire Wire Line
	7600 4200 7350 4200
Wire Wire Line
	7600 4300 7350 4300
Wire Wire Line
	7600 4400 7350 4400
Text Label 6350 1300 0    50   ~ 0
B1
Text Label 6350 1400 0    50   ~ 0
B2
Text Label 6350 1500 0    50   ~ 0
B3
Text Label 6350 1600 0    50   ~ 0
B4
Text Label 6350 1700 0    50   ~ 0
B5
Text Label 6350 1800 0    50   ~ 0
B6
Text Label 6350 1900 0    50   ~ 0
B7
Text Label 6350 2000 0    50   ~ 0
B8
Text Label 6350 2100 0    50   ~ 0
B9
Text Label 6350 2200 0    50   ~ 0
B10
Text Label 6350 2300 0    50   ~ 0
B11
Text Label 6350 2400 0    50   ~ 0
B12
Text Label 6350 2500 0    50   ~ 0
B13
Text Label 6350 2600 0    50   ~ 0
B14
Text Label 6350 2700 0    50   ~ 0
B15
Text Label 6350 2800 0    50   ~ 0
B16
Text Label 6350 2900 0    50   ~ 0
B17
Text Label 6350 3000 0    50   ~ 0
B18
Text Label 6350 3100 0    50   ~ 0
B19
Text Label 6350 3200 0    50   ~ 0
B20
Text Label 6350 3300 0    50   ~ 0
B21
Text Label 6350 3400 0    50   ~ 0
B22
Text Label 6350 3500 0    50   ~ 0
B23
Text Label 6350 3600 0    50   ~ 0
B24
Text Label 6350 3700 0    50   ~ 0
B25
Text Label 6350 3800 0    50   ~ 0
B26
Text Label 6350 3900 0    50   ~ 0
B27
Text Label 6350 4000 0    50   ~ 0
B28
Text Label 6350 4100 0    50   ~ 0
B29
Text Label 6350 4200 0    50   ~ 0
B30
Text Label 6350 4300 0    50   ~ 0
B31
Text Label 6350 4400 0    50   ~ 0
B32
Text Label 7350 1300 0    50   ~ 0
C1
Text Label 7350 1400 0    50   ~ 0
C2
Text Label 7350 1500 0    50   ~ 0
C3
Text Label 7350 1600 0    50   ~ 0
C4
Text Label 7350 1700 0    50   ~ 0
C5
Text Label 7350 1800 0    50   ~ 0
C6
Text Label 7350 1900 0    50   ~ 0
C7
Text Label 7350 2000 0    50   ~ 0
C8
Text Label 7350 2100 0    50   ~ 0
C9
Text Label 7350 2200 0    50   ~ 0
C10
Text Label 7350 2300 0    50   ~ 0
C11
Text Label 7350 2400 0    50   ~ 0
C12
Text Label 7350 2500 0    50   ~ 0
C13
Text Label 7350 2600 0    50   ~ 0
C14
Text Label 7350 2700 0    50   ~ 0
C15
Text Label 7350 2800 0    50   ~ 0
C16
Text Label 7350 2900 0    50   ~ 0
C17
Text Label 7350 3000 0    50   ~ 0
C18
Text Label 7350 3100 0    50   ~ 0
C19
Text Label 7350 3200 0    50   ~ 0
C20
Text Label 7350 3300 0    50   ~ 0
C21
Text Label 7350 3400 0    50   ~ 0
C22
Text Label 7350 3500 0    50   ~ 0
C23
Text Label 7350 3600 0    50   ~ 0
C24
Text Label 7350 3700 0    50   ~ 0
C25
Text Label 7350 3800 0    50   ~ 0
C26
Text Label 7350 3900 0    50   ~ 0
C27
Text Label 7350 4000 0    50   ~ 0
C28
Text Label 7350 4100 0    50   ~ 0
C29
Text Label 7350 4200 0    50   ~ 0
C30
Text Label 7350 4300 0    50   ~ 0
C31
Text Label 7350 4400 0    50   ~ 0
C32
$Comp
L alexios:DIN-41612-3x32-Bauform-C P1
U 2 1 640745A5
P 6900 2800
F 0 "P1" H 6818 4567 50  0000 C CNN
F 1 "DIN-41612-C" H 6818 4476 50  0000 C CNN
F 2 "alexios:DIN41612_C_3x32_Female_Vertical_THT" H 6875 -600 50  0001 C CNN
F 3 " ~" H 6875 -600 50  0001 C CNN
	2    6900 2800
	1    0    0    -1  
$EndComp
$Comp
L alexios:DIN-41612-3x32-Bauform-C P1
U 3 1 64085095
P 7900 2800
F 0 "P1" H 7818 4567 50  0000 C CNN
F 1 "DIN-41612-C" H 7818 4476 50  0000 C CNN
F 2 "alexios:DIN41612_C_3x32_Female_Vertical_THT" H 7875 -600 50  0001 C CNN
F 3 " ~" H 7875 -600 50  0001 C CNN
	3    7900 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J4
U 1 1 619BE79B
P 13050 5200
F 0 "J4" H 13100 6617 50  0000 C CNN
F 1 "Conn_02x25_Odd_Even" H 13100 6526 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x25_P2.54mm_Vertical" H 13050 5200 50  0001 C CNN
F 3 "~" H 13050 5200 50  0001 C CNN
	1    13050 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J3
U 1 1 61E044F5
P 13050 2350
F 0 "J3" H 13100 3767 50  0000 C CNN
F 1 "Conn_02x25_Odd_Even" H 13100 3676 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x25_P2.54mm_Vertical" H 13050 2350 50  0001 C CNN
F 3 "~" H 13050 2350 50  0001 C CNN
	1    13050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 4000 12600 4000
Wire Wire Line
	12850 4100 12600 4100
Wire Wire Line
	12850 4200 12600 4200
Wire Wire Line
	12850 4300 12600 4300
Wire Wire Line
	12850 4400 12600 4400
Wire Wire Line
	12850 4500 12600 4500
Wire Wire Line
	12850 4600 12600 4600
Wire Wire Line
	12850 4700 12600 4700
Wire Wire Line
	12850 4800 12600 4800
Wire Wire Line
	12850 4900 12600 4900
Wire Wire Line
	12850 5000 12600 5000
Wire Wire Line
	12850 5100 12600 5100
Wire Wire Line
	12850 5200 12600 5200
Wire Wire Line
	12850 5300 12600 5300
Wire Wire Line
	12850 5400 12600 5400
Wire Wire Line
	12850 5500 12600 5500
Wire Wire Line
	12850 5600 12600 5600
Wire Wire Line
	12850 5700 12600 5700
Wire Wire Line
	12850 5800 12600 5800
Wire Wire Line
	12850 5900 12600 5900
Wire Wire Line
	12850 6000 12600 6000
Wire Wire Line
	12850 6100 12600 6100
Wire Wire Line
	12850 6200 12600 6200
Wire Wire Line
	12850 6300 12600 6300
Wire Wire Line
	12850 6400 12600 6400
Text Label 12600 4000 0    50   ~ 0
C8
Text Label 12600 4100 0    50   ~ 0
C9
Text Label 12600 4200 0    50   ~ 0
C10
Text Label 12600 4300 0    50   ~ 0
C11
Text Label 12600 4400 0    50   ~ 0
C12
Text Label 12600 4500 0    50   ~ 0
C13
Text Label 12600 4600 0    50   ~ 0
C14
Text Label 12600 4700 0    50   ~ 0
C15
Text Label 12600 4800 0    50   ~ 0
C16
Text Label 12600 4900 0    50   ~ 0
C17
Text Label 12600 5000 0    50   ~ 0
C18
Text Label 12600 5100 0    50   ~ 0
C19
Text Label 12600 5200 0    50   ~ 0
C20
Text Label 12600 5300 0    50   ~ 0
C21
Text Label 12600 5400 0    50   ~ 0
C22
Text Label 12600 5500 0    50   ~ 0
C23
Text Label 12600 5600 0    50   ~ 0
C24
Text Label 12600 5700 0    50   ~ 0
C25
Text Label 12600 5800 0    50   ~ 0
C26
Text Label 12600 5900 0    50   ~ 0
C27
Text Label 12600 6000 0    50   ~ 0
C28
Text Label 12600 6100 0    50   ~ 0
C29
Text Label 12600 6200 0    50   ~ 0
C30
Text Label 12600 6300 0    50   ~ 0
C31
Text Label 12600 6400 0    50   ~ 0
C32
Wire Wire Line
	12850 1150 12600 1150
Wire Wire Line
	12850 1250 12600 1250
Wire Wire Line
	12850 1350 12600 1350
Wire Wire Line
	12850 1450 12600 1450
Wire Wire Line
	12850 1550 12600 1550
Wire Wire Line
	12850 1650 12600 1650
Wire Wire Line
	12850 1750 12600 1750
Wire Wire Line
	12850 1850 12600 1850
Wire Wire Line
	12850 1950 12600 1950
Wire Wire Line
	12850 2050 12600 2050
Wire Wire Line
	12850 2150 12600 2150
Wire Wire Line
	12850 2250 12600 2250
Wire Wire Line
	12850 2350 12600 2350
Wire Wire Line
	12850 2450 12600 2450
Wire Wire Line
	12850 2550 12600 2550
Wire Wire Line
	12850 2650 12600 2650
Wire Wire Line
	12850 2750 12600 2750
Wire Wire Line
	12850 2850 12600 2850
Wire Wire Line
	12850 2950 12600 2950
Wire Wire Line
	12850 3050 12600 3050
Wire Wire Line
	12850 3150 12600 3150
Wire Wire Line
	12850 3250 12600 3250
Wire Wire Line
	12850 3350 12600 3350
Wire Wire Line
	12850 3450 12600 3450
Wire Wire Line
	12850 3550 12600 3550
Wire Wire Line
	13600 1150 13350 1150
Wire Wire Line
	13600 1250 13350 1250
Wire Wire Line
	13600 1350 13350 1350
Wire Wire Line
	13600 1450 13350 1450
Wire Wire Line
	13600 1550 13350 1550
Wire Wire Line
	13600 1650 13350 1650
Wire Wire Line
	13600 1750 13350 1750
Text Label 13600 1150 2    50   ~ 0
C1
Text Label 13600 1250 2    50   ~ 0
C2
Text Label 13600 1350 2    50   ~ 0
C3
Text Label 13600 1450 2    50   ~ 0
C4
Text Label 13600 1550 2    50   ~ 0
C5
Text Label 13600 1650 2    50   ~ 0
C6
Text Label 13600 1750 2    50   ~ 0
C7
Wire Wire Line
	13600 4300 13350 4300
Wire Wire Line
	13600 4400 13350 4400
Wire Wire Line
	13600 4500 13350 4500
Wire Wire Line
	13600 4600 13350 4600
Wire Wire Line
	13600 5200 13350 5200
Wire Wire Line
	13600 5300 13350 5300
Wire Wire Line
	13600 5400 13350 5400
Wire Wire Line
	13600 5500 13350 5500
Wire Wire Line
	13600 5600 13350 5600
Wire Wire Line
	13600 5700 13350 5700
Wire Wire Line
	13600 5800 13350 5800
Wire Wire Line
	13600 5900 13350 5900
Wire Wire Line
	13600 6000 13350 6000
Wire Wire Line
	13600 6100 13350 6100
Wire Wire Line
	13600 6200 13350 6200
Wire Wire Line
	13600 6300 13350 6300
Wire Wire Line
	13600 6400 13350 6400
Text Label 12600 1150 0    50   ~ 0
B1
Text Label 12600 1250 0    50   ~ 0
B2
Text Label 12600 1350 0    50   ~ 0
B3
Text Label 12600 1450 0    50   ~ 0
B4
Text Label 12600 1550 0    50   ~ 0
B5
Text Label 12600 1650 0    50   ~ 0
B6
Text Label 12600 1750 0    50   ~ 0
B7
Text Label 12600 1850 0    50   ~ 0
B8
Text Label 12600 1950 0    50   ~ 0
B9
Text Label 12600 2050 0    50   ~ 0
B10
Text Label 12600 2150 0    50   ~ 0
B11
Text Label 12600 2250 0    50   ~ 0
B12
Text Label 12600 2350 0    50   ~ 0
B13
Text Label 12600 2450 0    50   ~ 0
B14
Text Label 12600 2550 0    50   ~ 0
B15
Wire Wire Line
	13600 1850 13350 1850
Wire Wire Line
	13600 1950 13350 1950
Wire Wire Line
	13600 2050 13350 2050
Wire Wire Line
	13600 2150 13350 2150
Wire Wire Line
	13600 2250 13350 2250
Wire Wire Line
	13600 2350 13350 2350
Wire Wire Line
	13600 2450 13350 2450
Wire Wire Line
	13600 2550 13350 2550
Wire Wire Line
	13600 2650 13350 2650
Wire Wire Line
	13600 2750 13350 2750
Wire Wire Line
	13600 2850 13350 2850
Wire Wire Line
	13600 2950 13350 2950
Wire Wire Line
	13600 3050 13350 3050
Wire Wire Line
	13350 3150 13600 3150
Wire Wire Line
	13350 3350 13600 3350
Wire Wire Line
	13350 3450 13600 3450
Wire Wire Line
	13350 3550 13600 3550
Text Label 13600 5800 2    50   ~ 0
A26
Text Label 13600 5900 2    50   ~ 0
A27
Text Label 13600 6000 2    50   ~ 0
A28
Text Label 13600 6100 2    50   ~ 0
A29
Text Label 13600 6200 2    50   ~ 0
A30
Text Label 13600 6300 2    50   ~ 0
A31
Text Label 13600 6400 2    50   ~ 0
A32
Text Label 13600 3550 2    50   ~ 0
A25
Text Label 13600 3450 2    50   ~ 0
A24
Text Label 13600 3350 2    50   ~ 0
A23
Wire Wire Line
	13350 4000 13600 4000
Text Label 13600 4000 2    50   ~ 0
A1
Text Label 13600 4100 2    50   ~ 0
A2
Text Label 13600 4200 2    50   ~ 0
A3
Wire Wire Line
	13350 4100 13600 4100
Wire Wire Line
	13350 4200 13600 4200
Text Label 13600 1850 2    50   ~ 0
A8
Text Label 13600 1950 2    50   ~ 0
A9
Text Label 13600 2050 2    50   ~ 0
A10
Text Label 13600 2150 2    50   ~ 0
A11
Text Label 13600 2250 2    50   ~ 0
A12
Text Label 13600 2350 2    50   ~ 0
A13
Text Label 13600 2450 2    50   ~ 0
A14
Text Label 13600 2550 2    50   ~ 0
A15
Text Label 13600 2650 2    50   ~ 0
A16
Text Label 13600 2750 2    50   ~ 0
A17
Text Label 13600 2850 2    50   ~ 0
A18
Text Label 13600 2950 2    50   ~ 0
A19
Text Label 13600 3050 2    50   ~ 0
A20
Text Label 13600 3150 2    50   ~ 0
A21
Wire Wire Line
	13350 3250 13600 3250
Text Label 13600 3250 2    50   ~ 0
A22
Text Label 13600 4300 2    50   ~ 0
A4
Text Label 13600 4400 2    50   ~ 0
A5
Text Label 13600 4500 2    50   ~ 0
A6
Text Label 13600 4600 2    50   ~ 0
A7
$Comp
L power:GND #PWR0101
U 1 1 61A0CB0C
P 5350 4400
F 0 "#PWR0101" H 5350 4150 50  0001 C CNN
F 1 "GND" H 5355 4227 50  0000 C CNN
F 2 "" H 5350 4400 50  0001 C CNN
F 3 "" H 5350 4400 50  0001 C CNN
	1    5350 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 61A0D041
P 6350 4400
F 0 "#PWR0102" H 6350 4150 50  0001 C CNN
F 1 "GND" H 6355 4227 50  0000 C CNN
F 2 "" H 6350 4400 50  0001 C CNN
F 3 "" H 6350 4400 50  0001 C CNN
	1    6350 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61A0D3C2
P 7350 4400
F 0 "#PWR0103" H 7350 4150 50  0001 C CNN
F 1 "GND" H 7355 4227 50  0000 C CNN
F 2 "" H 7350 4400 50  0001 C CNN
F 3 "" H 7350 4400 50  0001 C CNN
	1    7350 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1250 5300 1300
Wire Wire Line
	5300 1300 5600 1300
Wire Wire Line
	6300 1250 6300 1300
Wire Wire Line
	6300 1300 6600 1300
Wire Wire Line
	7300 1250 7300 1300
Wire Wire Line
	7300 1300 7600 1300
$Comp
L power:+5V #PWR?
U 1 1 61AFC77F
P 5300 1250
AR Path="/5F67D4B5/61AFC77F" Ref="#PWR?"  Part="1" 
AR Path="/61AFC77F" Ref="#PWR0104"  Part="1" 
AR Path="/5D34E810/61AFC77F" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/61AFC77F" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/61AFC77F" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61AFC77F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 5300 1100 50  0001 C CNN
F 1 "+5V" H 5242 1287 50  0000 R CNN
F 2 "" H 5300 1250 50  0001 C CNN
F 3 "" H 5300 1250 50  0001 C CNN
	1    5300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61AFD121
P 6300 1250
AR Path="/5F67D4B5/61AFD121" Ref="#PWR?"  Part="1" 
AR Path="/61AFD121" Ref="#PWR0105"  Part="1" 
AR Path="/5D34E810/61AFD121" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/61AFD121" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/61AFD121" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61AFD121" Ref="#PWR?"  Part="1" 
F 0 "#PWR0105" H 6300 1100 50  0001 C CNN
F 1 "+5V" H 6242 1287 50  0000 R CNN
F 2 "" H 6300 1250 50  0001 C CNN
F 3 "" H 6300 1250 50  0001 C CNN
	1    6300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61AFD4CA
P 7300 1250
AR Path="/5F67D4B5/61AFD4CA" Ref="#PWR?"  Part="1" 
AR Path="/61AFD4CA" Ref="#PWR0106"  Part="1" 
AR Path="/5D34E810/61AFD4CA" Ref="#PWR?"  Part="1" 
AR Path="/5D36B851/61AFD4CA" Ref="#PWR?"  Part="1" 
AR Path="/5F1DB2E8/61AFD4CA" Ref="#PWR?"  Part="1" 
AR Path="/60757845/61AFD4CA" Ref="#PWR?"  Part="1" 
F 0 "#PWR0106" H 7300 1100 50  0001 C CNN
F 1 "+5V" H 7242 1287 50  0000 R CNN
F 2 "" H 7300 1250 50  0001 C CNN
F 3 "" H 7300 1250 50  0001 C CNN
	1    7300 1250
	1    0    0    -1  
$EndComp
Text Label 12600 3550 0    50   ~ 0
B25
Text Label 12600 3350 0    50   ~ 0
B23
Text Label 12600 3150 0    50   ~ 0
B21
Text Label 12600 2950 0    50   ~ 0
B19
Text Label 12600 2750 0    50   ~ 0
B17
Text Label 12600 3450 0    50   ~ 0
B24
Text Label 12600 3250 0    50   ~ 0
B22
Text Label 12600 3050 0    50   ~ 0
B20
Text Label 12600 2850 0    50   ~ 0
B18
Text Label 12600 2650 0    50   ~ 0
B16
Text Label 13600 5200 2    50   ~ 0
B26
Text Label 13600 5300 2    50   ~ 0
B27
Text Label 13600 5400 2    50   ~ 0
B28
Text Label 13600 5500 2    50   ~ 0
B29
Text Label 13600 5600 2    50   ~ 0
B30
Text Label 13600 5700 2    50   ~ 0
B31
Wire Wire Line
	13350 4700 13600 4700
Wire Wire Line
	13350 4800 13600 4800
Wire Wire Line
	13350 4900 13600 4900
Wire Wire Line
	13350 5000 13600 5000
Wire Wire Line
	13350 5100 13600 5100
Text Label 13600 4700 2    50   ~ 0
GND
Text Label 13600 4800 2    50   ~ 0
GND
Text Label 13600 4900 2    50   ~ 0
GND
Text Label 13600 5000 2    50   ~ 0
GND
Text Label 13600 5100 2    50   ~ 0
GND
$EndSCHEMATC
