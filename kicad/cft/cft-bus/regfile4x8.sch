EESchema Schematic File Version 4
LIBS:cft-bus-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 "BUS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L alexios:74HC670 U?
U 1 1 5E647EEF
P 4900 2750
F 0 "U?" H 4900 3517 50  0000 C CNN
F 1 "74HC670" H 4900 3426 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5200 2900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 5200 2900 50  0001 C CNN
	1    4900 2750
	1    0    0    -1  
$EndComp
Text Label 2750 3350 0    50   ~ 0
~RE
Wire Wire Line
	4400 3350 3250 3350
Wire Wire Line
	4400 3250 3350 3250
Text Label 2750 3150 0    50   ~ 0
RA0
Text Label 2750 3250 0    50   ~ 0
RA1
Wire Wire Line
	4400 2750 3850 2750
Wire Wire Line
	4400 2850 3750 2850
Wire Wire Line
	2650 2250 4400 2250
Wire Wire Line
	2650 2350 4400 2350
Wire Wire Line
	2650 2450 4400 2450
Wire Wire Line
	2650 2550 4400 2550
Wire Wire Line
	4400 2950 3650 2950
Text Label 2750 2950 0    50   ~ 0
~WE
Wire Wire Line
	5400 2550 5750 2550
Wire Wire Line
	5400 2450 5750 2450
Wire Wire Line
	5400 2350 5750 2350
Wire Wire Line
	5400 2250 5750 2250
Wire Wire Line
	5400 3850 5750 3850
Wire Wire Line
	5400 3950 5750 3950
Wire Wire Line
	5400 4050 5750 4050
Wire Wire Line
	5400 4150 5750 4150
Wire Wire Line
	2650 4150 4400 4150
Wire Wire Line
	2650 4050 4400 4050
Wire Wire Line
	2650 3950 4400 3950
Wire Wire Line
	2650 3850 4400 3850
Text Label 2750 2750 0    50   ~ 0
WA0
Text Label 2750 2850 0    50   ~ 0
WA1
$Comp
L alexios:74HC670 U?
U 1 1 5E647EF6
P 4900 4350
AR Path="/61F95ACC/5E647EF6" Ref="U?"  Part="1" 
AR Path="/61F95ACC/5E647D2E/5E647EF6" Ref="U?"  Part="1" 
F 0 "U?" H 4900 5117 50  0000 C CNN
F 1 "74HC670" H 4900 5026 50  0000 C CNN
F 2 "alexios:SOIC-16" H 5200 4500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hc670.pdf" H 5200 4500 50  0001 C CNN
	1    4900 4350
	1    0    0    -1  
$EndComp
Text Label 5500 2250 0    50   ~ 0
OUT0
Text Label 5500 2350 0    50   ~ 0
OUT1
Text Label 5500 2450 0    50   ~ 0
OUT2
Text Label 5500 2550 0    50   ~ 0
OUT3
Text Label 5500 3850 0    50   ~ 0
OUT4
Text Label 5500 3950 0    50   ~ 0
OUT5
Text Label 5500 4050 0    50   ~ 0
OUT6
Text Label 5500 4150 0    50   ~ 0
OUT7
Text Label 2700 2250 0    50   ~ 0
IN0
Text Label 2700 2350 0    50   ~ 0
IN1
Text Label 2700 2450 0    50   ~ 0
IN2
Text Label 2700 2550 0    50   ~ 0
IN3
Text Label 2700 3850 0    50   ~ 0
IN4
Text Label 2700 3950 0    50   ~ 0
IN5
Text Label 2700 4050 0    50   ~ 0
IN6
Text Label 2700 4150 0    50   ~ 0
IN7
Wire Wire Line
	4400 4350 3850 4350
Wire Wire Line
	4400 4450 3750 4450
Wire Wire Line
	4400 4550 3650 4550
Wire Wire Line
	4400 4950 3250 4950
Wire Wire Line
	4400 4750 3450 4750
Wire Wire Line
	4400 4850 3350 4850
