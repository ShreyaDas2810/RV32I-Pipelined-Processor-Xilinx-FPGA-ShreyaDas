`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 18:45:39
// Design Name: 
// Module Name: fetch
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


module fetch(
  input clk,
  input rst,
  input [31:0] pc_in,
  output reg [31:0] pc_out,
  output reg [31:0] instruction
);

  // Instruction memory (ROM)
  reg [31:0] imem [0:255];
  
  initial begin
    // Load test instructions
    imem[0] = 32'h00000013;  // ADDI x0, x0, 0
    imem[1] = 32'h00100013;  // ADDI x0, x0, 1
    imem[2] = 32'h00200013;  // ADDI x0, x0, 2
  end
  
  always @(posedge clk) begin
    if (rst) begin
      pc_out <= 0;
      instruction <= 0;
    end else begin
      pc_out <= pc_in + 4;
      instruction <= imem[pc_in[9:2]];  // Fetch instruction
    end
  end

endmodule
