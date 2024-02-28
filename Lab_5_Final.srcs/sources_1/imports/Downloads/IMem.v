`timescale 1ns / 1ns

	module Instruction_Memory(Address, instr, current_mem);
	parameter BITSIZE = 32;
	parameter REGSIZE = 32;
	input [REGSIZE-1:0] Address;
	output reg [BITSIZE-1:0] instr, current_mem;
	reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory


	// Asyncronous read of memory. Was not specified.
	always @(Address, memory_file[Address])
	begin
		instr = memory_file[Address];
		current_mem = instr;
	end

	integer i;
	// method of filling the memory instead of through a test bench
	initial
		begin
			i = 0;
			
			i = i+1;
			memory_file[i] = 32'b0000000_01011_01011_000_01100_0110011; // add
			
			i = i+1;
			memory_file[i] = 32'b0100000_00001_00000_000_01100_0110011; //sub
			
			i = i+1;
			memory_file[i] = 32'b0000000_00001_01101_110_01101_0110011; //or
			
			i = i+1;
			memory_file[i] = 32'b0000000_00001_00000_111_01100_0110011; //and
			
			i = i+1;
			memory_file[i] = 32'b000000000000_00000_000_01100_0010011; //addi
			
			i = i+1;
			memory_file[i] = 32'b0000000_00001_00000_010_01100_0100011; //sw
			
			i = i+1;
			memory_file[i] = 32'b000000000000_00000_010_01100_0000011; //lw
			
			i = i+1;
			memory_file[i] = 32'b00000000000000000000_01100_1101111; //jal

			i = i+1;
			memory_file[i] = 32'b0000000_00001_00000_001_01100_1100011; //bne
			
			i = i+1;
			memory_file[i] = 32'b00000000000000000000_01100_0110111; //lui (first part of large constant)
			
			i = i+1;
			memory_file[i] = 32'b000000000000_00000_000_01100_0010011; //addi (second part or large constant)
			
		end
	endmodule


