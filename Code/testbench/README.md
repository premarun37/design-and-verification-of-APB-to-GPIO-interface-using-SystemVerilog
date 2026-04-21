# Testbench

## Overview
Top-level testbench integrating all verification components.

## Description
This module instantiates DUT, interface, and verification components, and controls simulation flow.

## Components
- Generator
- Driver
- Monitor
- DUT
- APB Interface

## Files
- `testbench.sv`

## Features
- Clock generation (100 MHz)
- Reset sequencing
- Mailbox-based communication
- Parallel execution using `fork-join`

## Simulation Flow
1. Reset applied
2. Generator creates transactions
3. Driver applies transactions to DUT
4. Monitor observes activity
5. Simulation ends after completion

## Output
- VCD waveform file
- Console logs

## Notes
- Uses event-driven synchronization
- Structured similar to UVM-lite environment
