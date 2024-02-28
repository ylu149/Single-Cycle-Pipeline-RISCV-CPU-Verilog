`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2022 05:15:01 PM
// Design Name: 
// Module Name: MyDataPath_tst
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


module MyDataPath_tst();
reg clk, rst;
wire [31:0] ins, ins_Addr, memReadData, memAddr, memWriteData, rReadData1, rReadData2, rWriteData;
wire [4:0] rReadSelect1, rReadSelect2, rWriteSelect;
wire rWriteEnable, MemRead, MemWrite;
My_Data_Path uut(clk, rst, //variables for Fetch
ins, ins_Addr, //variables for IMem
 //variables for control
rReadSelect1,rReadSelect2,rWriteSelect,rWriteData,rWriteEnable,rReadData1,rReadData2,//variables for register
memReadData, MemRead, MemWrite, memAddr, memWriteData);

initial begin
clk = 1'b1;
rst = 1'b0;
    forever #31.25 clk = ~clk;
#250 $finish;
end
endmodule
