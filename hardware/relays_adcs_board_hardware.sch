EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
L MCU_Microchip_ATtiny:ATtiny804-SS U1
U 1 1 60249BA0
P 6850 4300
F 0 "U1" H 6500 5050 50  0000 C CNN
F 1 "ATtiny804-SS" H 6500 4950 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6850 4300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATtiny804_1604-Data-Sheet-40002028A.pdf" H 6850 4300 50  0001 C CNN
	1    6850 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Raspberry_Pi_2_3 J2
U 1 1 6024B3A4
P 2300 4400
F 0 "J2" H 1750 5750 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 1700 5650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 2300 4400 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 2300 4400 50  0001 C CNN
	1    2300 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 60250A0B
P 5000 3650
F 0 "R5" H 5070 3696 50  0000 L CNN
F 1 "10K" H 5070 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4930 3650 50  0001 C CNN
F 3 "~" H 5000 3650 50  0001 C CNN
	1    5000 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:D D6
U 1 1 60251F1D
P 11200 1700
F 0 "D6" V 11154 1780 50  0000 L CNN
F 1 "D" V 11245 1780 50  0000 L CNN
F 2 "Diode_SMD:D_MicroMELF" H 11200 1700 50  0001 C CNN
F 3 "~" H 11200 1700 50  0001 C CNN
	1    11200 1700
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Single:2N7002 Q1
U 1 1 6025C1A0
P 4700 3900
F 0 "Q1" V 4861 3900 60  0000 C CNN
F 1 "2N7002" V 4967 3900 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 4900 4100 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 4900 4200 60  0001 L CNN
F 4 "2N7002NCT-ND" H 4900 4300 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002" H 4900 4400 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4900 4500 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 4900 4600 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 4900 4700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/2N7002/2N7002NCT-ND/244664" H 4900 4800 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 115MA SOT-23" H 4900 4900 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 4900 5000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4900 5100 60  0001 L CNN "Status"
	1    4700 3900
	0    1    1    0   
$EndComp
$Comp
L dk_Transistors-FETs-MOSFETs-Single:2N7002 Q2
U 1 1 6025DEE2
P 4700 4800
F 0 "Q2" V 4861 4800 60  0000 C CNN
F 1 "2N7002" V 4967 4800 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 4900 5000 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 4900 5100 60  0001 L CNN
F 4 "2N7002NCT-ND" H 4900 5200 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002" H 4900 5300 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 4900 5400 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 4900 5500 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 4900 5600 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/2N7002/2N7002NCT-ND/244664" H 4900 5700 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 115MA SOT-23" H 4900 5800 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 4900 5900 60  0001 L CNN "Manufacturer"
F 12 "Active" H 4900 6000 60  0001 L CNN "Status"
	1    4700 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 6026479A
P 4300 3650
F 0 "R2" H 4370 3696 50  0000 L CNN
F 1 "10K" H 4370 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 3650 50  0001 C CNN
F 3 "~" H 4300 3650 50  0001 C CNN
	1    4300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3600 4600 3400
Wire Wire Line
	4600 3400 4300 3400
Wire Wire Line
	4300 3400 4300 3500
Wire Wire Line
	4300 3800 4300 3900
Wire Wire Line
	4300 3900 4500 3900
Wire Wire Line
	4900 3900 5000 3900
Wire Wire Line
	5000 3900 5000 3800
Wire Wire Line
	5000 3900 6250 3900
Connection ~ 5000 3900
Wire Wire Line
	6250 4000 5250 4000
Wire Wire Line
	5250 4000 5250 4800
Wire Wire Line
	5250 4800 4950 4800
$Comp
L Device:R R4
U 1 1 6026FA3C
P 4950 4550
F 0 "R4" H 5020 4596 50  0000 L CNN
F 1 "10K" H 5020 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4880 4550 50  0001 C CNN
F 3 "~" H 4950 4550 50  0001 C CNN
	1    4950 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6026FF3B
P 4300 4550
F 0 "R3" H 4370 4596 50  0000 L CNN
F 1 "10K" H 4370 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 4550 50  0001 C CNN
F 3 "~" H 4300 4550 50  0001 C CNN
	1    4300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4500 4600 4300
Wire Wire Line
	4600 4300 4300 4300
Wire Wire Line
	4300 4300 4300 4400
Wire Wire Line
	4300 4700 4300 4800
Wire Wire Line
	4300 4800 4500 4800
Wire Wire Line
	4950 4700 4950 4800
Connection ~ 4950 4800
Wire Wire Line
	4950 4800 4900 4800
$Comp
L power:+5V #PWR012
U 1 1 60271ADA
P 5000 3400
F 0 "#PWR012" H 5000 3250 50  0001 C CNN
F 1 "+5V" H 5015 3573 50  0000 C CNN
F 2 "" H 5000 3400 50  0001 C CNN
F 3 "" H 5000 3400 50  0001 C CNN
	1    5000 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 602724FB
P 4950 4300
F 0 "#PWR011" H 4950 4150 50  0001 C CNN
F 1 "+5V" H 4965 4473 50  0000 C CNN
F 2 "" H 4950 4300 50  0001 C CNN
F 3 "" H 4950 4300 50  0001 C CNN
	1    4950 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 6027302A
