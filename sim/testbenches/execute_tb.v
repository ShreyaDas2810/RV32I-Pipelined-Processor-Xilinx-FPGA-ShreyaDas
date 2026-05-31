`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 09:53:01
// Design Name: 
// Module Name: execute_tb
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

module execute_tb();
  reg clk, rst;
  reg [31:0] operand1, operand2;
  reg [3:0] alu_op;
  reg [4:0] rd;
  wire [31:0] alu_result;
  wire [4:0] rd_out;
  
  execute uut (
    .clk(clk),
    .rst(rst),
    .operand1(operand1),
    .operand2(operand2),
    .alu_op(alu_op),
    .rd(rd),
    .alu_result(alu_result),
    .rd_out(rd_out)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    
    // Test ADD: 5 + 3 = 8
    operand1 = 32'd5;
    operand2 = 32'd3;
    alu_op = 4'b0000;
    rd = 5'd1;
    #10;
    
    // Test SUB: 10 - 4 = 6
    operand1 = 32'd10;
    operand2 = 32'd4;
    alu_op = 4'b0001;
    #10;
    
    $finish;
  end

endmodule
