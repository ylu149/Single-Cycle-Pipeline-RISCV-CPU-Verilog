`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 09:59:44 PM
// Design Name: 
// Module Name: control_test
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


module control_test();
reg clk, rst;
reg [31:0] current_mem;
wire [3:0] alu_op;
wire alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch;
Control uut(rst, clk, current_mem, alu_op,alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch); 
initial begin
clk = 1'b1;
rst = 1'b0;
current_mem = 32'b0100000_00001_00000_000_01100_0110011;
    forever #10 clk = ~clk;
end
endmodule
