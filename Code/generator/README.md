# Generator

## Overview
Generates randomized transactions and sends them to the driver.

## Description
The Generator creates a predefined number of randomized transactions and passes them via mailbox.

## Key Features
- Random transaction generation
- Uses mailbox for communication
- Signals completion using event

## Files
- `generator.sv`

## Functionality
- Creates `num_tx` transactions
- Randomizes each transaction
- Sends to driver using `gen2drv` mailbox
- Triggers `done` event after completion

## Communication
- Output → Driver via mailbox

## Notes
- Helps simulate different APB scenarios
