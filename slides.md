---
author: Daniel Maslowski
title: Extracting Firmware
---

## Agenda

- Introduction
- Motivation
- Loading Firmware
- Obtaining Firmware
- Extraction

# Introduction

## What is firmware?

Firmware is...

* what initializes a device or platform, setting up registers
* what comes before a bootloader on servers, laptops and phones
* sometimes a little OS for itself with services and interfaces

... like a matryoshka, actually, packed and compressed. :)

![Matryoshka](img/matryoshka.png)

source: [https://commons.wikimedia.org/wiki/File:Matryoshka_transparent.png](https://commons.wikimedia.org/wiki/File:Matryoshka_transparent.png)

# Motivation

## Disassemble all the things!

One might wish/need to...

- audit the firmware of a device in their infrastructure
- debug issues that are hard to locate
- fix issues that their vendor is not fixing
- reverse engineer the firmware of a device they own
- deploy custom firmware entirely

### For inspection, firmware needs to be extracted.

# Loading Firmware

## How does an MCU get its firmware?

- often starts with mask ROM aka boot ROM
- loads (additional) firmware into RAM
    * wich is sometimes passed from another SoC/MCU

## How else can we load firmware?

- emulator/simulator, e.g., QEMU, ...
- debugger (sometimes attached to an emulator), e.g., GDB
- RE tools, e.g., radare2, Ghidra, Panopticon, ...

https://recon.cx/2018/brussels/resources/slides/RECON-BRX-2018-DIY-ARM-Debugger-for-Wi-Fi-Chips.pdf

# Obtaining Firmware

## Simple Ways

- download update file from vendor
    * may need extraction ;)
    * sometimes additional URLs found in updaters
- obtain from device

## Interfaces

- direct hardware
    * UART (universal asynchronous receiver/transmitter)
    * I2C inter-integrated circuit)
    * SPI (serial peripheral interface)
    * LPC (low pin count)
    * ISP
    * JTAG
    * proprietary debug ports (meh!)
- through other chips on the board
- networking
- existing software/firmware interfaces

## Network Protocols

- SSH/SCP/SFTP (OpenSSH)
- Telnet
- HTTP (Insomnia, Postman, curl)
    * possibly RCE in web interface ;)
- plain TCP/UDP (`nc`, Packet Sender)

## Software Tools

- flashrom
- esptool
- avrdude
- mtktool (??)
- rktool (??)
- proprietary vendor tools (meh!)
- mtdxxx (!!!TODO!!!)

# Extraction

## Investigation

### In live systems

- `dmesg`
- `/proc/cpuinfo`
- `/dev/*`

### outside

- `strings image.bin | less`
- `xxd image.bin | less`
- split with `dd` :)

## Deobfuscation

- Huffman tables
- simple XORs
- shifts

## Software Tools

### Archivers

- tar
- unzip
- unxz

### Installers

- innoextract
- 7z

### Linux systems

- cpio
- unsquashfs

### Last resort

- binwalk

## x86 Firmware

### UEFI images

- ifdtool
- UEFITool
- utk (Fiano)

### PSP binaries

- psptool

### ME binaries

- MEAnalyzer
- unme11/unme12

### ELF binaries

- objdump

## Processor Architectures

- 8051
- x86
- MIPS
- ARM
