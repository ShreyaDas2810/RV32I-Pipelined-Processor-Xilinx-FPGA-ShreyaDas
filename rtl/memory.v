`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 19:01:23
// Design Name: 
// Module Name: memory
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


module memory(
  input clk,
  input rst,
  input [31:0] address,
  input [31:0] write_data,
  input mem_write,
  input mem_read,
  input [4:0] rd,
  
  output reg [31:0] read_data,
  output reg [4:0] rd_out
);

  // Simple data memory (1024 words)
  reg [31:0] dmem [0:255];
  
  initial begin
    // Initialize some values
    dmem[0] = 32'd100;
    dmem[1] = 32'd200;
  end
  
  always @(posedge clk) begin
    if (rst) begin
      read_data <= 0;
      rd_out <= 0;
    end else begin
      if (mem_write) begin
        dmem[address[9:2]] <= write_data;
      end
      if (mem_read) begin
        read_data <= dmem[address[9:2]];
      end
      rd_out <= rd;
    end
  end

endmodule