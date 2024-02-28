`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 07:22:29 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory(input clk, rst, MemWrite, MemRead, mem_to_reg,
input [31:0] addr, write_data, output [31:0] read_data);
     integer i;  
     reg [31:0] register [31:0];  
     wire [31:0] reg_addr = addr[31:0];  
     initial begin  
           for(i=0;i<32;i=i+1)  
                register[i] <= 32'd0;  
      end 

      always @(posedge clk) begin  
           if (MemWrite)  
                register[reg_addr] <= write_data; 
      end  
      assign read_data = (MemRead==1'b1) ? register[reg_addr]: 32'd0;
endmodule
