`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 11:07:29 PM
// Design Name: 
// Module Name: ALU_test
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


module ALU_test();
    reg [31:0] A,B;
    reg [3:0] OPCODE;
    wire [31:0] Y;
    wire Z;
    ALU_64_bits uut(OPCODE,A,B,Y,Z);
    initial begin
    OPCODE = 4'b0010;
    A = 32'd0;
    B = 32'd0;
    #10;
    $finish;
    end
endmodule
