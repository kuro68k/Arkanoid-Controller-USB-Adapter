EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny861-20PU U1
U 1 1 63CEB443
P 6250 3250
F 0 "U1" H 5621 3296 50  0000 R CNN
F 1 "ATtiny861-20PU" H 5621 3205 50  0000 R CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6250 3250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2588-8-bit-avr-microcontrollers-tinyavr-attiny261-attiny461-attiny861_datasheet.pdf" H 6250 3250 50  0001 C CNN
	1    6250 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J3
U 1 1 63CED753
P 1850 3250
F 0 "J3" H 1907 3717 50  0000 C CNN
F 1 "USB_B" H 1907 3626 50  0000 C CNN
F 2 "Connector_USB:USB_B_Lumberg_2411_02_Horizontal" H 2000 3200 50  0001 C CNN
F 3 " ~" H 2000 3200 50  0001 C CNN
	1    1850 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 63CEE1F7
P 7800 4450
F 0 "C3" H 7915 4496 50  0000 L CNN
F 1 "C" H 7915 4405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7838 4300 50  0001 C CNN
F 3 "~" H 7800 4450 50  0001 C CNN
	1    7800 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 63CEE806
P 2500 3000
F 0 "R1" H 2570 3046 50  0000 L CNN
F 1 "1k5" H 2570 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2430 3000 50  0001 C CNN
F 3 "~" H 2500 3000 50  0001 C CNN
	1    2500 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D1
U 1 1 63CEEED3
P 2500 3600
F 0 "D1" V 2454 3680 50  0000 L CNN
F 1 "3V6" V 2545 3680 50  0000 L CNN
F 2 "Diode_THT:D_T-1_P5.08mm_Horizontal" H 2500 3600 50  0001 C CNN
F 3 "~" H 2500 3600 50  0001 C CNN
	1    2500 3600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 63CEF64C
P 2100 1050
F 0 "#PWR01" H 2100 900 50  0001 C CNN
F 1 "+5V" H 2115 1223 50  0000 C CNN
F 2 "" H 2100 1050 50  0001 C CNN
F 3 "" H 2100 1050 50  0001 C CNN
	1    2100 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 63CEFC44
P 6300 4450
F 0 "#PWR013" H 6300 4200 50  0001 C CNN
F 1 "GND" H 6305 4277 50  0000 C CNN
F 2 "" H 6300 4450 50  0001 C CNN
F 3 "" H 6300 4450 50  0001 C CNN
	1    6300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4350 6250 4400
Wire Wire Line
	6250 4400 6300 4400
Wire Wire Line
	6300 4400 6300 4450
Wire Wire Line
	6300 4400 6350 4400
Wire Wire Line
	6350 4400 6350 4350
Connection ~ 6300 4400
$Comp
L Connector:AVR-ISP-6 J1
U 1 1 63CF0937
P 2200 1550
F 0 "J1" H 1871 1646 50  0000 R CNN
F 1 "AVR-ISP-6" H 1871 1555 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 1950 1600 50  0001 C CNN
F 3 " ~" H 925 1000 50  0001 C CNN
	1    2200 1550
	1    0    0    -1  
$EndComp
Text Label 7200 3350 2    50   ~ 0
MOSI
Text Label 7200 3450 2    50   ~ 0
MISO
Text Label 7200 3550 2    50   ~ 0
SCK
Text Label 7200 4050 2    50   ~ 0
RST
Text Label 2800 1450 2    50   ~ 0
MOSI
Text Label 2800 1350 2    50   ~ 0
MISO
Text Label 2800 1550 2    50   ~ 0
SCK
Text Label 2800 1650 2    50   ~ 0
RST
Wire Wire Line
	6950 3350 7200 3350
Wire Wire Line
	6950 3450 7200 3450
Wire Wire Line
	6950 3550 7200 3550
Wire Wire Line
	6950 4050 7200 4050
$Comp
L power:GND #PWR04
U 1 1 63CF27E1
P 2100 1950
F 0 "#PWR04" H 2100 1700 50  0001 C CNN
F 1 "GND" H 2105 1777 50  0000 C CNN
F 2 "" H 2100 1950 50  0001 C CNN
F 3 "" H 2100 1950 50  0001 C CNN
	1    2100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1350 2800 1350
Wire Wire Line
	2600 1450 2800 1450
Wire Wire Line
	2600 1550 2800 1550