P 4300 3300
F 0 "#PWR06" H 4300 3150 50  0001 C CNN
F 1 "+3.3V" H 4315 3473 50  0000 C CNN
F 2 "" H 4300 3300 50  0001 C CNN
F 3 "" H 4300 3300 50  0001 C CNN
	1    4300 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR07
U 1 1 602736EB
P 4300 4200
F 0 "#PWR07" H 4300 4050 50  0001 C CNN
F 1 "+3.3V" H 4315 4373 50  0000 C CNN
F 2 "" H 4300 4200 50  0001 C CNN
F 3 "" H 4300 4200 50  0001 C CNN
	1    4300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3400 5000 3500
Wire Wire Line
	4950 4300 4950 4400
Wire Wire Line
	4300 4200 4300 4300
Connection ~ 4300 4300
Wire Wire Line
	4300 3300 4300 3400
Connection ~ 4300 3400
Wire Wire Line
	4300 3900 3100 3900
Connection ~ 4300 3900
Wire Wire Line
	3100 3800 4100 3800
Wire Wire Line
	4100 3800 4100 4800
Wire Wire Line
	4100 4800 4300 4800
Connection ~ 4300 4800
$Comp
L power:+5V #PWR015
U 1 1 60283294
P 6850 3500
F 0 "#PWR015" H 6850 3350 50  0001 C CNN
F 1 "+5V" H 6865 3673 50  0000 C CNN
F 2 "" H 6850 3500 50  0001 C CNN
F 3 "" H 6850 3500 50  0001 C CNN
	1    6850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3500 6850 3600
$Comp
L power:GND #PWR016
U 1 1 60285553
P 6850 5150
F 0 "#PWR016" H 6850 4900 50  0001 C CNN
F 1 "GND" H 6855 4977 50  0000 C CNN
F 2 "" H 6850 5150 50  0001 C CNN
F 3 "" H 6850 5150 50  0001 C CNN
	1    6850 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 5000 6850 5150
$Comp
L power:+3.3V #PWR05
U 1 1 60286F1A
P 2400 2950
F 0 "#PWR05" H 2400 2800 50  0001 C CNN
F 1 "+3.3V" H 2415 3123 50  0000 C CNN
F 2 "" H 2400 2950 50  0001 C CNN
F 3 "" H 2400 2950 50  0001 C CNN
	1    2400 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60287831
P 2250 5900
F 0 "#PWR04" H 2250 5650 50  0001 C CNN
F 1 "GND" H 2255 5727 50  0000 C CNN
F 2 "" H 2250 5900 50  0001 C CNN
F 3 "" H 2250 5900 50  0001 C CNN
	1    2250 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5700 1900 5800
Wire Wire Line
	1900 5800 2000 5800
Wire Wire Line
	2250 5800 2250 5900
Wire Wire Line
	2000 5700 2000 5800
Connection ~ 2000 5800
Wire Wire Line
	2000 5800 2100 5800
Wire Wire Line
	2100 5700 2100 5800
Connection ~ 2100 5800
Wire Wire Line
	2100 5800 2200 5800
Wire Wire Line
	2200 5700 2200 5800
Connection ~ 2200 5800
Wire Wire Line
	2200 5800 2250 5800
Wire Wire Line
	2250 5800 2300 5800
Wire Wire Line
	2300 5800 2300 5700
Connection ~ 2250 5800
Wire Wire Line
	2300 5800 2400 5800
Wire Wire Line
	2400 5800 2400 5700
Connection ~ 2300 5800
Wire Wire Line
	2400 5800 2500 5800
Wire Wire Line
	2500 5800 2500 5700
Connection ~ 2400 5800
Wire Wire Line
	2500 5800 2600 5800
Wire Wire Line
	2600 5800 2600 5700
Connection ~ 2500 5800
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 6029D784
P 1200 1250
F 0 "J1" H 1150 950 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 1100 1050 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 1200 1250 50  0001 C CNN
F 3 "~" H 1200 1250 50  0001 C CNN
	1    1200 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6029E716
P 1600 1450
F 0 "#PWR02" H 1600 1200 50  0001 C CNN
F 1 "GND" H 1605 1277 50  0000 C CNN
F 2 "" H 1600 1450 50  0001 C CNN
F 3 "" H 1600 1450 50  0001 C CNN
	1    1600 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 6029F1B1
P 1600 850
F 0 "#PWR01" H 1600 700 50  0001 C CNN
F 1 "+5V" H 1615 1023 50  0000 C CNN
F 2 "" H 1600 850 50  0001 C CNN
F 3 "" H 1600 850 50  0001 C CNN
	1    1600 850 
	1    0    0    -1  
$EndComp
Text Label 7550 3900 0    50   ~ 0
UDPI
Text Label 800  1150 2    50   ~ 0
UDPI
Wire Wire Line
	900  1150 1000 1150
Wire Wire Line
	7450 3900 7550 3900
Wire Wire Line
	1500 1350 1600 1350
Wire Wire Line
	1600 1350 1600 1450
Wire Wire Line
	1500 1150 1600 1150
$Comp
L Device:R R8
U 1 1 602BC405
P 10550 2650
F 0 "R8" V 10343 2650 50  0000 C CNN
F 1 "1K" V 10434 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10480 2650 50  0001 C CNN
F 3 "~" H 10550 2650 50  0001 C CNN
	1    10550 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 602BCA4E
