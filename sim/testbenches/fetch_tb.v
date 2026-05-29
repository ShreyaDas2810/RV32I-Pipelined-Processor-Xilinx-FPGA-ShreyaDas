`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 18:48:36
// Design Name: 
// Module Name: fetch_tb
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

module fetch_tb();
  reg clk, rst;
  reg [31:0] pc_in;
  wire [31:0] pc_out, instruction;
  
  fetch uut (
    .clk(clk),
    .rst(rst),
    .pc_in(pc_in),
    .pc_out(pc_out),
    .instruction(instruction)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    pc_in = 0;
    
    #20 rst = 0;
    #20 pc_in = 0;
    #20 pc_in = 4;
    #20 pc_in = 8;
    #100 $finish;
  end

endmodule