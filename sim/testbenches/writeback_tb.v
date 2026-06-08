`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 20:39:56
// Design Name: 
// Module Name: writeback_tb
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


`timescale 1ns / 1ps

module writeback_tb();
  reg clk, rst;
  reg [31:0] alu_result, mem_data;
  reg [4:0] rd;
  reg mem_to_reg;
  wire [31:0] result;
  wire [4:0] rd_out;
  
  writeback uut (
    .clk(clk),
    .rst(rst),
    .alu_result(alu_result),
    .mem_data(mem_data),
    .rd(rd),
    .mem_to_reg(mem_to_reg),
    .result(result),
    .rd_out(rd_out)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    
    // Test ALU result path
    alu_result = 32'd50;
    mem_data = 32'd100;
    mem_to_reg = 0;
    rd = 5'd2;
    #10;
    
    // Test memory result path
    mem_to_reg = 1;
    #10;
    
    $finish;
  end

endmodule