P 10950 1450
F 0 "R16" V 10743 1450 50  0000 C CNN
F 1 "1K" V 10834 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10880 1450 50  0001 C CNN
F 3 "~" H 10950 1450 50  0001 C CNN
	1    10950 1450
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 602BD65E
P 10700 1700
F 0 "D2" V 10739 1582 50  0000 R CNN
F 1 "LED" V 10648 1582 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 10700 1700 50  0001 C CNN
F 3 "~" H 10700 1700 50  0001 C CNN
	1    10700 1700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 602BEA75
P 10800 2900
F 0 "R12" H 10870 2946 50  0000 L CNN
F 1 "10K" H 10870 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10730 2900 50  0001 C CNN
F 3 "~" H 10800 2900 50  0001 C CNN
	1    10800 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 602BF281
P 11200 3250
F 0 "#PWR020" H 11200 3000 50  0001 C CNN
F 1 "GND" H 11205 3077 50  0000 C CNN
F 2 "" H 11200 3250 50  0001 C CNN
F 3 "" H 11200 3250 50  0001 C CNN
	1    11200 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 602C16FD
P 11200 1350
F 0 "#PWR019" H 11200 1200 50  0001 C CNN
F 1 "+5V" H 11215 1523 50  0000 C CNN
F 2 "" H 11200 1350 50  0001 C CNN
F 3 "" H 11200 1350 50  0001 C CNN
	1    11200 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 1450 10700 1450
Wire Wire Line
	10700 1450 10700 1550
Wire Wire Line
	11100 1450 11200 1450
Wire Wire Line
	11200 1450 11200 1550
Wire Wire Line
	10700 1850 10700 1950
Wire Wire Line
	10700 1950 11200 1950
Wire Wire Line
	11200 1950 11200 1850
Wire Wire Line
	11650 1450 11200 1450
Connection ~ 11200 1450
Wire Wire Line
	11200 1350 11200 1450
Wire Wire Line
	11650 2250 11200 2250
Connection ~ 11200 1950
Wire Wire Line
	11200 1950 11200 2250
Connection ~ 11200 2250
Wire Wire Line
	11200 2250 11200 2350
$Comp
L Device:D D7
U 1 1 602C34D1
P 11200 4250
F 0 "D7" V 11154 4330 50  0000 L CNN
F 1 "D" V 11245 4330 50  0000 L CNN
F 2 "Diode_SMD:D_MicroMELF" H 11200 4250 50  0001 C CNN
F 3 "~" H 11200 4250 50  0001 C CNN
	1    11200 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 602C34F8
P 10550 5200
F 0 "R9" V 10343 5200 50  0000 C CNN
F 1 "1K" V 10434 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10480 5200 50  0001 C CNN
F 3 "~" H 10550 5200 50  0001 C CNN
	1    10550 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 602C3502
P 10950 4000
F 0 "R17" V 10743 4000 50  0000 C CNN
F 1 "1K" V 10834 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10880 4000 50  0001 C CNN
F 3 "~" H 10950 4000 50  0001 C CNN
	1    10950 4000
	0    1    1    0   
$EndComp
$Comp
L Device:LED D3
U 1 1 602C350C
P 10700 4250
F 0 "D3" V 10739 4132 50  0000 R CNN
F 1 "LED" V 10648 4132 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 10700 4250 50  0001 C CNN
F 3 "~" H 10700 4250 50  0001 C CNN
	1    10700 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 602C3516
P 10800 5450
F 0 "R13" H 10870 5496 50  0000 L CNN
F 1 "10K" H 10870 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10730 5450 50  0001 C CNN
F 3 "~" H 10800 5450 50  0001 C CNN
	1    10800 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 602C3520
P 11200 5800
F 0 "#PWR022" H 11200 5550 50  0001 C CNN
F 1 "GND" H 11205 5627 50  0000 C CNN
F 2 "" H 11200 5800 50  0001 C CNN
F 3 "" H 11200 5800 50  0001 C CNN
	1    11200 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 602C352A
P 11200 3900
F 0 "#PWR021" H 11200 3750 50  0001 C CNN
F 1 "+5V" H 11215 4073 50  0000 C CNN
F 2 "" H 11200 3900 50  0001 C CNN
F 3 "" H 11200 3900 50  0001 C CNN
	1    11200 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4000 10700 4000
Wire Wire Line
	10700 4000 10700 4100
Wire Wire Line
	11100 4000 11200 4000
Wire Wire Line
	11200 4000 11200 4100
Wire Wire Line
	10700 4400 10700 4500
Wire Wire Line
	10700 4500 11200 4500
Wire Wire Line
	11200 4500 11200 4400
Wire Wire Line
	11650 4000 11200 4000
Connection ~ 11200 4000
Wire Wire Line
	11200 3900 11200 4000
Wire Wire Line
	11650 4800 11200 4800
Connection ~ 11200 4500
Wire Wire Line
	11200 4500 11200 4800
Connection ~ 11200 4800
Wire Wire Line
	11200 4800 11200 4900
