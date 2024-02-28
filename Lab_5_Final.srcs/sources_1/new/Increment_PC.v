`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 05:41:14 PM
// Design Name: 
// Module Name: Increment_PC
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



module Increment_PC(input clk, rst, input [31:0] PC, imm, output [31:0] addr);
    assign addr = PC + 32'd1;
endmodule
