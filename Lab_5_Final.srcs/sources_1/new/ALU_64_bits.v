`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 08:26:29 PM
// Design Name: 
// Module Name: ALU_64_bits
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

module ALU_64_bits(input [3:0] OPCODE, input [31:0] A,B,  output [31:0] Y, output Z);
    wire [32:0] w_out;
    mux m(OPCODE,A,B,w_out);
    assign Y [31:0] = w_out [31:0];
    assign Z = w_out[32];
endmodule

module mux(input [3:0] OPCODE, input[31:0] A,B, output reg[32:0] w_out);
    wire [32:0] w_add, w_sub, w_or, w_and, w_less, w_nor;
    add add1(A,B,w_add);
    sub sub1(A,B,w_sub);
    OR or1(A,B,w_or);
    AND and1(A,B,w_and);
    less less1(A,B,w_less);
    NOR nor1(A,B,w_nor);
    always@(*)
    begin
        case(OPCODE)
            4'b0000: w_out = w_and;
            4'b0001: w_out = w_or;
            4'b0010: w_out = w_add;
            4'b0110: w_out = w_sub;
            4'b0111: w_out = w_less;
            4'b1100: w_out = w_nor;
            default: w_out = w_and; 
        endcase
    end
    
endmodule 

module NOR(input [31:0] A,B, output [32:0]out);
    assign out[31:0] = ~(A|B);
    test0 nor_zero(out[31:0],out[32]);
endmodule 
     
module less(input [31:0] A,B, output [32:0] out);
    assign out[31:0] = A < B;
    test0 less_zero(out[31:0],out[32]);
endmodule 
    
module add(input [31:0] A,B, output [32:0]out);
    assign out[31:0] = A+B;
    test0 add_zero(out[31:0],out[32]);
endmodule

module sub(input [31:0] A,B, output [32:0] out);
    assign out[31:0] = A-B;
    test0 sub_zero(out[31:0],out[32]);
endmodule

module OR(input [31:0] A,B, output [32:0] out);
    assign out[31:0] = A|B;
    test0 or_zero(out[31:0],out[32]);
endmodule

module AND(input [31:0] A,B, output [32:0] out);
    assign out[31:0] = A&B;
    test0 and_zero(out[31:0],out[32]);
endmodule

module test0(input [31:0]A, output reg Z);
    always@(*)
    begin 
        case(A)
            32'd0: Z = 1'd1;
            default: Z = 1'd0;
        endcase
    end     
endmodule 
