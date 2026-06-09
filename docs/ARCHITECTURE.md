 
 
- 32-bit program counter 
- Instruction ROM (256 words) 
- PC increment logic 
 
- Instruction parsing (RV32I) 
- Opcode/funct3/funct7 extraction 
- Immediate value generation 
- ALU operation selection 
 
- 9-operation ALU (ADD, SUB, SLL, SLT, XOR, SRL, SRA, OR, AND) 
 
- 256-word data memory 
- Read/write control 
 
- Result multiplexer (ALU vs Memory) 
- Register file target selection 
 
- Data forwarding from Execute stage 
- Data forwarding from Memory stage 
- Load-use hazard detection 
