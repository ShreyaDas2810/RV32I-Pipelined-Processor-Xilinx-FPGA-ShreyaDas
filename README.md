# RISC-V 32-bit CPU Core

A 5-stage pipelined RISC-V RV32I processor implemented in Verilog for Xilinx Artix-7 FPGAs.

## Features
- 5-stage pipeline (Fetch → Decode → Execute → Memory → Writeback)
- Full RV32I ISA support
- Hazard detection and data forwarding
- Synthesizable for FPGA (Basys-3)

## Project Structure
- `rtl/` - Verilog RTL modules
- `sim/` - Testbenches and simulation files
- `docs/` - Design documentation and diagrams
- `vivado/` - Vivado project files

## Getting Started
1. Open `vivado/risc-v-core.xpr` in Vivado
2. Run behavioral simulation: Flow → Run Simulation
3. Check `sim/` for testbench files

## Synthesis Results
(Will update after synthesis)

## Author
Shreya Das
 
A 5-stage pipelined RISC-V RV32I processor implemented in Verilog for Xilinx Artix-7 FPGAs. 
 
- 5-stage pipeline with hazard detection 
- Full RV32I ISA support 
- Data forwarding to reduce stalls 
- Synthesized for 80+ MHz 
- Synthesized for 80+ MHz 
- Synthesized for 80+ MHz 
- ~15K LUTs on Artix-7 
 
See `docs/ARCHITECTURE.md` for detailed pipeline design. 
 
See `docs/SYNTHESIS_RESULTS.md` for Vivado synthesis metrics. 
 
 
- `rtl/` - Verilog RTL modules 
- `sim/` - Testbenches 
- `sim/` - Testbenches 
- `docs/` - Testbenches 
- `vivado/` - Testbenches 
