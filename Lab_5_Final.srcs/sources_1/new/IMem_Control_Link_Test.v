`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 11:20:46 PM
// Design Name: 
// Module Name: IMem_Control_Link_Test
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


module IMem_Control_Link_Test(rst, clk, Address, instr, current_mem, alu_op, alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch);
    input [31:0] Address;
	output reg [31:0] instr, current_mem;
	input rst, clk;
	output reg[3:0] alu_op; 
	output reg alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch;
	wire [31:0] memory = current_mem;
	Instruction_Memory mem(Address,instr,memory);
	Control from_IMem(rst, clk, memory, alu_op,alu_src,mem_to_reg,reg_write,mem_read,mem_write,branch);
endmodule
