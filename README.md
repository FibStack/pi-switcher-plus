# PiSwitcher Plus

![PiSwitcher Plus](images/piswitcher_plus.jpg?raw=true "PiSwitcher Plus")

## Overview

The **FibStack PiSwitcher Plus** board was designed to help you in your next automation project. 

The board has four high-quality relays allowing it to switch high voltage and currents. Controlling a steam iron or an oven is not the right task for the board, but it will handle most home appliances below 1200W. Each relay has an LED indicator showing when the NO (Normal Open) contact is connected to the COM (Common).

Additionally, the board has four 12-bit ADC channels that can convert electric signals up to 5 volts. The converted value allows more flexibility in the automation decision logic.

The FibStack Dashboard allows testing things on the fly without writing any code. Alternatively, you can control the board using the CLI tool or programmatically using provided libraries.
See the [Documentation](#documentation) section below for links to Getting Started guide and references.

## WARNING
**WARNING. Hazard of severe electrical shock or burn when using High Voltage/Current applications. Obey High Voltage/Current safety procedures. FibStack is not responsible for any damage or injury that occurs from improper High Voltage use.**

## Architecture

![PiSwitcher Plus Architecture Diagram](images/arch_diagram.png?raw=true "PiSwitcher Plus Architecture Diagram")

On the PiSwitcher Plus board, the ATTiny824 microcontroller receives commands from the RaspberryPi board through the I2C interface. 
The software package facilitates communication between the Raspberry Pi and the PiSwitcher Plus board. 

The `libfibstack` library is used by any library or tool directly or indirectly.
You can use the `libfistack` library directly in your C project. Please consult the [C API Reference](https://fibstack.com/piswitcher/c_api_ref/).

The `fibstackcli` is a convenient tool to get device statuses and switch relays from the command lines.

The `fibstacklib_cffi` is a Python wrapper around the `libfistack` library. We provide a `fibstacklibpy` library for convenience if you want to use it in your Python projects. See the [Python API Reference](https://fibstack.com/piswitcher/py_api_ref/).

The FibStack Dashboard is a convenient web-based UI tool that allows you to control the PiSwitcher Plus board. It consists of the back-end python script and a front-end project that uses Angular.

## Project organization

- **piswitcher_plus_board/**: this folder is a KiCAD project that contains FibStack PiSwitcher Plus board schematics and PCB layout files.
- **software/attiny824_switch_adc_board/**: This folder contains the Microchip Studio project with the source files for the ATTiny824 microcontroller. Note that the build will create the *.hex and *.eep files. Flash the ATTiny program memory with the *.hex file and the EEPROM memory with the *.eep file.
- **software/libfibstack/**: C library containing data structures and functions to communicate with the PiSwitcher Plus board.
- **software/fibstackcli/**: This folder contains the CLI tool source code.
- **software/fibstacklib_cffi/**: This folder contains the source code for the `libfibstack` library wrapper for Python.
- **software/fibstacklibpy/**: The Python library source code.
- **software/py_webapp/**: This folder contains the source code for the back-end service.
- **software/ng-webapp/**: This folder contains the source code for the FibStack Dashboard UI. The project uses Typescript and Angular framework.
- **software/installer/**: This folder contains scripts to install and uninstall the software package on the Raspberry Pi OS. The information on how to create the installation package will be added later.


## Development tools

- **[Microchip Studio 7.0](https://www.microchip.com/en-us/tools-resources/develop/microchip-studio)**: The IDE for writing and building source code for the ATTiny chip. We also use this tool to flash the chips.
- **[ATMEL-ICE](https://www.microchip.com/en-us/development-tool/ATATMEL-ICE)**: Hardware tool for flashing program and EEPROM memories.
- **[Python CFFI](https://cffi.readthedocs.io/en/latest)**: The Python wrapper library to build the `fibstacklib_cffi` project.
- **[Angular CLI 11.1.1](https://angular.io/cli)** To develop and build Angular projects.
- **Python 3.7 and up**
- Raspberry Pi OS **GCC** compiler

## BOM

| # | Components | Recommended models | Footprint | Quantity |
| --- | --- | --- | --- | --- |
| 1 | PCB | Recommended two-layer PCB board of 1.6 mm thickness | | 1 |
| 2 | U1 | ATTiny824-SSU | SOIC-14 package, 3.9x8.7mm pitch: 1.27mm | 1 |
| 3 | C1 | Any 100nF 50V SMD capacitor | 0805 (2012 metric) | 1 |
| 4 | Q1 - Q6 | 2N7002 N-channel MOSFET transistor, 60V 300mA | SOT-23-2| 6 |
| 5 | RL1 - RL4 | General purpose SPDT 5VDC relay. Recommended models J0971C, YX201-S-105D, or similar. | J0971C | 4 |
| 6 | D1 | SMD LED RED | 0603 (1608 metric) | 1 |
| 7 | D2, D3, D6, D7 | SMD LED GREEN | 0603 (1608 metric) | 4 |
| 8 | D4, D5, D8, D9 | Any general purpose SMD Diode, 75V, 200mA | MicroMELF | 4 |
| 9 | R1, R2, R3, R4, R5, R9, R10, R15, R16 | Any 10K 5% 1/4W SMD Resistor | 0603 (1608 metric) | 9 |
| 10 | R6, R7, R8, R11, R12, R13, R14, R17, R18 | Any 1K 5% 1/4W SMD Resistor | 0603 (1608 metric) | 9 |
| 11 | J1 | Extended GPIO Male Female Header, 2x20, pitch 2.54mm | 2x20 - P2.54mm | 1 |
| 12 | J2 | Optional, Male Header Connector, 2x3, pitch 2.54mm | 2x3 - P2.54mm | 1 |
| 13 | J3 | Male Header Connector, 1x6, pitch 2.54mm | 1x6 - P2.54mm | 1 |
| 14 | J4 | Screw Terminal Block 1x12, Pitch 3.5mm. Alternatively, you can use two of 1x6, three of 1x4, or four of 1x3. | 1x12 - P3.5mm | 1|


For the Extended GPIO Male Female header connector (J1), we recommend using a component as shown in the figure below. The female part has a height of 8.5mm plus two plastic pieces of 2.5mm. The female part is placed on the bottom of the board and soldered on the top of the board. The male pins should be 9.8mm or longer to allow an additional expansion board to be connected.

![Extended GPIO Header Connector](images/gpio_header.png?raw=true "Extended GPIO Header Connector")


## Documentation
 - **[Project Home Page](https://fibstack.com/projects/piswitcher/)**
 - **[Getting Started Guide](https://fibstack.com/projects/piswitcher/get_started/)**
 - **[CLI Interface Tool](https://fibstack.com/projects/piswitcher/cli/)**
 - **[FibStack Dashboard](https://fibstack.com/projects/piswitcher/dashboard/)**
 - **[C API Reference](https://fibstack.com/projects/piswitcher/c_api_ref/)**
 - **[Python API Reference](https://fibstack.com/projects/piswitcher/py_api_ref/)**

## I2C Protocol

The software package communicates with PiSwitcher Plus through the I2C (or IIC, TWI) interface. Theoretically, you can send the instructions from any device that supports the I2C interface.
We developed a simple protocol that uses only five commands for now. 
You can write your software to control the board using the commands below.

| # | Command | Description |
| --- | --- | --- |
| 1 | `version` | Returns a constant string from the board that represents the Firmware/Hardware version. |
| 2 | `setaddr:<new_address_value>` | Set the PiSwitcher Plus board I2C address. The valid address value should be an integer between 3 and 119. |
| 3 | `status` | Returns a set of values delimited by a colon `:`. Each value represents a device value. The first four values represent the Relay values, `1 `means the relay's coil is energized, `0` otherwise. The last four values represent the values from ADC channels. Example: `0:1:1:0:120:1023:0:785`. |
| 4 | `get:<device_id>` | Returns the value (status) for the specified device. The relay devices IDs are from 0 to 3 inclusive. The ADC channel device IDs are from 4 to 7 inclusive. |
| 5 | `set:<device_id>:<value>` | Sets the value for the specified device. This command is used to switch relay devices on the PiSwitcher Plus board. The `set` command doesn't work for ADC devices as they are Read-Only. The valid values for the `device_id` are from 0 to 3 inclusive. The possible values are 0 and 1. |

## License Information
This product is open source!

Please review the LICENSE.md file for license information. Distributed as-is; no warranty is given.