Wire Wire Line
	2600 1650 2800 1650
Text Label 7350 2450 2    50   ~ 0
DATA1
Text Label 7350 2650 2    50   ~ 0
CLOCK
Text Label 7350 2850 2    50   ~ 0
BUTTON1
Text Label 7350 2950 2    50   ~ 0
DATA2
Text Label 7350 3050 2    50   ~ 0
BUTTON2
Text Label 7350 2750 2    50   ~ 0
READ
Wire Wire Line
	6950 2450 7350 2450
Wire Wire Line
	6950 2650 7350 2650
Wire Wire Line
	6950 2750 7350 2750
Wire Wire Line
	6950 2850 7350 2850
Wire Wire Line
	6950 2950 7350 2950
Wire Wire Line
	6950 3050 7350 3050
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 63CF564B
P 9600 4300
F 0 "J4" H 9680 4342 50  0000 L CNN
F 1 "Conn_01x03" H 9680 4251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9600 4300 50  0001 C CNN
F 3 "~" H 9600 4300 50  0001 C CNN
	1    9600 4300
	1    0    0    -1  
$EndComp
Text Label 7350 3150 2    50   ~ 0
POT
Wire Wire Line
	7350 3150 6950 3150
NoConn ~ 6950 2550
$Comp
L power:GND #PWR09
U 1 1 63CF6977
P 1800 3750
F 0 "#PWR09" H 1800 3500 50  0001 C CNN
F 1 "GND" H 1805 3577 50  0000 C CNN
F 2 "" H 1800 3750 50  0001 C CNN
F 3 "" H 1800 3750 50  0001 C CNN
	1    1800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3650 1750 3700
Wire Wire Line
	1750 3700 1800 3700
Wire Wire Line
	1800 3700 1800 3750
Wire Wire Line
	1800 3700 1850 3700
Wire Wire Line
	1850 3700 1850 3650
Connection ~ 1800 3700
Wire Wire Line
	2150 3050 2200 3050
Wire Wire Line
	2150 3350 2500 3350
Wire Wire Line
	2500 3350 2500 3450
Wire Wire Line
	2500 3350 2500 3150
Connection ~ 2500 3350
$Comp
L Device:D_Zener D2
U 1 1 63CFB9CD
P 2850 3600
F 0 "D2" V 2804 3680 50  0000 L CNN
F 1 "3V6" V 2895 3680 50  0000 L CNN
F 2 "Diode_THT:D_T-1_P5.08mm_Horizontal" H 2850 3600 50  0001 C CNN
F 3 "~" H 2850 3600 50  0001 C CNN
	1    2850 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 3250 2850 3250
Wire Wire Line
	2850 3250 2850 3450
$Comp
L power:+5V #PWR07
U 1 1 63CF7CD1
P 2200 2650
F 0 "#PWR07" H 2200 2500 50  0001 C CNN
F 1 "+5V" H 2215 2823 50  0000 C CNN
F 2 "" H 2200 2650 50  0001 C CNN
F 3 "" H 2200 2650 50  0001 C CNN
	1    2200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2650 2200 2750
Wire Wire Line
	2500 2850 2500 2750
Wire Wire Line
	2500 2750 2200 2750
Connection ~ 2200 2750
Wire Wire Line
	2200 2750 2200 3050
Text Label 3200 3350 2    50   ~ 0
DM
Text Label 3200 3250 2    50   ~ 0
DP
Wire Wire Line
	2500 3350 3200 3350
Wire Wire Line
	3200 3250 2850 3250
Connection ~ 2850 3250
Text Label 7350 3950 2    50   ~ 0
DP
Text Label 7350 3650 2    50   ~ 0
DM
Wire Wire Line
	7350 3650 6950 3650
Wire Wire Line
	6950 3950 7350 3950
$Comp
L Device:Crystal_Small Y1
U 1 1 63D016A0
P 8000 4200
F 0 "Y1" H 8000 4425 50  0000 C CNN
F 1 "20MHz" H 8000 4334 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 8000 4200 50  0001 C CNN
F 3 "~" H 8000 4200 50  0001 C CNN
	1    8000 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 63D02D02
P 8200 4450
F 0 "C4" H 8315 4496 50  0000 L CNN
F 1 "C" H 8315 4405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8238 4300 50  0001 C CNN
F 3 "~" H 8200 4450 50  0001 C CNN
	1    8200 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 63D03043
