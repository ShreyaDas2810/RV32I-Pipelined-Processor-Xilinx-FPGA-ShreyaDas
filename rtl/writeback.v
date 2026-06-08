`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 20:39:14
// Design Name: 
// Module Name: writeback
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


module writeback(
  input clk,
  input rst,
  input [31:0] alu_result,
  input [31:0] mem_data,
  input [4:0] rd,
  input mem_to_reg,
  
  output reg [31:0] result,
  output reg [4:0] rd_out
);

  always @(posedge clk) begin
    if (rst) begin
      result <= 0;
      rd_out <= 0;
    end else begin
      // Select between ALU result or memory data
      result <= mem_to_reg ? mem_data : alu_result;
      rd_out <= rd;
    end
  end

endmodule