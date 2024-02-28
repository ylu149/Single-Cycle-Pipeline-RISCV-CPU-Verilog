`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 11:07:03 PM
// Design Name: 
// Module Name: reg_test
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

module Register_test();
//input [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
reg [31:0] WriteData;
reg [4:0] ReadSelect1, ReadSelect2, WriteSelect;
//input [BITSIZE-1:0] WriteData;
//input WriteEnable;
reg WriteEnable;
//output reg [BITSIZE-1:0] ReadData1, ReadData2;
//input clk, rst;
reg clk, rst;
wire [31:0] ReadData1, ReadData2;
Register_File uut(ReadSelect1, ReadSelect2, WriteSelect, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);
initial begin
ReadSelect2 = 5'd2;
rst = 1'b0;
clk = 1'b1;
WriteEnable = 1'b1; 

ReadSelect1 = 5'd1; //Register x1
WriteSelect = 5'd1; //Register x1 (destination register)
WriteData = 32'd5;
#200;
clk = 1'b0;
#200;
clk = 1'b1;
ReadSelect1 = 5'd1;
WriteSelect = 5'd1;
WriteData = 32'd6 + ReadData1;
#200;
clk = 1'b0;
#200;
clk = 1'b1;
ReadSelect1 = 5'd1;
WriteSelect = 5'd1;
WriteData = 32'd7 + ReadData1;
//x1 addi
//x2 addi
//x1+x2 = x3
end
endmodule
