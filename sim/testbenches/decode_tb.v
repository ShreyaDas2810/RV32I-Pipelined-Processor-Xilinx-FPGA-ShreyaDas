`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 23:50:41
// Design Name: 
// Module Name: decode_tb
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


module decode_tb();
  reg clk, rst;
  reg [31:0] instruction;
  wire [6:0] opcode;
  wire [2:0] func3;
  wire [6:0] func7;
  wire [4:0] rd, rs1, rs2;
  wire [31:0] imm;
  wire [3:0] alu_op;
  
  decode uut (
    .clk(clk),
    .rst(rst),
    .instruction(instruction),
    .opcode(opcode),
    .func3(func3),
    .func7(func7),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .imm(imm),
    .alu_op(alu_op)
  );
  
  initial begin
    // Test ADDI x1, x0, 5
    instruction = 32'h00500093; // ADDI x1, x0, 5
    #10;
    
    // Test ADD x2, x1, x1
    instruction = 32'h00108133; // ADD x2, x1, x1
    #10;
    
    $finish;
  end

endmodule