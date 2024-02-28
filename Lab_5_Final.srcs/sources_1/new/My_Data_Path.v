`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2022 05:05:21 PM
// Design Name: 
// Module Name: My_Data_Path
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

//ports for Fetch
module My_Data_Path(clk, rst, //variables for Fetch
ins, ins_Addr, //variables for IMem
rReadSelect1,rReadSelect2,rWriteSelect,rWriteData,rWriteEnable,rReadData1,rReadData2,//variables for register
memReadData, MemRead, MemWrite, memAddr, memWriteData); //variables for ALU & variables for Data Memory
input clk,rst;
reg [31:0] PC = 32'd4294967295; //4294967295
reg [31:0] imm = 32'd1;
Fetch f(clk, rst, PC, imm, ins);
always@(posedge clk)
begin
PC = PC + imm;
end
//ports for IMem
input  [31:0] ins;//instruction
output [31:0] ins_Addr;//Instructions Address
Instruction_Memory jjjjj(ins, ins_Addr);

//ports for Control
wire [3:0] alu_op;
wire alu_src, mem_to_reg, branch;
Control con(.rst(rst), .clk(clk), .current_mem(ins_Addr), .alu_op(alu_op), .alu_src(alu_src), .mem_to_reg(mem_to_reg), 
.reg_write(rWriteEnable), .mem_read(MemRead), .mem_write(MemWrite), .branch(branch));

//imm2 generation 
reg [31:0] imm2;
reg [6:0] opcode;
reg [31:0] B;
always @(*)
    begin
        imm = 32'd1;
    end 
always @(*)
    begin
        opcode = ins_Addr [6:0];
            if(opcode == 7'b0010011) begin //addi
                imm2 [11:0] = ins_Addr [31:20];
                imm2 [31:12] = 20'd0;
                B = imm2;
            end
            else if(opcode == 7'b0100011) begin//sw
                imm2 [11:5] = ins_Addr [31:25];
                imm2 [4:0] = ins_Addr [11:7];
                imm2 [31:12] = 20'd0;
                B = imm2;
            end
            else if(opcode == 7'b0000011) begin//lw
                imm2 [11:0] = ins_Addr [31:20];
                imm2 [31:12] = 20'd0;
                B = imm2;
            end
            else if (opcode == 7'b1101111) begin//jal
                imm2 [20] = ins_Addr [31];
                imm2 [19:12] = ins_Addr [19:12];
                imm2 [11] = ins_Addr [20];
                imm2 [10:1] = ins_Addr [30:21];
                imm2 [31:21] = 11'd0;
                imm2 [0] = 1'd0;
                B = PC+1;
                if (imm2 == 32'd0)
                    PC = 32'd4294967295;
                else
                    PC = imm2 - 1; //OR PC = imm2
            end
            else if (opcode == 7'b1100011) begin //bne
                imm2 [12] = ins_Addr [31];
                imm2 [10:5] = ins_Addr [30:25];
                imm2 [4:1] = ins_Addr [11:8];               
                imm2 [11] = ins_Addr [7];
                imm2 [31:13] = 19'd0;
                imm2 [0] = 1'd0;
                B = imm2;
                if (imm2 == 32'd0)
                    PC = 32'd4294967295;
                else
                    PC = imm2 - 1; //OR PC = imm2
            end
            else if (opcode == 7'b0110111) begin//lui
                imm2 [31:12] = ins_Addr [31:12];
                imm2 [11:0] = 12'd0;
                B = imm2;
            end
            else
                B = rReadData2;            
 end
 
//ports for Registers
input [31:0] rReadData1, rReadData2;
output [4:0] rReadSelect1, rReadSelect2, rWriteSelect; // Control singal for Reginster file
output reg [31:0] rWriteData; // Data wrote to Register file
output rWriteEnable;// Control singal for Reginster file
assign rReadSelect1 = ins_Addr [19:15];
assign rReadSelect2 = ins_Addr [24:20];
assign rWriteSelect = ins_Addr [11:7];
Register_File RegFile(rReadSelect1, rReadSelect2, rWriteSelect, rWriteData, rWriteEnable, rReadData1, rReadData2, clk, rst);

//ports for ALU
output [31:0] memReadData;
wire Z; //useless
ALU_64_bits ALU(alu_op, rReadData1, B,  memReadData, Z);

//ports for Data Memory
output MemWrite, MemRead;
input [31:0] memAddr;// Data memory Address 
output [31:0] memWriteData;// Data wrote to data memory
assign memWriteData = rReadData2;
always@(*) begin
    if (mem_to_reg)
        rWriteData = memAddr;
    else
        rWriteData = memReadData;
    if (opcode != 7'b1101111)
        imm = 32'd1;
end
D_Mem Data_memory(clk, rst, MemWrite, MemRead, memReadData, memWriteData, memAddr);
endmodule