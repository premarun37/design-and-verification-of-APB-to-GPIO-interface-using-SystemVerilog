# Monitor

## Overview
Observes DUT activity and logs APB transactions.

## Description
The Monitor passively samples signals from the APB interface and prints observed behavior.

## Key Features
- Passive component (no driving)
- Observes real signal activity
- Supports both read and write monitoring

## Files
- `monitor.sv`

## Functionality
- Samples signals at every clock edge
- Detects valid APB transactions (`PSEL && PENABLE`)
- Logs:
  - Address
  - Write data
  - Read data

## Benefits
- Helps debug DUT behavior
- Provides visibility into signal-level activity

## Notes
- Can be extended to include scoreboard or coverage
