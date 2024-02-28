`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 08:22:39 PM
// Design Name: 
// Module Name: IMem_test
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


module IMem_test();
    reg [31:0] Address;
    wire [31:0] instr, current_mem;
    Instruction_Memory uut(Address, instr, current_mem);
    initial begin 
        #10;
        Address = 32'd4; 
        #10;  
    end
endmodule
