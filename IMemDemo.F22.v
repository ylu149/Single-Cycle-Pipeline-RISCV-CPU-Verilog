`timescale 1ns / 1ns
	module Instruction_Memory(Address, ReadData1);
	parameter BITSIZE = 32;
	parameter REGSIZE = 32;
	input [REGSIZE-1:0] Address;
	output reg [BITSIZE-1:0] ReadData1;

	reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory

    localparam [6:0] JAL_Op	=	7'b1101111,
                    AND_Op	=	7'b0110011,
                    ADD_Op	=	7'b0110011,
                    OR_Op	=	7'b0110011,
                    BEQ_Op	=	7'b1100011,
                    BNE_Op	=	7'b1100011,
                    SUB_Op	=	7'b0110011,
                    SW_Op	=	7'b0100011,
                    LW_Op	=	7'b0000011,
                    LUI_Op	=	7'b0110111,
                    ADDI_Op	=	7'b0010011;
    
    localparam [2:0] AND_Func3	=	3'b111,
                    ADD_Func3	=	3'b000,
                    OR_Func3	=	3'b110,
                    BEQ_Func3	=	3'b000,
                    BNE_Func3	=	3'b001,
                    SUB_Func3	=	3'b000,
                    SW_Func3	=	3'b010,
                    LW_Func3	=	3'b010,
                    ADDI_Func3	=	3'b000;
    
    localparam [6:0] AND_Func7	=	7'b0000000,
                    ADD_Func7	=	7'b0000000,
                    OR_Func7	=	7'b0000000,
                    SUB_Func7	=	7'b0100000;
    
    reg [4:0]  Rt_Sel, R1_Sel, R2_Sel;
    reg [11:0] I_imm;
    reg [6:0] S_imm1;
    reg [4:0] S_imm2;
    reg [19:0] U_imm;
    reg [2:0] func3;
    reg [6:0] func7;

	// Asyncronous read of memory. Was not specified.
	always @(Address, memory_file[Address])
	begin
		ReadData1 = memory_file[Address];
	end

	integer i;
	// method of filling the memory instead of through a test bench
	initial
		begin
			// PC = 0 -> addi x1, x0, 729	# x0=0 x1=729
            i = 0;
            I_imm = 12'd729;
            R1_Sel = 5'd0;
            func3 = ADDI_Func3;
            Rt_Sel = 5'd1;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, ADDI_Op};
    
            // PC = 1 -> addi x2, x0, 1000 # x2=1000
            i = i+1;
            I_imm = 12'd1000;
            R1_Sel = 5'd0;
            func3 = ADDI_Func3;
            Rt_Sel = 5'd2;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, ADDI_Op};
    
            // PC = 2 -> addi x3, x0, 1 # x3=1
            i = i+1;
            I_imm = 12'd1;
            R1_Sel = 5'd0;
            func3 = ADDI_Func3;
            Rt_Sel = 5'd3;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, ADDI_Op};
            
            // PC = 3 -> addi x4, x0, 1728 # x4=1728
            i = i+1;
            I_imm = 12'd1728;
            R1_Sel = 5'd0;
            func3 = ADDI_Func3;
            Rt_Sel = 5'd4;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, ADDI_Op};
            
            // PC = 4 -> add x5, x1, x2 # x5 = 1729
            i = i+1;
            func7 = ADD_Func7;
            R2_Sel = 5'd2;
            R1_Sel = 5'd1;
            func3 = ADD_Func3;
            Rt_Sel = 5'd5;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, ADD_Op};
            
            // PC = 5 -> add x6, x3, x4 # x6 = 1729
            i = i+1;
            func7 = ADD_Func7;
            R2_Sel = 5'd4;
            R1_Sel = 5'd3;
            func3 = ADD_Func3;
            Rt_Sel = 5'd6;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, ADD_Op};
            
            // PC = 6 -> sub x7, x2, x1 # x7 = 271
            i = i+1;
            func7 = SUB_Func7;
            R2_Sel = 5'd1;
            R1_Sel = 5'd2;
            func3 = SUB_Func3;
            Rt_Sel = 5'd7;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, SUB_Op};
    
            // PC = 7 -> sub x8, x4, x3 # x8 = 1727
            i = i+1;
            func7 = SUB_Func7;
            R2_Sel = 5'd3;
            R1_Sel = 5'd4;
            func3 = SUB_Func3;
            Rt_Sel = 5'd8;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, SUB_Op};
            
            // PC = 8 -> or x9, x1, x2 # x9=1017
            i = i+1;
            func7 = OR_Func7;
            R2_Sel = 5'd2;
            R1_Sel = 5'd1;
            func3 = OR_Func3;
            Rt_Sel = 5'd9;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, OR_Op};
            
            // PC = 9 -> or x10, x3, x4 # x8 = 1729
            i = i+1;
            func7 = OR_Func7;
            R2_Sel = 5'd4;
            R1_Sel = 5'd3;
            func3 = OR_Func3;
            Rt_Sel = 5'd10;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, OR_Op};
            
            // PC = 10 -> and x11, x1, x2 # x11=712
            i = i+1;
            func7 = AND_Func7;
            R2_Sel = 5'd2;
            R1_Sel = 5'd1;
            func3 = AND_Func3;
            Rt_Sel = 5'd11;
            memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, AND_Op};
    
            // PC = 11 -> and x12, x3, x4 # x12=0
            i = i+1;
            func7 = AND_Func7;
            R2_Sel = 5'd4;
            R1_Sel = 5'd3;
            func3 = AND_Func3;
            Rt_Sel = 5'd12;
	    	memory_file[i] = {func7, R2_Sel, R1_Sel, func3, Rt_Sel, AND_Op};
	    	
	    	// PC = 12 -> sw x5, [x12, 6] # DMem[6] = x5 = 1729
            i = i+1;
            S_imm1 = 7'd0;
            R2_Sel = 5'd5;
            R1_Sel = 5'd12;
            func3 = SW_Func3;
            S_imm2 = 5'd6;
            memory_file[i] = {S_imm1, R2_Sel , R1_Sel, func3, S_imm2, SW_Op};
            
            // PC = 13 -> sw x6, [x3, 8] # DMem[9] = x6 = 1729
            i = i+1;
            S_imm1 = 7'd0;
            R2_Sel = 5'd6;
            R1_Sel = 5'd3;
            func3 = SW_Func3;
            S_imm2 = 5'd8;
            memory_file[i] = {S_imm1, R2_Sel , R1_Sel, func3, S_imm2, SW_Op};
            
            // PC = 14 -> lw x13, [x12, 6] # x13 = DMem[6] = 1729
            i = i+1;
            I_imm = 12'd6;
            R1_Sel = 5'd12;
            func3 = LW_Func3;
            Rt_Sel = 5'd13;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, LW_Op};
            
            // PC = 15 -> lw x14, [x3, 8] # x14 = DMem[9] = 1729
            i = i+1;
            I_imm = 12'd8;
            R1_Sel = 5'd3;
            func3 = LW_Func3;
            Rt_Sel = 5'd14;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, LW_Op};
            
            // pc=16 -> lui x15, 0xf # x15=0xf000
            i = i+1;
            U_imm = 20'hf;
            Rt_Sel = 5'd15;
            memory_file[i] = {U_imm, Rt_Sel, LUI_Op};
            
            // PC = 17 -> addi x15, x15, 0x0ff	# x15=0xffff
            i = i+1;
            I_imm = 12'h0ff;
            R1_Sel = 5'd15;
            func3 = ADDI_Func3;
            Rt_Sel = 5'd15;
            memory_file[i] = {I_imm, R1_Sel, func3, Rt_Sel, ADDI_Op};
           
            // pc=18 -> lui x15, 0x10 # x15=0x1f0ff
            i = i+1;
            U_imm = 20'h10;
            Rt_Sel = 5'd15;
            memory_file[i] = {U_imm, Rt_Sel, LUI_Op};
            
            // order: 19 22 20 21 23(out)
            // PC = 19 -> bne x1, x2, 3 # x1!=x2, jump to 22
            i = i+1;
            R2_Sel = 5'd2;
            R1_Sel = 5'd1;
            func3 = BNE_Func3;
            memory_file[i] = {8'b0, R2_Sel , R1_Sel, func3, 3'd3 ,1'b0, BNE_Op};
               
            // PC = 20 -> bne x5, x6, 2 # x5=x6, jump to 21
            i = i+1;
            R2_Sel = 5'd6;
            R1_Sel = 5'd5;
            func3 = BNE_Func3;
            memory_file[i] = {8'b0, R2_Sel , R1_Sel, func3, 3'd2 ,1'b0, BNE_Op};
            
             // pc = 21 -> jal x31, 2 # jump to 23
            i = i + 1;
            Rt_Sel = 5'd31;
            memory_file[i] = {1'b0,10'd2, 9'b0, Rt_Sel, JAL_Op};
            
            // pc = 22 -> jal x31, -2 # jump to 20
            i = i + 1;
            Rt_Sel = 5'd31;
            memory_file[i] = {1'b1,10'b1111111110, 9'b111111111, Rt_Sel, JAL_Op};

		end
	endmodule

