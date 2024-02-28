`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 09:32:40 PM
// Design Name: 
// Module Name: Fetch_test
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


module Fetch_test();
reg clk, rst;
reg [31:0] PC, imm;
wire [31:0] addr;
Fetch uut(clk, rst, PC, imm, addr);
initial begin
    clk = 1'b1;
    rst = 1'b0;
    PC = 32'd0;
    imm = 32'd2;
        forever #10 clk = ~clk;
end
endmodule
