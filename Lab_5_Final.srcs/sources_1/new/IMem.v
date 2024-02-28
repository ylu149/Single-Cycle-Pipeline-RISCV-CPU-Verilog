`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 10:12:03 PM
// Design Name: 
// Module Name: IMem
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


module IMem(Address, ReadData1);
	parameter BITSIZE = 32;
	parameter REGSIZE = 32;
	input [REGSIZE-1:0] Address;
	output reg [BITSIZE-1:0] ReadData1;
	reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory
    
	// Asyncronous read of memory. Was not specified.
	always @(Address, memory_file[Address])
	begin
		ReadData1 = memory_file[Address];
	end

	integer i;
	// method of filling the memory instead of through a test bench
	initial
		begin
	        i = 0;
			memory_file[i] = 32'b000000000010_00000_000_00001_0010011; //addi x1 = 2
			
			i = i+1;
			memory_file[i] = 32'b000000000011_00000_000_00010_0010011; //addi x2 = 3
			
			i = i+1;
			memory_file[i] = 32'b000000000111_00000_000_00011_0010011; //addi x3 = 7
			
			i = i+1;
			memory_file[i] = 32'b0000000_00001_00010_000_00011_0110011; // add override x3 = 5
			
			i = i+1;
			memory_file[i] = 32'b0000000_00011_00001_000_00100_0110011; // add x4 = 7
			
			i = i+1;
			memory_file[i] = 32'b0000000_00100_00010_000_00101_0110011; // add x5 = 10
			
			i = i+1;
			memory_file[i] = 32'b0100000_00001_00011_000_00110_0110011; //sub x6 = 3
			
			i = i+1;
			memory_file[i] = 32'b0000000_00001_00010_110_00111_0110011; //or x7 = 3
			
			i = i+1;
			memory_file[i] = 32'b0000000_00001_00010_111_01000_0110011; //and x8 = 2
			
			i = i+1;
			memory_file[i] = 32'b0000000_01001_00001_010_00101_0100011; //sw x9 = 3
			
			i = i+1;
			memory_file[i] = 32'b000000000010_00001_010_01010_0000011; //lw x10 = 4
			
		    i = i+1;
			memory_file[i] = 32'b0000000_00001_00010_001_01110_1100011; //bne skip next instr
					
			i = i+1;
			memory_file[i] = 32'b111111111111_00000_000_10001_0010011; //addi x17 = FFF
			
			i = i+1;
			memory_file[i] = 32'b000000000001_00000_000_10010_0010011; //addi x18 = FFF
			
			i = i+1;
		    memory_file[i] = 32'b11110000000011111111_00101_0110111; //lui
			
			i = i+1;
			memory_file[i] = 32'b00000000001000000000_01011_1101111; //jal jumps to next instr
		end
endmodule