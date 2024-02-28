`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 07:41:09 PM
// Design Name: 
// Module Name: Data_Mem_Test
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


module Data_Mem_Test();
    reg MemWrite,MemRead, mem_to_reg, clk, rst;
    reg [31:0] addr, write_data;
    wire [31:0] ReadData;
    Data_Memory uuutt(clk, rst, MemWrite, MemRead, mem_to_reg, addr, write_data, ReadData);
    initial begin 
        clk = 1'b1;
        rst = 1'b0;
        mem_to_reg = 1'b1;
        write_data = 32'd1;
        MemWrite = 1'b0;
        MemRead = 1'b1;
        addr = 32'd2;
            forever #100 clk = ~clk;
    end
endmodule