P 7800 4600
F 0 "#PWR014" H 7800 4350 50  0001 C CNN
F 1 "GND" H 7805 4427 50  0000 C CNN
F 2 "" H 7800 4600 50  0001 C CNN
F 3 "" H 7800 4600 50  0001 C CNN
	1    7800 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 63D03562
P 8200 4600
F 0 "#PWR015" H 8200 4350 50  0001 C CNN
F 1 "GND" H 8205 4427 50  0000 C CNN
F 2 "" H 8200 4600 50  0001 C CNN
F 3 "" H 8200 4600 50  0001 C CNN
	1    8200 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3750 8200 3750
Wire Wire Line
	8200 3750 8200 4200
Wire Wire Line
	8100 4200 8200 4200
Connection ~ 8200 4200
Wire Wire Line
	8200 4200 8200 4300
Wire Wire Line
	6950 3850 7800 3850
Wire Wire Line
	7800 3850 7800 4200
Wire Wire Line
	7800 4200 7900 4200
Connection ~ 7800 4200
Wire Wire Line
	7800 4200 7800 4300
Text Label 9200 4300 0    50   ~ 0
POT
Wire Wire Line
	9200 4300 9400 4300
$Comp
L power:GND #PWR016
U 1 1 63D0E617
P 9350 4450
F 0 "#PWR016" H 9350 4200 50  0001 C CNN
F 1 "GND" H 9355 4277 50  0000 C CNN
F 2 "" H 9350 4450 50  0001 C CNN
F 3 "" H 9350 4450 50  0001 C CNN
	1    9350 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 63D0E8E8
P 9350 4150
F 0 "#PWR012" H 9350 4000 50  0001 C CNN
F 1 "+5V" H 9365 4323 50  0000 C CNN
F 2 "" H 9350 4150 50  0001 C CNN
F 3 "" H 9350 4150 50  0001 C CNN
	1    9350 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4200 9350 4200
Wire Wire Line
	9350 4200 9350 4150
Wire Wire Line
	9400 4400 9350 4400
Wire Wire Line
	9350 4400 9350 4450
$Comp
L power:+5V #PWR02
U 1 1 63D108E0
P 6250 1600
F 0 "#PWR02" H 6250 1450 50  0001 C CNN
F 1 "+5V" H 6265 1773 50  0000 C CNN
F 2 "" H 6250 1600 50  0001 C CNN
F 3 "" H 6250 1600 50  0001 C CNN
	1    6250 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 63D10C42
P 2500 3750
F 0 "#PWR010" H 2500 3500 50  0001 C CNN
F 1 "GND" H 2505 3577 50  0000 C CNN
F 2 "" H 2500 3750 50  0001 C CNN
F 3 "" H 2500 3750 50  0001 C CNN
	1    2500 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 63D11032
P 2850 3750
F 0 "#PWR011" H 2850 3500 50  0001 C CNN
F 1 "GND" H 2855 3577 50  0000 C CNN
F 2 "" H 2850 3750 50  0001 C CNN
F 3 "" H 2850 3750 50  0001 C CNN
	1    2850 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 63D112BB
P 6600 1850
F 0 "C1" H 6715 1896 50  0000 L CNN
F 1 "10u" H 6715 1805 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D6.3mm_H5.0mm_P2.50mm" H 6638 1700 50  0001 C CNN
F 3 "~" H 6600 1850 50  0001 C CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 63D1275F
P 6600 2000
F 0 "#PWR05" H 6600 1750 50  0001 C CNN
F 1 "GND" H 6605 1827 50  0000 C CNN
F 2 "" H 6600 2000 50  0001 C CNN
F 3 "" H 6600 2000 50  0001 C CNN
	1    6600 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1700 6600 1650
Wire Wire Line
	6250 1600 6250 1650
Wire Wire Line
	6600 1650 6350 1650
Connection ~ 6250 1650
Wire Wire Line
	6250 1650 6250 2150
Wire Wire Line
	6350 2150 6350 1650
Connection ~ 6350 1650
Wire Wire Line
	6350 1650 6250 1650
$Comp
L Connector_Generic:Conn_01x15 J2
U 1 1 63D1BA31
P 9250 2550
F 0 "J2" H 9330 2592 50  0000 L CNN
F 1 "Conn_01x15" H 9330 2501 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-15_Male_EdgeMount_P2.77mm" H 9250 2550 50  0001 C CNN
F 3 "~" H 9250 2550 50  0001 C CNN
	1    9250 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 63D23AD5
