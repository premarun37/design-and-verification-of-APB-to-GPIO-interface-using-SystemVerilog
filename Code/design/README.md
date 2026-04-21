# Design Module (DUT)

## Overview
This folder contains the RTL design of an APB-based GPIO module implemented in SystemVerilog.

## Description
The DUT (Device Under Test) models a simple GPIO peripheral connected via the APB protocol. It supports:
- Write operation to update GPIO output register
- Read operation to return predefined GPIO input data

## Key Features
- APB protocol compliant (basic handshake)
- Synchronous design using `always_ff`
- Active-low reset (`PRESETn`)
- 8-bit GPIO interface

## Files
- `design.sv` – Contains DUT implementation

## Functionality
- On **write**: Updates `gpio_out` using `PWDATA`
- On **read**: Returns `gpio_in` through `PRDATA`

## Notes
- Tri-state behavior is avoided for `PRDATA` (not required in APB)
- Designed for verification using a SystemVerilog testbench
