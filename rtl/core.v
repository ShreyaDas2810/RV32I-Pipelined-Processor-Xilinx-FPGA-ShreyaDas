`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 23:11:07
// Design Name: 
// Module Name: core
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


module core(
  input clk,
  input rst,
  output [31:0] pc_out
);

  // Pipeline registers
  reg [31:0] pc;
  wire [31:0] instruction;
  wire [31:0] pc_next;
  
  // Decode outputs
  wire [6:0] opcode;
  wire [4:0] rd, rs1, rs2;
  wire [31:0] imm;
  wire [3:0] alu_op;
  
  // Register file (simple version)
  reg [31:0] regs [0:31];
  
  // Fetch stage
  fetch fetch_inst (
    .clk(clk),
    .rst(rst),
    .pc_in(pc),
    .pc_out(pc_next),
    .instruction(instruction)
  );
  
  // Decode stage
  decode decode_inst (
    .clk(clk),
    .rst(rst),
    .instruction(instruction),
    .opcode(opcode),
    .func3(),
    .func7(),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .imm(imm),
    .alu_op(alu_op)
  );
  
  // Update PC
  always @(posedge clk) begin
    if (rst) begin
      pc <= 0;
    end else begin
      pc <= pc_next;
    end
  end
  
  assign pc_out = pc;

endmodule
