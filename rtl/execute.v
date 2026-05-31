`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 09:50:48
// Design Name: 
// Module Name: execute
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


module execute(
  input clk,
  input rst,
  input [31:0] operand1,
  input [31:0] operand2,
  input [3:0] alu_op,
  input [4:0] rd,
  
  output reg [31:0] alu_result,
  output reg [4:0] rd_out
);

  always @(*) begin
    case(alu_op)
      4'b0000: alu_result = operand1 + operand2;           // ADD
      4'b0001: alu_result = operand1 - operand2;           // SUB
      4'b0010: alu_result = operand1 << operand2[4:0];     // SLL
      4'b0011: alu_result = (operand1 < operand2) ? 1 : 0; // SLT
      4'b0100: alu_result = operand1 ^ operand2;           // XOR
      4'b0101: alu_result = operand1 >> operand2[4:0];     // SRL
      4'b0110: alu_result = operand1 >>> operand2[4:0];    // SRA
      4'b0111: alu_result = operand1 | operand2;           // OR
      4'b1000: alu_result = operand1 & operand2;           // AND
      default: alu_result = 32'b0;
    endcase
  end
  
  always @(posedge clk) begin
    if (rst) begin
      rd_out <= 0;
    end else begin
      rd_out <= rd;
    end
  end

endmodule