$Comp
L Device:D D8
U 1 1 602DC71F
P 11200 6700
F 0 "D8" V 11154 6780 50  0000 L CNN
F 1 "D" V 11245 6780 50  0000 L CNN
F 2 "Diode_SMD:D_MicroMELF" H 11200 6700 50  0001 C CNN
F 3 "~" H 11200 6700 50  0001 C CNN
	1    11200 6700
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 602DC756
P 10550 7650
F 0 "R10" V 10343 7650 50  0000 C CNN
F 1 "1K" V 10434 7650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10480 7650 50  0001 C CNN
F 3 "~" H 10550 7650 50  0001 C CNN
	1    10550 7650
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 602DC760
P 10950 6450
F 0 "R18" V 10743 6450 50  0000 C CNN
F 1 "1K" V 10834 6450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10880 6450 50  0001 C CNN
F 3 "~" H 10950 6450 50  0001 C CNN
	1    10950 6450
	0    1    1    0   
$EndComp
$Comp
L Device:LED D4
U 1 1 602DC76A
P 10700 6700
F 0 "D4" V 10739 6582 50  0000 R CNN
F 1 "LED" V 10648 6582 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 10700 6700 50  0001 C CNN
F 3 "~" H 10700 6700 50  0001 C CNN
	1    10700 6700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 602DC774
P 10800 7900
F 0 "R14" H 10870 7946 50  0000 L CNN
F 1 "10K" H 10870 7855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10730 7900 50  0001 C CNN
F 3 "~" H 10800 7900 50  0001 C CNN
	1    10800 7900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 602DC77E
P 11200 8250
F 0 "#PWR024" H 11200 8000 50  0001 C CNN
F 1 "GND" H 11205 8077 50  0000 C CNN
F 2 "" H 11200 8250 50  0001 C CNN
F 3 "" H 11200 8250 50  0001 C CNN
	1    11200 8250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 602DC788
P 11200 6350
F 0 "#PWR023" H 11200 6200 50  0001 C CNN
F 1 "+5V" H 11215 6523 50  0000 C CNN
F 2 "" H 11200 6350 50  0001 C CNN
F 3 "" H 11200 6350 50  0001 C CNN
	1    11200 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 6450 10700 6450
Wire Wire Line
	10700 6450 10700 6550
Wire Wire Line
	11100 6450 11200 6450
Wire Wire Line
	11200 6450 11200 6550
Wire Wire Line
	10700 6850 10700 6950
Wire Wire Line
	10700 6950 11200 6950
Wire Wire Line
	11200 6950 11200 6850
Wire Wire Line
	11650 6450 11200 6450
Connection ~ 11200 6450
Wire Wire Line
	11200 6350 11200 6450
Wire Wire Line
	11650 7250 11200 7250
Connection ~ 11200 6950
Wire Wire Line
	11200 6950 11200 7250
Connection ~ 11200 7250
Wire Wire Line
	11200 7250 11200 7350
$Comp
L Device:D D9
U 1 1 6031DFD8
P 11200 9150
F 0 "D9" V 11154 9230 50  0000 L CNN
F 1 "D" V 11245 9230 50  0000 L CNN
F 2 "Diode_SMD:D_MicroMELF" H 11200 9150 50  0001 C CNN
F 3 "~" H 11200 9150 50  0001 C CNN
	1    11200 9150
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 6031E08F
P 10550 10100
F 0 "R11" V 10343 10100 50  0000 C CNN
F 1 "1K" V 10434 10100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10480 10100 50  0001 C CNN
F 3 "~" H 10550 10100 50  0001 C CNN
	1    10550 10100
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 6031E099
P 10950 8900
F 0 "R19" V 10743 8900 50  0000 C CNN
F 1 "1K" V 10834 8900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10880 8900 50  0001 C CNN
F 3 "~" H 10950 8900 50  0001 C CNN
	1    10950 8900
	0    1    1    0   
$EndComp
$Comp
L Device:LED D5
U 1 1 6031E0A3
P 10700 9150
F 0 "D5" V 10739 9032 50  0000 R CNN
F 1 "LED" V 10648 9032 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 10700 9150 50  0001 C CNN
F 3 "~" H 10700 9150 50  0001 C CNN
	1    10700 9150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R15
U 1 1 6031E0AD
P 10800 10350
F 0 "R15" H 10870 10396 50  0000 L CNN
F 1 "10K" H 10870 10305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10730 10350 50  0001 C CNN
F 3 "~" H 10800 10350 50  0001 C CNN
	1    10800 10350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 6031E0B7
P 11200 10700
F 0 "#PWR026" H 11200 10450 50  0001 C CNN
F 1 "GND" H 11205 10527 50  0000 C CNN
F 2 "" H 11200 10700 50  0001 C CNN
F 3 "" H 11200 10700 50  0001 C CNN
	1    11200 10700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR025
U 1 1 6031E0C1
P 11200 8800
F 0 "#PWR025" H 11200 8650 50  0001 C CNN
F 1 "+5V" H 11215 8973 50  0000 C CNN
F 2 "" H 11200 8800 50  0001 C CNN
F 3 "" H 11200 8800 50  0001 C CNN
	1    11200 8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 8900 10700 8900
Wire Wire Line
	10700 8900 10700 9000
Wire Wire Line
	11100 8900 11200 8900
