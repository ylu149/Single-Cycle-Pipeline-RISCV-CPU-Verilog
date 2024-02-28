`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 09:30:09 PM
// Design Name: 
// Module Name: Fetch
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


module Fetch(input clk, rst, input [31:0] PC, imm, output reg [31:0] addr);
    always@(posedge clk) begin
        if (rst)
            addr = 32'd0;
        else
            addr = PC + imm; 
    end
endmodule
