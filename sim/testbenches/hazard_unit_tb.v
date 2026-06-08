`timescale 1ns / 1ps

module hazard_unit_tb();
  reg [4:0] rs1_decode, rs2_decode, rd_execute, rd_memory;
  reg mem_to_reg_memory;
  wire forward_a, forward_b, stall;
  
  hazard_unit uut (
    .rs1_decode(rs1_decode),
    .rs2_decode(rs2_decode),
    .rd_execute(rd_execute),
    .rd_memory(rd_memory),
    .mem_to_reg_memory(mem_to_reg_memory),
    .forward_a(forward_a),
    .forward_b(forward_b),
    .stall(stall)
  );
  
  initial begin
    rs1_decode = 5'd1;
    rs2_decode = 5'd2;
    rd_execute = 5'd1;
    rd_memory = 5'd0;
    mem_to_reg_memory = 0;
    #10;
    
    mem_to_reg_memory = 1;
    rd_memory = 5'd1;
    #10;
    
    $finish;
  end

endmodule