Wire Wire Line
	11200 8900 11200 9000
Wire Wire Line
	10700 9300 10700 9400
Wire Wire Line
	10700 9400 11200 9400
Wire Wire Line
	11200 9400 11200 9300
Wire Wire Line
	11650 8900 11200 8900
Connection ~ 11200 8900
Wire Wire Line
	11200 8800 11200 8900
Wire Wire Line
	11650 9700 11200 9700
Connection ~ 11200 9400
Wire Wire Line
	11200 9400 11200 9700
Connection ~ 11200 9700
Wire Wire Line
	11200 9700 11200 9800
Text Label 7550 4000 0    50   ~ 0
SW_4
Text Label 7550 4100 0    50   ~ 0
SW_3
Text Label 7550 4200 0    50   ~ 0
SW_2
Text Label 6150 4200 2    50   ~ 0
SW_1
Text Label 10300 2650 2    50   ~ 0
SW_1
Text Label 10300 5200 2    50   ~ 0
SW_2
Text Label 10300 7650 2    50   ~ 0
SW_3
Text Label 10300 10100 2    50   ~ 0
SW_4
$Comp
L Device:C C1
U 1 1 602F0DE9
P 4350 1600
F 0 "C1" H 4465 1646 50  0000 L CNN
F 1 "100n" H 4465 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4388 1450 50  0001 C CNN
F 3 "~" H 4350 1600 50  0001 C CNN
	1    4350 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 602F1949
P 4350 1350
F 0 "#PWR08" H 4350 1200 50  0001 C CNN
F 1 "+5V" H 4365 1523 50  0000 C CNN
F 2 "" H 4350 1350 50  0001 C CNN
F 3 "" H 4350 1350 50  0001 C CNN
	1    4350 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 602F201F
P 4350 1850
F 0 "#PWR09" H 4350 1600 50  0001 C CNN
F 1 "GND" H 4355 1677 50  0000 C CNN
F 2 "" H 4350 1850 50  0001 C CNN
F 3 "" H 4350 1850 50  0001 C CNN
	1    4350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1350 4350 1450
Wire Wire Line
	4350 1750 4350 1850
Text Notes 4400 1450 0    50   ~ 0
Decoupling capacitor.\nShould be close to power pins.
$Comp
L Device:R R1
U 1 1 60372D04
P 1250 950
F 0 "R1" V 1043 950 50  0000 C CNN
F 1 "10K" V 1134 950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1180 950 50  0001 C CNN
F 3 "~" H 1250 950 50  0001 C CNN
	1    1250 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 950  900  950 
Wire Wire Line
	900  950  900  1150
Wire Wire Line
	800  1150 900  1150
Connection ~ 900  1150
Wire Wire Line
	1400 950  1600 950 
Wire Wire Line
	1600 950  1600 1150
Wire Wire Line
	1600 850  1600 950 
Connection ~ 1600 950 
Text Notes 8500 1250 0    50   ~ 0
- LED is indication that the relay is ON\n- Flyback diode is to prevent huge voltage spikes\n- 10K resistor to ground the input of the transistor
Text Notes 3550 3050 0    50   ~ 0
The voltage signal comming from Raspberry Pi is 3.3V.\nThe AVR microcontroller operates at 5V.\nUse Level Shifter to step-up 3.3V signal to 5V, and step-down\n5V signal to 3.3V. 
$Comp
L Mechanical:MountingHole H1
U 1 1 605137FF
P 850 6450
F 0 "H1" H 950 6496 50  0000 L CNN
F 1 "MountingHole" H 950 6405 50  0000 L CNN
F 2 "ab_common_prototype_lib:Mounting_hole_2.7_6.2" H 850 6450 50  0001 C CNN
F 3 "~" H 850 6450 50  0001 C CNN
	1    850  6450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 605154B6
P 850 6650
F 0 "H2" H 950 6696 50  0000 L CNN
F 1 "MountingHole" H 950 6605 50  0000 L CNN
F 2 "ab_common_prototype_lib:Mounting_hole_2.7_6.2" H 850 6650 50  0001 C CNN
F 3 "~" H 850 6650 50  0001 C CNN
	1    850  6650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 60516140
P 850 6850
F 0 "H3" H 950 6896 50  0000 L CNN
F 1 "MountingHole" H 950 6805 50  0000 L CNN
F 2 "ab_common_prototype_lib:Mounting_hole_2.7_6.2" H 850 6850 50  0001 C CNN
F 3 "~" H 850 6850 50  0001 C CNN
	1    850  6850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 60516501
P 850 7050
F 0 "H4" H 950 7096 50  0000 L CNN
F 1 "MountingHole" H 950 7005 50  0000 L CNN
F 2 "ab_common_prototype_lib:Mounting_hole_2.7_6.2" H 850 7050 50  0001 C CNN
F 3 "~" H 850 7050 50  0001 C CNN
	1    850  7050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 6028651F
P 2150 2900
F 0 "#PWR03" H 2150 2750 50  0001 C CNN
F 1 "+5V" H 2165 3073 50  0000 C CNN
F 2 "" H 2150 2900 50  0001 C CNN
F 3 "" H 2150 2900 50  0001 C CNN
	1    2150 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 60A0E7E6
