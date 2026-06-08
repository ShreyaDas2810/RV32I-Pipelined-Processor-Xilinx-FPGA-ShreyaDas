`timescale 1ns / 1ps

module core_tb();
  reg clk, rst;
  wire [31:0] pc_out;
  
  core uut (
    .clk(clk),
    .rst(rst),
    .pc_out(pc_out)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    #200 $finish;
  end

endmodule