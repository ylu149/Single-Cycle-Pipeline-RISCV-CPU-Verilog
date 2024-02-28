`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 10:52:17 PM
// Design Name: 
// Module Name: Register_test
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
#10;
ReadSelect1 = 5'd1;
ReadSelect2 = 5'd2;
WriteSelect = 5'd1;
WriteEnable = 1'b1;
rst = 1'b0;
clk = 1'b1;
WriteData = 32'd2;
#10;
ReadSelect1 = 5'd1;
ReadSelect2 = 5'd2;
WriteSelect = 5'd2;
WriteEnable = 1'b1;
rst = 1'b0;
clk = 1'b0;
WriteData = 32'd2;
    forever #10 clk = ~clk;
end
endmodule
