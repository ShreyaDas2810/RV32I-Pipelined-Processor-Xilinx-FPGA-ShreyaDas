`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 19:02:51
// Design Name: 
// Module Name: memory_tb
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

module memory_tb();
  reg clk, rst;
  reg [31:0] address, write_data;
  reg mem_write, mem_read;
  reg [4:0] rd;
  wire [31:0] read_data;
  wire [4:0] rd_out;
  
  memory uut (
    .clk(clk),
    .rst(rst),
    .address(address),
    .write_data(write_data),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .rd(rd),
    .read_data(read_data),
    .rd_out(rd_out)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    mem_write = 0;
    mem_read = 0;
    #20 rst = 0;
    
    // Write to memory[0] = 42
    address = 32'd0;
    write_data = 32'd42;
    mem_write = 1;
    rd = 5'd1;
    #10;
    mem_write = 0;
    
    // Read from memory[0]
    mem_read = 1;
    #10;
    
    $finish;
  end

endmodule
