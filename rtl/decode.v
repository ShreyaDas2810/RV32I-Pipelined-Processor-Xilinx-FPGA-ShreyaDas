`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 23:49:12
// Design Name: 
// Module Name: decode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decode(
  input clk,
  input rst,
  input [31:0] instruction,
  
  // Control signals (decoded)
  output reg [6:0] opcode,
  output reg [2:0] func3,
  output reg [6:0] func7,
  
  // Register addresses
  output reg [4:0] rd,    // Destination register
  output reg [4:0] rs1,   // Source register 1
  output reg [4:0] rs2,   // Source register 2
  
  // Immediate value
  output reg [31:0] imm,
  
  // ALU control
  output reg [3:0] alu_op
);

  always @(*) begin
    // Extract fields from instruction
    opcode = instruction[6:0];
    rd = instruction[11:7];
    func3 = instruction[14:12];
    rs1 = instruction[19:15];
    rs2 = instruction[24:20];
    func7 = instruction[31:25];
    
    // Decode immediate based on instruction type
    case(opcode)
      7'b0010011: begin  // I-type (ADDI, etc)
        imm = {{20{instruction[31]}}, instruction[31:20]};
        alu_op = 4'b0000; // ADD
      end
      7'b0110011: begin  // R-type (ADD, SUB, etc)
        imm = 32'b0;
        case(func3)
          3'b000: alu_op = (func7[5]) ? 4'b0001 : 4'b0000; // SUB or ADD
          3'b001: alu_op = 4'b0010; // SLL
          3'b010: alu_op = 4'b0011; // SLT
          3'b100: alu_op = 4'b0100; // XOR
          3'b101: alu_op = (func7[5]) ? 4'b0110 : 4'b0101; // SRA or SRL
          3'b110: alu_op = 4'b0111; // OR
          3'b111: alu_op = 4'b1000; // AND
          default: alu_op = 4'b0000;
        endcase
      end
      default: begin
        imm = 32'b0;
        alu_op = 4'b0000;
      end
    endcase
  end

endmodule