P 8850 1750
F 0 "#PWR03" H 8850 1500 50  0001 C CNN
F 1 "GND" H 8855 1577 50  0000 C CNN
F 2 "" H 8850 1750 50  0001 C CNN
F 3 "" H 8850 1750 50  0001 C CNN
	1    8850 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 63D24FAC
P 8850 3350
F 0 "#PWR08" H 8850 3200 50  0001 C CNN
F 1 "+5V" H 8865 3523 50  0000 C CNN
F 2 "" H 8850 3350 50  0001 C CNN
F 3 "" H 8850 3350 50  0001 C CNN
	1    8850 3350
	1    0    0    -1  
$EndComp
Text Label 8000 2450 0    50   ~ 0
DATA1
Text Label 8650 2150 0    50   ~ 0
DATA2
Text Label 8650 2250 0    50   ~ 0
BUTTON2
Text Label 8650 3050 0    50   ~ 0
BUTTON1
Text Label 8650 2950 0    50   ~ 0
READ
Text Label 8650 2650 0    50   ~ 0
CLOCK
Wire Wire Line
	8650 2150 9050 2150
Wire Wire Line
	8650 2250 9050 2250
Wire Wire Line
	8650 2450 9050 2450
Wire Wire Line
	9050 2650 8650 2650
Wire Wire Line
	8650 2950 9050 2950
Wire Wire Line
	9050 3050 8650 3050
Wire Wire Line
	8850 3350 8850 3400
Wire Wire Line
	8850 3400 9000 3400
Wire Wire Line
	9000 3400 9000 3250
Wire Wire Line
	9000 3250 9050 3250
Wire Wire Line
	8850 1750 8850 1700
Wire Wire Line
	8850 1700 9000 1700
Wire Wire Line
	9000 1700 9000 1850
Wire Wire Line
	9000 1850 9050 1850
NoConn ~ 9050 1950
NoConn ~ 9050 2050
NoConn ~ 9050 2350
NoConn ~ 9050 2550
NoConn ~ 9050 2750
NoConn ~ 9050 2850
NoConn ~ 9050 3150
$Comp
L Device:C C2
U 1 1 63D39A3D
P 7000 1850
F 0 "C2" H 7115 1896 50  0000 L CNN
F 1 "100n" H 7115 1805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7038 1700 50  0001 C CNN
F 3 "~" H 7000 1850 50  0001 C CNN
	1    7000 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 63D39CFD
P 7000 2000
F 0 "#PWR06" H 7000 1750 50  0001 C CNN
F 1 "GND" H 7005 1827 50  0000 C CNN
F 2 "" H 7000 2000 50  0001 C CNN
F 3 "" H 7000 2000 50  0001 C CNN
	1    7000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1650 7000 1650
Wire Wire Line
	7000 1650 7000 1700
Connection ~ 6600 1650
$Comp
L Mechanical:MountingHole H1
U 1 1 63D5D6E7
P 1000 6500
F 0 "H1" H 1100 6546 50  0000 L CNN
F 1 "MountingHole" H 1100 6455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1000 6500 50  0001 C CNN
F 3 "~" H 1000 6500 50  0001 C CNN
	1    1000 6500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 63D5DF5C
P 1000 6700
F 0 "H2" H 1100 6746 50  0000 L CNN
F 1 "MountingHole" H 1100 6655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1000 6700 50  0001 C CNN
F 3 "~" H 1000 6700 50  0001 C CNN
	1    1000 6700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 63D5E168
P 1000 6900
F 0 "H3" H 1100 6946 50  0000 L CNN
F 1 "MountingHole" H 1100 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1000 6900 50  0001 C CNN
F 3 "~" H 1000 6900 50  0001 C CNN
	1    1000 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 63D5E356
P 1000 7100
F 0 "H4" H 1100 7146 50  0000 L CNN
F 1 "MountingHole" H 1100 7055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1000 7100 50  0001 C CNN
F 3 "~" H 1000 7100 50  0001 C CNN
	1    1000 7100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Bridged JP1
U 1 1 63D69677
P 8450 2450
F 0 "JP1" H 8450 2553 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 8450 2554 50  0001 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8450 2450 50  0001 C CNN
F 3 "~" H 8450 2450 50  0001 C CNN
	1    8450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2450 8000 2450
$EndSCHEMATC
