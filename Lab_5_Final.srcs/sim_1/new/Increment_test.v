`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 08:38:23 PM
// Design Name: 
// Module Name: Increment_test
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


module Increment_test();
reg clk = 1'b1, rst = 1'b0;
reg [31:0] PC = 32'd0, imm = 32'd1;
wire [31:0] addr;
Increment_PC fml(clk, rst, PC, imm, addr);
endmodule
