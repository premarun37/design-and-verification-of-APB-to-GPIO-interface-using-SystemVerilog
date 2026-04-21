# APB Interface

## Overview
This folder contains the SystemVerilog interface for the APB protocol.

## Description
The `apb_if` interface encapsulates all APB signals and provides reusable tasks for read and write operations.

## Key Features
- Encapsulates APB signals:
  - `PADDR`, `PWDATA`, `PRDATA`
  - `PSEL`, `PENABLE`, `PWRITE`, `PREADY`
- Provides abstraction using tasks
- Simplifies driver implementation

## Files
- `apb_if.sv` – Interface definition with tasks

## Tasks
### apb_write(addr, data)
- Performs APB write transaction

### apb_read(addr)
- Performs APB read transaction

## Benefits
- Reduces code duplication
- Improves modularity
- Enables clean connection using virtual interface