Text HLabel 2650 2750 0    50   Input ~ 0
WA0
Text HLabel 2650 2850 0    50   Input ~ 0
WA1
Text HLabel 2650 3150 0    50   Input ~ 0
RA0
Text HLabel 2650 3250 0    50   Input ~ 0
RA1
Text HLabel 2650 3350 0    50   Input ~ 0
~RE
Text HLabel 2650 2950 0    50   Input ~ 0
~WE
Wire Wire Line
	3850 2750 3850 4350
Connection ~ 3850 2750
Wire Wire Line
	3850 2750 2650 2750
Wire Wire Line
	3750 2850 3750 4450
Connection ~ 3750 2850
Wire Wire Line
	3750 2850 2650 2850
Wire Wire Line
	3650 2950 3650 4550
Connection ~ 3650 2950
Wire Wire Line
	3650 2950 2650 2950
Wire Wire Line
	3450 3150 3450 4750
Wire Wire Line
	3350 3250 3350 4850
Connection ~ 3350 3250
Wire Wire Line
	3350 3250 2650 3250
Wire Wire Line
	3250 3350 3250 4950
Connection ~ 3250 3350
Wire Wire Line
	3250 3350 2650 3350
Text Label 4100 2950 0    50   ~ 0
~WE
Text Label 4100 2750 0    50   ~ 0
WA0
Text Label 4100 2850 0    50   ~ 0
WA1
Text Label 4100 3350 0    50   ~ 0
~RE
Text Label 4100 3150 0    50   ~ 0
RA0
Text Label 4100 3250 0    50   ~ 0
RA1
Text Label 4100 2950 0    50   ~ 0
~WE
Text Label 4100 4550 0    50   ~ 0
~WE
Text Label 4100 4350 0    50   ~ 0
WA0
Text Label 4100 4450 0    50   ~ 0
WA1
Text Label 4100 4950 0    50   ~ 0
~RE
Text Label 4100 4750 0    50   ~ 0
RA0
Text Label 4100 4850 0    50   ~ 0
RA1
Text Label 4100 4550 0    50   ~ 0
~WE
Connection ~ 3450 3150
Wire Wire Line
	3450 3150 2650 3150
Wire Wire Line
	4400 3150 3450 3150
Text Label 4100 3850 0    50   ~ 0
IN4
Text Label 4100 3950 0    50   ~ 0
IN5
Text Label 4100 4050 0    50   ~ 0
IN6
Text Label 4100 4150 0    50   ~ 0
IN7
Text Label 4100 2250 0    50   ~ 0
IN0
Text Label 4100 2350 0    50   ~ 0
IN1
Text Label 4100 2450 0    50   ~ 0
IN2
Text Label 4100 2550 0    50   ~ 0
IN3
Text HLabel 2650 2250 0    50   Input ~ 0
IN0
Text HLabel 2650 2350 0    50   Input ~ 0
IN1
Text HLabel 2650 2450 0    50   Input ~ 0
IN2
Text HLabel 2650 2550 0    50   Input ~ 0
IN3
Text HLabel 2650 3850 0    50   Input ~ 0
IN4
Text HLabel 2650 3950 0    50   Input ~ 0
IN5
Text HLabel 2650 4050 0    50   Input ~ 0
IN6
Text HLabel 2650 4150 0    50   Input ~ 0
IN7
Text HLabel 5750 2250 2    50   Output ~ 0
OUT0
Text HLabel 5750 2350 2    50   Output ~ 0
OUT1
Text HLabel 5750 2450 2    50   Output ~ 0
OUT2
Text HLabel 5750 2550 2    50   Output ~ 0
OUT3
Text HLabel 5750 3850 2    50   Output ~ 0
OUT4
Text HLabel 5750 3950 2    50   Output ~ 0
OUT5
Text HLabel 5750 4050 2    50   Output ~ 0
OUT6
Text HLabel 5750 4150 2    50   Output ~ 0
OUT7
$EndSCHEMATC