P 7550 1800
F 0 "D1" V 7589 1682 50  0000 R CNN
F 1 "LED" V 7498 1682 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 7550 1800 50  0001 C CNN
F 3 "~" H 7550 1800 50  0001 C CNN
	1    7550 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 60A0EEEA
P 7550 1400
F 0 "R7" V 7343 1400 50  0000 C CNN
F 1 "1K" V 7434 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7480 1400 50  0001 C CNN
F 3 "~" H 7550 1400 50  0001 C CNN
	1    7550 1400
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 60A0F5C4
P 7550 1150
F 0 "#PWR017" H 7550 1000 50  0001 C CNN
F 1 "+5V" H 7565 1323 50  0000 C CNN
F 2 "" H 7550 1150 50  0001 C CNN
F 3 "" H 7550 1150 50  0001 C CNN
	1    7550 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 60A0FC90
P 7550 2050
F 0 "#PWR018" H 7550 1800 50  0001 C CNN
F 1 "GND" H 7555 1877 50  0000 C CNN
F 2 "" H 7550 2050 50  0001 C CNN
F 3 "" H 7550 2050 50  0001 C CNN
	1    7550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1950 7550 2050
Wire Wire Line
	7550 1550 7550 1650
Wire Wire Line
	7550 1150 7550 1250
Text Notes 7750 2000 0    50   ~ 0
Power indicator circuit
Wire Wire Line
	2200 3000 2200 3100
Wire Wire Line
	2100 3100 2100 3000
Wire Wire Line
	2100 3000 2150 3000
Wire Wire Line
	6250 4200 6150 4200
Wire Wire Line
	2400 3100 2400 2950
Wire Wire Line
	7450 4000 7550 4000
Wire Wire Line
	7450 4100 7550 4100
$Comp
L ab_common_prototype:J0971C RL1
U 1 1 60685BA0
P 11850 1850
F 0 "RL1" H 12278 1896 50  0000 L CNN
F 1 "J0971C" H 12250 1800 50  0000 L CNN
F 2 "ab_common_prototype_lib:J0971C" H 11850 1850 50  0001 C CNN
F 3 "" H 11850 1850 50  0001 C CNN
	1    11850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 1450 11650 1550
Wire Wire Line
	11650 2150 11650 2250
$Comp
L ab_common_prototype:J0971C RL2
U 1 1 606D6222
P 11850 4400
F 0 "RL2" H 12250 4450 50  0000 L CNN
F 1 "J0971C" H 12250 4350 50  0000 L CNN
F 2 "ab_common_prototype_lib:J0971C" H 11850 4400 50  0001 C CNN
F 3 "" H 11850 4400 50  0001 C CNN
	1    11850 4400
	1    0    0    -1  
$EndComp
$Comp
L ab_common_prototype:J0971C RL3
U 1 1 606D7760
P 11850 6850
F 0 "RL3" H 12250 6900 50  0000 L CNN
F 1 "J0971C" H 12250 6800 50  0000 L CNN
F 2 "ab_common_prototype_lib:J0971C" H 11850 6850 50  0001 C CNN
F 3 "" H 11850 6850 50  0001 C CNN
	1    11850 6850
	1    0    0    -1  
$EndComp
$Comp
L ab_common_prototype:J0971C RL4
U 1 1 606D8A50
P 11850 9300
F 0 "RL4" H 12250 9350 50  0000 L CNN
F 1 "J0971C" H 12250 9250 50  0000 L CNN
F 2 "ab_common_prototype_lib:J0971C" H 11850 9300 50  0001 C CNN
F 3 "" H 11850 9300 50  0001 C CNN
	1    11850 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 4000 11650 4100
Wire Wire Line
	11650 4700 11650 4800
Wire Wire Line
	12150 4800 12150 4700
Wire Wire Line
	11950 4700 11950 4900
Wire Wire Line
	12050 4100 12050 4000
Wire Wire Line
	11650 6550 11650 6450
Wire Wire Line
	11650 7150 11650 7250
Wire Wire Line
	12050 6450 12050 6550
Wire Wire Line
	12150 7250 12150 7150
Wire Wire Line
	11950 7150 11950 7350
Wire Wire Line
	11650 8900 11650 9000
Wire Wire Line
	11650 9600 11650 9700
Wire Wire Line
	12050 8900 12050 9000
Wire Wire Line
	12150 9600 12150 9700
Wire Wire Line
	11950 9800 11950 9600
Wire Wire Line
	7550 4200 7450 4200
Wire Wire Line
	2150 2900 2150 3000
Connection ~ 2150 3000
Wire Wire Line
	2150 3000 2200 3000
$Comp
L power:GND #PWR013
U 1 1 60B460F5
P 5350 6650
F 0 "#PWR013" H 5350 6400 50  0001 C CNN
F 1 "GND" H 5355 6477 50  0000 C CNN
F 2 "" H 5350 6650 50  0001 C CNN
F 3 "" H 5350 6650 50  0001 C CNN
	1    5350 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 60B46B02
P 4750 6350
F 0 "#PWR010" H 4750 6200 50  0001 C CNN
F 1 "+5V" H 4765 6523 50  0000 C CNN
F 2 "" H 4750 6350 50  0001 C CNN
F 3 "" H 4750 6350 50  0001 C CNN
	1    4750 6350
	1    0    0    -1  
