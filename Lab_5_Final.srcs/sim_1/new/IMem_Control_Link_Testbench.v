`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 11:25:06 PM
// Design Name: 
// Module Name: IMem_Control_Link_Testbench
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


module Link_Testbench();
    reg [31:0] PC, imm;
    reg clk, rst, branch_mux;
    reg [31:0] B;
    wire [31:0] instr, current_mem, addr, Y, ReadData1, ReadData2, WriteData;
    wire [3:0] alu_op;
    wire [4:0] instr_19_to_15, instr_24_to_20, instr_11_to_7;
    wire alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch,Z;
  
    //Increment_PC(clk, rst, branch_mux, input [31:0] PC, imm, output reg [31:0] addr); 
    Fetch uut1(clk,rst, branch_mux, PC, imm, addr);
    //Instruction_Memory uut2(addr, instr, current_mem, instr_19_to_15, instr_24_to_20, instr_11_to_7);
    //Control uut3(rst, clk, current_mem, alu_op,alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch);
    //Register_File uut4(instr_19_to_15, instr_24_to_20, instr_11_to_7, WriteData, reg_write, ReadData1, ReadData2, clk, rst);
    //always@(*)
    //begin 
        //case(alu_src)
            //1'b0: B = ReadData2;
            //1'b1: B = instr;
        //endcase
    //end 
    //ALU_64_bits uut5(alu_op, ReadData1, B, Y, Z);
    initial begin
        branch_mux = 1'b0;
        clk = 1'b1;
        rst = 1'b0;
        PC = 32'd0;
        imm = 32'd2;
            forever #10 clk = ~clk;
    end
endmodule
