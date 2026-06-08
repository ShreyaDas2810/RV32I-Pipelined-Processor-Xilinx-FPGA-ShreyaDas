`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 23:02:11
// Design Name: 
// Module Name: hazard_unit
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


module hazard_unit(
  input [4:0] rs1_decode,
  input [4:0] rs2_decode,
  input [4:0] rd_execute,
  input [4:0] rd_memory,
  input mem_to_reg_memory,
  
  output reg forward_a,
  output reg forward_b,
  output reg stall
);

  always @(*) begin
    forward_a = 0;
    forward_b = 0;
    stall = 0;
    
    if (rd_execute != 0) begin
      if (rd_execute == rs1_decode) forward_a = 1;
      if (rd_execute == rs2_decode) forward_b = 1;
    end
    
    if (mem_to_reg_memory && rd_memory != 0) begin
      if (rd_memory == rs1_decode || rd_memory == rs2_decode) begin
        stall = 1;
      end
    end
  end

endmodule