$EndComp
Text Label 7550 4300 0    50   ~ 0
CH1_ADC
Text Label 7550 4400 0    50   ~ 0
CH2_ADC
Text Label 7550 4500 0    50   ~ 0
CH3_ADC
Text Label 7550 4600 0    50   ~ 0
CH4_ADC
Wire Wire Line
	7450 4300 7550 4300
Wire Wire Line
	7550 4400 7450 4400
Wire Wire Line
	7550 4500 7450 4500
Wire Wire Line
	7550 4600 7450 4600
Text Label 5350 6350 2    50   ~ 0
CH1_ADC
Text Label 5350 6250 2    50   ~ 0
CH2_ADC
Text Label 5350 6150 2    50   ~ 0
CH3_ADC
Text Label 5350 6050 2    50   ~ 0
CH4_ADC
Wire Wire Line
	4750 6450 4750 6350
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 6070BBA4
P 5650 6350
F 0 "J3" H 5622 6232 50  0000 R CNN
F 1 "Conn_01x06_Male" H 5622 6323 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 5650 6350 50  0001 C CNN
F 3 "~" H 5650 6350 50  0001 C CNN
	1    5650 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 6650 5350 6550
Wire Wire Line
	5450 6050 5350 6050
Wire Wire Line
	5350 6150 5450 6150
Wire Wire Line
	5450 6250 5350 6250
Wire Wire Line
	5450 6350 5350 6350
Wire Wire Line
	5450 6450 4750 6450
Wire Wire Line
	5350 6550 5450 6550
$Comp
L dk_Transistors-FETs-MOSFETs-Single:2N7002 Q3
U 1 1 607ED426
P 11200 2550
F 0 "Q3" V 11361 2550 60  0000 C CNN
F 1 "2N7002" V 11467 2550 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 11400 2750 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 2850 60  0001 L CNN
F 4 "2N7002NCT-ND" H 11400 2950 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002" H 11400 3050 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 11400 3150 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 11400 3250 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 3350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/2N7002/2N7002NCT-ND/244664" H 11400 3450 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 115MA SOT-23" H 11400 3550 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 11400 3650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11400 3750 60  0001 L CNN "Status"
	1    11200 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 2650 10400 2650
Wire Wire Line
	10700 2650 10800 2650
Wire Wire Line
	10800 2750 10800 2650
Connection ~ 10800 2650
Wire Wire Line
	10800 2650 10900 2650
Wire Wire Line
	11200 2750 11200 3150
Wire Wire Line
	10800 3050 10800 3150
Wire Wire Line
	10800 3150 11200 3150
Connection ~ 11200 3150
Wire Wire Line
	11200 3150 11200 3250
$Comp
L dk_Transistors-FETs-MOSFETs-Single:2N7002 Q4
U 1 1 60838E22
P 11200 5100
F 0 "Q4" V 11361 5100 60  0000 C CNN
F 1 "2N7002" V 11467 5100 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 11400 5300 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 5400 60  0001 L CNN
F 4 "2N7002NCT-ND" H 11400 5500 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002" H 11400 5600 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 11400 5700 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 11400 5800 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 5900 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/2N7002/2N7002NCT-ND/244664" H 11400 6000 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 115MA SOT-23" H 11400 6100 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 11400 6200 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11400 6300 60  0001 L CNN "Status"
	1    11200 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 5200 10400 5200
Wire Wire Line
	10700 5200 10800 5200
Wire Wire Line
	10800 5300 10800 5200
Connection ~ 10800 5200
Wire Wire Line
	10800 5200 10900 5200
Wire Wire Line
	11200 5300 11200 5700
Wire Wire Line
	10800 5600 10800 5700
Wire Wire Line
	10800 5700 11200 5700
Connection ~ 11200 5700
Wire Wire Line
	11200 5700 11200 5800
$Comp
L dk_Transistors-FETs-MOSFETs-Single:2N7002 Q5
U 1 1 60874E69
P 11200 7550
F 0 "Q5" V 11361 7550 60  0000 C CNN
F 1 "2N7002" V 11467 7550 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 11400 7750 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 7850 60  0001 L CNN
F 4 "2N7002NCT-ND" H 11400 7950 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002" H 11400 8050 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 11400 8150 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 11400 8250 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 8350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/2N7002/2N7002NCT-ND/244664" H 11400 8450 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 115MA SOT-23" H 11400 8550 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 11400 8650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11400 8750 60  0001 L CNN "Status"
	1    11200 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 7650 10800 7650
Wire Wire Line
	10800 7750 10800 7650
Connection ~ 10800 7650
Wire Wire Line
	10800 7650 10700 7650
Wire Wire Line
	10400 7650 10300 7650
Wire Wire Line
	11200 7750 11200 8150
Wire Wire Line
	10800 8050 10800 8150
Wire Wire Line
	10800 8150 11200 8150
Connection ~ 11200 8150
Wire Wire Line
	11200 8150 11200 8250
