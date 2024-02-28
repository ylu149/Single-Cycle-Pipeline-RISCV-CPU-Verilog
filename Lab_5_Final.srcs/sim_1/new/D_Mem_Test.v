`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2022 11:48:26 PM
// Design Name: 
// Module Name: D_Mem_Test
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


module D_Mem_Test();
    reg clk, rst, mem_write, mem_read;
    reg [31:0] addr, write_data;
    wire [31:0] read_data;
    D_Mem uut(clk,rst,mem_write,mem_read,addr,write_data,read_data);
    initial begin 
        clk = 1'b1;
        rst = 1'b0;
        mem_write = 1'b0;
        mem_read = 1'b1;
        addr = 32'd2;
        write_data = 32'd10;
            forever #100 clk = ~clk;
    end
endmodule
