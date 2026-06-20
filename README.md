# RISC-V RV32I CPU Core

A 32-bit RISC-V (RV32I) processor with a classic 5-stage pipeline, implemented in Verilog and verified in Xilinx Vivado for an Artix-7 (Basys-3) target.

## Features
- 5-stage pipeline: Fetch → Decode → Execute → Memory → Writeback
- RV32I base integer instruction set
- Hazard unit with data forwarding and load-use stall detection
- Per-stage testbenches verified in Vivado behavioral simulation

## Repository Structure
- `rtl/` — Verilog RTL modules (fetch, decode, execute, memory, writeback, hazard_unit, core)
- `sim/testbenches/` — testbenches for each stage
- `docs/` — design documentation

## Getting Started
1. Open the Vivado project (Artix-7, xc7a35t target).
2. Run behavioral simulation: Flow → Run Simulation.
3. Testbenches for each pipeline stage are in `sim/testbenches/`.

## Synthesis & Implementation
To be added after running synthesis/implementation in Vivado (target frequency, LUT/FF utilisation on Artix-7).

## Author
Shreya Das
