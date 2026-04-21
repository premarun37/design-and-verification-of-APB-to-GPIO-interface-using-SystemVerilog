# Driver

## Overview
Drives transactions onto the DUT using the APB interface.

## Description
The Driver receives transactions from the generator and converts them into pin-level activity using the APB interface.

## Key Features
- Uses virtual interface (`apb_if`)
- Supports both read and write operations
- Communicates with monitor

## Files
- `driver.sv`

## Functionality
- Receives transaction from `gen2drv`
- Executes:
  - `apb_write()` for write
  - `apb_read()` for read
- Sends transaction to monitor via `drv2mon`

## Communication
- Input  ← Generator
- Output → Monitor

## Notes
- Acts as bridge between high-level transactions and DUT signals