$Comp
L dk_Transistors-FETs-MOSFETs-Single:2N7002 Q6
U 1 1 608B14D8
P 11200 10000
F 0 "Q6" V 11361 10000 60  0000 C CNN
F 1 "2N7002" V 11467 10000 60  0000 C CNN
F 2 "digikey-footprints:SOT-23-3" H 11400 10200 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 10300 60  0001 L CNN
F 4 "2N7002NCT-ND" H 11400 10400 60  0001 L CNN "Digi-Key_PN"
F 5 "2N7002" H 11400 10500 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 11400 10600 60  0001 L CNN "Category"
F 7 "Transistors - FETs, MOSFETs - Single" H 11400 10700 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 11400 10800 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/2N7002/2N7002NCT-ND/244664" H 11400 10900 60  0001 L CNN "DK_Detail_Page"
F 10 "MOSFET N-CH 60V 115MA SOT-23" H 11400 11000 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 11400 11100 60  0001 L CNN "Manufacturer"
F 12 "Active" H 11400 11200 60  0001 L CNN "Status"
	1    11200 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 10200 11200 10600
Wire Wire Line
	10800 10200 10800 10100
Wire Wire Line
	10800 10100 10900 10100
Wire Wire Line
	10700 10100 10800 10100
Connection ~ 10800 10100
Wire Wire Line
	10400 10100 10300 10100
Wire Wire Line
	10800 10500 10800 10600
Wire Wire Line
	10800 10600 11200 10600
Connection ~ 11200 10600
Wire Wire Line
	11200 10600 11200 10700
$Comp
L Connector:Screw_Terminal_01x12 J4
U 1 1 60E4600C
P 14950 5550
F 0 "J4" H 15030 5542 50  0000 L CNN
F 1 "Screw_Terminal_01x12" H 15030 5451 50  0000 L CNN
F 2 "TerminalBlock_4Ucon:TerminalBlock_4Ucon_1x12_P3.50mm_Horizontal" H 14950 5550 50  0001 C CNN
F 3 "~" H 14950 5550 50  0001 C CNN
	1    14950 5550
	1    0    0    -1  
$EndComp
Text Label 14650 5250 2    50   ~ 0
relay1_com
Text Label 14650 5150 2    50   ~ 0
relay1_nc
Text Label 14650 5050 2    50   ~ 0
relay1_no
Wire Wire Line
	14650 5050 14750 5050
Wire Wire Line
	14650 5150 14750 5150
Wire Wire Line
	14650 5250 14750 5250
Text Label 12400 1450 0    50   ~ 0
relay1_com
Text Label 12400 2350 0    50   ~ 0
relay1_nc
Text Label 12400 2250 0    50   ~ 0
relay1_no
Wire Wire Line
	12400 1450 12050 1450
Wire Wire Line
	12050 1450 12050 1550
Wire Wire Line
	12400 2250 12150 2250
Wire Wire Line
	12150 2250 12150 2150
Wire Wire Line
	12400 2350 11950 2350
Wire Wire Line
	11950 2150 11950 2350
Text Label 14650 5550 2    50   ~ 0
relay2_com
Text Label 14650 5450 2    50   ~ 0
relay2_nc
Text Label 14650 5350 2    50   ~ 0
relay2_no
Wire Wire Line
	14650 5350 14750 5350
Wire Wire Line
	14750 5450 14650 5450
Wire Wire Line
	14750 5550 14650 5550
Text Label 14650 5850 2    50   ~ 0
relay3_com
Text Label 14650 5750 2    50   ~ 0
relay3_nc
Text Label 14650 5650 2    50   ~ 0
relay3_no
Wire Wire Line
	14650 5850 14750 5850
Wire Wire Line
	14650 5750 14750 5750
Wire Wire Line
	14650 5650 14750 5650
Text Label 14650 6150 2    50   ~ 0
relay4_com
Text Label 14650 6050 2    50   ~ 0
relay4_nc
Text Label 14650 5950 2    50   ~ 0
relay4_no
Wire Wire Line
	14650 5950 14750 5950
Wire Wire Line
	14650 6050 14750 6050
Wire Wire Line
	14650 6150 14750 6150
Text Label 12400 4000 0    50   ~ 0
relay2_com
Text Label 12400 4900 0    50   ~ 0
relay2_nc
Text Label 12400 4800 0    50   ~ 0
relay2_no
Wire Wire Line
	12050 4000 12400 4000
Wire Wire Line
	12150 4800 12400 4800
Wire Wire Line
	11950 4900 12400 4900
Text Label 12400 6450 0    50   ~ 0
relay3_com
Text Label 12400 7350 0    50   ~ 0
relay3_nc
Text Label 12400 7250 0    50   ~ 0
relay3_no
Wire Wire Line
	12050 6450 12400 6450
Wire Wire Line
	12150 7250 12400 7250
Wire Wire Line
	12400 7350 11950 7350
Text Label 12400 8900 0    50   ~ 0
relay4_com
Text Label 12400 9800 0    50   ~ 0
relay4_nc
Text Label 12400 9700 0    50   ~ 0
relay4_no
Wire Wire Line
	12400 8900 12050 8900
Wire Wire Line
	12400 9700 12150 9700
Wire Wire Line
	12400 9800 11950 9800
Text Notes 5400 4450 0    50   ~ 0
Pin 7 (PB2) pulled-up\n programatically
NoConn ~ 6250 4100
$EndSCHEMATC
