`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 11:14:18 PM
// Design Name: 
// Module Name: data_path_test
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


module data_path_test();
reg clk, rst;
wire [31:0] ins_Addr, ins, memAddr, memWriteData, memReadData, rReadData1, rReadData2, rWriteData;
wire [4:0] rReadSelect1, rReadSelect2, rWriteSelect;
wire MemWrite, MemRead, rWriteEnable;

Datapath uut(

    clk,rst,
    
    ins_Addr,
    ins,
    
    memAddr,memWriteData,memReadData,MemWrite,MemRead,
    
    rReadSelect1,rReadSelect2,rWriteSelect,rWriteData,rWriteEnable,rReadData1,rReadData2
    );
initial begin
clk = 1'b1;
rst = 1'b0;
    forever #10 clk = ~clk;
end
endmodule
