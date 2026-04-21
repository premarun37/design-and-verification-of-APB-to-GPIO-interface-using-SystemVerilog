# Transaction Class

## Overview
Defines the transaction-level abstraction used for communication between generator and driver.

## Description
The `Transaction` class represents a single APB operation (read or write).

## Fields
- `addr`  : Address for transaction
- `data`  : Data for write operations
- `rw`    : Operation type
  - `0` → Write
  - `1` → Read

## Features
- Randomized fields using `rand`
- Constraint for balanced read/write distribution
- Display method for debugging

## Files
- `transaction.sv`

## Purpose
- Enables stimulus generation
- Acts as data packet between components
