`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2022 11:47:20 PM
// Design Name: 
// Module Name: D_Mem
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


module D_Mem(input clk, rst, mem_write, mem_read, input [31:0] addr, write_data, output [31:0] read_data);

     reg [31:0] register [31:0];  
     wire [31:0] reg_addr = addr[31:0];  
      always @(*) begin  
           if (mem_write) begin
                register[reg_addr] = write_data;
           end
           else if (mem_read) begin
                register[reg_addr] = addr;
           end
           else begin
                register[reg_addr] = 32'd0;
           end
               
      end   
      assign read_data = register[reg_addr];
endmodule
