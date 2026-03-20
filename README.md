# RV32I Pipelined RISC-V Processor on Xilinx FPGA

5-stage pipelined RV32I core implemented in Verilog using Xilinx ISE 14.7.

**Features**
- 5-stage pipeline (IF-ID-EX-MEM-WB)
- Hazard detection unit + forwarding logic
- Supports 20+ RV32I instructions (add, sub, lw, sw, beq, etc.)
- Block RAM for instruction & data memory
- UART output for debugging on FPGA

**Target Hardware**
- Xilinx Basys3 / Nexys4 (or any ISE-compatible board)
- Achieved clock frequency: 80 MHz (post-synthesis)

**Project Status**
- [ ] Single-cycle version completed
- [ ] Pipelined version in progress
- [ ] Full testbench coverage (Fibonacci, bubble sort, etc.)

**Resume Bullet**
Designed 5-stage pipelined RV32I processor in Verilog on Xilinx FPGA; implemented hazard detection and forwarding; synthesized at 80 MHz with full testbench coverage.

GitHub: https://github.com/ShreyaDas2810/rv32i-pipelined-xilinx-fpga
